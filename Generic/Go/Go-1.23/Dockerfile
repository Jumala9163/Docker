ARG TARGETOS
ARG TARGETARCH

FROM --platform=$TARGETOS/$TARGETARCH ubuntu:noble

ARG TARGETOS
ARG TARGETARCH

LABEL author="Jumala9163" maintainer="Kome-Lab"
LABEL org.opencontainers.image.source="https://github.com/Jumala9163/Docker"
LABEL org.opencontainers.image.licenses="MIT"

RUN useradd -d /home/container -m container

ENV USER=container \
    HOME=/home/container \
    TERM=xterm \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

ARG DEBIAN_FRONTEND=noninteractive
ARG GO_VERSION=1.23.12

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates curl git tzdata bash-completion build-essential pkg-config \
    && rm -rf /var/lib/apt/lists/*

RUN set -eux; \
    case "$TARGETARCH" in \
      amd64) GOARCH=amd64 ;; \
      arm64) GOARCH=arm64 ;; \
      *) echo "Unsupported TARGETARCH: $TARGETARCH" >&2; exit 1 ;; \
    esac; \
    curl -fsSL "https://go.dev/dl/go${GO_VERSION}.linux-${GOARCH}.tar.gz" -o /tmp/go.tgz; \
    tar -C /usr/local -xzf /tmp/go.tgz; \
    rm /tmp/go.tgz

ENV GOPATH=${HOME}/go
ENV PATH=/usr/local/go/bin:${GOPATH}/bin:${PATH}

WORKDIR /home/container

COPY entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
