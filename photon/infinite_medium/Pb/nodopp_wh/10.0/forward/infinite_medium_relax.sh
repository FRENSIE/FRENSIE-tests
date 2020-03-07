#!/bin/sh
# This file is named infinite_medium.sh
#SBATCH --partition=pre
#SBATCH --time=1-00:00:00
#SBATCH --ntasks=40
#SBATCH --cpus-per-task=4

mpirun -np $SLURM_NTASKS python2.7 infinite_medium.py --db_path=$DATABASE_PATH --sim_name="infinite_medium_relax" --num_particles=1e9 --enable_relax --threads=$SLURM_CPUS_PER_TASK
