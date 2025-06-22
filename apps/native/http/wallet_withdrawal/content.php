<?php 

if (empty($cl["is_logged"])) {
	cl_redirect("guest");
}

else if($cl["config"]["user_wallet_status"] != "on") {
	require_once cl_full_path("apps/native/http/err404/content.php");
}

else {
	$cl["page_title"] = cl_translate("Withdraw money");
	$cl["page_desc"]  = $cl["config"]["description"];
	$cl["page_kw"]    = $cl["config"]["keywords"];
	$cl["pn"]         = "wallet_withdrawal";
	$cl["sbr"]        = true;
	$cl["sbl"]        = true;

	$cl["withdrawal_gws"] = explode(",", $cl["config"]["withdrawal_payment_methods"]);

	$cl["withdrawal_gws"] = array_map(function($pg_name) {
		return str_replace(['\n', "\n", "\r", '\r'], "", $pg_name);
	}, $cl["withdrawal_gws"]);

	if (is_array($cl["withdrawal_gws"]) != true) {
		$cl["withdrawal_gws"] = array("");
	}

	$cl["withdrawal_awaiting"] = cl_is_withdrawal_awaiting($me["id"]);

	$cl["http_res"] = cl_template("wallet_withdrawal/content");
}