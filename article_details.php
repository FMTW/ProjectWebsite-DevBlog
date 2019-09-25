<?php
require('vendor\autoload.php');

use DevBlog\ArticleDetails;

$articleDetails = new ArticleDetails();
$detail = $articleDetails->getArticleDetails($_GET['article_id']); 

$loader = new Twig_Loader_Filesystem("templates");
$twig = new Twig_Environment($loader);
$template = $twig->load('article_details.twig');

echo $template->render([
    'title' => $detail['content']['article_title'],
    'detail' => $detail
]);
?>