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



use app\common\constants\MenuConstant;
use app\common\model\TimeModel;

class SystemDepart extends TimeModel
{

    protected $deleteTime = 'delete_time';

    public function getPidDepartList()
    {
        $list        = $this->field('id,pid,name')
            ->where([
                ['status', '=', 1],
            ])
            ->select()
            ->toArray();
        $pidMenuList = $this->buildPidDepart(0, $list);
//        $pidMenuList = array_merge([[
//            'id'    => 0,
//            'pid'   => 0,
//            'title' => '顶级菜单',
//        ]], $pidMenuList);
        return $pidMenuList;
    }

    protected function buildPidDepart($pid, $list, $level = 0)
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
                    $repeatString = "&nbsp;&nbsp;&nbsp;";
                    $markString   = str_repeat("{$repeatString}├{$repeatString}", $level - 1);
                    $vo['name']  = $markString . $vo['name'];
                }
                $newList[] = $vo;
                $childList = $this->buildPidDepart($vo['id'], $list, $level);
                !empty($childList) && $newList = array_merge($newList, $childList);
            }

        }
        return $newList;
    }

}