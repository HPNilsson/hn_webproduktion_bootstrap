<?php
class ContentQueries extends PDOHelper {
  protected $user_info = array("user_id" => 1);

  public function saveNewPage($page_data) {
    $page_data[":user_id"] = $this->user_info["user_id"];
    $page_path = $page_data[":path"];
    unset($page_data[":path"]);
    $menu_data = $page_data["menuData"];
    unset($page_data["menuData"]);
    $sql = "INSERT INTO pages (title, body, user_id) VALUES (:title, :body, :user_id)";
    //since we are using prepared SQL statements, 
    //SQL and data is sent separately to the query method
    $this->query($sql, $page_data);

    if($menu_data) {
      $this->saveMenuLink($menu_data);
    }
    return true;
  }

  public function saveMenuLink($menu_data) {
    $menu_data[":plid"] = $menu_data[":plid"] ? $menu_data[":plid"] : null;
    $sql = "INSERT INTO menu_links (title, path, plid) VALUES (:title, :path, :plid)";
    return $this -> query($sql,$menu_data);
  }

  public function getAllPages() {
    $sql = "SELECT * FROM pages";
    //since we are using prepared SQL statements, 
    //SQL and data is sent separately to the query method
    return $this->query($sql);
  }

  public function getAllMenuLinks() {
    $sql = "SELECT * FROM menu_links order by weight desc";
    return $this ->query($sql);
  }

  public function searchForPages($search_param) {
    $search_param = array(":search_param" => "%".$search_param."%");
    $sql = "SELECT * FROM pages WHERE title LIKE :search_param";
    //since we are using prepared SQL statements, 
    //SQL and data is sent separately to the query method
    return $this->query($sql, $search_param);
  }

  public function getPageByUrl($url) {
    //url = array(":path" => "adsdasd")
    
    $sql = "SELECT pages.* FROM url_alias, pages WHERE url_alias.path = :path && pages.pid = url_alias.pid;";
  }
}










