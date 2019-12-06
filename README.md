# Base flask docker image
![](https://img.shields.io/docker/build/gdml/flask-base.svg) ![](https://img.shields.io/docker/pulls/gdml/flask-base.svg)

## Usage

```docker
FROM gdml/flask -base

ADD src /srv
WORKDIR /

CMD ["uwsgi", "--http", ":8000", "--module", "srv.app:app", "--workers", "2", "--threads", "2"]
```

Your `requirements.txt` should be located in the same folder as the Dockerfile.

## Contents
* Python 3.7 (based on official alpine images)
* UWSGI
* [dockerize](https://github.com/jwilder/dockerize)


