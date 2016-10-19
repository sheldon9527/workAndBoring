<?php
require_once('curl.php');

$url = $_GET['url'];

$show_ary = explode('_',$url);

if(count($show_ary)==1)
{
    $show_id = $show_ary[0];
}elseif(count($show_ary)==2)
{
    $show_id = $show_ary[1];
}elseif(count($show_ary)==3)
{
    $show_id = $show_ary[1];
}


$api_url = "https://openapi.youku.com/v2/videos/show.json";

$api_key = [
    '3ff73892a88afa5a',
    '3f209a59a344f876',
    '41360bd838f072b7',
    '15fe6ed625ca6e8a',
    'c600e0d47de1e723',
    'ed4500fe302b651c',
];

$key = $api_key[mt_rand(0, count($api_key) - 1)];

$requet_data = [
    'client_id'=>$key,
    'video_id'=>$show_id,
    'ext'=>'show'
];

$data = Request::curl($api_url, $requet_data, null, $type = 'get');


$js_data = json_decode($data,true);

print_r($js_data);
