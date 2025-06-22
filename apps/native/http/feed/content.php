<?php 

if (not_empty($cl['is_logged'])) {
	cl_redirect("home");
}

else {
	require_once(cl_full_path("core/apps/feed/app_ctrl.php"));

	$cl["page_title"] = cl_translate("Feed");
	$cl["page_desc"]  = $cl["config"]["description"];
	$cl["page_kw"]    = $cl["config"]["keywords"];
	$cl["pn"]         = "feed";
	$cl["sbr"]        = true;
	$cl["sbl"]        = true;
	$cl["feed"]       = cl_get_guest_feed(false, 30);
	$cl["admin_pinned_post"] = cl_get_admin_pinned_post();
	$cl["http_res"]   = cl_template("feed/content");
}