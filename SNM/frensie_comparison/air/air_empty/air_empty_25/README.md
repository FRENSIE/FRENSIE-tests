run `mcnp6 i=air_empty_25.i o=air_empty_25.o tasks 8`
run `./SNM.py --db_path=/home/software/mcnpdata/database.xml --sim_name="SNM" --num_particles=1e8 --threads=8`
run `./SNM-plot.py --rendezvous_file="sphere_rendezvous_10.xml" --estimator_id=1 --entity_id=1 --mcnp_file=sphere_mcnp.o --mcnp_file_start=733 --mcnp_file_end=834 --current`
run `./SNM-plot.py --rendezvous_file="sphere_rendezvous_10.xml" --estimator_id=2 --entity_id=1 --mcnp_file=sphere_mcnp.o --mcnp_file_start=900 --mcnp_file_end=1001 --flux`

# TODO MODIFY FOR SNM SIMULATION