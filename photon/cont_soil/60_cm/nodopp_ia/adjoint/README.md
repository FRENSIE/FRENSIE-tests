1. run `export DATABASE_PATH=path-to-db`
2. run `./cont_soil.py --db_path=$DATABASE_PATH --sim_name="cont_soil" --num_particles=1e5 --threads=8`
3. run `./cont_soil-extract.py --rendezvous_file=cont_soil_rendezvous.xml --adjoint --estimator_id=2 --entity_id=2 > cont_soil_adjoint_e2_s2_data.out`
4. run `gnuplot plot.p`
5. run `./cont_soil-extract-total.py --rendezvous_file=cont_soil_rendezvous.xml --estimator_id=1 --entity_id=2`