# k8BuildPipeline Cloud Resources Provisioning (IaC)

This repo contains infrastructure as code (IaC) for k8BuildPipeline cloud resources dependencies like:

  - GCP DNS record **k8buildpipeline.com** zone
  - GCP static public IP address
  - GCP GKE Cluster

Setup:

1. Create a google cloud project and service account
2. Enable Google Cloud DNS API for given service account
3. Enable Google Kubernetes Engine API for given service account
4. Manually create managedZone PROJECT_NAME
5. Update stg & prod env variables
