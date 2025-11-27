# -----------------------------------------------------
# MariaDB Image for Pterodactyl
# -----------------------------------------------------
FROM        --platform=$TARGETOS/$TARGETARCH mariadb:11.8.5

LABEL       author="Michael Parker" maintainer="parker@pterodactyl.io"
LABEL       author="Jumala9163" maintainer="Kome-Lab"

ENV         DEBIAN_FRONTEND=noninteractive

ENV         TZ=Asia/Tokyo
RUN         ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN         apt update -y \
            && apt install -y netcat-openbsd tzdata \
            && useradd -d /home/container -m container -s /bin/bash

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]