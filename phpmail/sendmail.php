<?php
require_once('mail.php');

$mail = 'xiaodong.yi@ottv.tv';
$object = '主题';
$content  = 'Conte那天';


$sendmail = new Email();

$sendmail->sendmail($mail,$object,$content);

echo '成功';
