<?php

$cl["app_statics"] = array(
	"scripts" => array(
		cl_static_file_path("statics/js/libs/jquery-plugins/jquery.form-v4.2.2.min.js")
	)
);

$cl["post_censored_words_csv"] = cl_get_censored_words_array();
$cl["post_censored_words_csv"] = implode(",", $cl["post_censored_words_csv"]);

$cl['http_res'] = cl_template("cpanel/assets/post_censor_settings/content");