<?php

// PDOHelper version 1.2 - 2014 Thomas Frank
class PDOHelper {

  /**
   * function to create a new connection 
   * to a database using the PDO class
   * read more about PDO here: 
   * http://codular.com/php-pdo-how-to
   *
   */
  protected function connectToDatabase($host,$dbname,$user,$pass){
    return new PDO(
      "mysql:host=$host;dbname=$dbname",
      $user,
      $pass,

      // this FORCES MySQL to use UTF-8
      // to prevent problems with åäö charactes
      // when, for example, conterting data to JSON
      array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8")
    );
  }

  /**
   * function to convert any numerical strings 
   * back into real numbers
   *
   */
  protected function fixNumerics($result){
    //PDO has a bad habit of returning numbers as strings
    foreach ($result as &$row) {
      foreach ($row as $key => &$val) {
        //so we fix that by converting numeric strings
        //(strings that only contain numbers) back to
        //real numbers
        if (is_numeric($val)) {
          $row[$key] = (float) $val;
        }
      }
    }
    return $result;
  }

  /**
   * function to prepare and execute a query
   * read more about prepared statements here: 
   * http://codular.com/php-pdo-how-to
   *
   */
  public function query($sql,$parameters = array()){
    // here we use prepared statements to protect 
    // ourselves from SQL-injections
    $query = $this->PDO->prepare($sql);
    $query->execute($parameters);
    // only get a result if we are making a SELECT
    if(stripos($sql,'SELECT') === 0){
      $result = $this->fixNumerics($query->fetchAll(PDO::FETCH_ASSOC));
      return $result;
    }

    // else simply return true
    return true;
  }

  /**
   * a simple method that returns query results as 
   * json (which is great for AJAX!)
   *
   */
  public function jsonQuery($sql,$parameters = array()){
    return json_encode($this->query($sql,$parameters));
  }

  /**
   * constructor
   * please note that $user and $pass are optional
   * parameters as we have given them a default value
   *
   */
  public function __construct($host,$dbname,$user="root",$pass=""){
    // create a new connection to database and stores
    // it as an object property we can use to make
    // new DB queries in other methods 
    $this->PDO = $this->connectToDatabase($host,$dbname,$user,$pass);
  }
}