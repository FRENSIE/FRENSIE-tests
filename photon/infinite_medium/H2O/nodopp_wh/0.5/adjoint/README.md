1. run `export DATABASE_PATH=path-to-db`
2. run `./infinite_medium.py --db_path=$DATABASE_PATH --sim_name="infinite_medium" --num_particles=1e8 --threads=8`

# Surface 1
3. run `./infinite_medium-extract.py --rendezvous_file="infinite_medium_rendezvous.xml" --estimator_id=1 --entity_id=1 --adjoint > infinite_medium_adjoint_e1_s1_data.out`
4. run `./infinite_medium-extract.py --rendezvous_file="../forward/infinite_medium_rendezvous.xml" --estimator_id=1 --entity_id=1 > infinite_medium_forward_e1_s1_data.out`
5. run `./infinite_medium-plot.py --forward_data_file="infinite_medium_forward_e1_s1_data.out" --adjoint_data_file="infinite_medium_adjoint_e1_s1_data.out"`

# Surface 3
6. run `./infinite_medium-extract.py --rendezvous_file="infinite_medium_rendezvous.xml" --estimator_id=1 --entity_id=3 --adjoint > infinite_medium_adjoint_e1_s3_data.out`
7. run `./infinite_medium-extract.py --rendezvous_file="../forward/infinite_medium_rendezvous.xml" --estimator_id=1 --entity_id=3 > infinite_medium_forward_e1_s3_data.out`
8. run `./infinite_medium-plot.py --forward_data_file="infinite_medium_forward_e1_s3_data.out" --adjoint_data_file="infinite_medium_adjoint_e1_s3_data.out"`

# Surface 6
9. run `./infinite_medium-extract.py --rendezvous_file="infinite_medium_rendezvous.xml" --estimator_id=1 --entity_id=6 --adjoint > infinite_medium_adjoint_e1_s6_data.out`
10. run `./infinite_medium-extract.py --rendezvous_file="../forward/infinite_medium_rendezvous.xml" --estimator_id=1 --entity_id=6 > infinite_medium_forward_e1_s6_data.out`
11. run `./infinite_medium-plot.py --forward_data_file="infinite_medium_forward_e1_s6_data.out" --adjoint_data_file="infinite_medium_adjoint_e1_s6_data.out"`

# Surface 9
12. run `./infinite_medium-extract.py --rendezvous_file="infinite_medium_rendezvous.xml" --estimator_id=1 --entity_id=9 --adjoint > infinite_medium_adjoint_e1_s9_data.out`
13. run `./infinite_medium-extract.py --rendezvous_file="../forward/infinite_medium_rendezvous.xml" --estimator_id=1 --entity_id=9 > infinite_medium_forward_e1_s9_data.out`
14. run `./infinite_medium-plot.py --forward_data_file="infinite_medium_forward_e1_s9_data.out" --adjoint_data_file="infinite_medium_adjoint_e1_s9_data.out"`

# Surface 12
15. run `./infinite_medium-extract.py --rendezvous_file="infinite_medium_rendezvous.xml" --estimator_id=1 --entity_id=12 --adjoint > infinite_medium_adjoint_e1_s12_data.out`
16. run `./infinite_medium-extract.py --rendezvous_file="../forward/infinite_medium_rendezvous.xml" --estimator_id=1 --entity_id=12 > infinite_medium_forward_e1_s12_data.out`
17. run `./infinite_medium-plot.py --forward_data_file="infinite_medium_forward_e1_s12_data.out" --adjoint_data_file="infinite_medium_adjoint_e1_s12_data.out"`

