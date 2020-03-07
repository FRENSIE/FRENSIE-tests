10.0 MeV photons in room temp water
100   1    -1.0       -1          imp:n=1
101   1    -1.0       -2  1       imp:n=1
102   1    -1.0       -3  2       imp:n=1
103   1    -1.0       -4  3       imp:n=1
104   1    -1.0       -5  4       imp:n=1
105   1    -1.0       -10 5       imp:n=1
106   1    -1.0       -11 10      imp:n=1
107   1    -1.0       -12 11      imp:n=1
108   1    -1.0       -13 12      imp:n=1
109   1    -1.0       -14 13      imp:n=1
110   1    -1.0       -15 14      imp:n=1
999   0               +15         imp:n=0

1    so    1.0
2    so    2.0
3    so    3.0
4    so    4.0
5    so    5.0
10   so    10.0
11   so    20.0
12   so    30.0
13   so    40.0
14   so    50.0
15   so    5000.0

mode p
nps    1e8
sdef   pos = 0 0 0   erg = 0.5
c
m1     1000.12p   2.0   8000.12p 1.0
c
f02:p  1 2 3 4 5 10 11 12 13 14
e0     1e-3 998i 0.5
c
phys:p j  1  0 0  1
prdmp  j  1e7  1   1
