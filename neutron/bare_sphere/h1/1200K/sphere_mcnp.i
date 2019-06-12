1 MeV neutrons in room temp hydrogen
100   1    1.0       -10                  imp:n=1
101   0              -15 10               imp:n=1
999   0              15                   imp:n=0

10   so    1.0
15   so    10.0

mode   n
nps    2e8
sdef   pos = 0 0 0  erg = 1.0
c
m1     1001.83c   1.0
c
f01:n   10
f02:n   10
c
e0      1e-9 100ilog 1.0
c in MeV in each cell
tmp 1.0341e-7 1.0341e-7 1.0341e-7
c
phys:n  2j 1 2j
prdmp   j  1e6 1 1
