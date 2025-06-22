<?php

$provider     = ((empty($provider)) ? "None" : $provider);
$oauth_config = array(
	"callback"       => cl_link(cl_strf("oauth/%s", strtolower($provider))),
	"providers"      => array(
		"Google"     => array(
			"enabled" => true,
			"keys"    => array(
				"id"     => $cl['config']['google_api_id'],
				"secret" => $cl['config']['google_api_key']
			),
		),
		"Facebook" => array(
			"enabled" => true,
			"keys"    => array(
				"id" => $cl['config']['facebook_api_id'], 
				"secret" => $cl['config']['facebook_api_key']
			),
			"scope" => "email",
			"trustForwarded" => false
		),
		"Twitter" => array(
			"enabled" => true,
			"keys" => array(
				"key" => $cl['config']['twitter_api_id'], 
				"secret" => $cl['config']['twitter_api_key']
			),
			"includeEmail" => true
		),
		"LinkedIn" => array(
			"enabled" => true,
			"keys" => array(
				"key" => $cl['config']['linkedin_api_id'], 
				"secret" => $cl['config']['linkedin_api_key']
			),
			"includeEmail" => true
		),
		"Discord" => array(
			"enabled" => true,
			"keys" => array(
				"key" => $cl['config']['discord_api_id'], 
				"secret" => $cl['config']['discord_api_key']
			),
			"includeEmail" => true
		),
		"Vkontakte" => array(
			"enabled" => true,
			"keys" => array(
				"key" => $cl['config']['vkontakte_api_id'], 
				"secret" => $cl['config']['vkontakte_api_key']
			),
			"includeEmail" => true
		),
		"Instagram" => array(
			"enabled" => true,
			"keys" => array(
				"key" => $cl['config']['instagram_api_id'], 
				"secret" => $cl['config']['instagram_api_key']
			),
			"includeEmail" => true
		),
	),
	"debug_mode" => false,
	"debug_file" => "",
);