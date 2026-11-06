FROM alpine:3.24@sha256:3f4d6b32e26703c6082839234f43769d5046b3ac7c910033911d1e71d8cd630a

ENV SPRUCE_VERSION=1.30.2

RUN apk add --no-cache \
        wget~1 \
    && wget https://github.com/geofffranks/spruce/releases/download/v${SPRUCE_VERSION}/spruce-linux-amd64 \
    && chmod +x spruce-linux-amd64 \
    && mv spruce-linux-amd64 /usr/local/bin/spruce
