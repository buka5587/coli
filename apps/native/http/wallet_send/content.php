<?php 

if (empty($cl["is_logged"])) {
	cl_redirect("guest");
}

else if($cl["config"]["user_wallet_status"] != "on") {
	require_once cl_full_path("apps/native/http/err404/content.php");
}

else if (in_array("on", array($cl['config']['paypal_method_status'], $cl['config']['paystack_method_status'], $cl['config']['stripe_method_status'], $cl['config']['bank_method_status'])) != true) {
	require_once cl_full_path("apps/native/http/err404/content.php");
}

else {
	$cl["page_title"] = cl_translate("Send money");
	$cl["page_desc"]  = $cl["config"]["description"];
	$cl["page_kw"]    = $cl["config"]["keywords"];
	$cl["pn"]         = "wallet_send";
	$cl["sbr"]        = true;
	$cl["sbl"]        = true;
	$cl["http_res"]   = cl_template("wallet_send/content");
}