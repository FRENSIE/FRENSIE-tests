# Sampling PDF Plots
1. `./sample_angle.py --db_path=$DATABASE_PATH --atomic_number=1 --model_type=wh --sampling_type=three_branch_lin --num_samples=1000000 --incoming_energy=0.005 --max_energy=0.1`
2. `./sample_angle.py --db_path=$DATABASE_PATH --atomic_number=1 --model_type=wh --sampling_type=three_branch_lin --num_samples=1000000 --incoming_energy=0.01 --max_energy=0.1`
3. `./sample_angle.py --db_path=$DATABASE_PATH --atomic_number=1 --model_type=wh --sampling_type=three_branch_lin --num_samples=1000000 --incoming_energy=0.02 --max_energy=0.1`
4. `./sample_angle.py --db_path=$DATABASE_PATH --atomic_number=1 --model_type=wh --sampling_type=three_branch_lin --num_samples=1000000 --incoming_energy=0.03 --max_energy=0.1 --legend_xpos=0.85 --legend_ypos=1.0`
5. `./sample_angle.py --db_path=$DATABASE_PATH --atomic_number=1 --model_type=wh --sampling_type=three_branch_lin --num_samples=1000000 --incoming_energy=0.04 --max_energy=0.1 --legend_xpos=0.85 --legend_ypos=1.0`
6. `./sample_angle.py --db_path=$DATABASE_PATH --atomic_number=1 --model_type=wh --sampling_type=three_branch_lin --num_samples=1000000 --incoming_energy=0.05 --max_energy=0.1 --legend_xpos=0.85 --legend_ypos=1.0`
7. `./sample_angle.py --db_path=$DATABASE_PATH --atomic_number=1 --model_type=wh --sampling_type=three_branch_lin --num_samples=1000000 --incoming_energy=0.06 --max_energy=0.1 --legend_xpos=0.85 --legend_ypos=1.0`
8. `./sample_angle.py --db_path=$DATABASE_PATH --atomic_number=1 --model_type=wh --sampling_type=three_branch_lin --num_samples=1000000 --incoming_energy=0.07 --max_energy=0.1 --legend_xpos=0.85 --legend_ypos=1.0`
9. `./sample_angle.py --db_path=$DATABASE_PATH --atomic_number=1 --model_type=wh --sampling_type=three_branch_lin --num_samples=1000000 --incoming_energy=0.08 --max_energy=0.1 --legend_xpos=0.85 --legend_ypos=1.0`
10. `./sample_angle.py --db_path=$DATABASE_PATH --atomic_number=1 --model_type=wh --sampling_type=three_branch_lin --num_samples=1000000 --incoming_energy=0.09 --max_energy=0.1 --legend_xpos=0.7 --legend_ypos=0.98`
11. `./sample_angle.py --db_path=$DATABASE_PATH --atomic_number=1 --model_type=wh --sampling_type=three_branch_lin --num_samples=1000000 --incoming_energy=0.099 --max_energy=0.1 --legend_xpos=0.7 --legend_ypos=0.98`

# Efficiency Data Generation
1. run `./evaluate_efficiency.py --db_path=$DATABASE_PATH --atomic_number=1 --model_type=kn --samples_per_point=100000 --num_energies=1000 --max_energy=0.1`
2. run `./evaluate_efficiency.py --db_path=$DATABASE_PATH --atomic_number=1 --model_type=wh --samples_per_point=100000 --num_energies=1000 --max_energy=0.1`
3. run `./evaluate_efficiency.py --db_path=$DATABASE_PATH --atomic_number=13 --model_type=wh --samples_per_point=100000 --num_energies=1000 --max_energy=0.1`
4. run `./evaluate_efficiency.py --db_path=$DATABASE_PATH --atomic_number=82 --model_type=wh --samples_per_point=100000 --num_energies=1000 --max_energy=0.1`
5. run `./evaluate_efficiency.py --db_path=$DATABASE_PATH --atomic_number=1 --model_type=kn --samples_per_point=100000 --num_energies=1000 --max_energy=1.0`
6. run `./evaluate_efficiency.py --db_path=$DATABASE_PATH --atomic_number=1 --model_type=wh --samples_per_point=100000 --num_energies=1000 --max_energy=1.0`
7. run `./evaluate_efficiency.py --db_path=$DATABASE_PATH --atomic_number=13 --model_type=wh --samples_per_point=100000 --num_energies=1000 --max_energy=1.0`
8. run `./evaluate_efficiency.py --db_path=$DATABASE_PATH --atomic_number=82 --model_type=wh --samples_per_point=100000 --num_energies=1000 --max_energy=1.0`
9. run `./evaluate_efficiency.py --db_path=$DATABASE_PATH --atomic_number=1 --model_type=kn --samples_per_point=100000 --num_energies=1000 --max_energy=10.0`
10. run `./evaluate_efficiency.py --db_path=$DATABASE_PATH --atomic_number=1 --model_type=wh --samples_per_point=100000 --num_energies=1000 --max_energy=10.0`
11. run `./evaluate_efficiency.py --db_path=$DATABASE_PATH --atomic_number=13 --model_type=wh --samples_per_point=100000 --num_energies=1000 --max_energy=10.0`
12. run `./evaluate_efficiency.py --db_path=$DATABASE_PATH --atomic_number=82 --model_type=wh --samples_per_point=100000 --num_energies=1000 --max_energy=10.0`

# Efficiency Plots
1. run `./plot_efficiency.py --file=1-kn-0.1.txt --eff_min=0.5 --rate_min=0.8 --rate_max=1.2 --legend_x=1.06 --legend_y=-0.05`
2. run `./plot_efficiency.py --file=1-wh-0.1.txt --eff_min=0.3 --rate_min=0.8 --rate_max=1.2 --legend_x=1.06 --legend_y=-0.05`
3. run `./plot_efficiency.py --file=1-kn-1.0.txt --eff_min=0.2 --rate_min=0.8 --rate_max=1.2 --legend_x=1.06 --legend_y=-0.05`
4. run `./plot_efficiency.py --file=1-wh-1.0.txt --eff_min=0.2 --rate_min=0.8 --rate_max=1.2 --legend_x=1.06 --legend_y=-0.05`
5. run `./plot_efficiency.py --file=1-kn-10.0.txt --eff_min=0.0 --rate_min=0.6 --rate_max=1.4 --legend_x=1.06 --legend_y=-0.05`
6. run `./plot_efficiency.py --file=1-wh-10.0.txt --eff_min=0.0 --rate_min=0.6 --rate_max=1.4 --legend_x=1.06 --legend_y=-0.05`