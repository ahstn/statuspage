FROM alpine

RUN apk add --update curl                                           \
    && curl -ksL https://git.io/vFsMa -o /usr/bin/cachet-monitor    \
    && chmod +rx /usr/bin/cachet-monitor                            \
    && rm -rf /var/cache/apk/*

COPY monitor.yml /

ENTRYPOINT ["/usr/bin/cachet-monitor", "-c", "/monitor.yml"]
