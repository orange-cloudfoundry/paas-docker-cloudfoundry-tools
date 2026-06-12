FROM alpine:3.24@sha256:a2d49ea686c2adfe3c992e47dc3b5e7fa6e6b5055609400dc2acaeb241c829f4

ENV SPRUCE_VERSION=1.30.2

RUN apk add --no-cache \
        wget~1 \
    && wget https://github.com/geofffranks/spruce/releases/download/v${SPRUCE_VERSION}/spruce-linux-amd64 \
    && chmod +x spruce-linux-amd64 \
    && mv spruce-linux-amd64 /usr/local/bin/spruce
