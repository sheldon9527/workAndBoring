<?php
session_start();
setcookie(session_name(), session_id(), time()+60*60);

$_SESSION['name'] = 'dddd';
$_SESSION['password'] = '123456';

echo '<a href=session.php> 登录</a>';

// print_r($_SESSION);
