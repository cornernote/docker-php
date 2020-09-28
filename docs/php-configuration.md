# PHP Configuration

```yaml
version: '3'
services:
  php:
    image: cornernote/php
    volumes:
      - ./build/php.ini:/usr/local/etc/php/conf.d/base.ini
      - ./build/fpm.conf:/usr/local/etc/php-fpm.d/www.conf
      # if you prefer not to overwrite the whole file, you can load your config last
      #- ./build/php.ini:/usr/local/etc/php/conf.d/zzz-app-last.ini
      #- ./build/fpm.conf:/usr/local/etc/php-fpm.d/zzz-app-last.conf
```

To copy the initial configuration, start the container without volumes for `/usr/local/etc/php/conf.d/base.ini` or `/usr/local/etc/php-fpm.d/www.conf`, then run:

```shell script
docker cp root_php_1:/usr/local/etc/php/conf.d/base.ini build/php.ini
docker cp root_php_1:/usr/local/etc/php-fpm.d/www.conf build/fpm.conf
```
