<?php
require('vendor\autoload.php');

use DevBlog\Article;

$article = new Article();
$articleResult = $article->getArticle();

$loader = new Twig_Loader_Filesystem("templates");
$twig = new Twig_Environment($loader);
$template = $twig->load('home.twig');

echo $template->render([
    'title' => 'Dev-Blog',
    'articles' => $articleResult
]);
?>