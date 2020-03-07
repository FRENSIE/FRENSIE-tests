#!/bin/bash
##---------------------------------------------------------------------------##
## ---------------------------- FACEMC test runner --------------------------##
##---------------------------------------------------------------------------##
## FRENSIE verification test: Self Adjoint test.
## The adjoint surface flux in source energy bins at the delta forward source
## energy
##---------------------------------------------------------------------------##

##---------------------------------------------------------------------------##
## ---------------------------- TEST VARIABLES ------------------------------##
##---------------------------------------------------------------------------##
EXTRA_ARGS=$@

# Set the number of mpi processes and openMP threads
# NOTE: OpenMP threads should be a factor of 16 for univ and 20 for univ2
# NOTE: the max OpenMP threads should be <= 6
MPI_PROCESSES=40
OPEN_MP_THREADS=4

# Set the number of histories
HISTORIES=10000000
# Set the max runtime (in minutes, 1 day = 1440 )
TIME=1350

# Set the elastic distribution mode ( DECOUPLED COUPLED HYBRID )
modes=( COUPLED )

# Set the elastic coupled sampling method
# ( ONE_D TWO_D MODIFIED_TWO_D )
methods=( MODIFIED_TWO_D )

##---------------------------------------------------------------------------##
## ------------------------------- COMMANDS ---------------------------------##
##---------------------------------------------------------------------------##

# Set the number of threads
command="s/\#SBATCH[[:space:]]--ntasks=.*/\#SBATCH --ntasks=${MPI_PROCESSES}/"
sed -i "${command}" adjoint.sh
command="s/\#SBATCH[[:space:]]--cpus-per-task=.*/\#SBATCH --cpus-per-task=${OPEN_MP_THREADS}/"
sed -i "${command}" adjoint.sh

# Set the wall time and number of histories
command=s/TIME=.*/TIME=${TIME}/
sed -i "${command}" adjoint.sh
command=s/HISTORIES=.*/HISTORIES=${HISTORIES}/
sed -i "${command}" adjoint.sh

for mode in "${modes[@]}"
do
  # Set the elastic distribution mode
  command=s/MODE=.*/MODE=${mode}/
  sed -i "${command}" adjoint.sh
  echo "      Setting elastic mode to ${mode}"

  if [ "${mode}" == "COUPLED" ]; then

    for method in "${methods[@]}"
    do
      # Set the elastic coupled sampling method
      command=s/METHOD=.*/METHOD=${method}/
      sed -i "${command}" adjoint.sh
      echo "        Setting elastic coupled sampling method to ${method}"

      sbatch adjoint.sh

    done
  else
      sbatch adjoint.sh
  fi
done
