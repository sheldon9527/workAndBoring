<?php
class Paycallback
{

    public function callback()
    {
        $str = 'transdata=%7B%22amount%22%3A10%2C%22appno%22%3A10000%2C%22result%22%3A%222%22%2C%22transtime%22%3A1504579873392%2C%22customerid%22%3A%221%22%2C%22merchantorder%22%3A%221504579885%22%2C%22remark%22%3A%22php%E6%94%AF%E4%BB%98%E6%8E%A5%E5%8F%A3%E5%9C%A8%E7%BA%BF%E6%B5%8B%E8%AF%95%22%2C%22paytype%22%3A%222%22%2C%22transid%22%3A%221709051051133929146774351%22%2C%22currency%22%3A%22RMB%22%2C%22merchantid%22%3A10000%7D&sign=seVroxWIP59M4Wj3MVy8gWYXw0orVKrk4Eq2XBHDKwNZ6YmsbviNwJiuUKQ%2F9%2BBcm1QOe4u4%2BdUPRD%2Bmzv1967%2FbrId6NVJdh3Ea9kyKhZfya75LVuxBLSP2ac3aTlYjMec4lUGVmCz3wr8aaw8oLygNwzgfF3VBmK22oKhdzCY%3D&signtype=RSA';
        $headers = urldecode($str);
        return $headers;
    }
}


$paycallback  = new Paycallback();
$content = $paycallback->callback();

print_r($content);

die;
