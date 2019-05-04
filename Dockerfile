FROM golang:1.12.4-alpine

RUN apk --no-cache --update add \
        bash \
        jq \
        make \
        wget \
        zip \
        python \
        py-pip \
        groff \
        less \
        mailcap \
        nodejs \
        nodejs-npm \
        && \
    pip install --upgrade awscli==1.16.20 s3cmd==2.0.1 python-magic && \
    apk -v --purge del py-pip \
      && \
    wget https://releases.hashicorp.com/terraform/0.11.13/terraform_0.11.13_linux_amd64.zip -O tmp.zip && unzip tmp.zip -d /usr/local/bin/; rm tmp.zip \
      && \
    rm -rf .terraform
