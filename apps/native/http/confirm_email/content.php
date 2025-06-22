<?php 

if (empty($cl['is_logged'])) {
	require_once cl_full_path("apps/native/http/err404/content.php");
}

else if(empty($me["email_conf_code"])) {
	require_once cl_full_path("apps/native/http/err404/content.php");
}

else{
	$cl["page_title"] = cl_translate("Confirm new email");
	$cl["page_desc"]  = $cl["config"]["description"];
	$cl["page_kw"]    = $cl["config"]["keywords"];
	$cl["pn"]         = "confirm_email";
	$cl["sbr"]        = true;
	$cl["sbl"]        = true;
	$cl["http_res"]   = cl_template("confirm_email/content");
}

