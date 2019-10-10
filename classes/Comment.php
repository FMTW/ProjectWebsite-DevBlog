<?php
namespace DevBlog;

use DevBlog\Database;
class Comment extends Database{
    public function __construct(){
        parent::__construct();
    }

    private function getUserAuthStatus(){
        if( session_status() == PHP_SESSION_NONE ){
        session_start();
        }
        return ( isset($_SESSION['auth']) ) ? $_SESSION['auth'] : false;
    }

    public function getAccountUsername($id){
        $usernameQuery = "SELECT account.username 
        FROM account
        INNER JOIN article
        ON article.account_id = account.account_id
        WHERE article.article_id = ?";

        $statement = $this->connection->prepare($usernameQuery);
        $statement -> bind_param( 'i' , $id );
        if ($statement->execute()){
            $result = $statement->get_result();
            
            $username = $result->fetch_assoc();
            return $username;
        }
    }

    public function input( $content, $username, $id){ 
        if( !$this -> getUserAuthStatus() ){
            die('Please login first!');
        }else{
            $query = "INSERT INTO comment ( content, username,created,article_id ) VALUES ( ?, ? ,NOW(), ? ) ";

            if ( $content == '' ){
                echo ("comment com not be empty");
            }else{
                $statement = $this->connection->prepare($query);
                
                $statement -> bind_param('ssi', $content,$username,$id);

                if( $statement -> execute() == false ){
                    echo ('query failed') ;
                }           
            }
        }
    }  

    public function getContent($id){
        $query = "SELECT comment_id, content, created,
        username 
        FROM comment
        WHERE article_id = ?
        ORDER BY created DESC
        ";

        $statement = $this->connection->prepare($query);
        $statement -> bind_param( 'i' , $id );
        if ($statement->execute()){
            $result = $statement->get_result();
            $contentArray = array();
            while ($row = $result->fetch_assoc()) {
                array_push($contentArray, $row);
            }
            return $contentArray;
        }
    }
    
}

?>