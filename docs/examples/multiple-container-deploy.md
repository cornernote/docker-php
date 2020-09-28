# Multiple Container Deploy

Run multiple containers, one for each service. This allows you to scale your containers using `docker-composer` instead of `supervisord`.

Update your application definition.

`cat > docker-compose.yml` (paste from below, the `CTRL+D`)

```yaml
version: '3'
services:

  php:
    image: cornernote/php
    command: /usr/local/bin/php-run.sh
    volumes:
      - ./src:/app

  nginx:
    image: cornernote/php
    command: /usr/local/bin/nginx-run.sh
    ports:
      - 80:80
    volumes:
      - ./src:/app
    environment:
      - FASTCGI_PASS_HOST=php:9000

  cron:
    image: cornernote/php
    command: /usr/local/bin/cron-run.sh
    volumes:
      - ./src:/app

  #nrpe:
  #  image: cornernote/php
  #  command: /usr/local/bin/nrpe-run.sh
  #  volumes:
  #    - ./src:/app

  #queue:
  #  image: cornernote/php
  #  command: yii queue/listen
  #  volumes:
  #    - ./src:/app
```
