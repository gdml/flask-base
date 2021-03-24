FROM python:3.9-slim
LABEL maintainer="developers@gdml.ru"
LABEL com.datadoghq.ad.logs='[{"source": "uwsgi", "service": "flask"}]'

ENV DOCKERIZE_VERSION v0.6.1
ENV BINARY_PACKAGES "wget build-essential libgeos-dev"

RUN apt-get update \
    && apt-get --no-install-recommends install -y $BINARY_PACKAGES \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

RUN pip --no-cache-dir install uwsgi==2.0.17.1

ONBUILD ADD requirements.txt /
ONBUILD RUN pip --no-cache-dir install -r /requirements.txt
