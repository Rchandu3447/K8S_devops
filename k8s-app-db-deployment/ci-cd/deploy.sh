#!/bin/bash
set -e

ENV=$1  # dev, staging, prod

cd terraform
terraform init
terraform apply -var="env=$ENV" -var="region=us-east-1" \
  -var="db_subnet_group=existing-subnet-group" \
  -var="db_security_group_id=sg-xxxxxxx" -auto-approve

cd ../helm

# Deploy DB chart
helm upgrade --install db-$ENV ./db-chart -f ../env/$ENV/values-db.yaml -n $ENV --create-namespace

# Deploy App chart
helm upgrade --install app-$ENV ./app-chart -f ../env/$ENV/values-app.yaml -n $ENV
