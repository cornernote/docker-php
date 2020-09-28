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

