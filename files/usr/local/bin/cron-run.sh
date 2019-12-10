#!/bin/bash

# This script is run within the cron containers on start

# Fail on any error
set -o errexit

# run the fake syslog to print the log to std::out
/bin/syslog2stdout /dev/log &

# Set crontab
touch /etc/default/locale
crontab -u www-data /etc/app.cron

# Start cron
cron -f
