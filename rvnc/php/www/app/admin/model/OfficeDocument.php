<?php

// +----------------------------------------------------------------------
// | EasyAdmin
// +----------------------------------------------------------------------
// | PHP交流群: 763822524
// +----------------------------------------------------------------------
// | 开源协议  https://mit-license.org 
// +----------------------------------------------------------------------
// | github开源项目：https://github.com/zhongshaofa/EasyAdmin
// +----------------------------------------------------------------------

namespace app\admin\model;



use app\common\model\TimeModel;
use think\facade\Db;

class OfficeDocument extends TimeModel
{

    protected $deleteTime = 'delete_time';

    /**
     * 根据pid获取所有父节点
     * @param int $pid
     * @return array
     */
    public function getFathersByPid($pid =0 ){
        static $data = [];
        if($pid==0){
            return array_reverse($data);
        }else{
            $rst = $this->where('id', $pid)->field('id,title,pid')->find();
            if(!empty($rst)){
                $data[] = $rst->toArray();
                return $this->getFathersByPid($rst['pid']);
            }
        }
    }


    public function getUidAttr($value)
    {
        return Db::table('hrp_system_admin')->where('id',$value)->value('name');
    }


}