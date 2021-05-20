#!/bin/sh

/usr/bin/gunicorn -w $APP_WORKERS $APP_MODULE &

exec "$@"
