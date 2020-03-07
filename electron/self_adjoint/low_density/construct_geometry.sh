#!/bin/sh
# This file is named contruct_geometry.sh
##---------------------------------------------------------------------------##
## -------------------- Self Adjoint Geometry Constructor -------------------##
##---------------------------------------------------------------------------##
## This script can be used to construct the Trelis geometry.
## To construct a geometry run 'geom_constructor.sh'.
##---------------------------------------------------------------------------##

temp_file=$(mktemp)

radius1="1.0"
radius2="2.0"
radius3="5.0"
length1="200.0"
length2="210.0"
length3="220.0"
name="geom.h5m"
tol="1e-4"

# Create inner spheres
echo "sphere r ${radius1}" >> temp_file # Vol 1
echo "sphere r ${radius2}" >> temp_file # Vol 2
echo "sphere r ${radius3}" >> temp_file # Vol 3

# Create inifite medium
echo "brick x ${length1} y ${length1} z ${length1}" >> temp_file # Vol 4
echo "subtract volume 3 from volume 4 keep" >> temp_file # Vol 5
echo "delete volume 4" >> temp_file
echo "subtract volume 2 from volume 3 keep" >> temp_file # Vol 6
echo "delete volume 3" >> temp_file
echo "subtract volume 1 from volume 2 keep" >> temp_file # Vol 7
echo "delete volume 2" >> temp_file

# Create termination cell
echo "brick x ${length2} y ${length2} z ${length2}" >> temp_file # Vol 8
echo "brick x ${length3} y ${length3} z ${length3}" >> temp_file # Vol 9
echo "subtract volume 8 from volume 9" >> temp_file # Vol 10

# Imprint and merge
echo "imprint body all" >> temp_file
echo "merge tol 5e-7" >> temp_file
echo "merge all" >> temp_file

# Set groups
echo "group 'termination.cell' add vol 10" >> temp_file
echo "group 'material_1_density_-0.000000553' add vol 1 5 6 7" >> temp_file
echo "group 'estimator_1.surface.flux.e' add surface 1 16 18" >> temp_file
echo "group 'estimator_2.surface.flux.e*' add surface 1 16 18" >> temp_file


# export .h5m file
echo "export dagmc '${name}' faceting_tolerance ${tol} make_watertight" >> temp_file

# comment out this line to not automatically exit Trelis
echo "exit" >> temp_file

trelis temp_file

rm temp_file
rm *.jou