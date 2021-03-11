FROM alpine:latest
LABEL maintainer="Drew Robinson <drew.robinson@gmail.com>"

ARG TARGETARCH
ENV TARGETARCH ${TARGETARCH}

RUN apk -U add openssl

ENV VERSION 0.7.5-rc2
ENV DOWNLOAD_URL https://github.com/ocean/docker-gen/releases/download/$VERSION/docker-gen-alpine-linux-$TARGETARCH-$VERSION.tar.gz
ENV DOCKER_HOST unix:///tmp/docker.sock

RUN wget -qO- $DOWNLOAD_URL | tar xvz -C /usr/local/bin

ENTRYPOINT ["/usr/local/bin/docker-gen"]
