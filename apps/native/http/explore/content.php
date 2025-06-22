<?php 

require_once(cl_full_path("core/apps/explore/app_ctrl.php"));

$cl["page_title"]   = cl_translate("Explore");
$cl["page_desc"]    = $cl["config"]["description"];
$cl["page_kw"]      = $cl["config"]["keywords"];
$cl["pn"]           = "explore";
$cl["sbr"]          = true;
$cl["sbl"]          = true;
$cl["search_query"] = fetch_or_get($_GET['q'], "");
$cl["search_query"] = (empty($cl["search_query"])) ? false : $cl["search_query"];
$cl["page_tab"]     = fetch_or_get($_GET['tab'], "posts");
$cl["query_result"] = array();

$cl["admin_pinned_post"] = cl_get_admin_pinned_post();

if (not_empty($cl["search_query"])) {
	$cl["search_query"] = cl_text_secure($cl["search_query"]);
	$cl["page_title"]   = $cl["search_query"];
	$cl["search_query"] = cl_croptxt($cl["search_query"], 32);
}

if ($cl["page_tab"] == 'htags') {
	$cl["query_result"] = cl_search_hashtags($cl["search_query"], false, 30);
}

else if($cl["page_tab"] == 'people') {
	$cl["query_result"] = cl_search_people($cl["search_query"], false, 30);
}

else {
	$cl["query_result"] = cl_search_posts($cl["search_query"], false, 30);
}

$cl["http_res"] = cl_template("explore/content");