          Code Name & Version = MCNP, 6.1.1b
  
     _/      _/        _/_/_/       _/      _/       _/_/_/         _/_/_/
    _/_/  _/_/      _/             _/_/    _/       _/    _/     _/       
   _/  _/  _/      _/             _/  _/  _/       _/_/_/       _/_/_/    
  _/      _/      _/             _/    _/_/       _/           _/    _/   
 _/      _/        _/_/_/       _/      _/       _/             _/_/      
  
  +---------------------------------------------------------------------+
  | Copyright 2008. Los Alamos National Security, LLC.  All rights      |
  | reserved.                                                           |
  |   This material was produced under U.S. Government contract         |
  | DE-AC52-06NA25396 for Los Alamos National Laboratory, which is      |
  | operated by Los Alamos National Security, LLC, for the U.S.         |
  | Department of Energy. The Government is granted for itself and      |
  | others acting on its behalf a paid-up, nonexclusive, irrevocable    |
  | worldwide license in this material to reproduce, prepare derivative |
  | works, and perform publicly and display publicly. Beginning five    |
  | (5) years after 2008, subject to additional five-year worldwide     |
  | renewals, the Government is granted for itself and others acting on |
  | its behalf a paid-up, nonexclusive, irrevocable worldwide license   |
  | in this material to reproduce, prepare derivative works, distribute |
  | copies to the public, perform publicly and display publicly, and to |
  | permit others to do so. NEITHER THE UNITED STATES NOR THE UNITED    |
  | STATES DEPARTMENT OF ENERGY, NOR LOS ALAMOS NATIONAL SECURITY, LLC, |
  | NOR ANY OF THEIR EMPLOYEES, MAKES ANY WARRANTY, EXPRESS OR IMPLIED, |
  | OR ASSUMES ANY LEGAL LIABILITY OR RESPONSIBILITY FOR THE ACCURACY,  |
  | COMPLETENESS, OR USEFULNESS OF ANY INFORMATION, APPARATUS, PRODUCT, |
  | OR PROCESS DISCLOSED, OR REPRESENTS THAT ITS USE WOULD NOT INFRINGE |
  | PRIVATELY OWNED RIGHTS.                                             |
  +---------------------------------------------------------------------+
  
1mcnp     version 6     ld=06/19/14                     08/05/17 17:13:59 
 *************************************************************************                 probid =  08/05/17 17:13:59 
 n=inp wwinp=wwinp tasks 20                                                      

 
  warning.  Physics models disabled.
         1-       c //-------------------------------------------------------------------------// 
         2-       c                                                                               
         3-       c sample_cargo_container.i                                                      
         4-       c                                                                               
         5-       c This is a sample cargo container MCNP input file for the DNDO project         
         6-       c HEU detection under John Santarius and Douglass Henderson. This file is to    
         7-       c be modified using the provided translations to sample various configurations  
         8-       c of detectors and HEU locations.                                               
         9-       c                                                                               
        10-       c //-----------------//                                                         
        11-       c   Modification Log                                                            
        12-       c //-----------------//                                                         
        13-       c                                                                               
        14-       c 4/12/2017 - Eli Moll                                                          
        15-       c    + Constructed initial file for scoping of uncertainty and time requirements
        16-       c                                                                               
        17-       c //-------------------------------------------------------------------------// 
        18-       c                                                                               
        19-       c                                                                               
        20-       c //-------------------------------------------------------------------------// 
        21-       c                                                                               
        22-       c                                   CELL CARDS                                  
        23-       c                                                                               
        24-       c //-------------------------------------------------------------------------// 
        25-       c                                                                               
        26-       c                                                                               
        27-       c //--- Container Cells ---//                                                   
        28-       c                                                                               
        29-        1   1  -0.001205   -1 2 10 11 12 13 14        $ Air boundary of the system     
        30-        2   3  -8.000000   -2 3                       $ Shipping container steel walls 
        31-        3   1  -0.001205   -3 4                       $ Interior of shipping container 
        32-       c                                                                               
        33-       c                                                                               
        34-       c //--- Highly Enriched Uranium Cells ---//                                     
        35-       c                                                                               
        36-        4   4  -18.72476   -4                         $ HEU sphere (~10kg -> 5cm)      
        37-       c                                                                               
        38-       c                                                                               
        39-       c //--- Tally Cells ---//                                                       
        40-       c                                                                               
        41-        10  1  -0.001205  -10                         $ NW detector (10cm x 10cm x 10cm
        42-        11  1  -0.001205  -11                         $ NE detector (10cm x 10cm x 10cm
        43-        12  1  -0.001205  -12                         $ Central detector (10cm x 10cm x
        44-        13  1  -0.001205  -13                         $ SW detector (10cm x 10cm x 10cm
        45-        14  1  -0.001205  -14                         $ SE detector (10cm x 10cm x 10cm
        46-       c                                                                               
        47-        99  0              1                          $ Graveyard                      
        48-                                                                                       
        49-       c //-------------------------------------------------------------------------// 
        50-       c                                                                               
        51-       c                                 SURFACE CARDS                                 
        52-       c                                                                               
        53-       c //-------------------------------------------------------------------------// 
        54-       c                                                                               
        55-       c                                                                               
        56-       c //--- Container Surfaces ---//                                                
        57-       c                                                                               
        58-        1 RPP -75   75    -75   75    -75   75        $ Bounding system geometry (150cm
        59-        2 RPP -52.5 52.5  -52.5 52.5  -52.5 52.5      $ Exterior bound of cargo contain
        60-        3 RPP -50   50    -50   50    -50   50        $ Interior of cargo container (10
        61-       c                                                                               
        62-       c                                                                               
        63-       c //--- Highly Enriched Uranium Surfaces ---//                                  
        64-       c                                                                               
        65-        4 1 SPH 0 0 0  5                              $ 5cm radius HEU sphere ~ 10kg U 
        66-       c                                                                               
        67-       c *Note: Translation 1 is used for the HEU sphere such that it can be easily    
        68-       c        moved throughout the geometry without modifying the governing surface  
        69-       c        definitions.                                                           
        70-       c                                                                               
        71-       c                                                                               
        72-       c //--- Tally Surfaces ---//                                                    
        73-       c                                                                               
        74-        10 10 RPP  -5 5 -10 10 -10 10                   $ Detector 1 - (10cm x 10cm x 1
        75-        11 11 RPP  -5 5 -10 10 -10 10                   $ Detector 2 - (10cm x 10cm x 1
        76-        12 12 RPP  -5 5 -10 10 -10 10                   $ Detector 3 - (10cm x 10cm x 1
        77-        13 13 RPP  -5 5 -10 10 -10 10                   $ Detector 4 - (10cm x 10cm x 1
        78-        14 14 RPP  -5 5 -10 10 -10 10                   $ Detector 5 - (10cm x 10cm x 1
        79-       c                                                                               
        80-       c *Note: Translations (10,11,12,13,14) are used for the detectors such that     
        81-       c        they can be moved/reoriented depending on our findings on optimal      
        82-       c        locations                                                              
        83-       c                                                                               
        84-                                                                                       
        85-       c //-------------------------------------------------------------------------// 
        86-       c                                                                               
        87-       c                                   DATA CARDS                                  
        88-       c                                                                               
        89-       c //-------------------------------------------------------------------------// 
        90-       c                                                                               
        91-       c                                                                               
        92-       c //--- Run Parameters ---//                                                    
        93-       c                                                                               
        94-        MODE N                                                                         
        95-        CTME 200000                                                                    
        96-       c                                                                               
        97-       c VOID                                                                          
        98-       c NPS 10000000                                                                  
        99-       c                                                                               
       100-        IMP:N 1 8r 0                                                                   
       101-       c                                                                               
       102-        CUT:N 2e7                                     $ Cutoff particles after two seco
       103-       c                                                                               
       104-       c                                                                               
       105-       c //--- Translations ---//                                                      
       106-       c                                                                               
       107-        TR1   0 0 0                               $ Translation for HEU sphere         
       108-       c                                                                               
       109-        TR10 57.5  35  35                             $ Translation for NW detector    
       110-        TR11 57.5 -35  35                             $ Translation for NE detector    
       111-        TR12 57.5   0   0                             $ Translation for central detecto
       112-        TR13 57.5  35 -35                             $ Translation for SW detector    
       113-        TR14 57.5 -35 -35                             $ Translation for SE detector    
       114-       c                                                                               
       115-       c                                                                               
       116-       c //--- Tallies ---//                                                           
       117-       c                                                                               
       118-       c                                                                               
       119-        T0 1e7 1.2e7 1.4e7 1.6e7 1.8e7 2.0e7                   $ Time bins for all tall
       120-       c                                                                               
       121-       c Track-Length Flux Tallies                                                     
       122-       c                                                                               
       123-        F4:N  10                                      $ Track-Length tally for NW detec
       124-        F14:N 11                                      $ Track-Length tally for NE detec
       125-        F24:N 12                                      $ Track-Length tally for central 
       126-        F34:N 13                                      $ Track-Length tally for SW detec
       127-        F44:N 14                                      $ Track-Length tally for SE detec
       128-       c                                                                               
       129-       c Point Detector Tallies                                                        
       130-       c                                                                               
       131-       c F5:N  55  35  35   5                          $ Point detector for NW detector
       132-       c F15:N 55 -35  35   5                          $ Point detector for NE detector
       133-       c F25:N 55   0   0   5                          $ Point detector for central det
       134-       c F35:N 55  35 -35   5                          $ Point detector for SW detector
       135-       c F45:N 55 -35 -35   5                          $ Point detector for SE detector
       136-       c                                                                               
       137-       c                                                                               
       138-       c Source sampling verification mesh tally                                       
       139-       c                                                                               
       140-       c FMESH4:N GEOM=XYZ ORIGIN= -56 -50 -50                                         
       141-       c           IMESH=-54  IINTS=1                                                  
       142-       c           JMESH=50   JINTS=100                                                
       143-       c           KMESH=50   KINTS=100                                                
       144-       c                                                                               
       145-       c                                                                               
       146-       c //--- Source Definition ---//                                                 
       147-       c                                                                               
       148-        SDEF  POS=D1  EXT=FPOS=D2  ERG=14.1  AXS=FPOS=D3  TME=D8                       
       149-       c                                                                               
       150-        SI1 L  -55 -27 -40     -55 -40 -27            $ Position distribution          
       151-        SP1     1               1                                                      
       152-       c * added by ADVANTG                                                            
       153-       sb1    4.73035e-01 5.26965e-01                                                  
       154-       c                                                                               
       155-        DS2 S   D4              D5                    $ Dependent extent distributions 
       156-       c                                                                               
       157-        SI4 H    0   67                               $ 67cm long source               
       158-        SP4 D  0   1                                  $   - Uniform sampling           
       159-       c                                                                               
       160-        SI5 H    0   67                               $ 67cm long source               
       161-        SP5 D  0   1                                  $   - Uniform sampling           
       162-       c                                                                               
       163-        DS3 S   D6              D7                    $ Dependent axis distributions   
       164-       c                                                                               
       165-        SI6 L  0  1  0                                $ Horizontal source axis         
       166-        SP6    1                                                                       
       167-       c                                                                               
       168-        SI7 L  0  0  1                                $ Vertical source axis           
       169-        SP7    1                                                                       
       170-       c                                                                               
       171-        SI8 H    0   1e7                              $ Time is in shakes (1e-8 sec = 1
       172-        SP8    0   1                                                                   
       173-       c                                              $ Thus 100ms = 0.1s = 1e7 shakes 
       174-       c                                                                               
       175-       c //--- Material Definitions ---//                                              
       176-       c                                                                               
       177-       c *Note: Material definitions taken from the Pacific Northwest Nuclear          
       178-       c        Laboratory (PNNL) "Compendium of Material Composition Data for         
       179-       c        Radiation Transport Modeling" - Revision 1, 2011. The file can be      
       180-       c        locatd at the following URL for reference:                             
       181-       c                                                                               
       182-       c  URL: http://www.pnnl.gov/main/publications/external/technical_reports/pnnl-15
       183-       c                                                                               
       184-       c                                                                               
       185-       c Material: Air (Dry, Sea Level)                                                
       186-       c Density:  0.001205 g/cc                                                       
       187-       c                                                                               
       188-        M1     6000   0.000150                                                         
       189-               7014   0.784431                                                         
       190-               8016   0.210748                                                         
       191-              18000   0.004671                                                         
       192-       c                                                                               
       193-       c                                                                               
       194-       c Material: Water (Light, T=293K)                                               
       195-       c Density:  0.998207 g/cc                                                       
       196-       c                                                                               
       197-        M2     1001   0.666657                                                         
  warning.  material        2 is not used in the problem.
       198-               8016   0.333343                                                         
       199-       c                                                                               
       200-       c                                                                               
       201-       c Material: Steel (Stainless 304)                                               
       202-       c Density:  8.000000 g/cc                                                       
       203-       c                                                                               
       204-        M3     6000   0.001830                                                         
       205-              14000   0.009781                                                         
       206-              15031   0.000408                                                         
       207-              16000   0.000257                                                         
       208-              24000   0.200762                                                         
       209-              25055   0.010001                                                         
       210-              26000   0.690375                                                         
       211-              28000   0.086587                                                         
       212-       c                                                                               
       213-       c                                                                               
       214-       c Material: Uranium Metal (Pure U235)                                           
       215-       c Density:  18.72476 g/cc                                                       
       216-       c                                                                               
       217-        M4    92235   1.000000                                                         
       218-       c                                                                               
       219-       c * added by ADVANTG                                                            
       220-       wwp:n 5.0 j 100 j -1 0 2.195443783e-01                                          
 
  comment.  total nubar used if fissionable isotopes are present.

 surface        2.1 and surface       10.2 are the same.       10.2 will be deleted.

 surface        2.1 and surface       11.2 are the same.       11.2 will be deleted.

 surface        2.1 and surface       12.2 are the same.       12.2 will be deleted.

 surface        2.1 and surface       13.2 are the same.       13.2 will be deleted.

 surface        2.1 and surface       14.2 are the same.       14.2 will be deleted.

 surface       10.1 and surface       11.1 are the same.       11.1 will be deleted.

 surface       10.1 and surface       12.1 are the same.       12.1 will be deleted.

 surface       10.1 and surface       13.1 are the same.       13.1 will be deleted.

 surface       10.1 and surface       14.1 are the same.       14.1 will be deleted.

 surface       10.3 and surface       13.3 are the same.       13.3 will be deleted.

 surface       10.4 and surface       13.4 are the same.       13.4 will be deleted.

 surface       10.5 and surface       11.5 are the same.       11.5 will be deleted.

 surface       10.6 and surface       11.6 are the same.       11.6 will be deleted.

 surface       11.3 and surface       14.3 are the same.       14.3 will be deleted.

 surface       11.4 and surface       14.4 are the same.       14.4 will be deleted.

 surface       13.5 and surface       14.5 are the same.       14.5 will be deleted.

 surface       13.6 and surface       14.6 are the same.       14.6 will be deleted.
 
  comment.          17 surfaces were deleted for being the same as others.

 reading mesh-based weight windows from file wwinp with probid =


 
  warning.  energy of top neutron weight-window bin set to emax.
1cells                                                                                                  print table 60

                               atom        gram                                            neutron                                     
              cell      mat   density     density     volume       mass            pieces importance                                   

        1        1        1  4.98947E-05 1.20500E-03 2.19738E+06 2.64784E+03           0  1.0000E+00                                   
        2        2        3  8.76840E-02 8.00000E+00 1.57625E+05 1.26100E+06           0  1.0000E+00                                   
        3        3        1  4.98947E-05 1.20500E-03 0.00000E+00 0.00000E+00           0  1.0000E+00                                   
        4        4        4  4.79746E-02 1.87248E+01 5.23599E+02 9.80426E+03           1  1.0000E+00                                   
        5       10        1  4.98947E-05 1.20500E-03 4.00000E+03 4.82000E+00           0  1.0000E+00                                   
        6       11        1  4.98947E-05 1.20500E-03 4.00000E+03 4.82000E+00           0  1.0000E+00                                   
        7       12        1  4.98947E-05 1.20500E-03 4.00000E+03 4.82000E+00           0  1.0000E+00                                   
        8       13        1  4.98947E-05 1.20500E-03 4.00000E+03 4.82000E+00           0  1.0000E+00                                   
        9       14        1  4.98947E-05 1.20500E-03 4.00000E+03 4.82000E+00           0  1.0000E+00                                   
       10       99        0  0.00000E+00 0.00000E+00 0.00000E+00 0.00000E+00           0  0.0000E+00                                   

 total                                               2.37552E+06 1.27348E+06

    minimum source weight = 9.4883E-01    maximum source weight = 1.0570E+00

 ***************************************************
 * Random Number Generator  =                    1 *
 * Random Number Seed       =       19073486328125 *
 * Random Number Multiplier =       19073486328125 *
 * Random Number Adder      =                    0 *
 * Random Number Bits Used  =                   48 *
 * Random Number Stride     =               152917 *
 ***************************************************

 
  comment.  threading will be used when possible in portions of mcnp6.
 
  comment.  threading will be used for n/p/e table physics.
 
  comment.  threading will generally not be used for model physics.

         3 warning messages so far.
1cross-section tables                                                                                   print table 100
     XSDIR used: /home/ecmartin3/software/mcnpdata/xsdir_mcnp6.1

     table    length

                        tables from file xdata/endf71x/C/6000.710nc                                      

   6000.80c   45022  C0 ENDF71x (jlconlin)  Ref. see jlconlin (ref 09/10/2012  10:00:53)          mat 600      12/20/12
                     Energy range:   1.00000E-11  to  1.50000E+02 MeV.
                     particle-production data for protons   being expunged from   6000.80c          
                     particle-production data for deuterons being expunged from   6000.80c          
                     particle-production data for alphas    being expunged from   6000.80c          

                        tables from file xdata/endf71x/N/7014.710nc                                      

   7014.80c   67470  N14 ENDF71x (jlconlin)  Ref. see jlconlin (ref 09/10/2012  10:00:53)         mat 725      12/16/12
                     Energy range:   1.00000E-11  to  1.50000E+02 MeV.
                     particle-production data for protons   being expunged from   7014.80c          
                     particle-production data for deuterons being expunged from   7014.80c          
                     particle-production data for alphas    being expunged from   7014.80c          

                        tables from file xdata/endf71x/O/8016.710nc                                      

   8016.80c  171194  O16 ENDF71x (jlconlin)  Ref. see jlconlin (ref 09/10/2012  10:00:53)         mat 825      12/13/12
                     Energy range:   1.00000E-11  to  1.50000E+02 MeV.
                     particle-production data for protons   being expunged from   8016.80c          
                     particle-production data for deuterons being expunged from   8016.80c          
                     particle-production data for tritons   being expunged from   8016.80c          
                     particle-production data for alphas    being expunged from   8016.80c          

                        tables from file xdata/endf60                                                    

  14000.60c   51392  14-si-nat from endf/b-vi                                                     mat1400      11/25/93
                     Energy range:   1.00000E-11  to  2.00000E+01 MeV.

                        tables from file xdata/endf71x/P/15031.710nc                                     

  15031.80c   24717  P31 ENDF71x (jlconlin)  Ref. see jlconlin (ref 09/10/2012  10:00:53)         mat1525      12/13/12
                     Energy range:   1.00000E-11  to  1.50000E+02 MeV.
                     particle-production data for protons   being expunged from  15031.80c          
                     particle-production data for deuterons being expunged from  15031.80c          
                     particle-production data for alphas    being expunged from  15031.80c          

                        tables from file xdata/actia                                                     

  16000.62c   68665  16-s-0 at 293.6K from endf/b-vi.8 njoy99.50                                  mat1600      12/06/01
                     Energy range:   1.00000E-11  to  2.00000E+01 MeV.

                        tables from file xdata/rmccsa                                                    

  18000.35c    2182      endl85                                                                   (  18)       11/01/85
                     Energy range:   1.00000E-10  to  2.00000E+01 MeV.
                     temperature = 0.0000E+00 adjusted to 2.5300E-08

                        tables from file xdata/rmccs                                                     

  24000.50c   89104  njoy                                                                       (  1324)      79/06/21.
                     Energy range:   1.00000E-11  to  2.00000E+01 MeV.
  26000.55c   84136  njoy                                                                       ( 260)       10/21/82  
                     Energy range:   1.00000E-11  to  2.00000E+01 MeV.
  28000.50c   82267  njoy                                                                       (  1328)      79/06/21.
                     Energy range:   1.00000E-11  to  2.00000E+01 MeV.

                        tables from file xdata/endf71x/Mn/25055.710nc                                    

  25055.80c  393441  Mn55 ENDF71x (jlconlin)  Ref. see jlconlin (ref 09/10/2012  10:00:53)        mat2525      12/18/12
                     Energy range:   1.00000E-11  to  6.00000E+01 MeV.
                     particle-production data for protons   being expunged from  25055.80c          
                     particle-production data for deuterons being expunged from  25055.80c          
                     particle-production data for tritons   being expunged from  25055.80c          
                     particle-production data for helions   being expunged from  25055.80c          
                     particle-production data for alphas    being expunged from  25055.80c          
                     probability tables used from 1.2500E-01 to 1.0000E+00 mev.

                        tables from file xdata/endf71x/U/92235.710nc                                     

  92235.80c  680846  U235 ENDF71x (jlconlin)  Ref. see jlconlin (ref 09/total nu 10:00:53)        mat9228      12/19/12
                     Energy range:   1.00000E-11  to  2.00000E+01 MeV.
                     probability tables used from 2.2500E-03 to 2.5000E-02 mev.

  total     1760436
 
  warning.  neutron energy cutoff is below some cross-section tables.
 
  comment.  1 cross sections modified by free gas thermal treatment.

1particles and energy limits                                                                            print table 101

                         particle      maximum       smallest      largest       always        always
                         cutoff        particle      table         table         use table     use model
   particle type         energy        energy        maximum       maximum       below         above

    1  n    neutron     0.0000E+00    1.0000E+36    2.0000E+01    1.5000E+02    1.0000E+36    1.0000E+36
 
  comment.  setting up hash-based fast table search for xsec tables

 ------------------------------------------------------------------------------------------
 =====> Set up arrays for hash-based fast table search for xsec data

    number of hash bins   =     8192
    max hash table energy =  1.00000E-11
    min hash table energy =  1.50000E+02

           nuclide      ne      emin        emax     ave_bins  min_bins  max_bins
            6000.80c    1326 1.00000E-11 1.50000E+02       1.2       1.0      12.0
            7014.80c    1826 1.00000E-11 1.50000E+02       1.2       1.0      19.0
            8016.80c    2917 1.00000E-11 1.50000E+02       1.4       1.0      34.0
           14000.60c    2824 1.00000E-11 2.00000E+01       1.3       1.0      53.0
           15031.80c     995 1.00000E-11 1.50000E+02       1.1       1.0      12.0
           16000.62c   10272 1.00000E-11 2.00000E+01       2.3       1.0     100.0
           18000.35c     259 1.00000E-10 2.00000E+01       1.0       1.0       3.0
           24000.50c   11050 1.00000E-11 2.00000E+01       2.3       1.0      98.0
           25055.80c   13802 1.00000E-11 6.00000E+01       2.7       1.0     147.0
           26000.55c    6899 1.00000E-11 2.00000E+01       1.8       1.0      23.0
           28000.50c    8927 1.00000E-11 2.00000E+01       2.1       1.0     111.0
           92235.80c   76518 1.00000E-11 2.00000E+01      10.3       1.0     200.0

 ------------------------------------------------------------------------------------------


 ***********************************************************************************************************************

 dump no.    1 on file inpr     nps =           0     coll =              0     ctm =        0.00   nrn =               
  0

         4 warning messages so far.

 ***********************************************************************************************************************

 dump no.    2 on file inpr     nps =   111077293     coll =      221967838     ctm =     1200.25   nrn =       
 3367820015

 ***********************************************************************************************************************

 dump no.    3 on file inpr     nps =   222736438     coll =      445067407     ctm =     2400.59   nrn =       
 6752890388

 ***********************************************************************************************************************

 dump no.    4 on file inpr     nps =   334810047     coll =      669067478     ctm =     3600.96   nrn =      
 10151151200

 ***********************************************************************************************************************

 dump no.    5 on file inpr     nps =   446416859     coll =      892009060     ctm =     4801.26   nrn =      
 13534102542

 ***********************************************************************************************************************

 dump no.    6 on file inpr     nps =   558455650     coll =     1115880630     ctm =     6001.52   nrn =      
 16930714711

 ***********************************************************************************************************************

 dump no.    7 on file inpr     nps =   670437271     coll =     1339576778     ctm =     7201.82   nrn =      
 20324958102

 ***********************************************************************************************************************

 dump no.    8 on file inpr     nps =   782007019     coll =     1562568971     ctm =     8402.11   nrn =      
 23707911120

 ***********************************************************************************************************************

 dump no.    9 on file inpr     nps =   894032671     coll =     1786517692     ctm =     9602.38   nrn =      
 27105211307

 ***********************************************************************************************************************

 dump no.   10 on file inpr     nps =  1006080992     coll =     2010336233     ctm =    10802.72   nrn =      
 30501373417

 ***********************************************************************************************************************

 dump no.   11 on file inpr     nps =  1118106848     coll =     2234294742     ctm =    12003.09   nrn =      
 33898738755

 ***********************************************************************************************************************

 dump no.   12 on file inpr     nps =  1229616192     coll =     2457164506     ctm =    13203.42   nrn =      
 37279797694

 ***********************************************************************************************************************

 dump no.   13 on file inpr     nps =  1341660672     coll =     2681114322     ctm =    14403.75   nrn =      
 40677347855

 ***********************************************************************************************************************

 dump no.   14 on file inpr     nps =  1453686528     coll =     2905074163     ctm =    15604.10   nrn =      
 44074820667

 ***********************************************************************************************************************

 dump no.   15 on file inpr     nps =  1565163584     coll =     3127850065     ctm =    16804.40   nrn =      
 47454693763

 ***********************************************************************************************************************

 dump no.   16 on file inpr     nps =  1677152192     coll =     3351706549     ctm =    18004.84   nrn =      
 50850653014

 ***********************************************************************************************************************

 dump no.   17 on file inpr     nps =  1789120624     coll =     3575486903     ctm =    19205.24   nrn =      
 54245700715

 ***********************************************************************************************************************

 dump no.   18 on file inpr     nps =  1900682432     coll =     3798423415     ctm =    20405.54   nrn =      
 57627992716

 ***********************************************************************************************************************

 dump no.   19 on file inpr     nps =  2012706736     coll =     4022357638     ctm =    21605.89   nrn =      
 61025169756

 ***********************************************************************************************************************

 dump no.   20 on file inpr     nps =  2124734144     coll =     4246243033     ctm =    22806.13   nrn =      
 64421823973

 ***********************************************************************************************************************

 dump no.   21 on file inpr     nps =  2236752240     coll =     4470198793     ctm =    24006.48   nrn =      
 67819074055

 ***********************************************************************************************************************

 dump no.   22 on file inpr     nps =  2347945280     coll =     4692484420     ctm =    25206.76   nrn =      
 71191150668

 ***********************************************************************************************************************

 dump no.   23 on file inpr     nps =  2459966480     coll =     4916401831     ctm =    26407.02   nrn =      
 74588121843

 ***********************************************************************************************************************

 dump no.   24 on file inpr     nps =  2572004752     coll =     5140295057     ctm =    27607.31   nrn =      
 77984916513

 ***********************************************************************************************************************

 dump no.   25 on file inpr     nps =  2683555696     coll =     5363187812     ctm =    28807.68   nrn =      
 81366780761

 ***********************************************************************************************************************

 dump no.   26 on file inpr     nps =  2795613200     coll =     5587123789     ctm =    30008.00   nrn =      
 84764144376

 ***********************************************************************************************************************

 dump no.   27 on file inpr     nps =  2907636896     coll =     5811049835     ctm =    31208.38   nrn =      
 88161257542

 ***********************************************************************************************************************

 dump no.   28 on file inpr     nps =  3019211728     coll =     6034050140     ctm =    32408.68   nrn =      
 91544491840

 ***********************************************************************************************************************

 dump no.   29 on file inpr     nps =  3131267680     coll =     6257947764     ctm =    33608.96   nrn =      
 94941520615

 ***********************************************************************************************************************

 dump no.   30 on file inpr     nps =  3243320864     coll =     6481887026     ctm =    34809.27   nrn =      
 98339153807

 ***********************************************************************************************************************

 dump no.   31 on file inpr     nps =  3355355828     coll =     6705738153     ctm =    36009.57   nrn =     
 101735371295

 ***********************************************************************************************************************

 dump no.   32 on file inpr     nps =  3465476032     coll =     6925744972     ctm =    37209.90   nrn =     
 105073574918

 ***********************************************************************************************************************

 dump no.   33 on file inpr     nps =  3577555264     coll =     7149729779     ctm =    38410.33   nrn =     
 108471664231

 ***********************************************************************************************************************

 dump no.   34 on file inpr     nps =  3689634832     coll =     7373731816     ctm =    39610.67   nrn =     
 111870038790

 ***********************************************************************************************************************

 dump no.   35 on file inpr     nps =  3801214320     coll =     7596747090     ctm =    40810.95   nrn =     
 115253373825

 ***********************************************************************************************************************

 dump no.   36 on file inpr     nps =  3913302864     coll =     7820718440     ctm =    42011.29   nrn =     
 118651512504

 ***********************************************************************************************************************

 dump no.   37 on file inpr     nps =  4025290864     coll =     8044456418     ctm =    43211.63   nrn =     
 122046247185

 ***********************************************************************************************************************

 dump no.   38 on file inpr     nps =  4136789648     coll =     8267234718     ctm =    44412.03   nrn =     
 125426789370

 ***********************************************************************************************************************

 dump no.   39 on file inpr     nps =  4248852144     coll =     8491259275     ctm =    45612.35   nrn =     
 128825165662

 ***********************************************************************************************************************

 dump no.   40 on file inpr     nps =  4360906544     coll =     8715097844     ctm =    46812.61   nrn =     
 132221577424

 ***********************************************************************************************************************

 dump no.   41 on file inpr     nps =  4472965936     coll =     8939018266     ctm =    48012.90   nrn =     
 135618846067

 ***********************************************************************************************************************

 dump no.   42 on file inpr     nps =  4584441440     coll =     9161804873     ctm =    49213.21   nrn =     
 138998928432

 ***********************************************************************************************************************

 dump no.   43 on file inpr     nps =  4696438416     coll =     9385545645     ctm =    50413.66   nrn =     
 142393778746

 ***********************************************************************************************************************

 dump no.   44 on file inpr     nps =  4808469872     coll =     9609503180     ctm =    51613.95   nrn =     
 145791278383

 ***********************************************************************************************************************

 dump no.   45 on file inpr     nps =  4920054016     coll =     9832508440     ctm =    52814.22   nrn =     
 149174541295

 ***********************************************************************************************************************

 dump no.   46 on file inpr     nps =  5032158416     coll =    10056504194     ctm =    54014.58   nrn =     
 152573078193

 ***********************************************************************************************************************

 dump no.   47 on file inpr     nps =  5144243856     coll =    10280449799     ctm =    55214.91   nrn =     
 155971002602

 ***********************************************************************************************************************

 dump no.   48 on file inpr     nps =  5255663824     coll =    10502993189     ctm =    56415.26   nrn =     
 159347943115

 ***********************************************************************************************************************

 dump no.   49 on file inpr     nps =  5367747712     coll =    10727011849     ctm =    57615.56   nrn =     
 162746623701

 ***********************************************************************************************************************

 dump no.   50 on file inpr     nps =  5479799008     coll =    10951027611     ctm =    58815.82   nrn =     
 166144945200

 ***********************************************************************************************************************

 dump no.   51 on file inpr     nps =  5591879792     coll =    11175172653     ctm =    60016.28   nrn =     
 169544822075

 ***********************************************************************************************************************

 dump no.   52 on file inpr     nps =  5703324256     coll =    11397961154     ctm =    61216.60   nrn =     
 172924569585

 ***********************************************************************************************************************

 dump no.   53 on file inpr     nps =  5815334320     coll =    11621821722     ctm =    62416.85   nrn =     
 176320899936

 ***********************************************************************************************************************

 dump no.   54 on file inpr     nps =  5927331296     coll =    11845735472     ctm =    63617.15   nrn =     
 179717554514

 ***********************************************************************************************************************

 dump no.   55 on file inpr     nps =  6038806800     coll =    12068530500     ctm =    64817.41   nrn =     
 183097554770

 ***********************************************************************************************************************

 dump no.   56 on file inpr     nps =  6150809984     coll =    12292218087     ctm =    66017.71   nrn =     
 186492012962

 ***********************************************************************************************************************

 dump no.   57 on file inpr     nps =  6262766608     coll =    12516029664     ctm =    67217.96   nrn =     
 189887334527

 ***********************************************************************************************************************

 dump no.   58 on file inpr     nps =  6374267616     coll =    12738903803     ctm =    68418.36   nrn =     
 193268417024

 ***********************************************************************************************************************

 dump no.   59 on file inpr     nps =  6486314256     coll =    12962862330     ctm =    69618.62   nrn =     
 196666020065

 ***********************************************************************************************************************

 dump no.   60 on file inpr     nps =  6598350032     coll =    13186741429     ctm =    70818.95   nrn =     
 200062721892

 ***********************************************************************************************************************

 dump no.   61 on file inpr     nps =  6710387360     coll =    13410715630     ctm =    72019.21   nrn =     
 203460397069

 ***********************************************************************************************************************

 dump no.   62 on file inpr     nps =  6821830944     coll =    13633535843     ctm =    73219.48   nrn =     
 206840498925

 ***********************************************************************************************************************

 dump no.   63 on file inpr     nps =  6933869824     coll =    13857452710     ctm =    74419.76   nrn =     
 210237653701

 ***********************************************************************************************************************

 dump no.   64 on file inpr     nps =  7045900944     coll =    14081320434     ctm =    75620.08   nrn =     
 213634078417

 ***********************************************************************************************************************

 dump no.   65 on file inpr     nps =  7157460256     coll =    14304361386     ctm =    76820.47   nrn =     
 217017327767

 ***********************************************************************************************************************

 dump no.   66 on file inpr     nps =  7269513104     coll =    14528255987     ctm =    78020.83   nrn =     
 220414401798

 ***********************************************************************************************************************

 dump no.   67 on file inpr     nps =  7381554208     coll =    14752142199     ctm =    79221.18   nrn =     
 223811446803

 ***********************************************************************************************************************

 dump no.   68 on file inpr     nps =  7493068512     coll =    14974997276     ctm =    80421.51   nrn =     
 227192419970

 ***********************************************************************************************************************

 dump no.   69 on file inpr     nps =  7605116704     coll =    15198913944     ctm =    81621.83   nrn =     
 230589576529

 ***********************************************************************************************************************

 dump no.   70 on file inpr     nps =  7717136960     coll =    15422849457     ctm =    82822.12   nrn =     
 233986644775

 ***********************************************************************************************************************

 dump no.   71 on file inpr     nps =  7829160320     coll =    15646764039     ctm =    84022.45   nrn =     
 237383524273

 ***********************************************************************************************************************

 dump no.   72 on file inpr     nps =  7940720304     coll =    15869666124     ctm =    85222.86   nrn =     
 240765474435

 ***********************************************************************************************************************

 dump no.   73 on file inpr     nps =  8052804192     coll =    16093543470     ctm =    86423.23   nrn =     
 244162664682

 ***********************************************************************************************************************

 dump no.   74 on file inpr     nps =  8164855793     coll =    16317382221     ctm =    87623.57   nrn =     
 247559227103

 ***********************************************************************************************************************

 dump no.   75 on file inpr     nps =  8276419815     coll =    16540284573     ctm =    88823.92   nrn =     
 250941222927

 ***********************************************************************************************************************

 dump no.   76 on file inpr     nps =  8388424709     coll =    16764211976     ctm =    90024.26   nrn =     
 254338063146

 ***********************************************************************************************************************

 dump no.   77 on file inpr     nps =  8500434568     coll =    16988109823     ctm =    91224.55   nrn =     
 257734734867

 ***********************************************************************************************************************

 dump no.   78 on file inpr     nps =  8611816364     coll =    17210718435     ctm =    92424.94   nrn =     
 261111935210

 ***********************************************************************************************************************

 dump no.   79 on file inpr     nps =  8723864556     coll =    17434545349     ctm =    93625.27   nrn =     
 264508100822

 ***********************************************************************************************************************

 dump no.   80 on file inpr     nps =  8835915718     coll =    17658457876     ctm =    94825.57   nrn =     
 267905322020

 ***********************************************************************************************************************

 dump no.   81 on file inpr     nps =  8947958081     coll =    17882387951     ctm =    96025.81   nrn =     
 271302674197

 ***********************************************************************************************************************

 dump no.   82 on file inpr     nps =  9059470339     coll =    18105195339     ctm =    97226.07   nrn =     
 274683175032

 ***********************************************************************************************************************

 dump no.   83 on file inpr     nps =  9171506965     coll =    18329158537     ctm =    98426.34   nrn =     
 278080834683

 ***********************************************************************************************************************

 dump no.   84 on file inpr     nps =  9283529514     coll =    18552947768     ctm =    99626.70   nrn =     
 281476483337

 ***********************************************************************************************************************

 dump no.   85 on file inpr     nps =  9395092598     coll =    18775772515     ctm =   100826.97   nrn =     
 284857740735

 ***********************************************************************************************************************

 dump no.   86 on file inpr     nps =  9507163733     coll =    18999723567     ctm =   102027.18   nrn =     
 288255520748

 ***********************************************************************************************************************

 dump no.   87 on file inpr     nps =  9619245296     coll =    19223725446     ctm =   103227.51   nrn =     
 291653931756

 ***********************************************************************************************************************

 dump no.   88 on file inpr     nps =  9730707212     coll =    19446498009     ctm =   104427.86   nrn =     
 295033737278

 ***********************************************************************************************************************

 dump no.   89 on file inpr     nps =  9842757715     coll =    19670496902     ctm =   105628.16   nrn =     
 298431657764

 ***********************************************************************************************************************

 dump no.   90 on file inpr     nps =  9954820642     coll =    19894448723     ctm =   106828.43   nrn =     
 301829290188

 ***********************************************************************************************************************

 dump no.   91 on file inpr     nps = 10066897405     coll =    20118417942     ctm =   108028.68   nrn =     
 305227318774

 ***********************************************************************************************************************

 dump no.   92 on file inpr     nps = 10178443183     coll =    20341327935     ctm =   109229.02   nrn =     
 308609307752

 ***********************************************************************************************************************

 dump no.   93 on file inpr     nps = 10290540276     coll =    20565294060     ctm =   110429.31   nrn =     
 312007390554

 ***********************************************************************************************************************

 dump no.   94 on file inpr     nps = 10402595438     coll =    20789273780     ctm =   111629.63   nrn =     
 315405356155

 ***********************************************************************************************************************

 dump no.   95 on file inpr     nps = 10513672069     coll =    21011236154     ctm =   112829.96   nrn =     
 318772951549

 ***********************************************************************************************************************

 dump no.   96 on file inpr     nps = 10625775374     coll =    21235208468     ctm =   114030.31   nrn =     
 322171266538

 ***********************************************************************************************************************

 dump no.   97 on file inpr     nps = 10737838301     coll =    21459241928     ctm =   115230.63   nrn =     
 325569903704

 ***********************************************************************************************************************

 dump no.   98 on file inpr     nps = 10849404268     coll =    21682181718     ctm =   116430.89   nrn =     
 328952269948

 ***********************************************************************************************************************

 dump no.   99 on file inpr     nps = 10961519997     coll =    21906154177     ctm =   117631.17   nrn =     
 332350604001

 ***********************************************************************************************************************

 dump no.  100 on file inpr     nps = 11073559629     coll =    22130195314     ctm =   118831.58   nrn =     
 335748926183

 ***********************************************************************************************************************

 dump no.  101 on file inpr     nps = 11185662934     coll =    22354243856     ctm =   120031.84   nrn =     
 339148098273

 ***********************************************************************************************************************

 dump no.  102 on file inpr     nps = 11297300339     coll =    22577291664     ctm =   121232.11   nrn =     
 342532320975

 ***********************************************************************************************************************

 dump no.  103 on file inpr     nps = 11409420727     coll =    22801389864     ctm =   122432.48   nrn =     
 345931891218

 ***********************************************************************************************************************

 dump no.  104 on file inpr     nps = 11521519373     coll =    23025415520     ctm =   123632.77   nrn =     
 349330737885

 ***********************************************************************************************************************

 dump no.  105 on file inpr     nps = 11633103694     coll =    23248413312     ctm =   124833.11   nrn =     
 352713804080

 ***********************************************************************************************************************

 dump no.  106 on file inpr     nps = 11745211658     coll =    23472454038     ctm =   126033.43   nrn =     
 356112797544

 ***********************************************************************************************************************

 dump no.  107 on file inpr     nps = 11857344470     coll =    23696561093     ctm =   127233.79   nrn =     
 359512923832

 ***********************************************************************************************************************

 dump no.  108 on file inpr     nps = 11968998958     coll =    23919771859     ctm =   128434.14   nrn =     
 362899020253

 ***********************************************************************************************************************

 dump no.  109 on file inpr     nps = 12081117793     coll =    24143789991     ctm =   129634.44   nrn =     
 366297896982

 ***********************************************************************************************************************

 dump no.  110 on file inpr     nps = 12193238181     coll =    24367913690     ctm =   130834.80   nrn =     
 369697960808

 ***********************************************************************************************************************

 dump no.  111 on file inpr     nps = 12305350804     coll =    24592020515     ctm =   132035.15   nrn =     
 373097810879

 ***********************************************************************************************************************

 dump no.  112 on file inpr     nps = 12416975785     coll =    24815075003     ctm =   133235.50   nrn =     
 376482206790

 ***********************************************************************************************************************

 dump no.  113 on file inpr     nps = 12529074431     coll =    25039236378     ctm =   134435.78   nrn =     
 379882419316

 ***********************************************************************************************************************

 dump no.  114 on file inpr     nps = 12641197643     coll =    25263238441     ctm =   135636.09   nrn =     
 383281157638

 ***********************************************************************************************************************

 dump no.  115 on file inpr     nps = 12752678195     coll =    25485950671     ctm =   136836.42   nrn =     
 386660514662

 ***********************************************************************************************************************

 dump no.  116 on file inpr     nps = 12864824984     coll =    25710100410     ctm =   138036.78   nrn =     
 390060971859

 ***********************************************************************************************************************

 dump no.  117 on file inpr     nps = 12976946925     coll =    25934256313     ctm =   139237.17   nrn =     
 393461286899

 ***********************************************************************************************************************

 dump no.  118 on file inpr     nps = 13088661980     coll =    26157441395     ctm =   140437.62   nrn =     
 396847600282

 ***********************************************************************************************************************

 dump no.  119 on file inpr     nps = 13200780815     coll =    26381518145     ctm =   141638.00   nrn =     
 400247181258

 ***********************************************************************************************************************

 dump no.  120 on file inpr     nps = 13312908968     coll =    26605618406     ctm =   142838.36   nrn =     
 403647143846

 ***********************************************************************************************************************

 dump no.  121 on file inpr     nps = 13425052651     coll =    26829754622     ctm =   144038.73   nrn =     
 407047425371

 ***********************************************************************************************************************

 dump no.  122 on file inpr     nps = 13536694715     coll =    27052721246     ctm =   145239.06   nrn =     
 410430734743

 ***********************************************************************************************************************

 dump no.  123 on file inpr     nps = 13648780655     coll =    27276826767     ctm =   146439.50   nrn =     
 413830181366

 ***********************************************************************************************************************

 dump no.  124 on file inpr     nps = 13760859112     coll =    27500893978     ctm =   147639.86   nrn =     
 417229143749

 ***********************************************************************************************************************

 dump no.  125 on file inpr     nps = 13872398678     coll =    27723888599     ctm =   148840.24   nrn =     
 420611892172

 ***********************************************************************************************************************

 dump no.  126 on file inpr     nps = 13984526831     coll =    27948044482     ctm =   150040.55   nrn =     
 424012220289

 ***********************************************************************************************************************

 dump no.  127 on file inpr     nps = 14096656537     coll =    28172199482     ctm =   151240.93   nrn =     
 427412691312

 ***********************************************************************************************************************

 dump no.  128 on file inpr     nps = 14208192997     coll =    28395141888     ctm =   152441.26   nrn =     
 430794873641

 ***********************************************************************************************************************

 dump no.  129 on file inpr     nps = 14320325809     coll =    28619240747     ctm =   153641.60   nrn =     
 434194799120

 ***********************************************************************************************************************

 dump no.  130 on file inpr     nps = 14432478810     coll =    28843408616     ctm =   154841.86   nrn =     
 437595531402

 ***********************************************************************************************************************

 dump no.  131 on file inpr     nps = 14544600751     coll =    29067466088     ctm =   156042.14   nrn =     
 440994979719

 ***********************************************************************************************************************

 dump no.  132 on file inpr     nps = 14656176036     coll =    29290368479     ctm =   157242.59   nrn =     
 444377278515

 ***********************************************************************************************************************

 dump no.  133 on file inpr     nps = 14768285271     coll =    29514359160     ctm =   158442.90   nrn =     
 447775729380

 ***********************************************************************************************************************

 dump no.  134 on file inpr     nps = 14880436719     coll =    29738484787     ctm =   159643.20   nrn =     
 451176136508

 ***********************************************************************************************************************

 dump no.  135 on file inpr     nps = 14992114502     coll =    29961702516     ctm =   160843.49   nrn =     
 454562666440

 ***********************************************************************************************************************

 dump no.  136 on file inpr     nps = 15104256632     coll =    30185853450     ctm =   162043.80   nrn =     
 457963302916

 ***********************************************************************************************************************

 dump no.  137 on file inpr     nps = 15216377020     coll =    30409953310     ctm =   163244.09   nrn =     
 461363096366

 ***********************************************************************************************************************

 dump no.  138 on file inpr     nps = 15328068780     coll =    30633122188     ctm =   164444.46   nrn =     
 464749079195

 ***********************************************************************************************************************

 dump no.  139 on file inpr     nps = 15440172085     coll =    30857196088     ctm =   165644.74   nrn =     
 468148374833

 ***********************************************************************************************************************

 dump no.  140 on file inpr     nps = 15552298685     coll =    31081224598     ctm =   166845.12   nrn =     
 471547440842

 ***********************************************************************************************************************

 dump no.  141 on file inpr     nps = 15664405096     coll =    31305330350     ctm =   168045.43   nrn =     
 474947278638

 ***********************************************************************************************************************

 dump no.  142 on file inpr     nps = 15776003394     coll =    31528452797     ctm =   169245.84   nrn =     
 478331803403

 ***********************************************************************************************************************

 dump no.  143 on file inpr     nps = 15888140865     coll =    31752603018     ctm =   170446.25   nrn =     
 481732465584

 ***********************************************************************************************************************

 dump no.  144 on file inpr     nps = 16000244170     coll =    31976656716     ctm =   171646.60   nrn =     
 485131719464

 ***********************************************************************************************************************

 dump no.  145 on file inpr     nps = 16111887787     coll =    32199732275     ctm =   172847.04   nrn =     
 488516252666

 ***********************************************************************************************************************

 dump no.  146 on file inpr     nps = 16224043894     coll =    32423883492     ctm =   174047.44   nrn =     
 491916954675

 ***********************************************************************************************************************

 dump no.  147 on file inpr     nps = 16336100609     coll =    32647892014     ctm =   175247.72   nrn =     
 495315287197

 ***********************************************************************************************************************

 dump no.  148 on file inpr     nps = 16447710060     coll =    32870958420     ctm =   176448.04   nrn =     
 498699448925

 ***********************************************************************************************************************

 dump no.  149 on file inpr     nps = 16559875485     coll =    33095078502     ctm =   177648.34   nrn =     
 502099884747

 ***********************************************************************************************************************

 dump no.  150 on file inpr     nps = 16672054887     coll =    33319256449     ctm =   178848.69   nrn =     
 505501092046

 ***********************************************************************************************************************

 dump no.  151 on file inpr     nps = 16784174993     coll =    33543207996     ctm =   180049.00   nrn =     
 508899416010

 ***********************************************************************************************************************

 dump no.  152 on file inpr     nps = 16894279587     coll =    33763263267     ctm =   181249.28   nrn =     
 512238065680

 ***********************************************************************************************************************

 dump no.  153 on file inpr     nps = 17006413952     coll =    33987358171     ctm =   182449.78   nrn =     
 515638047166

 ***********************************************************************************************************************

 dump no.  154 on file inpr     nps = 17118535893     coll =    34211294797     ctm =   183650.08   nrn =     
 519036112571

 ***********************************************************************************************************************

 dump no.  155 on file inpr     nps = 17230084777     coll =    34434325788     ctm =   184850.36   nrn =     
 522419268568

 ***********************************************************************************************************************

 dump no.  156 on file inpr     nps = 17342236225     coll =    34658405394     ctm =   186050.70   nrn =     
 525822723115

 ***********************************************************************************************************************

 dump no.  157 on file inpr     nps = 17454351954     coll =    34882465876     ctm =   187251.03   nrn =     
 529222120912

 ***********************************************************************************************************************

 dump no.  158 on file inpr     nps = 17565871331     coll =    35105265002     ctm =   188451.38   nrn =     
 532602653012

 ***********************************************************************************************************************

 dump no.  159 on file inpr     nps = 17678021226     coll =    35329435504     ctm =   189651.79   nrn =     
 536003523083

 ***********************************************************************************************************************

 dump no.  160 on file inpr     nps = 17790152485     coll =    35553630337     ctm =   190852.06   nrn =     
 539404488957

 ***********************************************************************************************************************

 dump no.  161 on file inpr     nps = 17902280356     coll =    35777690152     ctm =   192052.35   nrn =     
 542804061541

 ***********************************************************************************************************************

 dump no.  162 on file inpr     nps = 18013928632     coll =    36000798357     ctm =   193252.66   nrn =     
 546188959362

 ***********************************************************************************************************************

 dump no.  163 on file inpr     nps = 18126073868     coll =    36224959236     ctm =   194452.92   nrn =     
 549589549489

 ***********************************************************************************************************************

 dump no.  164 on file inpr     nps = 18238211339     coll =    36449059267     ctm =   195653.23   nrn =     
 552989710910

 ***********************************************************************************************************************

 dump no.  165 on file inpr     nps = 18349775753     coll =    36671973299     ctm =   196853.51   nrn =     
 556372014180

 ***********************************************************************************************************************

 dump no.  166 on file inpr     nps = 18461893035     coll =    36896093408     ctm =   198053.99   nrn =     
 559771874066

 ***********************************************************************************************************************

 dump no.  167 on file inpr     nps = 18573988575     coll =    37120225527     ctm =   199254.39   nrn =     
 563171839424
1problem summary                                                                                                           

      run terminated when it had used*****  minutes of computer time.
+                                                                                                    08/06/17 01:33:50 
      c //-------------------------------------------------------------------------//      probid =  08/05/17 17:13:59 

 neutron creation    tracks      weight        energy            neutron loss        tracks      weight        energy
                                 (per source particle)                                           (per source particle)

 source         18643691874    1.0000E+00    1.4100E+01          escape         30022019276    1.0363E+00    1.0606E+01
 nucl. interaction        0    0.            0.                  energy cutoff            0    0.            0.        
 particle decay           0    0.            0.                  time cutoff        1046636    2.8680E-05    1.4573E-05
 weight window  11071566611    1.7948E-02    8.4187E-02          weight window   1948976931    1.7950E-02    8.4187E-02
 cell importance          0    0.            0.                  cell importance          0    0.            0.        
 weight cutoff            0    0.            0.                  weight cutoff            0    0.            0.        
 e or t importance        0    0.            0.                  e or t importance        0    0.            0.        
 dxtran                   0    0.            0.                  dxtran                   0    0.            0.        
 forced collisions        0    0.            0.                  forced collisions        0    0.            0.        
 exp. transform           0    0.            0.                  exp. transform           0    0.            0.        
 upscattering             0    0.            1.7570E-14          downscattering           0    0.            1.8688E+00
 photonuclear             0    0.            0.                  capture                108    5.0265E-02    6.6560E-01
 (n,xn)          4240036689    1.6517E-01    1.9615E-01          loss to (n,xn)  2119929975    8.2581E-02    1.1606E+00
 prompt fission   208603238    5.9794E-03    1.2264E-02          loss to fission   73042991    2.0413E-03    7.9485E-03
 delayed fission    1117505    3.0624E-05    1.5607E-05          nucl. interaction        0    0.            0.        
 prompt photofis          0    0.            0.                  particle decay           0    0.            0.        
 tabular boundary         0    0.            0.                  tabular boundary         0    0.            0.        
 tabular sampling         0    0.            0.                  elastic scatter          0    0.            0.        
     total      34165015917    1.1891E+00    1.4393E+01              total      34165015917    1.1891E+00    1.4393E+01

   number of neutrons banked             -1172068019        average time of (shakes)              cutoffs
   neutron tracks per source particle     1.8325E+00          escape            5.0000E+06          tco   2.0000E+07
   neutron collisions per source particle 1.9985E+00          capture           5.0000E+06          eco   0.0000E+00
   total neutron collisions              -2147483648          capture or escape 5.0000E+06          wc1  -5.0000E-01
   net multiplication              1.0866E+00 0.0000          any termination   4.6535E+06          wc2  -2.5000E-01

 computer time so far in this run200002.66 minutes            maximum number ever in bank        43
 computer time in mcrun          200000.38 minutes            bank overflows to backup file       0
 source particles per minute            9.3218E+04
 random numbers generated             565284971052            most random numbers used was     3596033 in history 17290241900
 
  warning.   random number stride   152917 exceeded        3 times.
 
  warning.  random number period exceeded.  decrease stride.

 range of sampled source weights = 9.4883E-01 to 1.0570E+00

 number of histories processed by each thread
   901813110   940046288   936743113   932095738   933621988   935712318   931575414   932553041   932296929   932619410
   933971571   937437702   932691124   927976095   931476000   936866817   931743098   930765850   934681655   937004613
 
  warning.  some of the geometry is covered by a weight window mesh.
1neutron  activity in each cell                                                                         print table 126

                       tracks     population   collisions   collisions     number        flux        average      average
              cell    entering                               * weight     weighted     weighted   track weight   track mfp
                                                          (per history)    energy       energy     (relative)      (cm)

        1        1 37942338401  30356146249    109210045    4.1611E-03   6.1430E+00   1.0868E+01   7.4998E-01   1.1959E+04
        2        2 18566959775  19412051425  36642946244    1.2482E+00   3.4767E+00   8.2243E+00   6.5107E-01   4.2393E+00
        3        3 11452972028   8980111586     75793712    2.6571E-03   3.0646E+00   7.7806E+00   7.0669E-01   1.1130E+04
        4        4    40241568    208475752    426485008    1.1769E-02   1.3449E+00   3.0957E+00   5.2112E-01   2.7983E+00
        5       10   638388554    911524425       905168    2.3242E-06   2.4198E+00   6.3617E+00   4.8323E-02   1.0750E+04
        6       11   781489906    997068851       981834    2.7581E-06   2.5699E+00   6.6315E+00   5.3105E-02   1.0846E+04
        7       12   916609710   1216512647      1188516    3.3815E-06   2.4724E+00   6.4432E+00   5.3635E-02   1.0785E+04
        8       13   769074438    985500825       966859    2.7570E-06   2.5707E+00   6.6324E+00   5.3873E-02   1.0846E+04
        9       14   882917547   1038347576      1019835    3.1617E-06   2.7072E+00   6.8680E+00   5.8709E-02   1.0926E+04

           total   71990991927  64105739336  37259497221    1.2668E+00

1tally        4        nps = 18643691874
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      10                                                                                   
                         4.00000E+03
 
 cell  10                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 5.52223E-06 0.0001   1.22119E-11 0.0686   8.35070E-12 0.0772   8.82343E-12 0.0747   7.86101E-12 0.0808
 
         time:       2.0000E+07             total                                                                  
                 7.49385E-12 0.0809   5.52227E-06 0.0001


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally        4

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00      yes         yes            constant    random       5.87
 passed?        yes          yes      yes          yes             yes      yes         yes               yes        yes         yes

 ===================================================================================================================================


 this tally meets the statistical criteria used to form confidence intervals: check the tally fluctuation chart to verify.
 the results in other bins associated with this tally may not meet these statistical criteria.

 ----- estimated confidence intervals:  -----

 estimated asymmetric confidence interval(1,2,3 sigma): 5.5216E-06 to 5.5230E-06; 5.5209E-06 to 5.5237E-06; 5.5202E-06 to 5.5243E-06
 estimated  symmetric confidence interval(1,2,3 sigma): 5.5216E-06 to 5.5230E-06; 5.5209E-06 to 5.5237E-06; 5.5202E-06 to 5.5243E-06

1analysis of the results in the tally fluctuation chart bin (tfc) for tally        4 with nps = 18643691874  print table 160


 normed average tally per history  = 5.52227E-06          unnormed average tally per history  = 2.20891E-02
 estimated tally relative error    = 0.0001               estimated variance of the variance  = 0.0000
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =   106214508          efficiency for the nonzero tallies  = 0.0057
 history number of largest  tally  = 10626091535          largest  unnormalized history tally = 9.19545E+01
 (largest  tally)/(average tally)  = 4.16289E+03          (largest  tally)/(avg nonzero tally)= 2.37163E+01

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 5.52227E-06


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            5.52227E-06             5.52227E-06                     0.000000
      relative error                  1.25066E-04             1.25067E-04                     0.000001
      variance of the variance        2.75585E-08             2.75685E-08                     0.000362
      shifted center                  5.52227E-06             5.52227E-06                     0.000000
      figure of merit                 3.19660E+02             3.19659E+02                    -0.000003

 the estimated inverse power slope of the 200 largest  tallies starting at 3.50312E+01 is 5.8728
 the large score tail of the empirical history score probability density function appears to have no unsampled regions.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (9.322E+04)*( 5.856E-02)**2 = (9.322E+04)*(3.429E-03) = 3.197E+02

1tally       14        nps = 18643691874
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      11                                                                                   
                         4.00000E+03
 
 cell  11                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 6.63940E-06 0.0001   1.23223E-11 0.0674   8.27302E-12 0.0769   8.07225E-12 0.0738   6.85960E-12 0.0823
 
         time:       2.0000E+07             total                                                                  
                 7.76972E-12 0.0814   6.63944E-06 0.0001


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       14

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00      yes         yes            constant    random      10.00
 passed?        yes          yes      yes          yes             yes      yes         yes               yes        yes         yes

 ===================================================================================================================================


 this tally meets the statistical criteria used to form confidence intervals: check the tally fluctuation chart to verify.
 the results in other bins associated with this tally may not meet these statistical criteria.

 ----- estimated confidence intervals:  -----

 estimated asymmetric confidence interval(1,2,3 sigma): 6.6387E-06 to 6.6402E-06; 6.6379E-06 to 6.6409E-06; 6.6372E-06 to 6.6417E-06
 estimated  symmetric confidence interval(1,2,3 sigma): 6.6387E-06 to 6.6402E-06; 6.6379E-06 to 6.6409E-06; 6.6372E-06 to 6.6417E-06

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       14 with nps = 18643691874  print table 160


 normed average tally per history  = 6.63944E-06          unnormed average tally per history  = 2.65578E-02
 estimated tally relative error    = 0.0001               estimated variance of the variance  = 0.0000
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =   123901188          efficiency for the nonzero tallies  = 0.0066
 history number of largest  tally  = 14213565813          largest  unnormalized history tally = 5.21995E+01
 (largest  tally)/(average tally)  = 1.96551E+03          (largest  tally)/(avg nonzero tally)= 1.30623E+01

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 6.63944E-06


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            6.63944E-06             6.63944E-06                     0.000000
      relative error                  1.13463E-04             1.13463E-04                     0.000000
      variance of the variance        2.12909E-08             2.12916E-08                     0.000033
      shifted center                  6.63944E-06             6.63944E-06                     0.000000
      figure of merit                 3.88387E+02             3.88386E+02                    -0.000001

 the estimated slope of the 197 largest  tallies starting at  3.51759E+01 appears to be decreasing at least exponentially.
 the large score tail of the empirical history score probability density function appears to have no unsampled regions.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (9.322E+04)*( 6.455E-02)**2 = (9.322E+04)*(4.166E-03) = 3.884E+02

1tally       24        nps = 18643691874
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      12                                                                                   
                         4.00000E+03
 
 cell  12                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 8.06739E-06 0.0001   2.04502E-11 0.0523   1.46858E-11 0.0582   1.54635E-11 0.0576   1.27685E-11 0.0611
 
         time:       2.0000E+07             total                                                                  
                 1.46339E-11 0.0601   8.06746E-06 0.0001


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       24

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00      yes         yes            constant    random       8.51
 passed?        yes          yes      yes          yes             yes      yes         yes               yes        yes         yes

 ===================================================================================================================================


 this tally meets the statistical criteria used to form confidence intervals: check the tally fluctuation chart to verify.
 the results in other bins associated with this tally may not meet these statistical criteria.

 ----- estimated confidence intervals:  -----

 estimated asymmetric confidence interval(1,2,3 sigma): 8.0666E-06 to 8.0683E-06; 8.0658E-06 to 8.0691E-06; 8.0650E-06 to 8.0700E-06
 estimated  symmetric confidence interval(1,2,3 sigma): 8.0666E-06 to 8.0683E-06; 8.0658E-06 to 8.0691E-06; 8.0650E-06 to 8.0700E-06

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       24 with nps = 18643691874  print table 160


 normed average tally per history  = 8.06746E-06          unnormed average tally per history  = 3.22699E-02
 estimated tally relative error    = 0.0001               estimated variance of the variance  = 0.0000
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =   152101431          efficiency for the nonzero tallies  = 0.0082
 history number of largest  tally  =  3095688445          largest  unnormalized history tally = 6.08873E+01
 (largest  tally)/(average tally)  = 1.88682E+03          (largest  tally)/(avg nonzero tally)= 1.53933E+01

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 8.06746E-06


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            8.06746E-06             8.06746E-06                     0.000000
      relative error                  1.03552E-04             1.03552E-04                     0.000000
      variance of the variance        1.74107E-08             1.74116E-08                     0.000050
      shifted center                  8.06746E-06             8.06746E-06                     0.000000
      figure of merit                 4.66283E+02             4.66283E+02                    -0.000001

 the estimated inverse power slope of the 200 largest  tallies starting at 3.60702E+01 is 8.5061
 the large score tail of the empirical history score probability density function appears to have no unsampled regions.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (9.322E+04)*( 7.073E-02)**2 = (9.322E+04)*(5.002E-03) = 4.663E+02

1tally       34        nps = 18643691874
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      13                                                                                   
                         4.00000E+03
 
 cell  13                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 6.63961E-06 0.0001   1.39078E-11 0.0691   9.16984E-12 0.0768   7.92056E-12 0.0785   8.93558E-12 0.0772
 
         time:       2.0000E+07             total                                                                  
                 7.97802E-12 0.0784   6.63966E-06 0.0001


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       34

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00      yes         yes            constant    random       7.76
 passed?        yes          yes      yes          yes             yes      yes         yes               yes        yes         yes

 ===================================================================================================================================


 this tally meets the statistical criteria used to form confidence intervals: check the tally fluctuation chart to verify.
 the results in other bins associated with this tally may not meet these statistical criteria.

 ----- estimated confidence intervals:  -----

 estimated asymmetric confidence interval(1,2,3 sigma): 6.6389E-06 to 6.6404E-06; 6.6381E-06 to 6.6412E-06; 6.6374E-06 to 6.6419E-06
 estimated  symmetric confidence interval(1,2,3 sigma): 6.6389E-06 to 6.6404E-06; 6.6381E-06 to 6.6412E-06; 6.6374E-06 to 6.6419E-06

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       34 with nps = 18643691874  print table 160


 normed average tally per history  = 6.63966E-06          unnormed average tally per history  = 2.65586E-02
 estimated tally relative error    = 0.0001               estimated variance of the variance  = 0.0000
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =   122149221          efficiency for the nonzero tallies  = 0.0066
 history number of largest  tally  =  5096095582          largest  unnormalized history tally = 5.96281E+01
 (largest  tally)/(average tally)  = 2.24515E+03          (largest  tally)/(avg nonzero tally)= 1.47097E+01

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 6.63966E-06


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            6.63966E-06             6.63966E-06                     0.000000
      relative error                  1.14920E-04             1.14920E-04                     0.000000
      variance of the variance        2.15259E-08             2.15270E-08                     0.000054
      shifted center                  6.63966E-06             6.63966E-06                     0.000000
      figure of merit                 3.78599E+02             3.78598E+02                    -0.000001

 the estimated inverse power slope of the 198 largest  tallies starting at 3.44360E+01 is 7.7585
 the large score tail of the empirical history score probability density function appears to have no unsampled regions.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (9.322E+04)*( 6.373E-02)**2 = (9.322E+04)*(4.061E-03) = 3.786E+02

1tally       44        nps = 18643691874
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      14                                                                                   
                         4.00000E+03
 
 cell  14                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 7.69420E-06 0.0001   1.43554E-11 0.0655   8.14039E-12 0.0753   6.87408E-12 0.0809   7.67659E-12 0.0761
 
         time:       2.0000E+07             total                                                                  
                 8.56074E-12 0.0788   7.69425E-06 0.0001


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       44

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00      yes         yes            constant    random       9.39
 passed?        yes          yes      yes          yes             yes      yes         yes               yes        yes         yes

 ===================================================================================================================================


 this tally meets the statistical criteria used to form confidence intervals: check the tally fluctuation chart to verify.
 the results in other bins associated with this tally may not meet these statistical criteria.

 ----- estimated confidence intervals:  -----

 estimated asymmetric confidence interval(1,2,3 sigma): 7.6934E-06 to 7.6951E-06; 7.6926E-06 to 7.6959E-06; 7.6918E-06 to 7.6967E-06
 estimated  symmetric confidence interval(1,2,3 sigma): 7.6934E-06 to 7.6951E-06; 7.6926E-06 to 7.6959E-06; 7.6918E-06 to 7.6967E-06

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       44 with nps = 18643691874  print table 160


 normed average tally per history  = 7.69425E-06          unnormed average tally per history  = 3.07770E-02
 estimated tally relative error    = 0.0001               estimated variance of the variance  = 0.0000
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =   137906415          efficiency for the nonzero tallies  = 0.0074
 history number of largest  tally  =  2745916951          largest  unnormalized history tally = 5.61400E+01
 (largest  tally)/(average tally)  = 1.82409E+03          (largest  tally)/(avg nonzero tally)= 1.34927E+01

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 7.69425E-06


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            7.69425E-06             7.69425E-06                     0.000000
      relative error                  1.06688E-04             1.06688E-04                     0.000000
      variance of the variance        1.79370E-08             1.79377E-08                     0.000038
      shifted center                  7.69425E-06             7.69425E-06                     0.000000
      figure of merit                 4.39274E+02             4.39274E+02                    -0.000001

 the estimated inverse power slope of the 197 largest  tallies starting at 3.42582E+01 is 9.3893
 the large score tail of the empirical history score probability density function appears to have no unsampled regions.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (9.322E+04)*( 6.865E-02)**2 = (9.322E+04)*(4.712E-03) = 4.393E+02

1status of the statistical checks used to form confidence intervals for the mean for each tally bin


 tally   result of statistical checks for the tfc bin (the first check not passed is listed) and error magnitude check for all bins

        4   passed the 10 statistical checks for the tally fluctuation chart bin result               
         passed all bin error check:     7 tally bins all have relative errors less than 0.10 with no zero bins

       14   passed the 10 statistical checks for the tally fluctuation chart bin result               
         passed all bin error check:     7 tally bins all have relative errors less than 0.10 with no zero bins

       24   passed the 10 statistical checks for the tally fluctuation chart bin result               
         passed all bin error check:     7 tally bins all have relative errors less than 0.10 with no zero bins

       34   passed the 10 statistical checks for the tally fluctuation chart bin result               
         passed all bin error check:     7 tally bins all have relative errors less than 0.10 with no zero bins

       44   passed the 10 statistical checks for the tally fluctuation chart bin result               
         passed all bin error check:     7 tally bins all have relative errors less than 0.10 with no zero bins


 the 10 statistical checks are only for the tally fluctuation chart bin and do not apply to other tally bins.

1tally fluctuation charts                              

                            tally        4                          tally       14                          tally       24
          nps      mean     error   vov  slope    fom      mean     error   vov  slope    fom      mean     error   vov  slope    fom
   1048576000   5.5170E-06 0.0005 0.0000 10.0     319   6.6420E-06 0.0005 0.0000 10.0     388   8.0691E-06 0.0004 0.0000  7.7     466
   2097152000   5.5199E-06 0.0004 0.0000 10.0     319   6.6389E-06 0.0003 0.0000 10.0     388   8.0684E-06 0.0003 0.0000  5.7     466
   3145728000   5.5211E-06 0.0003 0.0000  6.5     319   6.6389E-06 0.0003 0.0000 10.0     388   8.0709E-06 0.0003 0.0000  6.9     466
   4194304000   5.5217E-06 0.0003 0.0000  5.9     319   6.6370E-06 0.0002 0.0000 10.0     388   8.0695E-06 0.0002 0.0000  8.2     466
   5242880000   5.5223E-06 0.0002 0.0000  5.1     319   6.6372E-06 0.0002 0.0000 10.0     388   8.0687E-06 0.0002 0.0000 10.0     466
   6291456000   5.5225E-06 0.0002 0.0000  4.3     320   6.6390E-06 0.0002 0.0000 10.0     388   8.0680E-06 0.0002 0.0000 10.0     466
   7340032000   5.5222E-06 0.0002 0.0000  3.8     320   6.6389E-06 0.0002 0.0000 10.0     388   8.0677E-06 0.0002 0.0000 10.0     466
   8388608000   5.5217E-06 0.0002 0.0000  4.8     320   6.6391E-06 0.0002 0.0000 10.0     388   8.0677E-06 0.0002 0.0000 10.0     466
   9437184000   5.5211E-06 0.0002 0.0000  6.0     320   6.6396E-06 0.0002 0.0000 10.0     388   8.0680E-06 0.0001 0.0000  8.6     466
  10485760000   5.5211E-06 0.0002 0.0000  6.5     319   6.6387E-06 0.0002 0.0000 10.0     388   8.0674E-06 0.0001 0.0000  7.8     466
  11534336000   5.5210E-06 0.0002 0.0000  4.8     320   6.6389E-06 0.0001 0.0000 10.0     388   8.0672E-06 0.0001 0.0000 10.0     466
  12582912000   5.5213E-06 0.0002 0.0000  5.5     320   6.6394E-06 0.0001 0.0000 10.0     388   8.0671E-06 0.0001 0.0000 10.0     466
  13631488000   5.5214E-06 0.0001 0.0000  5.2     320   6.6392E-06 0.0001 0.0000 10.0     388   8.0669E-06 0.0001 0.0000 10.0     466
  14680064000   5.5215E-06 0.0001 0.0000  4.9     320   6.6394E-06 0.0001 0.0000 10.0     388   8.0669E-06 0.0001 0.0000 10.0     466
  15728640000   5.5219E-06 0.0001 0.0000  4.8     320   6.6393E-06 0.0001 0.0000 10.0     388   8.0672E-06 0.0001 0.0000 10.0     466
  16777216000   5.5222E-06 0.0001 0.0000  5.5     320   6.6393E-06 0.0001 0.0000 10.0     388   8.0674E-06 0.0001 0.0000 10.0     466
  17825792000   5.5222E-06 0.0001 0.0000  5.7     320   6.6395E-06 0.0001 0.0000 10.0     388   8.0672E-06 0.0001 0.0000  8.6     466
  18643691874   5.5223E-06 0.0001 0.0000  5.9     320   6.6394E-06 0.0001 0.0000 10.0     388   8.0675E-06 0.0001 0.0000  8.5     466
 

                            tally       34                          tally       44
          nps      mean     error   vov  slope    fom      mean     error   vov  slope    fom
   1048576000   6.6392E-06 0.0005 0.0000 10.0     378   7.6911E-06 0.0004 0.0000 10.0     439
   2097152000   6.6413E-06 0.0003 0.0000 10.0     378   7.6941E-06 0.0003 0.0000 10.0     439
   3145728000   6.6421E-06 0.0003 0.0000  6.3     378   7.6936E-06 0.0003 0.0000  7.7     439
   4194304000   6.6398E-06 0.0002 0.0000  6.3     378   7.6937E-06 0.0002 0.0000  6.2     439
   5242880000   6.6398E-06 0.0002 0.0000  4.7     378   7.6937E-06 0.0002 0.0000  6.1     439
   6291456000   6.6403E-06 0.0002 0.0000  5.3     378   7.6938E-06 0.0002 0.0000  6.4     439
   7340032000   6.6399E-06 0.0002 0.0000  5.4     378   7.6945E-06 0.0002 0.0000  5.7     439
   8388608000   6.6398E-06 0.0002 0.0000  4.9     378   7.6939E-06 0.0002 0.0000  7.3     439
   9437184000   6.6394E-06 0.0002 0.0000  5.8     378   7.6937E-06 0.0001 0.0000  8.3     439
  10485760000   6.6394E-06 0.0002 0.0000  5.5     378   7.6937E-06 0.0001 0.0000  8.9     439
  11534336000   6.6396E-06 0.0001 0.0000  5.5     378   7.6941E-06 0.0001 0.0000 10.0     439
  12582912000   6.6396E-06 0.0001 0.0000  6.2     379   7.6942E-06 0.0001 0.0000 10.0     439
  13631488000   6.6393E-06 0.0001 0.0000  4.7     379   7.6940E-06 0.0001 0.0000 10.0     439
  14680064000   6.6394E-06 0.0001 0.0000  5.6     379   7.6940E-06 0.0001 0.0000 10.0     439
  15728640000   6.6393E-06 0.0001 0.0000  5.5     379   7.6938E-06 0.0001 0.0000 10.0     439
  16777216000   6.6394E-06 0.0001 0.0000  7.2     379   7.6940E-06 0.0001 0.0000 10.0     439
  17825792000   6.6395E-06 0.0001 0.0000  6.6     379   7.6941E-06 0.0001 0.0000 10.0     439
  18643691874   6.6397E-06 0.0001 0.0000  7.8     379   7.6942E-06 0.0001 0.0000  9.4     439

 ***********************************************************************************************************************

 dump no.  168 on file inpr     nps = 18643691874     coll =    37259497296     ctm =   200000.38   nrn =     
 565284971052

         7 warning messages so far.


 run terminated when it had used*****  minutes of computer time.

 computer time =******** minutes

 mcnp     version 6     06/19/14                     08/06/17 01:33:50                     probid =  08/05/17 17:13:59 
