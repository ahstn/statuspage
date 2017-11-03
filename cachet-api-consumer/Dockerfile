FROM scratch

ADD cachet-api-consumer /

ENTRYPOINT ["/cachet-api-consumer", "-c", "config.yaml", "-u", "http://cachet/api/v1"]
