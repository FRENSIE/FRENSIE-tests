#!/bin/bash
##---------------------------------------------------------------------------##
## FACEMC test result data processor
##---------------------------------------------------------------------------##

EXTRA_ARGS=$@

if [ "$#" -ne 1 ];
then
    echo "The output directory is required. $# arguments provided!"
    echo "run:  ./data_processor.sh <directory>"
else
    echo -n "Enter the energy to process in keV (1, 10, 100) > "
    read ENERGY
    ENERGY="${ENERGY}kev"
    echo "You entered: $ENERGY"

    # Set cross_section.xml directory path.
    DIR=$1
    mkdir -p $DIR

    H5="h_spheres_${ENERGY}.h5"
    FLUX_ENERGY_BINS="${DIR}/${ENERGY}_flux_bins.txt"
    CURRENT_ENERGY_BINS="${DIR}/${ENERGY}_current_bins.txt"
    FLUX="${DIR}/${ENERGY}_flux"
    CURRENT="${DIR}/${ENERGY}_current"

    if [ -f $H5 ];
    then
        for i in 1 3 6 9 12
        do
            file=${FLUX}_${i}.txt
            # Extract the flux data
            ./edump.py -f $H5 -e 1 -i ${i} -b Energy > $file

            file=${CURRENT}_${i}.txt
            # Extract the current data
            ./edump.py -f $H5 -e 2 -i ${i} -b Energy > $file
        done
        echo "Files will be located in $DIR"

        DATE=$(date +%b%d)

        NEW_NAME="../../../results/facemc/h_spheres_${ENERGY}_${DATE}.h5"
        NEW_RUN_INFO="../../../results/facemc/continue_run_${ENERGY}_${DATE}.xml"

        mv $H5 $NEW_NAME
        mv continue_run.xml $NEW_RUN_INFO

        cd $DIR
        plot="../../plot_${ENERGY}.p"
        gnuplot $plot

    else
       echo "File $H5 does not exist."
    fi
fi
