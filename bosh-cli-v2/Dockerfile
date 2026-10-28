FROM ruby:4.0-slim-bookworm@sha256:f999b3be00ed747bf7b2e450155ab1482d77300eb71ec7d3ada49ccc921c6ed4

# renovate: datasource=github-releases depName=cloudfoundry/bosh-cli
ENV BOSH_CLI_VERSION=7.11.2
ENV BOSH_CLI_SUM=839a92403901639e0e1f3130e4138c912bfd217bd1579277048fcd6bf5dee28c
ENV BOSH_CLI_FILENAME=bosh-cli-${BOSH_CLI_VERSION}-linux-amd64

ENV DEBIAN_PACKAGES="ca-certificates wget git openssh-client file jq"

# https://bosh.io/docs/cli-env-deps.html
ENV BOSH_ENV_DEPS="build-essential zlib1g-dev openssl libxslt1-dev \
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
ENV CREDHUB_CLI_VERSION=2.9.62
ENV CREDHUB_CLI_SUM=1b933e23d8a531b31ac802fa16d7479e029ac07c6c2598f06a01182ce5fe1001
ENV CREDHUB_CLI_FILENAME=credhub-linux-amd64-${CREDHUB_CLI_VERSION}.tgz

RUN wget -nv https://github.com/cloudfoundry/credhub-cli/releases/download/${CREDHUB_CLI_VERSION}/${CREDHUB_CLI_FILENAME} \
  && echo "Computed sha256sum: $(sha256sum ${CREDHUB_CLI_FILENAME})" \
  && echo "${CREDHUB_CLI_SUM}  ${CREDHUB_CLI_FILENAME}" | sha256sum -c - \
  && tar zxvf ${CREDHUB_CLI_FILENAME} \
  && chmod +x credhub \
  && mv credhub /usr/local/bin/credhub

# renovate: datasource=github-releases depName=mikefarah/yq
ENV YQ_VERSION=4.54.1
ENV YQ_SUM=8e34fc298390875de416e6a4afcb8cabeceb25d9aa8506c1a2f9353cf702ea5f
ENV YQ_FILENAME=yq_linux_amd64
ENV YQ_REPO=github.com/mikefarah/yq
RUN wget -nv https://github.com/mikefarah/yq/releases/download/v${YQ_VERSION}/${YQ_FILENAME} \
  && echo "Computed sha256sum: $(sha256sum ${YQ_FILENAME})" \
  && echo "${YQ_SUM}  ${YQ_FILENAME}" | sha256sum -c - \
  && chmod +x ${YQ_FILENAME} \
  && mv ${YQ_FILENAME} /usr/local/bin/yq
