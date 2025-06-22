<?php 

if (empty($cl["is_logged"])) {
	cl_redirect("guest");
}
else if($cl["config"]["user_wallet_status"] != "on") {
	require_once cl_full_path("apps/native/http/err404/content.php");
}
else if (in_array("on", array($cl['config']['paypal_method_status'], $cl['config']['paystack_method_status'], $cl['config']['stripe_method_status'], $cl['config']['bank_method_status'], $cl['config']['yookassa_status'], $cl['config']['coinpayments_method_status'], $cl['config']['rzp_method_status'], $cl['config']['moneypoolscash_status'], $cl['config']['alipay_method_status'])) != true) {
	require_once cl_full_path("apps/native/http/err404/content.php");
}

else {

	$cl["page_title"] = cl_translate('Replenish wallet');
	$cl["page_desc"]  = $cl["config"]["description"];
	$cl["page_kw"]    = $cl["config"]["keywords"];
	$cl["pn"]         = "wallet_add";
	$cl["sbr"]        = true;
	$cl["sbl"]        = true;
	$cl["http_res"]   = cl_template("wallet_add/content");
}