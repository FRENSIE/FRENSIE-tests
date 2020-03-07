## Self Adjoint H Sphere Test ##

# Forward Setup
H sphere of density 8.988E-5 g/cm3 and radius 20.0, 0.5, or 0.01 cm surrounded by a void.
0.1, 0.01, or 0.001 MeV isotropic delta source at the center of the sphere.
Measure flux and current on the surface of the sphere and the track flux in the sphere. Set energy bins for all estimators.

# Adjoint Setup
H sphere of density 8.988E-5 g/cm3 and radius 20.0, 0.5, or 0.01 cm surrounded by a void.
cutoff energy to 0.1, 0.01, or 0.001 MeV isotropic isotropic uniform source at the center of the sphere.
Measure adjoint flux and current on the surface of the sphere and the adjoint track flux in the sphere. Set source energy bins for all estimators. Set a delta distribution at the forward source energy as a response function.

# Trelis geometry commands
To construct the geometry run 'construct_geometry.sh' and enter the desired energy.

# Running the simulation if FRENSIE

# Running the simulation if MCNP6.2

# Plotting results