<?php

if (isset($_SERVER['SHELL'])) {

    fwrite(STDOUT, "请输入类型 yndx or hqhy: ");
    $type = trim(fgets(STDIN));

    fwrite(STDOUT, "$type");
    
}else {
    $type = $_GET['type'];

    echo $type;
}

?>
