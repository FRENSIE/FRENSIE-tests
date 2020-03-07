10.0 MeV photons in room temp water
100   1    -1.0       10 -11 -12           imp:n=1
101   0               -15 (-10:11:12)      imp:n=1
999   0               15                   imp:n=0

10   pz    -500.0
11   pz    500.0
12   cz   0.01
15   so    10000.0

mode p
nps    1e8
sdef   pos = 0 0 -501   dir = 1  vec = 0 0 1  erg = 0.5
c
m1     1000.12p   1.0
c
f01:p  12
f02:p  12
fs01 -10 -11 T
fs02 -10 -11 T
sd02 62.83185307179587 62.83185307179587 62.83185307179587 62.83185307179587 
e0   1e-3 998i 0.5
ft1    INC
fu1    0 1 10
ft2    INC
fu2    0 1 10
c
phys:p 100  1 0 0 1
prdmp  j  1e7  1   1
