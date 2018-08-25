# Base flask docker image
![](https://img.shields.io/docker/build/gdml/flask-base.svg) ![](https://img.shields.io/docker/pulls/gdml/flask-base.svg)

## Usage

```docker
FROM gdml/flask -base

WORKDIR /srv

ADD . /srv
RUN ./manage.py compilemessages
RUN ./manage.py collectstatic --noinput

# Prod machine
CMD ["uwsgi", "--http", ":8000", "--module", "srv.app", "--workers", "2", "--threads", "2"]
```

Your `requirements.txt` should be located in the same folder as the Dockerfile.

## Contents
* Python 3.6 (based on official alpine images)
* UWSGI
* [dockerize](https://github.com/jwilder/dockerize)


