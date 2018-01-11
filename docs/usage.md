# Usage Example

## `docker-compose.yml`

```
version: '2'
services:

  php:
    build:
      dockerfile: Dockerfile
      context: .
    depends_on:
      - db
      - memcached
      - gearman
    environment:
      - DB_ENV_MYSQL_ROOT_PASSWORD=rootpass
    volumes:
      - ./web:/app/web
      #- ./src:/app/src

  nginx:
    image: cornernote/nginx:1.9
    volumes:
      - ./web:/app/web
    ports:
      - 80:80
      - 443:443
    depends_on:
      - php

  db:
    command: --character-set-server=utf8 --collation-server=utf8_general_ci
    image: percona:5.7
    environment:
      MYSQL_USER: app
      MYSQL_DATABASE: app
      MYSQL_PASSWORD: pass
      MYSQL_ROOT_PASSWORD: rootpass
    volumes:
      - mysql:/var/lib/mysql
    ports:
      - 3306:3306

  memcached:
    image: memcached

  gearman:
    image: kendu/gearman
    
volumes:
  mysql:
  
```


## `Dockerfile`

```
FROM cornernote/php:5.6-fpm
WORKDIR /app

# Application packages
COPY composer.* /app/
RUN composer install --prefer-dist --optimize-autoloader && \
    composer clear-cache

# Server setup
COPY build/files /

# Application setup
COPY yii /app/
COPY web /app/web
COPY src /app/src
COPY build/bin /app/bin
RUN cp src/app.env-dist src/app.env

# Application permissions
RUN mkdir -p runtime web/assets
RUN chmod -R 775 runtime web/assets
RUN chown -R www-data:www-data runtime web/assets
```

## `supervisord.conf`

`/build/files/etc/supervisor/conf.d/supervisord.conf`

```
[supervisord]
nodaemon=true

[program:phpfpm]
command=/run.sh
autorestart=true
stdout_events_enabled=true
stderr_events_enabled=true

[program:worker]
command=/app/yii gearman/start %(process_num)s
process_name=worker-%(process_num)s
priority=1
numprocs=2
numprocs_start=1
autorestart=true
stdout_events_enabled=true
stderr_events_enabled=true

[eventlistener:stdout]
command = supervisor_stdout
buffer_size = 100
events = PROCESS_LOG
result_handler = supervisor_stdout:event_handler
```
