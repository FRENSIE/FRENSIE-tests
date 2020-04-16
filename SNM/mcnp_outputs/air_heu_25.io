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
  
1mcnp     version 6     ld=06/19/14                     08/05/17 16:11:08 
 *************************************************************************                 probid =  08/05/17 16:11:08 
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
       107-        TR1   -25 -25 -25                              $ Translation for HEU sphere    
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
       153-       sb1    4.72415e-01 5.27585e-01                                                  
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
       220-       wwp:n 5.0 j 100 j -1 0 2.209326528e-01                                          
 
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

    minimum source weight = 9.4771E-01    maximum source weight = 1.0584E+00

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

 dump no.    2 on file inpr     nps =   110620150     coll =      222937356     ctm =     1200.28   nrn =       
 3373813334

 ***********************************************************************************************************************

 dump no.    3 on file inpr     nps =   221767378     coll =      446825661     ctm =     2400.63   nrn =       
 6762480700

 ***********************************************************************************************************************

 dump no.    4 on file inpr     nps =   332934789     coll =      670797601     ctm =     3600.95   nrn =      
 10152147877

 ***********************************************************************************************************************

 dump no.    5 on file inpr     nps =   443699116     coll =      893923560     ctm =     4801.25   nrn =      
 13529225490

 ***********************************************************************************************************************

 dump no.    6 on file inpr     nps =   554913971     coll =     1117969261     ctm =     6001.60   nrn =      
 16920123598

 ***********************************************************************************************************************

 dump no.    7 on file inpr     nps =   666111557     coll =     1341940613     ctm =     7201.92   nrn =      
 20309990308

 ***********************************************************************************************************************

 dump no.    8 on file inpr     nps =   777282731     coll =     1565942762     ctm =     8402.23   nrn =      
 23699973777

 ***********************************************************************************************************************

 dump no.    9 on file inpr     nps =   887863927     coll =     1788779466     ctm =     9602.49   nrn =      
 27072201818

 ***********************************************************************************************************************

 dump no.   10 on file inpr     nps =   999044826     coll =     2012768919     ctm =    10802.71   nrn =      
 30462148009

 ***********************************************************************************************************************

 dump no.   11 on file inpr     nps =  1110223705     coll =     2236852023     ctm =    12003.05   nrn =      
 33853056382

 ***********************************************************************************************************************

 dump no.   12 on file inpr     nps =  1220832539     coll =     2459779057     ctm =    13203.32   nrn =      
 37226434564

 ***********************************************************************************************************************

 dump no.   13 on file inpr     nps =  1332024325     coll =     2683768821     ctm =    14403.57   nrn =      
 40616548209

 ***********************************************************************************************************************

 dump no.   14 on file inpr     nps =  1443206638     coll =     2907833821     ctm =    15603.92   nrn =      
 44007304357

 ***********************************************************************************************************************

 dump no.   15 on file inpr     nps =  1553907455     coll =     3130947844     ctm =    16804.23   nrn =      
 47383539873

 ***********************************************************************************************************************

 dump no.   16 on file inpr     nps =  1665129834     coll =     3355013985     ctm =    18004.55   nrn =      
 50774721018

 ***********************************************************************************************************************

 dump no.   17 on file inpr     nps =  1776344508     coll =     3579149797     ctm =    19204.90   nrn =      
 54166495991

 ***********************************************************************************************************************

 dump no.   18 on file inpr     nps =  1887505247     coll =     3803133809     ctm =    20405.18   nrn =      
 57556124532

 ***********************************************************************************************************************

 dump no.   19 on file inpr     nps =  1998151292     coll =     4026125894     ctm =    21605.48   nrn =      
 60930577627

 ***********************************************************************************************************************

 dump no.   20 on file inpr     nps =  2109581706     coll =     4250668534     ctm =    22805.80   nrn =      
 64328685020

 ***********************************************************************************************************************

 dump no.   21 on file inpr     nps =  2220997581     coll =     4475225506     ctm =    24006.02   nrn =      
 67726786887

 ***********************************************************************************************************************

 dump no.   22 on file inpr     nps =  2331848592     coll =     4698613702     ctm =    25206.28   nrn =      
 71107372005

 ***********************************************************************************************************************

 dump no.   23 on file inpr     nps =  2443277098     coll =     4923155165     ctm =    26406.71   nrn =      
 74505369333

 ***********************************************************************************************************************

 dump no.   24 on file inpr     nps =  2554672484     coll =     5147584608     ctm =    27607.00   nrn =      
 77901925274

 ***********************************************************************************************************************

 dump no.   25 on file inpr     nps =  2665400878     coll =     5370717346     ctm =    28807.25   nrn =      
 81278710667

 ***********************************************************************************************************************

 dump no.   26 on file inpr     nps =  2776847386     coll =     5595194685     ctm =    30007.65   nrn =      
 84676109526

 ***********************************************************************************************************************

 dump no.   27 on file inpr     nps =  2888237756     coll =     5819721336     ctm =    31207.97   nrn =      
 88073699718

 ***********************************************************************************************************************

 dump no.   28 on file inpr     nps =  2999624126     coll =     6044279838     ctm =    32408.28   nrn =      
 91471597308

 ***********************************************************************************************************************

 dump no.   29 on file inpr     nps =  3110406032     coll =     6267470784     ctm =    33608.54   nrn =      
 94849351797

 ***********************************************************************************************************************

 dump no.   30 on file inpr     nps =  3221834952     coll =     6491968777     ctm =    34808.91   nrn =      
 98247084829

 ***********************************************************************************************************************

 dump no.   31 on file inpr     nps =  3333253704     coll =     6716462629     ctm =    36009.25   nrn =     
 101644462857

 ***********************************************************************************************************************

 dump no.   32 on file inpr     nps =  3444119794     coll =     6939734434     ctm =    37209.72   nrn =     
 105023961598

 ***********************************************************************************************************************

 dump no.   33 on file inpr     nps =  3555541630     coll =     7164284222     ctm =    38409.99   nrn =     
 108422001798

 ***********************************************************************************************************************

 dump no.   34 on file inpr     nps =  3666957298     coll =     7388716463     ctm =    39610.25   nrn =     
 111818818712

 ***********************************************************************************************************************

 dump no.   35 on file inpr     nps =  3777789523     coll =     7612062147     ctm =    40810.56   nrn =     
 115198715158

 ***********************************************************************************************************************

 dump no.   36 on file inpr     nps =  3889266871     coll =     7836645473     ctm =    42010.95   nrn =     
 118597638564

 ***********************************************************************************************************************

 dump no.   37 on file inpr     nps =  4000727834     coll =     8061168377     ctm =    43211.20   nrn =     
 121995826589

 ***********************************************************************************************************************

 dump no.   38 on file inpr     nps =  4112124719     coll =     8285584939     ctm =    44411.59   nrn =     
 125392767644

 ***********************************************************************************************************************

 dump no.   39 on file inpr     nps =  4223050090     coll =     8509116538     ctm =    45611.90   nrn =     
 128775418551

 ***********************************************************************************************************************

 dump no.   40 on file inpr     nps =  4334448518     coll =     8733546289     ctm =    46812.18   nrn =     
 132172014392

 ***********************************************************************************************************************

 dump no.   41 on file inpr     nps =  4445834602     coll =     8957982160     ctm =    48012.45   nrn =     
 135568472360

 ***********************************************************************************************************************

 dump no.   42 on file inpr     nps =  4556783118     coll =     9181575865     ctm =    49212.77   nrn =     
 138952244547

 ***********************************************************************************************************************

 dump no.   43 on file inpr     nps =  4668192347     coll =     9406012977     ctm =    50413.19   nrn =     
 142348984282

 ***********************************************************************************************************************

 dump no.   44 on file inpr     nps =  4779566731     coll =     9630404962     ctm =    51613.58   nrn =     
 145745086796

 ***********************************************************************************************************************

 dump no.   45 on file inpr     nps =  4890397335     coll =     9853759067     ctm =    52813.83   nrn =     
 149125016034

 ***********************************************************************************************************************

 dump no.   46 on file inpr     nps =  5001851955     coll =    10078250058     ctm =    54014.18   nrn =     
 152522799255

 ***********************************************************************************************************************

 dump no.   47 on file inpr     nps =  5113239582     coll =    10302626608     ctm =    55214.48   nrn =     
 155918816545

 ***********************************************************************************************************************

 dump no.   48 on file inpr     nps =  5224667327     coll =    10527018615     ctm =    56414.80   nrn =     
 159315357683

 ***********************************************************************************************************************

 dump no.   49 on file inpr     nps =  5335597327     coll =    10750486926     ctm =    57615.10   nrn =     
 162697542511

 ***********************************************************************************************************************

 dump no.   50 on file inpr     nps =  5447025072     coll =    10975074914     ctm =    58815.41   nrn =     
 166096105829

 ***********************************************************************************************************************

 dump no.   51 on file inpr     nps =  5558457446     coll =    11199632309     ctm =    60015.79   nrn =     
 169494389043

 ***********************************************************************************************************************

 dump no.   52 on file inpr     nps =  5669215529     coll =    11422942584     ctm =    61216.21   nrn =     
 172873323428

 ***********************************************************************************************************************

 dump no.   53 on file inpr     nps =  5779238889     coll =    11644651351     ctm =    62416.48   nrn =     
 176228564673

 ***********************************************************************************************************************

 dump no.   54 on file inpr     nps =  5890628059     coll =    11869161744     ctm =    63616.84   nrn =     
 179625902847

 ***********************************************************************************************************************

 dump no.   55 on file inpr     nps =  6001643823     coll =    12092854123     ctm =    64817.13   nrn =     
 183011147990

 ***********************************************************************************************************************

 dump no.   56 on file inpr     nps =  6113116315     coll =    12317350916     ctm =    66017.54   nrn =     
 186409180497

 ***********************************************************************************************************************

 dump no.   57 on file inpr     nps =  6224565662     coll =    12541943512     ctm =    67217.84   nrn =     
 189808094651

 ***********************************************************************************************************************

 dump no.   58 on file inpr     nps =  6335974636     coll =    12766431350     ctm =    68418.20   nrn =     
 193205491961

 ***********************************************************************************************************************

 dump no.   59 on file inpr     nps =  6446876218     coll =    12990012398     ctm =    69618.47   nrn =     
 196588460739

 ***********************************************************************************************************************

 dump no.   60 on file inpr     nps =  6558331737     coll =    13214524647     ctm =    70818.92   nrn =     
 199986456756

 ***********************************************************************************************************************

 dump no.   61 on file inpr     nps =  6669767197     coll =    13439142126     ctm =    72019.29   nrn =     
 203385428883

 ***********************************************************************************************************************

 dump no.   62 on file inpr     nps =  6780548425     coll =    13662357682     ctm =    73219.58   nrn =     
 206763474447

 ***********************************************************************************************************************

 dump no.   63 on file inpr     nps =  6891975915     coll =    13886935246     ctm =    74419.81   nrn =     
 210161961938

 ***********************************************************************************************************************

 dump no.   64 on file inpr     nps =  7003412918     coll =    14111473355     ctm =    75620.15   nrn =     
 213559989019

 ***********************************************************************************************************************

 dump no.   65 on file inpr     nps =  7114397822     coll =    14335174757     ctm =    76820.51   nrn =     
 216945075116

 ***********************************************************************************************************************

 dump no.   66 on file inpr     nps =  7225830196     coll =    14559747619     ctm =    78020.83   nrn =     
 220343419087

 ***********************************************************************************************************************

 dump no.   67 on file inpr     nps =  7337264113     coll =    14784239973     ctm =    79221.19   nrn =     
 223741076824

 ***********************************************************************************************************************

 dump no.   68 on file inpr     nps =  7448677716     coll =    15008775123     ctm =    80421.58   nrn =     
 227138958604

 ***********************************************************************************************************************

 dump no.   69 on file inpr     nps =  7559505234     coll =    15232056168     ctm =    81621.95   nrn =     
 230518196054

 ***********************************************************************************************************************

 dump no.   70 on file inpr     nps =  7670953038     coll =    15456689591     ctm =    82822.32   nrn =     
 233917320737

 ***********************************************************************************************************************

 dump no.   71 on file inpr     nps =  7782417815     coll =    15681253880     ctm =    84022.81   nrn =     
 237316024049

 ***********************************************************************************************************************

 dump no.   72 on file inpr     nps =  7893223476     coll =    15904566015     ctm =    85223.11   nrn =     
 240695302421

 ***********************************************************************************************************************

 dump no.   73 on file inpr     nps =  8004683624     coll =    16129107438     ctm =    86423.57   nrn =     
 244093623474

 ***********************************************************************************************************************

 dump no.   74 on file inpr     nps =  8116115998     coll =    16353450455     ctm =    87623.89   nrn =     
 247489784486

 ***********************************************************************************************************************

 dump no.   75 on file inpr     nps =  8227005236     coll =    16576846318     ctm =    88824.18   nrn =     
 250870835043

 ***********************************************************************************************************************

 dump no.   76 on file inpr     nps =  8338425266     coll =    16801434039     ctm =    90024.55   nrn =     
 254269287866

 ***********************************************************************************************************************

 dump no.   77 on file inpr     nps =  8449851213     coll =    17025970914     ctm =    91224.88   nrn =     
 257667392078

 ***********************************************************************************************************************

 dump no.   78 on file inpr     nps =  8561261985     coll =    17250511578     ctm =    92425.26   nrn =     
 261065161591

 ***********************************************************************************************************************

 dump no.   79 on file inpr     nps =  8672162024     coll =    17473981044     ctm =    93625.67   nrn =     
 264447146167

 ***********************************************************************************************************************

 dump no.   80 on file inpr     nps =  8783612914     coll =    17698497836     ctm =    94826.00   nrn =     
 267845055510

 ***********************************************************************************************************************

 dump no.   81 on file inpr     nps =  8895039116     coll =    17922988496     ctm =    96026.38   nrn =     
 271242588021

 ***********************************************************************************************************************

 dump no.   82 on file inpr     nps =  9006019136     coll =    18146562237     ctm =    97226.70   nrn =     
 274626361395

 ***********************************************************************************************************************

 dump no.   83 on file inpr     nps =  9117429908     coll =    18371011278     ctm =    98426.98   nrn =     
 278023344488

 ***********************************************************************************************************************

 dump no.   84 on file inpr     nps =  9228814449     coll =    18595420600     ctm =    99627.29   nrn =     
 281419648740

 ***********************************************************************************************************************

 dump no.   85 on file inpr     nps =  9339623451     coll =    18818574325     ctm =   100827.62   nrn =     
 284797378027

 ***********************************************************************************************************************

 dump no.   86 on file inpr     nps =  9450979963     coll =    19042843271     ctm =   102027.89   nrn =     
 288192027855

 ***********************************************************************************************************************

 dump no.   87 on file inpr     nps =  9562403079     coll =    19267309980     ctm =   103228.17   nrn =     
 291589257061

 ***********************************************************************************************************************

 dump no.   88 on file inpr     nps =  9673786077     coll =    19491732739     ctm =   104428.46   nrn =     
 294985724719

 ***********************************************************************************************************************

 dump no.   89 on file inpr     nps =  9784576563     coll =    19714927424     ctm =   105628.76   nrn =     
 298363580202

 ***********************************************************************************************************************

 dump no.   90 on file inpr     nps =  9895987335     coll =    19939483042     ctm =   106829.08   nrn =     
 301761590866

 ***********************************************************************************************************************

 dump no.   91 on file inpr     nps = 10007396309     coll =    20163878260     ctm =   108029.39   nrn =     
 305157938720

 ***********************************************************************************************************************

 dump no.   92 on file inpr     nps = 10118192967     coll =    20387033614     ctm =   109229.70   nrn =     
 308535637767

 ***********************************************************************************************************************

 dump no.   93 on file inpr     nps = 10229623798     coll =    20611526692     ctm =   110430.04   nrn =     
 311933328170

 ***********************************************************************************************************************

 dump no.   94 on file inpr     nps = 10340997538     coll =    20836000539     ctm =   111630.33   nrn =     
 315330011432

 ***********************************************************************************************************************

 dump no.   95 on file inpr     nps = 10451808083     coll =    21059244506     ctm =   112830.75   nrn =     
 318708742363

 ***********************************************************************************************************************

 dump no.   96 on file inpr     nps = 10563238659     coll =    21283747187     ctm =   114031.06   nrn =     
 322106428557

 ***********************************************************************************************************************

 dump no.   97 on file inpr     nps = 10674664861     coll =    21508238172     ctm =   115231.37   nrn =     
 325503963838

 ***********************************************************************************************************************

 dump no.   98 on file inpr     nps = 10786027800     coll =    21732686541     ctm =   116431.65   nrn =     
 328900455539

 ***********************************************************************************************************************

 dump no.   99 on file inpr     nps = 10896934011     coll =    21956026324     ctm =   117632.05   nrn =     
 332281004466

 ***********************************************************************************************************************

 dump no.  100 on file inpr     nps = 11008327810     coll =    22180526492     ctm =   118832.34   nrn =     
 335678265997

 ***********************************************************************************************************************

 dump no.  101 on file inpr     nps = 11119723152     coll =    22405110636     ctm =   120032.74   nrn =     
 339076445326

 ***********************************************************************************************************************

 dump no.  102 on file inpr     nps = 11230539384     coll =    22628288128     ctm =   121232.97   nrn =     
 342454558478

 ***********************************************************************************************************************

 dump no.  103 on file inpr     nps = 11341923925     coll =    22852645576     ctm =   122433.23   nrn =     
 345850167665

 ***********************************************************************************************************************

 dump no.  104 on file inpr     nps = 11453289950     coll =    23077027046     ctm =   123633.60   nrn =     
 349245777375

 ***********************************************************************************************************************

 dump no.  105 on file inpr     nps = 11564110144     coll =    23300270570     ctm =   124833.94   nrn =     
 352624615707

 ***********************************************************************************************************************

 dump no.  106 on file inpr     nps = 11675496228     coll =    23524679134     ctm =   126034.23   nrn =     
 356020833120

 ***********************************************************************************************************************

 dump no.  107 on file inpr     nps = 11786874597     coll =    23749084060     ctm =   127234.55   nrn =     
 359416865169

 ***********************************************************************************************************************

 dump no.  108 on file inpr     nps = 11898232403     coll =    23973424028     ctm =   128434.94   nrn =     
 362812300757

 ***********************************************************************************************************************

 dump no.  109 on file inpr     nps = 12009037025     coll =    24196644713     ctm =   129635.26   nrn =     
 366190705674

 ***********************************************************************************************************************

 dump no.  110 on file inpr     nps = 12120406136     coll =    24421122040     ctm =   130835.54   nrn =     
 369587506355

 ***********************************************************************************************************************

 dump no.  111 on file inpr     nps = 12231800142     coll =    24645572019     ctm =   132035.91   nrn =     
 372984328994

 ***********************************************************************************************************************

 dump no.  112 on file inpr     nps = 12342602666     coll =    24868884166     ctm =   133236.31   nrn =     
 376363796950

 ***********************************************************************************************************************

 dump no.  113 on file inpr     nps = 12454004180     coll =    25093323579     ctm =   134436.54   nrn =     
 379760659640

 ***********************************************************************************************************************

 dump no.  114 on file inpr     nps = 12565375789     coll =    25317729540     ctm =   135636.91   nrn =     
 383156666064

 ***********************************************************************************************************************

 dump no.  115 on file inpr     nps = 12676308436     coll =    25541266448     ctm =   136837.22   nrn =     
 386539622643

 ***********************************************************************************************************************

 dump no.  116 on file inpr     nps = 12787700692     coll =    25765728598     ctm =   138037.53   nrn =     
 389936502556

 ***********************************************************************************************************************

 dump no.  117 on file inpr     nps = 12899077758     coll =    25990185526     ctm =   139237.80   nrn =     
 393333075294

 ***********************************************************************************************************************

 dump no.  118 on file inpr     nps = 13010417142     coll =    26214625994     ctm =   140438.12   nrn =     
 396729268113

 ***********************************************************************************************************************

 dump no.  119 on file inpr     nps = 13121342466     coll =    26438093557     ctm =   141638.44   nrn =     
 400111208513

 ***********************************************************************************************************************

 dump no.  120 on file inpr     nps = 13232744625     coll =    26662564829     ctm =   142838.81   nrn =     
 403508297317

 ***********************************************************************************************************************

 dump no.  121 on file inpr     nps = 13344114889     coll =    26886954788     ctm =   144039.11   nrn =     
 406904391203

 ***********************************************************************************************************************

 dump no.  122 on file inpr     nps = 13454984055     coll =    27110349758     ctm =   145239.48   nrn =     
 410285039708

 ***********************************************************************************************************************

 dump no.  123 on file inpr     nps = 13566366671     coll =    27334663254     ctm =   146439.72   nrn =     
 413680304816

 ***********************************************************************************************************************

 dump no.  124 on file inpr     nps = 13677139198     coll =    27557964562     ctm =   147640.09   nrn =     
 417059157497

 ***********************************************************************************************************************

 dump no.  125 on file inpr     nps = 13788048495     coll =    27781527970     ctm =   148840.37   nrn =     
 420441953714

 ***********************************************************************************************************************

 dump no.  126 on file inpr     nps = 13899479326     coll =    28006098657     ctm =   150040.76   nrn =     
 423840382461

 ***********************************************************************************************************************

 dump no.  127 on file inpr     nps = 14010893184     coll =    28230632126     ctm =   151241.12   nrn =     
 427238053536

 ***********************************************************************************************************************

 dump no.  128 on file inpr     nps = 14122281256     coll =    28455150687     ctm =   152441.52   nrn =     
 430635554242

 ***********************************************************************************************************************

 dump no.  129 on file inpr     nps = 14233109398     coll =    28678481157     ctm =   153641.88   nrn =     
 434015312240

 ***********************************************************************************************************************

 dump no.  130 on file inpr     nps = 14344492396     coll =    28902937600     ctm =   154842.16   nrn =     
 437412060769

 ***********************************************************************************************************************

 dump no.  131 on file inpr     nps = 14455855771     coll =    29127317086     ctm =   156042.41   nrn =     
 440807789447

 ***********************************************************************************************************************

 dump no.  132 on file inpr     nps = 14566627850     coll =    29350456435     ctm =   157242.76   nrn =     
 444185167519

 ***********************************************************************************************************************

 dump no.  133 on file inpr     nps = 14678026278     coll =    29574789781     ctm =   158443.08   nrn =     
 447580875322

 ***********************************************************************************************************************

 dump no.  134 on file inpr     nps = 14789402686     coll =    29799200778     ctm =   159643.42   nrn =     
 450977066438

 ***********************************************************************************************************************

 dump no.  135 on file inpr     nps = 14900044564     coll =    30022117748     ctm =   160843.69   nrn =     
 454350771167

 ***********************************************************************************************************************

 dump no.  136 on file inpr     nps = 15011426019     coll =    30246575333     ctm =   162044.00   nrn =     
 457747621080

 ***********************************************************************************************************************

 dump no.  137 on file inpr     nps = 15122792044     coll =    30471001803     ctm =   163244.28   nrn =     
 461144064410

 ***********************************************************************************************************************

 dump no.  138 on file inpr     nps = 15234141378     coll =    30695375497     ctm =   164444.64   nrn =     
 464539554543

 ***********************************************************************************************************************

 dump no.  139 on file inpr     nps = 15345088418     coll =    30918840727     ctm =   165645.03   nrn =     
 467921880449

 ***********************************************************************************************************************

 dump no.  140 on file inpr     nps = 15456474502     coll =    31143288097     ctm =   166845.31   nrn =     
 471318478707

 ***********************************************************************************************************************

 dump no.  141 on file inpr     nps = 15567872226     coll =    31367694401     ctm =   168045.60   nrn =     
 474714787565

 ***********************************************************************************************************************

 dump no.  142 on file inpr     nps = 15678593580     coll =    31590809105     ctm =   169245.90   nrn =     
 478091343889

 ***********************************************************************************************************************

 dump no.  143 on file inpr     nps = 15789983508     coll =    31815374030     ctm =   170446.18   nrn =     
 481489167624

 ***********************************************************************************************************************

 dump no.  144 on file inpr     nps = 15901371714     coll =    32039823733     ctm =   171646.61   nrn =     
 484886078640

 ***********************************************************************************************************************

 dump no.  145 on file inpr     nps = 16012162536     coll =    32263075379     ctm =   172846.87   nrn =     
 488264675888

 ***********************************************************************************************************************

 dump no.  146 on file inpr     nps = 16123593367     coll =    32487562435     ctm =   174047.22   nrn =     
 491662186382

 ***********************************************************************************************************************

 dump no.  147 on file inpr     nps = 16235001674     coll =    32712040135     ctm =   175247.45   nrn =     
 495059395004

 ***********************************************************************************************************************

 dump no.  148 on file inpr     nps = 16346393554     coll =    32936516992     ctm =   176447.69   nrn =     
 498456532253

 ***********************************************************************************************************************

 dump no.  149 on file inpr     nps = 16457300959     coll =    33160017085     ctm =   177648.01   nrn =     
 501838803476

 ***********************************************************************************************************************

 dump no.  150 on file inpr     nps = 16568753047     coll =    33384518301     ctm =   178848.37   nrn =     
 505236636579

 ***********************************************************************************************************************

 dump no.  151 on file inpr     nps = 16680185071     coll =    33608988064     ctm =   180048.68   nrn =     
 508634092644

 ***********************************************************************************************************************

 dump no.  152 on file inpr     nps = 16791204640     coll =    33832629837     ctm =   181249.03   nrn =     
 512018954981

 ***********************************************************************************************************************

 dump no.  153 on file inpr     nps = 16902658280     coll =    34057202586     ctm =   182449.39   nrn =     
 515417754573

 ***********************************************************************************************************************

 dump no.  154 on file inpr     nps = 17014091848     coll =    34281689549     ctm =   183649.72   nrn =     
 518815368795

 ***********************************************************************************************************************

 dump no.  155 on file inpr     nps = 17124972664     coll =    34504954177     ctm =   184849.99   nrn =     
 522194910990

 ***********************************************************************************************************************

 dump no.  156 on file inpr     nps = 17236410864     coll =    34729626448     ctm =   186050.28   nrn =     
 525594337910

 ***********************************************************************************************************************

 dump no.  157 on file inpr     nps = 17347875312     coll =    34954202428     ctm =   187250.55   nrn =     
 528996700877

 ***********************************************************************************************************************

 dump no.  158 on file inpr     nps = 17459281088     coll =    35178698405     ctm =   188451.03   nrn =     
 532394132123

 ***********************************************************************************************************************

 dump no.  159 on file inpr     nps = 17570117128     coll =    35401978120     ctm =   189651.36   nrn =     
 535773469353

 ***********************************************************************************************************************

 dump no.  160 on file inpr     nps = 17681603192     coll =    35626652390     ctm =   190851.77   nrn =     
 539173544490

 ***********************************************************************************************************************

 dump no.  161 on file inpr     nps = 17793042936     coll =    35851290482     ctm =   192052.04   nrn =     
 542572735184

 ***********************************************************************************************************************

 dump no.  162 on file inpr     nps = 17903941560     coll =    36074717926     ctm =   193252.35   nrn =     
 545954260026

 ***********************************************************************************************************************

 dump no.  163 on file inpr     nps = 18015338072     coll =    36299241888     ctm =   194452.68   nrn =     
 549351728264

 ***********************************************************************************************************************

 dump no.  164 on file inpr     nps = 18126762376     coll =    36523788048     ctm =   195653.03   nrn =     
 552749774789

 ***********************************************************************************************************************

 dump no.  165 on file inpr     nps = 18237669440     coll =    36747251857     ctm =   196853.33   nrn =     
 556131837840

 ***********************************************************************************************************************

 dump no.  166 on file inpr     nps = 18349129256     coll =    36971800162     ctm =   198053.65   nrn =     
 559530444976

 ***********************************************************************************************************************

 dump no.  167 on file inpr     nps = 18460573632     coll =    37196395679     ctm =   199254.00   nrn =     
 562929081441
1problem summary                                                                                                           

      run terminated when it had used*****  minutes of computer time.
+                                                                                                    08/06/17 00:30:59 
      c //-------------------------------------------------------------------------//      probid =  08/05/17 16:11:08 

 neutron creation    tracks      weight        energy            neutron loss        tracks      weight        energy
                                 (per source particle)                                           (per source particle)

 source         18529840560    1.0000E+00    1.4100E+01          escape         29907380203    1.0414E+00    1.0607E+01
 nucl. interaction        0    0.            0.                  energy cutoff            0    0.            0.        
 particle decay           0    0.            0.                  time cutoff        1432063    6.5854E-05    3.3473E-05
 weight window  11021022914    1.8265E-02    8.8303E-02          weight window   1941192510    1.8268E-02    8.8309E-02
 cell importance          0    0.            0.                  cell importance          0    0.            0.        
 weight cutoff            0    0.            0.                  weight cutoff            0    0.            0.        
 e or t importance        0    0.            0.                  e or t importance        0    0.            0.        
 dxtran                   0    0.            0.                  dxtran                   0    0.            0.        
 forced collisions        0    0.            0.                  forced collisions        0    0.            0.        
 exp. transform           0    0.            0.                  exp. transform           0    0.            0.        
 upscattering             0    0.            1.7415E-14          downscattering           0    0.            1.8723E+00
 photonuclear             0    0.            0.                  capture                109    5.0470E-02    6.6518E-01
 (n,xn)          4208613383    1.6535E-01    1.9647E-01          loss to (n,xn)  2104162110    8.2666E-02    1.1616E+00
 prompt fission   294423062    1.3879E-02    2.8469E-02          loss to fission  101261928    4.7069E-03    1.8977E-02
 delayed fission    1529004    7.0308E-05    3.5844E-05          nucl. interaction        0    0.            0.        
 prompt photofis          0    0.            0.                  particle decay           0    0.            0.        
 tabular boundary         0    0.            0.                  tabular boundary         0    0.            0.        
 tabular sampling         0    0.            0.                  elastic scatter          0    0.            0.        
     total      34055428923    1.1976E+00    1.4413E+01              total      34055428923    1.1976E+00    1.4413E+01

   number of neutrons banked             -1175605188        average time of (shakes)              cutoffs
   neutron tracks per source particle     1.8379E+00          escape            5.0001E+06          tco   2.0000E+07
   neutron collisions per source particle 2.0149E+00          capture           5.0001E+06          eco   0.0000E+00
   total neutron collisions              -2147483648          capture or escape 5.0001E+06          wc1  -5.0000E-01
   net multiplication              1.0919E+00 0.0000          any termination   4.6578E+06          wc2  -2.5000E-01

 computer time so far in this run200002.52 minutes            maximum number ever in bank        39
 computer time in mcrun          200000.24 minutes            bank overflows to backup file       0
 source particles per minute            9.2649E+04
 random numbers generated             565041727151            most random numbers used was     3596033 in history 17290241900
 
  warning.   random number stride   152917 exceeded        3 times.
 
  warning.  random number period exceeded.  decrease stride.

 range of sampled source weights = 9.4771E-01 to 1.0584E+00

 number of histories processed by each thread
   898390132   928881562   931010218   928199365   927357570   927401530   925524902   927471093   929002837   930568589
   926349756   924099707   927431309   925218256   927569984   928755159   926944064   926948193   931781695   930934639
 
  warning.  some of the geometry is covered by a weight window mesh.
1neutron  activity in each cell                                                                         print table 126

                       tracks     population   collisions   collisions     number        flux        average      average
              cell    entering                               * weight     weighted     weighted   track weight   track mfp
                                                          (per history)    energy       energy     (relative)      (cm)

        1        1 37770705364  30249098057    108901489    4.1839E-03   6.0874E+00   1.0829E+01   7.5132E-01   1.1947E+04
        2        2 18520509539  19360195715  36566018852    1.2583E+00   3.4367E+00   8.1682E+00   6.5347E-01   4.2379E+00
        3        3 11490425178   8965808392     75629087    2.6980E-03   3.0106E+00   7.6857E+00   7.1346E-01   1.1099E+04
        4        4    80156955    278607234    580390093    2.6948E-02   1.3870E+00   3.1937E+00   8.6742E-01   2.8073E+00
        5       10   642702926    921662853       914770    2.3743E-06   2.4166E+00   6.3592E+00   4.8543E-02   1.0746E+04
        6       11   783343716    995388885       982976    2.7941E-06   2.5591E+00   6.6143E+00   5.3382E-02   1.0836E+04
        7       12   904434475   1204271003      1176986    3.3828E-06   2.4623E+00   6.4331E+00   5.3827E-02   1.0775E+04
        8       13   770188970    981362243       966612    2.7931E-06   2.5599E+00   6.6150E+00   5.4268E-02   1.0837E+04
        9       14   881178648   1036444566      1021340    3.2071E-06   2.6778E+00   6.8144E+00   5.9089E-02   1.0905E+04

           total   71843645771  63992838948  37336002205    1.2921E+00

1tally        4        nps = 18529840560
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      10                                                                                   
                         4.00000E+03
 
 cell  10                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 5.63756E-06 0.0001   1.40319E-11 0.0690   1.00246E-11 0.0805   9.03432E-12 0.0879   9.30177E-12 0.0850
 
         time:       2.0000E+07             total                                                                  
                 1.04118E-11 0.0864   5.63761E-06 0.0001


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally        4

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00      yes         yes            constant   increase      6.62
 passed?        yes          yes      yes          yes             yes      yes         yes               yes         no         yes

 ===================================================================================================================================


 warning.  the tally in the tally fluctuation chart bin did not pass  1 of the 10 statistical checks.

1analysis of the results in the tally fluctuation chart bin (tfc) for tally        4 with nps = 18529840560  print table 160


 normed average tally per history  = 5.63761E-06          unnormed average tally per history  = 2.25505E-02
 estimated tally relative error    = 0.0001               estimated variance of the variance  = 0.0000
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =   106661002          efficiency for the nonzero tallies  = 0.0058
 history number of largest  tally  = 10626091535          largest  unnormalized history tally = 9.22601E+01
 (largest  tally)/(average tally)  = 4.09127E+03          (largest  tally)/(avg nonzero tally)= 2.35501E+01

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 5.63761E-06


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            5.63761E-06             5.63762E-06                     0.000000
      relative error                  1.24567E-04             1.24567E-04                     0.000001
      variance of the variance        2.72075E-08             2.72172E-08                     0.000356
      shifted center                  5.63761E-06             5.63761E-06                     0.000000
      figure of merit                 3.22229E+02             3.22228E+02                    -0.000003

 the estimated inverse power slope of the 200 largest  tallies starting at 3.51300E+01 is 6.6233
 the large score tail of the empirical history score probability density function appears to have no unsampled regions.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (9.265E+04)*( 5.897E-02)**2 = (9.265E+04)*(3.478E-03) = 3.222E+02

1unnormed tally density for tally        4          nonzero tally mean(m) = 3.918E+00   nps = 18529840560  print table 161

 abscissa              ordinate   log plot of tally probability density function in tally fluctuation chart bin(d=decade,slope= 6.6)
  tally  number num den log den:d---------d----------d----------d---------d----------d----------d----------d----------d----------d--
 2.51-08      1 5.82-03  -2.235 **********|**********|**********|*********|**********|**********|**********|**********|**********|**
 3.98-08      0 0.00+00   0.000           |          |          |         |          |          |          |          |          |  
 6.31-08      0 0.00+00   0.000           |          |          |         |          |          |          |          |          |  
 1.00-07      1 1.46-03  -2.835 **********|**********|**********|*********|**********|**********|**********|**********|******    |  
 1.58-07      3 2.77-03  -2.558 **********|**********|**********|*********|**********|**********|**********|**********|********* |  
 2.51-07      1 5.82-04  -3.235 **********|**********|**********|*********|**********|**********|**********|**********|**        |  
 3.98-07      4 1.47-03  -2.833 **********|**********|**********|*********|**********|**********|**********|**********|*******   |  
 6.31-07      4 9.27-04  -3.033 **********|**********|**********|*********|**********|**********|**********|**********|****      |  
 1.00-06      4 5.85-04  -3.233 **********|**********|**********|*********|**********|**********|**********|**********|**        |  
 1.58-06     13 1.20-03  -2.921 **********|**********|**********|*********|**********|**********|**********|**********|******    |  
 2.51-06     20 1.16-03  -2.934 **********|**********|**********|*********|**********|**********|**********|**********|*****     |  
 3.98-06     45 1.65-03  -2.782 **********|**********|**********|*********|**********|**********|**********|**********|*******   |  
 6.31-06     49 1.14-03  -2.945 **********|**********|**********|*********|**********|**********|**********|**********|*****     |  
 1.00-05     93 1.36-03  -2.866 **********|**********|**********|*********|**********|**********|**********|**********|******    |  
 1.58-05    125 1.15-03  -2.938 **********|**********|**********|*********|**********|**********|**********|**********|*****     |  
 2.51-05    187 1.09-03  -2.963 **********|**********|**********|*********|**********|**********|**********|**********|*****     |  
 3.98-05    294 1.08-03  -2.967 **********|**********|**********|*********|**********|**********|**********|**********|*****     |  
 6.31-05    514 1.19-03  -2.924 **********|**********|**********|*********|**********|**********|**********|**********|******    |  
 1.00-04    848 1.24-03  -2.907 **********|**********|**********|*********|**********|**********|**********|**********|******    |  
 1.58-04   1304 1.20-03  -2.920 **********|**********|**********|*********|**********|**********|**********|**********|******    |  
 2.51-04   2080 1.21-03  -2.917 **********|**********|**********|*********|**********|**********|**********|**********|******    |  
 3.98-04   3253 1.19-03  -2.923 **********|**********|**********|*********|**********|**********|**********|**********|******    |  
 6.31-04   5201 1.21-03  -2.919 **********|**********|**********|*********|**********|**********|**********|**********|******    |  
 1.00-03   8117 1.19-03  -2.926 **********|**********|**********|*********|**********|**********|**********|**********|******    |  
 1.58-03  12897 1.19-03  -2.924 **********|**********|**********|*********|**********|**********|**********|**********|******    |  
 2.51-03  20312 1.18-03  -2.927 **********|**********|**********|*********|**********|**********|**********|**********|*****     |  
 3.98-03  32320 1.19-03  -2.925 **********|**********|**********|*********|**********|**********|**********|**********|******    |  
 6.31-03  50997 1.18-03  -2.927 **********|**********|**********|*********|**********|**********|**********|**********|*****     |  
 1.00-02  80590 1.18-03  -2.929 **********|**********|**********|*********|**********|**********|**********|**********|*****     |  
 1.58-02 126130 1.16-03  -2.934 **********|**********|**********|*********|**********|**********|**********|**********|*****     |  
 2.51-02 198502 1.16-03  -2.937 **********|**********|**********|*********|**********|**********|**********|**********|*****     |  
 3.98-02 310612 1.14-03  -2.943 **********|**********|**********|*********|**********|**********|**********|**********|*****     |  
 6.31-02 484803 1.12-03  -2.949 **********|**********|**********|*********|**********|**********|**********|**********|*****     |  
 1.00-01 752101 1.10-03  -2.959 **********|**********|**********|*********|**********|**********|**********|**********|*****     |  
 1.58-01 1.2+06 1.08-03  -2.968 **********|**********|**********|*********|**********|**********|**********|**********|*****     |  
 2.51-01 1.8+06 1.05-03  -2.978 **********|**********|**********|*********|**********|**********|**********|**********|*****     |  
 3.98-01 2.9+06 1.06-03  -2.975 **********|**********|**********|*********|**********|**********|**********|**********|*****     |  
 6.31-01 5.0+06 1.15-03  -2.939 **********|**********|**********|*********|**********|**********|**********|**********|*****     |  
 1.00+00 8.1+06 1.18-03  -2.927 **********|**********|**********|*********|**********|**********|**********|**********|*****     |  
 1.58+00 1.2+07 1.09-03  -2.964 **********|**********|**********|*********|**********|**********|**********|**********|*****     |  
 2.51+00 1.5+07 8.54-04  -3.069 **********|**********|**********|*********|**********|**********|**********|**********|****      |  
 3.98+00 1.7+07 6.12-04  -3.214 mmmmmmmmmm|mmmmmmmmmm|mmmmmmmmmm|mmmmmmmmm|mmmmmmmmmm|mmmmmmmmmm|mmmmmmmmmm|mmmmmmmmmm|mm        |  
 6.31+00 1.7+07 3.89-04  -3.410 **********|**********|**********|*********|**********|**********|**********|**********|          |  
 1.00+01 2.0+07 2.99-04  -3.525 **********|**********|**********|*********|**********|**********|**********|**********|          |  
 1.58+01 5.3+06 4.87-05  -4.312 **********|**********|**********|*********|**********|**********|**********|*         |          |  
 2.51+01  54878 3.19-07  -6.496 **********|**********|**********|*********|**********|          |          |          |          |  
 3.98+01   5999 2.20-08  -7.657 **********|**********|**********|******** |       s  |          |          |          |          |  
 6.31+01     65 1.51-10  -9.822 **********|*******   |          |        s|          |          |          |          |          |  
 1.00+02      3 4.39-12 -11.358 *         |          |         s|         |          |          |          |          |          |  
  total 1.07+08 5.76-03         d---------d----------d----------d---------d----------d----------d----------d----------d----------d--

1tally       14        nps = 18529840560
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      11                                                                                   
                         4.00000E+03
 
 cell  11                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 6.71475E-06 0.0001   1.89949E-11 0.0609   1.31106E-11 0.0721   1.28790E-11 0.0737   1.21632E-11 0.0756
 
         time:       2.0000E+07             total                                                                  
                 1.25505E-11 0.0777   6.71482E-06 0.0001


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

 estimated asymmetric confidence interval(1,2,3 sigma): 6.7141E-06 to 6.7156E-06; 6.7133E-06 to 6.7163E-06; 6.7125E-06 to 6.7171E-06
 estimated  symmetric confidence interval(1,2,3 sigma): 6.7141E-06 to 6.7156E-06; 6.7133E-06 to 6.7163E-06; 6.7125E-06 to 6.7171E-06

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       14 with nps = 18529840560  print table 160


 normed average tally per history  = 6.71482E-06          unnormed average tally per history  = 2.68593E-02
 estimated tally relative error    = 0.0001               estimated variance of the variance  = 0.0000
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =   122931290          efficiency for the nonzero tallies  = 0.0066
 history number of largest  tally  = 14213565813          largest  unnormalized history tally = 5.20950E+01
 (largest  tally)/(average tally)  = 1.93956E+03          (largest  tally)/(avg nonzero tally)= 1.28675E+01

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 6.71482E-06


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            6.71482E-06             6.71482E-06                     0.000000
      relative error                  1.13723E-04             1.13723E-04                     0.000000
      variance of the variance        2.13716E-08             2.13723E-08                     0.000032
      shifted center                  6.71482E-06             6.71482E-06                     0.000000
      figure of merit                 3.86608E+02             3.86608E+02                    -0.000001

 the estimated slope of the 200 largest  tallies starting at  3.52601E+01 appears to be decreasing at least exponentially.
 the large score tail of the empirical history score probability density function appears to have no unsampled regions.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (9.265E+04)*( 6.460E-02)**2 = (9.265E+04)*(4.173E-03) = 3.866E+02

1tally       24        nps = 18529840560
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      12                                                                                   
                         4.00000E+03
 
 cell  12                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 8.06522E-06 0.0001   2.34550E-11 0.0548   2.00661E-11 0.0617   1.73256E-11 0.0665   1.52183E-11 0.0688
 
         time:       2.0000E+07             total                                                                  
                 1.62366E-11 0.0666   8.06531E-06 0.0001


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       24

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00      yes         yes            constant    random      10.00
 passed?        yes          yes      yes          yes             yes      yes         yes               yes        yes         yes

 ===================================================================================================================================


 this tally meets the statistical criteria used to form confidence intervals: check the tally fluctuation chart to verify.
 the results in other bins associated with this tally may not meet these statistical criteria.

 ----- estimated confidence intervals:  -----

 estimated asymmetric confidence interval(1,2,3 sigma): 8.0645E-06 to 8.0662E-06; 8.0636E-06 to 8.0670E-06; 8.0628E-06 to 8.0678E-06
 estimated  symmetric confidence interval(1,2,3 sigma): 8.0645E-06 to 8.0662E-06; 8.0636E-06 to 8.0670E-06; 8.0628E-06 to 8.0678E-06

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       24 with nps = 18529840560  print table 160


 normed average tally per history  = 8.06531E-06          unnormed average tally per history  = 3.22613E-02
 estimated tally relative error    = 0.0001               estimated variance of the variance  = 0.0000
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =   149733559          efficiency for the nonzero tallies  = 0.0081
 history number of largest  tally  =  8175713662          largest  unnormalized history tally = 6.55985E+01
 (largest  tally)/(average tally)  = 2.03335E+03          (largest  tally)/(avg nonzero tally)= 1.64309E+01

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 8.06531E-06


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            8.06531E-06             8.06532E-06                     0.000000
      relative error                  1.04257E-04             1.04257E-04                     0.000000
      variance of the variance        1.76109E-08             1.76121E-08                     0.000067
      shifted center                  8.06531E-06             8.06531E-06                     0.000000
      figure of merit                 4.60002E+02             4.60002E+02                    -0.000001

 the estimated slope of the 200 largest  tallies starting at  3.62175E+01 appears to be decreasing at least exponentially.
 the large score tail of the empirical history score probability density function appears to have no unsampled regions.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (9.265E+04)*( 7.046E-02)**2 = (9.265E+04)*(4.965E-03) = 4.600E+02

1tally       34        nps = 18529840560
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      13                                                                                   
                         4.00000E+03
 
 cell  13                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 6.71504E-06 0.0001   1.83372E-11 0.0645   1.14288E-11 0.0741   1.34954E-11 0.0739   1.26665E-11 0.0739
 
         time:       2.0000E+07             total                                                                  
                 9.85720E-12 0.0838   6.71511E-06 0.0001


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       34

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00      yes         yes            constant    random       7.59
 passed?        yes          yes      yes          yes             yes      yes         yes               yes        yes         yes

 ===================================================================================================================================


 this tally meets the statistical criteria used to form confidence intervals: check the tally fluctuation chart to verify.
 the results in other bins associated with this tally may not meet these statistical criteria.

 ----- estimated confidence intervals:  -----

 estimated asymmetric confidence interval(1,2,3 sigma): 6.7143E-06 to 6.7159E-06; 6.7136E-06 to 6.7167E-06; 6.7128E-06 to 6.7174E-06
 estimated  symmetric confidence interval(1,2,3 sigma): 6.7143E-06 to 6.7159E-06; 6.7136E-06 to 6.7167E-06; 6.7128E-06 to 6.7174E-06

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       34 with nps = 18529840560  print table 160


 normed average tally per history  = 6.71511E-06          unnormed average tally per history  = 2.68604E-02
 estimated tally relative error    = 0.0001               estimated variance of the variance  = 0.0000
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =   121308290          efficiency for the nonzero tallies  = 0.0065
 history number of largest  tally  =  5096095582          largest  unnormalized history tally = 6.00783E+01
 (largest  tally)/(average tally)  = 2.23668E+03          (largest  tally)/(avg nonzero tally)= 1.46428E+01

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 6.71511E-06


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            6.71511E-06             6.71511E-06                     0.000000
      relative error                  1.15076E-04             1.15076E-04                     0.000000
      variance of the variance        2.15054E-08             2.15066E-08                     0.000054
      shifted center                  6.71511E-06             6.71511E-06                     0.000000
      figure of merit                 3.77572E+02             3.77572E+02                    -0.000001

 the estimated inverse power slope of the 200 largest  tallies starting at 3.46441E+01 is 7.5905
 the large score tail of the empirical history score probability density function appears to have no unsampled regions.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (9.265E+04)*( 6.384E-02)**2 = (9.265E+04)*(4.075E-03) = 3.776E+02

1tally       44        nps = 18529840560
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      14                                                                                   
                         4.00000E+03
 
 cell  14                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 7.77609E-06 0.0001   2.55516E-11 0.0542   1.90624E-11 0.0626   1.94011E-11 0.0621   1.72723E-11 0.0652
 
         time:       2.0000E+07             total                                                                  
                 1.99185E-11 0.0610   7.77619E-06 0.0001


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       44

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00      yes         yes            constant    random       8.46
 passed?        yes          yes      yes          yes             yes      yes         yes               yes        yes         yes

 ===================================================================================================================================


 this tally meets the statistical criteria used to form confidence intervals: check the tally fluctuation chart to verify.
 the results in other bins associated with this tally may not meet these statistical criteria.

 ----- estimated confidence intervals:  -----

 estimated asymmetric confidence interval(1,2,3 sigma): 7.7754E-06 to 7.7770E-06; 7.7745E-06 to 7.7778E-06; 7.7737E-06 to 7.7787E-06
 estimated  symmetric confidence interval(1,2,3 sigma): 7.7754E-06 to 7.7770E-06; 7.7745E-06 to 7.7778E-06; 7.7737E-06 to 7.7787E-06

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       44 with nps = 18529840560  print table 160


 normed average tally per history  = 7.77619E-06          unnormed average tally per history  = 3.11048E-02
 estimated tally relative error    = 0.0001               estimated variance of the variance  = 0.0000
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =   137315839          efficiency for the nonzero tallies  = 0.0074
 history number of largest  tally  =  2745916951          largest  unnormalized history tally = 5.77897E+01
 (largest  tally)/(average tally)  = 1.85790E+03          (largest  tally)/(avg nonzero tally)= 1.37680E+01

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 7.77619E-06


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            7.77619E-06             7.77619E-06                     0.000000
      relative error                  1.06712E-04             1.06712E-04                     0.000000
      variance of the variance        1.79525E-08             1.79533E-08                     0.000042
      shifted center                  7.77619E-06             7.77619E-06                     0.000000
      figure of merit                 4.39080E+02             4.39080E+02                    -0.000001

 the estimated inverse power slope of the 200 largest  tallies starting at 3.43577E+01 is 8.4645
 the large score tail of the empirical history score probability density function appears to have no unsampled regions.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (9.265E+04)*( 6.884E-02)**2 = (9.265E+04)*(4.739E-03) = 4.391E+02

1status of the statistical checks used to form confidence intervals for the mean for each tally bin


 tally   result of statistical checks for the tfc bin (the first check not passed is listed) and error magnitude check for all bins

        4   missed  1 of 10 tfc bin checks: the figure of merit has a trend during the last half of the problem                       
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

 warning.       1 of the     5 tally fluctuation chart bins did not pass all 10 statistical checks.
1tally fluctuation charts                              

                            tally        4                          tally       14                          tally       24
          nps      mean     error   vov  slope    fom      mean     error   vov  slope    fom      mean     error   vov  slope    fom
   1048576000   5.6337E-06 0.0005 0.0000  9.5     322   6.7171E-06 0.0005 0.0000 10.0     386   8.0673E-06 0.0004 0.0000 10.0     459
   2097152000   5.6356E-06 0.0004 0.0000  7.5     322   6.7141E-06 0.0003 0.0000 10.0     386   8.0658E-06 0.0003 0.0000  5.6     459
   3145728000   5.6367E-06 0.0003 0.0000  5.4     322   6.7135E-06 0.0003 0.0000 10.0     386   8.0682E-06 0.0003 0.0000  6.7     460
   4194304000   5.6375E-06 0.0003 0.0000  5.2     322   6.7120E-06 0.0002 0.0000 10.0     386   8.0670E-06 0.0002 0.0000  7.3     460
   5242880000   5.6380E-06 0.0002 0.0000  5.1     322   6.7125E-06 0.0002 0.0000 10.0     386   8.0665E-06 0.0002 0.0000  8.1     460
   6291456000   5.6379E-06 0.0002 0.0000  5.2     322   6.7140E-06 0.0002 0.0000  9.5     386   8.0660E-06 0.0002 0.0000  8.7     460
   7340032000   5.6374E-06 0.0002 0.0000  4.1     322   6.7139E-06 0.0002 0.0000 10.0     386   8.0658E-06 0.0002 0.0000  8.8     460
   8388608000   5.6369E-06 0.0002 0.0000  4.3     322   6.7145E-06 0.0002 0.0000 10.0     387   8.0658E-06 0.0002 0.0000  6.4     460
   9437184000   5.6364E-06 0.0002 0.0000  4.7     322   6.7151E-06 0.0002 0.0000 10.0     387   8.0661E-06 0.0001 0.0000  6.2     460
  10485760000   5.6364E-06 0.0002 0.0000  4.9     322   6.7142E-06 0.0002 0.0000 10.0     387   8.0653E-06 0.0001 0.0000  6.2     460
  11534336000   5.6363E-06 0.0002 0.0000  4.7     322   6.7144E-06 0.0001 0.0000 10.0     387   8.0651E-06 0.0001 0.0000  8.2     460
  12582912000   5.6367E-06 0.0002 0.0000  5.4     322   6.7150E-06 0.0001 0.0000 10.0     387   8.0649E-06 0.0001 0.0000 10.0     460
  13631488000   5.6369E-06 0.0001 0.0000  5.4     322   6.7148E-06 0.0001 0.0000 10.0     387   8.0648E-06 0.0001 0.0000  8.3     460
  14680064000   5.6369E-06 0.0001 0.0000  5.4     322   6.7149E-06 0.0001 0.0000 10.0     387   8.0650E-06 0.0001 0.0000 10.0     460
  15728640000   5.6373E-06 0.0001 0.0000  5.6     322   6.7148E-06 0.0001 0.0000 10.0     387   8.0651E-06 0.0001 0.0000 10.0     460
  16777216000   5.6374E-06 0.0001 0.0000  6.1     322   6.7147E-06 0.0001 0.0000 10.0     387   8.0654E-06 0.0001 0.0000 10.0     460
  17825792000   5.6375E-06 0.0001 0.0000  6.6     322   6.7148E-06 0.0001 0.0000 10.0     387   8.0652E-06 0.0001 0.0000 10.0     460
  18529840560   5.6376E-06 0.0001 0.0000  6.6     322   6.7148E-06 0.0001 0.0000 10.0     387   8.0653E-06 0.0001 0.0000 10.0     460
 

                            tally       34                          tally       44
          nps      mean     error   vov  slope    fom      mean     error   vov  slope    fom
   1048576000   6.7138E-06 0.0005 0.0000 10.0     377   7.7737E-06 0.0004 0.0000 10.0     438
   2097152000   6.7158E-06 0.0003 0.0000 10.0     377   7.7760E-06 0.0003 0.0000 10.0     438
   3145728000   6.7170E-06 0.0003 0.0000  6.0     377   7.7756E-06 0.0003 0.0000  7.4     439
   4194304000   6.7147E-06 0.0002 0.0000  6.2     377   7.7758E-06 0.0002 0.0000  6.0     439
   5242880000   6.7147E-06 0.0002 0.0000  4.9     377   7.7758E-06 0.0002 0.0000  5.6     439
   6291456000   6.7153E-06 0.0002 0.0000  5.8     377   7.7757E-06 0.0002 0.0000  6.1     439
   7340032000   6.7151E-06 0.0002 0.0000  5.2     377   7.7765E-06 0.0002 0.0000  5.3     439
   8388608000   6.7153E-06 0.0002 0.0000  5.0     377   7.7759E-06 0.0002 0.0000  8.8     439
   9437184000   6.7148E-06 0.0002 0.0000  6.6     377   7.7757E-06 0.0001 0.0000  8.2     439
  10485760000   6.7148E-06 0.0002 0.0000  6.5     377   7.7756E-06 0.0001 0.0000  6.5     439
  11534336000   6.7149E-06 0.0001 0.0000  5.4     378   7.7761E-06 0.0001 0.0000  7.2     439
  12582912000   6.7149E-06 0.0001 0.0000  5.3     378   7.7762E-06 0.0001 0.0000 10.0     439
  13631488000   6.7146E-06 0.0001 0.0000  5.3     378   7.7759E-06 0.0001 0.0000 10.0     439
  14680064000   6.7147E-06 0.0001 0.0000  5.7     378   7.7758E-06 0.0001 0.0000 10.0     439
  15728640000   6.7148E-06 0.0001 0.0000  5.7     378   7.7756E-06 0.0001 0.0000 10.0     439
  16777216000   6.7149E-06 0.0001 0.0000  8.9     378   7.7758E-06 0.0001 0.0000 10.0     439
  17825792000   6.7150E-06 0.0001 0.0000  7.7     378   7.7760E-06 0.0001 0.0000  8.5     439
  18529840560   6.7151E-06 0.0001 0.0000  7.6     378   7.7762E-06 0.0001 0.0000  8.5     439

 ***********************************************************************************************************************

 dump no.  168 on file inpr     nps = 18529840560     coll =    37336002308     ctm =   200000.24   nrn =     
 565041727151

         9 warning messages so far.


 run terminated when it had used*****  minutes of computer time.

 computer time =******** minutes

 mcnp     version 6     06/19/14                     08/06/17 00:30:59                     probid =  08/05/17 16:11:08 
