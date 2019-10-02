<?php 
require('vendor/autoload.php');

$loader = new Twig_Loader_Filesystem("templates");
$twig = new Twig_Environment($loader);
$template = $twig->load('test.twig');

echo $template->render([
    'title' => 'Dev-Blog'
]);
?>