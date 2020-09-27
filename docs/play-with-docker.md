# Play with Docker

You can try this image by creating a stack on [Play with Docker](http://labs.play-with-docker.com/).

After logging in you will be presented with a linux terminal.

## Examples

### Basic Server

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

### Custom PHP Application

You can add your own PHP application.

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

Start or restart the stack.
    
```shell script
docker-compose up -d
```


### Composer Libraries

Create the composer files

`echo {} > composer.lock && cat > composer.json` (paste from below, the `CTRL+D`)

```json
{
    "require": {
        "alrik11es/cowsayphp": "1.2.*"
    }
}
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
      - ./composer.json:/app/composer.json
      - ./composer.lock:/app/composer.lock
      - ./src:/app
```

Start or restart the stack.
    
```shell script
docker-compose up -d
```

Run composer install inside the container

```shell script
docker-compose exec php composer install
```

`mkdir -p src/web && cat > src/web/index.php` (paste from below, then `CTRL+D`)

```html
<?php require('../vendor/autoload.php'); ?>
<!doctype html>
<html lang="en">
<head>
    <title>Sample Page</title>
</head>
<body>
<?php
$cow = \Cowsayphp\Farm::create(\Cowsayphp\Farm\Cow::class);
echo '<pre>'.$cow->say($_GET['message'] ?? 'Send me a ?message= in the URL').'</pre>';
?>
</body>
</html>
```

### Cron Jobs

```yaml
version: '3'
services:

  php:
    image: cornernote/php
    volumes:
      - ./build/crontab:/etc/cron.d/crontab
```

Create a cron file

`mkdir build && cat > build/cron` (paste from below, then `CTRL+D`)

```
* * * * * echo date > /tmp/cron-running
```

Start or restart the stack.
    
```shell script
docker-compose up -d
```

### Single Container

Run all the services in a single container. This is the default configuration.

Create a config file for supervisord.

`mkdir  build && cat > build/supervisord.conf` (paste from below, then `CTRL+D`)

```ini
[supervisord]
nodaemon=true

[program:nginx]
command=nginx-run.sh
autorestart=true
stdout_events_enabled=true
stderr_events_enabled=true
stdout_logfile=/dev/stdout
stdout_logfile_maxbytes=0

[program:php]
command=php-run.sh
autorestart=true
stdout_events_enabled=true
stderr_events_enabled=true
stdout_logfile=/dev/stdout
stdout_logfile_maxbytes=0

[program:cron]
command=cron-run.sh
autorestart=true
stdout_events_enabled=true
stderr_events_enabled=true
stdout_logfile=/dev/stdout
stdout_logfile_maxbytes=0

#[program:nrpe]
#command=nrpe-run.sh
#autorestart=true
#stdout_events_enabled=true
#stderr_events_enabled=true
#stdout_logfile=/dev/stdout
#stdout_logfile_maxbytes=0

#[program:queue]
#command=yii queue/listen
#autorestart=true
#stdout_events_enabled=true
#stderr_events_enabled=true
#stdout_logfile=/dev/stdout
#stdout_logfile_maxbytes=0

[eventlistener:stdout]
command = supervisor_stdout
buffer_size = 100
events = PROCESS_LOG
result_handler = supervisor_stdout:event_handler
```

Update your application definition.

`cat > docker-compose.yml` (paste from below, the `CTRL+D`)

```yaml
version: '3'
services:

  php:
    image: cornernote/php
    command: /usr/local/bin/supervisor-run.sh
    volumes:
      - ./build/supervisord.conf:/etc/supervisor/supervisord.conf
      - ./src:/app
```


### Multiple Containers

Run multiple containers, one for each service. This allows you to scale your containers using `docker-composer` instead of `supervisord`.

Update your application definition.

`cat > docker-compose.yml` (paste from below, the `CTRL+D`)

```yaml
version: '3'
services:

  php:
    image: cornernote/php
    command: /usr/local/bin/php-run.sh
    volumes:
      - ./src:/app

  nginx:
    image: cornernote/php
    command: /usr/local/bin/nginx-run.sh
    ports:
      - 80:80
    volumes:
      - ./src:/app

  cron:
    image: cornernote/php
    command: /usr/local/bin/cron-run.sh
    volumes:
      - ./src:/app

  #nrpe:
  #  image: cornernote/php
  #  command: /usr/local/bin/nrpe-run.sh
  #  volumes:
  #    - ./src:/app

  #queue:
  #  image: cornernote/php
  #  command: yii queue/listen
  #  volumes:
  #    - ./src:/app
```

## Related Service Containers

Update your application definition.

`cat > docker-compose.yml` (paste from below, the `CTRL+D`)

```yaml
version: '3'
services:

  db:
    image: percona:8.0
    command: --character-set-server=utf8 --collation-server=utf8_general_ci --sql-mode="ERROR_FOR_DIVISION_BY_ZERO,IGNORE_SPACE,NO_ENGINE_SUBSTITUTION,NO_ZERO_DATE,NO_ZERO_IN_DATE,PIPES_AS_CONCAT,REAL_AS_FLOAT"
    environment:
      - MYSQL_USER=test
      - MYSQL_DATABASE=test
      - MYSQL_PASSWORD=test
      - MYSQL_ROOT_PASSWORD=root
    #ports:
    #  - 3306:3306

  redis:
    image: redis:5.0-alpine
    #ports:
    #  - 6379:6379

  gearman:
    image: cornernote/gearman
    #ports:
    #  - 4730:4730
```


## Troubleshooting

### Viewing Logs

When all else fails, check the logs.

```shell script
docker-compose logs -f
```

### Missing Port Link

If the link to the exposed port does not show then you can determine it from the SSH link provided.  Simply convert the link as follows then visit the page.

Change:

```shell script
ssh EXAMPLE@direct.labs.play-with-docker.com
```

To:

```
http://EXAMPLE-80.direct.labs.play-with-docker.com
```

