FROM python:3.14-slim-trixie

RUN apt update \
    && apt install -y \
      build-essential \
      openssh-client \
      unzip \
      python3-pip \
      python3-venv \
      xxd \
      procps \
      jq \
      git

WORKDIR /tmp

# renovate: datasource=github-releases depName=plengauer/Thoth
ENV OT_SHELL_VERSION="5.63.1"
ENV OT_SHELL_SUM=89c0697452e60f56562852c921165187979b0c80fb8a198349d1d50347ccdfc6
ENV OT_SHELL_FILENAME="opentelemetry-shell_${OT_SHELL_VERSION}_amd64.deb"
RUN echo "Download url for : https://github.com/plengauer/Thoth/releases/download/v${OT_SHELL_VERSION}/${OT_SHELL_FILENAME}"
ADD --checksum=sha256:${OT_SHELL_SUM} https://github.com/plengauer/Thoth/releases/download/v${OT_SHELL_VERSION}/${OT_SHELL_FILENAME} .
RUN echo "Computed sha256sum: $(sha256sum ${OT_SHELL_FILENAME})" \
    && echo "${OT_SHELL_SUM}  ${OT_SHELL_FILENAME}" | sha256sum -c -
RUN dpkg -i ${OT_SHELL_FILENAME} && \
    pip install 'wrapt>=1.0,<2.0' --force-reinstall && \
     rm ${OT_SHELL_FILENAME}

WORKDIR /home
RUN /bin/bash -ic '. otel.sh'
