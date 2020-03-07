ti1 = "FRENSIE-Forward-WH"
ti2 = "FRENSIE-Adjoint-WH"
fil = "pb_infinite_medium_flux_all_dist.eps"
set terminal post eps enh color
set output fil
set xlabel "Energy (MeV)"
set ylabel "Flux Spectrum"
set format x "%1.2f"
set format y "%1.1f"
set yrange[0.0:10.0]
set xrange[0.0:1.0]
set key right top
set grid
set label 1 "1cm" at 0.3,3.3
set label 2 "2cm" at 0.3,1.9
#set label 3 "3cm" at 0.3,0.018
set label 4 "4cm" at 0.3,0.7
plot "infinite_medium_forward_e1_s1_data.out" using 6:7 with line lc rgb"black" lt 1 lw 1 title ti1, "infinite_medium_forward_e1_s3_data.out" using 6:7 with line lc rgb"black" lt 1 lw 1 notitle, "infinite_medium_forward_e1_s6_data.out" using 6:7 with line lc rgb"black" lt 1 lw 1 notitle, "infinite_medium_forward_e1_s9_data.out" using 6:7 with line lc rgb"black" lt 1 lw 1 notitle, "infinite_medium_adjoint_e1_s1_data.out" using 6:7 with line lc rgb"red" lt 1 dashtype 6 lw 1 title ti2, "infinite_medium_adjoint_e1_s3_data.out" using 6:7 with line lc rgb"red" lt 1 dashtype 6 lw 1 notitle, "infinite_medium_adjoint_e1_s6_data.out" using 6:7 with line lc rgb"red" lt 1 dashtype 6 lw 1 notitle, "infinite_medium_adjoint_e1_s9_data.out" using 6:7 with line lc rgb"red" lt 1 dashtype 6 lw 1 notitle


