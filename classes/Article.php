<?php
namespace DevBlog;

class Article extends Database 
{
    public function __construct()
    {
        parent::__construct();
    }

    public function getArticle() 
    {
        $query = "SELECT article_title, article_text_content,created FROM `article` ";

        $statement = $this->connection->prepare($query);
    
        if ($statement->execute()){
            $result = $statement->get_result();
            $articleArray = array();
            while ($row = $result->fetch_assoc()) {
                array_push($articleArray, $row);
            }
            return $articleArray;
        }
    }
}
?>