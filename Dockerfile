FROM python:alpine

LABEL org.opencontainers.image.authors="Hugo Haas"
LABEL org.opencontainers.image.source="https://github.com/hugoh/docker-tmo-monitor"

LABEL maintainer="Thaine1690"

RUN apk add bash git busybox nano

RUN /bin/busybox --install -s /bin

COPY entrypoint.sh /

RUN git clone -b v2.0.0-beta7 --depth=1 https://github.com/highvolt-dev/tmo-monitor && \
    cd tmo-monitor && \
    pip3 install .

ENTRYPOINT [ "/entrypoint.sh" ]
