# PHP Docker image for Yii 2.0 Framework runtime
# @see https://github.com/dmstr/docker-php-yii2/blob/release/4.x/php/Dockerfile-fpm
# ==============================================

FROM php:7.3.12-fpm-stretch

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive \
    PHP_USER_ID=33 \
    PHP_ENABLE_XDEBUG=0 \
    PATH=/app:/app/vendor/bin:/root/.composer/vendor/bin:/tmp/depot_tools:$PATH \
    TERM=linux \
    COMPOSER_ALLOW_SUPERUSER=1

## Install base OS packages
RUN pwd && \

    # Install node
    curl -sL https://deb.nodesource.com/setup_11.x | bash - && \

    # Install packages
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
            libgearman-dev \
            libssh2-1-dev \
        --no-install-recommends && \
    apt-get clean && \

    # Forward cron logs to docker log collector
    ln -sf /usr/sbin/cron /usr/sbin/crond && \

    ## Install npm
    npm -g install npm@latest && \

    # Install less-compiler
    npm install -g \
        less \
        lesshint \
        uglify-js \
        uglifycss && \

    # Install lockrun
    cd /tmp && \
    curl -L https://raw.githubusercontent.com/pushcx/lockrun/master/lockrun.c \
        -o lockrun.c && \
    gcc lockrun.c -o lockrun && \
    cp lockrun /usr/local/bin/ && \

    ## Install wkhtmltopdf 0.12.5
    curl -L https://downloads.wkhtmltopdf.org/0.12/0.12.5/wkhtmltox_0.12.5-1.stretch_amd64.deb \
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
    rm -f ttf-mscorefonts-installer_3.6_all.deb && \

    # Install geoip
    curl -L https://geolite.maxmind.com/download/geoip/database/GeoLite2-City.tar.gz \
        -o GeoLite2-City.tar.gz && \
    tar xfz GeoLite2-City.tar.gz && \
    mkdir /usr/share/GeoIP/ && \
    mv GeoLite2-City_20*/GeoLite2-City.mmdb /usr/share/GeoIP/ && \
    chmod a+r /usr/share/GeoIP/GeoLite2-City.mmdb && \
    rm -rf GeoLite2-City.tar.gz GeoLite2-City_20*/ && \

    # Cleanup
    apt-get -y autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install PHP extensions
RUN git clone https://github.com/php/pecl-networking-ssh2.git /usr/src/php/ext/ssh2 && \
    docker-php-ext-configure gd \
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
            tidy \
            ssh2 && \

    # Install PECL extensions
    # see http://stackoverflow.com/a/8154466/291573) for usage of `printf`
    printf "\n" | pecl install \
        apcu \
        imagick \
        mailparse \
        mcrypt-1.0.0 && \
    docker-php-ext-enable \
        apcu \
        imagick \
        mailparse && \

    # Install xdebug
    cd /tmp && \
    git clone git://github.com/xdebug/xdebug.git && \
    cd xdebug && \
    git checkout 2.8.1 && \
    phpize && \
    ./configure --enable-xdebug && \
    make && \
    make install && \

    # Install gearman
    cd /tmp && \
    git clone https://github.com/wcgallego/pecl-gearman.git && \
    cd pecl-gearman && \
    phpize && \
    ./configure && \
    make && \
    make install && \
    docker-php-ext-enable gearman && \

    # Install composer
    curl -sS https://getcomposer.org/installer | php -- \
        --filename=composer \
        --install-dir=/usr/local/bin && \
    composer global require --optimize-autoloader \
        "fxp/composer-asset-plugin:^1.4.3" \
        "hirak/prestissimo:^0.3.0" && \
    composer global dumpautoload --optimize && \
    composer clear-cache && \

    # Install Yii framework bash autocompletion
    curl -L https://raw.githubusercontent.com/yiisoft/yii2/master/contrib/completion/bash/yii \
        -o /etc/bash_completion.d/yii && \

    # Install codeception
    curl -L https://codeception.com/codecept.phar \
        -o /usr/local/bin/codecept && \

    # Install psysh
    curl -L https://psysh.org/psysh \
        -o /usr/local/bin/psysh && \

    # Cleanup
    apt-get -y autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install imap
RUN apt-get update && \
    apt-get install -y \
            libc-client-dev \
            libkrb5-dev && \
    docker-php-ext-configure imap \
        --with-kerberos \
        --with-imap-ssl && \
    docker-php-ext-install imap && \
    # Cleanup
    apt-get -y autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install v8js
RUN apt-get update && \
    apt-get -y install \
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

# Install supervisor
RUN apt-get update && \
    apt-get -y install \
            supervisor \
            python-pip && \
    # Cleanup
    apt-get -y autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN pip install supervisor-stdout

# Copy configuration files
COPY files/ /

# Set executibale scripts
RUN chmod 700 \
        /usr/local/bin/cron-run.sh \
        /usr/local/bin/nrpe-run.sh \
        /usr/local/bin/php-run.sh \
        /usr/local/bin/php-entrypoint.sh \
        /usr/local/bin/composer \
        /usr/local/bin/codecept \
        /usr/local/bin/psysh

# Set app working directory
WORKDIR /app

# Startup for supervisor
#CMD ["/usr/bin/supervisord"]

# Startip for cron
#CMD ["crond -f"]

# Startip for nagios-nrpe
#CMD ["nrpe"]

# Startup script for FPM
ENTRYPOINT ["/usr/local/bin/php-entrypoint.sh"]
CMD ["php-run.sh"]
