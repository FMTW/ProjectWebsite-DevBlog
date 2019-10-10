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


// $getUsername = $comment->getAccountUsername($_GET['account_id']);
// $username = implode($getUsername);

if( $_SERVER['REQUEST_METHOD']=='POST' ){
  $content = $_POST['content'];
  $input = $comment -> input($content,$username,$_GET['article_id'] );
}
else{
  $input='';
}

print_r($_GET['article_id']);
print_r($_GET['account_id']);
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