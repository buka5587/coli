<?php 

function cl_get_my_subscriptions() {
	global $db, $cl;

	$sql_query = cl_sqltepmlate('apps/subscriptions/sql/fetch_subscriptions', array(
		't_subs' => T_SUBSCRIPTIONS,
		't_users' => T_USERS,
		'user_id' => $cl["me"]['id']
	));

	$subscriptions = $db->rawQuery($sql_query);
	$data = array();

	if (cl_queryset($subscriptions)) {
		foreach ($subscriptions as $row) {
			$row['about'] = cl_rn_strip($row['about']);
            $row['about'] = stripslashes($row['about']);
            $row['name'] = cl_strf("%s %s",$row['fname'],$row['lname']);
            $row['name'] = cl_rn_strip($row['name']);
            $row['name'] = stripslashes($row['name']);      
            $row['avatar'] = cl_get_media($row['avatar']);
            $row['url'] = cl_link($row['username']);

            $diff_date = $row['subscription_end'] - time();

			$left_days = floor($diff_date / 86400);

			if (empty($left_days) && $diff_date >= 60) {
				$left_days = 1;
			}

			$row["left_days"] = $left_days;

			array_push($data, $row);
		}
	}

	return $data;
}