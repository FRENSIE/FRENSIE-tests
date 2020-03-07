#!/bin/sh
# This file is named infinite_medium.sh
#SBATCH --partition=pre
#SBATCH --time=1-00:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1

python2.7 evaluate_efficiency.py --db_path=$DATABASE_PATH --atomic_number=1 --model_type=wh --samples_per_point=100000 --num_energies=1000 --max_energy=0.1
