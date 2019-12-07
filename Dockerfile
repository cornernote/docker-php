# PHP Docker image for Yii 2.0 Framework runtime
# @see https://github.com/dmstr/docker-php-yii2/blob/release/4.x/php/Dockerfile-fpm
# ==============================================

FROM php:7.3.12-fpm-stretch
ENV DEBIAN_FRONTEND=noninteractive

RUN curl -sL https://deb.nodesource.com/setup_11.x | bash - && \
    apt-get update && \
    apt-get -y install \
            apt-utils \
            g++ \
            gcc \
            git \
            bash-completion \
            curl \
            wget \
            mlocate \
            imagemagick \
            libfreetype6-dev \
            libcurl3-dev \
            libicu-dev \
            libmcrypt-dev \
            libfreetype6-dev \
            libjpeg-dev \
            libjpeg62-turbo-dev \
            libmagickwand-dev \
            libmcrypt-dev \
            libpq-dev \
            libpng-dev \
            libzip-dev \
            zlib1g-dev \
            default-mysql-client \
            openssh-client \
            libxml2-dev \
            nano \
            linkchecker \
            cron \
            vim \
            iputils-ping \
            ghostscript \
            percona-toolkit \
            nagios-nrpe-server \
            nagios-plugins \
            pdftk \
            rsync \
            s3cmd \
            nodejs \
            npm \
            libtidy-dev \
        --no-install-recommends && \
    apt-get clean && \
    npm -g install npm@latest

# Install supervisor
RUN apt-get -y install \
            supervisor \
            python-pip && \
    pip install supervisor-stdout

# Install PHP extensions required for Yii 2.0 Framework
RUN docker-php-ext-configure gd \
        --with-freetype-dir=/usr/include/ \
        --with-png-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-configure bcmath && \
    docker-php-ext-install \
            soap \
            zip \
            curl \
            bcmath \
            exif \
            gd \
            iconv \
            intl \
            mbstring \
            opcache \
            pdo_mysql \
            pdo_pgsql \
            mysqli \
            pcntl \
            calendar \
            tidy

# Install PECL extensions
# see http://stackoverflow.com/a/8154466/291573) for usage of `printf`
RUN printf "\n" | pecl install \
        apcu \
        imagick \
        mailparse \
        mcrypt-1.0.0 && \
    docker-php-ext-enable \
        apcu \
        imagick \
        mailparse

# Install xdebug
RUN cd /tmp && \
    git clone git://github.com/xdebug/xdebug.git && \
    cd xdebug && \
    git checkout 2.8.1 && \
    phpize && \
    ./configure --enable-xdebug && \
    make && \
    make install && \
    rm -rf /tmp/xdebug

# Install gearman
RUN apt-get -y install \
            libgearman-dev && \
    cd /tmp && \
    git clone https://github.com/wcgallego/pecl-gearman.git && \
    cd pecl-gearman && \
    phpize && \
    ./configure && \
    make && \
    make install && \
    docker-php-ext-enable gearman && \
    rm -rf /tmp/pecl-gearman

# Install ssh2
RUN apt-get -y install \
            libssh2-1-dev && \
    git clone https://github.com/php/pecl-networking-ssh2.git /usr/src/php/ext/ssh2 && \
    docker-php-ext-install ssh2

# Install imap
RUN apt-get -y install \
            libc-client-dev \
            libkrb5-dev && \
    docker-php-ext-configure imap \
            --with-kerberos \
            --with-imap-ssl && \
    docker-php-ext-install imap

## Install memcached
#RUN apt-get -y install \
#            libpq-dev \
#            libmemcached-dev && \
#    curl -L -o /tmp/memcached.tar.gz "https://github.com/php-memcached-dev/php-memcached/archive/php7.tar.gz" && \
#    mkdir -p /usr/src/php/ext/memcached && \
#    tar -C /usr/src/php/ext/memcached -zxvf /tmp/memcached.tar.gz --strip 1 && \
#    docker-php-ext-configure memcached && \
#    docker-php-ext-install memcached && \
#    rm /tmp/memcached.tar.gz

# Install less-compiler
RUN npm install -g \
        less \
        lesshint \
        uglify-js \
        uglifycss

# Copy configuration files
COPY files/ /

# Set environment variables
ENV PHP_USER_ID=33 \
    PHP_ENABLE_XDEBUG=0 \
    VERSION_COMPOSER_ASSET_PLUGIN=^1.4.3 \
    VERSION_PRESTISSIMO_PLUGIN=^0.3.0 \
    PATH=/app:/app/vendor/bin:/root/.composer/vendor/bin:$PATH \
    TERM=linux \
    COMPOSER_ALLOW_SUPERUSER=1

# Add GITHUB_API_TOKEN support for composer
RUN chmod 700 \
        /usr/local/bin/docker-entrypoint.sh \
        /usr/local/bin/docker-run.sh \
        /usr/local/bin/composer

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- \
        --filename=composer \
        --install-dir=/usr/local/bin && \
    composer global require --optimize-autoloader \
        "fxp/composer-asset-plugin:${VERSION_COMPOSER_ASSET_PLUGIN}" \
        "hirak/prestissimo:${VERSION_PRESTISSIMO_PLUGIN}" && \
    composer global dumpautoload --optimize && \
    composer clear-cache

# Install lockrun
RUN curl -L https://raw.githubusercontent.com/pushcx/lockrun/master/lockrun.c \
        -o lockrun.c && \
    gcc lockrun.c -o lockrun && \
    cp lockrun /usr/local/bin/ && \
    rm -f lockrun.c lockrun

# Install Yii framework bash autocompletion
RUN curl -L https://raw.githubusercontent.com/yiisoft/yii2/master/contrib/completion/bash/yii \
        -o /etc/bash_completion.d/yii

# Install codeception
RUN curl -L https://codeception.com/codecept.phar \
        -o /usr/local/bin/codecept && \
    chmod +x /usr/local/bin/codecept

# Install psysh
RUN curl -L https://psysh.org/psysh \
        -o /usr/local/bin/psysh && \
    chmod +x /usr/local/bin/psysh

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
RUN curl -L https://geolite.maxmind.com/download/geoip/database/GeoLite2-City.tar.gz \
        -o GeoLite2-City.tar.gz && \
    tar xfz GeoLite2-City.tar.gz && \
    mkdir /usr/share/GeoIP/ && \
    mv GeoLite2-City_20*/GeoLite2-City.mmdb /usr/share/GeoIP/ && \
    chmod a+r /usr/share/GeoIP/GeoLite2-City.mmdb && \
    rm -rf GeoLite2-City.tar.gz GeoLite2-City_20*/

# Install v8js
ENV PATH="/tmp/depot_tools:${PATH}"
RUN apt-get -y install \
        build-essential \
        curl \
        git \
        python \
        libglib2.0-dev \
        patchelf && \
    cd /tmp && \
    git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git && \
    fetch v8 && \
    cd /tmp/v8 && \
    git checkout 7.5.288.23 && \
    gclient sync && \
    tools/dev/v8gen.py -vv x64.release -- is_component_build=true use_custom_libcxx=false && \
    ninja -C out.gn/x64.release/ && \
    mkdir -p /opt/v8/lib && \
    mkdir -p /opt/v8/include && \
    cp out.gn/x64.release/lib*.so out.gn/x64.release/*_blob.bin out.gn/x64.release/icudtl.dat /opt/v8/lib/ && \
    cp -R include/* /opt/v8/include/ && \
    for A in /opt/v8/lib/*.so; do patchelf --set-rpath '$ORIGIN' $A; done && \
    # Install phpv8
    cd /tmp && \
    git clone https://github.com/phpv8/v8js.git && \
    cd /tmp/v8js && \
    phpize && \
    ./configure --with-v8js=/opt/v8 LDFLAGS="-lstdc++" && \
    make && \
    make install && \
    echo extension=v8js.so >> /usr/local/etc/php/conf.d/v8js.ini && \
    # Cleanup
    apt-get -y autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Use /app as working directory
WORKDIR /app

# Forward cron logs to docker log collector
RUN ln -sf /usr/sbin/cron /usr/sbin/crond

# Run supervisor
#CMD ["/usr/bin/supervisord"]

# Startup script for FPM
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["docker-run.sh"]
