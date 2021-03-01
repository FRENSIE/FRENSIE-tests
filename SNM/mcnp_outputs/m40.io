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
  
1mcnp     version 6     ld=06/19/14                     08/06/17 09:56:02 
 *************************************************************************                 probid =  08/06/17 09:56:02 
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
        65-        4 1 SPH 0 0 0  7.94                              $ 5cm radius HEU sphere ~ 10kg
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
       153-       sb1    4.76698e-01 5.23302e-01                                                  
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
       220-       wwp:n 5.0 j 100 j -1 0 2.131149916e-01                                          
 
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
        4        4        4  4.79746E-02 1.87248E+01 2.09677E+03 3.92615E+04           1  1.0000E+00                                   
        5       10        1  4.98947E-05 1.20500E-03 4.00000E+03 4.82000E+00           0  1.0000E+00                                   
        6       11        1  4.98947E-05 1.20500E-03 4.00000E+03 4.82000E+00           0  1.0000E+00                                   
        7       12        1  4.98947E-05 1.20500E-03 4.00000E+03 4.82000E+00           0  1.0000E+00                                   
        8       13        1  4.98947E-05 1.20500E-03 4.00000E+03 4.82000E+00           0  1.0000E+00                                   
        9       14        1  4.98947E-05 1.20500E-03 4.00000E+03 4.82000E+00           0  1.0000E+00                                   
       10       99        0  0.00000E+00 0.00000E+00 0.00000E+00 0.00000E+00           0  0.0000E+00                                   

 total                                               2.37710E+06 1.30293E+06

    minimum source weight = 9.5547E-01    maximum source weight = 1.0489E+00

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

 dump no.    2 on file inpr     nps =   101597182     coll =      301121789     ctm =     1200.37   nrn =       
 4080129146

 ***********************************************************************************************************************

 dump no.    3 on file inpr     nps =   202910208     coll =      602007962     ctm =     2400.83   nrn =       
 8155021658

 ***********************************************************************************************************************

 dump no.    4 on file inpr     nps =   304673430     coll =      904826928     ctm =     3601.06   nrn =      
 12253835982

 ***********************************************************************************************************************

 dump no.    5 on file inpr     nps =   406741984     coll =     1206047627     ctm =     4801.39   nrn =      
 16339471868

 ***********************************************************************************************************************

 dump no.    6 on file inpr     nps =   508230473     coll =     1506492341     ctm =     6001.76   nrn =      
 20411365307

 ***********************************************************************************************************************

 dump no.    7 on file inpr     nps =   609985779     coll =     1809182026     ctm =     7202.07   nrn =      
 24508878023

 ***********************************************************************************************************************

 dump no.    8 on file inpr     nps =   711729450     coll =     2112087193     ctm =     8402.41   nrn =      
 28608568122

 ***********************************************************************************************************************

 dump no.    9 on file inpr     nps =   813290655     coll =     2413058899     ctm =     9602.86   nrn =      
 32686386248

 ***********************************************************************************************************************

 dump no.   10 on file inpr     nps =   915309075     coll =     2714821759     ctm =    10803.19   nrn =      
 36777164284

 ***********************************************************************************************************************

 dump no.   11 on file inpr     nps =  1017255584     coll =     3016916861     ctm =    12003.51   nrn =      
 40870555448

 ***********************************************************************************************************************

 dump no.   12 on file inpr     nps =  1119186728     coll =     3319185728     ctm =    13203.79   nrn =      
 44965552331

 ***********************************************************************************************************************

 dump no.   13 on file inpr     nps =  1220646832     coll =     3620290131     ctm =    14404.17   nrn =      
 49043882876

 ***********************************************************************************************************************

 dump no.   14 on file inpr     nps =  1322481960     coll =     3922920249     ctm =    15604.63   nrn =      
 53141693563

 ***********************************************************************************************************************

 dump no.   15 on file inpr     nps =  1424301280     coll =     4225599507     ctm =    16805.02   nrn =      
 57239787106

 ***********************************************************************************************************************

 dump no.   16 on file inpr     nps =  1525890720     coll =     4526327533     ctm =    18005.46   nrn =      
 61315656423

 ***********************************************************************************************************************

 dump no.   17 on file inpr     nps =  1627745616     coll =     4828537436     ctm =    19205.72   nrn =      
 65409279930

 ***********************************************************************************************************************

 dump no.   18 on file inpr     nps =  1729541208     coll =     5131248480     ctm =    20406.07   nrn =      
 69507356536

 ***********************************************************************************************************************

 dump no.   19 on file inpr     nps =  1830943988     coll =     5432049964     ctm =    21606.46   nrn =      
 73581990859

 ***********************************************************************************************************************

 dump no.   20 on file inpr     nps =  1932954204     coll =     5733843195     ctm =    22806.88   nrn =      
 77672913867

 ***********************************************************************************************************************

 dump no.   21 on file inpr     nps =  2034953124     coll =     6035567587     ctm =    24007.20   nrn =      
 81762936152

 ***********************************************************************************************************************

 dump no.   22 on file inpr     nps =  2136966164     coll =     6337139499     ctm =    25207.54   nrn =      
 85851713953

 ***********************************************************************************************************************

 dump no.   23 on file inpr     nps =  2238415816     coll =     6638169906     ctm =    26407.83   nrn =      
 89929185376

 ***********************************************************************************************************************

 dump no.   24 on file inpr     nps =  2340225252     coll =     6940607077     ctm =    27608.12   nrn =      
 94024788239

 ***********************************************************************************************************************

 dump no.   25 on file inpr     nps =  2442075912     coll =     7243118539     ctm =    28808.49   nrn =      
 98121409229

 ***********************************************************************************************************************

 dump no.   26 on file inpr     nps =  2543354712     coll =     7543746817     ctm =    30008.85   nrn =     
 102193194325

 ***********************************************************************************************************************

 dump no.   27 on file inpr     nps =  2645215256     coll =     7845946885     ctm =    31209.20   nrn =     
 106286908897

 ***********************************************************************************************************************

 dump no.   28 on file inpr     nps =  2747204016     coll =     8147684070     ctm =    32409.55   nrn =     
 110376900988

 ***********************************************************************************************************************

 dump no.   29 on file inpr     nps =  2848565848     coll =     8449320349     ctm =    33609.91   nrn =     
 114459920283

 ***********************************************************************************************************************

 dump no.   30 on file inpr     nps =  2950354656     coll =     8751996795     ctm =    34810.26   nrn =     
 118557731500

 ***********************************************************************************************************************

 dump no.   31 on file inpr     nps =  3052192332     coll =     9054454376     ctm =    36010.61   nrn =     
 122653631752

 ***********************************************************************************************************************

 dump no.   32 on file inpr     nps =  3154007968     coll =     9356372738     ctm =    37210.93   nrn =     
 126743924730

 ***********************************************************************************************************************

 dump no.   33 on file inpr     nps =  3255523708     coll =     9657291812     ctm =    38411.31   nrn =     
 130821146747

 ***********************************************************************************************************************

 dump no.   34 on file inpr     nps =  3357437632     coll =     9959227451     ctm =    39611.58   nrn =     
 134912369025

 ***********************************************************************************************************************

 dump no.   35 on file inpr     nps =  3459460832     coll =    10260796477     ctm =    40811.85   nrn =     
 139001077780

 ***********************************************************************************************************************

 dump no.   36 on file inpr     nps =  3560929976     coll =    10561597698     ctm =    42012.20   nrn =     
 143076351029

 ***********************************************************************************************************************

 dump no.   37 on file inpr     nps =  3662793068     coll =    10864041554     ctm =    43212.51   nrn =     
 147172408714

 ***********************************************************************************************************************

 dump no.   38 on file inpr     nps =  3764614352     coll =    11166683362     ctm =    44412.78   nrn =     
 151270172368
 warning.  no reaction mt found. collision resampled. zaid =  92235.80c
 nps =  3766109313     nrn =               28429 erg = 2.4381E-01                     

 ***********************************************************************************************************************

 dump no.   39 on file inpr     nps =  3866094792     coll =    11467797919     ctm =    45613.14   nrn =     
 155348996309

 ***********************************************************************************************************************

 dump no.   40 on file inpr     nps =  3968031860     coll =    11769793935     ctm =    46813.56   nrn =     
 159441244923

 ***********************************************************************************************************************

 dump no.   41 on file inpr     nps =  4069896364     coll =    12072130252     ctm =    48013.90   nrn =     
 163536651030

 ***********************************************************************************************************************

 dump no.   42 on file inpr     nps =  4171796168     coll =    12374408760     ctm =    49214.18   nrn =     
 167631371443

 ***********************************************************************************************************************

 dump no.   43 on file inpr     nps =  4273278572     coll =    12674448370     ctm =    50414.49   nrn =     
 171699273679

 ***********************************************************************************************************************

 dump no.   44 on file inpr     nps =  4375086596     coll =    12976949498     ctm =    51614.75   nrn =     
 175795285330

 ***********************************************************************************************************************

 dump no.   45 on file inpr     nps =  4476947416     coll =    13279269650     ctm =    52815.17   nrn =     
 179890061295

 ***********************************************************************************************************************

 dump no.   46 on file inpr     nps =  4578513988     coll =    13580312404     ctm =    54015.46   nrn =     
 183968903869

 ***********************************************************************************************************************

 dump no.   47 on file inpr     nps =  4680484392     coll =    13881810758     ctm =    55215.79   nrn =     
 188056404912

 ***********************************************************************************************************************

 dump no.   48 on file inpr     nps =  4782479352     coll =    14183273841     ctm =    56416.11   nrn =     
 192143669337

 ***********************************************************************************************************************

 dump no.   49 on file inpr     nps =  4884096756     coll =    14483972431     ctm =    57616.43   nrn =     
 196219585040

 ***********************************************************************************************************************

 dump no.   50 on file inpr     nps =  4985905332     coll =    14786432810     ctm =    58816.78   nrn =     
 200315137347

 ***********************************************************************************************************************

 dump no.   51 on file inpr     nps =  5087769836     coll =    15088677738     ctm =    60017.09   nrn =     
 204409220956

 ***********************************************************************************************************************

 dump no.   52 on file inpr     nps =  5189623044     coll =    15391109390     ctm =    61217.45   nrn =     
 208505146157

 ***********************************************************************************************************************

 dump no.   53 on file inpr     nps =  5291106860     coll =    15691764988     ctm =    62417.80   nrn =     
 212579255570

 ***********************************************************************************************************************

 dump no.   54 on file inpr     nps =  5392868288     coll =    15993919427     ctm =    63618.09   nrn =     
 216671646988

 ***********************************************************************************************************************

 dump no.   55 on file inpr     nps =  5494841516     coll =    16295591062     ctm =    64818.52   nrn =     
 220760931773

 ***********************************************************************************************************************

 dump no.   56 on file inpr     nps =  5596237236     coll =    16596682127     ctm =    66018.86   nrn =     
 224838629386

 ***********************************************************************************************************************

 dump no.   57 on file inpr     nps =  5698079148     coll =    16898640926     ctm =    67219.26   nrn =     
 228929560638

 ***********************************************************************************************************************

 dump no.   58 on file inpr     nps =  5800069012     coll =    17200385312     ctm =    68419.66   nrn =     
 233019870648

 ***********************************************************************************************************************

 dump no.   59 on file inpr     nps =  5900477744     coll =    17497610321     ctm =    69620.11   nrn =     
 237048211940

 ***********************************************************************************************************************

 dump no.   60 on file inpr     nps =  6002216580     coll =    17800439726     ctm =    70820.40   nrn =     
 241146843872

 ***********************************************************************************************************************

 dump no.   61 on file inpr     nps =  6104050020     coll =    18102677852     ctm =    72020.69   nrn =     
 245240584991

 ***********************************************************************************************************************

 dump no.   62 on file inpr     nps =  6205972416     coll =    18404669690     ctm =    73220.98   nrn =     
 249332648230

 ***********************************************************************************************************************

 dump no.   63 on file inpr     nps =  6307211096     coll =    18705781409     ctm =    74421.28   nrn =     
 253409266718

 ***********************************************************************************************************************

 dump no.   64 on file inpr     nps =  6409067128     coll =    19007869356     ctm =    75621.61   nrn =     
 257501529527

 ***********************************************************************************************************************

 dump no.   65 on file inpr     nps =  6510900568     coll =    19310348344     ctm =    76822.02   nrn =     
 261597620300

 ***********************************************************************************************************************

 dump no.   66 on file inpr     nps =  6612246868     coll =    19611741631     ctm =    78022.41   nrn =     
 265677902736

 ***********************************************************************************************************************

 dump no.   67 on file inpr     nps =  6714040772     coll =    19914016148     ctm =    79222.71   nrn =     
 269771569677

 ***********************************************************************************************************************

 dump no.   68 on file inpr     nps =  6815837192     coll =    20216250257     ctm =    80422.99   nrn =     
 273864974636

 ***********************************************************************************************************************

 dump no.   69 on file inpr     nps =  6917194788     coll =    20517584403     ctm =    81623.32   nrn =     
 277944833853

 ***********************************************************************************************************************

 dump no.   70 on file inpr     nps =  7019016932     coll =    20819474413     ctm =    82823.68   nrn =     
 282034838146

 ***********************************************************************************************************************

 dump no.   71 on file inpr     nps =  7120896968     coll =    21121631633     ctm =    84024.04   nrn =     
 286128024141

 ***********************************************************************************************************************

 dump no.   72 on file inpr     nps =  7222826424     coll =    21423459339     ctm =    85224.38   nrn =     
 290218420044

 ***********************************************************************************************************************

 dump no.   73 on file inpr     nps =  7324248972     coll =    21724239608     ctm =    86424.82   nrn =     
 294293269908

 ***********************************************************************************************************************

 dump no.   74 on file inpr     nps =  7426127288     coll =    22026463470     ctm =    87625.21   nrn =     
 298387384510

 ***********************************************************************************************************************

 dump no.   75 on file inpr     nps =  7527857652     coll =    22329491949     ctm =    88825.57   nrn =     
 302488045961

 ***********************************************************************************************************************

 dump no.   76 on file inpr     nps =  7629429872     coll =    22629782098     ctm =    90025.84   nrn =     
 306559196703

 ***********************************************************************************************************************

 dump no.   77 on file inpr     nps =  7731264724     coll =    22931825537     ctm =    91226.26   nrn =     
 310650944237

 ***********************************************************************************************************************

 dump no.   78 on file inpr     nps =  7833055804     coll =    23234225745     ctm =    92426.56   nrn =     
 314745899322

 ***********************************************************************************************************************

 dump no.   79 on file inpr     nps =  7934531700     coll =    23535383480     ctm =    93626.95   nrn =     
 318824912649

 ***********************************************************************************************************************

 dump no.   80 on file inpr     nps =  8036351020     coll =    23837776498     ctm =    94827.29   nrn =     
 322920071495

 ***********************************************************************************************************************

 dump no.   81 on file inpr     nps =  8138216936     coll =    24139935405     ctm =    96027.75   nrn =     
 327013266391

 ***********************************************************************************************************************

 dump no.   82 on file inpr     nps =  8240212756     coll =    24441447994     ctm =    97228.15   nrn =     
 331101051297

 ***********************************************************************************************************************

 dump no.   83 on file inpr     nps =  8341670604     coll =    24741845343     ctm =    98428.56   nrn =     
 335172244597

 ***********************************************************************************************************************

 dump no.   84 on file inpr     nps =  8443510796     coll =    25043765337     ctm =    99628.90   nrn =     
 339262838357

 ***********************************************************************************************************************

 dump no.   85 on file inpr     nps =  8545412012     coll =    25345974684     ctm =   100829.34   nrn =     
 343356731123

 ***********************************************************************************************************************

 dump no.   86 on file inpr     nps =  8646783728     coll =    25647074058     ctm =   102029.69   nrn =     
 347434239680

 ***********************************************************************************************************************

 dump no.   87 on file inpr     nps =  8748625640     coll =    25949179193     ctm =   103229.98   nrn =     
 351526591032

 ***********************************************************************************************************************

 dump no.   88 on file inpr     nps =  8850497204     coll =    26251192401     ctm =   104430.34   nrn =     
 355618485855

 ***********************************************************************************************************************

 dump no.   89 on file inpr     nps =  8951877084     coll =    26552852152     ctm =   105630.68   nrn =     
 359702062708

 ***********************************************************************************************************************

 dump no.   90 on file inpr     nps =  9053680872     coll =    26855447588     ctm =   106831.18   nrn =     
 363799105030

 ***********************************************************************************************************************

 dump no.   91 on file inpr     nps =  9155405588     coll =    27158051552     ctm =   108031.43   nrn =     
 367895534141

 ***********************************************************************************************************************

 dump no.   92 on file inpr     nps =  9257333632     coll =    27460273254     ctm =   109231.86   nrn =     
 371990033838

 ***********************************************************************************************************************

 dump no.   93 on file inpr     nps =  9358723704     coll =    27760788927     ctm =   110432.12   nrn =     
 376061836834

 ***********************************************************************************************************************

 dump no.   94 on file inpr     nps =  9460633084     coll =    28062644265     ctm =   111632.42   nrn =     
 380152399205

 ***********************************************************************************************************************

 dump no.   95 on file inpr     nps =  9562525828     coll =    28364850407     ctm =   112832.73   nrn =     
 384246304659

 ***********************************************************************************************************************

 dump no.   96 on file inpr     nps =  9664085340     coll =    28665073366     ctm =   114033.03   nrn =     
 388316809092

 ***********************************************************************************************************************

 dump no.   97 on file inpr     nps =  9765932900     coll =    28967347373     ctm =   115233.42   nrn =     
 392410942068

 ***********************************************************************************************************************

 dump no.   98 on file inpr     nps =  9867692916     coll =    29270055192     ctm =   116433.73   nrn =     
 396508713857

 ***********************************************************************************************************************

 dump no.   99 on file inpr     nps =  9968911828     coll =    29571702486     ctm =   117634.06   nrn =     
 400590377857

 ***********************************************************************************************************************

 dump no.  100 on file inpr     nps = 10070732560     coll =    29873919855     ctm =   118834.33   nrn =     
 404683661555

 ***********************************************************************************************************************

 dump no.  101 on file inpr     nps = 10172621068     coll =    30175772596     ctm =   120034.63   nrn =     
 408774087610

 ***********************************************************************************************************************

 dump no.  102 on file inpr     nps = 10274549112     coll =    30477753007     ctm =   121235.02   nrn =     
 412866085274

 ***********************************************************************************************************************

 dump no.  103 on file inpr     nps = 10376093092     coll =    30778136964     ctm =   122435.42   nrn =     
 416937889552

 ***********************************************************************************************************************

 dump no.  104 on file inpr     nps = 10478038080     coll =    31079694099     ctm =   123635.67   nrn =     
 421025833023

 ***********************************************************************************************************************

 dump no.  105 on file inpr     nps = 10579989820     coll =    31381636177     ctm =   124836.09   nrn =     
 425117798047

 ***********************************************************************************************************************

 dump no.  106 on file inpr     nps = 10681463200     coll =    31682056017     ctm =   126036.42   nrn =     
 429189408952

 ***********************************************************************************************************************

 dump no.  107 on file inpr     nps = 10783357356     coll =    31984077010     ctm =   127236.75   nrn =     
 433281519106

 ***********************************************************************************************************************

 dump no.  108 on file inpr     nps = 10885291048     coll =    32285995996     ctm =   128437.12   nrn =     
 437372906513

 ***********************************************************************************************************************

 dump no.  109 on file inpr     nps = 10986849148     coll =    32586528728     ctm =   129637.43   nrn =     
 441446252930

 ***********************************************************************************************************************

 dump no.  110 on file inpr     nps = 11088641640     coll =    32889043287     ctm =   130837.74   nrn =     
 445542306687

 ***********************************************************************************************************************

 dump no.  111 on file inpr     nps = 11190623340     coll =    33190628680     ctm =   132038.13   nrn =     
 449630884402

 ***********************************************************************************************************************

 dump no.  112 on file inpr     nps = 11292486432     coll =    33493001861     ctm =   133238.52   nrn =     
 453726103975

 ***********************************************************************************************************************

 dump no.  113 on file inpr     nps = 11393951340     coll =    33794495845     ctm =   134438.87   nrn =     
 457808497561

 ***********************************************************************************************************************

 dump no.  114 on file inpr     nps = 11495868088     coll =    34096591691     ctm =   135639.21   nrn =     
 461901446459

 ***********************************************************************************************************************

 dump no.  115 on file inpr     nps = 11597837876     coll =    34398460800     ctm =   136839.58   nrn =     
 465992556342

 ***********************************************************************************************************************

 dump no.  116 on file inpr     nps = 11699390328     coll =    34698740684     ctm =   138039.85   nrn =     
 470063513656

 ***********************************************************************************************************************

 dump no.  117 on file inpr     nps = 11801239300     coll =    35001153730     ctm =   139240.14   nrn =     
 474158995141

 ***********************************************************************************************************************

 dump no.  118 on file inpr     nps = 11903009200     coll =    35303890735     ctm =   140440.45   nrn =     
 478257282042

 ***********************************************************************************************************************

 dump no.  119 on file inpr     nps = 12004465636     coll =    35604691581     ctm =   141640.75   nrn =     
 482332460979

 ***********************************************************************************************************************

 dump no.  120 on file inpr     nps = 12106300488     coll =    35906937673     ctm =   142841.03   nrn =     
 486426158001

 ***********************************************************************************************************************

 dump no.  121 on file inpr     nps = 12208143812     coll =    36209198646     ctm =   144041.35   nrn =     
 490520278771

 ***********************************************************************************************************************

 dump no.  122 on file inpr     nps = 12309980076     coll =    36511431528     ctm =   145241.66   nrn =     
 494613967656

 ***********************************************************************************************************************

 dump no.  123 on file inpr     nps = 12411384268     coll =    36812227791     ctm =   146441.98   nrn =     
 498688788198

 ***********************************************************************************************************************

 dump no.  124 on file inpr     nps = 12513132988     coll =    37114838018     ctm =   147642.34   nrn =     
 502785574170

 ***********************************************************************************************************************

 dump no.  125 on file inpr     nps = 12615015232     coll =    37416980178     ctm =   148842.66   nrn =     
 506878612788

 ***********************************************************************************************************************

 dump no.  126 on file inpr     nps = 12716614280     coll =    37717236454     ctm =   150042.94   nrn =     
 510949730350

 ***********************************************************************************************************************

 dump no.  127 on file inpr     nps = 12818487256     coll =    38019298098     ctm =   151243.31   nrn =     
 515042177190

 ***********************************************************************************************************************

 dump no.  128 on file inpr     nps = 12920402592     coll =    38321234729     ctm =   152443.59   nrn =     
 519133504801

 ***********************************************************************************************************************

 dump no.  129 on file inpr     nps = 13021747480     coll =    38622246587     ctm =   153643.82   nrn =     
 523209853648

 ***********************************************************************************************************************

 dump no.  130 on file inpr     nps = 13123562564     coll =    38924696014     ctm =   154844.10   nrn =     
 527305473016

 ***********************************************************************************************************************

 dump no.  131 on file inpr     nps = 13225468016     coll =    39226730624     ctm =   156044.40   nrn =     
 531397828550

 ***********************************************************************************************************************

 dump no.  132 on file inpr     nps = 13327325460     coll =    39528931284     ctm =   157244.71   nrn =     
 535491524326

 ***********************************************************************************************************************

 dump no.  133 on file inpr     nps = 13428657640     coll =    39830276130     ctm =   158444.99   nrn =     
 539571030005

 ***********************************************************************************************************************

 dump no.  134 on file inpr     nps = 13530489668     coll =    40132559064     ctm =   159645.31   nrn =     
 543665079461

 ***********************************************************************************************************************

 dump no.  135 on file inpr     nps = 13632452396     coll =    40434474012     ctm =   160845.72   nrn =     
 547756893145

 ***********************************************************************************************************************

 dump no.  136 on file inpr     nps = 13733692796     coll =    40734843006     ctm =   162046.20   nrn =     
 551825548397

 ***********************************************************************************************************************

 dump no.  137 on file inpr     nps = 13835591188     coll =    41036931553     ctm =   163246.49   nrn =     
 555918343292

 ***********************************************************************************************************************

 dump no.  138 on file inpr     nps = 13937474048     coll =    41339101167     ctm =   164446.83   nrn =     
 560011803689

 ***********************************************************************************************************************

 dump no.  139 on file inpr     nps = 14039002496     coll =    41639452165     ctm =   165647.18   nrn =     
 564083075270

 ***********************************************************************************************************************

 dump no.  140 on file inpr     nps = 14140773808     coll =    41942037482     ctm =   166847.52   nrn =     
 568179837623

 ***********************************************************************************************************************

 dump no.  141 on file inpr     nps = 14242625604     coll =    42244188710     ctm =   168047.77   nrn =     
 572272969437

 ***********************************************************************************************************************

 dump no.  142 on file inpr     nps = 14344614364     coll =    42546020345     ctm =   169248.19   nrn =     
 576364053431

 ***********************************************************************************************************************

 dump no.  143 on file inpr     nps = 14445815228     coll =    42847539079     ctm =   170448.68   nrn =     
 580444067617

 ***********************************************************************************************************************

 dump no.  144 on file inpr     nps = 14547689616     coll =    43149617997     ctm =   171648.97   nrn =     
 584536645853

 ***********************************************************************************************************************

 dump no.  145 on file inpr     nps = 14649648724     coll =    43451568420     ctm =   172849.27   nrn =     
 588628867352

 ***********************************************************************************************************************

 dump no.  146 on file inpr     nps = 14751072068     coll =    43753201311     ctm =   174049.60   nrn =     
 592712165261

 ***********************************************************************************************************************

 dump no.  147 on file inpr     nps = 14852963400     coll =    44055348241     ctm =   175249.95   nrn =     
 596805793676

 ***********************************************************************************************************************

 dump no.  148 on file inpr     nps = 14954758716     coll =    44358067481     ctm =   176450.22   nrn =     
 600904071386

 ***********************************************************************************************************************

 dump no.  149 on file inpr     nps = 15056209504     coll =    44658871394     ctm =   177650.63   nrn =     
 604979638353

 ***********************************************************************************************************************

 dump no.  150 on file inpr     nps = 15158126252     coll =    44960799898     ctm =   178850.89   nrn =     
 609071046798

 ***********************************************************************************************************************

 dump no.  151 on file inpr     nps = 15260034528     coll =    45262725995     ctm =   180051.18   nrn =     
 613162343228

 ***********************************************************************************************************************

 dump no.  152 on file inpr     nps = 15362098124     coll =    45564243738     ctm =   181251.45   nrn =     
 617250926833

 ***********************************************************************************************************************

 dump no.  153 on file inpr     nps = 15463496668     coll =    45865215011     ctm =   182451.84   nrn =     
 621327213277

 ***********************************************************************************************************************

 dump no.  154 on file inpr     nps = 15565338580     coll =    46167499953     ctm =   183652.21   nrn =     
 625421432093

 ***********************************************************************************************************************

 dump no.  155 on file inpr     nps = 15667148016     coll =    46469996878     ctm =   184852.44   nrn =     
 629517591332

 ***********************************************************************************************************************

 dump no.  156 on file inpr     nps = 15768667376     coll =    46770978666     ctm =   186052.74   nrn =     
 633595277478

 ***********************************************************************************************************************

 dump no.  157 on file inpr     nps = 15870471164     coll =    47073538129     ctm =   187253.10   nrn =     
 637692063543

 ***********************************************************************************************************************

 dump no.  158 on file inpr     nps = 15972376616     coll =    47375618453     ctm =   188453.47   nrn =     
 641784880962

 ***********************************************************************************************************************

 dump no.  159 on file inpr     nps = 16073930480     coll =    47676567442     ctm =   189653.85   nrn =     
 645862579403

 ***********************************************************************************************************************

 dump no.  160 on file inpr     nps = 16175803456     coll =    47978745233     ctm =   190854.13   nrn =     
 649956175871

 ***********************************************************************************************************************

 dump no.  161 on file inpr     nps = 16277571944     coll =    48281394202     ctm =   192054.49   nrn =     
 654053704790

 ***********************************************************************************************************************

 dump no.  162 on file inpr     nps = 16379423740     coll =    48583889230     ctm =   193254.77   nrn =     
 658150079339

 ***********************************************************************************************************************

 dump no.  163 on file inpr     nps = 16480858996     coll =    48884890522     ctm =   194455.12   nrn =     
 662227315984

 ***********************************************************************************************************************

 dump no.  164 on file inpr     nps = 16582631720     coll =    49187677353     ctm =   195655.46   nrn =     
 666325942251

 ***********************************************************************************************************************

 dump no.  165 on file inpr     nps = 16684539996     coll =    49489484078     ctm =   196855.77   nrn =     
 670416035628

 ***********************************************************************************************************************

 dump no.  166 on file inpr     nps = 16786110188     coll =    49790146680     ctm =   198056.07   nrn =     
 674491182838

 ***********************************************************************************************************************

 dump no.  167 on file inpr     nps = 16887771364     coll =    50093189121     ctm =   199256.40   nrn =     
 678591536618
1problem summary                                                                                                           

      run terminated when it had used*****  minutes of computer time.
+                                                                                                    08/06/17 18:15:56 
      c //-------------------------------------------------------------------------//      probid =  08/06/17 09:56:02 

 neutron creation    tracks      weight        energy            neutron loss        tracks      weight        energy
                                 (per source particle)                                           (per source particle)

 source         16950999312    1.0000E+00    1.4100E+01          escape         31139893539    1.1025E+00    1.0684E+01
 nucl. interaction        0    0.            0.                  energy cutoff            0    0.            0.        
 particle decay           0    0.            0.                  time cutoff       25899561    6.9632E-04    3.5356E-04
 weight window  12300460630    3.0619E-02    9.2515E-02          weight window   2794744830    3.0621E-02    9.2522E-02
 cell importance          0    0.            0.                  cell importance          0    0.            0.        
 weight cutoff            0    0.            0.                  weight cutoff            0    0.            0.        
 e or t importance        0    0.            0.                  e or t importance        0    0.            0.        
 dxtran                   0    0.            0.                  dxtran                   0    0.            0.        
 forced collisions        0    0.            0.                  forced collisions        0    0.            0.        
 exp. transform           0    0.            0.                  exp. transform           0    0.            0.        
 upscattering             0    0.            1.7624E-14          downscattering           0    0.            1.9442E+00
 photonuclear             0    0.            0.                  capture                101    5.5325E-02    6.6870E-01
 (n,xn)          3899381142    1.6602E-01    1.9707E-01          loss to (n,xn)  1949467272    8.3000E-02    1.1646E+00
 prompt fission  4424501274    1.2049E-01    2.4719E-01          loss to fission 1692976911    4.5752E-02    8.3246E-02
 delayed fission   27639856    7.4312E-04    3.7847E-04          nucl. interaction        0    0.            0.        
 prompt photofis          0    0.            0.                  particle decay           0    0.            0.        
 tabular boundary         0    0.            0.                  tabular boundary         0    0.            0.        
 tabular sampling         0    0.            0.                  elastic scatter          0    0.            0.        
     total      37602982214    1.3179E+00    1.4637E+01              total      37602982214    1.3179E+00    1.4637E+01

   number of neutrons banked              2032656092        average time of (shakes)              cutoffs
   neutron tracks per source particle     2.2183E+00          escape            5.0031E+06          tco   2.0000E+07
   neutron collisions per source particle 2.9662E+00          capture           5.0047E+06          eco   0.0000E+00
   total neutron collisions              -2147483648          capture or escape 5.0032E+06          wc1  -5.0000E-01
   net multiplication              1.1585E+00 0.0000          any termination   4.7508E+06          wc2  -2.5000E-01

 computer time so far in this run200003.93 minutes            maximum number ever in bank       248
 computer time in mcrun          200000.28 minutes            bank overflows to backup file       0
 source particles per minute            8.4755E+04
 random numbers generated             681123142196            most random numbers used was     1974089 in history  5475540718
 
  warning.   random number stride   152917 exceeded    17657 times.
 
  warning.  random number period exceeded.  decrease stride.

 range of sampled source weights = 9.5547E-01 to 1.0489E+00

 neutron reaction mt loop failed   7 times.

 number of histories processed by each thread
   817647940   852513614   854246371   854256767   850418303   846481647   846904045   851542962   849807284   849710326
   848561752   848619569   848714428   847782726   849398628   848756370   848039817   850765944   839729142   847101677
 
  warning.  some of the geometry is covered by a weight window mesh.
1neutron  activity in each cell                                                                         print table 126

                       tracks     population   collisions   collisions     number        flux        average      average
              cell    entering                               * weight     weighted     weighted   track weight   track mfp
                                                          (per history)    energy       energy     (relative)      (cm)

        1        1 38243450263  31431806055    114136656    4.4355E-03   5.5674E+00   1.0447E+01   7.0747E-01   1.1824E+04
        2        2 20141446524  21666039655  39294827056    1.3615E+00   3.0999E+00   7.6967E+00   6.0530E-01   4.2250E+00
        3        3 14302594620  11229992681     98266379    3.3261E-03   2.4977E+00   6.6957E+00   6.2425E-01   1.0771E+04
        4        4   104804949   2994108480  10766772493    2.9370E-01   9.2721E-01   1.7084E+00   4.6278E-01   2.6752E+00
        5       10   705980268   1003333194      1043442    2.8465E-06   1.9721E+00   5.3846E+00   4.6691E-02   1.0377E+04
        6       11   840190397   1076430930      1106300    3.2918E-06   2.1338E+00   5.7430E+00   5.1124E-02   1.0509E+04
        7       12  1093600769   1420381297      1451179    4.4161E-06   2.0072E+00   5.4157E+00   5.2107E-02   1.0406E+04
        8       13   828048404   1063910872      1088106    3.2849E-06   2.1347E+00   5.7443E+00   5.1855E-02   1.0510E+04
        9       14   952431593   1127894602      1150473    3.7904E-06   2.3103E+00   6.1101E+00   5.6679E-02   1.0638E+04

           total   77212547787  73013897766  50279842084    1.6630E+00

1tally        4        nps = 16950999312
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      10                                                                                   
                         4.00000E+03
 
 cell  10                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 6.46037E-06 0.0001   1.20484E-09 0.0136   1.18942E-09 0.0141   1.13335E-09 0.0143   1.09465E-09 0.0143
 
         time:       2.0000E+07             total                                                                  
                 1.10276E-09 0.0146   6.46610E-06 0.0001


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally        4

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00      yes         yes            constant    random       3.77
 passed?        yes          yes      yes          yes             yes      yes         yes               yes        yes         yes

 ===================================================================================================================================


 this tally meets the statistical criteria used to form confidence intervals: check the tally fluctuation chart to verify.
 the results in other bins associated with this tally may not meet these statistical criteria.

 ----- estimated confidence intervals:  -----

 estimated asymmetric confidence interval(1,2,3 sigma): 6.4652E-06 to 6.4670E-06; 6.4643E-06 to 6.4679E-06; 6.4634E-06 to 6.4688E-06
 estimated  symmetric confidence interval(1,2,3 sigma): 6.4652E-06 to 6.4670E-06; 6.4643E-06 to 6.4679E-06; 6.4634E-06 to 6.4688E-06

1analysis of the results in the tally fluctuation chart bin (tfc) for tally        4 with nps = 16950999312  print table 160


 normed average tally per history  = 6.46610E-06          unnormed average tally per history  = 2.58644E-02
 estimated tally relative error    = 0.0001               estimated variance of the variance  = 0.0000
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =   106819365          efficiency for the nonzero tallies  = 0.0063
 history number of largest  tally  =  7448656020          largest  unnormalized history tally = 9.26640E+02
 (largest  tally)/(average tally)  = 3.58269E+04          (largest  tally)/(avg nonzero tally)= 2.25769E+02

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 6.46610E-06


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            6.46610E-06             6.46611E-06                     0.000002
      relative error                  1.40371E-04             1.40387E-04                     0.000111
      variance of the variance        4.07614E-07             4.58797E-07                     0.125570
      shifted center                  6.46610E-06             6.46610E-06                     0.000000
      figure of merit                 2.53754E+02             2.53698E+02                    -0.000222

 the estimated inverse power slope of the 200 largest  tallies starting at 1.76164E+02 is 3.7705
 the history score probability density function appears to have an unsampled region at the largest  history scores:
 please examine. see print table 161.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (8.475E+04)*( 5.472E-02)**2 = (8.475E+04)*(2.994E-03) = 2.538E+02

1tally       14        nps = 16950999312
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      11                                                                                   
                         4.00000E+03
 
 cell  11                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 7.59675E-06 0.0001   1.22578E-09 0.0138   1.18497E-09 0.0141   1.13379E-09 0.0143   1.10859E-09 0.0143
 
         time:       2.0000E+07             total                                                                  
                 1.11130E-09 0.0145   7.60252E-06 0.0001


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       14

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00      yes         yes            constant    random       4.21
 passed?        yes          yes      yes          yes             yes      yes         yes               yes        yes         yes

 ===================================================================================================================================


 this tally meets the statistical criteria used to form confidence intervals: check the tally fluctuation chart to verify.
 the results in other bins associated with this tally may not meet these statistical criteria.

 ----- estimated confidence intervals:  -----

 estimated asymmetric confidence interval(1,2,3 sigma): 7.6016E-06 to 7.6035E-06; 7.6006E-06 to 7.6044E-06; 7.5996E-06 to 7.6054E-06
 estimated  symmetric confidence interval(1,2,3 sigma): 7.6016E-06 to 7.6035E-06; 7.6006E-06 to 7.6044E-06; 7.5996E-06 to 7.6054E-06

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       14 with nps = 16950999312  print table 160


 normed average tally per history  = 7.60252E-06          unnormed average tally per history  = 3.04101E-02
 estimated tally relative error    = 0.0001               estimated variance of the variance  = 0.0000
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =   123266235          efficiency for the nonzero tallies  = 0.0073
 history number of largest  tally  =  5475540718          largest  unnormalized history tally = 9.82546E+02
 (largest  tally)/(average tally)  = 3.23099E+04          (largest  tally)/(avg nonzero tally)= 2.34955E+02

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 7.60252E-06


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            7.60252E-06             7.60253E-06                     0.000002
      relative error                  1.26622E-04             1.26636E-04                     0.000111
      variance of the variance        3.36975E-07             3.88141E-07                     0.151839
      shifted center                  7.60252E-06             7.60252E-06                     0.000000
      figure of merit                 3.11855E+02             3.11785E+02                    -0.000223

 the estimated inverse power slope of the 200 largest  tallies starting at 1.75247E+02 is 4.2124
 the history score probability density function appears to have an unsampled region at the largest  history scores:
 please examine. see print table 161.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (8.475E+04)*( 6.066E-02)**2 = (8.475E+04)*(3.679E-03) = 3.119E+02

1tally       24        nps = 16950999312
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      12                                                                                   
                         4.00000E+03
 
 cell  12                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 1.00712E-05 0.0001   2.14348E-09 0.0130   2.06761E-09 0.0132   1.96826E-09 0.0139   1.90097E-09 0.0136
 
         time:       2.0000E+07             total                                                                  
                 1.92352E-09 0.0139   1.00812E-05 0.0001


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       24

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00      yes         yes            constant    random       3.40
 passed?        yes          yes      yes          yes             yes      yes         yes               yes        yes         yes

 ===================================================================================================================================


 this tally meets the statistical criteria used to form confidence intervals: check the tally fluctuation chart to verify.
 the results in other bins associated with this tally may not meet these statistical criteria.

 ----- estimated confidence intervals:  -----

 estimated asymmetric confidence interval(1,2,3 sigma): 1.0080E-05 to 1.0082E-05; 1.0079E-05 to 1.0084E-05; 1.0077E-05 to 1.0085E-05
 estimated  symmetric confidence interval(1,2,3 sigma): 1.0080E-05 to 1.0082E-05; 1.0079E-05 to 1.0084E-05; 1.0077E-05 to 1.0085E-05

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       24 with nps = 16950999312  print table 160


 normed average tally per history  = 1.00812E-05          unnormed average tally per history  = 4.03248E-02
 estimated tally relative error    = 0.0001               estimated variance of the variance  = 0.0000
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =   154738083          efficiency for the nonzero tallies  = 0.0091
 history number of largest  tally  =  5475540718          largest  unnormalized history tally = 1.72197E+03
 (largest  tally)/(average tally)  = 4.27027E+04          (largest  tally)/(avg nonzero tally)= 3.89814E+02

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 1.00812E-05


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            1.00812E-05             1.00812E-05                     0.000003
      relative error                  1.28144E-04             1.28168E-04                     0.000191
      variance of the variance        8.47611E-07             9.96191E-07                     0.175293
      shifted center                  1.00812E-05             1.00812E-05                     0.000000
      figure of merit                 3.04490E+02             3.04374E+02                    -0.000381

 the estimated inverse power slope of the 200 largest  tallies starting at 2.93317E+02 is 3.4030
 the history score probability density function appears to have an unsampled region at the largest  history scores:
 please examine. see print table 161.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (8.475E+04)*( 5.994E-02)**2 = (8.475E+04)*(3.593E-03) = 3.045E+02

1tally       34        nps = 16950999312
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      13                                                                                   
                         4.00000E+03
 
 cell  13                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 7.59678E-06 0.0001   1.21967E-09 0.0137   1.17834E-09 0.0140   1.13518E-09 0.0146   1.10444E-09 0.0143
 
         time:       2.0000E+07             total                                                                  
                 1.10874E-09 0.0149   7.60253E-06 0.0001


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       34

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00      yes         yes            constant    random       3.67
 passed?        yes          yes      yes          yes             yes      yes         yes               yes        yes         yes

 ===================================================================================================================================


 this tally meets the statistical criteria used to form confidence intervals: check the tally fluctuation chart to verify.
 the results in other bins associated with this tally may not meet these statistical criteria.

 ----- estimated confidence intervals:  -----

 estimated asymmetric confidence interval(1,2,3 sigma): 7.6016E-06 to 7.6035E-06; 7.6006E-06 to 7.6045E-06; 7.5996E-06 to 7.6054E-06
 estimated  symmetric confidence interval(1,2,3 sigma): 7.6016E-06 to 7.6035E-06; 7.6006E-06 to 7.6045E-06; 7.5996E-06 to 7.6054E-06

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       34 with nps = 16950999312  print table 160


 normed average tally per history  = 7.60253E-06          unnormed average tally per history  = 3.04101E-02
 estimated tally relative error    = 0.0001               estimated variance of the variance  = 0.0000
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =   121603336          efficiency for the nonzero tallies  = 0.0072
 history number of largest  tally  =  7448656020          largest  unnormalized history tally = 9.79102E+02
 (largest  tally)/(average tally)  = 3.21966E+04          (largest  tally)/(avg nonzero tally)= 2.30972E+02

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 7.60253E-06


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            7.60253E-06             7.60254E-06                     0.000002
      relative error                  1.27715E-04             1.27729E-04                     0.000109
      variance of the variance        3.30499E-07             3.79245E-07                     0.147495
      shifted center                  7.60253E-06             7.60253E-06                     0.000000
      figure of merit                 3.06539E+02             3.06473E+02                    -0.000217

 the estimated inverse power slope of the 200 largest  tallies starting at 1.77427E+02 is 3.6681
 the history score probability density function appears to have an unsampled region at the largest  history scores:
 please examine. see print table 161.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (8.475E+04)*( 6.014E-02)**2 = (8.475E+04)*(3.617E-03) = 3.065E+02

1tally       44        nps = 16950999312
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      14                                                                                   
                         4.00000E+03
 
 cell  14                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 8.88483E-06 0.0001   1.21463E-09 0.0136   1.19434E-09 0.0138   1.14992E-09 0.0144   1.10008E-09 0.0146
 
         time:       2.0000E+07             total                                                                  
                 1.10206E-09 0.0149   8.89059E-06 0.0001


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       44

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00      yes         yes            constant    random       3.55
 passed?        yes          yes      yes          yes             yes      yes         yes               yes        yes         yes

 ===================================================================================================================================


 this tally meets the statistical criteria used to form confidence intervals: check the tally fluctuation chart to verify.
 the results in other bins associated with this tally may not meet these statistical criteria.

 ----- estimated confidence intervals:  -----

 estimated asymmetric confidence interval(1,2,3 sigma): 8.8896E-06 to 8.8916E-06; 8.8885E-06 to 8.8927E-06; 8.8875E-06 to 8.8937E-06
 estimated  symmetric confidence interval(1,2,3 sigma): 8.8896E-06 to 8.8916E-06; 8.8885E-06 to 8.8927E-06; 8.8875E-06 to 8.8937E-06

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       44 with nps = 16950999312  print table 160


 normed average tally per history  = 8.89059E-06          unnormed average tally per history  = 3.55624E-02
 estimated tally relative error    = 0.0001               estimated variance of the variance  = 0.0000
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =   139365644          efficiency for the nonzero tallies  = 0.0082
 history number of largest  tally  =  7448656020          largest  unnormalized history tally = 9.56583E+02
 (largest  tally)/(average tally)  = 2.68987E+04          (largest  tally)/(avg nonzero tally)= 2.21153E+02

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 8.89059E-06


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            8.89059E-06             8.89061E-06                     0.000002
      relative error                  1.16263E-04             1.16273E-04                     0.000092
      variance of the variance        2.52908E-07             2.87500E-07                     0.136778
      shifted center                  8.89059E-06             8.89059E-06                     0.000000
      figure of merit                 3.69905E+02             3.69837E+02                    -0.000183

 the estimated inverse power slope of the 200 largest  tallies starting at 1.73190E+02 is 3.5522
 the history score probability density function appears to have an unsampled region at the largest  history scores:
 please examine. see print table 161.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (8.475E+04)*( 6.606E-02)**2 = (8.475E+04)*(4.364E-03) = 3.699E+02

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
   1048576000   6.4593E-06 0.0006 0.0000 10.0     254   7.6027E-06 0.0005 0.0000 10.0     312   1.0082E-05 0.0005 0.0000 10.0     304
   2097152000   6.4632E-06 0.0004 0.0000  7.8     254   7.6014E-06 0.0004 0.0000 10.0     312   1.0082E-05 0.0004 0.0000  8.5     304
   3145728000   6.4656E-06 0.0003 0.0000 10.0     254   7.6025E-06 0.0003 0.0000 10.0     312   1.0086E-05 0.0003 0.0000 10.0     304
   4194304000   6.4653E-06 0.0003 0.0000 10.0     254   7.6005E-06 0.0003 0.0000 10.0     312   1.0084E-05 0.0003 0.0000  9.4     305
   5242880000   6.4654E-06 0.0003 0.0000 10.0     254   7.6001E-06 0.0002 0.0000 10.0     312   1.0082E-05 0.0002 0.0000  9.1     305
   6291456000   6.4653E-06 0.0002 0.0000  6.1     254   7.6014E-06 0.0002 0.0000  4.6     312   1.0081E-05 0.0002 0.0000  4.9     305
   7340032000   6.4661E-06 0.0002 0.0000  5.8     254   7.6016E-06 0.0002 0.0000  5.0     312   1.0082E-05 0.0002 0.0000  4.8     305
   8388608000   6.4655E-06 0.0002 0.0000  4.1     254   7.6015E-06 0.0002 0.0000  3.8     312   1.0081E-05 0.0002 0.0000  3.6     304
   9437184000   6.4653E-06 0.0002 0.0000  3.9     254   7.6022E-06 0.0002 0.0000  3.9     312   1.0082E-05 0.0002 0.0000  3.8     304
  10485760000   6.4653E-06 0.0002 0.0000  3.8     254   7.6015E-06 0.0002 0.0000  3.8     312   1.0081E-05 0.0002 0.0000  3.1     304
  11534336000   6.4649E-06 0.0002 0.0000  3.8     254   7.6015E-06 0.0002 0.0000  3.5     312   1.0081E-05 0.0002 0.0000  3.3     304
  12582912000   6.4651E-06 0.0002 0.0000  3.8     254   7.6022E-06 0.0001 0.0000  3.7     312   1.0080E-05 0.0001 0.0000  3.4     305
  13631488000   6.4651E-06 0.0002 0.0000  3.8     254   7.6021E-06 0.0001 0.0000  3.9     312   1.0080E-05 0.0001 0.0000  3.1     305
  14680064000   6.4653E-06 0.0002 0.0000  4.0     254   7.6023E-06 0.0001 0.0000  4.4     312   1.0081E-05 0.0001 0.0000  3.3     305
  15728640000   6.4657E-06 0.0001 0.0000  4.0     254   7.6022E-06 0.0001 0.0000  4.3     312   1.0081E-05 0.0001 0.0000  3.4     305
  16777216000   6.4660E-06 0.0001 0.0000  3.9     254   7.6024E-06 0.0001 0.0000  4.1     312   1.0081E-05 0.0001 0.0000  3.3     305
  16950999312   6.4661E-06 0.0001 0.0000  3.8     254   7.6025E-06 0.0001 0.0000  4.2     312   1.0081E-05 0.0001 0.0000  3.4     304
 

                            tally       34                          tally       44
          nps      mean     error   vov  slope    fom      mean     error   vov  slope    fom
   1048576000   7.6011E-06 0.0005 0.0000 10.0     306   8.8875E-06 0.0005 0.0000 10.0     369
   2097152000   7.6030E-06 0.0004 0.0000 10.0     307   8.8904E-06 0.0003 0.0000  6.0     370
   3145728000   7.6044E-06 0.0003 0.0000 10.0     307   8.8904E-06 0.0003 0.0000  8.4     370
   4194304000   7.6016E-06 0.0003 0.0000 10.0     307   8.8908E-06 0.0002 0.0000 10.0     370
   5242880000   7.6019E-06 0.0002 0.0000 10.0     307   8.8903E-06 0.0002 0.0000 10.0     370
   6291456000   7.6023E-06 0.0002 0.0000  5.3     307   8.8903E-06 0.0002 0.0000  4.5     370
   7340032000   7.6024E-06 0.0002 0.0000  5.7     307   8.8912E-06 0.0002 0.0000  4.3     370
   8388608000   7.6022E-06 0.0002 0.0000  3.6     306   8.8904E-06 0.0002 0.0000  3.5     370
   9437184000   7.6021E-06 0.0002 0.0000  3.8     306   8.8907E-06 0.0002 0.0000  3.5     370
  10485760000   7.6022E-06 0.0002 0.0000  3.6     306   8.8907E-06 0.0001 0.0000  3.4     370
  11534336000   7.6021E-06 0.0002 0.0000  3.9     307   8.8908E-06 0.0001 0.0000  3.5     370
  12582912000   7.6024E-06 0.0001 0.0000  3.8     307   8.8907E-06 0.0001 0.0000  3.5     370
  13631488000   7.6023E-06 0.0001 0.0000  3.5     307   8.8903E-06 0.0001 0.0000  3.7     370
  14680064000   7.6024E-06 0.0001 0.0000  3.4     307   8.8904E-06 0.0001 0.0000  3.5     370
  15728640000   7.6023E-06 0.0001 0.0000  3.7     307   8.8901E-06 0.0001 0.0000  3.3     370
  16777216000   7.6025E-06 0.0001 0.0000  3.7     307   8.8905E-06 0.0001 0.0000  3.5     370
  16950999312   7.6025E-06 0.0001 0.0000  3.7     307   8.8906E-06 0.0001 0.0000  3.6     370

 ***********************************************************************************************************************

 dump no.  168 on file inpr     nps = 16950999312     coll =    50279842154     ctm =   200000.28   nrn =     
 681123142196

         8 warning messages so far.


 run terminated when it had used*****  minutes of computer time.

 computer time =******** minutes

 mcnp     version 6     06/19/14                     08/06/17 18:15:56                     probid =  08/06/17 09:56:02 
