<?php

require_once(cl_full_path("core/apps/cpanel/post_reports/app_ctrl.php"));

$cl['total_reports'] = cl_admin_get_total_post_reports();
$cl['post_reports']  = cl_admin_get_post_reports();
$cl['http_res']      = cl_template("cpanel/assets/post_reports/content");