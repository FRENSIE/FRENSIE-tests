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
  
1mcnp     version 6     ld=06/19/14                     08/06/17 00:32:03 
 *************************************************************************                 probid =  08/06/17 00:32:03 
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

 dump no.    2 on file inpr     nps =   108426991     coll =      211053884     ctm =     1200.31   nrn =       
 3228193209

 ***********************************************************************************************************************

 dump no.    3 on file inpr     nps =   217378663     coll =      423136083     ctm =     2400.60   nrn =       
 6471969968

 ***********************************************************************************************************************

 dump no.    4 on file inpr     nps =   326288790     coll =      635143282     ctm =     3600.98   nrn =       
 9714526158

 ***********************************************************************************************************************

 dump no.    5 on file inpr     nps =   434873519     coll =      846452185     ctm =     4801.37   nrn =      
 12946821107

 ***********************************************************************************************************************

 dump no.    6 on file inpr     nps =   542666154     coll =     1056295881     ctm =     6001.71   nrn =      
 16156214767

 ***********************************************************************************************************************

 dump no.    7 on file inpr     nps =   651782356     coll =     1268631579     ctm =     7201.99   nrn =      
 19404203960

 ***********************************************************************************************************************

 dump no.    8 on file inpr     nps =   760475983     coll =     1480191553     ctm =     8402.31   nrn =      
 22639970222

 ***********************************************************************************************************************

 dump no.    9 on file inpr     nps =   869635372     coll =     1692685734     ctm =     9602.82   nrn =      
 25890061290

 ***********************************************************************************************************************

 dump no.   10 on file inpr     nps =   978772931     coll =     1905137965     ctm =    10803.09   nrn =      
 29139384259

 ***********************************************************************************************************************

 dump no.   11 on file inpr     nps =  1087864690     coll =     2117509441     ctm =    12003.42   nrn =      
 32387440119

 ***********************************************************************************************************************

 dump no.   12 on file inpr     nps =  1196428630     coll =     2328912036     ctm =    13203.71   nrn =      
 35620236913

 ***********************************************************************************************************************

 dump no.   13 on file inpr     nps =  1305618730     coll =     2541505177     ctm =    14404.08   nrn =      
 38871661842

 ***********************************************************************************************************************

 dump no.   14 on file inpr     nps =  1414772480     coll =     2753980785     ctm =    15604.43   nrn =      
 42121469535

 ***********************************************************************************************************************

 dump no.   15 on file inpr     nps =  1523439504     coll =     2965526318     ctm =    16804.71   nrn =      
 45356955259

 ***********************************************************************************************************************

 dump no.   16 on file inpr     nps =  1632608940     coll =     3178077600     ctm =    18005.05   nrn =      
 48607617077

 ***********************************************************************************************************************

 dump no.   17 on file inpr     nps =  1741730643     coll =     3390537462     ctm =    19205.29   nrn =      
 51856927230

 ***********************************************************************************************************************

 dump no.   18 on file inpr     nps =  1850451931     coll =     3602129762     ctm =    20405.61   nrn =      
 55093288104

 ***********************************************************************************************************************

 dump no.   19 on file inpr     nps =  1959648879     coll =     3814747111     ctm =    21605.97   nrn =      
 58344802554

 ***********************************************************************************************************************

 dump no.   20 on file inpr     nps =  2068814401     coll =     4027287509     ctm =    22806.31   nrn =      
 61595435217

 ***********************************************************************************************************************

 dump no.   21 on file inpr     nps =  2177965695     coll =     4239807230     ctm =    24006.77   nrn =      
 64845565932

 ***********************************************************************************************************************

 dump no.   22 on file inpr     nps =  2286660414     coll =     4451466077     ctm =    25207.12   nrn =      
 68082502788

 ***********************************************************************************************************************

 dump no.   23 on file inpr     nps =  2395824408     coll =     4663975706     ctm =    26407.50   nrn =      
 71332646571

 ***********************************************************************************************************************

 dump no.   24 on file inpr     nps =  2504967872     coll =     4876485266     ctm =    27607.84   nrn =      
 74582702721

 ***********************************************************************************************************************

 dump no.   25 on file inpr     nps =  2613589952     coll =     5087922999     ctm =    28808.16   nrn =      
 77816543045

 ***********************************************************************************************************************

 dump no.   26 on file inpr     nps =  2722747024     coll =     5300377416     ctm =    30008.41   nrn =      
 81066166167

 ***********************************************************************************************************************

 dump no.   27 on file inpr     nps =  2831892256     coll =     5512816353     ctm =    31208.71   nrn =      
 84315423037

 ***********************************************************************************************************************

 dump no.   28 on file inpr     nps =  2940518360     coll =     5724376209     ctm =    32409.05   nrn =      
 87550687797

 ***********************************************************************************************************************

 dump no.   29 on file inpr     nps =  3049710464     coll =     5936928852     ctm =    33609.38   nrn =      
 90801579054

 ***********************************************************************************************************************

 dump no.   30 on file inpr     nps =  3158879376     coll =     6149454835     ctm =    34809.74   nrn =      
 94051962755

 ***********************************************************************************************************************

 dump no.   31 on file inpr     nps =  3268004952     coll =     6361850002     ctm =    36010.07   nrn =      
 97300778687

 ***********************************************************************************************************************

 dump no.   32 on file inpr     nps =  3376666344     coll =     6573295710     ctm =    37210.43   nrn =     
 100535001745

 ***********************************************************************************************************************

 dump no.   33 on file inpr     nps =  3485814088     coll =     6785774753     ctm =    38410.78   nrn =     
 103784723954

 ***********************************************************************************************************************

 dump no.   34 on file inpr     nps =  3594983512     coll =     6998247323     ctm =    39611.19   nrn =     
 107034563035

 ***********************************************************************************************************************

 dump no.   35 on file inpr     nps =  3703738136     coll =     7209972887     ctm =    40811.56   nrn =     
 110272715729

 ***********************************************************************************************************************

 dump no.   36 on file inpr     nps =  3812936288     coll =     7422531132     ctm =    42011.93   nrn =     
 113523756172

 ***********************************************************************************************************************

 dump no.   37 on file inpr     nps =  3922107224     coll =     7635023549     ctm =    43212.24   nrn =     
 116773778483

 ***********************************************************************************************************************

 dump no.   38 on file inpr     nps =  4030816488     coll =     7846577177     ctm =    44412.54   nrn =     
 120009768511

 ***********************************************************************************************************************

 dump no.   39 on file inpr     nps =  4140026736     coll =     8059136863     ctm =    45612.99   nrn =     
 123261360425

 ***********************************************************************************************************************

 dump no.   40 on file inpr     nps =  4249203208     coll =     8271725645     ctm =    46813.25   nrn =     
 126512445308

 ***********************************************************************************************************************

 dump no.   41 on file inpr     nps =  4358369608     coll =     8484141573     ctm =    48013.56   nrn =     
 129761684823

 ***********************************************************************************************************************

 dump no.   42 on file inpr     nps =  4466903480     coll =     8695432304     ctm =    49213.84   nrn =     
 132993138107

 ***********************************************************************************************************************

 dump no.   43 on file inpr     nps =  4576065344     coll =     8907933152     ctm =    50414.13   nrn =     
 136243318099

 ***********************************************************************************************************************

 dump no.   44 on file inpr     nps =  4685233256     coll =     9120383016     ctm =    51614.52   nrn =     
 139492908623

 ***********************************************************************************************************************

 dump no.   45 on file inpr     nps =  4793756544     coll =     9331685993     ctm =    52814.85   nrn =     
 142724486573

 ***********************************************************************************************************************

 dump no.   46 on file inpr     nps =  4902901776     coll =     9544167294     ctm =    54015.14   nrn =     
 145974202476

 ***********************************************************************************************************************

 dump no.   47 on file inpr     nps =  5012025328     coll =     9756530901     ctm =    55215.38   nrn =     
 149222492016

 ***********************************************************************************************************************

 dump no.   48 on file inpr     nps =  5120729056     coll =     9968106088     ctm =    56415.66   nrn =     
 152458609695

 ***********************************************************************************************************************

 dump no.   49 on file inpr     nps =  5229919648     coll =    10180527681     ctm =    57616.02   nrn =     
 155708184768

 ***********************************************************************************************************************

 dump no.   50 on file inpr     nps =  5339088560     coll =    10393038802     ctm =    58816.33   nrn =     
 158958507372

 ***********************************************************************************************************************

 dump no.   51 on file inpr     nps =  5448199016     coll =    10605523162     ctm =    60016.64   nrn =     
 162207959404

 ***********************************************************************************************************************

 dump no.   52 on file inpr     nps =  5556952640     coll =    10817286571     ctm =    61216.98   nrn =     
 165446449744

 ***********************************************************************************************************************

 dump no.   53 on file inpr     nps =  5666096360     coll =    11029903577     ctm =    62417.27   nrn =     
 168697629738

 ***********************************************************************************************************************

 dump no.   54 on file inpr     nps =  5775270115     coll =    11242449999     ctm =    63617.58   nrn =     
 171948405463

 ***********************************************************************************************************************

 dump no.   55 on file inpr     nps =  5883499636     coll =    11453207969     ctm =    64817.91   nrn =     
 175171508593

 ***********************************************************************************************************************

 dump no.   56 on file inpr     nps =  5990340580     coll =    11661209141     ctm =    66018.30   nrn =     
 178352620799

 ***********************************************************************************************************************

 dump no.   57 on file inpr     nps =  6099516052     coll =    11873628790     ctm =    67218.65   nrn =     
 181601984156

 ***********************************************************************************************************************

 dump no.   58 on file inpr     nps =  6208209196     coll =    12085188212     ctm =    68418.89   nrn =     
 184837965793

 ***********************************************************************************************************************

 dump no.   59 on file inpr     nps =  6317388312     coll =    12297780834     ctm =    69619.23   nrn =     
 188089280016

 ***********************************************************************************************************************

 dump no.   60 on file inpr     nps =  6426557736     coll =    12510349918     ctm =    70819.52   nrn =     
 191340049891

 ***********************************************************************************************************************

 dump no.   61 on file inpr     nps =  6535692384     coll =    12722755955     ctm =    72019.91   nrn =     
 194588860451

 ***********************************************************************************************************************

 dump no.   62 on file inpr     nps =  6644178384     coll =    12933986252     ctm =    73220.14   nrn =     
 197819366960

 ***********************************************************************************************************************

 dump no.   63 on file inpr     nps =  6753337224     coll =    13146463762     ctm =    74420.45   nrn =     
 201069166157

 ***********************************************************************************************************************

 dump no.   64 on file inpr     nps =  6862473872     coll =    13358991898     ctm =    75620.85   nrn =     
 204319413008

 ***********************************************************************************************************************

 dump no.   65 on file inpr     nps =  6970870664     coll =    13570025202     ctm =    76821.20   nrn =     
 207546870960

 ***********************************************************************************************************************

 dump no.   66 on file inpr     nps =  7079976584     coll =    13782442201     ctm =    78021.48   nrn =     
 210795519117

 ***********************************************************************************************************************

 dump no.   67 on file inpr     nps =  7189041680     coll =    13994838625     ctm =    79221.75   nrn =     
 214043484697

 ***********************************************************************************************************************

 dump no.   68 on file inpr     nps =  7297656200     coll =    14206233143     ctm =    80422.13   nrn =     
 217276981593

 ***********************************************************************************************************************

 dump no.   69 on file inpr     nps =  7406807968     coll =    14418714042     ctm =    81622.43   nrn =     
 220526921194

 ***********************************************************************************************************************

 dump no.   70 on file inpr     nps =  7515960760     coll =    14631157479     ctm =    82822.76   nrn =     
 223776267834

 ***********************************************************************************************************************

 dump no.   71 on file inpr     nps =  7625062144     coll =    14843532353     ctm =    84022.99   nrn =     
 227024431899

 ***********************************************************************************************************************

 dump no.   72 on file inpr     nps =  7733649448     coll =    15054992091     ctm =    85223.33   nrn =     
 230258203810

 ***********************************************************************************************************************

 dump no.   73 on file inpr     nps =  7842803752     coll =    15267494973     ctm =    86423.66   nrn =     
 233508243722

 ***********************************************************************************************************************

 dump no.   74 on file inpr     nps =  7951947960     coll =    15479936331     ctm =    87624.05   nrn =     
 236757497260

 ***********************************************************************************************************************

 dump no.   75 on file inpr     nps =  8060603304     coll =    15691317980     ctm =    88824.44   nrn =     
 239991196075

 ***********************************************************************************************************************

 dump no.   76 on file inpr     nps =  8169733416     coll =    15903654876     ctm =    90024.82   nrn =     
 243239491820

 ***********************************************************************************************************************

 dump no.   77 on file inpr     nps =  8278848408     coll =    16116034170     ctm =    91225.08   nrn =     
 246487824808

 ***********************************************************************************************************************

 dump no.   78 on file inpr     nps =  8387472000     coll =    16327546077     ctm =    92425.47   nrn =     
 249722488027

 ***********************************************************************************************************************

 dump no.   79 on file inpr     nps =  8496604112     coll =    16540067392     ctm =    93625.80   nrn =     
 252972555803

 ***********************************************************************************************************************

 dump no.   80 on file inpr     nps =  8605725152     coll =    16752527015     ctm =    94826.07   nrn =     
 256221772427

 ***********************************************************************************************************************

 dump no.   81 on file inpr     nps =  8714823512     coll =    16964833375     ctm =    96026.44   nrn =     
 259469085352

 ***********************************************************************************************************************

 dump no.   82 on file inpr     nps =  8823537824     coll =    17176411231     ctm =    97226.74   nrn =     
 262705375975

 ***********************************************************************************************************************

 dump no.   83 on file inpr     nps =  8932680520     coll =    17388902229     ctm =    98427.15   nrn =     
 265955254578

 ***********************************************************************************************************************

 dump no.   84 on file inpr     nps =  9041830288     coll =    17601313562     ctm =    99627.46   nrn =     
 269204292112

 ***********************************************************************************************************************

 dump no.   85 on file inpr     nps =  9150514360     coll =    17812897191     ctm =   100827.72   nrn =     
 272440360624

 ***********************************************************************************************************************

 dump no.   86 on file inpr     nps =  9259650520     coll =    18025284448     ctm =   102028.01   nrn =     
 275689038663

 ***********************************************************************************************************************

 dump no.   87 on file inpr     nps =  9368767024     coll =    18237577778     ctm =   103228.31   nrn =     
 278936641685

 ***********************************************************************************************************************

 dump no.   88 on file inpr     nps =  9477422856     coll =    18449014194     ctm =   104428.61   nrn =     
 282170856185

 ***********************************************************************************************************************

 dump no.   89 on file inpr     nps =  9586568088     coll =    18661491328     ctm =   105628.93   nrn =     
 285420439109

 ***********************************************************************************************************************

 dump no.   90 on file inpr     nps =  9695701224     coll =    18873895648     ctm =   106829.20   nrn =     
 288669385750

 ***********************************************************************************************************************

 dump no.   91 on file inpr     nps =  9804805632     coll =    19086299379     ctm =   108029.55   nrn =     
 291917782097

 ***********************************************************************************************************************

 dump no.   92 on file inpr     nps =  9913405032     coll =    19297739352     ctm =   109229.88   nrn =     
 295151491173

 ***********************************************************************************************************************

 dump no.   93 on file inpr     nps = 10022547728     coll =    19510127623     ctm =   110430.21   nrn =     
 298400224329

 ***********************************************************************************************************************

 dump no.   94 on file inpr     nps = 10131659696     coll =    19722491085     ctm =   111630.51   nrn =     
 301648463944

 ***********************************************************************************************************************

 dump no.   95 on file inpr     nps = 10240327136     coll =    19933992273     ctm =   112830.78   nrn =     
 304883465760

 ***********************************************************************************************************************

 dump no.   96 on file inpr     nps = 10349423984     coll =    20146448799     ctm =   114031.06   nrn =     
 308132338462

 ***********************************************************************************************************************

 dump no.   97 on file inpr     nps = 10458472448     coll =    20358664564     ctm =   115231.46   nrn =     
 311378433489

 ***********************************************************************************************************************

 dump no.   98 on file inpr     nps = 10567138864     coll =    20570196928     ctm =   116431.78   nrn =     
 314613764702

 ***********************************************************************************************************************

 dump no.   99 on file inpr     nps = 10676240248     coll =    20782552708     ctm =   117632.07   nrn =     
 317861834850

 ***********************************************************************************************************************

 dump no.  100 on file inpr     nps = 10785338608     coll =    20994979905     ctm =   118832.41   nrn =     
 321110592041

 ***********************************************************************************************************************

 dump no.  101 on file inpr     nps = 10894447552     coll =    21207305966     ctm =   120032.77   nrn =     
 324358293321

 ***********************************************************************************************************************

 dump no.  102 on file inpr     nps = 11002941112     coll =    21418533816     ctm =   121233.06   nrn =     
 327588729575

 ***********************************************************************************************************************

 dump no.  103 on file inpr     nps = 11112022840     coll =    21630982091     ctm =   122433.29   nrn =     
 330837508597

 ***********************************************************************************************************************

 dump no.  104 on file inpr     nps = 11221097008     coll =    21843259452     ctm =   123633.57   nrn =     
 334084475446

 ***********************************************************************************************************************

 dump no.  105 on file inpr     nps = 11329702456     coll =    22054619458     ctm =   124833.90   nrn =     
 337317379942

 ***********************************************************************************************************************

 dump no.  106 on file inpr     nps = 11438799304     coll =    22267007023     ctm =   126034.20   nrn =     
 340565473847

 ***********************************************************************************************************************

 dump no.  107 on file inpr     nps = 11547859328     coll =    22479248880     ctm =   127234.52   nrn =     
 343811982968

 ***********************************************************************************************************************

 dump no.  108 on file inpr     nps = 11656401272     coll =    22690540805     ctm =   128434.83   nrn =     
 347043495988

 ***********************************************************************************************************************

 dump no.  109 on file inpr     nps = 11765548016     coll =    22903011805     ctm =   129635.21   nrn =     
 350293071599

 ***********************************************************************************************************************

 dump no.  110 on file inpr     nps = 11874718952     coll =    23115537873     ctm =   130835.58   nrn =     
 353543659978

 ***********************************************************************************************************************

 dump no.  111 on file inpr     nps = 11983855112     coll =    23327977614     ctm =   132035.98   nrn =     
 356792859911

 ***********************************************************************************************************************

 dump no.  112 on file inpr     nps = 12092543720     coll =    23539539303     ctm =   133236.33   nrn =     
 360028665782

 ***********************************************************************************************************************

 dump no.  113 on file inpr     nps = 12201729776     coll =    23752104097     ctm =   134436.70   nrn =     
 363279702830

 ***********************************************************************************************************************

 dump no.  114 on file inpr     nps = 12310896176     coll =    23964629491     ctm =   135636.97   nrn =     
 366530176180

 ***********************************************************************************************************************

 dump no.  115 on file inpr     nps = 12419559080     coll =    24176118613     ctm =   136837.28   nrn =     
 369765121787

 ***********************************************************************************************************************

 dump no.  116 on file inpr     nps = 12528713384     coll =    24388719072     ctm =   138037.56   nrn =     
 373016228652

 ***********************************************************************************************************************

 dump no.  117 on file inpr     nps = 12637856568     coll =    24601156276     ctm =   139237.87   nrn =     
 376265441256

 ***********************************************************************************************************************

 dump no.  118 on file inpr     nps = 12746537616     coll =    24812685502     ctm =   140438.19   nrn =     
 379500914585

 ***********************************************************************************************************************

 dump no.  119 on file inpr     nps = 12855693432     coll =    25025206162     ctm =   141638.49   nrn =     
 382751073982

 ***********************************************************************************************************************

 dump no.  120 on file inpr     nps = 12964859832     coll =    25237797767     ctm =   142838.74   nrn =     
 386002036948

 ***********************************************************************************************************************

 dump no.  121 on file inpr     nps = 13074000528     coll =    25450206879     ctm =   144039.01   nrn =     
 389250926944

 ***********************************************************************************************************************

 dump no.  122 on file inpr     nps = 13182572712     coll =    25661520114     ctm =   145239.33   nrn =     
 392483173582

 ***********************************************************************************************************************

 dump no.  123 on file inpr     nps = 13291739112     coll =    25874048694     ctm =   146439.66   nrn =     
 395733676166

 ***********************************************************************************************************************

 dump no.  124 on file inpr     nps = 13400893416     coll =    26086563810     ctm =   147639.94   nrn =     
 398983823962

 ***********************************************************************************************************************

 dump no.  125 on file inpr     nps = 13508245416     coll =    26295418517     ctm =   148840.29   nrn =     
 402178702251

 ***********************************************************************************************************************

 dump no.  126 on file inpr     nps = 13617408792     coll =    26507954201     ctm =   150040.57   nrn =     
 405429075816

 ***********************************************************************************************************************

 dump no.  127 on file inpr     nps = 13726542904     coll =    26720496695     ctm =   151240.96   nrn =     
 408679214374

 ***********************************************************************************************************************

 dump no.  128 on file inpr     nps = 13835169520     coll =    26931999562     ctm =   152441.26   nrn =     
 411913806097

 ***********************************************************************************************************************

 dump no.  129 on file inpr     nps = 13944352552     coll =    27144595930     ctm =   153641.59   nrn =     
 415165137111

 ***********************************************************************************************************************

 dump no.  130 on file inpr     nps = 14053544656     coll =    27357181103     ctm =   154841.97   nrn =     
 418416278671

 ***********************************************************************************************************************

 dump no.  131 on file inpr     nps = 14162691400     coll =    27569652073     ctm =   156042.29   nrn =     
 421665983294

 ***********************************************************************************************************************

 dump no.  132 on file inpr     nps = 14271302896     coll =    27781155386     ctm =   157242.63   nrn =     
 424900474291

 ***********************************************************************************************************************

 dump no.  133 on file inpr     nps = 14380482904     coll =    27993667546     ctm =   158443.03   nrn =     
 428150844488

 ***********************************************************************************************************************

 dump no.  134 on file inpr     nps = 14489662912     coll =    28206202515     ctm =   159643.30   nrn =     
 431401482127

 ***********************************************************************************************************************

 dump no.  135 on file inpr     nps = 14598315232     coll =    28417661277     ctm =   160843.63   nrn =     
 434636057869

 ***********************************************************************************************************************

 dump no.  136 on file inpr     nps = 14707496216     coll =    28630123809     ctm =   162043.89   nrn =     
 437885913221

 ***********************************************************************************************************************

 dump no.  137 on file inpr     nps = 14816691344     coll =    28842644016     ctm =   163244.25   nrn =     
 441136675307

 ***********************************************************************************************************************

 dump no.  138 on file inpr     nps = 14925414728     coll =    29054306089     ctm =   164444.55   nrn =     
 444373833600

 ***********************************************************************************************************************

 dump no.  139 on file inpr     nps = 15034624976     coll =    29266934641     ctm =   165644.86   nrn =     
 447625937048

 ***********************************************************************************************************************

 dump no.  140 on file inpr     nps = 15143785328     coll =    29479493507     ctm =   166845.13   nrn =     
 450876721149

 ***********************************************************************************************************************

 dump no.  141 on file inpr     nps = 15252957776     coll =    29691991027     ctm =   168045.43   nrn =     
 454126867371

 ***********************************************************************************************************************

 dump no.  142 on file inpr     nps = 15361569272     coll =    29903361200     ctm =   169245.77   nrn =     
 457359962533

 ***********************************************************************************************************************

 dump no.  143 on file inpr     nps = 15470747768     coll =    30115959807     ctm =   170446.12   nrn =     
 460611153531

 ***********************************************************************************************************************

 dump no.  144 on file inpr     nps = 15579915680     coll =    30328429479     ctm =   171646.48   nrn =     
 463860959202

 ***********************************************************************************************************************

 dump no.  145 on file inpr     nps = 15688617896     coll =    30540038135     ctm =   172846.85   nrn =     
 467097478823

 ***********************************************************************************************************************

 dump no.  146 on file inpr     nps = 15797748984     coll =    30752555990     ctm =   174047.13   nrn =     
 470347419046

 ***********************************************************************************************************************

 dump no.  147 on file inpr     nps = 15906888168     coll =    30965033756     ctm =   175247.44   nrn =     
 473597226945

 ***********************************************************************************************************************

 dump no.  148 on file inpr     nps = 16015620624     coll =    31176722270     ctm =   176447.82   nrn =     
 476834860622

 ***********************************************************************************************************************

 dump no.  149 on file inpr     nps = 16124785512     coll =    31389199829     ctm =   177648.16   nrn =     
 480084709134

 ***********************************************************************************************************************

 dump no.  150 on file inpr     nps = 16233941328     coll =    31601696585     ctm =   178848.49   nrn =     
 483334709888

 ***********************************************************************************************************************

 dump no.  151 on file inpr     nps = 16343047248     coll =    31814121183     ctm =   180048.80   nrn =     
 486583557297

 ***********************************************************************************************************************

 dump no.  152 on file inpr     nps = 16451799360     coll =    32025859184     ctm =   181249.08   nrn =     
 489821747412

 ***********************************************************************************************************************

 dump no.  153 on file inpr     nps = 16560965760     coll =    32238304517     ctm =   182449.36   nrn =     
 493071340494

 ***********************************************************************************************************************

 dump no.  154 on file inpr     nps = 16670129136     coll =    32450749022     ctm =   183649.64   nrn =     
 496320932189

 ***********************************************************************************************************************

 dump no.  155 on file inpr     nps = 16778832328     coll =    32662301346     ctm =   184850.11   nrn =     
 499556865333

 ***********************************************************************************************************************

 dump no.  156 on file inpr     nps = 16887991168     coll =    32874820382     ctm =   186050.43   nrn =     
 502807221172

 ***********************************************************************************************************************

 dump no.  157 on file inpr     nps = 16997128840     coll =    33087236729     ctm =   187250.77   nrn =     
 506056321329

 ***********************************************************************************************************************

 dump no.  158 on file inpr     nps = 17105769064     coll =    33298611940     ctm =   188451.14   nrn =     
 509289795240

 ***********************************************************************************************************************

 dump no.  159 on file inpr     nps = 17214914296     coll =    33511163882     ctm =   189651.43   nrn =     
 512540172659

 ***********************************************************************************************************************

 dump no.  160 on file inpr     nps = 17324070112     coll =    33723666642     ctm =   190851.78   nrn =     
 515793791295

 ***********************************************************************************************************************

 dump no.  161 on file inpr     nps = 17433231976     coll =    33936109303     ctm =   192052.17   nrn =     
 519043212196

 ***********************************************************************************************************************

 dump no.  162 on file inpr     nps = 17541894880     coll =    34147660995     ctm =   193252.55   nrn =     
 522278759371

 ***********************************************************************************************************************

 dump no.  163 on file inpr     nps = 17650804240     coll =    34359666921     ctm =   194452.88   nrn =     
 525521386241

 ***********************************************************************************************************************

 dump no.  164 on file inpr     nps = 17759940400     coll =    34572174945     ctm =   195653.26   nrn =     
 528771256942

 ***********************************************************************************************************************

 dump no.  165 on file inpr     nps = 17868457616     coll =    34783386057     ctm =   196853.61   nrn =     
 532001953739

 ***********************************************************************************************************************

 dump no.  166 on file inpr     nps = 17977605872     coll =    34995872433     ctm =   198053.93   nrn =     
 535251746591

 ***********************************************************************************************************************

 dump no.  167 on file inpr     nps = 18086717840     coll =    35208289093     ctm =   199254.20   nrn =     
 538500522314
1problem summary                                                                                                           

      run terminated when it had used*****  minutes of computer time.
+                                                                                                    08/06/17 08:51:59 
      c //-------------------------------------------------------------------------//      probid =  08/06/17 00:32:03 

 neutron creation    tracks      weight        energy            neutron loss        tracks      weight        energy
                                 (per source particle)                                           (per source particle)

 source         18154556744    1.0000E+00    1.4100E+01          escape         28884961549    1.0324E+00    1.0605E+01
 nucl. interaction        0    0.            0.                  energy cutoff            0    0.            0.        
 particle decay           0    0.            0.                  time cutoff              0    0.            0.        
 weight window  10530954936    1.8169E-02    9.0377E-02          weight window   1857701593    1.8170E-02    9.0380E-02
 cell importance          0    0.            0.                  cell importance          0    0.            0.        
 weight cutoff            0    0.            0.                  weight cutoff            0    0.            0.        
 e or t importance        0    0.            0.                  e or t importance        0    0.            0.        
 dxtran                   0    0.            0.                  dxtran                   0    0.            0.        
 forced collisions        0    0.            0.                  forced collisions        0    0.            0.        
 exp. transform           0    0.            0.                  exp. transform           0    0.            0.        
 upscattering             0    0.            1.7495E-14          downscattering           0    0.            1.8659E+00
 photonuclear             0    0.            0.                  capture                102    5.0096E-02    6.6579E-01
 (n,xn)          4114303128    1.6502E-01    1.9589E-01          loss to (n,xn)  2057151564    8.2508E-02    1.1597E+00
 prompt fission           0    0.            0.                  loss to fission          0    0.            0.        
 delayed fission          0    0.            0.                  nucl. interaction        0    0.            0.        
 prompt photofis          0    0.            0.                  particle decay           0    0.            0.        
 tabular boundary         0    0.            0.                  tabular boundary         0    0.            0.        
 tabular sampling         0    0.            0.                  elastic scatter          0    0.            0.        
     total      32799814808    1.1832E+00    1.4386E+01              total      32799814808    1.1832E+00    1.4386E+01

   number of neutrons banked             -1647379783        average time of (shakes)              cutoffs
   neutron tracks per source particle     1.8067E+00          escape            5.0000E+06          tco   2.0000E+07
   neutron collisions per source particle 1.9466E+00          capture           5.0000E+06          eco   0.0000E+00
   total neutron collisions              -2147483648          capture or escape 5.0000E+06          wc1  -5.0000E-01
   net multiplication              1.0825E+00 0.0000          any termination   4.6501E+06          wc2  -2.5000E-01

 computer time so far in this run200002.70 minutes            maximum number ever in bank        12
 computer time in mcrun          200000.28 minutes            bank overflows to backup file       0
 source particles per minute            9.0773E+04
 random numbers generated             540520315074            most random numbers used was     3596033 in history 17290241900
 
  warning.   random number stride   152917 exceeded        3 times.
 
  warning.  random number period exceeded.  decrease stride.

 range of sampled source weights = 9.4499E-01 to 1.0618E+00

 number of histories processed by each thread
   879765343   908054374   916461126   911755886   910283547   904634206   910972162   907928937   908273928   906763136
   908190421   907968537   909142145   904863931   910282030   908172188   909797710   914112973   908273765   908860399
 
  warning.  some of the geometry is covered by a weight window mesh.
1neutron  activity in each cell                                                                         print table 126

                       tracks     population   collisions   collisions     number        flux        average      average
              cell    entering                               * weight     weighted     weighted   track weight   track mfp
                                                          (per history)    energy       energy     (relative)      (cm)

        1        1 36612808020  29224931890    105065769    4.1449E-03   6.1818E+00   1.0896E+01   7.5489E-01   1.1968E+04
        2        2 17839023360  18564997021  35158734320    1.2416E+00   3.5024E+00   8.2607E+00   6.5690E-01   4.2403E+00
        3        3 10917754436   8527645098     71657832    2.6154E-03   3.1125E+00   7.8710E+00   7.1567E-01   1.1157E+04
        4        4    77882384     77829240        51614    2.5098E-06   3.7482E+00   8.6527E+00   9.0419E-01   1.1409E+04
        5       10   614315774    879442347       869741    2.3260E-06   2.4600E+00   6.4430E+00   4.9022E-02   1.0780E+04
        6       11   759552962    968053591       949291    2.7772E-06   2.6267E+00   6.7396E+00   5.3811E-02   1.0882E+04
        7       12   863984157   1147838106      1117518    3.3110E-06   2.5083E+00   6.5215E+00   5.4379E-02   1.0812E+04
        8       13   747003716    954167507       932842    2.7755E-06   2.6276E+00   6.7405E+00   5.4729E-02   1.0883E+04
        9       14   838440003    984825936       965892    3.1247E-06   2.7396E+00   6.9284E+00   5.9632E-02   1.0947E+04

           total   69270764812  61329730736  35340344819    1.2483E+00

1tally        4        nps = 18154556744
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      10                                                                                   
                         4.00000E+03
 
 cell  10                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 5.54489E-06 0.0001   4.02736E-12 0.1314   0.00000E+00 0.0000   0.00000E+00 0.0000   0.00000E+00 0.0000
 
         time:       2.0000E+07             total                                                                  
                 0.00000E+00 0.0000   5.54489E-06 0.0001


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally        4

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00      yes         yes            constant    random       4.93
 passed?        yes          yes      yes          yes             yes      yes         yes               yes        yes         yes

 ===================================================================================================================================


 this tally meets the statistical criteria used to form confidence intervals: check the tally fluctuation chart to verify.
 the results in other bins associated with this tally may not meet these statistical criteria.

 ----- estimated confidence intervals:  -----

 estimated asymmetric confidence interval(1,2,3 sigma): 5.5442E-06 to 5.5456E-06; 5.5435E-06 to 5.5463E-06; 5.5428E-06 to 5.5470E-06
 estimated  symmetric confidence interval(1,2,3 sigma): 5.5442E-06 to 5.5456E-06; 5.5435E-06 to 5.5463E-06; 5.5428E-06 to 5.5470E-06

1analysis of the results in the tally fluctuation chart bin (tfc) for tally        4 with nps = 18154556744  print table 160


 normed average tally per history  = 5.54489E-06          unnormed average tally per history  = 2.21796E-02
 estimated tally relative error    = 0.0001               estimated variance of the variance  = 0.0000
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =   102143959          efficiency for the nonzero tallies  = 0.0056
 history number of largest  tally  = 10626091535          largest  unnormalized history tally = 9.31495E+01
 (largest  tally)/(average tally)  = 4.19979E+03          (largest  tally)/(avg nonzero tally)= 2.36295E+01

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 5.54489E-06


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            5.54489E-06             5.54489E-06                     0.000000
      relative error                  1.27149E-04             1.27149E-04                     0.000001
      variance of the variance        2.82981E-08             2.83089E-08                     0.000380
      shifted center                  5.54489E-06             5.54489E-06                     0.000000
      figure of merit                 3.09274E+02             3.09273E+02                    -0.000003

 the estimated inverse power slope of the 200 largest  tallies starting at 3.53815E+01 is 4.9290
 the large score tail of the empirical history score probability density function appears to have no unsampled regions.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (9.077E+04)*( 5.837E-02)**2 = (9.077E+04)*(3.407E-03) = 3.093E+02

1tally       14        nps = 18154556744
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      11                                                                                   
                         4.00000E+03
 
 cell  11                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 6.71445E-06 0.0001   4.88203E-12 0.1157   0.00000E+00 0.0000   0.00000E+00 0.0000   0.00000E+00 0.0000
 
         time:       2.0000E+07             total                                                                  
                 0.00000E+00 0.0000   6.71446E-06 0.0001


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

 estimated asymmetric confidence interval(1,2,3 sigma): 6.7137E-06 to 6.7152E-06; 6.7129E-06 to 6.7160E-06; 6.7121E-06 to 6.7168E-06
 estimated  symmetric confidence interval(1,2,3 sigma): 6.7137E-06 to 6.7152E-06; 6.7129E-06 to 6.7160E-06; 6.7121E-06 to 6.7168E-06

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       14 with nps = 18154556744  print table 160


 normed average tally per history  = 6.71446E-06          unnormed average tally per history  = 2.68578E-02
 estimated tally relative error    = 0.0001               estimated variance of the variance  = 0.0000
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =   119467000          efficiency for the nonzero tallies  = 0.0066
 history number of largest  tally  =  9466311804          largest  unnormalized history tally = 5.41995E+01
 (largest  tally)/(average tally)  = 2.01802E+03          (largest  tally)/(avg nonzero tally)= 1.32797E+01

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 6.71446E-06


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            6.71446E-06             6.71446E-06                     0.000000
      relative error                  1.15195E-04             1.15195E-04                     0.000000
      variance of the variance        2.18607E-08             2.18615E-08                     0.000038
      shifted center                  6.71446E-06             6.71446E-06                     0.000000
      figure of merit                 3.76790E+02             3.76790E+02                    -0.000001

 the estimated slope of the 200 largest  tallies starting at  3.53859E+01 appears to be decreasing at least exponentially.
 the large score tail of the empirical history score probability density function appears to have no unsampled regions.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (9.077E+04)*( 6.443E-02)**2 = (9.077E+04)*(4.151E-03) = 3.768E+02

1tally       24        nps = 18154556744
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      12                                                                                   
                         4.00000E+03
 
 cell  12                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 7.93161E-06 0.0001   5.07867E-12 0.1164   0.00000E+00 0.0000   0.00000E+00 0.0000   0.00000E+00 0.0000
 
         time:       2.0000E+07             total                                                                  
                 0.00000E+00 0.0000   7.93161E-06 0.0001


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       24

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00      yes         yes            constant    random       9.24
 passed?        yes          yes      yes          yes             yes      yes         yes               yes        yes         yes

 ===================================================================================================================================


 this tally meets the statistical criteria used to form confidence intervals: check the tally fluctuation chart to verify.
 the results in other bins associated with this tally may not meet these statistical criteria.

 ----- estimated confidence intervals:  -----

 estimated asymmetric confidence interval(1,2,3 sigma): 7.9308E-06 to 7.9325E-06; 7.9299E-06 to 7.9333E-06; 7.9291E-06 to 7.9341E-06
 estimated  symmetric confidence interval(1,2,3 sigma): 7.9308E-06 to 7.9325E-06; 7.9299E-06 to 7.9333E-06; 7.9291E-06 to 7.9341E-06

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       24 with nps = 18154556744  print table 160


 normed average tally per history  = 7.93161E-06          unnormed average tally per history  = 3.17264E-02
 estimated tally relative error    = 0.0001               estimated variance of the variance  = 0.0000
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =   143825093          efficiency for the nonzero tallies  = 0.0079
 history number of largest  tally  =  8175713662          largest  unnormalized history tally = 6.62459E+01
 (largest  tally)/(average tally)  = 2.08803E+03          (largest  tally)/(avg nonzero tally)= 1.65420E+01

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 7.93161E-06


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            7.93161E-06             7.93161E-06                     0.000000
      relative error                  1.06307E-04             1.06307E-04                     0.000000
      variance of the variance        1.82676E-08             1.82689E-08                     0.000073
      shifted center                  7.93161E-06             7.93161E-06                     0.000000
      figure of merit                 4.42433E+02             4.42433E+02                    -0.000001

 the estimated inverse power slope of the 200 largest  tallies starting at 3.63329E+01 is 9.2441
 the large score tail of the empirical history score probability density function appears to have no unsampled regions.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (9.077E+04)*( 6.981E-02)**2 = (9.077E+04)*(4.874E-03) = 4.424E+02

1tally       34        nps = 18154556744
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      13                                                                                   
                         4.00000E+03
 
 cell  13                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 6.71430E-06 0.0001   5.79355E-12 0.1216   0.00000E+00 0.0000   0.00000E+00 0.0000   0.00000E+00 0.0000
 
         time:       2.0000E+07             total                                                                  
                 0.00000E+00 0.0000   6.71430E-06 0.0001


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       34

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00      yes         yes            constant    random       6.02
 passed?        yes          yes      yes          yes             yes      yes         yes               yes        yes         yes

 ===================================================================================================================================


 this tally meets the statistical criteria used to form confidence intervals: check the tally fluctuation chart to verify.
 the results in other bins associated with this tally may not meet these statistical criteria.

 ----- estimated confidence intervals:  -----

 estimated asymmetric confidence interval(1,2,3 sigma): 6.7135E-06 to 6.7151E-06; 6.7127E-06 to 6.7159E-06; 6.7120E-06 to 6.7166E-06
 estimated  symmetric confidence interval(1,2,3 sigma): 6.7135E-06 to 6.7151E-06; 6.7127E-06 to 6.7159E-06; 6.7120E-06 to 6.7166E-06

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       34 with nps = 18154556744  print table 160


 normed average tally per history  = 6.71430E-06          unnormed average tally per history  = 2.68572E-02
 estimated tally relative error    = 0.0001               estimated variance of the variance  = 0.0000
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =   117979725          efficiency for the nonzero tallies  = 0.0065
 history number of largest  tally  =  5096095582          largest  unnormalized history tally = 6.06255E+01
 (largest  tally)/(average tally)  = 2.25733E+03          (largest  tally)/(avg nonzero tally)= 1.46695E+01

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 6.71430E-06


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            6.71430E-06             6.71430E-06                     0.000000
      relative error                  1.16516E-04             1.16516E-04                     0.000000
      variance of the variance        2.19422E-08             2.19434E-08                     0.000057
      shifted center                  6.71430E-06             6.71430E-06                     0.000000
      figure of merit                 3.68297E+02             3.68297E+02                    -0.000001

 the estimated inverse power slope of the 198 largest  tallies starting at 3.46744E+01 is 6.0240
 the large score tail of the empirical history score probability density function appears to have no unsampled regions.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (9.077E+04)*( 6.370E-02)**2 = (9.077E+04)*(4.057E-03) = 3.683E+02

1tally       44        nps = 18154556744
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      14                                                                                   
                         4.00000E+03
 
 cell  14                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 7.60982E-06 0.0001   5.53573E-12 0.1197   0.00000E+00 0.0000   0.00000E+00 0.0000   0.00000E+00 0.0000
 
         time:       2.0000E+07             total                                                                  
                 0.00000E+00 0.0000   7.60982E-06 0.0001


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

 estimated asymmetric confidence interval(1,2,3 sigma): 7.6090E-06 to 7.6107E-06; 7.6082E-06 to 7.6115E-06; 7.6073E-06 to 7.6123E-06
 estimated  symmetric confidence interval(1,2,3 sigma): 7.6090E-06 to 7.6107E-06; 7.6082E-06 to 7.6115E-06; 7.6073E-06 to 7.6123E-06

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       44 with nps = 18154556744  print table 160


 normed average tally per history  = 7.60982E-06          unnormed average tally per history  = 3.04393E-02
 estimated tally relative error    = 0.0001               estimated variance of the variance  = 0.0000
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =   131097818          efficiency for the nonzero tallies  = 0.0072
 history number of largest  tally  =  2390356528          largest  unnormalized history tally = 5.77762E+01
 (largest  tally)/(average tally)  = 1.89808E+03          (largest  tally)/(avg nonzero tally)= 1.37064E+01

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 7.60982E-06


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            7.60982E-06             7.60982E-06                     0.000000
      relative error                  1.09104E-04             1.09105E-04                     0.000000
      variance of the variance        1.86868E-08             1.86876E-08                     0.000043
      shifted center                  7.60982E-06             7.60982E-06                     0.000000
      figure of merit                 4.20034E+02             4.20034E+02                    -0.000001

 the estimated slope of the 200 largest  tallies starting at  3.42640E+01 appears to be decreasing at least exponentially.
 the large score tail of the empirical history score probability density function appears to have no unsampled regions.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (9.077E+04)*( 6.802E-02)**2 = (9.077E+04)*(4.627E-03) = 4.200E+02

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
   1048576000   5.5407E-06 0.0005 0.0000  9.5     309   6.7158E-06 0.0005 0.0000 10.0     376   7.9352E-06 0.0004 0.0000  7.9     442
   2097152000   5.5430E-06 0.0004 0.0000  8.1     309   6.7134E-06 0.0003 0.0000 10.0     377   7.9333E-06 0.0003 0.0000  5.1     442
   3145728000   5.5439E-06 0.0003 0.0000  6.1     309   6.7131E-06 0.0003 0.0000 10.0     377   7.9356E-06 0.0003 0.0000  5.6     442
   4194304000   5.5447E-06 0.0003 0.0000  6.9     309   6.7115E-06 0.0002 0.0000 10.0     377   7.9338E-06 0.0002 0.0000  6.4     443
   5242880000   5.5452E-06 0.0002 0.0000  4.7     309   6.7122E-06 0.0002 0.0000 10.0     377   7.9331E-06 0.0002 0.0000  7.0     443
   6291456000   5.5452E-06 0.0002 0.0000  4.8     309   6.7138E-06 0.0002 0.0000 10.0     377   7.9326E-06 0.0002 0.0000  9.2     442
   7340032000   5.5448E-06 0.0002 0.0000  4.4     309   6.7135E-06 0.0002 0.0000 10.0     377   7.9321E-06 0.0002 0.0000  9.1     442
   8388608000   5.5442E-06 0.0002 0.0000  4.9     309   6.7139E-06 0.0002 0.0000 10.0     377   7.9321E-06 0.0002 0.0000  7.4     442
   9437184000   5.5437E-06 0.0002 0.0000  5.3     309   6.7145E-06 0.0002 0.0000 10.0     377   7.9324E-06 0.0001 0.0000  6.3     442
  10485760000   5.5437E-06 0.0002 0.0000  5.9     309   6.7135E-06 0.0002 0.0000 10.0     377   7.9317E-06 0.0001 0.0000  6.6     442
  11534336000   5.5435E-06 0.0002 0.0000  4.9     309   6.7138E-06 0.0001 0.0000 10.0     377   7.9315E-06 0.0001 0.0000  7.3     442
  12582912000   5.5439E-06 0.0002 0.0000  4.7     309   6.7145E-06 0.0001 0.0000 10.0     377   7.9313E-06 0.0001 0.0000 10.0     442
  13631488000   5.5441E-06 0.0001 0.0000  4.6     309   6.7142E-06 0.0001 0.0000  9.3     377   7.9312E-06 0.0001 0.0000  9.5     442
  14680064000   5.5442E-06 0.0001 0.0000  4.5     309   6.7143E-06 0.0001 0.0000 10.0     377   7.9313E-06 0.0001 0.0000  9.9     442
  15728640000   5.5446E-06 0.0001 0.0000  4.4     309   6.7142E-06 0.0001 0.0000 10.0     377   7.9315E-06 0.0001 0.0000 10.0     442
  16777216000   5.5448E-06 0.0001 0.0000  4.6     309   6.7142E-06 0.0001 0.0000 10.0     377   7.9317E-06 0.0001 0.0000 10.0     442
  17825792000   5.5448E-06 0.0001 0.0000  4.9     309   6.7143E-06 0.0001 0.0000 10.0     377   7.9315E-06 0.0001 0.0000 10.0     442
  18154556744   5.5449E-06 0.0001 0.0000  4.9     309   6.7145E-06 0.0001 0.0000 10.0     377   7.9316E-06 0.0001 0.0000  9.2     442
 

                            tally       34                          tally       44
          nps      mean     error   vov  slope    fom      mean     error   vov  slope    fom
   1048576000   6.7121E-06 0.0005 0.0000 10.0     368   7.6073E-06 0.0005 0.0000 10.0     419
   2097152000   6.7149E-06 0.0003 0.0000 10.0     368   7.6103E-06 0.0003 0.0000 10.0     420
   3145728000   6.7166E-06 0.0003 0.0000  5.8     368   7.6095E-06 0.0003 0.0000  7.6     420
   4194304000   6.7142E-06 0.0002 0.0000  6.6     368   7.6096E-06 0.0002 0.0000  6.8     420
   5242880000   6.7143E-06 0.0002 0.0000  4.9     368   7.6094E-06 0.0002 0.0000  5.6     420
   6291456000   6.7147E-06 0.0002 0.0000  4.7     368   7.6094E-06 0.0002 0.0000  5.7     420
   7340032000   6.7146E-06 0.0002 0.0000  5.5     368   7.6102E-06 0.0002 0.0000  6.2     420
   8388608000   6.7147E-06 0.0002 0.0000  5.5     368   7.6095E-06 0.0002 0.0000  7.0     420
   9437184000   6.7142E-06 0.0002 0.0000  5.9     368   7.6093E-06 0.0002 0.0000  8.4     420
  10485760000   6.7143E-06 0.0002 0.0000  6.5     368   7.6093E-06 0.0001 0.0000  7.9     420
  11534336000   6.7144E-06 0.0001 0.0000  5.5     368   7.6098E-06 0.0001 0.0000  6.9     420
  12582912000   6.7143E-06 0.0001 0.0000  6.1     368   7.6099E-06 0.0001 0.0000  9.1     420
  13631488000   6.7139E-06 0.0001 0.0000  4.8     368   7.6096E-06 0.0001 0.0000 10.0     420
  14680064000   6.7140E-06 0.0001 0.0000  5.0     368   7.6096E-06 0.0001 0.0000 10.0     420
  15728640000   6.7141E-06 0.0001 0.0000  5.5     368   7.6095E-06 0.0001 0.0000 10.0     420
  16777216000   6.7142E-06 0.0001 0.0000  6.0     368   7.6097E-06 0.0001 0.0000 10.0     420
  17825792000   6.7143E-06 0.0001 0.0000  6.6     368   7.6098E-06 0.0001 0.0000 10.0     420
  18154556744   6.7143E-06 0.0001 0.0000  6.0     368   7.6098E-06 0.0001 0.0000 10.0     420

 ***********************************************************************************************************************

 dump no.  168 on file inpr     nps = 18154556744     coll =    35340344871     ctm =   200000.28   nrn =     
 540520315074

         9 warning messages so far.


 run terminated when it had used*****  minutes of computer time.

 computer time =******** minutes

 mcnp     version 6     06/19/14                     08/06/17 08:51:59                     probid =  08/06/17 00:32:03 
