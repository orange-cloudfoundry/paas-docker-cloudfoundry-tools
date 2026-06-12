FROM ruby:3.4-slim

# we use libc6 instead of libc6-compat as we do not use alpine base image
ENV PACKAGES="unzip curl openssl ca-certificates git libc6 bash jq gettext"

# we also use apt-get as we use an Ubuntu image, not an Alpine
RUN apt-get update \
  && apt-get -y upgrade \
  && apt-get install -y --no-install-recommends ${PACKAGES} \
  && rm -rf /var/lib/apt/lists/*


WORKDIR /usr/local/bin

# renovate: datasource=github-releases depName=k14s/ytt
ENV YTT_VERSION="0.55.1"
ENV YTT_SUM=3a2c925ed222f8db4956946d40279688edd6ceb3e919f03f919a8fc8b8532eda
ENV YTT_FILENAME=ytt-linux-amd64
ADD https://github.com/k14s/ytt/releases/download/v${YTT_VERSION}/${YTT_FILENAME} .
RUN echo "Computed sha256sum: $(sha256sum ${YTT_FILENAME})" \
    && echo "${YTT_SUM}  ${YTT_FILENAME}" | sha256sum -c - \
    && mv ${YTT_FILENAME} ytt

# renovate: datasource=github-releases depName=cloudfoundry/credhub-cli
ENV CREDHUB_CLI_VERSION=2.9.57
ENV CREDHUB_CLI_SUM=c101391e13be84b1c0d8854559b99d3183535ad0398e5f28e793f3f029c34843
ENV CREDHUB_CLI_FILENAME=credhub-linux-amd64-${CREDHUB_CLI_VERSION}.tgz
ADD https://github.com/cloudfoundry/credhub-cli/releases/download/${CREDHUB_CLI_VERSION}/${CREDHUB_CLI_FILENAME} .
RUN echo "Computed sha256sum: $(sha256sum ${CREDHUB_CLI_FILENAME})" \
    && echo "${CREDHUB_CLI_SUM}  ${CREDHUB_CLI_FILENAME}" | sha256sum -c - \
    && tar zxvf ${CREDHUB_CLI_FILENAME}

# We need to synchronize this kustomize version with embedded fluxcd version and kubectl embedded version !
# renovate: datasource=github-releases depName=kubernetes-sigs/kustomize
ENV KUSTOMIZE_VERSION=kustomize/v5.8.1
ENV KUSTOMIZE_SUM=ea375e7372f9aa029129d4b2d16c66b7750b7f1213c4f66f910d981c895818d8
ENV KUSTOMIZE_FILENAME=kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz
ADD https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize/v${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz .
RUN echo "Computed sha256sum: $(sha256sum ${KUSTOMIZE_FILENAME})" \
    && echo "${KUSTOMIZE_SUM}  ${KUSTOMIZE_FILENAME}" | sha256sum -c - \
    && tar zxvf ${KUSTOMIZE_FILENAME}

# renovate: datasource=github-releases depName=k14s/kapp
#ENV KAPP_VERSION=0.64.0
#ENV KAPP_SUM=33702a40b6032ada742d73c59afeb393d0830a1913e3a599ca995eba3e68a57e
#ENV KAPP_FILENAME=kapp-linux-amd64
#ADD https://github.com/k14s/kapp/releases/download/v${KAPP_VERSION}/kapp-linux-amd64 .
#RUN echo "Computed sha256sum: $(sha256sum ${KAPP_FILENAME})" \
#    && echo "${KAPP_SUM}  ${KAPP_FILENAME}" | sha256sum -c - \
#    && mv kapp-linux-amd64 kapp

# renovate: datasource=github-tags depName=kubernetes/kubectl
ENV KUBECTL_VERSION=1.34.8
ENV KUBECTL_SUM=f6249132865c13abe3c9dd5038f5da65849cb86eee1608c001831504e481aa8c
ENV KUBECTL_FILENAME=kubectl
ADD https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl .
#ADD https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl .
RUN echo "Computed sha256sum: $(sha256sum ${KUBECTL_FILENAME})" \
    && echo "${KUBECTL_SUM}  ${KUBECTL_FILENAME}" | sha256sum -c -

# renovate: datasource=github-releases depName=helm/helm
ENV HELM_VERSION=3.17.1
ENV HELM_SUM=3b66f3cd28409f29832b1b35b43d9922959a32d795003149707fea84cbcd4469
ENV HELM_FILENAME=helm-v${HELM_VERSION}-linux-amd64.tar.gz
ADD https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz .
RUN echo "Computed sha256sum: $(sha256sum ${HELM_FILENAME})" \
    && echo "${HELM_SUM}  ${HELM_FILENAME}" | sha256sum -c - \
    && tar zxvf ${HELM_FILENAME} \
    && mv linux-amd64/helm helm \
    && rm -rf linux-amd64

# renovate: datasource=github-releases depName=kudobuilder/kuttl
#ENV KUTTL_VERSION=0.24.0
#ENV KUTTL_PLUGIN_SUM=5189ab7b0c2a0595a971c8fc0280e180c7de6e711f085633460af1af0678031a
#ENV KUTTL_PLUGIN_FILENAME=kubectl-kuttl_${KUTTL_VERSION}_linux_x86_64
#ADD https://github.com/kudobuilder/kuttl/releases/download/v${KUTTL_VERSION}/${KUTTL_PLUGIN_FILENAME} .
#RUN echo "Computed ${KUTTL_PLUGIN_FILENAME} sha256sum: $(sha256sum ${KUTTL_PLUGIN_FILENAME})" \
#    && echo "${KUTTL_PLUGIN_SUM}  ${KUTTL_PLUGIN_FILENAME}" | sha256sum -c - \
#    && mv ${KUTTL_PLUGIN_FILENAME} kubectl-kuttl \
#    && ln -s kubectl-kuttl kuttl

# renovate: datasource=github-releases depName=mikefarah/yq
ENV YQ_VERSION=4.53.3
ENV YQ_SUM=fa52a4e758c63d38299163fbdd1edfb4c4963247918bf9c1c5d31d84789eded4
ENV YQ_FILENAME=yq_linux_amd64
ADD https://github.com/mikefarah/yq/releases/download/v${YQ_VERSION}/${YQ_FILENAME} .
RUN echo "Computed ${YQ_FILENAME} sha256sum: $(sha256sum ${YQ_FILENAME})" \
    && echo "${YQ_SUM}  ${YQ_FILENAME}" | sha256sum -c - \
    && chmod +x ${YQ_FILENAME} \
    && mv ${YQ_FILENAME} /usr/local/bin/yq

# renovate: datasource=github-releases depName=cloudfoundry/bosh-cli
ENV BOSH_CLI_VERSION=7.10.5
ENV BOSH_CLI_SUM=e9847375ba5397589e7b070305defc70321ad0e62d18b67a70a330efcab6e526
ENV BOSH_CLI_FILENAME=bosh-cli-${BOSH_CLI_VERSION}-linux-amd64
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
