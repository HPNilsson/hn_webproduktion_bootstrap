<?php

include_once("autoloader.php");

$cq = New ContentQueries( "127.0.0.1", "hn_webproduktion", "root", "mysql");

//save content if told to do so (by receiving correct AJAX data)
// om page_data finns, dvs datan från adminFormen, 
// vilket vi deklarerar i insertNewPage anropet i Ajax.js
if (isset($_REQUEST["page_data"])) {
  //save page and echo ContentQueries response
  echo(json_encode($cq->saveNewPage($_REQUEST["page_data"])));
}

if (isset($_REQUEST["menu_link_data"])) {
	echo(json_encode($cq->saveMenuLink($_REQUEST["menu_link_data"])));
}