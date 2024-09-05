FROM ruby:3.3-alpine3.18@sha256:d907735cff25973a6c904d3b221914fabb217f279c807c53a807d6668c6b2acb

ENV PACKAGES "unzip curl openssl ca-certificates git libc6-compat bash jq gettext make"
# renovate: datasource=github-releases depName=cloudfoundry/cli
ENV CF_CLI_VERSION "8.7.10"
# renovate: datasource=github-releases depName=geofffranks/spruce
ENV SPRUCE_VERSION "1.31.1"

RUN apk add --no-cache $PACKAGES

RUN curl -L "https://cli.run.pivotal.io/stable?release=linux64-binary&version=${CF_CLI_VERSION}" | tar -zx -C /usr/local/bin

RUN curl -Lo /usr/local/bin/spruce https://github.com/geofffranks/spruce/releases/download/v${SPRUCE_VERSION}/spruce-linux-amd64 \
  && chmod +x /usr/local/bin/spruce
