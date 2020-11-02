# PHP Docker image
FROM php:7.3.22-fpm-stretch

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive \
    PHP_USER_ID=33 \
    PHP_ENABLE_XDEBUG=0 \
    PATH=/app:/app/vendor/bin:/root/.composer/vendor/bin:$PATH \
    TERM=linux \
    COMPOSER_ALLOW_SUPERUSER=1

## Install base OS packages
RUN pwd && \

    # Setup node
    curl -sL https://deb.nodesource.com/setup_14.x | bash - && \

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
            libmemcached-dev \
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
            netcat \
            gearman \
            inotify-tools \
            unzip \
        --no-install-recommends && \
    apt-get clean && \

    ## Update npm
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

    ## Install wkhtmltopdf
    curl -L https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.stretch_amd64.deb \
        -o wkhtmltox_0.12.6-1.stretch_amd64.deb && \
    apt-get -y install \
            wkhtmltopdf \
            build-essential \
            openssl \
            libssl1.0-dev \
            xorg \
            xvfb && \
    dpkg -i wkhtmltox_0.12.6-1.stretch_amd64.deb && \
    rm -f wkhtmltox_0.12.6-1.stretch_amd64.deb && \
    # Install mscorefonts
    curl -L http://ftp.us.debian.org/debian/pool/contrib/m/msttcorefonts/ttf-mscorefonts-installer_3.6_all.deb \
        -o ttf-mscorefonts-installer_3.6_all.deb && \
    apt-get -y install \
            cabextract && \
    dpkg -i ttf-mscorefonts-installer_3.6_all.deb && \
    rm -f ttf-mscorefonts-installer_3.6_all.deb && \

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
        memcached \
        imagick \
        mailparse \
        mcrypt-1.0.2 && \
    docker-php-ext-enable \
        apcu \
        memcached \
        imagick \
        mailparse \
        mcrypt && \

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
        --filename=composer.phar \
        --install-dir=/usr/local/bin && \
    composer.phar global require --optimize-autoloader \
        "fxp/composer-asset-plugin:^1.4.3" \
        "hirak/prestissimo:^0.3.0" && \
    composer.phar global dumpautoload --optimize && \
    composer.phar clear-cache && \

    # Install Yii framework bash autocompletion
    curl -L https://raw.githubusercontent.com/yiisoft/yii2/master/contrib/completion/bash/yii \
        -o /etc/bash_completion.d/yii && \

    # Install codeception
    curl -L https://codeception.com/codecept.phar \
        -o /usr/local/bin/codecept && \

    # Install psysh
    curl -L https://psysh.org/psysh \
        -o /usr/local/bin/psysh && \

    # Install robo
    curl -L http://robo.li/robo.phar \
        -o /usr/local/bin/robo && \

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
    /tmp/depot_tools/fetch v8 && \
    cd /tmp/v8 && \
    git checkout 7.5.288.23 && \
    /tmp/depot_tools/gclient sync && \
    tools/dev/v8gen.py -vv x64.release -- is_component_build=true use_custom_libcxx=false && \
    /tmp/depot_tools/ninja -C out.gn/x64.release/ && \
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

# Install supervisor service
RUN apt-get update && \
    apt-get -y install \
            supervisor \
            python-pip && \
    # Cleanup
    apt-get -y autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN pip install supervisor-stdout

# Install nginx service
RUN apt-get update && \
    apt-get -y install \
            nginx-full \
            openssl \
            gettext-base \
            certbot \
        --no-install-recommends && \
    # forward request and error logs to docker log collector
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log && \
    ln -sf /usr/sbin/cron /usr/sbin/crond && \
    # Cleanup
    apt-get -y autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
VOLUME /etc/dhparam
VOLUME /etc/letsencrypt
VOLUME /var/letsencrypt

# Install cron service
RUN apt-get update && \
    apt-get -y install \
              cron \
        --no-install-recommends && \
    # Forward cron logs to docker log collector
    ln -sf /usr/sbin/cron /usr/sbin/crond && \
    # Cleanup
    apt-get -y autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install nagios nrpe service
RUN apt-get update && \
    # nrpe server cannot log to std::out, so we need syslog2stdout (package is provided at apt.binfalse.de)
    apt-get install -y \
            gnupg \
            dirmngr \
        --no-install-recommends && \
    gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E81BC3078D2DD9BD && \
    gpg -a --export E81BC3078D2DD9BD | apt-key add - && \
    echo "deb http://apt.binfalse.de binfalse main" > "/etc/apt/sources.list.d/binfalse.list" && \
    apt-get update && \
    apt-get install -y \
            nagios-nrpe-server \
            nagios-plugins \
            bf-syslog2stdout \
        --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install bash prompt
RUN git clone https://github.com/magicmonty/bash-git-prompt.git /root/.bash-git-prompt --depth=1

# Copy configuration files
COPY files/ /

# Set executibale scripts
RUN ln -s /usr/local/bin/php /usr/bin/php && \
    chmod 600 \
        /etc/cron.d/app && \
    chmod 700 \
        /usr/local/bin/entrypoint.sh \
        /usr/local/bin/cron-run.sh \
        /usr/local/bin/nginx-run.sh \
        /usr/local/bin/nrpe-run.sh \
        /usr/local/bin/php-run.sh \
        /usr/local/bin/composer \
        /usr/local/bin/codecept \
        /usr/local/bin/psysh \
        /usr/local/bin/robo

# Set app working directory
WORKDIR /app

# Set command entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# Startup for supervisor
CMD ["supervisor-run.sh"]

# Startip for cron
#CMD ["cron-run.sh"]

# Startip for nagios-nrpe
#CMD ["nrpe-run.sh"]

# Startip for nginx
#CMD ["nginx-run.sh"]

# Startup script for FPM
#CMD ["php-run.sh"]
