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
  
1mcnp     version 6     ld=06/19/14                     08/06/17 18:17:20 
 *************************************************************************                 probid =  08/06/17 18:17:20 
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
        31-        3   3  -4.000000   -3 4                       $ Interior of shipping container 
        32-       c                                                                               
        33-       c                                                                               
        34-       c //--- Highly Enriched Uranium Cells ---//                                     
        35-       c                                                                               
        36-        4   3  -4.000000   -4                         $ HEU sphere (~10kg -> 5cm)      
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
       119-        T0  1e7 1.2e7 1.4e7 1.6e7 1.8e7 2.0e7                   $ Time bins for all tal
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
       153-       sb1    4.95037e-01 5.04963e-01                                                  
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
  warning.  material        4 is not used in the problem.
       218-       c                                                                               
       219-       c * added by ADVANTG                                                            
       220-       wwp:n 5.0 j 100 j -1 0 9.751699300e-03                                          
 
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
 
  warning.  nonzero neutron  weight cutoff with zero windows.
 
  warning.    1 of the materials appear at more than one density.
1cells                                                                                                  print table 60

                               atom        gram                                            neutron                                     
              cell      mat   density     density     volume       mass            pieces importance                                   

        1        1        1  4.98947E-05 1.20500E-03 2.19738E+06 2.64784E+03           0  1.0000E+00                                   
        2        2        3  8.76840E-02 8.00000E+00 1.57625E+05 1.26100E+06           0  1.0000E+00                                   
        3        3        3  4.38420E-02 4.00000E+00 0.00000E+00 0.00000E+00           0  1.0000E+00                                   
        4        4        3  4.38420E-02 4.00000E+00 5.23599E+02 2.09440E+03           1  1.0000E+00                                   
        5       10        1  4.98947E-05 1.20500E-03 4.00000E+03 4.82000E+00           0  1.0000E+00                                   
        6       11        1  4.98947E-05 1.20500E-03 4.00000E+03 4.82000E+00           0  1.0000E+00                                   
        7       12        1  4.98947E-05 1.20500E-03 4.00000E+03 4.82000E+00           0  1.0000E+00                                   
        8       13        1  4.98947E-05 1.20500E-03 4.00000E+03 4.82000E+00           0  1.0000E+00                                   
        9       14        1  4.98947E-05 1.20500E-03 4.00000E+03 4.82000E+00           0  1.0000E+00                                   
       10       99        0  0.00000E+00 0.00000E+00 0.00000E+00 0.00000E+00           0  0.0000E+00                                   

 total                                               2.37552E+06 1.26577E+06

    minimum source weight = 9.9017E-01    maximum source weight = 1.0100E+00

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

         6 warning messages so far.
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

  total     1079590
 
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

 ------------------------------------------------------------------------------------------


 ***********************************************************************************************************************

 dump no.    1 on file inpr     nps =           0     coll =              0     ctm =        0.00   nrn =               
  0

         7 warning messages so far.

 ***********************************************************************************************************************

 dump no.    2 on file inpr     nps =    15401322     coll =     1071295366     ctm =     1200.37   nrn =       
 9042916004

 ***********************************************************************************************************************

 dump no.    3 on file inpr     nps =    30807969     coll =     2142854199     ctm =     2400.75   nrn =      
 18087320453

 ***********************************************************************************************************************

 dump no.    4 on file inpr     nps =    46270022     coll =     3214942316     ctm =     3601.06   nrn =      
 27137023229

 ***********************************************************************************************************************

 dump no.    5 on file inpr     nps =    61697014     coll =     4287752869     ctm =     4801.48   nrn =      
 36191765065

 ***********************************************************************************************************************

 dump no.    6 on file inpr     nps =    77117974     coll =     5360845710     ctm =     6001.82   nrn =      
 45248174535

 ***********************************************************************************************************************

 dump no.    7 on file inpr     nps =    92534908     coll =     6433340517     ctm =     7202.14   nrn =      
 54300277666

 ***********************************************************************************************************************

 dump no.    8 on file inpr     nps =   107954410     coll =     7505997615     ctm =     8402.42   nrn =      
 63353962474

 ***********************************************************************************************************************

 dump no.    9 on file inpr     nps =   123395740     coll =     8578808913     ctm =     9602.79   nrn =      
 72409391867

 ***********************************************************************************************************************

 dump no.   10 on file inpr     nps =   138841484     coll =     9651233731     ctm =    10803.08   nrn =      
 81461028787

 ***********************************************************************************************************************

 dump no.   11 on file inpr     nps =   154258632     coll =    10724095940     ctm =    12003.46   nrn =      
 90515498143

 ***********************************************************************************************************************

 dump no.   12 on file inpr     nps =   169696966     coll =    11796743012     ctm =    13203.90   nrn =      
 99569416677

 ***********************************************************************************************************************

 dump no.   13 on file inpr     nps =   185141720     coll =    12869273597     ctm =    14404.23   nrn =     
 108622189976

 ***********************************************************************************************************************

 dump no.   14 on file inpr     nps =   200556300     coll =    13942342969     ctm =    15604.56   nrn =     
 117678073565

 ***********************************************************************************************************************

 dump no.   15 on file inpr     nps =   215982436     coll =    15015028924     ctm =    16804.88   nrn =     
 126731478206

 ***********************************************************************************************************************

 dump no.   16 on file inpr     nps =   231414992     coll =    16087538431     ctm =    18005.12   nrn =     
 135784139829

 ***********************************************************************************************************************

 dump no.   17 on file inpr     nps =   246855680     coll =    17159701613     ctm =    19205.51   nrn =     
 144834094925

 ***********************************************************************************************************************

 dump no.   18 on file inpr     nps =   262269832     coll =    18232157159     ctm =    20405.81   nrn =     
 153886176157

 ***********************************************************************************************************************

 dump no.   19 on file inpr     nps =   277710146     coll =    19304768904     ctm =    21606.13   nrn =     
 162940097965

 ***********************************************************************************************************************

 dump no.   20 on file inpr     nps =   293134784     coll =    20377661513     ctm =    22806.45   nrn =     
 171996174973

 ***********************************************************************************************************************

 dump no.   21 on file inpr     nps =   308541446     coll =    21450192619     ctm =    24006.79   nrn =     
 181048442945

 ***********************************************************************************************************************

 dump no.   22 on file inpr     nps =   323964586     coll =    22522820654     ctm =    25207.08   nrn =     
 190102550259

 ***********************************************************************************************************************

 dump no.   23 on file inpr     nps =   339394788     coll =    23595828218     ctm =    26407.45   nrn =     
 199158515882

 ***********************************************************************************************************************

 dump no.   24 on file inpr     nps =   354834460     coll =    24668241848     ctm =    27607.85   nrn =     
 208211130424

 ***********************************************************************************************************************

 dump no.   25 on file inpr     nps =   370263324     coll =    25740696616     ctm =    28808.18   nrn =     
 217263362947

 ***********************************************************************************************************************

 dump no.   26 on file inpr     nps =   385696790     coll =    26812101052     ctm =    30008.42   nrn =     
 226307237978

 ***********************************************************************************************************************

 dump no.   27 on file inpr     nps =   401086706     coll =    27885247806     ctm =    31208.74   nrn =     
 235363665069

 ***********************************************************************************************************************

 dump no.   28 on file inpr     nps =   416550132     coll =    28957533100     ctm =    32409.05   nrn =     
 244414592558

 ***********************************************************************************************************************

 dump no.   29 on file inpr     nps =   431958452     coll =    30030381668     ctm =    33609.41   nrn =     
 253469902347

 ***********************************************************************************************************************

 dump no.   30 on file inpr     nps =   447339488     coll =    31103634271     ctm =    34809.78   nrn =     
 262527088028

 ***********************************************************************************************************************

 dump no.   31 on file inpr     nps =   462751232     coll =    32176240526     ctm =    36010.10   nrn =     
 271579969224

 ***********************************************************************************************************************

 dump no.   32 on file inpr     nps =   478197752     coll =    33248239636     ctm =    37210.48   nrn =     
 280629316601

 ***********************************************************************************************************************

 dump no.   33 on file inpr     nps =   493620624     coll =    34321270726     ctm =    38410.76   nrn =     
 289684885444

 ***********************************************************************************************************************

 dump no.   34 on file inpr     nps =   509068428     coll =    35393552215     ctm =    39611.05   nrn =     
 298736016979

 ***********************************************************************************************************************

 dump no.   35 on file inpr     nps =   524500074     coll =    36466292439     ctm =    40811.32   nrn =     
 307790650878

 ***********************************************************************************************************************

 dump no.   36 on file inpr     nps =   539928404     coll =    37538959640     ctm =    42011.70   nrn =     
 316844248263

 ***********************************************************************************************************************

 dump no.   37 on file inpr     nps =   555340042     coll =    38610614019     ctm =    43212.07   nrn =     
 325889613907

 ***********************************************************************************************************************

 dump no.   38 on file inpr     nps =   570782816     coll =    39683246137     ctm =    44412.42   nrn =     
 334943434488

 ***********************************************************************************************************************

 dump no.   39 on file inpr     nps =   586208364     coll =    40755978197     ctm =    45612.84   nrn =     
 343998236255

 ***********************************************************************************************************************

 dump no.   40 on file inpr     nps =   601656488     coll =    41828561319     ctm =    46813.17   nrn =     
 353051880412

 ***********************************************************************************************************************

 dump no.   41 on file inpr     nps =   617075188     coll =    42901225458     ctm =    48013.49   nrn =     
 362105983156

 ***********************************************************************************************************************

 dump no.   42 on file inpr     nps =   632516036     coll =    43973632839     ctm =    49213.84   nrn =     
 371157992474

 ***********************************************************************************************************************

 dump no.   43 on file inpr     nps =   647948646     coll =    45046325179     ctm =    50414.17   nrn =     
 380211555836

 ***********************************************************************************************************************

 dump no.   44 on file inpr     nps =   663350332     coll =    46119682840     ctm =    51614.57   nrn =     
 389270314764

 ***********************************************************************************************************************

 dump no.   45 on file inpr     nps =   678782514     coll =    47191976935     ctm =    52814.99   nrn =     
 398320825650

 ***********************************************************************************************************************

 dump no.   46 on file inpr     nps =   694218762     coll =    48264053588     ctm =    54015.42   nrn =     
 407370620075

 ***********************************************************************************************************************

 dump no.   47 on file inpr     nps =   709646236     coll =    49336463124     ctm =    55215.69   nrn =     
 416421985893

 ***********************************************************************************************************************

 dump no.   48 on file inpr     nps =   725057444     coll =    50409468341     ctm =    56416.02   nrn =     
 425477859497

 ***********************************************************************************************************************

 dump no.   49 on file inpr     nps =   740510384     coll =    51481706601     ctm =    57616.33   nrn =     
 434528828694

 ***********************************************************************************************************************

 dump no.   50 on file inpr     nps =   755956048     coll =    52554189056     ctm =    58816.67   nrn =     
 443581776174

 ***********************************************************************************************************************

 dump no.   51 on file inpr     nps =   771403424     coll =    53626691372     ctm =    60017.02   nrn =     
 452634614235

 ***********************************************************************************************************************

 dump no.   52 on file inpr     nps =   786830896     coll =    54699391794     ctm =    61217.29   nrn =     
 461689531239

 ***********************************************************************************************************************

 dump no.   53 on file inpr     nps =   802260296     coll =    55772133865     ctm =    62417.62   nrn =     
 470744299611

 ***********************************************************************************************************************

 dump no.   54 on file inpr     nps =   817676428     coll =    56845047946     ctm =    63617.98   nrn =     
 479799434686

 ***********************************************************************************************************************

 dump no.   55 on file inpr     nps =   833098338     coll =    57917450922     ctm =    64818.28   nrn =     
 488851556456

 ***********************************************************************************************************************

 dump no.   56 on file inpr     nps =   848514898     coll =    58990106804     ctm =    66018.61   nrn =     
 497905753760

 ***********************************************************************************************************************

 dump no.   57 on file inpr     nps =   863926320     coll =    60062954506     ctm =    67218.90   nrn =     
 506959882125

 ***********************************************************************************************************************

 dump no.   58 on file inpr     nps =   879382256     coll =    61135255099     ctm =    68419.31   nrn =     
 516011922268

 ***********************************************************************************************************************

 dump no.   59 on file inpr     nps =   894795392     coll =    62208043080     ctm =    69619.67   nrn =     
 525066389405

 ***********************************************************************************************************************

 dump no.   60 on file inpr     nps =   910197828     coll =    63280362780     ctm =    70820.03   nrn =     
 534116514972

 ***********************************************************************************************************************

 dump no.   61 on file inpr     nps =   925647128     coll =    64352650143     ctm =    72020.34   nrn =     
 543167739902

 ***********************************************************************************************************************

 dump no.   62 on file inpr     nps =   941070108     coll =    65425299764     ctm =    73220.67   nrn =     
 552221921764

 ***********************************************************************************************************************

 dump no.   63 on file inpr     nps =   956464412     coll =    66498694111     ctm =    74421.03   nrn =     
 561280204698

 ***********************************************************************************************************************

 dump no.   64 on file inpr     nps =   971903228     coll =    67571407141     ctm =    75621.30   nrn =     
 570333961918

 ***********************************************************************************************************************

 dump no.   65 on file inpr     nps =   987318930     coll =    68644219326     ctm =    76821.68   nrn =     
 579389190117

 ***********************************************************************************************************************

 dump no.   66 on file inpr     nps =  1002757318     coll =    69716706954     ctm =    78021.98   nrn =     
 588441060148

 ***********************************************************************************************************************

 dump no.   67 on file inpr     nps =  1018199130     coll =    70788777603     ctm =    79222.23   nrn =     
 597489888105

 ***********************************************************************************************************************

 dump no.   68 on file inpr     nps =  1033608200     coll =    71861944036     ctm =    80422.62   nrn =     
 606547120020

 ***********************************************************************************************************************

 dump no.   69 on file inpr     nps =  1049057714     coll =    72934236746     ctm =    81622.93   nrn =     
 615599076478

 ***********************************************************************************************************************

 dump no.   70 on file inpr     nps =  1064506802     coll =    74006673646     ctm =    82823.32   nrn =     
 624651392379

 ***********************************************************************************************************************

 dump no.   71 on file inpr     nps =  1079941980     coll =    75078874767     ctm =    84023.70   nrn =     
 633701639752

 ***********************************************************************************************************************

 dump no.   72 on file inpr     nps =  1095373306     coll =    76151647379     ctm =    85224.00   nrn =     
 642756200476

 ***********************************************************************************************************************

 dump no.   73 on file inpr     nps =  1110796500     coll =    77224100047     ctm =    86424.32   nrn =     
 651807976731

 ***********************************************************************************************************************

 dump no.   74 on file inpr     nps =  1126182028     coll =    78295973648     ctm =    87624.58   nrn =     
 660854013334

 ***********************************************************************************************************************

 dump no.   75 on file inpr     nps =  1141628976     coll =    79368254324     ctm =    88825.00   nrn =     
 669904922051

 ***********************************************************************************************************************

 dump no.   76 on file inpr     nps =  1157035264     coll =    80441489601     ctm =    90025.43   nrn =     
 678962488955

 ***********************************************************************************************************************

 dump no.   77 on file inpr     nps =  1172480286     coll =    81513891146     ctm =    91225.71   nrn =     
 688015071798

 ***********************************************************************************************************************

 dump no.   78 on file inpr     nps =  1187919956     coll =    82586341930     ctm =    92426.00   nrn =     
 697067905920

 ***********************************************************************************************************************

 dump no.   79 on file inpr     nps =  1203340154     coll =    83659128470     ctm =    93626.34   nrn =     
 706122625524

 ***********************************************************************************************************************

 dump no.   80 on file inpr     nps =  1218768484     coll =    84731903385     ctm =    94826.78   nrn =     
 715177353769

 ***********************************************************************************************************************

 dump no.   81 on file inpr     nps =  1234188468     coll =    85804503458     ctm =    96027.03   nrn =     
 724230909426

 ***********************************************************************************************************************

 dump no.   82 on file inpr     nps =  1249643118     coll =    86876969158     ctm =    97227.34   nrn =     
 733283107078

 ***********************************************************************************************************************

 dump no.   83 on file inpr     nps =  1265059892     coll =    87949759538     ctm =    98427.66   nrn =     
 742337934695

 ***********************************************************************************************************************

 dump no.   84 on file inpr     nps =  1280479876     coll =    89022474421     ctm =    99627.98   nrn =     
 751392328299

 ***********************************************************************************************************************

 dump no.   85 on file inpr     nps =  1295914626     coll =    90095106948     ctm =   100828.33   nrn =     
 760446471434

 ***********************************************************************************************************************

 dump no.   86 on file inpr     nps =  1311361358     coll =    91167588416     ctm =   102028.66   nrn =     
 769499479600

 ***********************************************************************************************************************

 dump no.   87 on file inpr     nps =  1326803812     coll =    92240431097     ctm =   103229.02   nrn =     
 778554483559

 ***********************************************************************************************************************

 dump no.   88 on file inpr     nps =  1342239204     coll =    93312601650     ctm =   104429.45   nrn =     
 787605348901

 ***********************************************************************************************************************

 dump no.   89 on file inpr     nps =  1357666892     coll =    94384836970     ctm =   105629.71   nrn =     
 796655600633

 ***********************************************************************************************************************

 dump no.   90 on file inpr     nps =  1373094580     coll =    95457590665     ctm =   106830.03   nrn =     
 805710554562

 ***********************************************************************************************************************

 dump no.   91 on file inpr     nps =  1388549232     coll =    96529713142     ctm =   108030.37   nrn =     
 814761066818

 ***********************************************************************************************************************

 dump no.   92 on file inpr     nps =  1403985052     coll =    97602382276     ctm =   109230.74   nrn =     
 823815464751

 ***********************************************************************************************************************

 dump no.   93 on file inpr     nps =  1419423012     coll =    98674695434     ctm =   110430.97   nrn =     
 832866368483

 ***********************************************************************************************************************

 dump no.   94 on file inpr     nps =  1434861186     coll =    99747211243     ctm =   111631.34   nrn =     
 841919809672

 ***********************************************************************************************************************

 dump no.   95 on file inpr     nps =  1450320328     coll =   100819640449     ctm =   112831.67   nrn =     
 850972390543

 ***********************************************************************************************************************

 dump no.   96 on file inpr     nps =  1465752938     coll =   101892262273     ctm =   114031.98   nrn =     
 860026229400

 ***********************************************************************************************************************

 dump no.   97 on file inpr     nps =  1481143604     coll =   102965366256     ctm =   115232.26   nrn =     
 869082429698

 ***********************************************************************************************************************

 dump no.   98 on file inpr     nps =  1496564872     coll =   104038016206     ctm =   116432.57   nrn =     
 878135672663

 ***********************************************************************************************************************

 dump no.   99 on file inpr     nps =  1511985070     coll =   105110868812     ctm =   117632.89   nrn =     
 887189872257

 ***********************************************************************************************************************

 dump no.  100 on file inpr     nps =  1527404626     coll =   106183782062     ctm =   118833.13   nrn =     
 896245108390

 ***********************************************************************************************************************

 dump no.  101 on file inpr     nps =  1542823112     coll =   107256546419     ctm =   120033.41   nrn =     
 905299505578

 ***********************************************************************************************************************

 dump no.  102 on file inpr     nps =  1558246092     coll =   108328543386     ctm =   121233.84   nrn =     
 914348369520

 ***********************************************************************************************************************

 dump no.  103 on file inpr     nps =  1573675274     coll =   109400617112     ctm =   122434.16   nrn =     
 923396787960

 ***********************************************************************************************************************

 dump no.  104 on file inpr     nps =  1589114304     coll =   110473052701     ctm =   123634.58   nrn =     
 932449223989

 ***********************************************************************************************************************

 dump no.  105 on file inpr     nps =  1604538568     coll =   111545556378     ctm =   124834.90   nrn =     
 941501782709

 ***********************************************************************************************************************

 dump no.  106 on file inpr     nps =  1619979096     coll =   112617917077     ctm =   126035.17   nrn =     
 950553425100

 ***********************************************************************************************************************

 dump no.  107 on file inpr     nps =  1635398438     coll =   113690454376     ctm =   127235.44   nrn =     
 959606119904

 ***********************************************************************************************************************

 dump no.  108 on file inpr     nps =  1650788462     coll =   114763715498     ctm =   128435.78   nrn =     
 968664055534

 ***********************************************************************************************************************

 dump no.  109 on file inpr     nps =  1666227706     coll =   115836273336     ctm =   129636.16   nrn =     
 977717333719

 ***********************************************************************************************************************

 dump no.  110 on file inpr     nps =  1681661172     coll =   116908776969     ctm =   130836.57   nrn =     
 986769893596

 ***********************************************************************************************************************

 dump no.  111 on file inpr     nps =  1697070670     coll =   117979095105     ctm =   132036.83   nrn =     
 995804707880

 ***********************************************************************************************************************

 dump no.  112 on file inpr     nps =  1712497498     coll =   119051713588     ctm =   133237.27   nrn =    
 1004858346664

 ***********************************************************************************************************************

 dump no.  113 on file inpr     nps =  1727919836     coll =   120124286712     ctm =   134437.59   nrn =    
 1013911537357

 ***********************************************************************************************************************

 dump no.  114 on file inpr     nps =  1743338322     coll =   121196848579     ctm =   135637.95   nrn =    
 1022964961701

 ***********************************************************************************************************************

 dump no.  115 on file inpr     nps =  1758752100     coll =   122269612914     ctm =   136838.32   nrn =    
 1032019929036

 ***********************************************************************************************************************

 dump no.  116 on file inpr     nps =  1774172940     coll =   123342112842     ctm =   138038.76   nrn =    
 1041072233007

 ***********************************************************************************************************************

 dump no.  117 on file inpr     nps =  1789602982     coll =   124414457701     ctm =   139239.09   nrn =    
 1050123683596

 ***********************************************************************************************************************

 dump no.  118 on file inpr     nps =  1805035592     coll =   125487457823     ctm =   140439.39   nrn =    
 1059180323882

 ***********************************************************************************************************************

 dump no.  119 on file inpr     nps =  1820469700     coll =   126560338123     ctm =   141639.68   nrn =    
 1068236734810

 ***********************************************************************************************************************

 dump no.  120 on file inpr     nps =  1835899952     coll =   127633101157     ctm =   142839.97   nrn =    
 1077291366997

 ***********************************************************************************************************************

 dump no.  121 on file inpr     nps =  1851357386     coll =   128705748766     ctm =   144040.35   nrn =    
 1086345896721

 ***********************************************************************************************************************

 dump no.  122 on file inpr     nps =  1866790210     coll =   129778747560     ctm =   145240.75   nrn =    
 1095403187673

 ***********************************************************************************************************************

 dump no.  123 on file inpr     nps =  1882189864     coll =   130852064891     ctm =   146441.21   nrn =    
 1104461556892

 ***********************************************************************************************************************

 dump no.  124 on file inpr     nps =  1897614128     coll =   131924939125     ctm =   147641.49   nrn =    
 1113516921730

 ***********************************************************************************************************************

 dump no.  125 on file inpr     nps =  1913033042     coll =   132997832902     ctm =   148841.75   nrn =    
 1122571966898

 ***********************************************************************************************************************

 dump no.  126 on file inpr     nps =  1928447890     coll =   134070950305     ctm =   150042.08   nrn =    
 1131628729951

 ***********************************************************************************************************************

 dump no.  127 on file inpr     nps =  1943872796     coll =   135143393402     ctm =   151242.43   nrn =    
 1140680240598

 ***********************************************************************************************************************

 dump no.  128 on file inpr     nps =  1959292566     coll =   136216543217     ctm =   152442.85   nrn =    
 1149737341587

 ***********************************************************************************************************************

 dump no.  129 on file inpr     nps =  1974701632     coll =   137289846022     ctm =   153643.26   nrn =    
 1158795565774

 ***********************************************************************************************************************

 dump no.  130 on file inpr     nps =  1990092084     coll =   138362504022     ctm =   154843.58   nrn =    
 1167849224645

 ***********************************************************************************************************************

 dump no.  131 on file inpr     nps =  2005516348     coll =   139434790344     ctm =   156043.97   nrn =    
 1176900231390

 ***********************************************************************************************************************

 dump no.  132 on file inpr     nps =  2020941040     coll =   140507753257     ctm =   157244.48   nrn =    
 1185956516728

 ***********************************************************************************************************************

 dump no.  133 on file inpr     nps =  2036336200     coll =   141580909832     ctm =   158444.85   nrn =    
 1195013758369

 ***********************************************************************************************************************

 dump no.  134 on file inpr     nps =  2051765386     coll =   142653609735     ctm =   159645.20   nrn =    
 1204067682601

 ***********************************************************************************************************************

 dump no.  135 on file inpr     nps =  2067201206     coll =   143726062890     ctm =   160845.56   nrn =    
 1213121409129

 ***********************************************************************************************************************

 dump no.  136 on file inpr     nps =  2082634458     coll =   144798774469     ctm =   162046.01   nrn =    
 1222175863432

 ***********************************************************************************************************************

 dump no.  137 on file inpr     nps =  2098058504     coll =   145871789070     ctm =   163246.41   nrn =    
 1231232527429

 ***********************************************************************************************************************

 dump no.  138 on file inpr     nps =  2113481912     coll =   146944604328     ctm =   164446.78   nrn =    
 1240287434462

 ***********************************************************************************************************************

 dump no.  139 on file inpr     nps =  2128902538     coll =   148017532686     ctm =   165647.13   nrn =    
 1249343182059

 ***********************************************************************************************************************

 dump no.  140 on file inpr     nps =  2144330226     coll =   149090317578     ctm =   166847.44   nrn =    
 1258397674425

 ***********************************************************************************************************************

 dump no.  141 on file inpr     nps =  2159732448     coll =   150163314693     ctm =   168047.78   nrn =    
 1267454196977

 ***********************************************************************************************************************

 dump no.  142 on file inpr     nps =  2175168696     coll =   151235937230     ctm =   169248.10   nrn =    
 1276508313329

 ***********************************************************************************************************************

 dump no.  143 on file inpr     nps =  2190584186     coll =   152308771589     ctm =   170448.53   nrn =    
 1285563572422

 ***********************************************************************************************************************

 dump no.  144 on file inpr     nps =  2206011446     coll =   153380287825     ctm =   171648.89   nrn =    
 1294608998230

 ***********************************************************************************************************************

 dump no.  145 on file inpr     nps =  2221445768     coll =   154452314366     ctm =   172849.18   nrn =    
 1303658242011

 ***********************************************************************************************************************

 dump no.  146 on file inpr     nps =  2236886078     coll =   155524606977     ctm =   174049.53   nrn =    
 1312710060878

 ***********************************************************************************************************************

 dump no.  147 on file inpr     nps =  2252276102     coll =   156597633946     ctm =   175249.83   nrn =    
 1321766112389

 ***********************************************************************************************************************

 dump no.  148 on file inpr     nps =  2267694160     coll =   157670330632     ctm =   176450.15   nrn =    
 1330820457078

 ***********************************************************************************************************************

 dump no.  149 on file inpr     nps =  2283112218     coll =   158743318267     ctm =   177650.53   nrn =    
 1339875676075

 ***********************************************************************************************************************

 dump no.  150 on file inpr     nps =  2298570508     coll =   159815678791     ctm =   178850.93   nrn =    
 1348927689365

 ***********************************************************************************************************************

 dump no.  151 on file inpr     nps =  2313991134     coll =   160888286509     ctm =   180051.21   nrn =    
 1357980808754

 ***********************************************************************************************************************

 dump no.  152 on file inpr     nps =  2329365322     coll =   161961634607     ctm =   181251.53   nrn =    
 1367038495561

 ***********************************************************************************************************************

 dump no.  153 on file inpr     nps =  2344797076     coll =   163034275891     ctm =   182451.85   nrn =    
 1376092356941

 ***********************************************************************************************************************

 dump no.  154 on file inpr     nps =  2360205500     coll =   164107420122     ctm =   183652.17   nrn =    
 1385148899445

 ***********************************************************************************************************************

 dump no.  155 on file inpr     nps =  2375639822     coll =   165180019843     ctm =   184852.48   nrn =    
 1394202249722

 ***********************************************************************************************************************

 dump no.  156 on file inpr     nps =  2391103462     coll =   166252048194     ctm =   186052.83   nrn =    
 1403252446080

 ***********************************************************************************************************************

 dump no.  157 on file inpr     nps =  2406560040     coll =   167324446814     ctm =   187253.19   nrn =    
 1412305292680

 ***********************************************************************************************************************

 dump no.  158 on file inpr     nps =  2421995432     coll =   168397230968     ctm =   188453.63   nrn =    
 1421359805397

 ***********************************************************************************************************************

 dump no.  159 on file inpr     nps =  2437384172     coll =   169470175517     ctm =   189653.94   nrn =    
 1430414779342

 ***********************************************************************************************************************

 dump no.  160 on file inpr     nps =  2452817210     coll =   170542580037     ctm =   190854.26   nrn =    
 1439466685959

 ***********************************************************************************************************************

 dump no.  161 on file inpr     nps =  2468256026     coll =   171614875108     ctm =   192054.64   nrn =    
 1448518067093

 ***********************************************************************************************************************

 dump no.  162 on file inpr     nps =  2483680076     coll =   172687481065     ctm =   193254.98   nrn =    
 1457571687308

 ***********************************************************************************************************************

 dump no.  163 on file inpr     nps =  2499126378     coll =   173760048958     ctm =   194455.33   nrn =    
 1466625510312

 ***********************************************************************************************************************

 dump no.  164 on file inpr     nps =  2514551284     coll =   174832909396     ctm =   195655.71   nrn =    
 1475680622953

 ***********************************************************************************************************************

 dump no.  165 on file inpr     nps =  2530001656     coll =   175905296920     ctm =   196856.07   nrn =    
 1484733162379

 ***********************************************************************************************************************

 dump no.  166 on file inpr     nps =  2545442826     coll =   176977877190     ctm =   198056.38   nrn =    
 1493786823287

 ***********************************************************************************************************************

 dump no.  167 on file inpr     nps =  2560873938     coll =   178050342127     ctm =   199256.77   nrn =    
 1502839747775
1problem summary                                                                                                           

      run terminated when it had used*****  minutes of computer time.
+                                                                                                    08/07/17 02:37:15 
      c //-------------------------------------------------------------------------//      probid =  08/06/17 18:17:20 

 neutron creation    tracks      weight        energy            neutron loss        tracks      weight        energy
                                 (per source particle)                                           (per source particle)

 source          2570457714    1.0000E+00    1.4100E+01          escape          7277614614    1.0262E+00    9.1691E+00
 nucl. interaction        0    0.            0.                  energy cutoff            0    0.            0.        
 particle decay           0    0.            0.                  time cutoff              0    0.            0.        
 weight window  11110757728    2.9375E-01    1.9448E-01          weight window   6917623614    2.9362E-01    1.9445E-01
 cell importance          0    0.            0.                  cell importance          0    0.            0.        
 weight cutoff            0    0.            0.                  weight cutoff            0    0.            0.        
 e or t importance        0    0.            0.                  e or t importance        0    0.            0.        
 dxtran                   0    0.            0.                  dxtran                   0    0.            0.        
 forced collisions        0    0.            0.                  forced collisions        0    0.            0.        
 exp. transform           0    0.            0.                  exp. transform           0    0.            0.        
 upscattering             0    0.            1.1824E-10          downscattering           0    0.            2.7609E+00
 photonuclear             0    0.            0.                  capture                 64    8.2612E-02    9.0178E-01
 (n,xn)          1028045700    2.1735E-01    2.5670E-01          loss to (n,xn)   514022850    1.0868E-01    1.5250E+00
 prompt fission           0    0.            0.                  loss to fission          0    0.            0.        
 delayed fission          0    0.            0.                  nucl. interaction        0    0.            0.        
 prompt photofis          0    0.            0.                  particle decay           0    0.            0.        
 tabular boundary         0    0.            0.                  tabular boundary         0    0.            0.        
 tabular sampling         0    0.            0.                  elastic scatter          0    0.            0.        
     total      14709261142    1.5111E+00    1.4551E+01              total      14709261142    1.5111E+00    1.4551E+01

   number of neutrons banked             -1569420272        average time of (shakes)              cutoffs
   neutron tracks per source particle     5.7224E+00          escape            5.0000E+06          tco   2.0000E+07
   neutron collisions per source particle 6.9526E+01          capture           5.0049E+06          eco   0.0000E+00
   total neutron collisions              -2147483648          capture or escape 5.0004E+06          wc1  -5.0000E-01
   net multiplication              1.1087E+00 0.0000          any termination   4.5969E+06          wc2  -2.5000E-01

 computer time so far in this run200003.17 minutes            maximum number ever in bank        35
 computer time in mcrun          200000.40 minutes            bank overflows to backup file       0
 source particles per minute            1.2852E+04
 random numbers generated            1508449275709            most random numbers used was     1058626 in history   650669529
 
  warning.   random number stride   152917 exceeded    32538 times.
 
  warning.  random number period exceeded.  decrease stride.

 range of sampled source weights = 9.9017E-01 to 1.0100E+00

 number of histories processed by each thread
   121783726   128645699   129450453   129335071   128374531   129212089   128487768   128721534   128506653   129542386
   129193506   128339658   129167799   128566555   129244459   127889006   129192273   128797393   129301712   128705443
 
  warning.  some of the geometry is covered by a weight window mesh.
1neutron  activity in each cell                                                                         print table 126

                       tracks     population   collisions   collisions     number        flux        average      average
              cell    entering                               * weight     weighted     weighted   track weight   track mfp
                                                          (per history)    energy       energy     (relative)      (cm)

        1        1  8578953176   7694219780     39719654    4.5402E-03   3.1841E+00   9.9069E+00   4.5229E-01   1.1405E+04
        2        2  8568008650   7478242867  15718294206    1.3266E+00   1.0719E+00   6.3559E+00   2.7650E-01   4.2410E+00
        3        3  3617681462  11062170803 162790360570    4.8809E+00   1.4016E-01   2.0929E+00   8.2874E-02   7.9467E+00
        4        4   149901122    134719176    163121762    2.9941E-03   3.0627E-02   4.1531E-01   3.5137E-02   7.2272E+00
        5       10   149794558    192479658       414216    2.4037E-07   3.9348E-02   2.6228E-01   1.5286E-03   5.3242E+03
        6       11   220036460    261391183       536267    3.3685E-07   5.0931E-02   3.3522E-01   1.6523E-03   5.5965E+03
        7       12   517058116    616618167      1297118    7.9521E-07   3.9816E-02   2.8745E-01   1.6071E-03   5.3969E+03
        8       13   215960285    257494110       526704    3.3638E-07   5.0890E-02   3.3538E-01   1.6805E-03   5.5966E+03
        9       14   261297037    290906322       587643    4.0838E-07   5.5711E-02   3.5452E-01   1.8284E-03   5.6807E+03

           total   22278690866  27988242066 178714858140    6.2150E+00

1tally        4        nps =  2570457714
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      10                                                                                   
                         4.00000E+03
 
 cell  10                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 2.76088E-07 0.0002   3.14374E-12 0.0491   0.00000E+00 0.0000   0.00000E+00 0.0000   0.00000E+00 0.0000
 
         time:       2.0000E+07             total                                                                  
                 0.00000E+00 0.0000   2.76091E-07 0.0002


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally        4

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00      yes         yes            constant    random       2.40
 passed?        yes          yes      yes          yes             yes      yes         yes               yes        yes          no

 ===================================================================================================================================


 warning.  the tally in the tally fluctuation chart bin did not pass  1 of the 10 statistical checks.

1analysis of the results in the tally fluctuation chart bin (tfc) for tally        4 with nps =  2570457714  print table 160


 normed average tally per history  = 2.76091E-07          unnormed average tally per history  = 1.10436E-03
 estimated tally relative error    = 0.0002               estimated variance of the variance  = 0.0002
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =    51664320          efficiency for the nonzero tallies  = 0.0201
 history number of largest  tally  =   203721326          largest  unnormalized history tally = 5.20186E+01
 (largest  tally)/(average tally)  = 4.71027E+04          (largest  tally)/(avg nonzero tally)= 9.46730E+02

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 2.76091E-07


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            2.76091E-07             2.76096E-07                     0.000018
      relative error                  1.95400E-04             1.96254E-04                     0.004369
      variance of the variance        1.94054E-04             2.66683E-04                     0.374271
      shifted center                  2.76091E-07             2.76091E-07                     0.000000
      figure of merit                 1.30954E+02             1.29817E+02                    -0.008681

 the estimated inverse power slope of the 200 largest  tallies starting at 2.45023E+00 is 2.3976
 the history score probability density function appears to have an unsampled region at the largest  history scores:
 please examine. see print table 161.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (1.285E+04)*( 1.009E-01)**2 = (1.285E+04)*(1.019E-02) = 1.310E+02

1unnormed tally density for tally        4          nonzero tally mean(m) = 5.495E-02   nps =  2570457714  print table 161

 abscissa              ordinate   log plot of tally probability density function in tally fluctuation chart bin(d=decade,slope= 2.4)
  tally  number num den log den:d--------d--------d---------d--------d---------d---------d--------d---------d---------d--------d----
 2.51-09      1 4.20-01  -0.377 *********|********|*********|********|*********|*********|********|*********|*********|********|*** 
 3.98-09      2 5.30-01  -0.276 *********|********|*********|********|*********|*********|********|*********|*********|********|****
 6.31-09      1 1.67-01  -0.777 *********|********|*********|********|*********|*********|********|*********|*********|********|    
 1.00-08      4 4.22-01  -0.375 *********|********|*********|********|*********|*********|********|*********|*********|********|*** 
 1.58-08      3 2.00-01  -0.700 *********|********|*********|********|*********|*********|********|*********|*********|********|    
 2.51-08      4 1.68-01  -0.775 *********|********|*********|********|*********|*********|********|*********|*********|********|    
 3.98-08      5 1.32-01  -0.878 *********|********|*********|********|*********|*********|********|*********|*********|******* |    
 6.31-08     14 2.34-01  -0.631 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 1.00-07     23 2.42-01  -0.615 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 1.58-07     29 1.93-01  -0.715 *********|********|*********|********|*********|*********|********|*********|*********|********|    
 2.51-07     55 2.31-01  -0.637 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 3.98-07     84 2.22-01  -0.653 *********|********|*********|********|*********|*********|********|*********|*********|********|    
 6.31-07    118 1.97-01  -0.705 *********|********|*********|********|*********|*********|********|*********|*********|********|    
 1.00-06    201 2.12-01  -0.674 *********|********|*********|********|*********|*********|********|*********|*********|********|    
 1.58-06    329 2.19-01  -0.660 *********|********|*********|********|*********|*********|********|*********|*********|********|    
 2.51-06    450 1.89-01  -0.724 *********|********|*********|********|*********|*********|********|*********|*********|********|    
 3.98-06    780 2.07-01  -0.685 *********|********|*********|********|*********|*********|********|*********|*********|********|    
 6.31-06   1217 2.03-01  -0.692 *********|********|*********|********|*********|*********|********|*********|*********|********|    
 1.00-05   1925 2.03-01  -0.693 *********|********|*********|********|*********|*********|********|*********|*********|********|    
 1.58-05   3031 2.02-01  -0.696 *********|********|*********|********|*********|*********|********|*********|*********|********|    
 2.51-05   4783 2.01-01  -0.697 *********|********|*********|********|*********|*********|********|*********|*********|********|    
 3.98-05   7612 2.02-01  -0.696 *********|********|*********|********|*********|*********|********|*********|*********|********|    
 6.31-05  12104 2.02-01  -0.694 *********|********|*********|********|*********|*********|********|*********|*********|********|    
 1.00-04  19205 2.02-01  -0.694 *********|********|*********|********|*********|*********|********|*********|*********|********|    
 1.58-04  30415 2.02-01  -0.694 *********|********|*********|********|*********|*********|********|*********|*********|********|    
 2.51-04  48073 2.02-01  -0.695 *********|********|*********|********|*********|*********|********|*********|*********|********|    
 3.98-04  75336 1.99-01  -0.700 *********|********|*********|********|*********|*********|********|*********|*********|********|    
 6.31-04 119677 2.00-01  -0.699 *********|********|*********|********|*********|*********|********|*********|*********|********|    
 1.00-03 189702 2.00-01  -0.699 *********|********|*********|********|*********|*********|********|*********|*********|********|    
 1.58-03 300687 2.00-01  -0.699 *********|********|*********|********|*********|*********|********|*********|*********|********|    
 2.51-03 475421 2.00-01  -0.700 *********|********|*********|********|*********|*********|********|*********|*********|********|    
 3.98-03 752305 1.99-01  -0.701 *********|********|*********|********|*********|*********|********|*********|*********|********|    
 6.31-03 1.2+06 2.00-01  -0.699 *********|********|*********|********|*********|*********|********|*********|*********|********|    
 1.00-02 2.0+06 2.06-01  -0.686 *********|********|*********|********|*********|*********|********|*********|*********|********|    
 1.58-02 3.9+06 2.62-01  -0.581 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 2.51-02 6.9+06 2.92-01  -0.535 *********|********|*********|********|*********|*********|********|*********|*********|********|**  
 3.98-02 9.5+06 2.51-01  -0.600 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 6.31-02 1.0+07 1.71-01  -0.766 mmmmmmmmm|mmmmmmmm|mmmmmmmmm|mmmmmmmm|mmmmmmmmm|mmmmmmmmm|mmmmmmmm|mmmmmmmmm|mmmmmmmmm|mmmmmmmm|    
 1.00-01 8.5+06 8.97-02  -1.047 *********|********|*********|********|*********|*********|********|*********|*********|******  |    
 1.58-01 5.1+06 3.37-02  -1.473 *********|********|*********|********|*********|*********|********|*********|*********|*       |    
 2.51-01 1.8+06 7.56-03  -2.121 *********|********|*********|********|*********|*********|********|*********|*****    |        |    
 3.98-01 390873 1.04-03  -2.985 *********|********|*********|********|*********|*********|********|*******  |         |        |    
 6.31-01  56414 9.43-05  -4.026 *********|********|*********|********|*********|*********|******  |         |         |        |    
 1.00+00   8457 8.92-06  -5.050 *********|********|*********|********|*********|******   |        |         |         |        |    
 1.58+00   1740 1.16-06  -5.937 *********|********|*********|********|******** |         |        |         |         |        |    
 2.51+00    490 2.06-07  -6.687 *********|********|*********|********|        s|         |        |         |         |        |    
 3.98+00    123 3.26-08  -7.487 *********|********|*********|**      |     s   |         |        |         |         |        |    
 6.31+00     34 5.68-09  -8.246 *********|********|****     |        |  s      |         |        |         |         |        |    
 1.00+01     16 1.69-09  -8.773 *********|********|         |       s|         |         |        |         |         |        |    
 1.58+01      5 3.33-10  -9.478 *********|**      |         |   s    |         |         |        |         |         |        |    
 2.51+01      4 1.68-10  -9.775 *********|        |         s        |         |         |        |         |         |        |    
 3.98+01      1 2.65-11 -10.577 *        |        |    s    |        |         |         |        |         |         |        |    
 6.31+01      3 5.01-11 -10.300 ****     |        |s        |        |         |         |        |         |         |        |    
  total 5.17+07 2.01-02         d--------d--------d---------d--------d---------d---------d--------d---------d---------d--------d----

1tally       14        nps =  2570457714
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      11                                                                                   
                         4.00000E+03
 
 cell  11                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 4.03597E-07 0.0002   4.26832E-12 0.0448   0.00000E+00 0.0000   0.00000E+00 0.0000   0.00000E+00 0.0000
 
         time:       2.0000E+07             total                                                                  
                 0.00000E+00 0.0000   4.03601E-07 0.0002


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       14

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00       no           no            0.03       no          no            constant    random       2.80
 passed?        yes          yes       no           no             yes       no          no               yes        yes          no

 ===================================================================================================================================


 warning.  the tally in the tally fluctuation chart bin did not pass  5 of the 10 statistical checks.

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       14 with nps =  2570457714  print table 160


 normed average tally per history  = 4.03601E-07          unnormed average tally per history  = 1.61440E-03
 estimated tally relative error    = 0.0002               estimated variance of the variance  = 0.0348
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0002

 number of nonzero history tallies =    66059005          efficiency for the nonzero tallies  = 0.0257
 history number of largest  tally  =  1621837713          largest  unnormalized history tally = 3.46654E+02
 (largest  tally)/(average tally)  = 2.14726E+05          (largest  tally)/(avg nonzero tally)= 5.51830E+03

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 4.03604E-07


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            4.03601E-07             4.03635E-07                     0.000084
      relative error                  1.93503E-04             2.10747E-04                     0.089114
      variance of the variance        3.47755E-02             4.93852E-02                     0.420117
      shifted center                  4.03604E-07             4.03606E-07                     0.000005
      figure of merit                 1.33535E+02             1.12577E+02                    -0.156949

 the estimated inverse power slope of the 200 largest  tallies starting at 3.83782E+00 is 2.8046
 the history score probability density function appears to have an unsampled region at the largest  history scores:
 please examine. see print table 161.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (1.285E+04)*( 1.019E-01)**2 = (1.285E+04)*(1.039E-02) = 1.335E+02

1unnormed tally density for tally       14          nonzero tally mean(m) = 6.282E-02   nps =  2570457714  print table 161

 abscissa              ordinate   log plot of tally probability density function in tally fluctuation chart bin(d=decade,slope= 2.8)
  tally  number num den log den:d------d-------d-------d------d-------d-------d-------d-------d-------d------d-------d-------d------
 3.98-11      1 1.96+01   1.292 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|*******|******
 7.94-11      0 0.00+00   0.000        |       |       |      |       |       |       |       |       |      |       |       |      
 1.58-10      0 0.00+00   0.000        |       |       |      |       |       |       |       |       |      |       |       |      
 3.16-10      0 0.00+00   0.000        |       |       |      |       |       |       |       |       |      |       |       |      
 6.31-10      0 0.00+00   0.000        |       |       |      |       |       |       |       |       |      |       |       |      
 1.26-09      1 6.20-01  -0.208 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|**     |      
 2.51-09      1 3.10-01  -0.508 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 5.01-09      3 4.67-01  -0.331 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|*      |      
 1.00-08      2 1.56-01  -0.807 *******|*******|*******|******|*******|*******|*******|*******|*******|******|****** |       |      
 2.00-08      6 2.35-01  -0.630 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 3.98-08     14 2.74-01  -0.562 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 7.94-08     20 1.96-01  -0.707 *******|*******|*******|******|*******|*******|*******|*******|*******|******|****** |       |      
 1.58-07     31 1.53-01  -0.817 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*****  |       |      
 3.16-07    100 2.47-01  -0.608 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 6.31-07    166 2.05-01  -0.688 *******|*******|*******|******|*******|*******|*******|*******|*******|******|****** |       |      
 1.26-06    383 2.37-01  -0.625 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 2.51-06    711 2.21-01  -0.656 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 5.01-06   1412 2.20-01  -0.658 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 1.00-05   2761 2.15-01  -0.667 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 2.00-05   5624 2.20-01  -0.658 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 3.98-05  11327 2.22-01  -0.654 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 7.94-05  22533 2.21-01  -0.655 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 1.58-04  44727 2.20-01  -0.657 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 3.16-04  89787 2.21-01  -0.655 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 6.31-04 178275 2.20-01  -0.657 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 1.26-03 354446 2.20-01  -0.658 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 2.51-03 707322 2.20-01  -0.658 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 5.01-03 1.4+06 2.20-01  -0.657 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 1.00-02 2.9+06 2.27-01  -0.645 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 2.00-02 8.1+06 3.16-01  -0.501 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 3.98-02 1.6+07 3.05-01  -0.515 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 7.94-02 1.9+07 1.88-01  -0.725 mmmmmmm|mmmmmmm|mmmmmmm|mmmmmm|mmmmmmm|mmmmmmm|mmmmmmm|mmmmmmm|mmmmmmm|mmmmmm|mmmmmm |       |      
 1.58-01 1.3+07 6.45-02  -1.190 *******|*******|*******|******|*******|*******|*******|*******|*******|******|***    |       |      
 3.16-01 3.9+06 9.61-03  -2.017 *******|*******|*******|******|*******|*******|*******|*******|*******|***   |       |       |      
 6.31-01 417991 5.17-04  -3.287 *******|*******|*******|******|*******|*******|*******|*******|*      |      |       |       |      
 1.26+00  27185 1.68-05  -4.774 *******|*******|*******|******|*******|*******|*****  |       |       |      |       |       |      
 2.51+00   2864 8.89-07  -6.051 *******|*******|*******|******|*******|***    |       |       |       |      |       |       |      
 5.01+00    447 6.96-08  -7.158 *******|*******|*******|******|***    |    s  |       |       |       |      |       |       |      
 1.00+01     86 6.71-09  -8.173 *******|*******|*******|**    |       |s      |       |       |       |      |       |       |      
 2.00+01     28 1.09-09  -8.961 *******|*******|****   |      |    s  |       |       |       |       |      |       |       |      
 3.98+01      5 9.80-11 -10.009 *******|***    |       |     s|       |       |       |       |       |      |       |       |      
 7.94+01      1 9.82-12 -11.008 ***    |       |       s      |       |       |       |       |       |      |       |       |      
 1.58+02      0 0.00+00   0.000        |       | s     |      |       |       |       |       |       |      |       |       |      
 3.16+02      0 0.00+00   0.000        |  s    |       |      |       |       |       |       |       |      |       |       |      
 3.98+02      1 4.75-12 -11.323 *     s|       |       |      |       |       |       |       |       |      |       |       |      
  total 6.61+07 2.57-02         d------d-------d-------d------d-------d-------d-------d-------d-------d------d-------d-------d------

1tally       24        nps =  2570457714
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      12                                                                                   
                         4.00000E+03
 
 cell  12                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 9.18888E-07 0.0001   1.10173E-11 0.0288   0.00000E+00 0.0000   0.00000E+00 0.0000   0.00000E+00 0.0000
 
         time:       2.0000E+07             total                                                                  
                 0.00000E+00 0.0000   9.18899E-07 0.0001


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       24

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00       no          no            constant    random       2.42
 passed?        yes          yes      yes          yes             yes       no          no               yes        yes          no

 ===================================================================================================================================


 warning.  the tally in the tally fluctuation chart bin did not pass  3 of the 10 statistical checks.

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       24 with nps =  2570457714  print table 160


 normed average tally per history  = 9.18899E-07          unnormed average tally per history  = 3.67560E-03
 estimated tally relative error    = 0.0001               estimated variance of the variance  = 0.0000
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =   134887325          efficiency for the nonzero tallies  = 0.0525
 history number of largest  tally  =  1905629390          largest  unnormalized history tally = 5.93042E+01
 (largest  tally)/(average tally)  = 1.61346E+04          (largest  tally)/(avg nonzero tally)= 8.46678E+02

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 9.18899E-07


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            9.18899E-07             9.18905E-07                     0.000006
      relative error                  1.17071E-04             1.17239E-04                     0.001430
      variance of the variance        1.38433E-05             2.19787E-05                     0.587674
      shifted center                  9.18899E-07             9.18899E-07                     0.000000
      figure of merit                 3.64811E+02             3.63770E+02                    -0.002854

 the estimated inverse power slope of the 200 largest  tallies starting at 3.46704E+00 is 2.4168
 the large score tail of the empirical history score probability density function appears to have no unsampled regions.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (1.285E+04)*( 1.685E-01)**2 = (1.285E+04)*(2.838E-02) = 3.648E+02

1unnormed tally density for tally       24          nonzero tally mean(m) = 7.004E-02   nps =  2570457714  print table 161

 abscissa              ordinate   log plot of tally probability density function in tally fluctuation chart bin(d=decade,slope= 2.4)
  tally  number num den log den:d--------d--------d---------d--------d---------d---------d--------d---------d---------d--------d----
 1.58-09      1 6.65-01  -0.177 *********|********|*********|********|*********|*********|********|*********|*********|********|****
 2.51-09      1 4.20-01  -0.377 *********|********|*********|********|*********|*********|********|*********|*********|********|**  
 3.98-09      0 0.00+00   0.000          |        |         |        |         |         |        |         |         |        |    
 6.31-09      2 3.34-01  -0.476 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 1.00-08      1 1.05-01  -0.977 *********|********|*********|********|*********|*********|********|*********|*********|*****   |    
 1.58-08      9 5.99-01  -0.223 *********|********|*********|********|*********|*********|********|*********|*********|********|****
 2.51-08     15 6.30-01  -0.201 *********|********|*********|********|*********|*********|********|*********|*********|********|****
 3.98-08     15 3.97-01  -0.401 *********|********|*********|********|*********|*********|********|*********|*********|********|**  
 6.31-08     27 4.51-01  -0.346 *********|********|*********|********|*********|*********|********|*********|*********|********|**  
 1.00-07     28 2.95-01  -0.530 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 1.58-07     58 3.86-01  -0.414 *********|********|*********|********|*********|*********|********|*********|*********|********|**  
 2.51-07     68 2.85-01  -0.545 *********|********|*********|********|*********|*********|********|*********|*********|********|    
 3.98-07    136 3.60-01  -0.444 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 6.31-07    214 3.58-01  -0.447 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 1.00-06    318 3.35-01  -0.475 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 1.58-06    580 3.86-01  -0.414 *********|********|*********|********|*********|*********|********|*********|*********|********|**  
 2.51-06    873 3.66-01  -0.436 *********|********|*********|********|*********|*********|********|*********|*********|********|**  
 3.98-06   1319 3.49-01  -0.457 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 6.31-06   2192 3.66-01  -0.436 *********|********|*********|********|*********|*********|********|*********|*********|********|**  
 1.00-05   3315 3.49-01  -0.457 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 1.58-05   5284 3.51-01  -0.454 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 2.51-05   8423 3.53-01  -0.452 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 3.98-05  13239 3.51-01  -0.455 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 6.31-05  21139 3.53-01  -0.452 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 1.00-04  33248 3.50-01  -0.455 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 1.58-04  53505 3.56-01  -0.449 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 2.51-04  84643 3.55-01  -0.449 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 3.98-04 132921 3.52-01  -0.453 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 6.31-04 210639 3.52-01  -0.454 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 1.00-03 335175 3.53-01  -0.452 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 1.58-03 530869 3.53-01  -0.452 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 2.51-03 845763 3.55-01  -0.450 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 3.98-03 1.4+06 3.58-01  -0.447 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 6.31-03 2.2+06 3.64-01  -0.439 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 1.00-02 3.6+06 3.82-01  -0.418 *********|********|*********|********|*********|*********|********|*********|*********|********|**  
 1.58-02 7.6+06 5.05-01  -0.297 *********|********|*********|********|*********|*********|********|*********|*********|********|*** 
 2.51-02 1.5+07 6.14-01  -0.212 *********|********|*********|********|*********|*********|********|*********|*********|********|****
 3.98-02 2.2+07 5.71-01  -0.244 *********|********|*********|********|*********|*********|********|*********|*********|********|*** 
 6.31-02 2.6+07 4.36-01  -0.361 *********|********|*********|********|*********|*********|********|*********|*********|********|**  
 1.00-01 2.5+07 2.69-01  -0.571 mmmmmmmmm|mmmmmmmm|mmmmmmmmm|mmmmmmmm|mmmmmmmmm|mmmmmmmmm|mmmmmmmm|mmmmmmmmm|mmmmmmmmm|mmmmmmmm|    
 1.58-01 1.9+07 1.23-01  -0.910 *********|********|*********|********|*********|*********|********|*********|*********|******  |    
 2.51-01 8.8+06 3.68-02  -1.434 *********|********|*********|********|*********|*********|********|*********|*********|*       |    
 3.98-01 2.4+06 6.36-03  -2.197 *********|********|*********|********|*********|*********|********|*********|****     |        |    
 6.31-01 376523 6.29-04  -3.201 *********|********|*********|********|*********|*********|********|****     |         |        |    
 1.00+00  49656 5.23-05  -4.281 *********|********|*********|********|*********|*********|***     |         |         |        |    
 1.58+00   8161 5.43-06  -5.265 *********|********|*********|********|*********|***      |        |         |         |        |    
 2.51+00   1801 7.56-07  -6.122 *********|********|*********|********|*****    |         |        |         |         |        |    
 3.98+00    470 1.24-07  -6.905 *********|********|*********|******  |      s  |         |        |         |         |        |    
 6.31+00     90 1.50-08  -7.823 *********|********|*******  |        |  s      |         |        |         |         |        |    
 1.00+01     19 2.00-09  -8.698 *********|********|         |        s         |         |        |         |         |        |    
 1.58+01      8 5.32-10  -9.274 *********|***     |         |    s   |         |         |        |         |         |        |    
 2.51+01      4 1.68-10  -9.775 ******** |        |         s        |         |         |        |         |         |        |    
 3.98+01      2 5.30-11 -10.276 ***      |        |     s   |        |         |         |        |         |         |        |    
 6.31+01      2 3.34-11 -10.476 *        |        |s        |        |         |         |        |         |         |        |    
  total 1.35+08 5.25-02         d--------d--------d---------d--------d---------d---------d--------d---------d---------d--------d----

1tally       34        nps =  2570457714
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      13                                                                                   
                         4.00000E+03
 
 cell  13                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 4.03694E-07 0.0002   4.06375E-12 0.0467   0.00000E+00 0.0000   0.00000E+00 0.0000   0.00000E+00 0.0000
 
         time:       2.0000E+07             total                                                                  
                 0.00000E+00 0.0000   4.03698E-07 0.0002


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       34

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00       no          no            constant    random       2.86
 passed?        yes          yes      yes          yes             yes       no          no               yes        yes          no

 ===================================================================================================================================


 warning.  the tally in the tally fluctuation chart bin did not pass  3 of the 10 statistical checks.

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       34 with nps =  2570457714  print table 160


 normed average tally per history  = 4.03698E-07          unnormed average tally per history  = 1.61479E-03
 estimated tally relative error    = 0.0002               estimated variance of the variance  = 0.0016
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =    65210778          efficiency for the nonzero tallies  = 0.0254
 history number of largest  tally  =  2198307481          largest  unnormalized history tally = 1.48483E+02
 (largest  tally)/(average tally)  = 9.19519E+04          (largest  tally)/(avg nonzero tally)= 2.33276E+03

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 4.03698E-07


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            4.03698E-07             4.03712E-07                     0.000036
      relative error                  1.78555E-04             1.82097E-04                     0.019835
      variance of the variance        1.63569E-03             3.00095E-03                     0.834670
      shifted center                  4.03698E-07             4.03698E-07                     0.000001
      figure of merit                 1.56829E+02             1.50788E+02                    -0.038520

 the estimated inverse power slope of the 200 largest  tallies starting at 3.86896E+00 is 2.8608
 the history score probability density function appears to have an unsampled region at the largest  history scores:
 please examine. see print table 161.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (1.285E+04)*( 1.105E-01)**2 = (1.285E+04)*(1.220E-02) = 1.568E+02

1unnormed tally density for tally       34          nonzero tally mean(m) = 6.365E-02   nps =  2570457714  print table 161

 abscissa              ordinate   log plot of tally probability density function in tally fluctuation chart bin(d=decade,slope= 2.9)
  tally  number num den log den:d-------d---------d--------d--------d---------d--------d--------d--------d---------d--------d-------
 2.00-09      1 5.28-01  -0.277 ********|*********|********|********|*********|********|********|********|*********|********|*******
 3.16-09      1 3.33-01  -0.477 ********|*********|********|********|*********|********|********|********|*********|********|*****  
 5.01-09      0 0.00+00   0.000         |         |        |        |         |        |        |        |         |        |       
 7.94-09      0 0.00+00   0.000         |         |        |        |         |        |        |        |         |        |       
 1.26-08      2 1.67-01  -0.776 ********|*********|********|********|*********|********|********|********|*********|********|**     
 2.00-08      2 1.06-01  -0.976 ********|*********|********|********|*********|********|********|********|*********|********|       
 3.16-08      4 1.33-01  -0.875 ********|*********|********|********|*********|********|********|********|*********|********|*      
 5.01-08     12 2.52-01  -0.598 ********|*********|********|********|*********|********|********|********|*********|********|****   
 7.94-08     24 3.19-01  -0.497 ********|*********|********|********|*********|********|********|********|*********|********|*****  
 1.26-07     32 2.68-01  -0.572 ********|*********|********|********|*********|********|********|********|*********|********|****   
 2.00-07     61 3.22-01  -0.492 ********|*********|********|********|*********|********|********|********|*********|********|*****  
 3.16-07     56 1.87-01  -0.729 ********|*********|********|********|*********|********|********|********|*********|********|***    
 5.01-07    110 2.31-01  -0.636 ********|*********|********|********|*********|********|********|********|*********|********|****   
 7.94-07    166 2.20-01  -0.657 ********|*********|********|********|*********|********|********|********|*********|********|***    
 1.26-06    226 1.89-01  -0.723 ********|*********|********|********|*********|********|********|********|*********|********|***    
 2.00-06    393 2.08-01  -0.683 ********|*********|********|********|*********|********|********|********|*********|********|***    
 3.16-06    668 2.23-01  -0.652 ********|*********|********|********|*********|********|********|********|*********|********|****   
 5.01-06   1028 2.16-01  -0.665 ********|*********|********|********|*********|********|********|********|*********|********|***    
 7.94-06   1707 2.27-01  -0.645 ********|*********|********|********|*********|********|********|********|*********|********|****   
 1.26-05   2586 2.17-01  -0.664 ********|*********|********|********|*********|********|********|********|*********|********|***    
 2.00-05   4079 2.16-01  -0.667 ********|*********|********|********|*********|********|********|********|*********|********|***    
 3.16-05   6464 2.15-01  -0.667 ********|*********|********|********|*********|********|********|********|*********|********|***    
 5.01-05  10194 2.14-01  -0.669 ********|*********|********|********|*********|********|********|********|*********|********|***    
 7.94-05  16451 2.18-01  -0.661 ********|*********|********|********|*********|********|********|********|*********|********|***    
 1.26-04  25583 2.14-01  -0.669 ********|*********|********|********|*********|********|********|********|*********|********|***    
 2.00-04  40666 2.15-01  -0.668 ********|*********|********|********|*********|********|********|********|*********|********|***    
 3.16-04  64494 2.15-01  -0.668 ********|*********|********|********|*********|********|********|********|*********|********|***    
 5.01-04 102522 2.16-01  -0.666 ********|*********|********|********|*********|********|********|********|*********|********|***    
 7.94-04 161538 2.14-01  -0.669 ********|*********|********|********|*********|********|********|********|*********|********|***    
 1.26-03 255895 2.14-01  -0.669 ********|*********|********|********|*********|********|********|********|*********|********|***    
 2.00-03 405209 2.14-01  -0.669 ********|*********|********|********|*********|********|********|********|*********|********|***    
 3.16-03 643057 2.14-01  -0.669 ********|*********|********|********|*********|********|********|********|*********|********|***    
 5.01-03 1.0+06 2.15-01  -0.668 ********|*********|********|********|*********|********|********|********|*********|********|***    
 7.94-03 1.6+06 2.17-01  -0.664 ********|*********|********|********|*********|********|********|********|*********|********|***    
 1.26-02 2.9+06 2.40-01  -0.620 ********|*********|********|********|*********|********|********|********|*********|********|****   
 2.00-02 6.1+06 3.22-01  -0.492 ********|*********|********|********|*********|********|********|********|*********|********|*****  
 3.16-02 9.2+06 3.07-01  -0.513 ********|*********|********|********|*********|********|********|********|*********|********|*****  
 5.01-02 1.2+07 2.60-01  -0.586 ********|*********|********|********|*********|********|********|********|*********|********|****   
 7.94-02 1.3+07 1.69-01  -0.773 mmmmmmmm|mmmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmmm|mmmmmmmm|mm     
 1.26-01 9.8+06 8.24-02  -1.084 ********|*********|********|********|*********|********|********|********|*********|********|       
 2.00-01 5.4+06 2.87-02  -1.542 ********|*********|********|********|*********|********|********|********|*********|****    |       
 3.16-01 1.9+06 6.19-03  -2.209 ********|*********|********|********|*********|********|********|********|******** |        |       
 5.01-01 385859 8.12-04  -3.091 ********|*********|********|********|*********|********|********|********|         |        |       
 7.94-01  60485 8.03-05  -4.095 ********|*********|********|********|*********|********|********|        |         |        |       
 1.26+00  10650 8.92-06  -5.050 ********|*********|********|********|*********|********|        |        |         |        |       
 2.00+00   2585 1.37-06  -5.865 ********|*********|********|********|*********|*       |        |        |         |        |       
 3.16+00    696 2.32-07  -6.634 ********|*********|********|********|****     |        |        |        |         |        |       
 5.01+00    216 4.54-08  -7.343 ********|*********|********|******  |      s  |        |        |        |         |        |       
 7.94+00     63 8.36-09  -8.078 ********|*********|********|        |   s     |        |        |        |         |        |       
 1.26+01     31 2.60-09  -8.586 ********|*********|****    |        s         |        |        |        |         |        |       
 2.00+01     13 6.87-10  -9.163 ********|******** |        |    s   |         |        |        |        |         |        |       
 3.16+01      2 6.67-11 -10.176 ********|         |        |s       |         |        |        |        |         |        |       
 5.01+01      1 2.10-11 -10.677 ***     |         |    s   |        |         |        |        |        |         |        |       
 7.94+01      0 0.00+00   0.000         |         s        |        |         |        |        |        |         |        |       
 1.26+02      0 0.00+00   0.000         |    s    |        |        |         |        |        |        |         |        |       
 1.58+02      1 1.19-11 -10.923 *       s         |        |        |         |        |        |        |         |        |       
  total 6.52+07 2.54-02         d-------d---------d--------d--------d---------d--------d--------d--------d---------d--------d-------

1tally       44        nps =  2570457714
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      14                                                                                   
                         4.00000E+03
 
 cell  14                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 4.97048E-07 0.0002   4.87428E-12 0.0445   0.00000E+00 0.0000   0.00000E+00 0.0000   0.00000E+00 0.0000
 
         time:       2.0000E+07             total                                                                  
                 0.00000E+00 0.0000   4.97053E-07 0.0002


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       44

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00      yes          no            constant    random       2.79
 passed?        yes          yes      yes          yes             yes      yes          no               yes        yes          no

 ===================================================================================================================================


 warning.  the tally in the tally fluctuation chart bin did not pass  2 of the 10 statistical checks.

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       44 with nps =  2570457714  print table 160


 normed average tally per history  = 4.97053E-07          unnormed average tally per history  = 1.98821E-03
 estimated tally relative error    = 0.0002               estimated variance of the variance  = 0.0001
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =    76090020          efficiency for the nonzero tallies  = 0.0296
 history number of largest  tally  =   579292617          largest  unnormalized history tally = 7.59621E+01
 (largest  tally)/(average tally)  = 3.82062E+04          (largest  tally)/(avg nonzero tally)= 1.13097E+03

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 4.97053E-07


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            4.97053E-07             4.97060E-07                     0.000015
      relative error                  1.62264E-04             1.62941E-04                     0.004172
      variance of the variance        1.28032E-04             1.95142E-04                     0.524169
      shifted center                  4.97053E-07             4.97053E-07                     0.000000
      figure of merit                 1.89901E+02             1.88326E+02                    -0.008291

 the estimated inverse power slope of the 200 largest  tallies starting at 4.46119E+00 is 2.7896
 the history score probability density function appears to have an unsampled region at the largest  history scores:
 please examine. see print table 161.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (1.285E+04)*( 1.216E-01)**2 = (1.285E+04)*(1.478E-02) = 1.899E+02

1unnormed tally density for tally       44          nonzero tally mean(m) = 6.717E-02   nps =  2570457714  print table 161

 abscissa              ordinate   log plot of tally probability density function in tally fluctuation chart bin(d=decade,slope= 2.8)
  tally  number num den log den:d--------d---------d---------d---------d--------d---------d---------d---------d---------d---------d-
 6.31-09      3 5.01-01  -0.300 *********|*********|*********|*********|********|*********|*********|*********|*********|*********|*
 1.00-08      4 4.22-01  -0.375 *********|*********|*********|*********|********|*********|*********|*********|*********|*********| 
 1.58-08      3 2.00-01  -0.700 *********|*********|*********|*********|********|*********|*********|*********|*********|*******  | 
 2.51-08      2 8.39-02  -1.076 *********|*********|*********|*********|********|*********|*********|*********|*********|***      | 
 3.98-08      6 1.59-01  -0.799 *********|*********|*********|*********|********|*********|*********|*********|*********|******   | 
 6.31-08     17 2.84-01  -0.547 *********|*********|*********|*********|********|*********|*********|*********|*********|*********| 
 1.00-07     13 1.37-01  -0.863 *********|*********|*********|*********|********|*********|*********|*********|*********|*****    | 
 1.58-07     38 2.53-01  -0.597 *********|*********|*********|*********|********|*********|*********|*********|*********|******** | 
 2.51-07     71 2.98-01  -0.526 *********|*********|*********|*********|********|*********|*********|*********|*********|*********| 
 3.98-07     86 2.28-01  -0.643 *********|*********|*********|*********|********|*********|*********|*********|*********|******** | 
 6.31-07    112 1.87-01  -0.728 *********|*********|*********|*********|********|*********|*********|*********|*********|*******  | 
 1.00-06    209 2.20-01  -0.657 *********|*********|*********|*********|********|*********|*********|*********|*********|*******  | 
 1.58-06    362 2.41-01  -0.618 *********|*********|*********|*********|********|*********|*********|*********|*********|******** | 
 2.51-06    522 2.19-01  -0.659 *********|*********|*********|*********|********|*********|*********|*********|*********|*******  | 
 3.98-06    878 2.32-01  -0.634 *********|*********|*********|*********|********|*********|*********|*********|*********|******** | 
 6.31-06   1389 2.32-01  -0.634 *********|*********|*********|*********|********|*********|*********|*********|*********|******** | 
 1.00-05   2190 2.31-01  -0.637 *********|*********|*********|*********|********|*********|*********|*********|*********|******** | 
 1.58-05   3514 2.34-01  -0.631 *********|*********|*********|*********|********|*********|*********|*********|*********|******** | 
 2.51-05   5406 2.27-01  -0.644 *********|*********|*********|*********|********|*********|*********|*********|*********|******** | 
 3.98-05   8722 2.31-01  -0.636 *********|*********|*********|*********|********|*********|*********|*********|*********|******** | 
 6.31-05  13822 2.31-01  -0.637 *********|*********|*********|*********|********|*********|*********|*********|*********|******** | 
 1.00-04  21897 2.31-01  -0.637 *********|*********|*********|*********|********|*********|*********|*********|*********|******** | 
 1.58-04  35256 2.35-01  -0.630 *********|*********|*********|*********|********|*********|*********|*********|*********|******** | 
 2.51-04  55283 2.32-01  -0.634 *********|*********|*********|*********|********|*********|*********|*********|*********|******** | 
 3.98-04  87201 2.31-01  -0.637 *********|*********|*********|*********|********|*********|*********|*********|*********|******** | 
 6.31-04 138329 2.31-01  -0.636 *********|*********|*********|*********|********|*********|*********|*********|*********|******** | 
 1.00-03 218482 2.30-01  -0.638 *********|*********|*********|*********|********|*********|*********|*********|*********|******** | 
 1.58-03 346265 2.30-01  -0.638 *********|*********|*********|*********|********|*********|*********|*********|*********|******** | 
 2.51-03 548661 2.30-01  -0.638 *********|*********|*********|*********|********|*********|*********|*********|*********|******** | 
 3.98-03 870796 2.31-01  -0.637 *********|*********|*********|*********|********|*********|*********|*********|*********|******** | 
 6.31-03 1.4+06 2.33-01  -0.633 *********|*********|*********|*********|********|*********|*********|*********|*********|******** | 
 1.00-02 2.3+06 2.39-01  -0.621 *********|*********|*********|*********|********|*********|*********|*********|*********|******** | 
 1.58-02 4.5+06 3.00-01  -0.523 *********|*********|*********|*********|********|*********|*********|*********|*********|*********| 
 2.51-02 8.6+06 3.60-01  -0.444 *********|*********|*********|*********|********|*********|*********|*********|*********|*********| 
 3.98-02 1.2+07 3.29-01  -0.483 *********|*********|*********|*********|********|*********|*********|*********|*********|*********| 
 6.31-02 1.5+07 2.48-01  -0.605 *********|*********|*********|*********|********|*********|*********|*********|*********|******** | 
 1.00-01 1.4+07 1.48-01  -0.830 mmmmmmmmm|mmmmmmmmm|mmmmmmmmm|mmmmmmmmm|mmmmmmmm|mmmmmmmmm|mmmmmmmmm|mmmmmmmmm|mmmmmmmmm|mmmmmm   | 
 1.58-01 9.8+06 6.50-02  -1.187 *********|*********|*********|*********|********|*********|*********|*********|*********|**       | 
 2.51-01 4.4+06 1.85-02  -1.734 *********|*********|*********|*********|********|*********|*********|*********|*******  |         | 
 3.98-01 1.2+06 3.25-03  -2.488 *********|*********|*********|*********|********|*********|*********|*********|         |         | 
 6.31-01 214054 3.58-04  -3.447 *********|*********|*********|*********|********|*********|*********|         |         |         | 
 1.00+00  33397 3.52-05  -4.453 *********|*********|*********|*********|********|*********|         |         |         |         | 
 1.58+00   6665 4.43-06  -5.353 *********|*********|*********|*********|********|*        |         |         |         |         | 
 2.51+00   1787 7.50-07  -6.125 *********|*********|*********|*********|**      |         |         |         |         |         | 
 3.98+00    532 1.41-07  -6.851 *********|*********|*********|*****    |        |         |         |         |         |         | 
 6.31+00    176 2.94-08  -7.532 *********|*********|*********|        s|        |         |         |         |         |         | 
 1.00+01     54 5.69-09  -8.245 *********|*********|**       |     s   |        |         |         |         |         |         | 
 1.58+01     22 1.46-09  -8.835 *********|******   |         |s        |        |         |         |         |         |         | 
 2.51+01     11 4.62-10  -9.336 *********|*        |      s  |         |        |         |         |         |         |         | 
 3.98+01      3 7.94-11 -10.100 ***      |         | s       |         |        |         |         |         |         |         | 
 6.31+01      0 0.00+00   0.000          |      s  |         |         |        |         |         |         |         |         | 
 7.94+01      2 4.76-11 -10.322 *        |  s      |         |         |        |         |         |         |         |         | 
  total 7.61+07 2.96-02         d--------d---------d---------d---------d--------d---------d---------d---------d---------d---------d-

1status of the statistical checks used to form confidence intervals for the mean for each tally bin


 tally   result of statistical checks for the tfc bin (the first check not passed is listed) and error magnitude check for all bins

        4   missed  1 of 10 tfc bin checks: the slope of decrease of largest tallies is less than the minimum acceptable value of 3.0 
         passed all bin error check:     7 tally bins had     4 bins with zeros and     0 bins with relative errors exceeding 0.10

       14   missed  5 of 10 tfc bin checks: the relative error does not monotonically decrease over the last half of the problem      
         passed all bin error check:     7 tally bins had     4 bins with zeros and     0 bins with relative errors exceeding 0.10

       24   missed  3 of 10 tfc bin checks: the variance of the variance does not monotonically decrease over the last half of problem
         passed all bin error check:     7 tally bins had     4 bins with zeros and     0 bins with relative errors exceeding 0.10

       34   missed  3 of 10 tfc bin checks: the variance of the variance does not monotonically decrease over the last half of problem
         passed all bin error check:     7 tally bins had     4 bins with zeros and     0 bins with relative errors exceeding 0.10

       44   missed  2 of 10 tfc bin checks: the variance of the variance appears not to decrease as 1/nps for the last half of problem
         passed all bin error check:     7 tally bins had     4 bins with zeros and     0 bins with relative errors exceeding 0.10


 the 10 statistical checks are only for the tally fluctuation chart bin and do not apply to other tally bins.

 the tally bins with zeros may or may not be correct: compare the source, cutoffs, multipliers, et cetera with the tally bins.

 warning.       5 of the     5 tally fluctuation chart bins did not pass all 10 statistical checks.
1tally fluctuation charts                              

                            tally        4                          tally       14                          tally       24
          nps      mean     error   vov  slope    fom      mean     error   vov  slope    fom      mean     error   vov  slope    fom
    131072000   2.7573E-07 0.0008 0.0000  4.6     136   4.0364E-07 0.0008 0.0004  2.9     164   9.1863E-07 0.0005 0.0000  3.9     368
    262144000   2.7590E-07 0.0006 0.0068  3.4     125   4.0340E-07 0.0005 0.0001  2.9     166   9.1848E-07 0.0004 0.0000  3.5     367
    393216000   2.7601E-07 0.0005 0.0032  3.2     128   4.0356E-07 0.0004 0.0000  3.4     167   9.1859E-07 0.0003 0.0000  3.3     366
    524288000   2.7594E-07 0.0004 0.0018  3.0     130   4.0352E-07 0.0004 0.0001  2.9     165   9.1873E-07 0.0003 0.0000  3.2     366
    655360000   2.7600E-07 0.0004 0.0016  2.5     127   4.0358E-07 0.0003 0.0000  2.9     166   9.1872E-07 0.0002 0.0000  2.9     365
    786432000   2.7596E-07 0.0004 0.0012  2.4     128   4.0363E-07 0.0003 0.0000  3.1     166   9.1864E-07 0.0002 0.0000  3.1     366
    917504000   2.7601E-07 0.0003 0.0009  2.5     129   4.0364E-07 0.0003 0.0000  3.1     166   9.1874E-07 0.0002 0.0000  3.4     366
   1048576000   2.7600E-07 0.0003 0.0007  2.5     130   4.0363E-07 0.0003 0.0000  3.2     166   9.1873E-07 0.0002 0.0000  3.4     366
   1179648000   2.7601E-07 0.0003 0.0005  2.5     130   4.0358E-07 0.0003 0.0000  3.6     166   9.1872E-07 0.0002 0.0000  3.2     366
   1310720000   2.7603E-07 0.0003 0.0004  2.4     130   4.0357E-07 0.0002 0.0000  3.1     165   9.1879E-07 0.0002 0.0000  2.9     366
   1441792000   2.7600E-07 0.0003 0.0004  2.4     131   4.0356E-07 0.0002 0.0000  3.0     165   9.1880E-07 0.0002 0.0000  3.0     366
   1572864000   2.7603E-07 0.0003 0.0003  2.4     131   4.0354E-07 0.0002 0.0000  3.0     165   9.1885E-07 0.0001 0.0000  2.9     366
   1703936000   2.7604E-07 0.0002 0.0004  2.2     129   4.0358E-07 0.0002 0.0669  2.6     123   9.1889E-07 0.0001 0.0000  3.0     366
   1835008000   2.7607E-07 0.0002 0.0004  2.2     130   4.0359E-07 0.0002 0.0595  2.6     125   9.1886E-07 0.0001 0.0000  3.0     366
   1966080000   2.7605E-07 0.0002 0.0003  2.3     130   4.0359E-07 0.0002 0.0537  2.5     127   9.1885E-07 0.0001 0.0000  2.6     365
   2097152000   2.7609E-07 0.0002 0.0003  2.3     131   4.0359E-07 0.0002 0.0487  2.7     129   9.1888E-07 0.0001 0.0000  2.5     365
   2228224000   2.7608E-07 0.0002 0.0003  2.3     131   4.0359E-07 0.0002 0.0442  2.7     131   9.1886E-07 0.0001 0.0000  2.6     365
   2359296000   2.7609E-07 0.0002 0.0002  2.3     131   4.0361E-07 0.0002 0.0403  2.8     132   9.1891E-07 0.0001 0.0000  2.6     365
   2490368000   2.7610E-07 0.0002 0.0002  2.4     131   4.0359E-07 0.0002 0.0370  2.9     134   9.1892E-07 0.0001 0.0000  2.5     365
   2570457714   2.7609E-07 0.0002 0.0002  2.4     131   4.0360E-07 0.0002 0.0348  2.8     134   9.1890E-07 0.0001 0.0000  2.4     365
 

                            tally       34                          tally       44
          nps      mean     error   vov  slope    fom      mean     error   vov  slope    fom
    131072000   4.0348E-07 0.0008 0.0001  3.6     165   4.9707E-07 0.0007 0.0000  4.0     194
    262144000   4.0333E-07 0.0005 0.0000  4.5     166   4.9717E-07 0.0005 0.0000  3.6     194
    393216000   4.0361E-07 0.0004 0.0007  3.7     162   4.9704E-07 0.0004 0.0000  3.8     194
    524288000   4.0368E-07 0.0004 0.0004  3.1     162   4.9713E-07 0.0004 0.0000  4.0     194
    655360000   4.0369E-07 0.0003 0.0003  3.0     162   4.9714E-07 0.0003 0.0011  3.2     188
    786432000   4.0361E-07 0.0003 0.0002  2.9     163   4.9709E-07 0.0003 0.0008  3.1     188
    917504000   4.0374E-07 0.0003 0.0001  2.9     163   4.9707E-07 0.0003 0.0009  2.5     185
   1048576000   4.0374E-07 0.0003 0.0001  3.1     163   4.9706E-07 0.0003 0.0007  2.7     186
   1179648000   4.0370E-07 0.0003 0.0001  3.5     163   4.9709E-07 0.0002 0.0006  2.6     186
   1310720000   4.0375E-07 0.0002 0.0001  3.4     163   4.9709E-07 0.0002 0.0005  2.7     187
   1441792000   4.0368E-07 0.0002 0.0001  3.1     163   4.9703E-07 0.0002 0.0004  2.9     188
   1572864000   4.0366E-07 0.0002 0.0001  3.1     163   4.9706E-07 0.0002 0.0003  2.9     188
   1703936000   4.0364E-07 0.0002 0.0001  3.1     163   4.9704E-07 0.0002 0.0003  2.8     189
   1835008000   4.0365E-07 0.0002 0.0000  3.1     163   4.9706E-07 0.0002 0.0002  2.8     189
   1966080000   4.0367E-07 0.0002 0.0000  3.2     163   4.9706E-07 0.0002 0.0002  2.8     189
   2097152000   4.0366E-07 0.0002 0.0000  3.2     163   4.9706E-07 0.0002 0.0002  2.7     189
   2228224000   4.0371E-07 0.0002 0.0021  2.9     156   4.9706E-07 0.0002 0.0002  2.7     190
   2359296000   4.0371E-07 0.0002 0.0019  2.9     156   4.9708E-07 0.0002 0.0002  2.7     190
   2490368000   4.0370E-07 0.0002 0.0017  2.8     157   4.9708E-07 0.0002 0.0001  2.7     190
   2570457714   4.0370E-07 0.0002 0.0016  2.9     157   4.9705E-07 0.0002 0.0001  2.8     190

 ***********************************************************************************************************************

 dump no.  168 on file inpr     nps =  2570457714     coll =   178714871318     ctm =   200000.40   nrn =    
 1508449275709

        16 warning messages so far.


 run terminated when it had used*****  minutes of computer time.

 computer time =******** minutes

 mcnp     version 6     06/19/14                     08/07/17 02:37:15                     probid =  08/06/17 18:17:20 
