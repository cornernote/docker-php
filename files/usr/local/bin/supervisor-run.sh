#!/bin/bash

# This script is run within the supervisor containers on start

# Fail on any error
set -o errexit

# run the fake syslog to print the log to std::out
/bin/syslog2stdout /dev/log &

# Start supervisor
/usr/bin/supervisord
