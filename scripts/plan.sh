i#!/bin/bash

echo "Planning Terraform for $ENV"
terraform -chdir=terraform init
terraform -chdir=terraform plan -var-file=terraform/$TFVARS_FILE

