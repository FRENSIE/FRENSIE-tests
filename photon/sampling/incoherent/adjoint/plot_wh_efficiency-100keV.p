file1 = "1-kn-0.1.txt"
file2 = "13-wh-0.1.txt"
file3 = "82-wh-0.1.txt"
set terminal post eps enh color
set output "wh_eff-100keV.eps"
set xlabel "Energy (MeV)"
set ylabel "Efficiency"
set logscale x
set format x "10^{%L}"
set format y "%2.2f"
#set key top left
unset key
set grid
set xrange[1e-3:1e-1]
set yrange[0.5:1.01]
set label 1 "Free Electron" at 3e-2, 0.98
set label 2 "Al" at 5e-2, 0.92
set label 3 "Pb" at 5e-2, 0.82
plot file1 using 1:4 with line lc rgb"black" lt 1 lw 1, file2 using 1:4 with line lc rgb"red" lt 1 dashtype 6 lw 1, file3 using 1:4 with line lc rgb"blue" lt 1 dashtype 8 lw 1