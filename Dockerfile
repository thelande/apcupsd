ARG ALPINE_VERSION=3.19

FROM alpine:${ALPINE_VERSION}
LABEL maintainer="Tom Helander <thomas.helander@gmail.com>"

RUN apk add --no-cache apcupsd busctl

EXPOSE 3551

CMD ["apcupsd", "-b"]
