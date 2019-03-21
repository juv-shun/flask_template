FROM python:3.7-alpine

LABEL maintainer Shun Fukusumi <shun.fukusumi@gmail.com>

WORKDIR /var/www

RUN apk update && apk add python3-dev build-base linux-headers pcre-dev
RUN pip install -U setuptools pip && pip install uwsgi pipenv

ENV TZ=Asia/Tokyo

COPY Pipfile /var/www/Pipfile
COPY Pipfile.lock /var/www/Pipfile.lock
RUN pipenv install --system

COPY uwsgi.ini /var/www/uwsgi.ini
COPY src /var/www/src
CMD ["uwsgi", "--thunder-lock", "--ini", "/var/www/uwsgi.ini"]
