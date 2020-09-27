#!/bin/bash

# This script is run within the cron containers on start

# Fail on any error
set -o errexit

# Execute CMD
exec "$@"