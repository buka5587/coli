<?php 

require_once(cl_full_path("core/apps/cpanel/dashboard/app_ctrl.php"));
require_once(cl_full_path("core/apps/cpanel/users/app_ctrl.php"));

$cl['total_users'] = cl_admin_total_users();
$cl['site_users']  = cl_admin_get_users(array('limit' => 7));    
$cl['http_res']    = cl_template("cpanel/assets/users/content");