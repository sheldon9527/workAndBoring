<?php

class Request {
    /**
     * 获取IP地址
     *
     * @return string
     */
    public static function ip() {
        if (isset($_SERVER['HTTP_CLIENT_IP'])) {
            return strip_tags($_SERVER['HTTP_CLIENT_IP']);
        }
        if (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
            return strip_tags($_SERVER['HTTP_X_FORWARDED_FOR']);
        }
        if (isset($_SERVER['REMOTE_ADDR'])) {
            return strip_tags($_SERVER['REMOTE_ADDR']);
        }
        return 'unknown';
    }

    /**
     * 获取用户标识
     *
     * @return string
     */
    public static function userAgent() {
        return strip_tags($_SERVER['HTTP_USER_AGENT']);
    }

    /**
     * 获取主机名称
     * @return string
     */
    public static function host() {
        if ($_SERVER['SERVER_NAME']) {
            return strip_tags( $_SERVER['SERVER_NAME'].($_SERVER['SERVER_PORT'] == '80' ? '' : ':'.$_SERVER['SERVER_PORT']) );
        }
        return strip_tags($_SERVER['HTTP_HOST']);
    }

    /**
     * 获取基本URL地址
     *
     * @return string
     */
    public static function baseUrl() {
        $protocol = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on') ? 'https://' : 'http://';
        return $protocol . self::host();
    }

    /**
     * 获取请求时间
     *
     * @return mixed
     */
    public static function requestTime() {
        return $_SERVER['REQUEST_TIME'];
    }

    /**
     * 判断是否为手机浏览器
     *
     * @return bool
     */
    public function isMobile()
    {
        if ($_GET['mobile'] === 'yes') {
            setcookie('ismobile', 'yes', 3600);
            return true;
        } elseif ($_GET['mobile'] === 'no') {
            setcookie('ismobile', 'no', 3600);
            return false;
        }

        $cookie = $_COOKIE('ismobile');
        if ($cookie === 'yes') {
            return true;
        } elseif ($cookie === 'no') {
            return false;
        } else {
            $cookie = null;
            static $mobileBrowserList =array('iphone', 'android', 'phone', 'mobile', 'wap', 'netfront', 'java', 'opera mobi', 'opera mini',
                'ucweb', 'windows ce', 'symbian', 'series', 'webos', 'sony', 'blackberry', 'dopod', 'nokia', 'samsung',
                'palmsource', 'xda', 'pieplus', 'meizu', 'midp', 'cldc', 'motorola', 'foma', 'docomo', 'up.browser',
                'up.link', 'blazer', 'helio', 'hosin', 'huawei', 'novarra', 'coolpad', 'webos', 'techfaith', 'palmsource',
                'alcatel', 'amoi', 'ktouch', 'nexian', 'ericsson', 'philips', 'sagem', 'wellcom', 'bunjalloo', 'maui', 'smartphone',
                'iemobile', 'spice', 'bird', 'zte-', 'longcos', 'pantech', 'gionee', 'portalmmm', 'jig browser', 'hiptop',
                'benq', 'haier', '^lct', '320x320', '240x320', '176x220');
            foreach ($mobileBrowserList as $val) {
                $result = strpos(strtolower($_SERVER['HTTP_USER_AGENT']), $val);
                if (false !== $result) {
                    setcookie('ismobile', 'yes', 3600);
                    return true;
                }
            }
            setcookie('ismobile', 'no', 3600);
            return false;
        }
    }

    /**
     * 判断是否为POST请求
     *
     * @return bool
     */
    public static function isPost()
    {
        return (strtolower(self::getService('REQUEST_METHOD')) == 'post') ? true : false;
    }

    /**
     * 判断是否为GET请求
     *
     * @return bool
     */
    public static function isGet()
    {
        return (strtolower(self::getService('REQUEST_METHOD')) == 'get') ? true : false;
    }

    /**
     * 判断是否为AJAX请求
     *
     * @return bool
     */
    public static function isAjax()
    {
        if (
            self::getService('HTTP_X_REQUESTED_WITH')
            && strtolower(self::getService('HTTP_X_REQUESTED_WITH')) == 'xmlhttprequest'
        ) {
            return true;
        }
        return false;
    }

    /**
     * 判断是否以cli方式运行
     *
     * @return bool
     */
    public static function isCli()
    {
        return php_sapi_name() === 'cli';
    }


    /**
     * 获取SERVICE信息
     *
     * @param  string $name SERVER的键值名称
     *
     * @return string
     */
    public static function getService($name = '')
    {
        if ($name == '') return $_SERVER;
        return (isset($_SERVER[$name])) ? strip_tags($_SERVER[$name]) : '';
    }

    /**
     * 获取POST过来的二进制数据,与手机端交互
     *
     * @return string
     */
    public static function getBinaryData()
    {
        if (isset($GLOBALS['HTTP_RAW_POST_DATA']) && !empty($GLOBALS['HTTP_RAW_POST_DATA'])) {
            return $GLOBALS['HTTP_RAW_POST_DATA'];
        } else {
            return file_get_contents('php://input');
        }
    }

    /**
     * 发起curl请求
     *
     * @param string $url 要请求的url
     * @param array $parameter 请求参数
     * @param array $header header头信息
     * @param string $type 请求的数据类型 json/post/file/get
     * @param int $timeout 请求的超时时间默认10s
     *
     * @return bool|mixed
     */
    public static function curl($url, $parameter = array(), $header = array(), $type = 'json', $timeout = 10)
    {
        $ssl = substr($url, 0, 8) == "https://" ? true : false;
        $ch = curl_init();

        $port = 80;
        $arr_url_parse = parse_url($url);
        if(isset($arr_url_parse['port']) && !empty($arr_url_parse['port']))
        {
            $port = (int)$arr_url_parse['port'];
        }
        if($port != 80)
        {
            curl_setopt($ch, CURLOPT_PORT, $port);
        }

        if ($ssl) {
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); //信任任何证书
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2); //检查证书中是否设置域名
        }
        // echo $type;
        if ($type == 'json') {
            $queryStr = json_encode($parameter, PHP_VERSION >= '5.4.0' ? JSON_UNESCAPED_UNICODE : 0);
            //$queryStr = str_replace(array('\/','[]'), array('/','{}'), $queryStr);//兼容

            curl_setopt($ch, CURLOPT_POST, 1);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $queryStr);
        } else if ($type == 'post') {
            curl_setopt($ch, CURLOPT_POST, 1);
            $postData = self::_parsmEncode($parameter, true);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $postData);
        } else if ($type == 'file') {
            curl_setopt($ch, CURLOPT_POST, 1);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $parameter);
        } else {
            $queryStr = '';
            if (is_array($parameter) && !empty($parameter)) {
                // foreach ($parameter as $key => $val) {
                //     $queryStr .= $key .'=' .$val . '&';
                // }
                // $queryStr = substr($queryStr, 0, -1);
                // $url .= '?'.$queryStr;
                $url = self::_parseUrl($url, $parameter);
            }

        }

        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_HEADER, false);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $timeout);

        if (!empty($header)) {
            curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
        }

        $ret = curl_exec($ch);
        $error = curl_error($ch);

        curl_close($ch);
        if ('' === $ret || !empty($error)) {
            return false;
        } else {
            return $ret;
        }
    }

    /**
     * 返回操作系统类型
     *
     * @return bool true为win false为unix
     */
    public static function operatingSystem()
    {
        if (strtoupper(substr(PHP_OS, 0, 3)) === 'WIN') {
            return true;
        } else {
            return false;
        }
    }



    /**
	 * 对参数进行ENCODE编码
	 *
	 * @param array $params :参数
	 * @param bool $isRetStr : true：以字符串返回 false:以数组返回
	 * @return string || array
	 */
	public static function _parsmEncode($params, $isRetStr = true)
	{
		$fieldStr = '';
		$spr = '';
		$result = array();
		foreach ($params as $key => $value)
		{
			$value = urlencode($value);
			$fieldStr .= $spr . $key . '=' . $value;
			$spr = '&';
			$result[$key] = $value;
		}
		return $isRetStr ? $fieldStr : $result;
	}


    /**
	 * 返回解析后的URL，GET方式时会用到
	 *
	 * @param string $url :URL
	 * @param array $params :加在URL后的参数
	 * @return string
	 */
	public static function _parseUrl($url, $params)
	{
		$fieldStr = self::_parsmEncode($params);
		if ($fieldStr)
		{
			$url .= strstr($url, '?') === false ? '?' : '&';
			$url .= $fieldStr;
		}
		return $url;
	}
}
