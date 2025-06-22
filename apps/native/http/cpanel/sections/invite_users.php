<?php 

require_once(cl_full_path("core/apps/cpanel/invite_users/app_ctrl.php"));

$cl["app_statics"] = array(
	"scripts" => array(
		cl_static_file_path("statics/js/libs/jquery-plugins/jquery.form-v4.2.2.min.js")
	)
);

$cl["invite_links"] = cl_admin_get_user_invitations();
$cl["http_res"]     = cl_template("cpanel/assets/invite_users/content");
