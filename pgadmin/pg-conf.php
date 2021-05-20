<?php

  $conf['servers'] = array();

  $pga_servers = explode(',','${PGA_SERVERS}');
  foreach( $pga_servers as $pga_server ) {
    $pga_server = trim($pga_server);
    $pga_server = explode(':',$pga_server);
    $server = array();
    $server['host'] = $pga_server[0];
    if( isset($pga_server[1]) ) {
      $server['port'] = (int) $pga_server[1];
    } else {
      $server['port'] = 5432;
    }
    $server['desc'] = $server['host'] . ':' . $server['port'];
    $server['sslmode'] = 'allow';
    $server['pg_dump_path'] = '/usr/bin/pg_dump';
    $server['pg_dumpall_path'] = '/usr/bin/pg_dumpall';
    $conf['servers'][] = $server;
  }

// pgadmin default config
	$conf['default_lang'] = 'auto';
	$conf['autocomplete'] = 'default on';
	$conf['extra_login_security'] = true;
	$conf['owned_only'] = false;
	$conf['show_comments'] = true;
	$conf['show_advanced'] = false;
	$conf['show_system'] = false;
	$conf['min_password_length'] = 1;
	$conf['left_width'] = 200;
	$conf['theme'] = 'default';
	$conf['show_oids'] = false;
	$conf['max_rows'] = 30;
	$conf['max_chars'] = 50;
	$conf['use_xhtml_strict'] = false;
	$conf['help_base'] = 'http://www.postgresql.org/docs/%s/interactive/';
	$conf['ajax_refresh'] = 3;
	$conf['plugins'] = array();
	$conf['version'] = 19;

?>
