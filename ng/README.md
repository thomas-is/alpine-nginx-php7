# ng

`/etc/nginx/conf.d` **should** be mounted as an external volume.

`/etc/letsencrypt` **amy** be mounted as an external volume.

`ng-conf-monitor.sh` **will** force nginx to reload on any modification in
`/etc/nginx/conf.d`.


