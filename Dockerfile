FROM alpine:3.12.0

RUN apk add --no-cache rsync
COPY rsyncd.conf /etc/rsyncd.conf

COPY /build/docker-entrypoint.sh sync.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/*.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["rsync", "--daemon", "--no-detach", "--verbose"]

VOLUME ["/data"]
EXPOSE 873
