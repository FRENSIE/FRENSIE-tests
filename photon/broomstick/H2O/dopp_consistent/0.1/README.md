1. run `mcnp6 i=broomstick_mcnp.i o=broomstick_mcnp.o tasks 8`
2. run `export DATABASE_PATH=path-to-db`
3. run `./broomstick.py --db_path=$DATABASE_PATH --sim_name="broomstick" --num_particles=1e8 --threads=8`
4. run `./broomstick-extract.py --rendezvous_file="broomstick_rendezvous.xml" --estimator_id=1 --entity_id=1 > broomstick_consistent_data.out`
5. run `./broomstick-extract.py --rendezvous_file="../../dopp_hybrid/0.1/broomstick_rendezvous.xml" --estimator_id=1 --entity_id=1 > broomstick_hybrid_data.out`
6. run `./broomstick-plot.py --wh_data_file="broomstick_hybrid_data.out" --ia_data_file="broomstick_consistent_data.out"`
7. run `./broomstick-plot2.py --rendezvous_file="broomstick_rendezvous.xml" --estimator_id=1 --entity_id=1 --mcnp_file="../../dopp_hybrid/0.1/broomstick_mcnp.o" --mcnp_file_start=5290 --mcnp_file_end=6288 --current`
[H Broomstick](h_broomstick_current.png "H Broomstick")