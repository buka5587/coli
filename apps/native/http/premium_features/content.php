<?php 

if (empty($cl["is_logged"])) {
	require_once cl_full_path("apps/native/http/err404/content.php");
}

else if($cl['config']['prem_account_system_status'] != 'on' || $me["is_premium"] != 1) {
	require_once cl_full_path("apps/native/http/err404/content.php");
}

else{
	$cl["page_title"] = cl_translate("Premium features");
	$cl["page_desc"]  = $cl["config"]["description"];
	$cl["page_kw"]    = $cl["config"]["keywords"];
	$cl["pn"]         = "settings";
	$cl["sbr"]        = true;
	$cl["sbl"]        = true;
	$cl["http_res"]   = cl_template("premium_features/content");
}

