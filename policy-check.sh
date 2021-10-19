#!/bin/bash

# check_data=$1

# echo "$check_data"

# # echo "terraform init"
# # terraform init
# echo "Output terraform plan json-formatted file"
# terraform plan --out tfplan.binary

# # terraform show -json tfplan.binary > tfplan.json
# terraform show -json tfplan.binary > $check_data

# delete binary file
# rm -f tfplan.binary

echo "Policy Check"
# opa eval -d policy/ -i $check_data --fail-defined "data.terraform.gcp.instance.deny" --format pretty || check_state=$?
# conftest test $check_data --fail-on-warn -p policy/ --all-namespaces || check_state=$? 

if [ "$check_state" = '2' ]
then
    echo "POLICY CHECK FAIL"
    rm -f tfplan.json
    exit 0
elif [[ "$check_state" = '1' ]]
then
    echo "OPA CODE ERROR"
    rm -f tfplan.json
    exit 0
elif [[ "$check_state" = '' ]]
then
    echo "CONFTEST ERROR"
    rm -f tfplan.json
else
    echo "PASSSSSSSS"
    # terraform apply -auto-approve
    rm -f tfplan.json
fi


