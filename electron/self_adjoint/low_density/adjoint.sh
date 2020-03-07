#!/bin/sh
# This file is named adjoint.sh
#SBATCH --partition=pre
#SBATCH --time=1-00:00:00
#SBATCH --ntasks=40
#SBATCH --cpus-per-task=4

##----------------------------------------------------------------------------##
## ---------------------------- FACEMC test runner ---------------------------##
##----------------------------------------------------------------------------##
## FRENSIE verification test: Self Adjoint test.
## The adjoint surface flux in source energy bins at the delta forward source
## energy
##----------------------------------------------------------------------------##
EXTRA_ARGS=$@

# Set the number of histories
HISTORIES=1000000
# Set the max runtime (in minutes, 1 day = 1440 )
TIME=1350

# These parameters can be set if the cluster is not used
# SLURM_CPUS_PER_TASK=4
# SLURM_NTASKS=1

# Run from the rendezvous
if [ "$#" -eq 1 ]; then
  # Set the rendezvous
  RENDEZVOUS="$1"

  # Restart the simulation
  echo "Restarting Facemc Self Adjoint test for ${HISTORIES} particles with ${SLURM_NTASKS} MPI processes with ${SLURM_CPUS_PER_TASK} OpenMP threads each!"
  mpiexec -n ${SLURM_NTASKS} python -c "import adjoint; adjoint.runSimulationFromRendezvous(${SLURM_CPUS_PER_TASK}, ${HISTORIES}, ${TIME}, \"${RENDEZVOUS}\" )"

  directory="$(dirname "${RENDEZVOUS}")/"

# Run new simulation
else

  # Set the elastic distribution mode ( DECOUPLED COUPLED HYBRID )
  MODE=COUPLED

  # Set the elastic coupled sampling method ( ONE_D TWO_D MODIFIED_TWO_D )
  METHOD=MODIFIED_TWO_D

  # Set certain reactions to "off"
  ELASTIC=''
  EXCITATION=''
  BREM=''
  IONIZATION=''

  ##--------------------------------------------------------------------------##
  ## ------------------------------- COMMANDS --------------------------------##
  ##--------------------------------------------------------------------------##

  # Create a unique python script and change the parameters
  python_script="adjoint_${SLURM_JOB_ID}"
  cp adjoint.py ${python_script}.py

  # Change the python_script parameters

  # Turn off elastic scattering
  if [ "${ELASTIC}" = "off" ]; then
    command='s/# properties.setAdjointElasticModeOff().*/properties.setAdjointElasticModeOff()/'
    sed -i "${command}" ${python_script}.py
  fi

  # Turn off atomic excitation reactions
  if [ "${EXCITATION}" = "off" ]; then
    command='s/# properties.setAdjointAtomicExcitationModeOff().*/properties.setAdjointAtomicExcitationModeOff()/'
    sed -i "${command}" ${python_script}.py
  fi
  # Turn off bremsstrahlung reactions
  if [ "${BREM}" = "off" ]; then
    command='s/# properties.setAdjointBremsstrahlungModeOff(.*/properties.setAdjointBremsstrahlungModeOff()/'
    sed -i "${command}" ${python_script}.py
  fi

  # Turn off electro-ionization reactions
  if [ "${IONIZATION}" = "off" ]; then
    command='s/# properties.setAdjointElectroionizationModeOff().*/properties.setAdjointElectroionizationModeOff()/'
    sed -i "${command}" ${python_script}.py
  fi

  # Set the elastic distribution mode
  command=s/mode=MonteCarlo.*/mode=MonteCarlo.${MODE}_DISTRIBUTION/
  sed -i "${command}" ${python_script}.py

  # Set the elastic coupled sampling method
  command=s/method=MonteCarlo.*/method=MonteCarlo.${METHOD}_UNION/
  sed -i "${command}" ${python_script}.py

  # Create the results directory
  directory=$(python -c "import ${python_script}; ${python_script}.createResultsDirectory()" 2>&1)

  # Get the simulation name
  name=$(python -c "import ${python_script}; name = ${python_script}.getSimulationName(); print name" 2>&1)

  RENDEZVOUS="${name}_rendezvous_0.xml"

  # Run the simulation from the last rendezvous
  if [ -f ${RENDEZVOUS} ]; then

    # Get the last rendezvous
    i=0
    while [ -f "${name}_rendezvous_${i}.xml" ]; do
      RENDEZVOUS="${name}_rendezvous_${i}.xml"
      i=$[$i+1]
    done

    # Run the simulation from the last rendezvous
    echo "Running Facemc Adjoint test with ${HISTORIES} particles with ${SLURM_NTASKS} MPI processes with ${SLURM_CPUS_PER_TASK} OpenMP threads each from the rendezvous '${RENDEZVOUS}'!"
    mpiexec -n ${SLURM_NTASKS} python -c "import ${python_script}; ${python_script}.runSimulationFromRendezvous(${SLURM_CPUS_PER_TASK}, ${HISTORIES}, ${TIME}, '${RENDEZVOUS}' )"
  else
    # Run the simulation from the start
    echo "Running Facemc Adjoint test with ${HISTORIES} particles with ${SLURM_NTASKS} MPI processes with ${SLURM_CPUS_PER_TASK} OpenMP threads each!"
    mpiexec -n ${SLURM_NTASKS} python -c "import ${python_script}; ${python_script}.runSimulation(${SLURM_CPUS_PER_TASK}, ${HISTORIES}, ${TIME})"
  fi

  # Remove the temperary python script
  rm ${python_script}.py*
fi

  # Move the slurm file to the results directory
  mv slurm-${SLURM_JOB_ID}.out ./${directory}