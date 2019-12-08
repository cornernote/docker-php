#!/bin/bash

# This script is run within the php containers on start

# Fail on any error
set -o errexit

# Run the command sent as command line arguments
php-fpm