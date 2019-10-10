<?php
require('vendor/autoload.php');

use DevBlog\Comment;
$comment = new Comment();



if( $_SERVER['REQUEST_METHOD']=='POST' ){
  $content = $_POST['content'];
  $input = $comment -> input( $content );
}
else{
  $input='';
}


//create twig loader
$loader = new Twig_Loader_Filesystem('templates');

//create twig environment
$twig = new Twig_Environment($loader);

//load a twig template
$template = $twig -> load('comment.twig');

//pass values to twig
echo $template ->render([ 
    'input' => $input
]);

?>