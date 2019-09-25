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
        $query = "SELECT article.article_id, article.article_title, article.article_text_content, article.created, account.username 
        FROM `article` 
        INNER JOIN account
        ON article.account_id = account.account_id";

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