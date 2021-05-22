#!/bin/sh

usermod dosbox -u $USER_ID
CMD="$@"
/bin/su dosbox -p -c "$CMD"
