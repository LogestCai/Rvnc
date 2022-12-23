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

class DeviceGroup extends TimeModel
{

    protected $table = "";

    protected $deleteTime = 'delete_time';

//    public function cate()
//    {
//        return $this->belongsTo('app\admin\model\ArticleCate', 'cate_id', 'id');
//    }


    public function getPidMenuList()
    {
        $list        = $this->field('id,pid,name as title')
            ->where([
               // ['pid', '<>', MenuConstant::HOME_PID],
                ['status', '=', 1],
            ])
            ->select()
            ->toArray();
        $pidMenuList = $this->buildPidMenu(0, $list);
        return $pidMenuList;
    }

    protected function buildPidMenu($pid, $list, $level = 0)
    {
        $newList = [];
        foreach ($list as $vo) {
            if ($vo['pid'] == $pid) {
                $level++;
                foreach ($newList as $v) {
                    if ($vo['pid'] == $v['pid'] && isset($v['level'])) {
                        $level = $v['level'];
                        break;
                    }
                }
                $vo['level'] = $level;
                if ($level > 1) {
                    $repeatString = "&nbsp;&nbsp;&nbsp;&nbsp;";
                    $markString   = str_repeat("{$repeatString}├{$repeatString}", $level - 1);
                    $vo['title']  = $markString . $vo['title'];
                }
                $newList[] = $vo;
                $childList = $this->buildPidMenu($vo['id'], $list, $level);
                !empty($childList) && $newList = array_merge($newList, $childList);
            }

        }
        return $newList;
    }


}