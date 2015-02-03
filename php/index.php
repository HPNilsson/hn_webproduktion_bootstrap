<?php
require_once 'core/init.php';


$userInsert = DB::getInstance()->insert('users', array(
	'username' => 'Bobbusnotwo',
	'password' => 'password',
	'salt' => 'salt'
	));

if($userInsert) {
	echo " inserted a user!";
}
else {
	echo " something whent wrong with user insert :(";
}