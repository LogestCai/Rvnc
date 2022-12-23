/*
Navicat MySQL Data Transfer

Source Server         : 医院mysql230.199
Source Server Version : 50728
Source Host           : 10.87.230.199:3306
Source Database       : devManager

Target Server Type    : MYSQL
Target Server Version : 50728
File Encoding         : 65001

Date: 2022-12-21 14:18:02
*/

SET FOREIGN_KEY_CHECKS=0;

create database `devManager` character set utf8 collate utf8_general_ci;
use devManager;

-- ----------------------------
-- Table structure for hrp_device
-- ----------------------------
DROP TABLE IF EXISTS `hrp_device`;
CREATE TABLE `hrp_device` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `device_name` varchar(255) DEFAULT NULL COMMENT '设备名称',
  `location` varchar(255) DEFAULT NULL COMMENT '位置',
  `group` int(11) NOT NULL DEFAULT '0' COMMENT '部门id',
  `UUID` varchar(50) NOT NULL COMMENT '设备唯一id',
  `ip` varchar(50) DEFAULT NULL COMMENT '有效ip地址',
  `mac` varchar(255) DEFAULT NULL COMMENT '设备mac地址',
  `ips` varchar(255) DEFAULT NULL COMMENT '可能ip地址',
  `os_version` varchar(255) DEFAULT NULL COMMENT '操作系统版本',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态0禁用1在用',
  `online` tinyint(1) NOT NULL DEFAULT '0' COMMENT '在线状态',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  `computer_name` varchar(255) DEFAULT NULL COMMENT '计算机名称',
  `mark` varchar(255) DEFAULT NULL COMMENT '备注',
  `sort` int(11) NOT NULL DEFAULT '10' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_uuid` (`UUID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hrp_device
-- ----------------------------
INSERT INTO `hrp_device` VALUES ('1', '蔡明明办公电脑', '6号楼2F信息科', '3', 'F09E-F98A-B926-8CAA-3DE4-FEFE-24D2-5CFE', '192.168.17.233', '2A-02-4C-41-31-12|2A-02-4C-41-31-11|9E-15-48-E5-26-6D', '192.168.242.1|192.168.163.1|192.168.119.1|192.168.88.99|192.168.17.233|192.168.77.137', '发发发', '1', '0', '2022-11-24 12:52:23', '2022-11-24 12:52:23', null, 'DESKTOP-SU3E9TT', '测试', '10');
INSERT INTO `hrp_device` VALUES ('2', '蔡明明远程测试机01', '6号楼2F信息科', '3', 'AC76-C3E0-A2A4-0843-020A-60E3-1CFF-BFBE', '192.168.17.230', '00-0C-29-59-86-76', '192.168.17.230', 'Microsoft Windows NT 6.2.9200.0', '1', '0', '2022-11-24 13:17:16', '2022-11-24 13:17:16', null, 'WIN-GISKK43QIUR', '', '10');
INSERT INTO `hrp_device` VALUES ('3', 'licensename', '6#2F', '3', '7DFA-5AA1-A81A-E278-EF04-CE4C-36F9-1FBF', '192.168.17.112', '04-D9-F5-D7-02-31|D0-37-45-0E-A9-13|0A-00-27-00-00-0B', '192.168.56.1|192.168.17.112|192.168.77.140|192.168.28.1|192.168.37.1', 'Microsoft Windows NT 6.2.9200.0', '1', '0', '2022-12-01 08:34:57', '2022-12-01 08:34:57', null, 'licensename', '', '10');
INSERT INTO `hrp_device` VALUES ('4', 'DESKTOP-JDIN55I', 'DESKTOP-JDIN55I', '1', '7718-07B2-0889-5AE0-235F-C995-28C6-71B3', '', 'E0-4C-68-02-0C-16|0C-9D-92-BB-A6-1A', '192.168.17.173|192.168.77.173', 'Microsoft Windows NT 6.2.9200.0', '1', '0', '2022-12-01 08:44:49', '2022-12-01 08:44:49', null, 'DESKTOP-JDIN55I', null, '10');
INSERT INTO `hrp_device` VALUES ('5', 'WIN-GISKK43QIUR', 'WIN-GISKK43QIUR', '4', 'EB07-8368-CF8D-3C5F-0AED-E1F1-EAA1-BCFF', '192.168.17.231', '00-0C-29-83-A6-99', '192.168.17.231', 'Microsoft Windows NT 6.2.9200.0', '1', '0', '2022-12-07 09:38:59', '2022-12-07 09:38:59', null, 'WIN-GISKK43QIUR', null, '10');
INSERT INTO `hrp_device` VALUES ('6', 'PC-20160716QFIG', 'PC-20160716QFIG', '1', '', '192.168.25.219', '', '192.168.25.219', 'Microsoft Windows NT 6.1.7601 Service Pack 1', '1', '0', '2022-12-08 09:21:34', '2022-12-08 09:21:34', null, 'PC-20160716QFIG', null, '10');
INSERT INTO `hrp_device` VALUES ('7', '分院收费处结算电脑', 'PC-20160716QFIG', '4', '192.168.25.219', '192.168.25.219', '', '192.168.25.219', 'Microsoft Windows NT 6.1.7601 Service Pack 1', '1', '0', '2022-12-08 09:41:38', '2022-12-08 09:41:38', null, 'PC-20160716QFIG', null, '10');
INSERT INTO `hrp_device` VALUES ('8', 'bak172', 'bak172', '1', '4FC1-2142-EC2B-E309-2817-3365-175D-4793', '10.87.232.173', '9E-30-18-07-85-D3|02-19-8D-36-71-81', '192.168.10.198|10.87.232.173', 'Microsoft Windows NT 6.1.7600.0', '1', '0', '2022-12-08 12:09:15', '2022-12-08 12:09:15', null, 'bak172', null, '10');
INSERT INTO `hrp_device` VALUES ('9', 'WIN-GISKK43QIUR', 'WIN-GISKK43QIUR', '1', 'B8E8-DFCE-08BB-2B1E-B2EC-BCA4-CB31-74E1', '192.168.17.53', '00-0C-29-B8-CA-23', '192.168.17.53', 'Microsoft Windows NT 6.2.9200.0', '1', '0', '2022-12-08 12:47:50', '2022-12-08 12:47:50', null, 'WIN-GISKK43QIUR', null, '10');
INSERT INTO `hrp_device` VALUES ('10', 'server2', 'server2', '1', 'F1C6-BD05-3C24-95BB-56BF-B2E9-9BF8-9606', '10.87.232.172', 'F8-0F-41-F5-4A-BB', '10.87.232.172', 'Microsoft Windows NT 6.1.7600.0', '1', '0', '2022-12-14 13:32:07', '2022-12-14 13:32:07', null, 'server2', null, '10');
INSERT INTO `hrp_device` VALUES ('11', 'DESKTOP-QFVH0HR', 'DESKTOP-QFVH0HR', '1', '24FC-9ED0-D8C7-27EF-133C-CE35-4C4D-3D2B', '192.168.20.123', '1C-69-7A-30-9D-D8|08-1F-71-24-77-9B', '192.168.20.123|192.168.0.11', 'Microsoft Windows NT 6.2.9200.0', '1', '0', '2022-12-16 09:07:54', '2022-12-16 09:07:54', null, 'DESKTOP-QFVH0HR', null, '10');
INSERT INTO `hrp_device` VALUES ('12', 'XP-20151030PCIN', 'XP-20151030PCIN', '1', '9922-EF02-2373-3E9A-FDED-D7C7-B969-40B4', '192.168.25.33', '90-2B-34-0D-F0-D4', '192.168.25.33', 'Microsoft Windows NT 5.1.2600 Service Pack 3', '1', '0', '2022-12-19 13:18:48', '2022-12-19 13:18:48', null, 'XP-20151030PCIN', null, '10');

-- ----------------------------
-- Table structure for hrp_device_group
-- ----------------------------
DROP TABLE IF EXISTS `hrp_device_group`;
CREATE TABLE `hrp_device_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统序号',
  `pid` int(11) NOT NULL DEFAULT '1' COMMENT '父id',
  `name` varchar(100) NOT NULL COMMENT '分组名称',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态（1有效0无效）',
  `sort` int(11) NOT NULL DEFAULT '10' COMMENT '排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `mark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hrp_device_group
-- ----------------------------
INSERT INTO `hrp_device_group` VALUES ('1', '0', '全部', '1', '10', '2022-11-24 14:08:03', '2022-11-24 14:08:06', null, null);
INSERT INTO `hrp_device_group` VALUES ('2', '1', '未分组', '1', '10', '2022-11-24 14:09:34', '2022-11-24 14:09:37', null, null);
INSERT INTO `hrp_device_group` VALUES ('3', '1', '信息科', '1', '10', '2022-11-24 14:10:01', '2022-11-24 14:10:05', null, null);
INSERT INTO `hrp_device_group` VALUES ('4', '1', '分院收费处', '1', '10', '2022-11-24 14:10:28', '2022-11-24 14:10:31', null, null);
INSERT INTO `hrp_device_group` VALUES ('5', '1', '分院内科', '1', '10', '2022-11-24 14:10:54', '2022-11-24 14:10:57', null, null);
INSERT INTO `hrp_device_group` VALUES ('6', '1', '分院门诊', '1', '10', '2022-11-24 14:11:15', '2022-11-24 14:11:18', null, null);
INSERT INTO `hrp_device_group` VALUES ('7', '1', '分院', '1', '10', '2022-11-24 14:11:52', '2022-11-24 14:11:55', null, null);
INSERT INTO `hrp_device_group` VALUES ('8', '1', '1号楼1层', '1', '10', '2022-11-24 14:13:08', '2022-11-24 14:13:12', null, null);
INSERT INTO `hrp_device_group` VALUES ('9', '1', '测试', '1', '10', '2022-12-20 18:36:40', '2022-12-21 09:25:19', null, '');

-- ----------------------------
-- Table structure for hrp_device_help
-- ----------------------------
DROP TABLE IF EXISTS `hrp_device_help`;
CREATE TABLE `hrp_device_help` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `device_id` int(11) NOT NULL COMMENT '设备id',
  `user_id` int(11) DEFAULT NULL COMMENT '求助人id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '10' COMMENT '排序',
  `is_done` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否完成0未完成1已完成',
  `done_time` datetime DEFAULT NULL COMMENT '完成时间',
  `done_user` int(11) DEFAULT NULL COMMENT '完成人id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hrp_device_help
-- ----------------------------
INSERT INTO `hrp_device_help` VALUES ('1', '1', null, '2022-12-03 20:34:21', '2022-12-19 08:43:17', '2022-12-19 08:43:17', '10', '0', null, null);
INSERT INTO `hrp_device_help` VALUES ('2', '1', null, '2022-12-03 20:58:11', '2022-12-19 09:11:50', '2022-12-19 09:11:50', '10', '0', null, null);
INSERT INTO `hrp_device_help` VALUES ('3', '1', null, '2022-12-04 18:23:11', '2022-12-19 09:11:50', '2022-12-19 09:11:50', '10', '0', null, null);
INSERT INTO `hrp_device_help` VALUES ('4', '1', null, '2022-12-05 14:17:22', '2022-12-19 09:11:50', '2022-12-19 09:11:50', '10', '0', null, null);
INSERT INTO `hrp_device_help` VALUES ('5', '5', null, '2022-12-07 13:13:23', '2022-12-19 09:11:50', '2022-12-19 09:11:50', '10', '0', null, null);
INSERT INTO `hrp_device_help` VALUES ('6', '8', null, '2022-12-08 12:34:12', '2022-12-19 09:11:50', '2022-12-19 09:11:50', '10', '0', null, null);
INSERT INTO `hrp_device_help` VALUES ('7', '2', null, '2022-12-19 09:14:25', '2022-12-19 09:14:25', null, '10', '0', null, null);

-- ----------------------------
-- Table structure for hrp_device_problem
-- ----------------------------
DROP TABLE IF EXISTS `hrp_device_problem`;
CREATE TABLE `hrp_device_problem` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `repair_type` int(11) NOT NULL COMMENT '报修问题',
  `name` varchar(255) NOT NULL COMMENT '问题描述',
  `sort` int(11) NOT NULL DEFAULT '10' COMMENT '排序',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hrp_device_problem
-- ----------------------------
INSERT INTO `hrp_device_problem` VALUES ('1', '1', '电脑无法启动', '10', '2022-12-04 20:09:49', '2022-12-04 20:09:52', null);
INSERT INTO `hrp_device_problem` VALUES ('2', '1', '电脑开机黑屏', '10', '2022-12-04 20:10:15', '2022-12-04 20:10:18', null);
INSERT INTO `hrp_device_problem` VALUES ('3', '2', '条码打印机没反应', '10', '2022-12-04 20:11:10', '2022-12-04 20:11:13', null);
INSERT INTO `hrp_device_problem` VALUES ('4', '2', '佳能打印机没反应', '10', '2022-12-04 20:11:47', '2022-12-04 20:12:13', null);
INSERT INTO `hrp_device_problem` VALUES ('5', '2', '打印机卡纸', '10', '2022-12-04 20:12:08', '2022-12-04 20:12:17', null);
INSERT INTO `hrp_device_problem` VALUES ('6', '2', '打印机机打印异响', '10', '2022-12-04 20:12:38', '2022-12-04 20:12:40', null);
INSERT INTO `hrp_device_problem` VALUES ('7', '2', '手腕带打印机故障', '10', '2022-12-04 20:13:21', '2022-12-04 20:13:25', null);
INSERT INTO `hrp_device_problem` VALUES ('8', '3', '出院提示存在未计费医嘱', '10', '2022-12-04 20:14:40', '2022-12-04 20:14:43', null);
INSERT INTO `hrp_device_problem` VALUES ('9', '3', '未生成处方单', '10', '2022-12-04 20:15:59', '2022-12-04 20:16:01', null);

-- ----------------------------
-- Table structure for hrp_device_repair
-- ----------------------------
DROP TABLE IF EXISTS `hrp_device_repair`;
CREATE TABLE `hrp_device_repair` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `report_device_id` int(11) NOT NULL COMMENT '上报终端id',
  `repair_device_id` int(11) NOT NULL COMMENT '故障设备id',
  `problem_type` int(11) NOT NULL COMMENT '问题类型1电脑故障2打印机故障3his系统故障4电话故障5网络故障6其他故障',
  `problem_description` varchar(255) DEFAULT NULL COMMENT '问题描述',
  `report_user_phone` varchar(20) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '维修状态0已申请,1已安排人员处理2已处理完成-1已作废3暂时无法处理',
  `accepted_user_id` int(11) DEFAULT NULL COMMENT '接单人id',
  `accepted_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '10' COMMENT '排序',
  `finish_time` datetime DEFAULT NULL COMMENT '完成时间',
  `mark` varchar(255) DEFAULT NULL COMMENT '备注',
  `deprecated_time` datetime DEFAULT NULL COMMENT '作废时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hrp_device_repair
-- ----------------------------
INSERT INTO `hrp_device_repair` VALUES ('1', '1', '1', '2', null, '18955017638', '0', null, null, '2022-12-04 18:01:53', '2022-12-04 18:01:53', null, '10', null, null, null);
INSERT INTO `hrp_device_repair` VALUES ('2', '1', '1', '3', null, '18955017638', '0', null, null, '2022-12-04 18:01:53', '2022-12-04 18:01:53', null, '10', null, null, null);
INSERT INTO `hrp_device_repair` VALUES ('3', '1', '1', '1', '开不了机', '18955017638', '0', null, null, '2022-12-04 18:28:20', '2022-12-04 18:28:20', null, '10', null, null, null);
INSERT INTO `hrp_device_repair` VALUES ('4', '1', '2', '1', '电脑开机黑屏', '18955017638', '0', null, null, '2022-12-04 21:35:32', '2022-12-04 21:35:32', null, '10', null, null, null);
INSERT INTO `hrp_device_repair` VALUES ('5', '1', '2', '2', '电脑开机黑屏', '18955017638', '0', null, null, '2022-12-04 21:35:32', '2022-12-04 21:35:32', null, '10', null, null, null);
INSERT INTO `hrp_device_repair` VALUES ('6', '1', '2', '3', '电脑开机黑屏', '18955017638', '0', null, null, '2022-12-04 21:35:32', '2022-12-04 21:35:32', null, '10', null, null, null);

-- ----------------------------
-- Table structure for hrp_device_repair_type
-- ----------------------------
DROP TABLE IF EXISTS `hrp_device_repair_type`;
CREATE TABLE `hrp_device_repair_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '10' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态1使用0停用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hrp_device_repair_type
-- ----------------------------
INSERT INTO `hrp_device_repair_type` VALUES ('1', '电脑故障', '2022-12-04 22:58:07', '2022-12-04 22:58:10', null, '10', '1');
INSERT INTO `hrp_device_repair_type` VALUES ('2', '打印机故障', '2022-12-04 22:58:25', '2022-12-04 22:58:30', null, '10', '1');
INSERT INTO `hrp_device_repair_type` VALUES ('3', 'HIS系统故障', '2022-12-04 22:58:48', '2022-12-04 22:58:50', null, '10', '1');
INSERT INTO `hrp_device_repair_type` VALUES ('4', '固定电话故障', '2022-12-04 22:59:05', '2022-12-04 22:59:08', null, '10', '1');
INSERT INTO `hrp_device_repair_type` VALUES ('5', '网络故障', '2022-12-04 22:59:20', '2022-12-04 22:59:22', null, '10', '1');
INSERT INTO `hrp_device_repair_type` VALUES ('6', '其他故障', '2022-12-04 22:59:33', '2022-12-04 22:59:37', null, '10', '1');

-- ----------------------------
-- Table structure for hrp_device_task
-- ----------------------------
DROP TABLE IF EXISTS `hrp_device_task`;
CREATE TABLE `hrp_device_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '任务类型1重启电脑2重启远程模块3关闭程序命令4cmd命令',
  `command` varchar(255) NOT NULL COMMENT '命令',
  `name` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `sort` int(11) NOT NULL DEFAULT '10' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态1使用2停用',
  `receive` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否接收',
  `device_id` int(11) NOT NULL COMMENT '主机id',
  `receive_time` datetime DEFAULT NULL,
  `mark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hrp_device_task
-- ----------------------------
INSERT INTO `hrp_device_task` VALUES ('1', '1', '2', '重启远程模块', '2022-12-02 13:34:12', '2022-12-02 13:34:12', null, '10', '1', '1', '2', '2022-12-02 14:39:53', null);
INSERT INTO `hrp_device_task` VALUES ('2', '1', '2', '重启远程模块', '2022-12-02 14:18:26', '2022-12-02 14:18:26', null, '10', '1', '1', '1', '2022-12-02 14:39:51', null);
INSERT INTO `hrp_device_task` VALUES ('3', '1', '1', '重启电脑', '2022-12-02 16:26:06', '2022-12-02 16:26:06', null, '10', '1', '1', '2', '2022-12-02 16:26:53', null);
INSERT INTO `hrp_device_task` VALUES ('4', '1', '1', '重启电脑', '2022-12-02 16:42:18', '2022-12-02 16:42:18', null, '10', '1', '1', '2', '2022-12-02 16:42:47', null);
INSERT INTO `hrp_device_task` VALUES ('5', '1', '1', '重启电脑', '2022-12-02 16:49:16', '2022-12-02 16:49:16', null, '10', '1', '1', '2', '2022-12-02 17:19:39', null);
INSERT INTO `hrp_device_task` VALUES ('6', '1', '2', '重启远程模块', '2022-12-05 16:19:36', '2022-12-05 16:19:36', null, '10', '1', '1', '2', '2022-12-05 16:22:36', null);

-- ----------------------------
-- Table structure for hrp_system_admin
-- ----------------------------
DROP TABLE IF EXISTS `hrp_system_admin`;
CREATE TABLE `hrp_system_admin` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `auth_ids` varchar(255) DEFAULT NULL COMMENT '角色权限ID',
  `head_img` varchar(255) DEFAULT NULL COMMENT '头像',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_number` varchar(50) DEFAULT NULL,
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户登录名',
  `password` char(40) NOT NULL DEFAULT '' COMMENT '用户登录密码',
  `phone` varchar(16) DEFAULT NULL COMMENT '联系手机号',
  `remark` varchar(255) DEFAULT '' COMMENT '备注说明',
  `login_num` bigint(20) unsigned DEFAULT '0' COMMENT '登录次数',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用,)',
  `system_id` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=1043 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统用户表';

-- ----------------------------
-- Records of hrp_system_admin
-- ----------------------------
INSERT INTO `hrp_system_admin` VALUES ('1', null, '/upload/20201022/f165a8f6239393c7e1ff446f04cd6999.png', '管理员', null, 'admin', 'e5cce20a39978b70d1cca2b53aa92ddef485fb5c', 'admin', 'admin', '385', '0', '1', '0', '1596498865', '1671593984', null);

-- ----------------------------
-- Table structure for hrp_system_auth
-- ----------------------------
DROP TABLE IF EXISTS `hrp_system_auth`;
CREATE TABLE `hrp_system_auth` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL COMMENT '权限名称',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统权限表';

-- ----------------------------
-- Records of hrp_system_auth
-- ----------------------------
INSERT INTO `hrp_system_auth` VALUES ('1', '管理员', '1', '1', '测试管理员', '1588921753', '1589614331', null);
INSERT INTO `hrp_system_auth` VALUES ('6', '游客权限', '0', '1', '', '1588227513', '1589591751', '1589591751');
INSERT INTO `hrp_system_auth` VALUES ('7', '普通用户', '0', '1', '', '1597155545', '1597155545', null);
INSERT INTO `hrp_system_auth` VALUES ('8', 'DRG操作员', '0', '1', '', '1604732611', '1604732611', null);
INSERT INTO `hrp_system_auth` VALUES ('9', '正式员工', '0', '1', '', '1618917193', '1618917193', null);
INSERT INTO `hrp_system_auth` VALUES ('10', '综合服务中心', '0', '1', '', '1622623961', '1622623961', null);
INSERT INTO `hrp_system_auth` VALUES ('11', '回访管理', '0', '1', '回访功能', '1657852282', '1657852282', null);

-- ----------------------------
-- Table structure for hrp_system_auth_node
-- ----------------------------
DROP TABLE IF EXISTS `hrp_system_auth_node`;
CREATE TABLE `hrp_system_auth_node` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `auth_id` bigint(20) unsigned DEFAULT NULL COMMENT '角色ID',
  `node_id` bigint(20) DEFAULT NULL COMMENT '节点ID',
  PRIMARY KEY (`id`),
  KEY `index_system_auth_auth` (`auth_id`) USING BTREE,
  KEY `index_system_auth_node` (`node_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='角色与节点关系表';

-- ----------------------------
-- Records of hrp_system_auth_node
-- ----------------------------
INSERT INTO `hrp_system_auth_node` VALUES ('1', '6', '1');
INSERT INTO `hrp_system_auth_node` VALUES ('2', '6', '2');
INSERT INTO `hrp_system_auth_node` VALUES ('3', '6', '9');
INSERT INTO `hrp_system_auth_node` VALUES ('4', '6', '12');
INSERT INTO `hrp_system_auth_node` VALUES ('5', '6', '18');
INSERT INTO `hrp_system_auth_node` VALUES ('6', '6', '19');
INSERT INTO `hrp_system_auth_node` VALUES ('7', '6', '21');
INSERT INTO `hrp_system_auth_node` VALUES ('8', '6', '22');
INSERT INTO `hrp_system_auth_node` VALUES ('9', '6', '29');
INSERT INTO `hrp_system_auth_node` VALUES ('10', '6', '30');
INSERT INTO `hrp_system_auth_node` VALUES ('11', '6', '38');
INSERT INTO `hrp_system_auth_node` VALUES ('12', '6', '39');
INSERT INTO `hrp_system_auth_node` VALUES ('13', '6', '45');
INSERT INTO `hrp_system_auth_node` VALUES ('14', '6', '46');
INSERT INTO `hrp_system_auth_node` VALUES ('15', '6', '52');
INSERT INTO `hrp_system_auth_node` VALUES ('16', '6', '53');
INSERT INTO `hrp_system_auth_node` VALUES ('71', '8', '38');
INSERT INTO `hrp_system_auth_node` VALUES ('72', '8', '39');
INSERT INTO `hrp_system_auth_node` VALUES ('73', '8', '40');
INSERT INTO `hrp_system_auth_node` VALUES ('74', '8', '41');
INSERT INTO `hrp_system_auth_node` VALUES ('75', '8', '42');
INSERT INTO `hrp_system_auth_node` VALUES ('76', '8', '43');
INSERT INTO `hrp_system_auth_node` VALUES ('77', '8', '44');
INSERT INTO `hrp_system_auth_node` VALUES ('78', '8', '89');
INSERT INTO `hrp_system_auth_node` VALUES ('79', '8', '90');
INSERT INTO `hrp_system_auth_node` VALUES ('80', '8', '92');
INSERT INTO `hrp_system_auth_node` VALUES ('81', '8', '94');
INSERT INTO `hrp_system_auth_node` VALUES ('82', '8', '96');
INSERT INTO `hrp_system_auth_node` VALUES ('90', '7', '107');
INSERT INTO `hrp_system_auth_node` VALUES ('91', '7', '108');
INSERT INTO `hrp_system_auth_node` VALUES ('92', '7', '109');
INSERT INTO `hrp_system_auth_node` VALUES ('93', '7', '110');
INSERT INTO `hrp_system_auth_node` VALUES ('94', '7', '111');
INSERT INTO `hrp_system_auth_node` VALUES ('95', '7', '112');
INSERT INTO `hrp_system_auth_node` VALUES ('96', '7', '113');
INSERT INTO `hrp_system_auth_node` VALUES ('97', '7', '114');
INSERT INTO `hrp_system_auth_node` VALUES ('121', '10', '123');
INSERT INTO `hrp_system_auth_node` VALUES ('122', '10', '124');
INSERT INTO `hrp_system_auth_node` VALUES ('123', '10', '125');
INSERT INTO `hrp_system_auth_node` VALUES ('124', '10', '126');
INSERT INTO `hrp_system_auth_node` VALUES ('125', '10', '127');
INSERT INTO `hrp_system_auth_node` VALUES ('126', '10', '128');
INSERT INTO `hrp_system_auth_node` VALUES ('127', '10', '129');
INSERT INTO `hrp_system_auth_node` VALUES ('128', '10', '130');
INSERT INTO `hrp_system_auth_node` VALUES ('129', '10', '131');
INSERT INTO `hrp_system_auth_node` VALUES ('130', '10', '132');
INSERT INTO `hrp_system_auth_node` VALUES ('131', '10', '133');
INSERT INTO `hrp_system_auth_node` VALUES ('132', '10', '134');
INSERT INTO `hrp_system_auth_node` VALUES ('133', '10', '135');
INSERT INTO `hrp_system_auth_node` VALUES ('134', '10', '136');
INSERT INTO `hrp_system_auth_node` VALUES ('135', '10', '137');
INSERT INTO `hrp_system_auth_node` VALUES ('136', '9', '123');
INSERT INTO `hrp_system_auth_node` VALUES ('137', '9', '124');
INSERT INTO `hrp_system_auth_node` VALUES ('138', '9', '125');
INSERT INTO `hrp_system_auth_node` VALUES ('139', '9', '126');
INSERT INTO `hrp_system_auth_node` VALUES ('140', '9', '127');
INSERT INTO `hrp_system_auth_node` VALUES ('141', '9', '128');
INSERT INTO `hrp_system_auth_node` VALUES ('142', '9', '129');
INSERT INTO `hrp_system_auth_node` VALUES ('143', '9', '130');
INSERT INTO `hrp_system_auth_node` VALUES ('199', '11', '1');
INSERT INTO `hrp_system_auth_node` VALUES ('200', '11', '2');
INSERT INTO `hrp_system_auth_node` VALUES ('201', '11', '4');
INSERT INTO `hrp_system_auth_node` VALUES ('202', '11', '7');
INSERT INTO `hrp_system_auth_node` VALUES ('203', '11', '8');
INSERT INTO `hrp_system_auth_node` VALUES ('204', '11', '138');
INSERT INTO `hrp_system_auth_node` VALUES ('205', '11', '139');
INSERT INTO `hrp_system_auth_node` VALUES ('206', '11', '140');
INSERT INTO `hrp_system_auth_node` VALUES ('207', '11', '141');
INSERT INTO `hrp_system_auth_node` VALUES ('208', '11', '142');
INSERT INTO `hrp_system_auth_node` VALUES ('209', '11', '143');
INSERT INTO `hrp_system_auth_node` VALUES ('210', '11', '144');
INSERT INTO `hrp_system_auth_node` VALUES ('211', '11', '145');
INSERT INTO `hrp_system_auth_node` VALUES ('212', '11', '187');
INSERT INTO `hrp_system_auth_node` VALUES ('213', '11', '188');
INSERT INTO `hrp_system_auth_node` VALUES ('214', '11', '201');
INSERT INTO `hrp_system_auth_node` VALUES ('215', '11', '146');
INSERT INTO `hrp_system_auth_node` VALUES ('216', '11', '147');
INSERT INTO `hrp_system_auth_node` VALUES ('217', '11', '148');
INSERT INTO `hrp_system_auth_node` VALUES ('218', '11', '149');
INSERT INTO `hrp_system_auth_node` VALUES ('219', '11', '150');
INSERT INTO `hrp_system_auth_node` VALUES ('220', '11', '151');
INSERT INTO `hrp_system_auth_node` VALUES ('221', '11', '152');
INSERT INTO `hrp_system_auth_node` VALUES ('222', '11', '153');
INSERT INTO `hrp_system_auth_node` VALUES ('223', '11', '189');
INSERT INTO `hrp_system_auth_node` VALUES ('224', '11', '202');
INSERT INTO `hrp_system_auth_node` VALUES ('225', '11', '154');
INSERT INTO `hrp_system_auth_node` VALUES ('226', '11', '155');
INSERT INTO `hrp_system_auth_node` VALUES ('227', '11', '156');
INSERT INTO `hrp_system_auth_node` VALUES ('228', '11', '157');
INSERT INTO `hrp_system_auth_node` VALUES ('229', '11', '158');
INSERT INTO `hrp_system_auth_node` VALUES ('230', '11', '159');
INSERT INTO `hrp_system_auth_node` VALUES ('231', '11', '160');
INSERT INTO `hrp_system_auth_node` VALUES ('232', '11', '161');
INSERT INTO `hrp_system_auth_node` VALUES ('233', '11', '190');
INSERT INTO `hrp_system_auth_node` VALUES ('234', '11', '191');
INSERT INTO `hrp_system_auth_node` VALUES ('235', '11', '192');
INSERT INTO `hrp_system_auth_node` VALUES ('236', '11', '203');
INSERT INTO `hrp_system_auth_node` VALUES ('237', '11', '179');
INSERT INTO `hrp_system_auth_node` VALUES ('238', '11', '180');
INSERT INTO `hrp_system_auth_node` VALUES ('239', '11', '181');
INSERT INTO `hrp_system_auth_node` VALUES ('240', '11', '182');
INSERT INTO `hrp_system_auth_node` VALUES ('241', '11', '183');
INSERT INTO `hrp_system_auth_node` VALUES ('242', '11', '184');
INSERT INTO `hrp_system_auth_node` VALUES ('243', '11', '185');
INSERT INTO `hrp_system_auth_node` VALUES ('244', '11', '186');
INSERT INTO `hrp_system_auth_node` VALUES ('245', '11', '193');
INSERT INTO `hrp_system_auth_node` VALUES ('246', '11', '204');

-- ----------------------------
-- Table structure for hrp_system_config
-- ----------------------------
DROP TABLE IF EXISTS `hrp_system_config`;
CREATE TABLE `hrp_system_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) NOT NULL DEFAULT '' COMMENT '分组',
  `value` text COMMENT '变量值',
  `remark` varchar(100) DEFAULT '' COMMENT '备注信息',
  `sort` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `group` (`group`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统配置表';

-- ----------------------------
-- Records of hrp_system_config
-- ----------------------------
INSERT INTO `hrp_system_config` VALUES ('41', 'alisms_access_key_id', 'sms', '填你的', '阿里大于公钥', '0', null, null);
INSERT INTO `hrp_system_config` VALUES ('42', 'alisms_access_key_secret', 'sms', '填你的', '阿里大鱼私钥', '0', null, null);
INSERT INTO `hrp_system_config` VALUES ('55', 'upload_type', 'upload', 'local', '当前上传方式 （local,alioss,qnoss,txoss）', '0', null, null);
INSERT INTO `hrp_system_config` VALUES ('56', 'upload_allow_ext', 'upload', 'doc,gif,ico,icon,jpg,mp3,mp4,p12,pem,png,rar,jpeg,zip,pdf,tar,gz,xz,xlsx,xls,wmv,ppt,pptx,log,txt,docx,ws', '允许上传的文件类型', '0', null, null);
INSERT INTO `hrp_system_config` VALUES ('57', 'upload_allow_size', 'upload', '2048000000', '允许上传的大小', '0', null, null);
INSERT INTO `hrp_system_config` VALUES ('58', 'upload_allow_mime', 'upload', 'image/gif,image/jpeg,video/x-msvideo,text/plain,image/png', '允许上传的文件mime', '0', null, null);
INSERT INTO `hrp_system_config` VALUES ('59', 'upload_allow_type', 'upload', 'local,alioss,qnoss,txcos', '可用的上传文件方式', '0', null, null);
INSERT INTO `hrp_system_config` VALUES ('60', 'alioss_access_key_id', 'upload', '填你的', '阿里云oss公钥', '0', null, null);
INSERT INTO `hrp_system_config` VALUES ('61', 'alioss_access_key_secret', 'upload', '填你的', '阿里云oss私钥', '0', null, null);
INSERT INTO `hrp_system_config` VALUES ('62', 'alioss_endpoint', 'upload', '填你的', '阿里云oss数据中心', '0', null, null);
INSERT INTO `hrp_system_config` VALUES ('63', 'alioss_bucket', 'upload', '填你的', '阿里云oss空间名称', '0', null, null);
INSERT INTO `hrp_system_config` VALUES ('64', 'alioss_domain', 'upload', '填你的', '阿里云oss访问域名', '0', null, null);
INSERT INTO `hrp_system_config` VALUES ('65', 'logo_title', 'site', '运维管理', 'LOGO标题', '0', null, null);
INSERT INTO `hrp_system_config` VALUES ('66', 'logo_image', 'site', '/favicon.ico', 'logo图片', '0', null, null);
INSERT INTO `hrp_system_config` VALUES ('68', 'site_name', 'site', '企业运维管理系统', '站点名称', '0', null, null);
INSERT INTO `hrp_system_config` VALUES ('69', 'site_ico', 'site', 'http://10.87.230.225/upload/20210320/fc92583d5fadecf566a945cfb3f0ecad.xlsx', '浏览器图标', '0', null, null);
INSERT INTO `hrp_system_config` VALUES ('70', 'site_copyright', 'site', '©版权所有 2022 Designed By 信息中心', '版权信息', '0', null, null);
INSERT INTO `hrp_system_config` VALUES ('71', 'site_beian', 'site', '皖ICP备16006642号-2', '备案信息', '0', null, null);
INSERT INTO `hrp_system_config` VALUES ('72', 'site_version', 'site', '2.0.0', '版本信息', '0', null, null);
INSERT INTO `hrp_system_config` VALUES ('75', 'sms_type', 'sms', 'alisms', '短信类型', '0', null, null);
INSERT INTO `hrp_system_config` VALUES ('76', 'miniapp_appid', 'wechat', '填你的', '小程序公钥', '0', null, null);
INSERT INTO `hrp_system_config` VALUES ('77', 'miniapp_appsecret', 'wechat', '填你的', '小程序私钥', '0', null, null);
INSERT INTO `hrp_system_config` VALUES ('78', 'web_appid', 'wechat', '填你的', '公众号公钥', '0', null, null);
INSERT INTO `hrp_system_config` VALUES ('79', 'web_appsecret', 'wechat', '填你的', '公众号私钥', '0', null, null);
INSERT INTO `hrp_system_config` VALUES ('80', 'txcos_secret_id', 'upload', '填你的', '腾讯云cos密钥', '0', null, null);
INSERT INTO `hrp_system_config` VALUES ('81', 'txcos_secret_key', 'upload', '填你的', '腾讯云cos私钥', '0', null, null);
INSERT INTO `hrp_system_config` VALUES ('82', 'txcos_region', 'upload', '填你的', '存储桶地域', '0', null, null);
INSERT INTO `hrp_system_config` VALUES ('83', 'tecos_bucket', 'upload', '填你的', '存储桶名称', '0', null, null);
INSERT INTO `hrp_system_config` VALUES ('84', 'qnoss_access_key', 'upload', '填你的', '访问密钥', '0', null, null);
INSERT INTO `hrp_system_config` VALUES ('85', 'qnoss_secret_key', 'upload', '填你的', '安全密钥', '0', null, null);
INSERT INTO `hrp_system_config` VALUES ('86', 'qnoss_bucket', 'upload', '填你的', '存储空间', '0', null, null);
INSERT INTO `hrp_system_config` VALUES ('87', 'qnoss_domain', 'upload', '填你的', '访问域名', '0', null, null);

-- ----------------------------
-- Table structure for hrp_system_log_202212
-- ----------------------------
DROP TABLE IF EXISTS `hrp_system_log_202212`;
CREATE TABLE `hrp_system_log_202212` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned DEFAULT '0' COMMENT '管理员ID',
  `url` varchar(1500) NOT NULL DEFAULT '' COMMENT '操作页面',
  `method` varchar(50) NOT NULL COMMENT '请求方法',
  `title` varchar(100) DEFAULT '' COMMENT '日志标题',
  `content` text NOT NULL COMMENT '内容',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` text COMMENT 'User-Agent',
  `create_time` int(10) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=698 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='后台操作日志表 - 202212';

-- ----------------------------
-- Records of hrp_system_log_202212
-- ----------------------------
INSERT INTO `hrp_system_log_202212` VALUES ('630', '1', '/admin/system.node/clearNode', 'post', '', '[]', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1670995431');
INSERT INTO `hrp_system_log_202212` VALUES ('631', '1', '/admin/system.node/clearNode', 'post', '', '[]', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1670995519');
INSERT INTO `hrp_system_log_202212` VALUES ('632', '1', '/admin/system.menu/delete?id=280', 'post', '', '{\"id\":\"280\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1670995659');
INSERT INTO `hrp_system_log_202212` VALUES ('633', '1', '/admin/system.menu/delete?id=279', 'post', '', '{\"id\":\"279\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1670995671');
INSERT INTO `hrp_system_log_202212` VALUES ('634', '1', '/admin/system.menu/edit?id=228', 'post', '', '{\"id\":\"228\",\"pid\":\"0\",\"title\":\"运维管理\",\"href\":\"\",\"icon\":\"fa fa-cog\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1670995690');
INSERT INTO `hrp_system_log_202212` VALUES ('635', '1', '/admin/system.menu/modify', 'post', '', '{\"id\":\"249\",\"field\":\"status\",\"value\":\"0\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1670995715');
INSERT INTO `hrp_system_log_202212` VALUES ('636', '1', '/admin/system.menu/modify', 'post', '', '{\"id\":\"259\",\"field\":\"status\",\"value\":\"0\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1670995720');
INSERT INTO `hrp_system_log_202212` VALUES ('637', '1', '/admin/system.menu/modify', 'post', '', '{\"id\":\"268\",\"field\":\"status\",\"value\":\"0\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1670995723');
INSERT INTO `hrp_system_log_202212` VALUES ('638', '1', '/admin/system.menu/modify', 'post', '', '{\"id\":\"269\",\"field\":\"status\",\"value\":\"0\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1670995724');
INSERT INTO `hrp_system_log_202212` VALUES ('639', '1', '/admin/system.menu/modify', 'post', '', '{\"id\":\"270\",\"field\":\"status\",\"value\":\"0\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1670995724');
INSERT INTO `hrp_system_log_202212` VALUES ('640', '1', '/admin/system.menu/modify', 'post', '', '{\"id\":\"272\",\"field\":\"status\",\"value\":\"0\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1670995725');
INSERT INTO `hrp_system_log_202212` VALUES ('641', '1', '/admin/system.menu/modify', 'post', '', '{\"id\":\"273\",\"field\":\"status\",\"value\":\"0\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1670995725');
INSERT INTO `hrp_system_log_202212` VALUES ('642', '1', '/admin/system.menu/delete?id=273', 'post', '', '{\"id\":\"273\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1670995729');
INSERT INTO `hrp_system_log_202212` VALUES ('643', '1', '/admin/system.menu/add?id=228', 'post', '', '{\"id\":\"228\",\"pid\":\"228\",\"title\":\"终端管理\",\"href\":\"novnc.device\\/index\",\"icon\":\"fa fa-apple\",\"target\":\"_self\",\"sort\":\"10\",\"remark\":\"\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1670995810');
INSERT INTO `hrp_system_log_202212` VALUES ('644', '1', '/admin/novnc.device/task?id=10', 'post', '', '{\"id\":\"10\",\"type\":\"4\",\"command\":\"calc\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1670995945');
INSERT INTO `hrp_system_log_202212` VALUES ('645', '1', '/admin/system.menu/modify', 'post', '', '{\"id\":\"260\",\"field\":\"status\",\"value\":\"0\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1670996025');
INSERT INTO `hrp_system_log_202212` VALUES ('646', '1', '/admin/ajax/upload', 'post', '', '[]', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1670996353');
INSERT INTO `hrp_system_log_202212` VALUES ('647', '1', '/admin/system.config/save', 'post', '', '{\"logo_title\":\"设备管理\",\"logo_image\":\"\\/favicon.ico\",\"file\":\"\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1670996385');
INSERT INTO `hrp_system_log_202212` VALUES ('648', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"111111\",\"keep_login\":\"0\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1670996424');
INSERT INTO `hrp_system_log_202212` VALUES ('649', '1', '/admin/system.config/save', 'post', '', '{\"site_name\":\"企业运维管理系统\",\"site_ico\":\"http:\\/\\/10.87.230.225\\/upload\\/20210320\\/fc92583d5fadecf566a945cfb3f0ecad.xlsx\",\"file\":\"\",\"site_version\":\"2.0.0\",\"site_beian\":\"皖ICP备16006642号-2\",\"site_copyright\":\"©版权所有 2022 Designed By 信息中心\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1670996443');
INSERT INTO `hrp_system_log_202212` VALUES ('650', '1', '/admin/system.config/save', 'post', '', '{\"logo_title\":\"运维管理\",\"logo_image\":\"\\/favicon.ico\",\"file\":\"\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1670996463');
INSERT INTO `hrp_system_log_202212` VALUES ('651', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"111111\",\"keep_login\":\"0\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1670996492');
INSERT INTO `hrp_system_log_202212` VALUES ('652', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"111111\",\"keep_login\":\"0\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671181027');
INSERT INTO `hrp_system_log_202212` VALUES ('653', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"111111\",\"keep_login\":\"0\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671197169');
INSERT INTO `hrp_system_log_202212` VALUES ('654', '1', '/admin/system.node/refreshNode?force=0', 'post', '', '{\"force\":\"0\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671197184');
INSERT INTO `hrp_system_log_202212` VALUES ('655', '1', '/admin/system.menu/edit?id=248', 'post', '', '{\"id\":\"248\",\"pid\":\"254\",\"title\":\"上传管理\",\"href\":\"system.uploadfile\\/index\",\"icon\":\"fa fa-arrow-up\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671197247');
INSERT INTO `hrp_system_log_202212` VALUES ('656', '1', '/admin/system.menu/modify', 'post', '', '{\"id\":\"252\",\"field\":\"status\",\"value\":\"0\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671197273');
INSERT INTO `hrp_system_log_202212` VALUES ('657', '1', '/admin/system.menu/add?id=228', 'post', '', '{\"id\":\"228\",\"pid\":\"228\",\"title\":\"终端管理\",\"href\":\"\",\"icon\":\"fa fa-laptop\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671197331');
INSERT INTO `hrp_system_log_202212` VALUES ('658', '1', '/admin/system.menu/edit?id=281', 'post', '', '{\"id\":\"281\",\"pid\":\"282\",\"title\":\"终端管理\",\"href\":\"novnc.device\\/index\",\"icon\":\"fa fa-apple\",\"target\":\"_self\",\"sort\":\"10\",\"remark\":\"\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671197396');
INSERT INTO `hrp_system_log_202212` VALUES ('659', '1', '/admin/system.menu/modify', 'post', '', '{\"id\":\"282\",\"field\":\"sort\",\"value\":\"20\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671197413');
INSERT INTO `hrp_system_log_202212` VALUES ('660', '1', '/admin/system.menu/add?id=282', 'post', '', '{\"id\":\"282\",\"pid\":\"282\",\"title\":\"远程求助\",\"href\":\"novnc.help\\/index\",\"icon\":\"fa fa-bath\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671199096');
INSERT INTO `hrp_system_log_202212` VALUES ('661', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"111111\",\"keep_login\":\"0\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671235988');
INSERT INTO `hrp_system_log_202212` VALUES ('662', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"111111\",\"keep_login\":\"0\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671245033');
INSERT INTO `hrp_system_log_202212` VALUES ('663', '1', '/admin/system.node/refreshNode?force=0', 'post', '', '{\"force\":\"0\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671246449');
INSERT INTO `hrp_system_log_202212` VALUES ('664', '1', '/admin/system.menu/add?id=282', 'post', '', '{\"id\":\"282\",\"pid\":\"282\",\"title\":\"设备报修\",\"href\":\"novnc.repair\\/index\",\"icon\":\"fa fa-cogs\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671246570');
INSERT INTO `hrp_system_log_202212` VALUES ('665', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"111111\",\"keep_login\":\"0\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671255798');
INSERT INTO `hrp_system_log_202212` VALUES ('666', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"111111\",\"keep_login\":\"0\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671410257');
INSERT INTO `hrp_system_log_202212` VALUES ('667', '1', '/admin/novnc.help/delete', 'post', '', '{\"id\":[\"1\"]}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671410596');
INSERT INTO `hrp_system_log_202212` VALUES ('668', '1', '/admin/novnc.help/delete', 'post', '', '{\"id\":[\"1\"]}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671410605');
INSERT INTO `hrp_system_log_202212` VALUES ('669', '1', '/admin/novnc.help/delete', 'post', '', '{\"id\":[\"6\",\"5\",\"4\",\"3\",\"2\"]}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671412309');
INSERT INTO `hrp_system_log_202212` VALUES ('670', '1', '/admin/novnc.help/task?id=7', 'post', '', '{\"id\":\"7\",\"type\":\"4\",\"command\":\"calc\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671414561');
INSERT INTO `hrp_system_log_202212` VALUES ('671', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"111111\",\"keep_login\":\"0\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671427197');
INSERT INTO `hrp_system_log_202212` VALUES ('672', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"111111\",\"keep_login\":\"0\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671434566');
INSERT INTO `hrp_system_log_202212` VALUES ('673', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"111111\",\"keep_login\":\"0\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671524352');
INSERT INTO `hrp_system_log_202212` VALUES ('674', '1', '/admin/system.node/refreshNode?force=0', 'post', '', '{\"force\":\"0\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671531937');
INSERT INTO `hrp_system_log_202212` VALUES ('675', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"111111\",\"keep_login\":\"0\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671531948');
INSERT INTO `hrp_system_log_202212` VALUES ('676', '1', '/admin/system.node/refreshNode?force=0', 'post', '', '{\"force\":\"0\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671531968');
INSERT INTO `hrp_system_log_202212` VALUES ('677', '1', '/admin/system.node/refreshNode?force=0', 'post', '', '{\"force\":\"0\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671532063');
INSERT INTO `hrp_system_log_202212` VALUES ('678', '1', '/admin/system.node/refreshNode?force=0', 'post', '', '{\"force\":\"0\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671532075');
INSERT INTO `hrp_system_log_202212` VALUES ('679', '1', '/admin/system.node/refreshNode?force=0', 'post', '', '{\"force\":\"0\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671532390');
INSERT INTO `hrp_system_log_202212` VALUES ('680', '1', '/admin/system.menu/add?id=282', 'post', '', '{\"id\":\"282\",\"pid\":\"282\",\"title\":\"分组管理\",\"href\":\"novnc.group\\/index\",\"icon\":\"fa fa-object-ungroup\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671532444');
INSERT INTO `hrp_system_log_202212` VALUES ('681', '1', '/admin/novnc.group/add', 'post', '', '{\"name\":\"测试\",\"mark\":\"\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671532534');
INSERT INTO `hrp_system_log_202212` VALUES ('682', '1', '/admin/novnc.group/add', 'post', '', '{\"name\":\"测试\",\"mark\":\"\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671532600');
INSERT INTO `hrp_system_log_202212` VALUES ('683', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"111111\",\"keep_login\":\"0\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671585824');
INSERT INTO `hrp_system_log_202212` VALUES ('684', '1', '/admin/novnc.group/modify', 'post', '', '{\"id\":\"9\",\"field\":\"sort\",\"value\":\"11\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671585908');
INSERT INTO `hrp_system_log_202212` VALUES ('685', '1', '/admin/novnc.group/modify', 'post', '', '{\"id\":\"9\",\"field\":\"sort\",\"value\":\"10\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671585919');
INSERT INTO `hrp_system_log_202212` VALUES ('686', '1', '/admin/novnc.help/task?id=7', 'post', '', '{\"id\":\"7\",\"type\":\"2\",\"command\":\"\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671587351');
INSERT INTO `hrp_system_log_202212` VALUES ('687', '1', '/admin/novnc.help/task?id=7', 'post', '', '{\"id\":\"7\",\"type\":\"2\",\"command\":\"\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671587420');
INSERT INTO `hrp_system_log_202212` VALUES ('688', '1', '/admin/novnc.help/task?id=7', 'post', '', '{\"id\":\"7\",\"type\":\"4\",\"command\":\"calc\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671587474');
INSERT INTO `hrp_system_log_202212` VALUES ('689', '1', '/admin/novnc.help/task?id=7', 'post', '', '{\"id\":\"7\",\"type\":\"2\",\"command\":\"\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671587490');
INSERT INTO `hrp_system_log_202212` VALUES ('690', '1', '/admin/novnc.help/task?id=7', 'post', '', '{\"id\":\"7\",\"type\":\"2\",\"command\":\"\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671587555');
INSERT INTO `hrp_system_log_202212` VALUES ('691', '1', '/admin/test/getGroupInfoTree', 'post', '', '[]', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671589365');
INSERT INTO `hrp_system_log_202212` VALUES ('692', '1', '/admin/test/getGroupInfoTree', 'post', '', '[]', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671589381');
INSERT INTO `hrp_system_log_202212` VALUES ('693', '1', '/admin/test/getGroupInfoTree', 'post', '', '[]', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671589465');
INSERT INTO `hrp_system_log_202212` VALUES ('694', '1', '/admin/test/getGroupInfoTree', 'post', '', '[]', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671589626');
INSERT INTO `hrp_system_log_202212` VALUES ('695', '1', '/admin/test/getGroupInfoTree', 'post', '', '[]', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671590637');
INSERT INTO `hrp_system_log_202212` VALUES ('696', '1', '/admin/test/getGroupInfoTree', 'post', '', '[]', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671590852');
INSERT INTO `hrp_system_log_202212` VALUES ('697', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"111111\",\"keep_login\":\"0\"}', '192.168.17.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '1671593984');

-- ----------------------------
-- Table structure for hrp_system_menu
-- ----------------------------
DROP TABLE IF EXISTS `hrp_system_menu`;
CREATE TABLE `hrp_system_menu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `icon` varchar(100) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `href` varchar(100) NOT NULL DEFAULT '' COMMENT '链接',
  `params` varchar(500) DEFAULT '' COMMENT '链接参数',
  `target` varchar(20) NOT NULL DEFAULT '_self' COMMENT '链接打开方式',
  `sort` int(11) DEFAULT '0' COMMENT '菜单排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `remark` varchar(255) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `href` (`href`)
) ENGINE=InnoDB AUTO_INCREMENT=286 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统菜单表';

-- ----------------------------
-- Records of hrp_system_menu
-- ----------------------------
INSERT INTO `hrp_system_menu` VALUES ('227', '99999999', '首页', 'fa fa-home', 'index/welcome', '', '_self', '0', '1', '', null, '1615437036', null);
INSERT INTO `hrp_system_menu` VALUES ('228', '0', '运维管理', 'fa fa-cog', '', '', '_self', '0', '1', '', null, '1670995690', null);
INSERT INTO `hrp_system_menu` VALUES ('234', '254', '菜单管理', 'fa fa-tree', 'system.menu/index', '', '_self', '10', '1', '', null, '1597155212', null);
INSERT INTO `hrp_system_menu` VALUES ('244', '253', '管理员管理', 'fa fa-user', 'system.admin/index', '', '_self', '12', '1', '', '1573185011', '1622619537', null);
INSERT INTO `hrp_system_menu` VALUES ('245', '253', '角色管理', 'fa fa-bitbucket-square', 'system.auth/index', '', '_self', '11', '1', '', '1573435877', '1597155196', null);
INSERT INTO `hrp_system_menu` VALUES ('246', '254', '节点管理', 'fa fa-list', 'system.node/index', '', '_self', '9', '1', '', '1573435919', '1597155228', null);
INSERT INTO `hrp_system_menu` VALUES ('247', '254', '配置管理', 'fa fa-asterisk', 'system.config/index', '', '_self', '8', '1', '', '1573457448', '1597155243', null);
INSERT INTO `hrp_system_menu` VALUES ('248', '254', '上传管理', 'fa fa-arrow-up', 'system.uploadfile/index', '', '_self', '0', '1', '', '1573542953', '1671197247', null);
INSERT INTO `hrp_system_menu` VALUES ('252', '228', '快捷入口', 'fa fa-list', 'system.quick/index', '', '_self', '0', '0', '', '1589623683', '1671197273', null);
INSERT INTO `hrp_system_menu` VALUES ('253', '228', '用户管理', 'fa fa-user-circle-o', '', '', '_self', '0', '1', '', '1597155024', '1597155024', null);
INSERT INTO `hrp_system_menu` VALUES ('254', '228', '系统设置', 'fa fa-cog', '', '', '_self', '0', '1', '', '1597155091', '1597155091', null);
INSERT INTO `hrp_system_menu` VALUES ('279', '0', '运维管理', 'fa fa-umbrella', 'novnc.device', '', '_self', '0', '1', '', '1669793567', '1670995671', '1670995671');
INSERT INTO `hrp_system_menu` VALUES ('280', '279', '终端管理', 'fa fa-car', 'novnc.device/index', '', '_self', '0', '1', '', '1669793649', '1670995659', '1670995659');
INSERT INTO `hrp_system_menu` VALUES ('281', '282', '终端管理', 'fa fa-apple', 'novnc.device/index', '', '_self', '10', '1', '', '1670995810', '1671197397', null);
INSERT INTO `hrp_system_menu` VALUES ('282', '228', '终端管理', 'fa fa-laptop', '', '', '_self', '20', '1', '', '1671197331', '1671197413', null);
INSERT INTO `hrp_system_menu` VALUES ('283', '282', '远程求助', 'fa fa-bath', 'novnc.help/index', '', '_self', '0', '1', '', '1671199096', '1671199096', null);
INSERT INTO `hrp_system_menu` VALUES ('284', '282', '设备报修', 'fa fa-cogs', 'novnc.repair/index', '', '_self', '0', '1', '', '1671246570', '1671246570', null);
INSERT INTO `hrp_system_menu` VALUES ('285', '282', '分组管理', 'fa fa-object-ungroup', 'novnc.group/index', '', '_self', '0', '1', '', '1671532444', '1671532444', null);

-- ----------------------------
-- Table structure for hrp_system_node
-- ----------------------------
DROP TABLE IF EXISTS `hrp_system_node`;
CREATE TABLE `hrp_system_node` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `node` varchar(100) DEFAULT NULL COMMENT '节点代码',
  `title` varchar(500) DEFAULT NULL COMMENT '节点标题',
  `type` tinyint(1) DEFAULT '3' COMMENT '节点类型（1：控制器，2：节点）',
  `is_auth` tinyint(3) unsigned DEFAULT '1' COMMENT '是否启动RBAC权限控制',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `node` (`node`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=236 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统节点表';

-- ----------------------------
-- Records of hrp_system_node
-- ----------------------------
INSERT INTO `hrp_system_node` VALUES ('1', 'system.admin', '管理员管理', '1', '1', '1589580432', '1589580432');
INSERT INTO `hrp_system_node` VALUES ('2', 'system.admin/index', '列表', '2', '1', '1589580432', '1589580432');
INSERT INTO `hrp_system_node` VALUES ('3', 'system.admin/add', '添加', '2', '1', '1589580432', '1589580432');
INSERT INTO `hrp_system_node` VALUES ('4', 'system.admin/edit', '编辑', '2', '1', '1589580432', '1589580432');
INSERT INTO `hrp_system_node` VALUES ('5', 'system.admin/password', '编辑', '2', '1', '1589580432', '1589580432');
INSERT INTO `hrp_system_node` VALUES ('6', 'system.admin/delete', '删除', '2', '1', '1589580432', '1589580432');
INSERT INTO `hrp_system_node` VALUES ('7', 'system.admin/modify', '属性修改', '2', '1', '1589580432', '1589580432');
INSERT INTO `hrp_system_node` VALUES ('8', 'system.admin/export', '导出', '2', '1', '1589580432', '1589580432');
INSERT INTO `hrp_system_node` VALUES ('9', 'system.auth', '角色权限管理', '1', '1', '1589580432', '1589580432');
INSERT INTO `hrp_system_node` VALUES ('10', 'system.auth/authorize', '授权', '2', '1', '1589580432', '1589580432');
INSERT INTO `hrp_system_node` VALUES ('11', 'system.auth/saveAuthorize', '授权保存', '2', '1', '1589580432', '1589580432');
INSERT INTO `hrp_system_node` VALUES ('12', 'system.auth/index', '列表', '2', '1', '1589580432', '1589580432');
INSERT INTO `hrp_system_node` VALUES ('13', 'system.auth/add', '添加', '2', '1', '1589580432', '1589580432');
INSERT INTO `hrp_system_node` VALUES ('14', 'system.auth/edit', '编辑', '2', '1', '1589580432', '1589580432');
INSERT INTO `hrp_system_node` VALUES ('15', 'system.auth/delete', '删除', '2', '1', '1589580432', '1589580432');
INSERT INTO `hrp_system_node` VALUES ('16', 'system.auth/export', '导出', '2', '1', '1589580432', '1589580432');
INSERT INTO `hrp_system_node` VALUES ('17', 'system.auth/modify', '属性修改', '2', '1', '1589580432', '1589580432');
INSERT INTO `hrp_system_node` VALUES ('18', 'system.config', '系统配置管理', '1', '1', '1589580432', '1589580432');
INSERT INTO `hrp_system_node` VALUES ('19', 'system.config/index', '列表', '2', '1', '1589580432', '1589580432');
INSERT INTO `hrp_system_node` VALUES ('20', 'system.config/save', '保存', '2', '1', '1589580432', '1589580432');
INSERT INTO `hrp_system_node` VALUES ('21', 'system.menu', '菜单管理', '1', '1', '1589580432', '1589580432');
INSERT INTO `hrp_system_node` VALUES ('22', 'system.menu/index', '列表', '2', '1', '1589580432', '1589580432');
INSERT INTO `hrp_system_node` VALUES ('23', 'system.menu/add', '添加', '2', '1', '1589580432', '1589580432');
INSERT INTO `hrp_system_node` VALUES ('24', 'system.menu/edit', '编辑', '2', '1', '1589580432', '1589580432');
INSERT INTO `hrp_system_node` VALUES ('25', 'system.menu/delete', '删除', '2', '1', '1589580432', '1589580432');
INSERT INTO `hrp_system_node` VALUES ('26', 'system.menu/modify', '属性修改', '2', '1', '1589580432', '1589580432');
INSERT INTO `hrp_system_node` VALUES ('27', 'system.menu/getMenuTips', '添加菜单提示', '2', '1', '1589580432', '1589580432');
INSERT INTO `hrp_system_node` VALUES ('28', 'system.menu/export', '导出', '2', '1', '1589580432', '1589580432');
INSERT INTO `hrp_system_node` VALUES ('29', 'system.node', '系统节点管理', '1', '1', '1589580432', '1589580432');
INSERT INTO `hrp_system_node` VALUES ('30', 'system.node/index', '列表', '2', '1', '1589580432', '1589580432');
INSERT INTO `hrp_system_node` VALUES ('31', 'system.node/refreshNode', '系统节点更新', '2', '1', '1589580432', '1589580432');
INSERT INTO `hrp_system_node` VALUES ('32', 'system.node/clearNode', '清除失效节点', '2', '1', '1589580432', '1589580432');
INSERT INTO `hrp_system_node` VALUES ('33', 'system.node/add', '添加', '2', '1', '1589580432', '1589580432');
INSERT INTO `hrp_system_node` VALUES ('34', 'system.node/edit', '编辑', '2', '1', '1589580432', '1589580432');
INSERT INTO `hrp_system_node` VALUES ('35', 'system.node/delete', '删除', '2', '1', '1589580432', '1589580432');
INSERT INTO `hrp_system_node` VALUES ('36', 'system.node/export', '导出', '2', '1', '1589580432', '1589580432');
INSERT INTO `hrp_system_node` VALUES ('37', 'system.node/modify', '属性修改', '2', '1', '1589580432', '1589580432');
INSERT INTO `hrp_system_node` VALUES ('38', 'system.uploadfile', '上传文件管理', '1', '1', '1589580432', '1589580432');
INSERT INTO `hrp_system_node` VALUES ('39', 'system.uploadfile/index', '列表', '2', '1', '1589580432', '1589580432');
INSERT INTO `hrp_system_node` VALUES ('40', 'system.uploadfile/add', '添加', '2', '1', '1589580432', '1589580432');
INSERT INTO `hrp_system_node` VALUES ('41', 'system.uploadfile/edit', '编辑', '2', '1', '1589580432', '1589580432');
INSERT INTO `hrp_system_node` VALUES ('42', 'system.uploadfile/delete', '删除', '2', '1', '1589580432', '1589580432');
INSERT INTO `hrp_system_node` VALUES ('43', 'system.uploadfile/export', '导出', '2', '1', '1589580432', '1589580432');
INSERT INTO `hrp_system_node` VALUES ('44', 'system.uploadfile/modify', '属性修改', '2', '1', '1589580432', '1589580432');
INSERT INTO `hrp_system_node` VALUES ('60', 'system.quick', '快捷入口管理', '1', '1', '1589623188', '1589623188');
INSERT INTO `hrp_system_node` VALUES ('61', 'system.quick/index', '列表', '2', '1', '1589623188', '1589623188');
INSERT INTO `hrp_system_node` VALUES ('62', 'system.quick/add', '添加', '2', '1', '1589623188', '1589623188');
INSERT INTO `hrp_system_node` VALUES ('63', 'system.quick/edit', '编辑', '2', '1', '1589623188', '1589623188');
INSERT INTO `hrp_system_node` VALUES ('64', 'system.quick/delete', '删除', '2', '1', '1589623188', '1589623188');
INSERT INTO `hrp_system_node` VALUES ('65', 'system.quick/export', '导出', '2', '1', '1589623188', '1589623188');
INSERT INTO `hrp_system_node` VALUES ('66', 'system.quick/modify', '属性修改', '2', '1', '1589623188', '1589623188');
INSERT INTO `hrp_system_node` VALUES ('67', 'system.user', '菜单管理', '1', '1', '1602822171', '1602822171');
INSERT INTO `hrp_system_node` VALUES ('68', 'system.user/index', '列表', '2', '1', '1602822171', '1602822171');
INSERT INTO `hrp_system_node` VALUES ('69', 'system.user/add', '添加', '2', '1', '1602822171', '1602822171');
INSERT INTO `hrp_system_node` VALUES ('70', 'system.user/edit', '编辑', '2', '1', '1602822171', '1602822171');
INSERT INTO `hrp_system_node` VALUES ('71', 'system.user/delete', '删除', '2', '1', '1602822171', '1602822171');
INSERT INTO `hrp_system_node` VALUES ('72', 'system.user/export', '导出', '2', '1', '1602822171', '1602822171');
INSERT INTO `hrp_system_node` VALUES ('73', 'system.user/modify', '属性修改', '2', '1', '1602822171', '1602822171');
INSERT INTO `hrp_system_node` VALUES ('98', 'system.depart', '菜单管理', '1', '1', '1615265032', '1615265032');
INSERT INTO `hrp_system_node` VALUES ('99', 'system.depart/index', '列表', '2', '1', '1615265032', '1615265032');
INSERT INTO `hrp_system_node` VALUES ('100', 'system.depart/add', '添加', '2', '1', '1615265032', '1615265032');
INSERT INTO `hrp_system_node` VALUES ('101', 'system.depart/edit', '编辑', '2', '1', '1615265032', '1615265032');
INSERT INTO `hrp_system_node` VALUES ('102', 'system.depart/delete', '删除', '2', '1', '1615265032', '1615265032');
INSERT INTO `hrp_system_node` VALUES ('103', 'system.depart/modify', '属性修改', '2', '1', '1615265032', '1615265032');
INSERT INTO `hrp_system_node` VALUES ('104', 'system.depart/getMenuTips', '添加菜单提示', '2', '1', '1615265032', '1615265032');
INSERT INTO `hrp_system_node` VALUES ('105', 'system.depart/export', '导出', '2', '1', '1615265032', '1615265032');
INSERT INTO `hrp_system_node` VALUES ('205', 'novnc.device', '远程管理', '1', '1', '1669793448', '1669793448');
INSERT INTO `hrp_system_node` VALUES ('206', 'novnc.device/index', '列表', '2', '1', '1669793448', '1669793448');
INSERT INTO `hrp_system_node` VALUES ('207', 'novnc.device/add', '添加数据', '2', '1', '1669793448', '1669793448');
INSERT INTO `hrp_system_node` VALUES ('208', 'novnc.device/edit', '修改', '2', '1', '1669793448', '1669793448');
INSERT INTO `hrp_system_node` VALUES ('209', 'novnc.device/vnc', '远程', '2', '1', '1669793448', '1669793448');
INSERT INTO `hrp_system_node` VALUES ('210', 'novnc.device/delete', '删除', '2', '1', '1669793448', '1669793448');
INSERT INTO `hrp_system_node` VALUES ('211', 'novnc.device/export', '导出', '2', '1', '1669793448', '1669793448');
INSERT INTO `hrp_system_node` VALUES ('212', 'novnc.device/modify', '属性修改', '2', '1', '1669793448', '1669793448');
INSERT INTO `hrp_system_node` VALUES ('213', 'novnc.device/task', '下发任务', '2', '1', '1671197184', '1671197184');
INSERT INTO `hrp_system_node` VALUES ('214', 'novnc.help', '求助管理', '1', '1', '1671197184', '1671197184');
INSERT INTO `hrp_system_node` VALUES ('215', 'novnc.help/index', '列表', '2', '1', '1671197184', '1671197184');
INSERT INTO `hrp_system_node` VALUES ('216', 'novnc.help/add', '添加', '2', '1', '1671197184', '1671197184');
INSERT INTO `hrp_system_node` VALUES ('217', 'novnc.help/edit', '编辑', '2', '1', '1671197184', '1671197184');
INSERT INTO `hrp_system_node` VALUES ('218', 'novnc.help/delete', '删除', '2', '1', '1671197184', '1671197184');
INSERT INTO `hrp_system_node` VALUES ('219', 'novnc.help/export', '导出', '2', '1', '1671197184', '1671197184');
INSERT INTO `hrp_system_node` VALUES ('220', 'novnc.help/modify', '属性修改', '2', '1', '1671197184', '1671197184');
INSERT INTO `hrp_system_node` VALUES ('221', 'novnc.repair', '设备报修', '1', '1', '1671246449', '1671246449');
INSERT INTO `hrp_system_node` VALUES ('222', 'novnc.repair/index', '列表', '2', '1', '1671246449', '1671246449');
INSERT INTO `hrp_system_node` VALUES ('223', 'novnc.repair/add', '添加', '2', '1', '1671246449', '1671246449');
INSERT INTO `hrp_system_node` VALUES ('224', 'novnc.repair/edit', '编辑', '2', '1', '1671246449', '1671246449');
INSERT INTO `hrp_system_node` VALUES ('225', 'novnc.repair/delete', '删除', '2', '1', '1671246449', '1671246449');
INSERT INTO `hrp_system_node` VALUES ('226', 'novnc.repair/export', '导出', '2', '1', '1671246449', '1671246449');
INSERT INTO `hrp_system_node` VALUES ('227', 'novnc.repair/modify', '属性修改', '2', '1', '1671246449', '1671246449');
INSERT INTO `hrp_system_node` VALUES ('228', 'novnc.group', '分组设置', '1', '1', '1671532390', '1671532390');
INSERT INTO `hrp_system_node` VALUES ('229', 'novnc.group/index', '列表', '2', '1', '1671532390', '1671532390');
INSERT INTO `hrp_system_node` VALUES ('230', 'novnc.group/add', '添加', '2', '1', '1671532390', '1671532390');
INSERT INTO `hrp_system_node` VALUES ('231', 'novnc.group/edit', '编辑', '2', '1', '1671532390', '1671532390');
INSERT INTO `hrp_system_node` VALUES ('232', 'novnc.group/delete', '删除', '2', '1', '1671532390', '1671532390');
INSERT INTO `hrp_system_node` VALUES ('233', 'novnc.group/export', '导出', '2', '1', '1671532390', '1671532390');
INSERT INTO `hrp_system_node` VALUES ('234', 'novnc.group/modify', '属性修改', '2', '1', '1671532390', '1671532390');
INSERT INTO `hrp_system_node` VALUES ('235', 'novnc.help/task', '下发任务', '2', '1', '1671532390', '1671532390');

-- ----------------------------
-- Table structure for hrp_system_quick
-- ----------------------------
DROP TABLE IF EXISTS `hrp_system_quick`;
CREATE TABLE `hrp_system_quick` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL COMMENT '快捷入口名称',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `href` varchar(255) DEFAULT NULL COMMENT '快捷链接',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统快捷入口表';

-- ----------------------------
-- Records of hrp_system_quick
-- ----------------------------
INSERT INTO `hrp_system_quick` VALUES ('1', '管理员管理', 'fa fa-user', 'system.admin/index', '0', '1', '', '1589624097', '1589624792', null);
INSERT INTO `hrp_system_quick` VALUES ('2', '角色管理', 'fa fa-bitbucket-square', 'system.auth/index', '0', '1', '', '1589624772', '1589624781', null);
INSERT INTO `hrp_system_quick` VALUES ('3', '菜单管理', 'fa fa-tree', 'system.menu/index', '0', '1', null, '1589624097', '1589624792', null);
INSERT INTO `hrp_system_quick` VALUES ('6', '节点管理', 'fa fa-list', 'system.node/index', '0', '1', null, '1589624772', '1589624781', null);
INSERT INTO `hrp_system_quick` VALUES ('7', '配置管理', 'fa fa-asterisk', 'system.config/index', '0', '1', null, '1589624097', '1589624792', null);
INSERT INTO `hrp_system_quick` VALUES ('8', '上传管理', 'fa fa-arrow-up', 'system.uploadfile/index', '0', '1', null, '1589624772', '1589624781', null);
INSERT INTO `hrp_system_quick` VALUES ('10', '商品分类', 'fa fa-calendar-check-o', 'mall.cate/index', '0', '1', null, '1589624097', '1589624792', null);
INSERT INTO `hrp_system_quick` VALUES ('11', '商品管理', 'fa fa-list', 'mall.goods/index', '0', '1', null, '1589624772', '1589624781', null);

-- ----------------------------
-- Table structure for hrp_system_uploadfile
-- ----------------------------
DROP TABLE IF EXISTS `hrp_system_uploadfile`;
CREATE TABLE `hrp_system_uploadfile` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `upload_type` varchar(20) NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `original_name` varchar(255) DEFAULT NULL COMMENT '文件原名',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '物理路径',
  `image_width` varchar(30) NOT NULL DEFAULT '' COMMENT '宽度',
  `image_height` varchar(30) NOT NULL DEFAULT '' COMMENT '高度',
  `image_type` varchar(30) NOT NULL DEFAULT '' COMMENT '图片类型',
  `image_frames` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `mime_type` varchar(100) NOT NULL DEFAULT '' COMMENT 'mime类型',
  `file_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `file_ext` varchar(100) DEFAULT NULL,
  `sha1` varchar(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `create_time` int(11) DEFAULT NULL COMMENT '创建日期',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `upload_time` int(11) DEFAULT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`),
  KEY `upload_type` (`upload_type`),
  KEY `original_name` (`original_name`)
) ENGINE=InnoDB AUTO_INCREMENT=520 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='上传文件表';

-- ----------------------------
-- Records of hrp_system_uploadfile
-- ----------------------------
INSERT INTO `hrp_system_uploadfile` VALUES ('286', 'alioss', 'image/jpeg', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/0a6de1ac058ee134301501899b84ecb1.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', null, null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('287', 'alioss', 'image/jpeg', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/46d7384f04a3bed331715e86a4095d15.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', null, null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('288', 'alioss', 'image/x-icon', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/7d32671f4c1d1b01b0b28f45205763f9.ico', '', '', '', '0', 'image/x-icon', '0', 'ico', '', null, null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('289', 'alioss', 'image/jpeg', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/28cefa547f573a951bcdbbeb1396b06f.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', null, null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('290', 'alioss', 'image/jpeg', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/2c412adf1b30c8be3a913e603c7b6e4a.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', null, null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('291', 'alioss', 'timg (1).jpg', 'http://easyadmin.oss-cn-shenzhen.aliyuncs.com/upload/20191113/ff793ced447febfa9ea2d86f9f88fa8e.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1573612437', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('296', 'txcos', '22243.jpg', 'https://easyadmin-1251997243.cos.ap-guangzhou.myqcloud.com/upload/20191114/2381eaf81208ac188fa994b6f2579953.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1573712153', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('297', 'local', 'timg.jpg', 'http://admin.host/upload/20200423/5055a273cf8e3f393d699d622b74f247.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1587614155', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('298', 'local', 'timg.jpg', 'http://admin.host/upload/20200423/243f4e59f1b929951ef79c5f8be7468a.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1587614269', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('299', 'local', 'head.jpg', 'http://admin.host/upload/20200512/a5ce9883379727324f5686ef61205ce2.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1589255649', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('300', 'local', '896e5b87c9ca70e4.jpg', 'http://admin.host/upload/20200514/577c65f101639f53dbbc9e7aa346f81c.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1589427798', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('301', 'local', '896e5b87c9ca70e4.jpg', 'http://admin.host/upload/20200514/98fc09b0c4ad4d793a6f04bef79a0edc.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1589427840', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('302', 'local', '18811e7611c8f292.jpg', 'http://admin.host/upload/20200514/e1c6c9ef6a4b98b8f7d95a1a0191a2df.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1589438645', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('303', 'local', '20200811222013.jpg', 'http://tp6cms.com/upload/20200811/bcc44454e1b9101690687edc8c5cda29.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1597155652', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('304', 'local', '002签名.png', 'http://cmmcms.com/upload/20201016/9ef50c63a15db47787a29ba768e71f91.png', '', '', '', '0', 'image/png', '0', 'png', '', '1602816847', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('305', 'local', '001签名.png', 'http://cmmcms.com/upload/20201016/599ed48061852e04f88fef754b5f3a89.png', '', '', '', '0', 'image/png', '0', 'png', '', '1602820364', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('306', 'local', 'c8a267d3e87260c058f18724093da7a.jpg', 'http://cmmcms.com/upload/20201016/5e716bd63fe922a88b6ec3a0c65854e0.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1602820422', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('307', 'local', '002签名.png', 'http://cmmcms.com/upload/20201020/8d9f2d32fe9ea21d441028c1898a3ac0.png', '', '', '', '0', 'image/png', '0', 'png', '', '1603153428', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('308', 'local', '001签名.png', 'http://cmmcms.com/upload/20201020/a9afae47742ac8266e982bc812e18af7.png', '', '', '', '0', 'image/png', '0', 'png', '', '1603153436', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('309', 'local', '111111.png', 'http://cmmcms.com/upload/20201022/f165a8f6239393c7e1ff446f04cd6999.png', '', '', '', '0', 'image/png', '0', 'png', '', '1603334277', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('310', 'local', '1603339730275.png', 'http://cmmcms.com/upload/20201022/18897c3cbff5a0232e99159a9f4732d5.png', '', '', '', '0', 'image/png', '0', 'png', '', '1603339730', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('311', 'local', '1603372382148.png', 'http://cmmcms.com/upload/20201022/22f0b9731246d6ec79236b66edefdf23.png', '', '', '', '0', 'image/png', '0', 'png', '', '1603372382', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('312', 'local', '4444.jpg', 'http://cmmcms.com/upload/20201027/6c0a3b0c775119bfe820a615e01e78b2.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1603778105', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('313', 'local', '1603857449438.png', 'http://cmmcms.com/upload/20201028/4ef02be3b5cace32bebd56fdb1767dd5.png', '', '', '', '0', 'image/png', '0', 'png', '', '1603857449', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('314', 'local', '111111.png', 'http://cmmcms.com/upload/20201102/32515d8c7f9d0cebfa55c7286861a485.png', '', '', '', '0', 'image/png', '0', 'png', '', '1604290894', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('315', 'local', 'timg.jpg', 'http://cmmcms.com/upload/20201109/e22e8c86289eec0f08d6778e850dff9b.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1604909771', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('316', 'local', 'loginbg.jpg', 'http://cmmcms.com/upload/20201109/31a5df7855fe8a3aae45087b9c19fcf3.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1604909846', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('317', 'local', 'timg.jpg', 'http://cmmcms.com/upload/20201109/8eb4e9c3e72eab32901e36979bf6f10d.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1604909994', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('318', 'local', 'cxm00.jpg', 'http://cmmcms.com/upload/20201117/5a6c6c77e7248385c1e04ac32b446914.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1605591317', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('319', 'local', '安徽省直医保平台接口规范及代码表（2020年12月14日发布）.zip', 'http://10.87.230.225/upload/20210226/86190906cae1151768193d4f8e2ba643.zip', '', '', '', '0', 'application/x-zip-compressed', '0', 'zip', '', '1614300091', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('320', 'local', '医保接口20210225医保相关文件（电子二维码）.zip', 'http://10.87.230.225/upload/20210226/3f4d4aad81440efc38a968daf0a86111.zip', '', '', '', '0', 'application/x-zip-compressed', '0', 'zip', '', '1614301287', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('321', 'local', 'instantclient-basic-windows.x64-11.2.0.4.0.zip', 'http://10.87.230.225/upload/20210226/5fa8b143764649776bb0e29c8d993bb1.zip', '', '', '', '0', 'application/x-zip-compressed', '0', 'zip', '', '1614316512', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('322', 'local', '安徽省直医保平台接口规范及代码表（2020年12月14日发布）.zip', 'http://10.87.230.225/upload/20210226/f9fa9e6eb541707bd621ed7cde9e9f84.zip', '', '', '', '0', 'application/x-zip-compressed', '0', 'zip', '', '1614316794', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('323', 'local', 'docker一键构建lnmp集成环境.zip', 'http://10.87.230.225/upload/20210226/67b4b6f18855e08e16377859cc6b1585.zip', '', '', '', '0', 'application/x-zip-compressed', '0', 'zip', '', '1614316854', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('324', 'local', 'Basic.rar', 'http://10.87.230.225/upload/20210226/0d5c4ecda9cf19568a0be3d127428b02.rar', '', '', '', '0', 'application/octet-stream', '0', 'rar', '', '1614317462', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('325', 'local', 'Basic.rar', 'http://10.87.230.225/upload/20210226/739dd8b6d10a0ee00cf0c30a29f41c80.rar', '', '', '', '0', 'application/octet-stream', '0', 'rar', '', '1614317750', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('326', 'local', '373ade1d542f0bff7ef269a98cfcdc1.jpg', 'http://10.87.230.225/upload/20210227/0c7dade3668bbe634461b3774b16ed3d.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1614385880', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('327', 'local', '00833c14de4e90cc072163012f64248.jpg', 'http://10.87.230.225/upload/20210227/ad9b65b36f7b6138aca6828317f4ecf8.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1614385890', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('328', 'local', '373ade1d542f0bff7ef269a98cfcdc1.jpg', 'http://10.87.230.225/upload/20210227/f929747f8bd002310bdb435fe9151444.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1614386318', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('329', 'local', '00833c14de4e90cc072163012f64248.jpg', 'http://10.87.230.225/upload/20210227/55cef736d1bdd5ce281279b9493642e7.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1614386326', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('330', 'local', '001054bfe04624484e269a11f653d56.jpg', 'http://10.87.230.225/upload/20210227/ecc5eb31d8480f57c3eb392acac56511.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1614386366', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('331', 'local', '00833c14de4e90cc072163012f64248.jpg', 'http://10.87.230.225/upload/20210227/512d8a32a8f3e8a4744c9106fe77ff33.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1614386419', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('332', 'local', '444.png', 'http://10.87.230.225/upload/20210227/411cde8b5f35055e0a36d162319447ae.png', '', '', '', '0', 'image/png', '0', 'png', '', '1614386696', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('333', 'local', '00833c14de4e90cc072163012f64248.jpg', 'http://10.87.230.225/upload/20210227/79c584fced96842a32c9837494024773.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1614386726', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('334', 'local', '444.png', 'http://10.87.230.225/upload/20210227/1a7b2821dcf06683cf9f82ddc5e1bc48.png', '', '', '', '0', 'image/png', '0', 'png', '', '1614386735', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('335', 'local', '00833c14de4e90cc072163012f64248.jpg', 'http://10.87.230.225/upload/20210227/ce91cb9d6911042eda18a39248ca2a43.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1614386910', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('336', 'local', '444.png', 'http://10.87.230.225/upload/20210227/6b67bba3ba29d652870c2932cca9dd3d.png', '', '', '', '0', 'image/png', '0', 'png', '', '1614387109', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('337', 'local', 'e67902d0f677a3a3f54b3cca368cb8e.jpg', 'http://10.87.230.225/upload/20210227/7bb445c296468164ed9d0f28066d64d4.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1614387121', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('338', 'local', 'e67902d0f677a3a3f54b3cca368cb8e.jpg', 'http://10.87.230.225/upload/20210227/71387fde47ed897fb2dddaa8268d6d0f.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1614387130', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('339', 'local', '00833c14de4e90cc072163012f64248.jpg', 'http://10.87.230.225/upload/20210227/66655024ef0e35c5b8c7c2703618dada.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1614387210', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('340', 'local', '00833c14de4e90cc072163012f64248.jpg', 'http://10.87.230.225/upload/20210227/090b484fccd8da45e626b152eefc6618.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1614387219', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('341', 'local', '373ade1d542f0bff7ef269a98cfcdc1.jpg', 'http://10.87.230.225/upload/20210227/f4696fcb28b7b22c39da3a7b7731f018.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1614387317', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('342', 'local', '373ade1d542f0bff7ef269a98cfcdc1.jpg', 'http://10.87.230.225/upload/20210227/b2690f166a264d40acddb1affc4b22d3.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1614387384', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('343', 'local', '00833c14de4e90cc072163012f64248.jpg', 'http://10.87.230.225/upload/20210227/4852ccb750b1df8d6e322cfa915b5700.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1614387394', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('344', 'local', '001054bfe04624484e269a11f653d56.jpg', 'http://10.87.230.225/upload/20210227/9534bd1d7e94d39b62a5d7a70e317b23.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1614387403', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('345', 'local', 'c2bb82936af8538fd7d990a1fb2a6e3.jpg', 'http://10.87.230.225/upload/20210227/6b42dae7545e24c7bf1026faa883c076.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1614387547', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('346', 'local', 'e67902d0f677a3a3f54b3cca368cb8e.jpg', 'http://10.87.230.225/upload/20210227/0d6d14af41494c623be3e725fe1171cb.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1614387636', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('347', 'local', '00833c14de4e90cc072163012f64248.jpg', 'http://10.87.230.225/upload/20210227/4f87761de62e1ecfd6078a44d4a27b40.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1614387675', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('348', 'local', '00833c14de4e90cc072163012f64248.jpg', 'http://10.87.230.225/upload/20210227/6b95f32b2ac4926dc2f639ea00a28767.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1614387734', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('349', 'local', '00833c14de4e90cc072163012f64248.jpg', 'http://10.87.230.225/upload/20210227/8c133dd487dccbb1d1098e2f5ecfba9b.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1614387769', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('350', 'local', 'c2bb82936af8538fd7d990a1fb2a6e3.jpg', 'http://10.87.230.225/upload/20210227/2b37347c9b8a68dbe2167a689102821c.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1614387784', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('351', 'local', '373ade1d542f0bff7ef269a98cfcdc1.jpg', 'http://10.87.230.225/upload/20210227/ef208a9dae9e3f513e3c0340e5096e48.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1614387875', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('352', 'local', '截屏2020-10-22 下午8.03.36.png', 'http://223.244.236.238:9999/upload/20210227/424a0de3f669f74920f1c5d2082f4cb8.png', '', '', '', '0', 'image/png', '0', 'png', '', '1614435794', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('353', 'local', '截屏2020-12-12 下午8.53.54.png', 'http://223.244.236.238:9999/upload/20210227/1024b50c24139444ae35dc29defe463e.png', '', '', '', '0', 'image/png', '0', 'png', '', '1614435823', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('354', 'local', '截屏2020-12-12 下午8.41.32的副本.png', 'http://223.244.236.238:9999/upload/20210227/fbc0011fc06d81bcb980312c1a818256.png', '', '', '', '0', 'image/png', '0', 'png', '', '1614435948', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('355', 'local', '截屏2020-12-12 下午8.53.38.png', 'http://223.244.236.238:9999/upload/20210227/3d81e1fc54b8325d7b7b11d2b307d492.png', '', '', '', '0', 'image/png', '0', 'png', '', '1614435959', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('356', 'local', '1614436021661.png', 'http://223.244.236.238:9999/upload/20210227/32d19353f77aa91bf6349833cbf29f11.png', '', '', '', '0', 'image/png', '0', 'png', '', '1614436024', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('357', 'local', '截屏2020-10-22 下午8.03.36.png', 'http://223.244.236.238:9999/upload/20210227/18b59f54c45f33135a5502dc0a51ca51.png', '', '', '', '0', 'image/png', '0', 'png', '', '1614436071', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('358', 'local', '1614584672074.mp4', 'http://10.87.230.225/upload/20210301/3155134e6df1c41938920f0d4d8dabf6.mp4', '', '', '', '0', 'video/mp4', '0', 'mp4', '', '1614584676', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('359', 'local', '1614671948973.zip', 'http://10.87.230.225/upload/20210302/d1266ab9a76bb13cff69e0ff59d5c6f4.zip', '', '', '', '0', 'application/x-zip-compressed', '0', 'zip', '', '1614671951', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('360', 'local', '1614737550258.pdf', 'http://10.87.230.225/upload/20210303/fa553c3c9a90a89c94a40037ebf661fa.pdf', '', '', '', '0', 'application/pdf', '0', 'pdf', '', '1614737552', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('361', 'local', '1614737711994.zip', 'http://10.87.230.225/upload/20210303/a60240c1569305bcc8a43854ae7d23b8.zip', '', '', '', '0', 'application/x-zip-compressed', '0', 'zip', '', '1614737714', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('362', 'local', '1614738782425.pdf', 'http://10.87.230.225/upload/20210303/54813f8bc641bc27bb1bbee7e556d111.pdf', '', '', '', '0', 'application/pdf', '0', 'pdf', '', '1614738784', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('363', 'local', '1614741617783.zip', 'http://10.87.230.225/upload/20210303/4bf5d886a2ac0c959407d235549dace5.zip', '', '', '', '0', 'application/x-zip-compressed', '0', 'zip', '', '1614741625', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('364', 'local', '1614741634318.png', 'http://10.87.230.225/upload/20210303/db62a1361888acc16a2f5f93236ac114.png', '', '', '', '0', 'image/png', '0', 'png', '', '1614741635', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('365', 'local', '1614742241146.mp4', 'http://10.87.230.225/upload/20210303/6e2634505bdcf0a66c0676bc8e66d5c7.mp4', '', '', '', '0', 'video/mp4', '0', 'mp4', '', '1614742246', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('366', 'local', '1614742318774.mp4', 'http://10.87.230.225/upload/20210303/9a1185ffcd40a2be82f6352114d70971.mp4', '', '', '', '0', 'video/mp4', '0', 'mp4', '', '1614742323', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('367', 'local', '1614742572365.mp4', 'http://10.87.230.225/upload/20210303/3396a7a830aebfcf74d3a3f270c71876.mp4', '', '', '', '0', 'video/mp4', '0', 'mp4', '', '1614742576', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('368', 'local', '1614746893007.mp4', 'http://10.87.230.225/upload/20210303/0618a9a7a4518a73a8f6ab136c93f8db.mp4', '', '', '', '0', 'video/mp4', '0', 'mp4', '', '1614746896', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('369', 'local', '1614747212719.mp4', 'http://10.87.230.225/upload/20210303/b14cf4b5cce7eb6ab1ee0f68b907a03c.mp4', '', '', '', '0', 'video/mp4', '0', 'mp4', '', '1614747216', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('370', 'local', '1614747246399.mp4', 'http://10.87.230.225/upload/20210303/968db39f61bbf20c91d80ba915b348d6.mp4', '', '', '', '0', 'video/mp4', '0', 'mp4', '', '1614747249', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('371', 'local', '1614747697497.mp4', 'http://10.87.230.225/upload/20210303/928bdcdafa87bf127a1f249b098a5618.mp4', '', '', '', '0', 'video/mp4', '0', 'mp4', '', '1614747700', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('372', 'local', '1614749185437.mp4', 'http://10.87.230.225/upload/20210303/d712b8e2ea8e69b64745995cd5dbe862.mp4', '', '', '', '0', 'video/mp4', '0', 'mp4', '', '1614749188', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('373', 'local', '1614749280859.png', 'http://10.87.230.225/upload/20210303/14ea205b6ffe6a94cec7cbf52e7414e5.png', '', '', '', '0', 'image/png', '0', 'png', '', '1614749282', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('374', 'local', '1614749540032.png', 'http://10.87.230.225/upload/20210303/210244b7c46f79328b248ac87c9739ce.png', '', '', '', '0', 'image/png', '0', 'png', '', '1614749541', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('375', 'local', '1614749602000.png', 'http://10.87.230.225/upload/20210303/fc857d4e2c5ade1ac7faf9de9d3eb12c.png', '', '', '', '0', 'image/png', '0', 'png', '', '1614749603', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('376', 'local', '1614749685641.mp4', 'http://10.87.230.225/upload/20210303/4eddbba69e1e2333a9c739075a97e9b2.mp4', '', '', '', '0', 'video/mp4', '0', 'mp4', '', '1614749689', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('377', 'local', '1614749877771.zip', 'http://10.87.230.225/upload/20210303/2fba9cdae5c05637bdea0edeed3ec293.zip', '', '', '', '0', 'application/x-zip-compressed', '0', 'zip', '', '1614749885', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('378', 'local', '1614759068565.mp4', 'http://10.87.230.225/upload/20210303/d14dc7f33f8c6a7b85fc0a7dea81ecec.mp4', '', '', '', '0', 'video/mp4', '0', 'mp4', '', '1614759072', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('379', 'local', '1614759573070.mp4', 'http://10.87.230.225/upload/20210303/44c5f5ed7dbd8aaa1c5b55c7d46130b1.mp4', '', '', '', '0', 'video/mp4', '0', 'mp4', '', '1614759576', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('380', 'local', '1614759700012.mp4', 'http://10.87.230.225/upload/20210303/be886458946f8e773458525dc8617c84.mp4', '', '', '', '0', 'video/mp4', '0', 'mp4', '', '1614759703', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('381', 'local', '1614760527924.mp4', 'http://10.87.230.225/upload/20210303/2464cf4d8088dfd82771a7624dbeeca2.mp4', '', '', '', '0', 'video/mp4', '0', 'mp4', '', '1614760531', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('382', 'local', '1614760629785.mp4', 'http://10.87.230.225/upload/20210303/11a19026647611871e7939f1a1a1254a.mp4', '', '', '', '0', 'video/mp4', '0', 'mp4', '', '1614760633', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('383', 'local', '1614760698195.zip', 'http://10.87.230.225/upload/20210303/73ac4eaf572c780f3c9f5476c0ebc60f.zip', '', '', '', '0', 'application/x-zip-compressed', '0', 'zip', '', '1614760705', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('384', 'local', '1614761177841.pdf', 'http://10.87.230.225/upload/20210303/eaa698fcf670cf1ad711d890e537be5f.pdf', '', '', '', '0', 'application/pdf', '0', 'pdf', '', '1614761179', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('385', 'local', '1614762060827.png', 'http://10.87.230.225/upload/20210303/8c6b4da984988e62d79c73f9bb755005.png', '', '', '', '0', 'image/png', '0', 'png', '', '1614762062', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('386', 'local', '1614762103382.zip', 'http://10.87.230.225/upload/20210303/eeb2e223cba4fdeb11c15f5574e649fe.zip', '', '', '', '0', 'application/x-zip-compressed', '0', 'zip', '', '1614762106', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('387', 'local', '1614829194470.zip', 'http://10.87.230.225/upload/20210304/c93968e0f99320d548456045821d4b39.zip', '', '', '', '0', 'application/x-zip-compressed', '0', 'zip', '', '1614829202', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('388', 'local', '1614829425464.xz', 'http://10.87.230.225/upload/20210304/2ca326d2259ec2e9e1dccb141a183b1b.xz', '', '', '', '0', 'application/octet-stream', '0', 'xz', '', '1614829449', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('389', 'local', '1614833123643.txt', 'http://10.87.230.225/upload/20210304/064d0157c42149dccd4a3d34ce22441a.txt', '', '', '', '0', 'text/plain', '0', 'txt', '', '1614833125', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('390', 'local', '1614838230286.zip', 'http://10.87.230.225/upload/20210304/30d433292f7c571d9fde3fceabf181c9.zip', '', '', '', '0', 'application/x-zip-compressed', '0', 'zip', '', '1614838238', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('391', 'local', '1614997495798.zip', 'http://10.87.230.225/upload/20210306/a405be0239176b749d3e731570dcb00e.zip', '', '', '', '0', 'application/x-zip-compressed', '0', 'zip', '', '1614997502', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('392', 'local', '1615032815118.png', 'http://223.244.236.238:9999/upload/20210306/9f6248aa9aa1e7145abbc81b8ababdcd.png', '', '', '', '0', 'image/png', '0', 'png', '', '1615032815', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('393', 'local', '1615032890802.png', 'http://223.244.236.238:9999/upload/20210306/74c7f3c7c0530c4b44a8260d250b792b.png', '', '', '', '0', 'image/png', '0', 'png', '', '1615032892', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('394', 'local', '1615032829668.zip', 'http://223.244.236.238:9999/upload/20210306/4bc7960d9cb4b3f721e1b869d25a3968.zip', '', '', '', '0', 'application/zip', '0', 'zip', '', '1615033403', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('395', 'local', '1615033636159.png', 'http://223.244.236.238:9999/upload/20210306/17e59a64d3d24dc124767cf2d613ff8f.png', '', '', '', '0', 'image/png', '0', 'png', '', '1615033636', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('396', 'local', '1615033789011.zip', 'http://223.244.236.238:9999/upload/20210306/9d8923693bb360828372a676da838204.zip', '', '', '', '0', 'application/x-zip-compressed', '0', 'zip', '', '1615033791', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('397', 'local', '1615033847785.png', 'http://223.244.236.238:9999/upload/20210306/910a206c24245fd2d906ed61ab7fea7a.png', '', '', '', '0', 'image/png', '0', 'png', '', '1615033848', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('398', 'local', '1615034147067.png', 'http://223.244.236.238:9999/upload/20210306/57548198e6c09c061cba3d08bddc8262.png', '', '', '', '0', 'image/png', '0', 'png', '', '1615034157', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('399', 'local', '1615251134238.jpg', 'http://223.244.236.238:9999/upload/20210309/cadaf2ed4440ac7f8a1cd5cd6601f23a.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1615251148', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('400', 'local', 'IMG_20210309_101823.jpg', 'http://223.244.236.238:9999/upload/20210309/6be245ddd33a65ad74c6ed36dcb459c6.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1615268908', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('401', 'local', '1615522981452.zip', 'http://10.87.230.225/upload/20210312/2fe57541dafc4249faf6ce89ab8488ab.zip', '', '', '', '0', 'application/zip', '0', 'zip', '', '1615522994', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('402', 'local', '1615523029049.zip', 'http://10.87.230.225/upload/20210312/9880fa54babc734d53f5ea102f60ce88.zip', '', '', '', '0', 'application/zip', '0', 'zip', '', '1615523041', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('403', 'local', '444.png', 'http://223.244.236.238:9999/upload/20210314/d1a589c71a9c01d4da3dce6c66e0637d.png', '', '', '', '0', 'image/png', '0', 'png', '', '1615689273', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('404', 'local', '1616208157328.xlsx', 'http://10.87.230.225/upload/20210320/06c0739bd3d107400e369d26eb0ba4d5.xlsx', '', '', '', '0', 'application/octet-stream', '0', 'xlsx', '', '1616208157', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('405', 'local', '1616208188116.xlsx', 'http://10.87.230.225/upload/20210320/e35db459731faf3a052ecd6d8d604735.xlsx', '', '', '', '0', 'application/octet-stream', '0', 'xlsx', '', '1616208188', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('406', 'local', '1616208210823.xlsx', 'http://10.87.230.225/upload/20210320/9fe018ae370f786dc550f505bd09e538.xlsx', '', '', '', '0', 'application/octet-stream', '0', 'xlsx', '', '1616208210', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('407', 'local', '1616208261250.xlsx', 'http://10.87.230.225/upload/20210320/fc92583d5fadecf566a945cfb3f0ecad.xlsx', '', '', '', '0', 'application/octet-stream', '0', 'xlsx', '', '1616208261', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('408', 'local', '1616208424638.xlsx', 'http://10.87.230.225/upload/20210320/ed57904b0cd53c14dcde303086d92a94.xlsx', '', '', '', '0', 'application/octet-stream', '0', 'xlsx', '', '1616208452', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('409', 'local', '1616741498652.zip', 'http://10.87.230.225/upload/20210326/010aea8c973f2dcf4390129b7abf73bf.zip', '', '', '', '0', 'application/x-zip-compressed', '0', 'zip', '', '1616741506', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('410', 'local', '1617597867788.rar', 'http://10.87.230.225/upload/20210405/318eab552b51f474f12a82fbe54d58f3.rar', '', '', '', '0', 'application/octet-stream', '0', 'rar', '', '1617597870', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('411', 'local', '1617598083086.png', 'http://10.87.230.225/upload/20210405/f443f0e71608c05018307eecc1db889b.png', '', '', '', '0', 'image/png', '0', 'png', '', '1617598084', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('412', 'local', '1617598188024.png', 'http://10.87.230.225/upload/20210405/d696551acd34ce08bdec11fa42ae2656.png', '', '', '', '0', 'image/png', '0', 'png', '', '1617598189', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('413', 'local', '1617598687949.png', 'http://10.87.230.225/upload/20210405/7a6d3185134e93bf4e24c047e6035778.png', '', '', '', '0', 'image/png', '0', 'png', '', '1617598689', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('414', 'local', '1617599148859.png', 'http://10.87.230.225/upload/20210405/e4343c58de606da46155c72ad54a998f.png', '', '', '', '0', 'image/png', '0', 'png', '', '1617599150', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('415', 'local', '1617599323136.zip', 'http://10.87.230.225/upload/20210405/e975c2915f3995f459ee6daa3236f2cb.zip', '', '', '', '0', 'application/x-zip-compressed', '0', 'zip', '', '1617599325', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('416', 'local', '1617599445375.png', 'http://10.87.230.225/upload/20210405/e0fda493eb5af542d108feef08263aac.png', '', '', '', '0', 'image/png', '0', 'png', '', '1617599446', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('417', 'local', '1617599514693.png', 'http://10.87.230.225/upload/20210405/a71bb88c1ee04b575e7a2c65b6e200d2.png', '', '', '', '0', 'image/png', '0', 'png', '', '1617599515', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('418', 'local', '1617599574881.png', 'http://10.87.230.225/upload/20210405/84f16b7a8ad90f913ac7f2c649f2a681.png', '', '', '', '0', 'image/png', '0', 'png', '', '1617599576', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('419', 'local', '1617599653797.png', 'http://10.87.230.225/upload/20210405/e4a283cb07e33dc8e31923431c6337fa.png', '', '', '', '0', 'image/png', '0', 'png', '', '1617599655', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('420', 'local', '1617599695588.png', 'http://10.87.230.225/upload/20210405/8a5731eac70d3c5f31e4d80bc9932c3f.png', '', '', '', '0', 'image/png', '0', 'png', '', '1617599696', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('421', 'local', 'header.jpg', 'http://10.87.230.225/upload/20210416/b2a54c4a36726f091c3e252a08efaf6f.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1618548805', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('422', 'local', 'header.jpg', 'http://10.87.230.225/upload/20210416/1638b9a3386e271d67cc21036f63fc2f.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1618549522', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('423', 'local', 'header.jpg', 'http://10.87.230.225/upload/20210416/89f7626b7912229e2fdb882ec7696ba8.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1618549554', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('424', 'local', 'header.jpg', 'http://10.87.230.225/upload/20210416/c86ec056489c25dd6b353beed2469489.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1618549587', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('425', 'local', 'header.jpg', 'http://10.87.230.225/upload/20210416/fd67a5a7a76458f9c182cbd503978639.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1618575152', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('426', 'local', '1618984870176.wmv', 'http://10.87.230.225/upload/20210421/a2414f533931ebfd96eb046f7927e677.wmv', '', '', '', '0', 'video/x-ms-wmv', '0', 'wmv', '', '1618984870', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('427', 'local', '1618984894243.mp4', 'http://10.87.230.225/upload/20210421/c99fe1923b3ede9dbf24fd45b23645e3.mp4', '', '', '', '0', 'video/mp4', '0', 'mp4', '', '1618984895', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('428', 'local', '1618990974036.png', 'http://10.87.230.225/upload/20210421/a6a757346a680efccf6fedcce83f2c77.png', '', '', '', '0', 'image/png', '0', 'png', '', '1618990974', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('429', 'local', '1618991277427.png', 'http://10.87.230.225/upload/20210421/5259e1a5d961ad12e638f759edccc316.png', '', '', '', '0', 'image/png', '0', 'png', '', '1618991277', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('430', 'local', '1618991426936.png', 'http://10.87.230.225/upload/20210421/34316166fa22e9bcf26ec487b7448791.png', '', '', '', '0', 'image/png', '0', 'png', '', '1618991427', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('431', 'local', '1618991748245.png', 'http://10.87.230.225/upload/20210421/7986d70d04df62c96bd018a5d8ce04ec.png', '', '', '', '0', 'image/png', '0', 'png', '', '1618991748', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('432', 'local', '1618993059593.jpg', 'http://10.87.230.225/upload/20210421/24512d4c964d386ea717834f38f4940a.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1618993060', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('433', 'local', '1618993181214.png', 'http://10.87.230.225/upload/20210421/b2e98b7aaddbb4c1f40ba79fb8bd0ae8.png', '', '', '', '0', 'image/png', '0', 'png', '', '1618993181', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('434', 'local', '1618993218476.png', 'http://10.87.230.225/upload/20210421/6d341ead2e508fcf9e60c584f781f3ab.png', '', '', '', '0', 'image/png', '0', 'png', '', '1618993219', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('435', 'local', '1618993289037.png', 'http://10.87.230.225/upload/20210421/fdd3016eb1af8f68a7323a3395c0bfa2.png', '', '', '', '0', 'image/png', '0', 'png', '', '1618993289', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('436', 'local', '1618993590142.png', 'http://10.87.230.225/upload/20210421/0ea4317668a8dbefb1b877474d36eec0.png', '', '', '', '0', 'image/png', '0', 'png', '', '1618993590', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('437', 'local', '1618993625003.png', 'http://10.87.230.225/upload/20210421/e52a6f223041e79115ac66446ac88405.png', '', '', '', '0', 'image/png', '0', 'png', '', '1618993625', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('438', 'local', '1618993654285.png', 'http://10.87.230.225/upload/20210421/23d829ccd186d77f04a4a877d50aef77.png', '', '', '', '0', 'image/png', '0', 'png', '', '1618993654', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('441', 'local', '1620607470729.png', 'http://10.87.230.225/upload/20210510/e21991adec141186b5d6d15f9d222747.png', '', '', '', '0', 'image/png', '0', 'png', '', '1620607472', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('442', 'local', '1620607486140.png', 'http://10.87.230.225/upload/20210510/ce70f39853406fe047dbd255902d39ca.png', '', '', '', '0', 'image/png', '0', 'png', '', '1620607487', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('443', 'local', '1620607517277.png', 'http://10.87.230.225/upload/20210510/0fae3d8b2fce997390285a04fb4dd623.png', '', '', '', '0', 'image/png', '0', 'png', '', '1620607519', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('444', 'local', '1633823886547.png', 'http://10.87.230.225/upload/20211010/8e9cea3ba83124ef793a389f424ba4b1.png', '', '', '', '0', 'image/png', '0', 'png', '', '1633823888', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('445', 'local', '1633824639177.zip', 'http://10.87.230.225/upload/20211010/6443fab1c068272a157d73725d6025e0.zip', '', '', '', '0', 'application/x-zip-compressed', '0', 'zip', '', '1633824641', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('446', 'local', '1633825348157.png', 'http://10.87.230.225/upload/20211010/274e40af9ca8ac53ee641be662669e39.png', '', '', '', '0', 'image/png', '0', 'png', '', '1633825350', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('447', 'local', '1633825598970.mp4', 'http://10.87.230.225/upload/20211010/2d38e615098432b62e8b5b55a783153e.mp4', '', '', '', '0', 'video/mp4', '0', 'mp4', '', '1633825601', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('448', 'local', '1633826814213.png', 'http://10.87.230.225/upload/20211010/a2feba7c58c82b94afe800865028c15b.png', '', '', '', '0', 'image/png', '0', 'png', '', '1633826816', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('449', 'local', '1633826967892.png', 'http://10.87.230.225/upload/20211010/e38b9b7a9ace381a7f2d850c8a94ea04.png', '', '', '', '0', 'image/png', '0', 'png', '', '1633826970', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('450', 'local', '1633832734448.zip', 'http://10.87.230.225/upload/20211010/01f4c17151fc6bf20e50ecfacffd77ab.zip', '', '', '', '0', 'application/x-zip-compressed', '0', 'zip', '', '1633832737', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('451', 'local', '1633833107705.wmv', 'http://10.87.230.225/upload/20211010/2afb6343d14d78227485601feab409ff.wmv', '', '', '', '0', 'video/x-ms-wmv', '0', 'wmv', '', '1633833110', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('452', 'local', '1633833335452.mp4', 'http://10.87.230.225/upload/20211010/7f8fc2ccc47c1a7c95b2fbf5ac22177c.mp4', '', '', '', '0', 'video/mp4', '0', 'mp4', '', '1633833337', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('453', 'local', '1633845404831.gif', 'http://10.87.230.225/upload/20211010/bc544047e3e2646b33683c2c3ef5fb79.gif', '', '', '', '0', 'image/gif', '0', 'gif', '', '1633845405', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('454', 'local', '1634009243113.gif', 'http://10.87.230.225/upload/20211012/3965c2c484a3ab3db98264e550ab4b14.gif', '', '', '', '0', 'image/gif', '0', 'gif', '', '1634009244', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('455', 'local', '1634009466191.gif', 'http://10.87.230.225/upload/20211012/741c43fcf82e115fc476783e3b1c30f3.gif', '', '', '', '0', 'image/gif', '0', 'gif', '', '1634009467', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('456', 'local', '1634214735760.png', 'http://10.87.230.225/upload/20211014/e2c80a0ec5116928e501f05f53377286.png', '', '', '', '0', 'image/png', '0', 'png', '', '1634214737', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('457', 'local', '1634253652976.png', 'http://10.87.230.225/upload/20211015/e159e893ed9fb2d351b64e311df7ea7c.png', '', '', '', '0', 'image/png', '0', 'png', '', '1634253654', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('458', 'local', '1634254050851.png', 'http://10.87.230.225/upload/20211015/f8dd3aebc79dac015868534ea9f3ee57.png', '', '', '', '0', 'image/png', '0', 'png', '', '1634254052', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('459', 'local', '1634254426476.png', 'http://10.87.230.225/upload/20211015/ba184bf79f84a9f73c677c90f1c00325.png', '', '', '', '0', 'image/png', '0', 'png', '', '1634254428', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('460', 'local', '1634255964456.gif', 'http://10.87.230.225/upload/20211015/9e575d3b865c46f60b476e811d00e974.gif', '', '', '', '0', 'image/gif', '0', 'gif', '', '1634255966', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('461', 'local', '1634256700094.gif', 'http://10.87.230.225/upload/20211015/cb7108601a3ba478f226147416fb69e2.gif', '', '', '', '0', 'image/gif', '0', 'gif', '', '1634256701', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('462', 'local', '1634258597321.gif', 'http://10.87.230.225/upload/20211015/27f26c97e20bb5fc4714268dd6132c59.gif', '', '', '', '0', 'image/gif', '0', 'gif', '', '1634258599', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('463', 'local', '1634258837611.png', 'http://10.87.230.225/upload/20211015/ff2388ade298df6714fec403f154291d.png', '', '', '', '0', 'image/png', '0', 'png', '', '1634258839', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('464', 'local', '1634268738013.zip', 'http://10.87.230.225/upload/20211015/3cc53cf812234d5c7e6cb1091c9fa8d0.zip', '', '', '', '0', 'application/x-zip-compressed', '0', 'zip', '', '1634268740', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('465', 'local', '1635471929196.zip', 'http://10.87.230.225/upload/20211029/0fea0408b7690c7e8d1c99e606587d59.zip', '', '', '', '0', 'application/x-zip-compressed', '0', 'zip', '', '1635471934', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('466', 'local', '1635472117594.png', 'http://10.87.230.225/upload/20211029/38777695b5199002e928468aab028eaa.png', '', '', '', '0', 'image/png', '0', 'png', '', '1635472122', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('467', 'local', '1635472251865.png', 'http://10.87.230.225/upload/20211029/5f7d746c785e3bbb71b77e97da3f3ad8.png', '', '', '', '0', 'image/png', '0', 'png', '', '1635472256', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('468', 'local', '1635472321640.png', 'http://10.87.230.225/upload/20211029/fbd367a7f5bfa547b69b50be20bd57f0.png', '', '', '', '0', 'image/png', '0', 'png', '', '1635472326', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('469', 'local', '1635472435965.png', 'http://10.87.230.225/upload/20211029/156dd038e00a172a2bc2b1043b6dbc3b.png', '', '', '', '0', 'image/png', '0', 'png', '', '1635472440', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('470', 'local', '1635472902085.png', 'http://10.87.230.225/upload/20211029/1b8de55fcbf9dd765e4754b545bde992.png', '', '', '', '0', 'image/png', '0', 'png', '', '1635472906', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('471', 'local', '1635474442626.png', 'http://10.87.230.225/upload/20211029/cb720c92de5d18fef7e85cf38d91664a.png', '', '', '', '0', 'image/png', '0', 'png', '', '1635474447', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('472', 'local', '1635474937125.png', 'http://10.87.230.225/upload/20211029/7f517838d118980471baecb8c507913b.png', '', '', '', '0', 'image/png', '0', 'png', '', '1635474941', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('473', 'local', '1635475458055.png', 'http://10.87.230.225/upload/20211029/2add419678d7c29bb8fdb1ee0e77ad47.png', '', '', '', '0', 'image/png', '0', 'png', '', '1635475462', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('474', 'local', '1635475518234.png', 'http://10.87.230.225/upload/20211029/4401c9e92873c6a81ab947159eca3f12.png', '', '', '', '0', 'image/png', '0', 'png', '', '1635475522', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('475', 'local', '1635478865185.png', 'http://10.87.230.225/upload/20211029/a1f59d3582f8f44c1861b00d8abff05c.png', '', '', '', '0', 'image/png', '0', 'png', '', '1635478869', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('476', 'local', '1635478970063.png', 'http://10.87.230.225/upload/20211029/955894c5d3da2779fa1e966f8f2854b0.png', '', '', '', '0', 'image/png', '0', 'png', '', '1635478974', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('477', 'local', '1635479046609.png', 'http://10.87.230.225/upload/20211029/7a60582f9593efe7f2b6c8cf8ecee223.png', '', '', '', '0', 'image/png', '0', 'png', '', '1635479051', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('478', 'local', '1635480504626.png', 'http://10.87.230.225/upload/20211029/0a4cb8450640937e8397268e84275f67.png', '', '', '', '0', 'image/png', '0', 'png', '', '1635480509', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('479', 'local', '1635480602204.png', 'http://10.87.230.225/upload/20211029/540d9cd8c9ca11f1ea31095200a414be.png', '', '', '', '0', 'image/png', '0', 'png', '', '1635480606', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('480', 'local', '1635480652577.png', 'http://10.87.230.225/upload/20211029/a73e107ef01b60c76e3ec59cade972f8.png', '', '', '', '0', 'image/png', '0', 'png', '', '1635480657', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('481', 'local', '1635481540763.png', 'http://10.87.230.225/upload/20211029/1a2035e78488074e0ad2249a1dc622e8.png', '', '', '', '0', 'image/png', '0', 'png', '', '1635481545', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('482', 'local', '1635481920690.png', 'http://10.87.230.225/upload/20211029/ad57871558bf036798f67746c6506077.png', '', '', '', '0', 'image/png', '0', 'png', '', '1635481925', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('483', 'local', '1635482050248.png', 'http://10.87.230.225/upload/20211029/7f291eeda0b86446ee19b48228e1d4aa.png', '', '', '', '0', 'image/png', '0', 'png', '', '1635482054', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('484', 'local', '1635482127335.png', 'http://10.87.230.225/upload/20211029/a86b6f9a4652309e50bbef878deaddea.png', '', '', '', '0', 'image/png', '0', 'png', '', '1635482131', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('485', 'local', '1635482406397.png', 'http://10.87.230.225/upload/20211029/31d716e8cb12fd1361c91c50f7eb8201.png', '', '', '', '0', 'image/png', '0', 'png', '', '1635482410', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('486', 'local', '1635482738014.png', 'http://10.87.230.225/upload/20211029/ceb82e76a26c1ef6ba6c37f8716b1b09.png', '', '', '', '0', 'image/png', '0', 'png', '', '1635482742', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('487', 'local', '1635482839350.png', 'http://10.87.230.225/upload/20211029/59f124dcb986d29ca0c617014705d215.png', '', '', '', '0', 'image/png', '0', 'png', '', '1635482843', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('488', 'local', '1635482931347.png', 'http://10.87.230.225/upload/20211029/82d107a3371cdec4b358789af0ae665f.png', '', '', '', '0', 'image/png', '0', 'png', '', '1635482935', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('489', 'local', '1635483186298.png', 'http://10.87.230.225/upload/20211029/f933e8eebd0ec688b938d2bacfcce742.png', '', '', '', '0', 'image/png', '0', 'png', '', '1635483190', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('490', 'local', '1635483198770.png', 'http://10.87.230.225/upload/20211029/1e76c0fba925067e3ff4ce357a0222b7.png', '', '', '', '0', 'image/png', '0', 'png', '', '1635483203', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('491', 'local', '1635483542373.png', 'http://10.87.230.225/upload/20211029/14f01acecbd176ed86c49b7014032855.png', '', '', '', '0', 'image/png', '0', 'png', '', '1635483546', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('492', 'local', '1635483913787.png', 'http://10.87.230.225/upload/20211029/c94b104d496b92c3a1c3572366c47383.png', '', '', '', '0', 'image/png', '0', 'png', '', '1635483918', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('493', 'local', '1635484016036.png', 'http://10.87.230.225/upload/20211029/75b3e8710d934b7278847b7cc9da5dc8.png', '', '', '', '0', 'image/png', '0', 'png', '', '1635484020', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('494', 'local', '1635484093917.png', 'http://10.87.230.225/upload/20211029/443e320a80ea8316092e5cf5006c76e9.png', '', '', '', '0', 'image/png', '0', 'png', '', '1635484098', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('495', 'local', '1635484189552.png', 'http://10.87.230.225/upload/20211029/9c94ad1023e8d118c87df59a00b51f7a.png', '', '', '', '0', 'image/png', '0', 'png', '', '1635484194', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('496', 'local', '1635484768722.png', 'http://10.87.230.225/upload/20211029/7a1e6077a4c0236c3103a77613d768fb.png', '', '', '', '0', 'image/png', '0', 'png', '', '1635484773', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('497', 'local', '1635485152273.png', 'http://10.87.230.225/upload/20211029/299a9cce7ae0f2bb96779d5490ebefce.png', '', '', '', '0', 'image/png', '0', 'png', '', '1635485156', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('498', 'local', '1635485443963.png', 'http://10.87.230.225/upload/20211029/727a49732bb196cac17c6f898074f05b.png', '', '', '', '0', 'image/png', '0', 'png', '', '1635485448', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('499', 'local', '1635485517768.png', 'http://10.87.230.225/upload/20211029/7774924673f0e3871af1433c06439033.png', '', '', '', '0', 'image/png', '0', 'png', '', '1635485522', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('500', 'local', '1635485607551.png', 'http://10.87.230.225/upload/20211029/80b684d7f9b4be3e4e1f4942d1d213d0.png', '', '', '', '0', 'image/png', '0', 'png', '', '1635485612', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('501', 'local', '1635486520597.png', 'http://10.87.230.225/upload/20211029/9a8ed9f00d836b1c4e394fe01b11f73a.png', '', '', '', '0', 'image/png', '0', 'png', '', '1635486525', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('502', 'local', '1635486536146.png', 'http://10.87.230.225/upload/20211029/fe1edb2a1fc75dec3a61e20e57631a8b.png', '', '', '', '0', 'image/png', '0', 'png', '', '1635486540', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('503', 'local', '1635486591252.png', 'http://10.87.230.225/upload/20211029/3d1a1cf772aaf1e16d36d0c6d281cef2.png', '', '', '', '0', 'image/png', '0', 'png', '', '1635486595', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('504', 'local', '1635486634520.png', 'http://10.87.230.225/upload/20211029/85da3547779cdb6d2c8116f95109f31a.png', '', '', '', '0', 'image/png', '0', 'png', '', '1635486639', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('505', 'local', '1635486990664.png', 'http://10.87.230.225/upload/20211029/99a95f1c6656eb3a34d55108d6f648d5.png', '', '', '', '0', 'image/png', '0', 'png', '', '1635486995', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('506', 'local', '1635487512174.png', 'http://10.87.230.225/upload/20211029/94e1d97e57b5483edf9e9032548edae0.png', '', '', '', '0', 'image/png', '0', 'png', '', '1635487516', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('507', 'local', '1635488505377.png', 'http://10.87.230.225/upload/20211029/351013266d6b27d2347fcde1903c9d5d.png', '', '', '', '0', 'image/png', '0', 'png', '', '1635488509', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('508', 'local', '1638145889212.png', 'http://10.87.230.225/upload/20211129/edd4871dc6e93e151021312d24e0d312.png', '', '', '', '0', 'image/png', '0', 'png', '', '1638145895', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('509', 'local', '1638146258250.png', 'http://10.87.230.225/upload/20211129/fcfe24b782a287e754cf00b5251d4df5.png', '', '', '', '0', 'image/png', '0', 'png', '', '1638146264', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('510', 'local', '1638146633345.png', 'http://10.87.230.225/upload/20211129/76ea31476f4a8b74915e4acb100cc981.png', '', '', '', '0', 'image/png', '0', 'png', '', '1638146639', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('511', 'local', '1638146693587.png', 'http://10.87.230.225/upload/20211129/8bb818441fa7be14f222e5ede9139b2a.png', '', '', '', '0', 'image/png', '0', 'png', '', '1638146699', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('512', 'local', '1638146715780.png', 'http://10.87.230.225/upload/20211129/fef4747c3c12c71618960af327785cb3.png', '', '', '', '0', 'image/png', '0', 'png', '', '1638146721', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('513', 'local', '1638320641416.png', 'http://10.87.230.225/upload/20211201/49a9c372482fe88959d72cbedd0712a3.png', '', '', '', '0', 'image/png', '0', 'png', '', '1638320642', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('514', 'local', '1638320861097.png', 'http://10.87.230.225/upload/20211201/82a0fae401d3f20cb52f51ef4c62cc5f.png', '', '', '', '0', 'image/png', '0', 'png', '', '1638320862', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('515', 'local', '1638320899644.png', 'http://10.87.230.225/upload/20211201/e3c748077a0703a8e4341b9f9e4c9ab3.png', '', '', '', '0', 'image/png', '0', 'png', '', '1638320901', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('516', 'local', '1638321038472.png', 'http://10.87.230.225/upload/20211201/6532de503fa09bdc956c91e4f0c6b99c.png', '', '', '', '0', 'image/png', '0', 'png', '', '1638321039', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('517', 'local', '1638321205612.png', 'http://10.87.230.225/upload/20211201/73c3167adffbe42976e2f38a97f4661b.png', '', '', '', '0', 'image/png', '0', 'png', '', '1638321207', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('518', 'local', '1638321339119.png', 'http://10.87.230.225/upload/20211201/ca111dd0e055ccf364e476c16e3dbbbb.png', '', '', '', '0', 'image/png', '0', 'png', '', '1638321340', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('519', 'local', 'favicon.ico', 'http://10.87.230.199:9999/upload/20221214/2c1e571b62296fbebc62232479877bba.ico', '', '', '', '0', 'image/x-icon', '0', 'ico', '', '1670996353', null, null);

-- ----------------------------
-- View structure for hrp_v_device_help
-- ----------------------------
DROP VIEW IF EXISTS `hrp_v_device_help`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `hrp_v_device_help` AS select `a`.`id` AS `id`,`b`.`device_name` AS `device_name`,`b`.`location` AS `location`,`b`.`ip` AS `ip`,`b`.`ips` AS `ips`,`b`.`computer_name` AS `computer_name`,`b`.`UUID` AS `UUID`,`a`.`create_time` AS `create_time`,`a`.`device_id` AS `device_id`,`a`.`delete_time` AS `delete_time`,`a`.`done_time` AS `done_time`,`a`.`done_user` AS `done_user` from (`hrp_device_help` `a` join `hrp_device` `b` on((`a`.`device_id` = `b`.`id`))) ;

-- ----------------------------
-- View structure for hrp_v_device_repair
-- ----------------------------
DROP VIEW IF EXISTS `hrp_v_device_repair`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `hrp_v_device_repair` AS select `a`.`id` AS `id`,`b`.`name` AS `problem_name`,`c`.`device_name` AS `repair_device_name`,`d`.`device_name` AS `report_device_name`,`a`.`create_time` AS `create_time`,`c`.`location` AS `location`,`c`.`computer_name` AS `computer_name`,`a`.`problem_description` AS `problem_description`,`a`.`accepted_time` AS `accepted_time`,`e`.`name` AS `accepted_user`,`a`.`status` AS `status`,(case `a`.`status` when 0 then '已申请' when 1 then '已安排' when 2 then '已完成' when -(1) then '已作废' end) AS `status_name`,`a`.`mark` AS `mark`,`a`.`report_user_phone` AS `report_user_phone`,`a`.`deprecated_time` AS `deprecated_time`,`a`.`finish_time` AS `finish_time`,`a`.`repair_device_id` AS `repair_device_id`,`a`.`report_device_id` AS `report_device_id`,`a`.`problem_type` AS `problem_type` from ((((`hrp_device_repair` `a` left join `hrp_device_repair_type` `b` on((`a`.`problem_type` = `b`.`id`))) left join `hrp_device` `c` on((`a`.`repair_device_id` = `c`.`id`))) left join `hrp_device` `d` on((`a`.`report_device_id` = `d`.`id`))) left join `hrp_system_admin` `e` on((`a`.`accepted_user_id` = `e`.`id`))) ;

