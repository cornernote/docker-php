# Play with Docker

You can try this image by creating a stack on [Play with Docker](http://labs.play-with-docker.com/).

After logging in you will be presented with a linux terminal.

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

Next you may want to add your own PHP pages.

`mkdir -p src/web && cat > src/web/index.php` (paste from below, then `CTRL+D`)

```html
<!doctype html>
<html lang="en">
<head>
    <title>Sample Page</title>
</head>
<body>
<?= 'Hello World!' ?>
</body>
</html>
```

Update your application definition.

`cat > docker-compose.yml` (paste from below, the `CTRL+D`)

```yaml
version: '3'
services:

  php:
    image: cornernote/php
    ports:
      - 80:80
    volumes:
      - ./src:/app
```

Finally, restart the stack.
    
```shell script
docker-compose up -d
```


## Troubleshooting

### Missing Port Link

If the link to the exposed port does not show then you can determine it from the SSH link provided.  Simply convert the link as follows then visit the page.

Change:

```shell script
ssh EXAMPLE@direct.labs.play-with-docker.com
```

To:

```shell script
http://EXAMPLE-80.direct.labs.play-with-docker.com
```

### Viewing Logs

When all else fails, check the logs.

Container logs:

```shell script
docker-compose logs -f shinken
```