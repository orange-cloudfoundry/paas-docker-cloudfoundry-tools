FROM elpaasoci/curl-ssl

ENV AWSCLI_VERSION "1.19.112"

RUN apk add --no-cache \
        groff~1.23 \
        less>=590-r0 \
        python3~3.11 \
        py3-pip~23 \
    && pip3 install \
        awscli==$AWSCLI_VERSION \
        pyyaml==5.3.1
