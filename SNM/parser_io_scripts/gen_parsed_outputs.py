"""Script to generate parsed outputs to files.

This script writes output data parsed from a list of output files
into files. For each selected objective flag, a file is written with
pertinent data and file extension.
It utilizes `parse_mcnp_output.py` module in `parser` directory to parse
MCNP output files and generate output objects.

Note:
  * Currently, only parsing of MCNP output files is supported.
  * For detailed constraints on MCNP output files to be parsed,
    refer to note section on `parse_mcnp_output.py` in `parser` directory.
  * Default file extension for each resultant file is pre-defined in
    corresponding function definition. It can be changed by modifying value
    of `ext` within each function definition. When changing file extensions,
    make sure that no two files with different data have the same extension.
    Otherwise, one file will be overwritten by the other.
  * Multiple objective flags are allowed and preferred per script execution,
    as parsing of a list of output files might take a long time.

Usage example:
  $ python gen_parsed_outputs.py mcnp_output.io -b sequence_n -itlp
  -> Output: 'sequence_n.i' for retrieved input file,
             'sequence_n_mat.txt' for text file with MCNP material cards,
             'sequence_n.h5' for HDF5 file with material library,
             'sequence_n_bu.txt' for text file with burnup modeling results.

Following functions are included in this script:
  * write_original_input
  * write_fuel_mat_str
  * write_fuel_mat_lib
  * write_burnup_summary
  * write_parsed_outputs

"""

import argparse
import parse_mcnp_output as mp


def write_original_input(str_obj, basename, ext='i'):
    """Write original input file.

    This function writes an input file with a string of original input section.

    Args:
        str_obj (str): A string of retrieved input section.
        basename (str): Input filename to be generated.

    Returns:
        None.

    """
    inp_name = "{0}.{1}".format(basename, ext)
    with open(inp_name, 'w') as out_file:
        out_file.write(str_obj)
    print("Original input file is retrieved as '{0}'.".format(inp_name))


def write_fuel_mat_str(str_obj, basename, ext='txt'):
    """Write fuel material cards in a text file.

    This function writes fuel material cards in a plain text file.

    Args:
        str_obj (str): A string of fuel material cards.
        basename (str): Text filename to be generated.

    Returns:
        None.
    """
    text_name = "{0}_mat.{1}".format(basename, ext)
    with open(text_name, 'w') as text_file:
        text_file.write(str_obj)
    print("Fuel material cards are written in '{0}'.".format(text_name))


def write_fuel_mat_lib(lib_obj, basename, ext='h5'):
    """Write fuel material library in an HDF5 file.

    This function writes MCNP material library in an HDF5 file.

    Args:
        lib_obj (library): PyNE material library.
        basename (str): HDF5 filename to be generated.

    Returns:
        None.

    """
    lib_name = "{0}.{1}".format(basename, ext)
    lib_obj.write_hdf5(lib_name)
    print("Fuel material library is written in '{0}'.".format(lib_name))


def write_burnup_summary(tup_obj, basename, ext='txt'):
    """Write burnup summary in a text file.

    This function writes a summary of burnup [MWd], reactivity [%dk/k] and its
    standard deviation [%dk/k] for each burnup step in a plain text file.

    Args:
        tup_obj (tup): A tuple of lists for writing burnup summary file.
        basename (str): Figure filename to be generated.

    Returns:
        None.

    """
    (bu, rho, rho_stddev) = tup_obj
    summary_str = "{0}  {1}  {2}\n".format("Burnup [MWd]",
                                           "Reactivity [%dk/k]",
                                           "Standard deviation [%dk/k]")
    for (bu_step, rho_step, rho_stddev_step) in zip(bu, rho, rho_stddev):
        summary_str += "{0:<12}  {1:<18.5f}  {2:.5f}\n".format(bu_step,
                                                               rho_step,
                                                               rho_stddev_step)

    text_name = "{0}_bu.{1}".format(basename, ext)
    with open(text_name, 'w') as text_file:
        text_file.write(summary_str)
    print("Burnup summary is written in '{0}'.".format(text_name))


# Dictionaries to map objective -> write function.
write_function = {
    'input': write_original_input,
    'text': write_fuel_mat_str,
    'library': write_fuel_mat_lib,
    'summary': write_burnup_summary}


def write_parsed_outputs(p_args):
    """Write parsed outputs to files.

    This function calls write functions according to selected objective flags.
    Each write function writes a file using pertinent data parsed from provided
    output files.

    Args:
        p_args (dict): Parsed arguments consisted of `filenames`, `basename`
            and objective (`input`, `text`, `library` and `summary`) keywords
            with corresponding values.

    Returns:
        None.

    """
    filenames = p_args.pop('filenames')
    basename = p_args.pop('basename')

    out_obj, fatal_err = mp.output_parser(filenames, p_args)
    for (key, obj) in out_obj.items():
        write_function[key](obj, basename)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Write parsed outputs to\
                                      files.")

    # A list of output filenames to be parsed.
    parser.add_argument("filenames", type=str, nargs='+',
                        help="output filenames to be parsed")

    # Base filename for files to be generated.
    parser.add_argument("-b", "--basename", type=str, required=True,
                        help="base filename to be used for chosen objectives")

    # Objective flags.
    parser.add_argument("-i", "--input", action='store_true',
                        help="write original input file")
    parser.add_argument("-t", "--text", action='store_true',
                        help="write fuel material cards in text format")
    parser.add_argument("-l", "--library", action='store_true',
                        help="write fuel material library in HDF5 format")
    parser.add_argument("-s", "--summary", action='store_true',
                        help="write burnup summary file for plotting\
                        burnup vs. reactivity")

    write_parsed_outputs(vars(parser.parse_args()))