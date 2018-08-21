FROM nginx:alpine

LABEL maintainer Shun Fukusumi <shun.fukusumi@gmail.com>

ADD conf /etc/nginx/conf.d/
ADD scripts /
RUN apk --update add tzdata && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    rm -rf /var/cache/apk/*
RUN chmod a+x /start.sh

ENV TZ=Asia/Tokyo \
    DOLLAR='$' \
    WORKER_CONNECTIONS=1024 \
    WORKER_RLIMIT_NOFILE=8196 \
    UWSGI_READ_TIMEOUT=60s \
    UWSGI_MAX_TEMP_FILE_SIZE=4096m 

CMD ["/start.sh"]
