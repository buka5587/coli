<?php 

if ($cl['is_logged'] == true) {
	cl_signout_user();
}
else {
	cl_redirect('/');
}