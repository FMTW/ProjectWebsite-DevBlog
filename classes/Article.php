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
        $query = "SELECT
        @article_id := article.article_id as article_id,
        article.article_title,
        article.article_text_content,
        @image_id := ( SELECT image_id FROM image WHERE article_id = @article_id LIMIT 1) as image_id,
        ( SELECT filename FROM image WHERE image_id = @image_id ) as filename,
        account.username
        FROM article
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

    public function getArticleBannerImage(){

    }
}
?>