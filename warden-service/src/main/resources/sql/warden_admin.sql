/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.138
Source Server Version : 50736
Source Host           : 192.168.1.138:3306
Source Database       : warden_admin

Target Server Type    : MYSQL
Target Server Version : 50736
File Encoding         : 65001

Date: 2023-08-23 19:25:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for wd_sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `wd_sys_dept`;
CREATE TABLE `wd_sys_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL COMMENT '部门名称',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `code` varchar(20) DEFAULT NULL COMMENT '部门编号',
  `leader_id` bigint(20) DEFAULT NULL COMMENT '领导人ID',
  `pinyin` varchar(200) DEFAULT NULL COMMENT '全拼(名称)',
  `py` varchar(20) DEFAULT NULL COMMENT '简拼(名称)',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  `orders` int(11) DEFAULT '0' COMMENT '排序',
  `disabled` bit(1) DEFAULT b'0' COMMENT '禁用',
  `deleted` bit(1) DEFAULT b'0' COMMENT '删除',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_date` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`deleted`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of wd_sys_dept
-- ----------------------------
INSERT INTO `wd_sys_dept` VALUES ('1', '研发部', null, '0029342', null, null, null, null, null, '\0', '\0', '2023-07-03 16:30:00', '2023-07-04 16:30:04');
INSERT INTO `wd_sys_dept` VALUES ('2', '行政部', null, '3324779', null, null, null, null, null, '\0', '\0', '2023-07-03 16:30:18', '2023-07-04 16:30:21');
INSERT INTO `wd_sys_dept` VALUES ('3', '设计部', null, '3325623', null, null, null, null, null, '\0', '\0', '2023-07-03 16:30:36', '2023-07-12 16:30:39');
INSERT INTO `wd_sys_dept` VALUES ('4', '采购部', null, '9945645', null, null, null, null, null, '\0', '\0', '2023-07-03 16:30:51', '2023-07-04 16:30:54');

-- ----------------------------
-- Table structure for wd_sys_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `wd_sys_dictionary`;
CREATE TABLE `wd_sys_dictionary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL COMMENT '字典名称',
  `code` varchar(50) NOT NULL COMMENT '字典编码',
  `description` varchar(120) DEFAULT NULL COMMENT '描述',
  `orders` int(11) DEFAULT '0' COMMENT '排序',
  `disabled` bit(1) DEFAULT b'0' COMMENT '禁用',
  `deleted` bit(1) DEFAULT b'0' COMMENT '删除',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_date` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='字典';

-- ----------------------------
-- Records of wd_sys_dictionary
-- ----------------------------
INSERT INTO `wd_sys_dictionary` VALUES ('1', '性别', 'Warden_Gender', '性别数据', '0', '\0', '\0', '2023-07-05 17:23:21', '2023-07-05 17:23:23');
INSERT INTO `wd_sys_dictionary` VALUES ('2', '终端', 'Warden_Terminal', '访问终端', '1', '\0', '\0', '2023-07-05 17:24:21', '2023-07-05 17:24:23');
INSERT INTO `wd_sys_dictionary` VALUES ('3', 'xxxxx', 'ppiwee', 'yyyyy', '14', '\0', '\0', '2023-08-09 15:35:48', '2023-08-09 15:35:48');
INSERT INTO `wd_sys_dictionary` VALUES ('4', 'xxyyxxx', 'ppeeiwee', '32yyyyy', '18', '\0', '', '2023-08-09 15:36:40', '2023-08-09 15:39:36');

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
  `orders` int(11) DEFAULT '0' COMMENT '排序',
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
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8mb4 COMMENT='登录日志';

-- ----------------------------
-- Records of wd_sys_login_log
-- ----------------------------
INSERT INTO `wd_sys_login_log` VALUES ('1', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 12:29:12', '2023-08-17 12:29:12');
INSERT INTO `wd_sys_login_log` VALUES ('2', '1', 'zhouwenqi', '0', '5', '0', '登录失败:帐号或密码错误', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 12:34:42', '2023-08-17 12:34:42');
INSERT INTO `wd_sys_login_log` VALUES ('3', '1', 'zhouwenqi', '0', '5', '0', '登录失败:密码错误', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 13:04:18', '2023-08-17 13:04:18');
INSERT INTO `wd_sys_login_log` VALUES ('4', '1', 'zhouwenqi', '0', '5', '0', '登录失败:密码错误', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 13:20:38', '2023-08-17 13:20:38');
INSERT INTO `wd_sys_login_log` VALUES ('5', '1', 'zhouwenqi', '0', '5', '0', '登录失败:密码错误', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 13:23:44', '2023-08-17 13:23:44');
INSERT INTO `wd_sys_login_log` VALUES ('6', '1', 'zhouwenqi', '0', '5', '0', '登录失败:密码错误', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 15:43:12', '2023-08-17 15:43:12');
INSERT INTO `wd_sys_login_log` VALUES ('7', '1', 'zhouwenqi', '0', '5', '0', '登录失败:密码错误', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 15:43:13', '2023-08-17 15:43:13');
INSERT INTO `wd_sys_login_log` VALUES ('8', '1', 'zhouwenqi', '0', '5', '0', '登录失败:密码错误', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 15:43:14', '2023-08-17 15:43:14');
INSERT INTO `wd_sys_login_log` VALUES ('9', '1', 'zhouwenqi', '0', '5', '0', '登录失败:密码错误', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 15:43:15', '2023-08-17 15:43:15');
INSERT INTO `wd_sys_login_log` VALUES ('10', '1', 'zhouwenqi', '0', '5', '0', '登录失败:密码错误', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 15:43:16', '2023-08-17 15:43:16');
INSERT INTO `wd_sys_login_log` VALUES ('11', '1', 'zhouwenqi', '0', '5', '0', '登录失败:失败次败超限被锁住', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 15:43:17', '2023-08-17 15:43:17');
INSERT INTO `wd_sys_login_log` VALUES ('12', '1', 'zhouwenqi', '0', '5', '0', '登录失败:用户已被锁住', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 15:43:18', '2023-08-17 15:43:18');
INSERT INTO `wd_sys_login_log` VALUES ('13', '1', 'zhouwenqi', '0', '5', '0', '登录失败:用户已被锁住', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 15:43:19', '2023-08-17 15:43:19');
INSERT INTO `wd_sys_login_log` VALUES ('14', '1', 'zhouwenqi', '0', '5', '0', '登录失败:用户已被锁住', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 15:43:20', '2023-08-17 15:43:20');
INSERT INTO `wd_sys_login_log` VALUES ('15', '1', 'zhouwenqi', '0', '5', '0', '登录失败:用户已被锁住', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 15:43:21', '2023-08-17 15:43:21');
INSERT INTO `wd_sys_login_log` VALUES ('16', '2', 'apple', '0', '5', '0', '登录失败:密码错误', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 15:45:36', '2023-08-17 15:45:36');
INSERT INTO `wd_sys_login_log` VALUES ('17', '2', 'apple', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 15:45:43', '2023-08-17 15:45:43');
INSERT INTO `wd_sys_login_log` VALUES ('18', '1', 'zhouwenqi', '0', '5', '0', '登录失败:用户已被锁住', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 15:46:03', '2023-08-17 15:46:03');
INSERT INTO `wd_sys_login_log` VALUES ('19', '1', 'zhouwenqi', '0', '5', '0', '登录失败:密码错误', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 17:08:10', '2023-08-17 17:08:10');
INSERT INTO `wd_sys_login_log` VALUES ('20', '1', 'zhouwenqi', '0', '5', '0', '登录失败:密码错误', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 17:08:11', '2023-08-17 17:08:11');
INSERT INTO `wd_sys_login_log` VALUES ('21', '1', 'zhouwenqi', '0', '5', '0', '登录失败:密码错误', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 17:08:12', '2023-08-17 17:08:12');
INSERT INTO `wd_sys_login_log` VALUES ('22', '1', 'zhouwenqi', '0', '5', '0', '登录失败:密码错误', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 17:08:13', '2023-08-17 17:08:13');
INSERT INTO `wd_sys_login_log` VALUES ('23', '1', 'zhouwenqi', '0', '5', '0', '登录失败:密码错误', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 17:08:13', '2023-08-17 17:08:13');
INSERT INTO `wd_sys_login_log` VALUES ('24', '1', 'zhouwenqi', '0', '5', '0', '登录失败:失败次败超限被锁住', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 17:08:14', '2023-08-17 17:08:14');
INSERT INTO `wd_sys_login_log` VALUES ('25', '1', 'zhouwenqi', '0', '5', '0', '登录失败:密码错误', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 18:10:22', '2023-08-17 18:10:22');
INSERT INTO `wd_sys_login_log` VALUES ('26', '1', 'zhouwenqi', '0', '5', '0', '登录失败:密码错误', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 18:10:26', '2023-08-17 18:10:26');
INSERT INTO `wd_sys_login_log` VALUES ('27', '1', 'zhouwenqi', '0', '5', '0', '登录失败:密码错误', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 18:10:27', '2023-08-17 18:10:27');
INSERT INTO `wd_sys_login_log` VALUES ('28', '1', 'zhouwenqi', '0', '5', '0', '登录失败:密码错误', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 18:10:28', '2023-08-17 18:10:28');
INSERT INTO `wd_sys_login_log` VALUES ('29', '1', 'zhouwenqi', '0', '5', '0', '登录失败:密码错误', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 18:10:28', '2023-08-17 18:10:28');
INSERT INTO `wd_sys_login_log` VALUES ('30', '1', 'zhouwenqi', '0', '5', '0', '登录失败:失败次败超限被锁住', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 18:10:29', '2023-08-17 18:10:29');
INSERT INTO `wd_sys_login_log` VALUES ('31', '1', 'zhouwenqi', '0', '5', '0', '登录失败:用户已被锁住', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 18:12:15', '2023-08-17 18:12:15');
INSERT INTO `wd_sys_login_log` VALUES ('32', '1', 'zhouwenqi', '0', '5', '0', '登录失败:用户已被锁住', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 18:12:17', '2023-08-17 18:12:17');
INSERT INTO `wd_sys_login_log` VALUES ('33', '1', 'zhouwenqi', '0', '5', '0', '登录失败:用户已被锁住', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 18:12:18', '2023-08-17 18:12:18');
INSERT INTO `wd_sys_login_log` VALUES ('34', '1', 'zhouwenqi', '0', '5', '0', '登录失败:用户已被锁住', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 18:12:18', '2023-08-17 18:12:18');
INSERT INTO `wd_sys_login_log` VALUES ('35', '1', 'zhouwenqi', '0', '5', '0', '登录失败:用户已被锁住', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 18:12:20', '2023-08-17 18:12:20');
INSERT INTO `wd_sys_login_log` VALUES ('36', '1', 'zhouwenqi', '0', '5', '0', '登录失败:用户已被锁住', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 18:12:20', '2023-08-17 18:12:20');
INSERT INTO `wd_sys_login_log` VALUES ('37', '1', 'zhouwenqi', '0', '5', '0', '登录失败:用户已被锁住', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 18:12:21', '2023-08-17 18:12:21');
INSERT INTO `wd_sys_login_log` VALUES ('38', '1', 'zhouwenqi', '0', '5', '0', '登录失败:用户已被锁住', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 18:12:22', '2023-08-17 18:12:22');
INSERT INTO `wd_sys_login_log` VALUES ('39', '1', 'zhouwenqi', '0', '5', '0', '登录失败:用户已被锁住', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 18:12:22', '2023-08-17 18:12:22');
INSERT INTO `wd_sys_login_log` VALUES ('40', '1', 'zhouwenqi', '0', '5', '0', '登录失败:用户已被锁住', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 18:12:23', '2023-08-17 18:12:23');
INSERT INTO `wd_sys_login_log` VALUES ('41', '1', 'zhouwenqi', '0', '5', '0', '登录失败:用户已被锁住', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 18:12:23', '2023-08-17 18:12:23');
INSERT INTO `wd_sys_login_log` VALUES ('42', '1', 'zhouwenqi', '0', '5', '0', '登录失败:用户已被锁住', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 18:12:24', '2023-08-17 18:12:24');
INSERT INTO `wd_sys_login_log` VALUES ('43', '1', 'zhouwenqi', '0', '5', '0', '登录失败:用户已被锁住', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 18:12:25', '2023-08-17 18:12:25');
INSERT INTO `wd_sys_login_log` VALUES ('44', '1', 'zhouwenqi', '0', '5', '0', '登录失败:用户已被锁住', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 18:12:29', '2023-08-17 18:12:29');
INSERT INTO `wd_sys_login_log` VALUES ('45', '1', 'zhouwenqi', '0', '5', '0', '登录失败:用户已被锁住', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 18:12:30', '2023-08-17 18:12:30');
INSERT INTO `wd_sys_login_log` VALUES ('46', '1', 'zhouwenqi', '0', '5', '0', '登录失败:用户已被锁住', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 18:12:34', '2023-08-17 18:12:34');
INSERT INTO `wd_sys_login_log` VALUES ('47', '1', 'zhouwenqi', '0', '5', '0', '登录失败:用户已被锁住', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 18:12:34', '2023-08-17 18:12:34');
INSERT INTO `wd_sys_login_log` VALUES ('48', '1', 'zhouwenqi', '0', '5', '0', '登录失败:用户已被锁住', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 18:12:35', '2023-08-17 18:12:35');
INSERT INTO `wd_sys_login_log` VALUES ('49', '1', 'zhouwenqi', '0', '5', '0', '登录失败:用户已被锁住', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 18:13:14', '2023-08-17 18:13:14');
INSERT INTO `wd_sys_login_log` VALUES ('50', '1', 'zhouwenqi', '0', '5', '0', '登录失败:密码错误', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-18 14:33:28', '2023-08-18 14:33:28');
INSERT INTO `wd_sys_login_log` VALUES ('51', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-18 14:33:33', '2023-08-18 14:33:33');
INSERT INTO `wd_sys_login_log` VALUES ('52', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-21 18:22:45', '2023-08-21 18:22:45');
INSERT INTO `wd_sys_login_log` VALUES ('53', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-21 18:23:23', '2023-08-21 18:23:23');
INSERT INTO `wd_sys_login_log` VALUES ('54', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-21 18:24:27', '2023-08-21 18:24:27');
INSERT INTO `wd_sys_login_log` VALUES ('55', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-21 18:25:57', '2023-08-21 18:25:57');
INSERT INTO `wd_sys_login_log` VALUES ('56', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-21 18:26:06', '2023-08-21 18:26:06');
INSERT INTO `wd_sys_login_log` VALUES ('57', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-21 18:26:52', '2023-08-21 18:26:52');
INSERT INTO `wd_sys_login_log` VALUES ('58', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-21 18:47:09', '2023-08-21 18:47:09');
INSERT INTO `wd_sys_login_log` VALUES ('59', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-21 18:47:15', '2023-08-21 18:47:15');
INSERT INTO `wd_sys_login_log` VALUES ('60', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-21 18:47:27', '2023-08-21 18:47:27');
INSERT INTO `wd_sys_login_log` VALUES ('61', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-21 18:57:35', '2023-08-21 18:57:35');
INSERT INTO `wd_sys_login_log` VALUES ('62', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-21 18:57:42', '2023-08-21 18:57:42');
INSERT INTO `wd_sys_login_log` VALUES ('63', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-21 19:16:50', '2023-08-21 19:16:50');
INSERT INTO `wd_sys_login_log` VALUES ('64', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-21 19:17:32', '2023-08-21 19:17:32');
INSERT INTO `wd_sys_login_log` VALUES ('65', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-21 19:17:57', '2023-08-21 19:17:57');
INSERT INTO `wd_sys_login_log` VALUES ('66', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-21 19:19:10', '2023-08-21 19:19:10');
INSERT INTO `wd_sys_login_log` VALUES ('67', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-21 19:19:16', '2023-08-21 19:19:16');
INSERT INTO `wd_sys_login_log` VALUES ('68', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 11:55:55', '2023-08-22 11:55:55');
INSERT INTO `wd_sys_login_log` VALUES ('69', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 12:16:36', '2023-08-22 12:16:36');
INSERT INTO `wd_sys_login_log` VALUES ('70', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 12:16:41', '2023-08-22 12:16:41');
INSERT INTO `wd_sys_login_log` VALUES ('71', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 12:18:11', '2023-08-22 12:18:11');
INSERT INTO `wd_sys_login_log` VALUES ('72', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 12:20:27', '2023-08-22 12:20:27');
INSERT INTO `wd_sys_login_log` VALUES ('73', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 12:20:32', '2023-08-22 12:20:32');
INSERT INTO `wd_sys_login_log` VALUES ('74', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 12:29:02', '2023-08-22 12:29:02');
INSERT INTO `wd_sys_login_log` VALUES ('75', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 12:29:07', '2023-08-22 12:29:07');
INSERT INTO `wd_sys_login_log` VALUES ('76', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 12:42:44', '2023-08-22 12:42:44');
INSERT INTO `wd_sys_login_log` VALUES ('77', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 12:42:51', '2023-08-22 12:42:51');
INSERT INTO `wd_sys_login_log` VALUES ('78', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 12:43:32', '2023-08-22 12:43:32');
INSERT INTO `wd_sys_login_log` VALUES ('79', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 12:43:40', '2023-08-22 12:43:40');
INSERT INTO `wd_sys_login_log` VALUES ('80', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 12:46:26', '2023-08-22 12:46:26');
INSERT INTO `wd_sys_login_log` VALUES ('81', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 12:46:32', '2023-08-22 12:46:32');
INSERT INTO `wd_sys_login_log` VALUES ('82', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 12:53:45', '2023-08-22 12:53:45');
INSERT INTO `wd_sys_login_log` VALUES ('83', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 12:53:49', '2023-08-22 12:53:49');
INSERT INTO `wd_sys_login_log` VALUES ('84', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 12:59:17', '2023-08-22 12:59:17');
INSERT INTO `wd_sys_login_log` VALUES ('85', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 12:59:26', '2023-08-22 12:59:26');
INSERT INTO `wd_sys_login_log` VALUES ('86', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 13:07:13', '2023-08-22 13:07:13');
INSERT INTO `wd_sys_login_log` VALUES ('87', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 13:07:17', '2023-08-22 13:07:17');
INSERT INTO `wd_sys_login_log` VALUES ('88', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 13:07:49', '2023-08-22 13:07:49');
INSERT INTO `wd_sys_login_log` VALUES ('89', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 13:07:53', '2023-08-22 13:07:53');
INSERT INTO `wd_sys_login_log` VALUES ('90', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 13:12:38', '2023-08-22 13:12:38');
INSERT INTO `wd_sys_login_log` VALUES ('91', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 13:12:43', '2023-08-22 13:12:43');
INSERT INTO `wd_sys_login_log` VALUES ('92', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 13:29:42', '2023-08-22 13:29:42');
INSERT INTO `wd_sys_login_log` VALUES ('93', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 13:30:00', '2023-08-22 13:30:00');
INSERT INTO `wd_sys_login_log` VALUES ('94', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 13:32:18', '2023-08-22 13:32:18');
INSERT INTO `wd_sys_login_log` VALUES ('95', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 13:32:23', '2023-08-22 13:32:23');
INSERT INTO `wd_sys_login_log` VALUES ('96', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 13:35:38', '2023-08-22 13:35:38');
INSERT INTO `wd_sys_login_log` VALUES ('97', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 13:36:12', '2023-08-22 13:36:12');
INSERT INTO `wd_sys_login_log` VALUES ('98', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 13:39:02', '2023-08-22 13:39:02');
INSERT INTO `wd_sys_login_log` VALUES ('99', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 13:39:04', '2023-08-22 13:39:04');
INSERT INTO `wd_sys_login_log` VALUES ('100', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 13:40:11', '2023-08-22 13:40:11');
INSERT INTO `wd_sys_login_log` VALUES ('101', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 13:41:01', '2023-08-22 13:41:01');
INSERT INTO `wd_sys_login_log` VALUES ('102', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 13:41:18', '2023-08-22 13:41:18');
INSERT INTO `wd_sys_login_log` VALUES ('103', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 13:41:25', '2023-08-22 13:41:25');
INSERT INTO `wd_sys_login_log` VALUES ('104', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 13:41:27', '2023-08-22 13:41:27');
INSERT INTO `wd_sys_login_log` VALUES ('105', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 13:42:00', '2023-08-22 13:42:00');
INSERT INTO `wd_sys_login_log` VALUES ('106', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 13:42:29', '2023-08-22 13:42:29');
INSERT INTO `wd_sys_login_log` VALUES ('107', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 14:53:55', '2023-08-22 14:53:55');
INSERT INTO `wd_sys_login_log` VALUES ('108', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 14:54:25', '2023-08-22 14:54:25');
INSERT INTO `wd_sys_login_log` VALUES ('109', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 15:07:29', '2023-08-22 15:07:29');
INSERT INTO `wd_sys_login_log` VALUES ('110', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 15:07:48', '2023-08-22 15:07:48');
INSERT INTO `wd_sys_login_log` VALUES ('111', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 15:08:15', '2023-08-22 15:08:15');
INSERT INTO `wd_sys_login_log` VALUES ('112', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 15:08:23', '2023-08-22 15:08:23');
INSERT INTO `wd_sys_login_log` VALUES ('113', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 15:22:46', '2023-08-22 15:22:46');
INSERT INTO `wd_sys_login_log` VALUES ('114', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 15:25:04', '2023-08-22 15:25:04');
INSERT INTO `wd_sys_login_log` VALUES ('115', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 15:25:14', '2023-08-22 15:25:14');
INSERT INTO `wd_sys_login_log` VALUES ('116', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 15:26:54', '2023-08-22 15:26:54');
INSERT INTO `wd_sys_login_log` VALUES ('117', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 15:27:00', '2023-08-22 15:27:00');
INSERT INTO `wd_sys_login_log` VALUES ('118', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 15:32:29', '2023-08-22 15:32:29');
INSERT INTO `wd_sys_login_log` VALUES ('119', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 16:25:27', '2023-08-22 16:25:27');
INSERT INTO `wd_sys_login_log` VALUES ('120', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 16:25:35', '2023-08-22 16:25:35');
INSERT INTO `wd_sys_login_log` VALUES ('121', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 17:53:22', '2023-08-22 17:53:22');
INSERT INTO `wd_sys_login_log` VALUES ('122', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 17:53:26', '2023-08-22 17:53:26');
INSERT INTO `wd_sys_login_log` VALUES ('123', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 17:53:43', '2023-08-22 17:53:43');
INSERT INTO `wd_sys_login_log` VALUES ('124', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 17:56:46', '2023-08-22 17:56:46');
INSERT INTO `wd_sys_login_log` VALUES ('125', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 17:56:48', '2023-08-22 17:56:48');
INSERT INTO `wd_sys_login_log` VALUES ('126', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 17:56:59', '2023-08-22 17:56:59');
INSERT INTO `wd_sys_login_log` VALUES ('127', '37', 'facebook3', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 18:00:23', '2023-08-22 18:00:23');
INSERT INTO `wd_sys_login_log` VALUES ('128', '37', 'facebook3', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 18:00:27', '2023-08-22 18:00:27');
INSERT INTO `wd_sys_login_log` VALUES ('129', '37', 'facebook3', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 18:03:55', '2023-08-22 18:03:55');
INSERT INTO `wd_sys_login_log` VALUES ('130', '37', 'facebook3', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 18:04:03', '2023-08-22 18:04:03');
INSERT INTO `wd_sys_login_log` VALUES ('131', '37', 'facebook3', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 18:05:02', '2023-08-22 18:05:02');
INSERT INTO `wd_sys_login_log` VALUES ('132', '37', 'facebook3', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 18:36:11', '2023-08-22 18:36:11');
INSERT INTO `wd_sys_login_log` VALUES ('133', '37', 'facebook3', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 18:36:44', '2023-08-22 18:36:44');
INSERT INTO `wd_sys_login_log` VALUES ('134', '37', 'facebook3', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 18:43:03', '2023-08-22 18:43:03');
INSERT INTO `wd_sys_login_log` VALUES ('135', '37', 'facebook3', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 18:43:19', '2023-08-22 18:43:19');
INSERT INTO `wd_sys_login_log` VALUES ('136', '37', 'facebook3', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-22 18:43:59', '2023-08-22 18:43:59');
INSERT INTO `wd_sys_login_log` VALUES ('137', '37', 'facebook3', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-23 11:25:52', '2023-08-23 11:25:52');
INSERT INTO `wd_sys_login_log` VALUES ('138', '37', 'facebook3', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-23 11:31:54', '2023-08-23 11:31:54');
INSERT INTO `wd_sys_login_log` VALUES ('139', '37', 'facebook3', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-23 14:07:38', '2023-08-23 14:07:38');
INSERT INTO `wd_sys_login_log` VALUES ('140', '37', 'facebook3', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-23 14:13:44', '2023-08-23 14:13:44');
INSERT INTO `wd_sys_login_log` VALUES ('141', '37', 'facebook3', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-23 14:13:47', '2023-08-23 14:13:47');
INSERT INTO `wd_sys_login_log` VALUES ('142', '37', 'facebook3', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-23 14:15:59', '2023-08-23 14:15:59');
INSERT INTO `wd_sys_login_log` VALUES ('143', '37', 'facebook3', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-23 19:16:30', '2023-08-23 19:16:30');
INSERT INTO `wd_sys_login_log` VALUES ('144', '37', 'facebook3', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-23 19:17:01', '2023-08-23 19:17:01');
INSERT INTO `wd_sys_login_log` VALUES ('145', '37', 'facebook3', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-23 19:19:01', '2023-08-23 19:19:01');
INSERT INTO `wd_sys_login_log` VALUES ('146', '37', 'facebook3', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-23 19:19:05', '2023-08-23 19:19:05');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='操作日志';

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
  `orders` int(11) DEFAULT '0' COMMENT '排序',
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `value` (`value`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='权限值';

-- ----------------------------
-- Records of wd_sys_permission
-- ----------------------------
INSERT INTO `wd_sys_permission` VALUES ('1', '配置管理', 'config:admin', '0', '2023-07-05 16:02:45', '2023-07-05 16:02:48');
INSERT INTO `wd_sys_permission` VALUES ('2', '系统用户管理', 'system:user:admin', '0', '2023-07-05 16:03:15', '2023-07-05 16:03:17');
INSERT INTO `wd_sys_permission` VALUES ('3', '角色管理', 'role:admin', '1', '2023-07-05 16:04:18', '2023-07-05 16:04:21');
INSERT INTO `wd_sys_permission` VALUES ('4', '权限管理', 'permission:admin', '2', '2023-07-05 16:04:47', '2023-07-05 16:04:51');
INSERT INTO `wd_sys_permission` VALUES ('5', '字典管理', 'dictionary:admin', '3', '2023-07-05 16:05:05', '2023-07-05 16:05:08');
INSERT INTO `wd_sys_permission` VALUES ('6', '导出数据', 'data:export', '0', '2023-07-05 16:07:24', '2023-07-05 16:07:26');
INSERT INTO `wd_sys_permission` VALUES ('7', '部门管理', 'dept:admin', '0', '2023-08-08 15:22:55', '2023-08-08 15:22:58');
INSERT INTO `wd_sys_permission` VALUES ('8', '岗位管理', 'post:admin', '0', '2023-08-08 15:23:18', '2023-08-08 15:23:21');
INSERT INTO `wd_sys_permission` VALUES ('9', '查看登录日志', 'login:log:view', '0', '2023-08-18 11:43:46', '2023-08-18 11:43:50');
INSERT INTO `wd_sys_permission` VALUES ('10', '查看操作日志', 'operatoin:log:view', '0', '2023-08-18 11:44:12', '2023-08-18 11:44:15');
INSERT INTO `wd_sys_permission` VALUES ('11', '删除登录日志', 'login:log:delete', '0', '2023-08-18 11:45:26', '2023-08-18 11:45:29');
INSERT INTO `wd_sys_permission` VALUES ('12', '删除操作日志', 'operation:log:delete', '0', '2023-08-18 11:46:13', '2023-08-18 11:46:15');

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
  `orders` int(11) DEFAULT '0' COMMENT '排序',
  `deleted` bit(1) DEFAULT b'0' COMMENT '删除',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_date` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`deleted`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='岗位';

-- ----------------------------
-- Records of wd_sys_post
-- ----------------------------
INSERT INTO `wd_sys_post` VALUES ('1', 'JAVA高级工程师', '774564', null, null, null, null, '\0', '2023-07-03 16:31:26', '2023-07-03 16:31:28');
INSERT INTO `wd_sys_post` VALUES ('2', 'UI设计师', '3324322', null, null, null, null, '\0', '2023-07-03 16:31:40', '2023-07-03 16:31:42');
INSERT INTO `wd_sys_post` VALUES ('3', '测试人员', '4423423', null, null, null, null, '\0', '2023-07-03 16:31:58', '2023-07-03 16:32:01');
INSERT INTO `wd_sys_post` VALUES ('4', '电话销售', '44233', null, null, null, null, '\0', '2023-07-03 16:32:23', '2023-07-03 16:32:25');
INSERT INTO `wd_sys_post` VALUES ('5', '客服', '55234', null, null, null, null, '\0', '2023-07-03 16:32:37', '2023-07-03 16:32:40');

-- ----------------------------
-- Table structure for wd_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `wd_sys_role`;
CREATE TABLE `wd_sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL COMMENT '角色名称',
  `value` varchar(50) NOT NULL COMMENT '角色值',
  `description` varchar(120) DEFAULT NULL COMMENT '描述',
  `orders` int(11) DEFAULT '0' COMMENT '排序',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_date` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `value` (`value`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='角色';

-- ----------------------------
-- Records of wd_sys_role
-- ----------------------------
INSERT INTO `wd_sys_role` VALUES ('1', '超级管理员', 'role:super', '超级管理员', '0', '2023-07-05 16:14:56', '2023-07-05 16:14:59');
INSERT INTO `wd_sys_role` VALUES ('2', '管理员', 'role:admin', '管理员', '1', '2023-07-05 16:16:06', '2023-07-05 16:16:08');
INSERT INTO `wd_sys_role` VALUES ('3', '开发人员', 'role:developer', '开发人员', '2', '2023-07-05 16:17:11', '2023-07-05 16:17:14');
INSERT INTO `wd_sys_role` VALUES ('4', '操作人员', 'role:operation', '操作人员', '3', '2023-07-05 16:17:47', '2023-07-05 16:17:49');

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
INSERT INTO `wd_sys_role_user` VALUES ('2', '2');
INSERT INTO `wd_sys_role_user` VALUES ('3', '3');

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
  `disabled` bit(1) DEFAULT b'0' COMMENT '禁用',
  `deleted` bit(1) DEFAULT b'0' COMMENT '删除',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_date` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`,`deleted`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COMMENT='系统用户';

-- ----------------------------
-- Records of wd_sys_user
-- ----------------------------
INSERT INTO `wd_sys_user` VALUES ('1', 'zhouwenqi', '$2a$10$YrLdiL24WJ6xmVkzqmppy.gqusqocT56kRlXv5Y1Ij5J6IpF/ka9i', '444444', null, '', '1', null, null, null, '1', '1', '\0', '\0', '2023-07-03 16:20:24', '2023-07-03 16:20:26');
INSERT INTO `wd_sys_user` VALUES ('2', 'apple', '$2a$10$YrLdiL24WJ6xmVkzqmppy.gqusqocT56kRlXv5Y1Ij5J6IpF/ka9i', '苹国中国', null, null, '0', '13875928333', 'x2342xx@163.com', null, '1', '1', '\0', '\0', '2023-07-04 15:19:27', '2023-07-24 14:36:23');
INSERT INTO `wd_sys_user` VALUES ('3', 'microsoft', '$2a$10$YrLdiL24WJ6xmVkzqmppy.gqusqocT56kRlXv5Y1Ij5J6IpF/ka9i', '我在也阳光里', 'wozaiyeyangguangli', 'wzyygl', '2', null, null, null, '2', '1', '\0', '\0', '2023-07-03 16:21:01', '2023-07-27 14:08:17');
INSERT INTO `wd_sys_user` VALUES ('35', 'facebook2', '$2a$10$Wg7IwKGNqCQ2U95dpTTgceR3DoMgVI5Ram9zQXaq3MR.IGYGnxzy6', 'yyy', null, null, null, null, 'xxxx@163.com', null, '3', null, '\0', '\0', '2023-07-21 14:16:25', '2023-07-21 14:16:25');
INSERT INTO `wd_sys_user` VALUES ('36', 'facebook1', '$2a$10$nxI.uWOIEiuhO7DMXTtH5.xOCFMnykoLPjickYxP0udOPRlLtrTEC', 'xxx', null, null, null, null, 'xxxx@163.com', null, '1', null, '\0', '\0', '2023-07-21 14:18:07', '2023-07-21 14:18:07');
INSERT INTO `wd_sys_user` VALUES ('37', 'facebook3', '$2a$10$YrLdiL24WJ6xmVkzqmppy.gqusqocT56kRlXv5Y1Ij5J6IpF/ka9i', 'rr经wreo', 'rrjingwreo', 'j', '0', '13875928333', 'x2342xx@163.com', null, '1', null, '\0', '\0', '2023-07-21 14:20:41', '2023-08-23 19:23:07');
INSERT INTO `wd_sys_user` VALUES ('38', 'response', '$2a$10$YrLdiL24WJ6xmVkzqmppy.gqusqocT56kRlXv5Y1Ij5J6IpF/ka9i', '42342', null, null, '2', null, 'xxxx@163.com', null, '4', null, '\0', '\0', '2023-07-24 14:45:08', '2023-07-26 17:46:27');

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
