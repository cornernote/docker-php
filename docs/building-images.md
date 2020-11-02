# Building Images

Build images:

```
docker-compose build
```

Tag image:

```
docker tag 76b81293d671 cornernote/php:7.3.22-fpm-stretch
docker tag 76b81293d671 cornernote/php:latest
```

Push to hub.docker.com:

```
docker push cornernote/php:7.3.22-fpm-stretch && docker push cornernote/php:latest
```

Shell into image

```
docker-compose run --rm php bash
```
