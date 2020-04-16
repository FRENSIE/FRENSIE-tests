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
       153-       sb1    4.95039e-01 5.04961e-01                                                  
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
       220-       wwp:n 5.0 j 100 j -1 0 9.488431266e-03                                          
 
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

 dump no.    2 on file inpr     nps =    14299228     coll =     1096183741     ctm =     1200.33   nrn =       
 9248824942

 ***********************************************************************************************************************

 dump no.    3 on file inpr     nps =    28632908     coll =     2193319222     ctm =     2400.81   nrn =      
 18506098982

 ***********************************************************************************************************************

 dump no.    4 on file inpr     nps =    42975838     coll =     3290532054     ctm =     3601.20   nrn =      
 27763284391

 ***********************************************************************************************************************

 dump no.    5 on file inpr     nps =    57273736     coll =     4387460249     ctm =     4801.48   nrn =      
 37016550648

 ***********************************************************************************************************************

 dump no.    6 on file inpr     nps =    71590616     coll =     5485071236     ctm =     6001.85   nrn =      
 46276290132

 ***********************************************************************************************************************

 dump no.    7 on file inpr     nps =    85916234     coll =     6583159594     ctm =     7202.24   nrn =      
 55540146472

 ***********************************************************************************************************************

 dump no.    8 on file inpr     nps =   100219650     coll =     7680577503     ctm =     8402.55   nrn =      
 64798466756

 ***********************************************************************************************************************

 dump no.    9 on file inpr     nps =   114546284     coll =     8778233127     ctm =     9602.91   nrn =      
 74058563247

 ***********************************************************************************************************************

 dump no.   10 on file inpr     nps =   128910288     coll =     9875366134     ctm =    10803.20   nrn =      
 83315368329

 ***********************************************************************************************************************

 dump no.   11 on file inpr     nps =   143215882     coll =    10971376022     ctm =    12003.49   nrn =      
 92562233511

 ***********************************************************************************************************************

 dump no.   12 on file inpr     nps =   157558106     coll =    12068599376     ctm =    13203.80   nrn =     
 101820365095

 ***********************************************************************************************************************

 dump no.   13 on file inpr     nps =   171890482     coll =    13166192031     ctm =    14404.25   nrn =     
 111080784494

 ***********************************************************************************************************************

 dump no.   14 on file inpr     nps =   186228548     coll =    14263783951     ctm =    15604.73   nrn =     
 120342018508

 ***********************************************************************************************************************

 dump no.   15 on file inpr     nps =   200549388     coll =    15361106358     ctm =    16805.09   nrn =     
 129599937283

 ***********************************************************************************************************************

 dump no.   16 on file inpr     nps =   214873396     coll =    16458404056     ctm =    18005.34   nrn =     
 138857015470

 ***********************************************************************************************************************

 dump no.   17 on file inpr     nps =   229197904     coll =    17555941048     ctm =    19205.56   nrn =     
 148116723973

 ***********************************************************************************************************************

 dump no.   18 on file inpr     nps =   243544286     coll =    18653349804     ctm =    20405.95   nrn =     
 157375987106

 ***********************************************************************************************************************

 dump no.   19 on file inpr     nps =   257862156     coll =    19750977063     ctm =    21606.39   nrn =     
 166636774225

 ***********************************************************************************************************************

 dump no.   20 on file inpr     nps =   272190916     coll =    20848148027     ctm =    22806.74   nrn =     
 175894519136

 ***********************************************************************************************************************

 dump no.   21 on file inpr     nps =   286516904     coll =    21944693508     ctm =    24007.02   nrn =     
 185145771285

 ***********************************************************************************************************************

 dump no.   22 on file inpr     nps =   300802104     coll =    23042887819     ctm =    25207.48   nrn =     
 194410166032

 ***********************************************************************************************************************

 dump no.   23 on file inpr     nps =   315124726     coll =    24140302265     ctm =    26407.80   nrn =     
 203669257923

 ***********************************************************************************************************************

 dump no.   24 on file inpr     nps =   329433488     coll =    25238313884     ctm =    27608.10   nrn =     
 212932420564

 ***********************************************************************************************************************

 dump no.   25 on file inpr     nps =   343742156     coll =    26336098735     ctm =    28808.38   nrn =     
 222193060482

 ***********************************************************************************************************************

 dump no.   26 on file inpr     nps =   358066268     coll =    27433979889     ctm =    30008.79   nrn =     
 231454801399

 ***********************************************************************************************************************

 dump no.   27 on file inpr     nps =   372351166     coll =    28531697581     ctm =    31209.22   nrn =     
 240716117562

 ***********************************************************************************************************************

 dump no.   28 on file inpr     nps =   386695474     coll =    29629152101     ctm =    32409.55   nrn =     
 249975526978

 ***********************************************************************************************************************

 dump no.   29 on file inpr     nps =   400992054     coll =    30726352820     ctm =    33609.88   nrn =     
 259231911518

 ***********************************************************************************************************************

 dump no.   30 on file inpr     nps =   415323690     coll =    31823272071     ctm =    34810.17   nrn =     
 268486767409

 ***********************************************************************************************************************

 dump no.   31 on file inpr     nps =   429631754     coll =    32920746162     ctm =    36010.57   nrn =     
 277745668193

 ***********************************************************************************************************************

 dump no.   32 on file inpr     nps =   443934086     coll =    34018301746     ctm =    37210.91   nrn =     
 287005541441

 ***********************************************************************************************************************

 dump no.   33 on file inpr     nps =   458250080     coll =    35116293289     ctm =    38411.28   nrn =     
 296267920701

 ***********************************************************************************************************************

 dump no.   34 on file inpr     nps =   472562698     coll =    36213904879     ctm =    39611.56   nrn =     
 305528239069

 ***********************************************************************************************************************

 dump no.   35 on file inpr     nps =   486861862     coll =    37311651866     ctm =    40811.89   nrn =     
 314789264507

 ***********************************************************************************************************************

 dump no.   36 on file inpr     nps =   501204774     coll =    38409139548     ctm =    42012.30   nrn =     
 324048450037

 ***********************************************************************************************************************

 dump no.   37 on file inpr     nps =   515512848     coll =    39506846298     ctm =    43212.61   nrn =     
 333309797442

 ***********************************************************************************************************************

 dump no.   38 on file inpr     nps =   529878134     coll =    40604161103     ctm =    44412.96   nrn =     
 342568359670

 ***********************************************************************************************************************

 dump no.   39 on file inpr     nps =   544215116     coll =    41701313569     ctm =    45613.24   nrn =     
 351825380606

 ***********************************************************************************************************************

 dump no.   40 on file inpr     nps =   558552088     coll =    42798564991     ctm =    46813.58   nrn =     
 361082985596

 ***********************************************************************************************************************

 dump no.   41 on file inpr     nps =   572885704     coll =    43896130336     ctm =    48013.83   nrn =     
 370342783570

 ***********************************************************************************************************************

 dump no.   42 on file inpr     nps =   587226448     coll =    44993434702     ctm =    49214.15   nrn =     
 379600780236

 ***********************************************************************************************************************

 dump no.   43 on file inpr     nps =   601533324     coll =    46090668724     ctm =    50414.47   nrn =     
 388858107609

 ***********************************************************************************************************************

 dump no.   44 on file inpr     nps =   615815262     coll =    47187530792     ctm =    51614.77   nrn =     
 398112342646

 ***********************************************************************************************************************

 dump no.   45 on file inpr     nps =   630143720     coll =    48284656548     ctm =    52815.06   nrn =     
 407368904467

 ***********************************************************************************************************************

 dump no.   46 on file inpr     nps =   644473178     coll =    49382138707     ctm =    54015.40   nrn =     
 416628050515

 ***********************************************************************************************************************

 dump no.   47 on file inpr     nps =   658788568     coll =    50479630080     ctm =    55215.77   nrn =     
 425887707312

 ***********************************************************************************************************************

 dump no.   48 on file inpr     nps =   673123372     coll =    51576550109     ctm =    56416.08   nrn =     
 435142423700

 ***********************************************************************************************************************

 dump no.   49 on file inpr     nps =   687507280     coll =    52673358358     ctm =    57616.41   nrn =     
 444397714103

 ***********************************************************************************************************************

 dump no.   50 on file inpr     nps =   701846836     coll =    53770756480     ctm =    58817.02   nrn =     
 453657025963

 ***********************************************************************************************************************

 dump no.   51 on file inpr     nps =   716164414     coll =    54868274995     ctm =    60017.47   nrn =     
 462916267911

 ***********************************************************************************************************************

 dump no.   52 on file inpr     nps =   730497812     coll =    55965599361     ctm =    61217.75   nrn =     
 472174778026

 ***********************************************************************************************************************

 dump no.   53 on file inpr     nps =   744817370     coll =    57063350271     ctm =    62418.22   nrn =     
 481436942909

 ***********************************************************************************************************************

 dump no.   54 on file inpr     nps =   759160490     coll =    58160476012     ctm =    63618.53   nrn =     
 490693972856

 ***********************************************************************************************************************

 dump no.   55 on file inpr     nps =   773476286     coll =    59258295754     ctm =    64818.92   nrn =     
 499955268719

 ***********************************************************************************************************************

 dump no.   56 on file inpr     nps =   787789884     coll =    60356190245     ctm =    66019.36   nrn =     
 509217562608

 ***********************************************************************************************************************

 dump no.   57 on file inpr     nps =   802078158     coll =    61453709686     ctm =    67219.70   nrn =     
 518477054529

 ***********************************************************************************************************************

 dump no.   58 on file inpr     nps =   816376332     coll =    62551510603     ctm =    68420.27   nrn =     
 527738011470

 ***********************************************************************************************************************

 dump no.   59 on file inpr     nps =   830663418     coll =    63648888599     ctm =    69620.73   nrn =     
 536996120703

 ***********************************************************************************************************************

 dump no.   60 on file inpr     nps =   844970304     coll =    64746448981     ctm =    70821.03   nrn =     
 546255588575

 ***********************************************************************************************************************

 dump no.   61 on file inpr     nps =   859296772     coll =    65844509798     ctm =    72021.54   nrn =     
 555518480623

 ***********************************************************************************************************************

 dump no.   62 on file inpr     nps =   873648208     coll =    66941597094     ctm =    73221.86   nrn =     
 564775113199

 ***********************************************************************************************************************

 dump no.   63 on file inpr     nps =   887927374     coll =    68039091548     ctm =    74422.19   nrn =     
 574034785432

 ***********************************************************************************************************************

 dump no.   64 on file inpr     nps =   902249110     coll =    69136185668     ctm =    75622.61   nrn =     
 583290516042

 ***********************************************************************************************************************

 dump no.   65 on file inpr     nps =   916557382     coll =    70233738921     ctm =    76822.96   nrn =     
 592550600687

 ***********************************************************************************************************************

 dump no.   66 on file inpr     nps =   930877910     coll =    71331061936     ctm =    78023.28   nrn =     
 601809100247

 ***********************************************************************************************************************

 dump no.   67 on file inpr     nps =   945142820     coll =    72429278672     ctm =    79223.62   nrn =     
 611072866500

 ***********************************************************************************************************************

 dump no.   68 on file inpr     nps =   959493068     coll =    73526451750     ctm =    80423.97   nrn =     
 620330622983

 ***********************************************************************************************************************

 dump no.   69 on file inpr     nps =   973803914     coll =    74624040574     ctm =    81624.34   nrn =     
 629590992448

 ***********************************************************************************************************************

 dump no.   70 on file inpr     nps =   988130580     coll =    75721349562     ctm =    82824.63   nrn =     
 638849015374

 ***********************************************************************************************************************

 dump no.   71 on file inpr     nps =  1002459444     coll =    76818951672     ctm =    84025.03   nrn =     
 648109020616

 ***********************************************************************************************************************

 dump no.   72 on file inpr     nps =  1016798010     coll =    77915943541     ctm =    85225.50   nrn =     
 657364010403

 ***********************************************************************************************************************

 dump no.   73 on file inpr     nps =  1031090838     coll =    79013642827     ctm =    86425.79   nrn =     
 666624037198

 ***********************************************************************************************************************

 dump no.   74 on file inpr     nps =  1045398318     coll =    80111402038     ctm =    87626.12   nrn =     
 675885303304

 ***********************************************************************************************************************

 dump no.   75 on file inpr     nps =  1059704590     coll =    81209161450     ctm =    88826.45   nrn =     
 685146308315

 ***********************************************************************************************************************

 dump no.   76 on file inpr     nps =  1074016822     coll =    82306503864     ctm =    90026.81   nrn =     
 694404296774

 ***********************************************************************************************************************

 dump no.   77 on file inpr     nps =  1088300344     coll =    83404525510     ctm =    91227.19   nrn =     
 703667859245

 ***********************************************************************************************************************

 dump no.   78 on file inpr     nps =  1102577134     coll =    84502748117     ctm =    92427.56   nrn =     
 712932013638

 ***********************************************************************************************************************

 dump no.   79 on file inpr     nps =  1116860438     coll =    85600566903     ctm =    93627.89   nrn =     
 722193406266

 ***********************************************************************************************************************

 dump no.   80 on file inpr     nps =  1131159800     coll =    86698281360     ctm =    94828.28   nrn =     
 731455209410

 ***********************************************************************************************************************

 dump no.   81 on file inpr     nps =  1145476586     coll =    87795053942     ctm =    96028.64   nrn =     
 740708246139

 ***********************************************************************************************************************

 dump no.   82 on file inpr     nps =  1159776542     coll =    88892918957     ctm =    97229.03   nrn =     
 749969408211

 ***********************************************************************************************************************

 dump no.   83 on file inpr     nps =  1174100456     coll =    89990673406     ctm =    98429.42   nrn =     
 759230309602

 ***********************************************************************************************************************

 dump no.   84 on file inpr     nps =  1188415440     coll =    91087961867     ctm =    99629.75   nrn =     
 768488134548

 ***********************************************************************************************************************

 dump no.   85 on file inpr     nps =  1202738562     coll =    92185441875     ctm =   100830.22   nrn =     
 777747120162

 ***********************************************************************************************************************

 dump no.   86 on file inpr     nps =  1217002482     coll =    93282712558     ctm =   102030.62   nrn =     
 787004926513

 ***********************************************************************************************************************

 dump no.   87 on file inpr     nps =  1231306596     coll =    94379978578     ctm =   103230.96   nrn =     
 796262353785

 ***********************************************************************************************************************

 dump no.   88 on file inpr     nps =  1245647716     coll =    95477155057     ctm =   104431.27   nrn =     
 805519726349

 ***********************************************************************************************************************

 dump no.   89 on file inpr     nps =  1259961532     coll =    96574928333     ctm =   105631.74   nrn =     
 814780838149

 ***********************************************************************************************************************

 dump no.   90 on file inpr     nps =  1274307424     coll =    97672158381     ctm =   106832.18   nrn =     
 824039023492

 ***********************************************************************************************************************

 dump no.   91 on file inpr     nps =  1288623418     coll =    98769856656     ctm =   108032.47   nrn =     
 833299754585

 ***********************************************************************************************************************

 dump no.   92 on file inpr     nps =  1302814474     coll =    99867856373     ctm =   109232.92   nrn =     
 842563224853

 ***********************************************************************************************************************

 dump no.   93 on file inpr     nps =  1317143912     coll =   100965708730     ctm =   110433.24   nrn =     
 851824968202

 ***********************************************************************************************************************

 dump no.   94 on file inpr     nps =  1331502872     coll =   102062970857     ctm =   111633.66   nrn =     
 861083084220

 ***********************************************************************************************************************

 dump no.   95 on file inpr     nps =  1345840448     coll =   103160514518     ctm =   112834.04   nrn =     
 870343183768

 ***********************************************************************************************************************

 dump no.   96 on file inpr     nps =  1360159610     coll =   104257878532     ctm =   114034.47   nrn =     
 879602166297

 ***********************************************************************************************************************

 dump no.   97 on file inpr     nps =  1374459368     coll =   105355847227     ctm =   115234.90   nrn =     
 888865086986

 ***********************************************************************************************************************

 dump no.   98 on file inpr     nps =  1388783480     coll =   106453486198     ctm =   116435.37   nrn =     
 898126520930

 ***********************************************************************************************************************

 dump no.   99 on file inpr     nps =  1403108780     coll =   107551242006     ctm =   117635.85   nrn =     
 907387793839

 ***********************************************************************************************************************

 dump no.  100 on file inpr     nps =  1417438634     coll =   108648513766     ctm =   118836.17   nrn =     
 916644989244

 ***********************************************************************************************************************

 dump no.  101 on file inpr     nps =  1431744134     coll =   109745738123     ctm =   120036.45   nrn =     
 925902032043

 ***********************************************************************************************************************

 dump no.  102 on file inpr     nps =  1446102262     coll =   110842897294     ctm =   121236.83   nrn =     
 935159068012

 ***********************************************************************************************************************

 dump no.  103 on file inpr     nps =  1460460232     coll =   111940305573     ctm =   122437.25   nrn =     
 944417997450

 ***********************************************************************************************************************

 dump no.  104 on file inpr     nps =  1474797808     coll =   113037687768     ctm =   123637.57   nrn =     
 953676848081

 ***********************************************************************************************************************

 dump no.  105 on file inpr     nps =  1489093606     coll =   114135554230     ctm =   124837.93   nrn =     
 962938847994

 ***********************************************************************************************************************

 dump no.  106 on file inpr     nps =  1503411976     coll =   115233067946     ctm =   126038.27   nrn =     
 972198221945

 ***********************************************************************************************************************

 dump no.  107 on file inpr     nps =  1517722822     coll =   116330994025     ctm =   127238.59   nrn =     
 981460318953

 ***********************************************************************************************************************

 dump no.  108 on file inpr     nps =  1532008126     coll =   117428714760     ctm =   128438.91   nrn =     
 990720849656

 ***********************************************************************************************************************

 dump no.  109 on file inpr     nps =  1546343722     coll =   118525964808     ctm =   129639.21   nrn =     
 999979075363

 ***********************************************************************************************************************

 dump no.  110 on file inpr     nps =  1560676942     coll =   119623489126     ctm =   130839.65   nrn =    
 1009239389711

 ***********************************************************************************************************************

 dump no.  111 on file inpr     nps =  1574992302     coll =   120721382780     ctm =   132039.97   nrn =    
 1018500818293

 ***********************************************************************************************************************

 dump no.  112 on file inpr     nps =  1589325918     coll =   121819037605     ctm =   133240.33   nrn =    
 1027760961948

 ***********************************************************************************************************************

 dump no.  113 on file inpr     nps =  1603645674     coll =   122916158715     ctm =   134440.62   nrn =    
 1037017869187

 ***********************************************************************************************************************

 dump no.  114 on file inpr     nps =  1617970578     coll =   124011553342     ctm =   135640.89   nrn =    
 1046261334442

 ***********************************************************************************************************************

 dump no.  115 on file inpr     nps =  1632299046     coll =   125108325895     ctm =   136841.18   nrn =    
 1055515008730

 ***********************************************************************************************************************

 dump no.  116 on file inpr     nps =  1646598408     coll =   126205946196     ctm =   138041.49   nrn =    
 1064774912752

 ***********************************************************************************************************************

 dump no.  117 on file inpr     nps =  1660957764     coll =   127303172992     ctm =   139241.78   nrn =    
 1074032237857

 ***********************************************************************************************************************

 dump no.  118 on file inpr     nps =  1675270590     coll =   128400095474     ctm =   140442.23   nrn =    
 1083286909394

 ***********************************************************************************************************************

 dump no.  119 on file inpr     nps =  1689581436     coll =   129497690146     ctm =   141642.61   nrn =    
 1092546975733

 ***********************************************************************************************************************

 dump no.  120 on file inpr     nps =  1703920398     coll =   130595086356     ctm =   142843.02   nrn =    
 1101806294838

 ***********************************************************************************************************************

 dump no.  121 on file inpr     nps =  1718248628     coll =   131692343276     ctm =   144043.37   nrn =    
 1111064821813

 ***********************************************************************************************************************

 dump no.  122 on file inpr     nps =  1732557692     coll =   132789871604     ctm =   145243.66   nrn =    
 1120324015554

 ***********************************************************************************************************************

 dump no.  123 on file inpr     nps =  1746858836     coll =   133887241111     ctm =   146443.94   nrn =    
 1129582188598

 ***********************************************************************************************************************

 dump no.  124 on file inpr     nps =  1761154238     coll =   134984172795     ctm =   147644.36   nrn =    
 1138836251285

 ***********************************************************************************************************************

 dump no.  125 on file inpr     nps =  1775459144     coll =   136081690569     ctm =   148844.70   nrn =    
 1148095747097

 ***********************************************************************************************************************

 dump no.  126 on file inpr     nps =  1789799690     coll =   137179190954     ctm =   150045.03   nrn =    
 1157355084037

 ***********************************************************************************************************************

 dump no.  127 on file inpr     nps =  1804095686     coll =   138277247084     ctm =   151245.41   nrn =    
 1166618018215

 ***********************************************************************************************************************

 dump no.  128 on file inpr     nps =  1818412076     coll =   139374523551     ctm =   152445.79   nrn =    
 1175875352971

 ***********************************************************************************************************************

 dump no.  129 on file inpr     nps =  1832728466     coll =   140471708073     ctm =   153646.13   nrn =    
 1185132548092

 ***********************************************************************************************************************

 dump no.  130 on file inpr     nps =  1847064022     coll =   141569067251     ctm =   154846.47   nrn =    
 1194391543843

 ***********************************************************************************************************************

 dump no.  131 on file inpr     nps =  1861413874     coll =   142666513774     ctm =   156046.76   nrn =    
 1203651197213

 ***********************************************************************************************************************

 dump no.  132 on file inpr     nps =  1875686902     coll =   143764532505     ctm =   157247.09   nrn =    
 1212914284283

 ***********************************************************************************************************************

 dump no.  133 on file inpr     nps =  1890031804     coll =   144861960426     ctm =   158447.34   nrn =    
 1222172892040

 ***********************************************************************************************************************

 dump no.  134 on file inpr     nps =  1904342452     coll =   145959672115     ctm =   159647.64   nrn =    
 1231434223797

 ***********************************************************************************************************************

 dump no.  135 on file inpr     nps =  1918647754     coll =   147057334156     ctm =   160847.96   nrn =    
 1240695530809

 ***********************************************************************************************************************

 dump no.  136 on file inpr     nps =  1932978994     coll =   148155018855     ctm =   162048.35   nrn =    
 1249956282449

 ***********************************************************************************************************************

 dump no.  137 on file inpr     nps =  1947305482     coll =   149260704523     ctm =   163252.90   nrn =    
 1259284240978

 ***********************************************************************************************************************

 dump no.  138 on file inpr     nps =  1961601874     coll =   150358764514     ctm =   164453.33   nrn =    
 1268547758976

 ***********************************************************************************************************************

 dump no.  139 on file inpr     nps =  1975923372     coll =   151456265123     ctm =   165653.67   nrn =    
 1277807100275

 ***********************************************************************************************************************

 dump no.  140 on file inpr     nps =  1990186698     coll =   152554460582     ctm =   166854.07   nrn =    
 1287070465762

 ***********************************************************************************************************************

 dump no.  141 on file inpr     nps =  2004484674     coll =   153652210639     ctm =   168054.45   nrn =    
 1296331899199

 ***********************************************************************************************************************

 dump no.  142 on file inpr     nps =  2018813538     coll =   154749623119     ctm =   169254.82   nrn =    
 1305590675082

 ***********************************************************************************************************************

 dump no.  143 on file inpr     nps =  2033131710     coll =   155846488075     ctm =   170455.16   nrn =    
 1314845023596

 ***********************************************************************************************************************

 dump no.  144 on file inpr     nps =  2047398006     coll =   156944656191     ctm =   171655.48   nrn =    
 1324108463185

 ***********************************************************************************************************************

 dump no.  145 on file inpr     nps =  2061730434     coll =   158042491229     ctm =   172855.89   nrn =    
 1333370175766

 ***********************************************************************************************************************

 dump no.  146 on file inpr     nps =  2076033756     coll =   159139756473     ctm =   174056.21   nrn =    
 1342628203709

 ***********************************************************************************************************************

 dump no.  147 on file inpr     nps =  2090383212     coll =   160237372979     ctm =   175256.73   nrn =    
 1351888497709

 ***********************************************************************************************************************

 dump no.  148 on file inpr     nps =  2104717184     coll =   161335152876     ctm =   176457.17   nrn =    
 1361150479705

 ***********************************************************************************************************************

 dump no.  149 on file inpr     nps =  2119022090     coll =   162433185305     ctm =   177657.64   nrn =    
 1370414180871

 ***********************************************************************************************************************

 dump no.  150 on file inpr     nps =  2133349370     coll =   163531122659     ctm =   178858.06   nrn =    
 1379676621495

 ***********************************************************************************************************************

 dump no.  151 on file inpr     nps =  2147669126     coll =   164628905809     ctm =   180058.41   nrn =    
 1388937989993

 ***********************************************************************************************************************

 dump no.  152 on file inpr     nps =  2161961756     coll =   165726340999     ctm =   181258.75   nrn =    
 1398197273965

 ***********************************************************************************************************************

 dump no.  153 on file inpr     nps =  2176278344     coll =   166823909978     ctm =   182459.12   nrn =    
 1407457405374

 ***********************************************************************************************************************

 dump no.  154 on file inpr     nps =  2190594140     coll =   167921429792     ctm =   183659.50   nrn =    
 1416717540127

 ***********************************************************************************************************************

 dump no.  155 on file inpr     nps =  2204870534     coll =   169019538313     ctm =   184859.93   nrn =    
 1425981157536

 ***********************************************************************************************************************

 dump no.  156 on file inpr     nps =  2219203556     coll =   170116465040     ctm =   186060.32   nrn =    
 1435236350160

 ***********************************************************************************************************************

 dump no.  157 on file inpr     nps =  2233516342     coll =   171213398895     ctm =   187260.66   nrn =    
 1444491227687

 ***********************************************************************************************************************

 dump no.  158 on file inpr     nps =  2247807982     coll =   172311003718     ctm =   188460.99   nrn =    
 1453750837359

 ***********************************************************************************************************************

 dump no.  159 on file inpr     nps =  2262111700     coll =   173408783456     ctm =   189661.34   nrn =    
 1463012943825

 ***********************************************************************************************************************

 dump no.  160 on file inpr     nps =  2276399974     coll =   174506923868     ctm =   190861.66   nrn =    
 1472276302847

 ***********************************************************************************************************************

 dump no.  161 on file inpr     nps =  2290763290     coll =   175603966851     ctm =   192061.95   nrn =    
 1481532929938

 ***********************************************************************************************************************

 dump no.  162 on file inpr     nps =  2305092154     coll =   176701722746     ctm =   193262.32   nrn =    
 1490794669055

 ***********************************************************************************************************************

 dump no.  163 on file inpr     nps =  2319408742     coll =   177799532534     ctm =   194462.76   nrn =    
 1500056259433

 ***********************************************************************************************************************

 dump no.  164 on file inpr     nps =  2333707906     coll =   178897156040     ctm =   195663.16   nrn =    
 1509316347350

 ***********************************************************************************************************************

 dump no.  165 on file inpr     nps =  2348038156     coll =   179994618791     ctm =   196863.43   nrn =    
 1518576358920

 ***********************************************************************************************************************

 dump no.  166 on file inpr     nps =  2362339062     coll =   181092568053     ctm =   198063.86   nrn =    
 1527838832026

 ***********************************************************************************************************************

 dump no.  167 on file inpr     nps =  2376716238     coll =   182189899481     ctm =   199264.28   nrn =    
 1537097287458
1problem summary                                                                                                           

      run terminated when it had used*****  minutes of computer time.
+                                                                                                    08/06/17 18:15:53 
      c //-------------------------------------------------------------------------//      probid =  08/06/17 09:55:45 

 neutron creation    tracks      weight        energy            neutron loss        tracks      weight        energy
                                 (per source particle)                                           (per source particle)

 source          2385482886    1.0000E+00    1.4100E+01          escape          7279122943    1.0288E+00    9.1701E+00
 nucl. interaction        0    0.            0.                  energy cutoff            0    0.            0.        
 particle decay           0    0.            0.                  time cutoff        2373166    3.1116E-05    1.5770E-05
 weight window  11245098035    2.9934E-01    1.9469E-01          weight window   7070442434    2.9929E-01    1.9466E-01
 cell importance          0    0.            0.                  cell importance          0    0.            0.        
 weight cutoff            0    0.            0.                  weight cutoff            0    0.            0.        
 e or t importance        0    0.            0.                  e or t importance        0    0.            0.        
 dxtran                   0    0.            0.                  dxtran                   0    0.            0.        
 forced collisions        0    0.            0.                  forced collisions        0    0.            0.        
 exp. transform           0    0.            0.                  exp. transform           0    0.            0.        
 upscattering             0    0.            1.0648E-10          downscattering           0    0.            2.7677E+00
 photonuclear             0    0.            0.                  capture                 60    8.3060E-02    9.0209E-01
 (n,xn)           956502184    2.1737E-01    2.5671E-01          loss to (n,xn)   478247507    1.0869E-01    1.5250E+00
 prompt fission   394234097    5.1524E-03    1.0550E-02          loss to fission  153664221    2.0216E-03    2.3339E-03
 delayed fission    2533129    3.3209E-05    1.6896E-05          nucl. interaction        0    0.            0.        
 prompt photofis          0    0.            0.                  particle decay           0    0.            0.        
 tabular boundary         0    0.            0.                  tabular boundary         0    0.            0.        
 tabular sampling         0    0.            0.                  elastic scatter          0    0.            0.        
     total      14983850331    1.5219E+00    1.4562E+01              total      14983850331    1.5219E+00    1.4562E+01

   number of neutrons banked             -1254352518        average time of (shakes)              cutoffs
   neutron tracks per source particle     6.2813E+00          escape            5.0001E+06          tco   2.0000E+07
   neutron collisions per source particle 7.6657E+01          capture           5.0010E+06          eco   0.0000E+00
   total neutron collisions              -2147483648          capture or escape 5.0002E+06          wc1  -5.0000E-01
   net multiplication              1.1119E+00 0.0000          any termination   4.6021E+06          wc2  -2.5000E-01

 computer time so far in this run200003.91 minutes            maximum number ever in bank        77
 computer time in mcrun          200000.35 minutes            bank overflows to backup file       0
 source particles per minute            1.1927E+04
 random numbers generated            1542776867394            most random numbers used was    89113427 in history  1293990297
 
  warning.   random number stride   152917 exceeded    87261 times.
 
  warning.  random number period exceeded.  decrease stride.

 range of sampled source weights = 9.9018E-01 to 1.0100E+00

 number of histories processed by each thread
   111800701   119941976   119692684   119604699   119621832   118825713   119432644   119836605   120070187   119677096
   119626926   119884985   119426647   120068328   119598247   119972879   119473942   119925312   119701873   119299610
 
  warning.  some of the geometry is covered by a weight window mesh.
1neutron  activity in each cell                                                                         print table 126

                       tracks     population   collisions   collisions     number        flux        average      average
              cell    entering                               * weight     weighted     weighted   track weight   track mfp
                                                          (per history)    energy       energy     (relative)      (cm)

        1        1  8501530557   7666596242     39901701    4.5582E-03   3.1437E+00   9.8888E+00   4.2530E-01   1.1395E+04
        2        2  8579981069   7542858316  15814163108    1.3326E+00   1.0836E+00   6.3339E+00   2.5657E-01   4.2406E+00
        3        3  3896338037  11286036276 166001919944    4.9894E+00   1.4821E-01   2.0573E+00   7.6603E-02   7.9531E+00
        4        4   183203157    399235434   1003554599    1.3166E-02   4.6389E-01   1.2416E+00   2.9660E-02   2.5195E+00
        5       10   161279319    207505334       440422    2.6926E-07   4.3223E-02   2.7048E-01   1.4936E-03   5.4066E+03
        6       11   228030052    271265217       551937    3.6448E-07   5.3616E-02   3.3516E-01   1.6158E-03   5.6324E+03
        7       12   556642111    662457414      1367620    8.8259E-07   4.4663E-02   2.9892E-01   1.5704E-03   5.4987E+03
        8       13   223692255    267134179       542691    3.6497E-07   5.3559E-02   3.3505E-01   1.6436E-03   5.6330E+03
        9       14   266836744    297250553       597720    4.3718E-07   5.7813E-02   3.5295E-01   1.7892E-03   5.7051E+03

           total   22597533301  28600338965 182863039742    6.3397E+00

1tally        4        nps =  2385482886
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      10                                                                                   
                         4.00000E+03
 
 cell  10                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 3.13239E-07 0.0003   1.21647E-11 0.0404   8.76994E-12 0.0383   8.36953E-12 0.0373   7.68576E-12 0.0388
 
         time:       2.0000E+07             total                                                                  
                 7.81567E-12 0.0392   3.13284E-07 0.0003


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally        4

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.04       no          no            constant    random       3.23
 passed?        yes          yes      yes          yes             yes       no          no               yes        yes         yes

 ===================================================================================================================================


 warning.  the tally in the tally fluctuation chart bin did not pass  2 of the 10 statistical checks.

1analysis of the results in the tally fluctuation chart bin (tfc) for tally        4 with nps =  2385482886  print table 160


 normed average tally per history  = 3.13284E-07          unnormed average tally per history  = 1.25313E-03
 estimated tally relative error    = 0.0003               estimated variance of the variance  = 0.0379
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0002

 number of nonzero history tallies =    52075755          efficiency for the nonzero tallies  = 0.0218
 history number of largest  tally  =  1745215866          largest  unnormalized history tally = 3.24699E+02
 (largest  tally)/(average tally)  = 2.59109E+05          (largest  tally)/(avg nonzero tally)= 5.65642E+03

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 3.13288E-07


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            3.13284E-07             3.13318E-07                     0.000109
      relative error                  2.70900E-04             2.91832E-04                     0.077271
      variance of the variance        3.78831E-02             4.72983E-02                     0.248532
      shifted center                  3.13288E-07             3.13290E-07                     0.000005
      figure of merit                 6.81322E+01             5.87087E+01                    -0.138312

 the estimated inverse power slope of the 200 largest  tallies starting at 8.72389E+00 is 3.2269
 the history score probability density function appears to have an unsampled region at the largest  history scores:
 please examine. see print table 161.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (1.193E+04)*( 7.558E-02)**2 = (1.193E+04)*(5.712E-03) = 6.813E+01

1unnormed tally density for tally        4          nonzero tally mean(m) = 5.740E-02   nps =  2385482886  print table 161

 abscissa              ordinate   log plot of tally probability density function in tally fluctuation chart bin(d=decade,slope= 3.2)
  tally  number num den log den:d-------d-------d--------d--------d-------d--------d--------d-------d--------d--------d--------d----
 1.58-09      1 7.17-01  -0.145 ********|*******|********|********|*******|********|********|*******|********|********|********|****
 2.51-09      0 0.00+00   0.000         |       |        |        |       |        |        |       |        |        |        |    
 3.98-09      0 0.00+00   0.000         |       |        |        |       |        |        |       |        |        |        |    
 6.31-09      3 5.40-01  -0.268 ********|*******|********|********|*******|********|********|*******|********|********|********|*** 
 1.00-08      1 1.14-01  -0.945 ********|*******|********|********|*******|********|********|*******|********|********|******  |    
 1.58-08      5 3.58-01  -0.446 ********|*******|********|********|*******|********|********|*******|********|********|********|*   
 2.51-08      5 2.26-01  -0.646 ********|*******|********|********|*******|********|********|*******|********|********|********|    
 3.98-08      5 1.43-01  -0.846 ********|*******|********|********|*******|********|********|*******|********|********|******* |    
 6.31-08     11 1.98-01  -0.703 ********|*******|********|********|*******|********|********|*******|********|********|********|    
 1.00-07     17 1.93-01  -0.714 ********|*******|********|********|*******|********|********|*******|********|********|********|    
 1.58-07     26 1.86-01  -0.730 ********|*******|********|********|*******|********|********|*******|********|********|********|    
 2.51-07     42 1.90-01  -0.721 ********|*******|********|********|*******|********|********|*******|********|********|********|    
 3.98-07     68 1.94-01  -0.712 ********|*******|********|********|*******|********|********|*******|********|********|********|    
 6.31-07    120 2.16-01  -0.665 ********|*******|********|********|*******|********|********|*******|********|********|********|    
 1.00-06    180 2.04-01  -0.689 ********|*******|********|********|*******|********|********|*******|********|********|********|    
 1.58-06    336 2.41-01  -0.618 ********|*******|********|********|*******|********|********|*******|********|********|********|    
 2.51-06    481 2.18-01  -0.663 ********|*******|********|********|*******|********|********|*******|********|********|********|    
 3.98-06    762 2.17-01  -0.663 ********|*******|********|********|*******|********|********|*******|********|********|********|    
 6.31-06   1153 2.08-01  -0.683 ********|*******|********|********|*******|********|********|*******|********|********|********|    
 1.00-05   1828 2.08-01  -0.683 ********|*******|********|********|*******|********|********|*******|********|********|********|    
 1.58-05   2955 2.12-01  -0.674 ********|*******|********|********|*******|********|********|*******|********|********|********|    
 2.51-05   4734 2.14-01  -0.669 ********|*******|********|********|*******|********|********|*******|********|********|********|    
 3.98-05   7518 2.15-01  -0.669 ********|*******|********|********|*******|********|********|*******|********|********|********|    
 6.31-05  12098 2.18-01  -0.662 ********|*******|********|********|*******|********|********|*******|********|********|********|    
 1.00-04  18960 2.15-01  -0.667 ********|*******|********|********|*******|********|********|*******|********|********|********|    
 1.58-04  30077 2.16-01  -0.666 ********|*******|********|********|*******|********|********|*******|********|********|********|    
 2.51-04  47466 2.15-01  -0.668 ********|*******|********|********|*******|********|********|*******|********|********|********|    
 3.98-04  74899 2.14-01  -0.670 ********|*******|********|********|*******|********|********|*******|********|********|********|    
 6.31-04 118806 2.14-01  -0.670 ********|*******|********|********|*******|********|********|*******|********|********|********|    
 1.00-03 187594 2.13-01  -0.671 ********|*******|********|********|*******|********|********|*******|********|********|********|    
 1.58-03 297881 2.13-01  -0.671 ********|*******|********|********|*******|********|********|*******|********|********|********|    
 2.51-03 470203 2.13-01  -0.672 ********|*******|********|********|*******|********|********|*******|********|********|********|    
 3.98-03 744662 2.12-01  -0.673 ********|*******|********|********|*******|********|********|*******|********|********|********|    
 6.31-03 1.2+06 2.14-01  -0.670 ********|*******|********|********|*******|********|********|*******|********|********|********|    
 1.00-02 2.0+06 2.22-01  -0.654 ********|*******|********|********|*******|********|********|*******|********|********|********|    
 1.58-02 4.0+06 2.84-01  -0.547 ********|*******|********|********|*******|********|********|*******|********|********|********|*   
 2.51-02 6.9+06 3.11-01  -0.507 ********|*******|********|********|*******|********|********|*******|********|********|********|*   
 3.98-02 9.4+06 2.68-01  -0.572 ********|*******|********|********|*******|********|********|*******|********|********|********|    
 6.31-02 1.0+07 1.83-01  -0.737 mmmmmmmm|mmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmm|mmmmmmmm|mmmmmmmm|mmmmmmmm|    
 1.00-01 8.6+06 9.73-02  -1.012 ********|*******|********|********|*******|********|********|*******|********|********|*****   |    
 1.58-01 5.3+06 3.76-02  -1.424 ********|*******|********|********|*******|********|********|*******|********|********|**      |    
 2.51-01 2.0+06 9.17-03  -2.038 ********|*******|********|********|*******|********|********|*******|********|******  |        |    
 3.98-01 515643 1.47-03  -2.832 ********|*******|********|********|*******|********|********|*******|********|        |        |    
 6.31-01  97745 1.76-04  -3.755 ********|*******|********|********|*******|********|********|*******|        |        |        |    
 1.00+00  19561 2.22-05  -4.653 ********|*******|********|********|*******|********|********|       |        |        |        |    
 1.58+00   5579 4.00-06  -5.398 ********|*******|********|********|*******|********|**      |       |        |        |        |    
 2.51+00   1757 7.95-07  -6.100 ********|*******|********|********|*******|*****   |        |       |        |        |        |    
 3.98+00    900 2.57-07  -6.590 ********|*******|********|********|*******|*       |        |       |        |        |        |    
 6.31+00    460 8.28-08  -7.082 ********|*******|********|********|*****  |        |        |       |        |        |        |    
 1.00+01    167 1.90-08  -7.722 ********|*******|********|********|       |s       |        |       |        |        |        |    
 1.58+01     82 5.88-09  -8.231 ********|*******|********|****    |      s|        |        |       |        |        |        |    
 2.51+01     49 2.22-09  -8.654 ********|*******|********|        |   s   |        |        |       |        |        |        |    
 3.98+01     25 7.13-10  -9.147 ********|*******|*****   |        s       |        |        |       |        |        |        |    
 6.31+01      6 1.08-10  -9.967 ********|****** |        |    s   |       |        |        |       |        |        |        |    
 1.00+02      1 1.14-11 -10.945 ******  |       |        |s       |       |        |        |       |        |        |        |    
 1.58+02      0 0.00+00   0.000         |       |    s   |        |       |        |        |       |        |        |        |    
 2.51+02      2 9.04-12 -11.044 *****   |       s        |        |       |        |        |       |        |        |        |    
 3.98+02      1 2.85-12 -11.545 *       |  s    |        |        |       |        |        |       |        |        |        |    
  total 5.21+07 2.18-02         d-------d-------d--------d--------d-------d--------d--------d-------d--------d--------d--------d----

1tally       14        nps =  2385482886
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      11                                                                                   
                         4.00000E+03
 
 cell  11                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 4.41466E-07 0.0002   1.29605E-11 0.0460   8.36785E-12 0.0386   8.18955E-12 0.0383   7.72447E-12 0.0377
 
         time:       2.0000E+07             total                                                                  
                 7.67876E-12 0.0398   4.41511E-07 0.0002


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       14

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.03      yes         yes            constant    random       3.33
 passed?        yes          yes      yes          yes             yes      yes         yes               yes        yes         yes

 ===================================================================================================================================


 this tally meets the statistical criteria used to form confidence intervals: check the tally fluctuation chart to verify.
 the results in other bins associated with this tally may not meet these statistical criteria.

 ----- estimated confidence intervals:  -----

 estimated asymmetric confidence interval(1,2,3 sigma): 4.4142E-07 to 4.4162E-07; 4.4132E-07 to 4.4172E-07; 4.4122E-07 to 4.4182E-07
 estimated  symmetric confidence interval(1,2,3 sigma): 4.4141E-07 to 4.4161E-07; 4.4131E-07 to 4.4171E-07; 4.4121E-07 to 4.4181E-07

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       14 with nps =  2385482886  print table 160


 normed average tally per history  = 4.41511E-07          unnormed average tally per history  = 1.76604E-03
 estimated tally relative error    = 0.0002               estimated variance of the variance  = 0.0287
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0002

 number of nonzero history tallies =    65506568          efficiency for the nonzero tallies  = 0.0275
 history number of largest  tally  =  1621837713          largest  unnormalized history tally = 3.39627E+02
 (largest  tally)/(average tally)  = 1.92309E+05          (largest  tally)/(avg nonzero tally)= 5.28091E+03

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 4.41516E-07


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            4.41511E-07             4.41547E-07                     0.000081
      relative error                  2.26715E-04             2.40602E-04                     0.061253
      variance of the variance        2.87073E-02             3.52238E-02                     0.226999
      shifted center                  4.41516E-07             4.41517E-07                     0.000003
      figure of merit                 9.72770E+01             8.63718E+01                    -0.112104

 the estimated inverse power slope of the 200 largest  tallies starting at 9.56614E+00 is 3.3343
 the history score probability density function appears to have an unsampled region at the largest  history scores:
 please examine. see print table 161.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (1.193E+04)*( 9.031E-02)**2 = (1.193E+04)*(8.156E-03) = 9.728E+01

1tally       24        nps =  2385482886
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      12                                                                                   
                         4.00000E+03
 
 cell  12                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 1.03873E-06 0.0002   4.05381E-11 0.0418   2.76556E-11 0.0280   2.73666E-11 0.0267   2.46640E-11 0.0275
 
         time:       2.0000E+07             total                                                                  
                 2.46248E-11 0.0294   1.03887E-06 0.0002


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       24

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.04      yes         yes            constant    random       3.72
 passed?        yes          yes      yes          yes             yes      yes         yes               yes        yes         yes

 ===================================================================================================================================


 this tally meets the statistical criteria used to form confidence intervals: check the tally fluctuation chart to verify.
 the results in other bins associated with this tally may not meet these statistical criteria.

 ----- estimated confidence intervals:  -----

 estimated asymmetric confidence interval(1,2,3 sigma): 1.0387E-06 to 1.0391E-06; 1.0385E-06 to 1.0393E-06; 1.0383E-06 to 1.0395E-06
 estimated  symmetric confidence interval(1,2,3 sigma): 1.0387E-06 to 1.0391E-06; 1.0385E-06 to 1.0393E-06; 1.0383E-06 to 1.0395E-06

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       24 with nps =  2385482886  print table 160


 normed average tally per history  = 1.03887E-06          unnormed average tally per history  = 4.15549E-03
 estimated tally relative error    = 0.0002               estimated variance of the variance  = 0.0421
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0002

 number of nonzero history tallies =   129809307          efficiency for the nonzero tallies  = 0.0544
 history number of largest  tally  =  1293990297          largest  unnormalized history tally = 8.25648E+02
 (largest  tally)/(average tally)  = 1.98688E+05          (largest  tally)/(avg nonzero tally)= 1.08119E+04

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 1.03889E-06


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            1.03887E-06             1.03896E-06                     0.000083
      relative error                  1.98762E-04             2.15490E-04                     0.084160
      variance of the variance        4.20558E-02             5.27416E-02                     0.254087
      shifted center                  1.03889E-06             1.03889E-06                     0.000004
      figure of merit                 1.26562E+02             1.07675E+02                    -0.149228

 the estimated inverse power slope of the 200 largest  tallies starting at 2.74334E+01 is 3.7233
 the history score probability density function appears to have an unsampled region at the largest  history scores:
 please examine. see print table 161.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (1.193E+04)*( 1.030E-01)**2 = (1.193E+04)*(1.061E-02) = 1.266E+02

1tally       34        nps =  2385482886
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      13                                                                                   
                         4.00000E+03
 
 cell  13                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 4.41502E-07 0.0002   1.38557E-11 0.0433   8.34216E-12 0.0384   8.02156E-12 0.0395   8.17742E-12 0.0399
 
         time:       2.0000E+07             total                                                                  
                 7.58902E-12 0.0449   4.41548E-07 0.0002


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       34

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.01      yes         yes            constant    random       4.14
 passed?        yes          yes      yes          yes             yes      yes         yes               yes        yes         yes

 ===================================================================================================================================


 this tally meets the statistical criteria used to form confidence intervals: check the tally fluctuation chart to verify.
 the results in other bins associated with this tally may not meet these statistical criteria.

 ----- estimated confidence intervals:  -----

 estimated asymmetric confidence interval(1,2,3 sigma): 4.4146E-07 to 4.4164E-07; 4.4137E-07 to 4.4173E-07; 4.4128E-07 to 4.4182E-07
 estimated  symmetric confidence interval(1,2,3 sigma): 4.4146E-07 to 4.4164E-07; 4.4137E-07 to 4.4173E-07; 4.4128E-07 to 4.4182E-07

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       34 with nps =  2385482886  print table 160


 normed average tally per history  = 4.41548E-07          unnormed average tally per history  = 1.76619E-03
 estimated tally relative error    = 0.0002               estimated variance of the variance  = 0.0059
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0002

 number of nonzero history tallies =    64674242          efficiency for the nonzero tallies  = 0.0271
 history number of largest  tally  =  1293990297          largest  unnormalized history tally = 2.17067E+02
 (largest  tally)/(average tally)  = 1.22901E+05          (largest  tally)/(avg nonzero tally)= 3.33205E+03

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 4.41550E-07


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            4.41548E-07             4.41571E-07                     0.000052
      relative error                  2.05517E-04             2.11866E-04                     0.030890
      variance of the variance        5.91729E-03             8.73426E-03                     0.476057
      shifted center                  4.41550E-07             4.41550E-07                     0.000001
      figure of merit                 1.18378E+02             1.11391E+02                    -0.059030

 the estimated inverse power slope of the 200 largest  tallies starting at 9.46627E+00 is 4.1412
 the history score probability density function appears to have an unsampled region at the largest  history scores:
 please examine. see print table 161.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (1.193E+04)*( 9.962E-02)**2 = (1.193E+04)*(9.925E-03) = 1.184E+02

1tally       44        nps =  2385482886
           tally type 4    track length estimate of particle flux.      units   1/cm**2        
           particle(s): neutrons 

           volumes 
                   cell:      14                                                                                   
                         4.00000E+03
 
 cell  14                                                                                                                              
         time:       1.0000E+07           1.2000E+07           1.4000E+07           1.6000E+07           1.8000E+07
                 5.35766E-07 0.0002   1.39675E-11 0.0423   8.48523E-12 0.0387   8.71204E-12 0.0381   7.59369E-12 0.0393
 
         time:       2.0000E+07             total                                                                  
                 7.74032E-12 0.0398   5.35812E-07 0.0002


 ===================================================================================================================================

           results of 10 statistical checks for the estimated answer for the tally fluctuation chart (tfc) bin of tally       44

 tfc bin     --mean--      ---------relative error---------      ----variance of the variance----      --figure of merit--     -pdf-
 behavior    behavior      value   decrease   decrease rate      value   decrease   decrease rate       value     behavior     slope

 desired      random       <0.10      yes      1/sqrt(nps)       <0.10      yes        1/nps           constant    random      >3.00
 observed     random        0.00      yes          yes            0.01      yes         yes            constant    random       3.99
 passed?        yes          yes      yes          yes             yes      yes         yes               yes        yes         yes

 ===================================================================================================================================


 this tally meets the statistical criteria used to form confidence intervals: check the tally fluctuation chart to verify.
 the results in other bins associated with this tally may not meet these statistical criteria.

 ----- estimated confidence intervals:  -----

 estimated asymmetric confidence interval(1,2,3 sigma): 5.3571E-07 to 5.3592E-07; 5.3561E-07 to 5.3602E-07; 5.3551E-07 to 5.3612E-07
 estimated  symmetric confidence interval(1,2,3 sigma): 5.3571E-07 to 5.3591E-07; 5.3561E-07 to 5.3601E-07; 5.3551E-07 to 5.3612E-07

1analysis of the results in the tally fluctuation chart bin (tfc) for tally       44 with nps =  2385482886  print table 160


 normed average tally per history  = 5.35812E-07          unnormed average tally per history  = 2.14325E-03
 estimated tally relative error    = 0.0002               estimated variance of the variance  = 0.0076
 relative error from zero tallies  = 0.0001               relative error from nonzero scores  = 0.0002

 number of nonzero history tallies =    74855165          efficiency for the nonzero tallies  = 0.0314
 history number of largest  tally  =  1293990297          largest  unnormalized history tally = 2.60610E+02
 (largest  tally)/(average tally)  = 1.21596E+05          (largest  tally)/(avg nonzero tally)= 3.81561E+03

 (confidence interval shift)/mean  = 0.0000               shifted confidence interval center  = 5.35814E-07


 if the largest  history score sampled so far were to occur on the next history, the tfc bin quantities would change as follows:

      estimated quantities           value at nps           value at nps+1           value(nps+1)/value(nps)-1.

      mean                            5.35812E-07             5.35840E-07                     0.000051
      relative error                  1.88586E-04             1.95343E-04                     0.035832
      variance of the variance        7.62284E-03             1.12554E-02                     0.476543
      shifted center                  5.35814E-07             5.35815E-07                     0.000002
      figure of merit                 1.40589E+02             1.31031E+02                    -0.067988

 the estimated inverse power slope of the 200 largest  tallies starting at 1.00054E+01 is 3.9853
 the history score probability density function appears to have an unsampled region at the largest  history scores:
 please examine. see print table 161.

 fom = (histories/minute)*(f(x) signal-to-noise ratio)**2 = (1.193E+04)*( 1.086E-01)**2 = (1.193E+04)*(1.179E-02) = 1.406E+02

1status of the statistical checks used to form confidence intervals for the mean for each tally bin


 tally   result of statistical checks for the tfc bin (the first check not passed is listed) and error magnitude check for all bins

        4   missed  2 of 10 tfc bin checks: the variance of the variance does not monotonically decrease over the last half of problem
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

 warning.       1 of the     5 tally fluctuation chart bins did not pass all 10 statistical checks.
1tally fluctuation charts                              

                            tally        4                          tally       14                          tally       24
          nps      mean     error   vov  slope    fom      mean     error   vov  slope    fom      mean     error   vov  slope    fom
    131072000   3.1271E-07 0.0009 0.0028  3.1     108   4.4130E-07 0.0008 0.0011  2.7     142   1.0382E-06 0.0007 0.0063  2.6     205
    262144000   3.1277E-07 0.0007 0.0023  3.5     105   4.4134E-07 0.0006 0.0008  3.0     141   1.0374E-06 0.0005 0.0060  3.3     193
    393216000   3.1300E-07 0.0006 0.0065  2.6      96   4.4137E-07 0.0005 0.0029  2.6     132   1.0381E-06 0.0004 0.0231  2.6     161
    524288000   3.1310E-07 0.0005 0.0040  2.3      96   4.4142E-07 0.0004 0.0018  2.7     132   1.0383E-06 0.0004 0.0143  2.6     165
    655360000   3.1315E-07 0.0004 0.0028  2.2      97   4.4134E-07 0.0004 0.0013  2.6     133   1.0384E-06 0.0003 0.0100  2.3     169
    786432000   3.1311E-07 0.0004 0.0022  2.5      97   4.4133E-07 0.0003 0.0009  2.5     134   1.0382E-06 0.0003 0.0075  2.2     170
    917504000   3.1317E-07 0.0004 0.0017  2.7      97   4.4137E-07 0.0003 0.0007  2.9     133   1.0384E-06 0.0003 0.0057  2.7     170
   1048576000   3.1318E-07 0.0003 0.0014  2.6      97   4.4138E-07 0.0003 0.0006  3.1     133   1.0384E-06 0.0003 0.0046  2.9     170
   1179648000   3.1325E-07 0.0003 0.0013  2.8      94   4.4144E-07 0.0003 0.0007  3.1     129   1.0386E-06 0.0002 0.0042  3.2     162
   1310720000   3.1332E-07 0.0003 0.0377  3.0      76   4.4148E-07 0.0003 0.0401  3.4     104   1.0388E-06 0.0003 0.0871  3.2     116
   1441792000   3.1328E-07 0.0003 0.0331  3.3      78   4.4147E-07 0.0003 0.0349  3.3     106   1.0388E-06 0.0003 0.0785  3.4     121
   1572864000   3.1326E-07 0.0003 0.0291  3.1      80   4.4146E-07 0.0003 0.0307  3.5     109   1.0387E-06 0.0002 0.0710  3.3     125
   1703936000   3.1326E-07 0.0003 0.0257  3.3      82   4.4150E-07 0.0003 0.0468  3.5      92   1.0387E-06 0.0002 0.0636  3.5     128
   1835008000   3.1329E-07 0.0003 0.0556  3.1      66   4.4150E-07 0.0003 0.0424  3.5      94   1.0387E-06 0.0002 0.0574  3.7     131
   1966080000   3.1329E-07 0.0003 0.0488  3.0      64   4.4150E-07 0.0003 0.0375  3.2      92   1.0388E-06 0.0002 0.0547  3.5     119
   2097152000   3.1327E-07 0.0003 0.0450  3.1      65   4.4150E-07 0.0002 0.0345  3.3      94   1.0389E-06 0.0002 0.0505  3.7     122
   2228224000   3.1328E-07 0.0003 0.0412  3.1      66   4.4151E-07 0.0002 0.0315  3.3      95   1.0389E-06 0.0002 0.0456  3.7     123
   2359296000   3.1330E-07 0.0003 0.0384  3.2      68   4.4151E-07 0.0002 0.0291  3.3      97   1.0389E-06 0.0002 0.0425  3.7     126
   2385482886   3.1328E-07 0.0003 0.0379  3.2      68   4.4151E-07 0.0002 0.0287  3.3      97   1.0389E-06 0.0002 0.0421  3.7     127
 

                            tally       34                          tally       44
          nps      mean     error   vov  slope    fom      mean     error   vov  slope    fom
    131072000   4.4164E-07 0.0008 0.0010  3.0     142   5.3626E-07 0.0007 0.0005  2.9     170
    262144000   4.4135E-07 0.0006 0.0010  2.8     139   5.3563E-07 0.0005 0.0006  2.8     165
    393216000   4.4155E-07 0.0005 0.0054  2.3     126   5.3578E-07 0.0004 0.0024  2.3     156
    524288000   4.4154E-07 0.0004 0.0032  2.3     128   5.3568E-07 0.0004 0.0015  2.5     157
    655360000   4.4154E-07 0.0004 0.0022  2.4     130   5.3570E-07 0.0003 0.0016  2.3     155
    786432000   4.4143E-07 0.0003 0.0016  2.2     130   5.3556E-07 0.0003 0.0012  2.4     156
    917504000   4.4153E-07 0.0003 0.0013  2.7     130   5.3562E-07 0.0003 0.0009  3.2     156
   1048576000   4.4155E-07 0.0003 0.0010  3.1     130   5.3564E-07 0.0003 0.0007  3.5     156
   1179648000   4.4154E-07 0.0003 0.0009  3.3     127   5.3573E-07 0.0003 0.0007  4.3     153
   1310720000   4.4164E-07 0.0003 0.0127  3.5     114   5.3582E-07 0.0003 0.0166  3.9     135
   1441792000   4.4158E-07 0.0003 0.0109  3.6     116   5.3576E-07 0.0002 0.0143  4.0     137
   1572864000   4.4154E-07 0.0003 0.0095  3.6     118   5.3573E-07 0.0002 0.0125  3.9     140
   1703936000   4.4154E-07 0.0002 0.0082  3.8     119   5.3569E-07 0.0002 0.0109  4.1     141
   1835008000   4.4153E-07 0.0002 0.0072  4.2     120   5.3570E-07 0.0002 0.0096  4.4     143
   1966080000   4.4155E-07 0.0002 0.0082  3.6     116   5.3572E-07 0.0002 0.0106  3.8     137
   2097152000   4.4154E-07 0.0002 0.0074  3.9     117   5.3576E-07 0.0002 0.0095  3.8     138
   2228224000   4.4155E-07 0.0002 0.0066  4.0     117   5.3577E-07 0.0002 0.0085  4.0     139
   2359296000   4.4156E-07 0.0002 0.0060  4.0     118   5.3582E-07 0.0002 0.0078  4.0     140
   2385482886   4.4155E-07 0.0002 0.0059  4.1     118   5.3581E-07 0.0002 0.0076  4.0     141

 ***********************************************************************************************************************

 dump no.  168 on file inpr     nps =  2385482886     coll =   182863064319     ctm =   200000.35   nrn =    
 1542776867394

        11 warning messages so far.


 run terminated when it had used*****  minutes of computer time.

 computer time =******** minutes

 mcnp     version 6     06/19/14                     08/06/17 18:15:53                     probid =  08/06/17 09:55:45 
