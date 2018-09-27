FROM alpine

ARG LEDGER_VERSION=next

RUN set -xe \
	&& apk add --no-cache --virtual .build-deps \
		boost boost-iostreams boost-unit_test_framework gmp mpfr3 \
		boost-dev gmp-dev mpfr-dev cmake make g++ wget \
	&& wget -qO- https://github.com/ledger/ledger/archive/$LEDGER_VERSION.tar.gz | tar xz -C /tmp \
	&& cd /tmp/ledger-$LEDGER_VERSION \
	&& ./acprep update --boost-suffix=-mt --prefix=/usr/local -j2 install \
	&& rm -rf /tmp/ledger-$LEDGER_VERSION \
	\
	&& runDeps="$( \
		scanelf --needed --nobanner --format '%n#p' --recursive /usr/local \
			| tr ',' '\n' \
			| sort -u \
			| awk 'system("[ -e /usr/local/lib/" $1 " ]") == 0 { next } { print "so:" $1 }' \
	)" \
	&& apk add --no-cache --virtual .ledger-rundeps $runDeps \
	&& apk del .build-deps    

ENTRYPOINT ["ledger"]

CMD ["bal"]
