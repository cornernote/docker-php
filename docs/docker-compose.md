# Docker-Compose

A sample `docker-compose.yml` with several additional services.

```
version: '3'
services:

  php:
    image: cornernote/php
    environment:
      - USE_SSL=1
      - SSL_PATH=
      - DH_SIZE=2048
      - CERTBOT_EMAIL=info@example.com
      - CERTBOT_DOMAIN=example.com
      - NGINX_ERROR_LOG_LEVEL=warn
      - SERVER_NAME=example.com
      - FASTCGI_PASS_HOST=127.0.0.1:9000
    volumes:
      - ./web:/app/web
      #- ./src:/app
    ports:
      - 80:80
      - 443:443
    ## supervisor
    #command: /usr/local/bin/supervisor-run.sh
    #command: /usr/local/bin/php-run.sh
    #command: /usr/local/bin/nginx-run.sh
    #command: /usr/local/bin/nrpe-run.sh
    #command: /usr/local/bin/cron-run.sh
    #volumes:
    #  - ./files/etc/cron.d/:/etc/cron.d/

  db:
    image: percona:8.0
    command: --character-set-server=utf8 --collation-server=utf8_general_ci --sql-mode="ERROR_FOR_DIVISION_BY_ZERO,IGNORE_SPACE,NO_ENGINE_SUBSTITUTION,NO_ZERO_DATE,NO_ZERO_IN_DATE,PIPES_AS_CONCAT,REAL_AS_FLOAT"
    environment:
      - MYSQL_USER=console
      - MYSQL_DATABASE=console
      - MYSQL_PASSWORD=console
      - MYSQL_ROOT_PASSWORD=root
    volumes:
      - mysql-data:/var/lib/mysql
    #ports:
    #  - 3306:3306

  redis:
    image: redis:5.0-alpine
    #ports:
    #  - 6379:6379

  gearman:
    image: cornernote/gearman
    #ports:
    #  - 4730:4730
    
volumes:
  mysql:
  
```

