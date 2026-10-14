FROM ruby:3.4-slim-bookworm

# renovate: datasource=github-releases depName=cloudfoundry/bosh-cli
ENV BOSH_CLI_VERSION=7.11.1
ENV BOSH_CLI_SUM=91dfeff2b222eadadbd9a17bf074bf5ece36d39c9b4f592a3b4f3c1f57534df2
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
ENV YQ_SUM=fa52a4e758c63d38299163fbdd1edfb4c4963247918bf9c1c5d31d84789eded4
ENV YQ_FILENAME=yq_linux_amd64
ENV YQ_REPO=github.com/mikefarah/yq
RUN wget -nv https://github.com/mikefarah/yq/releases/download/v${YQ_VERSION}/${YQ_FILENAME} \
  && echo "Computed sha256sum: $(sha256sum ${YQ_FILENAME})" \
  && echo "${YQ_SUM}  ${YQ_FILENAME}" | sha256sum -c - \
  && chmod +x ${YQ_FILENAME} \
  && mv ${YQ_FILENAME} /usr/local/bin/yq
