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
  
1mcnp     version 6     ld=06/19/14                     08/06/17 08:53:04 
 *************************************************************************                 probid =  08/06/17 08:53:04 
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
       153-       sb1    4.95040e-01 5.04960e-01                                                  
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
       220-       wwp:n 5.0 j 100 j -1 0 9.588035032e-03                                          
 
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

    minimum source weight = 9.9018E-01    maximum source weight = 1.0100E+00

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

 dump no.    2 on file inpr     nps =    14479112     coll =     1102082721     ctm =     1200.31   nrn =       
 9290099574

 ***********************************************************************************************************************

 dump no.    3 on file inpr     nps =    28923200     coll =     2204367311     ctm =     2400.72   nrn =      
 18581100568

 ***********************************************************************************************************************

 dump no.    4 on file inpr     nps =    43318400     coll =     3319334055     ctm =     3603.73   nrn =      
 27975949953

 ***********************************************************************************************************************

 dump no.    5 on file inpr     nps =    57838800     coll =     4420597529     ctm =     4804.10   nrn =      
 37259705907

 ***********************************************************************************************************************

 dump no.    6 on file inpr     nps =    72327800     coll =     5522739927     ctm =     6004.46   nrn =      
 46549435672
 warning.  no reaction mt found. collision resampled. zaid =  92235.80c
 nps =    84431943     nrn =                3346 erg = 2.2947E-01                     

 ***********************************************************************************************************************

 dump no.    7 on file inpr     nps =    86805600     coll =     6624805184     ctm =     7204.83   nrn =      
 55838893117

 ***********************************************************************************************************************

 dump no.    8 on file inpr     nps =   101294600     coll =     7727479271     ctm =     8405.18   nrn =      
 65132906533

 ***********************************************************************************************************************

 dump no.    9 on file inpr     nps =   115792800     coll =     8830379216     ctm =     9605.54   nrn =      
 74429836417

 ***********************************************************************************************************************

 dump no.   10 on file inpr     nps =   130328367     coll =     9932904752     ctm =    10805.88   nrn =      
 83724261458

 ***********************************************************************************************************************

 dump no.   11 on file inpr     nps =   144821047     coll =    11035386963     ctm =    12006.31   nrn =      
 93017263307

 ***********************************************************************************************************************

 dump no.   12 on file inpr     nps =   159327707     coll =    12138502010     ctm =    13206.68   nrn =     
 102315294851

 ***********************************************************************************************************************

 dump no.   13 on file inpr     nps =   173829901     coll =    13241577373     ctm =    14407.04   nrn =     
 111613060715

 ***********************************************************************************************************************

 dump no.   14 on file inpr     nps =   188334149     coll =    14344792828     ctm =    15607.35   nrn =     
 120911590095

 ***********************************************************************************************************************

 dump no.   15 on file inpr     nps =   202828749     coll =    15448058287     ctm =    16807.67   nrn =     
 130211159373

 ***********************************************************************************************************************

 dump no.   16 on file inpr     nps =   217315108     coll =    16551518257     ctm =    18008.06   nrn =     
 139512182353

 ***********************************************************************************************************************

 dump no.   17 on file inpr     nps =   231801065     coll =    17654738182     ctm =    19208.50   nrn =     
 148810605558

 ***********************************************************************************************************************

 dump no.   18 on file inpr     nps =   246284007     coll =    18757310246     ctm =    20408.72   nrn =     
 158104215814

 ***********************************************************************************************************************

 dump no.   19 on file inpr     nps =   260804247     coll =    19859821627     ctm =    21609.06   nrn =     
 167398284810

 ***********************************************************************************************************************

 dump no.   20 on file inpr     nps =   275298043     coll =    20962991826     ctm =    22809.42   nrn =     
 176697071768

 ***********************************************************************************************************************

 dump no.   21 on file inpr     nps =   289819778     coll =    22065881999     ctm =    24009.85   nrn =     
 185993977106

 ***********************************************************************************************************************

 dump no.   22 on file inpr     nps =   304285635     coll =    23169288569     ctm =    25210.24   nrn =     
 195293377212

 ***********************************************************************************************************************

 dump no.   23 on file inpr     nps =   318714910     coll =    24272952975     ctm =    26410.52   nrn =     
 204595462551

 ***********************************************************************************************************************

 dump no.   24 on file inpr     nps =   333192827     coll =    25376167750     ctm =    27610.88   nrn =     
 213894501122

 ***********************************************************************************************************************

 dump no.   25 on file inpr     nps =   347676686     coll =    26479295272     ctm =    28811.25   nrn =     
 223192866299

 ***********************************************************************************************************************

 dump no.   26 on file inpr     nps =   362165746     coll =    27582345930     ctm =    30011.76   nrn =     
 232489818942

 ***********************************************************************************************************************

 dump no.   27 on file inpr     nps =   376683373     coll =    28684866895     ctm =    31212.13   nrn =     
 241784118065

 ***********************************************************************************************************************

 dump no.   28 on file inpr     nps =   391160398     coll =    29788279047     ctm =    32412.36   nrn =     
 251084097797

 ***********************************************************************************************************************

 dump no.   29 on file inpr     nps =   405687045     coll =    30891137528     ctm =    33612.75   nrn =     
 260379779580

 ***********************************************************************************************************************

 dump no.   30 on file inpr     nps =   420215526     coll =    31993958334     ctm =    34813.21   nrn =     
 269676231403

 ***********************************************************************************************************************

 dump no.   31 on file inpr     nps =   434699159     coll =    33097061962     ctm =    36013.67   nrn =     
 278974180050

 ***********************************************************************************************************************

 dump no.   32 on file inpr     nps =   449162918     coll =    34199941743     ctm =    37214.07   nrn =     
 288270073151

 ***********************************************************************************************************************

 dump no.   33 on file inpr     nps =   463649566     coll =    35302717033     ctm =    38414.33   nrn =     
 297565505161

 ***********************************************************************************************************************

 dump no.   34 on file inpr     nps =   478153324     coll =    36405295310     ctm =    39614.76   nrn =     
 306860447312

 ***********************************************************************************************************************

 dump no.   35 on file inpr     nps =   492661278     coll =    37507947130     ctm =    40815.23   nrn =     
 316154839480

 ***********************************************************************************************************************

 dump no.   36 on file inpr     nps =   507168855     coll =    38611041479     ctm =    42015.54   nrn =     
 325453042150

 ***********************************************************************************************************************

 dump no.   37 on file inpr     nps =   521660553     coll =    39714132403     ctm =    43215.87   nrn =     
 334751231684

 ***********************************************************************************************************************

 dump no.   38 on file inpr     nps =   536120870     coll =    40817900923     ctm =    44416.37   nrn =     
 344053363371

 ***********************************************************************************************************************

 dump no.   39 on file inpr     nps =   550611161     coll =    41921036700     ctm =    45616.83   nrn =     
 353351348546

 ***********************************************************************************************************************

 dump no.   40 on file inpr     nps =   565113487     coll =    43023985989     ctm =    46817.18   nrn =     
 362648376968

 ***********************************************************************************************************************

 dump no.   41 on file inpr     nps =   579614833     coll =    44126599746     ctm =    48017.54   nrn =     
 371942284360

 ***********************************************************************************************************************

 dump no.   42 on file inpr     nps =   594126807     coll =    45229148494     ctm =    49217.92   nrn =     
 381236208751

 ***********************************************************************************************************************

 dump no.   43 on file inpr     nps =   608597601     coll =    46332289959     ctm =    50418.30   nrn =     
 390534459850

 ***********************************************************************************************************************

 dump no.   44 on file inpr     nps =   623120228     coll =    47434935971     ctm =    51618.82   nrn =     
 399829793025

 ***********************************************************************************************************************

 dump no.   45 on file inpr     nps =   637610519     coll =    48537585712     ctm =    52819.22   nrn =     
 409124468624

 ***********************************************************************************************************************

 dump no.   46 on file inpr     nps =   652095785     coll =    49639620080     ctm =    54019.53   nrn =     
 418414400296

 ***********************************************************************************************************************

 dump no.   47 on file inpr     nps =   666581428     coll =    50742294722     ctm =    55219.85   nrn =     
 427708680298

 ***********************************************************************************************************************

 dump no.   48 on file inpr     nps =   681061468     coll =    51845442145     ctm =    56420.21   nrn =     
 437006602219

 ***********************************************************************************************************************

 dump no.   49 on file inpr     nps =   695564824     coll =    52948241727     ctm =    57620.58   nrn =     
 446302397651

 ***********************************************************************************************************************

 dump no.   50 on file inpr     nps =   710044663     coll =    54051482941     ctm =    58820.93   nrn =     
 455601106061

 ***********************************************************************************************************************

 dump no.   51 on file inpr     nps =   724561235     coll =    55154060469     ctm =    60021.26   nrn =     
 464895795308

 ***********************************************************************************************************************

 dump no.   52 on file inpr     nps =   739059566     coll =    56257225023     ctm =    61221.62   nrn =     
 474195005382

 ***********************************************************************************************************************

 dump no.   53 on file inpr     nps =   753540209     coll =    57360007942     ctm =    62421.93   nrn =     
 483490795209

 ***********************************************************************************************************************

 dump no.   54 on file inpr     nps =   768048590     coll =    58463087824     ctm =    63622.26   nrn =     
 492788666377

 ***********************************************************************************************************************

 dump no.   55 on file inpr     nps =   782543705     coll =    59565995505     ctm =    64822.69   nrn =     
 502084704429

 ***********************************************************************************************************************

 dump no.   56 on file inpr     nps =   797038770     coll =    60669176449     ctm =    66023.03   nrn =     
 511383316673

 ***********************************************************************************************************************

 dump no.   57 on file inpr     nps =   811547151     coll =    61772220868     ctm =    67223.35   nrn =     
 520680271321

 ***********************************************************************************************************************

 dump no.   58 on file inpr     nps =   826036437     coll =    62875238781     ctm =    68423.92   nrn =     
 529978784030

 ***********************************************************************************************************************

 dump no.   59 on file inpr     nps =   840512859     coll =    63978178393     ctm =    69624.29   nrn =     
 539275664986

 ***********************************************************************************************************************

 dump no.   60 on file inpr     nps =   854991040     coll =    65080902364     ctm =    70824.70   nrn =     
 548570214879

 ***********************************************************************************************************************

 dump no.   61 on file inpr     nps =   869482939     coll =    66183573219     ctm =    72024.97   nrn =     
 557864899526

 ***********************************************************************************************************************

 dump no.   62 on file inpr     nps =   883975843     coll =    67286627697     ctm =    73225.41   nrn =     
 567162684913

 ***********************************************************************************************************************

 dump no.   63 on file inpr     nps =   898468747     coll =    68389965848     ctm =    74425.77   nrn =     
 576462582794

 ***********************************************************************************************************************

 dump no.   64 on file inpr     nps =   912942958     coll =    69492912256     ctm =    75626.14   nrn =     
 585758692696

 ***********************************************************************************************************************

 dump no.   65 on file inpr     nps =   927471188     coll =    70596002398     ctm =    76826.54   nrn =     
 595056479623

 ***********************************************************************************************************************

 dump no.   66 on file inpr     nps =   941966906     coll =    71699221706     ctm =    78026.95   nrn =     
 604355495442

 ***********************************************************************************************************************

 dump no.   67 on file inpr     nps =   956457800     coll =    72802664603     ctm =    79227.39   nrn =     
 613655961248

 ***********************************************************************************************************************

 dump no.   68 on file inpr     nps =   970957337     coll =    73904986550     ctm =    80427.77   nrn =     
 622947364806

 ***********************************************************************************************************************

 dump no.   69 on file inpr     nps =   985449588     coll =    75008427965     ctm =    81628.15   nrn =     
 632248046430

 ***********************************************************************************************************************

 dump no.   70 on file inpr     nps =   999942492     coll =    76111360218     ctm =    82828.58   nrn =     
 641545722801

 ***********************************************************************************************************************

 dump no.   71 on file inpr     nps =  1014470973     coll =    77213993285     ctm =    84028.98   nrn =     
 650841322623

 ***********************************************************************************************************************

 dump no.   72 on file inpr     nps =  1028963877     coll =    78317389042     ctm =    85229.33   nrn =     
 660140907799

 ***********************************************************************************************************************

 dump no.   73 on file inpr     nps =  1043472861     coll =    79420393885     ctm =    86429.69   nrn =     
 669438169720

 ***********************************************************************************************************************

 dump no.   74 on file inpr     nps =  1057984006     coll =    80522460395     ctm =    87629.97   nrn =     
 678727937281

 ***********************************************************************************************************************

 dump no.   75 on file inpr     nps =  1072481935     coll =    81624546060     ctm =    88830.26   nrn =     
 688018270811

 ***********************************************************************************************************************

 dump no.   76 on file inpr     nps =  1086997351     coll =    82727370964     ctm =    90030.65   nrn =     
 697314130426

 ***********************************************************************************************************************

 dump no.   77 on file inpr     nps =  1101429352     coll =    83831181387     ctm =    91230.97   nrn =     
 706616295156

 ***********************************************************************************************************************

 dump no.   78 on file inpr     nps =  1115880599     coll =    84938516665     ctm =    92431.31   nrn =     
 715947718524

 ***********************************************************************************************************************

 dump no.   79 on file inpr     nps =  1130395010     coll =    86041361571     ctm =    93631.61   nrn =     
 725243517637

 ***********************************************************************************************************************

 dump no.   80 on file inpr     nps =  1144886507     coll =    87144803929     ctm =    94831.96   nrn =     
 734543965145

 ***********************************************************************************************************************

 dump no.   81 on file inpr     nps =  1159339412     coll =    88246939389     ctm =    96032.26   nrn =     
 743833792079

 ***********************************************************************************************************************

 dump no.   82 on file inpr     nps =  1173861260     coll =    89349914572     ctm =    97232.62   nrn =     
 753131090941

 ***********************************************************************************************************************

 dump no.   83 on file inpr     nps =  1188358737     coll =    90453037852     ctm =    98433.02   nrn =     
 762429253348

 ***********************************************************************************************************************

 dump no.   84 on file inpr     nps =  1202849631     coll =    91556438391     ctm =    99633.35   nrn =     
 771729389498

 ***********************************************************************************************************************

 dump no.   85 on file inpr     nps =  1217334495     coll =    92659377141     ctm =   100833.80   nrn =     
 781026244205

 ***********************************************************************************************************************

 dump no.   86 on file inpr     nps =  1231787601     coll =    93762581783     ctm =   102034.08   nrn =     
 790324913742

 ***********************************************************************************************************************

 dump no.   87 on file inpr     nps =  1246304977     coll =    94865382477     ctm =   103234.48   nrn =     
 799620911000

 ***********************************************************************************************************************

 dump no.   88 on file inpr     nps =  1260816373     coll =    95967748235     ctm =   104434.78   nrn =     
 808913226293

 ***********************************************************************************************************************

 dump no.   89 on file inpr     nps =  1275314302     coll =    97070059070     ctm =   105635.01   nrn =     
 818205127137

 ***********************************************************************************************************************

 dump no.   90 on file inpr     nps =  1289852632     coll =    98172688316     ctm =   106835.38   nrn =     
 827500066020

 ***********************************************************************************************************************

 dump no.   91 on file inpr     nps =  1304340310     coll =    99275076569     ctm =   108035.78   nrn =     
 836791842880

 ***********************************************************************************************************************

 dump no.   92 on file inpr     nps =  1318843616     coll =   100377866458     ctm =   109236.12   nrn =     
 846087116835

 ***********************************************************************************************************************

 dump no.   93 on file inpr     nps =  1333341947     coll =   101480829217     ctm =   110436.41   nrn =     
 855384020814

 ***********************************************************************************************************************

 dump no.   94 on file inpr     nps =  1347818771     coll =   102584216340     ctm =   111636.75   nrn =     
 864683568547

 ***********************************************************************************************************************

 dump no.   95 on file inpr     nps =  1362314690     coll =   103686725514     ctm =   112837.01   nrn =     
 873977389254

 ***********************************************************************************************************************

 dump no.   96 on file inpr     nps =  1376799956     coll =   104789367656     ctm =   114037.44   nrn =     
 883271409273

 ***********************************************************************************************************************

 dump no.   97 on file inpr     nps =  1391307935     coll =   105892260052     ctm =   115237.86   nrn =     
 892567791403

 ***********************************************************************************************************************

 dump no.   98 on file inpr     nps =  1405810085     coll =   106994840796     ctm =   116438.15   nrn =     
 901861697279

 ***********************************************************************************************************************

 dump no.   99 on file inpr     nps =  1420307210     coll =   108097725158     ctm =   117638.52   nrn =     
 911158055682

 ***********************************************************************************************************************

 dump no.  100 on file inpr     nps =  1434797903     coll =   109200990730     ctm =   118838.85   nrn =     
 920457327811

 ***********************************************************************************************************************

 dump no.  101 on file inpr     nps =  1449313420     coll =   110303683998     ctm =   120039.12   nrn =     
 929752608032

 ***********************************************************************************************************************

 dump no.  102 on file inpr     nps =  1463841901     coll =   111406044538     ctm =   121239.53   nrn =     
 939045511117

 ***********************************************************************************************************************

 dump no.  103 on file inpr     nps =  1478265058     coll =   112509101199     ctm =   122439.85   nrn =     
 948342007079

 ***********************************************************************************************************************

 dump no.  104 on file inpr     nps =  1492753540     coll =   113611829285     ctm =   123640.13   nrn =     
 957637306258

 ***********************************************************************************************************************

 dump no.  105 on file inpr     nps =  1507237600     coll =   114715013352     ctm =   124840.48   nrn =     
 966935050745

 ***********************************************************************************************************************

 dump no.  106 on file inpr     nps =  1521750805     coll =   115818128266     ctm =   126040.90   nrn =     
 976232221404

 ***********************************************************************************************************************

 dump no.  107 on file inpr     nps =  1536224011     coll =   116921466064     ctm =   127241.32   nrn =     
 985532034043

 ***********************************************************************************************************************

 dump no.  108 on file inpr     nps =  1550727568     coll =   118024166137     ctm =   128441.65   nrn =     
 994828055509

 ***********************************************************************************************************************

 dump no.  109 on file inpr     nps =  1565228713     coll =   119126397541     ctm =   129642.10   nrn =    
 1004119885239

 ***********************************************************************************************************************

 dump no.  110 on file inpr     nps =  1579730361     coll =   120229272370     ctm =   130842.43   nrn =    
 1013416054037

 ***********************************************************************************************************************

 dump no.  111 on file inpr     nps =  1594233918     coll =   121332227335     ctm =   132042.74   nrn =    
 1022713576347

 ***********************************************************************************************************************

 dump no.  112 on file inpr     nps =  1608753756     coll =   122435217167     ctm =   133243.03   nrn =    
 1032010777129

 ***********************************************************************************************************************

 dump no.  113 on file inpr     nps =  1623257715     coll =   123537801947     ctm =   134443.30   nrn =    
 1041305047626

 ***********************************************************************************************************************

 dump no.  114 on file inpr     nps =  1637714439     coll =   124639610550     ctm =   135643.67   nrn =    
 1050591986112

 ***********************************************************************************************************************

 dump no.  115 on file inpr     nps =  1652203524     coll =   125742729750     ctm =   136844.08   nrn =    
 1059890171455

 ***********************************************************************************************************************

 dump no.  116 on file inpr     nps =  1666711704     coll =   126845151757     ctm =   138044.41   nrn =    
 1069182757026

 ***********************************************************************************************************************

 dump no.  117 on file inpr     nps =  1681224708     coll =   127947304997     ctm =   139244.78   nrn =    
 1078474069588

 ***********************************************************************************************************************

 dump no.  118 on file inpr     nps =  1695761832     coll =   129048834361     ctm =   140445.10   nrn =    
 1087760654353

 ***********************************************************************************************************************

 dump no.  119 on file inpr     nps =  1710256244     coll =   130151985502     ctm =   141645.60   nrn =    
 1097060073701

 ***********************************************************************************************************************

 dump no.  120 on file inpr     nps =  1724728847     coll =   131255024524     ctm =   142846.03   nrn =    
 1106358048817

 ***********************************************************************************************************************

 dump no.  121 on file inpr     nps =  1739205269     coll =   132357665920     ctm =   144046.49   nrn =    
 1115652416314

 ***********************************************************************************************************************

 dump no.  122 on file inpr     nps =  1753688525     coll =   133460672279     ctm =   145246.89   nrn =    
 1124949275488

 ***********************************************************************************************************************

 dump no.  123 on file inpr     nps =  1768176404     coll =   134563426710     ctm =   146447.26   nrn =    
 1134244628082

 ***********************************************************************************************************************

 dump no.  124 on file inpr     nps =  1782641771     coll =   135666387755     ctm =   147647.59   nrn =    
 1143541491331

 ***********************************************************************************************************************

 dump no.  125 on file inpr     nps =  1797116384     coll =   136769329980     ctm =   148848.02   nrn =    
 1152838553320

 ***********************************************************************************************************************

 dump no.  126 on file inpr     nps =  1811582555     coll =   137872175139     ctm =   150048.42   nrn =    
 1162134140787

 ***********************************************************************************************************************

 dump no.  127 on file inpr     nps =  1826065208     coll =   138974985087     ctm =   151248.76   nrn =    
 1171430454918

 ***********************************************************************************************************************

 dump no.  128 on file inpr     nps =  1840575298     coll =   140077568319     ctm =   152449.03   nrn =    
 1180724702980

 ***********************************************************************************************************************

 dump no.  129 on file inpr     nps =  1855108201     coll =   141180277014     ctm =   153649.37   nrn =    
 1190020736821

 ***********************************************************************************************************************

 dump no.  130 on file inpr     nps =  1869614773     coll =   142283217923     ctm =   154849.87   nrn =    
 1199317389407

 ***********************************************************************************************************************

 dump no.  131 on file inpr     nps =  1884077326     coll =   143385427715     ctm =   156050.15   nrn =    
 1208606649083

 ***********************************************************************************************************************

 dump no.  132 on file inpr     nps =  1898575657     coll =   144488525160     ctm =   157250.64   nrn =    
 1217904649034

 ***********************************************************************************************************************

 dump no.  133 on file inpr     nps =  1913072581     coll =   145591592672     ctm =   158450.94   nrn =    
 1227202148593

 ***********************************************************************************************************************

 dump no.  134 on file inpr     nps =  1927543375     coll =   146694315437     ctm =   159651.42   nrn =    
 1236497034020

 ***********************************************************************************************************************

 dump no.  135 on file inpr     nps =  1942023415     coll =   147796940758     ctm =   160851.76   nrn =    
 1245791832950

 ***********************************************************************************************************************

 dump no.  136 on file inpr     nps =  1956518329     coll =   148899934624     ctm =   162052.02   nrn =    
 1255089097625

 ***********************************************************************************************************************

 dump no.  137 on file inpr     nps =  1970997666     coll =   150003327199     ctm =   163252.41   nrn =    
 1264388794646

 ***********************************************************************************************************************

 dump no.  138 on file inpr     nps =  1985439918     coll =   151106493876     ctm =   164452.79   nrn =    
 1273686512724

 ***********************************************************************************************************************

 dump no.  139 on file inpr     nps =  1999936440     coll =   152209569685     ctm =   165653.13   nrn =    
 1282983566269

 ***********************************************************************************************************************

 dump no.  140 on file inpr     nps =  2014425525     coll =   153312529800     ctm =   166853.44   nrn =    
 1292283794908

 ***********************************************************************************************************************

 dump no.  141 on file inpr     nps =  2028911595     coll =   154415864151     ctm =   168053.78   nrn =    
 1301582885623

 ***********************************************************************************************************************

 dump no.  142 on file inpr     nps =  2043359073     coll =   155519305703     ctm =   169254.19   nrn =    
 1310882393777

 ***********************************************************************************************************************

 dump no.  143 on file inpr     nps =  2057856801     coll =   156623088907     ctm =   170455.45   nrn =    
 1320186823111

 ***********************************************************************************************************************

 dump no.  144 on file inpr     nps =  2072287797     coll =   157726261233     ctm =   171655.75   nrn =    
 1329485405734

 ***********************************************************************************************************************

 dump no.  145 on file inpr     nps =  2086743114     coll =   158829185709     ctm =   172856.13   nrn =    
 1338781211006

 ***********************************************************************************************************************

 dump no.  146 on file inpr     nps =  2101206371     coll =   159932119098     ctm =   174056.41   nrn =    
 1348077493578

 ***********************************************************************************************************************

 dump no.  147 on file inpr     nps =  2115679577     coll =   161035292838     ctm =   175256.79   nrn =    
 1357375631650

 ***********************************************************************************************************************

 dump no.  148 on file inpr     nps =  2130177707     coll =   162137315851     ctm =   176457.15   nrn =    
 1366665468641

 ***********************************************************************************************************************

 dump no.  149 on file inpr     nps =  2144682068     coll =   163240330136     ctm =   177657.60   nrn =    
 1375962505519

 ***********************************************************************************************************************

 dump no.  150 on file inpr     nps =  2159157686     coll =   164343544906     ctm =   178857.98   nrn =    
 1385261782474

 ***********************************************************************************************************************

 dump no.  151 on file inpr     nps =  2173670489     coll =   165446368268     ctm =   180058.31   nrn =    
 1394557805627

 ***********************************************************************************************************************

 dump no.  152 on file inpr     nps =  2188175855     coll =   166549235397     ctm =   181258.68   nrn =    
 1403854676359

 ***********************************************************************************************************************

 dump no.  153 on file inpr     nps =  2202675191     coll =   167652371977     ctm =   182459.07   nrn =    
 1413153342491

 ***********************************************************************************************************************

 dump no.  154 on file inpr     nps =  2217101162     coll =   168755464937     ctm =   183659.37   nrn =    
 1422450990400

 ***********************************************************************************************************************

 dump no.  155 on file inpr     nps =  2231610649     coll =   169858498065     ctm =   184859.68   nrn =    
 1431748411831

 ***********************************************************************************************************************

 dump no.  156 on file inpr     nps =  2246063956     coll =   170961728062     ctm =   186059.96   nrn =    
 1441047318303

 ***********************************************************************************************************************

 dump no.  157 on file inpr     nps =  2260394653     coll =   172066018543     ctm =   187260.33   nrn =    
 1450353333168

 ***********************************************************************************************************************

 dump no.  158 on file inpr     nps =  2274815800     coll =   173169320277     ctm =   188460.67   nrn =    
 1459652130438

 ***********************************************************************************************************************

 dump no.  159 on file inpr     nps =  2289321367     coll =   174271779167     ctm =   189661.06   nrn =    
 1468944711853

 ***********************************************************************************************************************

 dump no.  160 on file inpr     nps =  2303835778     coll =   175374040169     ctm =   190861.38   nrn =    
 1478236913786

 ***********************************************************************************************************************

 dump no.  161 on file inpr     nps =  2318338933     coll =   176477073221     ctm =   192061.86   nrn =    
 1487534837492

 ***********************************************************************************************************************

 dump no.  162 on file inpr     nps =  2332825204     coll =   177579984647     ctm =   193262.15   nrn =    
 1496831768531

 ***********************************************************************************************************************

 dump no.  163 on file inpr     nps =  2347345243     coll =   178682814356     ctm =   194462.66   nrn =    
 1506128741826

 ***********************************************************************************************************************

 dump no.  164 on file inpr     nps =  2361848700     coll =   179785758113     ctm =   195662.97   nrn =    
 1515426039907

 ***********************************************************************************************************************

 dump no.  165 on file inpr     nps =  2376364719     coll =   180888611526     ctm =   196863.40   nrn =    
 1524723072562

 ***********************************************************************************************************************

 dump no.  166 on file inpr     nps =  2390884557     coll =   181991409536     ctm =   198063.74   nrn =    
 1534019748282

 ***********************************************************************************************************************

 dump no.  167 on file inpr     nps =  2405385501     coll =   183094585408     ctm =   199264.05   nrn =    
 1543318618404
1problem summary                                                                                                           

      run terminated when it had used*****  minutes of computer time.
+                                                                                                    08/06/17 17:13:39 
      c //-------------------------------------------------------------------------//      probid =  08/06/17 08:53:04 

 neutron creation    tracks      weight        energy            neutron loss        tracks      weight        energy
                                 (per source particle)                                           (per source particle)

 source          2414284173    1.0000E+00    1.4100E+01          escape          7276385597    1.0345E+00    9.1738E+00
 nucl. interaction        0    0.            0.                  energy cutoff            0    0.            0.        
 particle decay           0    0.            0.                  time cutoff        1256596    9.3137E-05    4.7418E-05
 weight window  11370131602    3.0847E-01    1.9911E-01          weight window   7125502409    3.0850E-01    1.9907E-01
 cell importance          0    0.            0.                  cell importance          0    0.            0.        
 weight cutoff            0    0.            0.                  weight cutoff            0    0.            0.        
 e or t importance        0    0.            0.                  e or t importance        0    0.            0.        
 dxtran                   0    0.            0.                  dxtran                   0    0.            0.        
 forced collisions        0    0.            0.                  forced collisions        0    0.            0.        
 exp. transform           0    0.            0.                  exp. transform           0    0.            0.        
 upscattering             0    0.            1.0952E-10          downscattering           0    0.            2.7787E+00
 photonuclear             0    0.            0.                  capture                 54    8.3945E-02    9.0226E-01
 (n,xn)           968132479    2.1741E-01    2.5677E-01          loss to (n,xn)   484052900    1.0870E-01    1.5251E+00
 prompt fission   215585284    1.5897E-02    3.2570E-02          loss to fission   82276798    6.1106E-03    9.4898E-03
 delayed fission    1340816    9.9359E-05    5.0719E-05          nucl. interaction        0    0.            0.        
 prompt photofis          0    0.            0.                  particle decay           0    0.            0.        
 tabular boundary         0    0.            0.                  tabular boundary         0    0.            0.        
 tabular sampling         0    0.            0.                  elastic scatter          0    0.            0.        
     total      14969474354    1.5419E+00    1.4588E+01              total      14969474354    1.5419E+00    1.4588E+01

   number of neutrons banked             -1224788257        average time of (shakes)              cutoffs
   neutron tracks per source particle     6.2004E+00          escape            5.0002E+06          tco   2.0000E+07
   neutron collisions per source particle 7.6118E+01          capture           5.0004E+06          eco   0.0000E+00
   total neutron collisions              -2147483648          capture or escape 5.0002E+06          wc1  -5.0000E-01
   net multiplication              1.1186E+00 0.0000          any termination   4.6119E+06          wc2  -2.5000E-01

 computer time so far in this run200004.41 minutes            maximum number ever in bank        68
 computer time in mcrun          200000.41 minutes            bank overflows to backup file       0
 source particles per minute            1.2071E+04
 random numbers generated            1549022907149            most random numbers used was    79181614 in history    42779399
 
  warning.   random number stride   152917 exceeded   102835 times.
 
  warning.  random number period exceeded.  decrease stride.

 range of sampled source weights = 9.9018E-01 to 1.0100E+00

 neutron reaction mt loop failed   1 times.

 number of histories processed by each thread
   113875963   121081177   121332760   121054464   121063943   121378317   121078023   121411480   120905284   121448908
   121030361   119571092   120652117   121586698   121150480   121200222   121623650   121035474   120987509   120816251
 
  warning.  some of the geometry is covered by a weight window mesh.
1neutron  activity in each cell                                                                         print table 126

                       tracks     population   collisions   collisions     number        flux        average      average
              cell    entering                               * weight     weighted     weighted   track weight   track mfp
                                                          (per history)    energy       energy     (relative)      (cm)

        1        1  8509796603   7668707205     40008536    4.5932E-03   3.1297E+00   9.8499E+00   4.3122E-01   1.1378E+04
        2        2  8632759169   7565424393  15912819716    1.3443E+00   1.0680E+00   6.2890E+00   2.6097E-01   4.2412E+00
        3        3  3703882536  11342723544 167293130725    5.1125E+00   1.4668E-01   2.0227E+00   7.9344E-02   7.9500E+00
        4        4    98541649    224868663    522000974    3.9545E-02   6.6497E-01   1.4934E+00   1.7336E-01   2.5996E+00
        5       10   150951834    194179113       418009    2.5431E-07   3.9080E-02   2.5922E-01   1.5050E-03   5.3143E+03
        6       11   223503110    265905998       546734    3.5964E-07   5.0581E-02   3.2929E-01   1.6272E-03   5.5843E+03
        7       12   532599535    635873478      1338852    8.5976E-07   4.0045E-02   2.8393E-01   1.5816E-03   5.3964E+03
        8       13   219343567    261981635       537630    3.5967E-07   5.0568E-02   3.2939E-01   1.6544E-03   5.5843E+03
        9       14   278240226    309520643       624068    4.5438E-07   5.7030E-02   3.4850E-01   1.7990E-03   5.6926E+03

           total   22349618229  28469184672 183771425244    6.5010E+00

1tally        4        nps =  2414284173
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      10                                                                                   
                         4.00000E+03
 
 cell  10                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 2.92037E-07 0.0002   6.65461E-12 0.0383   3.12224E-12 0.0665   3.44639E-12 0.0588   3.20677E-12 0.0659
 
         time:       2.0000E+07             total                                                                  
                 3.29461E-12 0.0639   2.92056E-07 0.0002


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally        4

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00      yes         yes            constant    random       2.14
 passed?        yes          yes      yes          yes             yes      yes         yes               yes        yes          no

 ===================================================================================================================================


 warning.  the tally in the tally fluctuation chart bin did not pass  1 of the 10 statistical checks.

1analysis of the results in the tally fluctuation chart bin (tfc) for tally        4 with nps =  2414284173  print table 160


 normed average tally per history  = 2.92056E-07          unnormed average tally per history  = 1.16823E-03
 estimated tally relative error    = 0.0002               estimated variance of the variance  = 0.0025
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0002

 number of nonzero history tallies =    51014521          efficiency for the nonzero tallies  = 0.0211
 history number of largest  tally  =    42779399          largest  unnormalized history tally = 1.13902E+02
 (largest  tally)/(average tally)  = 9.75002E+04          (largest  tally)/(avg nonzero tally)= 2.06021E+03

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 2.92057E-07


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            2.92056E-07             2.92068E-07                     0.000040
      relative error                  2.18143E-04             2.21841E-04                     0.016951
      variance of the variance        2.51745E-03             3.45140E-03                     0.370993
      shifted center                  2.92057E-07             2.92057E-07                     0.000001
      figure of merit                 1.05072E+02             1.01598E+02                    -0.033058

 the estimated inverse power slope of the 200 largest  tallies starting at 4.75012E+00 is 2.1411
 the history score probability density function appears to have an unsampled region at the largest  history scores:
 please examine. see print table 161.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (1.207E+04)*( 9.330E-02)**2 = (1.207E+04)*(8.704E-03) = 1.051E+02

1unnormed tally density for tally        4          nonzero tally mean(m) = 5.529E-02   nps =  2414284173  print table 161

 abscissa              ordinate   log plot of tally probability density function in tally fluctuation chart bin(d=decade,slope= 2.1)
  tally  number num den log den:d--------d--------d---------d--------d---------d---------d--------d---------d---------d--------d----
 1.00-08      4 4.49-01  -0.348 *********|********|*********|********|*********|*********|********|*********|*********|********|****
 1.58-08      3 2.12-01  -0.673 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 2.51-08      2 8.94-02  -1.049 *********|********|*********|********|*********|*********|********|*********|*********|******  |    
 3.98-08      8 2.26-01  -0.647 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 6.31-08     16 2.85-01  -0.546 *********|********|*********|********|*********|*********|********|*********|*********|********|**  
 1.00-07     19 2.13-01  -0.671 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 1.58-07     29 2.05-01  -0.687 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 2.51-07     52 2.32-01  -0.634 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 3.98-07     90 2.54-01  -0.596 *********|********|*********|********|*********|*********|********|*********|*********|********|**  
 6.31-07    113 2.01-01  -0.697 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 1.00-06    159 1.78-01  -0.748 *********|********|*********|********|*********|*********|********|*********|*********|********|    
 1.58-06    306 2.17-01  -0.664 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 2.51-06    479 2.14-01  -0.670 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 3.98-06    774 2.18-01  -0.661 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 6.31-06   1201 2.14-01  -0.670 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 1.00-05   1869 2.10-01  -0.678 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 1.58-05   2905 2.06-01  -0.687 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 2.51-05   4834 2.16-01  -0.666 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 3.98-05   7461 2.10-01  -0.677 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 6.31-05  11985 2.13-01  -0.671 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 1.00-04  19008 2.13-01  -0.671 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 1.58-04  30178 2.14-01  -0.670 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 2.51-04  47577 2.13-01  -0.672 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 3.98-04  75187 2.12-01  -0.674 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 6.31-04 119130 2.12-01  -0.674 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 1.00-03 187873 2.11-01  -0.676 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 1.58-03 296820 2.10-01  -0.677 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 2.51-03 470708 2.10-01  -0.677 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 3.98-03 743315 2.10-01  -0.679 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 6.31-03 1.2+06 2.11-01  -0.676 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 1.00-02 1.9+06 2.19-01  -0.660 *********|********|*********|********|*********|*********|********|*********|*********|********|*   
 1.58-02 3.9+06 2.79-01  -0.554 *********|********|*********|********|*********|*********|********|*********|*********|********|**  
 2.51-02 6.9+06 3.07-01  -0.513 *********|********|*********|********|*********|*********|********|*********|*********|********|**  
 3.98-02 9.4+06 2.64-01  -0.579 *********|********|*********|********|*********|*********|********|*********|*********|********|**  
 6.31-02 1.0+07 1.79-01  -0.747 mmmmmmmmm|mmmmmmmm|mmmmmmmmm|mmmmmmmm|mmmmmmmmm|mmmmmmmmm|mmmmmmmm|mmmmmmmmm|mmmmmmmmm|mmmmmmmm|    
 1.00-01 8.3+06 9.37-02  -1.028 *********|********|*********|********|*********|*********|********|*********|*********|******  |    
 1.58-01 5.0+06 3.52-02  -1.453 *********|********|*********|********|*********|*********|********|*********|*********|**      |    
 2.51-01 1.8+06 8.05-03  -2.094 *********|********|*********|********|*********|*********|********|*********|******   |        |    
 3.98-01 413429 1.17-03  -2.933 *********|********|*********|********|*********|*********|********|******** |         |        |    
 6.31-01  68371 1.22-04  -3.915 *********|********|*********|********|*********|*********|********|         |         |        |    
 1.00+00  12247 1.37-05  -4.862 *********|********|*********|********|*********|*********|        |         |         |        |    
 1.58+00   2940 2.08-06  -5.682 *********|********|*********|********|*********|*        |        |         |         |        |    
 2.51+00    883 3.95-07  -6.404 *********|********|*********|********|****     |         |        |         |         |        |    
 3.98+00    302 8.51-08  -7.070 *********|********|*********|******  |         |         |        |         |         |        |    
 6.31+00    154 2.74-08  -7.562 *********|********|*********|**      |  s      |         |        |         |         |        |    
 1.00+01     49 5.50-09  -8.260 *********|********|*****    |        s         |         |        |         |         |        |    
 1.58+01     30 2.12-09  -8.673 *********|********|*        |     s  |         |         |        |         |         |        |    
 2.51+01     11 4.92-10  -9.308 *********|****    |         | s      |         |         |        |         |         |        |    
 3.98+01     12 3.38-10  -9.471 *********|**      |        s|        |         |         |        |         |         |        |    
 6.31+01      4 7.12-11 -10.148 ******   |        |    s    |        |         |         |        |         |         |        |    
 1.00+02      2 2.24-11 -10.649 *        |        |s        |        |         |         |        |         |         |        |    
 1.26+02      2 3.20-11 -10.495 **       |      s |         |        |         |         |        |         |         |        |    
  total 5.10+07 2.11-02         d--------d--------d---------d--------d---------d---------d--------d---------d---------d--------d----

1tally       14        nps =  2414284173
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      11                                                                                   
                         4.00000E+03
 
 cell  11                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 4.30543E-07 0.0002   1.07149E-11 0.0352   5.75077E-12 0.0555   6.07845E-12 0.0556   5.63857E-12 0.0584
 
         time:       2.0000E+07             total                                                                  
                 5.30888E-12 0.0577   4.30576E-07 0.0002


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       14

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.02       no          no            constant    random       2.17
 passed?        yes          yes      yes          yes             yes       no          no               yes        yes          no

 ===================================================================================================================================


 warning.  the tally in the tally fluctuation chart bin did not pass  3 of the 10 statistical checks.

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       14 with nps =  2414284173  print table 160


 normed average tally per history  = 4.30576E-07          unnormed average tally per history  = 1.72231E-03
 estimated tally relative error    = 0.0002               estimated variance of the variance  = 0.0222
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0002

 number of nonzero history tallies =    65131481          efficiency for the nonzero tallies  = 0.0270
 history number of largest  tally  =  1621837713          largest  unnormalized history tally = 3.40863E+02
 (largest  tally)/(average tally)  = 1.97911E+05          (largest  tally)/(avg nonzero tally)= 5.33914E+03

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 4.30580E-07


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            4.30576E-07             4.30612E-07                     0.000082
      relative error                  2.23404E-04             2.37949E-04                     0.065108
      variance of the variance        2.21628E-02             3.12961E-02                     0.412102
      shifted center                  4.30580E-07             4.30582E-07                     0.000004
      figure of merit                 1.00182E+02             8.83083E+01                    -0.118519

 the estimated inverse power slope of the 200 largest  tallies starting at 7.99410E+00 is 2.1701
 the history score probability density function appears to have an unsampled region at the largest  history scores:
 please examine. see print table 161.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (1.207E+04)*( 9.110E-02)**2 = (1.207E+04)*(8.299E-03) = 1.002E+02

1unnormed tally density for tally       14          nonzero tally mean(m) = 6.384E-02   nps =  2414284173  print table 161

 abscissa              ordinate   log plot of tally probability density function in tally fluctuation chart bin(d=decade,slope= 2.2)
  tally  number num den log den:d------d-------d-------d------d-------d-------d-------d-------d-------d------d-------d-------d------
 3.98-11      1 2.09+01   1.319 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|*******|******
 7.94-11      0 0.00+00   0.000        |       |       |      |       |       |       |       |       |      |       |       |      
 1.58-10      0 0.00+00   0.000        |       |       |      |       |       |       |       |       |      |       |       |      
 3.16-10      0 0.00+00   0.000        |       |       |      |       |       |       |       |       |      |       |       |      
 6.31-10      1 1.32+00   0.119 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|*****  |      
 1.26-09      0 0.00+00   0.000        |       |       |      |       |       |       |       |       |      |       |       |      
 2.51-09      2 6.61-01  -0.180 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|**     |      
 5.01-09      2 3.31-01  -0.480 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 1.00-08      2 1.66-01  -0.780 *******|*******|*******|******|*******|*******|*******|*******|*******|******|****** |       |      
 2.00-08      6 2.50-01  -0.603 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 3.98-08     15 3.13-01  -0.505 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 7.94-08     13 1.36-01  -0.867 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*****  |       |      
 1.58-07     37 1.94-01  -0.713 *******|*******|*******|******|*******|*******|*******|*******|*******|******|****** |       |      
 3.16-07     77 2.02-01  -0.694 *******|*******|*******|******|*******|*******|*******|*******|*******|******|****** |       |      
 6.31-07    196 2.58-01  -0.588 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 1.26-06    352 2.32-01  -0.634 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 2.51-06    690 2.28-01  -0.642 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 5.01-06   1394 2.31-01  -0.636 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 1.00-05   2727 2.26-01  -0.645 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 2.00-05   5461 2.27-01  -0.643 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 3.98-05  10915 2.28-01  -0.643 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 7.94-05  22428 2.34-01  -0.630 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 1.58-04  43937 2.30-01  -0.638 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 3.16-04  88554 2.33-01  -0.634 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 6.31-04 175796 2.31-01  -0.636 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 1.26-03 347536 2.29-01  -0.640 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 2.51-03 695208 2.30-01  -0.639 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 5.01-03 1.4+06 2.31-01  -0.637 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 1.00-02 2.9+06 2.38-01  -0.623 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 2.00-02 8.0+06 3.33-01  -0.478 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 3.98-02 1.5+07 3.19-01  -0.496 *******|*******|*******|******|*******|*******|*******|*******|*******|******|*******|       |      
 7.94-02 1.9+07 1.96-01  -0.707 mmmmmmm|mmmmmmm|mmmmmmm|mmmmmm|mmmmmmm|mmmmmmm|mmmmmmm|mmmmmmm|mmmmmmm|mmmmmm|mmmmmm |       |      
 1.58-01 1.3+07 6.76-02  -1.170 *******|*******|*******|******|*******|*******|*******|*******|*******|******|**     |       |      
 3.16-01 3.9+06 1.04-02  -1.985 *******|*******|*******|******|*******|*******|*******|*******|*******|***   |       |       |      
 6.31-01 484384 6.37-04  -3.196 *******|*******|*******|******|*******|*******|*******|*******|**     |      |       |       |      
 1.26+00  43341 2.86-05  -4.544 *******|*******|*******|******|*******|*******|*******|       |       |      |       |       |      
 2.51+00   5521 1.83-06  -5.739 *******|*******|*******|******|*******|****** |       |       |       |      |       |       |      
 5.01+00   1031 1.71-07  -6.767 *******|*******|*******|******|****** |       |       |       |       |      |       |       |      
 1.00+01    282 2.34-08  -7.630 *******|*******|*******|******|       |s      |       |       |       |      |       |       |      
 2.00+01     83 3.45-09  -8.462 *******|*******|*******|      |     s |       |       |       |       |      |       |       |      
 3.98+01     28 5.84-10  -9.234 *******|*******|*      |      | s     |       |       |       |       |      |       |       |      
 7.94+01     14 1.46-10  -9.835 *******|****   |       |   s  |       |       |       |       |       |      |       |       |      
 1.58+02      4 2.10-11 -10.679 ****** |       |      s|      |       |       |       |       |       |      |       |       |      
 3.16+02      2 5.25-12 -11.280 *      |       | s     |      |       |       |       |       |       |      |       |       |      
 3.98+02      1 5.06-12 -11.296 *      |      s|       |      |       |       |       |       |       |      |       |       |      
  total 6.51+07 2.70-02         d------d-------d-------d------d-------d-------d-------d-------d-------d------d-------d-------d------

1tally       24        nps =  2414284173
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      12                                                                                   
                         4.00000E+03
 
 cell  12                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 9.92704E-07 0.0002   2.85539E-11 0.0272   1.53029E-11 0.0530   1.56234E-11 0.0452   1.47815E-11 0.0504
 
         time:       2.0000E+07             total                                                                  
                 1.40078E-11 0.0472   9.92792E-07 0.0002


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       24

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.02      yes         yes            constant    random       2.14
 passed?        yes          yes      yes          yes             yes      yes         yes               yes        yes          no

 ===================================================================================================================================


 warning.  the tally in the tally fluctuation chart bin did not pass  1 of the 10 statistical checks.

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       24 with nps =  2414284173  print table 160


 normed average tally per history  = 9.92792E-07          unnormed average tally per history  = 3.97117E-03
 estimated tally relative error    = 0.0002               estimated variance of the variance  = 0.0171
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0002

 number of nonzero history tallies =   130800183          efficiency for the nonzero tallies  = 0.0542
 history number of largest  tally  =    42779399          largest  unnormalized history tally = 5.07616E+02
 (largest  tally)/(average tally)  = 1.27825E+05          (largest  tally)/(avg nonzero tally)= 6.92527E+03

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 9.92799E-07


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            9.92792E-07             9.92844E-07                     0.000053
      relative error                  1.79753E-04             1.87378E-04                     0.042421
      variance of the variance        1.70678E-02             2.08244E-02                     0.220095
      shifted center                  9.92799E-07             9.92800E-07                     0.000002
      figure of merit                 1.54745E+02             1.42407E+02                    -0.079733

 the estimated inverse power slope of the 200 largest  tallies starting at 1.90849E+01 is 2.1433
 the large score tail of the empirical history score probability density function appears to have no unsampled regions.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (1.207E+04)*( 1.132E-01)**2 = (1.207E+04)*(1.282E-02) = 1.547E+02

1unnormed tally density for tally       24          nonzero tally mean(m) = 7.330E-02   nps =  2414284173  print table 161

 abscissa              ordinate   log plot of tally probability density function in tally fluctuation chart bin(d=decade,slope= 2.1)
  tally  number num den log den:d-------d-------d--------d--------d-------d--------d--------d-------d--------d--------d--------d----
 1.58-09      1 7.08-01  -0.150 ********|*******|********|********|*******|********|********|*******|********|********|********|*** 
 2.51-09      1 4.47-01  -0.350 ********|*******|********|********|*******|********|********|*******|********|********|********|*   
 3.98-09      0 0.00+00   0.000         |       |        |        |       |        |        |       |        |        |        |    
 6.31-09      5 8.89-01  -0.051 ********|*******|********|********|*******|********|********|*******|********|********|********|****
 1.00-08      4 4.49-01  -0.348 ********|*******|********|********|*******|********|********|*******|********|********|********|*   
 1.58-08      8 5.67-01  -0.247 ********|*******|********|********|*******|********|********|*******|********|********|********|**  
 2.51-08      6 2.68-01  -0.572 ********|*******|********|********|*******|********|********|*******|********|********|********|    
 3.98-08     15 4.23-01  -0.374 ********|*******|********|********|*******|********|********|*******|********|********|********|*   
 6.31-08     22 3.91-01  -0.407 ********|*******|********|********|*******|********|********|*******|********|********|********|*   
 1.00-07     30 3.37-01  -0.473 ********|*******|********|********|*******|********|********|*******|********|********|********|    
 1.58-07     35 2.48-01  -0.606 ********|*******|********|********|*******|********|********|*******|********|********|********|    
 2.51-07     78 3.49-01  -0.458 ********|*******|********|********|*******|********|********|*******|********|********|********|    
 3.98-07    128 3.61-01  -0.443 ********|*******|********|********|*******|********|********|*******|********|********|********|*   
 6.31-07    187 3.33-01  -0.478 ********|*******|********|********|*******|********|********|*******|********|********|********|    
 1.00-06    282 3.17-01  -0.500 ********|*******|********|********|*******|********|********|*******|********|********|********|    
 1.58-06    522 3.70-01  -0.432 ********|*******|********|********|*******|********|********|*******|********|********|********|*   
 2.51-06    792 3.54-01  -0.451 ********|*******|********|********|*******|********|********|*******|********|********|********|*   
 3.98-06   1265 3.57-01  -0.448 ********|*******|********|********|*******|********|********|*******|********|********|********|*   
 6.31-06   1976 3.51-01  -0.454 ********|*******|********|********|*******|********|********|*******|********|********|********|    
 1.00-05   3183 3.57-01  -0.447 ********|*******|********|********|*******|********|********|*******|********|********|********|*   
 1.58-05   5153 3.65-01  -0.438 ********|*******|********|********|*******|********|********|*******|********|********|********|*   
 2.51-05   8063 3.60-01  -0.443 ********|*******|********|********|*******|********|********|*******|********|********|********|*   
 3.98-05  12806 3.61-01  -0.442 ********|*******|********|********|*******|********|********|*******|********|********|********|*   
 6.31-05  20227 3.60-01  -0.444 ********|*******|********|********|*******|********|********|*******|********|********|********|*   
 1.00-04  31894 3.58-01  -0.446 ********|*******|********|********|*******|********|********|*******|********|********|********|*   
 1.58-04  50890 3.60-01  -0.443 ********|*******|********|********|*******|********|********|*******|********|********|********|*   
 2.51-04  80768 3.61-01  -0.443 ********|*******|********|********|*******|********|********|*******|********|********|********|*   
 3.98-04 127453 3.59-01  -0.445 ********|*******|********|********|*******|********|********|*******|********|********|********|*   
 6.31-04 202616 3.60-01  -0.443 ********|*******|********|********|*******|********|********|*******|********|********|********|*   
 1.00-03 320746 3.60-01  -0.444 ********|*******|********|********|*******|********|********|*******|********|********|********|*   
 1.58-03 508433 3.60-01  -0.444 ********|*******|********|********|*******|********|********|*******|********|********|********|*   
 2.51-03 811130 3.62-01  -0.441 ********|*******|********|********|*******|********|********|*******|********|********|********|*   
 3.98-03 1.3+06 3.66-01  -0.437 ********|*******|********|********|*******|********|********|*******|********|********|********|*   
 6.31-03 2.1+06 3.72-01  -0.429 ********|*******|********|********|*******|********|********|*******|********|********|********|*   
 1.00-02 3.5+06 3.91-01  -0.408 ********|*******|********|********|*******|********|********|*******|********|********|********|*   
 1.58-02 7.3+06 5.20-01  -0.284 ********|*******|********|********|*******|********|********|*******|********|********|********|**  
 2.51-02 1.4+07 6.27-01  -0.203 ********|*******|********|********|*******|********|********|*******|********|********|********|*** 
 3.98-02 2.1+07 5.82-01  -0.235 ********|*******|********|********|*******|********|********|*******|********|********|********|**  
 6.31-02 2.5+07 4.44-01  -0.352 ********|*******|********|********|*******|********|********|*******|********|********|********|*   
 1.00-01 2.4+07 2.75-01  -0.561 mmmmmmmm|mmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmm|    
 1.58-01 1.8+07 1.27-01  -0.895 ********|*******|********|********|*******|********|********|*******|********|********|******  |    
 2.51-01 8.8+06 3.94-02  -1.405 ********|*******|********|********|*******|********|********|*******|********|********|*       |    
 3.98-01 2.7+06 7.49-03  -2.125 ********|*******|********|********|*******|********|********|*******|********|****    |        |    
 6.31-01 574045 1.02-03  -2.991 ********|*******|********|********|*******|********|********|*******|*****   |        |        |    
 1.00+00 151101 1.70-04  -3.771 ********|*******|********|********|*******|********|********|*******|        |        |        |    
 1.58+00  50424 3.57-05  -4.447 ********|*******|********|********|*******|********|********|*      |        |        |        |    
 2.51+00  15317 6.84-06  -5.165 ********|*******|********|********|*******|********|****    |       |        |        |        |    
 3.98+00   4492 1.27-06  -5.897 ********|*******|********|********|*******|******  |        |       |        |        |        |    
 6.31+00   1477 2.63-07  -6.580 ********|*******|********|********|*******|        |        |       |        |        |        |    
 1.00+01    568 6.38-08  -7.196 ********|*******|********|********|***    |        |        |       |        |        |        |    
 1.58+01    196 1.39-08  -7.858 ********|*******|********|******  |       |        |        |       |        |        |        |    
 2.51+01    143 6.39-09  -8.195 ********|*******|********|***     |   s   |        |        |       |        |        |        |    
 3.98+01     68 1.92-09  -8.717 ********|*******|********|        |s      |        |        |       |        |        |        |    
 6.31+01     18 3.20-10  -9.495 ********|*******|*       |       s|       |        |        |       |        |        |        |    
 1.00+02     16 1.80-10  -9.746 ********|*******|        |   s    |       |        |        |       |        |        |        |    
 1.58+02      9 6.37-11 -10.196 ********|***    |        |s       |       |        |        |       |        |        |        |    
 2.51+02      7 3.13-11 -10.505 ********|       |      s |        |       |        |        |       |        |        |        |    
 3.98+02      3 8.46-12 -11.073 ****    |       |  s     |        |       |        |        |       |        |        |        |    
 6.31+02      2 3.56-12 -11.449 *       |      s|        |        |       |        |        |       |        |        |        |    
  total 1.31+08 5.42-02         d-------d-------d--------d--------d-------d--------d--------d-------d--------d--------d--------d----

1tally       34        nps =  2414284173
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      13                                                                                   
                         4.00000E+03
 
 cell  13                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 4.30571E-07 0.0002   9.82454E-12 0.0372   5.86400E-12 0.0594   5.77759E-12 0.0540   5.62638E-12 0.0575
 
         time:       2.0000E+07             total                                                                  
                 5.23666E-12 0.0586   4.30603E-07 0.0002


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       34

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.00      yes         yes            constant    random       2.22
 passed?        yes          yes      yes          yes             yes      yes         yes               yes        yes          no

 ===================================================================================================================================


 warning.  the tally in the tally fluctuation chart bin did not pass  1 of the 10 statistical checks.

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       34 with nps =  2414284173  print table 160


 normed average tally per history  = 4.30603E-07          unnormed average tally per history  = 1.72241E-03
 estimated tally relative error    = 0.0002               estimated variance of the variance  = 0.0041
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0002

 number of nonzero history tallies =    64292444          efficiency for the nonzero tallies  = 0.0266
 history number of largest  tally  =    42779399          largest  unnormalized history tally = 1.77245E+02
 (largest  tally)/(average tally)  = 1.02905E+05          (largest  tally)/(avg nonzero tally)= 2.74036E+03

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 4.30604E-07


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            4.30603E-07             4.30622E-07                     0.000043
      relative error                  2.07798E-04             2.12115E-04                     0.020776
      variance of the variance        4.06793E-03             5.37618E-03                     0.321601
      shifted center                  4.30604E-07             4.30605E-07                     0.000001
      figure of merit                 1.15794E+02             1.11128E+02                    -0.040293

 the estimated inverse power slope of the 200 largest  tallies starting at 7.83369E+00 is 2.2189
 the large score tail of the empirical history score probability density function appears to have no unsampled regions.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (1.207E+04)*( 9.794E-02)**2 = (1.207E+04)*(9.592E-03) = 1.158E+02

1unnormed tally density for tally       34          nonzero tally mean(m) = 6.468E-02   nps =  2414284173  print table 161

 abscissa              ordinate   log plot of tally probability density function in tally fluctuation chart bin(d=decade,slope= 2.2)
  tally  number num den log den:d-------d---------d--------d--------d--------d---------d--------d--------d--------d---------d-------
 2.00-09      1 5.63-01  -0.250 ********|*********|********|********|********|*********|********|********|********|*********|*******
 3.16-09      1 3.55-01  -0.450 ********|*********|********|********|********|*********|********|********|********|*********|*****  
 5.01-09      1 2.24-01  -0.650 ********|*********|********|********|********|*********|********|********|********|*********|***    
 7.94-09      0 0.00+00   0.000         |         |        |        |        |         |        |        |        |         |       
 1.26-08      3 2.67-01  -0.573 ********|*********|********|********|********|*********|********|********|********|*********|****   
 2.00-08      4 2.25-01  -0.648 ********|*********|********|********|********|*********|********|********|********|*********|***    
 3.16-08      6 2.13-01  -0.672 ********|*********|********|********|********|*********|********|********|********|*********|***    
 5.01-08      9 2.02-01  -0.696 ********|*********|********|********|********|*********|********|********|********|*********|***    
 7.94-08     25 3.53-01  -0.452 ********|*********|********|********|********|*********|********|********|********|*********|*****  
 1.26-07     32 2.85-01  -0.545 ********|*********|********|********|********|*********|********|********|********|*********|****   
 2.00-07     46 2.59-01  -0.587 ********|*********|********|********|********|*********|********|********|********|*********|****   
 3.16-07     52 1.85-01  -0.734 ********|*********|********|********|********|*********|********|********|********|*********|***    
 5.01-07    117 2.62-01  -0.582 ********|*********|********|********|********|*********|********|********|********|*********|****   
 7.94-07    167 2.36-01  -0.627 ********|*********|********|********|********|*********|********|********|********|*********|****   
 1.26-06    265 2.36-01  -0.627 ********|*********|********|********|********|*********|********|********|********|*********|****   
 2.00-06    378 2.13-01  -0.672 ********|*********|********|********|********|*********|********|********|********|*********|***    
 3.16-06    654 2.32-01  -0.634 ********|*********|********|********|********|*********|********|********|********|*********|***    
 5.01-06   1027 2.30-01  -0.638 ********|*********|********|********|********|*********|********|********|********|*********|***    
 7.94-06   1658 2.34-01  -0.630 ********|*********|********|********|********|*********|********|********|********|*********|***    
 1.26-05   2598 2.32-01  -0.635 ********|*********|********|********|********|*********|********|********|********|*********|***    
 2.00-05   4059 2.28-01  -0.641 ********|*********|********|********|********|*********|********|********|********|*********|***    
 3.16-05   6271 2.23-01  -0.653 ********|*********|********|********|********|*********|********|********|********|*********|***    
 5.01-05  10052 2.25-01  -0.648 ********|*********|********|********|********|*********|********|********|********|*********|***    
 7.94-05  15855 2.24-01  -0.650 ********|*********|********|********|********|*********|********|********|********|*********|***    
 1.26-04  25405 2.26-01  -0.645 ********|*********|********|********|********|*********|********|********|********|*********|***    
 2.00-04  40196 2.26-01  -0.646 ********|*********|********|********|********|*********|********|********|********|*********|***    
 3.16-04  63860 2.27-01  -0.645 ********|*********|********|********|********|*********|********|********|********|*********|***    
 5.01-04 100407 2.25-01  -0.648 ********|*********|********|********|********|*********|********|********|********|*********|***    
 7.94-04 158660 2.24-01  -0.649 ********|*********|********|********|********|*********|********|********|********|*********|***    
 1.26-03 252215 2.25-01  -0.648 ********|*********|********|********|********|*********|********|********|********|*********|***    
 2.00-03 398399 2.24-01  -0.650 ********|*********|********|********|********|*********|********|********|********|*********|***    
 3.16-03 631405 2.24-01  -0.650 ********|*********|********|********|********|*********|********|********|********|*********|***    
 5.01-03 1.0+06 2.25-01  -0.648 ********|*********|********|********|********|*********|********|********|********|*********|***    
 7.94-03 1.6+06 2.27-01  -0.643 ********|*********|********|********|********|*********|********|********|********|*********|***    
 1.26-02 2.8+06 2.53-01  -0.596 ********|*********|********|********|********|*********|********|********|********|*********|****   
 2.00-02 6.0+06 3.40-01  -0.469 ********|*********|********|********|********|*********|********|********|********|*********|*****  
 3.16-02 9.1+06 3.21-01  -0.493 ********|*********|********|********|********|*********|********|********|********|*********|*****  
 5.01-02 1.2+07 2.71-01  -0.567 ********|*********|********|********|********|*********|********|********|********|*********|****   
 7.94-02 1.2+07 1.76-01  -0.755 mmmmmmmm|mmmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmmm|mm     
 1.26-01 9.7+06 8.61-02  -1.065 ********|*********|********|********|********|*********|********|********|********|*********|       
 2.00-01 5.4+06 3.03-02  -1.518 ********|*********|********|********|********|*********|********|********|********|*****    |       
 3.16-01 1.9+06 6.74-03  -2.171 ********|*********|********|********|********|*********|********|********|********|         |       
 5.01-01 438585 9.82-04  -3.008 ********|*********|********|********|********|*********|********|********|        |         |       
 7.94-01  84823 1.20-04  -3.921 ********|*********|********|********|********|*********|********|*       |        |         |       
 1.26+00  18144 1.62-05  -4.791 ********|*********|********|********|********|*********|**      |        |        |         |       
 2.00+00   4594 2.58-06  -5.588 ********|*********|********|********|********|*****    |        |        |        |         |       
 3.16+00   1431 5.08-07  -6.294 ********|*********|********|********|******* |         |        |        |        |         |       
 5.01+00    474 1.06-07  -6.974 ********|*********|********|********|*       |         |        |        |        |         |       
 7.94+00    205 2.90-08  -7.538 ********|*********|********|*****   |     s  |         |        |        |        |         |       
 1.26+01    116 1.03-08  -7.985 ********|*********|********|        |   s    |         |        |        |        |         |       
 2.00+01     34 1.91-09  -8.718 ********|*********|***     |        |s       |         |        |        |        |         |       
 3.16+01     20 7.10-10  -9.149 ********|*********|        |     s  |        |         |        |        |        |         |       
 5.01+01     11 2.46-10  -9.608 ********|****     |        |  s     |        |         |        |        |        |         |       
 7.94+01      9 1.27-10  -9.896 ********|**       |       s|        |        |         |        |        |        |         |       
 1.26+02      5 4.46-11 -10.351 ******* |         |   s    |        |        |         |        |        |        |         |       
 2.00+02      2 1.13-11 -10.949 *       |         s        |        |        |         |        |        |        |         |       
  total 6.43+07 2.66-02         d-------d---------d--------d--------d--------d---------d--------d--------d--------d---------d-------

1tally       44        nps =  2414284173
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      14                                                                                   
                         4.00000E+03
 
 cell  14                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 5.53709E-07 0.0002   1.75497E-11 0.0349   1.22749E-11 0.0499   1.30489E-11 0.0494   1.17657E-11 0.0526
 
         time:       2.0000E+07             total                                                                  
                 1.05508E-11 0.0483   5.53774E-07 0.0002


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       44

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.02      yes         yes            constant    random       2.07
 passed?        yes          yes      yes          yes             yes      yes         yes               yes        yes          no

 ===================================================================================================================================


 warning.  the tally in the tally fluctuation chart bin did not pass  1 of the 10 statistical checks.

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       44 with nps =  2414284173  print table 160


 normed average tally per history  = 5.53774E-07          unnormed average tally per history  = 2.21510E-03
 estimated tally relative error    = 0.0002               estimated variance of the variance  = 0.0152
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0002

 number of nonzero history tallies =    75046463          efficiency for the nonzero tallies  = 0.0311
 history number of largest  tally  =    42779399          largest  unnormalized history tally = 3.83569E+02
 (largest  tally)/(average tally)  = 1.73161E+05          (largest  tally)/(avg nonzero tally)= 5.38261E+03

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 5.53779E-07


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            5.53774E-07             5.53814E-07                     0.000072
      relative error                  2.46133E-04             2.56352E-04                     0.041517
      variance of the variance        1.52252E-02             1.90611E-02                     0.251939
      shifted center                  5.53779E-07             5.53780E-07                     0.000002
      figure of merit                 8.25330E+01             7.60843E+01                    -0.078136

 the estimated inverse power slope of the 200 largest  tallies starting at 1.54025E+01 is 2.0701
 the history score probability density function appears to have an unsampled region at the largest  history scores:
 please examine. see print table 161.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (1.207E+04)*( 8.269E-02)**2 = (1.207E+04)*(6.837E-03) = 8.253E+01

1unnormed tally density for tally       44          nonzero tally mean(m) = 7.126E-02   nps =  2414284173  print table 161

 abscissa              ordinate   log plot of tally probability density function in tally fluctuation chart bin(d=decade,slope= 2.1)
  tally  number num den log den:d-------d--------d--------d--------d--------d-------d--------d--------d--------d--------d--------d--
 6.31-10      1 1.32+00   0.119 ********|********|********|********|********|*******|********|********|********|********|********|**
 1.26-09      1 6.60-01  -0.181 ********|********|********|********|********|*******|********|********|********|********|********|  
 2.51-09      1 3.31-01  -0.481 ********|********|********|********|********|*******|********|********|********|********|******  |  
 5.01-09      2 3.31-01  -0.480 ********|********|********|********|********|*******|********|********|********|********|******  |  
 1.00-08      3 2.49-01  -0.604 ********|********|********|********|********|*******|********|********|********|********|*****   |  
 2.00-08      5 2.08-01  -0.682 ********|********|********|********|********|*******|********|********|********|********|****    |  
 3.98-08     12 2.50-01  -0.602 ********|********|********|********|********|*******|********|********|********|********|*****   |  
 7.94-08     21 2.20-01  -0.659 ********|********|********|********|********|*******|********|********|********|********|****    |  
 1.58-07     43 2.25-01  -0.647 ********|********|********|********|********|*******|********|********|********|********|****    |  
 3.16-07     93 2.44-01  -0.612 ********|********|********|********|********|*******|********|********|********|********|****    |  
 6.31-07    192 2.53-01  -0.597 ********|********|********|********|********|*******|********|********|********|********|*****   |  
 1.26-06    329 2.17-01  -0.664 ********|********|********|********|********|*******|********|********|********|********|****    |  
 2.51-06    732 2.42-01  -0.616 ********|********|********|********|********|*******|********|********|********|********|****    |  
 5.01-06   1469 2.43-01  -0.614 ********|********|********|********|********|*******|********|********|********|********|****    |  
 1.00-05   2920 2.42-01  -0.615 ********|********|********|********|********|*******|********|********|********|********|****    |  
 2.00-05   5635 2.35-01  -0.630 ********|********|********|********|********|*******|********|********|********|********|****    |  
 3.98-05  11345 2.37-01  -0.626 ********|********|********|********|********|*******|********|********|********|********|****    |  
 7.94-05  22678 2.37-01  -0.625 ********|********|********|********|********|*******|********|********|********|********|****    |  
 1.58-04  45568 2.39-01  -0.622 ********|********|********|********|********|*******|********|********|********|********|****    |  
 3.16-04  91228 2.40-01  -0.621 ********|********|********|********|********|*******|********|********|********|********|****    |  
 6.31-04 181641 2.39-01  -0.622 ********|********|********|********|********|*******|********|********|********|********|****    |  
 1.26-03 361211 2.38-01  -0.623 ********|********|********|********|********|*******|********|********|********|********|****    |  
 2.51-03 719884 2.38-01  -0.623 ********|********|********|********|********|*******|********|********|********|********|****    |  
 5.01-03 1.4+06 2.39-01  -0.622 ********|********|********|********|********|*******|********|********|********|********|****    |  
 1.00-02 3.0+06 2.46-01  -0.608 ********|********|********|********|********|*******|********|********|********|********|*****   |  
 2.00-02 8.3+06 3.43-01  -0.464 ********|********|********|********|********|*******|********|********|********|********|******  |  
 3.98-02 1.7+07 3.46-01  -0.461 ********|********|********|********|********|*******|********|********|********|********|******  |  
 7.94-02 2.2+07 2.26-01  -0.645 mmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmm|mmmm    |  
 1.58-01 1.6+07 8.44-02  -1.074 ********|********|********|********|********|*******|********|********|********|********|        |  
 3.16-01 5.6+06 1.46-02  -1.835 ********|********|********|********|********|*******|********|********|********|***     |        |  
 6.31-01 857341 1.13-03  -2.948 ********|********|********|********|********|*******|********|********|**      |        |        |  
 1.26+00 126051 8.31-05  -4.080 ********|********|********|********|********|*******|********|*       |        |        |        |  
 2.51+00  21277 7.03-06  -5.153 ********|********|********|********|********|*******|        |        |        |        |        |  
 5.01+00   3478 5.76-07  -6.239 ********|********|********|********|******* |       |        |        |        |        |        |  
 1.00+01    795 6.60-08  -7.180 ********|********|********|********|        |       |        |        |        |        |        |  
 2.00+01    235 9.78-09  -8.010 ********|********|********|*       | s      |       |        |        |        |        |        |  
 3.98+01     74 1.54-09  -8.811 ********|********|**      |      s |        |       |        |        |        |        |        |  
 7.94+01     25 2.61-10  -9.583 ********|*****   |        | s      |        |       |        |        |        |        |        |  
 1.58+02     16 8.38-11 -10.077 ********|        |     s  |        |        |       |        |        |        |        |        |  
 3.16+02      4 1.05-11 -10.979 *       |        |s       |        |        |       |        |        |        |        |        |  
 3.98+02      2 1.01-11 -10.995 *       |     s  |        |        |        |       |        |        |        |        |        |  
  total 7.50+07 3.11-02         d-------d--------d--------d--------d--------d-------d--------d--------d--------d--------d--------d--

1status of the statistical checks used to form confidence intervals for the mean for each tally bin


 tally   result of statistical checks for the tfc bin (the first check not passed is listed) and error magnitude check for all bins

        4   missed  1 of 10 tfc bin checks: the slope of decrease of largest tallies is less than the minimum acceptable value of 3.0 
         passed all bin error check:     7 tally bins all have relative errors less than 0.10 with no zero bins

       14   missed  3 of 10 tfc bin checks: the variance of the variance does not monotonically decrease over the last half of problem
         passed all bin error check:     7 tally bins all have relative errors less than 0.10 with no zero bins

       24   missed  1 of 10 tfc bin checks: the slope of decrease of largest tallies is less than the minimum acceptable value of 3.0 
         passed all bin error check:     7 tally bins all have relative errors less than 0.10 with no zero bins

       34   missed  1 of 10 tfc bin checks: the slope of decrease of largest tallies is less than the minimum acceptable value of 3.0 
         passed all bin error check:     7 tally bins all have relative errors less than 0.10 with no zero bins

       44   missed  1 of 10 tfc bin checks: the slope of decrease of largest tallies is less than the minimum acceptable value of 3.0 
         passed all bin error check:     7 tally bins all have relative errors less than 0.10 with no zero bins


 the 10 statistical checks are only for the tally fluctuation chart bin and do not apply to other tally bins.

 warning.       5 of the     5 tally fluctuation chart bins did not pass all 10 statistical checks.
1tally fluctuation charts                              

                            tally        4                          tally       14                          tally       24
          nps      mean     error   vov  slope    fom      mean     error   vov  slope    fom      mean     error   vov  slope    fom
    131072000   2.9199E-07 0.0013 0.1427  2.4      58   4.3091E-07 0.0013 0.1883  2.1      52   9.9384E-07 0.0014 0.3024  2.1      49
    262144000   2.9192E-07 0.0008 0.0627  2.1      76   4.3033E-07 0.0008 0.1025  2.3      77   9.9295E-07 0.0008 0.2130  2.2      81
    393216000   2.9196E-07 0.0006 0.0365  2.3      87   4.3054E-07 0.0006 0.0642  2.3      92   9.9328E-07 0.0005 0.1555  2.1     104
    524288000   2.9197E-07 0.0005 0.0234  2.3      91   4.3050E-07 0.0005 0.0431  2.5     100   9.9296E-07 0.0004 0.1195  2.4     122
    655360000   2.9194E-07 0.0004 0.0164  2.4      95   4.3060E-07 0.0004 0.0299  2.5     103   9.9290E-07 0.0004 0.0895  2.4     131
    786432000   2.9194E-07 0.0004 0.0122  2.4      98   4.3068E-07 0.0004 0.0225  2.7     107   9.9284E-07 0.0003 0.0708  2.5     140
    917504000   2.9200E-07 0.0004 0.0095  2.4     101   4.3067E-07 0.0003 0.0177  2.8     111   9.9291E-07 0.0003 0.0585  2.6     148
   1048576000   2.9196E-07 0.0003 0.0077  2.5     103   4.3065E-07 0.0003 0.0145  2.9     115   9.9275E-07 0.0003 0.0503  3.0     157
   1179648000   2.9203E-07 0.0003 0.0063  2.4     103   4.3060E-07 0.0003 0.0119  2.7     114   9.9279E-07 0.0003 0.0404  2.9     153
   1310720000   2.9204E-07 0.0003 0.0053  2.5     105   4.3050E-07 0.0003 0.0101  2.7     117   9.9268E-07 0.0002 0.0357  3.0     159
   1441792000   2.9203E-07 0.0003 0.0045  2.5     107   4.3051E-07 0.0003 0.0087  2.5     119   9.9266E-07 0.0002 0.0317  3.0     165
   1572864000   2.9204E-07 0.0003 0.0039  2.6     107   4.3045E-07 0.0003 0.0075  2.6     121   9.9268E-07 0.0002 0.0277  2.8     168
   1703936000   2.9204E-07 0.0003 0.0034  2.6     108   4.3049E-07 0.0003 0.0399  2.4      99   9.9265E-07 0.0002 0.0246  2.8     172
   1835008000   2.9206E-07 0.0002 0.0029  2.4     108   4.3053E-07 0.0003 0.0355  2.4     101   9.9269E-07 0.0002 0.0214  2.6     171
   1966080000   2.9205E-07 0.0002 0.0026  2.4     109   4.3052E-07 0.0002 0.0320  2.3     102   9.9267E-07 0.0002 0.0191  2.4     173
   2097152000   2.9206E-07 0.0002 0.0023  2.3     109   4.3054E-07 0.0002 0.0287  2.2     103   9.9275E-07 0.0002 0.0168  2.3     172
   2228224000   2.9205E-07 0.0002 0.0022  2.3     108   4.3056E-07 0.0002 0.0257  2.2     103   9.9271E-07 0.0002 0.0156  2.3     168
   2359296000   2.9206E-07 0.0002 0.0026  2.2     105   4.3060E-07 0.0002 0.0228  2.2      99   9.9284E-07 0.0002 0.0175  2.1     153
   2414284173   2.9206E-07 0.0002 0.0025  2.1     105   4.3058E-07 0.0002 0.0222  2.2     100   9.9279E-07 0.0002 0.0171  2.1     155
 

                            tally       34                          tally       44
          nps      mean     error   vov  slope    fom      mean     error   vov  slope    fom
    131072000   4.3138E-07 0.0013 0.1719  2.4      56   5.5532E-07 0.0019 0.2913  2.2      26
    262144000   4.3062E-07 0.0008 0.0915  2.2      81   5.5421E-07 0.0010 0.2059  2.3      43
    393216000   4.3064E-07 0.0006 0.0559  2.3      95   5.5419E-07 0.0007 0.1506  2.2      56
    524288000   4.3060E-07 0.0005 0.0366  2.4     102   5.5389E-07 0.0006 0.1160  2.3      65
    655360000   4.3070E-07 0.0004 0.0256  2.6     106   5.5390E-07 0.0005 0.0850  2.3      69
    786432000   4.3060E-07 0.0004 0.0192  2.8     110   5.5381E-07 0.0005 0.0665  2.5      73
    917504000   4.3065E-07 0.0003 0.0150  2.8     113   5.5375E-07 0.0004 0.0551  2.7      78
   1048576000   4.3060E-07 0.0003 0.0122  2.8     116   5.5362E-07 0.0004 0.0475  3.0      82
   1179648000   4.3058E-07 0.0003 0.0103  2.7     114   5.5371E-07 0.0004 0.0383  2.8      81
   1310720000   4.3059E-07 0.0003 0.0088  2.8     117   5.5368E-07 0.0003 0.0340  2.8      84
   1441792000   4.3058E-07 0.0003 0.0075  2.8     119   5.5365E-07 0.0003 0.0302  2.9      87
   1572864000   4.3056E-07 0.0003 0.0065  2.6     120   5.5360E-07 0.0003 0.0264  2.6      89
   1703936000   4.3051E-07 0.0002 0.0056  2.7     122   5.5358E-07 0.0003 0.0235  2.5      91
   1835008000   4.3054E-07 0.0002 0.0049  2.5     122   5.5365E-07 0.0003 0.0204  2.4      90
   1966080000   4.3054E-07 0.0002 0.0044  2.4     122   5.5364E-07 0.0003 0.0182  2.4      91
   2097152000   4.3058E-07 0.0002 0.0039  2.4     121   5.5367E-07 0.0003 0.0160  2.4      90
   2228224000   4.3058E-07 0.0002 0.0038  2.4     120   5.5370E-07 0.0002 0.0152  2.2      88
   2359296000   4.3061E-07 0.0002 0.0042  2.2     115   5.5378E-07 0.0003 0.0156  2.1      82
   2414284173   4.3060E-07 0.0002 0.0041  2.2     116   5.5377E-07 0.0002 0.0152  2.1      83

 ***********************************************************************************************************************

 dump no.  168 on file inpr     nps =  2414284173     coll =   183771452382     ctm =   200000.41   nrn =    
 1549022907149

        16 warning messages so far.


 run terminated when it had used*****  minutes of computer time.

 computer time =******** minutes

 mcnp     version 6     06/19/14                     08/06/17 17:13:39                     probid =  08/06/17 08:53:04 
