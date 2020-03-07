ti1 = "FRENSIE-Dopp-Hybrid"
ti2 = "FRENSIE-Dopp-Consistent"
fil = "pb_infinite_medium_flux_all_dist.eps"
set terminal post eps enh color
set output fil
set xlabel "Energy (MeV)"
set ylabel "Flux Spectrum"
set format x "%1.2f"
set format y "%1.1f"
set yrange[0.0:1200.0]
set xrange[0.04:0.1]
set key left top
set grid
set label 1 "1cm" at 0.077,415.0
set label 2 "2cm" at 0.077,130.0
set label 3 "3cm" at 0.077,63.0
#set label 4 "4cm" at 0.077,0.08
plot "infinite_medium_dh_e1_s1_data.out" using 6:7 with line lc rgb"black" lt 1 lw 1 title ti1, "infinite_medium_dh_e1_s3_data.out" using 6:7 with line lc rgb"black" lt 1 lw 1 notitle, "infinite_medium_dh_e1_s6_data.out" using 6:7 with line lc rgb"black" lt 1 lw 1 notitle, "infinite_medium_dh_e1_s9_data.out" using 6:7 with line lc rgb"black" lt 1 lw 1 notitle, "infinite_medium_dc_e1_s1_data.out" using 6:7 with line lc rgb"red" lt 1 dashtype 6 lw 1 title ti2, "infinite_medium_dc_e1_s3_data.out" using 6:7 with line lc rgb"red" lt 1 dashtype 6 lw 1 notitle, "infinite_medium_dc_e1_s6_data.out" using 6:7 with line lc rgb"red" lt 1 dashtype 6 lw 1 notitle, "infinite_medium_dc_e1_s9_data.out" using 6:7 with line lc rgb"red" lt 1 dashtype 6 lw 1 notitle
 
