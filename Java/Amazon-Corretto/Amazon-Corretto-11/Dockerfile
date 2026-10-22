FROM --platform=$TARGETOS/$TARGETARCH  debian:bookworm-slim

LABEL author="Jumala9163" maintainer="Kome-Lab"

LABEL org.opencontainers.image.source="https://github.com/Jumala9163/Docker"
LABEL org.opencontainers.image.licenses=MIT

RUN useradd -d /home/container -m container

ARG version=11.0.32.12-1

RUN set -eux \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        curl ca-certificates gnupg fontconfig java-common \
    && curl -fL https://apt.corretto.aws/corretto.key | gpg --dearmor -o /usr/share/keyrings/corretto-keyring.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/corretto-keyring.gpg] https://apt.corretto.aws stable main" > /etc/apt/sources.list.d/corretto.list \
    && mkdir -p /usr/share/man/man1 || true \
    && apt-get update \
    && apt-get install -y java-11-amazon-corretto-jdk=1:$version \
    && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
        curl gnupg

ENV LANG=C.UTF-8
ENV JAVA_HOME=/usr/lib/jvm/java-11-amazon-corretto

RUN apt-get update -y \
    && apt-get install -y lsof curl ca-certificates openssl git tar sqlite3 fontconfig libfreetype6 tzdata iproute2 libstdc++6

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]