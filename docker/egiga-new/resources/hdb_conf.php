<?php
	$skipdomain = array();

	if (isset($_REQUEST['conf'])) {
		if ($_REQUEST['conf']=='hdb') {
			define("HOST", "tangobox-archive");
			define("USERNAME", "hdbmanager");
			define("PASSWORD", "hdbmanager");
			define("DB", "hdb");
			define("DBTYPE", "hdb");
			// define("LOG_REQUEST", "../../log/config_1.log");
		}
		if ($_REQUEST['conf']=='config_2') {
			define("HOST", "host");
			define("USERNAME", "username");
			define("PASSWORD", "password");
			define("DB", "db");
			define("DBTYPE", "hdb");
			// define("LOG_REQUEST", "../../log/config_2.log");
		}
	}

?>
