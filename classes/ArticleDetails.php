<?php
namespace DevBlog;

class ArticleDetails extends Database{
    public $article_details = array();

    public function __construct() {
        parent::__construct();
    }

    public function getArticleDetails( $id ) {
        $query = "SELECT article.article_id, article.article_title, article.article_text_content, article.created, account.username 
        FROM `article` 
        INNER JOIN account
        ON article.account_id = account.account_id
        WHERE article.article_id = ?";

        $statement = $this->connection->prepare( $query );
        $statement->bind_param( 'i', $id );
        if ( $statement->execute()) {
            $result = $statement->get_result();
            $row = $result->fetch_assoc();
            $this->article_details['content'] = $row;
            $this->article_details['videos'] = $this->getArticleVideos($id);
            $this->article_details['images'] = $this->getArticleImages($id);
        }
        return $this->article_details;
    }

    public function getArticleVideos($id)
    {
        $videoQuery = "SELECT url FROM `video` WHERE article_id = ?";

        $statement = $this -> connection -> prepare( $videoQuery );
        $statement -> bind_param( 'i', $id );
        $article_videos = array();
        if ( $statement -> execute()) {
            $result = $statement -> get_result();
            while ( $row = $result -> fetch_assoc()) {
                array_push( $article_videos, $row);
            }
        }
        return $article_videos;
    }

    public function getArticleImages( $id ) {
        $imageQuery = "SELECT filename FROM `image` WHERE article_id = ?";

        $statement = $this -> connection -> prepare( $imageQuery );
        $statement -> bind_param( 'i', $id );
        $article_images = array();
        if ( $statement -> execute()) {
            $result = $statement -> get_result();
            while ( $row = $result -> fetch_assoc()) {
                array_push( $article_images, $row);
            }
        }
        return $article_images;
    }

}
?>