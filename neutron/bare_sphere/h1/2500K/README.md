run `mcnp6 i=sphere_mcnp.inp o=sphere_mcnp.out tasks 8`
run `./sphere.py --db_path=/home/alexr/Software/mcnpdata/database.xml --sim_name="sphere" --num_particles=1e6 --threads=8`
run `./sphere-plot.py --rendezvous_file="sphere_rendezvous_10.xml" --estimator_id=1 --entity_id=1 --mcnp_file=sphere_mcnp.out --mcnp_file_start=244 --mcnp_file_end=344 --current`
run `./sphere-plot.py --rendezvous_file="sphere_rendezvous_10.xml" --estimator_id=2 --entity_id=1 --mcnp_file=sphere_mcnp.out --mcnp_file_start=410 --mcnp_file_end=510 --flux`