<?php
require('vendor\autoload.php');

use DevBlog\Navigation;
$nav = new Navigation();
$nav_items = $nav -> getNavigation();

use DevBlog\ArticleDetails;
$articleDetails = new ArticleDetails();
$detail = $articleDetails->getArticleDetails($_GET['article_id']); 

use DevBlog\Comment;
$comment = new Comment();
$showConent = $comment -> getContent($_GET['article_id']);

$getUsername = $comment->getAccountUsername();
$username = implode($getUsername);

$id = $_GET['article_id'];
if( $_SERVER['REQUEST_METHOD']=='POST' ){
  $content = $_POST['content'];
  $input = $comment -> input($content,$username, $_GET['article_id'] );
  header("location: article_details.php?article_id=$id"  );
}
else{
  $input='';
}

$loader = new Twig_Loader_Filesystem("templates");
$twig = new Twig_Environment($loader);
$template = $twig->load('article_details.twig');

echo $template->render([
    'navigation' => $nav_items,
    'title' => $detail['content']['article_title'],
    'detail' => $detail,
    'input' => $input,
    'contents' => $showConent
]);
?>