FROM php:5.6-fpm
WORKDIR /root

# Install system packages for PHP extensions
RUN apt-get update && \
    apt-get -y install \
            g++ \
            git \
            libicu-dev \
            libmcrypt-dev \
            libfreetype6-dev \
            libjpeg-dev \
            libjpeg62-turbo-dev \
            libmcrypt-dev \
            libpng12-dev \
            zlib1g-dev \
            mysql-client \
            openssh-client \
            libxml2-dev \
            vim \
            nano \
        --no-install-recommends

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
    make install
WORKDIR /root
RUN printf "\n" | pecl install gearman
RUN docker-php-ext-enable gearman
RUN rm -rf /root/gearmand-1.1.18 /root/gearmand-1.1.18.tar.gz

# Install pcntl
ADD http://php.net/get/php-5.6.32.tar.gz/from/this/mirror php-5.6.32.tar.gz
RUN tar xvfz php-5.6.32.tar.gz
WORKDIR /root/php-5.6.32/ext/pcntl
RUN phpize && \
    ./configure && \
    make && \
    make install
WORKDIR /root
RUN docker-php-ext-enable pcntl
RUN rm -rf /root/php-5.6.32 /root/php-5.6.32.tar.gz

# Install ssh2
RUN apt-get install -y libssh2-1-dev
RUN printf "\n" | pecl install channel://pecl.php.net/ssh2-0.12
RUN docker-php-ext-enable ssh2

# Install imagick
RUN apt-get install -y imagemagick libmagickwand-dev libmagickcore-dev
RUN printf "\n" | pecl install imagick
RUN docker-php-ext-enable imagick

# Install memcached
RUN printf "\n" | pecl install memcache
RUN docker-php-ext-enable memcache

# Install mailparse
RUN printf "\n" | pecl install mailparse-2.1.6
RUN docker-php-ext-enable mailparse

# Install wkhtmltopdf
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y wkhtmltopdf openssl build-essential xorg libssl-dev xvfb
ADD https://downloads.wkhtmltopdf.org/0.12/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
RUN tar xvf wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
RUN mv wkhtmltox/bin/wkhtmlto* /usr/bin/
RUN rm -rf wkhtmltox-0.12.4_linux-generic-amd64.tar.xz wkhtmltox/

# Install supervisor
RUN apt-get install -y supervisor python-pip
RUN pip install supervisor-stdout

# Cleanup
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Use application path
WORKDIR /app

# Run supervisor
CMD ["/usr/bin/supervisord"]
