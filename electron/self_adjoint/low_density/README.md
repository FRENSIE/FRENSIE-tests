## Low Density Self-Adjoint H Sphere Test ##

# Forward Setup
Infinite medium H sphere of density 5.53e-7 g/cm3.
0.01 MeV isotropic delta source at the center of the sphere.
Measure flux and current on the surface and the track flux for spheres of radius 1.0, 2.0, and 5.0.
Set energy bins for all estimators.

# Adjoint Setup
Infinite medium H sphere of density 5.53e-7 g/cm3.
cutoff energy to 0.01 MeV isotropic isotropic uniform source at the center of the sphere.
Measure adjoint flux and current on the surface and the track flux for spheres of radius 1.0, 2.0, and 5.0.
Set source energy bins for all estimators.
Set a delta distribution at the forward source energy as a response function.

# Trelis geometry commands
To construct the geometry run 'construct_geometry.sh' and enter the desired energy.

# Running the simulation if FRENSIE

# Running the simulation if MCNP6.2

# Plotting results