#!/bin/bash

# This script is run within the nrpe containers on start

if [ "$1" = 'nrpe' ]; then
    service nagios-nrpe-server start
    sleep infinity
else
   exec "$@"
fi