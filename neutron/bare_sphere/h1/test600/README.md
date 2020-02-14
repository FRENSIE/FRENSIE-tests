run `mcnp6 i=sphere_mcnp.i o=sphere_mcnp.o tasks 8`
run `./sphere.py --db_path=/home/software/mcnpdata/database.xml --sim_name="sphere" --num_particles=2e8 --threads=8 --temp=600.0`
run `./sphere-plot.py --rendezvous_file="sphere_rendezvous_10.xml" --estimator_id=1 --entity_id=1 --mcnp_file=sphere_mcnp.o --mcnp_file_start=1202 --mcnp_file_end=1302 --current`
run `./sphere-plot.py --rendezvous_file="sphere_rendezvous_10.xml" --estimator_id=2 --entity_id=1 --mcnp_file=sphere_mcnp.o --mcnp_file_start=1368 --mcnp_file_end=1468 --flux`
