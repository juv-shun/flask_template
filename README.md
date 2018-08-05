# ローカル環境利用方法

## Flaskアプリケーションのみ起動

```sh
$ cd app/src
$ python -m venv vendor
$ source vendor/bin/activate
$ pip install -r requirements.txt
$ python src/main.py
```

## uwsgi & Flaskで起動

```sh
$ cd app
$ docker build -t uwsgi .
$ docker run -d --name app \
    -p 8080:8080 \
    -p 1717:1717 \
    -e UWSGI_HTTP=:8080 \
    -e UWSGI_STATS=:1717 \
    -e UWSGI_STATS_HTTP=true \
    -t uwsgi
```

## nginx & uwsgi & Flaskで起動

```sh
$ docker-compose up -d --build
```