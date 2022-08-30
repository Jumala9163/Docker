FROM --platform=$TARGETOS/$TARGETARCH ibm-semeru-runtimes:open-16-jdk-focal

LABEL author="Jumala9163" maintainer="Kome-Lab"

LABEL org.opencontainers.image.source="https://github.com/Jumala9163/Docker"
LABEL org.opencontainers.image.licenses=MIT

RUN useradd -d /home/container -m container

ENV LANG=C.UTF-8

RUN apt-get update -y \
    && apt-get install -y sudo wget git curl unzip git build-essential \
    ca-certificates openssl tar sqlite3 fontconfig tzdata iproute2 jq

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]