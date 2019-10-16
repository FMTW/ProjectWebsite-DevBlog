<?php
namespace DevBlog;

use DevBlog\Database;
use \Exception;

class Search extends Database{
  public $search_result = array();
  public $search_query = null;

  public function __construct(){
    parent::__construct();
    if( isset($_GET['query']) ){
      $this -> search_query = $_GET['query'];
    }
  }

  public function getSearchResult(){
    if( isset($this -> search_query) == false ){
      return;
    }
    $search_param = "%" . $this -> search_query . "%";
    $query = "SELECT @article_id := article.article_id as article_id, article.article_title, article.article_text_content, article.created, account.username,
    @image_id := ( SELECT image_id FROM image WHERE article_id = @article_id LIMIT 1) as image_id,
            ( SELECT filename FROM image WHERE image_id = @image_id ) as filename
    FROM article 
    INNER JOIN account
    ON article.account_id = account.account_id
    WHERE article.article_title LIKE ?";
    $statement = $this -> connection -> prepare( $query );
    $statement -> bind_param('s', $search_param);
    try{
      if( $statement -> execute() == false ){
        throw( new Exception('search error') );
      }
      else{
        $result = $statement -> get_result();
        $items = array();
        while( $row = $result -> fetch_assoc() ){
          array_push( $items, $row );
        }
        $this -> search_result['items'] = $items;
        $this -> search_result['query'] = $this -> search_query;
        return $this -> search_result;
      }
    }
    catch( Exception $exc ){
      echo $exc -> getMessage();
    }
  }
}

?>