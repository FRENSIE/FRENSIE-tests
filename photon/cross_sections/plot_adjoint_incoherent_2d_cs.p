set terminal post eps enh color
set output "adjoint_incoherent_2d_cs.eps"
#set terminal qt
#set output "adjoint_incoherent_2d_cs.png"
#
# XY View
#
set pm3d map
set size square
#set xyplane relative 0
set xlabel "Energy (MeV)"
set ylabel "Max Energy (MeV)" offset -3, 0
set cblabel "Cross Section (b)" offset 2, 0
#unset zlabel
#unset ztics
set logscale x
set logscale y
# set logscale z
# set logscale cb
#set ticslevel 0
set format x "10^{%L}"
set format y "10^{%L}"
# set format cb "10^{%L}"
# set format z "10^{%L}"
#set pm3d ftriangles corners2color c4
#set pm3d implicit at b
set palette rgbformulae 22,13,-31
unset key
set arrow from 1e-3,0.1 to 0.1,0.1 nohead lc rgb"red" dashtype 3 lw 2 front
set arrow from 1e-3,1.0 to 1.0,1.0 nohead lc rgb"red" dashtype 3 lw 2 front
splot "adjoint_incoherent_h_cs.txt" using 1:2:3:3 with pm3d, "adjoint_incoherent_h_cs.txt" every :500 using 1:2:3:3 with lines lc rgb"black" lt 1 dashtype 2 lw 1
pause -1
#set view equal xyz
# set terminal png
# set output "adjoint_incoherent_cs.png"
# #
# # XZ View
# #
# set xlabel "E (MeV)" offset 0,-2
# set xtics axis offset 0,-1
# unset ytics
# unset ylabel
# set zlabel "CS (cm^{-2})" rotate by 90
# set logscale x
# set logscale y
# set logscale z
# set logscale cb
# set ticslevel 0
# set format x "10^{%L}" 
# set format y "10^{%L}"
# set format cb "10^{%L}"
# set format z "10^{%L}"
# set view 90,0
# set pm3d ftriangles corners2color c4
# set palette rgbformulae 22,13,-31
# unset key
# splot "adjoint_incoherent_h_cs.txt" using 1:2:3:3 with pm3d, "adjoint_incoherent_h_cs.txt" using 1:2:3:3 with linespoints pt 7 ps 0.25
#
# YZ View
#
# unset xlabel
# unset xtics
# set ylabel "Max E (MeV)" offset 0,-2
# set ytics axis offset 0,-1
# set zlabel "CS (cm^{-2})" rotate by 90
# set logscale x
# set logscale y
# set logscale z
# set logscale cb
# set ticslevel 0
# set format x "10^{%L}" 
# set format y "10^{%L}"
# set format cb "10^{%L}"
# set format z "10^{%L}"
# set view 90,90
# set pm3d ftriangles corners2color c4
# set palette rgbformulae 22,13,-31
# unset key
# splot "adjoint_incoherent_h_cs.txt" using 1:2:3:3 with pm3d, "adjoint_incoherent_h_cs.txt" using 1:2:3:3 with linespoints pt 7 ps 0.25
# #
# # XY View
# #
# set view 0,0
# set xlabel "E (MeV)" offset 0,2
# set ylabel "Max E (MeV)" offset 0,-5 rotate parallel
# unset zlabel
# unset ztics
# set logscale x
# set logscale y
# # set logscale z
# # set logscale cb
# set ticslevel 0
# set format x "10^{%L}" 
# set format y "10^{%L}"
# # set format cb "10^{%L}"
# # set format z "10^{%L}"
# #set pm3d ftriangles corners2color c4
# set palette rgbformulae 22,13,-31
# unset key
# splot "adjoint_incoherent_h_cs.txt" using 1:2:3:3 with pm3d
#, "adjoint_incoherent_h_cs.txt" using 1:2:3:3 with linespoints pt 7 ps 0.25
#
# ISO View
#
# set view 30,60
# set xlabel "E (MeV)" offset 0,2
# set xtics offset 0.5,-0.5
# set ylabel "Max E (MeV)" offset 0,1
# set ytics offset 0.5,0
# set zlabel "CS (b)" rotate by 90
# set logscale x
# set logscale y
# #set logscale z
# #set logscale cb
# set ticslevel 0
# set format x "10^{%L}" 
# set format y "10^{%L}"
# #set format cb "10^{%L}"
# #set format z "10^{%L}"
# #set pm3d ftriangles corners2color c4
# set palette rgbformulae 22,13,-31
# unset key
# splot "adjoint_incoherent_h_cs.txt" using 1:2:3:3 with pm3d
# #, "adjoint_incoherent_h_cs.txt" using 1:2:3:3 with linespoints pt 7 ps 0.25
