<?php 

require_once(cl_full_path("core/apps/cpanel/langs/app_ctrl.php"));

$cl["app_statics"] = array(
	"scripts" => array(
		cl_static_file_path("statics/js/libs/jquery-plugins/jquery.form-v4.2.2.min.js")
	)
);

$cl["ui_langs"] = cl_admin_get_ui_langs();
$cl['http_res'] = cl_template("cpanel/assets/languages/content");