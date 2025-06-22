<?php 

if (empty($cl['is_logged'])) {
	cl_redirect("guest");
}

else {
	require_once(cl_full_path("core/apps/subscriptions/app_ctrl.php"));

	$cl["page_title"] = cl_translate("Subscriptions");
	$cl["page_desc"] = $cl["config"]["description"];
	$cl["page_kw"] = $cl["config"]["keywords"];
	$cl["pn"] = "subscriptions";
	$cl["sbr"] = true;
	$cl["sbl"] = true;
	$cl["subscriptions"] = cl_get_my_subscriptions();
	$cl["http_res"] = cl_template("subscriptions/content");
}