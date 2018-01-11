# Building Images

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
docker tag XXX cornernote/php:5.6-fpm
```

Push to hub.docker.com:

```
docker login
docker push cornernote/php:5.6-fpm
```
