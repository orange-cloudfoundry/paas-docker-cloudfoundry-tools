FROM alpine:3.24@sha256:f59abe656b692d901e184be3445e084786602108599d2a51d229c0f5a48c71bf
# Alpine 3.19 is the last version with python 3.11

ENV AWSCLI_VERSION=1.27.79

RUN apk add --no-cache \
        openssl \
        ca-certificates \
        jq~1 \
        gettext~0.22 \
        curl~8 \
        groff~1.23 \
        less~643 \
        python3~3.11 \
        py3-pip~23 \
    && pip3 install --break-system-packages \
        awscli==$AWSCLI_VERSION \
        pyyaml==5.3.1
