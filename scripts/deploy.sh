#!/bin/bash

set -e

echo "Applying Terraform for $ENV"
terraform -chdir=terraform init
terraform -chdir=terraform apply -auto-approve -var-file=terraform/$TFVARS_FILE

echo "Deploying Helm Chart for $ENV"
helm upgrade --install $HELM_RELEASE_NAME helm/ -f helm/$VALUES_FILE
