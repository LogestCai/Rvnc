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

class OfficeHospitalService extends TimeModel
{

    protected $deleteTime = 'delete_time';

//    public function getRegisterTimeAttr($val){
//        return date('Y-m-d H:i:s',$val);
//    }
//
//    public function setRegisterTimeAttr($val){
//        return strtotime($val);
//    }


    //创建数据库语句
    /*
   CREATE TABLE `hrp_office_hospital_service` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '系统id',
  `patient_id` int NOT NULL COMMENT '住院序号i',
  `service_type` int DEFAULT NULL COMMENT '服务类型:1在院回访2出院回访3再次回访',
  `service_id` int DEFAULT NULL COMMENT '服务id',
  `tech_s` tinyint DEFAULT '0' COMMENT '医疗技术评价 0 未评级 1 好评 2 差评',
  `doctor_s` tinyint DEFAULT '0' COMMENT '医生服务评价 0 未评级 1 好评 2 差评',
  `nurse_s` tinyint DEFAULT '0' COMMENT '护士服务评价 0 未评级 1 好评 2 差评',
  `environment_s` tinyint DEFAULT '0' COMMENT '环境评价 0 未评级 1 好评 2 差评',
  `feel_s` tinyint DEFAULT '0' COMMENT '就医感受评价 0 未评级 1 好评 2 差评',
  `food_s` tinyint DEFAULT '0' COMMENT '食堂服务评价 0 未评级 1 好评 2 差评',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;





     * */
}