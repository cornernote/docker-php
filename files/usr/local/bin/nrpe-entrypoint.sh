#!/bin/bash

# This script is run within the nrpe containers on start

# Fail on any error
set -o errexit

# Execute CMD
exec "$@"