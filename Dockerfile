FROM php:5.6-fpm
WORKDIR /root

ENV DEBIAN_FRONTEND=noninteractive

# Update package info
RUN apt-get update 

# Install system packages
RUN apt-get -y install \
            g++ \
            git \
            libicu-dev \
            libmcrypt-dev \
            libfreetype6-dev \
            libjpeg-dev \
            libjpeg62-turbo-dev \
            libmcrypt-dev \
            libpng-dev \
            zlib1g-dev \
            mysql-client \
            openssh-client \
            libxml2-dev \
            vim \
            nano \
            percona-toolkit \
            wget \
        --no-install-recommends

# Install supervisor
RUN apt-get install -y supervisor python-pip && \
    pip install supervisor-stdout

# Install lockrun
ADD https://raw.githubusercontent.com/pushcx/lockrun/master/lockrun.c lockrun.c
RUN apt-get install -y gcc && \
    gcc lockrun.c -o lockrun && \
    cp lockrun /usr/local/bin/ && \
    rm -f lockrun.c

# Install PHP extensions required for Yii 2.0 Framework
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/ && \
    docker-php-ext-configure bcmath && \
    docker-php-ext-install gd \
                           intl \
                           pdo_mysql \
                           mbstring \
                           mcrypt \
                           zip \
                           bcmath \
                           soap

# Install xdebug
RUN printf "\n" | pecl install xdebug-2.4.0RC2

# Install apcu
RUN pecl install apcu-4.0.11 && echo extension=apcu.so > /usr/local/etc/php/conf.d/apcu.ini

# Install gearman
RUN apt-get install -y libboost-all-dev gperf libevent-dev uuid-dev libcloog-ppl-dev
ADD https://github.com/gearman/gearmand/releases/download/1.1.18/gearmand-1.1.18.tar.gz gearmand-1.1.18.tar.gz
RUN tar xvfz gearmand-1.1.18.tar.gz
WORKDIR /root/gearmand-1.1.18
RUN ./configure && \
    make && \
    make install && \
    printf "\n" | pecl install gearman && \
    docker-php-ext-enable gearman
RUN rm -rf /root/gearmand-1.1.18 /root/gearmand-1.1.18.tar.gz
WORKDIR /root

# PHP Extras
ADD http://php.net/get/php-5.6.34.tar.gz/from/this/mirror php-5.6.34.tar.gz
RUN tar xvfz php-5.6.34.tar.gz

# Install pcntl
WORKDIR /root/php-5.6.34/ext/pcntl
RUN phpize && \
    ./configure && \
    make && \
    make install && \
    docker-php-ext-enable pcntl
WORKDIR /root

# Install mysqli
WORKDIR /root/php-5.6.34/ext/mysqli
RUN phpize && \
    ./configure && \
    make && \
    make install && \
    docker-php-ext-enable mysqli
WORKDIR /app

# Install ssh2
RUN apt-get install -y libssh2-1-dev && \
    printf "\n" | pecl install channel://pecl.php.net/ssh2-0.12 && \
    docker-php-ext-enable ssh2

# Install imagick
RUN apt-get install -y imagemagick libmagickwand-dev libmagickcore-dev && \
    printf "\n" | pecl install imagick && \
    docker-php-ext-enable imagick

# Install memcached
ENV CFLAGS="-fgnu89-inline"
RUN printf "\n" | pecl install memcache-3.0.8 && \
    docker-php-ext-enable memcache
ENV CFLAGS=""

# Install mailparse
RUN printf "\n" | pecl install mailparse-2.1.6 && \
    docker-php-ext-enable mailparse

# Install imap
RUN apt-get install -y libc-client-dev libkrb5-dev && \
    docker-php-ext-configure imap --with-kerberos --with-imap-ssl && \
    docker-php-ext-install imap

# Install tidy
RUN apt install -y libtidy-dev && \
    docker-php-ext-install tidy && \
    docker-php-ext-enable tidy

# Install calendar
RUN docker-php-ext-configure calendar && \
    docker-php-ext-install calendar

## Install wkhtmltopdf 0.12.5
RUN curl -L https://downloads.wkhtmltopdf.org/0.12/0.12.5/wkhtmltox_0.12.5-1.stretch_amd64.deb \
        -o wkhtmltox_0.12.5-1.stretch_amd64.deb && \
    apt-get -y install \
            wkhtmltopdf \
            build-essential \
            openssl \
            libssl1.0-dev \
            xorg \
            xvfb && \
    dpkg -i wkhtmltox_0.12.5-1.stretch_amd64.deb && \
    rm -f wkhtmltox_0.12.5-1.stretch_amd64.deb && \
    # Install mscorefonts
    curl -L http://ftp.us.debian.org/debian/pool/contrib/m/msttcorefonts/ttf-mscorefonts-installer_3.6_all.deb \
        -o ttf-mscorefonts-installer_3.6_all.deb && \
    apt-get -y install \
            cabextract && \
    dpkg -i ttf-mscorefonts-installer_3.6_all.deb && \
    rm -f ttf-mscorefonts-installer_3.6_all.deb

# Install geoip
#ADD http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz GeoIP.dat.gz
#RUN gunzip GeoIP.dat.gz && \
#    mkdir /usr/share/GeoIP/ && \
#    mv GeoIP.dat /usr/share/GeoIP/ && \
#    chmod a+r /usr/share/GeoIP/GeoIP.dat && \
#    rm -f GeoIP.dat.gz

# Use application path
WORKDIR /app

# Copy configuration files
COPY files/ /

# Setup environment variables
ENV PATH=/app:/app/vendor/bin:/root/.composer/vendor/bin:$PATH \
    TERM=linux

# Add GITHUB_API_TOKEN support for composer
RUN echo "alias composer='sh /root/composer.sh'" >> /root/.bashrc && \
    chmod 700 /root/composer.sh

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- \
        --version=1.5.6 && \
    mv composer.phar /usr/local/bin/composer && \
    composer global require \
        "fxp/composer-asset-plugin:^1.4.0" \
        "hirak/prestissimo:^0.3.0" && \
    composer global dumpautoload --optimize

# Install packages required for Yii 2.0 Framework codeception testing globally
RUN composer global require  --prefer-dist \
        "codeception/codeception:^2.3.0" \
        "codeception/specify:*" \
        "codeception/verify:*" && \
    composer global dumpautoload --optimize

# Cleanup
RUN rm -rf /root/php-5.6.34 /root/php-5.6.34.tar.gz && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Run supervisor
CMD ["/usr/bin/supervisord"]
