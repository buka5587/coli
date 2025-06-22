<?php 

if (empty($cl["is_logged"])) {
	require_once cl_full_path("apps/native/http/err404/content.php");
}

else if($me["start_up"] == "done") {
	cl_redirect("home");
}

else {

	$username_avatar = cl_create_user_avatar();

	$user_update_data = array(
		"cover" => "upload/default/cover.png",
		"cover_orig" => "upload/default/cover.png",
		"avatar" => $username_avatar
	);

	$me["avatar"] = cl_get_media($username_avatar);

	cl_update_user_data($me["id"], $user_update_data);
	
	$cl["page_title"]  = cl_translate("Completion of registration");
	$cl["page_desc"]   = $cl["config"]["description"];
	$cl["page_kw"]     = $cl["config"]["keywords"];
	$cl["pn"]          = "start_up";
	$cl["sbr"]         = true;
	$cl["sbl"]         = true;
	$cl["suggestions"] = cl_get_follow_suggestions(20);;
	$cl["http_res"]    = cl_template("start_up/content");
}