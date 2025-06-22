<?php 

require_once(cl_full_path("core/apps/cpanel/affiliate_payouts/app_ctrl.php"));

$cl['total_requests'] = cl_get_affiliate_payouts_total();
$cl['requests']       = cl_get_affiliate_payouts();
$cl['http_res']       = cl_template("cpanel/assets/affiliate_payouts/content");