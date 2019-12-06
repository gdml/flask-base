FROM python:3.7-alpine
LABEL maintainer="fb@gdml.ru"
LABEL com.datadoghq.ad.logs='[{"source": "uwsgi", "service": "flask"}]'

ENV DOCKERIZE_VERSION v0.6.1

RUN apk update \
  && apk --no-cache \
    add build-base linux-headers libffi-dev libressl-dev postgresql-dev libc-dev \
  && apk --no-cache \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
    add geos-dev geos

RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

RUN pip --no-cache-dir install uwsgi==2.0.17.1

ONBUILD ADD requirements.txt /
ONBUILD run pip --no-cache-dir install -r /requirements.txt
