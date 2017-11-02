#!/bin/bash
##---------------------------------------------------------------------------##
## FACEMC test runner
##---------------------------------------------------------------------------##
## Validation runs comparing FRENSIE Forward with Adjoint.
##---------------------------------------------------------------------------##

# Set cross_section.xml directory path.
EXTRA_ARGS=$@
#CROSS_SECTION_XML_PATH=/home/lkersting/mcnpdata/
CROSS_SECTION_XML_PATH=/home/software/mcnp6.2/MCNP_DATA
FRENSIE=/home/lkersting/frensie

THREADS="12"
if [ "$#" -eq 1 ];
then
    # Set the number of threads used
    THREADS="$1"
fi

# Changing variables
# Material element
ELEMENT="H"
# Delta source energy in MeV ( 0.001, 0.01, 0.1)
ENERGY="0.001"
# Number of histories
HISTORIES="100"
# Turn certain reactions on (true/false)
ELASTIC_ON="true"
BREM_ON="true"
IONIZATION_ON="true"
EXCITATION_ON="true"
# Turn certain electron properties on (true/false)
INTERP="logloglog"
CORRELATED_ON="true"
UNIT_BASED_ON="true"
# Elastic distribution ( Decoupled, Coupled, Hybrid )
DISTRIBUTION="Coupled"
# Elastic coupled sampling method ( Simplified, 1D, 2D )
COUPLED_SAMPLING="2D"
# The Geometry package (ROOT or DAGMC)
GEOMETRY="ROOT"

NAME="native"

ELASTIC="-d ${DISTRIBUTION} -c ${COUPLED_SAMPLING}"
REACTIONS="-t ${ELASTIC_ON} -b ${BREM_ON} -i ${IONIZATION_ON} -a ${EXCITATION_ON}"
SIM_PARAMETERS="-e ${ENERGY} -n ${HISTORIES} -s ${CORRELATED_ON} -u ${UNIT_BASED_ON} ${REACTIONS} ${ELASTIC}"

if [ ${DISTRIBUTION} = "Hybrid" ]
then
    # Use Native moment preserving data
    NAME="moments"
    echo "Using Native Moment Preserving adjoint data!"
else
    # Use Native analog data
    echo "Using Native analog adjoint data!"
fi

NAME_EXTENTION=""
NAME_REACTION=""
# Set the file name extentions
if [ "${ELASTIC_ON}" = "false" ]
then
    NAME_REACTION="${NAME_REACTION}_no_elastic"
elif [ ${DISTRIBUTION} = "Coupled" ]
then
    NAME_EXTENTION="${NAME_EXTENTION}_${COUPLED_SAMPLING}"
fi
if [ "${BREM_ON}" = "false" ]
then
    NAME_REACTION="${NAME_REACTION}_no_brem"
fi
if [ "${IONIZATION_ON}" = "false" ]
then
    NAME_REACTION="${NAME_REACTION}_no_ionization"
fi
if [ "${EXCITATION_ON}" = "false" ]
then
    NAME_REACTION="${NAME_REACTION}_no_excitation"
fi
if [ "${CORRELATED_ON}" = "false" ]
then
    NAME_EXTENTION="${NAME_EXTENTION}_stochastic"
fi
if [ "${UNIT_BASED_ON}" = "false" ]
then
    NAME_EXTENTION="${NAME_EXTENTION}_exact"
fi

# .xml file paths.
INFO=$(python ../adjoint_sim_info.py ${SIM_PARAMETERS} 2>&1)
MAT=$(python ../mat.py -n ${ELEMENT} -t ${NAME} -i ${INTERP} 2>&1)
SOURCE=$(python ./adjoint_source.py -d ${CROSS_SECTION_XML_PATH} -e ${ENERGY} 2>&1)
EST=$(python ./adjoint_est.py -e ${ENERGY} -t ${GEOMETRY} 2>&1)
GEOM=$(python ./geom.py -t ${GEOMETRY} 2>&1)
RSP="../rsp_fn.xml"
e
# Make directory for the test results
TODAY=$(date +%Y-%m-%d)

DIR="results/testrun/${INTERP}"
NAME="hanson_${NAME}_${INTERP}${NAME_EXTENTION}${NAME_REACTION}"

mkdir -p $DIR

echo "Running Facemc Hanson test with ${HISTORIES} particles on ${THREADS} threads:"
RUN="${FRENSIE}/bin/facemc --sim_info=${INFO} --geom_def=${GEOM} --mat_def=${MAT} --resp_def=${RSP} --est_def=${EST} --src_def=${SOURCE} --cross_sec_dir=${CROSS_SECTION_XML_PATH} --simulation_name=${NAME} --threads=${THREADS}"
echo ${RUN}
#gdb --args ${RUN}
${RUN}

echo "Removing old xml files:"
rm ${INFO} ${MAT} ${EST} ${GEOM} ${SOURCE} ElementTree_pretty.pyc

echo "Processing the results:"
H5=${NAME}.h5
NEW_NAME="${DIR}/${H5}"
NEW_RUN_INFO="${DIR}/continue_run_${NAME}.xml"
mv ${H5} ${NEW_NAME}
mv continue_run.xml ${NEW_RUN_INFO}

cd ${DIR}

bash ../../../data_processor.sh ${NAME}
echo "Results will be in ./${DIR}"