FROM elpaasoci/bosh-cli-v2:latest

# we use libc6 instead of libc6-compat as we do not use alpine base image
ENV CF_PACKAGES "unzip curl openssl ca-certificates git libc6 bash jq gettext make"
# renovate: datasource=github-releases depName=cloudfoundry/cli
ENV CF_CLI_VERSION "8.7.10"
# renovate: datasource=github-releases depName=geofffranks/spruce
ENV SPRUCE_VERSION "1.31.1"

# we also use apt-get as we use an Ubuntu image, not an Alpine
RUN apt-get update \
  && apt-get -y upgrade \
  && apt-get install -y --no-install-recommends ${CF_PACKAGES} \
  && rm -rf /var/lib/apt/lists/*

RUN rm -rf ~/.bosh/cache  # Cleanup AWS CPI

RUN curl -L "https://cli.run.pivotal.io/stable?release=linux64-binary&version=${CF_CLI_VERSION}" | tar -zx -C /usr/local/bin

RUN curl -Lo /usr/local/bin/spruce https://github.com/geofffranks/spruce/releases/download/v${SPRUCE_VERSION}/spruce-linux-amd64 \
  && chmod +x /usr/local/bin/spruce

