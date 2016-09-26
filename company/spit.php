<?php
//使用逗号或空格(包含" ", \r, \t, \n, \f)分隔短语
$keywords = preg_split("/[\s]+/", "hypertext language programming",3);
print_r($keywords);
?>
