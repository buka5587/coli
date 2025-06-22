<?php 

require_once(cl_full_path("core/apps/cpanel/withdrawal_requests/app_ctrl.php"));

$cl['requests_total'] = cl_admin_get_withdrawal_requests_total();    
$cl['requests']       = cl_admin_get_withdrawal_requests(array('limit' => 7));    
$cl['http_res']       = cl_template("cpanel/assets/withdrawal_requests/content");