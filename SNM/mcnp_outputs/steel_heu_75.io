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
  
1mcnp     version 6     ld=06/19/14                     08/06/17 09:55:45 
 *************************************************************************                 probid =  08/06/17 09:55:45 
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
       153-       sb1    4.95030e-01 5.04970e-01                                                  
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
       220-       wwp:n 5.0 j 100 j -1 0 9.630612371e-03                                          
 
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
        4        4        4  4.79746E-02 1.87248E+01 5.23599E+02 9.80426E+03           1  1.0000E+00                                   
        5       10        1  4.98947E-05 1.20500E-03 4.00000E+03 4.82000E+00           0  1.0000E+00                                   
        6       11        1  4.98947E-05 1.20500E-03 4.00000E+03 4.82000E+00           0  1.0000E+00                                   
        7       12        1  4.98947E-05 1.20500E-03 4.00000E+03 4.82000E+00           0  1.0000E+00                                   
        8       13        1  4.98947E-05 1.20500E-03 4.00000E+03 4.82000E+00           0  1.0000E+00                                   
        9       14        1  4.98947E-05 1.20500E-03 4.00000E+03 4.82000E+00           0  1.0000E+00                                   
       10       99        0  0.00000E+00 0.00000E+00 0.00000E+00 0.00000E+00           0  0.0000E+00                                   

 total                                               2.37552E+06 1.27348E+06

    minimum source weight = 9.9016E-01    maximum source weight = 1.0100E+00

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

         5 warning messages so far.
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

         6 warning messages so far.

 ***********************************************************************************************************************

 dump no.    2 on file inpr     nps =    15134210     coll =     1067202651     ctm =     1200.31   nrn =       
 9016722606

 ***********************************************************************************************************************

 dump no.    3 on file inpr     nps =    30340870     coll =     2139225777     ctm =     2400.64   nrn =      
 18074624820

 ***********************************************************************************************************************

 dump no.    4 on file inpr     nps =    45620214     coll =     3213987737     ctm =     3600.87   nrn =      
 27156231612

 ***********************************************************************************************************************

 dump no.    5 on file inpr     nps =    60840059     coll =     4289642109     ctm =     4801.14   nrn =      
 36242954500

 ***********************************************************************************************************************

 dump no.    6 on file inpr     nps =    76073265     coll =     5365240537     ctm =     6001.45   nrn =      
 45329292918

 ***********************************************************************************************************************

 dump no.    7 on file inpr     nps =    91281151     coll =     6440069874     ctm =     7201.85   nrn =      
 54408972301

 ***********************************************************************************************************************

 dump no.    8 on file inpr     nps =   106496211     coll =     7515582503     ctm =     8402.09   nrn =      
 63494618295

 ***********************************************************************************************************************

 dump no.    9 on file inpr     nps =   121729281     coll =     8591201561     ctm =     9602.44   nrn =      
 72581622061

 ***********************************************************************************************************************

 dump no.   10 on file inpr     nps =   136997091     coll =     9666502007     ctm =    10802.72   nrn =      
 81666412861

 ***********************************************************************************************************************

 dump no.   11 on file inpr     nps =   152234939     coll =    10741733003     ctm =    12003.00   nrn =      
 90751235237

 ***********************************************************************************************************************

 dump no.   12 on file inpr     nps =   167492199     coll =    11816781228     ctm =    13203.33   nrn =      
 99834242694

 ***********************************************************************************************************************

 dump no.   13 on file inpr     nps =   182750514     coll =    12892059294     ctm =    14403.73   nrn =     
 108919463962

 ***********************************************************************************************************************

 dump no.   14 on file inpr     nps =   197966418     coll =    13967432566     ctm =    15604.06   nrn =     
 118003575442

 ***********************************************************************************************************************

 dump no.   15 on file inpr     nps =   213204477     coll =    15042588628     ctm =    16804.39   nrn =     
 127086146108

 ***********************************************************************************************************************

 dump no.   16 on file inpr     nps =   228431714     coll =    16118302581     ctm =    18004.72   nrn =     
 136172779626

 ***********************************************************************************************************************

 dump no.   17 on file inpr     nps =   243678635     coll =    17192241440     ctm =    19204.99   nrn =     
 145245455793

 ***********************************************************************************************************************

 dump no.   18 on file inpr     nps =   258930831     coll =    18267326387     ctm =    20405.34   nrn =     
 154328730271

 ***********************************************************************************************************************

 dump no.   19 on file inpr     nps =   274196320     coll =    19342325909     ctm =    21605.72   nrn =     
 163411253958

 ***********************************************************************************************************************

 dump no.   20 on file inpr     nps =   289451681     coll =    20417691722     ctm =    22806.03   nrn =     
 172496421963

 ***********************************************************************************************************************

 dump no.   21 on file inpr     nps =   304664631     coll =    21493490886     ctm =    24006.51   nrn =     
 181584291729

 ***********************************************************************************************************************

 dump no.   22 on file inpr     nps =   319898259     coll =    22568947595     ctm =    25206.85   nrn =     
 190669851814

 ***********************************************************************************************************************

 dump no.   23 on file inpr     nps =   335124291     coll =    23644878350     ctm =    26407.18   nrn =     
 199758499886

 ***********************************************************************************************************************

 dump no.   24 on file inpr     nps =   350395205     coll =    24720014602     ctm =    27607.47   nrn =     
 208841813676

 ***********************************************************************************************************************

 dump no.   25 on file inpr     nps =   365629949     coll =    25795287233     ctm =    28807.77   nrn =     
 217926090635

 ***********************************************************************************************************************

 dump no.   26 on file inpr     nps =   380906560     coll =    26870059976     ctm =    30008.09   nrn =     
 227006870533

 ***********************************************************************************************************************

 dump no.   27 on file inpr     nps =   396142359     coll =    27945661644     ctm =    31208.36   nrn =     
 236093571804

 ***********************************************************************************************************************

 dump no.   28 on file inpr     nps =   411407365     coll =    29020388824     ctm =    32408.75   nrn =     
 245173922458

 ***********************************************************************************************************************

 dump no.   29 on file inpr     nps =   426653714     coll =    30095097525     ctm =    33609.15   nrn =     
 254254137016

 ***********************************************************************************************************************

 dump no.   30 on file inpr     nps =   441899097     coll =    31170255319     ctm =    34809.52   nrn =     
 263337623021

 ***********************************************************************************************************************

 dump no.   31 on file inpr     nps =   457118527     coll =    32246325631     ctm =    36009.93   nrn =     
 272427260262

 ***********************************************************************************************************************

 dump no.   32 on file inpr     nps =   472392728     coll =    33321119345     ctm =    37210.26   nrn =     
 281508597495

 ***********************************************************************************************************************

 dump no.   33 on file inpr     nps =   487633891     coll =    34396583238     ctm =    38410.56   nrn =     
 290593871319

 ***********************************************************************************************************************

 dump no.   34 on file inpr     nps =   502848379     coll =    35469102176     ctm =    39610.90   nrn =     
 299654724506

 ***********************************************************************************************************************

 dump no.   35 on file inpr     nps =   518083634     coll =    36544596215     ctm =    40811.24   nrn =     
 308741187316

 ***********************************************************************************************************************

 dump no.   36 on file inpr     nps =   533332093     coll =    37620017820     ctm =    42011.64   nrn =     
 317826210525

 ***********************************************************************************************************************

 dump no.   37 on file inpr     nps =   548588448     coll =    38694218288     ctm =    43211.93   nrn =     
 326903255983

 ***********************************************************************************************************************

 dump no.   38 on file inpr     nps =   563839017     coll =    39769465158     ctm =    44412.27   nrn =     
 335987457900

 ***********************************************************************************************************************

 dump no.   39 on file inpr     nps =   579081235     coll =    40844923126     ctm =    45612.62   nrn =     
 345072828797

 ***********************************************************************************************************************

 dump no.   40 on file inpr     nps =   594344675     coll =    41920089139     ctm =    46813.01   nrn =     
 354157191595

 ***********************************************************************************************************************

 dump no.   41 on file inpr     nps =   609596388     coll =    42995266162     ctm =    48013.35   nrn =     
 363240686810

 ***********************************************************************************************************************

 dump no.   42 on file inpr     nps =   624857929     coll =    44069802799     ctm =    49213.69   nrn =     
 372320194216

 ***********************************************************************************************************************

 dump no.   43 on file inpr     nps =   640100569     coll =    45144601876     ctm =    50414.04   nrn =     
 381400831739

 ***********************************************************************************************************************

 dump no.   44 on file inpr     nps =   655341521     coll =    46220078346     ctm =    51614.34   nrn =     
 390486044098

 ***********************************************************************************************************************

 dump no.   45 on file inpr     nps =   670580485     coll =    47295448333     ctm =    52814.74   nrn =     
 399571021611

 ***********************************************************************************************************************

 dump no.   46 on file inpr     nps =   685831776     coll =    48370584389     ctm =    54015.13   nrn =     
 408654115062

 ***********************************************************************************************************************

 dump no.   47 on file inpr     nps =   701089186     coll =    49444781772     ctm =    55215.42   nrn =     
 417730165902

 ***********************************************************************************************************************

 dump no.   48 on file inpr     nps =   716340266     coll =    50520117236     ctm =    56415.72   nrn =     
 426815009755

 ***********************************************************************************************************************

 dump no.   49 on file inpr     nps =   731595599     coll =    51595419385     ctm =    57616.05   nrn =     
 435899589792

 ***********************************************************************************************************************

 dump no.   50 on file inpr     nps =   746828322     coll =    52669423269     ctm =    58816.37   nrn =     
 444973430633

 ***********************************************************************************************************************

 dump no.   51 on file inpr     nps =   762075815     coll =    53745082536     ctm =    60016.75   nrn =     
 454060451703

 ***********************************************************************************************************************

 dump no.   52 on file inpr     nps =   777347995     coll =    54820118222     ctm =    61217.15   nrn =     
 463143743141

 ***********************************************************************************************************************

 dump no.   53 on file inpr     nps =   792598686     coll =    55895651558     ctm =    62417.63   nrn =     
 472230664905

 ***********************************************************************************************************************

 dump no.   54 on file inpr     nps =   807844702     coll =    56971196926     ctm =    63617.97   nrn =     
 481317060827

 ***********************************************************************************************************************

 dump no.   55 on file inpr     nps =   823063288     coll =    58046892796     ctm =    64818.25   nrn =     
 490404563030

 ***********************************************************************************************************************

 dump no.   56 on file inpr     nps =   838299387     coll =    59121961716     ctm =    66018.53   nrn =     
 499486252200

 ***********************************************************************************************************************

 dump no.   57 on file inpr     nps =   853520538     coll =    60195730389     ctm =    67218.91   nrn =     
 508558221789

 ***********************************************************************************************************************

 dump no.   58 on file inpr     nps =   868775416     coll =    61270983638     ctm =    68419.19   nrn =     
 517642224462

 ***********************************************************************************************************************

 dump no.   59 on file inpr     nps =   884047385     coll =    62345768582     ctm =    69619.58   nrn =     
 526723770301

 ***********************************************************************************************************************

 dump no.   60 on file inpr     nps =   899302474     coll =    63421048941     ctm =    70819.93   nrn =     
 535808517068

 ***********************************************************************************************************************

 dump no.   61 on file inpr     nps =   914503547     coll =    64496915718     ctm =    72020.24   nrn =     
 544896825890

 ***********************************************************************************************************************

 dump no.   62 on file inpr     nps =   929762045     coll =    65571991275     ctm =    73220.56   nrn =     
 553980144794

 ***********************************************************************************************************************

 dump no.   63 on file inpr     nps =   944986328     coll =    66647476339     ctm =    74420.81   nrn =     
 563066123162

 ***********************************************************************************************************************

 dump no.   64 on file inpr     nps =   960229601     coll =    67722958216     ctm =    75621.07   nrn =     
 572151913401

 ***********************************************************************************************************************

 dump no.   65 on file inpr     nps =   975455572     coll =    68798589158     ctm =    76821.30   nrn =     
 581238612724

 ***********************************************************************************************************************

 dump no.   66 on file inpr     nps =   990708795     coll =    69873770654     ctm =    78021.61   nrn =     
 590322275690

 ***********************************************************************************************************************

 dump no.   67 on file inpr     nps =  1005984562     coll =    70948899549     ctm =    79221.95   nrn =     
 599406396684

 ***********************************************************************************************************************

 dump no.   68 on file inpr     nps =  1021245559     coll =    72024139679     ctm =    80422.25   nrn =     
 608490682036

 ***********************************************************************************************************************

 dump no.   69 on file inpr     nps =  1036470264     coll =    73100073918     ctm =    81622.71   nrn =     
 617579315677

 ***********************************************************************************************************************

 dump no.   70 on file inpr     nps =  1051721377     coll =    74175013617     ctm =    82823.02   nrn =     
 626660592041

 ***********************************************************************************************************************

 dump no.   71 on file inpr     nps =  1066973301     coll =    75249942339     ctm =    84023.35   nrn =     
 635742245062

 ***********************************************************************************************************************

 dump no.   72 on file inpr     nps =  1082223959     coll =    76325102798     ctm =    85223.82   nrn =     
 644826022848

 ***********************************************************************************************************************

 dump no.   73 on file inpr     nps =  1097462379     coll =    77400354143     ctm =    86424.15   nrn =     
 653910341716

 ***********************************************************************************************************************

 dump no.   74 on file inpr     nps =  1112683286     coll =    78475568262     ctm =    87624.40   nrn =     
 662993868198

 ***********************************************************************************************************************

 dump no.   75 on file inpr     nps =  1127921950     coll =    79551419353     ctm =    88824.83   nrn =     
 672082880603

 ***********************************************************************************************************************

 dump no.   76 on file inpr     nps =  1143165645     coll =    80627308327     ctm =    90025.20   nrn =     
 681171476513

 ***********************************************************************************************************************

 dump no.   77 on file inpr     nps =  1158378323     coll =    81703219474     ctm =    91225.49   nrn =     
 690260391731

 ***********************************************************************************************************************

 dump no.   78 on file inpr     nps =  1173628559     coll =    82778732705     ctm =    92425.82   nrn =     
 699346761781

 ***********************************************************************************************************************

 dump no.   79 on file inpr     nps =  1188889167     coll =    83854023426     ctm =    93626.08   nrn =     
 708431876459

 ***********************************************************************************************************************

 dump no.   80 on file inpr     nps =  1204089818     coll =    84929237870     ctm =    94826.45   nrn =     
 717514477632

 ***********************************************************************************************************************

 dump no.   81 on file inpr     nps =  1219348705     coll =    86004536793     ctm =    96026.81   nrn =     
 726600128006

 ***********************************************************************************************************************

 dump no.   82 on file inpr     nps =  1234590079     coll =    87080528631     ctm =    97227.21   nrn =     
 735690440107

 ***********************************************************************************************************************

 dump no.   83 on file inpr     nps =  1249876851     coll =    88155806126     ctm =    98427.56   nrn =     
 744775449032

 ***********************************************************************************************************************

 dump no.   84 on file inpr     nps =  1265138481     coll =    89230779089     ctm =    99627.95   nrn =     
 753857885285

 ***********************************************************************************************************************

 dump no.   85 on file inpr     nps =  1280386396     coll =    90305930765     ctm =   100828.35   nrn =     
 762941624580

 ***********************************************************************************************************************

 dump no.   86 on file inpr     nps =  1295641274     coll =    91380911901     ctm =   102028.68   nrn =     
 772024334465

 ***********************************************************************************************************************

 dump no.   87 on file inpr     nps =  1310869177     coll =    92456677022     ctm =   103228.98   nrn =     
 781111743220

 ***********************************************************************************************************************

 dump no.   88 on file inpr     nps =  1326131862     coll =    93532421749     ctm =   104429.44   nrn =     
 790199568749

 ***********************************************************************************************************************

 dump no.   89 on file inpr     nps =  1341383153     coll =    94607807438     ctm =   105629.90   nrn =     
 799285139774

 ***********************************************************************************************************************

 dump no.   90 on file inpr     nps =  1356612922     coll =    95683272167     ctm =   106830.27   nrn =     
 808370870836

 ***********************************************************************************************************************

 dump no.   91 on file inpr     nps =  1371862314     coll =    96758704031     ctm =   108030.65   nrn =     
 817456458325

 ***********************************************************************************************************************

 dump no.   92 on file inpr     nps =  1387129641     coll =    97833511174     ctm =   109230.93   nrn =     
 826538341023

 ***********************************************************************************************************************

 dump no.   93 on file inpr     nps =  1402356878     coll =    98909076930     ctm =   110431.27   nrn =     
 835625203939

 ***********************************************************************************************************************

 dump no.   94 on file inpr     nps =  1417585381     coll =    99982798513     ctm =   111631.56   nrn =     
 844696897357

 ***********************************************************************************************************************

 dump no.   95 on file inpr     nps =  1432824223     coll =   101058226806     ctm =   112831.84   nrn =     
 853782208574

 ***********************************************************************************************************************

 dump no.   96 on file inpr     nps =  1448106386     coll =   102133367689     ctm =   114032.22   nrn =     
 862865864573

 ***********************************************************************************************************************

 dump no.   97 on file inpr     nps =  1463382575     coll =   103207975681     ctm =   115232.63   nrn =     
 871945179463

 ***********************************************************************************************************************

 dump no.   98 on file inpr     nps =  1478598418     coll =   104283596652     ctm =   116432.92   nrn =     
 881031541136

 ***********************************************************************************************************************

 dump no.   99 on file inpr     nps =  1493865745     coll =   105358205842     ctm =   117633.24   nrn =     
 890111108962

 ***********************************************************************************************************************

 dump no.  100 on file inpr     nps =  1509080955     coll =   106433562928     ctm =   118833.64   nrn =     
 899195946481

 ***********************************************************************************************************************

 dump no.  101 on file inpr     nps =  1524339420     coll =   107508931745     ctm =   120034.00   nrn =     
 908281247736

 ***********************************************************************************************************************

 dump no.  102 on file inpr     nps =  1539583326     coll =   108584513385     ctm =   121234.37   nrn =     
 917367731141

 ***********************************************************************************************************************

 dump no.  103 on file inpr     nps =  1554813306     coll =   109659996003     ctm =   122434.65   nrn =     
 926453178799

 ***********************************************************************************************************************

 dump no.  104 on file inpr     nps =  1570082110     coll =   110734940918     ctm =   123635.01   nrn =     
 935535360109

 ***********************************************************************************************************************

 dump no.  105 on file inpr     nps =  1585343595     coll =   111810267785     ctm =   124835.42   nrn =     
 944620137049

 ***********************************************************************************************************************

 dump no.  106 on file inpr     nps =  1600594886     coll =   112885404907     ctm =   126035.78   nrn =     
 953704304333

 ***********************************************************************************************************************

 dump no.  107 on file inpr     nps =  1615843856     coll =   113960544344     ctm =   127236.05   nrn =     
 962787518568

 ***********************************************************************************************************************

 dump no.  108 on file inpr     nps =  1631086074     coll =   115036035136     ctm =   128436.36   nrn =     
 971873307856

 ***********************************************************************************************************************

 dump no.  109 on file inpr     nps =  1646305082     coll =   116111592495     ctm =   129636.74   nrn =     
 980959520342

 ***********************************************************************************************************************

 dump no.  110 on file inpr     nps =  1661543080     coll =   117187192501     ctm =   130837.02   nrn =     
 990046314212

 ***********************************************************************************************************************

 dump no.  111 on file inpr     nps =  1676798802     coll =   118262940423     ctm =   132037.47   nrn =     
 999134401496

 ***********************************************************************************************************************

 dump no.  112 on file inpr     nps =  1692084064     coll =   119337884694     ctm =   133237.85   nrn =    
 1008217561335

 ***********************************************************************************************************************

 dump no.  113 on file inpr     nps =  1707314954     coll =   120412897661     ctm =   134438.16   nrn =    
 1017300218470

 ***********************************************************************************************************************

 dump no.  114 on file inpr     nps =  1722530797     coll =   121488444282     ctm =   135638.51   nrn =    
 1026386088733

 ***********************************************************************************************************************

 dump no.  115 on file inpr     nps =  1737799812     coll =   122563503920     ctm =   136838.83   nrn =    
 1035469783736

 ***********************************************************************************************************************

 dump no.  116 on file inpr     nps =  1753014178     coll =   123639554219     ctm =   138039.18   nrn =    
 1044559770270

 ***********************************************************************************************************************

 dump no.  117 on file inpr     nps =  1768232131     coll =   124715565592     ctm =   139239.70   nrn =    
 1053649308951

 ***********************************************************************************************************************

 dump no.  118 on file inpr     nps =  1783487431     coll =   125791007994     ctm =   140440.09   nrn =    
 1062735535398

 ***********************************************************************************************************************

 dump no.  119 on file inpr     nps =  1798750538     coll =   126866274841     ctm =   141640.44   nrn =    
 1071820167989

 ***********************************************************************************************************************

 dump no.  120 on file inpr     nps =  1813991912     coll =   127941467718     ctm =   142840.68   nrn =    
 1080903261878

 ***********************************************************************************************************************

 dump no.  121 on file inpr     nps =  1829229488     coll =   129017127405     ctm =   144041.04   nrn =    
 1089990365895

 ***********************************************************************************************************************

 dump no.  122 on file inpr     nps =  1844473882     coll =   130092263301     ctm =   145241.34   nrn =    
 1099074215865

 ***********************************************************************************************************************

 dump no.  123 on file inpr     nps =  1859734879     coll =   131167628737     ctm =   146441.60   nrn =    
 1108159620767

 ***********************************************************************************************************************

 dump no.  124 on file inpr     nps =  1874969079     coll =   132243374905     ctm =   147641.87   nrn =    
 1117247486638

 ***********************************************************************************************************************

 dump no.  125 on file inpr     nps =  1890223957     coll =   133318507084     ctm =   148842.10   nrn =    
 1126331211958

 ***********************************************************************************************************************

 dump no.  126 on file inpr     nps =  1905440644     coll =   134394146744     ctm =   150042.55   nrn =    
 1135418015689

 ***********************************************************************************************************************

 dump no.  127 on file inpr     nps =  1920679064     coll =   135468639423     ctm =   151242.84   nrn =    
 1144496954858

 ***********************************************************************************************************************

 dump no.  128 on file inpr     nps =  1935939217     coll =   136543843677     ctm =   152443.24   nrn =    
 1153580674045

 ***********************************************************************************************************************

 dump no.  129 on file inpr     nps =  1951203168     coll =   137619086167     ctm =   153643.61   nrn =    
 1162664957163

 ***********************************************************************************************************************

 dump no.  130 on file inpr     nps =  1966428150     coll =   138694804114     ctm =   154843.97   nrn =    
 1171752306111

 ***********************************************************************************************************************

 dump no.  131 on file inpr     nps =  1981659396     coll =   139769983723     ctm =   156044.36   nrn =    
 1180835081404

 ***********************************************************************************************************************

 dump no.  132 on file inpr     nps =  1996886633     coll =   140845334412     ctm =   157244.75   nrn =    
 1189920745871

 ***********************************************************************************************************************

 dump no.  133 on file inpr     nps =  2012151006     coll =   141920506578     ctm =   158445.13   nrn =    
 1199004802552

 ***********************************************************************************************************************

 dump no.  134 on file inpr     nps =  2027378876     coll =   142996038605     ctm =   159645.45   nrn =    
 1208090340052

 ***********************************************************************************************************************

 dump no.  135 on file inpr     nps =  2042622149     coll =   144071388193     ctm =   160845.83   nrn =    
 1217175745853

 ***********************************************************************************************************************

 dump no.  136 on file inpr     nps =  2057876394     coll =   145146713256     ctm =   162046.13   nrn =    
 1226259997959

 ***********************************************************************************************************************

 dump no.  137 on file inpr     nps =  2073121777     coll =   146222175507     ctm =   163246.56   nrn =    
 1235346750809

 ***********************************************************************************************************************

 dump no.  138 on file inpr     nps =  2088366316     coll =   147297587957     ctm =   164446.91   nrn =    
 1244431843403

 ***********************************************************************************************************************

 dump no.  139 on file inpr     nps =  2103607756     coll =   148373213395     ctm =   165647.22   nrn =    
 1253518468420

 ***********************************************************************************************************************

 dump no.  140 on file inpr     nps =  2118833305     coll =   149448942069     ctm =   166847.59   nrn =    
 1262605339947

 ***********************************************************************************************************************

 dump no.  141 on file inpr     nps =  2134060542     coll =   150524145439     ctm =   168047.88   nrn =    
 1271687823992

 ***********************************************************************************************************************

 dump no.  142 on file inpr     nps =  2149267523     coll =   151600014029     ctm =   169248.23   nrn =    
 1280775489346

 ***********************************************************************************************************************

 dump no.  143 on file inpr     nps =  2164511007     coll =   152675090877     ctm =   170448.57   nrn =    
 1289858414779

 ***********************************************************************************************************************

 dump no.  144 on file inpr     nps =  2179754280     coll =   153748911934     ctm =   171648.83   nrn =    
 1298931710502

 ***********************************************************************************************************************

 dump no.  145 on file inpr     nps =  2194976242     coll =   154824471253     ctm =   172849.10   nrn =    
 1308018312482

 ***********************************************************************************************************************

 dump no.  146 on file inpr     nps =  2210206855     coll =   155900369266     ctm =   174049.54   nrn =    
 1317107339822

 ***********************************************************************************************************************

 dump no.  147 on file inpr     nps =  2225474182     coll =   156974680467     ctm =   175249.92   nrn =    
 1326185341670

 ***********************************************************************************************************************

 dump no.  148 on file inpr     nps =  2240723640     coll =   158050021025     ctm =   176450.34   nrn =    
 1335270342956

 ***********************************************************************************************************************

 dump no.  149 on file inpr     nps =  2255950455     coll =   159125474349     ctm =   177650.76   nrn =    
 1344355975841

 ***********************************************************************************************************************

 dump no.  150 on file inpr     nps =  2271202590     coll =   160200753468     ctm =   178851.13   nrn =    
 1353440714130

 ***********************************************************************************************************************

 dump no.  151 on file inpr     nps =  2286454725     coll =   161276112698     ctm =   180051.55   nrn =    
 1362526046795

 ***********************************************************************************************************************

 dump no.  152 on file inpr     nps =  2301716355     coll =   162351474972     ctm =   181251.90   nrn =    
 1371611131074

 ***********************************************************************************************************************

 dump no.  153 on file inpr     nps =  2316965325     coll =   163426938984     ctm =   182452.30   nrn =    
 1380697176383

 ***********************************************************************************************************************

 dump no.  154 on file inpr     nps =  2332193195     coll =   164502645176     ctm =   183652.61   nrn =    
 1389784346517

 ***********************************************************************************************************************

 dump no.  155 on file inpr     nps =  2347444064     coll =   165577453886     ctm =   184852.99   nrn =    
 1398865641032

 ***********************************************************************************************************************

 dump no.  156 on file inpr     nps =  2362687614     coll =   166652693929     ctm =   186053.37   nrn =    
 1407950068748

 ***********************************************************************************************************************

 dump no.  157 on file inpr     nps =  2377937428     coll =   167727867495     ctm =   187253.76   nrn =    
 1417033795734

 ***********************************************************************************************************************

 dump no.  158 on file inpr     nps =  2393189563     coll =   168803148963     ctm =   188454.14   nrn =    
 1426118522783

 ***********************************************************************************************************************

 dump no.  159 on file inpr     nps =  2408470394     coll =   169878430007     ctm =   189654.55   nrn =    
 1435203427235

 ***********************************************************************************************************************

 dump no.  160 on file inpr     nps =  2423733923     coll =   170953774468     ctm =   190854.89   nrn =    
 1444288630858

 ***********************************************************************************************************************

 dump no.  161 on file inpr     nps =  2438936262     coll =   172030108400     ctm =   192055.21   nrn =    
 1453380138619

 ***********************************************************************************************************************

 dump no.  162 on file inpr     nps =  2454189241     coll =   173105617355     ctm =   193255.56   nrn =    
 1462466811491

 ***********************************************************************************************************************

 dump no.  163 on file inpr     nps =  2469440321     coll =   174181061237     ctm =   194455.93   nrn =    
 1471553173137

 ***********************************************************************************************************************

 dump no.  164 on file inpr     nps =  2484680007     coll =   175256751834     ctm =   195656.25   nrn =    
 1480640623631

 ***********************************************************************************************************************

 dump no.  165 on file inpr     nps =  2499957317     coll =   176332000424     ctm =   196856.59   nrn =    
 1489725615024

 ***********************************************************************************************************************

 dump no.  166 on file inpr     nps =  2515213461     coll =   177407629334     ctm =   198056.95   nrn =    
 1498813118304

 ***********************************************************************************************************************

 dump no.  167 on file inpr     nps =  2530458844     coll =   178483279441     ctm =   199257.26   nrn =    
 1507900342492
1problem summary                                                                                                           

      run terminated when it had used*****  minutes of computer time.
+                                                                                                    08/06/17 18:15:37 
      c //-------------------------------------------------------------------------//      probid =  08/06/17 09:55:45 

 neutron creation    tracks      weight        energy            neutron loss        tracks      weight        energy
                                 (per source particle)                                           (per source particle)

 source          2539907635    1.0000E+00    1.4100E+01          escape          7387058177    1.0267E+00    9.1694E+00
 nucl. interaction        0    0.            0.                  energy cutoff            0    0.            0.        
 particle decay           0    0.            0.                  time cutoff        1291549    5.8718E-06    2.9822E-06
 weight window  11220189873    2.9591E-01    1.9497E-01          weight window   7010865173    2.9588E-01    1.9494E-01
 cell importance          0    0.            0.                  cell importance          0    0.            0.        
 weight cutoff            0    0.            0.                  weight cutoff            0    0.            0.        
 e or t importance        0    0.            0.                  e or t importance        0    0.            0.        
 dxtran                   0    0.            0.                  dxtran                   0    0.            0.        
 forced collisions        0    0.            0.                  forced collisions        0    0.            0.        
 exp. transform           0    0.            0.                  exp. transform           0    0.            0.        
 upscattering             0    0.            1.0494E-10          downscattering           0    0.            2.7620E+00
 photonuclear             0    0.            0.                  capture                 54    8.2581E-02    9.0183E-01
 (n,xn)          1017053124    2.1736E-01    2.5670E-01          loss to (n,xn)   508526141    1.0868E-01    1.5250E+00
 prompt fission   212837348    9.6647E-04    1.9781E-03          loss to fission   83625779    3.8089E-04    4.0663E-04
 delayed fission    1378893    6.2703E-06    3.1938E-06          nucl. interaction        0    0.            0.        
 prompt photofis          0    0.            0.                  particle decay           0    0.            0.        
 tabular boundary         0    0.            0.                  tabular boundary         0    0.            0.        
 tabular sampling         0    0.            0.                  elastic scatter          0    0.            0.        
     total      14991366873    1.5142E+00    1.4554E+01              total      14991366873    1.5142E+00    1.4554E+01

   number of neutrons banked             -1347286752        average time of (shakes)              cutoffs
   neutron tracks per source particle     5.9023E+00          escape            5.0000E+06          tco   2.0000E+07
   neutron collisions per source particle 7.0534E+01          capture           5.0032E+06          eco   0.0000E+00
   total neutron collisions              -2147483648          capture or escape 5.0003E+06          wc1  -5.0000E-01
   net multiplication              1.1093E+00 0.0000          any termination   4.5981E+06          wc2  -2.5000E-01

 computer time so far in this run200002.79 minutes            maximum number ever in bank        57
 computer time in mcrun          200000.30 minutes            bank overflows to backup file       0
 source particles per minute            1.2700E+04
 random numbers generated            1513523343611            most random numbers used was     3368594 in history   141422802
 
  warning.   random number stride   152917 exceeded    39364 times.
 
  warning.  random number period exceeded.  decrease stride.

 range of sampled source weights = 9.9016E-01 to 1.0100E+00

 number of histories processed by each thread
   119306330   127197478   127789764   127826430   127908363   127109393   127870674   126933239   127055706   127789720
   127841034   126753627   127763478   127849191   126988557   128131551   127763166   126555111   127329272   126145551
 
  warning.  some of the geometry is covered by a weight window mesh.
1neutron  activity in each cell                                                                         print table 126

                       tracks     population   collisions   collisions     number        flux        average      average
              cell    entering                               * weight     weighted     weighted   track weight   track mfp
                                                          (per history)    energy       energy     (relative)      (cm)

        1        1  8677388738   7799614699     40190148    4.5443E-03   3.1999E+00   9.9035E+00   4.4241E-01   1.1404E+04
        2        2  8672349508   7604826939  15870486865    1.3273E+00   1.0985E+00   6.3523E+00   2.6957E-01   4.2414E+00
        3        3  3723711763  11239891972 162690540325    4.8937E+00   1.4588E-01   2.0882E+00   8.1534E-02   7.9492E+00
        4        4    97905037    200154508    544140754    2.4584E-03   3.9261E-01   1.2004E+00   1.1167E-02   2.4862E+00
        5       10   177292709    225449242       453463    2.6576E-07   5.8987E-02   3.3966E-01   1.5248E-03   5.7433E+03
        6       11   223393760    265488824       543352    3.4173E-07   5.1868E-02   3.3684E-01   1.6379E-03   5.6132E+03
        7       12   532125750    634260107      1324132    8.1433E-07   4.1914E-02   2.9529E-01   1.5951E-03   5.4485E+03
        8       13   219144058    261420644       534292    3.4230E-07   5.1851E-02   3.3714E-01   1.6660E-03   5.6138E+03
        9       14   262522840    292243308       590716    4.1062E-07   5.5809E-02   3.5413E-01   1.8093E-03   5.6817E+03

           total   22585834163  28523350243 179148804047    6.2280E+00

1tally        4        nps =  2539907635
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      10                                                                                   
                         4.00000E+03
 
 cell  10                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 3.25394E-07 0.0002   1.69069E-11 0.0371   1.29409E-11 0.0320   1.15878E-11 0.0333   1.24533E-11 0.0337
 
         time:       2.0000E+07             total                                                                  
                 1.15729E-11 0.0337   3.25460E-07 0.0002


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally        4

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00       no           no            0.04       no          no            constant    random       2.25
 passed?        yes          yes       no           no             yes       no          no               yes        yes          no

 ===================================================================================================================================


 warning.  the tally in the tally fluctuation chart bin did not pass  5 of the 10 statistical checks.

1analysis of the results in the tally fluctuation chart bin (tfc) for tally        4 with nps =  2539907635  print table 160


 normed average tally per history  = 3.25460E-07          unnormed average tally per history  = 1.30184E-03
 estimated tally relative error    = 0.0002               estimated variance of the variance  = 0.0380
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0002

 number of nonzero history tallies =    53162170          efficiency for the nonzero tallies  = 0.0209
 history number of largest  tally  =  1745215866          largest  unnormalized history tally = 3.48070E+02
 (largest  tally)/(average tally)  = 2.67368E+05          (largest  tally)/(avg nonzero tally)= 5.59621E+03

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 3.25463E-07


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            3.25460E-07             3.25494E-07                     0.000105
      relative error                  2.38672E-04             2.60827E-04                     0.092828
      variance of the variance        3.79666E-02             5.31273E-02                     0.399314
      shifted center                  3.25463E-07             3.25465E-07                     0.000007
      figure of merit                 8.77743E+01             7.34959E+01                    -0.162671

 the estimated inverse power slope of the 200 largest  tallies starting at 5.63927E+00 is 2.2456
 the history score probability density function appears to have an unsampled region at the largest  history scores:
 please examine. see print table 161.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (1.270E+04)*( 8.314E-02)**2 = (1.270E+04)*(6.912E-03) = 8.777E+01

1unnormed tally density for tally        4          nonzero tally mean(m) = 6.220E-02   nps =  2539907635  print table 161

 abscissa              ordinate   log plot of tally probability density function in tally fluctuation chart bin(d=decade,slope= 2.2)
  tally  number num den log den:d-------d--------d--------d--------d--------d--------d--------d--------d--------d--------d--------d-
 5.01-09      2 4.26-01  -0.371 ********|********|********|********|********|********|********|********|********|********|********|*
 7.94-09      0 0.00+00   0.000         |        |        |        |        |        |        |        |        |        |        | 
 1.26-08      3 2.54-01  -0.595 ********|********|********|********|********|********|********|********|********|********|********| 
 2.00-08      8 4.28-01  -0.369 ********|********|********|********|********|********|********|********|********|********|********|*
 3.16-08      5 1.69-01  -0.773 ********|********|********|********|********|********|********|********|********|********|******  | 
 5.01-08     12 2.55-01  -0.593 ********|********|********|********|********|********|********|********|********|********|********| 
 7.94-08     17 2.28-01  -0.641 ********|********|********|********|********|********|********|********|********|********|********| 
 1.26-07     21 1.78-01  -0.750 ********|********|********|********|********|********|********|********|********|********|******* | 
 2.00-07     39 2.09-01  -0.681 ********|********|********|********|********|********|********|********|********|********|******* | 
 3.16-07     71 2.40-01  -0.621 ********|********|********|********|********|********|********|********|********|********|********| 
 5.01-07    113 2.41-01  -0.619 ********|********|********|********|********|********|********|********|********|********|********| 
 7.94-07    140 1.88-01  -0.726 ********|********|********|********|********|********|********|********|********|********|******* | 
 1.26-06    238 2.02-01  -0.695 ********|********|********|********|********|********|********|********|********|********|******* | 
 2.00-06    370 1.98-01  -0.704 ********|********|********|********|********|********|********|********|********|********|******* | 
 3.16-06    628 2.12-01  -0.674 ********|********|********|********|********|********|********|********|********|********|******* | 
 5.01-06    958 2.04-01  -0.691 ********|********|********|********|********|********|********|********|********|********|******* | 
 7.94-06   1550 2.08-01  -0.682 ********|********|********|********|********|********|********|********|********|********|******* | 
 1.26-05   2391 2.03-01  -0.693 ********|********|********|********|********|********|********|********|********|********|******* | 
 2.00-05   3802 2.03-01  -0.692 ********|********|********|********|********|********|********|********|********|********|******* | 
 3.16-05   5881 1.98-01  -0.702 ********|********|********|********|********|********|********|********|********|********|******* | 
 5.01-05   9507 2.02-01  -0.694 ********|********|********|********|********|********|********|********|********|********|******* | 
 7.94-05  14806 1.99-01  -0.701 ********|********|********|********|********|********|********|********|********|********|******* | 
 1.26-04  23282 1.97-01  -0.705 ********|********|********|********|********|********|********|********|********|********|******* | 
 2.00-04  37555 2.01-01  -0.697 ********|********|********|********|********|********|********|********|********|********|******* | 
 3.16-04  58624 1.98-01  -0.704 ********|********|********|********|********|********|********|********|********|********|******* | 
 5.01-04  93549 1.99-01  -0.701 ********|********|********|********|********|********|********|********|********|********|******* | 
 7.94-04 147884 1.99-01  -0.702 ********|********|********|********|********|********|********|********|********|********|******* | 
 1.26-03 232776 1.97-01  -0.705 ********|********|********|********|********|********|********|********|********|********|******* | 
 2.00-03 368843 1.97-01  -0.705 ********|********|********|********|********|********|********|********|********|********|******* | 
 3.16-03 583433 1.97-01  -0.706 ********|********|********|********|********|********|********|********|********|********|******* | 
 5.01-03 923388 1.97-01  -0.707 ********|********|********|********|********|********|********|********|********|********|******* | 
 7.94-03 1.5+06 1.98-01  -0.704 ********|********|********|********|********|********|********|********|********|********|******* | 
 1.26-02 2.6+06 2.22-01  -0.654 ********|********|********|********|********|********|********|********|********|********|******* | 
 2.00-02 5.4+06 2.87-01  -0.542 ********|********|********|********|********|********|********|********|********|********|********| 
 3.16-02 7.8+06 2.65-01  -0.577 ********|********|********|********|********|********|********|********|********|********|********| 
 5.01-02 1.0+07 2.15-01  -0.667 ********|********|********|********|********|********|********|********|********|********|******* | 
 7.94-02 9.9+06 1.33-01  -0.875 mmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmm   | 
 1.26-01 7.4+06 6.24-02  -1.205 ********|********|********|********|********|********|********|********|********|********|**      | 
 2.00-01 4.0+06 2.12-02  -1.673 ********|********|********|********|********|********|********|********|********|******* |        | 
 3.16-01 1.4+06 4.86-03  -2.313 ********|********|********|********|********|********|********|********|********|*       |        | 
 5.01-01 392123 8.35-04  -3.078 ********|********|********|********|********|********|********|********|***     |        |        | 
 7.94-01  92012 1.24-04  -3.908 ********|********|********|********|********|********|********|*****   |        |        |        | 
 1.26+00  20757 1.76-05  -4.755 ********|********|********|********|********|********|******  |        |        |        |        | 
 2.00+00   5888 3.15-06  -5.502 ********|********|********|********|********|********|        |        |        |        |        | 
 3.16+00   2035 6.87-07  -6.163 ********|********|********|********|********|***     |        |        |        |        |        | 
 5.01+00    796 1.69-07  -6.771 ********|********|********|********|******  |        |        |        |        |        |        | 
 7.94+00    206 2.77-08  -7.558 ********|********|********|********|       s|        |        |        |        |        |        | 
 1.26+01     47 3.98-09  -8.400 ********|********|********|        |    s   |        |        |        |        |        |        | 
 2.00+01     15 8.02-10  -9.096 ********|********|***     |        |s       |        |        |        |        |        |        | 
 3.16+01     13 4.39-10  -9.358 ********|********|*       |      s |        |        |        |        |        |        |        | 
 5.01+01      2 4.26-11 -10.371 ********|*       |        |  s     |        |        |        |        |        |        |        | 
 7.94+01      2 2.69-11 -10.571 ********|        |       s|        |        |        |        |        |        |        |        | 
 1.26+02      0 0.00+00   0.000         |        |   s    |        |        |        |        |        |        |        |        | 
 2.00+02      0 0.00+00   0.000         |        s        |        |        |        |        |        |        |        |        | 
 3.16+02      0 0.00+00   0.000         |    s   |        |        |        |        |        |        |        |        |        | 
 3.98+02      1 4.81-12 -11.318 *       | s      |        |        |        |        |        |        |        |        |        | 
  total 5.32+07 2.09-02         d-------d--------d--------d--------d--------d--------d--------d--------d--------d--------d--------d-

1tally       14        nps =  2539907635
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      11                                                                                   
                         4.00000E+03
 
 cell  11                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 4.11346E-07 0.0002   6.15950E-12 0.0411   1.65074E-12 0.0694   1.64225E-12 0.0690   1.69433E-12 0.0784
 
         time:       2.0000E+07             total                                                                  
                 1.56935E-12 0.0755   4.11359E-07 0.0002


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       14

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00       no           no            0.04       no          no            constant    random       2.40
 passed?        yes          yes       no           no             yes       no          no               yes        yes          no

 ===================================================================================================================================


 warning.  the tally in the tally fluctuation chart bin did not pass  5 of the 10 statistical checks.

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       14 with nps =  2539907635  print table 160


 normed average tally per history  = 4.11359E-07          unnormed average tally per history  = 1.64544E-03
 estimated tally relative error    = 0.0002               estimated variance of the variance  = 0.0443
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0002

 number of nonzero history tallies =    66576151          efficiency for the nonzero tallies  = 0.0262
 history number of largest  tally  =  1621837713          largest  unnormalized history tally = 3.75984E+02
 (largest  tally)/(average tally)  = 2.28501E+05          (largest  tally)/(avg nonzero tally)= 5.98947E+03

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 4.11363E-07


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            4.11359E-07             4.11396E-07                     0.000090
      relative error                  1.96097E-04             2.15729E-04                     0.100116
      variance of the variance        4.43380E-02             6.04928E-02                     0.364354
      shifted center                  4.11363E-07             4.11365E-07                     0.000006
      figure of merit                 1.30025E+02             1.07436E+02                    -0.173728

 the estimated inverse power slope of the 200 largest  tallies starting at 3.96468E+00 is 2.4045
 the history score probability density function appears to have an unsampled region at the largest  history scores:
 please examine. see print table 161.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (1.270E+04)*( 1.012E-01)**2 = (1.270E+04)*(1.024E-02) = 1.300E+02

1unnormed tally density for tally       14          nonzero tally mean(m) = 6.277E-02   nps =  2539907635  print table 161

 abscissa              ordinate   log plot of tally probability density function in tally fluctuation chart bin(d=decade,slope= 2.4)
  tally  number num den log den:d------d--------d-------d--------d-------d-------d--------d-------d--------d-------d--------d-------
 5.01-10      1 1.57+00   0.197 *******|********|*******|********|*******|*******|********|*******|********|*******|********|*******
 1.00-09      1 7.89-01  -0.103 *******|********|*******|********|*******|*******|********|*******|********|*******|********|****   
 2.00-09      1 3.96-01  -0.403 *******|********|*******|********|*******|*******|********|*******|********|*******|********|**     
 3.98-09      1 1.98-01  -0.703 *******|********|*******|********|*******|*******|********|*******|********|*******|********|       
 7.94-09      0 0.00+00   0.000        |        |       |        |       |       |        |       |        |       |        |       
 1.58-08      2 9.96-02  -1.002 *******|********|*******|********|*******|*******|********|*******|********|*******|******  |       
 3.16-08     12 3.00-01  -0.524 *******|********|*******|********|*******|*******|********|*******|********|*******|********|*      
 6.31-08     17 2.13-01  -0.672 *******|********|*******|********|*******|*******|********|*******|********|*******|********|       
 1.26-07     40 2.51-01  -0.601 *******|********|*******|********|*******|*******|********|*******|********|*******|********|       
 2.51-07     83 2.61-01  -0.584 *******|********|*******|********|*******|*******|********|*******|********|*******|********|       
 5.01-07    143 2.25-01  -0.647 *******|********|*******|********|*******|*******|********|*******|********|*******|********|       
 1.00-06    277 2.19-01  -0.660 *******|********|*******|********|*******|*******|********|*******|********|*******|********|       
 2.00-06    600 2.37-01  -0.625 *******|********|*******|********|*******|*******|********|*******|********|*******|********|       
 3.98-06   1110 2.20-01  -0.657 *******|********|*******|********|*******|*******|********|*******|********|*******|********|       
 7.94-06   2207 2.19-01  -0.659 *******|********|*******|********|*******|*******|********|*******|********|*******|********|       
 1.58-05   4532 2.26-01  -0.646 *******|********|*******|********|*******|*******|********|*******|********|*******|********|       
 3.16-05   8969 2.24-01  -0.650 *******|********|*******|********|*******|*******|********|*******|********|*******|********|       
 6.31-05  18131 2.27-01  -0.644 *******|********|*******|********|*******|*******|********|*******|********|*******|********|       
 1.26-04  36050 2.26-01  -0.646 *******|********|*******|********|*******|*******|********|*******|********|*******|********|       
 2.51-04  72366 2.27-01  -0.643 *******|********|*******|********|*******|*******|********|*******|********|*******|********|       
 5.01-04 143645 2.26-01  -0.645 *******|********|*******|********|*******|*******|********|*******|********|*******|********|       
 1.00-03 285361 2.25-01  -0.647 *******|********|*******|********|*******|*******|********|*******|********|*******|********|       
 2.00-03 568387 2.25-01  -0.648 *******|********|*******|********|*******|*******|********|*******|********|*******|********|       
 3.98-03 1.1+06 2.25-01  -0.648 *******|********|*******|********|*******|*******|********|*******|********|*******|********|       
 7.94-03 2.3+06 2.27-01  -0.643 *******|********|*******|********|*******|*******|********|*******|********|*******|********|       
 1.58-02 5.7+06 2.83-01  -0.548 *******|********|*******|********|*******|*******|********|*******|********|*******|********|*      
 3.16-02 1.3+07 3.31-01  -0.481 *******|********|*******|********|*******|*******|********|*******|********|*******|********|*      
 6.31-02 1.9+07 2.40-01  -0.619 mmmmmmm|mmmmmmmm|mmmmmmm|mmmmmmmm|mmmmmmm|mmmmmmm|mmmmmmmm|mmmmmmm|mmmmmmmm|mmmmmmm|mmmmmmmm|       
 1.26-01 1.6+07 1.01-01  -0.994 *******|********|*******|********|*******|*******|********|*******|********|*******|******  |       
 2.51-01 6.6+06 2.08-02  -1.682 *******|********|*******|********|*******|*******|********|*******|********|*******|        |       
 5.01-01 998798 1.57-03  -2.803 *******|********|*******|********|*******|*******|********|*******|********|       |        |       
 1.00+00  68702 5.42-05  -4.266 *******|********|*******|********|*******|*******|********|***    |        |       |        |       
 2.00+00   6056 2.40-06  -5.621 *******|********|*******|********|*******|*******|*       |       |        |       |        |       
 3.98+00    858 1.70-07  -6.769 *******|********|*******|********|*******|       |s       |       |        |       |        |       
 7.94+00    140 1.39-08  -7.857 *******|********|*******|******* |       |    s  |        |       |        |       |        |       
 1.58+01     43 2.14-09  -8.669 *******|********|*******|        |       |s      |        |       |        |       |        |       
 3.16+01     11 2.75-10  -9.561 *******|********|*      |        |  s    |       |        |       |        |       |        |       
 6.31+01      2 2.50-11 -10.602 *******|*       |       |      s |       |       |        |       |        |       |        |       
 1.26+02      0 0.00+00   0.000        |        |       |s       |       |       |        |       |        |       |        |       
 2.51+02      0 0.00+00   0.000        |        |  s    |        |       |       |        |       |        |       |        |       
 3.98+02      1 2.68-12 -11.572 *      |      s |       |        |       |       |        |       |        |       |        |       
  total 6.66+07 2.62-02         d------d--------d-------d--------d-------d-------d--------d-------d--------d-------d--------d-------

1tally       24        nps =  2539907635
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      12                                                                                   
                         4.00000E+03
 
 cell  12                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 9.49607E-07 0.0001   1.82716E-11 0.0272   6.75689E-12 0.0390   6.57515E-12 0.0415   6.44003E-12 0.0403
 
         time:       2.0000E+07             total                                                                  
                 6.20627E-12 0.0454   9.49651E-07 0.0001


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       24

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00      yes         yes            constant    random       2.52
 passed?        yes          yes      yes          yes             yes      yes         yes               yes        yes          no

 ===================================================================================================================================


 warning.  the tally in the tally fluctuation chart bin did not pass  1 of the 10 statistical checks.

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       24 with nps =  2539907635  print table 160


 normed average tally per history  = 9.49651E-07          unnormed average tally per history  = 3.79860E-03
 estimated tally relative error    = 0.0001               estimated variance of the variance  = 0.0000
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =   134920851          efficiency for the nonzero tallies  = 0.0531
 history number of largest  tally  =  2454427244          largest  unnormalized history tally = 4.71325E+01
 (largest  tally)/(average tally)  = 1.24078E+04          (largest  tally)/(avg nonzero tally)= 6.59109E+02

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 9.49651E-07


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            9.49651E-07             9.49656E-07                     0.000005
      relative error                  1.18781E-04             1.18881E-04                     0.000840
      variance of the variance        6.66355E-06             9.49155E-06                     0.424398
      shifted center                  9.49651E-07             9.49651E-07                     0.000000
      figure of merit                 3.54385E+02             3.53790E+02                    -0.001679

 the estimated inverse power slope of the 200 largest  tallies starting at 4.17676E+00 is 2.5178
 the history score probability density function appears to have an unsampled region at the largest  history scores:
 please examine. see print table 161.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (1.270E+04)*( 1.670E-01)**2 = (1.270E+04)*(2.791E-02) = 3.544E+02

1unnormed tally density for tally       24          nonzero tally mean(m) = 7.151E-02   nps =  2539907635  print table 161

 abscissa              ordinate   log plot of tally probability density function in tally fluctuation chart bin(d=decade,slope= 2.5)
  tally  number num den log den:d-------d--------d--------d--------d-------d--------d--------d--------d--------d--------d--------d--
 3.98-10      2 5.36+00   0.729 ********|********|********|********|*******|********|********|********|********|********|********|**
 6.31-10      1 1.69+00   0.228 ********|********|********|********|*******|********|********|********|********|********|******* |  
 1.00-09      0 0.00+00   0.000         |        |        |        |       |        |        |        |        |        |        |  
 1.58-09      0 0.00+00   0.000         |        |        |        |       |        |        |        |        |        |        |  
 2.51-09      1 4.25-01  -0.372 ********|********|********|********|*******|********|********|********|********|********|*       |  
 3.98-09      0 0.00+00   0.000         |        |        |        |       |        |        |        |        |        |        |  
 6.31-09      1 1.69-01  -0.772 ********|********|********|********|*******|********|********|********|********|******* |        |  
 1.00-08      4 4.27-01  -0.370 ********|********|********|********|*******|********|********|********|********|********|*       |  
 1.58-08      7 4.71-01  -0.327 ********|********|********|********|*******|********|********|********|********|********|**      |  
 2.51-08      8 3.40-01  -0.469 ********|********|********|********|*******|********|********|********|********|********|        |  
 3.98-08     15 4.02-01  -0.396 ********|********|********|********|*******|********|********|********|********|********|*       |  
 6.31-08     17 2.87-01  -0.541 ********|********|********|********|*******|********|********|********|********|********|        |  
 1.00-07     36 3.84-01  -0.416 ********|********|********|********|*******|********|********|********|********|********|*       |  
 1.58-07     48 3.23-01  -0.491 ********|********|********|********|*******|********|********|********|********|********|        |  
 2.51-07     67 2.85-01  -0.546 ********|********|********|********|*******|********|********|********|********|********|        |  
 3.98-07    124 3.32-01  -0.478 ********|********|********|********|*******|********|********|********|********|********|        |  
 6.31-07    188 3.18-01  -0.498 ********|********|********|********|*******|********|********|********|********|********|        |  
 1.00-06    316 3.37-01  -0.472 ********|********|********|********|*******|********|********|********|********|********|        |  
 1.58-06    542 3.65-01  -0.438 ********|********|********|********|*******|********|********|********|********|********|*       |  
 2.51-06    842 3.58-01  -0.447 ********|********|********|********|*******|********|********|********|********|********|*       |  
 3.98-06   1346 3.61-01  -0.443 ********|********|********|********|*******|********|********|********|********|********|*       |  
 6.31-06   2101 3.55-01  -0.449 ********|********|********|********|*******|********|********|********|********|********|*       |  
 1.00-05   3291 3.51-01  -0.455 ********|********|********|********|*******|********|********|********|********|********|        |  
 1.58-05   5178 3.49-01  -0.458 ********|********|********|********|*******|********|********|********|********|********|        |  
 2.51-05   8272 3.51-01  -0.454 ********|********|********|********|*******|********|********|********|********|********|        |  
 3.98-05  13120 3.52-01  -0.454 ********|********|********|********|*******|********|********|********|********|********|        |  
 6.31-05  20886 3.53-01  -0.452 ********|********|********|********|*******|********|********|********|********|********|*       |  
 1.00-04  33290 3.55-01  -0.450 ********|********|********|********|*******|********|********|********|********|********|*       |  
 1.58-04  52668 3.55-01  -0.450 ********|********|********|********|*******|********|********|********|********|********|*       |  
 2.51-04  83482 3.55-01  -0.450 ********|********|********|********|*******|********|********|********|********|********|*       |  
 3.98-04 131811 3.53-01  -0.452 ********|********|********|********|*******|********|********|********|********|********|*       |  
 6.31-04 209084 3.54-01  -0.452 ********|********|********|********|*******|********|********|********|********|********|*       |  
 1.00-03 332563 3.55-01  -0.450 ********|********|********|********|*******|********|********|********|********|********|*       |  
 1.58-03 525539 3.54-01  -0.451 ********|********|********|********|*******|********|********|********|********|********|*       |  
 2.51-03 836846 3.55-01  -0.449 ********|********|********|********|*******|********|********|********|********|********|*       |  
 3.98-03 1.3+06 3.59-01  -0.445 ********|********|********|********|*******|********|********|********|********|********|*       |  
 6.31-03 2.2+06 3.66-01  -0.437 ********|********|********|********|*******|********|********|********|********|********|*       |  
 1.00-02 3.6+06 3.83-01  -0.416 ********|********|********|********|*******|********|********|********|********|********|*       |  
 1.58-02 7.5+06 5.08-01  -0.294 ********|********|********|********|*******|********|********|********|********|********|**      |  
 2.51-02 1.4+07 6.15-01  -0.211 ********|********|********|********|*******|********|********|********|********|********|***     |  
 3.98-02 2.1+07 5.72-01  -0.243 ********|********|********|********|*******|********|********|********|********|********|**      |  
 6.31-02 2.6+07 4.37-01  -0.359 ********|********|********|********|*******|********|********|********|********|********|*       |  
 1.00-01 2.5+07 2.71-01  -0.567 mmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmm|        |  
 1.58-01 1.9+07 1.26-01  -0.901 ********|********|********|********|*******|********|********|********|********|******  |        |  
 2.51-01 9.1+06 3.86-02  -1.413 ********|********|********|********|*******|********|********|********|********|*       |        |  
 3.98-01 2.6+06 7.06-03  -2.151 ********|********|********|********|*******|********|********|********|***     |        |        |  
 6.31-01 464361 7.85-04  -3.105 ********|********|********|********|*******|********|********|****    |        |        |        |  
 1.00+00  71723 7.65-05  -4.116 ********|********|********|********|*******|********|****    |        |        |        |        |  
 1.58+00  13264 8.93-06  -5.049 ********|********|********|********|*******|*****   |        |        |        |        |        |  
 2.51+00   3254 1.38-06  -5.859 ********|********|********|********|*****  |        |        |        |        |        |        |  
 3.98+00    853 2.29-07  -6.641 ********|********|********|********|       |        |        |        |        |        |        |  
 6.31+00    179 3.03-08  -7.519 ********|********|********|        |s      |        |        |        |        |        |        |  
 1.00+01     31 3.31-09  -8.481 ********|********|        |      s |       |        |        |        |        |        |        |  
 1.58+01     22 1.48-09  -8.829 ********|******  |        |  s     |       |        |        |        |        |        |        |  
 2.51+01      5 2.12-10  -9.673 ********|        |       s|        |       |        |        |        |        |        |        |  
 3.98+01      4 1.07-10  -9.970 *****   |        |   s    |        |       |        |        |        |        |        |        |  
 5.01+01      1 3.82-11 -10.418 *       |        s        |        |       |        |        |        |        |        |        |  
  total 1.35+08 5.31-02         d-------d--------d--------d--------d-------d--------d--------d--------d--------d--------d--------d--

1tally       34        nps =  2539907635
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      13                                                                                   
                         4.00000E+03
 
 cell  13                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 4.11272E-07 0.0002   5.73238E-12 0.0394   1.55861E-12 0.0721   1.52303E-12 0.0759   1.56255E-12 0.0717
 
         time:       2.0000E+07             total                                                                  
                 1.42562E-12 0.0775   4.11284E-07 0.0002


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       34

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00      yes          no            constant   increase      2.62
 passed?        yes          yes      yes          yes             yes      yes          no               yes         no          no

 ===================================================================================================================================


 warning.  the tally in the tally fluctuation chart bin did not pass  3 of the 10 statistical checks.

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       34 with nps =  2539907635  print table 160


 normed average tally per history  = 4.11284E-07          unnormed average tally per history  = 1.64514E-03
 estimated tally relative error    = 0.0002               estimated variance of the variance  = 0.0001
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =    65708189          efficiency for the nonzero tallies  = 0.0259
 history number of largest  tally  =  1388031187          largest  unnormalized history tally = 7.31529E+01
 (largest  tally)/(average tally)  = 4.44662E+04          (largest  tally)/(avg nonzero tally)= 1.15035E+03

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 4.11284E-07


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            4.11284E-07             4.11291E-07                     0.000018
      relative error                  1.75425E-04             1.76294E-04                     0.004950
      variance of the variance        1.23480E-04             2.18294E-04                     0.767851
      shifted center                  4.11284E-07             4.11284E-07                     0.000000
      figure of merit                 1.62474E+02             1.60878E+02                    -0.009826

 the estimated inverse power slope of the 200 largest  tallies starting at 4.00062E+00 is 2.6249
 the history score probability density function appears to have an unsampled region at the largest  history scores:
 please examine. see print table 161.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (1.270E+04)*( 1.131E-01)**2 = (1.270E+04)*(1.279E-02) = 1.625E+02

1unnormed tally density for tally       34          nonzero tally mean(m) = 6.359E-02   nps =  2539907635  print table 161

 abscissa              ordinate   log plot of tally probability density function in tally fluctuation chart bin(d=decade,slope= 2.6)
  tally  number num den log den:d-------d--------d--------d--------d---------d--------d--------d--------d--------d--------d--------d
 3.16-09      3 1.01+00   0.005 ********|********|********|********|*********|********|********|********|********|********|********|
 5.01-09      0 0.00+00   0.000         |        |        |        |         |        |        |        |        |        |        |
 7.94-09      1 1.34-01  -0.872 ********|********|********|********|*********|********|********|********|********|********|*       |
 1.26-08      1 8.47-02  -1.072 ********|********|********|********|*********|********|********|********|********|********|        |
 2.00-08      2 1.07-01  -0.971 ********|********|********|********|*********|********|********|********|********|********|        |
 3.16-08      6 2.02-01  -0.694 ********|********|********|********|*********|********|********|********|********|********|***     |
 5.01-08      8 1.70-01  -0.769 ********|********|********|********|*********|********|********|********|********|********|**      |
 7.94-08     24 3.22-01  -0.492 ********|********|********|********|*********|********|********|********|********|********|****    |
 1.26-07     25 2.12-01  -0.674 ********|********|********|********|*********|********|********|********|********|********|***     |
 2.00-07     49 2.62-01  -0.582 ********|********|********|********|*********|********|********|********|********|********|****    |
 3.16-07     67 2.26-01  -0.646 ********|********|********|********|*********|********|********|********|********|********|***     |
 5.01-07     84 1.79-01  -0.748 ********|********|********|********|*********|********|********|********|********|********|**      |
 7.94-07    157 2.11-01  -0.676 ********|********|********|********|*********|********|********|********|********|********|***     |
 1.26-06    274 2.32-01  -0.634 ********|********|********|********|*********|********|********|********|********|********|***     |
 2.00-06    416 2.22-01  -0.653 ********|********|********|********|*********|********|********|********|********|********|***     |
 3.16-06    680 2.29-01  -0.639 ********|********|********|********|*********|********|********|********|********|********|***     |
 5.01-06   1098 2.34-01  -0.631 ********|********|********|********|*********|********|********|********|********|********|***     |
 7.94-06   1685 2.26-01  -0.645 ********|********|********|********|*********|********|********|********|********|********|***     |
 1.26-05   2656 2.25-01  -0.648 ********|********|********|********|*********|********|********|********|********|********|***     |
 2.00-05   4087 2.19-01  -0.660 ********|********|********|********|*********|********|********|********|********|********|***     |
 3.16-05   6534 2.20-01  -0.657 ********|********|********|********|*********|********|********|********|********|********|***     |
 5.01-05  10398 2.21-01  -0.655 ********|********|********|********|*********|********|********|********|********|********|***     |
 7.94-05  16526 2.22-01  -0.654 ********|********|********|********|*********|********|********|********|********|********|***     |
 1.26-04  26060 2.21-01  -0.656 ********|********|********|********|*********|********|********|********|********|********|***     |
 2.00-04  41401 2.21-01  -0.655 ********|********|********|********|*********|********|********|********|********|********|***     |
 3.16-04  65402 2.21-01  -0.656 ********|********|********|********|*********|********|********|********|********|********|***     |
 5.01-04 103359 2.20-01  -0.658 ********|********|********|********|*********|********|********|********|********|********|***     |
 7.94-04 163285 2.19-01  -0.659 ********|********|********|********|*********|********|********|********|********|********|***     |
 1.26-03 259165 2.20-01  -0.658 ********|********|********|********|*********|********|********|********|********|********|***     |
 2.00-03 409541 2.19-01  -0.660 ********|********|********|********|*********|********|********|********|********|********|***     |
 3.16-03 650353 2.19-01  -0.659 ********|********|********|********|*********|********|********|********|********|********|***     |
 5.01-03 1.0+06 2.21-01  -0.657 ********|********|********|********|*********|********|********|********|********|********|***     |
 7.94-03 1.7+06 2.22-01  -0.654 ********|********|********|********|*********|********|********|********|********|********|***     |
 1.26-02 2.9+06 2.47-01  -0.608 ********|********|********|********|*********|********|********|********|********|********|***     |
 2.00-02 6.2+06 3.30-01  -0.481 ********|********|********|********|*********|********|********|********|********|********|*****   |
 3.16-02 9.3+06 3.13-01  -0.504 ********|********|********|********|*********|********|********|********|********|********|****    |
 5.01-02 1.2+07 2.65-01  -0.577 ********|********|********|********|*********|********|********|********|********|********|****    |
 7.94-02 1.3+07 1.71-01  -0.766 mmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmm|mm      |
 1.26-01 9.9+06 8.37-02  -1.077 ********|********|********|********|*********|********|********|********|********|********|        |
 2.00-01 5.5+06 2.92-02  -1.535 ********|********|********|********|*********|********|********|********|********|****    |        |
 3.16-01 1.9+06 6.32-03  -2.200 ********|********|********|********|*********|********|********|********|******* |        |        |
 5.01-01 391574 8.34-04  -3.079 ********|********|********|********|*********|********|********|********|        |        |        |
 7.94-01  62148 8.35-05  -4.078 ********|********|********|********|*********|********|********|        |        |        |        |
 1.26+00  11221 9.51-06  -5.022 ********|********|********|********|*********|********|        |        |        |        |        |
 2.00+00   2574 1.38-06  -5.861 ********|********|********|********|*********|*       |        |        |        |        |        |
 3.16+00    698 2.35-07  -6.628 ********|********|********|********|****     |        |        |        |        |        |        |
 5.01+00    225 4.79-08  -7.320 ********|********|********|******  |      s  |        |        |        |        |        |        |
 7.94+00     69 9.27-09  -8.033 ********|********|********|        |   s     |        |        |        |        |        |        |
 1.26+01     30 2.54-09  -8.595 ********|********|****    |        s         |        |        |        |        |        |        |
 2.00+01     16 8.56-10  -9.068 ********|********|        |    s   |         |        |        |        |        |        |        |
 3.16+01      1 3.37-11 -10.472 *****   |        |        |s       |         |        |        |        |        |        |        |
 5.01+01      1 2.13-11 -10.672 ***     |        |     s  |        |         |        |        |        |        |        |        |
 7.94+01      1 1.34-11 -10.872 *       |        |s       |        |         |        |        |        |        |        |        |
  total 6.57+07 2.59-02         d-------d--------d--------d--------d---------d--------d--------d--------d--------d--------d--------d

1tally       44        nps =  2539907635
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      14                                                                                   
                         4.00000E+03
 
 cell  14                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 5.00153E-07 0.0002   5.42835E-12 0.0397   6.09293E-13 0.1246   5.66692E-13 0.1062   6.03532E-13 0.1097
 
         time:       2.0000E+07             total                                                                  
                 5.19241E-13 0.1221   5.00161E-07 0.0002


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       44

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00      yes          no            constant    random       2.77
 passed?        yes          yes      yes          yes             yes      yes          no               yes        yes          no

 ===================================================================================================================================


 warning.  the tally in the tally fluctuation chart bin did not pass  2 of the 10 statistical checks.

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       44 with nps =  2539907635  print table 160


 normed average tally per history  = 5.00161E-07          unnormed average tally per history  = 2.00064E-03
 estimated tally relative error    = 0.0002               estimated variance of the variance  = 0.0001
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0001

 number of nonzero history tallies =    76175887          efficiency for the nonzero tallies  = 0.0300
 history number of largest  tally  =   579292617          largest  unnormalized history tally = 7.88776E+01
 (largest  tally)/(average tally)  = 3.94261E+04          (largest  tally)/(avg nonzero tally)= 1.18245E+03

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 5.00161E-07


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            5.00161E-07             5.00168E-07                     0.000016
      relative error                  1.62319E-04             1.63057E-04                     0.004546
      variance of the variance        1.07268E-04             1.87452E-04                     0.747503
      shifted center                  5.00161E-07             5.00161E-07                     0.000000
      figure of merit                 1.89772E+02             1.88059E+02                    -0.009031

 the estimated inverse power slope of the 200 largest  tallies starting at 4.48213E+00 is 2.7713
 the history score probability density function appears to have an unsampled region at the largest  history scores:
 please examine. see print table 161.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (1.270E+04)*( 1.222E-01)**2 = (1.270E+04)*(1.494E-02) = 1.898E+02

1unnormed tally density for tally       44          nonzero tally mean(m) = 6.671E-02   nps =  2539907635  print table 161

 abscissa              ordinate   log plot of tally probability density function in tally fluctuation chart bin(d=decade,slope= 2.8)
  tally  number num den log den:d-------d---------d--------d--------d---------d--------d--------d---------d--------d--------d-------
 3.16-09      1 3.37-01  -0.472 ********|*********|********|********|*********|********|********|*********|********|********|*****  
 5.01-09      1 2.13-01  -0.672 ********|*********|********|********|*********|********|********|*********|********|********|***    
 7.94-09      4 5.37-01  -0.270 ********|*********|********|********|*********|********|********|*********|********|********|*******
 1.26-08      2 1.69-01  -0.771 ********|*********|********|********|*********|********|********|*********|********|********|**     
 2.00-08      2 1.07-01  -0.971 ********|*********|********|********|*********|********|********|*********|********|********|       
 3.16-08      4 1.35-01  -0.870 ********|*********|********|********|*********|********|********|*********|********|********|*      
 5.01-08      7 1.49-01  -0.827 ********|*********|********|********|*********|********|********|*********|********|********|**     
 7.94-08     12 1.61-01  -0.793 ********|*********|********|********|*********|********|********|*********|********|********|**     
 1.26-07     29 2.46-01  -0.609 ********|*********|********|********|*********|********|********|*********|********|********|****   
 2.00-07     45 2.41-01  -0.619 ********|*********|********|********|*********|********|********|*********|********|********|****   
 3.16-07     77 2.60-01  -0.585 ********|*********|********|********|*********|********|********|*********|********|********|****   
 5.01-07    118 2.51-01  -0.600 ********|*********|********|********|*********|********|********|*********|********|********|****   
 7.94-07    172 2.31-01  -0.636 ********|*********|********|********|*********|********|********|*********|********|********|****   
 1.26-06    257 2.18-01  -0.662 ********|*********|********|********|*********|********|********|*********|********|********|***    
 2.00-06    466 2.49-01  -0.604 ********|*********|********|********|*********|********|********|*********|********|********|****   
 3.16-06    755 2.55-01  -0.594 ********|*********|********|********|*********|********|********|*********|********|********|****   
 5.01-06   1121 2.39-01  -0.622 ********|*********|********|********|*********|********|********|*********|********|********|****   
 7.94-06   1740 2.34-01  -0.631 ********|*********|********|********|*********|********|********|*********|********|********|****   
 1.26-05   2688 2.28-01  -0.642 ********|*********|********|********|*********|********|********|*********|********|********|****   
 2.00-05   4365 2.33-01  -0.632 ********|*********|********|********|*********|********|********|*********|********|********|****   
 3.16-05   7066 2.38-01  -0.623 ********|*********|********|********|*********|********|********|*********|********|********|****   
 5.01-05  10964 2.33-01  -0.632 ********|*********|********|********|*********|********|********|*********|********|********|****   
 7.94-05  17623 2.37-01  -0.626 ********|*********|********|********|*********|********|********|*********|********|********|****   
 1.26-04  28166 2.39-01  -0.622 ********|*********|********|********|*********|********|********|*********|********|********|****   
 2.00-04  44281 2.37-01  -0.626 ********|*********|********|********|*********|********|********|*********|********|********|****   
 3.16-04  70093 2.36-01  -0.626 ********|*********|********|********|*********|********|********|*********|********|********|****   
 5.01-04 110887 2.36-01  -0.627 ********|*********|********|********|*********|********|********|*********|********|********|****   
 7.94-04 175718 2.36-01  -0.627 ********|*********|********|********|*********|********|********|*********|********|********|****   
 1.26-03 278192 2.36-01  -0.628 ********|*********|********|********|*********|********|********|*********|********|********|****   
 2.00-03 441510 2.36-01  -0.627 ********|*********|********|********|*********|********|********|*********|********|********|****   
 3.16-03 698454 2.36-01  -0.628 ********|*********|********|********|*********|********|********|*********|********|********|****   
 5.01-03 1.1+06 2.37-01  -0.626 ********|*********|********|********|*********|********|********|*********|********|********|****   
 7.94-03 1.8+06 2.40-01  -0.619 ********|*********|********|********|*********|********|********|*********|********|********|****   
 1.26-02 3.1+06 2.65-01  -0.577 ********|*********|********|********|*********|********|********|*********|********|********|****   
 2.00-02 6.7+06 3.59-01  -0.445 ********|*********|********|********|*********|********|********|*********|********|********|*****  
 3.16-02 1.0+07 3.48-01  -0.458 ********|*********|********|********|*********|********|********|*********|********|********|*****  
 5.01-02 1.4+07 3.01-01  -0.521 ********|*********|********|********|*********|********|********|*********|********|********|*****  
 7.94-02 1.5+07 2.02-01  -0.695 mmmmmmmm|mmmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmmm|mmmmmmmm|mmmmmmmm|mmm    
 1.26-01 1.2+07 1.02-01  -0.991 ********|*********|********|********|*********|********|********|*********|********|********|       
 2.00-01 6.9+06 3.69-02  -1.433 ********|*********|********|********|*********|********|********|*********|********|*****   |       
 3.16-01 2.5+06 8.27-03  -2.083 ********|*********|********|********|*********|********|********|*********|********|        |       
 5.01-01 521996 1.11-03  -2.954 ********|*********|********|********|*********|********|********|*********|        |        |       
 7.94-01  81730 1.10-04  -3.960 ********|*********|********|********|*********|********|********|*        |        |        |       
 1.26+00  14531 1.23-05  -4.910 ********|*********|********|********|*********|********|*       |         |        |        |       
 2.00+00   3326 1.78-06  -5.750 ********|*********|********|********|*********|**      |        |         |        |        |       
 3.16+00    957 3.23-07  -6.491 ********|*********|********|********|*****    |        |        |         |        |        |       
 5.01+00    305 6.49-08  -7.188 ********|*********|********|******* |       s |        |        |         |        |        |       
 7.94+00     96 1.29-08  -7.890 ********|*********|********|*       |    s    |        |        |         |        |        |       
 1.26+01     36 3.05-09  -8.516 ********|*********|****    |        | s       |        |        |         |        |        |       
 2.00+01     17 9.09-10  -9.041 ********|*********|        |      s |         |        |        |         |        |        |       
 3.16+01      6 2.02-10  -9.694 ********|***      |        | s      |         |        |        |         |        |        |       
 5.01+01      3 6.39-11 -10.195 ******* |         |      s |        |         |        |        |         |        |        |       
 7.94+01      1 1.34-11 -10.872 *       |         | s      |        |         |        |        |         |        |        |       
  total 7.62+07 3.00-02         d-------d---------d--------d--------d---------d--------d--------d---------d--------d--------d-------

1status of the statistical checks used to form confidence intervals for the mean for each tally bin


 tally   result of statistical checks for the tfc bin (the first check not passed is listed) and error magnitude check for all bins

        4   missed  5 of 10 tfc bin checks: the relative error does not monotonically decrease over the last half of the problem      
         passed all bin error check:     7 tally bins all have relative errors less than 0.10 with no zero bins

       14   missed  5 of 10 tfc bin checks: the relative error does not monotonically decrease over the last half of the problem      
         passed all bin error check:     7 tally bins all have relative errors less than 0.10 with no zero bins

       24   missed  1 of 10 tfc bin checks: the slope of decrease of largest tallies is less than the minimum acceptable value of 3.0 
         passed all bin error check:     7 tally bins all have relative errors less than 0.10 with no zero bins

       34   missed  3 of 10 tfc bin checks: the variance of the variance appears not to decrease as 1/nps for the last half of problem
         passed all bin error check:     7 tally bins all have relative errors less than 0.10 with no zero bins

       44   missed  2 of 10 tfc bin checks: the variance of the variance appears not to decrease as 1/nps for the last half of problem
         missed all bin error check:     7 tally bins had     0 bins with zeros and     4 bins with relative errors exceeding 0.10


 the 10 statistical checks are only for the tally fluctuation chart bin and do not apply to other tally bins.

 warning.       5 of the     5 tally fluctuation chart bins did not pass all 10 statistical checks.
 warning.       1 of the     5 tallies had bins with relative errors greater than recommended.
1tally fluctuation charts                              

                            tally        4                          tally       14                          tally       24
          nps      mean     error   vov  slope    fom      mean     error   vov  slope    fom      mean     error   vov  slope    fom
    131072000   3.2533E-07 0.0010 0.0016  3.4     106   4.1147E-07 0.0008 0.0004  3.5     164   9.4988E-07 0.0005 0.0000  3.4     353
    262144000   3.2539E-07 0.0007 0.0054  2.7      97   4.1127E-07 0.0005 0.0001  2.9     165   9.4999E-07 0.0004 0.0001  3.0     350
    393216000   3.2545E-07 0.0006 0.0027  3.0     102   4.1125E-07 0.0004 0.0001  3.3     167   9.4989E-07 0.0003 0.0001  3.3     352
    524288000   3.2534E-07 0.0005 0.0016  3.0     104   4.1129E-07 0.0004 0.0001  2.8     164   9.4976E-07 0.0003 0.0000  3.3     353
    655360000   3.2523E-07 0.0004 0.0011  2.8     106   4.1135E-07 0.0003 0.0001  2.9     165   9.4964E-07 0.0002 0.0000  3.1     354
    786432000   3.2524E-07 0.0004 0.0008  2.9     108   4.1139E-07 0.0003 0.0001  2.9     165   9.4958E-07 0.0002 0.0000  2.9     354
    917504000   3.2532E-07 0.0004 0.0006  2.8     108   4.1140E-07 0.0003 0.0001  3.2     165   9.4960E-07 0.0002 0.0000  3.1     355
   1048576000   3.2534E-07 0.0003 0.0005  2.8     109   4.1138E-07 0.0003 0.0000  3.4     165   9.4955E-07 0.0002 0.0000  3.1     355
   1179648000   3.2538E-07 0.0003 0.0004  2.6     109   4.1140E-07 0.0003 0.0000  2.9     165   9.4962E-07 0.0002 0.0000  2.9     355
   1310720000   3.2539E-07 0.0003 0.0003  2.7     109   4.1134E-07 0.0002 0.0000  2.8     165   9.4961E-07 0.0002 0.0000  2.7     354
   1441792000   3.2540E-07 0.0003 0.0003  2.5     109   4.1134E-07 0.0002 0.0000  2.8     164   9.4960E-07 0.0002 0.0000  2.8     354
   1572864000   3.2539E-07 0.0003 0.0002  2.5     109   4.1127E-07 0.0002 0.0000  2.7     165   9.4957E-07 0.0002 0.0000  2.8     355
   1703936000   3.2541E-07 0.0003 0.0002  2.6     109   4.1135E-07 0.0003 0.0811  2.5     118   9.4958E-07 0.0001 0.0000  2.7     355
   1835008000   3.2548E-07 0.0003 0.0621  2.3      81   4.1137E-07 0.0002 0.0730  2.4     121   9.4962E-07 0.0001 0.0000  2.7     355
   1966080000   3.2547E-07 0.0003 0.0562  2.3      83   4.1139E-07 0.0002 0.0660  2.4     123   9.4963E-07 0.0001 0.0000  2.5     355
   2097152000   3.2545E-07 0.0003 0.0511  2.3      84   4.1137E-07 0.0002 0.0601  2.5     125   9.4965E-07 0.0001 0.0000  2.5     355
   2228224000   3.2545E-07 0.0003 0.0466  2.2      85   4.1139E-07 0.0002 0.0549  2.4     127   9.4965E-07 0.0001 0.0000  2.6     355
   2359296000   3.2544E-07 0.0002 0.0427  2.3      86   4.1139E-07 0.0002 0.0502  2.4     129   9.4967E-07 0.0001 0.0000  2.6     355
   2490368000   3.2545E-07 0.0002 0.0393  2.2      88   4.1136E-07 0.0002 0.0462  2.5     130   9.4968E-07 0.0001 0.0000  2.5     354
   2539907635   3.2546E-07 0.0002 0.0380  2.2      88   4.1136E-07 0.0002 0.0443  2.4     130   9.4965E-07 0.0001 0.0000  2.5     354
 

                            tally       34                          tally       44
          nps      mean     error   vov  slope    fom      mean     error   vov  slope    fom
    131072000   4.1110E-07 0.0008 0.0002  2.9     164   5.0093E-07 0.0007 0.0000  3.4     193
    262144000   4.1105E-07 0.0005 0.0000  3.6     166   5.0072E-07 0.0005 0.0000  3.2     193
    393216000   4.1124E-07 0.0004 0.0007  2.7     160   5.0064E-07 0.0004 0.0004  3.8     190
    524288000   4.1134E-07 0.0004 0.0004  3.2     161   5.0056E-07 0.0004 0.0003  3.1     190
    655360000   4.1143E-07 0.0003 0.0003  3.1     162   5.0039E-07 0.0003 0.0013  2.8     184
    786432000   4.1137E-07 0.0003 0.0002  3.1     163   5.0029E-07 0.0003 0.0010  2.7     185
    917504000   4.1144E-07 0.0003 0.0001  3.3     163   5.0027E-07 0.0003 0.0007  2.4     186
   1048576000   4.1139E-07 0.0003 0.0001  3.0     163   5.0024E-07 0.0003 0.0006  2.4     186
   1179648000   4.1133E-07 0.0003 0.0001  3.0     163   5.0027E-07 0.0002 0.0005  2.5     186
   1310720000   4.1136E-07 0.0002 0.0001  2.9     163   5.0026E-07 0.0002 0.0004  2.5     187
   1441792000   4.1131E-07 0.0002 0.0004  2.8     161   5.0017E-07 0.0002 0.0003  2.4     188
   1572864000   4.1131E-07 0.0002 0.0003  2.8     161   5.0014E-07 0.0002 0.0003  2.5     188
   1703936000   4.1125E-07 0.0002 0.0003  2.6     161   5.0011E-07 0.0002 0.0002  2.6     189
   1835008000   4.1128E-07 0.0002 0.0002  2.6     161   5.0013E-07 0.0002 0.0002  2.8     189
   1966080000   4.1126E-07 0.0002 0.0002  2.6     162   5.0009E-07 0.0002 0.0002  2.7     189
   2097152000   4.1127E-07 0.0002 0.0002  2.5     162   5.0012E-07 0.0002 0.0002  2.9     189
   2228224000   4.1131E-07 0.0002 0.0002  2.5     162   5.0013E-07 0.0002 0.0001  2.8     189
   2359296000   4.1129E-07 0.0002 0.0001  2.5     162   5.0014E-07 0.0002 0.0001  2.8     190
   2490368000   4.1130E-07 0.0002 0.0001  2.6     162   5.0016E-07 0.0002 0.0001  2.8     190
   2539907635   4.1128E-07 0.0002 0.0001  2.6     162   5.0016E-07 0.0002 0.0001  2.8     190

 ***********************************************************************************************************************

 dump no.  168 on file inpr     nps =  2539907635     coll =   179148819435     ctm =   200000.30   nrn =    
 1513523343611

        16 warning messages so far.


 run terminated when it had used*****  minutes of computer time.

 computer time =******** minutes

 mcnp     version 6     06/19/14                     08/06/17 18:15:37                     probid =  08/06/17 09:55:45 
