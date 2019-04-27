# ローカル環境利用方法

## Run without docker

```sh
$ cd app
$ pipenv install
$ pipenv run python src/main.py
```

## Run with docker

```sh
$ cd app
$ docker build -t flask .
$ docker run -d --name app \
    -p 80:80 \
    -p 1717:1717 \
    -e UWSGI_HTTP=:80 \
    -e UWSGI_STATS=:1717 \
    -e UWSGI_STATS_HTTP=true \
    -e UWSGI_PY_AUTORELOAD=1 \
    -v $PWD/:/var/www/ \
    -t flask
```

## Run with docker and nginx

```sh
$ docker-compose -f docker-compose.local.yml up -d --build
```
