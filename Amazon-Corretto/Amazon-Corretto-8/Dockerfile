FROM --platform=$TARGETOS/$TARGETARCH  debian:buster-slim

LABEL author="Jumala9163" maintainer="Kome-Lab"

RUN useradd -d /home/container -m container

LABEL org.opencontainers.image.source="https://github.com/Jumala9163/Docker"
LABEL org.opencontainers.image.licenses=MIT

ARG version=8.342.07-4

RUN set -eux \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        curl ca-certificates gnupg software-properties-common fontconfig java-common \
    && curl -fL https://apt.corretto.aws/corretto.key | apt-key add - \
    && add-apt-repository 'deb https://apt.corretto.aws stable main' \
    && mkdir -p /usr/share/man/man1 || true \
    && apt-get update \
    && apt-get install -y java-1.8.0-amazon-corretto-jdk=1:$version \
    && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
        curl gnupg software-properties-common
RUN apt-get update -y \
    && apt-get install -y lsof curl ca-certificates openssl git tar sqlite3 fontconfig libfreetype6 tzdata iproute2 libstdc++6 \
    && useradd -d /home/container -m container

ENV LANG=C.UTF-8
ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-amazon-corretto

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]