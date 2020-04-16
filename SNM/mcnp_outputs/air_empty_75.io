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

 dump no.    2 on file inpr     nps =   111189744     coll =      216514929     ctm =     1200.36   nrn =       
 3310945393

 ***********************************************************************************************************************

 dump no.    3 on file inpr     nps =   222513073     coll =      433276495     ctm =     2400.65   nrn =       
 6625636821

 ***********************************************************************************************************************

 dump no.    4 on file inpr     nps =   333312926     coll =      649042432     ctm =     3600.97   nrn =       
 9924909097

 ***********************************************************************************************************************

 dump no.    5 on file inpr     nps =   444662015     coll =      865829122     ctm =     4801.24   nrn =      
 13240135526

 ***********************************************************************************************************************

 dump no.    6 on file inpr     nps =   556066608     coll =     1082757013     ctm =     6001.62   nrn =      
 16557239695

 ***********************************************************************************************************************

 dump no.    7 on file inpr     nps =   666952559     coll =     1298605431     ctm =     7201.97   nrn =      
 19858172460

 ***********************************************************************************************************************

 dump no.    8 on file inpr     nps =   778320288     coll =     1515465181     ctm =     8402.31   nrn =      
 23174208537

 ***********************************************************************************************************************

 dump no.    9 on file inpr     nps =   889674024     coll =     1732348813     ctm =     9602.60   nrn =      
 26490392285

 ***********************************************************************************************************************

 dump no.   10 on file inpr     nps =  1001033776     coll =     1949147934     ctm =    10802.95   nrn =      
 29805732025

 ***********************************************************************************************************************

 dump no.   11 on file inpr     nps =  1111940841     coll =     2165187420     ctm =    12003.23   nrn =      
 33108851619

 ***********************************************************************************************************************

 dump no.   12 on file inpr     nps =  1223347832     coll =     2382196588     ctm =    13203.59   nrn =      
 36426756612

 ***********************************************************************************************************************

 dump no.   13 on file inpr     nps =  1334750816     coll =     2599100703     ctm =    14403.84   nrn =      
 39743678669

 ***********************************************************************************************************************

 dump no.   14 on file inpr     nps =  1445590240     coll =     2815027528     ctm =    15604.24   nrn =      
 43045040017

 ***********************************************************************************************************************

 dump no.   15 on file inpr     nps =  1556945064     coll =     3031895868     ctm =    16804.57   nrn =      
 46361023492

 ***********************************************************************************************************************

 dump no.   16 on file inpr     nps =  1668349592     coll =     3248842828     ctm =    18004.97   nrn =      
 49678389619

 ***********************************************************************************************************************

 dump no.   17 on file inpr     nps =  1779270848     coll =     3464854016     ctm =    19205.37   nrn =      
 52981342961

 ***********************************************************************************************************************

 dump no.   18 on file inpr     nps =  1890680008     coll =     3681813554     ctm =    20405.76   nrn =      
 56298786124

 ***********************************************************************************************************************

 dump no.   19 on file inpr     nps =  2002098432     coll =     3898830418     ctm =    21606.22   nrn =      
 59616912094

 ***********************************************************************************************************************

 dump no.   20 on file inpr     nps =  2113509136     coll =     4115793653     ctm =    22806.58   nrn =      
 62934440094

 ***********************************************************************************************************************

 dump no.   21 on file inpr     nps =  2224386864     coll =     4331787930     ctm =    24006.90   nrn =      
 66236852330

 ***********************************************************************************************************************

 dump no.   22 on file inpr     nps =  2335717280     coll =     4548634260     ctm =    25207.21   nrn =      
 69552432607

 ***********************************************************************************************************************

 dump no.   23 on file inpr     nps =  2447081664     coll =     4765545185     ctm =    26407.49   nrn =      
 72868942053

 ***********************************************************************************************************************

 dump no.   24 on file inpr     nps =  2557901016     coll =     4981326666     ctm =    27607.80   nrn =      
 76168546574

 ***********************************************************************************************************************

 dump no.   25 on file inpr     nps =  2669300912     coll =     5198257317     ctm =    28808.16   nrn =      
 79485736510

 ***********************************************************************************************************************

 dump no.   26 on file inpr     nps =  2780760728     coll =     5415259669     ctm =    30008.49   nrn =      
 82804025884

 ***********************************************************************************************************************

 dump no.   27 on file inpr     nps =  2891657576     coll =     5631251540     ctm =    31208.84   nrn =      
 86106653926

 ***********************************************************************************************************************

 dump no.   28 on file inpr     nps =  3003038648     coll =     5848237191     ctm =    32409.15   nrn =      
 89424276052

 ***********************************************************************************************************************

 dump no.   29 on file inpr     nps =  3114441336     coll =     6065139903     ctm =    33609.48   nrn =      
 92741021609

 ***********************************************************************************************************************

 dump no.   30 on file inpr     nps =  3225827632     coll =     6282018917     ctm =    34809.77   nrn =      
 96057611620

 ***********************************************************************************************************************

 dump no.   31 on file inpr     nps =  3336600368     coll =     6497731306     ctm =    36010.12   nrn =      
 99355976897

 ***********************************************************************************************************************

 dump no.   32 on file inpr     nps =  3447980488     coll =     6714548084     ctm =    37210.42   nrn =     
 102671725746

 ***********************************************************************************************************************

 dump no.   33 on file inpr     nps =  3559377000     coll =     6931483263     ctm =    38410.81   nrn =     
 105988796953

 ***********************************************************************************************************************

 dump no.   34 on file inpr     nps =  3670199736     coll =     7147289362     ctm =    39611.13   nrn =     
 109288687363

 ***********************************************************************************************************************

 dump no.   35 on file inpr     nps =  3781577720     coll =     7364189866     ctm =    40811.43   nrn =     
 112605269485

 ***********************************************************************************************************************

 dump no.   36 on file inpr     nps =  3892943352     coll =     7581030630     ctm =    42011.71   nrn =     
 115921045149

 ***********************************************************************************************************************

 dump no.   37 on file inpr     nps =  4003758368     coll =     7796761578     ctm =    43212.07   nrn =     
 119220165679

 ***********************************************************************************************************************

 dump no.   38 on file inpr     nps =  4115108560     coll =     8013587589     ctm =    44412.34   nrn =     
 122536114918

 ***********************************************************************************************************************

 dump no.   39 on file inpr     nps =  4226499488     coll =     8230526661     ctm =    45612.66   nrn =     
 125853147524

 ***********************************************************************************************************************

 dump no.   40 on file inpr     nps =  4337854312     coll =     8447338805     ctm =    46813.00   nrn =     
 129168514416

 ***********************************************************************************************************************

 dump no.   41 on file inpr     nps =  4448745936     coll =     8663242221     ctm =    48013.29   nrn =     
 132470014681

 ***********************************************************************************************************************

 dump no.   42 on file inpr     nps =  4560144584     coll =     8880190088     ctm =    49213.61   nrn =     
 135787427977

 ***********************************************************************************************************************

 dump no.   43 on file inpr     nps =  4671456176     coll =     9096919692     ctm =    50413.91   nrn =     
 139101549546

 ***********************************************************************************************************************

 dump no.   44 on file inpr     nps =  4782390080     coll =     9312958409     ctm =    51614.34   nrn =     
 142404991880

 ***********************************************************************************************************************

 dump no.   45 on file inpr     nps =  4893738728     coll =     9529833827     ctm =    52814.65   nrn =     
 145720958745

 ***********************************************************************************************************************

 dump no.   46 on file inpr     nps =  5005138920     coll =     9746714205     ctm =    54014.93   nrn =     
 149037531170

 ***********************************************************************************************************************

 dump no.   47 on file inpr     nps =  5116093848     coll =     9962741860     ctm =    55215.28   nrn =     
 152341060027

 ***********************************************************************************************************************

 dump no.   48 on file inpr     nps =  5227471832     coll =    10179500270     ctm =    56415.62   nrn =     
 155656209905

 ***********************************************************************************************************************

 dump no.   49 on file inpr     nps =  5338892096     coll =    10396474801     ctm =    57615.92   nrn =     
 158973996236

 ***********************************************************************************************************************

 dump no.   50 on file inpr     nps =  5450208320     coll =    10613336831     ctm =    58816.20   nrn =     
 162289624148

 ***********************************************************************************************************************

 dump no.   51 on file inpr     nps =  5560675344     coll =    10828506177     ctm =    60016.50   nrn =     
 165579461301

 ***********************************************************************************************************************

 dump no.   52 on file inpr     nps =  5672010096     coll =    11045464724     ctm =    61216.78   nrn =     
 168896357149

 ***********************************************************************************************************************

 dump no.   53 on file inpr     nps =  5783361472     coll =    11262319594     ctm =    62417.04   nrn =     
 172212280159

 ***********************************************************************************************************************

 dump no.   54 on file inpr     nps =  5894283976     coll =    11478428187     ctm =    63617.34   nrn =     
 175516252768

 ***********************************************************************************************************************

 dump no.   55 on file inpr     nps =  6005604832     coll =    11695225060     ctm =    64817.66   nrn =     
 178831185035

 ***********************************************************************************************************************

 dump no.   56 on file inpr     nps =  6117009064     coll =    11912057786     ctm =    66018.01   nrn =     
 182147304068

 ***********************************************************************************************************************

 dump no.   57 on file inpr     nps =  6227891424     coll =    12127984711     ctm =    67218.35   nrn =     
 185449172309

 ***********************************************************************************************************************

 dump no.   58 on file inpr     nps =  6337761697     coll =    12341962042     ctm =    68418.72   nrn =     
 188721049694

 ***********************************************************************************************************************

 dump no.   59 on file inpr     nps =  6447536889     coll =    12555813752     ctm =    69619.01   nrn =     
 191990594063

 ***********************************************************************************************************************

 dump no.   60 on file inpr     nps =  6558890570     coll =    12772596369     ctm =    70819.32   nrn =     
 195305692417

 ***********************************************************************************************************************

 dump no.   61 on file inpr     nps =  6669659454     coll =    12988346585     ctm =    72019.61   nrn =     
 198604570723

 ***********************************************************************************************************************

 dump no.   62 on file inpr     nps =  6781011592     coll =    13205215711     ctm =    73219.89   nrn =     
 201920537227

 ***********************************************************************************************************************

 dump no.   63 on file inpr     nps =  6892363208     coll =    13422104941     ctm =    74420.19   nrn =     
 205236817570

 ***********************************************************************************************************************

 dump no.   64 on file inpr     nps =  7003264790     coll =    13638070277     ctm =    75620.46   nrn =     
 208539054057

 ***********************************************************************************************************************

 dump no.   65 on file inpr     nps =  7114620014     coll =    13854984729     ctm =    76820.78   nrn =     
 211855548547

 ***********************************************************************************************************************

 dump no.   66 on file inpr     nps =  7226015356     coll =    14071954568     ctm =    78021.09   nrn =     
 215172998467

 ***********************************************************************************************************************

 dump no.   67 on file inpr     nps =  7336963228     coll =    14287955163     ctm =    79221.32   nrn =     
 218476190948

 ***********************************************************************************************************************

 dump no.   68 on file inpr     nps =  7448308939     coll =    14504824860     ctm =    80421.79   nrn =     
 221792190703

 ***********************************************************************************************************************

 dump no.   69 on file inpr     nps =  7559718168     coll =    14721740193     ctm =    81622.11   nrn =     
 225109247546

 ***********************************************************************************************************************

 dump no.   70 on file inpr     nps =  7671008586     coll =    14938555810     ctm =    82822.39   nrn =     
 228424068109

 ***********************************************************************************************************************

 dump no.   71 on file inpr     nps =  7781769755     coll =    15154203196     ctm =    84022.67   nrn =     
 231721774100

 ***********************************************************************************************************************

 dump no.   72 on file inpr     nps =  7893047574     coll =    15370963741     ctm =    85223.02   nrn =     
 235035886088

 ***********************************************************************************************************************

 dump no.   73 on file inpr     nps =  8004331820     coll =    15587616604     ctm =    86423.33   nrn =     
 238348954774

 ***********************************************************************************************************************

 dump no.   74 on file inpr     nps =  8115208714     coll =    15803349983     ctm =    87623.65   nrn =     
 241648754677

 ***********************************************************************************************************************

 dump no.   75 on file inpr     nps =  8226463643     coll =    16019971798     ctm =    88823.97   nrn =     
 244961307286

 ***********************************************************************************************************************

 dump no.   76 on file inpr     nps =  8337778749     coll =    16236801188     ctm =    90024.32   nrn =     
 248276546365

 ***********************************************************************************************************************

 dump no.   77 on file inpr     nps =  8448559722     coll =    16452566913     ctm =    91224.64   nrn =     
 251575744284

 ***********************************************************************************************************************

 dump no.   78 on file inpr     nps =  8559820823     coll =    16669311881     ctm =    92424.98   nrn =     
 254889471299

 ***********************************************************************************************************************

 dump no.   79 on file inpr     nps =  8671117413     coll =    16886010558     ctm =    93625.31   nrn =     
 258203248265

 ***********************************************************************************************************************

 dump no.   80 on file inpr     nps =  8782415546     coll =    17102696137     ctm =    94825.64   nrn =     
 261516681673

 ***********************************************************************************************************************

 dump no.   81 on file inpr     nps =  8893307870     coll =    17318618700     ctm =    96025.98   nrn =     
 264818498149

 ***********************************************************************************************************************

 dump no.   82 on file inpr     nps =  9004624264     coll =    17535374802     ctm =    97226.32   nrn =     
 268133035069

 ***********************************************************************************************************************

 dump no.   83 on file inpr     nps =  9115933198     coll =    17752085179     ctm =    98426.70   nrn =     
 271447000013

 ***********************************************************************************************************************

 dump no.   84 on file inpr     nps =  9226800834     coll =    17967966914     ctm =    99627.07   nrn =     
 274748189263

 ***********************************************************************************************************************

 dump no.   85 on file inpr     nps =  9338114397     coll =    18184636192     ctm =   100827.36   nrn =     
 278061711768

 ***********************************************************************************************************************

 dump no.   86 on file inpr     nps =  9449460108     coll =    18401367639     ctm =   102027.68   nrn =     
 281376347011

 ***********************************************************************************************************************

 dump no.   87 on file inpr     nps =  9560315400     coll =    18617197451     ctm =   103227.95   nrn =     
 284676799362

 ***********************************************************************************************************************

 dump no.   88 on file inpr     nps =  9671574958     coll =    18833869402     ctm =   104428.28   nrn =     
 287989894967

 ***********************************************************************************************************************

 dump no.   89 on file inpr     nps =  9782883892     coll =    19050608350     ctm =   105628.68   nrn =     
 291304083634

 ***********************************************************************************************************************

 dump no.   90 on file inpr     nps =  9894141907     coll =    19267344782     ctm =   106828.94   nrn =     
 294617753645

 ***********************************************************************************************************************

 dump no.   91 on file inpr     nps = 10004887391     coll =    19482957185     ctm =   108029.28   nrn =     
 297914908929

 ***********************************************************************************************************************

 dump no.   92 on file inpr     nps = 10116248787     coll =    19699747215     ctm =   109229.67   nrn =     
 301230214554

 ***********************************************************************************************************************

 dump no.   93 on file inpr     nps = 10227602468     coll =    19916576317     ctm =   110429.97   nrn =     
 304545921602

 ***********************************************************************************************************************

 dump no.   94 on file inpr     nps = 10338375981     coll =    20132312558     ctm =   111630.25   nrn =     
 307844476376

 ***********************************************************************************************************************

 dump no.   95 on file inpr     nps = 10449717318     coll =    20349129762     ctm =   112830.57   nrn =     
 311159887996

 ***********************************************************************************************************************

 dump no.   96 on file inpr     nps = 10560978164     coll =    20565774923     ctm =   114030.89   nrn =     
 314472680947

 ***********************************************************************************************************************

 dump no.   97 on file inpr     nps = 10671790252     coll =    20781547871     ctm =   115231.20   nrn =     
 317772216383

 ***********************************************************************************************************************

 dump no.   98 on file inpr     nps = 10783093014     coll =    20998336781     ctm =   116431.55   nrn =     
 321086930910

 ***********************************************************************************************************************

 dump no.   99 on file inpr     nps = 10894425093     coll =    21215079822     ctm =   117631.86   nrn =     
 324401390299

 ***********************************************************************************************************************

 dump no.  100 on file inpr     nps = 11005721683     coll =    21431842039     ctm =   118832.16   nrn =     
 327715725481

 ***********************************************************************************************************************

 dump no.  101 on file inpr     nps = 11116572346     coll =    21647795269     ctm =   120032.45   nrn =     
 331017441846

 ***********************************************************************************************************************

 dump no.  102 on file inpr     nps = 11227901339     coll =    21864554666     ctm =   121232.72   nrn =     
 334332086282

 ***********************************************************************************************************************

 dump no.  103 on file inpr     nps = 11339210273     coll =    22081271498     ctm =   122433.01   nrn =     
 337646062756

 ***********************************************************************************************************************

 dump no.  104 on file inpr     nps = 11450053221     coll =    22297120422     ctm =   123633.43   nrn =     
 340946399843

 ***********************************************************************************************************************

 dump no.  105 on file inpr     nps = 11561341586     coll =    22513814603     ctm =   124833.75   nrn =     
 344260041569

 ***********************************************************************************************************************

 dump no.  106 on file inpr     nps = 11671308110     coll =    22727933023     ctm =   126034.11   nrn =     
 347534186549

 ***********************************************************************************************************************

 dump no.  107 on file inpr     nps = 11782141800     coll =    22943787191     ctm =   127234.52   nrn =     
 350834612693

 ***********************************************************************************************************************

 dump no.  108 on file inpr     nps = 11893446105     coll =    23160521205     ctm =   128434.78   nrn =     
 354148906071

 ***********************************************************************************************************************

 dump no.  109 on file inpr     nps = 12004718007     coll =    23377158815     ctm =   129635.16   nrn =     
 357461794482

 ***********************************************************************************************************************

 dump no.  110 on file inpr     nps = 12115948248     coll =    23593808498     ctm =   130835.49   nrn =     
 360774340234

 ***********************************************************************************************************************

 dump no.  111 on file inpr     nps = 12226769594     coll =    23809599442     ctm =   132035.80   nrn =     
 364074136988

 ***********************************************************************************************************************

 dump no.  112 on file inpr     nps = 12338027609     coll =    24026297751     ctm =   133236.14   nrn =     
 367387630042

 ***********************************************************************************************************************

 dump no.  113 on file inpr     nps = 12449310312     coll =    24243002026     ctm =   134436.40   nrn =     
 370701376956

 ***********************************************************************************************************************

 dump no.  114 on file inpr     nps = 12560190292     coll =    24458957413     ctm =   135636.70   nrn =     
 374003336909

 ***********************************************************************************************************************

 dump no.  115 on file inpr     nps = 12671436996     coll =    24675625277     ctm =   136837.05   nrn =     
 377316283683

 ***********************************************************************************************************************

 dump no.  116 on file inpr     nps = 12782749016     coll =    24892341498     ctm =   138037.37   nrn =     
 380630320216

 ***********************************************************************************************************************

 dump no.  117 on file inpr     nps = 12893544131     coll =    25108153837     ctm =   139237.72   nrn =     
 383929955009

 ***********************************************************************************************************************

 dump no.  118 on file inpr     nps = 13004851522     coll =    25324951386     ctm =   140438.04   nrn =     
 387244769696

 ***********************************************************************************************************************

 dump no.  119 on file inpr     nps = 13116191316     coll =    25541735905     ctm =   141638.34   nrn =     
 390559692280

 ***********************************************************************************************************************

 dump no.  120 on file inpr     nps = 13227534196     coll =    25758544163     ctm =   142838.74   nrn =     
 393875023054

 ***********************************************************************************************************************

 dump no.  121 on file inpr     nps = 13338395660     coll =    25974434647     ctm =   144039.12   nrn =     
 397176354571

 ***********************************************************************************************************************

 dump no.  122 on file inpr     nps = 13449695336     coll =    26191199042     ctm =   145239.39   nrn =     
 400490660436

 ***********************************************************************************************************************

 dump no.  123 on file inpr     nps = 13561039759     coll =    26407901527     ctm =   146439.73   nrn =     
 403804764338

 ***********************************************************************************************************************

 dump no.  124 on file inpr     nps = 13671892998     coll =    26623895600     ctm =   147640.00   nrn =     
 407106877772

 ***********************************************************************************************************************

 dump no.  125 on file inpr     nps = 13783124782     coll =    26840603419     ctm =   148840.32   nrn =     
 410419954633

 ***********************************************************************************************************************

 dump no.  126 on file inpr     nps = 13894424458     coll =    27057383111     ctm =   150040.71   nrn =     
 413734572980

 ***********************************************************************************************************************

 dump no.  127 on file inpr     nps = 14005199514     coll =    27273119851     ctm =   151240.98   nrn =     
 417033213055

 ***********************************************************************************************************************

 dump no.  128 on file inpr     nps = 14116482217     coll =    27489882137     ctm =   152441.31   nrn =     
 420347542323

 ***********************************************************************************************************************

 dump no.  129 on file inpr     nps = 14227777264     coll =    27706645741     ctm =   153641.58   nrn =     
 423661889817

 ***********************************************************************************************************************

 dump no.  130 on file inpr     nps = 14339027564     coll =    27923302728     ctm =   154841.84   nrn =     
 426974708960

 ***********************************************************************************************************************

 dump no.  131 on file inpr     nps = 14449743986     coll =    28138888595     ctm =   156042.14   nrn =     
 430271302166

 ***********************************************************************************************************************

 dump no.  132 on file inpr     nps = 14561020517     coll =    28355559655     ctm =   157242.48   nrn =     
 433584660146

 ***********************************************************************************************************************

 dump no.  133 on file inpr     nps = 14672323279     coll =    28572213399     ctm =   158442.89   nrn =     
 436898107659

 ***********************************************************************************************************************

 dump no.  134 on file inpr     nps = 14783195034     coll =    28788081159     ctm =   159643.19   nrn =     
 440199109717

 ***********************************************************************************************************************

 dump no.  135 on file inpr     nps = 14894482366     coll =    29004780319     ctm =   160843.49   nrn =     
 443512818240

 ***********************************************************************************************************************

 dump no.  136 on file inpr     nps = 15005772784     coll =    29221533409     ctm =   162043.76   nrn =     
 446827117824

 ***********************************************************************************************************************

 dump no.  137 on file inpr     nps = 15116515437     coll =    29437206841     ctm =   163244.20   nrn =     
 450125034998

 ***********************************************************************************************************************

 dump no.  138 on file inpr     nps = 15227795054     coll =    29653961575     ctm =   164444.55   nrn =     
 453439139481

 ***********************************************************************************************************************

 dump no.  139 on file inpr     nps = 15339130219     coll =    29870728361     ctm =   165644.81   nrn =     
 456753944134

 ***********************************************************************************************************************

 dump no.  140 on file inpr     nps = 15450446868     coll =    30087550380     ctm =   166845.21   nrn =     
 460069091097

 ***********************************************************************************************************************

 dump no.  141 on file inpr     nps = 15561152489     coll =    30303076063     ctm =   168045.48   nrn =     
 463364965193

 ***********************************************************************************************************************

 dump no.  142 on file inpr     nps = 15672408961     coll =    30519737757     ctm =   169245.81   nrn =     
 466677964069

 ***********************************************************************************************************************

 dump no.  143 on file inpr     nps = 15783657208     coll =    30736476339     ctm =   170446.22   nrn =     
 469991548589

 ***********************************************************************************************************************

 dump no.  144 on file inpr     nps = 15894520215     coll =    30952378107     ctm =   171646.55   nrn =     
 473293051074

 ***********************************************************************************************************************

 dump no.  145 on file inpr     nps = 16005813719     coll =    31169149289     ctm =   172846.91   nrn =     
 476607563314

 ***********************************************************************************************************************

 dump no.  146 on file inpr     nps = 16117142712     coll =    31385897292     ctm =   174047.26   nrn =     
 479922051508

 ***********************************************************************************************************************

 dump no.  147 on file inpr     nps = 16227894623     coll =    31601589434     ctm =   175247.61   nrn =     
 483220140659

 ***********************************************************************************************************************

 dump no.  148 on file inpr     nps = 16339208186     coll =    31818391426     ctm =   176447.91   nrn =     
 486535160276

 ***********************************************************************************************************************

 dump no.  149 on file inpr     nps = 16450537179     coll =    32035235130     ctm =   177648.13   nrn =     
 489850598419

 ***********************************************************************************************************************

 dump no.  150 on file inpr     nps = 16561852285     coll =    32251937650     ctm =   178848.44   nrn =     
 493164537072

 ***********************************************************************************************************************

 dump no.  151 on file inpr     nps = 16672713749     coll =    32467774483     ctm =   180048.71   nrn =     
 496465206110

 ***********************************************************************************************************************

 dump no.  152 on file inpr     nps = 16784019087     coll =    32684461479     ctm =   181249.07   nrn =     
 499778953367

 ***********************************************************************************************************************

 dump no.  153 on file inpr     nps = 16895298704     coll =    32901188770     ctm =   182449.37   nrn =     
 503092918541

 ***********************************************************************************************************************

 dump no.  154 on file inpr     nps = 17006166340     coll =    33117065953     ctm =   183649.70   nrn =     
 506394090329

 ***********************************************************************************************************************

 dump no.  155 on file inpr     nps = 17117487618     coll =    33333728869     ctm =   184850.14   nrn =     
 509707653329

 ***********************************************************************************************************************

 dump no.  156 on file inpr     nps = 17228813525     coll =    33550660462     ctm =   186050.46   nrn =     
 513023980131

 ***********************************************************************************************************************

 dump no.  157 on file inpr     nps = 17339644129     coll =    33766438219     ctm =   187250.73   nrn =     
 516327253324

 ***********************************************************************************************************************

 dump no.  158 on file inpr     nps = 17450931461     coll =    33983151455     ctm =   188451.04   nrn =     
 519641036496

 ***********************************************************************************************************************

 dump no.  159 on file inpr     nps = 17562268169     coll =    34199919997     ctm =   189651.34   nrn =     
 522955849498

 ***********************************************************************************************************************

 dump no.  160 on file inpr     nps = 17673577103     coll =    34416700108     ctm =   190851.76   nrn =     
 526270563244

 ***********************************************************************************************************************

 dump no.  161 on file inpr     nps = 17784437024     coll =    34632672706     ctm =   192052.07   nrn =     
 529572579940

 ***********************************************************************************************************************

 dump no.  162 on file inpr     nps = 17895736190     coll =    34849367209     ctm =   193252.35   nrn =     
 532886375016

 ***********************************************************************************************************************

 dump no.  163 on file inpr     nps = 18007011178     coll =    35066080522     ctm =   194452.71   nrn =     
 536200008223

 ***********************************************************************************************************************

 dump no.  164 on file inpr     nps = 18117818637     coll =    35281873121     ctm =   195653.00   nrn =     
 539499653494

 ***********************************************************************************************************************

 dump no.  165 on file inpr     nps = 18229085910     coll =    35498559097     ctm =   196853.38   nrn =     
 542813099605

 ***********************************************************************************************************************

 dump no.  166 on file inpr     nps = 18340393301     coll =    35715275427     ctm =   198053.70   nrn =     
 546127215799

 ***********************************************************************************************************************

 dump no.  167 on file inpr     nps = 18451169900     coll =    35930988365     ctm =   199253.99   nrn =     
 549425637268
1problem summary                                                                                                           

      run terminated when it had used*****  minutes of computer time.
+                                                                                                    08/06/17 09:54:41 
      c //-------------------------------------------------------------------------//      probid =  08/06/17 01:34:53 

 neutron creation    tracks      weight        energy            neutron loss        tracks      weight        energy
                                 (per source particle)                                           (per source particle)

 source         18520371907    1.0000E+00    1.4100E+01          escape         29471907563    1.0324E+00    1.0605E+01
 nucl. interaction        0    0.            0.                  energy cutoff            0    0.            0.        
 particle decay           0    0.            0.                  time cutoff              0    0.            0.        
 weight window  10747683727    1.8180E-02    9.0393E-02          weight window   1895638642    1.8182E-02    9.0396E-02
 cell importance          0    0.            0.                  cell importance          0    0.            0.        
 weight cutoff            0    0.            0.                  weight cutoff            0    0.            0.        
 e or t importance        0    0.            0.                  e or t importance        0    0.            0.        
 dxtran                   0    0.            0.                  dxtran                   0    0.            0.        
 forced collisions        0    0.            0.                  forced collisions        0    0.            0.        
 exp. transform           0    0.            0.                  exp. transform           0    0.            0.        
 upscattering             0    0.            1.7577E-14          downscattering           0    0.            1.8659E+00
 photonuclear             0    0.            0.                  capture                105    5.0095E-02    6.6579E-01
 (n,xn)          4198981352    1.6502E-01    1.9589E-01          loss to (n,xn)  2099490676    8.2508E-02    1.1597E+00
 prompt fission           0    0.            0.                  loss to fission          0    0.            0.        
 delayed fission          0    0.            0.                  nucl. interaction        0    0.            0.        
 prompt photofis          0    0.            0.                  particle decay           0    0.            0.        
 tabular boundary         0    0.            0.                  tabular boundary         0    0.            0.        
 tabular sampling         0    0.            0.                  elastic scatter          0    0.            0.        
     total      33467036986    1.1832E+00    1.4386E+01              total      33467036986    1.1832E+00    1.4386E+01

   number of neutrons banked             -1485611977        average time of (shakes)              cutoffs
   neutron tracks per source particle     1.8070E+00          escape            5.0000E+06          tco   2.0000E+07
   neutron collisions per source particle 1.9474E+00          capture           5.0000E+06          eco   0.0000E+00
   total neutron collisions              -2147483648          capture or escape 5.0000E+06          wc1  -5.0000E-01
   net multiplication              1.0825E+00 0.0000          any termination   4.6501E+06          wc2  -2.5000E-01

 computer time so far in this run200002.43 minutes            maximum number ever in bank        13
 computer time in mcrun          200000.28 minutes            bank overflows to backup file       0
 source particles per minute            9.2602E+04
 random numbers generated             551486657630            most random numbers used was     3596033 in history 17290241900
 
  warning.   random number stride   152917 exceeded        3 times.
 
  warning.  random number period exceeded.  decrease stride.

 range of sampled source weights = 9.4499E-01 to 1.0618E+00

 number of histories processed by each thread
   903349870   933383073   924908470   926603769   927559899   925402216   930542611   932182399   924843704   928239916
   929951835   927580113   924339845   924482052   927765784   927858981   924370757   928686105   922675224   925645284
 
  warning.  some of the geometry is covered by a weight window mesh.
1neutron  activity in each cell                                                                         print table 126

                       tracks     population   collisions   collisions     number        flux        average      average
              cell    entering                               * weight     weighted     weighted   track weight   track mfp
                                                          (per history)    energy       energy     (relative)      (cm)

        1        1 37357588277  29818806848    107197760    4.1448E-03   6.1819E+00   1.0896E+01   7.5479E-01   1.1968E+04
        2        2 18219530023  18949567812  35880465118    1.2416E+00   3.5025E+00   8.2607E+00   6.5666E-01   4.2403E+00
        3        3 11103166888   8716542605     73158933    2.6171E-03   3.1133E+00   7.8721E+00   7.1548E-01   1.1158E+04
        4        4    28326992     43942368        32622    6.9214E-07   2.3121E+00   6.7209E+00   4.0926E-01   1.0729E+04
        5       10   629014169    897877794       887590    2.3259E-06   2.4599E+00   6.4429E+00   4.9002E-02   1.0780E+04
        6       11   775110992    987369463       967982    2.7762E-06   2.6267E+00   6.7396E+00   5.3819E-02   1.0882E+04
        7       12   881552885   1170893348      1140418    3.3125E-06   2.5083E+00   6.5215E+00   5.4381E-02   1.0812E+04
        8       13   762383873    973274872       951727    2.7759E-06   2.6278E+00   6.7406E+00   5.4734E-02   1.0883E+04
        9       14   855436326   1004597925       984867    3.1234E-06   2.7395E+00   6.9284E+00   5.9636E-02   1.0947E+04

           total   70612110425  62562873035  36065787017    1.2483E+00

1tally        4        nps = 18520371907
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      10                                                                                   
                         4.00000E+03
 
 cell  10                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 5.54505E-06 0.0001   4.09940E-12 0.1265   0.00000E+00 0.0000   0.00000E+00 0.0000   0.00000E+00 0.0000
 
         time:       2.0000E+07             total                                                                  
                 0.00000E+00 0.0000   5.54506E-06 0.0001


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally        4

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00      yes         yes            constant    random       5.67
 passed?        yes          yes      yes          yes             yes      yes         yes               yes        yes         yes

 ===================================================================================================================================


 this tally meets the statistical criteria used to form confidence intervals: check the tally fluctuation chart to verify.
 the results in other bins associated with this tally may not meet these statistical criteria.

 ----- estimated confidence intervals:  -----

 estimated asymmetric confidence interval(1,2,3 sigma): 5.5444E-06 to 5.5458E-06; 5.5437E-06 to 5.5465E-06; 5.5430E-06 to 5.5472E-06
 estimated  symmetric confidence interval(1,2,3 sigma): 5.5444E-06 to 5.5458E-06; 5.5437E-06 to 5.5465E-06; 5.5430E-06 to 5.5472E-06

1analysis of the results in the tally fluctuation chart bin (tfc) for tally        4 with nps = 18520371907  print table 160


 normed average tally per history  = 5.54506E-06          unnormed average tally per history  = 2.21802E-02
 estimated tally relative error    = 0.0001               estimated variance of the variance  = 0.0000
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =   104414282          efficiency for the nonzero tallies  = 0.0056
 history number of largest  tally  = 10626091535          largest  unnormalized history tally = 9.31495E+01
 (largest  tally)/(average tally)  = 4.19966E+03          (largest  tally)/(avg nonzero tally)= 2.36769E+01

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 5.54506E-06


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            5.54506E-06             5.54506E-06                     0.000000
      relative error                  1.25852E-04             1.25852E-04                     0.000001
      variance of the variance        2.77567E-08             2.77671E-08                     0.000373
      shifted center                  5.54506E-06             5.54506E-06                     0.000000
      figure of merit                 3.15680E+02             3.15679E+02                    -0.000003

 the estimated inverse power slope of the 200 largest  tallies starting at 3.53968E+01 is 5.6723
 the large score tail of the empirical history score probability density function appears to have no unsampled regions.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (9.260E+04)*( 5.839E-02)**2 = (9.260E+04)*(3.409E-03) = 3.157E+02

1tally       14        nps = 18520371907
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      11                                                                                   
                         4.00000E+03
 
 cell  11                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 6.71435E-06 0.0001   4.67852E-12 0.1170   0.00000E+00 0.0000   0.00000E+00 0.0000   0.00000E+00 0.0000
 
         time:       2.0000E+07             total                                                                  
                 0.00000E+00 0.0000   6.71436E-06 0.0001


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

 estimated asymmetric confidence interval(1,2,3 sigma): 6.7136E-06 to 6.7151E-06; 6.7128E-06 to 6.7159E-06; 6.7121E-06 to 6.7167E-06
 estimated  symmetric confidence interval(1,2,3 sigma): 6.7136E-06 to 6.7151E-06; 6.7128E-06 to 6.7159E-06; 6.7121E-06 to 6.7167E-06

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       14 with nps = 18520371907  print table 160


 normed average tally per history  = 6.71436E-06          unnormed average tally per history  = 2.68574E-02
 estimated tally relative error    = 0.0001               estimated variance of the variance  = 0.0000
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =   121884332          efficiency for the nonzero tallies  = 0.0066
 history number of largest  tally  =  9466311804          largest  unnormalized history tally = 5.41995E+01
 (largest  tally)/(average tally)  = 2.01804E+03          (largest  tally)/(avg nonzero tally)= 1.32809E+01

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 6.71436E-06


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            6.71436E-06             6.71436E-06                     0.000000
      relative error                  1.14048E-04             1.14048E-04                     0.000000
      variance of the variance        2.14252E-08             2.14259E-08                     0.000037
      shifted center                  6.71436E-06             6.71436E-06                     0.000000
      figure of merit                 3.84408E+02             3.84408E+02                    -0.000001

 the estimated slope of the 198 largest  tallies starting at  3.55265E+01 appears to be decreasing at least exponentially.
 the large score tail of the empirical history score probability density function appears to have no unsampled regions.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (9.260E+04)*( 6.443E-02)**2 = (9.260E+04)*(4.151E-03) = 3.844E+02

1tally       24        nps = 18520371907
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      12                                                                                   
                         4.00000E+03
 
 cell  12                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 7.93160E-06 0.0001   5.24734E-12 0.1146   0.00000E+00 0.0000   0.00000E+00 0.0000   0.00000E+00 0.0000
 
         time:       2.0000E+07             total                                                                  
                 0.00000E+00 0.0000   7.93160E-06 0.0001


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       24

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00      yes         yes            constant    random       9.14
 passed?        yes          yes      yes          yes             yes      yes         yes               yes        yes         yes

 ===================================================================================================================================


 this tally meets the statistical criteria used to form confidence intervals: check the tally fluctuation chart to verify.
 the results in other bins associated with this tally may not meet these statistical criteria.

 ----- estimated confidence intervals:  -----

 estimated asymmetric confidence interval(1,2,3 sigma): 7.9308E-06 to 7.9324E-06; 7.9299E-06 to 7.9333E-06; 7.9291E-06 to 7.9341E-06
 estimated  symmetric confidence interval(1,2,3 sigma): 7.9308E-06 to 7.9324E-06; 7.9299E-06 to 7.9333E-06; 7.9291E-06 to 7.9341E-06

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       24 with nps = 18520371907  print table 160


 normed average tally per history  = 7.93160E-06          unnormed average tally per history  = 3.17264E-02
 estimated tally relative error    = 0.0001               estimated variance of the variance  = 0.0000
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =   146739096          efficiency for the nonzero tallies  = 0.0079
 history number of largest  tally  =  8175713662          largest  unnormalized history tally = 6.64675E+01
 (largest  tally)/(average tally)  = 2.09502E+03          (largest  tally)/(avg nonzero tally)= 1.65991E+01

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 7.93160E-06


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            7.93160E-06             7.93160E-06                     0.000000
      relative error                  1.05249E-04             1.05249E-04                     0.000000
      variance of the variance        1.79049E-08             1.79062E-08                     0.000072
      shifted center                  7.93160E-06             7.93160E-06                     0.000000
      figure of merit                 4.51371E+02             4.51370E+02                    -0.000001

 the estimated inverse power slope of the 200 largest  tallies starting at 3.63329E+01 is 9.1366
 the large score tail of the empirical history score probability density function appears to have no unsampled regions.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (9.260E+04)*( 6.982E-02)**2 = (9.260E+04)*(4.874E-03) = 4.514E+02

1tally       34        nps = 18520371907
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      13                                                                                   
                         4.00000E+03
 
 cell  13                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 6.71447E-06 0.0001   5.75894E-12 0.1202   0.00000E+00 0.0000   0.00000E+00 0.0000   0.00000E+00 0.0000
 
         time:       2.0000E+07             total                                                                  
                 0.00000E+00 0.0000   6.71448E-06 0.0001


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       34

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00      yes         yes            constant    random       6.37
 passed?        yes          yes      yes          yes             yes      yes         yes               yes        yes         yes

 ===================================================================================================================================


 this tally meets the statistical criteria used to form confidence intervals: check the tally fluctuation chart to verify.
 the results in other bins associated with this tally may not meet these statistical criteria.

 ----- estimated confidence intervals:  -----

 estimated asymmetric confidence interval(1,2,3 sigma): 6.7137E-06 to 6.7153E-06; 6.7129E-06 to 6.7160E-06; 6.7122E-06 to 6.7168E-06
 estimated  symmetric confidence interval(1,2,3 sigma): 6.7137E-06 to 6.7153E-06; 6.7129E-06 to 6.7160E-06; 6.7122E-06 to 6.7168E-06

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       34 with nps = 18520371907  print table 160


 normed average tally per history  = 6.71448E-06          unnormed average tally per history  = 2.68579E-02
 estimated tally relative error    = 0.0001               estimated variance of the variance  = 0.0000
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =   120370397          efficiency for the nonzero tallies  = 0.0065
 history number of largest  tally  =  5096095582          largest  unnormalized history tally = 6.06255E+01
 (largest  tally)/(average tally)  = 2.25727E+03          (largest  tally)/(avg nonzero tally)= 1.46708E+01

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 6.71448E-06


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            6.71448E-06             6.71448E-06                     0.000000
      relative error                  1.15352E-04             1.15352E-04                     0.000000
      variance of the variance        2.15052E-08             2.15064E-08                     0.000056
      shifted center                  6.71448E-06             6.71448E-06                     0.000000
      figure of merit                 3.75766E+02             3.75765E+02                    -0.000001

 the estimated inverse power slope of the 198 largest  tallies starting at 3.46930E+01 is 6.3734
 the large score tail of the empirical history score probability density function appears to have no unsampled regions.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (9.260E+04)*( 6.370E-02)**2 = (9.260E+04)*(4.058E-03) = 3.758E+02

1tally       44        nps = 18520371907
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      14                                                                                   
                         4.00000E+03
 
 cell  14                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 7.60985E-06 0.0001   5.44854E-12 0.1193   0.00000E+00 0.0000   0.00000E+00 0.0000   0.00000E+00 0.0000
 
         time:       2.0000E+07             total                                                                  
                 0.00000E+00 0.0000   7.60986E-06 0.0001


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       44

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00      yes         yes            constant    random      10.00
 passed?        yes          yes      yes          yes             yes      yes         yes               yes        yes         yes

 ===================================================================================================================================


 this tally meets the statistical criteria used to form confidence intervals: check the tally fluctuation chart to verify.
 the results in other bins associated with this tally may not meet these statistical criteria.

 ----- estimated confidence intervals:  -----

 estimated asymmetric confidence interval(1,2,3 sigma): 7.6090E-06 to 7.6107E-06; 7.6082E-06 to 7.6115E-06; 7.6074E-06 to 7.6123E-06
 estimated  symmetric confidence interval(1,2,3 sigma): 7.6090E-06 to 7.6107E-06; 7.6082E-06 to 7.6115E-06; 7.6074E-06 to 7.6123E-06

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       44 with nps = 18520371907  print table 160


 normed average tally per history  = 7.60986E-06          unnormed average tally per history  = 3.04394E-02
 estimated tally relative error    = 0.0001               estimated variance of the variance  = 0.0000
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =   133742993          efficiency for the nonzero tallies  = 0.0072
 history number of largest  tally  =  2390356528          largest  unnormalized history tally = 5.77762E+01
 (largest  tally)/(average tally)  = 1.89807E+03          (largest  tally)/(avg nonzero tally)= 1.37067E+01

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 7.60986E-06


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            7.60986E-06             7.60986E-06                     0.000000
      relative error                  1.08021E-04             1.08021E-04                     0.000000
      variance of the variance        1.83176E-08             1.83184E-08                     0.000042
      shifted center                  7.60986E-06             7.60986E-06                     0.000000
      figure of merit                 4.28499E+02             4.28498E+02                    -0.000001

 the estimated slope of the 200 largest  tallies starting at  3.43617E+01 appears to be decreasing at least exponentially.
 the large score tail of the empirical history score probability density function appears to have no unsampled regions.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (9.260E+04)*( 6.802E-02)**2 = (9.260E+04)*(4.627E-03) = 4.285E+02

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
   1048576000   5.5408E-06 0.0005 0.0000  8.4     316   6.7166E-06 0.0005 0.0000 10.0     385   7.9346E-06 0.0004 0.0000  7.9     452
   2097152000   5.5428E-06 0.0004 0.0000  7.8     316   6.7137E-06 0.0003 0.0000 10.0     385   7.9328E-06 0.0003 0.0000  5.2     452
   3145728000   5.5440E-06 0.0003 0.0000  6.3     316   6.7134E-06 0.0003 0.0000 10.0     385   7.9351E-06 0.0003 0.0000  5.5     452
   4194304000   5.5448E-06 0.0003 0.0000  7.5     316   6.7116E-06 0.0002 0.0000 10.0     385   7.9336E-06 0.0002 0.0000  6.0     452
   5242880000   5.5452E-06 0.0002 0.0000  5.3     316   6.7122E-06 0.0002 0.0000 10.0     385   7.9329E-06 0.0002 0.0000  6.8     452
   6291456000   5.5451E-06 0.0002 0.0000  4.7     316   6.7138E-06 0.0002 0.0000 10.0     385   7.9324E-06 0.0002 0.0000  8.6     452
   7340032000   5.5448E-06 0.0002 0.0000  4.3     316   6.7136E-06 0.0002 0.0000 10.0     384   7.9320E-06 0.0002 0.0000 10.0     451
   8388608000   5.5442E-06 0.0002 0.0000  5.1     316   6.7140E-06 0.0002 0.0000 10.0     384   7.9320E-06 0.0002 0.0000  7.1     451
   9437184000   5.5437E-06 0.0002 0.0000  5.9     316   6.7145E-06 0.0002 0.0000 10.0     384   7.9323E-06 0.0001 0.0000  6.5     451
  10485760000   5.5437E-06 0.0002 0.0000  6.1     316   6.7137E-06 0.0002 0.0000 10.0     384   7.9316E-06 0.0001 0.0000  6.6     451
  11534336000   5.5436E-06 0.0002 0.0000  5.0     316   6.7139E-06 0.0001 0.0000 10.0     384   7.9314E-06 0.0001 0.0000  7.4     451
  12582912000   5.5440E-06 0.0002 0.0000  4.9     316   6.7147E-06 0.0001 0.0000  8.5     384   7.9312E-06 0.0001 0.0000  9.6     451
  13631488000   5.5442E-06 0.0001 0.0000  4.7     316   6.7144E-06 0.0001 0.0000  7.7     384   7.9311E-06 0.0001 0.0000  9.5     451
  14680064000   5.5442E-06 0.0001 0.0000  4.9     316   6.7145E-06 0.0001 0.0000  9.3     384   7.9313E-06 0.0001 0.0000  9.2     451
  15728640000   5.5446E-06 0.0001 0.0000  4.9     316   6.7144E-06 0.0001 0.0000 10.0     384   7.9315E-06 0.0001 0.0000 10.0     451
  16777216000   5.5449E-06 0.0001 0.0000  5.2     316   6.7144E-06 0.0001 0.0000 10.0     384   7.9317E-06 0.0001 0.0000 10.0     451
  17825792000   5.5449E-06 0.0001 0.0000  5.7     316   6.7145E-06 0.0001 0.0000 10.0     384   7.9315E-06 0.0001 0.0000  9.5     451
  18520371907   5.5451E-06 0.0001 0.0000  5.7     316   6.7144E-06 0.0001 0.0000 10.0     384   7.9316E-06 0.0001 0.0000  9.1     451
 

                            tally       34                          tally       44
          nps      mean     error   vov  slope    fom      mean     error   vov  slope    fom
   1048576000   6.7121E-06 0.0005 0.0000 10.0     376   7.6070E-06 0.0005 0.0000 10.0     429
   2097152000   6.7152E-06 0.0003 0.0000 10.0     376   7.6099E-06 0.0003 0.0000 10.0     429
   3145728000   6.7168E-06 0.0003 0.0000  5.6     376   7.6093E-06 0.0003 0.0000  8.0     429
   4194304000   6.7143E-06 0.0002 0.0000  6.2     376   7.6094E-06 0.0002 0.0000  7.0     429
   5242880000   6.7143E-06 0.0002 0.0000  4.6     376   7.6093E-06 0.0002 0.0000  5.5     429
   6291456000   6.7149E-06 0.0002 0.0000  4.6     376   7.6092E-06 0.0002 0.0000  5.9     429
   7340032000   6.7147E-06 0.0002 0.0000  5.4     376   7.6100E-06 0.0002 0.0000  6.1     429
   8388608000   6.7147E-06 0.0002 0.0000  5.3     376   7.6094E-06 0.0002 0.0000  6.6     429
   9437184000   6.7142E-06 0.0002 0.0000  5.8     376   7.6091E-06 0.0002 0.0000  8.2     429
  10485760000   6.7143E-06 0.0002 0.0000  6.4     376   7.6092E-06 0.0001 0.0000  7.7     429
  11534336000   6.7144E-06 0.0001 0.0000  5.8     376   7.6097E-06 0.0001 0.0000  6.4     429
  12582912000   6.7144E-06 0.0001 0.0000  5.9     376   7.6097E-06 0.0001 0.0000  8.2     428
  13631488000   6.7140E-06 0.0001 0.0000  4.7     376   7.6095E-06 0.0001 0.0000 10.0     428
  14680064000   6.7141E-06 0.0001 0.0000  5.0     376   7.6095E-06 0.0001 0.0000 10.0     428
  15728640000   6.7142E-06 0.0001 0.0000  5.3     376   7.6094E-06 0.0001 0.0000 10.0     428
  16777216000   6.7143E-06 0.0001 0.0000  5.9     376   7.6096E-06 0.0001 0.0000 10.0     428
  17825792000   6.7143E-06 0.0001 0.0000  6.6     376   7.6097E-06 0.0001 0.0000 10.0     428
  18520371907   6.7145E-06 0.0001 0.0000  6.4     376   7.6099E-06 0.0001 0.0000 10.0     428

 ***********************************************************************************************************************

 dump no.  168 on file inpr     nps = 18520371907     coll =    36065787092     ctm =   200000.28   nrn =     
 551486657630

         9 warning messages so far.


 run terminated when it had used*****  minutes of computer time.

 computer time =******** minutes

 mcnp     version 6     06/19/14                     08/06/17 09:54:41                     probid =  08/06/17 01:34:53 
