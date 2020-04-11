<?php
//模拟登录
function login_post($url, $cookie, $post)
{
    $curl = curl_init();//初始化curl模块
    curl_setopt($curl, CURLOPT_URL, $url);//登录提交的地址
    curl_setopt($curl, CURLOPT_HEADER, 0);//是否显示头信息
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 0);//是否自动显示返回的信息
    curl_setopt($curl, CURLOPT_COOKIEJAR, $cookie); //设置Cookie信息保存在指定的文件中
    curl_setopt($curl, CURLOPT_POST, 1);//post方式提交
    curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query($post));//要提交的信息
    curl_exec($curl);//执行cURL
    // var_dump($curl);
    curl_close($curl);//关闭cURL资源，并且释放系统资源
}
 // 登录成功后获取数据
function get_content($url, $cookie)
{
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_HEADER, 0);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_COOKIEFILE, $cookie); //读取cookie
    $rs = curl_exec($ch); //执行cURL抓取页面内容
    curl_close($ch);

    return $rs;
}

//设置post的数据
$post = array (
    'email' => '985829902@qq.com',
    'password' => '123456',
);

//登录地址
$url = "http://sheldon.dev/manager/auth/login";
//设置cookie保存路径
$cookie = dirname(__FILE__) . '/cookie_curl.txt';
//设置cookie保存路径
$code = file_get_contents(dirname(__FILE__) . '/code.txt');
$post['captcha'] = trim($code);
// var_dump($post);
// die;
//登录后要获取信息的地址
$url2 = 'http://sheldon.dev/manager/dashboard';
// 1.模拟登录
login_post($url, $cookie, $post);
//2.获取登录页的信息
$content = get_content($url2, $cookie);
//输出内容
var_dump($content);

$code = file_put_contents(dirname(__FILE__) . '/content.txt', $content);
