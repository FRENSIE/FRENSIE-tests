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
       153-       sb1    4.72776e-01 5.27224e-01                                                  
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
       220-       wwp:n 5.0 j 100 j -1 0 2.214798825e-01                                          
 
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

    minimum source weight = 9.4836E-01    maximum source weight = 1.0576E+00

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

 dump no.    2 on file inpr     nps =   107700986     coll =      213102559     ctm =     1200.31   nrn =       
 3242692516

 ***********************************************************************************************************************

 dump no.    3 on file inpr     nps =   215346625     coll =      426104522     ctm =     2400.66   nrn =       
 6483751961

 ***********************************************************************************************************************

 dump no.    4 on file inpr     nps =   322335512     coll =      637821660     ctm =     3601.07   nrn =       
 9705093191

 ***********************************************************************************************************************

 dump no.    5 on file inpr     nps =   429677207     coll =      850148439     ctm =     4801.38   nrn =      
 12936259948

 ***********************************************************************************************************************

 dump no.    6 on file inpr     nps =   537046487     coll =     1062629768     ctm =     6001.63   nrn =      
 16169167446

 ***********************************************************************************************************************

 dump no.    7 on file inpr     nps =   644409803     coll =     1275030778     ctm =     7201.87   nrn =      
 19401211317

 ***********************************************************************************************************************

 dump no.    8 on file inpr     nps =   751196640     coll =     1486336652     ctm =     8402.23   nrn =      
 22616332827

 ***********************************************************************************************************************

 dump no.    9 on file inpr     nps =   858571680     coll =     1698814739     ctm =     9602.68   nrn =      
 25849321859

 ***********************************************************************************************************************

 dump no.   10 on file inpr     nps =   965924530     coll =     1911259991     ctm =    10803.02   nrn =      
 29081662460

 ***********************************************************************************************************************

 dump no.   11 on file inpr     nps =  1072781184     coll =     2122704852     ctm =    12003.39   nrn =      
 32298871000

 ***********************************************************************************************************************

 dump no.   12 on file inpr     nps =  1180169150     coll =     2335288615     ctm =    13203.83   nrn =      
 35532955340

 ***********************************************************************************************************************

 dump no.   13 on file inpr     nps =  1287583275     coll =     2547848435     ctm =    14404.13   nrn =      
 38767134682

 ***********************************************************************************************************************

 dump no.   14 on file inpr     nps =  1394449448     coll =     2759333904     ctm =    15604.43   nrn =      
 41984906985

 ***********************************************************************************************************************

 dump no.   15 on file inpr     nps =  1501819546     coll =     2971868205     ctm =    16804.78   nrn =      
 45218425272

 ***********************************************************************************************************************

 dump no.   16 on file inpr     nps =  1609241759     coll =     3184455143     ctm =    18005.04   nrn =      
 48453019400

 ***********************************************************************************************************************

 dump no.   17 on file inpr     nps =  1716640148     coll =     3397006624     ctm =    19205.32   nrn =      
 51686967861

 ***********************************************************************************************************************

 dump no.   18 on file inpr     nps =  1823596507     coll =     3608596189     ctm =    20405.68   nrn =      
 54906576928

 ***********************************************************************************************************************

 dump no.   19 on file inpr     nps =  1931011275     coll =     3821196725     ctm =    21605.96   nrn =      
 58141147235

 ***********************************************************************************************************************

 dump no.   20 on file inpr     nps =  2038433488     coll =     4033776223     ctm =    22806.26   nrn =      
 61375640352

 ***********************************************************************************************************************

 dump no.   21 on file inpr     nps =  2145410490     coll =     4245499215     ctm =    24006.56   nrn =      
 64596926261

 ***********************************************************************************************************************

 dump no.   22 on file inpr     nps =  2252765698     coll =     4458020786     ctm =    25206.90   nrn =      
 67830108501

 ***********************************************************************************************************************

 dump no.   23 on file inpr     nps =  2360143241     coll =     4670502446     ctm =    26407.20   nrn =      
 71063140503

 ***********************************************************************************************************************

 dump no.   24 on file inpr     nps =  2467095133     coll =     4882203227     ctm =    27607.49   nrn =      
 74284030136

 ***********************************************************************************************************************

 dump no.   25 on file inpr     nps =  2574459275     coll =     5094623218     ctm =    28807.77   nrn =      
 77516184325

 ***********************************************************************************************************************

 dump no.   26 on file inpr     nps =  2681871065     coll =     5307130970     ctm =    30008.13   nrn =      
 80749870897

 ***********************************************************************************************************************

 dump no.   27 on file inpr     nps =  2789275613     coll =     5519644894     ctm =    31208.48   nrn =      
 83983299933

 ***********************************************************************************************************************

 dump no.   28 on file inpr     nps =  2896164561     coll =     5731218264     ctm =    32408.83   nrn =      
 87202263662

 ***********************************************************************************************************************

 dump no.   29 on file inpr     nps =  3003531884     coll =     5943775094     ctm =    33609.27   nrn =      
 90436117912

 ***********************************************************************************************************************

 dump no.   30 on file inpr     nps =  3110942388     coll =     6156301276     ctm =    34809.61   nrn =      
 93669809987

 ***********************************************************************************************************************

 dump no.   31 on file inpr     nps =  3217782199     coll =     6367722884     ctm =    36010.00   nrn =      
 96886784949

 ***********************************************************************************************************************

 dump no.   32 on file inpr     nps =  3323802692     coll =     6577486021     ctm =    37210.27   nrn =     
 100078556797

 ***********************************************************************************************************************

 dump no.   33 on file inpr     nps =  3431252944     coll =     6789995919     ctm =    38410.66   nrn =     
 103312564424

 ***********************************************************************************************************************

 dump no.   34 on file inpr     nps =  3538229728     coll =     7001733636     ctm =    39611.04   nrn =     
 106533907082

 ***********************************************************************************************************************

 dump no.   35 on file inpr     nps =  3645667792     coll =     7214313843     ctm =    40811.30   nrn =     
 109768616065

 ***********************************************************************************************************************

 dump no.   36 on file inpr     nps =  3753168416     coll =     7427044741     ctm =    42011.63   nrn =     
 113005329523

 ***********************************************************************************************************************

 dump no.   37 on file inpr     nps =  3860625879     coll =     7639648921     ctm =    43211.93   nrn =     
 116240348792

 ***********************************************************************************************************************

 dump no.   38 on file inpr     nps =  3967610112     coll =     7851315375     ctm =    44412.19   nrn =     
 119461127695

 ***********************************************************************************************************************

 dump no.   39 on file inpr     nps =  4075067726     coll =     8063902530     ctm =    45612.49   nrn =     
 122696477713

 ***********************************************************************************************************************

 dump no.   40 on file inpr     nps =  4182524389     coll =     8276562625     ctm =    46812.87   nrn =     
 125931983327

 ***********************************************************************************************************************

 dump no.   41 on file inpr     nps =  4289529668     coll =     8488310797     ctm =    48013.11   nrn =     
 129153794893

 ***********************************************************************************************************************

 dump no.   42 on file inpr     nps =  4396971441     coll =     8700830673     ctm =    49213.52   nrn =     
 132387755322

 ***********************************************************************************************************************

 dump no.   43 on file inpr     nps =  4504392311     coll =     8913439342     ctm =    50413.80   nrn =     
 135622563025

 ***********************************************************************************************************************

 dump no.   44 on file inpr     nps =  4611201069     coll =     9124783308     ctm =    51614.11   nrn =     
 138838305825

 ***********************************************************************************************************************

 dump no.   45 on file inpr     nps =  4718602423     coll =     9337286761     ctm =    52814.21   nrn =     
 142071796170

 ***********************************************************************************************************************

 dump no.   46 on file inpr     nps =  4826068020     coll =     9549999991     ctm =    54014.54   nrn =     
 145308015013

 ***********************************************************************************************************************

 dump no.   47 on file inpr     nps =  4933502348     coll =     9762629454     ctm =    55214.89   nrn =     
 148543105935

 ***********************************************************************************************************************

 dump no.   48 on file inpr     nps =  5040406186     coll =     9974053317     ctm =    56415.29   nrn =     
 151760615964

 ***********************************************************************************************************************

 dump no.   49 on file inpr     nps =  5147862849     coll =    10186661444     ctm =    57615.68   nrn =     
 154995686344

 ***********************************************************************************************************************

 dump no.   50 on file inpr     nps =  5255308683     coll =    10399138896     ctm =    58815.95   nrn =     
 158229365491

 ***********************************************************************************************************************

 dump no.   51 on file inpr     nps =  5362357360     coll =    10611011652     ctm =    60016.28   nrn =     
 161452996210

 ***********************************************************************************************************************

 dump no.   52 on file inpr     nps =  5469760419     coll =    10823627670     ctm =    61216.70   nrn =     
 164687661820

 ***********************************************************************************************************************

 dump no.   53 on file inpr     nps =  5577181346     coll =    11036312305     ctm =    62417.03   nrn =     
 167923233093

 ***********************************************************************************************************************

 dump no.   54 on file inpr     nps =  5684154084     coll =    11248095905     ctm =    63617.43   nrn =     
 171145193709

 ***********************************************************************************************************************

 dump no.   55 on file inpr     nps =  5791581644     coll =    11460693714     ctm =    64817.84   nrn =     
 174379959465

 ***********************************************************************************************************************

 dump no.   56 on file inpr     nps =  5899021928     coll =    11673391609     ctm =    66018.14   nrn =     
 177615789620

 ***********************************************************************************************************************

 dump no.   57 on file inpr     nps =  6006422009     coll =    11885922429     ctm =    67218.56   nrn =     
 180849480358

 ***********************************************************************************************************************

 dump no.   58 on file inpr     nps =  6113403681     coll =    12097515707     ctm =    68418.88   nrn =     
 184069534360

 ***********************************************************************************************************************

 dump no.   59 on file inpr     nps =  6220858855     coll =    12310175667     ctm =    69619.43   nrn =     
 187305256770

 ***********************************************************************************************************************

 dump no.   60 on file inpr     nps =  6328281948     coll =    12522767596     ctm =    70819.74   nrn =     
 190539890266

 ***********************************************************************************************************************

 dump no.   61 on file inpr     nps =  6435157901     coll =    12734369904     ctm =    72020.09   nrn =     
 193758888017

 ***********************************************************************************************************************

 dump no.   62 on file inpr     nps =  6542501400     coll =    12946776871     ctm =    73220.39   nrn =     
 196990740993

 ***********************************************************************************************************************

 dump no.   63 on file inpr     nps =  6649849366     coll =    13159250167     ctm =    74420.65   nrn =     
 200223430641

 ***********************************************************************************************************************

 dump no.   64 on file inpr     nps =  6756726808     coll =    13370731978     ctm =    75620.94   nrn =     
 203441237884

 ***********************************************************************************************************************

 dump no.   65 on file inpr     nps =  6864054605     coll =    13583214448     ctm =    76821.22   nrn =     
 206673904687

 ***********************************************************************************************************************

 dump no.   66 on file inpr     nps =  6971426395     coll =    13795692360     ctm =    78021.57   nrn =     
 209906748178

 ***********************************************************************************************************************

 dump no.   67 on file inpr     nps =  7078772872     coll =    14008177727     ctm =    79221.82   nrn =     
 213139522033

 ***********************************************************************************************************************

 dump no.   68 on file inpr     nps =  7185516304     coll =    14219471750     ctm =    80422.24   nrn =     
 216354001039

 ***********************************************************************************************************************

 dump no.   69 on file inpr     nps =  7292894050     coll =    14431945887     ctm =    81622.50   nrn =     
 219586994847

 ***********************************************************************************************************************

 dump no.   70 on file inpr     nps =  7400263539     coll =    14644425095     ctm =    82822.89   nrn =     
 222820100405

 ***********************************************************************************************************************

 dump no.   71 on file inpr     nps =  7507050152     coll =    14855722993     ctm =    84023.22   nrn =     
 226035111654

 ***********************************************************************************************************************

 dump no.   72 on file inpr     nps =  7614366849     coll =    15068061986     ctm =    85223.52   nrn =     
 229266043559

 ***********************************************************************************************************************

 dump no.   73 on file inpr     nps =  7721692480     coll =    15280546748     ctm =    86423.81   nrn =     
 232498561783

 ***********************************************************************************************************************

 dump no.   74 on file inpr     nps =  7828604169     coll =    15492098852     ctm =    87624.15   nrn =     
 235717437444

 ***********************************************************************************************************************

 dump no.   75 on file inpr     nps =  7935912609     coll =    15704426546     ctm =    88824.45   nrn =     
 238948158024

 ***********************************************************************************************************************

 dump no.   76 on file inpr     nps =  8043288866     coll =    15916811057     ctm =    90024.86   nrn =     
 242180223507

 ***********************************************************************************************************************

 dump no.   77 on file inpr     nps =  8150577272     coll =    16128987721     ctm =    91225.11   nrn =     
 245409354024

 ***********************************************************************************************************************

 dump no.   78 on file inpr     nps =  8257472582     coll =    16340485315     ctm =    92425.39   nrn =     
 248627510431

 ***********************************************************************************************************************

 dump no.   79 on file inpr     nps =  8364859262     coll =    16553078899     ctm =    93625.86   nrn =     
 251861672460

 ***********************************************************************************************************************

 dump no.   80 on file inpr     nps =  8472224284     coll =    16765571098     ctm =    94826.24   nrn =     
 255094790182

 ***********************************************************************************************************************

 dump no.   81 on file inpr     nps =  8579107682     coll =    16977164687     ctm =    96026.56   nrn =     
 258313715524

 ***********************************************************************************************************************

 dump no.   82 on file inpr     nps =  8686403533     coll =    17189397512     ctm =    97227.00   nrn =     
 261543387186

 ***********************************************************************************************************************

 dump no.   83 on file inpr     nps =  8793736609     coll =    17401771543     ctm =    98427.26   nrn =     
 264774777964

 ***********************************************************************************************************************

 dump no.   84 on file inpr     nps =  8900588683     coll =    17613244853     ctm =    99627.57   nrn =     
 267992327789

 ***********************************************************************************************************************

 dump no.   85 on file inpr     nps =  9007937109     coll =    17825648053     ctm =   100827.87   nrn =     
 271224254010

 ***********************************************************************************************************************

 dump no.   86 on file inpr     nps =  9115329254     coll =    18038108542     ctm =   102028.29   nrn =     
 274457218921

 ***********************************************************************************************************************

 dump no.   87 on file inpr     nps =  9222680198     coll =    18250501700     ctm =   103228.61   nrn =     
 277689090296

 ***********************************************************************************************************************

 dump no.   88 on file inpr     nps =  9329557220     coll =    18461888023     ctm =   104429.00   nrn =     
 280906003772

 ***********************************************************************************************************************

 dump no.   89 on file inpr     nps =  9436957184     coll =    18674326451     ctm =   105629.40   nrn =     
 284138900667

 ***********************************************************************************************************************

 dump no.   90 on file inpr     nps =  9544350308     coll =    18886809347     ctm =   106829.71   nrn =     
 287372028660

 ***********************************************************************************************************************

 dump no.   91 on file inpr     nps =  9651264850     coll =    19098372050     ctm =   108030.11   nrn =     
 290591092750

 ***********************************************************************************************************************

 dump no.   92 on file inpr     nps =  9758583874     coll =    19310663585     ctm =   109230.39   nrn =     
 293821638315

 ***********************************************************************************************************************

 dump no.   93 on file inpr     nps =  9865932074     coll =    19523149300     ctm =   110430.70   nrn =     
 297054352801

 ***********************************************************************************************************************

 dump no.   94 on file inpr     nps =  9972786752     coll =    19734633063     ctm =   111630.93   nrn =     
 300271986937

 ***********************************************************************************************************************

 dump no.   95 on file inpr     nps = 10080142976     coll =    19947033633     ctm =   112831.24   nrn =     
 303503884793

 ***********************************************************************************************************************

 dump no.   96 on file inpr     nps = 10187023040     coll =    20158509209     ctm =   114031.54   nrn =     
 306721737796

 ***********************************************************************************************************************

 dump no.   97 on file inpr     nps = 10294353968     coll =    20370868558     ctm =   115231.81   nrn =     
 309952985051

 ***********************************************************************************************************************

 dump no.   98 on file inpr     nps = 10401266768     coll =    20582466545     ctm =   116432.12   nrn =     
 313172383588

 ***********************************************************************************************************************

 dump no.   99 on file inpr     nps = 10508635024     coll =    20794902900     ctm =   117632.39   nrn =     
 316404799698

 ***********************************************************************************************************************

 dump no.  100 on file inpr     nps = 10616003152     coll =    21007349424     ctm =   118832.68   nrn =     
 319637402378

 ***********************************************************************************************************************

 dump no.  101 on file inpr     nps = 10722935296     coll =    21219011933     ctm =   120032.95   nrn =     
 322857732467

 ***********************************************************************************************************************

 dump no.  102 on file inpr     nps = 10830301936     coll =    21431442365     ctm =   121233.27   nrn =     
 326090065868

 ***********************************************************************************************************************

 dump no.  103 on file inpr     nps = 10937684944     coll =    21643882626     ctm =   122433.57   nrn =     
 329322640605

 ***********************************************************************************************************************

 dump no.  104 on file inpr     nps = 11044541200     coll =    21855440382     ctm =   123633.90   nrn =     
 332541100007

 ***********************************************************************************************************************

 dump no.  105 on file inpr     nps = 11151867664     coll =    22067803423     ctm =   124834.28   nrn =     
 335772401010

 ***********************************************************************************************************************

 dump no.  106 on file inpr     nps = 11259240256     coll =    22280246874     ctm =   126034.68   nrn =     
 339004968526

 ***********************************************************************************************************************

 dump no.  107 on file inpr     nps = 11366584576     coll =    22492699897     ctm =   127235.07   nrn =     
 342237226283

 ***********************************************************************************************************************

 dump no.  108 on file inpr     nps = 11473513744     coll =    22704224462     ctm =   128435.46   nrn =     
 345455893416

 ***********************************************************************************************************************

 dump no.  109 on file inpr     nps = 11580940160     coll =    22916797105     ctm =   129635.92   nrn =     
 348690295604

 ***********************************************************************************************************************

 dump no.  110 on file inpr     nps = 11688376736     coll =    23129399410     ctm =   130836.23   nrn =     
 351925129215

 ***********************************************************************************************************************

 dump no.  111 on file inpr     nps = 11795311856     coll =    23341002690     ctm =   132036.54   nrn =     
 355144720733

 ***********************************************************************************************************************

 dump no.  112 on file inpr     nps = 11902659152     coll =    23553429542     ctm =   133236.86   nrn =     
 358377070954

 ***********************************************************************************************************************

 dump no.  113 on file inpr     nps = 12010007936     coll =    23765839484     ctm =   134437.18   nrn =     
 361609044499

 ***********************************************************************************************************************

 dump no.  114 on file inpr     nps = 12116888000     coll =    23977346441     ctm =   135637.56   nrn =     
 364827146985

 ***********************************************************************************************************************

 dump no.  115 on file inpr     nps = 12224275472     coll =    24189835484     ctm =   136837.94   nrn =     
 368060394600

 ***********************************************************************************************************************

 dump no.  116 on file inpr     nps = 12331685264     coll =    24402440029     ctm =   138038.27   nrn =     
 371295121721

 ***********************************************************************************************************************

 dump no.  117 on file inpr     nps = 12439077200     coll =    24614954341     ctm =   139238.62   nrn =     
 374528693661

 ***********************************************************************************************************************

 dump no.  118 on file inpr     nps = 12546037616     coll =    24826649315     ctm =   140438.86   nrn =     
 377749525000

 ***********************************************************************************************************************

 dump no.  119 on file inpr     nps = 12653452128     coll =    25039218075     ctm =   141639.20   nrn =     
 380983797082

 ***********************************************************************************************************************

 dump no.  120 on file inpr     nps = 12760882752     coll =    25251764763     ctm =   142839.52   nrn =     
 384217988857

 ***********************************************************************************************************************

 dump no.  121 on file inpr     nps = 12867694368     coll =    25463165173     ctm =   144039.82   nrn =     
 387434281876

 ***********************************************************************************************************************

 dump no.  122 on file inpr     nps = 12975056544     coll =    25675694777     ctm =   145240.09   nrn =     
 390667565056

 ***********************************************************************************************************************

 dump no.  123 on file inpr     nps = 13082436576     coll =    25888134688     ctm =   146440.31   nrn =     
 393900081612

 ***********************************************************************************************************************

 dump no.  124 on file inpr     nps = 13189261584     coll =    26099527716     ctm =   147640.59   nrn =     
 397116556701

 ***********************************************************************************************************************

 dump no.  125 on file inpr     nps = 13296634176     coll =    26312033214     ctm =   148840.93   nrn =     
 400349910233

 ***********************************************************************************************************************

 dump no.  126 on file inpr     nps = 13404058848     coll =    26524641404     ctm =   150041.29   nrn =     
 403584639836

 ***********************************************************************************************************************

 dump no.  127 on file inpr     nps = 13511401680     coll =    26736925153     ctm =   151241.57   nrn =     
 406815179820

 ***********************************************************************************************************************

 dump no.  128 on file inpr     nps = 13618290672     coll =    26948456221     ctm =   152441.96   nrn =     
 410033600816

 ***********************************************************************************************************************

 dump no.  129 on file inpr     nps = 13725647152     coll =    27161024588     ctm =   153642.31   nrn =     
 413267154025

 ***********************************************************************************************************************

 dump no.  130 on file inpr     nps = 13833036112     coll =    27373594527     ctm =   154842.63   nrn =     
 416501174830

 ***********************************************************************************************************************

 dump no.  131 on file inpr     nps = 13939968256     coll =    27585266540     ctm =   156043.01   nrn =     
 419721549298

 ***********************************************************************************************************************

 dump no.  132 on file inpr     nps = 14047337872     coll =    27797756494     ctm =   157243.27   nrn =     
 422954466074

 ***********************************************************************************************************************

 dump no.  133 on file inpr     nps = 14154746176     coll =    28010322968     ctm =   158443.55   nrn =     
 426188717562

 ***********************************************************************************************************************

 dump no.  134 on file inpr     nps = 14261556304     coll =    28221755867     ctm =   159643.89   nrn =     
 429405452585

 ***********************************************************************************************************************

 dump no.  135 on file inpr     nps = 14368943776     coll =    28434262145     ctm =   160844.21   nrn =     
 432638798742

 ***********************************************************************************************************************

 dump no.  136 on file inpr     nps = 14476374400     coll =    28646825993     ctm =   162044.56   nrn =     
 435873145299

 ***********************************************************************************************************************

 dump no.  137 on file inpr     nps = 14583770800     coll =    28859312357     ctm =   163244.92   nrn =     
 439106626575

 ***********************************************************************************************************************

 dump no.  138 on file inpr     nps = 14690561840     coll =    29070557806     ctm =   164445.26   nrn =     
 442321177312

 ***********************************************************************************************************************

 dump no.  139 on file inpr     nps = 14797934432     coll =    29283048587     ctm =   165645.56   nrn =     
 445554376223

 ***********************************************************************************************************************

 dump no.  140 on file inpr     nps = 14905329344     coll =    29495572043     ctm =   166845.98   nrn =     
 448788001563

 ***********************************************************************************************************************

 dump no.  141 on file inpr     nps = 15012221312     coll =    29707118385     ctm =   168046.31   nrn =     
 452006757782

 ***********************************************************************************************************************

 dump no.  142 on file inpr     nps = 15119599856     coll =    29919658225     ctm =   169246.69   nrn =     
 455240514088

 ***********************************************************************************************************************

 dump no.  143 on file inpr     nps = 15227018576     coll =    30132250008     ctm =   170446.98   nrn =     
 458475032995

 ***********************************************************************************************************************

 dump no.  144 on file inpr     nps = 15334002800     coll =    30343898132     ctm =   171647.29   nrn =     
 461695624966

 ***********************************************************************************************************************

 dump no.  145 on file inpr     nps = 15441420032     coll =    30556483135     ctm =   172847.53   nrn =     
 464930095521

 ***********************************************************************************************************************

 dump no.  146 on file inpr     nps = 15548874464     coll =    30769084200     ctm =   174047.78   nrn =     
 468165050492

 ***********************************************************************************************************************

 dump no.  147 on file inpr     nps = 15656293184     coll =    30981677263     ctm =   175248.18   nrn =     
 471399684735

 ***********************************************************************************************************************

 dump no.  148 on file inpr     nps = 15763288080     coll =    31193462971     ctm =   176448.47   nrn =     
 474621801440

 ***********************************************************************************************************************

 dump no.  149 on file inpr     nps = 15870723168     coll =    31406132708     ctm =   177648.80   nrn =     
 477857411453

 ***********************************************************************************************************************

 dump no.  150 on file inpr     nps = 15978149328     coll =    31618773074     ctm =   178849.13   nrn =     
 481092577467

 ***********************************************************************************************************************

 dump no.  151 on file inpr     nps = 16085041296     coll =    31830281292     ctm =   180049.44   nrn =     
 484310865006

 ***********************************************************************************************************************

 dump no.  152 on file inpr     nps = 16191089568     coll =    32040118864     ctm =   181249.85   nrn =     
 487503723595

 ***********************************************************************************************************************

 dump no.  153 on file inpr     nps = 16298530608     coll =    32252689905     ctm =   182450.16   nrn =     
 490738446103

 ***********************************************************************************************************************

 dump no.  154 on file inpr     nps = 16405397280     coll =    32464228943     ctm =   183650.46   nrn =     
 493956689364

 ***********************************************************************************************************************

 dump no.  155 on file inpr     nps = 16512795168     coll =    32676724971     ctm =   184850.75   nrn =     
 497190164635

 ***********************************************************************************************************************

 dump no.  156 on file inpr     nps = 16620248112     coll =    32889312485     ctm =   186051.01   nrn =     
 500424973497

 ***********************************************************************************************************************

 dump no.  157 on file inpr     nps = 16727662368     coll =    33101832367     ctm =   187251.29   nrn =     
 503658782046

 ***********************************************************************************************************************

 dump no.  158 on file inpr     nps = 16834707856     coll =    33313610581     ctm =   188451.59   nrn =     
 506881359348

 ***********************************************************************************************************************

 dump no.  159 on file inpr     nps = 16942144432     coll =    33526231094     ctm =   189651.88   nrn =     
 510116589424

 ***********************************************************************************************************************

 dump no.  160 on file inpr     nps = 17049609280     coll =    33738795955     ctm =   190852.28   nrn =     
 513351300960

 ***********************************************************************************************************************

 dump no.  161 on file inpr     nps = 17156641120     coll =    33950513915     ctm =   192052.64   nrn =     
 516573133974

 ***********************************************************************************************************************

 dump no.  162 on file inpr     nps = 17264053888     coll =    34163189396     ctm =   193253.04   nrn =     
 519808374155

 ***********************************************************************************************************************

 dump no.  163 on file inpr     nps = 17371496416     coll =    34375781626     ctm =   194453.32   nrn =     
 523046678272

 ***********************************************************************************************************************

 dump no.  164 on file inpr     nps = 17478407728     coll =    34587287047     ctm =   195653.62   nrn =     
 526265219175

 ***********************************************************************************************************************

 dump no.  165 on file inpr     nps = 17585807104     coll =    34799771512     ctm =   196853.99   nrn =     
 529498396973

 ***********************************************************************************************************************

 dump no.  166 on file inpr     nps = 17693218384     coll =    35012365267     ctm =   198054.26   nrn =     
 532732967583

 ***********************************************************************************************************************

 dump no.  167 on file inpr     nps = 17800613296     coll =    35224944827     ctm =   199254.53   nrn =     
 535967151919
1problem summary                                                                                                           

      run terminated when it had used*****  minutes of computer time.
+                                                                                                    08/06/17 01:33:50 
      c //-------------------------------------------------------------------------//      probid =  08/05/17 17:13:59 

 neutron creation    tracks      weight        energy            neutron loss        tracks      weight        energy
                                 (per source particle)                                           (per source particle)

 source         17866884608    1.0000E+00    1.4100E+01          escape         28616332635    1.0343E+00    1.0605E+01
 nucl. interaction        0    0.            0.                  energy cutoff            0    0.            0.        
 particle decay           0    0.            0.                  time cutoff         708396    1.5005E-05    7.6310E-06
 weight window  10492993958    1.8284E-02    8.9021E-02          weight window   1859781675    1.8285E-02    8.9025E-02
 cell importance          0    0.            0.                  cell importance          0    0.            0.        
 weight cutoff            0    0.            0.                  weight cutoff            0    0.            0.        
 e or t importance        0    0.            0.                  e or t importance        0    0.            0.        
 dxtran                   0    0.            0.                  dxtran                   0    0.            0.        
 forced collisions        0    0.            0.                  forced collisions        0    0.            0.        
 exp. transform           0    0.            0.                  exp. transform           0    0.            0.        
 upscattering             0    0.            1.7528E-14          downscattering           0    0.            1.8675E+00
 photonuclear             0    0.            0.                  capture                103    5.0190E-02    6.6571E-01
 (n,xn)          4053453220    1.6509E-01    1.9601E-01          loss to (n,xn)  2026675996    8.2542E-02    1.1601E+00
 prompt fission   138472938    3.0433E-03    6.2429E-03          loss to fission   49061832    1.0558E-03    3.7643E-03
 delayed fission     755913    1.6013E-05    8.1664E-06          nucl. interaction        0    0.            0.        
 prompt photofis          0    0.            0.                  particle decay           0    0.            0.        
 tabular boundary         0    0.            0.                  tabular boundary         0    0.            0.        
 tabular sampling         0    0.            0.                  elastic scatter          0    0.            0.        
     total      32552560637    1.1864E+00    1.4391E+01              total      32552560637    1.1864E+00    1.4391E+01

   number of neutrons banked             -1575937309        average time of (shakes)              cutoffs
   neutron tracks per source particle     1.8219E+00          escape            5.0000E+06          tco   2.0000E+07
   neutron collisions per source particle 1.9789E+00          capture           5.0000E+06          eco   0.0000E+00
   total neutron collisions              -2147483648          capture or escape 5.0000E+06          wc1  -5.0000E-01
   net multiplication              1.0845E+00 0.0000          any termination   4.6521E+06          wc2  -2.5000E-01

 computer time so far in this run200002.51 minutes            maximum number ever in bank        38
 computer time in mcrun          200000.38 minutes            bank overflows to backup file       0
 source particles per minute            8.9334E+04
 random numbers generated             537962356824            most random numbers used was     3596008 in history 17290241900
 
  warning.   random number stride   152917 exceeded        3 times.
 
  warning.  random number period exceeded.  decrease stride.

 range of sampled source weights = 9.4836E-01 to 1.0576E+00

 number of histories processed by each thread
   866881970   897050468   895427871   893977711   893653090   892734004   899042135   897043157   894631796   894473632
   897959877   897722355   895238983   893166588   891332773   893759272   893819249   895982802   892259383   890727492
 
  warning.  some of the geometry is covered by a weight window mesh.
1neutron  activity in each cell                                                                         print table 126

                       tracks     population   collisions   collisions     number        flux        average      average
              cell    entering                               * weight     weighted     weighted   track weight   track mfp
                                                          (per history)    energy       energy     (relative)      (cm)

        1        1 36209322483  28946856146    104091227    4.1533E-03   6.1620E+00   1.0882E+01   7.5219E-01   1.1963E+04
        2        2 17701683606  18446432071  34885782495    1.2452E+00   3.4889E+00   8.2408E+00   6.5367E-01   4.2398E+00
        3        3 10866381675   8526405663     71686151    2.6370E-03   3.0915E+00   7.8309E+00   7.1029E-01   1.1145E+04
        4        4    27471377    137334260    289669569    6.1882E-03   1.2575E+00   2.8667E+00   3.8610E-01   2.7785E+00
        5       10   604418391    868740094       870851    2.3433E-06   2.4137E+00   6.3348E+00   4.8511E-02   1.0742E+04
        6       11   755685870    963167629       946815    2.7975E-06   2.6113E+00   6.7092E+00   5.3489E-02   1.0871E+04
        7       12   864482347   1149377501      1122383    3.3554E-06   2.4840E+00   6.4677E+00   5.3996E-02   1.0794E+04
        8       13   743554478    950535194       931162    2.7957E-06   2.6122E+00   6.7100E+00   5.4332E-02   1.0872E+04
        9       14   831651638    978087232       959763    3.1343E-06   2.7308E+00   6.9127E+00   5.9240E-02   1.0941E+04

           total   68604651865  60966935790  35356060416    1.2582E+00

1tally        4        nps = 17866884608
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      10                                                                                   
                         4.00000E+03
 
 cell  10                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 5.56314E-06 0.0001   2.29167E-11 0.0484   1.82256E-11 0.0507   1.75484E-11 0.0510   1.82762E-11 0.0519
 
         time:       2.0000E+07             total                                                                  
                 1.57393E-11 0.0521   5.56324E-06 0.0001


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally        4

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00      yes         yes            constant    random       5.39
 passed?        yes          yes      yes          yes             yes      yes         yes               yes        yes         yes

 ===================================================================================================================================


 this tally meets the statistical criteria used to form confidence intervals: check the tally fluctuation chart to verify.
 the results in other bins associated with this tally may not meet these statistical criteria.

 ----- estimated confidence intervals:  -----

 estimated asymmetric confidence interval(1,2,3 sigma): 5.5625E-06 to 5.5639E-06; 5.5618E-06 to 5.5647E-06; 5.5611E-06 to 5.5654E-06
 estimated  symmetric confidence interval(1,2,3 sigma): 5.5625E-06 to 5.5639E-06; 5.5618E-06 to 5.5647E-06; 5.5611E-06 to 5.5654E-06

1analysis of the results in the tally fluctuation chart bin (tfc) for tally        4 with nps = 17866884608  print table 160


 normed average tally per history  = 5.56324E-06          unnormed average tally per history  = 2.22529E-02
 estimated tally relative error    = 0.0001               estimated variance of the variance  = 0.0000
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =   101248572          efficiency for the nonzero tallies  = 0.0057
 history number of largest  tally  = 10626091535          largest  unnormalized history tally = 9.25536E+01
 (largest  tally)/(average tally)  = 4.15916E+03          (largest  tally)/(avg nonzero tally)= 2.35692E+01

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 5.56324E-06


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            5.56324E-06             5.56324E-06                     0.000000
      relative error                  1.27826E-04             1.27826E-04                     0.000001
      variance of the variance        2.87772E-08             2.87879E-08                     0.000375
      shifted center                  5.56324E-06             5.56324E-06                     0.000000
      figure of merit                 3.06009E+02             3.06008E+02                    -0.000003

 the estimated inverse power slope of the 198 largest  tallies starting at 3.53011E+01 is 5.3935
 the large score tail of the empirical history score probability density function appears to have no unsampled regions.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (8.933E+04)*( 5.853E-02)**2 = (8.933E+04)*(3.425E-03) = 3.060E+02

1tally       14        nps = 17866884608
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      11                                                                                   
                         4.00000E+03
 
 cell  11                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 6.75225E-06 0.0001   8.87160E-12 0.0825   3.64763E-12 0.1104   3.47384E-12 0.1188   3.56935E-12 0.1225
 
         time:       2.0000E+07             total                                                                  
                 3.48840E-12 0.1111   6.75227E-06 0.0001


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

 estimated asymmetric confidence interval(1,2,3 sigma): 6.7515E-06 to 6.7531E-06; 6.7507E-06 to 6.7538E-06; 6.7499E-06 to 6.7546E-06
 estimated  symmetric confidence interval(1,2,3 sigma): 6.7515E-06 to 6.7531E-06; 6.7507E-06 to 6.7538E-06; 6.7499E-06 to 6.7546E-06

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       14 with nps = 17866884608  print table 160


 normed average tally per history  = 6.75227E-06          unnormed average tally per history  = 2.70091E-02
 estimated tally relative error    = 0.0001               estimated variance of the variance  = 0.0000
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =   119043008          efficiency for the nonzero tallies  = 0.0067
 history number of largest  tally  =  6210316213          largest  unnormalized history tally = 6.08043E+01
 (largest  tally)/(average tally)  = 2.25125E+03          (largest  tally)/(avg nonzero tally)= 1.49996E+01

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 6.75227E-06


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            6.75227E-06             6.75228E-06                     0.000000
      relative error                  1.15601E-04             1.15601E-04                     0.000000
      variance of the variance        2.20447E-08             2.20460E-08                     0.000062
      shifted center                  6.75227E-06             6.75227E-06                     0.000000
      figure of merit                 3.74149E+02             3.74149E+02                    -0.000001

 the estimated slope of the 200 largest  tallies starting at  3.52147E+01 appears to be decreasing at least exponentially.
 the large score tail of the empirical history score probability density function appears to have no unsampled regions.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (8.933E+04)*( 6.472E-02)**2 = (8.933E+04)*(4.188E-03) = 3.741E+02

1tally       24        nps = 17866884608
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      12                                                                                   
                         4.00000E+03
 
 cell  12                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 8.01618E-06 0.0001   1.47826E-11 0.0613   9.52715E-12 0.0747   9.48470E-12 0.0703   6.77238E-12 0.0807
 
         time:       2.0000E+07             total                                                                  
                 8.15887E-12 0.0749   8.01623E-06 0.0001


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       24

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00      yes         yes            constant    random       6.46
 passed?        yes          yes      yes          yes             yes      yes         yes               yes        yes         yes

 ===================================================================================================================================


 this tally meets the statistical criteria used to form confidence intervals: check the tally fluctuation chart to verify.
 the results in other bins associated with this tally may not meet these statistical criteria.

 ----- estimated confidence intervals:  -----

 estimated asymmetric confidence interval(1,2,3 sigma): 8.0154E-06 to 8.0171E-06; 8.0145E-06 to 8.0179E-06; 8.0137E-06 to 8.0188E-06
 estimated  symmetric confidence interval(1,2,3 sigma): 8.0154E-06 to 8.0171E-06; 8.0145E-06 to 8.0179E-06; 8.0137E-06 to 8.0188E-06

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       24 with nps = 17866884608  print table 160


 normed average tally per history  = 8.01623E-06          unnormed average tally per history  = 3.20649E-02
 estimated tally relative error    = 0.0001               estimated variance of the variance  = 0.0000
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =   144374015          efficiency for the nonzero tallies  = 0.0081
 history number of largest  tally  =  8175713662          largest  unnormalized history tally = 6.32951E+01
 (largest  tally)/(average tally)  = 1.97397E+03          (largest  tally)/(avg nonzero tally)= 1.59507E+01

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 8.01623E-06


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            8.01623E-06             8.01623E-06                     0.000000
      relative error                  1.06284E-04             1.06284E-04                     0.000000
      variance of the variance        1.83331E-08             1.83343E-08                     0.000061
      shifted center                  8.01623E-06             8.01623E-06                     0.000000
      figure of merit                 4.42620E+02             4.42619E+02                    -0.000001

 the estimated inverse power slope of the 200 largest  tallies starting at 3.62043E+01 is 6.4624
 the large score tail of the empirical history score probability density function appears to have no unsampled regions.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (8.933E+04)*( 7.039E-02)**2 = (8.933E+04)*(4.955E-03) = 4.426E+02

1tally       34        nps = 17866884608
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      13                                                                                   
                         4.00000E+03
 
 cell  13                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 6.75201E-06 0.0001   1.08829E-11 0.0818   4.77240E-12 0.1034   4.03685E-12 0.1128   3.11824E-12 0.1193
 
         time:       2.0000E+07             total                                                                  
                 4.69638E-12 0.1143   6.75204E-06 0.0001


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       34

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00      yes         yes            constant    random      10.00
 passed?        yes          yes      yes          yes             yes      yes         yes               yes        yes         yes

 ===================================================================================================================================


 this tally meets the statistical criteria used to form confidence intervals: check the tally fluctuation chart to verify.
 the results in other bins associated with this tally may not meet these statistical criteria.

 ----- estimated confidence intervals:  -----

 estimated asymmetric confidence interval(1,2,3 sigma): 6.7513E-06 to 6.7528E-06; 6.7505E-06 to 6.7536E-06; 6.7497E-06 to 6.7544E-06
 estimated  symmetric confidence interval(1,2,3 sigma): 6.7513E-06 to 6.7528E-06; 6.7505E-06 to 6.7536E-06; 6.7497E-06 to 6.7544E-06

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       34 with nps = 17866884608  print table 160


 normed average tally per history  = 6.75204E-06          unnormed average tally per history  = 2.70082E-02
 estimated tally relative error    = 0.0001               estimated variance of the variance  = 0.0000
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =   117641281          efficiency for the nonzero tallies  = 0.0066
 history number of largest  tally  =  3065223239          largest  unnormalized history tally = 5.68433E+01
 (largest  tally)/(average tally)  = 2.10467E+03          (largest  tally)/(avg nonzero tally)= 1.38578E+01

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 6.75204E-06


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            6.75204E-06             6.75204E-06                     0.000000
      relative error                  1.16840E-04             1.16840E-04                     0.000000
      variance of the variance        2.21168E-08             2.21178E-08                     0.000045
      shifted center                  6.75204E-06             6.75204E-06                     0.000000
      figure of merit                 3.66256E+02             3.66256E+02                    -0.000001

 the estimated slope of the 200 largest  tallies starting at  3.43437E+01 appears to be decreasing at least exponentially.
 the large score tail of the empirical history score probability density function appears to have no unsampled regions.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (8.933E+04)*( 6.403E-02)**2 = (8.933E+04)*(4.100E-03) = 3.663E+02

1tally       44        nps = 17866884608
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      14                                                                                   
                         4.00000E+03
 
 cell  14                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 7.63067E-06 0.0001   7.22425E-12 0.0991   1.96551E-12 0.1426   1.82570E-12 0.1609   2.97727E-12 0.1382
 
         time:       2.0000E+07             total                                                                  
                 1.79406E-12 0.1540   7.63069E-06 0.0001


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

 estimated asymmetric confidence interval(1,2,3 sigma): 7.6299E-06 to 7.6315E-06; 7.6290E-06 to 7.6324E-06; 7.6282E-06 to 7.6332E-06
 estimated  symmetric confidence interval(1,2,3 sigma): 7.6299E-06 to 7.6315E-06; 7.6290E-06 to 7.6324E-06; 7.6282E-06 to 7.6332E-06

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       44 with nps = 17866884608  print table 160


 normed average tally per history  = 7.63069E-06          unnormed average tally per history  = 3.05227E-02
 estimated tally relative error    = 0.0001               estimated variance of the variance  = 0.0000
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =   130121403          efficiency for the nonzero tallies  = 0.0073
 history number of largest  tally  =  2390356528          largest  unnormalized history tally = 5.74273E+01
 (largest  tally)/(average tally)  = 1.88146E+03          (largest  tally)/(avg nonzero tally)= 1.37023E+01

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 7.63069E-06


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            7.63069E-06             7.63069E-06                     0.000000
      relative error                  1.09675E-04             1.09675E-04                     0.000000
      variance of the variance        1.89023E-08             1.89031E-08                     0.000043
      shifted center                  7.63069E-06             7.63069E-06                     0.000000
      figure of merit                 4.15674E+02             4.15674E+02                    -0.000001

 the estimated slope of the 198 largest  tallies starting at  3.42167E+01 appears to be decreasing at least exponentially.
 the large score tail of the empirical history score probability density function appears to have no unsampled regions.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (8.933E+04)*( 6.821E-02)**2 = (8.933E+04)*(4.653E-03) = 4.157E+02

1status of the statistical checks used to form confidence intervals for the mean for each tally bin


 tally   result of statistical checks for the tfc bin (the first check not passed is listed) and error magnitude check for all bins

        4   passed the 10 statistical checks for the tally fluctuation chart bin result               
         passed all bin error check:     7 tally bins all have relative errors less than 0.10 with no zero bins

       14   passed the 10 statistical checks for the tally fluctuation chart bin result               
         missed all bin error check:     7 tally bins had     0 bins with zeros and     4 bins with relative errors exceeding 0.10

       24   passed the 10 statistical checks for the tally fluctuation chart bin result               
         passed all bin error check:     7 tally bins all have relative errors less than 0.10 with no zero bins

       34   passed the 10 statistical checks for the tally fluctuation chart bin result               
         missed all bin error check:     7 tally bins had     0 bins with zeros and     4 bins with relative errors exceeding 0.10

       44   passed the 10 statistical checks for the tally fluctuation chart bin result               
         missed all bin error check:     7 tally bins had     0 bins with zeros and     4 bins with relative errors exceeding 0.10


 the 10 statistical checks are only for the tally fluctuation chart bin and do not apply to other tally bins.

 warning.       3 of the     5 tallies had bins with relative errors greater than recommended.
1tally fluctuation charts                              

                            tally        4                          tally       14                          tally       24
          nps      mean     error   vov  slope    fom      mean     error   vov  slope    fom      mean     error   vov  slope    fom
   1048576000   5.5580E-06 0.0005 0.0000  8.5     306   6.7547E-06 0.0005 0.0000 10.0     374   8.0182E-06 0.0004 0.0000  6.3     443
   2097152000   5.5608E-06 0.0004 0.0000 10.0     306   6.7521E-06 0.0003 0.0000 10.0     374   8.0172E-06 0.0003 0.0000  5.1     443
   3145728000   5.5618E-06 0.0003 0.0000  6.3     306   6.7514E-06 0.0003 0.0000 10.0     374   8.0196E-06 0.0003 0.0000  5.7     443
   4194304000   5.5626E-06 0.0003 0.0000  7.7     306   6.7495E-06 0.0002 0.0000 10.0     374   8.0182E-06 0.0002 0.0000  7.1     443
   5242880000   5.5631E-06 0.0002 0.0000  5.0     306   6.7499E-06 0.0002 0.0000 10.0     374   8.0177E-06 0.0002 0.0000  7.5     443
   6291456000   5.5630E-06 0.0002 0.0000  4.6     306   6.7516E-06 0.0002 0.0000 10.0     374   8.0170E-06 0.0002 0.0000  9.2     443
   7340032000   5.5627E-06 0.0002 0.0000  4.4     306   6.7515E-06 0.0002 0.0000 10.0     374   8.0167E-06 0.0002 0.0000  8.9     443
   8388608000   5.5623E-06 0.0002 0.0000  4.6     306   6.7519E-06 0.0002 0.0000 10.0     374   8.0167E-06 0.0002 0.0000  7.5     443
   9437184000   5.5619E-06 0.0002 0.0000  5.4     306   6.7524E-06 0.0002 0.0000 10.0     374   8.0170E-06 0.0001 0.0000  6.1     443
  10485760000   5.5619E-06 0.0002 0.0000  5.5     306   6.7516E-06 0.0002 0.0000 10.0     374   8.0162E-06 0.0001 0.0000  5.7     443
  11534336000   5.5618E-06 0.0002 0.0000  5.1     306   6.7518E-06 0.0001 0.0000 10.0     374   8.0161E-06 0.0001 0.0000  6.7     443
  12582912000   5.5623E-06 0.0002 0.0000  5.3     306   6.7525E-06 0.0001 0.0000 10.0     374   8.0158E-06 0.0001 0.0000  9.0     443
  13631488000   5.5625E-06 0.0001 0.0000  4.7     306   6.7522E-06 0.0001 0.0000  8.3     374   8.0157E-06 0.0001 0.0000  8.1     443
  14680064000   5.5625E-06 0.0001 0.0000  4.7     306   6.7523E-06 0.0001 0.0000 10.0     374   8.0158E-06 0.0001 0.0000  7.4     443
  15728640000   5.5629E-06 0.0001 0.0000  4.6     306   6.7522E-06 0.0001 0.0000 10.0     374   8.0162E-06 0.0001 0.0000  8.6     443
  16777216000   5.5632E-06 0.0001 0.0000  5.2     306   6.7522E-06 0.0001 0.0000 10.0     374   8.0164E-06 0.0001 0.0000  7.7     443
  17825792000   5.5632E-06 0.0001 0.0000  5.4     306   6.7523E-06 0.0001 0.0000 10.0     374   8.0162E-06 0.0001 0.0000  6.5     443
  17866884608   5.5632E-06 0.0001 0.0000  5.4     306   6.7523E-06 0.0001 0.0000 10.0     374   8.0162E-06 0.0001 0.0000  6.5     443
 

                            tally       34                          tally       44
          nps      mean     error   vov  slope    fom      mean     error   vov  slope    fom
   1048576000   6.7504E-06 0.0005 0.0000 10.0     366   7.6280E-06 0.0005 0.0000 10.0     416
   2097152000   6.7534E-06 0.0003 0.0000 10.0     366   7.6310E-06 0.0003 0.0000 10.0     416
   3145728000   6.7544E-06 0.0003 0.0000  4.7     366   7.6304E-06 0.0003 0.0000  7.1     416
   4194304000   6.7521E-06 0.0002 0.0000  5.8     366   7.6306E-06 0.0002 0.0000  6.9     416
   5242880000   6.7521E-06 0.0002 0.0000  4.9     366   7.6305E-06 0.0002 0.0000  5.3     416
   6291456000   6.7526E-06 0.0002 0.0000  5.6     366   7.6304E-06 0.0002 0.0000  5.8     416
   7340032000   6.7524E-06 0.0002 0.0000  7.3     366   7.6312E-06 0.0002 0.0000  6.0     416
   8388608000   6.7524E-06 0.0002 0.0000  7.1     366   7.6306E-06 0.0002 0.0000  7.5     416
   9437184000   6.7519E-06 0.0002 0.0000  8.5     366   7.6303E-06 0.0002 0.0000  9.8     416
  10485760000   6.7520E-06 0.0002 0.0000  8.3     366   7.6303E-06 0.0001 0.0000  9.4     416
  11534336000   6.7521E-06 0.0001 0.0000  6.1     366   7.6307E-06 0.0001 0.0000  8.6     416
  12582912000   6.7521E-06 0.0001 0.0000  8.3     366   7.6308E-06 0.0001 0.0000 10.0     416
  13631488000   6.7518E-06 0.0001 0.0000  6.2     366   7.6306E-06 0.0001 0.0000 10.0     416
  14680064000   6.7518E-06 0.0001 0.0000  6.6     366   7.6306E-06 0.0001 0.0000 10.0     416
  15728640000   6.7519E-06 0.0001 0.0000  8.1     366   7.6304E-06 0.0001 0.0000 10.0     416
  16777216000   6.7520E-06 0.0001 0.0000  9.4     366   7.6306E-06 0.0001 0.0000 10.0     416
  17825792000   6.7521E-06 0.0001 0.0000 10.0     366   7.6307E-06 0.0001 0.0000 10.0     416
  17866884608   6.7520E-06 0.0001 0.0000 10.0     366   7.6307E-06 0.0001 0.0000 10.0     416

 ***********************************************************************************************************************

 dump no.  168 on file inpr     nps = 17866884608     coll =    35356060459     ctm =   200000.38   nrn =     
 537962356824

         8 warning messages so far.


 run terminated when it had used*****  minutes of computer time.

 computer time =******** minutes

 mcnp     version 6     06/19/14                     08/06/17 01:33:50                     probid =  08/05/17 17:13:59 
