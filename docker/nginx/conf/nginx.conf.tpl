user nginx;
worker_processes auto;
worker_rlimit_nofile ${WORKER_RLIMIT_NOFILE};

error_log /var/log/nginx/error.log warn;
pid /var/run/nginx.pid;


events {
    worker_connections ${WORKER_CONNECTIONS};
}


http {
    include /etc/nginx/mime.types;
    default_type application/octet-stream;

    log_format main '${DOLLAR}remote_addr - ${DOLLAR}remote_user [${DOLLAR}time_local] "${DOLLAR}request" '
                    '${DOLLAR}status ${DOLLAR}body_bytes_sent "${DOLLAR}http_referer" '
                    '"${DOLLAR}http_user_agent" "${DOLLAR}http_x_forwarded_for"';

    access_log /var/log/nginx/access.log main;

    sendfile on;
    tcp_nopush on;
    tcp_nodelay on;
    keepalive_timeout 65;
    types_hash_max_size 2048;

    server_tokens off;

    gzip on;
    include /etc/nginx/conf.d/*.conf;
}
