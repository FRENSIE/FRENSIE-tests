fil = "cont_soil_effective_dose_spectrum.eps"
set terminal post eps enh color
set output fil
set xlabel "Energy (MeV)"
set ylabel "Effective Dose Rate\nnSv h^{-1} MeV^{-1}"
set logscale y
# set format x "%1.2f"
# set format y "%1.1f"
#set yrange[0.0:3.0]
# set key right top
set grid
# set label 1 "1cm" at 0.075,1.09
# set label 2 "2cm" at 0.075,0.80
# set label 3 "3cm" at 0.075,0.38
# set label 4 "4cm" at 0.075,0.08
plot "cont_soil_adjoint_e2_s13_data.out" using 6:7 with line lc rgb"black" lt 1 lw 1 notitle


