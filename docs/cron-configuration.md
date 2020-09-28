# Cron Configuration

```yaml
version: '3'
services:
  php:
    image: cornernote/php
    volumes:
      - ./build/crontab:/etc/cron.d/root
```

Create a cron file

`mkdir build && cat > build/cron` (paste from below, then `CTRL+D`)

```
* * * * * echo date > /tmp/cron-running
```

Start or restart the container.

```shell script
docker-compose up -d
```

The service will detect any change to files inside the `/etc/cron/` folder and trigger cron to restart after 10 seconds.
