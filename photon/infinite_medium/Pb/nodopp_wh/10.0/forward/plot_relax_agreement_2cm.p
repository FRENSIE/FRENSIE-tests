file1 = "infinite_medium_s3_relax_data.out"
set terminal post eps enh color
set output "pb_infinite_medium_relax_flux_2cm.eps"
set multiplot layout 2,1 rowsfirst
set tmargin at screen 0.97
set bmargin at screen 0.53
set lmargin at screen 0.10
set rmargin at screen 0.95
unset title
unset xlabel
set logscale y
set ylabel "Relaxation Current Spectrum" offset -1, 0
set format y "10^{%L}"
set format x ""
set grid
set yrange[0:1e10]
set xrange[0.072:0.09]
set boxwidth 0.00005
set style fill solid
set style textbox opaque noborder
set label 1 "KL_2" at 7.25e-2,1e5 font ",8"
set label 2 "KL_3" at 7.55e-2,1e5 font ",8"
set label 3 "KM_2" at 8.42e-2,2e4 font ",8"
set label 4 "KM_3" at 8.53e-2,3e4 font ",8"
set label 5 "KM_4" at 8.533e-2,7e2 font ",6"
set label 6 "KM_5" at 8.59e-2,7e2 font ",6"
set label 7 "KN_2" at 8.70e-2,6e3 font ",8"
set label 8 "KN_3" at 8.775e-2,7e3 font ",8"
plot file1 using 3:5 with boxes lc rgb"black" title "MCNP6", file1 using 3:4 with boxes lc rgb"red" title "FRENSIE"
#
set tmargin at screen 0.53
set bmargin at screen 0.1
set lmargin at screen 0.10
set rmargin at screen 0.95
unset key
unset logscale y
set format x "%4.3f"
set format y "%3.2f"
set xlabel "Energy (MeV)"
set ylabel "F/M" offset 1, 0
set yrange[0.90:1.10]
set ytics( '' 0.90, 0.95, 1.0, 1.05, '' 1.10 )
plot file1 using 1:6 with points lc rgb"black" pt 7 ps 0.25, file1 using 1:6:7 with error lc rgb"black" lt 1 lw 1 pt 7 ps 0.25
#
unset multiplot