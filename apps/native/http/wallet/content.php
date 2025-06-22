<?php 

if (empty($cl["is_logged"])) {
	cl_redirect("guest");
}

else if($cl["config"]["user_wallet_status"] != "on") {
	require_once cl_full_path("apps/native/http/err404/content.php");
}

else {

	require_once(cl_full_path("core/apps/wallet/app_ctrl.php"));

	$cl["page_title"]     = cl_translate("Wallet");
	$cl["page_desc"]      = $cl["config"]["description"];
	$cl["page_kw"]        = $cl["config"]["keywords"];
	$cl["pn"]             = "wallet";
	$cl["sbr"]            = true;
	$cl["sbl"]            = true;
	$cl["wallet_history"] = cl_get_account_wallet_history();
	$cl["http_res"]       = cl_template("wallet/content");
}