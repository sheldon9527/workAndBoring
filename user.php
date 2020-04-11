<?php
$content = file_get_contents('07.txt');
$content = str_replace(array("\r\n", "\r", "\n"), "####", $content);
$content = explode('####', $content);
if ($content) {
    foreach ($content as $item) {
        if ($item) {
            $con = explode('=', $item);
            if (count($con)>1) {
                $contents[] =$con[1];
            }
        }
    }
}

echo "共计有".count($contents)."用户";
$res=[];
if ($contents) {
    foreach ($contents as $content) {
        $content = trim($content);
        $endString = substr($content, strlen($content) - 1);
        if (array_key_exists($endString, $res)) {
            $res[$endString]= $res[$endString]+1;
        } else {
            $res[$endString] =1;
        }
    }
}
echo '</br>';
echo "用户的分析";
echo '</br><pre>';
arsort($res);
var_dump($res);die;
