/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.11
Source Server Version : 50743
Source Host           : 192.168.1.11:3306
Source Database       : warden_admin

Target Server Type    : MYSQL
Target Server Version : 50743
File Encoding         : 65001

Date: 2023-12-07 23:11:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for wd_sys_config
-- ----------------------------
DROP TABLE IF EXISTS `wd_sys_config`;
CREATE TABLE `wd_sys_config` (
  `enabled_register` bit(1) NOT NULL DEFAULT b'0' COMMENT '开启注册功能',
  `allow_many_token` bit(1) NOT NULL DEFAULT b'0' COMMENT '允许一个帐号生成多个有效token',
  `again_verify` tinyint(1) NOT NULL DEFAULT '0' COMMENT '再次验证'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统配置';

-- ----------------------------
-- Records of wd_sys_config
-- ----------------------------
INSERT INTO `wd_sys_config` VALUES ('', '', '1');

-- ----------------------------
-- Table structure for wd_sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `wd_sys_dept`;
CREATE TABLE `wd_sys_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL COMMENT '部门名称',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `code` varchar(20) DEFAULT NULL COMMENT '部门编号',
  `parent_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '上级部门',
  `leader_id` bigint(20) DEFAULT NULL COMMENT '领导人ID',
  `pinyin` varchar(200) DEFAULT NULL COMMENT '全拼(名称)',
  `py` varchar(20) DEFAULT NULL COMMENT '简拼(名称)',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  `orders` bigint(11) DEFAULT '0' COMMENT '排序',
  `disabled` bit(1) DEFAULT b'0' COMMENT '禁用',
  `deleted` bit(1) DEFAULT b'0' COMMENT '删除',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_date` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`deleted`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='部门';

-- ----------------------------
-- Records of wd_sys_dept
-- ----------------------------
INSERT INTO `wd_sys_dept` VALUES ('1', '研发部门', null, '0029342', '0', null, null, null, '第三方是1', '0', '\0', '\0', '2023-07-03 16:30:00', '2023-09-14 08:12:58');
INSERT INTO `wd_sys_dept` VALUES ('2', '行政部', null, '3324779', '0', null, null, null, null, '0', '\0', '\0', '2023-07-03 16:30:18', '2023-09-14 08:15:46');
INSERT INTO `wd_sys_dept` VALUES ('3', '设计部', null, '3325623', '0', null, null, null, null, '1', '\0', '\0', '2023-07-03 16:30:36', '2023-09-14 08:39:49');
INSERT INTO `wd_sys_dept` VALUES ('4', '采购部', null, '9945645', '0', null, null, null, null, '1', '\0', '\0', '2023-07-03 16:30:51', '2023-09-14 08:16:23');
INSERT INTO `wd_sys_dept` VALUES ('5', 'xxxxx', null, 'M423332', '0', null, null, null, null, '0', '\0', '\0', '2023-09-10 15:31:17', '2023-09-14 08:16:52');
INSERT INTO `wd_sys_dept` VALUES ('6', 'yyyyy', null, '234234', '0', null, null, null, null, '0', '\0', '\0', '2023-09-10 15:31:34', '2023-09-14 08:23:52');

-- ----------------------------
-- Table structure for wd_sys_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `wd_sys_dictionary`;
CREATE TABLE `wd_sys_dictionary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL COMMENT '字典名称',
  `code` varchar(50) NOT NULL COMMENT '字典编码',
  `description` varchar(120) DEFAULT NULL COMMENT '描述',
  `orders` tinyint(11) DEFAULT '0' COMMENT '排序',
  `disabled` bit(1) DEFAULT b'0' COMMENT '禁用',
  `deleted` bit(1) DEFAULT b'0' COMMENT '删除',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_date` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='字典';

-- ----------------------------
-- Records of wd_sys_dictionary
-- ----------------------------
INSERT INTO `wd_sys_dictionary` VALUES ('1', '性别', 'Warden_Gender', '性别数据', '0', '\0', '\0', '2023-07-05 17:23:21', '2023-07-05 17:23:23');
INSERT INTO `wd_sys_dictionary` VALUES ('2', '终端', 'Warden_Terminal', '访问终端', '1', '\0', '\0', '2023-07-05 17:24:21', '2023-07-05 17:24:23');
INSERT INTO `wd_sys_dictionary` VALUES ('3', 'xxxxx', 'ppiwee', 'yyyyy', '14', '\0', '\0', '2023-08-09 15:35:48', '2023-08-09 15:35:48');
INSERT INTO `wd_sys_dictionary` VALUES ('4', 'xxyyxxx', 'ppeeiwee', '32yyyyy', '18', '\0', '', '2023-08-09 15:36:40', '2023-08-09 15:39:36');
INSERT INTO `wd_sys_dictionary` VALUES ('5', '革该两44', '664564', '包做消在矿产更制且如复接风见过题清。。', '71', '', '\0', '2023-09-23 15:12:49', '2023-09-23 15:12:49');

-- ----------------------------
-- Table structure for wd_sys_dictionary_data
-- ----------------------------
DROP TABLE IF EXISTS `wd_sys_dictionary_data`;
CREATE TABLE `wd_sys_dictionary_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dict_id` bigint(20) NOT NULL COMMENT '字典id',
  `data_key` varchar(50) NOT NULL COMMENT '字典数据项键',
  `data_value` varchar(100) NOT NULL COMMENT '字段数据项值',
  `data_alias` varchar(50) DEFAULT NULL COMMENT '字典数据项标签',
  `description` varchar(120) DEFAULT NULL COMMENT '描述',
  `data_default` bit(1) DEFAULT b'0' COMMENT '默认项',
  `orders` bigint(11) DEFAULT '0' COMMENT '排序',
  `disabled` bit(1) DEFAULT b'0' COMMENT '禁用',
  `deleted` bit(1) DEFAULT b'0' COMMENT '删除',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_date` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dict_id` (`dict_id`,`data_key`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COMMENT='字典数据';

-- ----------------------------
-- Records of wd_sys_dictionary_data
-- ----------------------------
INSERT INTO `wd_sys_dictionary_data` VALUES ('1', '1', '0', '男', 'MALE', '', '', '0', '\0', '\0', '2023-07-05 17:43:04', '2023-07-05 17:43:07');
INSERT INTO `wd_sys_dictionary_data` VALUES ('2', '1', '1', '女', 'FEMALE', null, '\0', '1', '\0', '\0', '2023-07-05 17:43:29', '2023-07-05 17:43:31');
INSERT INTO `wd_sys_dictionary_data` VALUES ('3', '1', '2', '未知', 'UNKNOW', null, '\0', '2', '\0', '\0', '2023-07-05 17:44:12', '2023-07-05 17:44:15');
INSERT INTO `wd_sys_dictionary_data` VALUES ('4', '4', '023421', '大手', 'DA', null, '\0', '0', '\0', '', '2023-08-09 15:39:10', '2023-08-09 15:39:10');
INSERT INTO `wd_sys_dictionary_data` VALUES ('5', '2', '33444', 'mmmmm', null, 'hhhh', '\0', '0', '\0', '\0', '2023-08-23 18:43:24', '2023-08-23 18:43:24');
INSERT INTO `wd_sys_dictionary_data` VALUES ('6', '2', '34444', 'mmmmm', null, 'hhhh', '\0', '0', '\0', '\0', '2023-08-23 18:45:10', '2023-08-23 18:45:10');
INSERT INTO `wd_sys_dictionary_data` VALUES ('7', '2', '666644', 'mmmmm', null, 'hhhh', '\0', '0', '\0', '\0', '2023-08-23 18:47:27', '2023-08-23 18:47:27');
INSERT INTO `wd_sys_dictionary_data` VALUES ('8', '2', '5546644', 'mmmmm', null, 'hhhh', '\0', '0', '\0', '\0', '2023-08-23 18:48:31', '2023-08-23 18:48:31');
INSERT INTO `wd_sys_dictionary_data` VALUES ('9', '2', '588', 'mm344mm', null, 'hhhh', '\0', '0', '\0', '\0', '2023-08-23 18:49:57', '2023-08-23 18:49:57');
INSERT INTO `wd_sys_dictionary_data` VALUES ('10', '2', '328', 'ggm344mm', null, 'hhhh', '\0', '0', '\0', '\0', '2023-08-23 18:55:55', '2023-08-23 18:55:55');
INSERT INTO `wd_sys_dictionary_data` VALUES ('11', '2', '5428', 'g3344mm', null, 'hhhh', '\0', '0', '\0', '\0', '2023-08-23 18:56:41', '2023-08-23 18:56:41');
INSERT INTO `wd_sys_dictionary_data` VALUES ('12', '2', '44228', 'g33344mm', null, 'hhhh', '\0', '0', '\0', '\0', '2023-08-23 19:00:05', '2023-08-23 19:00:05');
INSERT INTO `wd_sys_dictionary_data` VALUES ('13', '2', '5544228', 'g33344mm', null, 'hhhh', '\0', '0', '\0', '\0', '2023-08-23 19:01:44', '2023-08-23 19:01:44');
INSERT INTO `wd_sys_dictionary_data` VALUES ('14', '2', '6666228', 'g33344mm', null, 'hhhh', '\0', '0', '\0', '\0', '2023-08-23 19:03:12', '2023-08-23 19:03:12');
INSERT INTO `wd_sys_dictionary_data` VALUES ('15', '2', 'yyyyy', 'mmmmm', null, 'hhhh', '\0', '0', '\0', '\0', '2023-08-23 19:04:05', '2023-08-23 19:04:05');

-- ----------------------------
-- Table structure for wd_sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `wd_sys_login_log`;
CREATE TABLE `wd_sys_login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `uid` varchar(50) NOT NULL COMMENT '帐号(用户名)',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态',
  `app_terminal_type` tinyint(4) DEFAULT NULL COMMENT '应用终端类型',
  `platform_type` tinyint(4) DEFAULT NULL COMMENT '平台类型',
  `content` varchar(100) NOT NULL COMMENT '日志内容',
  `ip` varchar(50) DEFAULT NULL COMMENT 'ip地址',
  `location` varchar(100) DEFAULT NULL COMMENT '位置',
  `deleted` bit(1) DEFAULT b'0' COMMENT '删除',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_date` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=520 DEFAULT CHARSET=utf8mb4 COMMENT='登录日志';

-- ----------------------------
-- Records of wd_sys_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for wd_sys_message
-- ----------------------------
DROP TABLE IF EXISTS `wd_sys_message`;
CREATE TABLE `wd_sys_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `from_id` bigint(20) DEFAULT NULL,
  `to_id` bigint(20) NOT NULL,
  `from_platform` tinyint(4) DEFAULT NULL COMMENT '发送平台',
  `to_platform` tinyint(4) DEFAULT NULL COMMENT '接收平台',
  `msg_type` tinyint(4) DEFAULT NULL COMMENT '消息类型',
  `title` varchar(100) DEFAULT NULL COMMENT '消息标题',
  `content` varchar(1000) DEFAULT NULL COMMENT '消息内容',
  `meta_id` bigint(20) DEFAULT NULL COMMENT '消息源关联ID',
  `reading` bit(1) DEFAULT b'0' COMMENT '已读',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_date` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=utf8 COMMENT='系统消息';

-- ----------------------------
-- Records of wd_sys_message
-- ----------------------------
INSERT INTO `wd_sys_message` VALUES ('1', '2', '1', '0', '0', '0', '之等千44会头', 'sint exercitation officia', '1', '', '\0', '2023-09-20 02:17:38', '2023-09-20 02:17:38');
INSERT INTO `wd_sys_message` VALUES ('2', '2', '2', '0', '0', '0', '之等千44会头', 'sint exercitation officia', '1', '', '\0', '2023-09-20 02:17:38', '2023-09-20 02:17:38');
INSERT INTO `wd_sys_message` VALUES ('3', '2', '3', '0', '0', '0', '之等千44会头', 'sint exercitation officia', '1', '\0', '\0', '2023-09-20 02:17:38', '2023-09-20 02:17:38');
INSERT INTO `wd_sys_message` VALUES ('4', '2', '35', '0', '0', '0', '之等千44会头', 'sint exercitation officia', '1', '\0', '\0', '2023-09-20 02:17:38', '2023-09-20 02:17:38');
INSERT INTO `wd_sys_message` VALUES ('5', '2', '36', '0', '0', '0', '之等千44会头', 'sint exercitation officia', '1', '\0', '\0', '2023-09-20 02:17:38', '2023-09-20 02:17:38');
INSERT INTO `wd_sys_message` VALUES ('6', '2', '37', '0', '0', '0', '之等千44会头', 'sint exercitation officia', '1', '\0', '\0', '2023-09-20 02:17:38', '2023-09-20 02:17:38');
INSERT INTO `wd_sys_message` VALUES ('7', '2', '38', '0', '0', '0', '之等千44会头', 'sint exercitation officia', '1', '\0', '\0', '2023-09-20 02:17:38', '2023-09-20 02:17:38');
INSERT INTO `wd_sys_message` VALUES ('8', '2', '39', '0', '0', '0', '之等千44会头', 'sint exercitation officia', '1', '\0', '\0', '2023-09-20 02:17:38', '2023-09-20 02:17:38');
INSERT INTO `wd_sys_message` VALUES ('9', '2', '40', '0', '0', '0', '之等千44会头', 'sint exercitation officia', '1', '\0', '\0', '2023-09-20 02:17:38', '2023-09-20 02:17:38');
INSERT INTO `wd_sys_message` VALUES ('10', '2', '1', '0', '0', '0', '之等千44会头', 'sint exercitation officia', '1', '', '\0', '2023-09-20 02:18:37', '2023-09-20 02:18:37');
INSERT INTO `wd_sys_message` VALUES ('11', '2', '2', '0', '0', '0', '之等千44会头', 'sint exercitation officia', '1', '', '\0', '2023-09-20 02:18:37', '2023-09-20 02:18:37');
INSERT INTO `wd_sys_message` VALUES ('12', '2', '3', '0', '0', '0', '之等千44会头', 'sint exercitation officia', '1', '\0', '\0', '2023-09-20 02:18:37', '2023-09-20 02:18:37');
INSERT INTO `wd_sys_message` VALUES ('13', '2', '35', '0', '0', '0', '之等千44会头', 'sint exercitation officia', '1', '\0', '\0', '2023-09-20 02:18:37', '2023-09-20 02:18:37');
INSERT INTO `wd_sys_message` VALUES ('14', '2', '36', '0', '0', '0', '之等千44会头', 'sint exercitation officia', '1', '\0', '\0', '2023-09-20 02:18:37', '2023-09-20 02:18:37');
INSERT INTO `wd_sys_message` VALUES ('15', '2', '37', '0', '0', '0', '之等千44会头', 'sint exercitation officia', '1', '\0', '\0', '2023-09-20 02:18:37', '2023-09-20 02:18:37');
INSERT INTO `wd_sys_message` VALUES ('16', '2', '38', '0', '0', '0', '之等千44会头', 'sint exercitation officia', '1', '\0', '\0', '2023-09-20 02:18:38', '2023-09-20 02:18:38');
INSERT INTO `wd_sys_message` VALUES ('17', '2', '39', '0', '0', '0', '之等千44会头', 'sint exercitation officia', '1', '\0', '\0', '2023-09-20 02:18:38', '2023-09-20 02:18:38');
INSERT INTO `wd_sys_message` VALUES ('18', '2', '40', '0', '0', '0', '之等千44会头', 'sint exercitation officia', '1', '\0', '\0', '2023-09-20 02:18:38', '2023-09-20 02:18:38');
INSERT INTO `wd_sys_message` VALUES ('19', '1', '1', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '', '\0', '2023-09-23 16:37:12', '2023-09-23 16:37:12');
INSERT INTO `wd_sys_message` VALUES ('20', '1', '2', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-23 16:37:12', '2023-09-23 16:37:12');
INSERT INTO `wd_sys_message` VALUES ('21', '1', '3', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-23 16:37:12', '2023-09-23 16:37:12');
INSERT INTO `wd_sys_message` VALUES ('22', '1', '35', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-23 16:37:12', '2023-09-23 16:37:12');
INSERT INTO `wd_sys_message` VALUES ('23', '1', '36', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-23 16:37:12', '2023-09-23 16:37:12');
INSERT INTO `wd_sys_message` VALUES ('24', '1', '37', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-23 16:37:12', '2023-09-23 16:37:12');
INSERT INTO `wd_sys_message` VALUES ('25', '1', '38', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-23 16:37:12', '2023-09-23 16:37:12');
INSERT INTO `wd_sys_message` VALUES ('26', '1', '39', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-23 16:37:12', '2023-09-23 16:37:12');
INSERT INTO `wd_sys_message` VALUES ('27', '1', '40', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-23 16:37:12', '2023-09-23 16:37:12');
INSERT INTO `wd_sys_message` VALUES ('28', '1', '1', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '', '\0', '2023-09-25 21:18:38', '2023-09-25 21:18:38');
INSERT INTO `wd_sys_message` VALUES ('29', '1', '2', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-25 21:18:39', '2023-09-25 21:18:39');
INSERT INTO `wd_sys_message` VALUES ('30', '1', '3', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-25 21:18:39', '2023-09-25 21:18:39');
INSERT INTO `wd_sys_message` VALUES ('31', '1', '35', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-25 21:18:39', '2023-09-25 21:18:39');
INSERT INTO `wd_sys_message` VALUES ('32', '1', '36', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-25 21:18:39', '2023-09-25 21:18:39');
INSERT INTO `wd_sys_message` VALUES ('33', '1', '37', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-25 21:18:39', '2023-09-25 21:18:39');
INSERT INTO `wd_sys_message` VALUES ('34', '1', '38', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-25 21:18:39', '2023-09-25 21:18:39');
INSERT INTO `wd_sys_message` VALUES ('35', '1', '39', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-25 21:18:39', '2023-09-25 21:18:39');
INSERT INTO `wd_sys_message` VALUES ('36', '1', '40', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-25 21:18:39', '2023-09-25 21:18:39');
INSERT INTO `wd_sys_message` VALUES ('37', '2', '1', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '', '\0', '2023-09-25 21:21:09', '2023-09-25 21:21:09');
INSERT INTO `wd_sys_message` VALUES ('38', '2', '2', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 21:21:09', '2023-09-25 21:21:09');
INSERT INTO `wd_sys_message` VALUES ('39', '2', '3', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 21:21:09', '2023-09-25 21:21:09');
INSERT INTO `wd_sys_message` VALUES ('40', '2', '35', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 21:21:09', '2023-09-25 21:21:09');
INSERT INTO `wd_sys_message` VALUES ('41', '2', '36', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 21:21:09', '2023-09-25 21:21:09');
INSERT INTO `wd_sys_message` VALUES ('42', '2', '37', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 21:21:09', '2023-09-25 21:21:09');
INSERT INTO `wd_sys_message` VALUES ('43', '2', '38', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 21:21:09', '2023-09-25 21:21:09');
INSERT INTO `wd_sys_message` VALUES ('44', '2', '39', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 21:21:09', '2023-09-25 21:21:09');
INSERT INTO `wd_sys_message` VALUES ('45', '2', '40', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 21:21:09', '2023-09-25 21:21:09');
INSERT INTO `wd_sys_message` VALUES ('46', '2', '1', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '', '\0', '2023-09-25 21:21:36', '2023-09-25 21:21:36');
INSERT INTO `wd_sys_message` VALUES ('47', '2', '2', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 21:21:36', '2023-09-25 21:21:36');
INSERT INTO `wd_sys_message` VALUES ('48', '2', '3', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 21:21:36', '2023-09-25 21:21:36');
INSERT INTO `wd_sys_message` VALUES ('49', '2', '35', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 21:21:36', '2023-09-25 21:21:36');
INSERT INTO `wd_sys_message` VALUES ('50', '2', '36', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 21:21:36', '2023-09-25 21:21:36');
INSERT INTO `wd_sys_message` VALUES ('51', '2', '37', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 21:21:36', '2023-09-25 21:21:36');
INSERT INTO `wd_sys_message` VALUES ('52', '2', '38', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 21:21:36', '2023-09-25 21:21:36');
INSERT INTO `wd_sys_message` VALUES ('53', '2', '39', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 21:21:36', '2023-09-25 21:21:36');
INSERT INTO `wd_sys_message` VALUES ('54', '2', '40', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 21:21:36', '2023-09-25 21:21:36');
INSERT INTO `wd_sys_message` VALUES ('55', '2', '1', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '', '\0', '2023-09-25 21:23:28', '2023-09-25 21:23:28');
INSERT INTO `wd_sys_message` VALUES ('56', '2', '2', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 21:23:28', '2023-09-25 21:23:28');
INSERT INTO `wd_sys_message` VALUES ('57', '2', '3', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 21:23:28', '2023-09-25 21:23:28');
INSERT INTO `wd_sys_message` VALUES ('58', '2', '35', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 21:23:28', '2023-09-25 21:23:28');
INSERT INTO `wd_sys_message` VALUES ('59', '2', '36', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 21:23:28', '2023-09-25 21:23:28');
INSERT INTO `wd_sys_message` VALUES ('60', '2', '37', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 21:23:28', '2023-09-25 21:23:28');
INSERT INTO `wd_sys_message` VALUES ('61', '2', '38', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 21:23:28', '2023-09-25 21:23:28');
INSERT INTO `wd_sys_message` VALUES ('62', '2', '39', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 21:23:28', '2023-09-25 21:23:28');
INSERT INTO `wd_sys_message` VALUES ('63', '2', '40', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 21:23:28', '2023-09-25 21:23:28');
INSERT INTO `wd_sys_message` VALUES ('64', '2', '1', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '', '\0', '2023-09-25 21:54:38', '2023-09-25 21:54:38');
INSERT INTO `wd_sys_message` VALUES ('65', '2', '2', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 21:54:38', '2023-09-25 21:54:38');
INSERT INTO `wd_sys_message` VALUES ('66', '2', '3', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 21:54:38', '2023-09-25 21:54:38');
INSERT INTO `wd_sys_message` VALUES ('67', '2', '35', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 21:54:38', '2023-09-25 21:54:38');
INSERT INTO `wd_sys_message` VALUES ('68', '2', '36', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 21:54:38', '2023-09-25 21:54:38');
INSERT INTO `wd_sys_message` VALUES ('69', '2', '37', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 21:54:38', '2023-09-25 21:54:38');
INSERT INTO `wd_sys_message` VALUES ('70', '2', '38', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 21:54:38', '2023-09-25 21:54:38');
INSERT INTO `wd_sys_message` VALUES ('71', '2', '39', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 21:54:38', '2023-09-25 21:54:38');
INSERT INTO `wd_sys_message` VALUES ('72', '2', '40', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 21:54:38', '2023-09-25 21:54:38');
INSERT INTO `wd_sys_message` VALUES ('73', '2', '1', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '', '\0', '2023-09-25 21:55:20', '2023-09-25 21:55:20');
INSERT INTO `wd_sys_message` VALUES ('74', '2', '2', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 21:55:20', '2023-09-25 21:55:20');
INSERT INTO `wd_sys_message` VALUES ('75', '2', '3', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 21:55:20', '2023-09-25 21:55:20');
INSERT INTO `wd_sys_message` VALUES ('76', '2', '35', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 21:55:20', '2023-09-25 21:55:20');
INSERT INTO `wd_sys_message` VALUES ('77', '2', '36', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 21:55:20', '2023-09-25 21:55:20');
INSERT INTO `wd_sys_message` VALUES ('78', '2', '37', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 21:55:20', '2023-09-25 21:55:20');
INSERT INTO `wd_sys_message` VALUES ('79', '2', '38', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 21:55:20', '2023-09-25 21:55:20');
INSERT INTO `wd_sys_message` VALUES ('80', '2', '39', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 21:55:20', '2023-09-25 21:55:20');
INSERT INTO `wd_sys_message` VALUES ('81', '2', '40', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 21:55:20', '2023-09-25 21:55:20');
INSERT INTO `wd_sys_message` VALUES ('82', '2', '1', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '', '\0', '2023-09-25 22:05:27', '2023-09-25 22:05:27');
INSERT INTO `wd_sys_message` VALUES ('83', '2', '2', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 22:05:27', '2023-09-25 22:05:27');
INSERT INTO `wd_sys_message` VALUES ('84', '2', '3', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 22:05:27', '2023-09-25 22:05:27');
INSERT INTO `wd_sys_message` VALUES ('85', '2', '35', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 22:05:27', '2023-09-25 22:05:27');
INSERT INTO `wd_sys_message` VALUES ('86', '2', '36', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 22:05:27', '2023-09-25 22:05:27');
INSERT INTO `wd_sys_message` VALUES ('87', '2', '37', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 22:05:27', '2023-09-25 22:05:27');
INSERT INTO `wd_sys_message` VALUES ('88', '2', '38', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 22:05:27', '2023-09-25 22:05:27');
INSERT INTO `wd_sys_message` VALUES ('89', '2', '39', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 22:05:27', '2023-09-25 22:05:27');
INSERT INTO `wd_sys_message` VALUES ('90', '2', '40', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 22:05:27', '2023-09-25 22:05:27');
INSERT INTO `wd_sys_message` VALUES ('91', '2', '1', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '', '\0', '2023-09-25 22:13:48', '2023-09-25 22:13:48');
INSERT INTO `wd_sys_message` VALUES ('92', '2', '2', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 22:13:48', '2023-09-25 22:13:48');
INSERT INTO `wd_sys_message` VALUES ('93', '2', '3', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 22:13:48', '2023-09-25 22:13:48');
INSERT INTO `wd_sys_message` VALUES ('94', '2', '35', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 22:13:48', '2023-09-25 22:13:48');
INSERT INTO `wd_sys_message` VALUES ('95', '2', '36', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 22:13:48', '2023-09-25 22:13:48');
INSERT INTO `wd_sys_message` VALUES ('96', '2', '37', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 22:13:48', '2023-09-25 22:13:48');
INSERT INTO `wd_sys_message` VALUES ('97', '2', '38', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 22:13:48', '2023-09-25 22:13:48');
INSERT INTO `wd_sys_message` VALUES ('98', '2', '39', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 22:13:48', '2023-09-25 22:13:48');
INSERT INTO `wd_sys_message` VALUES ('99', '2', '40', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 22:13:48', '2023-09-25 22:13:48');
INSERT INTO `wd_sys_message` VALUES ('100', '2', '1', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '', '\0', '2023-09-25 22:15:22', '2023-09-25 22:15:22');
INSERT INTO `wd_sys_message` VALUES ('101', '2', '2', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 22:15:22', '2023-09-25 22:15:22');
INSERT INTO `wd_sys_message` VALUES ('102', '2', '3', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 22:15:22', '2023-09-25 22:15:22');
INSERT INTO `wd_sys_message` VALUES ('103', '2', '35', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 22:15:22', '2023-09-25 22:15:22');
INSERT INTO `wd_sys_message` VALUES ('104', '2', '36', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 22:15:22', '2023-09-25 22:15:22');
INSERT INTO `wd_sys_message` VALUES ('105', '2', '37', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 22:15:22', '2023-09-25 22:15:22');
INSERT INTO `wd_sys_message` VALUES ('106', '2', '38', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 22:15:22', '2023-09-25 22:15:22');
INSERT INTO `wd_sys_message` VALUES ('107', '2', '39', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 22:15:22', '2023-09-25 22:15:22');
INSERT INTO `wd_sys_message` VALUES ('108', '2', '40', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 22:15:22', '2023-09-25 22:15:22');
INSERT INTO `wd_sys_message` VALUES ('109', '2', '1', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '', '\0', '2023-09-25 22:15:32', '2023-09-25 22:15:32');
INSERT INTO `wd_sys_message` VALUES ('110', '2', '2', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 22:15:32', '2023-09-25 22:15:32');
INSERT INTO `wd_sys_message` VALUES ('111', '2', '3', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 22:15:32', '2023-09-25 22:15:32');
INSERT INTO `wd_sys_message` VALUES ('112', '2', '35', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 22:15:32', '2023-09-25 22:15:32');
INSERT INTO `wd_sys_message` VALUES ('113', '2', '36', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 22:15:32', '2023-09-25 22:15:32');
INSERT INTO `wd_sys_message` VALUES ('114', '2', '37', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 22:15:32', '2023-09-25 22:15:32');
INSERT INTO `wd_sys_message` VALUES ('115', '2', '38', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 22:15:32', '2023-09-25 22:15:32');
INSERT INTO `wd_sys_message` VALUES ('116', '2', '39', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 22:15:32', '2023-09-25 22:15:32');
INSERT INTO `wd_sys_message` VALUES ('117', '2', '40', '0', '0', '0', '之等千44会头1', 'sint exercitation officia1', '1', '\0', '\0', '2023-09-25 22:15:32', '2023-09-25 22:15:32');
INSERT INTO `wd_sys_message` VALUES ('118', '1', '1', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '', '\0', '2023-09-25 22:56:18', '2023-09-25 22:56:18');
INSERT INTO `wd_sys_message` VALUES ('119', '1', '2', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-25 22:56:18', '2023-09-25 22:56:18');
INSERT INTO `wd_sys_message` VALUES ('120', '1', '3', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-25 22:56:18', '2023-09-25 22:56:18');
INSERT INTO `wd_sys_message` VALUES ('121', '1', '35', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-25 22:56:18', '2023-09-25 22:56:18');
INSERT INTO `wd_sys_message` VALUES ('122', '1', '36', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-25 22:56:18', '2023-09-25 22:56:18');
INSERT INTO `wd_sys_message` VALUES ('123', '1', '37', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-25 22:56:18', '2023-09-25 22:56:18');
INSERT INTO `wd_sys_message` VALUES ('124', '1', '38', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-25 22:56:18', '2023-09-25 22:56:18');
INSERT INTO `wd_sys_message` VALUES ('125', '1', '39', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-25 22:56:18', '2023-09-25 22:56:18');
INSERT INTO `wd_sys_message` VALUES ('126', '1', '40', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-25 22:56:18', '2023-09-25 22:56:18');
INSERT INTO `wd_sys_message` VALUES ('127', '1', '1', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '', '\0', '2023-09-25 22:56:54', '2023-09-25 22:56:54');
INSERT INTO `wd_sys_message` VALUES ('128', '1', '2', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-25 22:56:54', '2023-09-25 22:56:54');
INSERT INTO `wd_sys_message` VALUES ('129', '1', '3', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-25 22:56:54', '2023-09-25 22:56:54');
INSERT INTO `wd_sys_message` VALUES ('130', '1', '35', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-25 22:56:54', '2023-09-25 22:56:54');
INSERT INTO `wd_sys_message` VALUES ('131', '1', '36', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-25 22:56:54', '2023-09-25 22:56:54');
INSERT INTO `wd_sys_message` VALUES ('132', '1', '37', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-25 22:56:54', '2023-09-25 22:56:54');
INSERT INTO `wd_sys_message` VALUES ('133', '1', '38', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-25 22:56:54', '2023-09-25 22:56:54');
INSERT INTO `wd_sys_message` VALUES ('134', '1', '39', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-25 22:56:54', '2023-09-25 22:56:54');
INSERT INTO `wd_sys_message` VALUES ('135', '1', '40', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-25 22:56:54', '2023-09-25 22:56:54');
INSERT INTO `wd_sys_message` VALUES ('136', '1', '1', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '', '\0', '2023-09-28 14:02:28', '2023-09-28 14:02:28');
INSERT INTO `wd_sys_message` VALUES ('137', '1', '2', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:02:28', '2023-09-28 14:02:28');
INSERT INTO `wd_sys_message` VALUES ('138', '1', '3', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:02:28', '2023-09-28 14:02:28');
INSERT INTO `wd_sys_message` VALUES ('139', '1', '35', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:02:28', '2023-09-28 14:02:28');
INSERT INTO `wd_sys_message` VALUES ('140', '1', '36', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:02:28', '2023-09-28 14:02:28');
INSERT INTO `wd_sys_message` VALUES ('141', '1', '37', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:02:28', '2023-09-28 14:02:28');
INSERT INTO `wd_sys_message` VALUES ('142', '1', '38', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:02:28', '2023-09-28 14:02:28');
INSERT INTO `wd_sys_message` VALUES ('143', '1', '39', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:02:28', '2023-09-28 14:02:28');
INSERT INTO `wd_sys_message` VALUES ('144', '1', '40', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:02:28', '2023-09-28 14:02:28');
INSERT INTO `wd_sys_message` VALUES ('145', '1', '1', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '', '\0', '2023-09-28 14:21:47', '2023-09-28 14:21:47');
INSERT INTO `wd_sys_message` VALUES ('146', '1', '2', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:21:47', '2023-09-28 14:21:47');
INSERT INTO `wd_sys_message` VALUES ('147', '1', '3', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:21:47', '2023-09-28 14:21:47');
INSERT INTO `wd_sys_message` VALUES ('148', '1', '35', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:21:47', '2023-09-28 14:21:47');
INSERT INTO `wd_sys_message` VALUES ('149', '1', '36', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:21:47', '2023-09-28 14:21:47');
INSERT INTO `wd_sys_message` VALUES ('150', '1', '37', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:21:47', '2023-09-28 14:21:47');
INSERT INTO `wd_sys_message` VALUES ('151', '1', '38', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:21:47', '2023-09-28 14:21:47');
INSERT INTO `wd_sys_message` VALUES ('152', '1', '39', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:21:47', '2023-09-28 14:21:47');
INSERT INTO `wd_sys_message` VALUES ('153', '1', '40', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:21:47', '2023-09-28 14:21:47');
INSERT INTO `wd_sys_message` VALUES ('154', '1', '1', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '', '\0', '2023-09-28 14:38:17', '2023-09-28 14:38:17');
INSERT INTO `wd_sys_message` VALUES ('155', '1', '2', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:38:17', '2023-09-28 14:38:17');
INSERT INTO `wd_sys_message` VALUES ('156', '1', '3', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:38:17', '2023-09-28 14:38:17');
INSERT INTO `wd_sys_message` VALUES ('157', '1', '35', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:38:17', '2023-09-28 14:38:17');
INSERT INTO `wd_sys_message` VALUES ('158', '1', '36', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:38:17', '2023-09-28 14:38:17');
INSERT INTO `wd_sys_message` VALUES ('159', '1', '37', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:38:17', '2023-09-28 14:38:17');
INSERT INTO `wd_sys_message` VALUES ('160', '1', '38', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:38:17', '2023-09-28 14:38:17');
INSERT INTO `wd_sys_message` VALUES ('161', '1', '39', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:38:17', '2023-09-28 14:38:17');
INSERT INTO `wd_sys_message` VALUES ('162', '1', '40', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:38:17', '2023-09-28 14:38:17');
INSERT INTO `wd_sys_message` VALUES ('163', '1', '1', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '', '\0', '2023-09-28 14:39:02', '2023-09-28 14:39:02');
INSERT INTO `wd_sys_message` VALUES ('164', '1', '2', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:39:02', '2023-09-28 14:39:02');
INSERT INTO `wd_sys_message` VALUES ('165', '1', '3', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:39:02', '2023-09-28 14:39:02');
INSERT INTO `wd_sys_message` VALUES ('166', '1', '35', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:39:02', '2023-09-28 14:39:02');
INSERT INTO `wd_sys_message` VALUES ('167', '1', '36', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:39:02', '2023-09-28 14:39:02');
INSERT INTO `wd_sys_message` VALUES ('168', '1', '37', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:39:02', '2023-09-28 14:39:02');
INSERT INTO `wd_sys_message` VALUES ('169', '1', '38', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:39:02', '2023-09-28 14:39:02');
INSERT INTO `wd_sys_message` VALUES ('170', '1', '39', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:39:02', '2023-09-28 14:39:02');
INSERT INTO `wd_sys_message` VALUES ('171', '1', '40', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:39:02', '2023-09-28 14:39:02');
INSERT INTO `wd_sys_message` VALUES ('172', '1', '1', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '', '\0', '2023-09-28 14:40:13', '2023-09-28 14:40:13');
INSERT INTO `wd_sys_message` VALUES ('173', '1', '2', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:40:13', '2023-09-28 14:40:13');
INSERT INTO `wd_sys_message` VALUES ('174', '1', '3', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:40:13', '2023-09-28 14:40:13');
INSERT INTO `wd_sys_message` VALUES ('175', '1', '35', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:40:13', '2023-09-28 14:40:13');
INSERT INTO `wd_sys_message` VALUES ('176', '1', '36', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:40:13', '2023-09-28 14:40:13');
INSERT INTO `wd_sys_message` VALUES ('177', '1', '37', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:40:13', '2023-09-28 14:40:13');
INSERT INTO `wd_sys_message` VALUES ('178', '1', '38', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:40:13', '2023-09-28 14:40:13');
INSERT INTO `wd_sys_message` VALUES ('179', '1', '39', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:40:13', '2023-09-28 14:40:13');
INSERT INTO `wd_sys_message` VALUES ('180', '1', '40', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:40:13', '2023-09-28 14:40:13');
INSERT INTO `wd_sys_message` VALUES ('181', '1', '1', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '', '\0', '2023-09-28 14:42:19', '2023-09-28 14:42:19');
INSERT INTO `wd_sys_message` VALUES ('182', '1', '2', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:42:19', '2023-09-28 14:42:19');
INSERT INTO `wd_sys_message` VALUES ('183', '1', '3', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:42:19', '2023-09-28 14:42:19');
INSERT INTO `wd_sys_message` VALUES ('184', '1', '35', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:42:19', '2023-09-28 14:42:19');
INSERT INTO `wd_sys_message` VALUES ('185', '1', '36', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:42:19', '2023-09-28 14:42:19');
INSERT INTO `wd_sys_message` VALUES ('186', '1', '37', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:42:19', '2023-09-28 14:42:19');
INSERT INTO `wd_sys_message` VALUES ('187', '1', '38', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:42:19', '2023-09-28 14:42:19');
INSERT INTO `wd_sys_message` VALUES ('188', '1', '39', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:42:19', '2023-09-28 14:42:19');
INSERT INTO `wd_sys_message` VALUES ('189', '1', '40', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:42:19', '2023-09-28 14:42:19');
INSERT INTO `wd_sys_message` VALUES ('190', '1', '1', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '', '\0', '2023-09-28 14:43:03', '2023-09-28 14:43:03');
INSERT INTO `wd_sys_message` VALUES ('191', '1', '2', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:43:03', '2023-09-28 14:43:03');
INSERT INTO `wd_sys_message` VALUES ('192', '1', '3', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:43:03', '2023-09-28 14:43:03');
INSERT INTO `wd_sys_message` VALUES ('193', '1', '35', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:43:03', '2023-09-28 14:43:03');
INSERT INTO `wd_sys_message` VALUES ('194', '1', '36', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:43:03', '2023-09-28 14:43:03');
INSERT INTO `wd_sys_message` VALUES ('195', '1', '37', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:43:03', '2023-09-28 14:43:03');
INSERT INTO `wd_sys_message` VALUES ('196', '1', '38', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:43:03', '2023-09-28 14:43:03');
INSERT INTO `wd_sys_message` VALUES ('197', '1', '39', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:43:03', '2023-09-28 14:43:03');
INSERT INTO `wd_sys_message` VALUES ('198', '1', '40', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:43:03', '2023-09-28 14:43:03');
INSERT INTO `wd_sys_message` VALUES ('199', '1', '1', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '', '\0', '2023-09-28 14:44:08', '2023-09-28 14:44:08');
INSERT INTO `wd_sys_message` VALUES ('200', '1', '2', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:44:08', '2023-09-28 14:44:08');
INSERT INTO `wd_sys_message` VALUES ('201', '1', '3', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:44:08', '2023-09-28 14:44:08');
INSERT INTO `wd_sys_message` VALUES ('202', '1', '35', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:44:08', '2023-09-28 14:44:08');
INSERT INTO `wd_sys_message` VALUES ('203', '1', '36', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:44:08', '2023-09-28 14:44:08');
INSERT INTO `wd_sys_message` VALUES ('204', '1', '37', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:44:08', '2023-09-28 14:44:08');
INSERT INTO `wd_sys_message` VALUES ('205', '1', '38', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:44:08', '2023-09-28 14:44:08');
INSERT INTO `wd_sys_message` VALUES ('206', '1', '39', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:44:08', '2023-09-28 14:44:08');
INSERT INTO `wd_sys_message` VALUES ('207', '1', '40', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:44:08', '2023-09-28 14:44:08');
INSERT INTO `wd_sys_message` VALUES ('208', '1', '1', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '', '\0', '2023-09-28 14:52:51', '2023-09-28 14:52:51');
INSERT INTO `wd_sys_message` VALUES ('209', '1', '2', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:52:51', '2023-09-28 14:52:51');
INSERT INTO `wd_sys_message` VALUES ('210', '1', '3', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:52:51', '2023-09-28 14:52:51');
INSERT INTO `wd_sys_message` VALUES ('211', '1', '35', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:52:51', '2023-09-28 14:52:51');
INSERT INTO `wd_sys_message` VALUES ('212', '1', '36', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:52:51', '2023-09-28 14:52:51');
INSERT INTO `wd_sys_message` VALUES ('213', '1', '37', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:52:51', '2023-09-28 14:52:51');
INSERT INTO `wd_sys_message` VALUES ('214', '1', '38', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:52:51', '2023-09-28 14:52:51');
INSERT INTO `wd_sys_message` VALUES ('215', '1', '39', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:52:51', '2023-09-28 14:52:51');
INSERT INTO `wd_sys_message` VALUES ('216', '1', '40', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:52:51', '2023-09-28 14:52:51');
INSERT INTO `wd_sys_message` VALUES ('217', '1', '1', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '', '\0', '2023-09-28 14:53:02', '2023-09-28 14:53:02');
INSERT INTO `wd_sys_message` VALUES ('218', '1', '2', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:53:02', '2023-09-28 14:53:02');
INSERT INTO `wd_sys_message` VALUES ('219', '1', '3', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:53:02', '2023-09-28 14:53:02');
INSERT INTO `wd_sys_message` VALUES ('220', '1', '35', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:53:02', '2023-09-28 14:53:02');
INSERT INTO `wd_sys_message` VALUES ('221', '1', '36', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:53:02', '2023-09-28 14:53:02');
INSERT INTO `wd_sys_message` VALUES ('222', '1', '37', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:53:02', '2023-09-28 14:53:02');
INSERT INTO `wd_sys_message` VALUES ('223', '1', '38', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:53:02', '2023-09-28 14:53:02');
INSERT INTO `wd_sys_message` VALUES ('224', '1', '39', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:53:02', '2023-09-28 14:53:02');
INSERT INTO `wd_sys_message` VALUES ('225', '1', '40', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:53:02', '2023-09-28 14:53:02');
INSERT INTO `wd_sys_message` VALUES ('226', '1', '1', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '', '\0', '2023-09-28 14:53:34', '2023-09-28 14:53:34');
INSERT INTO `wd_sys_message` VALUES ('227', '1', '2', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:53:34', '2023-09-28 14:53:34');
INSERT INTO `wd_sys_message` VALUES ('228', '1', '3', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:53:34', '2023-09-28 14:53:34');
INSERT INTO `wd_sys_message` VALUES ('229', '1', '35', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:53:34', '2023-09-28 14:53:34');
INSERT INTO `wd_sys_message` VALUES ('230', '1', '36', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:53:34', '2023-09-28 14:53:34');
INSERT INTO `wd_sys_message` VALUES ('231', '1', '37', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:53:34', '2023-09-28 14:53:34');
INSERT INTO `wd_sys_message` VALUES ('232', '1', '38', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:53:34', '2023-09-28 14:53:34');
INSERT INTO `wd_sys_message` VALUES ('233', '1', '39', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:53:34', '2023-09-28 14:53:34');
INSERT INTO `wd_sys_message` VALUES ('234', '1', '40', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:53:34', '2023-09-28 14:53:34');
INSERT INTO `wd_sys_message` VALUES ('235', '1', '1', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '', '\0', '2023-09-28 14:53:55', '2023-09-28 14:53:55');
INSERT INTO `wd_sys_message` VALUES ('236', '1', '2', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:53:55', '2023-09-28 14:53:55');
INSERT INTO `wd_sys_message` VALUES ('237', '1', '3', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:53:55', '2023-09-28 14:53:55');
INSERT INTO `wd_sys_message` VALUES ('238', '1', '35', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:53:55', '2023-09-28 14:53:55');
INSERT INTO `wd_sys_message` VALUES ('239', '1', '36', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:53:55', '2023-09-28 14:53:55');
INSERT INTO `wd_sys_message` VALUES ('240', '1', '37', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:53:55', '2023-09-28 14:53:55');
INSERT INTO `wd_sys_message` VALUES ('241', '1', '38', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:53:55', '2023-09-28 14:53:55');
INSERT INTO `wd_sys_message` VALUES ('242', '1', '39', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:53:55', '2023-09-28 14:53:55');
INSERT INTO `wd_sys_message` VALUES ('243', '1', '40', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 14:53:55', '2023-09-28 14:53:55');
INSERT INTO `wd_sys_message` VALUES ('244', '1', '1', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '', '\0', '2023-09-28 15:01:55', '2023-09-28 15:01:55');
INSERT INTO `wd_sys_message` VALUES ('245', '1', '2', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:01:55', '2023-09-28 15:01:55');
INSERT INTO `wd_sys_message` VALUES ('246', '1', '3', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:01:55', '2023-09-28 15:01:55');
INSERT INTO `wd_sys_message` VALUES ('247', '1', '35', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:01:55', '2023-09-28 15:01:55');
INSERT INTO `wd_sys_message` VALUES ('248', '1', '36', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:01:55', '2023-09-28 15:01:55');
INSERT INTO `wd_sys_message` VALUES ('249', '1', '37', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:01:55', '2023-09-28 15:01:55');
INSERT INTO `wd_sys_message` VALUES ('250', '1', '38', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:01:55', '2023-09-28 15:01:55');
INSERT INTO `wd_sys_message` VALUES ('251', '1', '39', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:01:55', '2023-09-28 15:01:55');
INSERT INTO `wd_sys_message` VALUES ('252', '1', '40', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:01:55', '2023-09-28 15:01:55');
INSERT INTO `wd_sys_message` VALUES ('253', '1', '1', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '', '\0', '2023-09-28 15:03:09', '2023-09-28 15:03:09');
INSERT INTO `wd_sys_message` VALUES ('254', '1', '2', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:03:09', '2023-09-28 15:03:09');
INSERT INTO `wd_sys_message` VALUES ('255', '1', '3', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:03:09', '2023-09-28 15:03:09');
INSERT INTO `wd_sys_message` VALUES ('256', '1', '35', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:03:09', '2023-09-28 15:03:09');
INSERT INTO `wd_sys_message` VALUES ('257', '1', '36', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:03:09', '2023-09-28 15:03:09');
INSERT INTO `wd_sys_message` VALUES ('258', '1', '37', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:03:09', '2023-09-28 15:03:09');
INSERT INTO `wd_sys_message` VALUES ('259', '1', '38', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:03:09', '2023-09-28 15:03:09');
INSERT INTO `wd_sys_message` VALUES ('260', '1', '39', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:03:09', '2023-09-28 15:03:09');
INSERT INTO `wd_sys_message` VALUES ('261', '1', '40', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:03:09', '2023-09-28 15:03:09');
INSERT INTO `wd_sys_message` VALUES ('262', '1', '1', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '', '\0', '2023-09-28 15:03:24', '2023-09-28 15:03:24');
INSERT INTO `wd_sys_message` VALUES ('263', '1', '2', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:03:24', '2023-09-28 15:03:24');
INSERT INTO `wd_sys_message` VALUES ('264', '1', '3', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:03:24', '2023-09-28 15:03:24');
INSERT INTO `wd_sys_message` VALUES ('265', '1', '35', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:03:24', '2023-09-28 15:03:24');
INSERT INTO `wd_sys_message` VALUES ('266', '1', '36', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:03:24', '2023-09-28 15:03:24');
INSERT INTO `wd_sys_message` VALUES ('267', '1', '37', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:03:24', '2023-09-28 15:03:24');
INSERT INTO `wd_sys_message` VALUES ('268', '1', '38', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:03:24', '2023-09-28 15:03:24');
INSERT INTO `wd_sys_message` VALUES ('269', '1', '39', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:03:24', '2023-09-28 15:03:24');
INSERT INTO `wd_sys_message` VALUES ('270', '1', '40', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:03:24', '2023-09-28 15:03:24');
INSERT INTO `wd_sys_message` VALUES ('271', '1', '1', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '', '\0', '2023-09-28 15:06:27', '2023-09-28 15:06:27');
INSERT INTO `wd_sys_message` VALUES ('272', '1', '2', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:06:27', '2023-09-28 15:06:27');
INSERT INTO `wd_sys_message` VALUES ('273', '1', '3', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:06:27', '2023-09-28 15:06:27');
INSERT INTO `wd_sys_message` VALUES ('274', '1', '35', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:06:27', '2023-09-28 15:06:27');
INSERT INTO `wd_sys_message` VALUES ('275', '1', '36', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:06:27', '2023-09-28 15:06:27');
INSERT INTO `wd_sys_message` VALUES ('276', '1', '37', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:06:27', '2023-09-28 15:06:27');
INSERT INTO `wd_sys_message` VALUES ('277', '1', '38', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:06:27', '2023-09-28 15:06:27');
INSERT INTO `wd_sys_message` VALUES ('278', '1', '39', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:06:27', '2023-09-28 15:06:27');
INSERT INTO `wd_sys_message` VALUES ('279', '1', '40', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:06:27', '2023-09-28 15:06:27');
INSERT INTO `wd_sys_message` VALUES ('280', '1', '1', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '', '\0', '2023-09-28 15:09:12', '2023-09-28 15:09:12');
INSERT INTO `wd_sys_message` VALUES ('281', '1', '2', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:09:12', '2023-09-28 15:09:12');
INSERT INTO `wd_sys_message` VALUES ('282', '1', '3', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:09:12', '2023-09-28 15:09:12');
INSERT INTO `wd_sys_message` VALUES ('283', '1', '35', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:09:12', '2023-09-28 15:09:12');
INSERT INTO `wd_sys_message` VALUES ('284', '1', '36', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:09:12', '2023-09-28 15:09:12');
INSERT INTO `wd_sys_message` VALUES ('285', '1', '37', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:09:12', '2023-09-28 15:09:12');
INSERT INTO `wd_sys_message` VALUES ('286', '1', '38', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:09:12', '2023-09-28 15:09:12');
INSERT INTO `wd_sys_message` VALUES ('287', '1', '39', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:09:12', '2023-09-28 15:09:12');
INSERT INTO `wd_sys_message` VALUES ('288', '1', '40', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:09:12', '2023-09-28 15:09:12');
INSERT INTO `wd_sys_message` VALUES ('289', '1', '1', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '', '\0', '2023-09-28 15:13:50', '2023-09-28 15:13:50');
INSERT INTO `wd_sys_message` VALUES ('290', '1', '2', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:13:50', '2023-09-28 15:13:50');
INSERT INTO `wd_sys_message` VALUES ('291', '1', '3', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:13:50', '2023-09-28 15:13:50');
INSERT INTO `wd_sys_message` VALUES ('292', '1', '35', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:13:50', '2023-09-28 15:13:50');
INSERT INTO `wd_sys_message` VALUES ('293', '1', '36', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:13:50', '2023-09-28 15:13:50');
INSERT INTO `wd_sys_message` VALUES ('294', '1', '37', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:13:50', '2023-09-28 15:13:50');
INSERT INTO `wd_sys_message` VALUES ('295', '1', '38', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:13:50', '2023-09-28 15:13:50');
INSERT INTO `wd_sys_message` VALUES ('296', '1', '39', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:13:50', '2023-09-28 15:13:50');
INSERT INTO `wd_sys_message` VALUES ('297', '1', '40', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:13:50', '2023-09-28 15:13:50');
INSERT INTO `wd_sys_message` VALUES ('298', '1', '1', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '', '\0', '2023-09-28 15:17:54', '2023-09-28 15:17:54');
INSERT INTO `wd_sys_message` VALUES ('299', '1', '2', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:17:54', '2023-09-28 15:17:54');
INSERT INTO `wd_sys_message` VALUES ('300', '1', '3', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:17:54', '2023-09-28 15:17:54');
INSERT INTO `wd_sys_message` VALUES ('301', '1', '35', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:17:54', '2023-09-28 15:17:54');
INSERT INTO `wd_sys_message` VALUES ('302', '1', '36', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:17:54', '2023-09-28 15:17:54');
INSERT INTO `wd_sys_message` VALUES ('303', '1', '37', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:17:54', '2023-09-28 15:17:54');
INSERT INTO `wd_sys_message` VALUES ('304', '1', '38', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:17:54', '2023-09-28 15:17:54');
INSERT INTO `wd_sys_message` VALUES ('305', '1', '39', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:17:54', '2023-09-28 15:17:54');
INSERT INTO `wd_sys_message` VALUES ('306', '1', '40', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-09-28 15:17:54', '2023-09-28 15:17:54');
INSERT INTO `wd_sys_message` VALUES ('307', '41', '1', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-10-16 11:05:47', '2023-10-16 11:05:47');
INSERT INTO `wd_sys_message` VALUES ('308', '41', '2', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-10-16 11:05:47', '2023-10-16 11:05:47');
INSERT INTO `wd_sys_message` VALUES ('309', '41', '3', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-10-16 11:05:47', '2023-10-16 11:05:47');
INSERT INTO `wd_sys_message` VALUES ('310', '41', '35', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-10-16 11:05:47', '2023-10-16 11:05:47');
INSERT INTO `wd_sys_message` VALUES ('311', '41', '36', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-10-16 11:05:47', '2023-10-16 11:05:47');
INSERT INTO `wd_sys_message` VALUES ('312', '41', '37', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-10-16 11:05:47', '2023-10-16 11:05:47');
INSERT INTO `wd_sys_message` VALUES ('313', '41', '38', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-10-16 11:05:47', '2023-10-16 11:05:47');
INSERT INTO `wd_sys_message` VALUES ('314', '41', '41', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '', '\0', '2023-10-16 11:05:47', '2023-10-16 11:05:47');
INSERT INTO `wd_sys_message` VALUES ('315', '41', '1', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-10-16 12:43:03', '2023-10-16 12:43:03');
INSERT INTO `wd_sys_message` VALUES ('316', '41', '2', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-10-16 12:43:03', '2023-10-16 12:43:03');
INSERT INTO `wd_sys_message` VALUES ('317', '41', '3', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-10-16 12:43:03', '2023-10-16 12:43:03');
INSERT INTO `wd_sys_message` VALUES ('318', '41', '35', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-10-16 12:43:03', '2023-10-16 12:43:03');
INSERT INTO `wd_sys_message` VALUES ('319', '41', '36', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-10-16 12:43:03', '2023-10-16 12:43:03');
INSERT INTO `wd_sys_message` VALUES ('320', '41', '37', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-10-16 12:43:03', '2023-10-16 12:43:03');
INSERT INTO `wd_sys_message` VALUES ('321', '41', '38', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-10-16 12:43:03', '2023-10-16 12:43:03');
INSERT INTO `wd_sys_message` VALUES ('322', '41', '41', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '', '\0', '2023-10-16 12:43:03', '2023-10-16 12:43:03');
INSERT INTO `wd_sys_message` VALUES ('323', '41', '1', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-10-23 17:22:11', '2023-10-23 17:22:11');
INSERT INTO `wd_sys_message` VALUES ('324', '41', '2', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-10-23 17:22:11', '2023-10-23 17:22:11');
INSERT INTO `wd_sys_message` VALUES ('325', '41', '3', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-10-23 17:22:11', '2023-10-23 17:22:11');
INSERT INTO `wd_sys_message` VALUES ('326', '41', '35', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-10-23 17:22:11', '2023-10-23 17:22:11');
INSERT INTO `wd_sys_message` VALUES ('327', '41', '36', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-10-23 17:22:11', '2023-10-23 17:22:11');
INSERT INTO `wd_sys_message` VALUES ('328', '41', '37', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-10-23 17:22:11', '2023-10-23 17:22:11');
INSERT INTO `wd_sys_message` VALUES ('329', '41', '38', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '\0', '\0', '2023-10-23 17:22:11', '2023-10-23 17:22:11');
INSERT INTO `wd_sys_message` VALUES ('330', '41', '41', '0', '0', '0', '测试公告', '这是一点公告文字', '2', '', '\0', '2023-10-23 17:22:11', '2023-10-23 17:22:11');

-- ----------------------------
-- Table structure for wd_sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `wd_sys_notice`;
CREATE TABLE `wd_sys_notice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL COMMENT '公告标题',
  `content` varchar(1000) DEFAULT NULL COMMENT '公告内容',
  `served` bit(1) DEFAULT b'0' COMMENT '已推送',
  `disabled` bit(1) DEFAULT b'0' COMMENT '禁用',
  `deleted` bit(1) DEFAULT b'0' COMMENT '删除',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='系统公告';

-- ----------------------------
-- Records of wd_sys_notice
-- ----------------------------
INSERT INTO `wd_sys_notice` VALUES ('1', '之等千会头', 'sint exercitation officia', '\0', '', '\0', '2023-09-20 01:05:28', '2023-09-25 23:10:21');
INSERT INTO `wd_sys_notice` VALUES ('2', '测试公告', '这是一点公告文字', '\0', '', '\0', '2023-09-22 10:22:54', '2023-09-22 10:22:54');
INSERT INTO `wd_sys_notice` VALUES ('3', '随便来一条公告', '水电费水电费水电费', '\0', '\0', '', '2023-09-22 10:23:07', '2023-09-22 10:23:30');
INSERT INTO `wd_sys_notice` VALUES ('4', '是大法官的房贷', '电饭锅梵蒂冈', '\0', '\0', '', '2023-09-22 10:23:44', '2023-09-22 10:23:54');
INSERT INTO `wd_sys_notice` VALUES ('5', '发生的水电费水电费', '123123123', '\0', '\0', '', '2023-09-22 10:23:49', '2023-09-22 10:23:54');

-- ----------------------------
-- Table structure for wd_sys_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `wd_sys_operation_log`;
CREATE TABLE `wd_sys_operation_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `uid` varchar(50) NOT NULL COMMENT '帐号(用户名)',
  `action_type` tinyint(4) DEFAULT NULL COMMENT '操作类型',
  `app_terminal_type` tinyint(4) DEFAULT NULL COMMENT '应用终端类型',
  `platform_type` tinyint(4) DEFAULT NULL COMMENT '平台类型',
  `module_type` tinyint(4) DEFAULT NULL COMMENT '模块类型',
  `content` varchar(500) NOT NULL COMMENT '日志内容',
  `ip` varchar(50) DEFAULT NULL COMMENT 'ip地址',
  `location` varchar(100) DEFAULT NULL COMMENT '位置',
  `mate_id` bigint(20) NOT NULL COMMENT '对应模块id',
  `deleted` bit(1) DEFAULT b'0' COMMENT '删除',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_date` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=853 DEFAULT CHARSET=utf8mb4 COMMENT='操作日志';

-- ----------------------------
-- Records of wd_sys_operation_log
-- ----------------------------

-- ----------------------------
-- Table structure for wd_sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `wd_sys_permission`;
CREATE TABLE `wd_sys_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `value` varchar(50) NOT NULL COMMENT '分类ID',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '上级权限',
  `orders` bigint(20) DEFAULT '0' COMMENT '排序',
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `value` (`value`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COMMENT='权限值';

-- ----------------------------
-- Records of wd_sys_permission
-- ----------------------------
INSERT INTO `wd_sys_permission` VALUES ('1', '配置管理', 'config:admin', '0', '0', '2023-07-05 16:02:45', '2023-07-05 16:02:48');
INSERT INTO `wd_sys_permission` VALUES ('2', '查看系统用户', 'system:user:view', '0', '1', '2023-07-05 16:03:15', '2023-07-05 16:03:17');
INSERT INTO `wd_sys_permission` VALUES ('3', '查看角色', 'role:view', '0', '5', '2023-07-05 16:04:18', '2023-07-05 16:04:21');
INSERT INTO `wd_sys_permission` VALUES ('4', '查看权限', 'permission:view', '0', '9', '2023-07-05 16:04:47', '2023-07-05 16:04:51');
INSERT INTO `wd_sys_permission` VALUES ('5', '查看字典', 'dictionary:view', '0', '13', '2023-07-05 16:05:05', '2023-07-05 16:05:08');
INSERT INTO `wd_sys_permission` VALUES ('6', '导出数据', 'data:export', '0', '17', '2023-07-05 16:07:24', '2023-07-05 16:07:26');
INSERT INTO `wd_sys_permission` VALUES ('7', '查看部门', 'dept:view', '0', '18', '2023-08-08 15:22:55', '2023-08-08 15:22:58');
INSERT INTO `wd_sys_permission` VALUES ('8', '查看岗位', 'post:view', '0', '22', '2023-08-08 15:23:18', '2023-08-08 15:23:21');
INSERT INTO `wd_sys_permission` VALUES ('9', '查看登录日志', 'login:log:view', '0', '26', '2023-08-18 11:43:46', '2023-08-18 11:43:50');
INSERT INTO `wd_sys_permission` VALUES ('10', '查看操作日志', 'operatoin:log:view', '0', '28', '2023-08-18 11:44:12', '2023-08-18 11:44:15');
INSERT INTO `wd_sys_permission` VALUES ('11', '删除登录日志', 'login:log:delete', '0', '27', '2023-08-18 11:45:26', '2023-08-18 11:45:29');
INSERT INTO `wd_sys_permission` VALUES ('12', '删除操作日志', 'operation:log:delete', '0', '29', '2023-08-18 11:46:13', '2023-08-18 11:46:15');
INSERT INTO `wd_sys_permission` VALUES ('13', '删除系统用户', 'system:user:delete', '0', '4', '2023-09-05 12:38:58', '2023-09-05 12:39:01');
INSERT INTO `wd_sys_permission` VALUES ('14', '删除角色', 'role:delete', '0', '8', '2023-09-05 12:41:40', '2023-09-05 12:41:42');
INSERT INTO `wd_sys_permission` VALUES ('15', '删除权限', 'permission:delete', '0', '12', '2023-09-05 12:44:22', '2023-09-05 12:44:25');
INSERT INTO `wd_sys_permission` VALUES ('16', '删除字典', 'dictionary:delete', '0', '16', '2023-09-05 12:48:34', '2023-09-05 12:48:38');
INSERT INTO `wd_sys_permission` VALUES ('17', '删除部门', 'dept:delete', '0', '21', '2023-09-05 12:49:12', '2023-09-05 12:49:15');
INSERT INTO `wd_sys_permission` VALUES ('18', '删除岗位', 'post:delete', '0', '25', '2023-09-05 12:49:29', '2023-09-05 12:49:32');
INSERT INTO `wd_sys_permission` VALUES ('19', '创建系统用户', 'system:user:create', '0', '2', '2023-09-05 13:23:18', '2023-09-05 13:23:21');
INSERT INTO `wd_sys_permission` VALUES ('20', '修改系统用户', 'system:user:modify', '0', '3', '2023-09-05 13:24:09', '2023-09-05 13:24:11');
INSERT INTO `wd_sys_permission` VALUES ('21', '创建角色', 'role:create', '0', '6', '2023-09-05 13:25:54', '2023-09-05 13:25:57');
INSERT INTO `wd_sys_permission` VALUES ('22', '修改角色', 'role:modify', '0', '7', '2023-09-05 13:26:35', '2023-09-05 13:26:38');
INSERT INTO `wd_sys_permission` VALUES ('24', '创建权限', 'permission:create', '0', '10', '2023-09-05 14:55:22', '2023-09-05 14:55:26');
INSERT INTO `wd_sys_permission` VALUES ('25', '修改权限', 'permission:modify', '0', '11', '2023-09-05 14:55:49', '2023-09-05 14:55:52');
INSERT INTO `wd_sys_permission` VALUES ('26', '创建字典', 'dictionary:create', '0', '14', '2023-09-05 14:56:31', '2023-09-05 14:56:34');
INSERT INTO `wd_sys_permission` VALUES ('27', '修改字典', 'dictionary:modify', '0', '15', '2023-09-05 14:57:27', '2023-09-05 14:57:29');
INSERT INTO `wd_sys_permission` VALUES ('28', '创建部门', 'dept:create', '0', '19', '2023-09-05 14:57:58', '2023-09-05 14:58:02');
INSERT INTO `wd_sys_permission` VALUES ('29', '修改部门', 'dept:modify', '0', '20', '2023-09-05 14:58:22', '2023-09-05 14:58:24');
INSERT INTO `wd_sys_permission` VALUES ('30', '创建岗位', 'post:create', '0', '23', '2023-09-05 14:58:40', '2023-09-05 14:58:42');
INSERT INTO `wd_sys_permission` VALUES ('31', '修改岗位', 'post:modify', '0', '24', '2023-09-05 14:58:54', '2023-09-05 14:58:57');
INSERT INTO `wd_sys_permission` VALUES ('32', '创建统系公告', 'notice:create', '0', '25', '2023-09-17 16:02:14', '2023-09-17 16:02:16');
INSERT INTO `wd_sys_permission` VALUES ('33', '修改系统公告', 'notice:modify', '0', '26', '2023-09-17 16:02:39', '2023-09-17 16:02:41');
INSERT INTO `wd_sys_permission` VALUES ('34', '删除系统公告', 'notice:delete', '0', '27', '2023-09-17 16:03:05', '2023-09-17 16:03:07');
INSERT INTO `wd_sys_permission` VALUES ('35', '推送系统公告', 'notice:push', '0', '28', '2023-09-17 16:03:32', '2023-09-17 16:03:35');

-- ----------------------------
-- Table structure for wd_sys_post
-- ----------------------------
DROP TABLE IF EXISTS `wd_sys_post`;
CREATE TABLE `wd_sys_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL COMMENT '岗位名称',
  `code` varchar(20) DEFAULT NULL COMMENT '岗位编号',
  `pinyin` varchar(200) DEFAULT NULL COMMENT '全拼(名称)',
  `py` varchar(20) DEFAULT NULL COMMENT '简拼(名称)',
  `description` varchar(120) DEFAULT NULL COMMENT '描述',
  `orders` bigint(11) DEFAULT '0' COMMENT '排序',
  `deleted` bit(1) DEFAULT b'0' COMMENT '删除',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_date` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`deleted`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='岗位';

-- ----------------------------
-- Records of wd_sys_post
-- ----------------------------
INSERT INTO `wd_sys_post` VALUES ('1', 'JAVA高级工程师', '774564', null, null, null, null, '\0', '2023-07-03 16:31:26', '2023-07-03 16:31:28');
INSERT INTO `wd_sys_post` VALUES ('2', 'UI设计师', '3324322', null, null, null, null, '\0', '2023-07-03 16:31:40', '2023-07-03 16:31:42');
INSERT INTO `wd_sys_post` VALUES ('3', '测试人员', '4423423', null, null, null, null, '\0', '2023-07-03 16:31:58', '2023-07-03 16:32:01');
INSERT INTO `wd_sys_post` VALUES ('4', '电话销售', '44233', null, null, null, null, '\0', '2023-07-03 16:32:23', '2023-07-03 16:32:25');
INSERT INTO `wd_sys_post` VALUES ('5', '客服', '55234', null, null, null, null, '\0', '2023-07-03 16:32:37', '2023-07-03 16:32:40');
INSERT INTO `wd_sys_post` VALUES ('6', '线下地推', 'M0565564', 'xianxiaditui', 'xxdt', '线下地推岗位', '0', '\0', '2023-09-06 09:20:59', '2023-09-06 09:20:59');
INSERT INTO `wd_sys_post` VALUES ('7', '前端开发', 'M0654654', 'qianduankaifa', 'qdkf', '前端开发', '0', '\0', '2023-09-07 09:41:27', '2023-09-07 09:41:27');

-- ----------------------------
-- Table structure for wd_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `wd_sys_role`;
CREATE TABLE `wd_sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL COMMENT '角色名称',
  `value` varchar(50) NOT NULL COMMENT '角色值',
  `description` varchar(120) DEFAULT NULL COMMENT '描述',
  `orders` bigint(11) DEFAULT '0' COMMENT '排序',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_date` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `value` (`value`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='角色';

-- ----------------------------
-- Records of wd_sys_role
-- ----------------------------
INSERT INTO `wd_sys_role` VALUES ('1', '超级管理员', 'role:super', '超级管理员', '0', '2023-07-05 16:14:56', '2023-07-05 16:14:59');
INSERT INTO `wd_sys_role` VALUES ('2', '管理员', 'role:admin', '管理员', '1', '2023-07-05 16:16:06', '2023-07-05 16:16:08');
INSERT INTO `wd_sys_role` VALUES ('3', '开发人员', 'role:developer', '开发人员', '2', '2023-07-05 16:17:11', '2023-07-05 16:17:14');
INSERT INTO `wd_sys_role` VALUES ('4', '操作人员', 'role:operation', '可以查看、添加、修改，不可删除', '3', '2023-07-05 16:17:47', '2023-07-05 16:17:49');
INSERT INTO `wd_sys_role` VALUES ('6', '查询人员', 'role:query', '只可查看', '4', '2023-09-05 11:28:39', '2023-09-05 11:28:41');
INSERT INTO `wd_sys_role` VALUES ('7', '小马测试角色', 'role:xiaoma:test', '小马测试角色', '5', '2023-09-07 09:42:25', '2023-09-07 09:42:25');
INSERT INTO `wd_sys_role` VALUES ('8', '预览人员', 'role:test', '测试预览员', '0', '2023-10-10 15:05:06', '2023-10-10 15:05:06');

-- ----------------------------
-- Table structure for wd_sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `wd_sys_role_permission`;
CREATE TABLE `wd_sys_role_permission` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `permission_id` bigint(20) NOT NULL COMMENT '权限ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of wd_sys_role_permission
-- ----------------------------
INSERT INTO `wd_sys_role_permission` VALUES ('1', '1');
INSERT INTO `wd_sys_role_permission` VALUES ('1', '2');
INSERT INTO `wd_sys_role_permission` VALUES ('1', '3');
INSERT INTO `wd_sys_role_permission` VALUES ('2', '2');
INSERT INTO `wd_sys_role_permission` VALUES ('3', '1');
INSERT INTO `wd_sys_role_permission` VALUES ('3', '4');
INSERT INTO `wd_sys_role_permission` VALUES ('7', '9');
INSERT INTO `wd_sys_role_permission` VALUES ('7', '10');
INSERT INTO `wd_sys_role_permission` VALUES ('7', '4');
INSERT INTO `wd_sys_role_permission` VALUES ('7', '11');
INSERT INTO `wd_sys_role_permission` VALUES ('1', '4');
INSERT INTO `wd_sys_role_permission` VALUES ('1', '5');
INSERT INTO `wd_sys_role_permission` VALUES ('1', '6');
INSERT INTO `wd_sys_role_permission` VALUES ('1', '7');
INSERT INTO `wd_sys_role_permission` VALUES ('1', '8');
INSERT INTO `wd_sys_role_permission` VALUES ('1', '9');
INSERT INTO `wd_sys_role_permission` VALUES ('1', '10');
INSERT INTO `wd_sys_role_permission` VALUES ('1', '11');
INSERT INTO `wd_sys_role_permission` VALUES ('1', '12');
INSERT INTO `wd_sys_role_permission` VALUES ('1', '13');
INSERT INTO `wd_sys_role_permission` VALUES ('1', '14');
INSERT INTO `wd_sys_role_permission` VALUES ('1', '15');
INSERT INTO `wd_sys_role_permission` VALUES ('1', '16');
INSERT INTO `wd_sys_role_permission` VALUES ('1', '17');
INSERT INTO `wd_sys_role_permission` VALUES ('1', '18');
INSERT INTO `wd_sys_role_permission` VALUES ('1', '19');
INSERT INTO `wd_sys_role_permission` VALUES ('1', '20');
INSERT INTO `wd_sys_role_permission` VALUES ('1', '21');
INSERT INTO `wd_sys_role_permission` VALUES ('1', '22');
INSERT INTO `wd_sys_role_permission` VALUES ('1', '23');
INSERT INTO `wd_sys_role_permission` VALUES ('1', '24');
INSERT INTO `wd_sys_role_permission` VALUES ('1', '25');
INSERT INTO `wd_sys_role_permission` VALUES ('1', '26');
INSERT INTO `wd_sys_role_permission` VALUES ('1', '27');
INSERT INTO `wd_sys_role_permission` VALUES ('1', '28');
INSERT INTO `wd_sys_role_permission` VALUES ('1', '29');
INSERT INTO `wd_sys_role_permission` VALUES ('1', '30');
INSERT INTO `wd_sys_role_permission` VALUES ('1', '31');
INSERT INTO `wd_sys_role_permission` VALUES ('1', '32');
INSERT INTO `wd_sys_role_permission` VALUES ('1', '33');
INSERT INTO `wd_sys_role_permission` VALUES ('1', '34');
INSERT INTO `wd_sys_role_permission` VALUES ('1', '35');
INSERT INTO `wd_sys_role_permission` VALUES ('2', '1');
INSERT INTO `wd_sys_role_permission` VALUES ('2', '3');
INSERT INTO `wd_sys_role_permission` VALUES ('2', '4');
INSERT INTO `wd_sys_role_permission` VALUES ('2', '5');
INSERT INTO `wd_sys_role_permission` VALUES ('2', '6');
INSERT INTO `wd_sys_role_permission` VALUES ('2', '7');
INSERT INTO `wd_sys_role_permission` VALUES ('2', '8');
INSERT INTO `wd_sys_role_permission` VALUES ('2', '9');
INSERT INTO `wd_sys_role_permission` VALUES ('2', '10');
INSERT INTO `wd_sys_role_permission` VALUES ('2', '11');
INSERT INTO `wd_sys_role_permission` VALUES ('2', '12');
INSERT INTO `wd_sys_role_permission` VALUES ('2', '13');
INSERT INTO `wd_sys_role_permission` VALUES ('2', '16');
INSERT INTO `wd_sys_role_permission` VALUES ('2', '17');
INSERT INTO `wd_sys_role_permission` VALUES ('2', '18');
INSERT INTO `wd_sys_role_permission` VALUES ('2', '19');
INSERT INTO `wd_sys_role_permission` VALUES ('2', '20');
INSERT INTO `wd_sys_role_permission` VALUES ('2', '27');
INSERT INTO `wd_sys_role_permission` VALUES ('2', '26');
INSERT INTO `wd_sys_role_permission` VALUES ('2', '28');
INSERT INTO `wd_sys_role_permission` VALUES ('2', '29');
INSERT INTO `wd_sys_role_permission` VALUES ('2', '30');
INSERT INTO `wd_sys_role_permission` VALUES ('2', '31');
INSERT INTO `wd_sys_role_permission` VALUES ('2', '32');
INSERT INTO `wd_sys_role_permission` VALUES ('2', '33');
INSERT INTO `wd_sys_role_permission` VALUES ('2', '34');
INSERT INTO `wd_sys_role_permission` VALUES ('2', '35');
INSERT INTO `wd_sys_role_permission` VALUES ('3', '2');
INSERT INTO `wd_sys_role_permission` VALUES ('3', '3');
INSERT INTO `wd_sys_role_permission` VALUES ('3', '5');
INSERT INTO `wd_sys_role_permission` VALUES ('3', '6');
INSERT INTO `wd_sys_role_permission` VALUES ('3', '7');
INSERT INTO `wd_sys_role_permission` VALUES ('3', '8');
INSERT INTO `wd_sys_role_permission` VALUES ('3', '9');
INSERT INTO `wd_sys_role_permission` VALUES ('3', '10');
INSERT INTO `wd_sys_role_permission` VALUES ('3', '14');
INSERT INTO `wd_sys_role_permission` VALUES ('3', '15');
INSERT INTO `wd_sys_role_permission` VALUES ('3', '16');
INSERT INTO `wd_sys_role_permission` VALUES ('3', '21');
INSERT INTO `wd_sys_role_permission` VALUES ('3', '22');
INSERT INTO `wd_sys_role_permission` VALUES ('3', '23');
INSERT INTO `wd_sys_role_permission` VALUES ('3', '24');
INSERT INTO `wd_sys_role_permission` VALUES ('3', '25');
INSERT INTO `wd_sys_role_permission` VALUES ('3', '26');
INSERT INTO `wd_sys_role_permission` VALUES ('3', '27');
INSERT INTO `wd_sys_role_permission` VALUES ('4', '1');
INSERT INTO `wd_sys_role_permission` VALUES ('4', '2');
INSERT INTO `wd_sys_role_permission` VALUES ('4', '3');
INSERT INTO `wd_sys_role_permission` VALUES ('4', '4');
INSERT INTO `wd_sys_role_permission` VALUES ('4', '5');
INSERT INTO `wd_sys_role_permission` VALUES ('4', '6');
INSERT INTO `wd_sys_role_permission` VALUES ('4', '7');
INSERT INTO `wd_sys_role_permission` VALUES ('4', '8');
INSERT INTO `wd_sys_role_permission` VALUES ('4', '9');
INSERT INTO `wd_sys_role_permission` VALUES ('4', '10');
INSERT INTO `wd_sys_role_permission` VALUES ('4', '19');
INSERT INTO `wd_sys_role_permission` VALUES ('4', '20');
INSERT INTO `wd_sys_role_permission` VALUES ('4', '21');
INSERT INTO `wd_sys_role_permission` VALUES ('4', '22');
INSERT INTO `wd_sys_role_permission` VALUES ('4', '23');
INSERT INTO `wd_sys_role_permission` VALUES ('4', '24');
INSERT INTO `wd_sys_role_permission` VALUES ('4', '25');
INSERT INTO `wd_sys_role_permission` VALUES ('4', '26');
INSERT INTO `wd_sys_role_permission` VALUES ('4', '27');
INSERT INTO `wd_sys_role_permission` VALUES ('4', '28');
INSERT INTO `wd_sys_role_permission` VALUES ('4', '29');
INSERT INTO `wd_sys_role_permission` VALUES ('4', '30');
INSERT INTO `wd_sys_role_permission` VALUES ('4', '31');
INSERT INTO `wd_sys_role_permission` VALUES ('4', '32');
INSERT INTO `wd_sys_role_permission` VALUES ('4', '33');
INSERT INTO `wd_sys_role_permission` VALUES ('6', '1');
INSERT INTO `wd_sys_role_permission` VALUES ('6', '2');
INSERT INTO `wd_sys_role_permission` VALUES ('6', '3');
INSERT INTO `wd_sys_role_permission` VALUES ('6', '4');
INSERT INTO `wd_sys_role_permission` VALUES ('6', '5');
INSERT INTO `wd_sys_role_permission` VALUES ('6', '6');
INSERT INTO `wd_sys_role_permission` VALUES ('6', '7');
INSERT INTO `wd_sys_role_permission` VALUES ('6', '8');
INSERT INTO `wd_sys_role_permission` VALUES ('6', '9');
INSERT INTO `wd_sys_role_permission` VALUES ('6', '10');
INSERT INTO `wd_sys_role_permission` VALUES ('8', '1');
INSERT INTO `wd_sys_role_permission` VALUES ('8', '2');
INSERT INTO `wd_sys_role_permission` VALUES ('8', '3');
INSERT INTO `wd_sys_role_permission` VALUES ('8', '4');
INSERT INTO `wd_sys_role_permission` VALUES ('8', '5');
INSERT INTO `wd_sys_role_permission` VALUES ('8', '6');
INSERT INTO `wd_sys_role_permission` VALUES ('8', '7');
INSERT INTO `wd_sys_role_permission` VALUES ('8', '8');
INSERT INTO `wd_sys_role_permission` VALUES ('8', '9');
INSERT INTO `wd_sys_role_permission` VALUES ('8', '10');
INSERT INTO `wd_sys_role_permission` VALUES ('8', '35');

-- ----------------------------
-- Table structure for wd_sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `wd_sys_role_user`;
CREATE TABLE `wd_sys_role_user` (
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  UNIQUE KEY `role_id` (`role_id`,`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户角色(中间表)';

-- ----------------------------
-- Records of wd_sys_role_user
-- ----------------------------
INSERT INTO `wd_sys_role_user` VALUES ('1', '1');
INSERT INTO `wd_sys_role_user` VALUES ('1', '2');
INSERT INTO `wd_sys_role_user` VALUES ('1', '3');
INSERT INTO `wd_sys_role_user` VALUES ('1', '4');
INSERT INTO `wd_sys_role_user` VALUES ('1', '5');
INSERT INTO `wd_sys_role_user` VALUES ('1', '6');
INSERT INTO `wd_sys_role_user` VALUES ('1', '7');
INSERT INTO `wd_sys_role_user` VALUES ('1', '8');
INSERT INTO `wd_sys_role_user` VALUES ('1', '9');
INSERT INTO `wd_sys_role_user` VALUES ('1', '10');
INSERT INTO `wd_sys_role_user` VALUES ('1', '11');
INSERT INTO `wd_sys_role_user` VALUES ('1', '12');
INSERT INTO `wd_sys_role_user` VALUES ('1', '13');
INSERT INTO `wd_sys_role_user` VALUES ('1', '14');
INSERT INTO `wd_sys_role_user` VALUES ('1', '15');
INSERT INTO `wd_sys_role_user` VALUES ('1', '16');
INSERT INTO `wd_sys_role_user` VALUES ('1', '17');
INSERT INTO `wd_sys_role_user` VALUES ('1', '18');
INSERT INTO `wd_sys_role_user` VALUES ('1', '19');
INSERT INTO `wd_sys_role_user` VALUES ('1', '20');
INSERT INTO `wd_sys_role_user` VALUES ('1', '21');
INSERT INTO `wd_sys_role_user` VALUES ('1', '22');
INSERT INTO `wd_sys_role_user` VALUES ('1', '24');
INSERT INTO `wd_sys_role_user` VALUES ('1', '25');
INSERT INTO `wd_sys_role_user` VALUES ('1', '26');
INSERT INTO `wd_sys_role_user` VALUES ('1', '27');
INSERT INTO `wd_sys_role_user` VALUES ('1', '28');
INSERT INTO `wd_sys_role_user` VALUES ('1', '29');
INSERT INTO `wd_sys_role_user` VALUES ('1', '30');
INSERT INTO `wd_sys_role_user` VALUES ('1', '31');
INSERT INTO `wd_sys_role_user` VALUES ('2', '1');
INSERT INTO `wd_sys_role_user` VALUES ('2', '2');
INSERT INTO `wd_sys_role_user` VALUES ('2', '3');
INSERT INTO `wd_sys_role_user` VALUES ('2', '4');
INSERT INTO `wd_sys_role_user` VALUES ('2', '5');
INSERT INTO `wd_sys_role_user` VALUES ('2', '6');
INSERT INTO `wd_sys_role_user` VALUES ('2', '7');
INSERT INTO `wd_sys_role_user` VALUES ('2', '8');
INSERT INTO `wd_sys_role_user` VALUES ('2', '9');
INSERT INTO `wd_sys_role_user` VALUES ('2', '10');
INSERT INTO `wd_sys_role_user` VALUES ('2', '11');
INSERT INTO `wd_sys_role_user` VALUES ('2', '12');
INSERT INTO `wd_sys_role_user` VALUES ('2', '13');
INSERT INTO `wd_sys_role_user` VALUES ('2', '16');
INSERT INTO `wd_sys_role_user` VALUES ('2', '17');
INSERT INTO `wd_sys_role_user` VALUES ('2', '18');
INSERT INTO `wd_sys_role_user` VALUES ('2', '19');
INSERT INTO `wd_sys_role_user` VALUES ('2', '20');
INSERT INTO `wd_sys_role_user` VALUES ('2', '26');
INSERT INTO `wd_sys_role_user` VALUES ('2', '27');
INSERT INTO `wd_sys_role_user` VALUES ('2', '28');
INSERT INTO `wd_sys_role_user` VALUES ('2', '29');
INSERT INTO `wd_sys_role_user` VALUES ('2', '30');
INSERT INTO `wd_sys_role_user` VALUES ('2', '31');
INSERT INTO `wd_sys_role_user` VALUES ('3', '1');
INSERT INTO `wd_sys_role_user` VALUES ('3', '2');
INSERT INTO `wd_sys_role_user` VALUES ('3', '3');
INSERT INTO `wd_sys_role_user` VALUES ('3', '4');
INSERT INTO `wd_sys_role_user` VALUES ('3', '5');
INSERT INTO `wd_sys_role_user` VALUES ('3', '6');
INSERT INTO `wd_sys_role_user` VALUES ('3', '7');
INSERT INTO `wd_sys_role_user` VALUES ('3', '8');
INSERT INTO `wd_sys_role_user` VALUES ('3', '9');
INSERT INTO `wd_sys_role_user` VALUES ('3', '10');
INSERT INTO `wd_sys_role_user` VALUES ('3', '13');
INSERT INTO `wd_sys_role_user` VALUES ('3', '14');
INSERT INTO `wd_sys_role_user` VALUES ('3', '15');
INSERT INTO `wd_sys_role_user` VALUES ('3', '16');
INSERT INTO `wd_sys_role_user` VALUES ('3', '20');
INSERT INTO `wd_sys_role_user` VALUES ('3', '21');
INSERT INTO `wd_sys_role_user` VALUES ('3', '22');
INSERT INTO `wd_sys_role_user` VALUES ('3', '24');
INSERT INTO `wd_sys_role_user` VALUES ('3', '25');
INSERT INTO `wd_sys_role_user` VALUES ('3', '26');
INSERT INTO `wd_sys_role_user` VALUES ('3', '27');
INSERT INTO `wd_sys_role_user` VALUES ('4', '2');
INSERT INTO `wd_sys_role_user` VALUES ('4', '3');
INSERT INTO `wd_sys_role_user` VALUES ('4', '4');
INSERT INTO `wd_sys_role_user` VALUES ('4', '5');
INSERT INTO `wd_sys_role_user` VALUES ('4', '6');
INSERT INTO `wd_sys_role_user` VALUES ('4', '7');
INSERT INTO `wd_sys_role_user` VALUES ('4', '8');
INSERT INTO `wd_sys_role_user` VALUES ('4', '9');
INSERT INTO `wd_sys_role_user` VALUES ('4', '10');
INSERT INTO `wd_sys_role_user` VALUES ('4', '28');
INSERT INTO `wd_sys_role_user` VALUES ('4', '29');
INSERT INTO `wd_sys_role_user` VALUES ('4', '30');
INSERT INTO `wd_sys_role_user` VALUES ('4', '31');
INSERT INTO `wd_sys_role_user` VALUES ('6', '2');
INSERT INTO `wd_sys_role_user` VALUES ('6', '3');
INSERT INTO `wd_sys_role_user` VALUES ('6', '4');
INSERT INTO `wd_sys_role_user` VALUES ('6', '5');
INSERT INTO `wd_sys_role_user` VALUES ('6', '6');
INSERT INTO `wd_sys_role_user` VALUES ('6', '7');
INSERT INTO `wd_sys_role_user` VALUES ('6', '8');
INSERT INTO `wd_sys_role_user` VALUES ('6', '9');
INSERT INTO `wd_sys_role_user` VALUES ('6', '10');
INSERT INTO `wd_sys_role_user` VALUES ('8', '41');

-- ----------------------------
-- Table structure for wd_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `wd_sys_user`;
CREATE TABLE `wd_sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) NOT NULL COMMENT '用户ID',
  `pwd` varchar(120) DEFAULT NULL COMMENT '登录密码',
  `real_name` varchar(40) DEFAULT NULL COMMENT '真实姓名',
  `pinyin` varchar(200) DEFAULT NULL COMMENT '全拼(姓名)',
  `py` varchar(20) DEFAULT NULL COMMENT '简拼(姓名)',
  `gender` tinyint(2) DEFAULT '2' COMMENT '性别(0:男,1:女,2:未知)',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号',
  `email` varchar(100) DEFAULT NULL COMMENT '电子邮箱',
  `face` varchar(80) DEFAULT NULL COMMENT '头像url',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '所属部门id',
  `post_id` bigint(20) DEFAULT NULL COMMENT '岗位id',
  `secret_key` varchar(100) DEFAULT NULL COMMENT '密钥',
  `disabled` bit(1) DEFAULT b'0' COMMENT '禁用',
  `deleted` bit(1) DEFAULT b'0' COMMENT '删除',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_date` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`,`deleted`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COMMENT='系统用户';

-- ----------------------------
-- Records of wd_sys_user
-- ----------------------------
INSERT INTO `wd_sys_user` VALUES ('1', 'superman', '$2a$10$s21rpp0mwWwcQQ6mXUU1hOnqQBMkgzLeIrBAEg1xa8OFCcWTCapFO', '超级管理员', 'chaojiguanliyuan', 'cjgly', '0', '13875928333', 'i.lawnwmlglo@qq.com', '/face/bdfa4baee76bb3a4c5b43cd13058a017.jpeg', null, '1', null, '\0', '\0', '2023-07-03 16:20:24', '2023-09-11 11:12:43');
INSERT INTO `wd_sys_user` VALUES ('2', 'zhouwenqi', '$2a$10$YrLdiL24WJ6xmVkzqmppy.gqusqocT56kRlXv5Y1Ij5J6IpF/ka9i', '周文奇', 'zhouwenqi', 'zwq', '0', '13875928333', 'i.lawnwmlglo@qq.com', '/face/b980374d5b58e7d4482ed173aa8264d5.png', null, '1', 'VHNTMN4ZSJOM6WLE', '\0', '\0', '2023-07-04 15:19:27', '2023-12-07 14:29:40');
INSERT INTO `wd_sys_user` VALUES ('3', 'microsoft', '$2a$10$YrLdiL24WJ6xmVkzqmppy.gqusqocT56kRlXv5Y1Ij5J6IpF/ka9i', '我在也阳光里', 'wozaiyeyangguangli', 'wzyygl', '2', null, null, null, null, '1', null, '\0', '\0', '2023-07-03 16:21:01', '2023-07-27 14:08:17');
INSERT INTO `wd_sys_user` VALUES ('35', 'facebook2', '$2a$10$Wg7IwKGNqCQ2U95dpTTgceR3DoMgVI5Ram9zQXaq3MR.IGYGnxzy6', 'yyy', null, null, null, null, 'xxxx@163.com', null, null, null, null, '\0', '\0', '2023-07-21 14:16:25', '2023-07-21 14:16:25');
INSERT INTO `wd_sys_user` VALUES ('36', 'facebook1', '$2a$10$nxI.uWOIEiuhO7DMXTtH5.xOCFMnykoLPjickYxP0udOPRlLtrTEC', 'xxx', null, null, null, null, 'xxxx@163.com', null, null, null, null, '\0', '\0', '2023-07-21 14:18:07', '2023-07-21 14:18:07');
INSERT INTO `wd_sys_user` VALUES ('37', 'facebook3', '$2a$10$YrLdiL24WJ6xmVkzqmppy.gqusqocT56kRlXv5Y1Ij5J6IpF/ka9i', 'rr经wreo', 'rrjingwreo', 'j', '0', '13875928333', 'x2342xx@163.com', null, null, null, null, '\0', '\0', '2023-07-21 14:20:41', '2023-08-23 19:23:07');
INSERT INTO `wd_sys_user` VALUES ('38', 'response', '$2a$10$YrLdiL24WJ6xmVkzqmppy.gqusqocT56kRlXv5Y1Ij5J6IpF/ka9i', '42342', null, null, '2', null, 'xxxx@163.com', null, null, null, null, '\0', '\0', '2023-07-24 14:45:08', '2023-07-26 17:46:27');
INSERT INTO `wd_sys_user` VALUES ('39', 'xiaoma', '$2a$10$dxRmt6rUHvnT0Qr8hwAcueBCYUJCbxAFASDwb7bt7wrFHHc/OcZaW', '小马', 'xiaoma', 'xm', '0', '18988884877', '735878602@qq.com', '', null, '7', null, '\0', '', '2023-09-07 09:43:34', '2023-10-10 15:03:50');
INSERT INTO `wd_sys_user` VALUES ('40', 'xiaoma8', '$2a$10$tjuAKt6ARz2mq2RseIEuKOIW3We49Lxjvwpv9QPvT8z7bLsae15wS', null, null, null, '2', null, '735878602@qq.com', null, null, null, null, '\0', '', '2023-09-12 10:11:54', '2023-10-10 15:03:47');
INSERT INTO `wd_sys_user` VALUES ('41', 'test12', '$2a$10$A73FoDorp6xgOLiYAOfehuO3gIfUNDuN5q3/ihUpQuCOVxrMYoXNC', 'test', 'test', '', '2', '18889888888', 'test@qq.com', '/face/8a50b5cbc5653037891f1aceb1b8b2aa.jpeg', '1', '7', null, '\0', '\0', '2023-10-10 15:07:49', '2023-11-14 11:24:59');

-- ----------------------------
-- Table structure for wd_sys_user_blip
-- ----------------------------
DROP TABLE IF EXISTS `wd_sys_user_blip`;
CREATE TABLE `wd_sys_user_blip` (
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `ip` varchar(100) NOT NULL COMMENT 'ip地址',
  UNIQUE KEY `user_id` (`user_id`,`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='标记用户需要二次验证';

-- ----------------------------
-- Records of wd_sys_user_blip
-- ----------------------------

-- ----------------------------
-- Table structure for wd_sys_user_lock
-- ----------------------------
DROP TABLE IF EXISTS `wd_sys_user_lock`;
CREATE TABLE `wd_sys_user_lock` (
  `user_id` bigint(20) NOT NULL COMMENT '系统用户id',
  `ip` varchar(100) DEFAULT NULL COMMENT 'IP地址',
  `lock_time` datetime NOT NULL COMMENT '解定时间',
  `unlock_time` datetime DEFAULT NULL COMMENT '解锁时间(为null永不解锁)',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of wd_sys_user_lock
-- ----------------------------
INSERT INTO `wd_sys_user_lock` VALUES ('1', '0:0:0:0:0:0:0:1', '2023-08-17 18:10:28', '2023-08-17 18:15:28');
