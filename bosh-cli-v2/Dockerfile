FROM ruby:3.4-slim-bullseye

# renovate: datasource=github-releases depName=cloudfoundry/bosh-cli
ENV BOSH_CLI_VERSION 7.9.15
ENV BOSH_CLI_SUM f873260b221fa3d88e8a396df94d7382447c4f163edba483a1343d063582202b
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
ENV CREDHUB_CLI_VERSION 2.9.52
ENV CREDHUB_CLI_SUM 8e0bc2f1d9a69b41d59036ee5469c34a9ee647c217a64618afa302bd7b57ff8f
ENV CREDHUB_CLI_FILENAME credhub-linux-amd64-${CREDHUB_CLI_VERSION}.tgz

RUN wget -nv https://github.com/cloudfoundry/credhub-cli/releases/download/${CREDHUB_CLI_VERSION}/${CREDHUB_CLI_FILENAME} \
  && echo "Computed sha256sum: $(sha256sum ${CREDHUB_CLI_FILENAME})" \
  && echo "${CREDHUB_CLI_SUM}  ${CREDHUB_CLI_FILENAME}" | sha256sum -c - \
  && tar zxvf ${CREDHUB_CLI_FILENAME} \
  && chmod +x credhub \
  && mv credhub /usr/local/bin/credhub

# renovate: datasource=github-releases depName=mikefarah/yq
ENV YQ_VERSION 4.50.1
ENV YQ_SUM c7a1278e6bbc4924f41b56db838086c39d13ee25dcb22089e7fbf16ac901f0d4
ENV YQ_FILENAME yq_linux_amd64
ENV YQ_REPO github.com/mikefarah/yq
RUN wget -nv https://github.com/mikefarah/yq/releases/download/v${YQ_VERSION}/${YQ_FILENAME} \
  && echo "Computed sha256sum: $(sha256sum ${YQ_FILENAME})" \
  && echo "${YQ_SUM}  ${YQ_FILENAME}" | sha256sum -c - \
  && chmod +x ${YQ_FILENAME} \
  && mv ${YQ_FILENAME} /usr/local/bin/yq
