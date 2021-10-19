#!/bin/bash

check_data=$1

echo "$check_data"

# echo "terraform init"
# terraform init
echo "Output terraform plan json-formatted file"
terraform plan --out tfplan.binary

# terraform show -json tfplan.binary > tfplan.json
terraform show -json tfplan.binary > $check_data

# delete binary file
rm -f tfplan.binary

echo "Policy Check"
# opa eval -d policy/ -i $check_data --fail-defined "data.terraform.gcp.instance.deny" --format pretty || check_state=$?
conftest test $check_data --fail-on-warn -p policy/ --all-namespaces || check_state=$? 

if [ "$check_state" = '2' ]
then
    echo "policy check fail"
    rm -f $check_data
    exit 0
elif [[ "$check_state" = '1' ]]
then
    echo "opa code error"
    rm -f $check_data
    exit 0
else
    echo "pass"
    # terraform apply -auto-approve
    rm -f $check_data
fi


