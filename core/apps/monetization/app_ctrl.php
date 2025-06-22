<?php 

function cl_get_profile_subscribers($type = "active", $offset = false) {
	global $db, $cl;

	$sql_query = cl_sqltepmlate('apps/monetization/sql/fetch_subscriptions', array(
		't_subs' => T_SUBSCRIPTIONS,
		't_users' => T_USERS,
		'user_id' => $cl["me"]['id'],
		'type' => $type,
		'offset' => $offset,
		'time' => time()
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

function cl_get_profile_total_subscribers($type = "active") {
	global $db, $cl;

	$now = time();

	$db = $db->where("creator_id", $cl["me"]['id']);

	if ($type == "active_sub") {
		$db = $db->where("subscription_end", $now, ">");
	}

	else{
		$db = $db->where("subscription_end", $now, "<");
	}

	$qr = $db->getValue(T_SUBSCRIPTIONS, "COUNT(id)");

	if (is_posnum($qr)) {
		return $qr;
	}

	return 0;
}