1. run `export DATABASE_PATH=path-to-db`
2. run `./infinite_medium.py --db_path=$DATABASE_PATH --sim_name="infinite_medium" --num_particles=1e8 --threads=8`

# Extract data for surface 1
7. run `./infinite_medium-extract.py --rendezvous_file="infinite_medium_relax_rendezvous.xml" --estimator_id=1 --entity_id=1 > infinite_medium_dc_e1_s1_data.out`
8. run `./infinite_medium-extract.py --rendezvous_file="../../../dopp_hybrid/0.1/forward/infinite_medium_relax_rendezvous.xml" --estimator_id=1 --entity_id=1 > infinite_medium_dh_e1_s1_data.out`
9. run `./infinite_medium-plot.py --dh_data_file="infinite_medium_dh_e1_s1_data.out" --dc_data_file="infinite_medium_dc_e1_s1_data.out"`
10. run `./infinite_medium_mcnp-extract.py --rendezvous_file="infinite_medium_relax_rendezvous.xml" --estimator_id=1 --mcnp_file="../../../dopp_hybrid/0.1/forward/infinite_medium_mcnp.o" --mcnp_file_start=820 --mcnp_file_end=1337 > infinite_medium_mcnp_e1_s1_data.out`
11. run `./infinite_medium_mcnp-plot.py --rendezvous_file="infinite_medium_relax_rendezvous.xml" --estimator_id=1 --entity_id=1 --mcnp_file="../../../dopp_hybrid/0.1/forward/infinite_medium_mcnp.o" --mcnp_file_start=820 --mcnp_file_end=1337 --flux --forward`

# Extract data for surface 3
12. run `./infinite_medium-extract.py --rendezvous_file="infinite_medium_relax_rendezvous.xml" --estimator_id=1 --entity_id=3 > infinite_medium_dc_e1_s3_data.out`
13. run `./infinite_medium-extract.py --rendezvous_file="../../../dopp_hybrid/0.1/forward/infinite_medium_relax_rendezvous.xml" --estimator_id=1 --entity_id=3 > infinite_medium_dh_e1_s3_data.out`
14. run `./infinite_medium-plot.py --dh_data_file="infinite_medium_dh_e1_s3_data.out" --dc_data_file="infinite_medium_dc_e1_s3_data.out"`
15. run `./infinite_medium_mcnp-extract.py --rendezvous_file="infinite_medium_relax_rendezvous.xml" --estimator_id=1 --mcnp_file="../../../dopp_hybrid/0.1/forward/infinite_medium_mcnp.o" --mcnp_file_start=1343 --mcnp_file_end=1860 > infinite_medium_mcnp_e1_s3_data.out`
16. run `./infinite_medium_mcnp-plot.py --rendezvous_file="infinite_medium_relax_rendezvous.xml" --estimator_id=1 --entity_id=3 --mcnp_file="../../../dopp_hybrid/0.1/forward/infinite_medium_mcnp.o" --mcnp_file_start=1343 --mcnp_file_end=1860 --flux --forward`

# Extract data for surface 6
17. run `./infinite_medium-extract.py --rendezvous_file="infinite_medium_relax_rendezvous.xml" --estimator_id=1 --entity_id=6 > infinite_medium_dc_e1_s6_data.out`
18. run `./infinite_medium-extract.py --rendezvous_file="../../../dopp_hybrid/0.1/forward/infinite_medium_relax_rendezvous.xml" --estimator_id=1 --entity_id=6 > infinite_medium_dh_e1_s6_data.out`
19. run `./infinite_medium-plot.py --dh_data_file="infinite_medium_dh_e1_s6_data.out" --dc_data_file="infinite_medium_dc_e1_s6_data.out"`
20. run `./infinite_medium_mcnp-extract.py --rendezvous_file="infinite_medium_relax_rendezvous.xml" --estimator_id=1 --mcnp_file="../../../dopp_hybrid/0.1/forward/infinite_medium_mcnp.o" --mcnp_file_start=1866 --mcnp_file_end=2383 > infinite_medium_mcnp_e1_s6_data.out`
21. run `./infinite_medium_mcnp-plot.py --rendezvous_file="infinite_medium_relax_rendezvous.xml" --estimator_id=1 --entity_id=6 --mcnp_file="../../../dopp_hybrid/0.1/forward/infinite_medium_mcnp.o" --mcnp_file_start=1866 --mcnp_file_end=2383 --flux --forward`

# Extract data for surface 9
22. run `./infinite_medium-extract.py --rendezvous_file="infinite_medium_relax_rendezvous.xml" --estimator_id=1 --entity_id=9 > infinite_medium_dc_e1_s9_data.out`
23. run `./infinite_medium-extract.py --rendezvous_file="../../../dopp_hybrid/0.1/forward/infinite_medium_relax_rendezvous.xml" --estimator_id=1 --entity_id=9 > infinite_medium_dh_e1_s9_data.out`
24. run `./infinite_medium-plot.py --dh_data_file="infinite_medium_dh_e1_s9_data.out" --dc_data_file="infinite_medium_dc_e1_s9_data.out"`
25. run `./infinite_medium_mcnp-extract.py --rendezvous_file="infinite_medium_relax_rendezvous.xml" --estimator_id=1 --mcnp_file="../../../dopp_hybrid/0.1/forward/infinite_medium_mcnp.o" --mcnp_file_start=2389 --mcnp_file_end=2906 > infinite_medium_mcnp_e1_s9_data.out`
26. run `./infinite_medium_mcnp-plot.py --rendezvous_file="infinite_medium_relax_rendezvous.xml" --estimator_id=1 --entity_id=9 --mcnp_file="../../../dopp_hybrid/0.1/forward/infinite_medium_mcnp.o" --mcnp_file_start=2389 --mcnp_file_end=2906 --flux --forward`

# Extract data for surface 12
27. run `./infinite_medium-extract.py --rendezvous_file="infinite_medium_relax_rendezvous.xml" --estimator_id=1 --entity_id=12 > infinite_medium_dc_e1_s12_data.out`
28. run `./infinite_medium-extract.py --rendezvous_file="../../../dopp_hybrid/0.1/forward/infinite_medium_relax_rendezvous.xml" --estimator_id=1 --entity_id=12 > infinite_medium_dh_e1_s12_data.out`
29. run `./infinite_medium-plot.py --dh_data_file="infinite_medium_dh_e1_s12_data.out" --dc_data_file="infinite_medium_dc_e1_s12_data.out"`
30. run `./infinite_medium_mcnp-extract.py --rendezvous_file="infinite_medium_relax_rendezvous.xml" --estimator_id=1 --mcnp_file="../../../dopp_hybrid/0.1/forward/infinite_medium_mcnp.o" --mcnp_file_start=2912 --mcnp_file_end=3429 > infinite_medium_mcnp_e1_s12_data.out`
31. run `./infinite_medium_mcnp-plot.py --rendezvous_file="infinite_medium_relax_rendezvous.xml" --estimator_id=1 --entity_id=12 --mcnp_file="../../../dopp_hybrid/0.1/forward/infinite_medium_mcnp.o" --mcnp_file_start=2912 --mcnp_file_end=3429 --flux --forward`

[H Infinite Medium](h_infinite_medium_current.png "H Infinite Medium")