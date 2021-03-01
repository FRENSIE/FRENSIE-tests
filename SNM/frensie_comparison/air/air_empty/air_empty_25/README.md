run `mcnp6 i=air_empty_25.i o=air_empty_25.o tasks 8`
run `./snm.py --db_path=/home/software/mcnpdata/database.xml --sim_name="snm" --num_particles=1e8 --threads=8`
run `./snm-plot.py --rendezvous_file="snm_rendezvous.xml" --estimator_id=1 --entity_id=4 --mcnp_file=air_empty_25.io --mcnp_file_start=1369`
run `./snm-plot.py --rendezvous_file="snm_rendezvous.xml" --estimator_id=2 --entity_id=5 --mcnp_file=air_empty_25.io  --mcnp_file_start=1436`
run `./snm-plot.py --rendezvous_file="snm_rendezvous.xml" --estimator_id=3 --entity_id=6 --mcnp_file=air_empty_25.io  --mcnp_file_start=1503`
run `./snm-plot.py --rendezvous_file="snm_rendezvous.xml" --estimator_id=4 --entity_id=7 --mcnp_file=air_empty_25.io  --mcnp_file_start=1570`
run `./snm-plot.py --rendezvous_file="snm_rendezvous.xml" --estimator_id=5 --entity_id=8 --mcnp_file=air_empty_25.io  --mcnp_file_start=1637`