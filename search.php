<?php
require('vendor/autoload.php');

use DevBlog\Navigation;

$nav = new Navigation();
$nav_items = $nav -> getNavigation();

use DevBlog\Search;

if( isset($_GET['query']) ){
  $search = new Search();
  $result = $search -> getSearchResult();
}
else{
  echo "no parameter set";
  $result = '';
}

//create twig loader for templates
$loader = new Twig_Loader_Filesystem('templates');
//create twig environment and pass the loader
$twig = new Twig_Environment($loader);
//call a twig template
$template = $twig -> load('search.twig');

//output the template and pass the data
echo $template -> render( array(
  'navigation' => $nav_items,
  'result' => $result,
  'title' => "Search Result for " . $result['query']
) );

?>