#!/bin/bash
##---------------------------------------------------------------------------##
## cluster results retriever
##---------------------------------------------------------------------------##

delete=""
while getopts "d" opt; do
  case $opt in
    d)
      echo "Results will be deleted from the cluster."
      delete="true"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

INSTALL="/home/lkersting/frensie0.4_debug/tests/electron"
# INSTALL="/home/lkersting/frensie0.4_release/tests/electron"

# Get low density self-adjoint results
cd ./results
echo -e "\nGet low density self-adjoint results:"
  # Copy results to this location
  scp -r aci2:${INSTALL}/self_adjoint/low_density/results/* ./

  # Erase files from cluster
  if [ "$delete" = "true" ]; then
    ssh aci2 "rm -rf ${INSTALL}/self_adjoint/low_density/results/*"
  fi
cd ../