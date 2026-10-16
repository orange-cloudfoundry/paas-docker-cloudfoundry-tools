FROM alpine:3.24@sha256:294b683cb724975bec92580e1e685676bd4b50bda910ddb8c51d4cabeaec77e6

ENV SPRUCE_VERSION=1.30.2

RUN apk add --no-cache \
        wget~1 \
    && wget https://github.com/geofffranks/spruce/releases/download/v${SPRUCE_VERSION}/spruce-linux-amd64 \
    && chmod +x spruce-linux-amd64 \
    && mv spruce-linux-amd64 /usr/local/bin/spruce
