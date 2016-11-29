#!/bin/bash
##---------------------------------------------------------------------------##
## FACEMC test result data processor
##---------------------------------------------------------------------------##

EXTRA_ARGS=$@
TESTING_DIR="/home/lkersting/frensie/frensie-tests"

if [ "$#" -ne 1 ];
then
    echo "The input file is required. $# arguments provided!"
    echo "run:  ./data_processor.sh <file>"
else
    # Set file name
    FILE=$1

    H5="${FILE}.h5"
    TL_FLUX="${FILE}_flux"
    SURFACE_CURRENT="${FILE}_surface_current"

    if [ -f $H5 ];
    then
        for i in 4 6
        do
            output=${SURFACE_CURRENT}_${i}.txt
            # Extract the surface current data
            ${TESTING_DIR}/edump.py -f $H5 -e 1 -i ${i} -b Energy > $output
        done

        output=${TL_FLUX}_${i}.txt
        # Extract the current data
        ${TESTING_DIR}/edump.py -f $H5 -e 2 -i total -b Energy > $output
    else
       echo "File $H5 does not exist."
    fi
fi
