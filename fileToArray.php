<?php
$lines = file("file.txt");

$result = [];
foreach ($lines as $key => $line) {
    $line = rtrim($line);
    if($line){
        $result[$key] =$line;
    }
}

var_dump($result);
?>
