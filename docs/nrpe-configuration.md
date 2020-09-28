# NRPE Configuration

```yaml
version: '3'
services:
  php:
    image: cornernote/php
    volumes:
      - ./build/nrpe.cfg:/etc/nagios/nrpe.cfg
      - ./build/nrpe_local.cfg:/etc/nagios/nrpe_local.cfg
    ports:
      - 5666:5666 
```

To copy the initial configuration, start the container without volumes for `/etc/nagios/nrpe.cfg` or `/etc/nagios/nrpe_local.cfg`, then run:

```shell script
docker cp root_php_1:/etc/nagios/nrpe.cfg build/nrpe.cfg
docker cp root_php_1:/etc/nagios/nrpe_local.cfg build/nrpe_local.cfg
```
