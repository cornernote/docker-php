# Building Images

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

Shell into image

```
docker-compose run --rm php bash
```
