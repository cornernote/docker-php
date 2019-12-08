#!/bin/bash

# This script is run within the supervisor containers on start

# Fail on any error
set -o errexit

# Start supervisor
/usr/bin/supervisord
