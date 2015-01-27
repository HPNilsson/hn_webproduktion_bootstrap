<?php

function __autoload($class_name) {
  include "classes/".strtolower($class_name).'.php';
}