## Building Images

Build images:

```
docker-compose build
```

Tag image:

```
docker tag d6ee65c835da cornernote/php:7.3.22-fpm-stretch
docker tag d6ee65c835da cornernote/php:latest
```

Push to hub.docker.com:

```
docker login
docker push cornernote/php:7.3.22-fpm-stretch
docker push cornernote/php:latest
```

## Shell into Image

```
docker-compose run --rm php bash
```


## Usage Example

### `docker-compose.yml`

```
version: '3'
services:

  php:
    image: cornernote/php:7.3.22-fpm-stretch
    depends_on:
      - db
    environment:
      - USE_SSL=1
      - DH_SIZE=2048
      - CERTBOT_EMAIL=info@example.com
      - CERTBOT_DOMAIN=example.com
      - NGINX_ERROR_LOG_LEVEL=warn
      - SERVER_NAME=example.com
      - FASTCGI_PASS_HOST=127.0.0.1:9000
    volumes:
      - ./web:/app/web
      #- ./src:/app/src
    ports:
      - 80:80
      - 443:443

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
    image: kendu/gearman
    #ports:
    #  - 4730:4730
    
volumes:
  mysql:
  
```
