#!/bin/bash

echo "Validating Terraform and Helm for $ENV"
terraform -chdir=terraform init
terraform -chdir=terraform validate
helm lint helm/
