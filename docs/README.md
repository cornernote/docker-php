## Building Images

Build images:

```
docker-compose build
docker-compose build --no-cache     # if files/* changes
```

List images:

```
docker images
```

Tag image:

```
docker tag 5a31684c3244 cornernote/php:7.3.12-fpm-stretch
```

Push to hub.docker.com:

```
docker login
docker push cornernote/php:7.3.12-fpm-stretch
```

## Shell into Image

```
docker-compose run --rm php bash
```


## Usage Example

### `docker-compose.yml`

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

