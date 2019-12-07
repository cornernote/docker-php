#!/bin/bash

# This script is run within the php containers on start
# docker-run.sh is available for legacy setups

# Fail on any error
set -o errexit

# Set crontab
crontab /app/crontab

# Run the command sent as command line arguments
cron -f
