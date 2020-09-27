# Play with Docker

You can try this image by creating a stack on [Play with Docker](http://labs.play-with-docker.com/).

Login or signup, then create a new instance. You will be presented with a linux terminal.

Create a `cornernote/docker-php` application definition:

`cat > docker-compose.yml` (paste from below, the `CTRL+D`)

```
version: '3'
services:

  php:
    image: cornernote/php:7.3.22-fpm-stretch
    environment:
      - USE_SSL=0
      - DH_SIZE=2048
      - CERTBOT_EMAIL=
      - CERTBOT_DOMAIN=
      - NGINX_ERROR_LOG_LEVEL=warn
      - SERVER_NAME=app
      - FASTCGI_PASS_HOST=127.0.0.1:9000
    #volumes:
      #- ./web:/app/web
      #- ./src:/app/src
    ports:
      - 80:80
      #- 443:443
```

Then start the stack
    
```
docker-compose up -d
```

Your services will be available on their mapped port, just click the label right next to the node IP address.

## Troubleshooting

### Missing Port Link

If the link to the exposed port does not show then you can determine it from the SSH link provided.  Simply convert the link as follows then visit the page.

Change:

```
ssh EXAMPLE@direct.labs.play-with-docker.com
```

To:

```
http://EXAMPLE-80.direct.labs.play-with-docker.com
```

### Viewing Logs

When all else fails, check the logs.

Container logs:

```
docker-compose logs -f shinken
```