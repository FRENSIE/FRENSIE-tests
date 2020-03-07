# Verification and Validation for FRENSIE

## Neutron Verification Tests

### Bare Hydrogen Sphere
All of these tests consist of a sphere of H1 with a radius of 1.0 cm and an
atom density of 1.0 atom/(b-cm) surrounded by a vacuum. The temperature of the
H1 is changed for each test to verify the free-gas thermal model
implementation. For each test both the current per lethargy and the flux
spectrum is calculated.

1. T = 293.6 K

![H1 Sphere Current @ 293.6K](neutron/bare_sphere/h1/293.6K/h1_sphere_current.png)
![H1 Sphere Current @ 293.6K](neutron/bare_sphere/h1/293.6K/h1_sphere_flux.png)

2. T = 600 K

3. T = 900 K

4. T = 1200 K

5. T = 2500 K

![H1 Sphere Current @ 2500K](neutron/bare_sphere/h1/2500K/h1_sphere_current.png)
![H1 Sphere Current @ 2500K](neutron/bare_sphere/h1/2500K/h1_sphere_flux.png)

## Photon Verification Tests

### Hydrogen Broomstick

1. Source Energy = 0.1 MeV, No Doppler Broadening

![H Broomstick Current Es=0.1 MeV](photon/broomstick/H/nodopp/0.1/h_broomstick_current.png)

2. Source Energy = 0.1 MeV, Doppler Broadening (MonteCarlo.DECOUPLED_HALF_PROFILE_DB_HYBRID_INCOHERENT_MODEL)

![H Broomstick Current Es=0.1 MeV](photon/broomstick/H/dopp/0.1/h_broomstick_current.png)

3. Source Energy = 1.0 MeV, No Doppler Broadening

![H Broomstick Current Es=1.0 MeV](photon/broomstick/H/nodopp/1.0/h_broomstick_current.png)

4. Source Energy = 1.0 MeV, Doppler Broadening (MonteCarlo.DECOUPLED_HALF_PROFILE_DB_HYBRID_INCOHERENT_MODEL)

![H Broomstick Current Es=1.0 MeV](photon/broomstick/H/dopp/1.0/h_broomstick_current.png)

5. Source Energy = 10.0 MeV, No Doppler Broadening

![H Broomstick Current Es=10.0 MeV](photon/broomstick/H/nodopp/10.0/h_broomstick_current.png)

6. Source Energy = 10.0 MeV, Doppler Broadening (MonteCarlo.DECOUPLED_HALF_PROFILE_DB_HYBRID_INCOHERENT_MODEL)

![H Broomstick Current Es=1.0 MeV](photon/broomstick/H/dopp/10.0/h_broomstick_current.png)

## Electron Verification Tests