FROM python:3.6-alpine

LABEL maintainer Shun Fukusumi <shun.fukusumi@gmail.com>

RUN apk update && apk add python3-dev build-base linux-headers pcre-dev
RUN pip install -U setuptools pip && pip install uwsgi

ENV TZ=Asia/Tokyo

COPY requirements.txt /var/www/requirements.txt
RUN pip install -r /var/www/requirements.txt

COPY uwsgi.ini /var/www/uwsgi.ini
COPY src /var/www/src
CMD ["uwsgi", "--thunder-lock", "--ini", "/var/www/uwsgi.ini"]