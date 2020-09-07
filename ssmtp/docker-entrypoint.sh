#!/bin/sh

export SMTP_PASS=$( cat $SMTP_PASS_FILE )
sed -e "s/\${SMTP_EXT_HOST}/$SMTP_EXT_HOST/g" -i /etc/ssmtp/revaliases
sed -e "s/\${SMTP_EXT_PORT}/$SMTP_EXT_PORT/g" -i /etc/ssmtp/revaliases
sed -e "s/\${SMTP_PASS}/$SMTP_PASS/g" -i /etc/ssmtp/ssmtp.conf

exec "$@"
