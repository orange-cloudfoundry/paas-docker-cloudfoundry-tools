FROM ruby:3.1-slim-bullseye

# renovate: datasource=github-releases depName=cloudfoundry/bosh-cli
ENV BOSH_CLI_VERSION 7.7.1
ENV BOSH_CLI_SUM ec3b3c08ceed19c812bd048d3c22831e0a50983a27bd334498b361c7d604246d
ENV BOSH_CLI_FILENAME bosh-cli-${BOSH_CLI_VERSION}-linux-amd64

ENV DEBIAN_PACKAGES "ca-certificates wget git openssh-client file jq"

# https://bosh.io/docs/cli-env-deps.html
ENV BOSH_ENV_DEPS "build-essential zlib1g-dev openssl libxslt1-dev \
  libxml2-dev libssl-dev libreadline8 libreadline-dev libyaml-dev libsqlite3-dev sqlite3"

RUN apt-get update \
  && apt-get -y upgrade \
  && apt-get install -y --no-install-recommends ${DEBIAN_PACKAGES} \
  && apt-get install -y --no-install-recommends ${BOSH_ENV_DEPS} \
  && rm -rf /var/lib/apt/lists/*

RUN wget -nv https://github.com/cloudfoundry/bosh-cli/releases/download/v${BOSH_CLI_VERSION}/${BOSH_CLI_FILENAME} \
  && echo "Computed sha256sum: $(sha256sum ${BOSH_CLI_FILENAME})" \
  && echo "${BOSH_CLI_SUM}  ${BOSH_CLI_FILENAME}" | sha256sum -c - \
  && chmod +x ${BOSH_CLI_FILENAME} \
  && mv ${BOSH_CLI_FILENAME} /usr/local/bin/bosh

# renovate: datasource=github-releases depName=cloudfoundry/credhub-cli
ENV CREDHUB_CLI_VERSION 2.9.42
ENV CREDHUB_CLI_SUM 9543b042817f9442ef5ed16b65a0839c8aa14c4db3b54076df798bbc8b6182c3
ENV CREDHUB_CLI_FILENAME credhub-linux-amd64-${CREDHUB_CLI_VERSION}.tgz

RUN wget -nv https://github.com/cloudfoundry/credhub-cli/releases/download/${CREDHUB_CLI_VERSION}/${CREDHUB_CLI_FILENAME} \
  && echo "Computed sha256sum: $(sha256sum ${CREDHUB_CLI_FILENAME})" \
  && echo "${CREDHUB_CLI_SUM}  ${CREDHUB_CLI_FILENAME}" | sha256sum -c - \
  && tar zxvf ${CREDHUB_CLI_FILENAME} \
  && chmod +x credhub \
  && mv credhub /usr/local/bin/credhub

# renovate: datasource=github-releases depName=mikefarah/yq
ENV YQ_VERSION 4.45.1
ENV YQ_SUM 654d2943ca1d3be2024089eb4f270f4070f491a0610481d128509b2834870049
ENV YQ_FILENAME yq_linux_amd64
ENV YQ_REPO github.com/mikefarah/yq
RUN wget -nv https://github.com/mikefarah/yq/releases/download/v${YQ_VERSION}/${YQ_FILENAME} \
  && echo "Computed sha256sum: $(sha256sum ${YQ_FILENAME})" \
  && echo "${YQ_SUM}  ${YQ_FILENAME}" | sha256sum -c - \
  && chmod +x ${YQ_FILENAME} \
  && mv ${YQ_FILENAME} /usr/local/bin/yq
