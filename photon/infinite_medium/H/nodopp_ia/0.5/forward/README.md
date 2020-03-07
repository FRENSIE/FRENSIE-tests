1. run `export DATABASE_PATH=path-to-db`
2. run `./infinite_medium.py --db_path=$DATABASE_PATH --sim_name="infinite_medium" --num_particles=1e8 --threads=8`

# Extract data for surface 1
7. run `./infinite_medium-extract.py --rendezvous_file="infinite_medium_rendezvous.xml" --estimator_id=1 --entity_id=1 > infinite_medium_ia_e1_s1_data.out`
8. run `./infinite_medium-extract.py --rendezvous_file="../../../nodopp_wh/0.5/forward/infinite_medium_rendezvous.xml" --estimator_id=1 --entity_id=1 > infinite_medium_wh_e1_s1_data.out`
9. run `./infinite_medium-plot.py --wh_data_file="infinite_medium_wh_e1_s1_data.out" --ia_data_file="infinite_medium_ia_e1_s1_data.out"`

# Extract data for surface 3
10. run `./infinite_medium-extract.py --rendezvous_file="infinite_medium_rendezvous.xml" --estimator_id=1 --entity_id=3 > infinite_medium_ia_e1_s3_data.out`
11. run `./infinite_medium-extract.py --rendezvous_file="../../../nodopp_wh/0.5/forward/infinite_medium_rendezvous.xml" --estimator_id=1 --entity_id=3 > infinite_medium_wh_e1_s3_data.out`
12. run `./infinite_medium-plot.py --wh_data_file="infinite_medium_wh_e1_s3_data.out" --ia_data_file="infinite_medium_ia_e1_s3_data.out"`

# Extract data for surface 6
13. run `./infinite_medium-extract.py --rendezvous_file="infinite_medium_rendezvous.xml" --estimator_id=1 --entity_id=6 > infinite_medium_ia_e1_s6_data.out`
14. run `./infinite_medium-extract.py --rendezvous_file="../../../nodopp_wh/0.5/forward/infinite_medium_rendezvous.xml" --estimator_id=1 --entity_id=6 > infinite_medium_wh_e1_s6_data.out`
15. run `./infinite_medium-plot.py --wh_data_file="infinite_medium_wh_e1_s6_data.out" --ia_data_file="infinite_medium_ia_e1_s6_data.out"`

# Extract data for surface 9
16. run `./infinite_medium-extract.py --rendezvous_file="infinite_medium_rendezvous.xml" --estimator_id=1 --entity_id=9 > infinite_medium_ia_e1_s9_data.out`
17. run `./infinite_medium-extract.py --rendezvous_file="../../../nodopp_wh/0.5/forward/infinite_medium_rendezvous.xml" --estimator_id=1 --entity_id=9 > infinite_medium_wh_e1_s9_data.out`
18. run `./infinite_medium-plot.py --wh_data_file="infinite_medium_wh_e1_s9_data.out" --ia_data_file="infinite_medium_ia_e1_s9_data.out"`

# Extract data for surface 12
19. run `./infinite_medium-extract.py --rendezvous_file="infinite_medium_rendezvous.xml" --estimator_id=1 --entity_id=12 > infinite_medium_ia_e1_s12_data.out`
20. run `./infinite_medium-extract.py --rendezvous_file="../../../nodopp_wh/0.5/forward/infinite_medium_rendezvous.xml" --estimator_id=1 --entity_id=12 > infinite_medium_wh_e1_s12_data.out`
21. run `./infinite_medium-plot.py --wh_data_file="infinite_medium_wh_e1_s12_data.out" --ia_data_file="infinite_medium_ia_e1_s12_data.out"`




[H Infinite Medium](h_infinite_medium_current.png "H Infinite Medium")