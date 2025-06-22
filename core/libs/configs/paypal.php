<?php 

$paypal_req_url = "https://api-m.sandbox.paypal.com";

if ($cl['config']['paypal_mode'] == 'live') {
    $paypal_req_url = "https://api-m.paypal.com";
}

$cl['paypal_access_token'] = null;
$ch = curl_init();

curl_setopt($ch, CURLOPT_URL, $paypal_req_url . '/v1/oauth2/token');
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS, "grant_type=client_credentials");
curl_setopt($ch, CURLOPT_USERPWD, $cl['config']['paypal_api_key'] . ':' . $cl['config']['paypal_api_pass']);

$headers = array();
$headers[] = 'Content-Type: application/x-www-form-urlencoded';
curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

$result = curl_exec($ch);
curl_close($ch);

$result = json_decode($result);

if (not_empty($result->access_token)) {
	$cl['paypal_access_token'] = $result->access_token;
}

