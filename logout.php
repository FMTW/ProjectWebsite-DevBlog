<?php
require('vendor/autoload.php');

use DevBlog\Account;
$account = new Account();
$account -> logout();

header('location: index.php');
?>