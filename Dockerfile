FROM dmstr/php-yii2:7.2-fpm-4.2
ENV DEBIAN_FRONTEND=noninteractive

# Install system packages
RUN apt-get update && \
    apt-get -y install \
            cron \
            vim \
	    ghostscript \
            percona-toolkit \
	    pdftk \
	    rsync \
	    s3cmd \
        --no-install-recommends

# Install lockrun
ADD https://raw.githubusercontent.com/pushcx/lockrun/master/lockrun.c lockrun.c
RUN apt-get -y install \
            gcc && \
    gcc lockrun.c -o lockrun && \
    cp lockrun /usr/local/bin/ && \
    rm -f lockrun.c lockrun

# Install codeception
ADD https://codeception.com/codecept.phar /usr/local/bin/codecept
RUN chmod +x /usr/local/bin/codecept

# Install psysh
ADD https://psysh.org/psysh /usr/local/bin/psysh
RUN chmod +x /usr/local/bin/psysh

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

# Install mysqli
RUN docker-php-ext-install mysqli && \
    docker-php-ext-enable mysqli

# Install mailparse
RUN pecl install mailparse && \
    docker-php-ext-enable mailparse

# Install pcntl
RUN docker-php-ext-install pcntl && \
    docker-php-ext-enable pcntl

# Install calendar
RUN docker-php-ext-configure calendar && \
    docker-php-ext-install calendar

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

# Install tidy
RUN apt install -y libtidy-dev && \
    docker-php-ext-install tidy && \
    docker-php-ext-enable tidy

# Install memcached
RUN apt-get -y install \
            libpq-dev \
            libmemcached-dev && \
    curl -L -o /tmp/memcached.tar.gz "https://github.com/php-memcached-dev/php-memcached/archive/php7.tar.gz" && \
    mkdir -p /usr/src/php/ext/memcached && \
    tar -C /usr/src/php/ext/memcached -zxvf /tmp/memcached.tar.gz --strip 1 && \
    docker-php-ext-configure memcached && \
    docker-php-ext-install memcached && \
    rm /tmp/memcached.tar.gz

## Install wkhtmltopdf 0.12.4
#ADD https://downloads.wkhtmltopdf.org/0.12/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
#RUN apt-get -y install \
#            wkhtmltopdf \
#            build-essential \
#            openssl \
#            libssl1.0-dev \
#            xorg \
#            xvfb && \
#    tar xvf wkhtmltox-0.12.4_linux-generic-amd64.tar.xz && \
#    mv wkhtmltox/bin/wkhtmlto* /usr/bin/ && \
#    rm -rf wkhtmltox-0.12.4_linux-generic-amd64.tar.xz wkhtmltox/

## Install wkhtmltopdf 0.12.5
ADD https://downloads.wkhtmltopdf.org/0.12/0.12.5/wkhtmltox_0.12.5-1.stretch_amd64.deb wkhtmltox_0.12.5-1.stretch_amd64.deb
RUN apt-get -y install \
            wkhtmltopdf \
            build-essential \
            openssl \
            libssl1.0-dev \
            xorg \
            xvfb && \
    dpkg -i wkhtmltox_0.12.5-1.stretch_amd64.deb && \
    rm -f wkhtmltox_0.12.5-1.stretch_amd64.deb

# Install mscorefonts
ADD http://ftp.us.debian.org/debian/pool/contrib/m/msttcorefonts/ttf-mscorefonts-installer_3.6_all.deb ttf-mscorefonts-installer_3.6_all.deb
RUN apt-get -y install \
            wget \
            cabextract && \
    dpkg -i ttf-mscorefonts-installer_3.6_all.deb && \
    rm -f ttf-mscorefonts-installer_3.6_all.deb

# Install v8js
RUN apt-get -y install \
        build-essential \
        curl \
        git \
        python \
        libglib2.0-dev \
        patchelf
RUN cd /tmp && \
    git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
ENV PATH="/tmp/depot_tools:${PATH}"
RUN cd /tmp && \
    fetch v8 && \
    cd /tmp/v8 && \
    git checkout 7.5.288.23 && \
    gclient sync && \
    tools/dev/v8gen.py -vv x64.release -- is_component_build=true use_custom_libcxx=false && \
    ninja -C out.gn/x64.release/ && \
    mkdir -p /opt/v8/{lib,include} && \
    cp out.gn/x64.release/lib*.so out.gn/x64.release/*_blob.bin out.gn/x64.release/icudtl.dat /opt/v8/lib/ && \
    cp -R include/* /opt/v8/include/ && \
    for A in /opt/v8/lib/*.so; do patchelf --set-rpath '$ORIGIN' $A; done

# Install phpv8
RUN cd /tmp && \
    git clone https://github.com/phpv8/v8js.git && \
    cd /tmp/v8js && \
    phpize && \
    ./configure --with-v8js=/opt/v8 LDFLAGS="-lstdc++" && \
    make && \
    make install && \
    echo extension=v8js.so >> /usr/local/etc/php/conf.d/v8js.ini

# Install geoip
ADD https://geolite.maxmind.com/download/geoip/database/GeoLite2-City.tar.gz GeoLite2-City.tar.gz
RUN tar xfz GeoLite2-City.tar.gz && \
    mkdir /usr/share/GeoIP/ && \
    mv GeoLite2-City_20191105/GeoLite2-City.mmdb /usr/share/GeoIP/ && \
    chmod a+r /usr/share/GeoIP/GeoLite2-City.mmdb && \
    rm -rf GeoLite2-City.tar.gz GeoLite2-City_20191105/

# Cleanup
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Copy configuration files
COPY files/ /

# Forward cron logs to docker log collector
RUN ln -sf /usr/sbin/cron /usr/sbin/crond

# Install supervisor
#RUN apt-get -y install \
#            supervisor \
#            python-pip && \
#    pip install supervisor-stdout

# Run supervisor
#CMD ["/usr/bin/supervisord"]
