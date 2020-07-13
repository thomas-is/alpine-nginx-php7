FROM postgres:12-alpine

COPY docker-entrypoint.sh /usr/local/bin/
RUN  chmod 744 /usr/local/bin/docker-entrypoint.sh
RUN  chown postgres:postgres /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]

VOLUME "/var/lib/postgresql/data"
EXPOSE 5432
CMD ["postgres"]
