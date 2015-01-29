<?php
require_once 'core/init.php';


$user = DB::getInstance()->query("SELECT username FROM users WHERE username = ?", array('Henriku'));

if($useer->error()){
	echo 'no useaaah';
} else {
			echo "okayyyooo!";
}