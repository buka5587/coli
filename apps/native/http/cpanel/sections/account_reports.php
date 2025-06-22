<?php

require_once(cl_full_path("core/apps/cpanel/account_reports/app_ctrl.php"));

$cl['total_reports']   = cl_admin_get_total_profile_reports();
$cl['account_reports'] = cl_admin_get_profile_reports();
$cl['http_res']        = cl_template("cpanel/assets/account_reports/content");