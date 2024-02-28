ARG ALPINE_VERSION=3.19

FROM alpine:${ALPINE_VERSION}
LABEL maintainer="Tom Helander <thomas.helander@gmail.com>"

RUN apk add --no-cache apcupsd bash busctl
ADD apcupsd.conf doshutdown /etc/apcupsd/
ADD entrypoint.sh /usr/local/bin

RUN set -eux; \
    chmod +x /etc/apcupsd/doshutdown /usr/local/bin/entrypoint.sh; \
    for f in changeme commfailure commok offbattery onbattery; do \
        rm /etc/apcupsd/$f; \
    done

EXPOSE 3551

CMD ["/usr/local/bin/entrypoint.sh"]
