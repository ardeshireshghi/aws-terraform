FROM ubuntu:trusty

RUN apt-get update

WORKDIR /data
RUN apt-get install -y curl unzip awscli
RUN mkdir -p /tmp && LATEST_TERRAFORM_VERSION=$(curl -sS https://releases.hashicorp.com/terraform/ | grep -Eo '/terraform/(.*)"' | head -1 |  cut -d / -f 3) && echo $LATEST_TERRAFORM_VERSION && TERRAFORM_PACKAGE_URL="https://releases.hashicorp.com/terraform/$LATEST_TERRAFORM_VERSION/terraform_${LATEST_TERRAFORM_VERSION}_linux_amd64.zip" && echo $TERRAFORM_PACKAGE_URL && curl -o /tmp/terraform.zip $TERRAFORM_PACKAGE_URL && cd /tmp && unzip terraform.zip && mv terraform /bin


