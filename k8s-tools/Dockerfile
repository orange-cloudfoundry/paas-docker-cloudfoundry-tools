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
ENV YTT_VERSION "0.49.1"
ENV YTT_SUM 20a2f7466157a9c6189e885d0027e17c48776e65627f30fe04bffeef1d6f6166
ENV YTT_FILENAME ytt-linux-amd64
ADD https://github.com/k14s/ytt/releases/download/v${YTT_VERSION}/${YTT_FILENAME} .
RUN echo "Computed sha256sum: $(sha256sum ${YTT_FILENAME})" \
    && echo "${YTT_SUM}  ${YTT_FILENAME}" | sha256sum -c - \
    && mv ${YTT_FILENAME} ytt

# renovate: datasource=github-releases depName=cloudfoundry/credhub-cli
ENV CREDHUB_CLI_VERSION 2.9.31
ENV CREDHUB_CLI_SUM caf1f35837ee780b1ab105dff0e8f35b2e0a691484eff7b16cda31b03d6f91df
ENV CREDHUB_CLI_FILENAME credhub-linux-amd64-${CREDHUB_CLI_VERSION}.tgz
ADD https://github.com/cloudfoundry/credhub-cli/releases/download/${CREDHUB_CLI_VERSION}/${CREDHUB_CLI_FILENAME} .
RUN echo "Computed sha256sum: $(sha256sum ${CREDHUB_CLI_FILENAME})" \
    && echo "${CREDHUB_CLI_SUM}  ${CREDHUB_CLI_FILENAME}" | sha256sum -c - \
    && tar zxvf ${CREDHUB_CLI_FILENAME}

# We need to synchronize this kustomize version with embedded fluxcd version and kubectl embedded version !
# renovate: datasource=github-releases depName=kubernetes-sigs/kustomize
ENV KUSTOMIZE_VERSION 5.0.3
ENV KUSTOMIZE_SUM c627b1575c3fecbc7ad1c181c23a7adcacf19732dab627eb57e89a7bc4c1e929
ENV KUSTOMIZE_FILENAME kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz
ADD https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize/v${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz .
RUN echo "Computed sha256sum: $(sha256sum ${KUSTOMIZE_FILENAME})" \
    && echo "${KUSTOMIZE_SUM}  ${KUSTOMIZE_FILENAME}" | sha256sum -c - \
    && tar zxvf ${KUSTOMIZE_FILENAME}

# renovate: datasource=github-releases depName=k14s/kapp
ENV KAPP_VERSION 0.62.1
ENV KAPP_SUM b686bd63e5f751496d8221c7cf3df308663b6b21e1c480dd4a4cd301f6a8d651
ENV KAPP_FILENAME kapp-linux-amd64
ADD https://github.com/k14s/kapp/releases/download/v${KAPP_VERSION}/kapp-linux-amd64 .
RUN echo "Computed sha256sum: $(sha256sum ${KAPP_FILENAME})" \
    && echo "${KAPP_SUM}  ${KAPP_FILENAME}" | sha256sum -c - \
    && mv kapp-linux-amd64 kapp

# renovate: datasource=github-tags depName=kubernetes/kubectl
ENV KUBECTL_VERSION 1.26.15
ENV KUBECTL_SUM b75f359e6fad3cdbf05a0ee9d5872c43383683bb8527a9e078bb5b8a44350a41
ENV KUBECTL_FILENAME kubectl
ADD https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl .
RUN echo "Computed sha256sum: $(sha256sum ${KUBECTL_FILENAME})" \
    && echo "${KUBECTL_SUM}  ${KUBECTL_FILENAME}" | sha256sum -c -

# renovate: datasource=github-releases depName=helm/helm
ENV HELM_VERSION 3.14.4
ENV HELM_SUM a5844ef2c38ef6ddf3b5a8f7d91e7e0e8ebc39a38bb3fc8013d629c1ef29c259
ENV HELM_FILENAME helm-v${HELM_VERSION}-linux-amd64.tar.gz
ADD https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz .
RUN echo "Computed sha256sum: $(sha256sum ${HELM_FILENAME})" \
    && echo "${HELM_SUM}  ${HELM_FILENAME}" | sha256sum -c - \
    && tar zxvf ${HELM_FILENAME} \
    && mv linux-amd64/helm helm \
    && rm -rf linux-amd64

# renovate: datasource=github-releases depName=kudobuilder/kuttl
ENV KUTTL_VERSION 0.17.0
ENV KUTTL_PLUGIN_SUM 87873690e1fc8e3cc9400801b3196269803a3bd75e589420f08e4ed65333415c
ENV KUTTL_PLUGIN_FILENAME kubectl-kuttl_${KUTTL_VERSION}_linux_x86_64
ADD https://github.com/kudobuilder/kuttl/releases/download/v${KUTTL_VERSION}/${KUTTL_PLUGIN_FILENAME} .
RUN echo "Computed ${KUTTL_PLUGIN_FILENAME} sha256sum: $(sha256sum ${KUTTL_PLUGIN_FILENAME})" \
    && echo "${KUTTL_PLUGIN_SUM}  ${KUTTL_PLUGIN_FILENAME}" | sha256sum -c - \
    && mv ${KUTTL_PLUGIN_FILENAME} kubectl-kuttl \
    && ln -s kubectl-kuttl kuttl

# renovate: datasource=github-releases depName=mikefarah/yq
ENV YQ_VERSION 4.44.2
ENV YQ_SUM 246b781828353a59fb04ffaada241f78a8f3f25c623047b40306def1f6806e71
ENV YQ_FILENAME yq_linux_amd64
ADD https://github.com/mikefarah/yq/releases/download/v${YQ_VERSION}/${YQ_FILENAME} .
RUN echo "Computed ${YQ_FILENAME} sha256sum: $(sha256sum ${YQ_FILENAME})" \
    && echo "${YQ_SUM}  ${YQ_FILENAME}" | sha256sum -c - \
    && chmod +x ${YQ_FILENAME} \
    && mv ${YQ_FILENAME} /usr/local/bin/yq

# renovate: datasource=github-releases depName=cloudfoundry/bosh-cli
ENV BOSH_CLI_VERSION 7.7.1
ENV BOSH_CLI_SUM ec3b3c08ceed19c812bd048d3c22831e0a50983a27bd334498b361c7d604246d
ENV BOSH_CLI_FILENAME bosh-cli-${BOSH_CLI_VERSION}-linux-amd64
ADD https://github.com/cloudfoundry/bosh-cli/releases/download/v${BOSH_CLI_VERSION}/${BOSH_CLI_FILENAME} .
RUN echo "Computed ${BOSH_CLI_FILENAME} sha256sum: $(sha256sum ${BOSH_CLI_FILENAME})" \
      && echo "${BOSH_CLI_SUM}  ${BOSH_CLI_FILENAME}" | sha256sum -c - \
      && chmod +x ${BOSH_CLI_FILENAME} \
      && mv ${BOSH_CLI_FILENAME} /usr/local/bin/bosh

WORKDIR /usr/local/bin
RUN rm *.tgz && rm *.gz && chown root:root * && chmod a+x *

RUN ls -l
WORKDIR /

#ENTRYPOINT /bin/bash
