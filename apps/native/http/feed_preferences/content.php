<?php 

if (empty($cl["is_logged"])) {
	require_once cl_full_path("apps/native/http/err404/content.php");
}

else{
	$cl["page_title"] = cl_translate("Feed preferences");
	$cl["page_desc"]  = $cl["config"]["description"];
	$cl["page_kw"]    = $cl["config"]["keywords"];
	$cl["pn"]         = "settings";
	$cl["sbr"]        = true;
	$cl["sbl"]        = true;
	$cl["http_res"]   = cl_template("feed_preferences/content");
}

