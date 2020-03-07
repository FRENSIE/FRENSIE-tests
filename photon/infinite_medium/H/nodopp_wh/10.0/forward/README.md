1. run `export DATABASE_PATH=path-to-db`
2. run `./infinite_medium.py --db_path=$DATABASE_PATH --sim_name="infinite_medium" --num_particles=1e8 --threads=8`
3. run `./infinite_medium-plot.py --rendezvous_file="infinite_medium_rendezvous.xml" --estimator_id=1 --entity_id=1 --mcnp_file=infinite_medium_mcnp.o --mcnp_file_start=281 --mcnp_file_end=1279 --flux --forward`
4. run `./infinite_medium-plot.py --rendezvous_file="infinite_medium_rendezvous.xml" --estimator_id=1 --entity_id=3 --mcnp_file=infinite_medium_mcnp.o --mcnp_file_start=1285 --mcnp_file_end=2283 --flux --forward`
5. run `./infinite_medium-plot.py --rendezvous_file="infinite_medium_rendezvous.xml" --estimator_id=1 --entity_id=6 --mcnp_file=infinite_medium_mcnp.o --mcnp_file_start=2289 --mcnp_file_end=3287 --flux --forward`
6. run `./infinite_medium-plot.py --rendezvous_file="infinite_medium_rendezvous.xml" --estimator_id=1 --entity_id=9 --mcnp_file=infinite_medium_mcnp.o --mcnp_file_start=3293 --mcnp_file_end=4291 --flux --forward`
7. run `./infinite_medium-plot.py --rendezvous_file="infinite_medium_rendezvous.xml" --estimator_id=1 --entity_id=12 --mcnp_file=infinite_medium_mcnp.o --mcnp_file_start=4297 --mcnp_file_end=5295 --flux --forward`

# Extract data for surface 1
7. run `./infinite_medium-extract.py --rendezvous_file="infinite_medium_rendezvous.xml" --estimator_id=1 --entity_id=1 > infinite_medium_frensie_e1_s1_data.out`
8. run `./infinite_medium_mcnp-extract.py --rendezvous_file="infinite_medium_rendezvous.xml" --estimator_id=1 --mcnp_file=infinite_medium_mcnp.o --mcnp_file_start=281 --mcnp_file_end=1279 > infinite_medium_mcnp_e1_s1_data.out`

# Extract data for surface 3
9. run `./infinite_medium-extract.py --rendezvous_file="infinite_medium_rendezvous.xml" --estimator_id=1 --entity_id=3 > infinite_medium_frensie_e1_s3_data.out`
10. run `./infinite_medium_mcnp-extract.py --rendezvous_file="infinite_medium_rendezvous.xml" --estimator_id=1 --mcnp_file=infinite_medium_mcnp.o --mcnp_file_start=1285 --mcnp_file_end=2283 > infinite_medium_mcnp_e1_s3_data.out`

# Extract data for surface 6
11. run `./infinite_medium-extract.py --rendezvous_file="infinite_medium_rendezvous.xml" --estimator_id=1 --entity_id=6 > infinite_medium_frensie_e1_s6_data.out`
12. run `./infinite_medium_mcnp-extract.py --rendezvous_file="infinite_medium_rendezvous.xml" --estimator_id=1 --mcnp_file=infinite_medium_mcnp.o --mcnp_file_start=2289 --mcnp_file_end=3287 > infinite_medium_mcnp_e1_s6_data.out`

# Extract data for surface 9
13. run `./infinite_medium-extract.py --rendezvous_file="infinite_medium_rendezvous.xml" --estimator_id=1 --entity_id=9 > infinite_medium_frensie_e1_s9_data.out`
14. run `./infinite_medium_mcnp-extract.py --rendezvous_file="infinite_medium_rendezvous.xml" --estimator_id=1 --mcnp_file=infinite_medium_mcnp.o --mcnp_file_start=3293 --mcnp_file_end=4291 > infinite_medium_mcnp_e1_s9_data.out`

# Extract data for surface 12
15. run `./infinite_medium-extract.py --rendezvous_file="infinite_medium_rendezvous.xml" --estimator_id=1 --entity_id=12 > infinite_medium_frensie_e1_s12_data.out`
16. run `./infinite_medium_mcnp-extract.py --rendezvous_file="infinite_medium_rendezvous.xml" --estimator_id=1 --mcnp_file=infinite_medium_mcnp.o --mcnp_file_start=4297 --mcnp_file_end=5295> infinite_medium_mcnp_e1_s12_data.out`

# Plot all surface data together
17. run `gnuplot plotcmp.p`

[H Infinite Medium](h_infinite_medium_current.png "H Infinite Medium")