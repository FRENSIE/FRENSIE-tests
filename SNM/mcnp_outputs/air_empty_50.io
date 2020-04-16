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
  
1mcnp     version 6     ld=06/19/14                     08/06/17 01:34:53 
 *************************************************************************                 probid =  08/06/17 01:34:53 
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
        36-        4   1  -0.001205   -4                         $ HEU sphere (~10kg -> 5cm)      
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
       153-       sb1    4.70892e-01 5.29108e-01                                                  
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
       220-       wwp:n 5.0 j 100 j -1 0 2.229848329e-01                                          
 
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
        4        4        1  4.98947E-05 1.20500E-03 5.23599E+02 6.30937E-01           1  1.0000E+00                                   
        5       10        1  4.98947E-05 1.20500E-03 4.00000E+03 4.82000E+00           0  1.0000E+00                                   
        6       11        1  4.98947E-05 1.20500E-03 4.00000E+03 4.82000E+00           0  1.0000E+00                                   
        7       12        1  4.98947E-05 1.20500E-03 4.00000E+03 4.82000E+00           0  1.0000E+00                                   
        8       13        1  4.98947E-05 1.20500E-03 4.00000E+03 4.82000E+00           0  1.0000E+00                                   
        9       14        1  4.98947E-05 1.20500E-03 4.00000E+03 4.82000E+00           0  1.0000E+00                                   
       10       99        0  0.00000E+00 0.00000E+00 0.00000E+00 0.00000E+00           0  0.0000E+00                                   

 total                                               2.37552E+06 1.26367E+06

    minimum source weight = 9.4499E-01    maximum source weight = 1.0618E+00

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

         4 warning messages so far.
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

         5 warning messages so far.

 ***********************************************************************************************************************

 dump no.    2 on file inpr     nps =   115262400     coll =      224433852     ctm =     1200.36   nrn =       
 3432079234

 ***********************************************************************************************************************

 dump no.    3 on file inpr     nps =   230544000     coll =      448911423     ctm =     2400.86   nrn =       
 6864729365

 ***********************************************************************************************************************

 dump no.    4 on file inpr     nps =   345848000     coll =      673436522     ctm =     3601.22   nrn =      
 10298027155

 ***********************************************************************************************************************

 dump no.    5 on file inpr     nps =   460301090     coll =      896291322     ctm =     4801.53   nrn =      
 13705899760

 ***********************************************************************************************************************

 dump no.    6 on file inpr     nps =   575632750     coll =     1120858945     ctm =     6001.89   nrn =      
 17139817252

 ***********************************************************************************************************************

 dump no.    7 on file inpr     nps =   690942833     coll =     1345349819     ctm =     7202.29   nrn =      
 20572835769

 ***********************************************************************************************************************

 dump no.    8 on file inpr     nps =   805694292     coll =     1568746830     ctm =     8402.61   nrn =      
 23989046607

 ***********************************************************************************************************************

 dump no.    9 on file inpr     nps =   920976454     coll =     1793297940     ctm =     9602.98   nrn =      
 27422444960

 ***********************************************************************************************************************

 dump no.   10 on file inpr     nps =  1036227832     coll =     2017695493     ctm =    10803.33   nrn =      
 30853865040

 ***********************************************************************************************************************

 dump no.   11 on file inpr     nps =  1151005026     coll =     2241275190     ctm =    12003.70   nrn =      
 34272201219

 ***********************************************************************************************************************

 dump no.   12 on file inpr     nps =  1266280796     coll =     2465785720     ctm =    13203.98   nrn =      
 37705050853

 ***********************************************************************************************************************

 dump no.   13 on file inpr     nps =  1381591300     coll =     2690328966     ctm =    14404.21   nrn =      
 41138555091

 ***********************************************************************************************************************

 dump no.   14 on file inpr     nps =  1496891040     coll =     2914927346     ctm =    15604.58   nrn =      
 44572604023

 ***********************************************************************************************************************

 dump no.   15 on file inpr     nps =  1611629882     coll =     3138380024     ctm =    16804.92   nrn =      
 47989397526

 ***********************************************************************************************************************

 dump no.   16 on file inpr     nps =  1726872094     coll =     3362833382     ctm =    18005.28   nrn =      
 51421282609

 ***********************************************************************************************************************

 dump no.   17 on file inpr     nps =  1842107914     coll =     3587190918     ctm =    19205.57   nrn =      
 54852103657

 ***********************************************************************************************************************

 dump no.   18 on file inpr     nps =  1956673328     coll =     3810335523     ctm =    20406.05   nrn =      
 58263842207

 ***********************************************************************************************************************

 dump no.   19 on file inpr     nps =  2071925128     coll =     4034808637     ctm =    21606.34   nrn =      
 61696171558

 ***********************************************************************************************************************

 dump no.   20 on file inpr     nps =  2187188114     coll =     4259305072     ctm =    22806.68   nrn =      
 65128754114

 ***********************************************************************************************************************

 dump no.   21 on file inpr     nps =  2301934946     coll =     4482829667     ctm =    24006.96   nrn =      
 68546281976

 ***********************************************************************************************************************

 dump no.   22 on file inpr     nps =  2417209118     coll =     4707335365     ctm =    25207.23   nrn =      
 71978988910

 ***********************************************************************************************************************

 dump no.   23 on file inpr     nps =  2532496074     coll =     4931858915     ctm =    26407.60   nrn =      
 75412161037

 ***********************************************************************************************************************

 dump no.   24 on file inpr     nps =  2647789422     coll =     5156367251     ctm =    27607.92   nrn =      
 78845187385

 ***********************************************************************************************************************

 dump no.   25 on file inpr     nps =  2762543400     coll =     5379798538     ctm =    28808.29   nrn =      
 82261732592

 ***********************************************************************************************************************

 dump no.   26 on file inpr     nps =  2877787964     coll =     5604228952     ctm =    30008.64   nrn =      
 85693498916

 ***********************************************************************************************************************

 dump no.   27 on file inpr     nps =  2992986276     coll =     5828656745     ctm =    31208.89   nrn =      
 89124817150

 ***********************************************************************************************************************

 dump no.   28 on file inpr     nps =  3107784998     coll =     6052161782     ctm =    32409.24   nrn =      
 92542630353

 ***********************************************************************************************************************

 dump no.   29 on file inpr     nps =  3223066406     coll =     6276645362     ctm =    33609.50   nrn =      
 95975418232

 ***********************************************************************************************************************

 dump no.   30 on file inpr     nps =  3338326950     coll =     6501087392     ctm =    34809.80   nrn =      
 99407323565

 ***********************************************************************************************************************

 dump no.   31 on file inpr     nps =  3452900444     coll =     6724124515     ctm =    36010.04   nrn =     
 102818190485

 ***********************************************************************************************************************

 dump no.   32 on file inpr     nps =  3568223310     coll =     6948696696     ctm =    37210.47   nrn =     
 106252031350

 ***********************************************************************************************************************

 dump no.   33 on file inpr     nps =  3683514306     coll =     7173212600     ctm =    38410.81   nrn =     
 109685105108

 ***********************************************************************************************************************

 dump no.   34 on file inpr     nps =  3798733302     coll =     7397608039     ctm =    39611.13   nrn =     
 113116182679

 ***********************************************************************************************************************

 dump no.   35 on file inpr     nps =  3913506456     coll =     7621062402     ctm =    40811.52   nrn =     
 116533226753

 ***********************************************************************************************************************

 dump no.   36 on file inpr     nps =  4028786266     coll =     7845510928     ctm =    42011.84   nrn =     
 119965508296

 ***********************************************************************************************************************

 dump no.   37 on file inpr     nps =  4144050006     coll =     8069928002     ctm =    43212.19   nrn =     
 123397673330

 ***********************************************************************************************************************

 dump no.   38 on file inpr     nps =  4258829642     coll =     8293525484     ctm =    44412.68   nrn =     
 126816250117

 ***********************************************************************************************************************

 dump no.   39 on file inpr     nps =  4374107764     coll =     8517895735     ctm =    45612.99   nrn =     
 130247593843

 ***********************************************************************************************************************

 dump no.   40 on file inpr     nps =  4489363604     coll =     8742369075     ctm =    46813.37   nrn =     
 133679860814

 ***********************************************************************************************************************

 dump no.   41 on file inpr     nps =  4604096808     coll =     8965752354     ctm =    48013.68   nrn =     
 137095846631

 ***********************************************************************************************************************

 dump no.   42 on file inpr     nps =  4719344658     coll =     9190145484     ctm =    49214.07   nrn =     
 140527266835

 ***********************************************************************************************************************

 dump no.   43 on file inpr     nps =  4834600408     coll =     9414685299     ctm =    50414.50   nrn =     
 143960169543

 ***********************************************************************************************************************

 dump no.   44 on file inpr     nps =  4949873736     coll =     9639128161     ctm =    51614.87   nrn =     
 147392224652

 ***********************************************************************************************************************

 dump no.   45 on file inpr     nps =  5064560688     coll =     9862358962     ctm =    52815.22   nrn =     
 150806225753

 ***********************************************************************************************************************

 dump no.   46 on file inpr     nps =  5179835614     coll =    10086809628     ctm =    54015.56   nrn =     
 154238448368

 ***********************************************************************************************************************

 dump no.   47 on file inpr     nps =  5295091454     coll =    10311153298     ctm =    55215.87   nrn =     
 157669414909

 ***********************************************************************************************************************

 dump no.   48 on file inpr     nps =  5409810276     coll =    10534684937     ctm =    56416.20   nrn =     
 161086834312

 ***********************************************************************************************************************

 dump no.   49 on file inpr     nps =  5525038860     coll =    10759089886     ctm =    57616.48   nrn =     
 164518177554

 ***********************************************************************************************************************

 dump no.   50 on file inpr     nps =  5640243474     coll =    10983601969     ctm =    58816.81   nrn =     
 167950419271

 ***********************************************************************************************************************

 dump no.   51 on file inpr     nps =  5754955904     coll =    11206997780     ctm =    60017.13   nrn =     
 171366344105

 ***********************************************************************************************************************

 dump no.   52 on file inpr     nps =  5870192658     coll =    11431489509     ctm =    61217.54   nrn =     
 174798594136

 ***********************************************************************************************************************

 dump no.   53 on file inpr     nps =  5985442016     coll =    11655935114     ctm =    62417.85   nrn =     
 178230494064

 ***********************************************************************************************************************

 dump no.   54 on file inpr     nps =  6100026606     coll =    11878975437     ctm =    63618.18   nrn =     
 181641484998

 ***********************************************************************************************************************

 dump no.   55 on file inpr     nps =  6212553687     coll =    12098094909     ctm =    64818.55   nrn =     
 184992215952

 ***********************************************************************************************************************

 dump no.   56 on file inpr     nps =  6327779765     coll =    12322522621     ctm =    66018.80   nrn =     
 188423805274

 ***********************************************************************************************************************

 dump no.   57 on file inpr     nps =  6442998524     coll =    12546973718     ctm =    67219.15   nrn =     
 191855454701

 ***********************************************************************************************************************

 dump no.   58 on file inpr     nps =  6557696661     coll =    12770270288     ctm =    68419.52   nrn =     
 195270115396

 ***********************************************************************************************************************

 dump no.   59 on file inpr     nps =  6672940972     coll =    12994745704     ctm =    69619.83   nrn =     
 198702369912

 ***********************************************************************************************************************

 dump no.   60 on file inpr     nps =  6788178895     coll =    13219174175     ctm =    70820.15   nrn =     
 202133956806

 ***********************************************************************************************************************

 dump no.   61 on file inpr     nps =  6902889096     coll =    13442608939     ctm =    72020.50   nrn =     
 205550327163

 ***********************************************************************************************************************

 dump no.   62 on file inpr     nps =  7018096676     coll =    13666953724     ctm =    73220.84   nrn =     
 208980682132

 ***********************************************************************************************************************

 dump no.   63 on file inpr     nps =  7133275510     coll =    13891322413     ctm =    74421.16   nrn =     
 212411101059

 ***********************************************************************************************************************

 dump no.   64 on file inpr     nps =  7248471911     coll =    14115686282     ctm =    75621.48   nrn =     
 215841717095

 ***********************************************************************************************************************

 dump no.   65 on file inpr     nps =  7363182112     coll =    14339035158     ctm =    76821.83   nrn =     
 219257222839

 ***********************************************************************************************************************

 dump no.   66 on file inpr     nps =  7478284290     coll =    14563187636     ctm =    78022.09   nrn =     
 222684652858

 ***********************************************************************************************************************

 dump no.   67 on file inpr     nps =  7593490273     coll =    14787499451     ctm =    79222.45   nrn =     
 226114774013

 ***********************************************************************************************************************

 dump no.   68 on file inpr     nps =  7708233126     coll =    15011053851     ctm =    80422.75   nrn =     
 229532547741

 ***********************************************************************************************************************

 dump no.   69 on file inpr     nps =  7823453482     coll =    15235438927     ctm =    81623.05   nrn =     
 232963592851

 ***********************************************************************************************************************

 dump no.   70 on file inpr     nps =  7938669932     coll =    15459801017     ctm =    82823.45   nrn =     
 236394284287

 ***********************************************************************************************************************

 dump no.   71 on file inpr     nps =  8053376054     coll =    15683027630     ctm =    84023.83   nrn =     
 239808391864

 ***********************************************************************************************************************

 dump no.   72 on file inpr     nps =  8168583634     coll =    15907278726     ctm =    85224.19   nrn =     
 243238102643

 ***********************************************************************************************************************

 dump no.   73 on file inpr     nps =  8283818363     coll =    16131666181     ctm =    86424.54   nrn =     
 246669250131

 ***********************************************************************************************************************

 dump no.   74 on file inpr     nps =  8399026828     coll =    16356070303     ctm =    87624.87   nrn =     
 250100334831

 ***********************************************************************************************************************

 dump no.   75 on file inpr     nps =  8513592414     coll =    16579245197     ctm =    88825.21   nrn =     
 253512525890

 ***********************************************************************************************************************

 dump no.   76 on file inpr     nps =  8628796800     coll =    16803624365     ctm =    90025.58   nrn =     
 256943323715

 ***********************************************************************************************************************

 dump no.   77 on file inpr     nps =  8743908560     coll =    17027729513     ctm =    91225.89   nrn =     
 260370304278

 ***********************************************************************************************************************

 dump no.   78 on file inpr     nps =  8858598712     coll =    17251019541     ctm =    92426.24   nrn =     
 263784847084

 ***********************************************************************************************************************

 dump no.   79 on file inpr     nps =  8973816759     coll =    17475431082     ctm =    93626.61   nrn =     
 267216146009

 ***********************************************************************************************************************

 dump no.   80 on file inpr     nps =  9089032324     coll =    17699731321     ctm =    94826.89   nrn =     
 270646296337

 ***********************************************************************************************************************

 dump no.   81 on file inpr     nps =  9203647417     coll =    17922897691     ctm =    96027.19   nrn =     
 274058949546

 ***********************************************************************************************************************

 dump no.   82 on file inpr     nps =  9318878952     coll =    18147207424     ctm =    97227.56   nrn =     
 277489266284

 ***********************************************************************************************************************

 dump no.   83 on file inpr     nps =  9434105696     coll =    18371488561     ctm =    98427.90   nrn =     
 280919332113

 ***********************************************************************************************************************

 dump no.   84 on file inpr     nps =  9549333325     coll =    18595859650     ctm =    99628.24   nrn =     
 284350242169

 ***********************************************************************************************************************

 dump no.   85 on file inpr     nps =  9664052223     coll =    18819239148     ctm =   100828.53   nrn =     
 287766062681

 ***********************************************************************************************************************

 dump no.   86 on file inpr     nps =  9779237445     coll =    19043500863     ctm =   102028.86   nrn =     
 291195448637

 ***********************************************************************************************************************

 dump no.   87 on file inpr     nps =  9894403503     coll =    19267854068     ctm =   103229.13   nrn =     
 294625536630

 ***********************************************************************************************************************

 dump no.   88 on file inpr     nps = 10008751185     coll =    19490489859     ctm =   104429.49   nrn =     
 298030047697

 ***********************************************************************************************************************

 dump no.   89 on file inpr     nps = 10123949183     coll =    19714759917     ctm =   105629.75   nrn =     
 301459676162

 ***********************************************************************************************************************

 dump no.   90 on file inpr     nps = 10239126420     coll =    19939005274     ctm =   106830.07   nrn =     
 304888900058

 ***********************************************************************************************************************

 dump no.   91 on file inpr     nps = 10353779841     coll =    20162337915     ctm =   108030.40   nrn =     
 308303449310

 ***********************************************************************************************************************

 dump no.   92 on file inpr     nps = 10469001794     coll =    20386645167     ctm =   109230.83   nrn =     
 311733699221

 ***********************************************************************************************************************

 dump no.   93 on file inpr     nps = 10584194289     coll =    20610975536     ctm =   110431.23   nrn =     
 315163922774

 ***********************************************************************************************************************

 dump no.   94 on file inpr     nps = 10699397078     coll =    20835322350     ctm =   111631.49   nrn =     
 318594430593

 ***********************************************************************************************************************

 dump no.   95 on file inpr     nps = 10814122364     coll =    21058771074     ctm =   112831.82   nrn =     
 322010951061

 ***********************************************************************************************************************

 dump no.   96 on file inpr     nps = 10929355496     coll =    21283094483     ctm =   114032.18   nrn =     
 325441420865

 ***********************************************************************************************************************

 dump no.   97 on file inpr     nps = 11044521554     coll =    21507442521     ctm =   115232.42   nrn =     
 328871566629

 ***********************************************************************************************************************

 dump no.   98 on file inpr     nps = 11159277183     coll =    21730924152     ctm =   116432.77   nrn =     
 332288768139

 ***********************************************************************************************************************

 dump no.   99 on file inpr     nps = 11274497539     coll =    21955249749     ctm =   117633.15   nrn =     
 335719156787

 ***********************************************************************************************************************

 dump no.  100 on file inpr     nps = 11389693940     coll =    22179569536     ctm =   118833.55   nrn =     
 339149089459

 ***********************************************************************************************************************

 dump no.  101 on file inpr     nps = 11504168497     coll =    22402454139     ctm =   120033.92   nrn =     
 342557343134

 ***********************************************************************************************************************

 dump no.  102 on file inpr     nps = 11619374653     coll =    22626821492     ctm =   121234.25   nrn =     
 345987980928

 ***********************************************************************************************************************

 dump no.  103 on file inpr     nps = 11734598203     coll =    22851167652     ctm =   122434.54   nrn =     
 349418515674

 ***********************************************************************************************************************

 dump no.  104 on file inpr     nps = 11849772246     coll =    23075437109     ctm =   123634.88   nrn =     
 352848034612

 ***********************************************************************************************************************

 dump no.  105 on file inpr     nps = 11963047456     coll =    23296069584     ctm =   124835.21   nrn =     
 356221511852

 ***********************************************************************************************************************

 dump no.  106 on file inpr     nps = 12078272603     coll =    23520408915     ctm =   126035.54   nrn =     
 359652098577

 ***********************************************************************************************************************

 dump no.  107 on file inpr     nps = 12193484974     coll =    23744814063     ctm =   127235.83   nrn =     
 363083339080

 ***********************************************************************************************************************

 dump no.  108 on file inpr     nps = 12308200678     coll =    23968215853     ctm =   128436.27   nrn =     
 366499419960

 ***********************************************************************************************************************

 dump no.  109 on file inpr     nps = 12423413049     coll =    24192546722     ctm =   129636.56   nrn =     
 369929918558

 ***********************************************************************************************************************

 dump no.  110 on file inpr     nps = 12538577510     coll =    24416910182     ctm =   130836.87   nrn =     
 373360207666

 ***********************************************************************************************************************

 dump no.  111 on file inpr     nps = 12653320536     coll =    24640342751     ctm =   132037.28   nrn =     
 376776768709

 ***********************************************************************************************************************

 dump no.  112 on file inpr     nps = 12768595190     coll =    24864785370     ctm =   133237.64   nrn =     
 380208920921

 ***********************************************************************************************************************

 dump no.  113 on file inpr     nps = 12883842695     coll =    25089247685     ctm =   134437.92   nrn =     
 383640953251

 ***********************************************************************************************************************

 dump no.  114 on file inpr     nps = 12999114155     coll =    25313791860     ctm =   135638.22   nrn =     
 387074047632

 ***********************************************************************************************************************

 dump no.  115 on file inpr     nps = 13113837844     coll =    25537149217     ctm =   136838.58   nrn =     
 390489578274

 ***********************************************************************************************************************

 dump no.  116 on file inpr     nps = 13229125274     coll =    25761641856     ctm =   138038.99   nrn =     
 393922403883

 ***********************************************************************************************************************

 dump no.  117 on file inpr     nps = 13344380764     coll =    25986091068     ctm =   139239.31   nrn =     
 397354598301

 ***********************************************************************************************************************

 dump no.  118 on file inpr     nps = 13459122020     coll =    26209539170     ctm =   140439.68   nrn =     
 400771159617

 ***********************************************************************************************************************

 dump no.  119 on file inpr     nps = 13574398271     coll =    26433914427     ctm =   141639.98   nrn =     
 404202556957

 ***********************************************************************************************************************

 dump no.  120 on file inpr     nps = 13689625188     coll =    26658449315     ctm =   142840.28   nrn =     
 407635102382

 ***********************************************************************************************************************

 dump no.  121 on file inpr     nps = 13804289788     coll =    26881812710     ctm =   144040.65   nrn =     
 411050094071

 ***********************************************************************************************************************

 dump no.  122 on file inpr     nps = 13919524517     coll =    27106281155     ctm =   145241.03   nrn =     
 414482158728

 ***********************************************************************************************************************

 dump no.  123 on file inpr     nps = 14034799171     coll =    27330775742     ctm =   146441.39   nrn =     
 417914700545

 ***********************************************************************************************************************

 dump no.  124 on file inpr     nps = 14150048273     coll =    27555219771     ctm =   147641.71   nrn =     
 421346728436

 ***********************************************************************************************************************

 dump no.  125 on file inpr     nps = 14264700097     coll =    27778559413     ctm =   148842.03   nrn =     
 424761448487

 ***********************************************************************************************************************

 dump no.  126 on file inpr     nps = 14379961975     coll =    28002995912     ctm =   150042.35   nrn =     
 428193381947

 ***********************************************************************************************************************

 dump no.  127 on file inpr     nps = 14495174346     coll =    28227346298     ctm =   151242.61   nrn =     
 431623965176

 ***********************************************************************************************************************

 dump no.  128 on file inpr     nps = 14609915602     coll =    28450733047     ctm =   152442.98   nrn =     
 435040259572

 ***********************************************************************************************************************

 dump no.  129 on file inpr     nps = 14725187235     coll =    28675123935     ctm =   153643.28   nrn =     
 438471790393

 ***********************************************************************************************************************

 dump no.  130 on file inpr     nps = 14840463486     coll =    28899538486     ctm =   154843.57   nrn =     
 441903817896

 ***********************************************************************************************************************

 dump no.  131 on file inpr     nps = 14955276607     coll =    29123177061     ctm =   156043.90   nrn =     
 445323221640

 ***********************************************************************************************************************

 dump no.  132 on file inpr     nps = 15070520918     coll =    29347614416     ctm =   157244.17   nrn =     
 448755167618

 ***********************************************************************************************************************

 dump no.  133 on file inpr     nps = 15185738080     coll =    29572066930     ctm =   158444.52   nrn =     
 452186861841

 ***********************************************************************************************************************

 dump no.  134 on file inpr     nps = 15300976003     coll =    29796451973     ctm =   159644.91   nrn =     
 455618143471

 ***********************************************************************************************************************

 dump no.  135 on file inpr     nps = 15415678931     coll =    30019834951     ctm =   160845.22   nrn =     
 459033808152

 ***********************************************************************************************************************

 dump no.  136 on file inpr     nps = 15530921645     coll =    30244171163     ctm =   162045.51   nrn =     
 462464455056

 ***********************************************************************************************************************

 dump no.  137 on file inpr     nps = 15645447306     coll =    30467223478     ctm =   163245.82   nrn =     
 465874998194

 ***********************************************************************************************************************

 dump no.  138 on file inpr     nps = 15760161586     coll =    30690651799     ctm =   164446.13   nrn =     
 469291274411

 ***********************************************************************************************************************

 dump no.  139 on file inpr     nps = 15875410688     coll =    30915160769     ctm =   165646.39   nrn =     
 472723983723

 ***********************************************************************************************************************

 dump no.  140 on file inpr     nps = 15990653402     coll =    31139617308     ctm =   166846.74   nrn =     
 476156018306

 ***********************************************************************************************************************

 dump no.  141 on file inpr     nps = 16105401046     coll =    31363041026     ctm =   168047.05   nrn =     
 479572456846

 ***********************************************************************************************************************

 dump no.  142 on file inpr     nps = 16220653342     coll =    31587483695     ctm =   169247.45   nrn =     
 483004458582

 ***********************************************************************************************************************

 dump no.  143 on file inpr     nps = 16335809818     coll =    31811780493     ctm =   170447.73   nrn =     
 486434025050

 ***********************************************************************************************************************

 dump no.  144 on file inpr     nps = 16451106830     coll =    32036344413     ctm =   171648.06   nrn =     
 489867556761

 ***********************************************************************************************************************

 dump no.  145 on file inpr     nps = 16565913563     coll =    32259840338     ctm =   172848.43   nrn =     
 493285412535

 ***********************************************************************************************************************

 dump no.  146 on file inpr     nps = 16681228142     coll =    32484353319     ctm =   174048.73   nrn =     
 496718721620

 ***********************************************************************************************************************

 dump no.  147 on file inpr     nps = 16796504566     coll =    32708768234     ctm =   175249.04   nrn =     
 500150666062

 ***********************************************************************************************************************

 dump no.  148 on file inpr     nps = 16911218673     coll =    32932230334     ctm =   176449.34   nrn =     
 503567406869

 ***********************************************************************************************************************

 dump no.  149 on file inpr     nps = 17026522073     coll =    33156704274     ctm =   177649.61   nrn =     
 507000213463

 ***********************************************************************************************************************

 dump no.  150 on file inpr     nps = 17141799921     coll =    33381099076     ctm =   178849.90   nrn =     
 510431880657

 ***********************************************************************************************************************

 dump no.  151 on file inpr     nps = 17256499655     coll =    33604574170     ctm =   180050.24   nrn =     
 513848387193

 ***********************************************************************************************************************

 dump no.  152 on file inpr     nps = 17371803055     coll =    33829084250     ctm =   181250.46   nrn =     
 517285027453

 ***********************************************************************************************************************

 dump no.  153 on file inpr     nps = 17487117634     coll =    34053597341     ctm =   182450.70   nrn =     
 520718387705

 ***********************************************************************************************************************

 dump no.  154 on file inpr     nps = 17602422631     coll =    34278113461     ctm =   183651.00   nrn =     
 524151452581

 ***********************************************************************************************************************

 dump no.  155 on file inpr     nps = 17717222976     coll =    34501745625     ctm =   184851.30   nrn =     
 527570734072

 ***********************************************************************************************************************

 dump no.  156 on file inpr     nps = 17832513773     coll =    34726253338     ctm =   186051.62   nrn =     
 531003771413

 ***********************************************************************************************************************

 dump no.  157 on file inpr     nps = 17947809188     coll =    34950769391     ctm =   187251.91   nrn =     
 534436973498

 ***********************************************************************************************************************

 dump no.  158 on file inpr     nps = 18062413102     coll =    35173969024     ctm =   188452.23   nrn =     
 537849769851

 ***********************************************************************************************************************

 dump no.  159 on file inpr     nps = 18177700532     coll =    35398486186     ctm =   189652.56   nrn =     
 541282866178

 ***********************************************************************************************************************

 dump no.  160 on file inpr     nps = 18292545593     coll =    35622115977     ctm =   190852.85   nrn =     
 544702546295

 ***********************************************************************************************************************

 dump no.  161 on file inpr     nps = 18407226163     coll =    35845443309     ctm =   192053.22   nrn =     
 548117393525

 ***********************************************************************************************************************

 dump no.  162 on file inpr     nps = 18522513593     coll =    36069959168     ctm =   193253.65   nrn =     
 551550443177

 ***********************************************************************************************************************

 dump no.  163 on file inpr     nps = 18637781859     coll =    36294425721     ctm =   194453.97   nrn =     
 554982994152

 ***********************************************************************************************************************

 dump no.  164 on file inpr     nps = 18753035752     coll =    36518931689     ctm =   195654.21   nrn =     
 558415584868

 ***********************************************************************************************************************

 dump no.  165 on file inpr     nps = 18867591756     coll =    36742112313     ctm =   196854.56   nrn =     
 561827671291

 ***********************************************************************************************************************

 dump no.  166 on file inpr     nps = 18982871374     coll =    36966599794     ctm =   198054.80   nrn =     
 565260354211

 ***********************************************************************************************************************

 dump no.  167 on file inpr     nps = 19098149222     coll =    37191095647     ctm =   199255.17   nrn =     
 568693094967
1problem summary                                                                                                           

      run terminated when it had used*****  minutes of computer time.
+                                                                                                    08/06/17 09:54:41 
      c //-------------------------------------------------------------------------//      probid =  08/06/17 01:34:53 

 neutron creation    tracks      weight        energy            neutron loss        tracks      weight        energy
                                 (per source particle)                                           (per source particle)

 source         19169207737    1.0000E+00    1.4100E+01          escape         30504511428    1.0324E+00    1.0605E+01
 nucl. interaction        0    0.            0.                  energy cutoff            0    0.            0.        
 particle decay           0    0.            0.                  time cutoff              0    0.            0.        
 weight window  11124305602    1.8180E-02    9.0393E-02          weight window   1962048751    1.8182E-02    9.0397E-02
 cell importance          0    0.            0.                  cell importance          0    0.            0.        
 weight cutoff            0    0.            0.                  weight cutoff            0    0.            0.        
 e or t importance        0    0.            0.                  e or t importance        0    0.            0.        
 dxtran                   0    0.            0.                  dxtran                   0    0.            0.        
 forced collisions        0    0.            0.                  forced collisions        0    0.            0.        
 exp. transform           0    0.            0.                  exp. transform           0    0.            0.        
 upscattering             0    0.            1.7606E-14          downscattering           0    0.            1.8659E+00
 photonuclear             0    0.            0.                  capture                108    5.0096E-02    6.6579E-01
 (n,xn)          4346093896    1.6502E-01    1.9589E-01          loss to (n,xn)  2173046948    8.2508E-02    1.1597E+00
 prompt fission           0    0.            0.                  loss to fission          0    0.            0.        
 delayed fission          0    0.            0.                  nucl. interaction        0    0.            0.        
 prompt photofis          0    0.            0.                  particle decay           0    0.            0.        
 tabular boundary         0    0.            0.                  tabular boundary         0    0.            0.        
 tabular sampling         0    0.            0.                  elastic scatter          0    0.            0.        
     total      34639607235    1.1832E+00    1.4386E+01              total      34639607235    1.1832E+00    1.4386E+01

   number of neutrons banked             -1236647502        average time of (shakes)              cutoffs
   neutron tracks per source particle     1.8070E+00          escape            5.0000E+06          tco   2.0000E+07
   neutron collisions per source particle 1.9474E+00          capture           5.0000E+06          eco   0.0000E+00
   total neutron collisions              -2147483648          capture or escape 5.0000E+06          wc1  -5.0000E-01
   net multiplication              1.0825E+00 0.0000          any termination   4.6501E+06          wc2  -2.5000E-01

 computer time so far in this run200002.65 minutes            maximum number ever in bank        13
 computer time in mcrun          200000.46 minutes            bank overflows to backup file       0
 source particles per minute            9.5846E+04
 random numbers generated             570808874387            most random numbers used was     3596033 in history 17290241900
 
  warning.   random number stride   152917 exceeded        3 times.
 
  warning.  random number period exceeded.  decrease stride.

 range of sampled source weights = 9.4499E-01 to 1.0618E+00

 number of histories processed by each thread
   928346480   966450028   960983869   957675036   958849690   957297595   960639590   960737945   955158547   960893724
   957136584   959439421   961044508   958697472   963781308   957844166   956951010   960292115   962418246   964570403
 
  warning.  some of the geometry is covered by a weight window mesh.
1neutron  activity in each cell                                                                         print table 126

                       tracks     population   collisions   collisions     number        flux        average      average
              cell    entering                               * weight     weighted     weighted   track weight   track mfp
                                                          (per history)    energy       energy     (relative)      (cm)

        1        1 38666448193  30863563813    110951979    4.1448E-03   6.1819E+00   1.0896E+01   7.5479E-01   1.1968E+04
        2        2 18857866592  19613502767  37137642492    1.2416E+00   3.5025E+00   8.2607E+00   6.5665E-01   4.2403E+00
        3        3 11492193624   9021934857     75723548    2.6171E-03   3.1134E+00   7.8721E+00   7.1548E-01   1.1158E+04
        4        4    29319527     45482144        33782    6.9229E-07   2.3122E+00   6.7209E+00   4.0926E-01   1.0729E+04
        5       10   651068907    929347663       918783    2.3264E-06   2.4598E+00   6.4428E+00   4.9002E-02   1.0780E+04
        6       11   802273147   1021979890      1001946    2.7763E-06   2.6269E+00   6.7398E+00   5.3819E-02   1.0883E+04
        7       12   912453207   1211935746      1180370    3.3125E-06   2.5085E+00   6.5217E+00   5.4382E-02   1.0812E+04
        8       13   789116898   1007402201       985344    2.7766E-06   2.6279E+00   6.7407E+00   5.4734E-02   1.0883E+04
        9       14   885373900   1039765287      1019325    3.1232E-06   2.7393E+00   6.9280E+00   5.9636E-02   1.0947E+04

           total   73086113995  64754914368  37329457569    1.2483E+00

1tally        4        nps = 19169207737
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      10                                                                                   
                         4.00000E+03
 
 cell  10                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 5.54523E-06 0.0001   4.12174E-12 0.1227   0.00000E+00 0.0000   0.00000E+00 0.0000   0.00000E+00 0.0000
 
         time:       2.0000E+07             total                                                                  
                 0.00000E+00 0.0000   5.54524E-06 0.0001


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally        4

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00      yes         yes            constant    random       5.55
 passed?        yes          yes      yes          yes             yes      yes         yes               yes        yes         yes

 ===================================================================================================================================


 this tally meets the statistical criteria used to form confidence intervals: check the tally fluctuation chart to verify.
 the results in other bins associated with this tally may not meet these statistical criteria.

 ----- estimated confidence intervals:  -----

 estimated asymmetric confidence interval(1,2,3 sigma): 5.5446E-06 to 5.5459E-06; 5.5439E-06 to 5.5466E-06; 5.5432E-06 to 5.5473E-06
 estimated  symmetric confidence interval(1,2,3 sigma): 5.5446E-06 to 5.5459E-06; 5.5439E-06 to 5.5466E-06; 5.5432E-06 to 5.5473E-06

1analysis of the results in the tally fluctuation chart bin (tfc) for tally        4 with nps = 19169207737  print table 160


 normed average tally per history  = 5.54524E-06          unnormed average tally per history  = 2.21809E-02
 estimated tally relative error    = 0.0001               estimated variance of the variance  = 0.0000
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =   108073995          efficiency for the nonzero tallies  = 0.0056
 history number of largest  tally  = 10626091535          largest  unnormalized history tally = 9.31495E+01
 (largest  tally)/(average tally)  = 4.19953E+03          (largest  tally)/(avg nonzero tally)= 2.36765E+01

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 5.54524E-06


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            5.54524E-06             5.54524E-06                     0.000000
      relative error                  1.23703E-04             1.23703E-04                     0.000001
      variance of the variance        2.68187E-08             2.68284E-08                     0.000360
      shifted center                  5.54524E-06             5.54524E-06                     0.000000
      figure of merit                 3.26745E+02             3.26744E+02                    -0.000003

 the estimated inverse power slope of the 200 largest  tallies starting at 3.56568E+01 is 5.5540
 the large score tail of the empirical history score probability density function appears to have no unsampled regions.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (9.585E+04)*( 5.839E-02)**2 = (9.585E+04)*(3.409E-03) = 3.267E+02

1tally       14        nps = 19169207737
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      11                                                                                   
                         4.00000E+03
 
 cell  11                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 6.71434E-06 0.0001   4.70858E-12 0.1162   0.00000E+00 0.0000   0.00000E+00 0.0000   0.00000E+00 0.0000
 
         time:       2.0000E+07             total                                                                  
                 0.00000E+00 0.0000   6.71435E-06 0.0001


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

 estimated asymmetric confidence interval(1,2,3 sigma): 6.7136E-06 to 6.7151E-06; 6.7128E-06 to 6.7159E-06; 6.7121E-06 to 6.7166E-06
 estimated  symmetric confidence interval(1,2,3 sigma): 6.7136E-06 to 6.7151E-06; 6.7128E-06 to 6.7159E-06; 6.7121E-06 to 6.7166E-06

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       14 with nps = 19169207737  print table 160


 normed average tally per history  = 6.71435E-06          unnormed average tally per history  = 2.68574E-02
 estimated tally relative error    = 0.0001               estimated variance of the variance  = 0.0000
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =   126155411          efficiency for the nonzero tallies  = 0.0066
 history number of largest  tally  =  9466311804          largest  unnormalized history tally = 5.41995E+01
 (largest  tally)/(average tally)  = 2.01805E+03          (largest  tally)/(avg nonzero tally)= 1.32811E+01

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 6.71435E-06


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            6.71435E-06             6.71435E-06                     0.000000
      relative error                  1.12101E-04             1.12101E-04                     0.000000
      variance of the variance        2.06996E-08             2.07004E-08                     0.000036
      shifted center                  6.71435E-06             6.71435E-06                     0.000000
      figure of merit                 3.97876E+02             3.97876E+02                    -0.000001

 the estimated slope of the 198 largest  tallies starting at  3.56432E+01 appears to be decreasing at least exponentially.
 the large score tail of the empirical history score probability density function appears to have no unsampled regions.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (9.585E+04)*( 6.443E-02)**2 = (9.585E+04)*(4.151E-03) = 3.979E+02

1tally       24        nps = 19169207737
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      12                                                                                   
                         4.00000E+03
 
 cell  12                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 7.93178E-06 0.0001   5.12646E-12 0.1137   0.00000E+00 0.0000   0.00000E+00 0.0000   0.00000E+00 0.0000
 
         time:       2.0000E+07             total                                                                  
                 0.00000E+00 0.0000   7.93179E-06 0.0001


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       24

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00      yes         yes            constant    random       8.98
 passed?        yes          yes      yes          yes             yes      yes         yes               yes        yes         yes

 ===================================================================================================================================


 this tally meets the statistical criteria used to form confidence intervals: check the tally fluctuation chart to verify.
 the results in other bins associated with this tally may not meet these statistical criteria.

 ----- estimated confidence intervals:  -----

 estimated asymmetric confidence interval(1,2,3 sigma): 7.9310E-06 to 7.9326E-06; 7.9301E-06 to 7.9334E-06; 7.9293E-06 to 7.9342E-06
 estimated  symmetric confidence interval(1,2,3 sigma): 7.9310E-06 to 7.9326E-06; 7.9301E-06 to 7.9334E-06; 7.9293E-06 to 7.9342E-06

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       24 with nps = 19169207737  print table 160


 normed average tally per history  = 7.93179E-06          unnormed average tally per history  = 3.17271E-02
 estimated tally relative error    = 0.0001               estimated variance of the variance  = 0.0000
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =   151883109          efficiency for the nonzero tallies  = 0.0079
 history number of largest  tally  =  8175713662          largest  unnormalized history tally = 6.64675E+01
 (largest  tally)/(average tally)  = 2.09497E+03          (largest  tally)/(avg nonzero tally)= 1.65991E+01

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 7.93179E-06


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            7.93179E-06             7.93179E-06                     0.000000
      relative error                  1.03451E-04             1.03451E-04                     0.000000
      variance of the variance        1.72969E-08             1.72981E-08                     0.000070
      shifted center                  7.93179E-06             7.93179E-06                     0.000000
      figure of merit                 4.67197E+02             4.67197E+02                    -0.000001

 the estimated inverse power slope of the 197 largest  tallies starting at 3.65319E+01 is 8.9802
 the large score tail of the empirical history score probability density function appears to have no unsampled regions.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (9.585E+04)*( 6.982E-02)**2 = (9.585E+04)*(4.874E-03) = 4.672E+02

1tally       34        nps = 19169207737
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      13                                                                                   
                         4.00000E+03
 
 cell  13                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 6.71465E-06 0.0001   5.59866E-12 0.1195   0.00000E+00 0.0000   0.00000E+00 0.0000   0.00000E+00 0.0000
 
         time:       2.0000E+07             total                                                                  
                 0.00000E+00 0.0000   6.71466E-06 0.0001


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       34

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00      yes         yes            constant    random       5.99
 passed?        yes          yes      yes          yes             yes      yes         yes               yes        yes         yes

 ===================================================================================================================================


 this tally meets the statistical criteria used to form confidence intervals: check the tally fluctuation chart to verify.
 the results in other bins associated with this tally may not meet these statistical criteria.

 ----- estimated confidence intervals:  -----

 estimated asymmetric confidence interval(1,2,3 sigma): 6.7139E-06 to 6.7154E-06; 6.7131E-06 to 6.7162E-06; 6.7124E-06 to 6.7169E-06
 estimated  symmetric confidence interval(1,2,3 sigma): 6.7139E-06 to 6.7154E-06; 6.7131E-06 to 6.7162E-06; 6.7124E-06 to 6.7169E-06

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       34 with nps = 19169207737  print table 160


 normed average tally per history  = 6.71466E-06          unnormed average tally per history  = 2.68586E-02
 estimated tally relative error    = 0.0001               estimated variance of the variance  = 0.0000
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =   124588557          efficiency for the nonzero tallies  = 0.0065
 history number of largest  tally  =  5096095582          largest  unnormalized history tally = 6.06255E+01
 (largest  tally)/(average tally)  = 2.25721E+03          (largest  tally)/(avg nonzero tally)= 1.46705E+01

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 6.71466E-06


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            6.71466E-06             6.71466E-06                     0.000000
      relative error                  1.13382E-04             1.13383E-04                     0.000000
      variance of the variance        2.07758E-08             2.07769E-08                     0.000054
      shifted center                  6.71466E-06             6.71466E-06                     0.000000
      figure of merit                 3.88935E+02             3.88935E+02                    -0.000001

 the estimated inverse power slope of the 200 largest  tallies starting at 3.47545E+01 is 5.9933
 the large score tail of the empirical history score probability density function appears to have no unsampled regions.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (9.585E+04)*( 6.370E-02)**2 = (9.585E+04)*(4.058E-03) = 3.889E+02

1tally       44        nps = 19169207737
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      14                                                                                   
                         4.00000E+03
 
 cell  14                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 7.60972E-06 0.0001   5.44255E-12 0.1180   0.00000E+00 0.0000   0.00000E+00 0.0000   0.00000E+00 0.0000
 
         time:       2.0000E+07             total                                                                  
                 0.00000E+00 0.0000   7.60973E-06 0.0001


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       44

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00      yes         yes            constant    random       9.43
 passed?        yes          yes      yes          yes             yes      yes         yes               yes        yes         yes

 ===================================================================================================================================


 this tally meets the statistical criteria used to form confidence intervals: check the tally fluctuation chart to verify.
 the results in other bins associated with this tally may not meet these statistical criteria.

 ----- estimated confidence intervals:  -----

 estimated asymmetric confidence interval(1,2,3 sigma): 7.6089E-06 to 7.6105E-06; 7.6081E-06 to 7.6113E-06; 7.6073E-06 to 7.6122E-06
 estimated  symmetric confidence interval(1,2,3 sigma): 7.6089E-06 to 7.6105E-06; 7.6081E-06 to 7.6113E-06; 7.6073E-06 to 7.6122E-06

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       44 with nps = 19169207737  print table 160


 normed average tally per history  = 7.60973E-06          unnormed average tally per history  = 3.04389E-02
 estimated tally relative error    = 0.0001               estimated variance of the variance  = 0.0000
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =   138425324          efficiency for the nonzero tallies  = 0.0072
 history number of largest  tally  =  2390356528          largest  unnormalized history tally = 5.77762E+01
 (largest  tally)/(average tally)  = 1.89810E+03          (largest  tally)/(avg nonzero tally)= 1.37066E+01

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 7.60973E-06


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            7.60973E-06             7.60973E-06                     0.000000
      relative error                  1.06178E-04             1.06178E-04                     0.000000
      variance of the variance        1.76970E-08             1.76977E-08                     0.000041
      shifted center                  7.60973E-06             7.60973E-06                     0.000000
      figure of merit                 4.43505E+02             4.43504E+02                    -0.000001

 the estimated inverse power slope of the 200 largest  tallies starting at 3.44487E+01 is 9.4270
 the large score tail of the empirical history score probability density function appears to have no unsampled regions.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (9.585E+04)*( 6.802E-02)**2 = (9.585E+04)*(4.627E-03) = 4.435E+02

1status of the statistical checks used to form confidence intervals for the mean for each tally bin


 tally   result of statistical checks for the tfc bin (the first check not passed is listed) and error magnitude check for all bins

        4   passed the 10 statistical checks for the tally fluctuation chart bin result               
         missed all bin error check:     7 tally bins had     4 bins with zeros and     1 bins with relative errors exceeding 0.10

       14   passed the 10 statistical checks for the tally fluctuation chart bin result               
         missed all bin error check:     7 tally bins had     4 bins with zeros and     1 bins with relative errors exceeding 0.10

       24   passed the 10 statistical checks for the tally fluctuation chart bin result               
         missed all bin error check:     7 tally bins had     4 bins with zeros and     1 bins with relative errors exceeding 0.10

       34   passed the 10 statistical checks for the tally fluctuation chart bin result               
         missed all bin error check:     7 tally bins had     4 bins with zeros and     1 bins with relative errors exceeding 0.10

       44   passed the 10 statistical checks for the tally fluctuation chart bin result               
         missed all bin error check:     7 tally bins had     4 bins with zeros and     1 bins with relative errors exceeding 0.10


 the 10 statistical checks are only for the tally fluctuation chart bin and do not apply to other tally bins.

 the tally bins with zeros may or may not be correct: compare the source, cutoffs, multipliers, et cetera with the tally bins.

 warning.       5 of the     5 tallies had bins with relative errors greater than recommended.
1tally fluctuation charts                              

                            tally        4                          tally       14                          tally       24
          nps      mean     error   vov  slope    fom      mean     error   vov  slope    fom      mean     error   vov  slope    fom
   1048576000   5.5408E-06 0.0005 0.0000  8.4     327   6.7166E-06 0.0005 0.0000 10.0     398   7.9346E-06 0.0004 0.0000  7.9     468
   2097152000   5.5428E-06 0.0004 0.0000  7.8     327   6.7137E-06 0.0003 0.0000 10.0     398   7.9328E-06 0.0003 0.0000  5.2     467
   3145728000   5.5440E-06 0.0003 0.0000  6.3     327   6.7134E-06 0.0003 0.0000 10.0     398   7.9351E-06 0.0003 0.0000  5.5     468
   4194304000   5.5448E-06 0.0003 0.0000  7.5     327   6.7116E-06 0.0002 0.0000 10.0     398   7.9336E-06 0.0002 0.0000  6.0     468
   5242880000   5.5452E-06 0.0002 0.0000  5.3     327   6.7122E-06 0.0002 0.0000 10.0     398   7.9329E-06 0.0002 0.0000  6.8     467
   6291456000   5.5451E-06 0.0002 0.0000  4.7     327   6.7138E-06 0.0002 0.0000 10.0     398   7.9324E-06 0.0002 0.0000  8.6     467
   7340032000   5.5448E-06 0.0002 0.0000  4.3     327   6.7136E-06 0.0002 0.0000 10.0     398   7.9320E-06 0.0002 0.0000 10.0     467
   8388608000   5.5442E-06 0.0002 0.0000  5.1     327   6.7140E-06 0.0002 0.0000 10.0     398   7.9320E-06 0.0002 0.0000  7.1     467
   9437184000   5.5437E-06 0.0002 0.0000  5.9     327   6.7145E-06 0.0002 0.0000 10.0     398   7.9323E-06 0.0001 0.0000  6.5     467
  10485760000   5.5437E-06 0.0002 0.0000  6.1     327   6.7137E-06 0.0002 0.0000 10.0     398   7.9316E-06 0.0001 0.0000  6.6     467
  11534336000   5.5436E-06 0.0002 0.0000  5.0     327   6.7139E-06 0.0001 0.0000 10.0     398   7.9314E-06 0.0001 0.0000  7.4     467
  12582912000   5.5440E-06 0.0002 0.0000  4.9     327   6.7147E-06 0.0001 0.0000  8.5     398   7.9312E-06 0.0001 0.0000  9.6     467
  13631488000   5.5442E-06 0.0001 0.0000  4.7     327   6.7144E-06 0.0001 0.0000  7.7     398   7.9311E-06 0.0001 0.0000  9.5     467
  14680064000   5.5442E-06 0.0001 0.0000  4.9     327   6.7145E-06 0.0001 0.0000  9.3     398   7.9313E-06 0.0001 0.0000  9.2     467
  15728640000   5.5446E-06 0.0001 0.0000  4.9     327   6.7144E-06 0.0001 0.0000 10.0     398   7.9315E-06 0.0001 0.0000 10.0     467
  16777216000   5.5449E-06 0.0001 0.0000  5.2     327   6.7144E-06 0.0001 0.0000 10.0     398   7.9317E-06 0.0001 0.0000 10.0     467
  17825792000   5.5449E-06 0.0001 0.0000  5.7     327   6.7145E-06 0.0001 0.0000 10.0     398   7.9315E-06 0.0001 0.0000  9.5     467
  18874368000   5.5452E-06 0.0001 0.0000  5.5     327   6.7144E-06 0.0001 0.0000 10.0     398   7.9318E-06 0.0001 0.0000  8.0     467
  19169207737   5.5452E-06 0.0001 0.0000  5.6     327   6.7143E-06 0.0001 0.0000 10.0     398   7.9318E-06 0.0001 0.0000  9.0     467
 

                            tally       34                          tally       44
          nps      mean     error   vov  slope    fom      mean     error   vov  slope    fom
   1048576000   6.7121E-06 0.0005 0.0000 10.0     389   7.6070E-06 0.0005 0.0000 10.0     444
   2097152000   6.7152E-06 0.0003 0.0000 10.0     389   7.6099E-06 0.0003 0.0000 10.0     444
   3145728000   6.7168E-06 0.0003 0.0000  5.6     389   7.6093E-06 0.0003 0.0000  8.0     444
   4194304000   6.7143E-06 0.0002 0.0000  6.2     389   7.6094E-06 0.0002 0.0000  7.0     444
   5242880000   6.7143E-06 0.0002 0.0000  4.6     389   7.6093E-06 0.0002 0.0000  5.5     444
   6291456000   6.7149E-06 0.0002 0.0000  4.6     389   7.6092E-06 0.0002 0.0000  5.9     444
   7340032000   6.7147E-06 0.0002 0.0000  5.4     389   7.6100E-06 0.0002 0.0000  6.1     444
   8388608000   6.7147E-06 0.0002 0.0000  5.3     389   7.6094E-06 0.0002 0.0000  6.6     444
   9437184000   6.7142E-06 0.0002 0.0000  5.8     389   7.6091E-06 0.0002 0.0000  8.2     443
  10485760000   6.7143E-06 0.0002 0.0000  6.4     389   7.6092E-06 0.0001 0.0000  7.7     443
  11534336000   6.7144E-06 0.0001 0.0000  5.8     389   7.6097E-06 0.0001 0.0000  6.4     443
  12582912000   6.7144E-06 0.0001 0.0000  5.9     389   7.6097E-06 0.0001 0.0000  8.2     443
  13631488000   6.7140E-06 0.0001 0.0000  4.7     389   7.6095E-06 0.0001 0.0000 10.0     443
  14680064000   6.7141E-06 0.0001 0.0000  5.0     389   7.6095E-06 0.0001 0.0000 10.0     443
  15728640000   6.7142E-06 0.0001 0.0000  5.3     389   7.6094E-06 0.0001 0.0000 10.0     443
  16777216000   6.7143E-06 0.0001 0.0000  5.9     389   7.6096E-06 0.0001 0.0000 10.0     443
  17825792000   6.7143E-06 0.0001 0.0000  6.6     389   7.6097E-06 0.0001 0.0000 10.0     444
  18874368000   6.7146E-06 0.0001 0.0000  5.8     389   7.6097E-06 0.0001 0.0000  8.9     444
  19169207737   6.7147E-06 0.0001 0.0000  6.0     389   7.6097E-06 0.0001 0.0000  9.4     444

 ***********************************************************************************************************************

 dump no.  168 on file inpr     nps = 19169207737     coll =    37329457634     ctm =   200000.46   nrn =     
 570808874387

         9 warning messages so far.


 run terminated when it had used*****  minutes of computer time.

 computer time =******** minutes

 mcnp     version 6     06/19/14                     08/06/17 09:54:41                     probid =  08/06/17 01:34:53 
