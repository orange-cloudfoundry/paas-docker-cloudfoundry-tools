FROM alpine:3.23@sha256:25109184c71bdad752c8312a8623239686a9a2071e8825f20acb8f2198c3f659

ENV SPRUCE_VERSION 1.30.2

RUN apk add --no-cache \
        wget~1 \
    && wget https://github.com/geofffranks/spruce/releases/download/v${SPRUCE_VERSION}/spruce-linux-amd64 \
    && chmod +x spruce-linux-amd64 \
    && mv spruce-linux-amd64 /usr/local/bin/spruce
