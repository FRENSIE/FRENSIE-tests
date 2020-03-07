#!/bin/sh
# This file is named restart.sh
#SBATCH --partition=pre
#SBATCH --time=1-00:00:00
#SBATCH --ntasks=40
#SBATCH --cpus-per-task=4

mpirun -np $SLURM_NTASKS python2.7 restart.py --db_path=$DATABASE_PATH --rendezvous_name="infinite_medium_rendezvous.xml" --num_particles=5e8 --threads=$SLURM_CPUS_PER_TASK
