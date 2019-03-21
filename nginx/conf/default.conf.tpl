log_format url_response_time_json '{'
                                  '"time":"${DOLLAR}time_iso8601",'
                                  '"request_method":"${DOLLAR}request_method",'
                                  '"request":"${DOLLAR}request",'
                                  '"request_time":${DOLLAR}request_time,'
                                  '"body_bytes_sent":"${DOLLAR}body_bytes_sent",'
                                  '"status":"${DOLLAR}status",'
                                  '"upstream_response_time":${DOLLAR}upstream_response_time,'
                                  '"upstream_status":"${DOLLAR}upstream_status",'
                                  '"remote_addr":"${DOLLAR}remote_addr",'
                                  '"remote_user":"${DOLLAR}remote_user",'
                                  '"http_referer":"${DOLLAR}http_referer",'
                                  '"http_user_agent":"${DOLLAR}http_user_agent",'
                                  '"http_x_forwarded_for":"${DOLLAR}http_x_forwarded_for"'
                                  '}';

server {
    listen      ${NGINX_MAIN_PORT} default_server;
    charset     utf-8;
    client_max_body_size 75M;   # adjust to taste
    uwsgi_max_temp_file_size ${UWSGI_MAX_TEMP_FILE_SIZE};

    location / {
        ${FORWARD_PROTOCOL}  ${UWSGI_MAIN_PASS};
        include     uwsgi_params;
        uwsgi_read_timeout  ${UWSGI_READ_TIMEOUT};
    }

    access_log /dev/stdout url_response_time_json;
}

server {
    listen      ${NGINX_STATS_PORT};
    charset     utf-8;

    location / {
        ${FORWARD_PROTOCOL}  ${UWSGI_STATS_PASS};
    }

    access_log /dev/stdout url_response_time_json;
}
