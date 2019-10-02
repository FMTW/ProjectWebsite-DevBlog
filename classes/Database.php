<?php
namespace DevBlog;

class Database
{
    protected $connection;
    public function __construct() {
        $this -> connection = mysqli_connect(getenv('dbhost'), getenv('dbuser'), getenv('dbpass'), getenv('dbname'));
    }
}
?>