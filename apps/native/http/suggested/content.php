<?php 

$cl["users_list"] = cl_get_follow_suggestions(30);

if (empty($cl["users_list"])) {
	require_once cl_full_path("apps/native/http/err404/content.php");
}

else {
	$cl["page_title"] = $cl["config"]["name"];
	$cl["page_desc"]  = $cl["config"]["description"];
	$cl["page_kw"]    = $cl["config"]["keywords"];
	$cl["pn"]         = "suggested";
	$cl["sbr"]        = true;
	$cl["sbl"]        = true;
	$cl["http_res"]   = cl_template("suggested/content");
}
