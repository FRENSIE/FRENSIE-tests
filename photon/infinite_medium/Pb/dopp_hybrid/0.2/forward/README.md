1. run `mcnp6 i=infinite_medium_mcnp.i o=infinite_medium_mcnp.o tasks 8`
2. run `export DATABASE_PATH=path-to-db`
3. run `./infinite_medium.py --db_path=$DATABASE_PATH --sim_name="infinite_medium_relax" --num_particles=1e9 --enable_relax --threads=8`
4. run `./infinite_medium.py --db_path=$DATABASE_PATH --sim_name="infinite_medium" --num_particles=1e9 --threads=8`
4. run `./infinite_medium-plot.py --rendezvous_file="infinite_medium_relax_rendezvous.xml" --estimator_id=1 --entity_id=1 --mcnp_file=infinite_medium_mcnp.o --mcnp_file_start=816 --mcnp_file_end=1335 --flux --forward`
5. run `./infinite_medium-plot.py --rendezvous_file="infinite_medium_relax_rendezvous.xml" --estimator_id=1 --entity_id=3 --mcnp_file=infinite_medium_mcnp.o --mcnp_file_start=1341 --mcnp_file_end=1860 --flux --forward`
6. run `./infinite_medium-plot.py --rendezvous_file="infinite_medium_relax_rendezvous.xml" --estimator_id=1 --entity_id=6 --mcnp_file=infinite_medium_mcnp.o --mcnp_file_start=1866 --mcnp_file_end=2385 --flux --forward`
7. run `./infinite_medium-plot.py --rendezvous_file="infinite_medium_relax_rendezvous.xml" --estimator_id=1 --entity_id=9 --mcnp_file=infinite_medium_mcnp.o --mcnp_file_start=2391 --mcnp_file_end=2910 --flux --forward`
8. run `./infinite_medium-plot.py --rendezvous_file="infinite_medium_relax_rendezvous.xml" --estimator_id=1 --entity_id=12 --mcnp_file=infinite_medium_mcnp.o --mcnp_file_start=2916 --mcnp_file_end=3435 --flux --forward`

# Extract data for surface 1
7. run `./infinite_medium-extract.py --rendezvous_file="infinite_medium_relax_rendezvous.xml" --estimator_id=1 --entity_id=1 > infinite_medium_frensie_e1_s1_data.out`
8. run `./infinite_medium_mcnp-extract.py --rendezvous_file="infinite_medium_relax_rendezvous.xml" --estimator_id=1 --mcnp_file=infinite_medium_mcnp.o --mcnp_file_start=816 --mcnp_file_end=1335 > infinite_medium_mcnp_e1_s1_data.out`

# Extract data for surface 3
9. run `./infinite_medium-extract.py --rendezvous_file="infinite_medium_relax_rendezvous.xml" --estimator_id=1 --entity_id=3 > infinite_medium_frensie_e1_s3_data.out`
10. run `./infinite_medium_mcnp-extract.py --rendezvous_file="infinite_medium_relax_rendezvous.xml" --estimator_id=1 --mcnp_file=infinite_medium_mcnp.o --mcnp_file_start=1341 --mcnp_file_end=1860 > infinite_medium_mcnp_e1_s3_data.out`

# Extract data for surface 6
11. run `./infinite_medium-extract.py --rendezvous_file="infinite_medium_relax_rendezvous.xml" --estimator_id=1 --entity_id=6 > infinite_medium_frensie_e1_s6_data.out`
12. run `./infinite_medium_mcnp-extract.py --rendezvous_file="infinite_medium_relax_rendezvous.xml" --estimator_id=1 --mcnp_file=infinite_medium_mcnp.o --mcnp_file_start=1866 --mcnp_file_end=2385 > infinite_medium_mcnp_e1_s6_data.out`

# Extract data for surface 9
13. run `./infinite_medium-extract.py --rendezvous_file="infinite_medium_relax_rendezvous.xml" --estimator_id=1 --entity_id=9 > infinite_medium_frensie_e1_s9_data.out`
14. run `./infinite_medium_mcnp-extract.py --rendezvous_file="infinite_medium_relax_rendezvous.xml" --estimator_id=1 --mcnp_file=infinite_medium_mcnp.o --mcnp_file_start=2391 --mcnp_file_end=2910 > infinite_medium_mcnp_e1_s9_data.out`

# Extract data for surface 12
15. run `./infinite_medium-extract.py --rendezvous_file="infinite_medium_relax_rendezvous.xml" --estimator_id=1 --entity_id=12 > infinite_medium_frensie_e1_s12_data.out`
16. run `./infinite_medium_mcnp-extract.py --rendezvous_file="infinite_medium_relax_rendezvous.xml" --estimator_id=1 --mcnp_file=infinite_medium_mcnp.o --mcnp_file_start=2916 --mcnp_file_end=3435 > infinite_medium_mcnp_e1_s12_data.out`

# Plot all surface data together
17. run `gnuplot plotcmp.p`

# Extract relaxation data for surface 3
18. run `./infinite_medium-relax-extract.py --rendezvous_file="infinite_medium_relax_rendezvous.xml" --estimator_id=1 --entity_id=3 --mcnp_file=infinite_medium_mcnp.o --mcnp_file_start=1343  --mcnp_file_end=1860 > infinite_medium_s3_relax_data.out`

# Plot the relaxation data for surface 3
19. run `gnuplot plot_relax_agreement_2cm.p`

# Extract relaxation data for surface 9
20. run `./infinite_medium-relax-extract.py --rendezvous_file="infinite_medium_relax_rendezvous.xml" --estimator_id=1 --entity_id=9 --mcnp_file=infinite_medium_mcnp.o --mcnp_file_start=2389  --mcnp_file_end=2906 > infinite_medium_s9_relax_data.out`

# Plot the relaxation data for surface 9
21. run `gnuplot plot_relax_agreement_4cm.p`

[H Infinite Medium](h_infinite_medium_current.png "H Infinite Medium")