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
            //$this->article_details['images'] = $this->getProductImages( $id );
        }
        return $this->article_details;
    }

    private function getProductImages( $id ) {
        $_imageQuery = "SELECT 
        product_image.image_id,
        image_file_name
        FROM `product_image`
        INNER JOIN image
        ON product_image.image_id = image.image_id
        WHERE product_id = ? ";

        $statement = $this -> connection -> prepare( $_imageQuery );
        $statement -> bind_param( 'i', $id );
        $_product_images = array();
        if ( $statement -> execute()) {
            $result = $statement -> get_result();
            while ( $row = $result -> fetch_assoc()) {
                array_push( $_product_images, $row);
            }
        }
        return $_product_images;
    }



}
?>