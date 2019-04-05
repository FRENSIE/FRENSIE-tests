file1 = "relax_data.out"
set terminal post eps enh color
set output "pb_broomstick_relax_current.eps"
set multiplot layout 2,1 rowsfirst
set tmargin at screen 0.97
set bmargin at screen 0.53
set lmargin at screen 0.10
set rmargin at screen 0.95
unset title
unset xlabel
set ylabel "Relaxation Current Spectrum" offset 1, 0
set format x ""
set grid
set yrange[0:14000]
set xrange[0.055:0.1]
set boxwidth 0.0001
set style fill solid
set label 1 "KL_2" at 7.18e-2,12000 font ",8"
set label 2 "KL_3" at 7.55e-2,10100 font ",8"
set label 3 "KM_2" at 8.32e-2,2500 font ",8"
set label 4 "KM_3" at 8.55e-2,4900 font ",8"
set label 5 "KN_2" at 8.62e-2,600 font ",8"
set label 6 "KN_3" at 8.78e-2,1200 font ",8"
plot file1 using 3:5 with boxes lc rgb"black" title "MCNP6", file1 using 3:4 with boxes lc rgb"red" title "FRENSIE"
#
set tmargin at screen 0.53
set bmargin at screen 0.1
set lmargin at screen 0.10
set rmargin at screen 0.95
unset key
set format x "%4.3f"
set format y "%3.2f"
set xlabel "Energy (MeV)"
set ylabel "C/R"
set yrange[0.80:1.20]
set ytics( '' 0.90, 0.95, 1.0, 1.05, '' 1.10 )
plot file1 using 1:6 with points lc rgb"black" pt 7 ps 0.25, file1 using 1:6:7 with error lc rgb"black" lt 1 lw 1 pt 7 ps 0.25
#
unset multiplot