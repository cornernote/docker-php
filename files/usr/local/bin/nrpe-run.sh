#!/bin/bash

# This script is run within the nrpe containers on start

# Fail on any error
set -o errexit

# run the fake syslog to print the log to std::out
/bin/syslog2stdout /dev/log &

# Start nrpe daemon
mkdir -p /var/run/nagios
/usr/sbin/nrpe -c /etc/nagios/nrpe.cfg -f