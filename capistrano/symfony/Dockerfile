FROM ruby:alpine

RUN set -e; \
    apk add --no-cache openssh-client; \
    gem install --no-doc \
        capistrano \
        capistrano-symfony \
        capistrano-composer \
        capistrano-file-permissions \
    ;   

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh", "cap"]

CMD ["--help"]
