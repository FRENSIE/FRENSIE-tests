c //-------------------------------------------------------------------------//
c
c sample_cargo_container.i
c
c This is a sample cargo container MCNP input file for the DNDO project
c HEU detection under John Santarius and Douglass Henderson. This file is to
c be modified using the provided translations to sample various configurations
c of detectors and HEU locations.
c
c //-----------------//
c   Modification Log
c //-----------------//
c
c 4/12/2017 - Eli Moll
c    + Constructed initial file for scoping of uncertainty and time requirements
c
c //-------------------------------------------------------------------------//
c
c
c //-------------------------------------------------------------------------//
c
c                                   CELL CARDS
c
c //-------------------------------------------------------------------------//
c
c
c //--- Container Cells ---//
c
 1   1  -0.001205   -1 2 10 11 12 13 14        $ Air boundary of the system
 2   3  -8.000000   -2 3                       $ Shipping container steel walls
 3   1  -0.001205   -3 4                       $ Interior of shipping container
c
c
c //--- Highly Enriched Uranium Cells ---//
c
 4   4  -18.72476   -4                         $ HEU sphere (~10kg -> 5cm)
c
c
c //--- Tally Cells ---//
c
 10  1  -0.001205  -10                         $ NW detector (10cm x 10cm x 10cm
 11  1  -0.001205  -11                         $ NE detector (10cm x 10cm x 10cm
 12  1  -0.001205  -12                         $ Central detector (10cm x 10cm x
 13  1  -0.001205  -13                         $ SW detector (10cm x 10cm x 10cm
 14  1  -0.001205  -14                         $ SE detector (10cm x 10cm x 10cm
c
 99  0              1                          $ Graveyard

c //-------------------------------------------------------------------------//
c
c                                 SURFACE CARDS
c
c //-------------------------------------------------------------------------//
c
c
c //--- Container Surfaces ---//
c
 1 RPP -75   75    -75   75    -75   75        $ Bounding system geometry (150cm
 2 RPP -52.5 52.5  -52.5 52.5  -52.5 52.5      $ Exterior bound of cargo contain
 3 RPP -50   50    -50   50    -50   50        $ Interior of cargo container (10
c
c
c //--- Highly Enriched Uranium Surfaces ---//
c
 4 1 SPH 0 0 0  6.3                              $ 5cm radius HEU sphere ~ 10kg
c
c *Note: Translation 1 is used for the HEU sphere such that it can be easily
c        moved throughout the geometry without modifying the governing surface
c        definitions.
c
c
c //--- Tally Surfaces ---//
c
 10 10 RPP  -5 5 -10 10 -10 10                   $ Detector 1 - (10cm x 10cm x 1
 11 11 RPP  -5 5 -10 10 -10 10                   $ Detector 2 - (10cm x 10cm x 1
 12 12 RPP  -5 5 -10 10 -10 10                   $ Detector 3 - (10cm x 10cm x 1
 13 13 RPP  -5 5 -10 10 -10 10                   $ Detector 4 - (10cm x 10cm x 1
 14 14 RPP  -5 5 -10 10 -10 10                   $ Detector 5 - (10cm x 10cm x 1
c
c *Note: Translations (10,11,12,13,14) are used for the detectors such that
c        they can be moved/reoriented depending on our findings on optimal
c        locations
c

c //-------------------------------------------------------------------------//
c
c                                   DATA CARDS
c
c //-------------------------------------------------------------------------//
c
c
c //--- Run Parameters ---//
c
 MODE N
 CTME 200000
c
c VOID
c NPS 10000000
c
 IMP:N 1 8r 0
c
 CUT:N 2e7                                     $ Cutoff particles after two seco
c
c
c //--- Translations ---//
c
 TR1   0 0 0                               $ Translation for HEU sphere
c
 TR10 57.5  35  35                             $ Translation for NW detector
 TR11 57.5 -35  35                             $ Translation for NE detector
 TR12 57.5   0   0                             $ Translation for central detecto
 TR13 57.5  35 -35                             $ Translation for SW detector
 TR14 57.5 -35 -35                             $ Translation for SE detector
c
c
c //--- Tallies ---//
c
c
 T0 1e7 1.2e7 1.4e7 1.6e7 1.8e7 2.0e7                   $ Time bins for all tall
c
c Track-Length Flux Tallies
c
 F4:N  10                                      $ Track-Length tally for NW detec
 F14:N 11                                      $ Track-Length tally for NE detec
 F24:N 12                                      $ Track-Length tally for central
 F34:N 13                                      $ Track-Length tally for SW detec
 F44:N 14                                      $ Track-Length tally for SE detec
c
c Point Detector Tallies
c
c F5:N  55  35  35   5                          $ Point detector for NW detector
c F15:N 55 -35  35   5                          $ Point detector for NE detector
c F25:N 55   0   0   5                          $ Point detector for central det
c F35:N 55  35 -35   5                          $ Point detector for SW detector
c F45:N 55 -35 -35   5                          $ Point detector for SE detector
c
c
c Source sampling verification mesh tally
c
c FMESH4:N GEOM=XYZ ORIGIN= -56 -50 -50
c           IMESH=-54  IINTS=1
c           JMESH=50   JINTS=100
c           KMESH=50   KINTS=100
c
c
c //--- Source Definition ---//
c
 SDEF  POS=D1  EXT=FPOS=D2  ERG=14.1  AXS=FPOS=D3  TME=D8
c
 SI1 L  -55 -27 -40     -55 -40 -27            $ Position distribution
 SP1     1               1
c * added by ADVANTG
sb1    4.74245e-01 5.25755e-01
c
 DS2 S   D4              D5                    $ Dependent extent distributions
c
 SI4 H    0   67                               $ 67cm long source
 SP4 D  0   1                                  $   - Uniform sampling
c
 SI5 H    0   67                               $ 67cm long source
 SP5 D  0   1                                  $   - Uniform sampling
c
 DS3 S   D6              D7                    $ Dependent axis distributions
c
 SI6 L  0  1  0                                $ Horizontal source axis
 SP6    1
c
 SI7 L  0  0  1                                $ Vertical source axis
 SP7    1
c
 SI8 H    0   1e7                              $ Time is in shakes (1e-8 sec = 1
 SP8    0   1
c                                              $ Thus 100ms = 0.1s = 1e7 shakes
c
c //--- Material Definitions ---//
c
c *Note: Material definitions taken from the Pacific Northwest Nuclear
c        Laboratory (PNNL) "Compendium of Material Composition Data for
c        Radiation Transport Modeling" - Revision 1, 2011. The file can be
c        locatd at the following URL for reference:
c
c  URL: http://www.pnnl.gov/main/publications/external/technical_reports/pnnl-15
c
c
c Material: Air (Dry, Sea Level)
c Density:  0.001205 g/cc
c
 M1     6000   0.000150
        7014   0.784431
        8016   0.210748
       18000   0.004671
c
c
c Material: Water (Light, T=293K)
c Density:  0.998207 g/cc
c
 M2     1001   0.666657
        8016   0.333343
c
c
c Material: Steel (Stainless 304)
c Density:  8.000000 g/cc
c
 M3     6000   0.001830
       14000   0.009781
       15031   0.000408
       16000   0.000257
       24000   0.200762
       25055   0.010001
       26000   0.690375
       28000   0.086587
c
c
c Material: Uranium Metal (Pure U235)
c Density:  18.72476 g/cc
c
 M4    92235   1.000000
c
c * added by ADVANTG
wwp:n 5.0 j 100 j -1 0 2.174919957e-01