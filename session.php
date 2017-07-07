<?php
session_start();
echo session_id();
if ($_SESSION['name'] == 'dddd' && $_SESSION['password'] == '123456') {
    echo '欢迎'.$_SESSION['name'];
} else {
    echo '游客';
}
