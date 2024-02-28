ARG ALPINE_VERSION=3.19

FROM alpine:${ALPINE_VERSION}
LABEL maintainer="Tom Helander <thomas.helander@gmail.com>"

RUN apk add --no-cache apcupsd bash busctl
ADD apcupsd.conf doshutdown /etc/apcupsd/
ADD entrypoint.sh /usr/local/bin

EXPOSE 3551

CMD ["bash", "/usr/local/bin/entrypoint.sh"]
