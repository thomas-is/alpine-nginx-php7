#!/bin/sh

tor &

exec "$@"
