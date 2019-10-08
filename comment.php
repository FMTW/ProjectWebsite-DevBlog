<?php
require('vendor/autoload.php');

use DevBlog\Input;

if( $_SERVER['REQUEST_METHOD']=='POST' ){
  $content = $_POST['content'];

  $comment = new Comment();
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
    
    'response' => $input
]);

?>