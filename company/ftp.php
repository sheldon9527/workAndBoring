<?php
class Ftp {

    /**
     * [$ftp_link 定义连接]
     * @var boolean
     */
    private static $ftp_link = false;
    /**
     * [$path 根目录]
     * @var string
     */
    public $path = '/home/sheldon';
    /**
     * [$content 返回数组内容]
     * @var [type]
     */
    public static $content =[];

    /**
     * [getConfig 配置ftp]
     * @return [type] [description]
     */
    public function getConfig()
    {
        return [
                   'ftp_server'=>'120.26.94.169',
                   'ftp_user_name'=>'sheldon',
                   'ftp_user_pass'=>'xiaodong',
                   'ftp_server_port'=>'21',
               ];
    }

    /**
     * [getContent 获取内容]
     */
    public function getContent()
    {
        return self::$content;
    }

    /**
     * [new_ftp_connect 连接ftp]
     * @param  [type] $config [description]
     */
    public static function new_ftp_connect($config)
    {
        extract($config);
        $conn_id = ftp_connect($ftp_server,$ftp_server_port);
        $login_result = ftp_login($conn_id, $ftp_user_name, $ftp_user_pass);
        ftp_pasv($conn_id, true);

        if ((!$conn_id) || (!$login_result)) {
            self::$ftp_link = false;
            return self::$ftp_link;
        }
        self::$ftp_link = $conn_id;

        return self::$ftp_link;
    }

    /**
     * [list_all_files 获取内容]
     * @param  [type] $path [description]
     */
    public  static function list_all_files($path)
    {
        //目前下详细文件信息
        $results = ftp_rawlist(self::$ftp_link,$path);
        //循环处理
        foreach ($results as $key => $result) {
            // result 例子“drwxrwxr-x 2 1000 1000 4096 Sep 25 04:14 Cron” 字符串
            $file_detail_info = preg_split("/[\s]+/", $result);
            $length = count($file_detail_info);
            //判断是否为目录
            if($file_detail_info[0]{0}=='d')
            {
                //构建新的目录
                $new_path =$path.'/'.$file_detail_info[$length-1];
                //递归处理
                self::list_all_files($new_path);

            }else{
                //文件名称
                $file_name =$file_detail_info[$length-1];
                $file_name_info = explode('.',$file_name);
                //判断是否为ts文件
                if(strtolower($file_name_info[count($file_name_info)-1])=='ts')
                {
                    echo $path.'/'.$file_name.'<br>';
                    //存入数组
                    self::$content[$path.'/'.$file_name] = $path.'/'.$file_name;
                }

            }
        }

    }
}

//实例化对象
$ftp = new Ftp();
$config = $ftp->getConfig();
$ftp_list = $ftp->new_ftp_connect($config);
//未连接报错
if($ftp_list===false)
{
    die('fail');
}
//调用方法
$ftp->list_all_files($ftp->path);
$res = $ftp->getContent();
//输出
echo "<pre>";var_dump($res);
?>
