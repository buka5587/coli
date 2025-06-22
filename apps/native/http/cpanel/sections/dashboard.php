<?php 

require_once(cl_full_path("core/apps/cpanel/dashboard/app_ctrl.php"));

$cl["app_statics"] = array(
	"scripts" => array(
		cl_static_file_path("apps/cpanel/statics/plugins/jquery-countto/jquery.countTo.js"),
		cl_static_file_path("apps/cpanel/statics/plugins/chartjs/Chart.bundle.js")
	)
);

$cl['online_users'] = cl_admin_online_users();
$cl['total_users']  = cl_admin_total_users();
$cl['total_verified_users']  = cl_admin_total_verified_users();
$cl['total_posts']  = cl_admin_total_posts();
$cl['total_images'] = cl_admin_total_posts('image');
$cl['total_videos'] = cl_admin_total_posts('video');
$cl['statistics']   = cl_admin_annual_main_stats();
$cl['http_res']     = cl_template("cpanel/assets/dashboard/content");