FROM python:3.7-alpine

LABEL maintainer Shun Fukusumi <shun.fukusumi@gmail.com>

WORKDIR /var/www

# 初期セットアップ
RUN apk --update add python3-dev build-base linux-headers pcre-dev
RUN pip install -U setuptools pip && pip install uwsgi pipenv

# 時刻をJSTに変更
RUN apk add tzdata
RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    apk del tzdata && \
    rm -rf /var/cache/apk/*

# pythonの環境構築
COPY Pipfile /var/www/Pipfile
COPY Pipfile.lock /var/www/Pipfile.lock
RUN pipenv install --system

# アプリケーションの起動
COPY uwsgi.ini /var/www/uwsgi.ini
COPY src /var/www/src
CMD ["uwsgi", "--thunder-lock", "--ini", "/var/www/uwsgi.ini"]
