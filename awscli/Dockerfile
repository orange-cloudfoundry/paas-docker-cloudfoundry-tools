FROM elpaasoci/curl-ssl

ENV AWSCLI_VERSION "1.18.140"

RUN apk add --no-cache \
        groff~1.22.4-r4 \
        less>=590-r0 \
        python3~3.11 \
        py3-pip~23 \
    && pip3 install \
        awscli==$AWSCLI_VERSION
