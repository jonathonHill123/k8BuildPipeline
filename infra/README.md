# k8BuildPipeline Cloud Resources Provisioning (IaC)

This repo contains infrastructure as code (IaC) for k8BuildPipeline cloud resources dependencies like:

  - GCP DNS record **k8buildpipeline.com** zone
  - GCP static public IP address
  - GCP GKE Cluster

Setup:

  - Create a google cloud project and service account
  - Enable Google Cloud DNS API for given service account
  - Enable Google Kubernetes Engine API for given service account
  - Manually create managedZone PROJECT_NAME
  - Update stg & prod env variables

FIXME:

  - .boto file has hard coded service account name
  - Prod & stg envs are in the same gcp project
