/*
Navicat MySQL Data Transfer

Source Server         : 医院10.87.230.225
Source Server Version : 80023
Source Host           : 10.87.230.225:3306
Source Database       : hbjkjtyyPATIENT

Target Server Type    : MYSQL
Target Server Version : 80023
File Encoding         : 65001

Date: 2022-12-10 16:27:07
*/

SET FOREIGN_KEY_CHECKS=0;

use devManager;
-- 创建求助视图
create view hrp_v_device_help AS
select a.id, b.device_name,b.location,b.ip,b.ips,b.computer_name,b.UUID,a.create_time,a.device_id from hrp_device_help a
inner JOIN hrp_device b on a.device_id=b.id;
-- 创建报修视图
create view hrp_v_device_repair AS
select a.id,b.`name` as problem_name,
c.device_name  as repair_device_name
,d.device_name as report_device_name
,a.create_time
,c.location
,c.computer_name
,a.problem_description 
,a.accepted_time
,e.`name` as accepted_user
,a.`status`
,case a.`status` when 0 then '已申请' when 1 then '已安排' when 2 then '已完成' when -1 then '已作废' end as status_name
,a.mark
,a.report_user_phone
,a.deprecated_time
,a.finish_time,
,a.repair_device_id
 ,a.repair_device_id
,a.problem_type
  from hrp_device_repair a 
left join hrp_device_repair_type b on a.problem_type=b.id
left join hrp_device c on a.repair_device_id =c.id
LEFT join hrp_device d on a.report_device_id=d.id
left join hrp_system_admin e on a.accepted_user_id=e.id ;


