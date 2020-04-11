<?php
function whois($domain)
{
    // 创建一个新cURL资源
    $ch = curl_init();
    // 设置URL和相应的选项
    curl_setopt($ch, CURLOPT_URL, 'http://panda.www.net.cn/cgi-bin/check.cgi');
    curl_setopt($ch, CURLOPT_HEADER, 0);
    //将curl_exec()获取的信息以文件流的形式返回，而不是直接输出
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    //POST请求
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, 'area_domain=' . trim($domain));
    //执行cURL会话
    $response = curl_exec($ch);
    // 关闭cURL资源，并且释放系统资源
    curl_close($ch);

    return $response;
}
function is_register($res)
{
    $code = substr($res, 0, 3);
    if ($code == '210') {
        return 0;
    } elseif ($code == '211') {
        return 1;
    } else {
        return 2;
    }
}
$result = whois('diniaoshopsss.com');
$xml = simplexml_load_string($result);
$code = is_register($xml->original);
if ($code == 0) {
    echo '域名可以注册';
} elseif ($code == 1) {
    echo '域名已经注册';
} else {
    echo '域名参数传输错误';
}
