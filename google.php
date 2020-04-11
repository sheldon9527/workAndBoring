<?php
function curl_get($url, $second=120)
{
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_TIMEOUT, $second);
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_HEADER, 0);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_ENCODING, 'gzip'); //加入gzip解析
    $data = curl_exec($ch);
    curl_close($ch);
    if ($data) {
        return $data;
    } else {
        return false;
    }
}
 $str =  curl_get('https://play.google.com/store/apps/details?id=com.xdapp.cleaning');
echo $str = mb_convert_encoding($str, "utf-8");
