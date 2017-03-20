# Ansible
#
# VERSION  0.0.1

FROM python:2-alpine

MAINTAINER Vladislav Vlastovskiy <me@vlastv.ru>

RUN apk add --no-cache --virtual .build-deps \
		gcc \
		libffi-dev \
		musl-dev \
		openssl-dev \
	&& pip install ansible \
	&& runDeps="$( \
		scanelf --needed --nobanner --recursive /usr/local \
			| awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
			| sort -u \
			| xargs -r apk info --installed \
			| sort -u \
	)" \
	&& apk add --no-cache --virtual .ansible-rundeps $runDeps \
	\
	&& apk del .build-deps \
	&& { \
		echo "[defaults]"; \
		echo "host_key_checking = False"; \
	} | tee ~/.ansible.cfg

