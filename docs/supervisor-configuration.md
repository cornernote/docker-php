# Supervisor Configuration

```yaml
version: '3'
services:
  php:
    image: cornernote/php
    volumes:
      - ./build/supervisord.conf:/etc/supervisor/supervisord.conf
```

To copy the initial configuration, start the container without volumes for `/etc/supervisor/supervisord.conf` then run:

```shell script
docker cp root_php_1:/etc/supervisor/supervisord.conf build/supervisord.conf
```
