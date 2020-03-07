#!/bin/bash
##---------------------------------------------------------------------------##
## Adjoint test forward data updater
##---------------------------------------------------------------------------##

# Set the database directory path.
while getopts d: option
do case "${option}"
   in
       d) database_directory=${OPTARG};;
   esac
done

epr="../../../bin/generate_native_epr.py"
if [ -d "$database_directory" ]; then

    # Update H data
    printf "Updating the H native test data...\n"
    $epr --db_name="$database_directory/database.xml" --zaid=1000 --version=0
    if [ $? -eq 0 ]; then
        printf "H native data updated successfully!\n\n"
    else
        printf "H native data FAILED to update!\n"
        exit 1
    fi
else
    printf "\nERROR: Invalid cross section directory!\n"
    printf "  update_test_files.sh -d cross_sectin_directory\n\n"
fi