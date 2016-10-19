<?php

class Email
{

    public $config = [
        'sitename' => '网站名称',
        'state' => 1,
        'server' => 'smtp.mailgun.org',
        'port' => 587,
        'auth' => 1,
        'username' => 'mail.defara.com',
        'password' => 'key-2d4fee9541d7c5507e41e5dc1895ea14',
        'charset' => 'utf-8',
        'mailfrom' => 'service@defara.com'
    ];


    //构造函数
    public function __construct($config = [])
    {
        $this->config = array_merge($this->config, $config);
    }


    //发送mail
    public function sendmail($mail_to, $mail_subject, $mail_message)
    {

        $config = $this->config;

        date_default_timezone_set('PRC');

        $mail_subject = '=?'.$config['charset'].'?B?'.base64_encode($mail_subject).'?=';
        $mail_message = chunk_split(base64_encode(preg_replace("/(^|(\r\n))(\.)/", "\1.\3", $mail_message)));
        $headers = '';
        $headers .= "";
        $headers .= "MIME-Version:1.0\r\n";
        $headers .= "Content-type:text/html;charset=".$config['charset']."\r\n";
        $headers .= "Content-Transfer-Encoding: base64\r\n";
        $mailfrom = '=?'.$config['charset'].'?B?'.base64_encode($config['sitename']).'?=';
        $headers .= "From: ".$mailfrom." <".$config['mailfrom'].">\r\n";
        //$headers .= "From: ".$config['sitename']."<".$config['mailfrom'].">\r\n";
        $headers .= "Date: ".date("r")."\r\n";
        // list($msec, $sec) = explode(" ", Kernel::$nowMicroTime);
        // $headers .= "Message-ID: <".date("YmdHis", $sec).".".($msec * 1000000).".".$config['mailfrom'].">\r\n";

        if (!$fp = fsockopen($config['server'], $config['port'], $errno, $errstr, 30)) {
            exit("CONNECT - Unable to connect to the SMTP server");
        }

        stream_set_blocking($fp, true);

        $lastmessage = fgets($fp, 512);
        if (substr($lastmessage, 0, 3) != '220') {
            exit("CONNECT - ".$lastmessage);
        }

        fputs($fp, ($config['auth'] ? 'EHLO' : 'HELO')." befen\r\n");
        $lastmessage = fgets($fp, 512);
        if (substr($lastmessage, 0, 3) != 220 && substr($lastmessage, 0, 3) != 250) {
            exit("HELO/EHLO - ".$lastmessage);
        }

        while (1) {
            if (substr($lastmessage, 3, 1) != '-' || empty($lastmessage)) {
                break;
            }
            $lastmessage = fgets($fp, 512);
        }

        $email_from = '';

        if ($config['auth']) {
            fputs($fp, "AUTH LOGIN\r\n");
            $lastmessage = fgets($fp, 512);
            if (substr($lastmessage, 0, 3) != 334) {
                exit($lastmessage);
            }

            fputs($fp, base64_encode($config['username'])."\r\n");
            $lastmessage = fgets($fp, 512);
            if (substr($lastmessage, 0, 3) != 334) {
                exit("AUTH LOGIN - ".$lastmessage);
            }

            fputs($fp, base64_encode($config['password'])."\r\n");
            $lastmessage = fgets($fp, 512);
            if (substr($lastmessage, 0, 3) != 235) {
                exit("AUTH LOGIN - ".$lastmessage);
            }

            $email_from = $config['mailfrom'];
        }

        fputs($fp, "MAIL FROM: <".preg_replace("/.*\<(.+?)\>.*/", "\\1", $email_from).">\r\n");
        $lastmessage = fgets($fp, 512);
        if (substr($lastmessage, 0, 3) != 250) {
            fputs($fp, "MAIL FROM: <".preg_replace("/.*\<(.+?)\>.*/", "\\1", $email_from).">\r\n");
            $lastmessage = fgets($fp, 512);
            if (substr($lastmessage, 0, 3) != 250) {
                exit("MAIL FROM - ".$lastmessage);
            }
        }

        foreach (explode(',', $mail_to) as $touser) {
            $touser = trim($touser);
            if ($touser) {
                fputs($fp, "RCPT TO: <".preg_replace("/.*\<(.+?)\>.*/", "\\1", $touser).">\r\n");
                $lastmessage = fgets($fp, 512);
                if (substr($lastmessage, 0, 3) != 250) {
                    fputs($fp, "RCPT TO: <".preg_replace("/.*\<(.+?)\>.*/", "\\1", $touser).">\r\n");
                    $lastmessage = fgets($fp, 512);
                    exit("RCPT TO - ".$lastmessage);
                }
            }
        }

        fputs($fp, "DATA\r\n");
        $lastmessage = fgets($fp, 512);
        if (substr($lastmessage, 0, 3) != 354) {
            exit("DATA - ".$lastmessage);
        }

        fputs($fp, $headers);
        fputs($fp, "To: ".$mail_to."\r\n");
        fputs($fp, "Subject: $mail_subject\r\n");
        fputs($fp, "\r\n\r\n");
        fputs($fp, "$mail_message\r\n.\r\n");
        $lastmessage = fgets($fp, 512);
        if (substr($lastmessage, 0, 3) != 250) {
            exit("END - ".$lastmessage);
        }

        fputs($fp, "QUIT\r\n");

    }

}
