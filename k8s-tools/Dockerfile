FROM ruby:3.1-slim

# we use libc6 instead of libc6-compat as we do not use alpine base image
ENV PACKAGES "unzip curl openssl ca-certificates git libc6 bash jq gettext"

# we also use apt-get as we use an Ubuntu image, not an Alpine
RUN apt-get update \
  && apt-get -y upgrade \
  && apt-get install -y --no-install-recommends ${PACKAGES} \
  && rm -rf /var/lib/apt/lists/*


WORKDIR /usr/local/bin

# renovate: datasource=github-releases depName=k14s/ytt
ENV YTT_VERSION "0.45.4"
ENV YTT_SUM 9bf62175c7cc0b54f9731a5b87ee40250f0457b1fce1b0b36019c2f8d96db8f8
ENV YTT_FILENAME ytt-linux-amd64
ADD https://github.com/k14s/ytt/releases/download/v${YTT_VERSION}/${YTT_FILENAME} .
RUN echo "Computed sha256sum: $(sha256sum ${YTT_FILENAME})" \
    && echo "${YTT_SUM}  ${YTT_FILENAME}" | sha256sum -c - \
    && mv ${YTT_FILENAME} ytt

# renovate: datasource=github-releases depName=cloudfoundry/credhub-cli
ENV CREDHUB_CLI_VERSION 2.9.19
ENV CREDHUB_CLI_SUM dcb942badda5db92ed25fa20eefe110a39f8af31ae6cd978aa5b1f0241ae05a6
ENV CREDHUB_CLI_FILENAME credhub-linux-${CREDHUB_CLI_VERSION}.tgz
ADD https://github.com/cloudfoundry/credhub-cli/releases/download/${CREDHUB_CLI_VERSION}/${CREDHUB_CLI_FILENAME} .
RUN echo "Computed sha256sum: $(sha256sum ${CREDHUB_CLI_FILENAME})" \
    && echo "${CREDHUB_CLI_SUM}  ${CREDHUB_CLI_FILENAME}" | sha256sum -c - \
    && tar zxvf ${CREDHUB_CLI_FILENAME}

# We need to synchronize this kustomize version with embedded fluxcd version and kubectl embedded version !
# renovate: datasource=github-releases depName=kubernetes-sigs/kustomize
ENV KUSTOMIZE_VERSION 4.5.4
ENV KUSTOMIZE_SUM 1159c5c17c964257123b10e7d8864e9fe7f9a580d4124a388e746e4003added3
ENV KUSTOMIZE_FILENAME kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz
ADD https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize/v${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz .
RUN echo "Computed sha256sum: $(sha256sum ${KUSTOMIZE_FILENAME})" \
    && echo "${KUSTOMIZE_SUM}  ${KUSTOMIZE_FILENAME}" | sha256sum -c - \
    && tar zxvf ${KUSTOMIZE_FILENAME}

# renovate: datasource=github-releases depName=k14s/kapp
ENV KAPP_VERSION 0.58.0
ENV KAPP_SUM b253ea9cf6add07f9497955147dc12e8612c24c36dc9929c9a4fecdc76752bd3
ENV KAPP_FILENAME kapp-linux-amd64
ADD https://github.com/k14s/kapp/releases/download/v${KAPP_VERSION}/kapp-linux-amd64 .
RUN echo "Computed sha256sum: $(sha256sum ${KAPP_FILENAME})" \
    && echo "${KAPP_SUM}  ${KAPP_FILENAME}" | sha256sum -c - \
    && mv kapp-linux-amd64 kapp

# renovate: datasource=github-tags depName=kubernetes/kubectl
ENV KUBECTL_VERSION 1.24.17
ENV KUBECTL_SUM a45d390e17d1cd4bf93eaa733ebc87ed1a38fd867316919bdc59bee9f96e4d8e
ENV KUBECTL_FILENAME kubectl
ADD https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl .
RUN echo "Computed sha256sum: $(sha256sum ${KUBECTL_FILENAME})" \
    && echo "${KUBECTL_SUM}  ${KUBECTL_FILENAME}" | sha256sum -c -

# renovate: datasource=github-releases depName=helm/helm
ENV HELM_VERSION 3.12.0
ENV HELM_SUM da36e117d6dbc57c8ec5bab2283222fbd108db86c83389eebe045ad1ef3e2c3b
ENV HELM_FILENAME helm-v${HELM_VERSION}-linux-amd64.tar.gz
ADD https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz .
RUN echo "Computed sha256sum: $(sha256sum ${HELM_FILENAME})" \
    && echo "${HELM_SUM}  ${HELM_FILENAME}" | sha256sum -c - \
    && tar zxvf ${HELM_FILENAME} \
    && mv linux-amd64/helm helm \
    && rm -rf linux-amd64

# renovate: datasource=github-releases depName=kudobuilder/kuttl
ENV KUTTL_VERSION 0.15.0
ENV KUTTL_PLUGIN_SUM f6edcf22e238fc71b5aa389ade37a9efce596017c90f6994141c45215ba0f862
ENV KUTTL_PLUGIN_FILENAME kubectl-kuttl_${KUTTL_VERSION}_linux_x86_64
ADD https://github.com/kudobuilder/kuttl/releases/download/v${KUTTL_VERSION}/${KUTTL_PLUGIN_FILENAME} .
RUN echo "Computed ${KUTTL_PLUGIN_FILENAME} sha256sum: $(sha256sum ${KUTTL_PLUGIN_FILENAME})" \
    && echo "${KUTTL_PLUGIN_SUM}  ${KUTTL_PLUGIN_FILENAME}" | sha256sum -c - \
    && mv ${KUTTL_PLUGIN_FILENAME} kubectl-kuttl \
    && ln -s kubectl-kuttl kuttl

# renovate: datasource=github-releases depName=mikefarah/yq
ENV YQ_VERSION 4.35.1
ENV YQ_SUM bd695a6513f1196aeda17b174a15e9c351843fb1cef5f9be0af170f2dd744f08
ENV YQ_FILENAME yq_linux_amd64
ADD https://github.com/mikefarah/yq/releases/download/v${YQ_VERSION}/${YQ_FILENAME} .
RUN echo "Computed ${YQ_FILENAME} sha256sum: $(sha256sum ${YQ_FILENAME})" \
    && echo "${YQ_SUM}  ${YQ_FILENAME}" | sha256sum -c - \
    && chmod +x ${YQ_FILENAME} \
    && mv ${YQ_FILENAME} /usr/local/bin/yq

# renovate: datasource=github-releases depName=cloudfoundry/bosh-cli
ENV BOSH_CLI_VERSION 7.3.1
ENV BOSH_CLI_SUM f6f80461208f186aa3587b25abc12b86e217e7c96594e335de3c17f4ed683a3f
ENV BOSH_CLI_FILENAME bosh-cli-${BOSH_CLI_VERSION}-linux-amd64
ADD https://s3.amazonaws.com/bosh-cli-artifacts/${BOSH_CLI_FILENAME} .
RUN echo "Computed ${BOSH_CLI_FILENAME} sha256sum: $(sha256sum ${BOSH_CLI_FILENAME})" \
      && echo "${BOSH_CLI_SUM}  ${BOSH_CLI_FILENAME}" | sha256sum -c - \
      && chmod +x ${BOSH_CLI_FILENAME} \
      && mv ${BOSH_CLI_FILENAME} /usr/local/bin/bosh

WORKDIR /usr/local/bin
RUN rm *.tgz && rm *.gz && chown root:root * && chmod a+x *

RUN ls -l
WORKDIR /

#ENTRYPOINT /bin/bash
