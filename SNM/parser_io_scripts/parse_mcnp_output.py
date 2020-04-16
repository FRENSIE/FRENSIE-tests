"""Parse MCNP output files to generate a material library.

Primary purpose of this module is to generate a material library from burnup
summary tables within MCNP output files.
Each line of output files is given a state according to specific search keys,
and corresponding process function is called to retrieve desired data from the
line. Objective functions are called according to objectives of user's choice,
and desired outputs are generated as objects.

Note:
  * If an MCNP run is continued and multiple output filenames are generated
    for the MCNP run, they can be provided in sequential order.
    Output filenames provided in mixed order may cause failure of execution
    or unexpected results.
  * Currently this parser is capable of providing material inventory of only
    the last burnup step of provided MCNP output file.
  * If interpolation shorthands ('I', 'ILOG') are used in input file,
    upperbound of interpolation must be provided as the last entry of a line.
    Otherwise, the parser will fail to expand the interpolation.
    Ex: (O)-'5500 4I 5505\n', (X)-'5500 4I\n'
  * If any shorthand is used in input file, the shorthand key must be proceeded
    by a number.
    Ex: (O)-'1 4R', (X)-'1 R'

Usage example:
  ```
  import parse_mcnp_output as mp
  out_obj = mp.output_parser(['ref_output.io'], {
      'input': True,
      'text': False,
      'library': True,
      'summary': False})
  ```
  -> Output: out_obj = {'input': (a string of retrieved input section),
                        'library': (PyNE material library)}

Following functions are included in this script:
- Supporting functions
  * construct_num_check
  * expand_shorthands
  * make_tokens
- Process input/output functions
  * process_burn_mat        (input)
  * process_burn_omit       (input)
  * process_fatal_error     (output)
  * process_keff_stddev     (output)
  * process_burnup_summary  (output)
  * process_inventory_parms (output)
  * process_inventory_entry (output)
- Objective functions
  * retrieve_input
  * make_fuel_mat_str
  * make_fuel_mat_lib
  * calc_burnup_rho
- Looping functions
  * update_state
  * parse_lines
- Main function
  * output_parser

"""

import argparse
import re
import numpy as np
# removed these because pyne is not intstalled
#from pyne.material import Material, MaterialLibrary
#from pyne.nucname import mcnp_to_id

# Dictionary for state transitions.
# - This dictionary contains transition keys for a line to change its state.
#   From current state of a line, a new state is determined by matching given
#   pattern. Transition of states is carried out within update_state function.
# - Format: {state name: (flag, pattern, index)}
#   * flag: Following integers to determine type of match.
#       0 - match regular expression, 1 - match list, 2 - negative match list.
#   * pattern: Pattern to be found.
#       A string for flag 0, a list of strings for flag 1 and 2.
#   * index: Starting index within token list where the target pattern is
#       to be matched.
# - Example: If a line is in state of 'input_line', a list ['burn'] is searched
#   from index 1 of token list for new state 'burnup_parms'
#   or regular expression (?!\d+-) is searched at index 0 of token list
#   for new state 'ignore'.
transitions = {
    'ignore': {
        'input_line': (0, '\d+-', 0),
        'fatal': (0, 'fatal', 0),
        'std_dev': (1, ['final', 'result'], 0),
        'burnup_summary': (1, ['neutronics', 'and', 'burnup', 'data'], 0),
        'inventory_heading': (1, ['nuclide', 'data', 'are', 'sorted'], 0)},
    # Input section.
    'input_line': {
        'burnup_parms': (1, ['burn'], 1),
        'ignore': (0, '(?!\d+-)', 0)},
    #   Burnup card.
    'burnup_parms': {
        'burn_mat': (1, ['mat'], '*'),
        'burn_omit': (1, ['omit'], '*'),
        'input_line': (2, ['burn', '     ', ' AUX '], '*'),
        'ignore': (0, '(?!\d+-)', 0)},
    'burn_mat': {
        'burnup_parms': (2, ['mat', '     '], '*'),
        'ignore': (0, '(?!\d+-)', 0)},
    'burn_omit': {
        'burnup_parms': (2, ['omit', '     '], '*'),
        'ignore': (0, '(?!\d+-)', 0)},
    # Output section.
    #   Fatal error.
    'fatal': {
        'ignore': (2, ['fatal'], 0)},
    #   Standard deviation.
    'std_dev': {
        'ignore': (2, ['final', 'result'], 0)},
    #   Burnup summary table.
    'burnup_summary': {
        'burnup_summary_ignore': (2, ['neutronics', 'and',
                                      'burnup', 'data'], 0)},
    'burnup_summary_ignore': {
        'burnup_summary_entry': (0, '\d+', 0)},
    'burnup_summary_entry': {
        'ignore': (0, '(?!\d+)', 0)},
    #   Burnup material inventory table.
    'inventory_heading': {
        'inventory_parms': (1, ['inventory'], 1)},
    'inventory_parms': {
        'inventory_ignore': (0, '(?!\d+|inventory)', 1)},
    'inventory_ignore': {
        'inventory_entry': (0, '\d+', 0)},
    'inventory_entry': {
        'inventory_totals': (1, ['totals'], 0)},
    'inventory_totals': {
        'inventory_heading': (1, ['nuclide', 'data', 'are', 'sorted'], 0),
        'inventory_parms': (1, ['inventory'], 1),
        'ignore': (2, ['totals', 'inventory', 'nuclide', 'data'], '*')}}

# Dictionary to store indices of burnup material list (values['burn_mat'])
# due to the failure of MCNP on displaying material number > 9999
# in table 210 and 220.
burn_mat_idx = {'actinide': 0, 'nonactinide': 0}

# Common indicators.
comment_EOL = '$'  # End-Of-Line comment character.
continued = '     '  # Continuation indicator.
spacing = '       '  # Spacing between input line number and actual card.


# Supporing functions.
def construct_num_check(token_list):
    """Construct num_check list to classify each item in token_list.

    At matching indices of token_list, elements of num_check are given
    either True(numeric value), False(string) or one of shorthand_keys.

    shorthand_keys:
    - R: Repetition. Ex) '2 4R' = '2 2 2 2 2'
    - I: Linear interpolation. Ex) '1 4I 6' = '1 2 3 4 5 6'
    - ILOG: Logarithmic interpolation. Ex) '0.01 2ILOG 10' = '0.01 0.1 1 10'
    - M: Multiplication. Ex) '1 1 2M 2M 2M 2M 4M 2M' = '1 1 2 4 8 16 64 128'

    Example:
      token_list = ['63-', '     ', 'mat', '5500', '4i', '5505', 'omit', '-1']
      -> num_check = [False, False, False, True, 'i', True, False, True]

    Arguments:
        token_list (list)[-]: A list of tokens for which numeric values
            are checked.
    Returns:
        num_check (list)[-]: A list of classifications for items of token_list.

    """
    # Shorthands for MCNP input entry.
    shorthand_keys = ['ilog', 'r', 'i', 'm']

    num_check = []

    for item in token_list:
        try:
            # Check if an item is a number.
            float(item)
            num_check.append(True)
        except:
            # Check if an item includes one of shorthands(mutually exclusive).
            key_check = False
            for key in shorthand_keys:
                try:
                    float(item[:-len(key)])
                    # Check if an item is a shorthand.
                    if item[-len(key):] == key:
                        key_check = key
                except:
                    if item == key:
                        key_check = key
                    else:
                        continue
            # Map key_check to an element of num_check.
            num_check.append(key_check)
    return num_check


def expand_shorthands(token_list, round_digit=10):
    """Expand shorthands defined for MCNP input.

    This function expands shorthands in a list of MCNP input entries.

    Arguments:
        token_list (list)[-]: A list of tokens for which shorthands
            are searched and expanded.
        round_digit (int)[#]: Number of digits to be rounded.

    Returns:
        exp_list (list)[-]: A list of tokens with expanded numbers.

    """
    # Construct num_check.
    num_check = construct_num_check(token_list)

    exp_list = []

    # Expand shorthands utilizing num_check and construct exp_list.
    for idx, check in enumerate(num_check):
        if check == False:
            exp_list.append(token_list[idx])
        elif check == True:
            exp_list.append(float(token_list[idx]))
        elif check == 'i':  # Linear interpolation between two numbers.
            first = float(token_list[idx-1])
            last = float(token_list[idx+1])
            steps = int(float(token_list[idx][:-1]))
            div = float((last - first)/(steps + 1))
            rnd_list = [round(i, round_digit)
                        for i in ((np.array(range(steps)) + 1)*div + first)]
            exp_list.extend(rnd_list)
        elif check == 'r':  # Repetition of base number.
            base = float(token_list[idx-1])
            repeats = int(float(token_list[idx][:-1]))
            exp_list.extend(np.repeat(base, repeats))
        else:
            raise NotImplementedError("To be implemented.")
    return exp_list


def make_tokens(line):
    """Make tokens to update state and process parsing.

    This function makes a list of tokens to be used for parsing a line.

    Arguments:
        line (str)[-]: Line to be parsed.

    Returns:
        token_list (list)[-]: List of tokens generated.

    """
    token_list = []
    ll_line = line.lower().lstrip()

    # Make a list of strings.
    if re.match('\d+-', ll_line):  # Input section.
        [line_number, raw_inp] = ll_line.split(spacing, 1)
        line_list = [line_number]
        inp_nc = raw_inp.split(comment_EOL)[0]  # Strip EOL comment.
        inp_str = inp_nc.rstrip()
        if inp_str[:len(continued)] == continued:  # Continued line.
            line_list.append(continued)  # Add continuation token.
        line_list.extend(inp_str.split())
    else:
        line_list = ll_line.split()

    # Remove equal signs between entries.
    for item in line_list:
        token_list.extend([si for si in item.split('=') if si])
    return token_list


# Process input/output functions.
def process_burn_mat(token_list, values):
    """Make a list of burnup material numbers.

    This function parses material numbers from token_list which are included in
    burnup calculation, and stores them in a list keyed with 'burn_mat'.

    Arguments:
        token_list (list)[-]: A list of tokens to be processed.
        values (dict)[-]: Main dictionary to store processed values.

    Returns:
        values (dict)[-]: Main dictionary to store processed values.
        token_list (list)[-]: A list of processed tokens.

    """
    # Parse burnup material numbers.
    if 'mat' in token_list:
        i_idx = token_list.index('mat') + 1
    elif isinstance(token_list[2], float):  # Continued case.
        # Switch to auxiliary continuation.
        # This enables switching back to burnup_parms
        # while preventing the state from switching back to input_line.
        token_list[1] = ' AUX '
        token_list.insert(2, 'mat')  # Add mat keyword for next processing.
        i_idx = 3
    else:  # Start with keyword. Doesn't include burnup material numbers.
        token_list[1] = ' AUX '  # Switch to auxiliary continuation.
        i_idx = 2

    f_idx = len(token_list)  # Initialize final index with the maximum value.
    for idx, item in enumerate(token_list[i_idx:], i_idx):
        if not isinstance(item, float):
            f_idx = idx
            break

    burn_mat = [int(num) for num in token_list[i_idx:f_idx]]

    values.setdefault('burn_mat', []).extend(burn_mat)

    # Remove mat keyword only when a line doesn't end with material number.
    # This is to capture continuation of burnup material numbers.
    # Also, i_idx == f_idx when a line doesn't include burnup material number.
    if (len(token_list) != f_idx) and (i_idx != f_idx):
        del token_list[i_idx-1:f_idx]
    return values, token_list


def process_burn_omit(token_list, values):
    # To be implemented and documented.
    return values, token_list


def process_fatal_error(token_list, values):
    """Retrieve and categorize fatal error.

    This function parses a line, retrieves fatal error message, categorizes it
    and stores it in the main 'values' dictionary with a key 'fatal'.

    Arguments:
        token_list (list)[-]: A list of tokens to be processed.
        values (dict)[-]: Main dictionary to store processed values.

    Returns:
        values (dict)[-]: Main dictionary to store processed values.
        token_list (list)[-]: A list of processed tokens.

    """
    values.setdefault('fatal', {})
    error_msg = token_list[2:]  # Removed first two elements: 'fatal', 'error.'
    print("Fatal error found: {0}".format(' '.join(error_msg)))

    if error_msg[:3] == ['cross-section', 'tables', 'missing']:
        za_num = int(error_msg[5].split('.')[0])  # error_msg[5] = 'ZZZAAA.(id)'
        values['fatal'].setdefault('xs_missing', []).append(za_num)
    return values, token_list


def process_keff_stddev(token_list, values):
    """Acquire standard deviation of keff result.

    This function parses a line, retrieves estimated standard deviation
    and stores it in the main 'values' dictionary with a key 'std_dev'.

    Arguments:
        token_list (list)[-]: A list of tokens to be processed.
        values (dict)[-]: Main dictionary to store processed values.

    Returns:
        values (dict)[-]: Main dictionary to store processed values.
        token_list (list)[-]: A list of processed tokens.

    """
    (keff, std_dev) = (float(token_list[2]), float(token_list[3]))

    values.setdefault('std_dev', []).append((keff, std_dev))
    return values, token_list


def process_burnup_summary(token_list, values):
    """Acquire burnup summary results.

    This function parses a line, stores parameters from burnup summary table
    (within table 210) with corresponding keys in a sub-dictionary.

    Arguments:
        token_list (list)[-]: A list of tokens to be processed.
        values (dict)[-]: Main dictionary to store processed values.

    Returns:
        values (dict)[-]: Main dictionary to store processed values.
        token_list (list)[-]: A list of processed tokens.

    """
    data_dict = {}
    data_heading = ['step', 'duration', 'time', 'power', 'keff',
                    'flux', 'ave_nu', 'ave_q', 'burnup', 'source']

    step = int(token_list[0])
    data_dict['step'] = [step]
    for idx, data in enumerate(data_heading[1:], 1):
        data_dict[data] = [float(token_list[idx])]

    # Append standard deviation of corresponding keff.
    idx = data_dict['step'][0] * 2

    try:
        (keff, std_dev) = values['std_dev'][idx]
    except IndexError:
        print("Check if there is a final result line for "
              + "correcter calculation {0}.".format(step))
        raise

    if data_dict['keff'][0] == keff:
        data_dict['std_dev'] = [std_dev]
    else:
        raise ValueError(
            "keff mismatch between burnup summary table and final result lines"
            + "\nof correcter calculations. Please check the following data."
            + "\n- Burnup summary table, step {1} keff: {0}".format(
                data_dict['keff'][0], step)
            + "\n- Correcter calculation {0} final result keff: {1}".format(
                step, keff))


    if 'burnup_summary' in values.keys():
        for key in values['burnup_summary'].keys():
            values['burnup_summary'][key] += data_dict[key]
    else:
        values['burnup_summary'] = data_dict
    return values, token_list


def process_inventory_parms(token_list, values):
    """Acquire burnup material inventory parameters.

    This function parses a line, stores parameters of burnup material inventory
    as a keyword for burnup state.

    Arguments:
        token_list (list)[-]: A list of tokens to be processed.
        values (dict)[-]: Main dictionary to store processed values.

    Returns:
        values (dict)[-]: Main dictionary to store processed values.
        token_list (list)[-]: A list of processed tokens.

    """

    if 'sum' in token_list:  # Inventory for sum of materials.
        [series, step, time, power] = \
                [token_list[0], int(token_list[10][:-1]),
                 float(token_list[12]), float(token_list[15])]

        # Burnup state keyword to store inventory entries.
        values['current_burn_key'] = ('sum', series, 'step_{0}'.format(step))

    else:  # Inventory for individual materials.
        global burn_mat_idx

        if token_list[4].isdigit():  # In case material number <= 999.
            [series, step, time, power] = \
                    [token_list[0], int(token_list[9][:-1]),
                     float(token_list[11]), float(token_list[14])]
            if values['burn_mat'][burn_mat_idx[series]] != float(token_list[4]):
                raise ValueError("Material number not matching with " + \
                                 "internal parser logic. Contact developer.")
        else:  # In case material number > 999. No space between 'material'
               # and corresponding number: material****.
            [series, step, time, power] = \
                    [token_list[0], int(token_list[8][:-1]),
                     float(token_list[10]), float(token_list[13])]

        # Burnup state keyword to store inventory entries.
        values['current_burn_key'] = (values['burn_mat'][burn_mat_idx[series]],
                                      series, 'step_{0}'.format(step))


        # If burnup step reaches its end, move on to next material.
        if step == values['burnup_summary']['step'][-1]:
            burn_mat_idx[series] += 1

    return values, token_list


def process_inventory_entry(token_list, values):
    """Acquire burnup material inventory entries.

    This function parses a line, stores entries of burnup material inventory
    for corresponding burnup keyword.

    Arguments:
        token_list (list)[-]: A list of tokens to be processed.
        values (dict)[-]: Main dictionary to store processed values.

    Returns:
        values (dict)[-]: Main dictionary to store processed values.
        token_list (list)[-]: A list of processed tokens.

    """
    zaid = int(token_list[1])
    [mass, activity, spec_act, atom_den, atom_frac, mass_frac] = \
            [float(entry) for entry in token_list[2:8]]

    (mat, series, step) = values['current_burn_key']
    inven_key = (mat, step)
    nuc_id = mcnp_to_id(zaid)

    if 'inventory' in values.keys():
        if inven_key in values['inventory'].keys():
            values['inventory'][inven_key][nuc_id] = mass
        else:
            values['inventory'][inven_key] = Material({nuc_id: mass})
    else:
        values['inventory'] = {inven_key: Material({nuc_id: mass})}

    return values, token_list


def noop(token_list, values):
    """No operation.

    Arguments:
        token_list (list)[-]: A list of tokens to be processed.
        values (dict)[-]: Main dictionary to store processed values.

    Returns:
        values (dict)[-]: Main dictionary to store processed values.
        token_list (list)[-]: A list of processed tokens.

    """
    return values, token_list


# Dictionaries to map state -> process input/output function.
process_input = {
    'burn_mat': process_burn_mat,
    'burn_omit': process_burn_omit,
    # No operation states.
    'input_line': noop,
    'burnup_parms': noop}

process_output = {
    'fatal': process_fatal_error,
    'std_dev': process_keff_stddev,
    'burnup_summary_entry': process_burnup_summary,
    'inventory_parms': process_inventory_parms,
    'inventory_entry': process_inventory_entry,
    # No operation states.
    'ignore': noop,
    'burnup_summary': noop,
    'burnup_summary_ignore': noop,
    'inventory_heading': noop,
    'inventory_totals': noop,
    'inventory_ignore': noop}


# Objective functions.
def retrieve_input(values):
    """Retrieve original input section.

    This function takes a list of retrieved input strings from the main
    'values' dictionary and makes a string of original input section.

    Arguments:
        values (dict)[-]: Main dictionary storing processed strings.

    Returns:
        input_str (str)[-]: A string of input section.

    """
    input_str = '\n'.join(values['input'])
    return input_str


def make_fuel_mat_str(values):
    """Make a string for fuel material cards in MCNP format.

    This function takes burnup material inventory data from the main 'values'
    dictionary and makes fuel material cards as a string in MCNP format.

    Arguments:
        values (dict)[-]: Main dictionary storing processed values.

    Returns:
        mat_card (str)[-]: A string of MCNP material cards.
    """
    mat_card = ''

    # Write new material cards with inventories of the last burnup step.
    final_step = 'step_{0}'.format(values['burnup_summary']['step'][-1])

    sorted_keys = sorted(list(values['inventory']),
                         key=lambda x: (str(x[0]), x[1]))
    for (mat, step) in sorted_keys:
        if mat != 'sum' and step == final_step:
            mat_obj = values['inventory'][(mat, step)]
            mat_obj.metadata['mat_number'] = mat
            mat_card += mat_obj.mcnp()
    return mat_card


def make_fuel_mat_lib(values):
    """Make a PyNE material library for fuel materials.

    This function takes burnup material inventory data from the main 'values'
    dictionary and makes a PyNE material library for fuel materials.

    Arguments:
        values (dict)[-]: Main dictionary storing processed values.

    Returns:
        mat_lib (dict)[-]: PyNE material library object.

    """
    mat_lib = MaterialLibrary()

    # Write new material cards with inventories of the last burnup step.
    final_step = 'step_{0}'.format(values['burnup_summary']['step'][-1])

    sorted_keys = sorted(list(values['inventory']),
                         key=lambda x: (str(x[0]), x[1]))
    for (mat, step) in sorted_keys:
        if mat != 'sum' and step == final_step:
            mat_obj = values['inventory'][(mat, step)]
            mat_obj.metadata['mat_number'] = mat
            mat_obj.density = 0  # Flag value to trigger density calculation.
            mat_lib.update({mat: mat_obj})
    return mat_lib


def calc_burnup_rho(values):
    """Calculate burnup and reactivity.

    This function calculates burnup, reactivity and standard deviation
    for reactivity.

    Arguments:
        values (dict)[-]: Main dictionary storing processed values.

    Returns:
        out_tup (tuple)[-]: (Burnup[MWd], Reactivity[%dk/k], rho_stddev[%dk/k]).

    """
    round_digit = 5
    mU_UWNR = 62.25  # Estimated total mass of U in UWNR.
    keff_list = values['burnup_summary']['keff']
    burnup_list = values['burnup_summary']['burnup']
    stddev_list = values['burnup_summary']['std_dev']

    bu = [round(bp*mU_UWNR, round_digit) for bp in burnup_list]
    rho = [round((k-1)/k*100.0, round_digit) for k in keff_list]
    rho_stddev = [round((std_dev/keff**2)*100.0, round_digit)
                  for keff, std_dev in zip(keff_list, stddev_list)]
    return (bu, rho, rho_stddev)


# Dictionaries to map objective -> objective function.
obj_function = {
    'input': retrieve_input,
}

# comment back in if pyne installed
#    'text': make_fuel_mat_str,
#    'library': make_fuel_mat_lib,
#    'summary': calc_burnup_rho}


# Looping functions.
def update_state(state, token_list):
    """Update the state of current line.

    This function takes token list with a state and update the state using
    'transitions' dictionary, if necessary.

    Arguments:
        state (str)[-]: State of current token list before update.
        token_list (list)[-]: A list of tokens where state is to be updated.

    Returns:
        state (str)[-]: Updated state of current token list.

    """
    for new_state, search_key in transitions[state].items():
        (flag, pattern, idx) = search_key
        if flag == 0:  # Match regular expression.
            if re.match(pattern, token_list[idx]):
                state = new_state
        elif flag == 1:  # Match list.
            if isinstance(idx, int):
                if token_list[idx:idx+len(pattern)] == pattern:
                    state = new_state
            elif idx == '*':  # Check if pattern matches anywhere.
                if set(pattern).issubset(set(token_list)):
                    state = new_state
        elif flag == 2:  # Negative match list.
            if isinstance(idx, int):
                if token_list[idx:idx+len(pattern)] != pattern:
                    state = new_state
            elif idx == '*':
                # Check if token_list doesn't have any element in pattern.
                if not set(pattern).intersection(set(token_list)):
                    state = new_state
    return state


def parse_lines(state, values, searchlines):
    """Parse lines to return processed strings.

    This function takes a list of lines, loop over each line
    to update its state and process functions accroding to the state.

    Arguments:
        state (str)[-]: State where parsing will be started.
        values (dict)[-]: Main dictionary to store processed values.
        searchlines (list)[-]: A list of MCNP output lines.

    Returns:
        state (str)[-]: State to be started for the next file, if applicable.
        values (dict)[-]: Main dictionary storing processed values.

    """
    for line in searchlines:
        # Remove blank lines.
        if line.strip() == '':
            continue

        # Initialize a list of tokens from given line.
        token_list = make_tokens(line)
        if not token_list:
            continue

        new_state = update_state(state, token_list)

        if re.match('\d+-', token_list[0]):  # Input section.
            # Retrieve original input string.
            strip_index = len(re.match('\d+-', line.strip()).group() + spacing)
            values.setdefault('input', []).append(line.strip()[strip_index:])

            # Expand shorthands.
            token_list = expand_shorthands(token_list)

            values, token_list = process_input[new_state](token_list, values)
            sub_state = update_state(new_state, token_list)
            while new_state != sub_state:  # Process multiple states in a line.
                values, token_list = process_input[sub_state](token_list,
                                                              values)
                new_state = sub_state
                sub_state = update_state(new_state, token_list)
        else:  # Output section.
            values, token_list = process_output[new_state](token_list, values)

        state = new_state

    return state, values


# Main function.
def output_parser(filenames, objectives):
    """Output desired results by parse files.

    This is a main function to parse MCNP output files and return desired
    objects. The main dictionary 'values' which stored processed data is updated
    for each output file being parsed. Desired objective function is called
    according to objectives of user's choice and corresponding outputs are
    generated in the form of a dictionary of objects.

    Arguments:
        filenames (list)[-]: List of MCNP output filenames to be parsed.
        objectives (dict)[-]: Dictionary of objectives with booleans.

    Returns:
        out_obj (dict)[-]: Outputs of objective functions.
        fatal_err (dict)[-]: Categorized fatal errors.

    """
    # Initialize variables to be used for parsing multiple files.
    values = {}
    state = 'ignore'

    # Parse lines of each file.
    for filename in filenames:
        with open(filename, 'r') as f:
            searchlines = f.readlines()
        print("Parsing '{0}' started...".format(filename))
        state, values = parse_lines(state, values, searchlines)
        print("Parsing '{0}' completed.".format(filename))

    # Fatal errors.
    fatal_err = None
    if 'fatal' in values:
        fatal_err = values.pop('fatal')

    # Execute objectives.
    out_obj = {}
    for (obj, select) in objectives.items():
        if select:
            out_obj[obj] = obj_function[obj](values)
    return out_obj, fatal_err