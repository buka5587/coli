<?php 

$cl["app_statics"] = array(
	"scripts" => array(
		cl_static_file_path("statics/js/libs/jquery-plugins/jquery.form-v4.2.2.min.js")
	)
);

$cl["static_page"] = "terms_of_use";
$cl["static_page_code"] = file_get_contents(cl_full_path(cl_strf("themes/%s/apps/terms/src/source.phtml", $cl["config"]["theme"])));
$cl['http_res'] = cl_template("cpanel/assets/static_pages/terms_of_use");
