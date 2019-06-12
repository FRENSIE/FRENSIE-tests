1 MeV neutrons in room temp hydrogen
100   1     -0.9981207  -10               imp:n=1
101   0              -15 10               imp:n=1
999   0              15                   imp:n=0

10   so    30.0 
15   so    32.0

mode   n
nps    2e8
sdef   pos = 0 0 0  erg = 10.0
c
m1   1001.80c -0.111894 8016.80c -0.888106
c 1 surface current 2 surface flux on surface 10
f01:n   10
f02:n   10
c bins 
e0      1e-9 1e-4 100ilog 10.0
c
phys:n  2j 1 2j
prdmp   j  1e6 1 1
c tmp 2.1543e-07 2.1543e-07 2.1543e-07  temp in MeV in each cell
