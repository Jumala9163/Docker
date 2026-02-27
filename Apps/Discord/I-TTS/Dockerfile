FROM --platform=$TARGETOS/$TARGETARCH  debian:trixie-slim

LABEL author="Jumala9163" maintainer="Kome-Lab"

LABEL org.opencontainers.image.source="https://github.com/Jumala9163/Docker"
LABEL org.opencontainers.image.licenses=MIT

RUN useradd -d /home/container -m container

ARG version=25.0.1.9-1

RUN set -ux \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        curl ca-certificates gnupg fontconfig \
    && mkdir -p /usr/share/keyrings /usr/share/man/man1 \
    && curl -fsSL https://apt.corretto.aws/corretto.key \
        | gpg --dearmor -o /usr/share/keyrings/corretto-keyring.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/corretto-keyring.gpg] https://apt.corretto.aws stable main" \
        > /etc/apt/sources.list.d/corretto.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends java-25-amazon-corretto-jdk=1:$version binutils \
    && jlink --add-modules "$(java --list-modules | sed -e 's/@[0-9].*$/,/' | tr -d \\n)" --no-man-pages --no-header-files --strip-debug --output /opt/corretto-slim \
    && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
        curl gnupg binutils java-25-amazon-corretto-jdk=1:$version \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /usr/lib/jvm \
    && mv /opt/corretto-slim /usr/lib/jvm/java-25-amazon-corretto \
    && jdk_tools="java keytool rmid rmiregistry javac jaotc jlink jmod jhsdb jar jarsigner javadoc javap jcmd jconsole jdb jdeps jdeprscan jimage jinfo jmap jps jrunscript jshell jstack jstat jstatd serialver" \
    && priority=$(echo "1${version}" | sed "s/\(\.\|-\)//g") \
    && for i in ${jdk_tools}; do \
        update-alternatives --install /usr/bin/$i $i /usr/lib/jvm/java-25-amazon-corretto/bin/$i ${priority}; \
        done


ENV LANG=C.UTF-8
ENV JAVA_HOME=/usr/lib/jvm/java-25-amazon-corretto

RUN apt-get update -y \
    && apt-get install -y lsof curl ca-certificates openssl git tar sqlite3 fontconfig libfreetype6 tzdata iproute2 libstdc++6

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]