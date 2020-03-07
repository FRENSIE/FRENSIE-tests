#!/bin/sh
# This file is named broomstick.sh
#SBATCH --partition=pre
#SBATCH --time=0-06:00:00
#SBATCH --ntasks=40
#SBATCH --cpus-per-task=4

mpirun -np $SLURM_NTASKS python2.7 sphere.py --db_path=$DATABASE_PATH --sim_name="sphere" --num_particles=1e8 --threads=$SLURM_CPUS_PER_TASK
