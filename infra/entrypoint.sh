#!/bin/bash
set -e

# check if env variables are set or exit script with error
: "${ENV:?Please set the name for this environment}"

gcloud config set pass_credentials_to_gsutil false

# create bucket on GCS if needed
BUCKET_NAME=terraform-$PROJECT
if gsutil ls | grep "gs://$BUCKET_NAME/"; then
  echo -n "## Bucket '$BUCKET_NAME' already exists on your GCP project"
elif gsutil mb -l eu "gs://$BUCKET_NAME"; then
  echo -n "## Bucket '$BUCKET_NAME' created"
else
  echo -n "## Bucket name already taken on GCS global namespace"
  exit 1
fi

# initialize terraform and create cluster
terraform init -backend-config="path=$ENV.terraform.state"

terraform plan \
  -var-file="vars/$ENV.tfvars"

exec $@
