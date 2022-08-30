FROM --platform=$TARGETOS/$TARGETARCH ibm-semeru-runtimes:open-16-jdk-focal

LABEL author="Jumala9163" maintainer="Kome-Lab"

RUN useradd -d /home/container -m container

LABEL org.opencontainers.image.source="https://github.com/Jumala9163/Docker"
LABEL org.opencontainers.image.licenses=MIT

ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata curl ca-certificates fontconfig locales \
    && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
    && locale-gen en_US.UTF-8 \
    && rm -rf /var/lib/apt/lists/*

ENV JAVA_VERSION=jdk-16.0.2+7_openj9-0.27.0

RUN apt-get update -y \
 	&& apt-get install -y lsof openssl git tar sqlite3 libfreetype6 iproute2 libstdc++6 \
 	&& useradd -d /home/container -m container

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]