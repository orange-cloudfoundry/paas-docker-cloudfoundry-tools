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
ENV OT_SHELL_VERSION="5.42.0"
ENV OT_SHELL_SUM=6621d0fa1292666f0256bc0b4ba4ef66c99aaba019bcf473618d1a4ee31beff8
ENV OT_SHELL_FILENAME="opentelemetry-shell_${OT_SHELL_VERSION}.deb"
ADD --checksum=sha256:${OT_SHELL_SUM} https://github.com/plengauer/Thoth/releases/download/v${OT_SHELL_VERSION}/${OT_SHELL_FILENAME} .
RUN echo "Computed sha256sum: $(sha256sum ${OT_SHELL_FILENAME})" \
    && echo "${OT_SHELL_SUM}  ${OT_SHELL_FILENAME}" | sha256sum -c -

RUN dpkg -i ${OT_SHELL_FILENAME} && \
    rm ${OT_SHELL_FILENAME}

WORKDIR /home
RUN /bin/bash -ic '. otel.sh'
