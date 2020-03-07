#!/bin/bash
# This file is named dyson_sphere_mcnp.sh
#SBATCH --partition=pre
#SBATCH --time=1-00:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8

/home/group/frensie/software/mcnp/bin/mcnp6 i=infinite_medium_mcnp.i o=infinite_medium_mcnp.o tasks $SLURM_CPUS_PER_TASK
