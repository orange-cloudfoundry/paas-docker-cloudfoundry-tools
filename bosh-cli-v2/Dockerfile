FROM ruby:3.1-slim-bullseye

# renovate: datasource=github-release-attachments depName=mikefarah/yq versionPrefix=v
ENV YQ_VERSION 4.33.3
ENV YQ_SUM 4ee662847c588c3ef2fec8bfb304e8739e3dbaba87ccb9a608d691c88f5b64dc
ENV YQ_FILENAME yq_linux_amd64
ENV YQ_REPO github.com/mikefarah/yq
RUN wget -nv https://github.com/mikefarah/yq/releases/download/v${YQ_VERSION}/${YQ_FILENAME} \
  && echo "${YQ_SUM}  ${YQ_FILENAME}" | sha256sum -c - \
  && chmod +x ${YQ_FILENAME} \
  && mv ${YQ_FILENAME} /usr/local/bin/yq
