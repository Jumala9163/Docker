FROM        --platform=$TARGETOS/$TARGETARCH python:3.13-slim-bookworm

LABEL       author="Michael Parker" maintainer="parker@pterodactyl.io"
LABEL       author="Jumala9163" maintainer="Kome-Lab"

LABEL org.opencontainers.image.source="https://github.com/Jumala9163/Docker"
LABEL org.opencontainers.image.licenses=MIT

RUN         apt update \
            && apt -y install git gcc g++ ca-certificates dnsutils curl iproute2 ffmpeg procps tini xvfb x11-utils python3-tk \
            && useradd -m -d /home/container container


RUN apt-get update \
            && apt-get install -y \
            git gcc g++ ca-certificates dnsutils curl iproute2 ffmpeg procps tini \
            xvfb x11-utils python3-tk \
            fonts-dejavu-core fonts-noto-cjk

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

STOPSIGNAL SIGINT

COPY        --chown=container:container ./../entrypoint.sh /entrypoint.sh
RUN         chmod +x /entrypoint.sh
ENTRYPOINT    ["/usr/bin/tini", "-g", "--"]
CMD         ["/entrypoint.sh"]