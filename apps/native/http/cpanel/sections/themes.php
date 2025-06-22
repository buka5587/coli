<?php 

require_once(cl_full_path("core/apps/cpanel/themes/app_ctrl.php"));

$cl["app_statics"] = array(
	"scripts" => array(
		cl_static_file_path("statics/js/libs/jquery-plugins/jquery.form-v4.2.2.min.js")
	)
);

$cl["themes"]   = cl_admin_get_themes();
$cl["http_res"] = cl_template("cpanel/assets/themes/content");
