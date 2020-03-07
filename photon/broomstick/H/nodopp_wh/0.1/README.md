1. run `mcnp6 i=broomstick_mcnp.i o=broomstick_mcnp.o tasks 8`
2. run `export DATABASE_PATH=path-to-db`
3. run `./broomstick.py --db_path=$DATABASE_PATH --sim_name="broomstick" --num_particles=1e8 --threads=8`
4. run `./broomstick-plot.py --rendezvous_file="broomstick_rendezvous.xml" --estimator_id=1 --entity_id=1 --mcnp_file=broomstick_mcnp.o --mcnp_file_start=5282 --mcnp_file_end=6280 --current`
[H Broomstick](h_broomstick_current.png "H Broomstick")