#!/bin/sh
envsubst < /etc/nginx/conf.d/default.conf.tpl > /etc/nginx/conf.d/default.conf
envsubst < /etc/nginx/conf.d/nginx.conf.tpl > /etc/nginx/nginx.conf
exec nginx -g 'daemon off;'
