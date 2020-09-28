# Single Container Deploy

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

