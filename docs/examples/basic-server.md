# Basic Server

Create a `cornernote/docker-php` application definition:

`cat > docker-compose.yml` (paste from below, then `CTRL+D`)

```yaml
version: '3'
services:
  php:
    image: cornernote/php
    ports:
      - 80:80
```

Then start the stack
    
```shell script
docker-compose up -d
```

Your services will be available on their mapped port, just click the label right next to the node IP address.

