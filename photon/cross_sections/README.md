# Plot the incoherent cross sections
1. run `./plot_wh_ia_incoh.py --db_path=$DATABASE_PATH --atomic_number=1 --cs_min=0.0 --cs_max=0.75 --ratio_min=0.2 --ratio_max=1.1`
2. run `./plot_wh_ia_incoh.py --db_path=$DATABASE_PATH --atomic_number=13 --cs_min=0.0 --cs_max=8.0 --ratio_min=0.2 --ratio_max=1.1`
3. run `./plot_wh_ia_incoh.py --db_path=$DATABASE_PATH --atomic_number=82 --cs_min=0.0 --cs_max=40.0 --ratio_min=0.8 --ratio_max=1.4`

# Plot adjoint incoherent (interp) vs. exact adjoint incoherent
1. run `./plot_adjoint_incoh_vs_exact.py --db_path=$DATABASE_PATH --atomic_number=1 --model_type=wh --max_energy=0.1 --legend_ypos=1.02`

# Plot adjoint incoherent vs. incoherent
1. run `./plot_adjoint_incoh_vs_incoh.py --db_path=$DATABASE_PATH --atomic_number=1 --model_type="wh" --max_energies=0.1,1.0,10.0 --cs_min=0.0 --cs_max=2.0 --adjoint_label_y=0.8 --forward_label_y=0.5`
2. run `./plot_adjoint_incoh_vs_incoh.py --db_path=$DATABASE_PATH --atomic_number=13 --model_type="wh" --max_energies=0.1,1.0,10.0 --cs_min=0.0 --cs_max=25.0 --adjoint_label_y=11.0 --forward_label_x=0.017 --forward_label_y=5.1`
3. run `./plot_adjoint_incoh_vs_incoh.py --db_path=$DATABASE_PATH --atomic_number=82 --model_type="wh" --max_energies=0.1,1.0,10.0 --cs_min=0.0 --cs_max=150.0 --adjoint_label_y=58.0 --forward_label_x=0.02 --forward_label_y=17.0`

# Plot all adjoint incoherent versions
1. run `./plot_adjoint_incoh_comps.py --db_path=$DATABASE_PATH --atomic_number=1 --max_energy=0.1 --cs_min=0.0 --cs_max=0.8 --ratio_min=0.2 --ratio_max=1.2`
2. run `./plot_adjoint_incoh_comps.py --db_path=$DATABASE_PATH --atomic_number=1 --max_energy=1.0 --cs_min=0.0 --cs_max=1.0 --ratio_min=0.2 --ratio_max=1.2`
3. run `./plot_adjoint_incoh_comps.py --db_path=$DATABASE_PATH --atomic_number=1 --max_energy=10.0 --cs_min=0.0 --cs_max=2.0 --ratio_min=0.2 --ratio_max=1.2`

4. run `./plot_adjoint_incoh_comps.py --db_path=$DATABASE_PATH --atomic_number=13 --max_energy=0.1 --cs_min=0.0 --cs_max=10.0 --ratio_min=0.2 --ratio_max=1.2'
5. run `./plot_adjoint_incoh_comps.py --db_path=$DATABASE_PATH --atomic_number=13 --max_energy=1.0 --cs_min=0.0 --cs_max=15.0 --ratio_min=0.2 --ratio_max=1.2`
6. run `./plot_adjoint_incoh_comps.py --db_path=$DATABASE_PATH --atomic_number=13 --max_energy=10.0 --cs_min=0.0 --cs_max=25.0 --ratio_min=0.2 --ratio_max=1.2`

7. run `./plot_adjoint_incoh_comps.py --db_path=$DATABASE_PATH --atomic_number=82 --max_energy=0.1 --cs_min=0.0 --cs_max=50.0 --ratio_min=0.4 --ratio_max=1.4`
8. run `./plot_adjoint_incoh_comps.py --db_path=$DATABASE_PATH --atomic_number=82 --max_energy=1.0 --cs_min=0.0 --cs_max=80.0 --ratio_min=0.4 --ratio_max=1.4'
9. run `./plot_adjoint_incoh_comps.py --db_path=$DATABASE_PATH --atomic_number=82 --max_energy=10.0 --cs_min=0.0 --cs_max=150.0 --ratio_min=0.4 --ratio_max=1.4`

# Plot the 2D adjoint incoherent
1. run `./plot_adjoint_incoh_2d.py --db_path=$DATABASE_PATH --atomic_number=1 --model_type=wh > adjoint_incoherent_h_cs.txt'
2. run `gnuplot plot_adjoint_incoherent_2d_cs.p`

# Plot coherent
1. run `./plot_coherent.py --db_path=$DATABASE_PATH --atomic_number=1 --max_energy=0.1 --cs_max=1.0 --ratio_min=0.996 --ratio_max=1.004 --legend_ypos=1.02`

# Plot total forward
1. run `./plot_total_forward.py --db_path=$DATABASE_PATH --atomic_number=1 --max_energy=0.1 --cs_max=2.0 --legend_xpos=1.0 --legend_ypos=1.67`

# Plot the adjoint wh incoherent pdf
1. run `./plot_adjoint_wh_ia_incoh.py --db_path=$DATABASE_PATH --atomic_number=1 --max_energy=0.1 --ratio_min=0.70 --ratio_max=1.0 --legend_ypos=1.02`
2. run `./plot_adjoint_wh_ia_incoh_pdf.py --db_path=$DATABASE_PATH --atomic_number=1 --max_energy=0.1 --ratio_min=0.70 --ratio_max=1.0 --legend_ypos=1.02`

# Plot the adjoint occupation number arg ranges
1. run './plot_adjoint_occupation_number_args.py --db_path=$DATABASE_PATH --atomic_number=82 --max_energy=1.0 --energies="0.1, 0.25, 0.75" --emax_label_x=-0.6 --emax_label_y=0.8

# Plot the adjoint weight factor
1. run `./plot_adjoint_weight_factor.py --db_path=$DATABASE_PATH --e_max=0.1`
2. run `./plot_adjoint_weight_factor.py --db_path=$DATABASE_PATH --e_max=1.0`
3. run `./plot_adjoint_weight_factor.py --db_path=$DATABASE_PATH --e_max=10.0`