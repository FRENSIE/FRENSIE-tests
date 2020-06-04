run `mcnp6 i=air_empty_25.i o=air_empty_25.o tasks 8`
run `./snm.py --db_path=/home/software/mcnpdata/database.xml --sim_name="snm" --num_particles=1e8 --threads=8`
run `./snm-plot.py --rendezvous_file="SNM_rendezvous_10.xml" --estimator_id=1 --entity_id=1 --mcnp_file=air_empty_25.o --mcnp_file_start=__ --mcnp_file_end=__ `
run `./snm-plot.py --rendezvous_file="SNM_rendezvous_10.xml" --estimator_id=2 --entity_id=1 --mcnp_file=air_empty_25.o  --mcnp_file_start=__ --mcnp_file_end=__ `
run `./snm-plot.py --rendezvous_file="SNM_rendezvous_10.xml" --estimator_id=3 --entity_id=1 --mcnp_file=air_empty_25.o  --mcnp_file_start=__ --mcnp_file_end=__ `
run `./snm-plot.py --rendezvous_file="SNM_rendezvous_10.xml" --estimator_id=4 --entity_id=1 --mcnp_file=air_empty_25.o  --mcnp_file_start=__ --mcnp_file_end=__ `
run `./snm-plot.py --rendezvous_file="SNM_rendezvous_10.xml" --estimator_id=5 --entity_id=1 --mcnp_file=air_empty_25.o  --mcnp_file_start=__ --mcnp_file_end=__ `