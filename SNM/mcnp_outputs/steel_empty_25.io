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
  
1mcnp     version 6     ld=06/19/14                     08/06/17 17:14:48 
 *************************************************************************                 probid =  08/06/17 17:14:48 
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
       107-        TR1   -25 -25 -25                               $ Translation for HEU sphere   
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

 dump no.    2 on file inpr     nps =    15713160     coll =     1091087537     ctm =     1200.37   nrn =       
 9209336200

 ***********************************************************************************************************************

 dump no.    3 on file inpr     nps =    31421306     coll =     2184178330     ctm =     2400.62   nrn =      
 18434186679

 ***********************************************************************************************************************

 dump no.    4 on file inpr     nps =    47172126     coll =     3277748432     ctm =     3600.93   nrn =      
 27663443380

 ***********************************************************************************************************************

 dump no.    5 on file inpr     nps =    62897112     coll =     4371739666     ctm =     4801.22   nrn =      
 36895383216

 ***********************************************************************************************************************

 dump no.    6 on file inpr     nps =    78628420     coll =     5465254426     ctm =     6001.65   nrn =      
 46124304487

 ***********************************************************************************************************************

 dump no.    7 on file inpr     nps =    94357550     coll =     6558738012     ctm =     7202.05   nrn =      
 55352909827

 ***********************************************************************************************************************

 dump no.    8 on file inpr     nps =   110072944     coll =     7652617279     ctm =     8402.38   nrn =      
 64584921610

 ***********************************************************************************************************************

 dump no.    9 on file inpr     nps =   125825616     coll =     8746277238     ctm =     9602.66   nrn =      
 73815692383

 ***********************************************************************************************************************

 dump no.   10 on file inpr     nps =   141571530     coll =     9840261212     ctm =    10803.05   nrn =      
 83048037736

 ***********************************************************************************************************************

 dump no.   11 on file inpr     nps =   157306326     coll =    10934201456     ctm =    12003.48   nrn =      
 92280713716

 ***********************************************************************************************************************

 dump no.   12 on file inpr     nps =   173042216     coll =    12027997697     ctm =    13203.83   nrn =     
 101512104845

 ***********************************************************************************************************************

 dump no.   13 on file inpr     nps =   188760008     coll =    13122200327     ctm =    14404.12   nrn =     
 110745699330

 ***********************************************************************************************************************

 dump no.   14 on file inpr     nps =   204479544     coll =    14216438799     ctm =    15604.38   nrn =     
 119979844285

 ***********************************************************************************************************************

 dump no.   15 on file inpr     nps =   220225458     coll =    15310156895     ctm =    16804.65   nrn =     
 129210581327

 ***********************************************************************************************************************

 dump no.   16 on file inpr     nps =   235965268     coll =    16403982881     ctm =    18004.98   nrn =     
 138442943206

 ***********************************************************************************************************************

 dump no.   17 on file inpr     nps =   251718158     coll =    17497245907     ctm =    19205.27   nrn =     
 147670399905

 ***********************************************************************************************************************

 dump no.   18 on file inpr     nps =   267438784     coll =    18591184458     ctm =    20405.57   nrn =     
 156902495119

 ***********************************************************************************************************************

 dump no.   19 on file inpr     nps =   283174452     coll =    19685189153     ctm =    21605.88   nrn =     
 166136229033

 ***********************************************************************************************************************

 dump no.   20 on file inpr     nps =   298884614     coll =    20778499983     ctm =    22806.20   nrn =     
 175363845891

 ***********************************************************************************************************************

 dump no.   21 on file inpr     nps =   314602188     coll =    21871629590     ctm =    24006.59   nrn =     
 184589811046

 ***********************************************************************************************************************

 dump no.   22 on file inpr     nps =   330332842     coll =    22965452643     ctm =    25206.89   nrn =     
 193821952628

 ***********************************************************************************************************************

 dump no.   23 on file inpr     nps =   346059144     coll =    24059170812     ctm =    26407.22   nrn =     
 203053085134

 ***********************************************************************************************************************

 dump no.   24 on file inpr     nps =   361790662     coll =    25152997006     ctm =    27607.57   nrn =     
 212284471030

 ***********************************************************************************************************************

 dump no.   25 on file inpr     nps =   377551844     coll =    26246215246     ctm =    28807.93   nrn =     
 221511850436

 ***********************************************************************************************************************

 dump no.   26 on file inpr     nps =   393257202     coll =    27340585968     ctm =    30008.19   nrn =     
 230747259798

 ***********************************************************************************************************************

 dump no.   27 on file inpr     nps =   408987646     coll =    28434708273     ctm =    31208.58   nrn =     
 239980557773

 ***********************************************************************************************************************

 dump no.   28 on file inpr     nps =   424726592     coll =    29528345470     ctm =    32408.86   nrn =     
 249211257245

 ***********************************************************************************************************************

 dump no.   29 on file inpr     nps =   440459636     coll =    30621953333     ctm =    33609.19   nrn =     
 258441546646

 ***********************************************************************************************************************

 dump no.   30 on file inpr     nps =   456144300     coll =    31716815567     ctm =    34809.52   nrn =     
 267679970014

 ***********************************************************************************************************************

 dump no.   31 on file inpr     nps =   471891514     coll =    32810354760     ctm =    36009.90   nrn =     
 276910147628

 ***********************************************************************************************************************

 dump no.   32 on file inpr     nps =   487625446     coll =    33904087101     ctm =    37210.19   nrn =     
 286140773391

 ***********************************************************************************************************************

 dump no.   33 on file inpr     nps =   503370916     coll =    34997677330     ctm =    38410.50   nrn =     
 295370283601

 ***********************************************************************************************************************

 dump no.   34 on file inpr     nps =   519111824     coll =    36090648882     ctm =    39610.77   nrn =     
 304595862581

 ***********************************************************************************************************************

 dump no.   35 on file inpr     nps =   534813258     coll =    37183947149     ctm =    40811.03   nrn =     
 313822220258

 ***********************************************************************************************************************

 dump no.   36 on file inpr     nps =   550569644     coll =    38276783394     ctm =    42011.38   nrn =     
 323046784627

 ***********************************************************************************************************************

 dump no.   37 on file inpr     nps =   566284594     coll =    39370157288     ctm =    43211.66   nrn =     
 332274396503

 ***********************************************************************************************************************

 dump no.   38 on file inpr     nps =   582023104     coll =    40463829995     ctm =    44412.18   nrn =     
 341505264150

 ***********************************************************************************************************************

 dump no.   39 on file inpr     nps =   597747864     coll =    41557487469     ctm =    45612.59   nrn =     
 350735211468

 ***********************************************************************************************************************

 dump no.   40 on file inpr     nps =   613466536     coll =    42651278828     ctm =    46812.90   nrn =     
 359966174569

 ***********************************************************************************************************************

 dump no.   41 on file inpr     nps =   629201978     coll =    43744431911     ctm =    48013.22   nrn =     
 369193092176

 ***********************************************************************************************************************

 dump no.   42 on file inpr     nps =   644914110     coll =    44838306190     ctm =    49213.56   nrn =     
 378423942055

 ***********************************************************************************************************************

 dump no.   43 on file inpr     nps =   660621212     coll =    45932612741     ctm =    50414.02   nrn =     
 387658780897

 ***********************************************************************************************************************

 dump no.   44 on file inpr     nps =   676349476     coll =    47026036402     ctm =    51614.42   nrn =     
 396886672923

 ***********************************************************************************************************************

 dump no.   45 on file inpr     nps =   692077304     coll =    48119591149     ctm =    52814.85   nrn =     
 406116061723

 ***********************************************************************************************************************

 dump no.   46 on file inpr     nps =   707800118     coll =    49213155200     ctm =    54015.23   nrn =     
 415344914860

 ***********************************************************************************************************************

 dump no.   47 on file inpr     nps =   723546880     coll =    50306492645     ctm =    55215.57   nrn =     
 424573002842

 ***********************************************************************************************************************

 dump no.   48 on file inpr     nps =   739294764     coll =    51399565429     ctm =    56415.94   nrn =     
 433799277119

 ***********************************************************************************************************************

 dump no.   49 on file inpr     nps =   755031748     coll =    52492763211     ctm =    57616.31   nrn =     
 443026087280

 ***********************************************************************************************************************

 dump no.   50 on file inpr     nps =   770783338     coll =    53586334247     ctm =    58816.67   nrn =     
 452255654862

 ***********************************************************************************************************************

 dump no.   51 on file inpr     nps =   786513968     coll =    54680381720     ctm =    60017.03   nrn =     
 461489400852

 ***********************************************************************************************************************

 dump no.   52 on file inpr     nps =   802244630     coll =    55774449613     ctm =    61217.41   nrn =     
 470723509417

 ***********************************************************************************************************************

 dump no.   53 on file inpr     nps =   817980088     coll =    56867998206     ctm =    62417.71   nrn =     
 479953603656

 ***********************************************************************************************************************

 dump no.   54 on file inpr     nps =   833697670     coll =    57961738028     ctm =    63618.06   nrn =     
 489184792967

 ***********************************************************************************************************************

 dump no.   55 on file inpr     nps =   849413290     coll =    59055791302     ctm =    64818.42   nrn =     
 498418142767

 ***********************************************************************************************************************

 dump no.   56 on file inpr     nps =   865133238     coll =    60149819947     ctm =    66018.76   nrn =     
 507650360929

 ***********************************************************************************************************************

 dump no.   57 on file inpr     nps =   880892894     coll =    61243038876     ctm =    67219.07   nrn =     
 516878500753

 ***********************************************************************************************************************

 dump no.   58 on file inpr     nps =   896622684     coll =    62337185304     ctm =    68419.44   nrn =     
 526112527805

 ***********************************************************************************************************************

 dump no.   59 on file inpr     nps =   912336778     coll =    63430809155     ctm =    69619.78   nrn =     
 535342199527

 ***********************************************************************************************************************

 dump no.   60 on file inpr     nps =   928110136     coll =    64524088743     ctm =    70820.18   nrn =     
 544570618748

 ***********************************************************************************************************************

 dump no.   61 on file inpr     nps =   943813984     coll =    65618081601     ctm =    72020.48   nrn =     
 553803560681

 ***********************************************************************************************************************

 dump no.   62 on file inpr     nps =   959540722     coll =    66711870788     ctm =    73220.80   nrn =     
 563034254483

 ***********************************************************************************************************************

 dump no.   63 on file inpr     nps =   975258740     coll =    67805193642     ctm =    74421.17   nrn =     
 572261620585

 ***********************************************************************************************************************

 dump no.   64 on file inpr     nps =   990976944     coll =    68899155512     ctm =    75621.55   nrn =     
 581493319059

 ***********************************************************************************************************************

 dump no.   65 on file inpr     nps =  1006726790     coll =    69992768975     ctm =    76821.89   nrn =     
 590723685635

 ***********************************************************************************************************************

 dump no.   66 on file inpr     nps =  1022469660     coll =    71086524431     ctm =    78022.18   nrn =     
 599954542155

 ***********************************************************************************************************************

 dump no.   67 on file inpr     nps =  1038175034     coll =    72180771581     ctm =    79222.49   nrn =     
 609188912803

 ***********************************************************************************************************************

 dump no.   68 on file inpr     nps =  1053940762     coll =    73274223833     ctm =    80422.82   nrn =     
 618418576098

 ***********************************************************************************************************************

 dump no.   69 on file inpr     nps =  1069682106     coll =    74367785021     ctm =    81623.10   nrn =     
 627647634349

 ***********************************************************************************************************************

 dump no.   70 on file inpr     nps =  1085427374     coll =    75461264605     ctm =    82823.49   nrn =     
 636877109015

 ***********************************************************************************************************************

 dump no.   71 on file inpr     nps =  1101139288     coll =    76555296876     ctm =    84023.80   nrn =     
 646109692236

 ***********************************************************************************************************************

 dump no.   72 on file inpr     nps =  1116839180     coll =    77649232638     ctm =    85224.19   nrn =     
 655341531933

 ***********************************************************************************************************************

 dump no.   73 on file inpr     nps =  1132595566     coll =    78742302985     ctm =    86424.47   nrn =     
 664568112672

 ***********************************************************************************************************************

 dump no.   74 on file inpr     nps =  1148319906     coll =    79836264054     ctm =    87624.84   nrn =     
 673799855501

 ***********************************************************************************************************************

 dump no.   75 on file inpr     nps =  1164066264     coll =    80929458784     ctm =    88825.16   nrn =     
 683026342812

 ***********************************************************************************************************************

 dump no.   76 on file inpr     nps =  1179796676     coll =    82022690423     ctm =    90025.48   nrn =     
 692253593975

 ***********************************************************************************************************************

 dump no.   77 on file inpr     nps =  1195489188     coll =    83116202946     ctm =    91225.81   nrn =     
 701481484757

 ***********************************************************************************************************************

 dump no.   78 on file inpr     nps =  1211220504     coll =    84209271704     ctm =    92426.23   nrn =     
 710707290341

 ***********************************************************************************************************************

 dump no.   79 on file inpr     nps =  1226916068     coll =    85303086528     ctm =    93626.53   nrn =     
 719938329005

 ***********************************************************************************************************************

 dump no.   80 on file inpr     nps =  1242680956     coll =    86395974182     ctm =    94826.85   nrn =     
 729163720963

 ***********************************************************************************************************************

 dump no.   81 on file inpr     nps =  1258410932     coll =    87489144825     ctm =    96027.15   nrn =     
 738390051025

 ***********************************************************************************************************************

 dump no.   82 on file inpr     nps =  1274140286     coll =    88582530472     ctm =    97227.42   nrn =     
 747618599742

 ***********************************************************************************************************************

 dump no.   83 on file inpr     nps =  1289875090     coll =    89676075326     ctm =    98427.75   nrn =     
 756847887929

 ***********************************************************************************************************************

 dump no.   84 on file inpr     nps =  1305601392     coll =    90769222883     ctm =    99628.04   nrn =     
 766074949014

 ***********************************************************************************************************************

 dump no.   85 on file inpr     nps =  1321329624     coll =    91863223206     ctm =   100828.36   nrn =     
 775307053964

 ***********************************************************************************************************************

 dump no.   86 on file inpr     nps =  1337076418     coll =    92956713307     ctm =   102028.62   nrn =     
 784537013108

 ***********************************************************************************************************************

 dump no.   87 on file inpr     nps =  1352799450     coll =    94050388142     ctm =   103229.01   nrn =     
 793767253941

 ***********************************************************************************************************************

 dump no.   88 on file inpr     nps =  1368527060     coll =    95144025909     ctm =   104429.33   nrn =     
 802996842787

 ***********************************************************************************************************************

 dump no.   89 on file inpr     nps =  1384276688     coll =    96237024635     ctm =   105629.66   nrn =     
 812222852472

 ***********************************************************************************************************************

 dump no.   90 on file inpr     nps =  1399986640     coll =    97330707618     ctm =   106829.91   nrn =     
 821452873710

 ***********************************************************************************************************************

 dump no.   91 on file inpr     nps =  1415727112     coll =    98422976773     ctm =   108030.25   nrn =     
 830672248693

 ***********************************************************************************************************************

 dump no.   92 on file inpr     nps =  1431455812     coll =    99516303189     ctm =   109230.52   nrn =     
 839899731853

 ***********************************************************************************************************************

 dump no.   93 on file inpr     nps =  1447217366     coll =   100609375512     ctm =   110430.87   nrn =     
 849125805935

 ***********************************************************************************************************************

 dump no.   94 on file inpr     nps =  1462994898     coll =   101702489396     ctm =   111631.18   nrn =     
 858352860876

 ***********************************************************************************************************************

 dump no.   95 on file inpr     nps =  1478702016     coll =   102796661482     ctm =   112831.54   nrn =     
 867587007565

 ***********************************************************************************************************************

 dump no.   96 on file inpr     nps =  1494429626     coll =   103890694020     ctm =   114031.90   nrn =     
 876820223470

 ***********************************************************************************************************************

 dump no.   97 on file inpr     nps =  1510141976     coll =   104984880992     ctm =   115232.28   nrn =     
 886053742893

 ***********************************************************************************************************************

 dump no.   98 on file inpr     nps =  1525878524     coll =   106078879636     ctm =   116432.66   nrn =     
 895286009880

 ***********************************************************************************************************************

 dump no.   99 on file inpr     nps =  1541609404     coll =   107172884532     ctm =   117633.02   nrn =     
 904518855228

 ***********************************************************************************************************************

 dump no.  100 on file inpr     nps =  1557354672     coll =   108266144109     ctm =   118833.45   nrn =     
 913746982236

 ***********************************************************************************************************************

 dump no.  101 on file inpr     nps =  1573086796     coll =   109359673211     ctm =   120033.76   nrn =     
 922976439961

 ***********************************************************************************************************************

 dump no.  102 on file inpr     nps =  1588815714     coll =   110453326820     ctm =   121234.15   nrn =     
 932206662369

 ***********************************************************************************************************************

 dump no.  103 on file inpr     nps =  1604550300     coll =   111546886120     ctm =   122434.61   nrn =     
 941436505679

 ***********************************************************************************************************************

 dump no.  104 on file inpr     nps =  1620286194     coll =   112640529534     ctm =   123634.97   nrn =     
 950666981372

 ***********************************************************************************************************************

 dump no.  105 on file inpr     nps =  1636017074     coll =   113733589993     ctm =   124835.33   nrn =     
 959892555909

 ***********************************************************************************************************************

 dump no.  106 on file inpr     nps =  1651710022     coll =   114827277013     ctm =   126035.71   nrn =     
 969121956523

 ***********************************************************************************************************************

 dump no.  107 on file inpr     nps =  1667441774     coll =   115920292226     ctm =   127236.04   nrn =     
 978346947775

 ***********************************************************************************************************************

 dump no.  108 on file inpr     nps =  1683168948     coll =   117013844123     ctm =   128436.35   nrn =     
 987576519092

 ***********************************************************************************************************************

 dump no.  109 on file inpr     nps =  1698902008     coll =   118107471744     ctm =   129636.78   nrn =     
 996806368516

 ***********************************************************************************************************************

 dump no.  110 on file inpr     nps =  1714635004     coll =   119200834622     ctm =   130837.20   nrn =    
 1006034256731

 ***********************************************************************************************************************

 dump no.  111 on file inpr     nps =  1730348880     coll =   120294649211     ctm =   132037.55   nrn =    
 1015265462588

 ***********************************************************************************************************************

 dump no.  112 on file inpr     nps =  1746059268     coll =   121388455151     ctm =   133237.79   nrn =    
 1024496631019

 ***********************************************************************************************************************

 dump no.  113 on file inpr     nps =  1761757012     coll =   122482355932     ctm =   134438.07   nrn =    
 1033727663533

 ***********************************************************************************************************************

 dump no.  114 on file inpr     nps =  1777473068     coll =   123576414115     ctm =   135638.52   nrn =    
 1042960669166

 ***********************************************************************************************************************

 dump no.  115 on file inpr     nps =  1793212668     coll =   124669946642     ctm =   136838.85   nrn =    
 1052190196815

 ***********************************************************************************************************************

 dump no.  116 on file inpr     nps =  1808940714     coll =   125763786150     ctm =   138039.15   nrn =    
 1061422055453

 ***********************************************************************************************************************

 dump no.  117 on file inpr     nps =  1824660912     coll =   126857478910     ctm =   139239.54   nrn =    
 1070653415152

 ***********************************************************************************************************************

 dump no.  118 on file inpr     nps =  1840392600     coll =   127951251634     ctm =   140439.89   nrn =    
 1079884446026

 ***********************************************************************************************************************

 dump no.  119 on file inpr     nps =  1856137650     coll =   129044393126     ctm =   141640.17   nrn =    
 1089111105276

 ***********************************************************************************************************************

 dump no.  120 on file inpr     nps =  1871868312     coll =   130137438049     ctm =   142840.55   nrn =    
 1098336414237

 ***********************************************************************************************************************

 dump no.  121 on file inpr     nps =  1887587638     coll =   131231488977     ctm =   144040.98   nrn =    
 1107569374140

 ***********************************************************************************************************************

 dump no.  122 on file inpr     nps =  1903311760     coll =   132324707063     ctm =   145241.27   nrn =    
 1116796289095

 ***********************************************************************************************************************

 dump no.  123 on file inpr     nps =  1919026944     coll =   133418847905     ctm =   146441.56   nrn =    
 1126029932863

 ***********************************************************************************************************************

 dump no.  124 on file inpr     nps =  1934754554     coll =   134512088198     ctm =   147641.91   nrn =    
 1135257107070

 ***********************************************************************************************************************

 dump no.  125 on file inpr     nps =  1950493718     coll =   135605716733     ctm =   148842.17   nrn =    
 1144487294376

 ***********************************************************************************************************************

 dump no.  126 on file inpr     nps =  1966223444     coll =   136699549303     ctm =   150042.53   nrn =    
 1153718822217

 ***********************************************************************************************************************

 dump no.  127 on file inpr     nps =  1981938846     coll =   137793501938     ctm =   151243.01   nrn =    
 1162951489026

 ***********************************************************************************************************************

 dump no.  128 on file inpr     nps =  1997663840     coll =   138886834807     ctm =   152443.26   nrn =    
 1172179605737

 ***********************************************************************************************************************

 dump no.  129 on file inpr     nps =  2013394938     coll =   139980438778     ctm =   153643.58   nrn =    
 1181409292940

 ***********************************************************************************************************************

 dump no.  130 on file inpr     nps =  2029109904     coll =   141074101485     ctm =   154843.86   nrn =    
 1190638917165

 ***********************************************************************************************************************

 dump no.  131 on file inpr     nps =  2044809610     coll =   142168011155     ctm =   156044.19   nrn =    
 1199869787839

 ***********************************************************************************************************************

 dump no.  132 on file inpr     nps =  2060548556     coll =   143261422212     ctm =   157244.46   nrn =    
 1209099007952

 ***********************************************************************************************************************

 dump no.  133 on file inpr     nps =  2076276602     coll =   144354262601     ctm =   158444.70   nrn =    
 1218323192192

 ***********************************************************************************************************************

 dump no.  134 on file inpr     nps =  2092000288     coll =   145447639297     ctm =   159645.08   nrn =    
 1227550232692

 ***********************************************************************************************************************

 dump no.  135 on file inpr     nps =  2107720640     coll =   146541011149     ctm =   160845.44   nrn =    
 1236778535379

 ***********************************************************************************************************************

 dump no.  136 on file inpr     nps =  2123431464     coll =   147634968695     ctm =   162045.72   nrn =    
 1246010245819

 ***********************************************************************************************************************

 dump no.  137 on file inpr     nps =  2139147956     coll =   148728652113     ctm =   163246.10   nrn =    
 1255240179974

 ***********************************************************************************************************************

 dump no.  138 on file inpr     nps =  2154879054     coll =   149822446003     ctm =   164446.42   nrn =    
 1264471480814

 ***********************************************************************************************************************

 dump no.  139 on file inpr     nps =  2170595764     coll =   150916237140     ctm =   165646.73   nrn =    
 1273702564658

 ***********************************************************************************************************************

 dump no.  140 on file inpr     nps =  2186330786     coll =   152009533654     ctm =   166847.05   nrn =    
 1282929902696

 ***********************************************************************************************************************

 dump no.  141 on file inpr     nps =  2202061230     coll =   153102949048     ctm =   168047.32   nrn =    
 1292159068052

 ***********************************************************************************************************************

 dump no.  142 on file inpr     nps =  2217776632     coll =   154196279925     ctm =   169247.58   nrn =    
 1301386830919

 ***********************************************************************************************************************

 dump no.  143 on file inpr     nps =  2233518130     coll =   155289833756     ctm =   170447.89   nrn =    
 1310616694924

 ***********************************************************************************************************************

 dump no.  144 on file inpr     nps =  2249210642     coll =   156383938020     ctm =   171648.24   nrn =    
 1319849270328

 ***********************************************************************************************************************

 dump no.  145 on file inpr     nps =  2264946972     coll =   157477286860     ctm =   172848.60   nrn =    
 1329077528925

 ***********************************************************************************************************************

 dump no.  146 on file inpr     nps =  2280646460     coll =   158570812730     ctm =   174048.88   nrn =    
 1338305621297

 ***********************************************************************************************************************

 dump no.  147 on file inpr     nps =  2296398922     coll =   159664084058     ctm =   175249.18   nrn =    
 1347533194694

 ***********************************************************************************************************************

 dump no.  148 on file inpr     nps =  2312121300     coll =   160757469612     ctm =   176449.52   nrn =    
 1356761183560

 ***********************************************************************************************************************

 dump no.  149 on file inpr     nps =  2327814902     coll =   161851666264     ctm =   177649.91   nrn =    
 1365994351056

 ***********************************************************************************************************************

 dump no.  150 on file inpr     nps =  2343561478     coll =   162945370535     ctm =   178850.37   nrn =    
 1375225450182

 ***********************************************************************************************************************

 dump no.  151 on file inpr     nps =  2359274046     coll =   164039540825     ctm =   180050.69   nrn =    
 1384458793649

 ***********************************************************************************************************************

 dump no.  152 on file inpr     nps =  2375008786     coll =   165133359300     ctm =   181250.95   nrn =    
 1393689726880

 ***********************************************************************************************************************

 dump no.  153 on file inpr     nps =  2390749694     coll =   166226455409     ctm =   182451.27   nrn =    
 1402916648392

 ***********************************************************************************************************************

 dump no.  154 on file inpr     nps =  2406493218     coll =   167320129913     ctm =   183651.59   nrn =    
 1412147440185

 ***********************************************************************************************************************

 dump no.  155 on file inpr     nps =  2422231728     coll =   168414034700     ctm =   184851.97   nrn =    
 1421379761035

 ***********************************************************************************************************************

 dump no.  156 on file inpr     nps =  2437923804     coll =   169508172231     ctm =   186052.43   nrn =    
 1430612793878

 ***********************************************************************************************************************

 dump no.  157 on file inpr     nps =  2453658826     coll =   170601797719     ctm =   187252.73   nrn =    
 1439843385003

 ***********************************************************************************************************************

 dump no.  158 on file inpr     nps =  2469386218     coll =   171695547247     ctm =   188453.06   nrn =    
 1449074413571

 ***********************************************************************************************************************

 dump no.  159 on file inpr     nps =  2485121676     coll =   172789284732     ctm =   189653.40   nrn =    
 1458305823653

 ***********************************************************************************************************************

 dump no.  160 on file inpr     nps =  2500866226     coll =   173883046662     ctm =   190853.75   nrn =    
 1467537384797

 ***********************************************************************************************************************

 dump no.  161 on file inpr     nps =  2516604082     coll =   174976516431     ctm =   192054.17   nrn =    
 1476766767109

 ***********************************************************************************************************************

 dump no.  162 on file inpr     nps =  2532346298     coll =   176069407841     ctm =   193254.45   nrn =    
 1485991580837

 ***********************************************************************************************************************

 dump no.  163 on file inpr     nps =  2548073472     coll =   177163261002     ctm =   194454.80   nrn =    
 1495222999804

 ***********************************************************************************************************************

 dump no.  164 on file inpr     nps =  2563812854     coll =   178256488981     ctm =   195655.08   nrn =    
 1504450532723

 ***********************************************************************************************************************

 dump no.  165 on file inpr     nps =  2579576216     coll =   179350197096     ctm =   196855.40   nrn =    
 1513681357050

 ***********************************************************************************************************************

 dump no.  166 on file inpr     nps =  2595306878     coll =   180443992231     ctm =   198055.76   nrn =    
 1522913064616

 ***********************************************************************************************************************

 dump no.  167 on file inpr     nps =  2611022934     coll =   181538189567     ctm =   199256.04   nrn =    
 1532146612013
1problem summary                                                                                                           

      run terminated when it had used*****  minutes of computer time.
+                                                                                                    08/07/17 01:34:45 
      c //-------------------------------------------------------------------------//      probid =  08/06/17 17:14:48 

 neutron creation    tracks      weight        energy            neutron loss        tracks      weight        energy
                                 (per source particle)                                           (per source particle)

 source          2620777126    1.0000E+00    1.4100E+01          escape          7420093613    1.0262E+00    9.1692E+00
 nucl. interaction        0    0.            0.                  energy cutoff            0    0.            0.        
 particle decay           0    0.            0.                  time cutoff              0    0.            0.        
 weight window  11328517195    2.9365E-01    1.9448E-01          weight window   7053336896    2.9364E-01    1.9445E-01
 cell importance          0    0.            0.                  cell importance          0    0.            0.        
 weight cutoff            0    0.            0.                  weight cutoff            0    0.            0.        
 e or t importance        0    0.            0.                  e or t importance        0    0.            0.        
 dxtran                   0    0.            0.                  dxtran                   0    0.            0.        
 forced collisions        0    0.            0.                  forced collisions        0    0.            0.        
 exp. transform           0    0.            0.                  exp. transform           0    0.            0.        
 upscattering             0    0.            1.1078E-10          downscattering           0    0.            2.7608E+00
 photonuclear             0    0.            0.                  capture                 58    8.2529E-02    9.0178E-01
 (n,xn)          1048272492    2.1735E-01    2.5670E-01          loss to (n,xn)   524136246    1.0868E-01    1.5250E+00
 prompt fission           0    0.            0.                  loss to fission          0    0.            0.        
 delayed fission          0    0.            0.                  nucl. interaction        0    0.            0.        
 prompt photofis          0    0.            0.                  particle decay           0    0.            0.        
 tabular boundary         0    0.            0.                  tabular boundary         0    0.            0.        
 tabular sampling         0    0.            0.                  elastic scatter          0    0.            0.        
     total      14997566813    1.5110E+00    1.4551E+01              total      14997566813    1.5110E+00    1.4551E+01

   number of neutrons banked             -1347592370        average time of (shakes)              cutoffs
   neutron tracks per source particle     5.7226E+00          escape            5.0000E+06          tco   2.0000E+07
   neutron collisions per source particle 6.9528E+01          capture           4.9994E+06          eco   0.0000E+00
   total neutron collisions              -2147483648          capture or escape 5.0000E+06          wc1  -5.0000E-01
   net multiplication              1.1087E+00 0.0000          any termination   4.5963E+06          wc2  -2.5000E-01

 computer time so far in this run200003.48 minutes            maximum number ever in bank        32
 computer time in mcrun          200000.32 minutes            bank overflows to backup file       0
 source particles per minute            1.3104E+04
 random numbers generated            1537869577563            most random numbers used was     1058626 in history   650669529
 
  warning.   random number stride   152917 exceeded    33153 times.
 
  warning.  random number period exceeded.  decrease stride.

 range of sampled source weights = 9.9017E-01 to 1.0100E+00

 number of histories processed by each thread
   124032240   131480395   131541505   131508413   131529227   131494444   131536682   131594194   130982480   131348349
   129955231   131622287   131052992   131533005   131222289   130651201   131752219   131974343   131826643   132138987
 
  warning.  some of the geometry is covered by a weight window mesh.
1neutron  activity in each cell                                                                         print table 126

                       tracks     population   collisions   collisions     number        flux        average      average
              cell    entering                               * weight     weighted     weighted   track weight   track mfp
                                                          (per history)    energy       energy     (relative)      (cm)

        1        1  8746924993   7844854961     40494986    4.5379E-03   3.2093E+00   9.9071E+00   4.5228E-01   1.1406E+04
        2        2  8735863853   7624671726  16026501070    1.3260E+00   1.1129E+00   6.3567E+00   2.7647E-01   4.2413E+00
        3        3  3614931706  11279107344 166066660409    4.8763E+00   1.4368E-01   2.0933E+00   8.2746E-02   7.9468E+00
        4        4    83044151     79437377     79162601    6.8022E-03   1.4052E-01   1.3054E+00   1.8302E-01   8.0311E+00
        5       10   152691545    196224391       422203    2.4032E-07   3.9344E-02   2.6237E-01   1.5287E-03   5.3245E+03
        6       11   224344191    266513080       546563    3.3643E-07   5.0918E-02   3.3532E-01   1.6524E-03   5.5965E+03
        7       12   527164454    628690350      1323584    7.9598E-07   3.9780E-02   2.8742E-01   1.6071E-03   5.3967E+03
        8       13   220170070    262506660       536937    3.3640E-07   5.0890E-02   3.3533E-01   1.6805E-03   5.5961E+03
        9       14   266437565    296626402       600293    4.0917E-07   5.5669E-02   3.5459E-01   1.8285E-03   5.6806E+03

           total   22571572528  28478632291 182216248646    6.2136E+00

1tally        4        nps =  2620777126
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      10                                                                                   
                         4.00000E+03
 
 cell  10                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 2.76069E-07 0.0002   2.95923E-12 0.0500   0.00000E+00 0.0000   0.00000E+00 0.0000   0.00000E+00 0.0000
 
         time:       2.0000E+07             total                                                                  
                 0.00000E+00 0.0000   2.76072E-07 0.0002


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally        4

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00      yes          no            constant    random       2.61
 passed?        yes          yes      yes          yes             yes      yes          no               yes        yes          no

 ===================================================================================================================================


 warning.  the tally in the tally fluctuation chart bin did not pass  2 of the 10 statistical checks.

1analysis of the results in the tally fluctuation chart bin (tfc) for tally        4 with nps =  2620777126  print table 160


 normed average tally per history  = 2.76072E-07          unnormed average tally per history  = 1.10429E-03
 estimated tally relative error    = 0.0002               estimated variance of the variance  = 0.0005
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =    52670358          efficiency for the nonzero tallies  = 0.0201
 history number of largest  tally  =   293178286          largest  unnormalized history tally = 7.92264E+01
 (largest  tally)/(average tally)  = 7.17443E+04          (largest  tally)/(avg nonzero tally)= 1.44186E+03

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 2.76072E-07


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            2.76072E-07             2.76080E-07                     0.000027
      relative error                  1.94533E-04             1.96444E-04                     0.009825
      variance of the variance        5.09518E-04             8.66975E-04                     0.701560
      shifted center                  2.76072E-07             2.76072E-07                     0.000000
      figure of merit                 1.32125E+02             1.29566E+02                    -0.019364

 the estimated inverse power slope of the 200 largest  tallies starting at 2.49746E+00 is 2.6067
 the history score probability density function appears to have an unsampled region at the largest  history scores:
 please examine. see print table 161.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (1.310E+04)*( 1.004E-01)**2 = (1.310E+04)*(1.008E-02) = 1.321E+02

1unnormed tally density for tally        4          nonzero tally mean(m) = 5.495E-02   nps =  2620777126  print table 161

 abscissa              ordinate   log plot of tally probability density function in tally fluctuation chart bin(d=decade,slope= 2.6)
  tally  number num den log den:d-------d---------d--------d--------d--------d---------d--------d--------d--------d---------d-------
 2.00-09      2 1.04+00   0.016 ********|*********|********|********|********|*********|********|********|********|*********|*******
 3.16-09      0 0.00+00   0.000         |         |        |        |        |         |        |        |        |         |       
 5.01-09      2 4.13-01  -0.384 ********|*********|********|********|********|*********|********|********|********|*********|***    
 7.94-09      0 0.00+00   0.000         |         |        |        |        |         |        |        |        |         |       
 1.26-08      3 2.46-01  -0.608 ********|*********|********|********|********|*********|********|********|********|*********|*      
 2.00-08      3 1.55-01  -0.808 ********|*********|********|********|********|*********|********|********|********|*********|       
 3.16-08      6 1.96-01  -0.707 ********|*********|********|********|********|*********|********|********|********|*********|       
 5.01-08      7 1.44-01  -0.840 ********|*********|********|********|********|*********|********|********|********|*********|       
 7.94-08     17 2.21-01  -0.655 ********|*********|********|********|********|*********|********|********|********|*********|*      
 1.26-07     20 1.64-01  -0.784 ********|*********|********|********|********|*********|********|********|********|*********|       
 2.00-07     44 2.28-01  -0.642 ********|*********|********|********|********|*********|********|********|********|*********|*      
 3.16-07     67 2.19-01  -0.659 ********|*********|********|********|********|*********|********|********|********|*********|*      
 5.01-07    119 2.45-01  -0.610 ********|*********|********|********|********|*********|********|********|********|*********|*      
 7.94-07    150 1.95-01  -0.709 ********|*********|********|********|********|*********|********|********|********|*********|       
 1.26-06    229 1.88-01  -0.726 ********|*********|********|********|********|*********|********|********|********|*********|       
 2.00-06    440 2.28-01  -0.642 ********|*********|********|********|********|*********|********|********|********|*********|*      
 3.16-06    624 2.04-01  -0.690 ********|*********|********|********|********|*********|********|********|********|*********|       
 5.01-06   1002 2.07-01  -0.685 ********|*********|********|********|********|*********|********|********|********|*********|*      
 7.94-06   1586 2.06-01  -0.685 ********|*********|********|********|********|*********|********|********|********|*********|*      
 1.26-05   2503 2.06-01  -0.687 ********|*********|********|********|********|*********|********|********|********|*********|       
 2.00-05   3836 1.99-01  -0.702 ********|*********|********|********|********|*********|********|********|********|*********|       
 3.16-05   6176 2.02-01  -0.695 ********|*********|********|********|********|*********|********|********|********|*********|       
 5.01-05   9876 2.04-01  -0.691 ********|*********|********|********|********|*********|********|********|********|*********|       
 7.94-05  15476 2.01-01  -0.696 ********|*********|********|********|********|*********|********|********|********|*********|       
 1.26-04  24651 2.02-01  -0.694 ********|*********|********|********|********|*********|********|********|********|*********|       
 2.00-04  39081 2.03-01  -0.694 ********|*********|********|********|********|*********|********|********|********|*********|       
 3.16-04  61325 2.01-01  -0.698 ********|*********|********|********|********|*********|********|********|********|*********|       
 5.01-04  96736 2.00-01  -0.700 ********|*********|********|********|********|*********|********|********|********|*********|       
 7.94-04 153762 2.00-01  -0.699 ********|*********|********|********|********|*********|********|********|********|*********|       
 1.26-03 243847 2.00-01  -0.698 ********|*********|********|********|********|*********|********|********|********|*********|       
 2.00-03 385176 2.00-01  -0.700 ********|*********|********|********|********|*********|********|********|********|*********|       
 3.16-03 608245 1.99-01  -0.701 ********|*********|********|********|********|*********|********|********|********|*********|       
 5.01-03 966694 1.99-01  -0.700 ********|*********|********|********|********|*********|********|********|********|*********|       
 7.94-03 1.5+06 2.01-01  -0.698 ********|*********|********|********|********|*********|********|********|********|*********|       
 1.26-02 2.8+06 2.27-01  -0.644 ********|*********|********|********|********|*********|********|********|********|*********|*      
 2.00-02 5.7+06 2.95-01  -0.530 ********|*********|********|********|********|*********|********|********|********|*********|**     
 3.16-02 8.2+06 2.69-01  -0.570 ********|*********|********|********|********|*********|********|********|********|*********|**     
 5.01-02 1.0+07 2.16-01  -0.665 ********|*********|********|********|********|*********|********|********|********|*********|*      
 7.94-02 1.0+07 1.30-01  -0.887 mmmmmmmm|mmmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmmm|       
 1.26-01 7.0+06 5.71-02  -1.243 ********|*********|********|********|********|*********|********|********|********|*****    |       
 2.00-01 3.3+06 1.72-02  -1.765 ********|*********|********|********|********|*********|********|********|********|*        |       
 3.16-01 918700 3.00-03  -2.522 ********|*********|********|********|********|*********|********|********|***     |         |       
 5.01-01 154295 3.18-04  -3.497 ********|*********|********|********|********|*********|********|**      |        |         |       
 7.94-01  21542 2.80-05  -4.552 ********|*********|********|********|********|*********|**      |        |        |         |       
 1.26+00   3812 3.13-06  -5.504 ********|*********|********|********|********|***      |        |        |        |         |       
 2.00+00    910 4.72-07  -6.326 ********|*********|********|********|****    |         |        |        |        |         |       
 3.16+00    264 8.63-08  -7.064 ********|*********|********|******  |      s |         |        |        |        |         |       
 5.01+00     80 1.65-08  -7.782 ********|*********|********|        |   s    |         |        |        |        |         |       
 7.94+00     20 2.60-09  -8.584 ********|*********|*       |        s        |         |        |        |        |         |       
 1.26+01     14 1.15-09  -8.939 ********|******** |        |     s  |        |         |        |        |        |         |       
 2.00+01      0 0.00+00   0.000         |         |        |s       |        |         |        |        |        |         |       
 3.16+01      4 1.31-10  -9.883 ********|         |     s  |        |        |         |        |        |        |         |       
 5.01+01      1 2.06-11 -10.686 *       |         |s       |        |        |         |        |        |        |         |       
 7.94+01      2 2.60-11 -10.584 **      |      s  |        |        |        |         |        |        |        |         |       
  total 5.27+07 2.01-02         d-------d---------d--------d--------d--------d---------d--------d--------d--------d---------d-------

1tally       14        nps =  2620777126
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      11                                                                                   
                         4.00000E+03
 
 cell  11                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 4.03625E-07 0.0002   4.30667E-12 0.0452   0.00000E+00 0.0000   0.00000E+00 0.0000   0.00000E+00 0.0000
 
         time:       2.0000E+07             total                                                                  
                 0.00000E+00 0.0000   4.03629E-07 0.0002


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       14

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00       no           no            0.03       no          no            constant    random       2.73
 passed?        yes          yes       no           no             yes       no          no               yes        yes          no

 ===================================================================================================================================


 warning.  the tally in the tally fluctuation chart bin did not pass  5 of the 10 statistical checks.

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       14 with nps =  2620777126  print table 160


 normed average tally per history  = 4.03629E-07          unnormed average tally per history  = 1.61452E-03
 estimated tally relative error    = 0.0002               estimated variance of the variance  = 0.0336
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =    67355206          efficiency for the nonzero tallies  = 0.0257
 history number of largest  tally  =  1621837713          largest  unnormalized history tally = 3.46654E+02
 (largest  tally)/(average tally)  = 2.14711E+05          (largest  tally)/(avg nonzero tally)= 5.51817E+03

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 4.03632E-07


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            4.03629E-07             4.03662E-07                     0.000082
      relative error                  1.91444E-04             2.08220E-04                     0.087629
      variance of the variance        3.36064E-02             4.79663E-02                     0.427297
      shifted center                  4.03632E-07             4.03634E-07                     0.000005
      figure of merit                 1.36423E+02             1.15325E+02                    -0.154646

 the estimated inverse power slope of the 198 largest  tallies starting at 3.88508E+00 is 2.7323
 the history score probability density function appears to have an unsampled region at the largest  history scores:
 please examine. see print table 161.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (1.310E+04)*( 1.020E-01)**2 = (1.310E+04)*(1.041E-02) = 1.364E+02

1unnormed tally density for tally       14          nonzero tally mean(m) = 6.282E-02   nps =  2620777126  print table 161

 abscissa              ordinate   log plot of tally probability density function in tally fluctuation chart bin(d=decade,slope= 2.7)
  tally  number num den log den:d------d-------d-------d------d-------d-------d-------d-------d-------d------d-------d-------d------
 3.98-11      1 1.92+01   1.284 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|*******|******
 7.94-11      0 0.00+00   0.000        |       |       |      |       |       |       |       |       |      |       |       |      
 1.58-10      0 0.00+00   0.000        |       |       |      |       |       |       |       |       |      |       |       |      
 3.16-10      0 0.00+00   0.000        |       |       |      |       |       |       |       |       |      |       |       |      
 6.31-10      0 0.00+00   0.000        |       |       |      |       |       |       |       |       |      |       |       |      
 1.26-09      1 6.08-01  -0.216 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|**     |      
 2.51-09      0 0.00+00   0.000        |       |       |      |       |       |       |       |       |      |       |       |      
 5.01-09      2 3.05-01  -0.515 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 1.00-08      2 1.53-01  -0.815 *******|*******|*******|******|*******|*******|*******|*******|*******|******|****** |       |      
 2.00-08      4 1.53-01  -0.814 *******|*******|*******|******|*******|*******|*******|*******|*******|******|****** |       |      
 3.98-08     15 2.88-01  -0.540 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 7.94-08     19 1.83-01  -0.738 *******|*******|*******|******|*******|*******|*******|*******|*******|******|****** |       |      
 1.58-07     28 1.35-01  -0.869 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*****  |       |      
 3.16-07     87 2.10-01  -0.677 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 6.31-07    189 2.29-01  -0.640 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 1.26-06    378 2.30-01  -0.639 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 2.51-06    735 2.24-01  -0.650 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 5.01-06   1467 2.24-01  -0.650 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 1.00-05   2855 2.18-01  -0.661 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 2.00-05   5734 2.20-01  -0.658 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 3.98-05  11463 2.20-01  -0.657 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 7.94-05  22957 2.21-01  -0.655 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 1.58-04  45784 2.21-01  -0.656 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 3.16-04  91232 2.21-01  -0.656 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 6.31-04 181772 2.20-01  -0.657 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 1.26-03 362162 2.20-01  -0.657 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 2.51-03 721434 2.20-01  -0.658 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 5.01-03 1.4+06 2.20-01  -0.657 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 1.00-02 3.0+06 2.27-01  -0.644 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 2.00-02 8.2+06 3.16-01  -0.501 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 3.98-02 1.6+07 3.05-01  -0.515 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 7.94-02 2.0+07 1.88-01  -0.725 mmmmmmm|mmmmmmm|mmmmmmm|mmmmmm|mmmmmmm|mmmmmmm|mmmmmmm|mmmmmmm|mmmmmmm|mmmmmm|mmmmmm |       |      
 1.58-01 1.3+07 6.45-02  -1.190 *******|*******|*******|******|*******|*******|*******|*******|*******|******|***    |       |      
 3.16-01 4.0+06 9.62-03  -2.017 *******|*******|*******|******|*******|*******|*******|*******|*******|***   |       |       |      
 6.31-01 426406 5.17-04  -3.287 *******|*******|*******|******|*******|*******|*******|*******|*      |      |       |       |      
 1.26+00  27633 1.68-05  -4.775 *******|*******|*******|******|*******|*******|*****  |       |       |      |       |       |      
 2.51+00   2904 8.84-07  -6.053 *******|*******|*******|******|*******|***    |       |       |       |      |       |       |      
 5.01+00    460 7.02-08  -7.154 *******|*******|*******|******|***    |    s  |       |       |       |      |       |       |      
 1.00+01     85 6.50-09  -8.187 *******|*******|*******|**    |       |s      |       |       |       |      |       |       |      
 2.00+01     26 9.97-10  -9.001 *******|*******|***    |      |   s   |       |       |       |       |      |       |       |      
 3.98+01      2 3.84-11 -10.415 *******|       |       |     s|       |       |       |       |       |      |       |       |      
 7.94+01      2 1.93-11 -10.715 ****** |       |       s      |       |       |       |       |       |      |       |       |      
 1.58+02      0 0.00+00   0.000        |       | s     |      |       |       |       |       |       |      |       |       |      
 3.16+02      0 0.00+00   0.000        |  s    |       |      |       |       |       |       |       |      |       |       |      
 3.98+02      1 4.66-12 -11.332 *     s|       |       |      |       |       |       |       |       |      |       |       |      
  total 6.74+07 2.57-02         d------d-------d-------d------d-------d-------d-------d-------d-------d------d-------d-------d------

1tally       24        nps =  2620777126
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      12                                                                                   
                         4.00000E+03
 
 cell  12                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 9.18924E-07 0.0001   1.10863E-11 0.0282   0.00000E+00 0.0000   0.00000E+00 0.0000   0.00000E+00 0.0000
 
         time:       2.0000E+07             total                                                                  
                 0.00000E+00 0.0000   9.18935E-07 0.0001


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       24

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.02      yes         yes            constant   increase      2.25
 passed?        yes          yes      yes          yes             yes      yes         yes               yes         no          no

 ===================================================================================================================================


 warning.  the tally in the tally fluctuation chart bin did not pass  2 of the 10 statistical checks.

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       24 with nps =  2620777126  print table 160


 normed average tally per history  = 9.18935E-07          unnormed average tally per history  = 3.67574E-03
 estimated tally relative error    = 0.0001               estimated variance of the variance  = 0.0214
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =   137519331          efficiency for the nonzero tallies  = 0.0525
 history number of largest  tally  =   542794513          largest  unnormalized history tally = 4.62221E+02
 (largest  tally)/(average tally)  = 1.25749E+05          (largest  tally)/(avg nonzero tally)= 6.59840E+03

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 9.18939E-07


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            9.18935E-07             9.18980E-07                     0.000048
      relative error                  1.25515E-04             1.34367E-04                     0.070526
      variance of the variance        2.13652E-02             3.25212E-02                     0.522154
      shifted center                  9.18939E-07             9.18941E-07                     0.000003
      figure of merit                 3.17381E+02             2.76941E+02                    -0.127419

 the estimated inverse power slope of the 200 largest  tallies starting at 3.62904E+00 is 2.2534
 the history score probability density function appears to have an unsampled region at the largest  history scores:
 please examine. see print table 161.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (1.310E+04)*( 1.556E-01)**2 = (1.310E+04)*(2.422E-02) = 3.174E+02

1unnormed tally density for tally       24          nonzero tally mean(m) = 7.005E-02   nps =  2620777126  print table 161

 abscissa              ordinate   log plot of tally probability density function in tally fluctuation chart bin(d=decade,slope= 2.3)
  tally  number num den log den:d------d--------d-------d-------d-------d--------d-------d-------d-------d--------d-------d-------d-
 1.00-09      2 1.53+00   0.185 *******|********|*******|*******|*******|********|*******|*******|*******|********|*******|*******|*
 2.00-09      0 0.00+00   0.000        |        |       |       |       |        |       |       |       |        |       |       | 
 3.98-09      0 0.00+00   0.000        |        |       |       |       |        |       |       |       |        |       |       | 
 7.94-09      1 9.63-02  -1.016 *******|********|*******|*******|*******|********|*******|*******|*******|********|*******|       | 
 1.58-08     10 4.83-01  -0.316 *******|********|*******|*******|*******|********|*******|*******|*******|********|*******|*****  | 
 3.16-08     19 4.60-01  -0.338 *******|********|*******|*******|*******|********|*******|*******|*******|********|*******|*****  | 
 6.31-08     29 3.52-01  -0.454 *******|********|*******|*******|*******|********|*******|*******|*******|********|*******|****   | 
 1.26-07     58 3.52-01  -0.453 *******|********|*******|*******|*******|********|*******|*******|*******|********|*******|****   | 
 2.51-07    119 3.62-01  -0.441 *******|********|*******|*******|*******|********|*******|*******|*******|********|*******|****   | 
 5.01-07    234 3.57-01  -0.447 *******|********|*******|*******|*******|********|*******|*******|*******|********|*******|****   | 
 1.00-06    432 3.30-01  -0.481 *******|********|*******|*******|*******|********|*******|*******|*******|********|*******|****   | 
 2.00-06    963 3.69-01  -0.433 *******|********|*******|*******|*******|********|*******|*******|*******|********|*******|****   | 
 3.98-06   1814 3.49-01  -0.458 *******|********|*******|*******|*******|********|*******|*******|*******|********|*******|****   | 
 7.94-06   3775 3.64-01  -0.439 *******|********|*******|*******|*******|********|*******|*******|*******|********|*******|****   | 
 1.58-05   7264 3.51-01  -0.455 *******|********|*******|*******|*******|********|*******|*******|*******|********|*******|****   | 
 3.16-05  14605 3.53-01  -0.452 *******|********|*******|*******|*******|********|*******|*******|*******|********|*******|****   | 
 6.31-05  29126 3.53-01  -0.452 *******|********|*******|*******|*******|********|*******|*******|*******|********|*******|****   | 
 1.26-04  57976 3.52-01  -0.453 *******|********|*******|*******|*******|********|*******|*******|*******|********|*******|****   | 
 2.51-04 116259 3.54-01  -0.451 *******|********|*******|*******|*******|********|*******|*******|*******|********|*******|****   | 
 5.01-04 230984 3.53-01  -0.453 *******|********|*******|*******|*******|********|*******|*******|*******|********|*******|****   | 
 1.00-03 461304 3.53-01  -0.452 *******|********|*******|*******|*******|********|*******|*******|*******|********|*******|****   | 
 2.00-03 923486 3.54-01  -0.451 *******|********|*******|*******|*******|********|*******|*******|*******|********|*******|****   | 
 3.98-03 1.9+06 3.57-01  -0.447 *******|********|*******|*******|*******|********|*******|*******|*******|********|*******|****   | 
 7.94-03 3.8+06 3.67-01  -0.435 *******|********|*******|*******|*******|********|*******|*******|*******|********|*******|****   | 
 1.58-02 9.8+06 4.75-01  -0.324 *******|********|*******|*******|*******|********|*******|*******|*******|********|*******|*****  | 
 3.16-02 2.5+07 5.97-01  -0.224 *******|********|*******|*******|*******|********|*******|*******|*******|********|*******|****** | 
 6.31-02 3.9+07 4.70-01  -0.328 *******|********|*******|*******|*******|********|*******|*******|*******|********|*******|*****  | 
 1.26-01 3.7+07 2.22-01  -0.653 mmmmmmm|mmmmmmmm|mmmmmmm|mmmmmmm|mmmmmmm|mmmmmmmm|mmmmmmm|mmmmmmm|mmmmmmm|mmmmmmmm|mmmmmmm|mm     | 
 2.51-01 1.7+07 5.24-02  -1.280 *******|********|*******|*******|*******|********|*******|*******|*******|********|*****  |       | 
 5.01-01 2.7+06 4.17-03  -2.380 *******|********|*******|*******|*******|********|*******|*******|*******|*****   |       |       | 
 1.00+00 152065 1.16-04  -3.934 *******|********|*******|*******|*******|********|*******|*******|       |        |       |       | 
 2.00+00   9741 3.73-06  -5.428 *******|********|*******|*******|*******|********|****   |       |       |        |       |       | 
 3.98+00   1057 2.03-07  -6.692 *******|********|*******|*******|*******|**      |  s    |       |       |        |       |       | 
 7.94+00    118 1.14-08  -7.944 *******|********|*******|*******|       |       s|       |       |       |        |       |       | 
 1.58+01     18 8.69-10  -9.061 *******|********|*******|       |       |  s     |       |       |       |        |       |       | 
 3.16+01      6 1.45-10  -9.838 *******|********|       |       |     s |        |       |       |       |        |       |       | 
 6.31+01      3 3.64-11 -10.439 *******|****    |       |       s       |        |       |       |       |        |       |       | 
 1.26+02      0 0.00+00   0.000        |        |       |  s    |       |        |       |       |       |        |       |       | 
 2.51+02      0 0.00+00   0.000        |        |    s  |       |       |        |       |       |       |        |       |       | 
 5.01+02      1 1.53-12 -11.816 *      |        s       |       |       |        |       |       |       |        |       |       | 
  total 1.38+08 5.25-02         d------d--------d-------d-------d-------d--------d-------d-------d-------d--------d-------d-------d-

1tally       34        nps =  2620777126
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      13                                                                                   
                         4.00000E+03
 
 cell  13                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 4.03657E-07 0.0002   4.23614E-12 0.0441   0.00000E+00 0.0000   0.00000E+00 0.0000   0.00000E+00 0.0000
 
         time:       2.0000E+07             total                                                                  
                 0.00000E+00 0.0000   4.03662E-07 0.0002


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       34

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.02      yes         yes            constant    random       2.44
 passed?        yes          yes      yes          yes             yes      yes         yes               yes        yes          no

 ===================================================================================================================================


 warning.  the tally in the tally fluctuation chart bin did not pass  1 of the 10 statistical checks.

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       34 with nps =  2620777126  print table 160


 normed average tally per history  = 4.03662E-07          unnormed average tally per history  = 1.61465E-03
 estimated tally relative error    = 0.0002               estimated variance of the variance  = 0.0240
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0002

 number of nonzero history tallies =    66476879          efficiency for the nonzero tallies  = 0.0254
 history number of largest  tally  =   542794513          largest  unnormalized history tally = 3.11666E+02
 (largest  tally)/(average tally)  = 1.93025E+05          (largest  tally)/(avg nonzero tally)= 4.89613E+03

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 4.03664E-07


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            4.03662E-07             4.03691E-07                     0.000074
      relative error                  1.94563E-04             2.08021E-04                     0.069173
      variance of the variance        2.39868E-02             3.40603E-02                     0.419958
      shifted center                  4.03664E-07             4.03666E-07                     0.000004
      figure of merit                 1.32084E+02             1.15546E+02                    -0.125209

 the estimated inverse power slope of the 200 largest  tallies starting at 3.89599E+00 is 2.4419
 the history score probability density function appears to have an unsampled region at the largest  history scores:
 please examine. see print table 161.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (1.310E+04)*( 1.004E-01)**2 = (1.310E+04)*(1.008E-02) = 1.321E+02

1unnormed tally density for tally       34          nonzero tally mean(m) = 6.366E-02   nps =  2620777126  print table 161

 abscissa              ordinate   log plot of tally probability density function in tally fluctuation chart bin(d=decade,slope= 2.4)
  tally  number num den log den:d-------d--------d--------d-------d--------d--------d--------d--------d--------d-------d--------d---
 2.00-09      1 5.18-01  -0.286 ********|********|********|*******|********|********|********|********|********|*******|********|***
 3.16-09      0 0.00+00   0.000         |        |        |       |        |        |        |        |        |       |        |   
 5.01-09      0 0.00+00   0.000         |        |        |       |        |        |        |        |        |       |        |   
 7.94-09      1 1.30-01  -0.886 ********|********|********|*******|********|********|********|********|********|*******|******* |   
 1.26-08      1 8.21-02  -1.086 ********|********|********|*******|********|********|********|********|********|*******|*****   |   
 2.00-08      2 1.04-01  -0.984 ********|********|********|*******|********|********|********|********|********|*******|******  |   
 3.16-08      3 9.81-02  -1.008 ********|********|********|*******|********|********|********|********|********|*******|******  |   
 5.01-08     11 2.27-01  -0.644 ********|********|********|*******|********|********|********|********|********|*******|********|   
 7.94-08     26 3.38-01  -0.471 ********|********|********|*******|********|********|********|********|********|*******|********|*  
 1.26-07     30 2.46-01  -0.608 ********|********|********|*******|********|********|********|********|********|*******|********|   
 2.00-07     47 2.44-01  -0.613 ********|********|********|*******|********|********|********|********|********|*******|********|   
 3.16-07     53 1.73-01  -0.761 ********|********|********|*******|********|********|********|********|********|*******|********|   
 5.01-07    119 2.45-01  -0.610 ********|********|********|*******|********|********|********|********|********|*******|********|   
 7.94-07    167 2.17-01  -0.663 ********|********|********|*******|********|********|********|********|********|*******|********|   
 1.26-06    248 2.04-01  -0.691 ********|********|********|*******|********|********|********|********|********|*******|********|   
 2.00-06    399 2.07-01  -0.685 ********|********|********|*******|********|********|********|********|********|*******|********|   
 3.16-06    675 2.21-01  -0.656 ********|********|********|*******|********|********|********|********|********|*******|********|   
 5.01-06   1079 2.23-01  -0.652 ********|********|********|*******|********|********|********|********|********|*******|********|   
 7.94-06   1701 2.21-01  -0.655 ********|********|********|*******|********|********|********|********|********|*******|********|   
 1.26-05   2638 2.17-01  -0.664 ********|********|********|*******|********|********|********|********|********|*******|********|   
 2.00-05   4170 2.16-01  -0.665 ********|********|********|*******|********|********|********|********|********|*******|********|   
 3.16-05   6608 2.16-01  -0.665 ********|********|********|*******|********|********|********|********|********|*******|********|   
 5.01-05  10393 2.14-01  -0.669 ********|********|********|*******|********|********|********|********|********|*******|********|   
 7.94-05  16680 2.17-01  -0.663 ********|********|********|*******|********|********|********|********|********|*******|********|   
 1.26-04  26268 2.16-01  -0.666 ********|********|********|*******|********|********|********|********|********|*******|********|   
 2.00-04  41431 2.15-01  -0.668 ********|********|********|*******|********|********|********|********|********|*******|********|   
 3.16-04  65875 2.15-01  -0.667 ********|********|********|*******|********|********|********|********|********|*******|********|   
 5.01-04 104645 2.16-01  -0.666 ********|********|********|*******|********|********|********|********|********|*******|********|   
 7.94-04 164664 2.14-01  -0.669 ********|********|********|*******|********|********|********|********|********|*******|********|   
 1.26-03 261110 2.14-01  -0.669 ********|********|********|*******|********|********|********|********|********|*******|********|   
 2.00-03 413095 2.14-01  -0.669 ********|********|********|*******|********|********|********|********|********|*******|********|   
 3.16-03 656003 2.14-01  -0.669 ********|********|********|*******|********|********|********|********|********|*******|********|   
 5.01-03 1.0+06 2.15-01  -0.667 ********|********|********|*******|********|********|********|********|********|*******|********|   
 7.94-03 1.7+06 2.17-01  -0.664 ********|********|********|*******|********|********|********|********|********|*******|********|   
 1.26-02 2.9+06 2.40-01  -0.621 ********|********|********|*******|********|********|********|********|********|*******|********|   
 2.00-02 6.2+06 3.22-01  -0.492 ********|********|********|*******|********|********|********|********|********|*******|********|*  
 3.16-02 9.4+06 3.07-01  -0.513 ********|********|********|*******|********|********|********|********|********|*******|********|*  
 5.01-02 1.3+07 2.60-01  -0.586 ********|********|********|*******|********|********|********|********|********|*******|********|   
 7.94-02 1.3+07 1.69-01  -0.773 mmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmm|mmmmmmmm|   
 1.26-01 1.0+07 8.24-02  -1.084 ********|********|********|*******|********|********|********|********|********|*******|*****   |   
 2.00-01 5.5+06 2.87-02  -1.542 ********|********|********|*******|********|********|********|********|********|*******|*       |   
 3.16-01 1.9+06 6.18-03  -2.209 ********|********|********|*******|********|********|********|********|********|***    |        |   
 5.01-01 393311 8.11-04  -3.091 ********|********|********|*******|********|********|********|********|****    |       |        |   
 7.94-01  61362 7.99-05  -4.098 ********|********|********|*******|********|********|********|****    |        |       |        |   
 1.26+00  10879 8.93-06  -5.049 ********|********|********|*******|********|********|*****   |        |        |       |        |   
 2.00+00   2613 1.35-06  -5.868 ********|********|********|*******|********|******* |        |        |        |       |        |   
 3.16+00    711 2.32-07  -6.634 ********|********|********|*******|********|        |        |        |        |       |        |   
 5.01+00    216 4.46-08  -7.351 ********|********|********|*******|***     |   s    |        |        |        |       |        |   
 7.94+00     56 7.29-09  -8.137 ********|********|********|****   |        |s       |        |        |        |       |        |   
 1.26+01     35 2.87-09  -8.541 ********|********|********|       |      s |        |        |        |        |       |        |   
 2.00+01     12 6.22-10  -9.206 ********|********|***     |       |  s     |        |        |        |        |       |        |   
 3.16+01      2 6.54-11 -10.184 ********|***     |        |      s|        |        |        |        |        |       |        |   
 5.01+01      1 2.06-11 -10.686 ********|        |        |  s    |        |        |        |        |        |       |        |   
 7.94+01      1 1.30-11 -10.886 ******  |        |       s|       |        |        |        |        |        |       |        |   
 1.26+02      0 0.00+00   0.000         |        |   s    |       |        |        |        |        |        |       |        |   
 2.00+02      1 5.18-12 -11.286 ***     |        s        |       |        |        |        |        |        |       |        |   
 3.16+02      1 3.27-12 -11.486 *       |    s   |        |       |        |        |        |        |        |       |        |   
  total 6.65+07 2.54-02         d-------d--------d--------d-------d--------d--------d--------d--------d--------d-------d--------d---

1tally       44        nps =  2620777126
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      14                                                                                   
                         4.00000E+03
 
 cell  14                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 4.97108E-07 0.0002   5.11286E-12 0.0444   0.00000E+00 0.0000   0.00000E+00 0.0000   0.00000E+00 0.0000
 
         time:       2.0000E+07             total                                                                  
                 0.00000E+00 0.0000   4.97114E-07 0.0002


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       44

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00      yes          no            constant    random       2.46
 passed?        yes          yes      yes          yes             yes      yes          no               yes        yes          no

 ===================================================================================================================================


 warning.  the tally in the tally fluctuation chart bin did not pass  2 of the 10 statistical checks.

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       44 with nps =  2620777126  print table 160


 normed average tally per history  = 4.97114E-07          unnormed average tally per history  = 1.98845E-03
 estimated tally relative error    = 0.0002               estimated variance of the variance  = 0.0001
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =    77585831          efficiency for the nonzero tallies  = 0.0296
 history number of largest  tally  =   579292617          largest  unnormalized history tally = 7.59621E+01
 (largest  tally)/(average tally)  = 3.82016E+04          (largest  tally)/(avg nonzero tally)= 1.13092E+03

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 4.97114E-07


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            4.97114E-07             4.97121E-07                     0.000015
      relative error                  1.61342E-04             1.61996E-04                     0.004058
      variance of the variance        1.48288E-04             2.11438E-04                     0.425859
      shifted center                  4.97114E-07             4.97114E-07                     0.000000
      figure of merit                 1.92078E+02             1.90528E+02                    -0.008067

 the estimated inverse power slope of the 200 largest  tallies starting at 4.64914E+00 is 2.4625
 the history score probability density function appears to have an unsampled region at the largest  history scores:
 please examine. see print table 161.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (1.310E+04)*( 1.211E-01)**2 = (1.310E+04)*(1.466E-02) = 1.921E+02

1unnormed tally density for tally       44          nonzero tally mean(m) = 6.717E-02   nps =  2620777126  print table 161

 abscissa              ordinate   log plot of tally probability density function in tally fluctuation chart bin(d=decade,slope= 2.5)
  tally  number num den log den:d-------d---------d--------d---------d--------d---------d--------d--------d---------d--------d------
 6.31-09      2 3.28-01  -0.484 ********|*********|********|*********|********|*********|********|********|*********|********|****  
 1.00-08      5 5.17-01  -0.287 ********|*********|********|*********|********|*********|********|********|*********|********|******
 1.58-08      2 1.30-01  -0.884 ********|*********|********|*********|********|*********|********|********|*********|********|      
 2.51-08      3 1.23-01  -0.908 ********|*********|********|*********|********|*********|********|********|*********|********|      
 3.98-08      5 1.30-01  -0.887 ********|*********|********|*********|********|*********|********|********|*********|********|      
 6.31-08     12 1.97-01  -0.706 ********|*********|********|*********|********|*********|********|********|*********|********|**    
 1.00-07     16 1.65-01  -0.781 ********|*********|********|*********|********|*********|********|********|*********|********|*     
 1.58-07     34 2.22-01  -0.654 ********|*********|********|*********|********|*********|********|********|*********|********|***   
 2.51-07     65 2.68-01  -0.573 ********|*********|********|*********|********|*********|********|********|*********|********|***   
 3.98-07     91 2.36-01  -0.626 ********|*********|********|*********|********|*********|********|********|*********|********|***   
 6.31-07    116 1.90-01  -0.721 ********|*********|********|*********|********|*********|********|********|*********|********|**    
 1.00-06    210 2.17-01  -0.663 ********|*********|********|*********|********|*********|********|********|*********|********|**    
 1.58-06    370 2.41-01  -0.617 ********|*********|********|*********|********|*********|********|********|*********|********|***   
 2.51-06    543 2.24-01  -0.651 ********|*********|********|*********|********|*********|********|********|*********|********|***   
 3.98-06    888 2.31-01  -0.637 ********|*********|********|*********|********|*********|********|********|*********|********|***   
 6.31-06   1383 2.27-01  -0.645 ********|*********|********|*********|********|*********|********|********|*********|********|***   
 1.00-05   2226 2.30-01  -0.638 ********|*********|********|*********|********|*********|********|********|*********|********|***   
 1.58-05   3575 2.33-01  -0.632 ********|*********|********|*********|********|*********|********|********|*********|********|***   
 2.51-05   5581 2.30-01  -0.639 ********|*********|********|*********|********|*********|********|********|*********|********|***   
 3.98-05   8873 2.30-01  -0.637 ********|*********|********|*********|********|*********|********|********|*********|********|***   
 6.31-05  14043 2.30-01  -0.638 ********|*********|********|*********|********|*********|********|********|*********|********|***   
 1.00-04  22465 2.32-01  -0.634 ********|*********|********|*********|********|*********|********|********|*********|********|***   
 1.58-04  35801 2.34-01  -0.632 ********|*********|********|*********|********|*********|********|********|*********|********|***   
 2.51-04  56447 2.32-01  -0.634 ********|*********|********|*********|********|*********|********|********|*********|********|***   
 3.98-04  89098 2.31-01  -0.636 ********|*********|********|*********|********|*********|********|********|*********|********|***   
 6.31-04 140845 2.31-01  -0.637 ********|*********|********|*********|********|*********|********|********|*********|********|***   
 1.00-03 222722 2.30-01  -0.638 ********|*********|********|*********|********|*********|********|********|*********|********|***   
 1.58-03 353531 2.31-01  -0.637 ********|*********|********|*********|********|*********|********|********|*********|********|***   
 2.51-03 558715 2.30-01  -0.638 ********|*********|********|*********|********|*********|********|********|*********|********|***   
 3.98-03 888257 2.31-01  -0.637 ********|*********|********|*********|********|*********|********|********|*********|********|***   
 6.31-03 1.4+06 2.33-01  -0.633 ********|*********|********|*********|********|*********|********|********|*********|********|***   
 1.00-02 2.3+06 2.39-01  -0.621 ********|*********|********|*********|********|*********|********|********|*********|********|***   
 1.58-02 4.6+06 3.00-01  -0.523 ********|*********|********|*********|********|*********|********|********|*********|********|****  
 2.51-02 8.7+06 3.60-01  -0.444 ********|*********|********|*********|********|*********|********|********|*********|********|***** 
 3.98-02 1.3+07 3.29-01  -0.483 ********|*********|********|*********|********|*********|********|********|*********|********|****  
 6.31-02 1.5+07 2.48-01  -0.605 ********|*********|********|*********|********|*********|********|********|*********|********|***   
 1.00-01 1.4+07 1.48-01  -0.830 mmmmmmmm|mmmmmmmmm|mmmmmmmm|mmmmmmmmm|mmmmmmmm|mmmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmmm|mmmmmmmm|m     
 1.58-01 1.0+07 6.50-02  -1.187 ********|*********|********|*********|********|*********|********|********|*********|******* |      
 2.51-01 4.5+06 1.84-02  -1.734 ********|*********|********|*********|********|*********|********|********|*********|*       |      
 3.98-01 1.3+06 3.25-03  -2.488 ********|*********|********|*********|********|*********|********|********|****     |        |      
 6.31-01 217763 3.57-04  -3.448 ********|*********|********|*********|********|*********|********|****    |         |        |      
 1.00+00  34227 3.54-05  -4.451 ********|*********|********|*********|********|*********|****    |        |         |        |      
 1.58+00   6856 4.47-06  -5.349 ********|*********|********|*********|********|*****    |        |        |         |        |      
 2.51+00   1858 7.65-07  -6.116 ********|*********|********|*********|******* |         |        |        |         |        |      
 3.98+00    524 1.36-07  -6.866 ********|*********|********|*********|        |         |        |        |         |        |      
 6.31+00    173 2.83-08  -7.547 ********|*********|********|****     |   s    |         |        |        |         |        |      
 1.00+01     54 5.58-09  -8.253 ********|*********|******  |         |s       |         |        |        |         |        |      
 1.58+01     24 1.57-09  -8.805 ********|*********|*       |      s  |        |         |        |        |         |        |      
 2.51+01     13 5.35-10  -9.272 ********|******   |        |  s      |        |         |        |        |         |        |      
 3.98+01      5 1.30-10  -9.887 ********|         |       s|         |        |         |        |        |         |        |      
 6.31+01      1 1.64-11 -10.786 *       |         |   s    |         |        |         |        |        |         |        |      
 7.94+01      2 4.67-11 -10.331 *****   |         s        |         |        |         |        |        |         |        |      
  total 7.76+07 2.96-02         d-------d---------d--------d---------d--------d---------d--------d--------d---------d--------d------

1status of the statistical checks used to form confidence intervals for the mean for each tally bin


 tally   result of statistical checks for the tfc bin (the first check not passed is listed) and error magnitude check for all bins

        4   missed  2 of 10 tfc bin checks: the variance of the variance appears not to decrease as 1/nps for the last half of problem
         passed all bin error check:     7 tally bins had     4 bins with zeros and     0 bins with relative errors exceeding 0.10

       14   missed  5 of 10 tfc bin checks: the relative error does not monotonically decrease over the last half of the problem      
         passed all bin error check:     7 tally bins had     4 bins with zeros and     0 bins with relative errors exceeding 0.10

       24   missed  2 of 10 tfc bin checks: the figure of merit has a trend during the last half of the problem                       
         passed all bin error check:     7 tally bins had     4 bins with zeros and     0 bins with relative errors exceeding 0.10

       34   missed  1 of 10 tfc bin checks: the slope of decrease of largest tallies is less than the minimum acceptable value of 3.0 
         passed all bin error check:     7 tally bins had     4 bins with zeros and     0 bins with relative errors exceeding 0.10

       44   missed  2 of 10 tfc bin checks: the variance of the variance appears not to decrease as 1/nps for the last half of problem
         passed all bin error check:     7 tally bins had     4 bins with zeros and     0 bins with relative errors exceeding 0.10


 the 10 statistical checks are only for the tally fluctuation chart bin and do not apply to other tally bins.

 the tally bins with zeros may or may not be correct: compare the source, cutoffs, multipliers, et cetera with the tally bins.

 warning.       5 of the     5 tally fluctuation chart bins did not pass all 10 statistical checks.
1tally fluctuation charts                              

                            tally        4                          tally       14                          tally       24
          nps      mean     error   vov  slope    fom      mean     error   vov  slope    fom      mean     error   vov  slope    fom
    131072000   2.7578E-07 0.0008 0.0000  3.6     139   4.0371E-07 0.0008 0.0152  2.7     147   9.1859E-07 0.0005 0.0000  4.5     375
    262144000   2.7590E-07 0.0006 0.0068  3.4     127   4.0350E-07 0.0006 0.0044  2.7     158   9.1828E-07 0.0004 0.0000  3.7     375
    393216000   2.7604E-07 0.0005 0.0159  2.7     116   4.0362E-07 0.0005 0.0021  3.1     162   9.1851E-07 0.0003 0.0000  3.4     373
    524288000   2.7598E-07 0.0005 0.0097  2.7     121   4.0354E-07 0.0004 0.0012  2.8     163   9.1857E-07 0.0003 0.0000  3.0     373
    655360000   2.7601E-07 0.0004 0.0066  2.4     120   4.0360E-07 0.0003 0.0008  2.8     164   9.1885E-07 0.0003 0.1657  2.4     221
    786432000   2.7601E-07 0.0004 0.0048  2.5     123   4.0365E-07 0.0003 0.0005  3.1     165   9.1876E-07 0.0003 0.1326  2.5     237
    917504000   2.7602E-07 0.0003 0.0036  2.5     125   4.0367E-07 0.0003 0.0004  2.9     166   9.1884E-07 0.0002 0.1086  2.6     250
   1048576000   2.7598E-07 0.0003 0.0028  2.4     126   4.0364E-07 0.0003 0.0003  3.3     166   9.1883E-07 0.0002 0.0905  2.7     261
   1179648000   2.7604E-07 0.0003 0.0023  2.4     127   4.0359E-07 0.0003 0.0003  3.4     166   9.1882E-07 0.0002 0.0765  2.7     270
   1310720000   2.7606E-07 0.0003 0.0019  2.3     128   4.0357E-07 0.0002 0.0002  3.0     166   9.1883E-07 0.0002 0.0653  2.6     278
   1441792000   2.7603E-07 0.0003 0.0016  2.3     129   4.0361E-07 0.0002 0.0002  2.8     166   9.1880E-07 0.0002 0.0566  2.7     284
   1572864000   2.7603E-07 0.0003 0.0013  2.2     129   4.0357E-07 0.0002 0.0001  2.8     167   9.1882E-07 0.0002 0.0496  2.8     290
   1703936000   2.7605E-07 0.0002 0.0011  2.3     130   4.0362E-07 0.0002 0.0659  2.6     124   9.1886E-07 0.0002 0.0437  2.7     295
   1835008000   2.7608E-07 0.0002 0.0010  2.3     130   4.0362E-07 0.0002 0.0591  2.6     127   9.1886E-07 0.0002 0.0389  2.7     300
   1966080000   2.7606E-07 0.0002 0.0009  2.3     131   4.0362E-07 0.0002 0.0533  2.7     129   9.1884E-07 0.0001 0.0346  2.5     303
   2097152000   2.7607E-07 0.0002 0.0008  2.5     131   4.0362E-07 0.0002 0.0483  2.8     131   9.1888E-07 0.0001 0.0311  2.5     306
   2228224000   2.7606E-07 0.0002 0.0007  2.5     131   4.0364E-07 0.0002 0.0440  2.8     133   9.1890E-07 0.0001 0.0282  2.4     310
   2359296000   2.7606E-07 0.0002 0.0006  2.5     132   4.0366E-07 0.0002 0.0402  2.8     134   9.1894E-07 0.0001 0.0256  2.4     313
   2490368000   2.7607E-07 0.0002 0.0006  2.5     132   4.0364E-07 0.0002 0.0368  2.9     136   9.1898E-07 0.0001 0.0233  2.3     315
   2620777126   2.7607E-07 0.0002 0.0005  2.6     132   4.0363E-07 0.0002 0.0336  2.7     136   9.1894E-07 0.0001 0.0214  2.3     317
 

                            tally       34                          tally       44
          nps      mean     error   vov  slope    fom      mean     error   vov  slope    fom
    131072000   4.0355E-07 0.0008 0.0186  2.9     145   4.9702E-07 0.0007 0.0001  3.3     197
    262144000   4.0330E-07 0.0006 0.0054  2.9     157   4.9722E-07 0.0005 0.0000  3.2     197
    393216000   4.0362E-07 0.0005 0.0031  3.1     157   4.9715E-07 0.0004 0.0000  3.3     198
    524288000   4.0371E-07 0.0004 0.0018  2.6     159   4.9720E-07 0.0004 0.0000  3.1     197
    655360000   4.0389E-07 0.0005 0.1689  2.4      95   4.9716E-07 0.0003 0.0011  3.0     191
    786432000   4.0372E-07 0.0004 0.1365  2.4     102   4.9710E-07 0.0003 0.0008  3.1     192
    917504000   4.0380E-07 0.0004 0.1125  2.4     108   4.9712E-07 0.0003 0.0006  2.9     192
   1048576000   4.0377E-07 0.0003 0.0939  2.5     113   4.9710E-07 0.0003 0.0004  3.0     192
   1179648000   4.0371E-07 0.0003 0.0800  2.6     117   4.9708E-07 0.0002 0.0004  2.8     192
   1310720000   4.0372E-07 0.0003 0.0689  2.6     121   4.9713E-07 0.0002 0.0005  2.6     190
   1441792000   4.0369E-07 0.0003 0.0599  2.5     124   4.9706E-07 0.0002 0.0004  2.6     190
   1572864000   4.0365E-07 0.0003 0.0527  2.6     127   4.9706E-07 0.0002 0.0004  2.5     191
   1703936000   4.0364E-07 0.0002 0.0465  2.5     129   4.9706E-07 0.0002 0.0003  2.7     191
   1835008000   4.0366E-07 0.0002 0.0415  2.5     131   4.9710E-07 0.0002 0.0003  2.7     192
   1966080000   4.0365E-07 0.0002 0.0372  2.6     133   4.9711E-07 0.0002 0.0002  2.7     191
   2097152000   4.0364E-07 0.0002 0.0335  2.6     135   4.9710E-07 0.0002 0.0002  2.7     191
   2228224000   4.0367E-07 0.0002 0.0303  2.6     136   4.9710E-07 0.0002 0.0002  2.6     191
   2359296000   4.0366E-07 0.0002 0.0276  2.6     138   4.9713E-07 0.0002 0.0002  2.6     192
   2490368000   4.0367E-07 0.0002 0.0260  2.4     131   4.9714E-07 0.0002 0.0002  2.5     192
   2620777126   4.0366E-07 0.0002 0.0240  2.4     132   4.9711E-07 0.0002 0.0001  2.5     192

 ***********************************************************************************************************************

 dump no.  168 on file inpr     nps =  2620777126     coll =   182216261940     ctm =   200000.32   nrn =    
 1537869577563

        16 warning messages so far.


 run terminated when it had used*****  minutes of computer time.

 computer time =******** minutes

 mcnp     version 6     06/19/14                     08/07/17 01:34:45                     probid =  08/06/17 17:14:48 
