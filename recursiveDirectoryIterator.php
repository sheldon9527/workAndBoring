<?php

$directory = new RecursiveDirectoryIterator('/Users/Sheldon/Documents/Code/test');
$iterator = new RecursiveIteratorIterator($directory);
$files = [];
foreach ($iterator as $info) {
    if ($info->isFile()) {
        $files[] = $info->getPathname();
    }
}

var_dump($files);
die;
