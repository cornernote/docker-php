# PHP Image for Docker

The image provides several services relating to serving a PHP web application.

[![Pulls](https://img.shields.io/docker/pulls/cornernote/php.svg?style=flat-square)](https://hub.docker.com/r/cornernote/php/) [![Build](https://img.shields.io/docker/build/cornernote/php.svg?style=flat-square)](https://hub.docker.com/r/cornernote/php/)

## Services

### Supervisor

Supervisor is a client/server system that allows its users to monitor and control a number of processes on UNIX-like operating systems.

Docker runs a single service. Supervisor allows multiple processes to run within a single container.

### PHP

PHP is a popular general-purpose scripting language that is especially suited to web development.

FPM (FastCGI Process Manager) is an alternative PHP FastCGI implementation with some additional features (mostly) useful for heavy-loaded sites.

The PHP-FPM service is available on port 9000.

PHP extensions:

* xdebug
* v8js
* gearman
* soap
* zip
* curl
* bcmath
* exif
* gd
* iconv
* intl
* mbstring
* opcache
* pdo_mysql
* pdo_pgsql
* mysqli
* pcntl
* calendar
* tidy
* ssh2
* apcu
* imagick
* mailparse
* mcrypt
* imap

Linux packages:

* composer
* codeception
* psysh
* robo - TODO
* wkhtmltopdf


### Nginx

Nginx is a high-performance HTTP server and reverse proxy.

Auto restarts when cron change is detected.

SSL certificate auto-installation with certbot.


### Cron

Cron is a time-based job scheduler.

Allows tasks to be run on a schedule.

Auto restarts when cron change is detected.

Comes with lockrun to prevent task overlap.

### NRPE

NRPE allows you to locally execute Nagios plugins when requested by a Nagios server to monitor machine metrics (disk usage, CPU load, etc.). 


### Other Packages

In addition to the services above, the image comes with following system administration tools:

* mysql client / percona toolkit
* rsync / s3cmd
* nodejs / npm
* image magick
* ping / curl / wget
* lockrun


## Supported tags and `Dockerfile` links

### `latest` [Dockerfile](https://github.com/cornernote/docker-php/blob/master/Dockerfile)

[![Version](https://img.shields.io/badge/version-latest-blue.svg?style=flat-square)](https://github.com/cornernote/docker-php) [![Layers](https://img.shields.io/microbadger/layers/cornernote/php/latest.svg?style=flat-square)](https://hub.docker.com/r/cornernote/php/) [![Size](https://img.shields.io/microbadger/image-size/cornernote/php/latest.svg?style=flat-square)](https://hub.docker.com/r/cornernote/php/)

### `7.3.22-fpm-stretch` [Dockerfile](https://github.com/cornernote/docker-php/blob/7.3.22-fpm-stretch/Dockerfile)

[![Version](https://img.shields.io/badge/version-7.3.22--fpm--stretch-blue.svg?style=flat-square)](https://github.com/cornernote/docker-php/tree/7.3.22-fpm-stretch) [![Layers](https://img.shields.io/microbadger/layers/cornernote/php/7.3.22-fpm-stretch.svg?style=flat-square)](https://hub.docker.com/r/cornernote/php/) [![Size](https://img.shields.io/microbadger/image-size/cornernote/php/7.3.22-fpm-stretch.svg?style=flat-square)](https://hub.docker.com/r/cornernote/php/)

### `5.6-fpm` [Dockerfile](https://github.com/cornernote/docker-php/blob/5.6-fpm/Dockerfile)

[![Version](https://img.shields.io/badge/version-5.6--fpm-blue.svg?style=flat-square)](https://github.com/cornernote/docker-php/tree/5.6-fpm) [![Layers](https://img.shields.io/microbadger/layers/cornernote/php/5.6-fpm.svg?style=flat-square)](https://hub.docker.com/r/cornernote/php/) [![Size](https://img.shields.io/microbadger/image-size/cornernote/php/5.6-fpm.svg?style=flat-square)](https://hub.docker.com/r/cornernote/php/)


## Resources

* [GitHub Project](https://github.com/cornernote/docker-php)
* [DockerHub Project](https://hub.docker.com/r/cornernote/php/)
