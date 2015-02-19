<?php

include_once("autoloader.php");

$cq = New ContentQueries( "127.0.0.1", "hn_webproduktion", "root", "mysql");


echo(json_encode($cq->getAllMenuImages()));