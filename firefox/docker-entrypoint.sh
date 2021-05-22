#!/bin/sh

tor &

usermod firefox -u $USER_ID
CMD="$@"
/bin/su firefox -p -c "$CMD"
