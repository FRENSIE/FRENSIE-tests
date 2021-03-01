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
  
1mcnp     version 6     ld=06/19/14                     08/06/17 18:17:13 
 *************************************************************************                 probid =  08/06/17 18:17:13 
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
       107-        TR1   25 25 25                               $ Translation for HEU sphere      
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

 dump no.    2 on file inpr     nps =    15423344     coll =     1069895691     ctm =     1200.29   nrn =       
 9031766863

 ***********************************************************************************************************************

 dump no.    3 on file inpr     nps =    30815637     coll =     2140399665     ctm =     2400.70   nrn =      
 18065961612

 ***********************************************************************************************************************

 dump no.    4 on file inpr     nps =    46266170     coll =     3211749360     ctm =     3601.03   nrn =      
 27108499047

 ***********************************************************************************************************************

 dump no.    5 on file inpr     nps =    61666412     coll =     4283497893     ctm =     4801.35   nrn =      
 36153098100

 ***********************************************************************************************************************

 dump no.    6 on file inpr     nps =    77061050     coll =     5353406419     ctm =     6001.73   nrn =      
 45182580963

 ***********************************************************************************************************************

 dump no.    7 on file inpr     nps =    92479268     coll =     6425072457     ctm =     7202.11   nrn =      
 54227559729

 ***********************************************************************************************************************

 dump no.    8 on file inpr     nps =   107870063     coll =     7496899864     ctm =     8402.44   nrn =      
 63273021429

 ***********************************************************************************************************************

 dump no.    9 on file inpr     nps =   123271068     coll =     8568816192     ctm =     9602.83   nrn =      
 72319334420

 ***********************************************************************************************************************

 dump no.   10 on file inpr     nps =   138699814     coll =     9640416289     ctm =    10803.15   nrn =      
 81363096359

 ***********************************************************************************************************************

 dump no.   11 on file inpr     nps =   154114559     coll =    10712054178     ctm =    12003.56   nrn =      
 90407327403

 ***********************************************************************************************************************

 dump no.   12 on file inpr     nps =   169539240     coll =    11783415848     ctm =    13203.85   nrn =      
 99450020237

 ***********************************************************************************************************************

 dump no.   13 on file inpr     nps =   184971162     coll =    12854794214     ctm =    14404.19   nrn =     
 108492636824

 ***********************************************************************************************************************

 dump no.   14 on file inpr     nps =   200369906     coll =    13926791834     ctm =    15604.45   nrn =     
 117538742214

 ***********************************************************************************************************************

 dump no.   15 on file inpr     nps =   215786840     coll =    14998353421     ctm =    16804.87   nrn =     
 126582399221

 ***********************************************************************************************************************

 dump no.   16 on file inpr     nps =   231184704     coll =    16069871458     ctm =    18005.24   nrn =     
 135625275131

 ***********************************************************************************************************************

 dump no.   17 on file inpr     nps =   246632264     coll =    17140698695     ctm =    19205.56   nrn =     
 144664026179

 ***********************************************************************************************************************

 dump no.   18 on file inpr     nps =   262043046     coll =    18212222697     ctm =    20405.86   nrn =     
 153707825868

 ***********************************************************************************************************************

 dump no.   19 on file inpr     nps =   277445000     coll =    19284099144     ctm =    21606.22   nrn =     
 162754145034

 ***********************************************************************************************************************

 dump no.   20 on file inpr     nps =   292868140     coll =    20355388298     ctm =    22806.61   nrn =     
 171796692086

 ***********************************************************************************************************************

 dump no.   21 on file inpr     nps =   308268382     coll =    21426660374     ctm =    24006.95   nrn =     
 180838572488

 ***********************************************************************************************************************

 dump no.   22 on file inpr     nps =   323680822     coll =    22497928786     ctm =    25207.19   nrn =     
 189880734588

 ***********************************************************************************************************************

 dump no.   23 on file inpr     nps =   339101394     coll =    23569509111     ctm =    26407.56   nrn =     
 198924587899

 ***********************************************************************************************************************

 dump no.   24 on file inpr     nps =   354531650     coll =    24640676581     ctm =    27607.85   nrn =     
 207965630337

 ***********************************************************************************************************************

 dump no.   25 on file inpr     nps =   369964580     coll =    25711647675     ctm =    28808.20   nrn =     
 217005723827

 ***********************************************************************************************************************

 dump no.   26 on file inpr     nps =   385463530     coll =    26786930051     ctm =    30008.64   nrn =     
 226082524011

 ***********************************************************************************************************************

 dump no.   27 on file inpr     nps =   400966010     coll =    27867559073     ctm =    31208.98   nrn =     
 235200991675

 ***********************************************************************************************************************

 dump no.   28 on file inpr     nps =   416524238     coll =    28947727491     ctm =    32409.26   nrn =     
 244317457670

 ***********************************************************************************************************************

 dump no.   29 on file inpr     nps =   432057320     coll =    30027462535     ctm =    33609.65   nrn =     
 253431059101

 ***********************************************************************************************************************

 dump no.   30 on file inpr     nps =   447556912     coll =    31107447558     ctm =    34810.04   nrn =     
 262545184611

 ***********************************************************************************************************************

 dump no.   31 on file inpr     nps =   463077796     coll =    32187858224     ctm =    36010.35   nrn =     
 271662555418

 ***********************************************************************************************************************

 dump no.   32 on file inpr     nps =   478645654     coll =    33267559914     ctm =    37210.74   nrn =     
 280776272128

 ***********************************************************************************************************************

 dump no.   33 on file inpr     nps =   494184728     coll =    34347739805     ctm =    38411.02   nrn =     
 289892179469

 ***********************************************************************************************************************

 dump no.   34 on file inpr     nps =   509733326     coll =    35427635249     ctm =    39611.37   nrn =     
 299006510538

 ***********************************************************************************************************************

 dump no.   35 on file inpr     nps =   525264482     coll =    36508043363     ctm =    40811.67   nrn =     
 308124865850

 ***********************************************************************************************************************

 dump no.   36 on file inpr     nps =   540798742     coll =    37588137278     ctm =    42012.11   nrn =     
 317240445791

 ***********************************************************************************************************************

 dump no.   37 on file inpr     nps =   556343702     coll =    38668174452     ctm =    43212.46   nrn =     
 326356630998

 ***********************************************************************************************************************

 dump no.   38 on file inpr     nps =   571877212     coll =    39748485252     ctm =    44412.79   nrn =     
 335474206627

 ***********************************************************************************************************************

 dump no.   39 on file inpr     nps =   587398418     coll =    40828712260     ctm =    45613.04   nrn =     
 344591164090

 ***********************************************************************************************************************

 dump no.   40 on file inpr     nps =   602934496     coll =    41909053599     ctm =    46813.50   nrn =     
 353708871501

 ***********************************************************************************************************************

 dump no.   41 on file inpr     nps =   618472608     coll =    42988887198     ctm =    48013.89   nrn =     
 362822636101

 ***********************************************************************************************************************

 dump no.   42 on file inpr     nps =   634021740     coll =    44069011861     ctm =    49214.24   nrn =     
 371939098316

 ***********************************************************************************************************************

 dump no.   43 on file inpr     nps =   649558354     coll =    45149070984     ctm =    50414.58   nrn =     
 381054402284

 ***********************************************************************************************************************

 dump no.   44 on file inpr     nps =   665074958     coll =    46228979678     ctm =    51614.83   nrn =     
 390168166922

 ***********************************************************************************************************************

 dump no.   45 on file inpr     nps =   680605366     coll =    47308848774     ctm =    52815.10   nrn =     
 399281374029

 ***********************************************************************************************************************

 dump no.   46 on file inpr     nps =   696153536     coll =    48388548474     ctm =    54015.40   nrn =     
 408394655843

 ***********************************************************************************************************************

 dump no.   47 on file inpr     nps =   711680734     coll =    49468743575     ctm =    55215.75   nrn =     
 417510649721

 ***********************************************************************************************************************

 dump no.   48 on file inpr     nps =   727228902     coll =    50548615275     ctm =    56416.09   nrn =     
 426625331257

 ***********************************************************************************************************************

 dump no.   49 on file inpr     nps =   742776002     coll =    51628527789     ctm =    57616.39   nrn =     
 435740365265

 ***********************************************************************************************************************

 dump no.   50 on file inpr     nps =   758330164     coll =    52708491433     ctm =    58816.74   nrn =     
 444855961646

 ***********************************************************************************************************************

 dump no.   51 on file inpr     nps =   773885396     coll =    53788477642     ctm =    60017.07   nrn =     
 453970758743

 ***********************************************************************************************************************

 dump no.   52 on file inpr     nps =   789421152     coll =    54868885634     ctm =    61217.46   nrn =     
 463090102587

 ***********************************************************************************************************************

 dump no.   53 on file inpr     nps =   804961618     coll =    55949181032     ctm =    62417.83   nrn =     
 472208155728

 ***********************************************************************************************************************

 dump no.   54 on file inpr     nps =   820485392     coll =    57029502475     ctm =    63618.23   nrn =     
 481325599013

 ***********************************************************************************************************************

 dump no.   55 on file inpr     nps =   836013018     coll =    58109739353     ctm =    64818.57   nrn =     
 490442808926

 ***********************************************************************************************************************

 dump no.   56 on file inpr     nps =   851539574     coll =    59189851634     ctm =    66018.85   nrn =     
 499558359850

 ***********************************************************************************************************************

 dump no.   57 on file inpr     nps =   867075330     coll =    60270286663     ctm =    67219.22   nrn =     
 508676245826

 ***********************************************************************************************************************

 dump no.   58 on file inpr     nps =   882614943     coll =    61349891171     ctm =    68419.54   nrn =     
 517789064433

 ***********************************************************************************************************************

 dump no.   59 on file inpr     nps =   898157508     coll =    62430056360     ctm =    69619.90   nrn =     
 526905469243

 ***********************************************************************************************************************

 dump no.   60 on file inpr     nps =   913680078     coll =    63510283417     ctm =    70820.25   nrn =     
 536022226378

 ***********************************************************************************************************************

 dump no.   61 on file inpr     nps =   929247515     coll =    64590336364     ctm =    72020.57   nrn =     
 545138603812

 ***********************************************************************************************************************

 dump no.   62 on file inpr     nps =   944745790     coll =    65670956813     ctm =    73220.92   nrn =     
 554258178227

 ***********************************************************************************************************************

 dump no.   63 on file inpr     nps =   960284270     coll =    66751361920     ctm =    74421.30   nrn =     
 563375883280

 ***********************************************************************************************************************

 dump no.   64 on file inpr     nps =   975831995     coll =    67831262539     ctm =    75621.63   nrn =     
 572490698743

 ***********************************************************************************************************************

 dump no.   65 on file inpr     nps =   991342010     coll =    68911941287     ctm =    76821.97   nrn =     
 581609918661

 ***********************************************************************************************************************

 dump no.   66 on file inpr     nps =  1006889305     coll =    69991839143     ctm =    78022.31   nrn =     
 590724220177

 ***********************************************************************************************************************

 dump no.   67 on file inpr     nps =  1022427140     coll =    71072058293     ctm =    79222.65   nrn =     
 599840883174

 ***********************************************************************************************************************

 dump no.   68 on file inpr     nps =  1037935950     coll =    72152479487     ctm =    80422.92   nrn =     
 608958521292

 ***********************************************************************************************************************

 dump no.   69 on file inpr     nps =  1053500575     coll =    73232168510     ctm =    81623.25   nrn =     
 618071937927

 ***********************************************************************************************************************

 dump no.   70 on file inpr     nps =  1069055180     coll =    74312102478     ctm =    82823.60   nrn =     
 627186835424

 ***********************************************************************************************************************

 dump no.   71 on file inpr     nps =  1084587855     coll =    75392104105     ctm =    84023.92   nrn =     
 636302009591

 ***********************************************************************************************************************

 dump no.   72 on file inpr     nps =  1100125475     coll =    76471773416     ctm =    85224.33   nrn =     
 645414979228

 ***********************************************************************************************************************

 dump no.   73 on file inpr     nps =  1115628610     coll =    77551551381     ctm =    86424.64   nrn =     
 654527364090

 ***********************************************************************************************************************

 dump no.   74 on file inpr     nps =  1131177195     coll =    78631615122     ctm =    87624.99   nrn =     
 663643567889

 ***********************************************************************************************************************

 dump no.   75 on file inpr     nps =  1146718255     coll =    79711808578     ctm =    88825.42   nrn =     
 672759868898

 ***********************************************************************************************************************

 dump no.   76 on file inpr     nps =  1162258455     coll =    80791881545     ctm =    90025.72   nrn =     
 681875588830

 ***********************************************************************************************************************

 dump no.   77 on file inpr     nps =  1177798010     coll =    81872112335     ctm =    91226.13   nrn =     
 690992911405

 ***********************************************************************************************************************

 dump no.   78 on file inpr     nps =  1193314690     coll =    82952937562     ctm =    92426.50   nrn =     
 700113677251

 ***********************************************************************************************************************

 dump no.   79 on file inpr     nps =  1208837690     coll =    84033217149     ctm =    93626.80   nrn =     
 709230958681

 ***********************************************************************************************************************

 dump no.   80 on file inpr     nps =  1224340050     coll =    85113659696     ctm =    94827.16   nrn =     
 718348965713

 ***********************************************************************************************************************

 dump no.   81 on file inpr     nps =  1239893795     coll =    86193351959     ctm =    96027.42   nrn =     
 727462031948

 ***********************************************************************************************************************

 dump no.   82 on file inpr     nps =  1255441650     coll =    87273342683     ctm =    97227.81   nrn =     
 736576741355

 ***********************************************************************************************************************

 dump no.   83 on file inpr     nps =  1270970670     coll =    88353504089     ctm =    98428.22   nrn =     
 745693628810

 ***********************************************************************************************************************

 dump no.   84 on file inpr     nps =  1286520115     coll =    89433330231     ctm =    99628.53   nrn =     
 754808185812

 ***********************************************************************************************************************

 dump no.   85 on file inpr     nps =  1302052575     coll =    90513274276     ctm =   100828.84   nrn =     
 763923218500

 ***********************************************************************************************************************

 dump no.   86 on file inpr     nps =  1317607095     coll =    91592708982     ctm =   102029.20   nrn =     
 773034209642

 ***********************************************************************************************************************

 dump no.   87 on file inpr     nps =  1333153100     coll =    92672464060     ctm =   103229.63   nrn =     
 782147715314

 ***********************************************************************************************************************

 dump no.   88 on file inpr     nps =  1348687925     coll =    93752355546     ctm =   104429.89   nrn =     
 791262160766

 ***********************************************************************************************************************

 dump no.   89 on file inpr     nps =  1364221675     coll =    94832273930     ctm =   105630.29   nrn =     
 800376606651

 ***********************************************************************************************************************

 dump no.   90 on file inpr     nps =  1379762090     coll =    95912092402     ctm =   106830.56   nrn =     
 809490351816

 ***********************************************************************************************************************

 dump no.   91 on file inpr     nps =  1395297560     coll =    96992210602     ctm =   108030.89   nrn =     
 818607400607

 ***********************************************************************************************************************

 dump no.   92 on file inpr     nps =  1410822495     coll =    98072842664     ctm =   109231.19   nrn =     
 827727243984

 ***********************************************************************************************************************

 dump no.   93 on file inpr     nps =  1426374520     coll =    99152705011     ctm =   110431.57   nrn =     
 836841556137

 ***********************************************************************************************************************

 dump no.   94 on file inpr     nps =  1441917775     coll =   100232683696     ctm =   111631.98   nrn =     
 845956405438

 ***********************************************************************************************************************

 dump no.   95 on file inpr     nps =  1457492805     coll =   101312234520     ctm =   112832.35   nrn =     
 855069069612

 ***********************************************************************************************************************

 dump no.   96 on file inpr     nps =  1473018385     coll =   102392597745     ctm =   114032.71   nrn =     
 864187399667

 ***********************************************************************************************************************

 dump no.   97 on file inpr     nps =  1488550415     coll =   103472841740     ctm =   115233.13   nrn =     
 873304497201

 ***********************************************************************************************************************

 dump no.   98 on file inpr     nps =  1504071050     coll =   104553182409     ctm =   116433.44   nrn =     
 882422369077

 ***********************************************************************************************************************

 dump no.   99 on file inpr     nps =  1519604370     coll =   105633784390     ctm =   117633.74   nrn =     
 891541860276

 ***********************************************************************************************************************

 dump no.  100 on file inpr     nps =  1535114900     coll =   106713930333     ctm =   118834.02   nrn =     
 900657163835

 ***********************************************************************************************************************

 dump no.  101 on file inpr     nps =  1550629300     coll =   107794174626     ctm =   120034.41   nrn =     
 909773212819

 ***********************************************************************************************************************

 dump no.  102 on file inpr     nps =  1566176165     coll =   108873980448     ctm =   121234.73   nrn =     
 918887049362

 ***********************************************************************************************************************

 dump no.  103 on file inpr     nps =  1581718130     coll =   109954003117     ctm =   122435.00   nrn =     
 928002454165

 ***********************************************************************************************************************

 dump no.  104 on file inpr     nps =  1597258760     coll =   111034146440     ctm =   123635.31   nrn =     
 937119033227

 ***********************************************************************************************************************

 dump no.  105 on file inpr     nps =  1612815515     coll =   112114569581     ctm =   124835.93   nrn =     
 946238746255

 ***********************************************************************************************************************

 dump no.  106 on file inpr     nps =  1628343890     coll =   113194958535     ctm =   126036.16   nrn =     
 955356023686

 ***********************************************************************************************************************

 dump no.  107 on file inpr     nps =  1643858935     coll =   114275295002     ctm =   127236.39   nrn =     
 964474021152

 ***********************************************************************************************************************

 dump no.  108 on file inpr     nps =  1659370325     coll =   115355872339     ctm =   128436.63   nrn =     
 973593188785

 ***********************************************************************************************************************

 dump no.  109 on file inpr     nps =  1674921275     coll =   116436055118     ctm =   129636.93   nrn =     
 982710346509

 ***********************************************************************************************************************

 dump no.  110 on file inpr     nps =  1690469860     coll =   117516162527     ctm =   130837.28   nrn =     
 991827081645

 ***********************************************************************************************************************

 dump no.  111 on file inpr     nps =  1706011395     coll =   118596486600     ctm =   132037.68   nrn =    
 1000944383883

 ***********************************************************************************************************************

 dump no.  112 on file inpr     nps =  1721524935     coll =   119676794103     ctm =   133238.00   nrn =    
 1010061920069

 ***********************************************************************************************************************

 dump no.  113 on file inpr     nps =  1737040840     coll =   120755508202     ctm =   134438.30   nrn =    
 1019165942737

 ***********************************************************************************************************************

 dump no.  114 on file inpr     nps =  1752546425     coll =   121835715590     ctm =   135638.56   nrn =    
 1028282007773

 ***********************************************************************************************************************

 dump no.  115 on file inpr     nps =  1768055235     coll =   122916079274     ctm =   136839.05   nrn =    
 1037399532269

 ***********************************************************************************************************************

 dump no.  116 on file inpr     nps =  1783595650     coll =   123996561042     ctm =   138039.42   nrn =    
 1046517955524

 ***********************************************************************************************************************

 dump no.  117 on file inpr     nps =  1799151545     coll =   125076511110     ctm =   139239.79   nrn =    
 1055633481799

 ***********************************************************************************************************************

 dump no.  118 on file inpr     nps =  1814692390     coll =   126157148900     ctm =   140440.29   nrn =    
 1064754045239

 ***********************************************************************************************************************

 dump no.  119 on file inpr     nps =  1830219905     coll =   127237541536     ctm =   141640.55   nrn =    
 1073872068255

 ***********************************************************************************************************************

 dump no.  120 on file inpr     nps =  1845785090     coll =   128316995791     ctm =   142840.87   nrn =    
 1082983790543

 ***********************************************************************************************************************

 dump no.  121 on file inpr     nps =  1861338190     coll =   129397181056     ctm =   144041.24   nrn =    
 1092101259223

 ***********************************************************************************************************************

 dump no.  122 on file inpr     nps =  1876868070     coll =   130477529350     ctm =   145241.62   nrn =    
 1101219079450

 ***********************************************************************************************************************

 dump no.  123 on file inpr     nps =  1892391715     coll =   131558209646     ctm =   146441.97   nrn =    
 1110339050014

 ***********************************************************************************************************************

 dump no.  124 on file inpr     nps =  1907925465     coll =   132638332305     ctm =   147642.31   nrn =    
 1119455006116

 ***********************************************************************************************************************

 dump no.  125 on file inpr     nps =  1923469965     coll =   133718611822     ctm =   148842.64   nrn =    
 1128572357648

 ***********************************************************************************************************************

 dump no.  126 on file inpr     nps =  1939010165     coll =   134798531649     ctm =   150043.04   nrn =    
 1137686906180

 ***********************************************************************************************************************

 dump no.  127 on file inpr     nps =  1954537035     coll =   135879310480     ctm =   151243.40   nrn =    
 1146807683958

 ***********************************************************************************************************************

 dump no.  128 on file inpr     nps =  1970078570     coll =   136959318117     ctm =   152443.68   nrn =    
 1155922509645

 ***********************************************************************************************************************

 dump no.  129 on file inpr     nps =  1985562870     coll =   138039571661     ctm =   153643.89   nrn =    
 1165038806026

 ***********************************************************************************************************************

 dump no.  130 on file inpr     nps =  2001101135     coll =   139119862791     ctm =   154844.35   nrn =    
 1174156440200

 ***********************************************************************************************************************

 dump no.  131 on file inpr     nps =  2016635960     coll =   140200613573     ctm =   156044.77   nrn =    
 1183277141938

 ***********************************************************************************************************************

 dump no.  132 on file inpr     nps =  2032162830     coll =   141280830375     ctm =   157245.08   nrn =    
 1192393547483

 ***********************************************************************************************************************

 dump no.  133 on file inpr     nps =  2047672715     coll =   142361193250     ctm =   158445.32   nrn =    
 1201510776486

 ***********************************************************************************************************************

 dump no.  134 on file inpr     nps =  2063212700     coll =   143441560305     ctm =   159645.66   nrn =    
 1210629345512

 ***********************************************************************************************************************

 dump no.  135 on file inpr     nps =  2078761715     coll =   144521732742     ctm =   160846.10   nrn =    
 1219746290216

 ***********************************************************************************************************************

 dump no.  136 on file inpr     nps =  2094283855     coll =   145602170186     ctm =   162046.44   nrn =    
 1228864375455

 ***********************************************************************************************************************

 dump no.  137 on file inpr     nps =  2109820230     coll =   146682467306     ctm =   163246.81   nrn =    
 1237982142228

 ***********************************************************************************************************************

 dump no.  138 on file inpr     nps =  2125347530     coll =   147763307397     ctm =   164447.15   nrn =    
 1247103449693

 ***********************************************************************************************************************

 dump no.  139 on file inpr     nps =  2140896545     coll =   148843561217     ctm =   165647.51   nrn =    
 1256220886797

 ***********************************************************************************************************************

 dump no.  140 on file inpr     nps =  2156412880     coll =   149924339230     ctm =   166847.91   nrn =    
 1265341602484

 ***********************************************************************************************************************

 dump no.  141 on file inpr     nps =  2171943835     coll =   151004679212     ctm =   168048.19   nrn =    
 1274459814018

 ***********************************************************************************************************************

 dump no.  142 on file inpr     nps =  2187454795     coll =   152084839593     ctm =   169248.44   nrn =    
 1283575533565

 ***********************************************************************************************************************

 dump no.  143 on file inpr     nps =  2203000155     coll =   153164689535     ctm =   170448.80   nrn =    
 1292690580252

 ***********************************************************************************************************************

 dump no.  144 on file inpr     nps =  2218530680     coll =   154244765998     ctm =   171649.11   nrn =    
 1301806187871

 ***********************************************************************************************************************

 dump no.  145 on file inpr     nps =  2234087050     coll =   155324657448     ctm =   172849.44   nrn =    
 1310921406097

 ***********************************************************************************************************************

 dump no.  146 on file inpr     nps =  2249583605     coll =   156405063984     ctm =   174049.69   nrn =    
 1320038588589

 ***********************************************************************************************************************

 dump no.  147 on file inpr     nps =  2265132405     coll =   157485082920     ctm =   175250.05   nrn =    
 1329154534951

 ***********************************************************************************************************************

 dump no.  148 on file inpr     nps =  2280653040     coll =   158565717451     ctm =   176450.48   nrn =    
 1338274001709

 ***********************************************************************************************************************

 dump no.  149 on file inpr     nps =  2296225920     coll =   159645456201     ctm =   177650.76   nrn =    
 1347387713409

 ***********************************************************************************************************************

 dump no.  150 on file inpr     nps =  2311761820     coll =   160725628644     ctm =   178851.06   nrn =    
 1356504230396

 ***********************************************************************************************************************

 dump no.  151 on file inpr     nps =  2327253000     coll =   161806804525     ctm =   180051.46   nrn =    
 1365626543805

 ***********************************************************************************************************************

 dump no.  152 on file inpr     nps =  2342793415     coll =   162886649364     ctm =   181251.73   nrn =    
 1374741007678

 ***********************************************************************************************************************

 dump no.  153 on file inpr     nps =  2358310825     coll =   163967249245     ctm =   182452.09   nrn =    
 1383859685777

 ***********************************************************************************************************************

 dump no.  154 on file inpr     nps =  2373849135     coll =   165047555472     ctm =   183652.43   nrn =    
 1392976199752

 ***********************************************************************************************************************

 dump no.  155 on file inpr     nps =  2389416425     coll =   166127173143     ctm =   184852.85   nrn =    
 1402090039282

 ***********************************************************************************************************************

 dump no.  156 on file inpr     nps =  2404959850     coll =   167207133936     ctm =   186053.19   nrn =    
 1411204829238

 ***********************************************************************************************************************

 dump no.  157 on file inpr     nps =  2420503060     coll =   168287144686     ctm =   187253.57   nrn =    
 1420320065369

 ***********************************************************************************************************************

 dump no.  158 on file inpr     nps =  2436002840     coll =   169367699681     ctm =   188453.82   nrn =    
 1429439106555

 ***********************************************************************************************************************

 dump no.  159 on file inpr     nps =  2451541535     coll =   170448045380     ctm =   189654.22   nrn =    
 1438556922858

 ***********************************************************************************************************************

 dump no.  160 on file inpr     nps =  2467082165     coll =   171528131138     ctm =   190854.64   nrn =    
 1447672765323

 ***********************************************************************************************************************

 dump no.  161 on file inpr     nps =  2482620860     coll =   172608064267     ctm =   192055.01   nrn =    
 1456787723500

 ***********************************************************************************************************************

 dump no.  162 on file inpr     nps =  2498167985     coll =   173688224298     ctm =   193255.30   nrn =    
 1465904562668

 ***********************************************************************************************************************

 dump no.  163 on file inpr     nps =  2513709905     coll =   174768367377     ctm =   194455.74   nrn =    
 1475021036175

 ***********************************************************************************************************************

 dump no.  164 on file inpr     nps =  2529258705     coll =   175848241781     ctm =   195656.11   nrn =    
 1484135578987

 ***********************************************************************************************************************

 dump no.  165 on file inpr     nps =  2544801485     coll =   176928290139     ctm =   196856.55   nrn =    
 1493251314922

 ***********************************************************************************************************************

 dump no.  166 on file inpr     nps =  2560338675     coll =   178008272871     ctm =   198056.84   nrn =    
 1502366831780

 ***********************************************************************************************************************

 dump no.  167 on file inpr     nps =  2575924670     coll =   179087935551     ctm =   199257.24   nrn =    
 1511480741754
1problem summary                                                                                                           

      run terminated when it had used*****  minutes of computer time.
+                                                                                                    08/07/17 02:37:10 
      c //-------------------------------------------------------------------------//      probid =  08/06/17 18:17:13 

 neutron creation    tracks      weight        energy            neutron loss        tracks      weight        energy
                                 (per source particle)                                           (per source particle)

 source          2585544200    1.0000E+00    1.4100E+01          escape          7320308278    1.0262E+00    9.1692E+00
 nucl. interaction        0    0.            0.                  energy cutoff            0    0.            0.        
 particle decay           0    0.            0.                  time cutoff              0    0.            0.        
 weight window  11175736299    2.9361E-01    1.9447E-01          weight window   6958008558    2.9358E-01    1.9444E-01
 cell importance          0    0.            0.                  cell importance          0    0.            0.        
 weight cutoff            0    0.            0.                  weight cutoff            0    0.            0.        
 e or t importance        0    0.            0.                  e or t importance        0    0.            0.        
 dxtran                   0    0.            0.                  dxtran                   0    0.            0.        
 forced collisions        0    0.            0.                  forced collisions        0    0.            0.        
 exp. transform           0    0.            0.                  exp. transform           0    0.            0.        
 upscattering             0    0.            1.1000E-10          downscattering           0    0.            2.7608E+00
 photonuclear             0    0.            0.                  capture                 61    8.2524E-02    9.0178E-01
 (n,xn)          1034072796    2.1735E-01    2.5670E-01          loss to (n,xn)   517036398    1.0868E-01    1.5250E+00
 prompt fission           0    0.            0.                  loss to fission          0    0.            0.        
 delayed fission          0    0.            0.                  nucl. interaction        0    0.            0.        
 prompt photofis          0    0.            0.                  particle decay           0    0.            0.        
 tabular boundary         0    0.            0.                  tabular boundary         0    0.            0.        
 tabular sampling         0    0.            0.                  elastic scatter          0    0.            0.        
     total      14795353295    1.5110E+00    1.4551E+01              total      14795353295    1.5110E+00    1.4551E+01

   number of neutrons banked             -1503434072        average time of (shakes)              cutoffs
   neutron tracks per source particle     5.7223E+00          escape            5.0000E+06          tco   2.0000E+07
   neutron collisions per source particle 6.9524E+01          capture           5.0005E+06          eco   0.0000E+00
   total neutron collisions              -2147483648          capture or escape 5.0001E+06          wc1  -5.0000E-01
   net multiplication              1.1087E+00 0.0000          any termination   4.5965E+06          wc2  -2.5000E-01

 computer time so far in this run200003.25 minutes            maximum number ever in bank        33
 computer time in mcrun          200000.39 minutes            bank overflows to backup file       0
 source particles per minute            1.2928E+04
 random numbers generated            1517124331542            most random numbers used was     1742179 in history  1943444323
 
  warning.   random number stride   152917 exceeded    32695 times.
 
  warning.  random number period exceeded.  decrease stride.

 range of sampled source weights = 9.9017E-01 to 1.0100E+00

 number of histories processed by each thread
   122461503   129300122   129345390   129854112   129300819   129116772   129967513   130111307   129232825   129182533
   129903095   129917559   129145258   128798783   130023190   128998945   130190349   130382211   129978967   130332947
 
  warning.  some of the geometry is covered by a weight window mesh.
1neutron  activity in each cell                                                                         print table 126

                       tracks     population   collisions   collisions     number        flux        average      average
              cell    entering                               * weight     weighted     weighted   track weight   track mfp
                                                          (per history)    energy       energy     (relative)      (cm)

        1        1  8629297247   7739345382     39944913    4.5414E-03   3.1994E+00   9.9069E+00   4.5229E-01   1.1405E+04
        2        2  8618232873   7522038317  15810335877    1.3259E+00   1.1132E+00   6.3567E+00   2.7647E-01   4.2414E+00
        3        3  3571584601  11126977994 163769724168    4.8836E+00   1.4399E-01   2.0921E+00   8.2870E-02   7.9465E+00
        4        4    89358130     72216997    133248038    6.5895E-04   1.5131E-02   2.1232E-01   1.1691E-02   6.5962E+00
        5       10   150672725    193608134       416391    2.4025E-07   3.9325E-02   2.6238E-01   1.5286E-03   5.3245E+03
        6       11   221340696    262941120       539395    3.3668E-07   5.0904E-02   3.3521E-01   1.6523E-03   5.5963E+03
        7       12   520087500    620222934      1304806    7.9489E-07   3.9789E-02   2.8744E-01   1.6071E-03   5.3967E+03
        8       13   217185022    258968340       529312    3.3621E-07   5.0927E-02   3.3542E-01   1.6805E-03   5.5967E+03
        9       14   262833096    292623565       590888    4.0788E-07   5.5662E-02   3.5449E-01   1.8285E-03   5.6806E+03

           total   22280591890  28088942783 179756633788    6.2147E+00

1tally        4        nps =  2585544200
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      10                                                                                   
                         4.00000E+03
 
 cell  10                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 2.76095E-07 0.0002   2.91285E-12 0.0505   0.00000E+00 0.0000   0.00000E+00 0.0000   0.00000E+00 0.0000
 
         time:       2.0000E+07             total                                                                  
                 0.00000E+00 0.0000   2.76098E-07 0.0002


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally        4

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00      yes          no            constant    random       2.29
 passed?        yes          yes      yes          yes             yes      yes          no               yes        yes          no

 ===================================================================================================================================


 warning.  the tally in the tally fluctuation chart bin did not pass  2 of the 10 statistical checks.

1analysis of the results in the tally fluctuation chart bin (tfc) for tally        4 with nps =  2585544200  print table 160


 normed average tally per history  = 2.76098E-07          unnormed average tally per history  = 1.10439E-03
 estimated tally relative error    = 0.0002               estimated variance of the variance  = 0.0003
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =    51966915          efficiency for the nonzero tallies  = 0.0201
 history number of largest  tally  =  1095790622          largest  unnormalized history tally = 5.80674E+01
 (largest  tally)/(average tally)  = 5.25786E+04          (largest  tally)/(avg nonzero tally)= 1.05678E+03

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 2.76098E-07


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            2.76098E-07             2.76103E-07                     0.000020
      relative error                  1.96001E-04             1.97049E-04                     0.005347
      variance of the variance        3.34443E-04             4.40772E-04                     0.317927
      shifted center                  2.76098E-07             2.76098E-07                     0.000000
      figure of merit                 1.30153E+02             1.28772E+02                    -0.010609

 the estimated inverse power slope of the 198 largest  tallies starting at 2.50772E+00 is 2.2897
 the history score probability density function appears to have an unsampled region at the largest  history scores:
 please examine. see print table 161.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (1.293E+04)*( 1.003E-01)**2 = (1.293E+04)*(1.007E-02) = 1.302E+02

1unnormed tally density for tally        4          nonzero tally mean(m) = 5.495E-02   nps =  2585544200  print table 161

 abscissa              ordinate   log plot of tally probability density function in tally fluctuation chart bin(d=decade,slope= 2.3)
  tally  number num den log den:d--------d--------d---------d--------d---------d--------d---------d--------d---------d--------d-----
 2.00-09      1 5.25-01  -0.280 *********|********|*********|********|*********|********|*********|********|*********|********|*****
 3.16-09      0 0.00+00   0.000          |        |         |        |         |        |         |        |         |        |     
 5.01-09      2 4.18-01  -0.379 *********|********|*********|********|*********|********|*********|********|*********|********|**** 
 7.94-09      0 0.00+00   0.000          |        |         |        |         |        |         |        |         |        |     
 1.26-08      3 2.50-01  -0.603 *********|********|*********|********|*********|********|*********|********|*********|********|**   
 2.00-08      2 1.05-01  -0.979 *********|********|*********|********|*********|********|*********|********|*********|******* |     
 3.16-08      5 1.66-01  -0.781 *********|********|*********|********|*********|********|*********|********|*********|********|     
 5.01-08      7 1.46-01  -0.835 *********|********|*********|********|*********|********|*********|********|*********|********|     
 7.94-08     16 2.11-01  -0.676 *********|********|*********|********|*********|********|*********|********|*********|********|*    
 1.26-07     19 1.58-01  -0.801 *********|********|*********|********|*********|********|*********|********|*********|********|     
 2.00-07     34 1.79-01  -0.748 *********|********|*********|********|*********|********|*********|********|*********|********|*    
 3.16-07     57 1.89-01  -0.724 *********|********|*********|********|*********|********|*********|********|*********|********|*    
 5.01-07    108 2.26-01  -0.646 *********|********|*********|********|*********|********|*********|********|*********|********|**   
 7.94-07    156 2.06-01  -0.687 *********|********|*********|********|*********|********|*********|********|*********|********|*    
 1.26-06    235 1.96-01  -0.709 *********|********|*********|********|*********|********|*********|********|*********|********|*    
 2.00-06    415 2.18-01  -0.662 *********|********|*********|********|*********|********|*********|********|*********|********|*    
 3.16-06    615 2.04-01  -0.691 *********|********|*********|********|*********|********|*********|********|*********|********|*    
 5.01-06    996 2.08-01  -0.681 *********|********|*********|********|*********|********|*********|********|*********|********|*    
 7.94-06   1553 2.05-01  -0.688 *********|********|*********|********|*********|********|*********|********|*********|********|*    
 1.26-05   2455 2.04-01  -0.690 *********|********|*********|********|*********|********|*********|********|*********|********|*    
 2.00-05   3843 2.02-01  -0.695 *********|********|*********|********|*********|********|*********|********|*********|********|*    
 3.16-05   6127 2.03-01  -0.692 *********|********|*********|********|*********|********|*********|********|*********|********|*    
 5.01-05   9663 2.02-01  -0.695 *********|********|*********|********|*********|********|*********|********|*********|********|*    
 7.94-05  15202 2.01-01  -0.698 *********|********|*********|********|*********|********|*********|********|*********|********|*    
 1.26-04  24241 2.02-01  -0.695 *********|********|*********|********|*********|********|*********|********|*********|********|*    
 2.00-04  38549 2.02-01  -0.694 *********|********|*********|********|*********|********|*********|********|*********|********|*    
 3.16-04  60481 2.00-01  -0.698 *********|********|*********|********|*********|********|*********|********|*********|********|*    
 5.01-04  95680 2.00-01  -0.699 *********|********|*********|********|*********|********|*********|********|*********|********|*    
 7.94-04 152031 2.01-01  -0.698 *********|********|*********|********|*********|********|*********|********|*********|********|*    
 1.26-03 240211 2.00-01  -0.699 *********|********|*********|********|*********|********|*********|********|*********|********|*    
 2.00-03 380047 2.00-01  -0.700 *********|********|*********|********|*********|********|*********|********|*********|********|*    
 3.16-03 600490 1.99-01  -0.701 *********|********|*********|********|*********|********|*********|********|*********|********|*    
 5.01-03 952984 1.99-01  -0.701 *********|********|*********|********|*********|********|*********|********|*********|********|*    
 7.94-03 1.5+06 2.01-01  -0.697 *********|********|*********|********|*********|********|*********|********|*********|********|*    
 1.26-02 2.7+06 2.27-01  -0.644 *********|********|*********|********|*********|********|*********|********|*********|********|**   
 2.00-02 5.6+06 2.95-01  -0.530 *********|********|*********|********|*********|********|*********|********|*********|********|***  
 3.16-02 8.1+06 2.69-01  -0.569 *********|********|*********|********|*********|********|*********|********|*********|********|**   
 5.01-02 1.0+07 2.16-01  -0.665 *********|********|*********|********|*********|********|*********|********|*********|********|*    
 7.94-02 9.8+06 1.30-01  -0.887 mmmmmmmmm|mmmmmmmm|mmmmmmmmm|mmmmmmmm|mmmmmmmmm|mmmmmmmm|mmmmmmmmm|mmmmmmmm|mmmmmmmmm|mmmmmmmm|     
 1.26-01 6.9+06 5.71-02  -1.243 *********|********|*********|********|*********|********|*********|********|*********|*****   |     
 2.00-01 3.3+06 1.72-02  -1.764 *********|********|*********|********|*********|********|*********|********|*********|        |     
 3.16-01 906748 3.01-03  -2.522 *********|********|*********|********|*********|********|*********|********|***      |        |     
 5.01-01 152029 3.18-04  -3.498 *********|********|*********|********|*********|********|*********|**      |         |        |     
 7.94-01  21089 2.78-05  -4.556 *********|********|*********|********|*********|********|**       |        |         |        |     
 1.26+00   3786 3.15-06  -5.501 *********|********|*********|********|*********|**      |         |        |         |        |     
 2.00+00    862 4.53-07  -6.344 *********|********|*********|********|****     |        |         |        |         |        |     
 3.16+00    260 8.62-08  -7.065 *********|********|*********|******  |      s  |        |         |        |         |        |     
 5.01+00     73 1.53-08  -7.816 *********|********|*********|        |   s     |        |         |        |         |        |     
 7.94+00     19 2.51-09  -8.601 *********|********|**       |        s         |        |         |        |         |        |     
 1.26+01     17 1.42-09  -8.849 *********|********|         |     s  |         |        |         |        |         |        |     
 2.00+01      1 5.25-11 -10.280 *****    |        |         | s      |         |        |         |        |         |        |     
 3.16+01      4 1.33-10  -9.878 *********|        |       s |        |         |        |         |        |         |        |     
 5.01+01      1 2.09-11 -10.680 *        |        |  s      |        |         |        |         |        |         |        |     
 6.31+01      3 8.94-11 -10.049 *******  |        s         |        |         |        |         |        |         |        |     
  total 5.20+07 2.01-02         d--------d--------d---------d--------d---------d--------d---------d--------d---------d--------d-----

1tally       14        nps =  2585544200
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      11                                                                                   
                         4.00000E+03
 
 cell  11                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 4.03663E-07 0.0002   4.34893E-12 0.0455   0.00000E+00 0.0000   0.00000E+00 0.0000   0.00000E+00 0.0000
 
         time:       2.0000E+07             total                                                                  
                 0.00000E+00 0.0000   4.03667E-07 0.0002


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       14

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00       no           no            0.03       no          no            constant    random       2.76
 passed?        yes          yes       no           no             yes       no          no               yes        yes          no

 ===================================================================================================================================


 warning.  the tally in the tally fluctuation chart bin did not pass  5 of the 10 statistical checks.

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       14 with nps =  2585544200  print table 160


 normed average tally per history  = 4.03667E-07          unnormed average tally per history  = 1.61467E-03
 estimated tally relative error    = 0.0002               estimated variance of the variance  = 0.0346
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =    66447453          efficiency for the nonzero tallies  = 0.0257
 history number of largest  tally  =  1621837713          largest  unnormalized history tally = 3.46654E+02
 (largest  tally)/(average tally)  = 2.14691E+05          (largest  tally)/(avg nonzero tally)= 5.51746E+03

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 4.03670E-07


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            4.03667E-07             4.03700E-07                     0.000083
      relative error                  1.92561E-04             2.09683E-04                     0.088920
      variance of the variance        3.46143E-02             4.91939E-02                     0.421203
      shifted center                  4.03670E-07             4.03672E-07                     0.000005
      figure of merit                 1.34845E+02             1.13721E+02                    -0.156650

 the estimated inverse power slope of the 200 largest  tallies starting at 3.95441E+00 is 2.7584
 the history score probability density function appears to have an unsampled region at the largest  history scores:
 please examine. see print table 161.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (1.293E+04)*( 1.021E-01)**2 = (1.293E+04)*(1.043E-02) = 1.348E+02

1unnormed tally density for tally       14          nonzero tally mean(m) = 6.283E-02   nps =  2585544200  print table 161

 abscissa              ordinate   log plot of tally probability density function in tally fluctuation chart bin(d=decade,slope= 2.8)
  tally  number num den log den:d------d-------d-------d------d-------d-------d-------d-------d-------d------d-------d-------d------
 3.98-11      1 1.95+01   1.290 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|*******|******
 7.94-11      0 0.00+00   0.000        |       |       |      |       |       |       |       |       |      |       |       |      
 1.58-10      0 0.00+00   0.000        |       |       |      |       |       |       |       |       |      |       |       |      
 3.16-10      0 0.00+00   0.000        |       |       |      |       |       |       |       |       |      |       |       |      
 6.31-10      0 0.00+00   0.000        |       |       |      |       |       |       |       |       |      |       |       |      
 1.26-09      1 6.16-01  -0.210 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|**     |      
 2.51-09      1 3.09-01  -0.510 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 5.01-09      1 1.55-01  -0.810 *******|*******|*******|******|*******|*******|*******|*******|*******|******|****** |       |      
 1.00-08      2 1.55-01  -0.809 *******|*******|*******|******|*******|*******|*******|*******|*******|******|****** |       |      
 2.00-08      4 1.55-01  -0.808 *******|*******|*******|******|*******|*******|*******|*******|*******|******|****** |       |      
 3.98-08     15 2.92-01  -0.534 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 7.94-08     20 1.95-01  -0.709 *******|*******|*******|******|*******|*******|*******|*******|*******|******|****** |       |      
 1.58-07     33 1.61-01  -0.792 *******|*******|*******|******|*******|*******|*******|*******|*******|******|****** |       |      
 3.16-07     92 2.26-01  -0.647 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 6.31-07    190 2.33-01  -0.632 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 1.26-06    389 2.40-01  -0.621 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 2.51-06    723 2.23-01  -0.651 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 5.01-06   1401 2.17-01  -0.664 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 1.00-05   2781 2.16-01  -0.666 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 2.00-05   5658 2.20-01  -0.658 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 3.98-05  11354 2.21-01  -0.655 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 7.94-05  22751 2.22-01  -0.653 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 1.58-04  44933 2.20-01  -0.658 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 3.16-04  90141 2.21-01  -0.656 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 6.31-04 179515 2.21-01  -0.656 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 1.26-03 356702 2.20-01  -0.658 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 2.51-03 712489 2.20-01  -0.658 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 5.01-03 1.4+06 2.20-01  -0.657 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 1.00-02 2.9+06 2.27-01  -0.645 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 2.00-02 8.1+06 3.16-01  -0.501 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 3.98-02 1.6+07 3.05-01  -0.515 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 7.94-02 1.9+07 1.88-01  -0.725 mmmmmmm|mmmmmmm|mmmmmmm|mmmmmm|mmmmmmm|mmmmmmm|mmmmmmm|mmmmmmm|mmmmmmm|mmmmmm|mmmmmm |       |      
 1.58-01 1.3+07 6.45-02  -1.190 *******|*******|*******|******|*******|*******|*******|*******|*******|******|***    |       |      
 3.16-01 3.9+06 9.62-03  -2.017 *******|*******|*******|******|*******|*******|*******|*******|*******|***   |       |       |      
 6.31-01 421840 5.18-04  -3.285 *******|*******|*******|******|*******|*******|*******|*******|*      |      |       |       |      
 1.26+00  27285 1.68-05  -4.775 *******|*******|*******|******|*******|*******|*****  |       |       |      |       |       |      
 2.51+00   2832 8.74-07  -6.058 *******|*******|*******|******|*******|***    |       |       |       |      |       |       |      
 5.01+00    472 7.30-08  -7.137 *******|*******|*******|******|***    |    s  |       |       |       |      |       |       |      
 1.00+01     79 6.13-09  -8.213 *******|*******|*******|*     |       |s      |       |       |       |      |       |       |      
 2.00+01     30 1.17-09  -8.933 *******|*******|****   |      |   s   |       |       |       |       |      |       |       |      
 3.98+01      2 3.90-11 -10.409 *******|       |       |     s|       |       |       |       |       |      |       |       |      
 7.94+01      1 9.76-12 -11.010 ***    |       |       s      |       |       |       |       |       |      |       |       |      
 1.58+02      0 0.00+00   0.000        |       |s      |      |       |       |       |       |       |      |       |       |      
 3.16+02      0 0.00+00   0.000        |  s    |       |      |       |       |       |       |       |      |       |       |      
 3.98+02      1 4.72-12 -11.326 *    s |       |       |      |       |       |       |       |       |      |       |       |      
  total 6.64+07 2.57-02         d------d-------d-------d------d-------d-------d-------d-------d-------d------d-------d-------d------

1tally       24        nps =  2585544200
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      12                                                                                   
                         4.00000E+03
 
 cell  12                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 9.18855E-07 0.0001   1.14147E-11 0.0288   0.00000E+00 0.0000   0.00000E+00 0.0000   0.00000E+00 0.0000
 
         time:       2.0000E+07             total                                                                  
                 0.00000E+00 0.0000   9.18867E-07 0.0001


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       24

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00       no          no            constant    random       2.46
 passed?        yes          yes      yes          yes             yes       no          no               yes        yes          no

 ===================================================================================================================================


 warning.  the tally in the tally fluctuation chart bin did not pass  3 of the 10 statistical checks.

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       24 with nps =  2585544200  print table 160


 normed average tally per history  = 9.18867E-07          unnormed average tally per history  = 3.67547E-03
 estimated tally relative error    = 0.0001               estimated variance of the variance  = 0.0000
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =   135668319          efficiency for the nonzero tallies  = 0.0525
 history number of largest  tally  =  1905629390          largest  unnormalized history tally = 5.93042E+01
 (largest  tally)/(average tally)  = 1.61352E+04          (largest  tally)/(avg nonzero tally)= 8.46641E+02

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 9.18867E-07


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            9.18867E-07             9.18872E-07                     0.000006
      relative error                  1.16750E-04             1.16916E-04                     0.001421
      variance of the variance        1.38206E-05             2.18566E-05                     0.581447
      shifted center                  9.18867E-07             9.18867E-07                     0.000000
      figure of merit                 3.66820E+02             3.65779E+02                    -0.002836

 the estimated inverse power slope of the 200 largest  tallies starting at 3.42265E+00 is 2.4619
 the large score tail of the empirical history score probability density function appears to have no unsampled regions.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (1.293E+04)*( 1.684E-01)**2 = (1.293E+04)*(2.837E-02) = 3.668E+02

1unnormed tally density for tally       24          nonzero tally mean(m) = 7.005E-02   nps =  2585544200  print table 161

 abscissa              ordinate   log plot of tally probability density function in tally fluctuation chart bin(d=decade,slope= 2.5)
  tally  number num den log den:d-------d--------d--------d--------d--------d--------d--------d--------d--------d--------d--------d-
 7.94-10      2 2.64+00   0.421 ********|********|********|********|********|********|********|********|********|********|********|*
 1.26-09      1 8.32-01  -0.080 ********|********|********|********|********|********|********|********|********|********|*****   | 
 2.00-09      0 0.00+00   0.000         |        |        |        |        |        |        |        |        |        |        | 
 3.16-09      0 0.00+00   0.000         |        |        |        |        |        |        |        |        |        |        | 
 5.01-09      0 0.00+00   0.000         |        |        |        |        |        |        |        |        |        |        | 
 7.94-09      1 1.32-01  -0.880 ********|********|********|********|********|********|********|********|********|******* |        | 
 1.26-08      5 4.16-01  -0.381 ********|********|********|********|********|********|********|********|********|********|***     | 
 2.00-08     13 6.83-01  -0.166 ********|********|********|********|********|********|********|********|********|********|*****   | 
 3.16-08     11 3.65-01  -0.438 ********|********|********|********|********|********|********|********|********|********|**      | 
 5.01-08     20 4.18-01  -0.379 ********|********|********|********|********|********|********|********|********|********|***     | 
 7.94-08     35 4.62-01  -0.336 ********|********|********|********|********|********|********|********|********|********|***     | 
 1.26-07     38 3.16-01  -0.500 ********|********|********|********|********|********|********|********|********|********|**      | 
 2.00-07     67 3.52-01  -0.454 ********|********|********|********|********|********|********|********|********|********|**      | 
 3.16-07    100 3.31-01  -0.480 ********|********|********|********|********|********|********|********|********|********|**      | 
 5.01-07    166 3.47-01  -0.460 ********|********|********|********|********|********|********|********|********|********|**      | 
 7.94-07    253 3.34-01  -0.477 ********|********|********|********|********|********|********|********|********|********|**      | 
 1.26-06    396 3.30-01  -0.482 ********|********|********|********|********|********|********|********|********|********|**      | 
 2.00-06    698 3.67-01  -0.436 ********|********|********|********|********|********|********|********|********|********|**      | 
 3.16-06   1029 3.41-01  -0.467 ********|********|********|********|********|********|********|********|********|********|**      | 
 5.01-06   1682 3.52-01  -0.454 ********|********|********|********|********|********|********|********|********|********|**      | 
 7.94-06   2744 3.62-01  -0.441 ********|********|********|********|********|********|********|********|********|********|**      | 
 1.26-05   4196 3.49-01  -0.457 ********|********|********|********|********|********|********|********|********|********|**      | 
 2.00-05   6633 3.48-01  -0.458 ********|********|********|********|********|********|********|********|********|********|**      | 
 3.16-05  10694 3.54-01  -0.450 ********|********|********|********|********|********|********|********|********|********|**      | 
 5.01-05  16884 3.53-01  -0.452 ********|********|********|********|********|********|********|********|********|********|**      | 
 7.94-05  26583 3.51-01  -0.455 ********|********|********|********|********|********|********|********|********|********|**      | 
 1.26-04  42513 3.54-01  -0.451 ********|********|********|********|********|********|********|********|********|********|**      | 
 2.00-04  67620 3.55-01  -0.450 ********|********|********|********|********|********|********|********|********|********|**      | 
 3.16-04 106698 3.54-01  -0.451 ********|********|********|********|********|********|********|********|********|********|**      | 
 5.01-04 168547 3.52-01  -0.453 ********|********|********|********|********|********|********|********|********|********|**      | 
 7.94-04 267590 3.53-01  -0.452 ********|********|********|********|********|********|********|********|********|********|**      | 
 1.26-03 424888 3.54-01  -0.451 ********|********|********|********|********|********|********|********|********|********|**      | 
 2.00-03 673412 3.54-01  -0.451 ********|********|********|********|********|********|********|********|********|********|**      | 
 3.16-03 1.1+06 3.55-01  -0.449 ********|********|********|********|********|********|********|********|********|********|**      | 
 5.01-03 1.7+06 3.60-01  -0.443 ********|********|********|********|********|********|********|********|********|********|**      | 
 7.94-03 2.8+06 3.69-01  -0.433 ********|********|********|********|********|********|********|********|********|********|**      | 
 1.26-02 5.1+06 4.21-01  -0.376 ********|********|********|********|********|********|********|********|********|********|***     | 
 2.00-02 1.1+07 6.02-01  -0.220 ********|********|********|********|********|********|********|********|********|********|****    | 
 3.16-02 1.8+07 5.81-01  -0.236 ********|********|********|********|********|********|********|********|********|********|****    | 
 5.01-02 2.5+07 5.18-01  -0.286 ********|********|********|********|********|********|********|********|********|********|****    | 
 7.94-02 2.7+07 3.56-01  -0.449 mmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmm|mm      | 
 1.26-01 2.3+07 1.88-01  -0.725 ********|********|********|********|********|********|********|********|********|********|        | 
 2.00-01 1.4+07 7.19-02  -1.143 ********|********|********|********|********|********|********|********|********|*****   |        | 
 3.16-01 5.0+06 1.65-02  -1.782 ********|********|********|********|********|********|********|********|********|        |        | 
 5.01-01 1.0+06 2.11-03  -2.676 ********|********|********|********|********|********|********|********|        |        |        | 
 7.94-01 136262 1.80-04  -3.745 ********|********|********|********|********|********|********|        |        |        |        | 
 1.26+00  19627 1.63-05  -4.787 ********|********|********|********|********|********|        |        |        |        |        | 
 2.00+00   3874 2.03-06  -5.691 ********|********|********|********|********|        |        |        |        |        |        | 
 3.16+00    940 3.12-07  -6.507 ********|********|********|********|*       |        |        |        |        |        |        | 
 5.01+00    199 4.16-08  -7.381 ********|********|********|**      |  s     |        |        |        |        |        |        | 
 7.94+00     38 5.01-09  -8.300 ********|********|***     |        s        |        |        |        |        |        |        | 
 1.26+01     10 8.32-10  -9.080 ********|*****   |        |    s   |        |        |        |        |        |        |        | 
 2.00+01      6 3.15-10  -9.501 ********|*       |        |s       |        |        |        |        |        |        |        | 
 3.16+01      2 6.63-11 -10.179 ****    |        |     s  |        |        |        |        |        |        |        |        | 
 5.01+01      2 4.18-11 -10.379 **      |        |s       |        |        |        |        |        |        |        |        | 
 6.31+01      1 2.98-11 -10.526 *       |      s |        |        |        |        |        |        |        |        |        | 
  total 1.36+08 5.25-02         d-------d--------d--------d--------d--------d--------d--------d--------d--------d--------d--------d-

1tally       34        nps =  2585544200
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      13                                                                                   
                         4.00000E+03
 
 cell  13                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 4.03632E-07 0.0002   4.26851E-12 0.0442   0.00000E+00 0.0000   0.00000E+00 0.0000   0.00000E+00 0.0000
 
         time:       2.0000E+07             total                                                                  
                 0.00000E+00 0.0000   4.03637E-07 0.0002


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       34

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00       no          no            constant    random       2.55
 passed?        yes          yes      yes          yes             yes       no          no               yes        yes          no

 ===================================================================================================================================


 warning.  the tally in the tally fluctuation chart bin did not pass  3 of the 10 statistical checks.

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       34 with nps =  2585544200  print table 160


 normed average tally per history  = 4.03637E-07          unnormed average tally per history  = 1.61455E-03
 estimated tally relative error    = 0.0002               estimated variance of the variance  = 0.0048
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =    65588045          efficiency for the nonzero tallies  = 0.0254
 history number of largest  tally  =  2483516041          largest  unnormalized history tally = 1.98883E+02
 (largest  tally)/(average tally)  = 1.23182E+05          (largest  tally)/(avg nonzero tally)= 3.12479E+03

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 4.03637E-07


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            4.03637E-07             4.03656E-07                     0.000048
      relative error                  1.81456E-04             1.87598E-04                     0.033844
      variance of the variance        4.82825E-03             8.38448E-03                     0.736545
      shifted center                  4.03637E-07             4.03638E-07                     0.000001
      figure of merit                 1.51853E+02             1.42074E+02                    -0.064400

 the estimated inverse power slope of the 200 largest  tallies starting at 3.86419E+00 is 2.5466
 the history score probability density function appears to have an unsampled region at the largest  history scores:
 please examine. see print table 161.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (1.293E+04)*( 1.084E-01)**2 = (1.293E+04)*(1.175E-02) = 1.519E+02

1unnormed tally density for tally       34          nonzero tally mean(m) = 6.365E-02   nps =  2585544200  print table 161

 abscissa              ordinate   log plot of tally probability density function in tally fluctuation chart bin(d=decade,slope= 2.5)
  tally  number num den log den:d-------d---------d--------d---------d--------d--------d---------d--------d---------d--------d------
 3.98-09      1 2.63-01  -0.580 ********|*********|********|*********|********|********|*********|********|*********|********|***** 
 6.31-09      0 0.00+00   0.000         |         |        |         |        |        |         |        |         |        |      
 1.00-08      1 1.05-01  -0.980 ********|*********|********|*********|********|********|*********|********|*********|********|*     
 1.58-08      2 1.32-01  -0.879 ********|*********|********|*********|********|********|*********|********|*********|********|**    
 2.51-08      6 2.50-01  -0.601 ********|*********|********|*********|********|********|*********|********|*********|********|***** 
 3.98-08     12 3.16-01  -0.500 ********|*********|********|*********|********|********|*********|********|*********|********|******
 6.31-08     13 2.16-01  -0.666 ********|*********|********|*********|********|********|*********|********|*********|********|****  
 1.00-07     30 3.14-01  -0.503 ********|*********|********|*********|********|********|*********|********|*********|********|******
 1.58-07     35 2.31-01  -0.636 ********|*********|********|*********|********|********|*********|********|*********|********|***** 
 2.51-07     55 2.29-01  -0.639 ********|*********|********|*********|********|********|*********|********|*********|********|***** 
 3.98-07     80 2.11-01  -0.677 ********|*********|********|*********|********|********|*********|********|*********|********|****  
 6.31-07    132 2.19-01  -0.659 ********|*********|********|*********|********|********|*********|********|*********|********|****  
 1.00-06    197 2.06-01  -0.685 ********|*********|********|*********|********|********|*********|********|*********|********|****  
 1.58-06    321 2.12-01  -0.673 ********|*********|********|*********|********|********|*********|********|*********|********|****  
 2.51-06    497 2.07-01  -0.683 ********|*********|********|*********|********|********|*********|********|*********|********|****  
 3.98-06    909 2.39-01  -0.621 ********|*********|********|*********|********|********|*********|********|*********|********|***** 
 6.31-06   1272 2.11-01  -0.675 ********|*********|********|*********|********|********|*********|********|*********|********|****  
 1.00-05   2070 2.17-01  -0.664 ********|*********|********|*********|********|********|*********|********|*********|********|****  
 1.58-05   3203 2.12-01  -0.674 ********|*********|********|*********|********|********|*********|********|*********|********|****  
 2.51-05   5155 2.15-01  -0.667 ********|*********|********|*********|********|********|*********|********|*********|********|****  
 3.98-05   8175 2.15-01  -0.667 ********|*********|********|*********|********|********|*********|********|*********|********|****  
 6.31-05  12865 2.14-01  -0.670 ********|*********|********|*********|********|********|*********|********|*********|********|****  
 1.00-04  20694 2.17-01  -0.664 ********|*********|********|*********|********|********|*********|********|*********|********|****  
 1.58-04  32400 2.14-01  -0.669 ********|*********|********|*********|********|********|*********|********|*********|********|****  
 2.51-04  51381 2.14-01  -0.669 ********|*********|********|*********|********|********|*********|********|*********|********|****  
 3.98-04  82011 2.16-01  -0.666 ********|*********|********|*********|********|********|*********|********|*********|********|****  
 6.31-04 129133 2.14-01  -0.669 ********|*********|********|*********|********|********|*********|********|*********|********|****  
 1.00-03 205429 2.15-01  -0.667 ********|*********|********|*********|********|********|*********|********|*********|********|****  
 1.58-03 323875 2.14-01  -0.669 ********|*********|********|*********|********|********|*********|********|*********|********|****  
 2.51-03 513971 2.14-01  -0.669 ********|*********|********|*********|********|********|*********|********|*********|********|****  
 3.98-03 815421 2.15-01  -0.668 ********|*********|********|*********|********|********|*********|********|*********|********|****  
 6.31-03 1.3+06 2.16-01  -0.665 ********|*********|********|*********|********|********|*********|********|*********|********|****  
 1.00-02 2.1+06 2.21-01  -0.656 ********|*********|********|*********|********|********|*********|********|*********|********|****  
 1.58-02 4.2+06 2.79-01  -0.555 ********|*********|********|*********|********|********|*********|********|*********|********|***** 
 2.51-02 7.8+06 3.27-01  -0.485 ********|*********|********|*********|********|********|*********|********|*********|********|******
 3.98-02 1.1+07 2.92-01  -0.535 ********|*********|********|*********|********|********|*********|********|*********|********|******
 6.31-02 1.3+07 2.14-01  -0.670 ********|*********|********|*********|********|********|*********|********|*********|********|****  
 1.00-01 1.2+07 1.22-01  -0.912 mmmmmmmm|mmmmmmmmm|mmmmmmmm|mmmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmmm|mmmmmmmm|mmmmmmmmm|mmmmmmmm|mm    
 1.58-01 7.8+06 5.17-02  -1.286 ********|*********|********|*********|********|********|*********|********|*********|******* |      
 2.51-01 3.4+06 1.40-02  -1.854 ********|*********|********|*********|********|********|*********|********|*********|**      |      
 3.98-01 906476 2.39-03  -2.622 ********|*********|********|*********|********|********|*********|********|*****    |        |      
 6.31-01 154970 2.57-04  -3.589 ********|*********|********|*********|********|********|*********|*****   |         |        |      
 1.00+00  24421 2.56-05  -4.592 ********|*********|********|*********|********|********|*****    |        |         |        |      
 1.58+00   5000 3.31-06  -5.481 ********|*********|********|*********|********|******  |         |        |         |        |      
 2.51+00   1383 5.77-07  -6.239 ********|*********|********|*********|********|        |         |        |         |        |      
 3.98+00    342 9.00-08  -7.046 ********|*********|********|*********|        |s       |         |        |         |        |      
 6.31+00    109 1.81-08  -7.742 ********|*********|********|****     |      s |        |         |        |         |        |      
 1.00+01     44 4.61-09  -8.336 ********|*********|******* |         |   s    |        |         |        |         |        |      
 1.58+01     22 1.45-09  -8.837 ********|*********|***     |         s        |        |         |        |         |        |      
 2.51+01      8 3.34-10  -9.477 ********|*******  |        |     s   |        |        |         |        |         |        |      
 3.98+01      2 5.27-11 -10.279 ********|         |        | s       |        |        |         |        |         |        |      
 6.31+01      1 1.66-11 -10.780 ***     |         |     s  |         |        |        |         |        |         |        |      
 1.00+02      1 1.05-11 -10.980 *       |         | s      |         |        |        |         |        |         |        |      
 1.58+02      0 0.00+00   0.000         |      s  |        |         |        |        |         |        |         |        |      
 2.00+02      1 9.42-12 -11.026 *       |  s      |        |         |        |        |         |        |         |        |      
  total 6.56+07 2.54-02         d-------d---------d--------d---------d--------d--------d---------d--------d---------d--------d------

1tally       44        nps =  2585544200
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      14                                                                                   
                         4.00000E+03
 
 cell  14                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 4.97100E-07 0.0002   4.76740E-12 0.0447   0.00000E+00 0.0000   0.00000E+00 0.0000   0.00000E+00 0.0000
 
         time:       2.0000E+07             total                                                                  
                 0.00000E+00 0.0000   4.97105E-07 0.0002


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       44

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00      yes         yes            constant    random       2.59
 passed?        yes          yes      yes          yes             yes      yes         yes               yes        yes          no

 ===================================================================================================================================


 warning.  the tally in the tally fluctuation chart bin did not pass  1 of the 10 statistical checks.

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       44 with nps =  2585544200  print table 160


 normed average tally per history  = 4.97105E-07          unnormed average tally per history  = 1.98842E-03
 estimated tally relative error    = 0.0002               estimated variance of the variance  = 0.0002
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =    76538688          efficiency for the nonzero tallies  = 0.0296
 history number of largest  tally  =   579292617          largest  unnormalized history tally = 7.59621E+01
 (largest  tally)/(average tally)  = 3.82022E+04          (largest  tally)/(avg nonzero tally)= 1.13088E+03

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 4.97105E-07


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            4.97105E-07             4.97112E-07                     0.000015
      relative error                  1.62690E-04             1.63357E-04                     0.004101
      variance of the variance        1.74750E-04             2.38819E-04                     0.366628
      shifted center                  4.97105E-07             4.97105E-07                     0.000000
      figure of merit                 1.88908E+02             1.87368E+02                    -0.008151

 the estimated inverse power slope of the 200 largest  tallies starting at 4.48564E+00 is 2.5896
 the history score probability density function appears to have an unsampled region at the largest  history scores:
 please examine. see print table 161.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (1.293E+04)*( 1.209E-01)**2 = (1.293E+04)*(1.461E-02) = 1.889E+02

1unnormed tally density for tally       44          nonzero tally mean(m) = 6.717E-02   nps =  2585544200  print table 161

 abscissa              ordinate   log plot of tally probability density function in tally fluctuation chart bin(d=decade,slope= 2.6)
  tally  number num den log den:d--------d--------d---------d---------d---------d--------d---------d---------d--------d---------d---
 1.26-09      1 8.32-01  -0.080 *********|********|*********|*********|*********|********|*********|*********|********|*********|***
 2.00-09      0 0.00+00   0.000          |        |         |         |         |        |         |         |        |         |   
 3.16-09      0 0.00+00   0.000          |        |         |         |         |        |         |         |        |         |   
 5.01-09      1 2.09-01  -0.680 *********|********|*********|*********|*********|********|*********|*********|********|*******  |   
 7.94-09      3 3.96-01  -0.403 *********|********|*********|*********|*********|********|*********|*********|********|*********|   
 1.26-08      4 3.33-01  -0.478 *********|********|*********|*********|*********|********|*********|*********|********|*********|   
 2.00-08      4 2.10-01  -0.678 *********|********|*********|*********|*********|********|*********|*********|********|*******  |   
 3.16-08      1 3.31-02  -1.480 *********|********|*********|*********|*********|********|*********|*********|********|         |   
 5.01-08     12 2.51-01  -0.600 *********|********|*********|*********|*********|********|*********|*********|********|******** |   
 7.94-08     13 1.72-01  -0.766 *********|********|*********|*********|*********|********|*********|*********|********|******   |   
 1.26-07     21 1.75-01  -0.757 *********|********|*********|*********|*********|********|*********|*********|********|******   |   
 2.00-07     59 3.10-01  -0.509 *********|********|*********|*********|*********|********|*********|*********|********|*********|   
 3.16-07     68 2.25-01  -0.647 *********|********|*********|*********|*********|********|*********|*********|********|*******  |   
 5.01-07    100 2.09-01  -0.680 *********|********|*********|*********|*********|********|*********|*********|********|*******  |   
 7.94-07    163 2.15-01  -0.667 *********|********|*********|*********|*********|********|*********|*********|********|*******  |   
 1.26-06    261 2.17-01  -0.663 *********|********|*********|*********|*********|********|*********|*********|********|*******  |   
 2.00-06    422 2.22-01  -0.654 *********|********|*********|*********|*********|********|*********|*********|********|*******  |   
 3.16-06    714 2.37-01  -0.626 *********|********|*********|*********|*********|********|*********|*********|********|******** |   
 5.01-06   1083 2.26-01  -0.645 *********|********|*********|*********|*********|********|*********|*********|********|******** |   
 7.94-06   1696 2.24-01  -0.650 *********|********|*********|*********|*********|********|*********|*********|********|*******  |   
 1.26-05   2683 2.23-01  -0.651 *********|********|*********|*********|*********|********|*********|*********|********|*******  |   
 2.00-05   4483 2.35-01  -0.628 *********|********|*********|*********|*********|********|*********|*********|********|******** |   
 3.16-05   6901 2.29-01  -0.641 *********|********|*********|*********|*********|********|*********|*********|********|******** |   
 5.01-05  11000 2.30-01  -0.638 *********|********|*********|*********|*********|********|*********|*********|********|******** |   
 7.94-05  17589 2.32-01  -0.634 *********|********|*********|*********|*********|********|*********|*********|********|******** |   
 1.26-04  27983 2.33-01  -0.633 *********|********|*********|*********|*********|********|*********|*********|********|******** |   
 2.00-04  44117 2.32-01  -0.635 *********|********|*********|*********|*********|********|*********|*********|********|******** |   
 3.16-04  70049 2.32-01  -0.634 *********|********|*********|*********|*********|********|*********|*********|********|******** |   
 5.01-04 110866 2.32-01  -0.635 *********|********|*********|*********|*********|********|*********|*********|********|******** |   
 7.94-04 174539 2.30-01  -0.638 *********|********|*********|*********|*********|********|*********|*********|********|******** |   
 1.26-03 277104 2.31-01  -0.637 *********|********|*********|*********|*********|********|*********|*********|********|******** |   
 2.00-03 437960 2.30-01  -0.638 *********|********|*********|*********|*********|********|*********|*********|********|******** |   
 3.16-03 694414 2.30-01  -0.638 *********|********|*********|*********|*********|********|*********|*********|********|******** |   
 5.01-03 1.1+06 2.31-01  -0.636 *********|********|*********|*********|*********|********|*********|*********|********|******** |   
 7.94-03 1.8+06 2.35-01  -0.629 *********|********|*********|*********|*********|********|*********|*********|********|******** |   
 1.26-02 3.1+06 2.58-01  -0.589 *********|********|*********|*********|*********|********|*********|*********|********|******** |   
 2.00-02 6.7+06 3.51-01  -0.455 *********|********|*********|*********|*********|********|*********|*********|********|*********|   
 3.16-02 1.0+07 3.42-01  -0.466 *********|********|*********|*********|*********|********|*********|*********|********|*********|   
 5.01-02 1.4+07 2.97-01  -0.528 *********|********|*********|*********|*********|********|*********|*********|********|*********|   
 7.94-02 1.5+07 2.00-01  -0.699 mmmmmmmmm|mmmmmmmm|mmmmmmmmm|mmmmmmmmm|mmmmmmmmm|mmmmmmmm|mmmmmmmmm|mmmmmmmmm|mmmmmmmm|mmmmmmm  |   
 1.26-01 1.2+07 1.01-01  -0.994 *********|********|*********|*********|*********|********|*********|*********|********|****     |   
 2.00-01 7.0+06 3.69-02  -1.433 *********|********|*********|*********|*********|********|*********|*********|********|         |   
 3.16-01 2.5+06 8.31-03  -2.081 *********|********|*********|*********|*********|********|*********|*********|***     |         |   
 5.01-01 535608 1.12-03  -2.951 *********|********|*********|*********|*********|********|*********|****     |        |         |   
 7.94-01  83688 1.10-04  -3.957 *********|********|*********|*********|*********|********|****     |         |        |         |   
 1.26+00  14631 1.22-05  -4.914 *********|********|*********|*********|*********|****    |         |         |        |         |   
 2.00+00   3320 1.74-06  -5.758 *********|********|*********|*********|******   |        |         |         |        |         |   
 3.16+00    994 3.29-07  -6.482 *********|********|*********|*********|         |        |         |         |        |         |   
 5.01+00    297 6.21-08  -7.207 *********|********|*********|**       | s       |        |         |         |        |         |   
 7.94+00     85 1.12-08  -7.950 *********|********|*****    |        s|         |        |         |         |        |         |   
 1.26+01     41 3.41-09  -8.467 *********|********|         |     s   |         |        |         |         |        |         |   
 2.00+01     17 8.93-10  -9.049 *********|***     |         | s       |         |        |         |         |        |         |   
 3.16+01      3 9.94-11 -10.003 ****     |        |      s  |         |         |        |         |         |        |         |   
 5.01+01      3 6.27-11 -10.203 **       |        |  s      |         |         |        |         |         |        |         |   
 7.94+01      4 5.28-11 -10.278 *        |      s |         |         |         |        |         |         |        |         |   
  total 7.65+07 2.96-02         d--------d--------d---------d---------d---------d--------d---------d---------d--------d---------d---

1status of the statistical checks used to form confidence intervals for the mean for each tally bin


 tally   result of statistical checks for the tfc bin (the first check not passed is listed) and error magnitude check for all bins

        4   missed  2 of 10 tfc bin checks: the variance of the variance appears not to decrease as 1/nps for the last half of problem
         passed all bin error check:     7 tally bins had     4 bins with zeros and     0 bins with relative errors exceeding 0.10

       14   missed  5 of 10 tfc bin checks: the relative error does not monotonically decrease over the last half of the problem      
         passed all bin error check:     7 tally bins had     4 bins with zeros and     0 bins with relative errors exceeding 0.10

       24   missed  3 of 10 tfc bin checks: the variance of the variance does not monotonically decrease over the last half of problem
         passed all bin error check:     7 tally bins had     4 bins with zeros and     0 bins with relative errors exceeding 0.10

       34   missed  3 of 10 tfc bin checks: the variance of the variance does not monotonically decrease over the last half of problem
         passed all bin error check:     7 tally bins had     4 bins with zeros and     0 bins with relative errors exceeding 0.10

       44   missed  1 of 10 tfc bin checks: the slope of decrease of largest tallies is less than the minimum acceptable value of 3.0 
         passed all bin error check:     7 tally bins had     4 bins with zeros and     0 bins with relative errors exceeding 0.10


 the 10 statistical checks are only for the tally fluctuation chart bin and do not apply to other tally bins.

 the tally bins with zeros may or may not be correct: compare the source, cutoffs, multipliers, et cetera with the tally bins.

 warning.       5 of the     5 tally fluctuation chart bins did not pass all 10 statistical checks.
1tally fluctuation charts                              

                            tally        4                          tally       14                          tally       24
          nps      mean     error   vov  slope    fom      mean     error   vov  slope    fom      mean     error   vov  slope    fom
    131072000   2.7585E-07 0.0008 0.0000  3.3     136   4.0371E-07 0.0008 0.0004  3.0     164   9.1840E-07 0.0005 0.0000  4.4     367
    262144000   2.7598E-07 0.0006 0.0068  3.0     124   4.0324E-07 0.0005 0.0001  3.0     165   9.1851E-07 0.0004 0.0000  4.6     367
    393216000   2.7604E-07 0.0005 0.0032  2.9     128   4.0347E-07 0.0004 0.0001  3.2     166   9.1853E-07 0.0003 0.0000  3.6     365
    524288000   2.7597E-07 0.0004 0.0038  2.5     124   4.0351E-07 0.0004 0.0001  3.1     165   9.1860E-07 0.0003 0.0000  3.4     366
    655360000   2.7607E-07 0.0004 0.0029  2.4     122   4.0356E-07 0.0003 0.0000  3.0     166   9.1859E-07 0.0002 0.0000  2.8     366
    786432000   2.7605E-07 0.0004 0.0021  2.4     124   4.0363E-07 0.0003 0.0000  3.4     166   9.1858E-07 0.0002 0.0000  3.0     367
    917504000   2.7606E-07 0.0003 0.0015  2.4     126   4.0366E-07 0.0003 0.0000  3.6     166   9.1871E-07 0.0002 0.0000  3.4     368
   1048576000   2.7603E-07 0.0003 0.0012  2.4     127   4.0364E-07 0.0003 0.0000  3.6     166   9.1870E-07 0.0002 0.0000  3.6     368
   1179648000   2.7607E-07 0.0003 0.0014  2.3     125   4.0361E-07 0.0003 0.0000  3.5     166   9.1874E-07 0.0002 0.0000  3.5     368
   1310720000   2.7607E-07 0.0003 0.0012  2.2     126   4.0359E-07 0.0002 0.0000  3.0     166   9.1875E-07 0.0002 0.0000  3.1     367
   1441792000   2.7604E-07 0.0003 0.0010  2.1     127   4.0362E-07 0.0002 0.0000  3.2     166   9.1875E-07 0.0002 0.0000  3.2     368
   1572864000   2.7608E-07 0.0003 0.0008  2.2     127   4.0360E-07 0.0002 0.0000  3.2     166   9.1878E-07 0.0001 0.0000  3.1     368
   1703936000   2.7609E-07 0.0002 0.0007  2.3     128   4.0365E-07 0.0002 0.0667  2.8     123   9.1880E-07 0.0001 0.0000  3.0     368
   1835008000   2.7609E-07 0.0002 0.0006  2.2     128   4.0367E-07 0.0002 0.0597  2.8     126   9.1882E-07 0.0001 0.0000  3.0     368
   1966080000   2.7607E-07 0.0002 0.0006  2.3     129   4.0366E-07 0.0002 0.0539  3.0     128   9.1881E-07 0.0001 0.0000  2.7     367
   2097152000   2.7609E-07 0.0002 0.0005  2.2     129   4.0366E-07 0.0002 0.0488  3.0     130   9.1882E-07 0.0001 0.0000  2.7     367
   2228224000   2.7609E-07 0.0002 0.0004  2.2     130   4.0366E-07 0.0002 0.0445  3.0     132   9.1882E-07 0.0001 0.0000  2.7     367
   2359296000   2.7610E-07 0.0002 0.0004  2.2     130   4.0367E-07 0.0002 0.0405  2.9     133   9.1888E-07 0.0001 0.0000  2.6     367
   2490368000   2.7610E-07 0.0002 0.0004  2.3     130   4.0367E-07 0.0002 0.0372  2.9     135   9.1891E-07 0.0001 0.0000  2.5     367
   2585544200   2.7610E-07 0.0002 0.0003  2.3     130   4.0367E-07 0.0002 0.0346  2.8     135   9.1887E-07 0.0001 0.0000  2.5     367
 

                            tally       34                          tally       44
          nps      mean     error   vov  slope    fom      mean     error   vov  slope    fom
    131072000   4.0354E-07 0.0008 0.0187  3.1     143   4.9738E-07 0.0007 0.0053  3.2     180
    262144000   4.0336E-07 0.0006 0.0054  3.0     154   4.9727E-07 0.0005 0.0014  3.1     187
    393216000   4.0358E-07 0.0005 0.0031  2.9     154   4.9714E-07 0.0004 0.0007  2.9     189
    524288000   4.0365E-07 0.0004 0.0018  2.7     156   4.9717E-07 0.0004 0.0004  2.9     191
    655360000   4.0373E-07 0.0004 0.0012  2.7     158   4.9716E-07 0.0003 0.0013  2.8     185
    786432000   4.0361E-07 0.0003 0.0008  2.5     159   4.9709E-07 0.0003 0.0009  2.8     187
    917504000   4.0372E-07 0.0003 0.0006  2.6     160   4.9712E-07 0.0003 0.0007  2.5     187
   1048576000   4.0370E-07 0.0003 0.0005  2.8     160   4.9711E-07 0.0003 0.0005  2.6     188
   1179648000   4.0364E-07 0.0003 0.0004  2.8     161   4.9716E-07 0.0002 0.0004  2.5     187
   1310720000   4.0367E-07 0.0002 0.0003  3.1     161   4.9719E-07 0.0002 0.0006  2.4     186
   1441792000   4.0363E-07 0.0002 0.0003  3.2     162   4.9711E-07 0.0002 0.0005  2.4     186
   1572864000   4.0361E-07 0.0002 0.0002  3.1     162   4.9713E-07 0.0002 0.0004  2.5     187
   1703936000   4.0359E-07 0.0002 0.0002  3.0     162   4.9712E-07 0.0002 0.0003  2.4     188
   1835008000   4.0360E-07 0.0002 0.0002  2.9     162   4.9713E-07 0.0002 0.0003  2.5     188
   1966080000   4.0360E-07 0.0002 0.0001  3.0     163   4.9712E-07 0.0002 0.0003  2.5     189
   2097152000   4.0361E-07 0.0002 0.0001  2.8     162   4.9712E-07 0.0002 0.0003  2.5     188
   2228224000   4.0363E-07 0.0002 0.0001  2.9     163   4.9710E-07 0.0002 0.0002  2.7     188
   2359296000   4.0363E-07 0.0002 0.0001  3.0     163   4.9712E-07 0.0002 0.0002  2.5     188
   2490368000   4.0363E-07 0.0002 0.0052  2.5     151   4.9712E-07 0.0002 0.0002  2.5     189
   2585544200   4.0364E-07 0.0002 0.0048  2.5     152   4.9711E-07 0.0002 0.0002  2.6     189

 ***********************************************************************************************************************

 dump no.  168 on file inpr     nps =  2585544200     coll =   179756659218     ctm =   200000.39   nrn =    
 1517124331542

        16 warning messages so far.


 run terminated when it had used*****  minutes of computer time.

 computer time =******** minutes

 mcnp     version 6     06/19/14                     08/07/17 02:37:10                     probid =  08/06/17 18:17:13 
