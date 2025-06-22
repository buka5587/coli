<?php 

if (empty($cl['is_logged'])) {
    $data['status'] = 400;
    $data['error']  = 'Invalid access token';
}

else {
    $data['err_code'] = 0;
    $data['status']   = 400;
    $post_id          = fetch_or_get($_POST['id'], 0);

    if (is_posnum($post_id)) {
        $post_data = cl_raw_post_data($post_id);

        if (not_empty($post_data)) {
            if ($post_data["profile_pinned"] == "Y") {
                cl_update_post_data($post_id, array(
                    "profile_pinned" => "N"
                ));

                $data['status']      = 200;
                $data['status_code'] = '0';
            }
            else {

                $db->where("user_id", $me["id"])->where("profile_pinned", "Y")->update(T_PUBS, array(
                    "profile_pinned" => "N"
                ));

                cl_update_post_data($post_id, array(
                    "profile_pinned" => "Y"
                ));

                $data['status']      = 200;
                $data['status_code'] = '1';
            }
        }
    }
}