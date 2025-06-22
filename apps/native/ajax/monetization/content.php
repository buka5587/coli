<?php 

if (empty($cl["is_logged"])) {
    $data['status'] = 400;
    $data['error'] = 'Invalid access token';
}

else if ($action == 'load_more') {
	$data['status'] = 400;
    $data['err_code'] = 0;
    $offset_id = fetch_or_get($_GET["offset"], false);
    $subs_type = fetch_or_get($_GET["subs_type"], false);
    $html_arr = array();

    if (is_posnum($offset_id) && in_array($subs_type, array("active_sub", "inactive_sub"))) {
    	require_once(cl_full_path("core/apps/monetization/app_ctrl.php"));

    	if ($subs_type == "active_sub") {
			$profile_subscribers = cl_get_profile_subscribers("active", $offset_id);
		}
		else{
			$profile_subscribers = cl_get_profile_subscribers("inactive", $offset_id);
		}

		if (not_empty($profile_subscribers)) {
			foreach ($profile_subscribers as $cl['li']) {
				$html_arr[] = cl_template('settings/includes/monetization/user_li');
			}

			$data['status'] = 200;
			$data['html'] = implode("", $html_arr);
		}
    }
}
