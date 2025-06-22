<?php 

require_once(cl_full_path("core/apps/cpanel/banktrans_receipts/app_ctrl.php"));

$cl['requests_total'] = cl_admin_get_banktrans_requests_total();    
$cl['requests']       = cl_admin_get_banktrans_requests(array('limit' => 7));    
$cl['http_res']       = cl_template("cpanel/assets/banktrans_receipts/content");