<?php
//共同接口
interface db
{
    public function conn();
}
/**
 *@class 服务端开发(不知道谁将会被调用)
 *
 */
class dbmysql implements db
{
    public function conn()
    {
        echo '连接上了Mysql';
    }
}
class dbsqlite implements db
{
    public function conn()
    {
        echo '连接上了sqlite';
    }
}

/**
 *@定义一个工厂接口
 */
interface Factory
{
    public function createDB();
}
/**
 *@实现这个接口
 */
class mysqlFactory implements Factory
{
    public function createDB()
    {
        return new dbmysql();
    }
}
class sqliteFactory implements Factory
{
    public function createDB()
    {
        return new dbsqlite();
    }
}
/**
 *@新增一个oracle
 */
class oracleFactory implements Factory
{
    public function createDB()
    {
        return new oracleDb();
    }
}
class oracleDb implements db
{
    public function conn()
    {
        echo '连接上了oracle';
    }
}

//客户端调用
$fact = new mysqlFactory();
$db = $fact->createDB();
$db->conn();
$fact = new sqliteFactory();
$db = $fact->createDB();
$db->conn();
$fact = new oracleFactory();
$db = $fact->createDB();
$db->conn();
