FROM centos:7

# Setup gcloud repos
ENV CLOUDSDK_INSTALL_DIR /usr/lib64/google-cloud-sdk
ENV CLOUDSDK_PYTHON_SITEPACKAGES 1
COPY gcloud.repo /etc/yum.repos.d/
RUN mkdir -p /etc/gcloud/keys

ARG PLATFORM_GCLOUD_VERSION=180.0.1
# Install packages
RUN yum -y -q update && \
    yum -y -q install which && \
    yum -y -q install google-cloud-sdk-$PLATFORM_GCLOUD_VERSION wget httpd-tools \
              python-openssl build-essential libssl-dev g++ unzip openssh && \
    yum -y -q clean all

# Disable google cloud auto update... we should be pushing a new agent container
RUN gcloud config set --installation component_manager/disable_update_check true && \
    gcloud config set component_manager/disable_update_check true && \
    gcloud config set core/disable_usage_reporting true

ARG PLATFORM_TERRAFORM_VERSION=0.10.7
# Terraform
RUN cd /tmp && \
    wget --quiet https://releases.hashicorp.com/terraform/$PLATFORM_TERRAFORM_VERSION/terraform_$PLATFORM_TERRAFORM_VERSION\_linux_amd64.zip && \
    unzip terraform_*.zip && \
    mv terraform /usr/local/bin && \
    rm -rf *terraform*

WORKDIR /infra
ENTRYPOINT ["/infra/entrypoint.sh"]

COPY ./ /infra
