# Building Images

Build images:

```
docker-compose build
```

Tag image:

```
docker tag aa870edc0261 cornernote/php:7.3.22-fpm-stretch
docker tag aa870edc0261 cornernote/php:latest
```

Push to hub.docker.com:

```
docker push cornernote/php:7.3.22-fpm-stretch && docker push cornernote/php:latest
```

Shell into image

```
docker-compose run --rm php bash
```
