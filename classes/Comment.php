<?php
namespace DevBlog;

use DevBlog\Database;
class Comment extends Database{
    public function __construct(){
        parent::__construct();
    }
    
    public function input( $content ){
        $content_errors = array();
        
        if( $content == '' ){
            $content_errors['content'] = 'Comment can not be empty.';
        }

        if( count($content_errors) == 0 ){
            $query = "
            INSERT INTO comment ( content,created ) VALUES ( ?, NOW() )
            ";

            $statement = $this->connection->prepare($query);
            if( $statement == false ){
            throw(new Exception('query failed') );
            }
            $statement -> bind_param('s', $content );
        }
        
    }  
}

?>