FROM alpine

RUN apk add --no-cache \
        openssh 

EXPOSE 22

COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/usr/sbin/sshd", "-De"]
