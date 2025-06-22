<?php 

require_once(cl_full_path("core/apps/cpanel/unconf_accounts/app_ctrl.php"));

$cl["app_statics"] = array(
	"scripts" => array(
		cl_static_file_path("statics/js/libs/jquery-plugins/jquery.form-v4.2.2.min.js")
	)
);

$cl["total_accounts"] = cl_get_unconfirmed_accounts();
$cl["http_res"]       = cl_template("cpanel/assets/delete_spam_accounts/content");
