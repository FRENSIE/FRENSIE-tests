file = "dose_rates.out"
set terminal post eps enh color
set output "dose_rates.eps"
set xlabel "D (cm)"
set ylabel "Effective Dose Rate (nSv/hr)"
set format x "%2.0f"
set format y "10^{%L}"
set yrange[0.001:10.0]
set xrange[-1.0:71.0]
set logscale y
set key right top
set grid
set bars 3
plot file using 1:2 with points lc rgb"black" pt 7 ps 1.0 title "WH-Forward", file using 1:2:3 with error lc rgb"black" lt 1 lw 1 pt 7 ps 1.0 notitle, file using 1:4 with points lc rgb"red" pt 6 ps 1.0 title "WH-Adjoint", file using 1:4:5 with error lc rgb"red" lt 1 lw 1 pt 6 ps 1.0 notitle, file using 1:6 with points lc rgb"black" pt 5 ps 1.0 title "IA-Forward", file using 1:6:7 with error lc rgb"black" lt 1 lw 1 pt 5 ps 1.0 notitle, file using 1:6 with points lc rgb"red" pt 4 ps 1.0 title "IA-Adjoint", file using 1:6:7 with error lc rgb"red" lt 1 lw 1 pt 4 ps 1.0 notitle, file using 1:8 with points lc rgb"black" pt 3 ps 1.0 title "Hybrid-Dopp-Forward", file using 1:8:9 with error lc rgb"black" lt 1 lw 1 pt 3 ps 1.0 notitle, file using 1:10 with points lc rgb"black" pt 9 ps 1.0 title "Dopp-Consistent-Forward", file using 1:10:11 with error lc rgb"black" lt 1 lw 1 pt 9 ps 1.0 notitle, file using 1:12 with points lc rgb"red" pt 8 ps 1.0 title "Dopp-Consistent-Adjoint", file using 1:12:13 with error lc rgb"red" lt 1 lw 1 pt 8 ps 1.0 notitle