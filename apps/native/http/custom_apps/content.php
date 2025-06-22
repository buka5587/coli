<?php 

$custom_app_name = (isset($_GET["custom_app_name"])) ? $_GET["custom_app_name"] : "404";

if ($custom_app_name == "404") {
	require_once cl_full_path("apps/native/http/err404/content.php");
}

else{
	if (file_exists(cl_strf("apps/native/http/%s/content.php", $custom_app_name))) {
		include_once(cl_strf("apps/native/http/%s/content.php", $custom_app_name));
	}
	else{
		require_once cl_full_path("apps/native/http/err404/content.php");
	}
}