<?php

include('input.php');
include('Database.php');

$content = $_POST['content'];
$user = $_POST['user'];

$input = new input();

$is = $input -> post( $content );
if( $is == false ){
    die("Comment can not be empty");
}   

$is = $input -> post( $user );
if( $is == false ){
    die("User name can not be empty");
} 

// var_dump( $content, $user );

$time = time();
$is = $db -> query("INSERT INTO message ( content, user, intime ) VALUES ( '{$content}', '{$user}', '{$time}' )" );
// var_dump( $is );
header("location: gbook.php");

?>