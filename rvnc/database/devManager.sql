/*
Navicat MySQL Data Transfer

Source Server         : 本机测试机
Source Server Version : 50740
Source Host           : 192.168.1.4:3306
Source Database       : devManager

Target Server Type    : MYSQL
Target Server Version : 50740
File Encoding         : 65001

Date: 2023-01-07 11:14:28
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
INSERT INTO `hrp_system_admin` VALUES ('1', null, '/upload/20230107/6b488df3d9b440fa5ced1877c3b4481e.png', '管理员', null, 'admin', 'e5cce20a39978b70d1cca2b53aa92ddef485fb5c', 'admin', 'admin', '391', '0', '1', '0', '1596498865', '1673058276', null);

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
INSERT INTO `hrp_system_config` VALUES ('65', 'logo_title', 'site', '远程管理', 'LOGO标题', '0', null, null);
INSERT INTO `hrp_system_config` VALUES ('66', 'logo_image', 'site', '/upload/20230107/9688912b73154beb722e776e12ced41a.ico', 'logo图片', '0', null, null);
INSERT INTO `hrp_system_config` VALUES ('68', 'site_name', 'site', '终端远程管理系统', '站点名称', '0', null, null);
INSERT INTO `hrp_system_config` VALUES ('69', 'site_ico', 'site', '/upload/20230107/1545fb1711389c99e9a14e6c4c8efd15.ico', '浏览器图标', '0', null, null);
INSERT INTO `hrp_system_config` VALUES ('70', 'site_copyright', 'site', '©版权所有 2022 RVNC ', '版权信息', '0', null, null);
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
-- Table structure for hrp_system_log_202301
-- ----------------------------
DROP TABLE IF EXISTS `hrp_system_log_202301`;
CREATE TABLE `hrp_system_log_202301` (
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
) ENGINE=InnoDB AUTO_INCREMENT=655 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='后台操作日志表 - 202301';

-- ----------------------------
-- Records of hrp_system_log_202301
-- ----------------------------
INSERT INTO `hrp_system_log_202301` VALUES ('630', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"123456\",\"keep_login\":\"0\"}', '172.17.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', '1673052297');
INSERT INTO `hrp_system_log_202301` VALUES ('631', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"111111\",\"keep_login\":\"0\"}', '172.17.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', '1673052304');
INSERT INTO `hrp_system_log_202301` VALUES ('632', '1', '/admin/test/getGroupInfoTree', 'post', '', '[]', '172.17.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', '1673052313');
INSERT INTO `hrp_system_log_202301` VALUES ('633', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"111111\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', '1673055649');
INSERT INTO `hrp_system_log_202301` VALUES ('634', '1', '/admin/ajax/upload', 'post', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', '1673055908');
INSERT INTO `hrp_system_log_202301` VALUES ('635', '1', '/admin/system.config/save', 'post', '', '{\"site_name\":\"企业运维管理系统\",\"site_ico\":\"\\/upload\\/20230107\\/1545fb1711389c99e9a14e6c4c8efd15.ico\",\"file\":\"\",\"site_version\":\"2.0.0\",\"site_beian\":\"皖ICP备16006642号-2\",\"site_copyright\":\"©版权所有 2022 Designed By 信息中心\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', '1673055916');
INSERT INTO `hrp_system_log_202301` VALUES ('636', '1', '/admin/ajax/upload', 'post', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', '1673055936');
INSERT INTO `hrp_system_log_202301` VALUES ('637', '1', '/admin/system.config/save', 'post', '', '{\"logo_title\":\"运维管理\",\"logo_image\":\"\\/upload\\/20230107\\/9688912b73154beb722e776e12ced41a.ico\",\"file\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', '1673055940');
INSERT INTO `hrp_system_log_202301` VALUES ('638', '1', '/admin/ajax/upload', 'post', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', '1673055988');
INSERT INTO `hrp_system_log_202301` VALUES ('639', '1', '/admin/index/editAdmin.html', 'post', '', '{\"head_img\":\"\\/upload\\/20230107\\/6b488df3d9b440fa5ced1877c3b4481e.png\",\"file\":\"\",\"username\":\"admin\",\"phone\":\"admin\",\"remark\":\"admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', '1673055992');
INSERT INTO `hrp_system_log_202301` VALUES ('640', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"111111\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', '1673057069');
INSERT INTO `hrp_system_log_202301` VALUES ('641', '1', '/admin/system.config/save', 'post', '', '{\"site_name\":\"终端远程管理系统\",\"site_ico\":\"\\/upload\\/20230107\\/1545fb1711389c99e9a14e6c4c8efd15.ico\",\"file\":\"\",\"site_version\":\"2.0.0\",\"site_beian\":\"皖ICP备16006642号-2\",\"site_copyright\":\"©版权所有 2022 Designed By 信息中心\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', '1673057096');
INSERT INTO `hrp_system_log_202301` VALUES ('642', '1', '/admin/system.config/save', 'post', '', '{\"logo_title\":\"远程管理\",\"logo_image\":\"\\/upload\\/20230107\\/9688912b73154beb722e776e12ced41a.ico\",\"file\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', '1673057160');
INSERT INTO `hrp_system_log_202301` VALUES ('643', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"111111\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', '1673057185');
INSERT INTO `hrp_system_log_202301` VALUES ('644', '1', '/admin/system.config/save', 'post', '', '{\"site_name\":\"终端远程管理系统\",\"site_ico\":\"\\/upload\\/20230107\\/1545fb1711389c99e9a14e6c4c8efd15.ico\",\"file\":\"\",\"site_version\":\"2.0.0\",\"site_beian\":\"皖ICP备16006642号-2\",\"site_copyright\":\"©版权所有 2022 RVNC \"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', '1673057297');
INSERT INTO `hrp_system_log_202301` VALUES ('645', '1', '/admin/system.config/save', 'post', '', '{\"site_name\":\"终端远程管理系统\",\"site_ico\":\"\\/upload\\/20230107\\/1545fb1711389c99e9a14e6c4c8efd15.ico\",\"file\":\"\",\"site_version\":\"2.0.0\",\"site_beian\":\"皖ICP备16006642号-2\",\"site_copyright\":\"©版权所有 2022 RVNC \"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', '1673057630');
INSERT INTO `hrp_system_log_202301` VALUES ('646', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"111111\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', '1673058276');
INSERT INTO `hrp_system_log_202301` VALUES ('647', '1', '/admin/test/getGroupInfoTree', 'post', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', '1673058312');
INSERT INTO `hrp_system_log_202301` VALUES ('648', '1', '/admin/system.menu/add?id=254', 'post', '', '{\"id\":\"254\",\"pid\":\"254\",\"title\":\"快捷菜单\",\"href\":\"system.quick\\/index\",\"icon\":\"fa fa-list\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', '1673059780');
INSERT INTO `hrp_system_log_202301` VALUES ('649', '1', '/admin/system.quick/add', 'post', '', '{\"title\":\"终端管理\",\"href\":\"novnc.device\\/index\",\"icon\":\"fa fa-apple\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', '1673059919');
INSERT INTO `hrp_system_log_202301` VALUES ('650', '1', '/admin/system.quick/add', 'post', '', '{\"title\":\"远程求助\",\"href\":\"novnc.help\\/index\",\"icon\":\"fa fa-bath\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', '1673059972');
INSERT INTO `hrp_system_log_202301` VALUES ('651', '1', '/admin/system.quick/add', 'post', '', '{\"title\":\"设备报修\",\"href\":\"novnc.repair\\/index\",\"icon\":\"fa fa-cogs\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', '1673060016');
INSERT INTO `hrp_system_log_202301` VALUES ('652', '1', '/admin/system.quick/add', 'post', '', '{\"title\":\"分组管理\",\"href\":\"novnc.group\\/index\",\"icon\":\"fa fa-object-ungroup\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', '1673060052');
INSERT INTO `hrp_system_log_202301` VALUES ('653', '1', '/admin/test/getGroupInfoTree', 'post', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', '1673060081');
INSERT INTO `hrp_system_log_202301` VALUES ('654', '1', '/admin/test/getGroupInfoTree', 'post', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', '1673060528');

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
) ENGINE=InnoDB AUTO_INCREMENT=287 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统菜单表';

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
INSERT INTO `hrp_system_menu` VALUES ('286', '254', '快捷菜单', 'fa fa-list', 'system.quick/index', '', '_self', '0', '1', '', '1673059780', '1673059780', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统快捷入口表';

-- ----------------------------
-- Records of hrp_system_quick
-- ----------------------------
INSERT INTO `hrp_system_quick` VALUES ('12', '终端管理', 'fa fa-apple', 'novnc.device/index', '0', '1', '', '1673059919', '1673059919', null);
INSERT INTO `hrp_system_quick` VALUES ('13', '远程求助', 'fa fa-bath', 'novnc.help/index', '0', '1', '', '1673059972', '1673059972', null);
INSERT INTO `hrp_system_quick` VALUES ('14', '设备报修', 'fa fa-cogs', 'novnc.repair/index', '0', '1', '', '1673060017', '1673060017', null);
INSERT INTO `hrp_system_quick` VALUES ('15', '分组管理', 'fa fa-object-ungroup', 'novnc.group/index', '0', '1', '', '1673060052', '1673060052', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=523 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='上传文件表';

-- ----------------------------
-- Records of hrp_system_uploadfile
-- ----------------------------
INSERT INTO `hrp_system_uploadfile` VALUES ('520', 'local', 'rvnc.ico', 'http://rvnc.com/upload/20230107/1545fb1711389c99e9a14e6c4c8efd15.ico', '', '', '', '0', 'image/x-icon', '0', 'ico', '', '1673055908', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('521', 'local', 'rvnc.ico', 'http://rvnc.com/upload/20230107/9688912b73154beb722e776e12ced41a.ico', '', '', '', '0', 'image/x-icon', '0', 'ico', '', '1673055936', null, null);
INSERT INTO `hrp_system_uploadfile` VALUES ('522', 'local', 'rvnc.png', 'http://rvnc.com/upload/20230107/6b488df3d9b440fa5ced1877c3b4481e.png', '', '', '', '0', 'image/png', '0', 'png', '', '1673055989', null, null);

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
