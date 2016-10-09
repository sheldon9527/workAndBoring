<?php
class Ftp {

    /**
     * [$ftp_link 定义连接]
     * @var boolean
     */
    private static $ftp_link = false;

    /**
     * [$content 返回数组内容]
     * @var [type]
     */
    public static $content =[];

    /**
     * [getConfig 配置ftp]
     * @return [type] [description]
     */
    public function getConfig($type)
    {
        switch ($type) {
            case 'yndx':
                $ftp_server ='172.25.20.151';
                $ftp_user_name ='hqhy0914';
                $ftp_user_pass ='hqhy@)(14';
                $ftp_server_port ='21';
                break;
            case 'hqhy':
                $ftp_server ='124.243.193.31';
                $ftp_user_name ='yndx';
                $ftp_user_pass ='SB8F2uCI5lOvEbbQ';
                $ftp_server_port ='33900';
                break;
            case 'sheldon':
               $ftp_server='120.26.94.169';
               $ftp_user_name='sheldon';
               $ftp_user_pass='xiaodong';
               $ftp_server_port='21';
               break;
        }

       return [
                  'ftp_server'=>$ftp_server,
                  'ftp_user_name'=>$ftp_user_name,
                  'ftp_user_pass'=>$ftp_user_pass,
                  'ftp_server_port'=>$ftp_server_port,
              ];
    }

    /**
     * [getContent 获取内容]
     */
    public function getContent()
    {
        return self::$content;
    }

    public function getSystemType()
    {
        return ftp_systype(self::$ftp_link);
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
            // result 例子“drwxrwxr-x 2 1000 1000 4096 Sep 25 04:14 Cron” 字符串转化成数组
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
                    $path = '/'.ltrim($path,'/');
                    echo $path.'/'.$file_name.'<br>'."\n";
                    //存入数组
                    self::$content[$path.'/'.$file_name] = $path.'/'.$file_name;
                }
            }
        }

    }
}

/**
 * 判断访问方式
 */
if (isset($_SERVER['SHELL'])) {

    $argv_len = count($argv);

    if($argv_len == 1){
        fwrite(STDOUT, "请输入扫描ftp服务器类: 1.yndx 2.hqhy 3.sheldon\n");

        $type = trim(fgets(STDIN));

        for ($i=0; $i <2 ; $i++) {
            if(!in_array($type,['yndx','hqhy','sheldon'])){
                fwrite(STDOUT, "输入类型错误,请输入重新输入:");
                $type = trim(fgets(STDIN));
            }
        }

        if(!in_array($type,['yndx','hqhy','sheldon'])){
            fwrite(STDOUT, "参数错误次数太多自动退出,重新执行脚本.");
            exit;
        }
    }else {
        $type = $argv[1];
    }


    fwrite(STDOUT, "命令执行中.......\n");

}else {

    if(!array_key_exists('type',$_GET)){
        echo "请输入参数?type 为yndx,sheldon,hqhy一个 例如:http://114.55.36.48:8088?type=hqhy";
        exit;
    }

    $type = $_GET['type'];

    if(!in_array($type,['yndx','hqhy','sheldon'])){
        echo "输入类型错误,请重新输入参数?type 为yndx,sheldon,hqhy一个";
        exit;
    }

    echo '命令执行中.......<br>'."\n";
}


//实例化对象
$ftp = new Ftp();
$config = $ftp->getConfig($type);
$ftp_list = $ftp->new_ftp_connect($config);
//未连接报错
if($ftp_list===false)
{
    die('fail');
}

//根路径
switch ($type) {
    case 'yndx':
        $path = '/';
        break;
    case 'hqhy':
        $path = '/';
        break;
    case 'sheldon':
        $path = '/home/sheldon';
        break;
}

//调用方法
$ftp->list_all_files($path);
$res = $ftp->getContent();
//输出
echo "<pre>";var_dump($res);
//ftp系统类型
$system_type = $ftp->getSystemType();

echo '<br>ftp系统类型:'.$system_type;

echo "\n<br>命令执行完毕\n";
?>
