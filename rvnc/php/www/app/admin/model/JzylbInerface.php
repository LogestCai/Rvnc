<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2021-12-25
 * Time: 7:53
 * desc:用于调用【九阵云疗版】后台业务接口
 * 主要封装了一些存储过程业务的调用 方便其他程序的调用如接口程序
 * 第三方程序使用等业务
 */

namespace app\admin\model;
use app\common\model\TimeModel;

class JzylbInerface extends TimeModel
{
    protected  $_conn = null;
    protected $_message="";
    public function __construct()
    {
        //初始化数据库  主要连接 oracle数据库

    }

    // 连接数据库
    public function connect()
    {
        //建立数据库连接
        try{
            $this->_conn = oci_connect('ambase','ambase','10.87.230.223/orcl','UTF8');
            if(!$this->_conn)
            {
                $this->_message = oci_error();
                return false;
            }
        }
        catch (\Exception $ex)
        {
            $this->_message = $ex->getMessage();
            return false;
        }
        return true;

    }


    public function getStement(){
        $code = 0;                         //准备用以绑定的php变量 id
        $message = "";                     //准备用以绑定的php变量 name/** 调用存储过程的sql语句(sql_sp : SQL_StoreProcedure)
        //给58831 用户充值22元
        $sql_sp = "BEGIN FIN_PD会员充值(1,16568,1,'充值','现金',22,0,0,-1,'',58831,'','','','','',0,'',0,:code, :message); END;";//Parse
        $stmt = OCIParse($conn, $sql_sp);//执行绑定
        OCIBindByName($stmt, ":code", $code ,10);           //参数说明：绑定php变量$id到位置:id，并设定绑定长度16位
        OCIBindByName($stmt, ":message", $message ,200);//Execute
        OCIExecute($stmt);//结果
        echo "message is : $message<br>";
        oci_close($conn);
        exit;

    }


}