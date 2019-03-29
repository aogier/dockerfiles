#!/bin/sh

set -e

if [ "$1" = update ]; then
    exec update.sh
fi

exec "$@"