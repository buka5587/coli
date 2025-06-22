<?php 

if (empty($cl["is_logged"])) {
	if ($cl["config"]["guest_page_status"] == "on") {
		cl_redirect("guest");
	}
	else{
		cl_redirect("feed");
	}
}
else {
	require_once(cl_full_path("core/apps/home/app_ctrl.php"));

	$cl["app_statics"] = array(
		"scripts" => array(
			cl_js_template("statics/js/libs/SwiperJS/swiper-bundle.min")
		)
	);

	$cl["page_title"]    = cl_translate("Homepage");
	$cl["page_desc"]     = $cl["config"]["description"];
	$cl["page_kw"]       = $cl["config"]["keywords"];
	$cl["pn"]            = "home";
	$cl["sbr"]           = true;
	$cl["sbl"]           = true;
	$cl["tl_feed"]       = cl_get_timeline_feed(30);
	$cl["tl_feed_total"] = 30;
	$cl["tl_swifts"]     = cl_timeline_swifts();
	$cl["admin_pinned_post"] = cl_get_admin_pinned_post();
	$cl["http_res"]      = cl_template("home/content");
}