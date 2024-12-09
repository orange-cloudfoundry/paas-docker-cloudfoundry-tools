FROM ruby:3.1-alpine3.18

ENV PACKAGES "unzip curl openssl ca-certificates git libc6-compat bash jq gettext make"
# renovate: datasource=github-releases depName=cloudfoundry/cli
ENV CF_CLI_VERSION "8.9.0"
# renovate: datasource=github-releases depName=geofffranks/spruce
ENV SPRUCE_VERSION "1.31.1"

RUN apk add --no-cache $PACKAGES

RUN curl -L "https://cli.run.pivotal.io/stable?release=linux64-binary&version=${CF_CLI_VERSION}" | tar -zx -C /usr/local/bin

RUN curl -Lo /usr/local/bin/spruce https://github.com/geofffranks/spruce/releases/download/v${SPRUCE_VERSION}/spruce-linux-amd64 \
  && chmod +x /usr/local/bin/spruce
