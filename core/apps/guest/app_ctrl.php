<?php 

function cl_get_slider_images() {
	global $cl;

	$images = glob(cl_full_path(cl_strf("themes/%s/statics/img/guest/default/*.jpg", $cl["config"]["theme"])));
	$img_links = array();

	if (is_array($images)) {
		foreach($images as $img_path) {
			$path_info = explode("/", $img_path);
			$path_name = end($path_info);

			array_push($img_links, cl_link(cl_strf("themes/%s/statics/img/guest/default/%s", $cl["config"]["theme"], $path_name)));
		}
	}

	return $img_links;
}