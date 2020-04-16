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
  
1mcnp     version 6     ld=06/19/14                     08/06/17 01:35:13 
 *************************************************************************                 probid =  08/06/17 01:35:13 
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
        65-        4 1 SPH 0 0 0  7.21                              $ 5cm radius HEU sphere ~ 10kg
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
       153-       sb1    4.75636e-01 5.24364e-01                                                  
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
       220-       wwp:n 5.0 j 100 j -1 0 2.150303764e-01                                          
 
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
        4        4        4  4.79746E-02 1.87248E+01 1.56998E+03 2.93975E+04           1  1.0000E+00                                   
        5       10        1  4.98947E-05 1.20500E-03 4.00000E+03 4.82000E+00           0  1.0000E+00                                   
        6       11        1  4.98947E-05 1.20500E-03 4.00000E+03 4.82000E+00           0  1.0000E+00                                   
        7       12        1  4.98947E-05 1.20500E-03 4.00000E+03 4.82000E+00           0  1.0000E+00                                   
        8       13        1  4.98947E-05 1.20500E-03 4.00000E+03 4.82000E+00           0  1.0000E+00                                   
        9       14        1  4.98947E-05 1.20500E-03 4.00000E+03 4.82000E+00           0  1.0000E+00                                   
       10       99        0  0.00000E+00 0.00000E+00 0.00000E+00 0.00000E+00           0  0.0000E+00                                   

 total                                               2.37657E+06 1.29307E+06

    minimum source weight = 9.5354E-01    maximum source weight = 1.0512E+00

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

 dump no.    2 on file inpr     nps =   107659104     coll =      247926461     ctm =     1200.28   nrn =       
 3600950138

 ***********************************************************************************************************************

 dump no.    3 on file inpr     nps =   214889818     coll =      494816274     ctm =     2400.54   nrn =       
 7187007901

 ***********************************************************************************************************************

 dump no.    4 on file inpr     nps =   322528325     coll =      742753382     ctm =     3600.78   nrn =      
 10787671385

 ***********************************************************************************************************************

 dump no.    5 on file inpr     nps =   431071896     coll =      992364670     ctm =     4801.06   nrn =      
 14414499257

 ***********************************************************************************************************************

 dump no.    6 on file inpr     nps =   539055812     coll =     1240849414     ctm =     6001.42   nrn =      
 18024222826

 ***********************************************************************************************************************

 dump no.    7 on file inpr     nps =   647569652     coll =     1490604561     ctm =     7201.74   nrn =      
 21652117801

 ***********************************************************************************************************************

 dump no.    8 on file inpr     nps =   756053546     coll =     1740637959     ctm =     8402.04   nrn =      
 25282637272

 ***********************************************************************************************************************

 dump no.    9 on file inpr     nps =   864575500     coll =     1990683583     ctm =     9602.32   nrn =      
 28913813102

 ***********************************************************************************************************************

 dump no.   10 on file inpr     nps =   972639500     coll =     2239535177     ctm =    10802.65   nrn =      
 32528074376

 ***********************************************************************************************************************

 dump no.   11 on file inpr     nps =  1081180722     coll =     2489417542     ctm =    12002.95   nrn =      
 36157574477

 ***********************************************************************************************************************

 dump no.   12 on file inpr     nps =  1189770744     coll =     2739279091     ctm =    13203.34   nrn =      
 39787234484

 ***********************************************************************************************************************

 dump no.   13 on file inpr     nps =  1297837579     coll =     2988562014     ctm =    14403.63   nrn =      
 43406001810

 ***********************************************************************************************************************

 dump no.   14 on file inpr     nps =  1406381773     coll =     3238564554     ctm =    15604.02   nrn =      
 47036799555

 ***********************************************************************************************************************

 dump no.   15 on file inpr     nps =  1514895842     coll =     3488828326     ctm =    16804.33   nrn =      
 50670022770

 ***********************************************************************************************************************

 dump no.   16 on file inpr     nps =  1622999258     coll =     3737831335     ctm =    18004.64   nrn =      
 54286256976

 ***********************************************************************************************************************

 dump no.   17 on file inpr     nps =  1731566792     coll =     3988047656     ctm =    19205.00   nrn =      
 57919489723

 ***********************************************************************************************************************

 dump no.   18 on file inpr     nps =  1840129279     coll =     4238111867     ctm =    20405.32   nrn =      
 61551088283

 ***********************************************************************************************************************

 dump no.   19 on file inpr     nps =  1948737529     coll =     4488400236     ctm =    21605.65   nrn =      
 65185382992

 ***********************************************************************************************************************

 dump no.   20 on file inpr     nps =  2056921320     coll =     4737673717     ctm =    22806.16   nrn =      
 68805275463

 ***********************************************************************************************************************

 dump no.   21 on file inpr     nps =  2165484392     coll =     4987865329     ctm =    24006.46   nrn =      
 72438225438

 ***********************************************************************************************************************

 dump no.   22 on file inpr     nps =  2274107584     coll =     5238077184     ctm =    25206.78   nrn =      
 76071855964

 ***********************************************************************************************************************

 dump no.   23 on file inpr     nps =  2382218253     coll =     5486822049     ctm =    26407.02   nrn =      
 79685511320

 ***********************************************************************************************************************

 dump no.   24 on file inpr     nps =  2490745253     coll =     5737253642     ctm =    27607.31   nrn =      
 83320598053

 ***********************************************************************************************************************

 dump no.   25 on file inpr     nps =  2599352033     coll =     5987444314     ctm =    28807.66   nrn =      
 86953854304

 ***********************************************************************************************************************

 dump no.   26 on file inpr     nps =  2707376229     coll =     6236175494     ctm =    30008.02   nrn =      
 90566596210

 ***********************************************************************************************************************

 dump no.   27 on file inpr     nps =  2815993530     coll =     6486220785     ctm =    31208.38   nrn =      
 94198484766

 ***********************************************************************************************************************

 dump no.   28 on file inpr     nps =  2924506181     coll =     6736143702     ctm =    32408.75   nrn =      
 97828157483

 ***********************************************************************************************************************

 dump no.   29 on file inpr     nps =  3033121630     coll =     6986252943     ctm =    33609.12   nrn =     
 101460757617

 ***********************************************************************************************************************

 dump no.   30 on file inpr     nps =  3141135612     coll =     7234922218     ctm =    34809.36   nrn =     
 105072639985

 ***********************************************************************************************************************

 dump no.   31 on file inpr     nps =  3249678369     coll =     7485047572     ctm =    36009.72   nrn =     
 108704833803

 ***********************************************************************************************************************

 dump no.   32 on file inpr     nps =  3358289729     coll =     7735174852     ctm =    37210.03   nrn =     
 112337479184

 ***********************************************************************************************************************

 dump no.   33 on file inpr     nps =  3466406176     coll =     7984027913     ctm =    38410.30   nrn =     
 115952338246

 ***********************************************************************************************************************

 dump no.   34 on file inpr     nps =  3574988960     coll =     8234167632     ctm =    39610.68   nrn =     
 119584851877

 ***********************************************************************************************************************

 dump no.   35 on file inpr     nps =  3683579072     coll =     8484109177     ctm =    40811.00   nrn =     
 123215536568

 ***********************************************************************************************************************

 dump no.   36 on file inpr     nps =  3791730208     coll =     8733407835     ctm =    42011.30   nrn =     
 126835212160

 ***********************************************************************************************************************

 dump no.   37 on file inpr     nps =  3900285920     coll =     8983613451     ctm =    43211.60   nrn =     
 130468284294

 ***********************************************************************************************************************

 dump no.   38 on file inpr     nps =  4008853472     coll =     9233645533     ctm =    44411.85   nrn =     
 134099602788

 ***********************************************************************************************************************

 dump no.   39 on file inpr     nps =  4117427232     coll =     9483665918     ctm =    45612.21   nrn =     
 137731377361

 ***********************************************************************************************************************

 dump no.   40 on file inpr     nps =  4225502976     coll =     9732361542     ctm =    46812.52   nrn =     
 141343988911

 ***********************************************************************************************************************

 dump no.   41 on file inpr     nps =  4334060192     coll =     9982225211     ctm =    48012.76   nrn =     
 144973370176

 ***********************************************************************************************************************

 dump no.   42 on file inpr     nps =  4442662528     coll =    10232235800     ctm =    49213.11   nrn =     
 148604668390

 ***********************************************************************************************************************

 dump no.   43 on file inpr     nps =  4550632992     coll =    10480852682     ctm =    50413.43   nrn =     
 152215869392

 ***********************************************************************************************************************

 dump no.   44 on file inpr     nps =  4659199232     coll =    10730840124     ctm =    51613.84   nrn =     
 155846593431

 ***********************************************************************************************************************

 dump no.   45 on file inpr     nps =  4767735200     coll =    10980884267     ctm =    52814.16   nrn =     
 159477864332

 ***********************************************************************************************************************

 dump no.   46 on file inpr     nps =  4875845728     coll =    11229933084     ctm =    54014.47   nrn =     
 163094472959

 ***********************************************************************************************************************

 dump no.   47 on file inpr     nps =  4984423808     coll =    11479895146     ctm =    55214.92   nrn =     
 166725112723

 ***********************************************************************************************************************

 dump no.   48 on file inpr     nps =  5092956960     coll =    11729966423     ctm =    56415.29   nrn =     
 170356569610

 ***********************************************************************************************************************

 dump no.   49 on file inpr     nps =  5201535232     coll =    11980066691     ctm =    57615.79   nrn =     
 173988729729

 ***********************************************************************************************************************

 dump no.   50 on file inpr     nps =  5309299648     coll =    12228228563     ctm =    58816.19   nrn =     
 177592948939

 ***********************************************************************************************************************

 dump no.   51 on file inpr     nps =  5417823776     coll =    12478346099     ctm =    60016.48   nrn =     
 181224825197

 ***********************************************************************************************************************

 dump no.   52 on file inpr     nps =  5526402048     coll =    12728352200     ctm =    61216.82   nrn =     
 184856052326

 ***********************************************************************************************************************

 dump no.   53 on file inpr     nps =  5634539648     coll =    12977451818     ctm =    62417.14   nrn =     
 188473680919

 ***********************************************************************************************************************

 dump no.   54 on file inpr     nps =  5743018656     coll =    13227407898     ctm =    63617.43   nrn =     
 192103369671

 ***********************************************************************************************************************

 dump no.   55 on file inpr     nps =  5851494272     coll =    13477451682     ctm =    64817.78   nrn =     
 195733951918

 ***********************************************************************************************************************

 dump no.   56 on file inpr     nps =  5959552160     coll =    13726651045     ctm =    66018.09   nrn =     
 199351795486

 ***********************************************************************************************************************

 dump no.   57 on file inpr     nps =  6068025152     coll =    13976847981     ctm =    67218.40   nrn =     
 202983880760

 ***********************************************************************************************************************

 dump no.   58 on file inpr     nps =  6176564320     coll =    14226797634     ctm =    68418.78   nrn =     
 206614196790

 ***********************************************************************************************************************

 dump no.   59 on file inpr     nps =  6285130560     coll =    14476801897     ctm =    69619.16   nrn =     
 210245374163

 ***********************************************************************************************************************

 dump no.   60 on file inpr     nps =  6393192576     coll =    14725876672     ctm =    70819.47   nrn =     
 213861878084

 ***********************************************************************************************************************

 dump no.   61 on file inpr     nps =  6501715200     coll =    14975945980     ctm =    72019.73   nrn =     
 217493164361

 ***********************************************************************************************************************

 dump no.   62 on file inpr     nps =  6610227296     coll =    15226228532     ctm =    73220.07   nrn =     
 221126597348

 ***********************************************************************************************************************

 dump no.   63 on file inpr     nps =  6718226528     coll =    15475442339     ctm =    74420.38   nrn =     
 224743946414

 ***********************************************************************************************************************

 dump no.   64 on file inpr     nps =  6826109568     coll =    15724155771     ctm =    75620.66   nrn =     
 228355170829

 ***********************************************************************************************************************

 dump no.   65 on file inpr     nps =  6932350982     coll =    15968879577     ctm =    76820.98   nrn =     
 231909315907

 ***********************************************************************************************************************

 dump no.   66 on file inpr     nps =  7040351913     coll =    16217321351     ctm =    78021.30   nrn =     
 235518673826

 ***********************************************************************************************************************

 dump no.   67 on file inpr     nps =  7148827932     coll =    16467276755     ctm =    79221.62   nrn =     
 239148225208

 ***********************************************************************************************************************

 dump no.   68 on file inpr     nps =  7257296716     coll =    16717032357     ctm =    80421.92   nrn =     
 242775870183

 ***********************************************************************************************************************

 dump no.   69 on file inpr     nps =  7365803040     coll =    16967108286     ctm =    81622.30   nrn =     
 246407255983

 ***********************************************************************************************************************

 dump no.   70 on file inpr     nps =  7473862626     coll =    17216117737     ctm =    82822.57   nrn =     
 250023082278

 ***********************************************************************************************************************

 dump no.   71 on file inpr     nps =  7582416699     coll =    17466123569     ctm =    84022.91   nrn =     
 253653993221

 ***********************************************************************************************************************

 dump no.   72 on file inpr     nps =  7690949851     coll =    17716154860     ctm =    85223.22   nrn =     
 257284960035

 ***********************************************************************************************************************

 dump no.   73 on file inpr     nps =  7799013755     coll =    17965260112     ctm =    86423.66   nrn =     
 260901892271

 ***********************************************************************************************************************

 dump no.   74 on file inpr     nps =  7907532928     coll =    18215355735     ctm =    87624.01   nrn =     
 264533424299

 ***********************************************************************************************************************

 dump no.   75 on file inpr     nps =  8016078112     coll =    18465177085     ctm =    88824.23   nrn =     
 268162329676

 ***********************************************************************************************************************

 dump no.   76 on file inpr     nps =  8124093888     coll =    18713725698     ctm =    90024.53   nrn =     
 271773032345

 ***********************************************************************************************************************

 dump no.   77 on file inpr     nps =  8232593952     coll =    18963291335     ctm =    91224.85   nrn =     
 275398931116

 ***********************************************************************************************************************

 dump no.   78 on file inpr     nps =  8341151168     coll =    19213337213     ctm =    92425.25   nrn =     
 279030261709

 ***********************************************************************************************************************

 dump no.   79 on file inpr     nps =  8449709504     coll =    19463615927     ctm =    93625.65   nrn =     
 282664100300

 ***********************************************************************************************************************

 dump no.   80 on file inpr     nps =  8557821536     coll =    19712640690     ctm =    94826.10   nrn =     
 286280555525

 ***********************************************************************************************************************

 dump no.   81 on file inpr     nps =  8666402816     coll =    19962582421     ctm =    96026.41   nrn =     
 289911173813

 ***********************************************************************************************************************

 dump no.   82 on file inpr     nps =  8774985600     coll =    20212502563     ctm =    97226.68   nrn =     
 293541446705

 ***********************************************************************************************************************

 dump no.   83 on file inpr     nps =  8883049504     coll =    20461677166     ctm =    98426.93   nrn =     
 297159061088

 ***********************************************************************************************************************

 dump no.   84 on file inpr     nps =  8991538656     coll =    20711688414     ctm =    99627.27   nrn =     
 300789573930

 ***********************************************************************************************************************

 dump no.   85 on file inpr     nps =  9100044736     coll =    20961797199     ctm =   100827.59   nrn =     
 304421040341

 ***********************************************************************************************************************

 dump no.   86 on file inpr     nps =  9208129696     coll =    21210698778     ctm =   102027.86   nrn =     
 308036060599

 ***********************************************************************************************************************

 dump no.   87 on file inpr     nps =  9316662848     coll =    21460603202     ctm =   103228.18   nrn =     
 311665870604

 ***********************************************************************************************************************

 dump no.   88 on file inpr     nps =  9425180960     coll =    21710590000     ctm =   104428.46   nrn =     
 315296289834

 ***********************************************************************************************************************

 dump no.   89 on file inpr     nps =  9533740800     coll =    21960514553     ctm =   105628.82   nrn =     
 318926444363

 ***********************************************************************************************************************

 dump no.   90 on file inpr     nps =  9641833280     coll =    22209386740     ctm =   106829.19   nrn =     
 322541276620

 ***********************************************************************************************************************

 dump no.   91 on file inpr     nps =  9750375456     coll =    22459212261     ctm =   108029.47   nrn =     
 326170287919

 ***********************************************************************************************************************

 dump no.   92 on file inpr     nps =  9858929664     coll =    22709428216     ctm =   109229.85   nrn =     
 329803297476

 ***********************************************************************************************************************

 dump no.   93 on file inpr     nps =  9967050336     coll =    22958246440     ctm =   110430.05   nrn =     
 333417773185

 ***********************************************************************************************************************

 dump no.   94 on file inpr     nps = 10075592512     coll =    23208193394     ctm =   111630.38   nrn =     
 337047909838

 ***********************************************************************************************************************

 dump no.   95 on file inpr     nps = 10184155744     coll =    23458220928     ctm =   112830.75   nrn =     
 340679237094

 ***********************************************************************************************************************

 dump no.   96 on file inpr     nps = 10292255744     coll =    23707002647     ctm =   114031.05   nrn =     
 344293040514

 ***********************************************************************************************************************

 dump no.   97 on file inpr     nps = 10400802432     coll =    23956877584     ctm =   115231.32   nrn =     
 347922565891

 ***********************************************************************************************************************

 dump no.   98 on file inpr     nps = 10509326176     coll =    24206981316     ctm =   116431.63   nrn =     
 351554241158

 ***********************************************************************************************************************

 dump no.   99 on file inpr     nps = 10617868352     coll =    24457112509     ctm =   117631.95   nrn =     
 355186323238

 ***********************************************************************************************************************

 dump no.  100 on file inpr     nps = 10725989408     coll =    24706321599     ctm =   118832.43   nrn =     
 358804872963

 ***********************************************************************************************************************

 dump no.  101 on file inpr     nps = 10834584224     coll =    24956480097     ctm =   120032.86   nrn =     
 362437855078

 ***********************************************************************************************************************

 dump no.  102 on file inpr     nps = 10943215136     coll =    25206705044     ctm =   121233.22   nrn =     
 366071763449

 ***********************************************************************************************************************

 dump no.  103 on file inpr     nps = 11051322656     coll =    25455940320     ctm =   122433.58   nrn =     
 369690379997

 ***********************************************************************************************************************

 dump no.  104 on file inpr     nps = 11159833248     coll =    25705863096     ctm =   123633.92   nrn =     
 373320107006

 ***********************************************************************************************************************

 dump no.  105 on file inpr     nps = 11267850528     coll =    25954504169     ctm =   124834.27   nrn =     
 376931744054

 ***********************************************************************************************************************

 dump no.  106 on file inpr     nps = 11375282752     coll =    26202210054     ctm =   126034.56   nrn =     
 380527978172

 ***********************************************************************************************************************

 dump no.  107 on file inpr     nps = 11483895616     coll =    26452189582     ctm =   127234.87   nrn =     
 384159058049

 ***********************************************************************************************************************

 dump no.  108 on file inpr     nps = 11592486656     coll =    26702115229     ctm =   128435.20   nrn =     
 387789424683

 ***********************************************************************************************************************

 dump no.  109 on file inpr     nps = 11701095008     coll =    26952241975     ctm =   129635.48   nrn =     
 391422133911

 ***********************************************************************************************************************

 dump no.  110 on file inpr     nps = 11809154400     coll =    27201189432     ctm =   130835.82   nrn =     
 395037313559

 ***********************************************************************************************************************

 dump no.  111 on file inpr     nps = 11917681536     coll =    27451309278     ctm =   132036.07   nrn =     
 398669307642

 ***********************************************************************************************************************

 dump no.  112 on file inpr     nps = 12026283872     coll =    27701494802     ctm =   133236.46   nrn =     
 402302513439

 ***********************************************************************************************************************

 dump no.  113 on file inpr     nps = 12134386880     coll =    27950578903     ctm =   134436.78   nrn =     
 405919507809

 ***********************************************************************************************************************

 dump no.  114 on file inpr     nps = 12242945600     coll =    28200646612     ctm =   135637.11   nrn =     
 409551238888

 ***********************************************************************************************************************

 dump no.  115 on file inpr     nps = 12351486272     coll =    28450758717     ctm =   136837.41   nrn =     
 413183318992

 ***********************************************************************************************************************

 dump no.  116 on file inpr     nps = 12459452416     coll =    28699254669     ctm =   138037.71   nrn =     
 416793095138

 ***********************************************************************************************************************

 dump no.  117 on file inpr     nps = 12568059264     coll =    28949479619     ctm =   139238.11   nrn =     
 420426647449

 ***********************************************************************************************************************

 dump no.  118 on file inpr     nps = 12676653312     coll =    29199438804     ctm =   140438.46   nrn =     
 424057465436

 ***********************************************************************************************************************

 dump no.  119 on file inpr     nps = 12785311296     coll =    29449433307     ctm =   141638.80   nrn =     
 427689292179

 ***********************************************************************************************************************

 dump no.  120 on file inpr     nps = 12893442880     coll =    29698455022     ctm =   142839.07   nrn =     
 431305930361

 ***********************************************************************************************************************

 dump no.  121 on file inpr     nps = 13002033184     coll =    29948523114     ctm =   144039.41   nrn =     
 434937838788

 ***********************************************************************************************************************

 dump no.  122 on file inpr     nps = 13110674624     coll =    30198702735     ctm =   145239.71   nrn =     
 438571198364

 ***********************************************************************************************************************

 dump no.  123 on file inpr     nps = 13218239200     coll =    30446528212     ctm =   146440.03   nrn =     
 442170130706

 ***********************************************************************************************************************

 dump no.  124 on file inpr     nps = 13326781376     coll =    30696765903     ctm =   147640.33   nrn =     
 445803455485

 ***********************************************************************************************************************

 dump no.  125 on file inpr     nps = 13435364160     coll =    30946926154     ctm =   148840.62   nrn =     
 449436159945

 ***********************************************************************************************************************

 dump no.  126 on file inpr     nps = 13543458144     coll =    31196019080     ctm =   150041.00   nrn =     
 453053160981

 ***********************************************************************************************************************

 dump no.  127 on file inpr     nps = 13652028128     coll =    31446140422     ctm =   151241.31   nrn =     
 456685440580

 ***********************************************************************************************************************

 dump no.  128 on file inpr     nps = 13760600384     coll =    31696130558     ctm =   152441.69   nrn =     
 460316336534

 ***********************************************************************************************************************

 dump no.  129 on file inpr     nps = 13869204224     coll =    31946299470     ctm =   153642.03   nrn =     
 463949473023

 ***********************************************************************************************************************

 dump no.  130 on file inpr     nps = 13977268128     coll =    32195485621     ctm =   154842.36   nrn =     
 467567062844

 ***********************************************************************************************************************

 dump no.  131 on file inpr     nps = 14085730592     coll =    32445376020     ctm =   156042.68   nrn =     
 471195918249

 ***********************************************************************************************************************

 dump no.  132 on file inpr     nps = 14194307360     coll =    32695267274     ctm =   157243.02   nrn =     
 474825908284

 ***********************************************************************************************************************

 dump no.  133 on file inpr     nps = 14302389312     coll =    32944118383     ctm =   158443.35   nrn =     
 478440402226

 ***********************************************************************************************************************

 dump no.  134 on file inpr     nps = 14410931488     coll =    33194078418     ctm =   159643.65   nrn =     
 482070700190

 ***********************************************************************************************************************

 dump no.  135 on file inpr     nps = 14519496224     coll =    33444043299     ctm =   160843.95   nrn =     
 485701335512

 ***********************************************************************************************************************

 dump no.  136 on file inpr     nps = 14627563136     coll =    33692855449     ctm =   162044.32   nrn =     
 489315435761

 ***********************************************************************************************************************

 dump no.  137 on file inpr     nps = 14736140640     coll =    33942793029     ctm =   163244.63   nrn =     
 492945768053

 ***********************************************************************************************************************

 dump no.  138 on file inpr     nps = 14844699360     coll =    34192904669     ctm =   164445.02   nrn =     
 496577913345

 ***********************************************************************************************************************

 dump no.  139 on file inpr     nps = 14953231008     coll =    34443254480     ctm =   165645.38   nrn =     
 500212222951

 ***********************************************************************************************************************

 dump no.  140 on file inpr     nps = 15061272352     coll =    34692151288     ctm =   166845.69   nrn =     
 503826933253

 ***********************************************************************************************************************

 dump no.  141 on file inpr     nps = 15169816032     coll =    34941949888     ctm =   168046.00   nrn =     
 507455676618

 ***********************************************************************************************************************

 dump no.  142 on file inpr     nps = 15278391296     coll =    35191834730     ctm =   169246.29   nrn =     
 511085558632

 ***********************************************************************************************************************

 dump no.  143 on file inpr     nps = 15386488288     coll =    35440500856     ctm =   170446.68   nrn =     
 514698222890

 ***********************************************************************************************************************

 dump no.  144 on file inpr     nps = 15494991360     coll =    35690528129     ctm =   171647.00   nrn =     
 518328803593

 ***********************************************************************************************************************

 dump no.  145 on file inpr     nps = 15603532032     coll =    35940473391     ctm =   172847.38   nrn =     
 521958953100

 ***********************************************************************************************************************

 dump no.  146 on file inpr     nps = 15711537280     coll =    36189174781     ctm =   174047.67   nrn =     
 525571156231

 ***********************************************************************************************************************

 dump no.  147 on file inpr     nps = 15820048608     coll =    36439295452     ctm =   175248.11   nrn =     
 529202894604

 ***********************************************************************************************************************

 dump no.  148 on file inpr     nps = 15928550176     coll =    36689281186     ctm =   176448.46   nrn =     
 532833238795

 ***********************************************************************************************************************

 dump no.  149 on file inpr     nps = 16037135968     coll =    36939103401     ctm =   177648.84   nrn =     
 536462630474

 ***********************************************************************************************************************

 dump no.  150 on file inpr     nps = 16145183328     coll =    37188040367     ctm =   178849.18   nrn =     
 540077588454

 ***********************************************************************************************************************

 dump no.  151 on file inpr     nps = 16253693920     coll =    37437896765     ctm =   180049.52   nrn =     
 543706688330

 ***********************************************************************************************************************

 dump no.  152 on file inpr     nps = 16362216544     coll =    37688137326     ctm =   181249.93   nrn =     
 547339730857

 ***********************************************************************************************************************

 dump no.  153 on file inpr     nps = 16470233824     coll =    37937143906     ctm =   182450.21   nrn =     
 550955186008

 ***********************************************************************************************************************

 dump no.  154 on file inpr     nps = 16578789536     coll =    38187190827     ctm =   183650.61   nrn =     
 554586484394

 ***********************************************************************************************************************

 dump no.  155 on file inpr     nps = 16687354272     coll =    38437318248     ctm =   184850.90   nrn =     
 558218839585

 ***********************************************************************************************************************

 dump no.  156 on file inpr     nps = 16795533216     coll =    38686242956     ctm =   186051.27   nrn =     
 561835088116

 ***********************************************************************************************************************

 dump no.  157 on file inpr     nps = 16904043808     coll =    38936450529     ctm =   187251.58   nrn =     
 565467798439

 ***********************************************************************************************************************

 dump no.  158 on file inpr     nps = 17012602528     coll =    39186404149     ctm =   188451.93   nrn =     
 569098344562

 ***********************************************************************************************************************

 dump no.  159 on file inpr     nps = 17121165760     coll =    39436253203     ctm =   189652.28   nrn =     
 572727691294

 ***********************************************************************************************************************

 dump no.  160 on file inpr     nps = 17229229664     coll =    39685160238     ctm =   190852.59   nrn =     
 576342463779

 ***********************************************************************************************************************

 dump no.  161 on file inpr     nps = 17337776352     coll =    39935161104     ctm =   192052.95   nrn =     
 579976803007

 ***********************************************************************************************************************

 dump no.  162 on file inpr     nps = 17446345600     coll =    40185087411     ctm =   193253.19   nrn =     
 583607036501

 ***********************************************************************************************************************

 dump no.  163 on file inpr     nps = 17554329792     coll =    40433823531     ctm =   194453.48   nrn =     
 587219366270

 ***********************************************************************************************************************

 dump no.  164 on file inpr     nps = 17662861440     coll =    40683838141     ctm =   195653.84   nrn =     
 590850269616

 ***********************************************************************************************************************

 dump no.  165 on file inpr     nps = 17771372032     coll =    40933924285     ctm =   196854.25   nrn =     
 594481598087

 ***********************************************************************************************************************

 dump no.  166 on file inpr     nps = 17879396064     coll =    41182798804     ctm =   198054.59   nrn =     
 598095832670

 ***********************************************************************************************************************

 dump no.  167 on file inpr     nps = 17987932224     coll =    41432522102     ctm =   199255.01   nrn =     
 601723698326
1problem summary                                                                                                           

      run terminated when it had used*****  minutes of computer time.
+                                                                                                    08/06/17 09:55:01 
      c //-------------------------------------------------------------------------//      probid =  08/06/17 01:35:13 

 neutron creation    tracks      weight        energy            neutron loss        tracks      weight        energy
                                 (per source particle)                                           (per source particle)

 source         18055326464    1.0000E+00    1.4100E+01          escape         30451433537    1.0572E+00    1.0627E+01
 nucl. interaction        0    0.            0.                  energy cutoff            0    0.            0.        
 particle decay           0    0.            0.                  time cutoff        9064049    2.2955E-04    1.1654E-04
 weight window  11553623132    2.1363E-02    8.3408E-02          weight window   2219659356    2.1365E-02    8.3413E-02
 cell importance          0    0.            0.                  cell importance          0    0.            0.        
 weight cutoff            0    0.            0.                  weight cutoff            0    0.            0.        
 e or t importance        0    0.            0.                  e or t importance        0    0.            0.        
 dxtran                   0    0.            0.                  dxtran                   0    0.            0.        
 forced collisions        0    0.            0.                  forced collisions        0    0.            0.        
 exp. transform           0    0.            0.                  exp. transform           0    0.            0.        
 upscattering             0    0.            1.7300E-14          downscattering           0    0.            1.8911E+00
 photonuclear             0    0.            0.                  capture                107    5.1738E-02    6.6622E-01
 (n,xn)          4131461918    1.6554E-01    1.9663E-01          loss to (n,xn)  2065529612    8.2761E-02    1.1625E+00
 prompt fission  1595464332    4.1454E-02    8.5044E-02          loss to fission  599863595    1.5351E-02    3.5147E-02
 delayed fission    9674410    2.4503E-04    1.2477E-04          nucl. interaction        0    0.            0.        
 prompt photofis          0    0.            0.                  particle decay           0    0.            0.        
 tabular boundary         0    0.            0.                  tabular boundary         0    0.            0.        
 tabular sampling         0    0.            0.                  elastic scatter          0    0.            0.        
     total      35345550256    1.2286E+00    1.4465E+01              total      35345550256    1.2286E+00    1.4465E+01

   number of neutrons banked               -74945589        average time of (shakes)              cutoffs
   neutron tracks per source particle     1.9576E+00          escape            5.0005E+06          tco   2.0000E+07
   neutron collisions per source particle 2.3033E+00          capture           5.0007E+06          eco   0.0000E+00
   total neutron collisions              -2147483648          capture or escape 5.0005E+06          wc1  -5.0000E-01
   net multiplication              1.1091E+00 0.0000          any termination   4.6836E+06          wc2  -2.5000E-01

 computer time so far in this run200002.45 minutes            maximum number ever in bank       108
 computer time in mcrun          200000.25 minutes            bank overflows to backup file       0
 source particles per minute            9.0277E+04
 random numbers generated             603977653597            most random numbers used was     3596033 in history 17290241900
 
  warning.   random number stride   152917 exceeded        5 times.
 
  warning.  random number period exceeded.  decrease stride.

 range of sampled source weights = 9.5354E-01 to 1.0512E+00

 number of histories processed by each thread
   872177038   906060995   902764568   903610302   903404358   905583567   907832714   909353929   904260350   903388642
   904682666   902992080   903560307   904905480   900558891   905377188   905299672   905155570   903249024   901109123
 
  warning.  some of the geometry is covered by a weight window mesh.
1neutron  activity in each cell                                                                         print table 126

                       tracks     population   collisions   collisions     number        flux        average      average
              cell    entering                               * weight     weighted     weighted   track weight   track mfp
                                                          (per history)    energy       energy     (relative)      (cm)

        1        1 38093350382  30763452021    111046744    4.2481E-03   5.9453E+00   1.0729E+01   7.3401E-01   1.1915E+04
        2        2 19124474788  20239914528  37631831440    1.2840E+00   3.3449E+00   8.0458E+00   6.3293E-01   4.2345E+00
        3        3 12476539928   9776228250     83715827    2.8689E-03   2.8450E+00   7.3817E+00   6.7184E-01   1.0999E+04
        4        4    85094871   1172146880   3755767166    9.6249E-02   1.0119E+00   2.0085E+00   4.6527E-01   2.7029E+00
        5       10   659017619    938096558       948755    2.4581E-06   2.2419E+00   5.9955E+00   4.7222E-02   1.0611E+04
        6       11   799945770   1022071717      1022835    2.8944E-06   2.3950E+00   6.2930E+00   5.1810E-02   1.0720E+04
        7       12   983861218   1297330758      1286747    3.7014E-06   2.2958E+00   6.0735E+00   5.2490E-02   1.0649E+04
        8       13   790711548   1014454315      1008169    2.8869E-06   2.3961E+00   6.2945E+00   5.2330E-02   1.0720E+04
        9       14   917246507   1081689126      1076745    3.3659E-06   2.5605E+00   6.5996E+00   5.7292E-02   1.0825E+04

           total   73930242631  67305384153  41587704428    1.3874E+00

1tally        4        nps = 18055326464
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      10                                                                                   
                         4.00000E+03
 
 cell  10                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 5.73630E-06 0.0001   1.80307E-10 0.0207   1.64665E-10 0.0209   1.61060E-10 0.0213   1.62965E-10 0.0214
 
         time:       2.0000E+07             total                                                                  
                 1.56016E-10 0.0217   5.73713E-06 0.0001


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally        4

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00      yes         yes            constant    random       7.25
 passed?        yes          yes      yes          yes             yes      yes         yes               yes        yes         yes

 ===================================================================================================================================


 this tally meets the statistical criteria used to form confidence intervals: check the tally fluctuation chart to verify.
 the results in other bins associated with this tally may not meet these statistical criteria.

 ----- estimated confidence intervals:  -----

 estimated asymmetric confidence interval(1,2,3 sigma): 5.7364E-06 to 5.7378E-06; 5.7357E-06 to 5.7386E-06; 5.7350E-06 to 5.7393E-06
 estimated  symmetric confidence interval(1,2,3 sigma): 5.7364E-06 to 5.7378E-06; 5.7357E-06 to 5.7386E-06; 5.7350E-06 to 5.7393E-06

1analysis of the results in the tally fluctuation chart bin (tfc) for tally        4 with nps = 18055326464  print table 160


 normed average tally per history  = 5.73713E-06          unnormed average tally per history  = 2.29485E-02
 estimated tally relative error    = 0.0001               estimated variance of the variance  = 0.0000
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =   108808650          efficiency for the nonzero tallies  = 0.0060
 history number of largest  tally  =  5946454656          largest  unnormalized history tally = 1.20525E+02
 (largest  tally)/(average tally)  = 5.25198E+03          (largest  tally)/(avg nonzero tally)= 3.16505E+01

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 5.73713E-06


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            5.73713E-06             5.73713E-06                     0.000000
      relative error                  1.24401E-04             1.24402E-04                     0.000002
      variance of the variance        2.98349E-08             2.98645E-08                     0.000990
      shifted center                  5.73713E-06             5.73713E-06                     0.000000
      figure of merit                 3.23087E+02             3.23085E+02                    -0.000005

 the estimated inverse power slope of the 200 largest  tallies starting at 4.50294E+01 is 7.2486
 the large score tail of the empirical history score probability density function appears to have no unsampled regions.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (9.028E+04)*( 5.982E-02)**2 = (9.028E+04)*(3.579E-03) = 3.231E+02

1tally       14        nps = 18055326464
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      11                                                                                   
                         4.00000E+03
 
 cell  11                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 6.85567E-06 0.0001   1.81749E-10 0.0208   1.69339E-10 0.0211   1.60319E-10 0.0217   1.65667E-10 0.0208
 
         time:       2.0000E+07             total                                                                  
                 1.56022E-10 0.0217   6.85650E-06 0.0001


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       14

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00      yes         yes            constant    random       5.61
 passed?        yes          yes      yes          yes             yes      yes         yes               yes        yes         yes

 ===================================================================================================================================


 this tally meets the statistical criteria used to form confidence intervals: check the tally fluctuation chart to verify.
 the results in other bins associated with this tally may not meet these statistical criteria.

 ----- estimated confidence intervals:  -----

 estimated asymmetric confidence interval(1,2,3 sigma): 6.8557E-06 to 6.8573E-06; 6.8549E-06 to 6.8581E-06; 6.8542E-06 to 6.8588E-06
 estimated  symmetric confidence interval(1,2,3 sigma): 6.8557E-06 to 6.8573E-06; 6.8549E-06 to 6.8581E-06; 6.8542E-06 to 6.8588E-06

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       14 with nps = 18055326464  print table 160


 normed average tally per history  = 6.85650E-06          unnormed average tally per history  = 2.74260E-02
 estimated tally relative error    = 0.0001               estimated variance of the variance  = 0.0000
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =   126109451          efficiency for the nonzero tallies  = 0.0070
 history number of largest  tally  =  5946454656          largest  unnormalized history tally = 1.17928E+02
 (largest  tally)/(average tally)  = 4.29988E+03          (largest  tally)/(avg nonzero tally)= 3.00330E+01

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 6.85650E-06


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            6.85650E-06             6.85650E-06                     0.000000
      relative error                  1.13250E-04             1.13250E-04                     0.000002
      variance of the variance        2.30889E-08             2.31083E-08                     0.000837
      shifted center                  6.85650E-06             6.85650E-06                     0.000000
      figure of merit                 3.89844E+02             3.89843E+02                    -0.000004

 the estimated inverse power slope of the 197 largest  tallies starting at 4.53311E+01 is 5.6066
 the history score probability density function appears to have an unsampled region at the largest  history scores:
 please examine. see print table 161.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (9.028E+04)*( 6.571E-02)**2 = (9.028E+04)*(4.318E-03) = 3.898E+02

1tally       24        nps = 18055326464
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      12                                                                                   
                         4.00000E+03
 
 cell  12                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 8.69718E-06 0.0001   3.17790E-10 0.0174   2.89406E-10 0.0174   2.78916E-10 0.0180   2.82242E-10 0.0184
 
         time:       2.0000E+07             total                                                                  
                 2.72661E-10 0.0182   8.69862E-06 0.0001


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       24

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00      yes         yes            constant    random       6.89
 passed?        yes          yes      yes          yes             yes      yes         yes               yes        yes         yes

 ===================================================================================================================================


 this tally meets the statistical criteria used to form confidence intervals: check the tally fluctuation chart to verify.
 the results in other bins associated with this tally may not meet these statistical criteria.

 ----- estimated confidence intervals:  -----

 estimated asymmetric confidence interval(1,2,3 sigma): 8.6977E-06 to 8.6995E-06; 8.6968E-06 to 8.7004E-06; 8.6959E-06 to 8.7013E-06
 estimated  symmetric confidence interval(1,2,3 sigma): 8.6977E-06 to 8.6995E-06; 8.6968E-06 to 8.7004E-06; 8.6959E-06 to 8.7013E-06

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       24 with nps = 18055326464  print table 160


 normed average tally per history  = 8.69862E-06          unnormed average tally per history  = 3.47945E-02
 estimated tally relative error    = 0.0001               estimated variance of the variance  = 0.0000
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =   158122039          efficiency for the nonzero tallies  = 0.0088
 history number of largest  tally  =  5946454656          largest  unnormalized history tally = 1.67456E+02
 (largest  tally)/(average tally)  = 4.81271E+03          (largest  tally)/(avg nonzero tally)= 4.21480E+01

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 8.69862E-06


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            8.69862E-06             8.69862E-06                     0.000000
      relative error                  1.02730E-04             1.02730E-04                     0.000003
      variance of the variance        2.34855E-08             2.35305E-08                     0.001915
      shifted center                  8.69862E-06             8.69862E-06                     0.000000
      figure of merit                 4.73778E+02             4.73775E+02                    -0.000006

 the estimated inverse power slope of the 200 largest  tallies starting at 6.67033E+01 is 6.8853
 the large score tail of the empirical history score probability density function appears to have no unsampled regions.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (9.028E+04)*( 7.244E-02)**2 = (9.028E+04)*(5.248E-03) = 4.738E+02

1tally       34        nps = 18055326464
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      13                                                                                   
                         4.00000E+03
 
 cell  13                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 6.85561E-06 0.0001   1.80620E-10 0.0211   1.72646E-10 0.0210   1.59486E-10 0.0218   1.65433E-10 0.0218
 
         time:       2.0000E+07             total                                                                  
                 1.53599E-10 0.0216   6.85644E-06 0.0001


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       34

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00      yes         yes            constant    random       4.94
 passed?        yes          yes      yes          yes             yes      yes         yes               yes        yes         yes

 ===================================================================================================================================


 this tally meets the statistical criteria used to form confidence intervals: check the tally fluctuation chart to verify.
 the results in other bins associated with this tally may not meet these statistical criteria.

 ----- estimated confidence intervals:  -----

 estimated asymmetric confidence interval(1,2,3 sigma): 6.8557E-06 to 6.8572E-06; 6.8549E-06 to 6.8580E-06; 6.8541E-06 to 6.8588E-06
 estimated  symmetric confidence interval(1,2,3 sigma): 6.8557E-06 to 6.8572E-06; 6.8549E-06 to 6.8580E-06; 6.8541E-06 to 6.8588E-06

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       34 with nps = 18055326464  print table 160


 normed average tally per history  = 6.85644E-06          unnormed average tally per history  = 2.74258E-02
 estimated tally relative error    = 0.0001               estimated variance of the variance  = 0.0000
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =   124383069          efficiency for the nonzero tallies  = 0.0069
 history number of largest  tally  =  5946454656          largest  unnormalized history tally = 1.27956E+02
 (largest  tally)/(average tally)  = 4.66554E+03          (largest  tally)/(avg nonzero tally)= 3.21409E+01

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 6.85644E-06


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            6.85644E-06             6.85644E-06                     0.000000
      relative error                  1.14650E-04             1.14651E-04                     0.000002
      variance of the variance        2.32696E-08             2.32952E-08                     0.001098
      shifted center                  6.85644E-06             6.85644E-06                     0.000000
      figure of merit                 3.80380E+02             3.80378E+02                    -0.000005

 the estimated inverse power slope of the 200 largest  tallies starting at 4.50869E+01 is 4.9432
 the history score probability density function appears to have an unsampled region at the largest  history scores:
 please examine. see print table 161.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (9.028E+04)*( 6.491E-02)**2 = (9.028E+04)*(4.213E-03) = 3.804E+02

1tally       44        nps = 18055326464
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      14                                                                                   
                         4.00000E+03
 
 cell  14                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 8.08066E-06 0.0001   1.80654E-10 0.0211   1.73380E-10 0.0213   1.60905E-10 0.0218   1.65762E-10 0.0215
 
         time:       2.0000E+07             total                                                                  
                 1.61861E-10 0.0222   8.08150E-06 0.0001


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       44

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00      yes         yes            constant    random       4.25
 passed?        yes          yes      yes          yes             yes      yes         yes               yes        yes         yes

 ===================================================================================================================================


 this tally meets the statistical criteria used to form confidence intervals: check the tally fluctuation chart to verify.
 the results in other bins associated with this tally may not meet these statistical criteria.

 ----- estimated confidence intervals:  -----

 estimated asymmetric confidence interval(1,2,3 sigma): 8.0806E-06 to 8.0824E-06; 8.0798E-06 to 8.0832E-06; 8.0789E-06 to 8.0841E-06
 estimated  symmetric confidence interval(1,2,3 sigma): 8.0806E-06 to 8.0824E-06; 8.0798E-06 to 8.0832E-06; 8.0789E-06 to 8.0841E-06

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       44 with nps = 18055326464  print table 160


 normed average tally per history  = 8.08150E-06          unnormed average tally per history  = 3.23260E-02
 estimated tally relative error    = 0.0001               estimated variance of the variance  = 0.0000
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =   142198571          efficiency for the nonzero tallies  = 0.0079
 history number of largest  tally  =  8839744556          largest  unnormalized history tally = 1.54081E+02
 (largest  tally)/(average tally)  = 4.76647E+03          (largest  tally)/(avg nonzero tally)= 3.75394E+01

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 8.08150E-06


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            8.08150E-06             8.08150E-06                     0.000000
      relative error                  1.05713E-04             1.05713E-04                     0.000003
      variance of the variance        1.90122E-08             1.90509E-08                     0.002031
      shifted center                  8.08150E-06             8.08150E-06                     0.000000
      figure of merit                 4.47419E+02             4.47416E+02                    -0.000006

 the estimated inverse power slope of the 198 largest  tallies starting at 4.57923E+01 is 4.2453
 the large score tail of the empirical history score probability density function appears to have no unsampled regions.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (9.028E+04)*( 7.040E-02)**2 = (9.028E+04)*(4.956E-03) = 4.474E+02

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
   1048576000   5.7327E-06 0.0005 0.0000 10.0     322   6.8559E-06 0.0005 0.0000 10.0     389   8.6998E-06 0.0004 0.0000 10.0     473
   2097152000   5.7358E-06 0.0004 0.0000 10.0     323   6.8549E-06 0.0003 0.0000  8.9     390   8.6996E-06 0.0003 0.0000 10.0     473
   3145728000   5.7362E-06 0.0003 0.0000 10.0     323   6.8547E-06 0.0003 0.0000  7.0     390   8.7019E-06 0.0002 0.0000 10.0     474
   4194304000   5.7365E-06 0.0003 0.0000 10.0     323   6.8534E-06 0.0002 0.0000  6.9     390   8.7006E-06 0.0002 0.0000 10.0     474
   5242880000   5.7370E-06 0.0002 0.0000 10.0     323   6.8536E-06 0.0002 0.0000  6.2     390   8.7002E-06 0.0002 0.0000 10.0     474
   6291456000   5.7373E-06 0.0002 0.0000  5.6     323   6.8556E-06 0.0002 0.0000  5.1     390   8.6996E-06 0.0002 0.0000  6.9     474
   7340032000   5.7374E-06 0.0002 0.0000  5.1     323   6.8558E-06 0.0002 0.0000  6.0     390   8.6994E-06 0.0002 0.0000  6.2     474
   8388608000   5.7368E-06 0.0002 0.0000  5.1     323   6.8559E-06 0.0002 0.0000  4.9     390   8.6994E-06 0.0002 0.0000  4.4     474
   9437184000   5.7362E-06 0.0002 0.0000  5.6     323   6.8566E-06 0.0002 0.0000  4.8     390   8.6999E-06 0.0001 0.0000  5.6     474
  10485760000   5.7362E-06 0.0002 0.0000  6.3     323   6.8557E-06 0.0001 0.0000  4.9     390   8.6990E-06 0.0001 0.0000  6.0     474
  11534336000   5.7360E-06 0.0002 0.0000  6.2     323   6.8558E-06 0.0001 0.0000  5.0     390   8.6988E-06 0.0001 0.0000  6.0     474
  12582912000   5.7363E-06 0.0001 0.0000  6.2     323   6.8565E-06 0.0001 0.0000  5.6     390   8.6986E-06 0.0001 0.0000  6.6     474
  13631488000   5.7365E-06 0.0001 0.0000  5.8     323   6.8564E-06 0.0001 0.0000  5.9     390   8.6983E-06 0.0001 0.0000  5.5     474
  14680064000   5.7366E-06 0.0001 0.0000  6.5     323   6.8565E-06 0.0001 0.0000  6.5     390   8.6984E-06 0.0001 0.0000  5.7     474
  15728640000   5.7369E-06 0.0001 0.0000  6.3     323   6.8563E-06 0.0001 0.0000  5.8     390   8.6986E-06 0.0001 0.0000  6.9     474
  16777216000   5.7370E-06 0.0001 0.0000  6.7     323   6.8564E-06 0.0001 0.0000  5.6     390   8.6988E-06 0.0001 0.0000  6.6     474
  17825792000   5.7370E-06 0.0001 0.0000  7.5     323   6.8564E-06 0.0001 0.0000  5.5     390   8.6987E-06 0.0001 0.0000  6.7     474
  18055326464   5.7371E-06 0.0001 0.0000  7.2     323   6.8565E-06 0.0001 0.0000  5.6     390   8.6986E-06 0.0001 0.0000  6.9     474
 

                            tally       34                          tally       44
          nps      mean     error   vov  slope    fom      mean     error   vov  slope    fom
   1048576000   6.8551E-06 0.0005 0.0000 10.0     380   8.0794E-06 0.0004 0.0000  5.4     446
   2097152000   6.8580E-06 0.0003 0.0000 10.0     380   8.0820E-06 0.0003 0.0000  6.8     447
   3145728000   6.8581E-06 0.0003 0.0000 10.0     380   8.0805E-06 0.0003 0.0000  7.9     447
   4194304000   6.8562E-06 0.0002 0.0000 10.0     380   8.0813E-06 0.0002 0.0000  6.1     447
   5242880000   6.8563E-06 0.0002 0.0000 10.0     380   8.0812E-06 0.0002 0.0000  7.2     447
   6291456000   6.8569E-06 0.0002 0.0000  7.4     380   8.0813E-06 0.0002 0.0000  6.2     447
   7340032000   6.8567E-06 0.0002 0.0000  7.4     380   8.0823E-06 0.0002 0.0000  5.4     447
   8388608000   6.8566E-06 0.0002 0.0000  7.7     380   8.0816E-06 0.0002 0.0000  5.1     447
   9437184000   6.8563E-06 0.0002 0.0000  7.2     380   8.0813E-06 0.0001 0.0000  4.8     447
  10485760000   6.8563E-06 0.0002 0.0000  5.9     380   8.0811E-06 0.0001 0.0000  4.8     447
  11534336000   6.8566E-06 0.0001 0.0000  6.2     380   8.0817E-06 0.0001 0.0000  4.7     447
  12582912000   6.8566E-06 0.0001 0.0000  6.8     380   8.0816E-06 0.0001 0.0000  5.0     447
  13631488000   6.8564E-06 0.0001 0.0000  6.5     380   8.0812E-06 0.0001 0.0000  4.9     447
  14680064000   6.8564E-06 0.0001 0.0000  4.5     380   8.0811E-06 0.0001 0.0000  5.1     447
  15728640000   6.8564E-06 0.0001 0.0000  4.6     380   8.0810E-06 0.0001 0.0000  5.0     447
  16777216000   6.8564E-06 0.0001 0.0000  4.9     380   8.0812E-06 0.0001 0.0000  4.7     447
  17825792000   6.8564E-06 0.0001 0.0000  4.9     380   8.0814E-06 0.0001 0.0000  4.4     447
  18055326464   6.8564E-06 0.0001 0.0000  4.9     380   8.0815E-06 0.0001 0.0000  4.2     447

 ***********************************************************************************************************************

 dump no.  168 on file inpr     nps = 18055326464     coll =    41587704477     ctm =   200000.25   nrn =     
 603977653597

         7 warning messages so far.


 run terminated when it had used*****  minutes of computer time.

 computer time =******** minutes

 mcnp     version 6     06/19/14                     08/06/17 09:55:01                     probid =  08/06/17 01:35:13 
