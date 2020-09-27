#!/bin/bash

# This script is run within the nginx containers on start

# functions
function die {
    echo >&2 "$@"
    exit 1
}
log() {
  if [[ "$@" ]]; then echo "[`date +'%Y-%m-%d %T'`] $@";
  else echo; fi
}

# Fail on any error
set -o errexit

# Generate nginx config from template
if [ -f /etc/nginx/nginx.conf.template ]; then
  if [ ! -n "$NGINX_ERROR_LOG_LEVEL" ] ; then
      export NGINX_ERROR_LOG_LEVEL="warn"
  fi
  if [ ! -n "$SERVER_NAME" ] ; then
      export SERVER_NAME="app"
  fi
  if [ ! -n "$FASTCGI_PASS_HOST" ] ; then
      export FASTCGI_PASS_HOST="127.0.0.1:9000"
  fi
  envsubst '$NGINX_ERROR_LOG_LEVEL $SERVER_NAME $FASTCGI_PASS_HOST' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf
fi

# Toggle SSL
if [ "$USE_SSL" = 1 ] ; then
    # Generate dhparam
    if [ ! -n "$DH_SIZE" ] ; then
        DH_SIZE=2048
    fi
    if [ ! -f /etc/dhparam/dhparam.pem ]; then
        log "dhparam file /etc/dhparam/dhparam.pem does not exist"
        openssl dhparam -out /etc/dhparam/dhparam.pem $DH_SIZE || die "Could not generate dhparam file"
    fi
    # Check for missing SSL
    if [ ! -n "$CERTBOT_DOMAIN" ] ; then
        CERTBOT_DOMAIN="app"
    fi
    if [ ! -f "/etc/letsencrypt/live/$CERTBOT_DOMAIN/privkey.pem" ] ; then
        log "SSL is enabled however cert is missing - removing SSL from /etc/nginx/nginx.conf"
        sed -i -r 's/(return .*301)/#;#\1/g; s/(listen .*443)/\1;#/g; s/(ssl_(certificate|certificate_key|trusted_certificate) )/#;#\1/g' /etc/nginx/nginx.conf
    fi
else
    log "SSL is disabled - removing SSL from /etc/nginx/nginx.conf"
    sed -i -r 's/(return .*301)/#;#\1/g; s/(listen .*443)/\1;#/g; s/(ssl_(certificate|certificate_key|trusted_certificate) )/#;#\1/g' /etc/nginx/nginx.conf
fi

# Run nginx
log "Starting nginx"
nginx # -g 'daemon off;'

# Generate certificate
if [ "$USE_SSL" = 1 -a -n "$CERTBOT_EMAIL" -a -n "$CERTBOT_DOMAIN" -a ! -f "/etc/letsencrypt/live/$CERTBOT_DOMAIN/privkey.pem" ] ; then
    log "Generating SSL certificate"
    certbot certonly --noninteractive --agree-tos --email $CERTBOT_EMAIL --webroot --webroot-path /var/letsencrypt -d $CERTBOT_DOMAIN && \
    log "Certificate successfully installed - adding SSL to /etc/nginx/nginx.conf" && \
    sed -i -r 's/#?;#//g' /etc/nginx/nginx.conf && \
    nginx -s reload
fi

# Check if config or certificates were changed
while inotifywait -q -r --exclude '\.git/' -e modify,create,delete,move,move_self /etc/nginx /etc/letsencrypt; do
  log "Nginx changes detected. Will send reload signal to nginx in 10 seconds..."
  sleep 10
  nginx -s reload && \
  log "Reload signal send"
done
