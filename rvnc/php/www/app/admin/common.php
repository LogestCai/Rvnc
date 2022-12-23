<?php
/**
 * Created by PhpStorm.
 * User: CMM
 * Date: 2022-11-21
 * Time: 16:54
 */
if(!function_exists('pingTest'))
{
    function pingTest($ip)
    {
        //$ip = '192.168.17.254';

        $ping_cmd = "ping -c 1 -w 5 " . $ip;

        exec($ping_cmd, $info);

        if($info == null)

        {

            return show(0,"Ping请求找不到主机".$ip.";请检查该名称,然后重试",[],false);

        }

        //判断是否丢包

        $str1 = $info['4'];

        $str2 = "1 packets transmitted, 1 received, 0% packet loss";

        if( strpos( $str1 , $str2 ) === false)

        {

            return show(0,"当前网络堵塞,请求无法成功,请稍后重试",[],false);

        }

        $ping_time_line = end($info);

        $ping_time = explode("=", $ping_time_line)[1];

        $ping_time_min = explode("/", $ping_time)[0] / 1000.0;

        $ping_time_avg = explode("/", $ping_time)[1] / 1000.0;

        $ping_time_max = explode("/", $ping_time)[2] / 1000.0;



        $result = array();

        $result['domain_ip'] = $info['0'];

        $result['ping_min'] = $ping_time_min;

        $result['ping_avg'] = $ping_time_avg;

        $result['ping_max'] = $ping_time_max;



        return show(1,"请求成功",$result,false);
    }


}

//get请求
if(!function_exists('requestGet')) {

    function requestGet($url)
    {
        $msg = "";
        try{
            $msg = file_get_contents($url);
            return show(1,$msg,[],false);
        }catch (\think\Exception $ex)
        {
            return show(0,'请求放生异常：'.$ex->getMessage(),[],false);
        }
    }
}

//get请求
if(!function_exists('httpGet')) {
    function httpGet($url)
    {
        try{
            $headerArray = array("Content-type:application/json;", "Accept:application/json");
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
            curl_setopt($ch, CURLOPT_HTTPHEADER, $headerArray);
            $output = curl_exec($ch);
            curl_close($ch);
            $output = json_decode($output, true);
            return show(1,"成功！",$output,fasle);
        }catch(\think\Exception $e){
            return show(0,"请求发生异常".$e->getMessage(),[],fasle);
        }


    }
}

//post请求
if(!function_exists('httpPost')) {
    function httpPost($url, $data)
    {
        $data = json_encode($data);
        $headerArray = array("Content-type:application/json;charset='utf-8'", "Accept:application/json");
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
        curl_setopt($curl, CURLOPT_POST, 1);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
        curl_setopt($curl, CURLOPT_HTTPHEADER, $headerArray);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        $output = curl_exec($curl);
        curl_close($curl);
        $output =  json_decode($output，true);
        return show(1,"成功！",$output,fasle);
    }
}


/**
 * @param array $array
 * @return array
 * @desc 根据数组将数组组合成带有孩子节点的数组
 * 如$arr = [['id'=>1,pid=>0,'title'=>'nihao'],['id'=>2,pid=>1,'title'=>'son']]
 * 返回 [['id'=>1,pid=>0,'title'=>'nihao','children'=>['id'=>2,pid=>1,'title'=>'son']]]
 */

if(!function_exists('getTree')){

    function getTree(Array $array)
    {
        //第一步 构造数据
        $items = array();
        foreach($array as $value)
        {
            $value['spread']=true;
            $items[$value['id']] = $value;
        }
        //第二部 遍历数据 生成树状结构
        $tree = array();
        foreach($items as $key => $value)
        {
            //如果pid这个节点存在
            if(isset($items[$value['pid']]))
            {
                //把当前的$value放到pid节点的children中 注意 这里传递的是引用
                $items[$value['pid']]['children'][] = &$items[$key];
            }
            else
            {
                $tree[] = &$items[$key];
            }
        }
        return $tree;
    }

}