FROM alpine:3.24@sha256:be2656061b536c1883c4034790e21d0a09c5aaaf51968b89368a3c0371ea2c9a

ENV SPRUCE_VERSION=1.30.2

RUN apk add --no-cache \
        wget~1 \
    && wget https://github.com/geofffranks/spruce/releases/download/v${SPRUCE_VERSION}/spruce-linux-amd64 \
    && chmod +x spruce-linux-amd64 \
    && mv spruce-linux-amd64 /usr/local/bin/spruce
