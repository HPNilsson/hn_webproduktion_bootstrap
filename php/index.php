<?php
require_once 'core/init.php';


$userInsert = DB::getInstance()->update('users', 2, array(
	'username' => 'Bobbusnotwo',
	'password' => 'password2',
	'salt' => 'salt'
	));

if($userInsert) {
	echo "<br> Inserted a user!";
}
else {
	echo "<br> Something went wrong with user insert :(";
}