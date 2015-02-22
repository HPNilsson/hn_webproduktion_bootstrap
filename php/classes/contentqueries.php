<?php
class ContentQueries extends PDOHelper {
  protected $user_info = array("user_id" => 1);

  public function saveNewPage($page_data) {
    $page_data[":user_id"] = $this->user_info["user_id"];
    $page_path = $page_data[":path"];
    unset($page_data[":path"]);
    $menu_data = $page_data["menuData"];
    unset($page_data["menuData"]);

    $page_data[":img_id"] = $page_data[":img_id"] ?
      $page_data["img_id"] : null;


    $sql = "INSERT INTO pages (title, body, user_id, img_id) VALUES (:title, :body, :user_id, :img_id)";
    
    //since we are using prepared SQL statements, 
    //SQL and data is sent separately to the query method
    $this->query($sql, $page_data);

    $sql2 = "SELECT pid FROM pages ORDER BY pid DESC LIMIT 1;";
    $result = $this->query($sql2);
    $pid = $result[0]["pid"];

    $sql4 = "INSERT INTO images (title, path, user_id) VALUES (:title, :path, :user_id)";
    $pic_data = array(
    ":title" => $pic_data["title"],
    ":path" => $pic_data["path"],
    "user_id"=>$page_data[":user_id"]
    );
    $this->query($sql4, $pic_data);

    $sql5 = "SELECT iid FROM images ORDER BY uploaded DESC LIMIT 1";
    $iid = $this->query($sql5);
    $new_iid = $iid[0]["iid"];
    $page_data[":img_id"]=$new_iid;

    
    $url_data = array(
      ":path" => $page_path,
      ":pid" => $pid,
    );

    $this->saveNewAlias($url_data);

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

  public function getAllMenuImages() {
    $sql = "SELECT * FROM images";
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
    
    $sql = "SELECT pages.*, users.name AS author FROM url_alias, pages, users WHERE url_alias.path = :path && pages.pid = url_alias.pid && users.uid = pages.user_id;";

    $result = $this->query($sql, $url);

    for ($i=0; $i < count ($result); $i++) {
      if($result[0]["img_id"] !== null) {
        $sql2 = "SELECT * FROM images WHERE iid = :img_id";
        $image_param = array(":img_id" => $result[0]["img_id"]);
        $img_result = $this->query($sql2, $image_param);

        $result[0]["image_data"] = $img_result[0];
      }
    }  

    return $result;
  }

  public function saveNewAlias($url_data) {
    $sql = "INSERT INTO url_alias (path, pid) VALUES (:path, :pid);";
    return $this->query($sql, $url_data);
  }
}










