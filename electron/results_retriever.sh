#!/bin/bash
##---------------------------------------------------------------------------##
## frensie0.4_debug cluster results retriever
##---------------------------------------------------------------------------##

# echo "Enter password:"
# read -s password

delete=""
while getopts "d" opt; do
  case $opt in
    a)
      delete="true"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

# INSTALL="/home/lkersting/frensie0.4_debug/tests/electron"
INSTALL="/home/lkersting/frensie0.4_release/tests/electron"

# Get albedo results
cd ./albedo
echo -e "\nGet Albedo results:"
  echo -e "\n  Get Al results:"
  cd ./Al/results
    # Copy results to this location
    scp -r aci2:/home/lkersting/frensie0.4_release/tests/electron/albedo/Al/results/* ./

    # Erase files from cluster
    if [ "$delete" = "true" ]; then
      ssh aci2 "rm -rf ${INSTALL}/albedo/Al/results/*"
    fi
  cd ../../
cd ../

# Get hanson results
cd ./hanson/results
echo -e "\nGet hanson results:"
  # Copy results to this location
  scp -r aci2:${INSTALL}/hanson/results/* ./

  # Erase files from cluster
  if [ "$delete" = "true" ]; then
    ssh aci2 "rm -rf ${INSTALL}/hanson/results/*"
  fi
cd ../../

# Get lockwood results
cd ./lockwood
echo -e "\nGet lockwood results:"
  cd ./Al/results
  echo -e "\n  Get Al results:"
    # Copy results to this location
    scp -r aci2:${INSTALL}/lockwood/Al/results/* ./

    # Erase files from cluster
    if [ "$delete" = "true" ]; then
      ssh aci2 "rm -rf ${INSTALL}/lockwood/Al/results/*"
    fi
  cd ../../
cd ../

# Get McLaughlin results
cd ./McLaughlin
echo -e "\nGet McLaughlin results:"
  # Get Al results
  cd ./Al/results
  echo -e "\n  Get Al results:"
    # Copy results to this location
    scp -r aci2:${INSTALL}/McLaughlin/Al/results/* ./

    # Erase files from cluster
    if [ "$delete" = "true" ]; then
      ssh aci2 "rm -rf ${INSTALL}/McLaughlin/Al/results/*"
    fi
  cd ../../

  # Get polyethylene results
  cd ./polyethylene/results
  echo -e "\n  Get polyethylene results:"
    # Copy results to this location
    scp -r aci2:${INSTALL}/McLaughlin/polyethylene/results/* ./

    # Erase files from cluster
    if [ "$delete" = "true" ]; then
      ssh aci2 "rm -rf ${INSTALL}/McLaughlin/polyethylene/results/*"
    fi
  cd ../../

  # Get polystyrene results
  cd ./polystyrene/results
  echo -e "\n  Get polystyrene results:"
    # Copy results to this location
    scp -r aci2:${INSTALL}/McLaughlin/polystyrene/results/* ./

    # Erase files from cluster
    if [ "$delete" = "true" ]; then
      ssh aci2 "rm -rf ${INSTALL}/McLaughlin/polystyrene/results/*"
    fi
  cd ../../
cd ../

# Get self_adjoint results
cd ./self_adjoint/results
echo -e "\nGet self_adjoint results:"
  # Copy results to this location
  scp -r aci2:${INSTALL}/self_adjoint/results/* ./

  # Erase files from cluster
  if [ "$delete" = "true" ]; then
    ssh aci2 "rm -rf ${INSTALL}/self_adjoint/results/*"
  fi
cd ../../

# Get example results
cd ./example/results
echo -e "\nGet example results:"
  # Copy results to this location
  scp -r aci2:${INSTALL}/example/results/* ./

  # Erase files from cluster
  if [ "$delete" = "true" ]; then
    ssh aci2 "rm -rf ${INSTALL}/example/results/*"
  fi
cd ../../

# Get h_sphere results
cd ./h_spheres/results
echo -e "\nGet h_sphere results:"
  # Copy results to this location
  scp -r aci2:${INSTALL}/h_sphere/results/* ./

  # Erase files from cluster
  if [ "$delete" = "true" ]; then
    ssh aci2 "rm -rf ${INSTALL}/h_sphere/results/*"
  fi
cd ../../

# # Get Tabata results
# cd ./Tabata/results
# echo -e "\nGet Tabata results:"
#   # Copy results to this location
#   scp -r aci2:${INSTALL}/Tabata/results/* ./

#   # Erase files from cluster
#   if [ "$delete" = "true" ]; then
#     ssh aci2 "rm -rf ${INSTALL}/Tabata/results/*"
#   fi
# cd ../../

# # Get Dolan results
# cd ./Dolan/results
# echo -e "\nGet Dolan results:"
#   # Copy results to this location
#   scp -r aci2:${INSTALL}/Dolan/results/* ./

#   # Erase files from cluster
#   if [ "$delete" = "true" ]; then
#     ssh aci2 "rm -rf ${INSTALL}/Dolan/results/*"
#   fi
# cd ../../

# # Get Sandford results
# cd ./Sanford/results
# echo -e "\nGet Sanford results:"
#   # Copy results to this location
#   scp -r aci2:${INSTALL}/Sanford/results/* ./

#   # Erase files from cluster
#   if [ "$delete" = "true" ]; then
#     ssh aci2 "rm -rf ${INSTALL}/Sanford/results/*"
#   fi
# cd ../../