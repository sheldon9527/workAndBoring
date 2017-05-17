<?php
include_once 'init.php';
require_once 'geohash.php';
use Kernel\Kernel;

Kernel::runCliCommand();
$db = Model::getInstance()->db();

$geohash = new Geohash;
//经纬度转换成Geohash
//获取附近的信息
$n_latitude  = 34.236080797698;
$n_longitude = 109.0145193757;
echo "当前位置为：经度108.7455，纬度34.3608以下网点离我最近：";

//开始
$b_time = microtime(true);
//方案A，直接利用数据库存储函数，遍历排序
//方案B geohash求出附近，然后排序
//当前 geohash值
$n_geohash = $geohash->encode($n_latitude, $n_longitude);
echo $n_geohash;die;
//附近
$n            = 3;
$like_geohash = substr($n_geohash, 0, $n);
$sql          = 'select * from retailersinfotable where geohash like "' . $like_geohash . '%"';
$query        = mysql_query($sql);
if (mysql_num_rows($query)) {
    while ($row = mysql_fetch_array($query)) {
        $data[] = array(
            "latitude"  => $row["Latitude"],
            "longitude" => $row["Longitude"],
            "name"      => $row["RetailersName"],
        );
    }
}

//算出实际距离
foreach ($data as $key => $val) {
    $distance               = getDistance($n_latitude, $n_longitude, $val['latitude'], $val['longitude']);
    $data[$key]['distance'] = $distance;

    //排序列
    $sortdistance[$key] = $distance;
}

//距离排序
array_multisort($sortdistance, SORT_ASC, $data);

//结束
$e_time = microtime(true);

echo "（计算耗时：";
echo $e_time - $b_time;
echo "秒）<br/>";

//var_dump($data);

foreach ($data as $key => $val) {
    echo "</br>";
    echo $val['distance'] . " 米-------" . $val['name'];

}

/**
 *  @desc 根据两点间的经纬度计算距离
 *  @param float $latitude 纬度值
 *  @param float $longitude 经度值
 */
function getDistance($latitude1, $longitude1, $latitude2, $longitude2)
{
    $earth_radius = 6371000; //approximate radius of earth in meters
    $dLat         = deg2rad($latitude2 - $latitude1);
    $dLon         = deg2rad($longitude2 - $longitude1);
    $a            = sin($dLat / 2) * sin($dLat / 2) + cos(deg2rad($latitude1)) * cos(deg2rad($latitude2)) * sin($dLon / 2) * sin($dLon / 2);
    $c            = 2 * asin(sqrt($a));
    $d            = $earth_radius * $c;

    return round($d); //四舍五入
}

$res = getDistance($n_latitude, $n_longitude, 34.235080797698, 109.0145193757);

echo $res;
