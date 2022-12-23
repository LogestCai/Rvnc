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

class OfficeServices extends TimeModel
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
    CREATE TABLE `hrp_office_services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL COMMENT '住院序号',
  `patient_name` varchar(20) NOT NULL COMMENT '患者姓名',
  `in_depart` varchar(50) NOT NULL COMMENT '登记科室',
  `connect_phone` char(11) NOT NULL COMMENT '联系电话',
  `connect_desc` char(50) NOT NULL COMMENT '联系人备注',
  `ident_card` varchar(20) NOT NULL DEFAULT '' COMMENT '身份证',
  `mz_doctor` varchar(50) NOT NULL COMMENT '门诊医生',
  `patient_sex` varchar(10) NOT NULL COMMENT '性别',
  `patient_age` varchar(30) NOT NULL COMMENT '年龄',
  `patient_address` varchar(30) NOT NULL COMMENT '住址',
  `patient_in_time` datetime  NULL COMMENT '住院时间',
  `patient_out_time` datetime  NULL COMMENT '出院时间',
  `patient_in_diagnosis` varchar(30) NOT NULL COMMENT '入院诊断',
  `patient_out_diagnosis` varchar(30) NOT NULL COMMENT '出院诊断',
  `bed_doctor` varchar(30) NOT NULL COMMENT '管床医生',
  `out_summery` varchar(30) NOT NULL COMMENT '出院小结',
  `in_response` text  NULL COMMENT '住院反馈',
  `out_response` text  NULL COMMENT '出院反馈',
  `need_visit` tinyint DEFAULT NULL COMMENT '是否需要回访1:是0:否',
  `next_visit_time` datetime  NULL COMMENT '下次回访日期',
  `next_visit_mark` datetime  NULL COMMENT '下次回访备注',
  `is_visited` tinyint DEFAULT NULL COMMENT '是已回访回访1:是0:否',
  `recent_visited_time` datetime  NULL COMMENT '最近回访时间',
  `patient_source` tinyint DEFAULT NULL COMMENT '病人来源1:自主2:本院介绍3:外院介绍',
  `patient_source_mark` varchar(200) NOT NULL COMMENT '病人来源说明',
  `patient_no` varchar(200) NOT NULL COMMENT '住院编号',
  `patient_type` tinyint DEFAULT NULL COMMENT '病人类型1:重要2:一般',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  `sort` int NOT NULL DEFAULT '10' COMMENT '排序',

  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;



     * */
}