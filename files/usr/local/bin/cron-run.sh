#!/bin/bash

# This script is run within the cron containers on start

# Fail on any error
set -o errexit

# run the fake syslog to print the log to std::out
/bin/syslog2stdout /dev/log &

# Set crontab
touch /etc/default/locale
crontab -u www-data /etc/cron.d/app

# Start cron
#cron -f
cron

# Check if schedule changed
while inotifywait -q /etc/cron.d/app; do
  echo "Cron changes detected. Will reload cron schedule in 10 seconds..."
  sleep 10
  echo "Reloading cron schedule"
  crontab -u www-data /etc/cron.d/app
done
