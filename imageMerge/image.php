<?php
include_once 'imagehandler.php';
$image_dir = '/Users/Sheldon/Documents/Code/test/imageMerge/sheldon.jpg';
$image_dir_new = '/Users/Sheldon/Documents/Code/test/imageMerge/sheldonMask.jpg';
$mask_img_path = '/Users/Sheldon/Documents/Code/test/imageMerge/dong.png';
$width =400;
$height = 400;

$img = new ImageHandler();
$img->setSrcImg($image_dir);
$img->setDstImg($image_dir_new);
$img->setCutType('2'); //生成图片的类型 1手动生成 / 0 自动缩放
$img->setImgDisplayQuality('100'); //图片质量
$img->setImgCreateQuality('100');
$img->setRectangleCut($width, $height);
$img->setMaskImg($mask_img_path);//图片水印
$img->setMaskPosition(1);//图片水印的位置
$img->createImg($width, $height);

unset($img);
