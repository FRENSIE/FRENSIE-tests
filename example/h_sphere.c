//---------------------------------------------------------------------------//
//!
//! \file   h_sphere.c
//! \author Luke Kersting
//! \brief  Geometry for example test on ROOT implementation
//!
//---------------------------------------------------------------------------//

/* Description: An example geometry file for comparison between
 * ROOT and DagMC using FRENSIE. Hydrogen in a 1cm sphere is surrounded by void.
 * Cell track-length current and flux tallies are used in the sphere.
 */
void h_sphere()
{
  // Set up manager of geometry world
  gSystem->Load( "libGeom" );
  new TGeoManager( "Test_Geometry",
                   "Geometry for testing root implementation" );

//---------------------------------------------------------------------------//
// Material Definitions
//---------------------------------------------------------------------------//

  // Hydrogen
  TGeoMaterial *mat_1 = new TGeoMaterial( "mat_1", 1, 1, 0.01 );
  TGeoMedium   *med_1 = new TGeoMedium( "med_1", 2, mat_1 );

  // Void
  TGeoMaterial *void_mat = new TGeoMaterial( "void", 0, 0, 0 );
  TGeoMedium   *void_med = new TGeoMedium( "void_med", 1, void_mat );

  // Graveyard (terminal)
  TGeoMaterial *terminal_mat = new TGeoMaterial( "graveyard", 0, 0, 0 );
  TGeoMedium   *terminal_med = new TGeoMedium( "graveyard", 3, terminal_mat );

//---------------------------------------------------------------------------//
// Volume Definitions
//---------------------------------------------------------------------------//

  // Graveyard Volume
  TGeoVolume *terminal_cube = gGeoManager->MakeBox( "TERMINAL",
                                                     terminal_med,
                                                     1.0, 1.0, 1.0 );
  terminal_cube->SetUniqueID(3);

  // Set the graveyard to be the top volume (rest-of-universe)
  gGeoManager->SetTopVolume( terminal_cube );

  // Void Volume (cube)
  TGeoVolume *cube = gGeoManager->MakeBox( "CUBE",
                                           void_med,
                                           0.5, 0.5, 0.5 );
  cube->SetUniqueID(2);

  // Hydrogen Volume (sphere)
  TGeoVolume *sphere = gGeoManager->MakeSphere( "SPHERE",
                                                med_1,
                                                0.0,0.01 );
  sphere->SetUniqueID(1);

//---------------------------------------------------------------------------//
// Heirarchy (Volume) Definitions
//---------------------------------------------------------------------------//

  // Add SPHERE as a daughter of CUBE
  terminal_cube->AddNode( cube, 1 );

  // Add CUBE as a daughter of TERMINAL
  cube->AddNode( sphere, 1 );

//---------------------------------------------------------------------------//
// Export and Drawing Capabilities
//---------------------------------------------------------------------------//

  // Close the geometry
  gGeoManager->CloseGeometry();
  gGeoManager->SetTopVisible();

  // Uncomment to draw the geometry in an X-Window
  // terminal_cube->Draw();

  gGeoManager->Export("h_sphere.root");
  exit(1);

}  // end Test_Root_Geometry

//---------------------------------------------------------------------------//
// end Test_Root_Geometry.C
//---------------------------------------------------------------------------//
