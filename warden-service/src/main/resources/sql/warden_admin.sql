/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.11
Source Server Version : 50743
Source Host           : 192.168.1.11:3306
Source Database       : warden_admin

Target Server Type    : MYSQL
Target Server Version : 50743
File Encoding         : 65001

Date: 2023-12-07 14:39:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for wd_sys_config
-- ----------------------------
DROP TABLE IF EXISTS `wd_sys_config`;
CREATE TABLE `wd_sys_config` (
  `enabled_register` bit(1) NOT NULL DEFAULT b'0' COMMENT '开启注册功能',
  `allow_many_token` bit(1) NOT NULL DEFAULT b'0' COMMENT '允许一个帐号生成多个有效token',
  `enabled_again_verify` bit(1) NOT NULL DEFAULT b'0' COMMENT '起用再次验证'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统配置';

-- ----------------------------
-- Records of wd_sys_config
-- ----------------------------
INSERT INTO `wd_sys_config` VALUES ('', '', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=518 DEFAULT CHARSET=utf8mb4 COMMENT='登录日志';

-- ----------------------------
-- Records of wd_sys_login_log
-- ----------------------------
INSERT INTO `wd_sys_login_log` VALUES ('1', '1', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '福建省-厦门市', '\0', '2023-08-17 12:29:12', '2023-08-17 12:29:12');
INSERT INTO `wd_sys_login_log` VALUES ('2', '1', 'zhouwenqi', '0', '5', '0', '登录失败:帐号或密码错误', '0:0:0:0:0:0:0:1', '福建省-厦门市', '', '2023-08-17 12:34:42', '2023-08-17 12:34:42');
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
INSERT INTO `wd_sys_login_log` VALUES ('147', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '广东省-东莞市', '\0', '2023-09-05 11:41:16', '2023-09-05 11:41:16');
INSERT INTO `wd_sys_login_log` VALUES ('148', '39', 'xiaoma', '0', '5', '0', '登录失败:密码错误', '182.105.7.45', '江西省-萍乡市', '\0', '2023-09-07 09:44:38', '2023-09-07 09:44:38');
INSERT INTO `wd_sys_login_log` VALUES ('149', '39', 'xiaoma', '1', '5', '0', '登录成功', '182.105.7.45', '江西省-萍乡市', '\0', '2023-09-07 09:44:45', '2023-09-07 09:44:45');
INSERT INTO `wd_sys_login_log` VALUES ('150', '1', 'superman', '1', '5', '0', '登录成功', '182.105.7.45', '江西省-萍乡市', '\0', '2023-09-07 11:21:50', '2023-09-07 11:21:50');
INSERT INTO `wd_sys_login_log` VALUES ('151', '1', 'superman', '1', '5', '0', '登录成功', '182.105.7.45', '江西省-萍乡市', '\0', '2023-09-07 11:22:03', '2023-09-07 11:22:03');
INSERT INTO `wd_sys_login_log` VALUES ('152', '1', 'superman', '1', '5', '0', '登录成功', '182.105.6.105', '江西省-萍乡市', '\0', '2023-09-08 09:14:33', '2023-09-08 09:14:33');
INSERT INTO `wd_sys_login_log` VALUES ('153', '1', 'superman', '1', '5', '0', '登录成功', '182.105.6.105', '江西省-萍乡市', '\0', '2023-09-08 09:24:20', '2023-09-08 09:24:20');
INSERT INTO `wd_sys_login_log` VALUES ('154', '1', 'superman', '1', '5', '0', '登录成功', '182.105.6.161', '江西省-萍乡市', '\0', '2023-09-11 13:37:45', '2023-09-11 13:37:45');
INSERT INTO `wd_sys_login_log` VALUES ('155', '1', 'superman', '1', '5', '0', '登录成功', '182.105.6.161', '江西省-萍乡市', '\0', '2023-09-11 15:00:17', '2023-09-11 15:00:17');
INSERT INTO `wd_sys_login_log` VALUES ('156', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '广东省-东莞市', '\0', '2023-09-11 22:04:49', '2023-09-11 22:04:49');
INSERT INTO `wd_sys_login_log` VALUES ('157', '1', 'superman', '1', '5', '0', '登录成功', '182.105.6.161', '江西省-萍乡市', '\0', '2023-09-12 10:13:15', '2023-09-12 10:13:15');
INSERT INTO `wd_sys_login_log` VALUES ('158', '1', 'superman', '1', '5', '0', '登录成功', '182.105.6.161', '江西省-萍乡市', '\0', '2023-09-12 11:28:26', '2023-09-12 11:28:26');
INSERT INTO `wd_sys_login_log` VALUES ('159', '2', 'zhouwenqi', '0', '5', '0', '登录失败:密码错误', '127.0.0.1', '-', '\0', '2023-09-12 11:31:00', '2023-09-12 11:31:00');
INSERT INTO `wd_sys_login_log` VALUES ('160', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '113.77.49.81', '广东省-东莞市', '\0', '2023-09-12 11:57:05', '2023-09-12 11:57:05');
INSERT INTO `wd_sys_login_log` VALUES ('161', '1', 'superman', '1', '5', '0', '登录成功', '182.105.6.161', '江西省-萍乡市', '\0', '2023-09-12 11:59:39', '2023-09-12 11:59:39');
INSERT INTO `wd_sys_login_log` VALUES ('162', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '113.77.49.81', '广东省-东莞市', '\0', '2023-09-12 11:59:53', '2023-09-12 11:59:53');
INSERT INTO `wd_sys_login_log` VALUES ('163', '1', 'superman', '1', '5', '0', '登录成功', '182.105.6.161', '江西省-萍乡市', '\0', '2023-09-12 12:00:11', '2023-09-12 12:00:11');
INSERT INTO `wd_sys_login_log` VALUES ('164', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '广东省-东莞市', '\0', '2023-09-14 22:16:17', '2023-09-14 22:16:17');
INSERT INTO `wd_sys_login_log` VALUES ('165', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '广东省-东莞市', '\0', '2023-09-14 22:17:45', '2023-09-14 22:17:45');
INSERT INTO `wd_sys_login_log` VALUES ('166', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '广东省-东莞市', '\0', '2023-09-16 00:00:39', '2023-09-16 00:00:39');
INSERT INTO `wd_sys_login_log` VALUES ('167', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '广东省-东莞市', '\0', '2023-09-16 00:37:16', '2023-09-16 00:37:16');
INSERT INTO `wd_sys_login_log` VALUES ('168', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '广东省-东莞市', '\0', '2023-09-16 00:39:24', '2023-09-16 00:39:24');
INSERT INTO `wd_sys_login_log` VALUES ('169', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '广东省-东莞市', '\0', '2023-09-16 00:41:23', '2023-09-16 00:41:23');
INSERT INTO `wd_sys_login_log` VALUES ('170', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '广东省-东莞市', '\0', '2023-09-16 00:42:15', '2023-09-16 00:42:15');
INSERT INTO `wd_sys_login_log` VALUES ('171', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '广东省-东莞市', '\0', '2023-09-16 00:42:32', '2023-09-16 00:42:32');
INSERT INTO `wd_sys_login_log` VALUES ('172', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '广东省-东莞市', '\0', '2023-09-20 00:50:47', '2023-09-20 00:50:47');
INSERT INTO `wd_sys_login_log` VALUES ('173', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '广东省-东莞市', '\0', '2023-09-20 01:05:09', '2023-09-20 01:05:09');
INSERT INTO `wd_sys_login_log` VALUES ('174', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '广东省-东莞市', '\0', '2023-09-20 01:09:52', '2023-09-20 01:09:52');
INSERT INTO `wd_sys_login_log` VALUES ('175', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '广东省-东莞市', '\0', '2023-09-20 01:47:04', '2023-09-20 01:47:04');
INSERT INTO `wd_sys_login_log` VALUES ('176', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '广东省-东莞市', '\0', '2023-09-20 01:47:20', '2023-09-20 01:47:20');
INSERT INTO `wd_sys_login_log` VALUES ('177', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '广东省-东莞市', '\0', '2023-09-20 02:06:31', '2023-09-20 02:06:31');
INSERT INTO `wd_sys_login_log` VALUES ('178', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '广东省-东莞市', '\0', '2023-09-20 02:17:04', '2023-09-20 02:17:04');
INSERT INTO `wd_sys_login_log` VALUES ('179', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '广东省-东莞市', '\0', '2023-09-20 02:26:12', '2023-09-20 02:26:12');
INSERT INTO `wd_sys_login_log` VALUES ('180', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '广东省-东莞市', '\0', '2023-09-20 02:28:44', '2023-09-20 02:28:44');
INSERT INTO `wd_sys_login_log` VALUES ('181', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '广东省-东莞市', '\0', '2023-09-20 02:31:36', '2023-09-20 02:31:36');
INSERT INTO `wd_sys_login_log` VALUES ('182', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '广东省-东莞市', '\0', '2023-09-20 02:42:39', '2023-09-20 02:42:39');
INSERT INTO `wd_sys_login_log` VALUES ('183', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '广东省-东莞市', '\0', '2023-09-20 02:58:03', '2023-09-20 02:58:03');
INSERT INTO `wd_sys_login_log` VALUES ('184', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '广东省-东莞市', '\0', '2023-09-20 03:23:49', '2023-09-20 03:23:49');
INSERT INTO `wd_sys_login_log` VALUES ('185', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '广东省-东莞市', '\0', '2023-09-20 03:27:53', '2023-09-20 03:27:53');
INSERT INTO `wd_sys_login_log` VALUES ('186', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '127.0.0.1', '-', '\0', '2023-09-21 21:17:56', '2023-09-21 21:17:56');
INSERT INTO `wd_sys_login_log` VALUES ('187', '1', 'superman', '1', '5', '0', '登录成功', '106.5.205.64', '江西省-萍乡市', '\0', '2023-09-22 09:02:48', '2023-09-22 09:02:48');
INSERT INTO `wd_sys_login_log` VALUES ('188', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '广东省-东莞市', '\0', '2023-09-22 14:01:51', '2023-09-22 14:01:51');
INSERT INTO `wd_sys_login_log` VALUES ('189', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '广东省-东莞市', '\0', '2023-09-22 14:02:28', '2023-09-22 14:02:28');
INSERT INTO `wd_sys_login_log` VALUES ('190', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '119.128.113.79', '广东省-东莞市', '\0', '2023-09-23 17:05:21', '2023-09-23 17:05:21');
INSERT INTO `wd_sys_login_log` VALUES ('191', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '广东省-东莞市', '\0', '2023-09-24 13:50:57', '2023-09-24 13:50:57');
INSERT INTO `wd_sys_login_log` VALUES ('192', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '广东省-东莞市', '\0', '2023-09-24 13:56:00', '2023-09-24 13:56:00');
INSERT INTO `wd_sys_login_log` VALUES ('193', '1', 'superman', '1', '5', '0', '登录成功', '182.99.241.30', '江西省-萍乡市', '\0', '2023-09-25 10:29:01', '2023-09-25 10:29:01');
INSERT INTO `wd_sys_login_log` VALUES ('194', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '113.91.250.35', '广东省-深圳市', '\0', '2023-09-25 21:19:36', '2023-09-25 21:19:36');
INSERT INTO `wd_sys_login_log` VALUES ('195', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '广东省-东莞市', '\0', '2023-09-25 21:53:04', '2023-09-25 21:53:04');
INSERT INTO `wd_sys_login_log` VALUES ('196', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '广东省-东莞市', '\0', '2023-09-25 23:09:42', '2023-09-25 23:09:42');
INSERT INTO `wd_sys_login_log` VALUES ('197', '1', 'superman', '1', '5', '0', '登录成功', '106.5.205.253', '江西省-萍乡市', '\0', '2023-09-27 15:11:27', '2023-09-27 15:11:27');
INSERT INTO `wd_sys_login_log` VALUES ('198', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '广东省-东莞市', '\0', '2023-09-27 15:41:13', '2023-09-27 15:41:13');
INSERT INTO `wd_sys_login_log` VALUES ('199', '1', 'superman', '1', '5', '0', '登录成功', '182.105.6.68', '江西省-萍乡市', '\0', '2023-09-28 13:20:56', '2023-09-28 13:20:56');
INSERT INTO `wd_sys_login_log` VALUES ('200', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '广东省-东莞市', '\0', '2023-09-28 14:23:20', '2023-09-28 14:23:20');
INSERT INTO `wd_sys_login_log` VALUES ('201', '1', 'superman', '1', '5', '0', '登录成功', '182.105.6.68', '江西省-萍乡市', '\0', '2023-09-28 14:37:56', '2023-09-28 14:37:56');
INSERT INTO `wd_sys_login_log` VALUES ('202', '1', 'superman', '1', '5', '0', '登录成功', '182.105.6.68', '江西省-萍乡市', '\0', '2023-09-28 14:52:31', '2023-09-28 14:52:31');
INSERT INTO `wd_sys_login_log` VALUES ('203', '1', 'superman', '1', '5', '0', '登录成功', '182.105.6.68', '江西省-萍乡市', '\0', '2023-09-28 14:55:28', '2023-09-28 14:55:28');
INSERT INTO `wd_sys_login_log` VALUES ('204', '1', 'superman', '1', '5', '0', '登录成功', '182.105.6.68', '江西省-萍乡市', '\0', '2023-09-28 15:01:46', '2023-09-28 15:01:46');
INSERT INTO `wd_sys_login_log` VALUES ('205', '1', 'superman', '1', '5', '0', '登录成功', '182.105.6.68', '江西省-萍乡市', '\0', '2023-09-28 15:02:19', '2023-09-28 15:02:19');
INSERT INTO `wd_sys_login_log` VALUES ('206', '1', 'superman', '1', '5', '0', '登录成功', '182.105.6.68', '江西省-萍乡市', '\0', '2023-09-28 15:02:44', '2023-09-28 15:02:44');
INSERT INTO `wd_sys_login_log` VALUES ('207', '1', 'superman', '1', '5', '0', '登录成功', '182.105.6.68', '江西省-萍乡市', '\0', '2023-09-28 15:03:07', '2023-09-28 15:03:07');
INSERT INTO `wd_sys_login_log` VALUES ('208', '1', 'superman', '1', '5', '0', '登录成功', '182.105.6.68', '江西省-萍乡市', '\0', '2023-09-28 15:06:01', '2023-09-28 15:06:01');
INSERT INTO `wd_sys_login_log` VALUES ('209', '1', 'superman', '1', '5', '0', '登录成功', '182.105.6.68', '江西省-萍乡市', '\0', '2023-09-28 15:06:26', '2023-09-28 15:06:26');
INSERT INTO `wd_sys_login_log` VALUES ('210', '1', 'superman', '1', '5', '0', '登录成功', '182.105.6.68', '江西省-萍乡市', '\0', '2023-09-28 15:09:05', '2023-09-28 15:09:05');
INSERT INTO `wd_sys_login_log` VALUES ('211', '1', 'superman', '1', '5', '0', '登录成功', '182.105.6.68', '江西省-萍乡市', '\0', '2023-09-28 15:13:40', '2023-09-28 15:13:40');
INSERT INTO `wd_sys_login_log` VALUES ('212', '1', 'superman', '1', '5', '0', '登录成功', '59.39.224.138', '广东省-东莞市', '\0', '2023-09-28 15:17:00', '2023-09-28 15:17:00');
INSERT INTO `wd_sys_login_log` VALUES ('213', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '广东省-东莞市', '\0', '2023-10-01 23:37:59', '2023-10-01 23:37:59');
INSERT INTO `wd_sys_login_log` VALUES ('214', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '116.4.240.186', '广东省-东莞市', '\0', '2023-10-01 23:49:20', '2023-10-01 23:49:20');
INSERT INTO `wd_sys_login_log` VALUES ('215', '1', 'superman', '1', '5', '0', '登录成功', '106.5.207.250', '江西省-萍乡市', '\0', '2023-10-04 06:59:26', '2023-10-04 06:59:26');
INSERT INTO `wd_sys_login_log` VALUES ('216', '1', 'superman', '1', '5', '0', '登录成功', '182.105.9.130', '江西省-萍乡市', '\0', '2023-10-09 15:20:00', '2023-10-09 15:20:00');
INSERT INTO `wd_sys_login_log` VALUES ('217', '1', 'superman', '1', '5', '0', '登录成功', '182.105.9.130', '江西省-萍乡市', '\0', '2023-10-10 14:46:41', '2023-10-10 14:46:41');
INSERT INTO `wd_sys_login_log` VALUES ('218', '1', 'superman', '1', '5', '0', '登录成功', '182.105.9.130', '江西省-萍乡市', '\0', '2023-10-10 14:47:37', '2023-10-10 14:47:37');
INSERT INTO `wd_sys_login_log` VALUES ('219', '1', 'superman', '0', '5', '0', '登录失败:密码错误', '182.105.9.130', '江西省-萍乡市', '\0', '2023-10-10 15:02:42', '2023-10-10 15:02:42');
INSERT INTO `wd_sys_login_log` VALUES ('220', '1', 'superman', '1', '5', '0', '登录成功', '182.105.9.130', '江西省-萍乡市', '\0', '2023-10-10 15:03:01', '2023-10-10 15:03:01');
INSERT INTO `wd_sys_login_log` VALUES ('221', '41', 'test12', '1', '5', '0', '登录成功', '182.105.9.130', '江西省-萍乡市', '\0', '2023-10-10 15:11:43', '2023-10-10 15:11:43');
INSERT INTO `wd_sys_login_log` VALUES ('222', '41', 'test12', '1', '5', '0', '登录成功', '112.113.215.132', '云南省-保山市', '\0', '2023-10-11 16:46:42', '2023-10-11 16:46:42');
INSERT INTO `wd_sys_login_log` VALUES ('223', '41', 'test12', '1', '5', '0', '登录成功', '14.108.151.218', '重庆市-重庆市', '\0', '2023-10-11 16:49:02', '2023-10-11 16:49:02');
INSERT INTO `wd_sys_login_log` VALUES ('224', '41', 'test12', '1', '5', '0', '登录成功', '120.36.250.194', '福建省-厦门市', '\0', '2023-10-11 16:54:45', '2023-10-11 16:54:45');
INSERT INTO `wd_sys_login_log` VALUES ('225', '41', 'test12', '1', '5', '0', '登录成功', '119.98.191.148', '湖北省-武汉市', '\0', '2023-10-11 16:59:01', '2023-10-11 16:59:01');
INSERT INTO `wd_sys_login_log` VALUES ('226', '41', 'test12', '1', '5', '0', '登录成功', '120.36.250.194', '福建省-厦门市', '\0', '2023-10-11 16:59:17', '2023-10-11 16:59:17');
INSERT INTO `wd_sys_login_log` VALUES ('227', '41', 'test12', '1', '5', '0', '登录成功', '120.36.250.194', '福建省-厦门市', '\0', '2023-10-11 17:02:49', '2023-10-11 17:02:49');
INSERT INTO `wd_sys_login_log` VALUES ('228', '41', 'test12', '1', '5', '0', '登录成功', '222.86.181.15', '贵州省-黔南州', '\0', '2023-10-11 17:06:55', '2023-10-11 17:06:55');
INSERT INTO `wd_sys_login_log` VALUES ('229', '41', 'test12', '1', '5', '0', '登录成功', '39.184.141.12', '浙江省-嘉兴市', '\0', '2023-10-11 17:25:31', '2023-10-11 17:25:31');
INSERT INTO `wd_sys_login_log` VALUES ('230', '41', 'test12', '1', '5', '0', '登录成功', '182.245.71.10', '云南省-昆明市', '\0', '2023-10-11 17:42:10', '2023-10-11 17:42:10');
INSERT INTO `wd_sys_login_log` VALUES ('231', '41', 'test12', '1', '5', '0', '登录成功', '113.248.98.119', '重庆市-重庆市', '\0', '2023-10-11 17:47:11', '2023-10-11 17:47:11');
INSERT INTO `wd_sys_login_log` VALUES ('232', '41', 'test12', '1', '5', '0', '登录成功', '117.136.33.152', '广东省-深圳市', '\0', '2023-10-11 18:00:16', '2023-10-11 18:00:16');
INSERT INTO `wd_sys_login_log` VALUES ('233', '41', 'test12', '1', '5', '0', '登录成功', '58.34.243.170', '上海市-上海市', '\0', '2023-10-12 10:08:15', '2023-10-12 10:08:15');
INSERT INTO `wd_sys_login_log` VALUES ('234', '41', 'test12', '1', '5', '0', '登录成功', '220.246.252.191', '香港-', '\0', '2023-10-12 13:58:42', '2023-10-12 13:58:42');
INSERT INTO `wd_sys_login_log` VALUES ('235', '41', 'test12', '1', '5', '0', '登录成功', '220.168.19.22', '湖南省-长沙市', '\0', '2023-10-12 14:31:32', '2023-10-12 14:31:32');
INSERT INTO `wd_sys_login_log` VALUES ('236', '41', 'test12', '1', '5', '0', '登录成功', '58.34.243.170', '上海市-上海市', '\0', '2023-10-12 15:06:59', '2023-10-12 15:06:59');
INSERT INTO `wd_sys_login_log` VALUES ('237', '41', 'test12', '1', '5', '0', '登录成功', '122.117.100.230', '台湾省-', '\0', '2023-10-12 15:27:57', '2023-10-12 15:27:57');
INSERT INTO `wd_sys_login_log` VALUES ('238', '41', 'test12', '1', '5', '0', '登录成功', '106.61.83.241', '云南省-昆明市', '\0', '2023-10-12 15:57:10', '2023-10-12 15:57:10');
INSERT INTO `wd_sys_login_log` VALUES ('239', '41', 'test12', '1', '5', '0', '登录成功', '112.48.43.242', '福建省-厦门市', '\0', '2023-10-12 16:31:39', '2023-10-12 16:31:39');
INSERT INTO `wd_sys_login_log` VALUES ('240', '41', 'test12', '1', '5', '0', '登录成功', '112.8.56.117', '山东省-临沂市', '\0', '2023-10-12 16:55:22', '2023-10-12 16:55:22');
INSERT INTO `wd_sys_login_log` VALUES ('241', '41', 'test12', '1', '5', '0', '登录成功', '58.34.243.170', '上海市-上海市', '\0', '2023-10-12 17:50:00', '2023-10-12 17:50:00');
INSERT INTO `wd_sys_login_log` VALUES ('242', '41', 'test12', '1', '5', '0', '登录成功', '58.34.243.170', '上海市-上海市', '\0', '2023-10-12 18:03:16', '2023-10-12 18:03:16');
INSERT INTO `wd_sys_login_log` VALUES ('243', '41', 'test12', '1', '5', '0', '登录成功', '58.34.243.170', '上海市-上海市', '\0', '2023-10-12 18:17:42', '2023-10-12 18:17:42');
INSERT INTO `wd_sys_login_log` VALUES ('244', '41', 'test12', '1', '5', '0', '登录成功', '58.34.243.170', '上海市-上海市', '\0', '2023-10-12 19:54:17', '2023-10-12 19:54:17');
INSERT INTO `wd_sys_login_log` VALUES ('245', '41', 'test12', '1', '5', '0', '登录成功', '120.230.203.216', '广东省-韶关市', '\0', '2023-10-12 23:18:44', '2023-10-12 23:18:44');
INSERT INTO `wd_sys_login_log` VALUES ('246', '41', 'test12', '1', '5', '0', '登录成功', '171.218.189.118', '四川省-成都市', '\0', '2023-10-13 08:42:17', '2023-10-13 08:42:17');
INSERT INTO `wd_sys_login_log` VALUES ('247', '41', 'test12', '1', '5', '0', '登录成功', '123.52.150.35', '河南省-洛阳市', '\0', '2023-10-13 09:02:41', '2023-10-13 09:02:41');
INSERT INTO `wd_sys_login_log` VALUES ('248', '41', 'test12', '1', '5', '0', '登录成功', '116.52.34.167', '云南省-昆明市', '\0', '2023-10-13 10:10:03', '2023-10-13 10:10:03');
INSERT INTO `wd_sys_login_log` VALUES ('249', '41', 'test12', '1', '5', '0', '登录成功', '116.30.120.113', '广东省-深圳市', '\0', '2023-10-13 10:34:50', '2023-10-13 10:34:50');
INSERT INTO `wd_sys_login_log` VALUES ('250', '41', 'test12', '1', '5', '0', '登录成功', '202.96.99.160', '浙江省-杭州市', '\0', '2023-10-13 10:41:12', '2023-10-13 10:41:12');
INSERT INTO `wd_sys_login_log` VALUES ('251', '41', 'test12', '1', '5', '0', '登录成功', '112.16.177.251', '浙江省-宁波市', '\0', '2023-10-13 10:50:57', '2023-10-13 10:50:57');
INSERT INTO `wd_sys_login_log` VALUES ('252', '41', 'test12', '1', '5', '0', '登录成功', '58.34.243.170', '上海市-上海市', '\0', '2023-10-13 10:54:34', '2023-10-13 10:54:34');
INSERT INTO `wd_sys_login_log` VALUES ('253', '41', 'test12', '1', '5', '0', '登录成功', '123.138.30.21', '陕西省-西安市', '\0', '2023-10-13 11:03:25', '2023-10-13 11:03:25');
INSERT INTO `wd_sys_login_log` VALUES ('254', '41', 'test12', '1', '5', '0', '登录成功', '36.33.216.43', '安徽省-合肥市', '\0', '2023-10-13 11:22:57', '2023-10-13 11:22:57');
INSERT INTO `wd_sys_login_log` VALUES ('255', '41', 'test12', '1', '5', '0', '登录成功', '116.30.120.113', '广东省-深圳市', '\0', '2023-10-13 11:29:17', '2023-10-13 11:29:17');
INSERT INTO `wd_sys_login_log` VALUES ('256', '41', 'test12', '1', '5', '0', '登录成功', '58.34.243.170', '上海市-上海市', '\0', '2023-10-13 11:40:27', '2023-10-13 11:40:27');
INSERT INTO `wd_sys_login_log` VALUES ('257', '41', 'test12', '1', '5', '0', '登录成功', '116.30.120.113', '广东省-深圳市', '\0', '2023-10-13 11:41:05', '2023-10-13 11:41:05');
INSERT INTO `wd_sys_login_log` VALUES ('258', '41', 'test12', '1', '5', '0', '登录成功', '58.34.243.170', '上海市-上海市', '\0', '2023-10-13 11:42:10', '2023-10-13 11:42:10');
INSERT INTO `wd_sys_login_log` VALUES ('259', '41', 'test12', '1', '5', '0', '登录成功', '112.16.91.153', '浙江省-杭州市', '\0', '2023-10-13 12:07:08', '2023-10-13 12:07:08');
INSERT INTO `wd_sys_login_log` VALUES ('260', '41', 'test12', '1', '5', '0', '登录成功', '113.143.217.55', '陕西省-西安市', '\0', '2023-10-13 12:14:13', '2023-10-13 12:14:13');
INSERT INTO `wd_sys_login_log` VALUES ('261', '41', 'test12', '1', '5', '0', '登录成功', '118.167.18.234', '台湾省-', '\0', '2023-10-13 16:02:38', '2023-10-13 16:02:38');
INSERT INTO `wd_sys_login_log` VALUES ('262', '41', 'test12', '1', '5', '0', '登录成功', '106.61.116.24', '云南省-昆明市', '\0', '2023-10-13 16:06:18', '2023-10-13 16:06:18');
INSERT INTO `wd_sys_login_log` VALUES ('263', '41', 'test12', '1', '5', '0', '登录成功', '218.75.98.34', '浙江省-金华市', '\0', '2023-10-13 16:35:12', '2023-10-13 16:35:12');
INSERT INTO `wd_sys_login_log` VALUES ('264', '41', 'test12', '1', '5', '0', '登录成功', '114.241.107.254', '北京市-北京市', '\0', '2023-10-13 16:38:27', '2023-10-13 16:38:27');
INSERT INTO `wd_sys_login_log` VALUES ('265', '41', 'test12', '1', '5', '0', '登录成功', '218.75.98.34', '浙江省-金华市', '\0', '2023-10-13 16:40:11', '2023-10-13 16:40:11');
INSERT INTO `wd_sys_login_log` VALUES ('266', '41', 'test12', '1', '5', '0', '登录成功', '117.61.26.214', '四川省-成都市', '\0', '2023-10-13 16:41:12', '2023-10-13 16:41:12');
INSERT INTO `wd_sys_login_log` VALUES ('267', '41', 'test12', '1', '5', '0', '登录成功', '220.197.4.139', '贵州省-', '\0', '2023-10-13 16:41:27', '2023-10-13 16:41:27');
INSERT INTO `wd_sys_login_log` VALUES ('268', '41', 'test12', '1', '5', '0', '登录成功', '220.197.4.139', '贵州省-', '\0', '2023-10-13 16:41:39', '2023-10-13 16:41:39');
INSERT INTO `wd_sys_login_log` VALUES ('269', '41', 'test12', '1', '5', '0', '登录成功', '58.34.243.170', '上海市-上海市', '\0', '2023-10-13 17:48:03', '2023-10-13 17:48:03');
INSERT INTO `wd_sys_login_log` VALUES ('270', '41', 'test12', '1', '5', '0', '登录成功', '101.87.118.116', '上海市-上海市', '\0', '2023-10-13 18:03:36', '2023-10-13 18:03:36');
INSERT INTO `wd_sys_login_log` VALUES ('271', '41', 'test12', '1', '5', '0', '登录成功', '223.104.151.69', '江苏省-泰州市', '\0', '2023-10-13 18:11:02', '2023-10-13 18:11:02');
INSERT INTO `wd_sys_login_log` VALUES ('272', '41', 'test12', '1', '5', '0', '登录成功', '180.98.1.54', '江苏省-淮安市', '\0', '2023-10-13 18:21:54', '2023-10-13 18:21:54');
INSERT INTO `wd_sys_login_log` VALUES ('273', '41', 'test12', '1', '5', '0', '登录成功', '39.144.156.173', '江苏省-苏州市', '\0', '2023-10-13 18:25:47', '2023-10-13 18:25:47');
INSERT INTO `wd_sys_login_log` VALUES ('274', '41', 'test12', '1', '5', '0', '登录成功', '125.92.228.182', '广东省-中山市', '\0', '2023-10-13 20:35:18', '2023-10-13 20:35:18');
INSERT INTO `wd_sys_login_log` VALUES ('275', '41', 'test12', '1', '5', '0', '登录成功', '36.27.18.219', '浙江省-杭州市', '\0', '2023-10-13 21:27:03', '2023-10-13 21:27:03');
INSERT INTO `wd_sys_login_log` VALUES ('276', '41', 'test12', '1', '5', '0', '登录成功', '117.162.131.207', '江西省-上饶市', '\0', '2023-10-13 21:47:08', '2023-10-13 21:47:08');
INSERT INTO `wd_sys_login_log` VALUES ('277', '41', 'test12', '1', '5', '0', '登录成功', '114.225.242.191', '江苏省-无锡市', '\0', '2023-10-13 22:58:27', '2023-10-13 22:58:27');
INSERT INTO `wd_sys_login_log` VALUES ('278', '41', 'test12', '1', '5', '0', '登录成功', '113.248.206.67', '重庆市-重庆市', '\0', '2023-10-13 22:59:19', '2023-10-13 22:59:19');
INSERT INTO `wd_sys_login_log` VALUES ('279', '41', 'test12', '1', '5', '0', '登录成功', '117.89.21.61', '江苏省-南京市', '\0', '2023-10-13 23:34:49', '2023-10-13 23:34:49');
INSERT INTO `wd_sys_login_log` VALUES ('280', '41', 'test12', '1', '5', '0', '登录成功', '39.144.43.240', '上海市-上海市', '\0', '2023-10-13 23:48:26', '2023-10-13 23:48:26');
INSERT INTO `wd_sys_login_log` VALUES ('281', '41', 'test12', '1', '5', '0', '登录成功', '183.202.212.142', '山西省-晋中市', '\0', '2023-10-14 03:08:17', '2023-10-14 03:08:17');
INSERT INTO `wd_sys_login_log` VALUES ('282', '41', 'test12', '1', '5', '0', '登录成功', '103.27.25.118', '广东省-广州市', '\0', '2023-10-14 05:50:53', '2023-10-14 05:50:53');
INSERT INTO `wd_sys_login_log` VALUES ('283', '41', 'test12', '1', '5', '0', '登录成功', '180.107.81.117', '江苏省-苏州市', '\0', '2023-10-14 08:29:53', '2023-10-14 08:29:53');
INSERT INTO `wd_sys_login_log` VALUES ('284', '41', 'test12', '1', '5', '0', '登录成功', '118.73.118.140', '山西省-临汾市', '\0', '2023-10-14 09:17:03', '2023-10-14 09:17:03');
INSERT INTO `wd_sys_login_log` VALUES ('285', '41', 'test12', '1', '5', '0', '登录成功', '101.80.55.93', '上海市-上海市', '\0', '2023-10-14 09:41:11', '2023-10-14 09:41:11');
INSERT INTO `wd_sys_login_log` VALUES ('286', '41', 'test12', '1', '5', '0', '登录成功', '112.10.195.243', '浙江省-杭州市', '\0', '2023-10-14 09:55:48', '2023-10-14 09:55:48');
INSERT INTO `wd_sys_login_log` VALUES ('287', '41', 'test12', '1', '5', '0', '登录成功', '116.227.31.171', '上海市-上海市', '\0', '2023-10-14 11:01:58', '2023-10-14 11:01:58');
INSERT INTO `wd_sys_login_log` VALUES ('288', '41', 'test12', '1', '5', '0', '登录成功', '116.227.31.171', '上海市-上海市', '\0', '2023-10-14 11:03:29', '2023-10-14 11:03:29');
INSERT INTO `wd_sys_login_log` VALUES ('289', '41', 'test12', '1', '5', '0', '登录成功', '49.66.203.4', '江苏省-无锡市', '\0', '2023-10-14 11:40:47', '2023-10-14 11:40:47');
INSERT INTO `wd_sys_login_log` VALUES ('290', '41', 'test12', '1', '5', '0', '登录成功', '49.66.203.4', '江苏省-无锡市', '\0', '2023-10-14 11:40:55', '2023-10-14 11:40:55');
INSERT INTO `wd_sys_login_log` VALUES ('291', '41', 'test12', '1', '5', '0', '登录成功', '116.227.31.171', '上海市-上海市', '\0', '2023-10-14 11:44:02', '2023-10-14 11:44:02');
INSERT INTO `wd_sys_login_log` VALUES ('292', '41', 'test12', '1', '5', '0', '登录成功', '116.227.31.171', '上海市-上海市', '\0', '2023-10-14 11:48:21', '2023-10-14 11:48:21');
INSERT INTO `wd_sys_login_log` VALUES ('293', '41', 'test12', '1', '5', '0', '登录成功', '36.28.152.39', '浙江省-杭州市', '\0', '2023-10-14 13:30:34', '2023-10-14 13:30:34');
INSERT INTO `wd_sys_login_log` VALUES ('294', '41', 'test12', '1', '5', '0', '登录成功', '61.144.172.41', '广东省-深圳市', '\0', '2023-10-14 15:02:14', '2023-10-14 15:02:14');
INSERT INTO `wd_sys_login_log` VALUES ('295', '41', 'test12', '1', '5', '0', '登录成功', '115.60.43.168', '河南省-郑州市', '\0', '2023-10-14 15:29:35', '2023-10-14 15:29:35');
INSERT INTO `wd_sys_login_log` VALUES ('296', '41', 'test12', '1', '5', '0', '登录成功', '125.38.104.164', '天津市-天津市', '\0', '2023-10-14 18:16:51', '2023-10-14 18:16:51');
INSERT INTO `wd_sys_login_log` VALUES ('297', '41', 'test12', '1', '5', '0', '登录成功', '36.27.18.219', '浙江省-杭州市', '\0', '2023-10-14 20:46:38', '2023-10-14 20:46:38');
INSERT INTO `wd_sys_login_log` VALUES ('298', '41', 'test12', '1', '5', '0', '登录成功', '36.27.18.219', '浙江省-杭州市', '\0', '2023-10-14 20:46:48', '2023-10-14 20:46:48');
INSERT INTO `wd_sys_login_log` VALUES ('299', '41', 'test12', '1', '5', '0', '登录成功', '223.88.154.151', '河南省-洛阳市', '\0', '2023-10-14 22:36:30', '2023-10-14 22:36:30');
INSERT INTO `wd_sys_login_log` VALUES ('300', '41', 'test12', '1', '5', '0', '登录成功', '113.250.225.26', '重庆市-重庆市', '\0', '2023-10-14 23:04:28', '2023-10-14 23:04:28');
INSERT INTO `wd_sys_login_log` VALUES ('301', '41', 'test12', '1', '5', '0', '登录成功', '27.16.175.244', '湖北省-武汉市', '\0', '2023-10-15 08:27:13', '2023-10-15 08:27:13');
INSERT INTO `wd_sys_login_log` VALUES ('302', '41', 'test12', '1', '5', '0', '登录成功', '178.157.61.20', '-', '\0', '2023-10-15 11:12:21', '2023-10-15 11:12:21');
INSERT INTO `wd_sys_login_log` VALUES ('303', '41', 'test12', '1', '5', '0', '登录成功', '203.160.86.156', '香港-', '\0', '2023-10-15 18:55:54', '2023-10-15 18:55:54');
INSERT INTO `wd_sys_login_log` VALUES ('304', '41', 'test12', '1', '5', '0', '登录成功', '183.206.7.215', '江苏省-南京市', '\0', '2023-10-15 19:13:07', '2023-10-15 19:13:07');
INSERT INTO `wd_sys_login_log` VALUES ('305', '41', 'test12', '1', '5', '0', '登录成功', '91.196.70.27', '-', '\0', '2023-10-15 19:52:39', '2023-10-15 19:52:39');
INSERT INTO `wd_sys_login_log` VALUES ('306', '41', 'test12', '1', '5', '0', '登录成功', '171.34.218.5', '江西省-南昌市', '\0', '2023-10-15 21:20:17', '2023-10-15 21:20:17');
INSERT INTO `wd_sys_login_log` VALUES ('307', '41', 'test12', '1', '5', '0', '登录成功', '112.96.115.131', '广东省-广州市', '\0', '2023-10-16 00:22:19', '2023-10-16 00:22:19');
INSERT INTO `wd_sys_login_log` VALUES ('308', '41', 'test12', '1', '5', '0', '登录成功', '110.81.188.127', null, '\0', '2023-10-16 03:56:13', '2023-10-16 03:56:13');
INSERT INTO `wd_sys_login_log` VALUES ('309', '41', 'test12', '1', '5', '0', '登录成功', '120.216.251.155', '河南省-平顶山市', '\0', '2023-10-16 11:04:53', '2023-10-16 11:04:53');
INSERT INTO `wd_sys_login_log` VALUES ('310', '41', 'test12', '1', '5', '0', '登录成功', '219.146.150.238', '山东省-淄博市', '\0', '2023-10-16 12:28:05', '2023-10-16 12:28:05');
INSERT INTO `wd_sys_login_log` VALUES ('311', '41', 'test12', '1', '5', '0', '登录成功', '60.216.89.186', null, '\0', '2023-10-16 14:06:07', '2023-10-16 14:06:07');
INSERT INTO `wd_sys_login_log` VALUES ('312', '41', 'test12', '1', '5', '0', '登录成功', '111.206.214.42', '北京市-北京市', '\0', '2023-10-16 17:40:09', '2023-10-16 17:40:09');
INSERT INTO `wd_sys_login_log` VALUES ('313', '41', 'test12', '1', '5', '0', '登录成功', '23.247.137.92', '-', '\0', '2023-10-16 18:38:25', '2023-10-16 18:38:25');
INSERT INTO `wd_sys_login_log` VALUES ('314', '41', 'test12', '1', '5', '0', '登录成功', '114.254.0.227', '北京市-北京市', '\0', '2023-10-16 20:47:01', '2023-10-16 20:47:01');
INSERT INTO `wd_sys_login_log` VALUES ('315', '41', 'test12', '1', '5', '0', '登录成功', '114.254.0.227', '北京市-北京市', '\0', '2023-10-16 20:47:22', '2023-10-16 20:47:22');
INSERT INTO `wd_sys_login_log` VALUES ('316', '41', 'test12', '1', '5', '0', '登录成功', '36.40.182.115', '陕西省-延安市', '\0', '2023-10-16 21:53:08', '2023-10-16 21:53:08');
INSERT INTO `wd_sys_login_log` VALUES ('317', '41', 'test12', '1', '5', '0', '登录成功', '14.145.30.226', '广东省-广州市', '\0', '2023-10-17 07:39:23', '2023-10-17 07:39:23');
INSERT INTO `wd_sys_login_log` VALUES ('318', '41', 'test12', '1', '5', '0', '登录成功', '60.210.72.54', '山东省-淄博市', '\0', '2023-10-17 10:08:38', '2023-10-17 10:08:38');
INSERT INTO `wd_sys_login_log` VALUES ('319', '41', 'test12', '1', '5', '0', '登录成功', '219.141.235.66', '北京市-北京市', '\0', '2023-10-17 17:16:53', '2023-10-17 17:16:53');
INSERT INTO `wd_sys_login_log` VALUES ('320', '41', 'test12', '1', '5', '0', '登录成功', '223.73.236.105', '广东省-珠海市', '\0', '2023-10-17 21:00:34', '2023-10-17 21:00:34');
INSERT INTO `wd_sys_login_log` VALUES ('321', '41', 'test12', '1', '5', '0', '登录成功', '14.111.57.101', '重庆市-重庆市', '\0', '2023-10-18 00:30:09', '2023-10-18 00:30:09');
INSERT INTO `wd_sys_login_log` VALUES ('322', '41', 'test12', '1', '5', '0', '登录成功', '27.17.253.192', '湖北省-武汉市', '\0', '2023-10-18 03:40:56', '2023-10-18 03:40:56');
INSERT INTO `wd_sys_login_log` VALUES ('323', '41', 'test12', '1', '5', '0', '登录成功', '27.38.238.3', '广东省-深圳市', '\0', '2023-10-18 03:57:39', '2023-10-18 03:57:39');
INSERT INTO `wd_sys_login_log` VALUES ('324', '41', 'test12', '1', '5', '0', '登录成功', '103.88.46.121', '-', '\0', '2023-10-18 10:16:07', '2023-10-18 10:16:07');
INSERT INTO `wd_sys_login_log` VALUES ('325', '41', 'test12', '1', '5', '0', '登录成功', '183.253.21.73', '福建省-厦门市', '\0', '2023-10-18 14:07:32', '2023-10-18 14:07:32');
INSERT INTO `wd_sys_login_log` VALUES ('326', '41', 'test12', '1', '5', '0', '登录成功', '220.249.88.237', '湖北省-武汉市', '\0', '2023-10-18 15:36:51', '2023-10-18 15:36:51');
INSERT INTO `wd_sys_login_log` VALUES ('327', '41', 'test12', '1', '5', '0', '登录成功', '180.162.105.76', '上海市-上海市', '\0', '2023-10-18 21:26:16', '2023-10-18 21:26:16');
INSERT INTO `wd_sys_login_log` VALUES ('328', '41', 'test12', '1', '5', '0', '登录成功', '119.137.52.241', '广东省-深圳市', '\0', '2023-10-19 10:50:55', '2023-10-19 10:50:55');
INSERT INTO `wd_sys_login_log` VALUES ('329', '41', 'test12', '1', '5', '0', '登录成功', '116.24.72.243', '广东省-深圳市', '\0', '2023-10-19 16:54:37', '2023-10-19 16:54:37');
INSERT INTO `wd_sys_login_log` VALUES ('330', '41', 'test12', '1', '5', '0', '登录成功', '27.19.2.188', '湖北省-武汉市', '\0', '2023-10-19 23:03:02', '2023-10-19 23:03:02');
INSERT INTO `wd_sys_login_log` VALUES ('331', '41', 'test12', '1', '5', '0', '登录成功', '14.112.32.228', '广东省-惠州市', '\0', '2023-10-20 10:34:25', '2023-10-20 10:34:25');
INSERT INTO `wd_sys_login_log` VALUES ('332', '41', 'test12', '1', '5', '0', '登录成功', '171.212.240.252', '四川省-成都市', '\0', '2023-10-20 15:57:45', '2023-10-20 15:57:45');
INSERT INTO `wd_sys_login_log` VALUES ('333', '41', 'test12', '1', '5', '0', '登录成功', '175.10.220.87', '湖南省-长沙市', '\0', '2023-10-20 16:47:11', '2023-10-20 16:47:11');
INSERT INTO `wd_sys_login_log` VALUES ('334', '41', 'test12', '1', '5', '0', '登录成功', '14.117.195.116', '广东省-江门市', '\0', '2023-10-21 10:55:22', '2023-10-21 10:55:22');
INSERT INTO `wd_sys_login_log` VALUES ('335', '41', 'test12', '1', '5', '0', '登录成功', '211.162.5.26', '安徽省-合肥市', '\0', '2023-10-21 20:14:26', '2023-10-21 20:14:26');
INSERT INTO `wd_sys_login_log` VALUES ('336', '41', 'test12', '1', '5', '0', '登录成功', '123.180.43.157', '河北省-邢台市', '\0', '2023-10-22 02:48:24', '2023-10-22 02:48:24');
INSERT INTO `wd_sys_login_log` VALUES ('337', '41', 'test12', '1', '5', '0', '登录成功', '211.97.126.254', '福建省-福州市', '\0', '2023-10-22 08:10:12', '2023-10-22 08:10:12');
INSERT INTO `wd_sys_login_log` VALUES ('338', '41', 'test12', '1', '5', '0', '登录成功', '111.183.22.87', '湖北省-黄冈市', '\0', '2023-10-22 11:18:52', '2023-10-22 11:18:52');
INSERT INTO `wd_sys_login_log` VALUES ('339', '41', 'test12', '1', '5', '0', '登录成功', '60.211.120.12', '山东省-德州市', '\0', '2023-10-22 21:39:44', '2023-10-22 21:39:44');
INSERT INTO `wd_sys_login_log` VALUES ('340', '41', 'test12', '1', '5', '0', '登录成功', '117.188.23.162', '贵州省-贵阳市', '\0', '2023-10-22 23:38:36', '2023-10-22 23:38:36');
INSERT INTO `wd_sys_login_log` VALUES ('341', '41', 'test12', '1', '5', '0', '登录成功', '117.188.23.162', '贵州省-贵阳市', '\0', '2023-10-22 23:39:24', '2023-10-22 23:39:24');
INSERT INTO `wd_sys_login_log` VALUES ('342', '41', 'test12', '1', '5', '0', '登录成功', '203.93.209.5', '湖南省-株洲市', '\0', '2023-10-23 10:22:44', '2023-10-23 10:22:44');
INSERT INTO `wd_sys_login_log` VALUES ('343', '41', 'test12', '1', '5', '0', '登录成功', '171.83.46.42', '湖北省-武汉市', '\0', '2023-10-23 11:12:48', '2023-10-23 11:12:48');
INSERT INTO `wd_sys_login_log` VALUES ('344', '41', 'test12', '1', '5', '0', '登录成功', '36.112.3.146', '北京市-北京市', '\0', '2023-10-23 15:30:18', '2023-10-23 15:30:18');
INSERT INTO `wd_sys_login_log` VALUES ('345', '41', 'test12', '1', '5', '0', '登录成功', '182.119.36.27', '河南省-郑州市', '\0', '2023-10-23 16:01:48', '2023-10-23 16:01:48');
INSERT INTO `wd_sys_login_log` VALUES ('346', '41', 'test12', '1', '5', '0', '登录成功', '117.162.228.175', '江西省-萍乡市', '\0', '2023-10-23 17:18:39', '2023-10-23 17:18:39');
INSERT INTO `wd_sys_login_log` VALUES ('347', '41', 'test12', '1', '5', '0', '登录成功', '106.88.204.50', '重庆市-重庆市', '\0', '2023-10-23 23:28:45', '2023-10-23 23:28:45');
INSERT INTO `wd_sys_login_log` VALUES ('348', '41', 'test12', '1', '5', '0', '登录成功', '111.18.219.174', '陕西省-', '\0', '2023-10-24 13:00:40', '2023-10-24 13:00:40');
INSERT INTO `wd_sys_login_log` VALUES ('349', '41', 'test12', '1', '5', '0', '登录成功', '116.249.84.106', '云南省-昆明市', '\0', '2023-10-24 14:38:48', '2023-10-24 14:38:48');
INSERT INTO `wd_sys_login_log` VALUES ('350', '41', 'test12', '1', '5', '0', '登录成功', '116.249.84.106', '云南省-昆明市', '\0', '2023-10-24 14:38:55', '2023-10-24 14:38:55');
INSERT INTO `wd_sys_login_log` VALUES ('351', '41', 'test12', '1', '5', '0', '登录成功', '1.202.124.165', '北京市-北京市', '\0', '2023-10-24 14:55:28', '2023-10-24 14:55:28');
INSERT INTO `wd_sys_login_log` VALUES ('352', '41', 'test12', '1', '5', '0', '登录成功', '113.89.34.201', '广东省-深圳市', '\0', '2023-10-24 16:46:07', '2023-10-24 16:46:07');
INSERT INTO `wd_sys_login_log` VALUES ('353', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '113.91.249.5', '广东省-深圳市', '\0', '2023-10-24 18:03:26', '2023-10-24 18:03:26');
INSERT INTO `wd_sys_login_log` VALUES ('354', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '113.91.249.5', '广东省-深圳市', '\0', '2023-10-24 18:19:59', '2023-10-24 18:19:59');
INSERT INTO `wd_sys_login_log` VALUES ('355', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '广东省-东莞市', '\0', '2023-10-24 18:21:10', '2023-10-24 18:21:10');
INSERT INTO `wd_sys_login_log` VALUES ('356', '41', 'test12', '1', '5', '0', '登录成功', '60.4.9.187', '河北省-保定市', '\0', '2023-10-24 18:47:00', '2023-10-24 18:47:00');
INSERT INTO `wd_sys_login_log` VALUES ('357', '41', 'test12', '1', '5', '0', '登录成功', '112.48.57.250', '福建省-厦门市', '\0', '2023-10-24 20:23:00', '2023-10-24 20:23:00');
INSERT INTO `wd_sys_login_log` VALUES ('358', '41', 'test12', '1', '5', '0', '登录成功', '39.144.29.107', '河南省-郑州市', '\0', '2023-10-25 17:12:35', '2023-10-25 17:12:35');
INSERT INTO `wd_sys_login_log` VALUES ('359', '41', 'test12', '1', '5', '0', '登录成功', '115.227.112.141', '浙江省-杭州市', '\0', '2023-10-25 17:45:21', '2023-10-25 17:45:21');
INSERT INTO `wd_sys_login_log` VALUES ('360', '41', 'test12', '1', '5', '0', '登录成功', '182.99.241.21', '江西省-萍乡市', '\0', '2023-10-25 19:17:13', '2023-10-25 19:17:13');
INSERT INTO `wd_sys_login_log` VALUES ('361', '41', 'test12', '1', '5', '0', '登录成功', '171.111.225.11', '广西-南宁市', '\0', '2023-10-26 02:30:23', '2023-10-26 02:30:23');
INSERT INTO `wd_sys_login_log` VALUES ('362', '41', 'test12', '1', '5', '0', '登录成功', '115.227.112.141', '浙江省-杭州市', '\0', '2023-10-26 13:03:52', '2023-10-26 13:03:52');
INSERT INTO `wd_sys_login_log` VALUES ('363', '41', 'test12', '1', '5', '0', '登录成功', '115.227.112.141', '浙江省-杭州市', '\0', '2023-10-26 13:04:35', '2023-10-26 13:04:35');
INSERT INTO `wd_sys_login_log` VALUES ('364', '41', 'test12', '1', '5', '0', '登录成功', '203.198.87.154', '香港-', '\0', '2023-10-26 13:06:23', '2023-10-26 13:06:23');
INSERT INTO `wd_sys_login_log` VALUES ('365', '41', 'test12', '1', '5', '0', '登录成功', '124.90.53.207', '浙江省-杭州市', '\0', '2023-10-27 16:16:48', '2023-10-27 16:16:48');
INSERT INTO `wd_sys_login_log` VALUES ('366', '41', 'test12', '1', '5', '0', '登录成功', '103.88.46.28', '-', '\0', '2023-10-27 20:46:21', '2023-10-27 20:46:21');
INSERT INTO `wd_sys_login_log` VALUES ('367', '41', 'test12', '1', '5', '0', '登录成功', '119.143.65.213', '广东省-广州市', '\0', '2023-10-27 21:55:24', '2023-10-27 21:55:24');
INSERT INTO `wd_sys_login_log` VALUES ('368', '41', 'test12', '1', '5', '0', '登录成功', '39.186.176.73', '浙江省-金华市', '\0', '2023-10-27 22:06:21', '2023-10-27 22:06:21');
INSERT INTO `wd_sys_login_log` VALUES ('369', '41', 'test12', '1', '5', '0', '登录成功', '39.186.176.73', '浙江省-金华市', '\0', '2023-10-27 22:39:52', '2023-10-27 22:39:52');
INSERT INTO `wd_sys_login_log` VALUES ('370', '41', 'test12', '1', '5', '0', '登录成功', '123.138.70.212', '陕西省-西安市', '\0', '2023-10-28 01:25:28', '2023-10-28 01:25:28');
INSERT INTO `wd_sys_login_log` VALUES ('371', '41', 'test12', '1', '5', '0', '登录成功', '36.27.17.208', '浙江省-杭州市', '\0', '2023-10-28 22:14:44', '2023-10-28 22:14:44');
INSERT INTO `wd_sys_login_log` VALUES ('372', '41', 'test12', '1', '5', '0', '登录成功', '183.32.138.15', '广东省-中山市', '\0', '2023-10-28 23:08:26', '2023-10-28 23:08:26');
INSERT INTO `wd_sys_login_log` VALUES ('373', '41', 'test12', '1', '5', '0', '登录成功', '58.62.252.217', '广东省-广州市', '\0', '2023-10-29 08:11:28', '2023-10-29 08:11:28');
INSERT INTO `wd_sys_login_log` VALUES ('374', '41', 'test12', '1', '5', '0', '登录成功', '183.32.138.15', '广东省-中山市', '\0', '2023-10-29 12:59:58', '2023-10-29 12:59:58');
INSERT INTO `wd_sys_login_log` VALUES ('375', '41', 'test12', '1', '5', '0', '登录成功', '117.129.7.52', '北京市-北京市', '\0', '2023-10-29 19:24:22', '2023-10-29 19:24:22');
INSERT INTO `wd_sys_login_log` VALUES ('376', '41', 'test12', '1', '5', '0', '登录成功', '183.251.120.100', '福建省-龙岩市', '\0', '2023-10-30 17:15:39', '2023-10-30 17:15:39');
INSERT INTO `wd_sys_login_log` VALUES ('377', '41', 'test12', '1', '5', '0', '登录成功', '223.76.196.77', '湖北省-黄石市', '\0', '2023-10-31 13:51:33', '2023-10-31 13:51:33');
INSERT INTO `wd_sys_login_log` VALUES ('378', '41', 'test12', '1', '5', '0', '登录成功', '221.232.141.114', '湖北省-武汉市', '\0', '2023-10-31 16:23:47', '2023-10-31 16:23:47');
INSERT INTO `wd_sys_login_log` VALUES ('379', '41', 'test12', '1', '5', '0', '登录成功', '114.249.118.7', '北京市-北京市', '\0', '2023-10-31 18:54:40', '2023-10-31 18:54:40');
INSERT INTO `wd_sys_login_log` VALUES ('380', '41', 'test12', '1', '5', '0', '登录成功', '223.160.119.34', '北京市-北京市', '\0', '2023-10-31 21:19:24', '2023-10-31 21:19:24');
INSERT INTO `wd_sys_login_log` VALUES ('381', '41', 'test12', '1', '5', '0', '登录成功', '120.231.190.32', '广东省-江门市', '\0', '2023-11-01 01:03:29', '2023-11-01 01:03:29');
INSERT INTO `wd_sys_login_log` VALUES ('382', '41', 'test12', '1', '5', '0', '登录成功', '36.112.3.146', '北京市-北京市', '\0', '2023-11-01 09:15:56', '2023-11-01 09:15:56');
INSERT INTO `wd_sys_login_log` VALUES ('383', '41', 'test12', '1', '5', '0', '登录成功', '117.36.118.100', '陕西省-西安市', '\0', '2023-11-01 09:24:36', '2023-11-01 09:24:36');
INSERT INTO `wd_sys_login_log` VALUES ('384', '41', 'test12', '1', '5', '0', '登录成功', '45.91.81.122', '-', '\0', '2023-11-01 12:55:48', '2023-11-01 12:55:48');
INSERT INTO `wd_sys_login_log` VALUES ('385', '41', 'test12', '1', '5', '0', '登录成功', '124.79.20.142', '上海市-上海市', '\0', '2023-11-01 16:07:29', '2023-11-01 16:07:29');
INSERT INTO `wd_sys_login_log` VALUES ('386', '41', 'test12', '1', '5', '0', '登录成功', '222.91.150.25', '陕西省-西安市', '\0', '2023-11-01 19:14:01', '2023-11-01 19:14:01');
INSERT INTO `wd_sys_login_log` VALUES ('387', '41', 'test12', '1', '5', '0', '登录成功', '61.164.44.227', '浙江省-杭州市', '\0', '2023-11-02 09:51:30', '2023-11-02 09:51:30');
INSERT INTO `wd_sys_login_log` VALUES ('388', '41', 'test12', '1', '5', '0', '登录成功', '61.166.219.52', '云南省-昆明市', '\0', '2023-11-02 17:41:04', '2023-11-02 17:41:04');
INSERT INTO `wd_sys_login_log` VALUES ('389', '41', 'test12', '1', '5', '0', '登录成功', '36.44.140.211', '陕西省-西安市', '\0', '2023-11-02 22:18:52', '2023-11-02 22:18:52');
INSERT INTO `wd_sys_login_log` VALUES ('390', '41', 'test12', '1', '5', '0', '登录成功', '115.227.106.237', '浙江省-杭州市', '\0', '2023-11-06 09:19:56', '2023-11-06 09:19:56');
INSERT INTO `wd_sys_login_log` VALUES ('391', '41', 'test12', '1', '5', '0', '登录成功', '58.246.135.156', '上海市-上海市', '\0', '2023-11-06 11:57:00', '2023-11-06 11:57:00');
INSERT INTO `wd_sys_login_log` VALUES ('392', '41', 'test12', '1', '5', '0', '登录成功', '125.80.209.181', '重庆市-重庆市', '\0', '2023-11-06 17:37:57', '2023-11-06 17:37:57');
INSERT INTO `wd_sys_login_log` VALUES ('393', '41', 'test12', '1', '5', '0', '登录成功', '111.27.26.178', '吉林省-长春市', '\0', '2023-11-06 19:24:44', '2023-11-06 19:24:44');
INSERT INTO `wd_sys_login_log` VALUES ('394', '41', 'test12', '1', '5', '0', '登录成功', '111.27.26.178', '吉林省-长春市', '\0', '2023-11-06 19:26:37', '2023-11-06 19:26:37');
INSERT INTO `wd_sys_login_log` VALUES ('395', '41', 'test12', '1', '5', '0', '登录成功', '222.90.139.47', '陕西省-西安市', '\0', '2023-11-07 08:14:00', '2023-11-07 08:14:00');
INSERT INTO `wd_sys_login_log` VALUES ('396', '41', 'test12', '1', '5', '0', '登录成功', '111.122.177.222', '贵州省-黔南州', '\0', '2023-11-07 10:39:25', '2023-11-07 10:39:25');
INSERT INTO `wd_sys_login_log` VALUES ('397', '41', 'test12', '1', '5', '0', '登录成功', '182.150.28.130', '四川省-成都市', '\0', '2023-11-07 13:41:29', '2023-11-07 13:41:29');
INSERT INTO `wd_sys_login_log` VALUES ('398', '41', 'test12', '1', '5', '0', '登录成功', '116.4.40.151', '广东省-东莞市', '\0', '2023-11-07 18:30:07', '2023-11-07 18:30:07');
INSERT INTO `wd_sys_login_log` VALUES ('399', '41', 'test12', '1', '5', '0', '登录成功', '182.131.98.253', '四川省-广安市', '\0', '2023-11-07 19:27:42', '2023-11-07 19:27:42');
INSERT INTO `wd_sys_login_log` VALUES ('400', '41', 'test12', '1', '5', '0', '登录成功', '223.66.2.55', '江苏省-常州市', '\0', '2023-11-07 20:10:31', '2023-11-07 20:10:31');
INSERT INTO `wd_sys_login_log` VALUES ('401', '41', 'test12', '1', '5', '0', '登录成功', '117.136.63.165', '四川省-成都市', '\0', '2023-11-08 00:16:20', '2023-11-08 00:16:20');
INSERT INTO `wd_sys_login_log` VALUES ('402', '41', 'test12', '1', '5', '0', '登录成功', '59.44.43.190', '辽宁省-沈阳市', '\0', '2023-11-08 10:42:01', '2023-11-08 10:42:01');
INSERT INTO `wd_sys_login_log` VALUES ('403', '41', 'test12', '1', '5', '0', '登录成功', '106.224.55.137', '江西省-南昌市', '\0', '2023-11-08 16:57:23', '2023-11-08 16:57:23');
INSERT INTO `wd_sys_login_log` VALUES ('404', '41', 'test12', '1', '5', '0', '登录成功', '120.196.183.121', '广东省-佛山市', '\0', '2023-11-08 17:24:38', '2023-11-08 17:24:38');
INSERT INTO `wd_sys_login_log` VALUES ('405', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '113.78.242.1', '广东省-东莞市', '\0', '2023-11-08 23:07:27', '2023-11-08 23:07:27');
INSERT INTO `wd_sys_login_log` VALUES ('406', '41', 'test12', '1', '5', '0', '登录成功', '36.159.242.177', '安徽省-', '\0', '2023-11-09 01:19:38', '2023-11-09 01:19:38');
INSERT INTO `wd_sys_login_log` VALUES ('407', '41', 'test12', '1', '5', '0', '登录成功', '121.9.248.82', '广东省-佛山市', '\0', '2023-11-09 15:29:01', '2023-11-09 15:29:01');
INSERT INTO `wd_sys_login_log` VALUES ('408', '41', 'test12', '1', '5', '0', '登录成功', '220.180.227.111', '安徽省-合肥市', '\0', '2023-11-09 15:36:31', '2023-11-09 15:36:31');
INSERT INTO `wd_sys_login_log` VALUES ('409', '41', 'test12', '1', '5', '0', '登录成功', '58.34.20.154', '上海市-上海市', '\0', '2023-11-09 16:33:00', '2023-11-09 16:33:00');
INSERT INTO `wd_sys_login_log` VALUES ('410', '41', 'test12', '1', '5', '0', '登录成功', '116.149.81.72', '安徽省-', '\0', '2023-11-09 17:26:25', '2023-11-09 17:26:25');
INSERT INTO `wd_sys_login_log` VALUES ('411', '41', 'test12', '1', '5', '0', '登录成功', '116.20.197.43', '广东省-佛山市', '\0', '2023-11-09 18:05:56', '2023-11-09 18:05:56');
INSERT INTO `wd_sys_login_log` VALUES ('412', '41', 'test12', '1', '5', '0', '登录成功', '171.214.154.32', '四川省-成都市', '\0', '2023-11-09 18:40:43', '2023-11-09 18:40:43');
INSERT INTO `wd_sys_login_log` VALUES ('413', '41', 'test12', '1', '5', '0', '登录成功', '14.153.109.67', '广东省-深圳市', '\0', '2023-11-09 21:36:49', '2023-11-09 21:36:49');
INSERT INTO `wd_sys_login_log` VALUES ('414', '41', 'test12', '1', '5', '0', '登录成功', '121.15.211.212', '广东省-深圳市', '\0', '2023-11-10 16:08:25', '2023-11-10 16:08:25');
INSERT INTO `wd_sys_login_log` VALUES ('415', '41', 'test12', '1', '5', '0', '登录成功', '31.223.184.46', '-', '\0', '2023-11-11 10:24:04', '2023-11-11 10:24:04');
INSERT INTO `wd_sys_login_log` VALUES ('416', '41', 'test12', '1', '5', '0', '登录成功', '120.231.190.46', '广东省-江门市', '\0', '2023-11-11 16:29:05', '2023-11-11 16:29:05');
INSERT INTO `wd_sys_login_log` VALUES ('417', '41', 'test12', '1', '5', '0', '登录成功', '89.117.67.239', '-', '\0', '2023-11-11 16:52:36', '2023-11-11 16:52:36');
INSERT INTO `wd_sys_login_log` VALUES ('418', '41', 'test12', '1', '5', '0', '登录成功', '39.185.209.234', '浙江省-宁波市', '\0', '2023-11-11 18:58:44', '2023-11-11 18:58:44');
INSERT INTO `wd_sys_login_log` VALUES ('419', '41', 'test12', '1', '5', '0', '登录成功', '52.192.41.244', '-', '\0', '2023-11-11 19:48:07', '2023-11-11 19:48:07');
INSERT INTO `wd_sys_login_log` VALUES ('420', '41', 'test12', '1', '5', '0', '登录成功', '119.123.203.181', '广东省-深圳市', '\0', '2023-11-12 00:03:28', '2023-11-12 00:03:28');
INSERT INTO `wd_sys_login_log` VALUES ('421', '41', 'test12', '1', '5', '0', '登录成功', '113.250.130.248', '重庆市-重庆市', '\0', '2023-11-12 18:35:41', '2023-11-12 18:35:41');
INSERT INTO `wd_sys_login_log` VALUES ('422', '41', 'test12', '1', '5', '0', '登录成功', '113.250.130.248', '重庆市-重庆市', '\0', '2023-11-12 18:35:51', '2023-11-12 18:35:51');
INSERT INTO `wd_sys_login_log` VALUES ('423', '41', 'test12', '1', '5', '0', '登录成功', '120.36.168.128', '福建省-厦门市', '\0', '2023-11-12 22:18:07', '2023-11-12 22:18:07');
INSERT INTO `wd_sys_login_log` VALUES ('424', '41', 'test12', '1', '5', '0', '登录成功', '123.155.164.189', '浙江省-嘉兴市', '\0', '2023-11-13 03:37:16', '2023-11-13 03:37:16');
INSERT INTO `wd_sys_login_log` VALUES ('425', '41', 'test12', '1', '5', '0', '登录成功', '218.75.216.21', '湖南省-株洲市', '\0', '2023-11-13 08:35:16', '2023-11-13 08:35:16');
INSERT INTO `wd_sys_login_log` VALUES ('426', '41', 'test12', '1', '5', '0', '登录成功', '14.216.89.101', '广东省-东莞市', '\0', '2023-11-13 10:01:57', '2023-11-13 10:01:57');
INSERT INTO `wd_sys_login_log` VALUES ('427', '41', 'test12', '1', '5', '0', '登录成功', '119.130.170.166', '广东省-广州市', '\0', '2023-11-13 11:59:25', '2023-11-13 11:59:25');
INSERT INTO `wd_sys_login_log` VALUES ('428', '41', 'test12', '1', '5', '0', '登录成功', '101.87.106.26', '上海市-上海市', '\0', '2023-11-13 21:35:21', '2023-11-13 21:35:21');
INSERT INTO `wd_sys_login_log` VALUES ('429', '41', 'test12', '1', '5', '0', '登录成功', '118.114.60.91', '四川省-成都市', '\0', '2023-11-13 21:47:46', '2023-11-13 21:47:46');
INSERT INTO `wd_sys_login_log` VALUES ('430', '41', 'test12', '1', '5', '0', '登录成功', '221.15.136.141', '河南省-郑州市', '\0', '2023-11-13 22:26:46', '2023-11-13 22:26:46');
INSERT INTO `wd_sys_login_log` VALUES ('431', '41', 'test12', '1', '5', '0', '登录成功', '113.200.87.186', '陕西省-西安市', '\0', '2023-11-14 00:40:42', '2023-11-14 00:40:42');
INSERT INTO `wd_sys_login_log` VALUES ('432', '41', 'test12', '1', '5', '0', '登录成功', '60.4.9.65', '河北省-保定市', '\0', '2023-11-14 00:44:44', '2023-11-14 00:44:44');
INSERT INTO `wd_sys_login_log` VALUES ('433', '41', 'test12', '1', '5', '0', '登录成功', '114.223.91.215', '江苏省-无锡市', '\0', '2023-11-14 09:14:40', '2023-11-14 09:14:40');
INSERT INTO `wd_sys_login_log` VALUES ('434', '41', 'test12', '1', '5', '0', '登录成功', '113.116.146.78', '广东省-深圳市', '\0', '2023-11-14 10:30:09', '2023-11-14 10:30:09');
INSERT INTO `wd_sys_login_log` VALUES ('435', '41', 'test12', '1', '5', '0', '登录成功', '124.42.50.83', '北京市-北京市', '\0', '2023-11-14 10:50:22', '2023-11-14 10:50:22');
INSERT INTO `wd_sys_login_log` VALUES ('436', '41', 'test12', '1', '5', '0', '登录成功', '183.15.179.85', '广东省-深圳市', '\0', '2023-11-14 11:05:37', '2023-11-14 11:05:37');
INSERT INTO `wd_sys_login_log` VALUES ('437', '41', 'test12', '1', '5', '0', '登录成功', '182.148.57.79', '四川省-成都市', '\0', '2023-11-14 13:00:38', '2023-11-14 13:00:38');
INSERT INTO `wd_sys_login_log` VALUES ('438', '41', 'test12', '1', '5', '0', '登录成功', '183.67.58.250', '重庆市-重庆市', '\0', '2023-11-14 15:42:04', '2023-11-14 15:42:04');
INSERT INTO `wd_sys_login_log` VALUES ('439', '41', 'test12', '1', '5', '0', '登录成功', '47.96.236.37', '浙江省-杭州市', '\0', '2023-11-14 17:54:41', '2023-11-14 17:54:41');
INSERT INTO `wd_sys_login_log` VALUES ('440', '41', 'test12', '1', '5', '0', '登录成功', '120.230.94.78', '广东省-广州市', '\0', '2023-11-14 20:02:38', '2023-11-14 20:02:38');
INSERT INTO `wd_sys_login_log` VALUES ('441', '41', 'test12', '1', '5', '0', '登录成功', '113.201.248.70', '陕西省-西安市', '\0', '2023-11-14 23:35:26', '2023-11-14 23:35:26');
INSERT INTO `wd_sys_login_log` VALUES ('442', '41', 'test12', '1', '5', '0', '登录成功', '124.236.176.252', '河北省-石家庄市', '\0', '2023-11-15 09:15:39', '2023-11-15 09:15:39');
INSERT INTO `wd_sys_login_log` VALUES ('443', '41', 'test12', '1', '5', '0', '登录成功', '140.205.11.78', '浙江省-杭州市', '\0', '2023-11-15 11:00:18', '2023-11-15 11:00:18');
INSERT INTO `wd_sys_login_log` VALUES ('444', '41', 'test12', '1', '5', '0', '登录成功', '140.205.11.68', '浙江省-杭州市', '\0', '2023-11-15 11:02:09', '2023-11-15 11:02:09');
INSERT INTO `wd_sys_login_log` VALUES ('445', '41', 'test12', '1', '5', '0', '登录成功', '5.104.80.190', '-', '\0', '2023-11-15 13:46:50', '2023-11-15 13:46:50');
INSERT INTO `wd_sys_login_log` VALUES ('446', '41', 'test12', '1', '5', '0', '登录成功', '5.104.80.190', '-', '\0', '2023-11-15 13:46:59', '2023-11-15 13:46:59');
INSERT INTO `wd_sys_login_log` VALUES ('447', '41', 'test12', '1', '5', '0', '登录成功', '219.145.116.56', '陕西省-咸阳市', '\0', '2023-11-15 15:12:43', '2023-11-15 15:12:43');
INSERT INTO `wd_sys_login_log` VALUES ('448', '41', 'test12', '1', '5', '0', '登录成功', '113.57.237.85', '湖北省-武汉市', '\0', '2023-11-15 15:27:31', '2023-11-15 15:27:31');
INSERT INTO `wd_sys_login_log` VALUES ('449', '41', 'test12', '1', '5', '0', '登录成功', '162.251.63.198', '-', '\0', '2023-11-15 15:58:02', '2023-11-15 15:58:02');
INSERT INTO `wd_sys_login_log` VALUES ('450', '41', 'test12', '1', '5', '0', '登录成功', '58.212.119.123', '江苏省-南京市', '\0', '2023-11-15 16:49:48', '2023-11-15 16:49:48');
INSERT INTO `wd_sys_login_log` VALUES ('451', '41', 'test12', '1', '5', '0', '登录成功', '171.212.50.172', '四川省-达州市', '\0', '2023-11-15 18:03:22', '2023-11-15 18:03:22');
INSERT INTO `wd_sys_login_log` VALUES ('452', '41', 'test12', '1', '5', '0', '登录成功', '111.197.244.176', '北京市-北京市', '\0', '2023-11-15 18:58:49', '2023-11-15 18:58:49');
INSERT INTO `wd_sys_login_log` VALUES ('453', '41', 'test12', '1', '5', '0', '登录成功', '36.5.153.20', '安徽省-合肥市', '\0', '2023-11-15 18:59:18', '2023-11-15 18:59:18');
INSERT INTO `wd_sys_login_log` VALUES ('454', '41', 'test12', '1', '5', '0', '登录成功', '120.85.112.155', '广东省-广州市', '\0', '2023-11-16 01:04:33', '2023-11-16 01:04:33');
INSERT INTO `wd_sys_login_log` VALUES ('455', '41', 'test12', '1', '5', '0', '登录成功', '119.130.242.120', '广东省-广州市', '\0', '2023-11-16 10:54:53', '2023-11-16 10:54:53');
INSERT INTO `wd_sys_login_log` VALUES ('456', '41', 'test12', '1', '5', '0', '登录成功', '124.128.12.46', '山东省-济南市', '\0', '2023-11-16 11:14:59', '2023-11-16 11:14:59');
INSERT INTO `wd_sys_login_log` VALUES ('457', '41', 'test12', '1', '5', '0', '登录成功', '111.75.202.206', '江西省-南昌市', '\0', '2023-11-16 11:42:35', '2023-11-16 11:42:35');
INSERT INTO `wd_sys_login_log` VALUES ('458', '41', 'test12', '1', '5', '0', '登录成功', '218.25.33.241', '辽宁省-沈阳市', '\0', '2023-11-16 14:37:10', '2023-11-16 14:37:10');
INSERT INTO `wd_sys_login_log` VALUES ('459', '41', 'test12', '1', '5', '0', '登录成功', '111.30.250.229', '天津市-天津市', '\0', '2023-11-16 15:35:55', '2023-11-16 15:35:55');
INSERT INTO `wd_sys_login_log` VALUES ('460', '41', 'test12', '1', '5', '0', '登录成功', '202.100.34.5', '陕西省-西安市', '\0', '2023-11-16 18:41:24', '2023-11-16 18:41:24');
INSERT INTO `wd_sys_login_log` VALUES ('461', '41', 'test12', '1', '5', '0', '登录成功', '106.61.188.13', '云南省-昆明市', '\0', '2023-11-16 21:02:33', '2023-11-16 21:02:33');
INSERT INTO `wd_sys_login_log` VALUES ('462', '41', 'test12', '1', '5', '0', '登录成功', '218.68.102.166', '天津市-天津市', '\0', '2023-11-16 23:17:07', '2023-11-16 23:17:07');
INSERT INTO `wd_sys_login_log` VALUES ('463', '41', 'test12', '1', '5', '0', '登录成功', '113.140.6.198', null, '\0', '2023-11-17 11:59:17', '2023-11-17 11:59:17');
INSERT INTO `wd_sys_login_log` VALUES ('464', '41', 'test12', '1', '5', '0', '登录成功', '223.104.27.110', '甘肃省-兰州市', '\0', '2023-11-17 12:29:23', '2023-11-17 12:29:23');
INSERT INTO `wd_sys_login_log` VALUES ('465', '41', 'test12', '1', '5', '0', '登录成功', '115.216.105.244', '浙江省-杭州市', '\0', '2023-11-17 13:41:43', '2023-11-17 13:41:43');
INSERT INTO `wd_sys_login_log` VALUES ('466', '41', 'test12', '1', '5', '0', '登录成功', '46.3.242.198', '台湾省-', '\0', '2023-11-18 13:15:23', '2023-11-18 13:15:23');
INSERT INTO `wd_sys_login_log` VALUES ('467', '41', 'test12', '1', '5', '0', '登录成功', '46.3.242.198', '台湾省-', '\0', '2023-11-18 13:15:32', '2023-11-18 13:15:32');
INSERT INTO `wd_sys_login_log` VALUES ('468', '41', 'test12', '1', '5', '0', '登录成功', '154.89.13.20', '香港-', '\0', '2023-11-18 18:38:45', '2023-11-18 18:38:45');
INSERT INTO `wd_sys_login_log` VALUES ('469', '41', 'test12', '1', '5', '0', '登录成功', '115.146.227.172', '-', '\0', '2023-11-18 19:10:05', '2023-11-18 19:10:05');
INSERT INTO `wd_sys_login_log` VALUES ('470', '41', 'test12', '1', '5', '0', '登录成功', '115.146.227.172', '-', '\0', '2023-11-18 19:10:18', '2023-11-18 19:10:18');
INSERT INTO `wd_sys_login_log` VALUES ('471', '41', 'test12', '1', '5', '0', '登录成功', '117.84.219.15', '江苏省-无锡市', '\0', '2023-11-18 20:33:41', '2023-11-18 20:33:41');
INSERT INTO `wd_sys_login_log` VALUES ('472', '41', 'test12', '1', '5', '0', '登录成功', '171.83.45.220', '湖北省-武汉市', '\0', '2023-11-20 09:10:57', '2023-11-20 09:10:57');
INSERT INTO `wd_sys_login_log` VALUES ('473', '41', 'test12', '1', '5', '0', '登录成功', '39.144.13.208', '广东省-深圳市', '\0', '2023-11-20 10:54:57', '2023-11-20 10:54:57');
INSERT INTO `wd_sys_login_log` VALUES ('474', '41', 'test12', '1', '5', '0', '登录成功', '220.164.62.207', '云南省-曲靖市', '\0', '2023-11-20 11:14:14', '2023-11-20 11:14:14');
INSERT INTO `wd_sys_login_log` VALUES ('475', '41', 'test12', '1', '5', '0', '登录成功', '120.244.160.219', '北京市-北京市', '\0', '2023-11-20 16:46:10', '2023-11-20 16:46:10');
INSERT INTO `wd_sys_login_log` VALUES ('476', '41', 'test12', '1', '5', '0', '登录成功', '111.163.120.12', '天津市-天津市', '\0', '2023-11-21 09:15:54', '2023-11-21 09:15:54');
INSERT INTO `wd_sys_login_log` VALUES ('477', '41', 'test12', '1', '5', '0', '登录成功', '123.232.2.234', '山东省-济南市', '\0', '2023-11-21 10:23:46', '2023-11-21 10:23:46');
INSERT INTO `wd_sys_login_log` VALUES ('478', '41', 'test12', '1', '5', '0', '登录成功', '180.108.112.133', '江苏省-苏州市', '\0', '2023-11-21 11:55:03', '2023-11-21 11:55:03');
INSERT INTO `wd_sys_login_log` VALUES ('479', '41', 'test12', '1', '5', '0', '登录成功', '115.231.95.226', '浙江省-金华市', '\0', '2023-11-21 14:52:53', '2023-11-21 14:52:53');
INSERT INTO `wd_sys_login_log` VALUES ('480', '41', 'test12', '1', '5', '0', '登录成功', '115.196.128.234', '浙江省-杭州市', '\0', '2023-11-21 15:38:08', '2023-11-21 15:38:08');
INSERT INTO `wd_sys_login_log` VALUES ('481', '41', 'test12', '1', '5', '0', '登录成功', '115.196.128.234', '浙江省-杭州市', '\0', '2023-11-21 15:38:14', '2023-11-21 15:38:14');
INSERT INTO `wd_sys_login_log` VALUES ('482', '41', 'test12', '1', '5', '0', '登录成功', '223.104.164.191', '浙江省-湖州市', '\0', '2023-11-22 08:16:37', '2023-11-22 08:16:37');
INSERT INTO `wd_sys_login_log` VALUES ('483', '41', 'test12', '1', '5', '0', '登录成功', '175.42.2.37', '福建省-福州市', '\0', '2023-11-22 13:57:43', '2023-11-22 13:57:43');
INSERT INTO `wd_sys_login_log` VALUES ('484', '41', 'test12', '1', '5', '0', '登录成功', '121.32.150.230', '广东省-广州市', '\0', '2023-11-22 14:47:53', '2023-11-22 14:47:53');
INSERT INTO `wd_sys_login_log` VALUES ('485', '41', 'test12', '1', '5', '0', '登录成功', '218.66.91.195', '福建省-福州市', '\0', '2023-11-22 15:02:03', '2023-11-22 15:02:03');
INSERT INTO `wd_sys_login_log` VALUES ('486', '41', 'test12', '1', '5', '0', '登录成功', '117.144.58.62', '上海市-上海市', '\0', '2023-11-22 16:59:05', '2023-11-22 16:59:05');
INSERT INTO `wd_sys_login_log` VALUES ('487', '41', 'test12', '1', '5', '0', '登录成功', '120.225.100.67', '山东省-', '\0', '2023-11-22 21:24:01', '2023-11-22 21:24:01');
INSERT INTO `wd_sys_login_log` VALUES ('488', '41', 'test12', '1', '5', '0', '登录成功', '58.38.131.33', '上海市-上海市', '\0', '2023-11-22 23:25:53', '2023-11-22 23:25:53');
INSERT INTO `wd_sys_login_log` VALUES ('489', '41', 'test12', '1', '5', '0', '登录成功', '36.154.13.122', '江苏省-常州市', '\0', '2023-11-23 09:07:50', '2023-11-23 09:07:50');
INSERT INTO `wd_sys_login_log` VALUES ('490', '41', 'test12', '1', '5', '0', '登录成功', '219.156.176.234', '河南省-南阳市', '\0', '2023-11-23 10:42:14', '2023-11-23 10:42:14');
INSERT INTO `wd_sys_login_log` VALUES ('491', '41', 'test12', '1', '5', '0', '登录成功', '119.180.25.196', '山东省-烟台市', '\0', '2023-11-23 11:29:19', '2023-11-23 11:29:19');
INSERT INTO `wd_sys_login_log` VALUES ('492', '41', 'test12', '1', '5', '0', '登录成功', '218.58.254.247', '山东省-莱芜市', '\0', '2023-11-23 14:50:18', '2023-11-23 14:50:18');
INSERT INTO `wd_sys_login_log` VALUES ('493', '41', 'test12', '1', '5', '0', '登录成功', '122.192.11.19', '江苏省-南京市', '\0', '2023-11-23 15:55:48', '2023-11-23 15:55:48');
INSERT INTO `wd_sys_login_log` VALUES ('494', '41', 'test12', '1', '5', '0', '登录成功', '180.108.112.133', '江苏省-苏州市', '\0', '2023-11-23 15:59:05', '2023-11-23 15:59:05');
INSERT INTO `wd_sys_login_log` VALUES ('495', '41', 'test12', '1', '5', '0', '登录成功', '180.108.112.133', '江苏省-苏州市', '\0', '2023-11-23 15:59:14', '2023-11-23 15:59:14');
INSERT INTO `wd_sys_login_log` VALUES ('496', '41', 'test12', '1', '5', '0', '登录成功', '119.123.207.197', '广东省-深圳市', '\0', '2023-11-23 17:20:08', '2023-11-23 17:20:08');
INSERT INTO `wd_sys_login_log` VALUES ('497', '41', 'test12', '1', '5', '0', '登录成功', '111.121.79.62', '贵州省-贵阳市', '\0', '2023-11-23 21:50:51', '2023-11-23 21:50:51');
INSERT INTO `wd_sys_login_log` VALUES ('498', '41', 'test12', '1', '5', '0', '登录成功', '121.237.138.7', '江苏省-南京市', '\0', '2023-11-24 00:28:53', '2023-11-24 00:28:53');
INSERT INTO `wd_sys_login_log` VALUES ('499', '41', 'test12', '1', '5', '0', '登录成功', '223.104.122.13', '湖北省-', '\0', '2023-11-24 07:00:36', '2023-11-24 07:00:36');
INSERT INTO `wd_sys_login_log` VALUES ('500', '41', 'test12', '1', '5', '0', '登录成功', '113.99.188.32', '广东省-东莞市', '\0', '2023-11-24 08:19:16', '2023-11-24 08:19:16');
INSERT INTO `wd_sys_login_log` VALUES ('501', '41', 'test12', '1', '5', '0', '登录成功', '58.34.149.106', '上海市-上海市', '\0', '2023-11-24 10:15:12', '2023-11-24 10:15:12');
INSERT INTO `wd_sys_login_log` VALUES ('502', '41', 'test12', '1', '5', '0', '登录成功', '180.108.112.133', '江苏省-苏州市', '\0', '2023-11-24 13:38:28', '2023-11-24 13:38:28');
INSERT INTO `wd_sys_login_log` VALUES ('503', '41', 'test12', '1', '5', '0', '登录成功', '183.242.18.178', '北京市-北京市', '\0', '2023-11-24 13:45:38', '2023-11-24 13:45:38');
INSERT INTO `wd_sys_login_log` VALUES ('504', '41', 'test12', '1', '5', '0', '登录成功', '175.9.143.121', '湖南省-长沙市', '\0', '2023-11-24 14:50:21', '2023-11-24 14:50:21');
INSERT INTO `wd_sys_login_log` VALUES ('505', '41', 'test12', '1', '5', '0', '登录成功', '1.192.90.99', '河南省-郑州市', '\0', '2023-11-24 16:29:54', '2023-11-24 16:29:54');
INSERT INTO `wd_sys_login_log` VALUES ('506', '41', 'test12', '1', '5', '0', '登录成功', '113.87.153.64', '广东省-深圳市', '\0', '2023-11-24 16:49:36', '2023-11-24 16:49:36');
INSERT INTO `wd_sys_login_log` VALUES ('507', '41', 'test12', '1', '5', '0', '登录成功', '114.221.19.207', '江苏省-南京市', '\0', '2023-11-24 17:26:00', '2023-11-24 17:26:00');
INSERT INTO `wd_sys_login_log` VALUES ('508', '41', 'test12', '1', '5', '0', '登录成功', '183.223.252.119', '四川省-成都市', '\0', '2023-11-24 17:28:04', '2023-11-24 17:28:04');
INSERT INTO `wd_sys_login_log` VALUES ('509', '41', 'test12', '1', '5', '0', '登录成功', '36.24.149.82', '浙江省-杭州市', '\0', '2023-11-24 17:33:10', '2023-11-24 17:33:10');
INSERT INTO `wd_sys_login_log` VALUES ('510', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '36.24.149.82', '浙江省-杭州市', '\0', '2023-12-07 01:11:27', '2023-12-07 01:11:27');
INSERT INTO `wd_sys_login_log` VALUES ('511', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '36.24.149.82', '浙江省-杭州市', '\0', '2023-12-07 01:43:23', '2023-12-07 01:43:23');
INSERT INTO `wd_sys_login_log` VALUES ('512', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '36.24.149.82', '36.24.149.82', '\0', '2023-12-07 01:44:36', '2023-12-07 01:44:36');
INSERT INTO `wd_sys_login_log` VALUES ('513', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '36.24.149.82', '广东省-东莞市', '\0', '2023-12-07 01:47:40', '2023-12-07 01:47:40');
INSERT INTO `wd_sys_login_log` VALUES ('514', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '36.24.149.82', '广东省-东莞市', '\0', '2023-12-07 01:53:04', '2023-12-07 01:53:04');
INSERT INTO `wd_sys_login_log` VALUES ('515', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '36.24.149.82', '广东省-东莞市', '\0', '2023-12-07 13:44:57', '2023-12-07 13:44:57');
INSERT INTO `wd_sys_login_log` VALUES ('516', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '36.24.149.82', '广东省-东莞市', '\0', '2023-12-07 14:33:39', '2023-12-07 14:33:39');
INSERT INTO `wd_sys_login_log` VALUES ('517', '2', 'zhouwenqi', '1', '5', '0', '登录成功', '0:0:0:0:0:0:0:1', '广东省-东莞市', '\0', '2023-12-07 14:36:58', '2023-12-07 14:36:58');

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
) ENGINE=InnoDB AUTO_INCREMENT=851 DEFAULT CHARSET=utf8mb4 COMMENT='操作日志';

-- ----------------------------
-- Records of wd_sys_operation_log
-- ----------------------------
INSERT INTO `wd_sys_operation_log` VALUES ('1', '1', 'superman', '0', '5', '0', '6', '创建岗位信息:线下地推[M0565564]', '182.105.7.45', '江西省-萍乡市', '6', '', '2023-09-06 09:21:00', '2023-09-06 09:21:00');
INSERT INTO `wd_sys_operation_log` VALUES ('2', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 17:21:44', '2023-09-06 17:21:44');
INSERT INTO `wd_sys_operation_log` VALUES ('3', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 17:21:46', '2023-09-06 17:21:46');
INSERT INTO `wd_sys_operation_log` VALUES ('4', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 17:21:48', '2023-09-06 17:21:48');
INSERT INTO `wd_sys_operation_log` VALUES ('5', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 17:21:49', '2023-09-06 17:21:49');
INSERT INTO `wd_sys_operation_log` VALUES ('6', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 17:22:20', '2023-09-06 17:22:20');
INSERT INTO `wd_sys_operation_log` VALUES ('7', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 17:22:46', '2023-09-06 17:22:46');
INSERT INTO `wd_sys_operation_log` VALUES ('8', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 17:24:05', '2023-09-06 17:24:05');
INSERT INTO `wd_sys_operation_log` VALUES ('9', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 17:24:22', '2023-09-06 17:24:22');
INSERT INTO `wd_sys_operation_log` VALUES ('10', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 17:27:37', '2023-09-06 17:27:37');
INSERT INTO `wd_sys_operation_log` VALUES ('11', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 17:27:49', '2023-09-06 17:27:49');
INSERT INTO `wd_sys_operation_log` VALUES ('12', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 17:28:36', '2023-09-06 17:28:36');
INSERT INTO `wd_sys_operation_log` VALUES ('13', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 17:29:51', '2023-09-06 17:29:51');
INSERT INTO `wd_sys_operation_log` VALUES ('14', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 17:30:08', '2023-09-06 17:30:08');
INSERT INTO `wd_sys_operation_log` VALUES ('15', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 17:30:18', '2023-09-06 17:30:18');
INSERT INTO `wd_sys_operation_log` VALUES ('16', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 18:11:56', '2023-09-06 18:11:56');
INSERT INTO `wd_sys_operation_log` VALUES ('17', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 18:11:58', '2023-09-06 18:11:58');
INSERT INTO `wd_sys_operation_log` VALUES ('18', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 18:12:14', '2023-09-06 18:12:14');
INSERT INTO `wd_sys_operation_log` VALUES ('19', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 18:12:56', '2023-09-06 18:12:56');
INSERT INTO `wd_sys_operation_log` VALUES ('20', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 18:13:45', '2023-09-06 18:13:45');
INSERT INTO `wd_sys_operation_log` VALUES ('21', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 21:52:43', '2023-09-06 21:52:43');
INSERT INTO `wd_sys_operation_log` VALUES ('22', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 21:52:46', '2023-09-06 21:52:46');
INSERT INTO `wd_sys_operation_log` VALUES ('23', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 22:02:42', '2023-09-06 22:02:42');
INSERT INTO `wd_sys_operation_log` VALUES ('24', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 22:03:28', '2023-09-06 22:03:28');
INSERT INTO `wd_sys_operation_log` VALUES ('25', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 22:05:01', '2023-09-06 22:05:01');
INSERT INTO `wd_sys_operation_log` VALUES ('26', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 22:06:03', '2023-09-06 22:06:03');
INSERT INTO `wd_sys_operation_log` VALUES ('27', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 22:09:42', '2023-09-06 22:09:42');
INSERT INTO `wd_sys_operation_log` VALUES ('28', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 22:41:34', '2023-09-06 22:41:34');
INSERT INTO `wd_sys_operation_log` VALUES ('29', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 22:41:38', '2023-09-06 22:41:38');
INSERT INTO `wd_sys_operation_log` VALUES ('30', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 22:41:41', '2023-09-06 22:41:41');
INSERT INTO `wd_sys_operation_log` VALUES ('31', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 22:42:33', '2023-09-06 22:42:33');
INSERT INTO `wd_sys_operation_log` VALUES ('32', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 22:42:47', '2023-09-06 22:42:47');
INSERT INTO `wd_sys_operation_log` VALUES ('33', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 22:44:07', '2023-09-06 22:44:07');
INSERT INTO `wd_sys_operation_log` VALUES ('34', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 22:44:54', '2023-09-06 22:44:54');
INSERT INTO `wd_sys_operation_log` VALUES ('35', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 22:45:30', '2023-09-06 22:45:30');
INSERT INTO `wd_sys_operation_log` VALUES ('36', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 22:58:08', '2023-09-06 22:58:08');
INSERT INTO `wd_sys_operation_log` VALUES ('37', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 22:58:11', '2023-09-06 22:58:11');
INSERT INTO `wd_sys_operation_log` VALUES ('38', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 22:58:34', '2023-09-06 22:58:34');
INSERT INTO `wd_sys_operation_log` VALUES ('39', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 22:59:07', '2023-09-06 22:59:07');
INSERT INTO `wd_sys_operation_log` VALUES ('40', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 22:59:57', '2023-09-06 22:59:57');
INSERT INTO `wd_sys_operation_log` VALUES ('41', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 23:01:07', '2023-09-06 23:01:07');
INSERT INTO `wd_sys_operation_log` VALUES ('42', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 23:01:08', '2023-09-06 23:01:08');
INSERT INTO `wd_sys_operation_log` VALUES ('43', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 23:01:38', '2023-09-06 23:01:38');
INSERT INTO `wd_sys_operation_log` VALUES ('44', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 23:01:46', '2023-09-06 23:01:46');
INSERT INTO `wd_sys_operation_log` VALUES ('45', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 23:02:47', '2023-09-06 23:02:47');
INSERT INTO `wd_sys_operation_log` VALUES ('46', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 23:03:05', '2023-09-06 23:03:05');
INSERT INTO `wd_sys_operation_log` VALUES ('47', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 23:23:07', '2023-09-06 23:23:07');
INSERT INTO `wd_sys_operation_log` VALUES ('48', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 23:23:09', '2023-09-06 23:23:09');
INSERT INTO `wd_sys_operation_log` VALUES ('49', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 23:23:51', '2023-09-06 23:23:51');
INSERT INTO `wd_sys_operation_log` VALUES ('50', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 23:23:57', '2023-09-06 23:23:57');
INSERT INTO `wd_sys_operation_log` VALUES ('51', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 23:24:40', '2023-09-06 23:24:40');
INSERT INTO `wd_sys_operation_log` VALUES ('52', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 23:24:48', '2023-09-06 23:24:48');
INSERT INTO `wd_sys_operation_log` VALUES ('53', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 23:25:51', '2023-09-06 23:25:51');
INSERT INTO `wd_sys_operation_log` VALUES ('54', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 23:26:11', '2023-09-06 23:26:11');
INSERT INTO `wd_sys_operation_log` VALUES ('55', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 23:28:23', '2023-09-06 23:28:23');
INSERT INTO `wd_sys_operation_log` VALUES ('56', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 23:28:39', '2023-09-06 23:28:39');
INSERT INTO `wd_sys_operation_log` VALUES ('57', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 23:28:46', '2023-09-06 23:28:46');
INSERT INTO `wd_sys_operation_log` VALUES ('58', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 23:28:53', '2023-09-06 23:28:53');
INSERT INTO `wd_sys_operation_log` VALUES ('59', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 23:31:53', '2023-09-06 23:31:53');
INSERT INTO `wd_sys_operation_log` VALUES ('60', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 23:31:57', '2023-09-06 23:31:57');
INSERT INTO `wd_sys_operation_log` VALUES ('61', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 23:32:25', '2023-09-06 23:32:25');
INSERT INTO `wd_sys_operation_log` VALUES ('62', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 23:32:29', '2023-09-06 23:32:29');
INSERT INTO `wd_sys_operation_log` VALUES ('63', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 23:34:08', '2023-09-06 23:34:08');
INSERT INTO `wd_sys_operation_log` VALUES ('64', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 23:34:12', '2023-09-06 23:34:12');
INSERT INTO `wd_sys_operation_log` VALUES ('65', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 23:34:17', '2023-09-06 23:34:17');
INSERT INTO `wd_sys_operation_log` VALUES ('66', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 23:34:20', '2023-09-06 23:34:20');
INSERT INTO `wd_sys_operation_log` VALUES ('67', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 23:34:25', '2023-09-06 23:34:25');
INSERT INTO `wd_sys_operation_log` VALUES ('68', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 23:34:28', '2023-09-06 23:34:28');
INSERT INTO `wd_sys_operation_log` VALUES ('69', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 23:34:36', '2023-09-06 23:34:36');
INSERT INTO `wd_sys_operation_log` VALUES ('70', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 23:34:39', '2023-09-06 23:34:39');
INSERT INTO `wd_sys_operation_log` VALUES ('71', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 23:50:38', '2023-09-06 23:50:38');
INSERT INTO `wd_sys_operation_log` VALUES ('72', '2', 'zhouwenqi', '1', '5', '0', '0', '修改个人资料:null[2]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-09-06 23:50:47', '2023-09-06 23:50:47');
INSERT INTO `wd_sys_operation_log` VALUES ('73', '1', 'superman', '1', '5', '0', '0', '修改个人资料:null[1]', '113.79.161.164', '广东省-东莞市', '1', '\0', '2023-09-07 00:05:10', '2023-09-07 00:05:10');
INSERT INTO `wd_sys_operation_log` VALUES ('74', '1', 'superman', '1', '5', '0', '0', '修改个人资料:null[1]', '113.79.161.164', '广东省-东莞市', '1', '\0', '2023-09-07 00:05:19', '2023-09-07 00:05:19');
INSERT INTO `wd_sys_operation_log` VALUES ('75', '1', 'superman', '0', '5', '0', '6', '创建岗位信息:前端开发[M0654654]', '182.105.7.45', '江西省-萍乡市', '7', '\0', '2023-09-07 09:41:28', '2023-09-07 09:41:28');
INSERT INTO `wd_sys_operation_log` VALUES ('76', '1', 'superman', '0', '5', '0', '2', '创建角色信息:小马测试角色[role:xiaoma:test]', '182.105.7.45', '江西省-萍乡市', '7', '\0', '2023-09-07 09:42:25', '2023-09-07 09:42:25');
INSERT INTO `wd_sys_operation_log` VALUES ('77', '1', 'superman', '0', '5', '0', '0', '创建系统用户:xiaoma[39]', '182.105.7.45', '江西省-萍乡市', '39', '\0', '2023-09-07 09:43:35', '2023-09-07 09:43:35');
INSERT INTO `wd_sys_operation_log` VALUES ('78', '1', 'superman', '1', '5', '0', '2', '修改角色权限:小马测试角色[role:xiaoma:test]', '182.105.7.45', '江西省-萍乡市', '7', '\0', '2023-09-07 09:47:02', '2023-09-07 09:47:02');
INSERT INTO `wd_sys_operation_log` VALUES ('79', '1', 'superman', '1', '5', '0', '0', '修改系统用户:xiaoma[39]', '182.105.7.45', '江西省-萍乡市', '39', '\0', '2023-09-07 10:48:29', '2023-09-07 10:48:29');
INSERT INTO `wd_sys_operation_log` VALUES ('80', '1', 'superman', '1', '5', '0', '0', '修改个人资料:null[1]', '182.105.7.45', null, '1', '\0', '2023-09-07 11:18:03', '2023-09-07 11:18:03');
INSERT INTO `wd_sys_operation_log` VALUES ('81', '1', 'superman', '1', '5', '0', '0', '修改系统用户:xiaoma[39]', '182.105.6.105', '江西省-萍乡市', '39', '\0', '2023-09-08 08:31:22', '2023-09-08 08:31:22');
INSERT INTO `wd_sys_operation_log` VALUES ('82', '1', 'superman', '1', '5', '0', '2', '修改角色权限:小马测试角色[role:xiaoma:test]', '182.105.6.105', '江西省-萍乡市', '7', '\0', '2023-09-08 08:32:07', '2023-09-08 08:32:07');
INSERT INTO `wd_sys_operation_log` VALUES ('83', '1', 'superman', '1', '5', '0', '2', '修改角色权限:小马测试角色[role:xiaoma:test]', '182.105.6.105', '江西省-萍乡市', '7', '\0', '2023-09-08 08:35:11', '2023-09-08 08:35:11');
INSERT INTO `wd_sys_operation_log` VALUES ('84', '1', 'superman', '1', '5', '0', '2', '修改角色权限:小马测试角色[role:xiaoma:test]', '182.105.6.105', '江西省-萍乡市', '7', '\0', '2023-09-08 08:38:08', '2023-09-08 08:38:08');
INSERT INTO `wd_sys_operation_log` VALUES ('85', '1', 'superman', '1', '5', '0', '2', '修改角色权限:小马测试角色[role:xiaoma:test]', '182.105.6.105', '江西省-萍乡市', '7', '\0', '2023-09-08 08:39:22', '2023-09-08 08:39:22');
INSERT INTO `wd_sys_operation_log` VALUES ('86', '1', 'superman', '1', '5', '0', '0', '修改个人资料:null[1]', '182.105.6.161', '江西省-萍乡市', '1', '\0', '2023-09-11 09:09:33', '2023-09-11 09:09:33');
INSERT INTO `wd_sys_operation_log` VALUES ('87', '1', 'superman', '1', '5', '0', '0', '修改个人资料:null[1]', '182.105.6.161', '江西省-萍乡市', '1', '\0', '2023-09-11 11:09:09', '2023-09-11 11:09:09');
INSERT INTO `wd_sys_operation_log` VALUES ('88', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:16', '2023-09-11 14:22:16');
INSERT INTO `wd_sys_operation_log` VALUES ('89', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', '江西省-萍乡市', '1', '\0', '2023-09-11 14:22:17', '2023-09-11 14:22:17');
INSERT INTO `wd_sys_operation_log` VALUES ('90', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:17', '2023-09-11 14:22:17');
INSERT INTO `wd_sys_operation_log` VALUES ('91', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:22:17', '2023-09-11 14:22:17');
INSERT INTO `wd_sys_operation_log` VALUES ('92', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:17', '2023-09-11 14:22:17');
INSERT INTO `wd_sys_operation_log` VALUES ('93', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:17', '2023-09-11 14:22:17');
INSERT INTO `wd_sys_operation_log` VALUES ('94', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:18', '2023-09-11 14:22:18');
INSERT INTO `wd_sys_operation_log` VALUES ('95', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:18', '2023-09-11 14:22:18');
INSERT INTO `wd_sys_operation_log` VALUES ('96', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:18', '2023-09-11 14:22:18');
INSERT INTO `wd_sys_operation_log` VALUES ('97', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:19', '2023-09-11 14:22:19');
INSERT INTO `wd_sys_operation_log` VALUES ('98', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:19', '2023-09-11 14:22:19');
INSERT INTO `wd_sys_operation_log` VALUES ('99', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:19', '2023-09-11 14:22:19');
INSERT INTO `wd_sys_operation_log` VALUES ('100', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:19', '2023-09-11 14:22:19');
INSERT INTO `wd_sys_operation_log` VALUES ('101', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:19', '2023-09-11 14:22:19');
INSERT INTO `wd_sys_operation_log` VALUES ('102', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:19', '2023-09-11 14:22:19');
INSERT INTO `wd_sys_operation_log` VALUES ('103', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:20', '2023-09-11 14:22:20');
INSERT INTO `wd_sys_operation_log` VALUES ('104', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:20', '2023-09-11 14:22:20');
INSERT INTO `wd_sys_operation_log` VALUES ('105', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:20', '2023-09-11 14:22:20');
INSERT INTO `wd_sys_operation_log` VALUES ('106', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:20', '2023-09-11 14:22:20');
INSERT INTO `wd_sys_operation_log` VALUES ('107', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:20', '2023-09-11 14:22:20');
INSERT INTO `wd_sys_operation_log` VALUES ('108', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:20', '2023-09-11 14:22:20');
INSERT INTO `wd_sys_operation_log` VALUES ('109', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:20', '2023-09-11 14:22:20');
INSERT INTO `wd_sys_operation_log` VALUES ('110', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:20', '2023-09-11 14:22:20');
INSERT INTO `wd_sys_operation_log` VALUES ('111', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:20', '2023-09-11 14:22:20');
INSERT INTO `wd_sys_operation_log` VALUES ('112', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:20', '2023-09-11 14:22:20');
INSERT INTO `wd_sys_operation_log` VALUES ('113', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:20', '2023-09-11 14:22:20');
INSERT INTO `wd_sys_operation_log` VALUES ('114', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:20', '2023-09-11 14:22:20');
INSERT INTO `wd_sys_operation_log` VALUES ('115', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:20', '2023-09-11 14:22:20');
INSERT INTO `wd_sys_operation_log` VALUES ('116', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:20', '2023-09-11 14:22:20');
INSERT INTO `wd_sys_operation_log` VALUES ('117', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:20', '2023-09-11 14:22:20');
INSERT INTO `wd_sys_operation_log` VALUES ('118', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:20', '2023-09-11 14:22:20');
INSERT INTO `wd_sys_operation_log` VALUES ('119', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:20', '2023-09-11 14:22:20');
INSERT INTO `wd_sys_operation_log` VALUES ('120', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:20', '2023-09-11 14:22:20');
INSERT INTO `wd_sys_operation_log` VALUES ('121', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:20', '2023-09-11 14:22:20');
INSERT INTO `wd_sys_operation_log` VALUES ('122', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:21', '2023-09-11 14:22:21');
INSERT INTO `wd_sys_operation_log` VALUES ('123', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:21', '2023-09-11 14:22:21');
INSERT INTO `wd_sys_operation_log` VALUES ('124', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:21', '2023-09-11 14:22:21');
INSERT INTO `wd_sys_operation_log` VALUES ('125', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:21', '2023-09-11 14:22:21');
INSERT INTO `wd_sys_operation_log` VALUES ('126', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:21', '2023-09-11 14:22:21');
INSERT INTO `wd_sys_operation_log` VALUES ('127', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:21', '2023-09-11 14:22:21');
INSERT INTO `wd_sys_operation_log` VALUES ('128', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:21', '2023-09-11 14:22:21');
INSERT INTO `wd_sys_operation_log` VALUES ('129', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:21', '2023-09-11 14:22:21');
INSERT INTO `wd_sys_operation_log` VALUES ('130', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:21', '2023-09-11 14:22:21');
INSERT INTO `wd_sys_operation_log` VALUES ('131', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:21', '2023-09-11 14:22:21');
INSERT INTO `wd_sys_operation_log` VALUES ('132', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:21', '2023-09-11 14:22:21');
INSERT INTO `wd_sys_operation_log` VALUES ('133', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:21', '2023-09-11 14:22:21');
INSERT INTO `wd_sys_operation_log` VALUES ('134', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:21', '2023-09-11 14:22:21');
INSERT INTO `wd_sys_operation_log` VALUES ('135', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:21', '2023-09-11 14:22:21');
INSERT INTO `wd_sys_operation_log` VALUES ('136', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:21', '2023-09-11 14:22:21');
INSERT INTO `wd_sys_operation_log` VALUES ('137', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:21', '2023-09-11 14:22:21');
INSERT INTO `wd_sys_operation_log` VALUES ('138', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:22', '2023-09-11 14:22:22');
INSERT INTO `wd_sys_operation_log` VALUES ('139', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:22', '2023-09-11 14:22:22');
INSERT INTO `wd_sys_operation_log` VALUES ('140', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:22', '2023-09-11 14:22:22');
INSERT INTO `wd_sys_operation_log` VALUES ('141', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:22', '2023-09-11 14:22:22');
INSERT INTO `wd_sys_operation_log` VALUES ('142', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:22', '2023-09-11 14:22:22');
INSERT INTO `wd_sys_operation_log` VALUES ('143', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:22', '2023-09-11 14:22:22');
INSERT INTO `wd_sys_operation_log` VALUES ('144', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:22', '2023-09-11 14:22:22');
INSERT INTO `wd_sys_operation_log` VALUES ('145', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:22', '2023-09-11 14:22:22');
INSERT INTO `wd_sys_operation_log` VALUES ('146', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:22', '2023-09-11 14:22:22');
INSERT INTO `wd_sys_operation_log` VALUES ('147', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:22', '2023-09-11 14:22:22');
INSERT INTO `wd_sys_operation_log` VALUES ('148', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:22', '2023-09-11 14:22:22');
INSERT INTO `wd_sys_operation_log` VALUES ('149', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:22', '2023-09-11 14:22:22');
INSERT INTO `wd_sys_operation_log` VALUES ('150', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:22', '2023-09-11 14:22:22');
INSERT INTO `wd_sys_operation_log` VALUES ('151', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:22', '2023-09-11 14:22:22');
INSERT INTO `wd_sys_operation_log` VALUES ('152', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:22', '2023-09-11 14:22:22');
INSERT INTO `wd_sys_operation_log` VALUES ('153', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:23', '2023-09-11 14:22:23');
INSERT INTO `wd_sys_operation_log` VALUES ('154', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:23', '2023-09-11 14:22:23');
INSERT INTO `wd_sys_operation_log` VALUES ('155', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:23', '2023-09-11 14:22:23');
INSERT INTO `wd_sys_operation_log` VALUES ('156', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:23', '2023-09-11 14:22:23');
INSERT INTO `wd_sys_operation_log` VALUES ('157', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:23', '2023-09-11 14:22:23');
INSERT INTO `wd_sys_operation_log` VALUES ('158', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:23', '2023-09-11 14:22:23');
INSERT INTO `wd_sys_operation_log` VALUES ('159', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:23', '2023-09-11 14:22:23');
INSERT INTO `wd_sys_operation_log` VALUES ('160', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:23', '2023-09-11 14:22:23');
INSERT INTO `wd_sys_operation_log` VALUES ('161', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:23', '2023-09-11 14:22:23');
INSERT INTO `wd_sys_operation_log` VALUES ('162', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:23', '2023-09-11 14:22:23');
INSERT INTO `wd_sys_operation_log` VALUES ('163', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:23', '2023-09-11 14:22:23');
INSERT INTO `wd_sys_operation_log` VALUES ('164', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:23', '2023-09-11 14:22:23');
INSERT INTO `wd_sys_operation_log` VALUES ('165', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:23', '2023-09-11 14:22:23');
INSERT INTO `wd_sys_operation_log` VALUES ('166', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:23', '2023-09-11 14:22:23');
INSERT INTO `wd_sys_operation_log` VALUES ('167', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:23', '2023-09-11 14:22:23');
INSERT INTO `wd_sys_operation_log` VALUES ('168', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:23', '2023-09-11 14:22:23');
INSERT INTO `wd_sys_operation_log` VALUES ('169', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:24', '2023-09-11 14:22:24');
INSERT INTO `wd_sys_operation_log` VALUES ('170', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:24', '2023-09-11 14:22:24');
INSERT INTO `wd_sys_operation_log` VALUES ('171', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:24', '2023-09-11 14:22:24');
INSERT INTO `wd_sys_operation_log` VALUES ('172', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:24', '2023-09-11 14:22:24');
INSERT INTO `wd_sys_operation_log` VALUES ('173', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:24', '2023-09-11 14:22:24');
INSERT INTO `wd_sys_operation_log` VALUES ('174', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:24', '2023-09-11 14:22:24');
INSERT INTO `wd_sys_operation_log` VALUES ('175', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:24', '2023-09-11 14:22:24');
INSERT INTO `wd_sys_operation_log` VALUES ('176', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:24', '2023-09-11 14:22:24');
INSERT INTO `wd_sys_operation_log` VALUES ('177', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:24', '2023-09-11 14:22:24');
INSERT INTO `wd_sys_operation_log` VALUES ('178', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:24', '2023-09-11 14:22:24');
INSERT INTO `wd_sys_operation_log` VALUES ('179', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:24', '2023-09-11 14:22:24');
INSERT INTO `wd_sys_operation_log` VALUES ('180', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:24', '2023-09-11 14:22:24');
INSERT INTO `wd_sys_operation_log` VALUES ('181', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:24', '2023-09-11 14:22:24');
INSERT INTO `wd_sys_operation_log` VALUES ('182', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:25', '2023-09-11 14:22:25');
INSERT INTO `wd_sys_operation_log` VALUES ('183', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:25', '2023-09-11 14:22:25');
INSERT INTO `wd_sys_operation_log` VALUES ('184', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:25', '2023-09-11 14:22:25');
INSERT INTO `wd_sys_operation_log` VALUES ('185', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:25', '2023-09-11 14:22:25');
INSERT INTO `wd_sys_operation_log` VALUES ('186', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:25', '2023-09-11 14:22:25');
INSERT INTO `wd_sys_operation_log` VALUES ('187', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:25', '2023-09-11 14:22:25');
INSERT INTO `wd_sys_operation_log` VALUES ('188', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:25', '2023-09-11 14:22:25');
INSERT INTO `wd_sys_operation_log` VALUES ('189', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:25', '2023-09-11 14:22:25');
INSERT INTO `wd_sys_operation_log` VALUES ('190', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:25', '2023-09-11 14:22:25');
INSERT INTO `wd_sys_operation_log` VALUES ('191', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:25', '2023-09-11 14:22:25');
INSERT INTO `wd_sys_operation_log` VALUES ('192', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:25', '2023-09-11 14:22:25');
INSERT INTO `wd_sys_operation_log` VALUES ('193', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:25', '2023-09-11 14:22:25');
INSERT INTO `wd_sys_operation_log` VALUES ('194', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:25', '2023-09-11 14:22:25');
INSERT INTO `wd_sys_operation_log` VALUES ('195', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:25', '2023-09-11 14:22:25');
INSERT INTO `wd_sys_operation_log` VALUES ('196', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:25', '2023-09-11 14:22:25');
INSERT INTO `wd_sys_operation_log` VALUES ('197', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:25', '2023-09-11 14:22:25');
INSERT INTO `wd_sys_operation_log` VALUES ('198', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:25', '2023-09-11 14:22:25');
INSERT INTO `wd_sys_operation_log` VALUES ('199', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:26', '2023-09-11 14:22:26');
INSERT INTO `wd_sys_operation_log` VALUES ('200', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:26', '2023-09-11 14:22:26');
INSERT INTO `wd_sys_operation_log` VALUES ('201', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:26', '2023-09-11 14:22:26');
INSERT INTO `wd_sys_operation_log` VALUES ('202', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:26', '2023-09-11 14:22:26');
INSERT INTO `wd_sys_operation_log` VALUES ('203', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:26', '2023-09-11 14:22:26');
INSERT INTO `wd_sys_operation_log` VALUES ('204', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:26', '2023-09-11 14:22:26');
INSERT INTO `wd_sys_operation_log` VALUES ('205', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:26', '2023-09-11 14:22:26');
INSERT INTO `wd_sys_operation_log` VALUES ('206', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:26', '2023-09-11 14:22:26');
INSERT INTO `wd_sys_operation_log` VALUES ('207', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:26', '2023-09-11 14:22:26');
INSERT INTO `wd_sys_operation_log` VALUES ('208', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:26', '2023-09-11 14:22:26');
INSERT INTO `wd_sys_operation_log` VALUES ('209', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:26', '2023-09-11 14:22:26');
INSERT INTO `wd_sys_operation_log` VALUES ('210', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:27', '2023-09-11 14:22:27');
INSERT INTO `wd_sys_operation_log` VALUES ('211', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:27', '2023-09-11 14:22:27');
INSERT INTO `wd_sys_operation_log` VALUES ('212', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:27', '2023-09-11 14:22:27');
INSERT INTO `wd_sys_operation_log` VALUES ('213', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:27', '2023-09-11 14:22:27');
INSERT INTO `wd_sys_operation_log` VALUES ('214', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:27', '2023-09-11 14:22:27');
INSERT INTO `wd_sys_operation_log` VALUES ('215', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:27', '2023-09-11 14:22:27');
INSERT INTO `wd_sys_operation_log` VALUES ('216', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:27', '2023-09-11 14:22:27');
INSERT INTO `wd_sys_operation_log` VALUES ('217', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:27', '2023-09-11 14:22:27');
INSERT INTO `wd_sys_operation_log` VALUES ('218', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:27', '2023-09-11 14:22:27');
INSERT INTO `wd_sys_operation_log` VALUES ('219', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:27', '2023-09-11 14:22:27');
INSERT INTO `wd_sys_operation_log` VALUES ('220', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:27', '2023-09-11 14:22:27');
INSERT INTO `wd_sys_operation_log` VALUES ('221', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:27', '2023-09-11 14:22:27');
INSERT INTO `wd_sys_operation_log` VALUES ('222', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:27', '2023-09-11 14:22:27');
INSERT INTO `wd_sys_operation_log` VALUES ('223', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:28', '2023-09-11 14:22:28');
INSERT INTO `wd_sys_operation_log` VALUES ('224', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:28', '2023-09-11 14:22:28');
INSERT INTO `wd_sys_operation_log` VALUES ('225', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:28', '2023-09-11 14:22:28');
INSERT INTO `wd_sys_operation_log` VALUES ('226', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:28', '2023-09-11 14:22:28');
INSERT INTO `wd_sys_operation_log` VALUES ('227', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:28', '2023-09-11 14:22:28');
INSERT INTO `wd_sys_operation_log` VALUES ('228', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:28', '2023-09-11 14:22:28');
INSERT INTO `wd_sys_operation_log` VALUES ('229', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:28', '2023-09-11 14:22:28');
INSERT INTO `wd_sys_operation_log` VALUES ('230', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:28', '2023-09-11 14:22:28');
INSERT INTO `wd_sys_operation_log` VALUES ('231', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:28', '2023-09-11 14:22:28');
INSERT INTO `wd_sys_operation_log` VALUES ('232', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:28', '2023-09-11 14:22:28');
INSERT INTO `wd_sys_operation_log` VALUES ('233', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:28', '2023-09-11 14:22:28');
INSERT INTO `wd_sys_operation_log` VALUES ('234', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:28', '2023-09-11 14:22:28');
INSERT INTO `wd_sys_operation_log` VALUES ('235', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:28', '2023-09-11 14:22:28');
INSERT INTO `wd_sys_operation_log` VALUES ('236', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:28', '2023-09-11 14:22:28');
INSERT INTO `wd_sys_operation_log` VALUES ('237', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:28', '2023-09-11 14:22:28');
INSERT INTO `wd_sys_operation_log` VALUES ('238', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:29', '2023-09-11 14:22:29');
INSERT INTO `wd_sys_operation_log` VALUES ('239', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:29', '2023-09-11 14:22:29');
INSERT INTO `wd_sys_operation_log` VALUES ('240', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:29', '2023-09-11 14:22:29');
INSERT INTO `wd_sys_operation_log` VALUES ('241', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:29', '2023-09-11 14:22:29');
INSERT INTO `wd_sys_operation_log` VALUES ('242', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:29', '2023-09-11 14:22:29');
INSERT INTO `wd_sys_operation_log` VALUES ('243', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:29', '2023-09-11 14:22:29');
INSERT INTO `wd_sys_operation_log` VALUES ('244', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:29', '2023-09-11 14:22:29');
INSERT INTO `wd_sys_operation_log` VALUES ('245', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:29', '2023-09-11 14:22:29');
INSERT INTO `wd_sys_operation_log` VALUES ('246', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:29', '2023-09-11 14:22:29');
INSERT INTO `wd_sys_operation_log` VALUES ('247', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:29', '2023-09-11 14:22:29');
INSERT INTO `wd_sys_operation_log` VALUES ('248', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:30', '2023-09-11 14:22:30');
INSERT INTO `wd_sys_operation_log` VALUES ('249', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:30', '2023-09-11 14:22:30');
INSERT INTO `wd_sys_operation_log` VALUES ('250', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:30', '2023-09-11 14:22:30');
INSERT INTO `wd_sys_operation_log` VALUES ('251', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:30', '2023-09-11 14:22:30');
INSERT INTO `wd_sys_operation_log` VALUES ('252', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:30', '2023-09-11 14:22:30');
INSERT INTO `wd_sys_operation_log` VALUES ('253', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:30', '2023-09-11 14:22:30');
INSERT INTO `wd_sys_operation_log` VALUES ('254', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:31', '2023-09-11 14:22:31');
INSERT INTO `wd_sys_operation_log` VALUES ('255', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:31', '2023-09-11 14:22:31');
INSERT INTO `wd_sys_operation_log` VALUES ('256', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:31', '2023-09-11 14:22:31');
INSERT INTO `wd_sys_operation_log` VALUES ('257', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:31', '2023-09-11 14:22:31');
INSERT INTO `wd_sys_operation_log` VALUES ('258', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:31', '2023-09-11 14:22:31');
INSERT INTO `wd_sys_operation_log` VALUES ('259', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:31', '2023-09-11 14:22:31');
INSERT INTO `wd_sys_operation_log` VALUES ('260', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:31', '2023-09-11 14:22:31');
INSERT INTO `wd_sys_operation_log` VALUES ('261', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:31', '2023-09-11 14:22:31');
INSERT INTO `wd_sys_operation_log` VALUES ('262', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:31', '2023-09-11 14:22:31');
INSERT INTO `wd_sys_operation_log` VALUES ('263', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:31', '2023-09-11 14:22:31');
INSERT INTO `wd_sys_operation_log` VALUES ('264', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:31', '2023-09-11 14:22:31');
INSERT INTO `wd_sys_operation_log` VALUES ('265', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:32', '2023-09-11 14:22:32');
INSERT INTO `wd_sys_operation_log` VALUES ('266', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:32', '2023-09-11 14:22:32');
INSERT INTO `wd_sys_operation_log` VALUES ('267', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:22:32', '2023-09-11 14:22:32');
INSERT INTO `wd_sys_operation_log` VALUES ('268', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:32', '2023-09-11 14:22:32');
INSERT INTO `wd_sys_operation_log` VALUES ('269', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:32', '2023-09-11 14:22:32');
INSERT INTO `wd_sys_operation_log` VALUES ('270', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:32', '2023-09-11 14:22:32');
INSERT INTO `wd_sys_operation_log` VALUES ('271', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:32', '2023-09-11 14:22:32');
INSERT INTO `wd_sys_operation_log` VALUES ('272', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:32', '2023-09-11 14:22:32');
INSERT INTO `wd_sys_operation_log` VALUES ('273', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:32', '2023-09-11 14:22:32');
INSERT INTO `wd_sys_operation_log` VALUES ('274', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:32', '2023-09-11 14:22:32');
INSERT INTO `wd_sys_operation_log` VALUES ('275', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:32', '2023-09-11 14:22:32');
INSERT INTO `wd_sys_operation_log` VALUES ('276', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:22:32', '2023-09-11 14:22:32');
INSERT INTO `wd_sys_operation_log` VALUES ('277', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:32', '2023-09-11 14:22:32');
INSERT INTO `wd_sys_operation_log` VALUES ('278', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:32', '2023-09-11 14:22:32');
INSERT INTO `wd_sys_operation_log` VALUES ('279', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:32', '2023-09-11 14:22:32');
INSERT INTO `wd_sys_operation_log` VALUES ('280', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:32', '2023-09-11 14:22:32');
INSERT INTO `wd_sys_operation_log` VALUES ('281', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:33', '2023-09-11 14:22:33');
INSERT INTO `wd_sys_operation_log` VALUES ('282', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:33', '2023-09-11 14:22:33');
INSERT INTO `wd_sys_operation_log` VALUES ('283', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:33', '2023-09-11 14:22:33');
INSERT INTO `wd_sys_operation_log` VALUES ('284', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:33', '2023-09-11 14:22:33');
INSERT INTO `wd_sys_operation_log` VALUES ('285', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:33', '2023-09-11 14:22:33');
INSERT INTO `wd_sys_operation_log` VALUES ('286', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:33', '2023-09-11 14:22:33');
INSERT INTO `wd_sys_operation_log` VALUES ('287', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:33', '2023-09-11 14:22:33');
INSERT INTO `wd_sys_operation_log` VALUES ('288', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:33', '2023-09-11 14:22:33');
INSERT INTO `wd_sys_operation_log` VALUES ('289', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:33', '2023-09-11 14:22:33');
INSERT INTO `wd_sys_operation_log` VALUES ('290', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:33', '2023-09-11 14:22:33');
INSERT INTO `wd_sys_operation_log` VALUES ('291', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:33', '2023-09-11 14:22:33');
INSERT INTO `wd_sys_operation_log` VALUES ('292', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:33', '2023-09-11 14:22:33');
INSERT INTO `wd_sys_operation_log` VALUES ('293', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:33', '2023-09-11 14:22:33');
INSERT INTO `wd_sys_operation_log` VALUES ('294', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:34', '2023-09-11 14:22:34');
INSERT INTO `wd_sys_operation_log` VALUES ('295', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:34', '2023-09-11 14:22:34');
INSERT INTO `wd_sys_operation_log` VALUES ('296', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:34', '2023-09-11 14:22:34');
INSERT INTO `wd_sys_operation_log` VALUES ('297', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:34', '2023-09-11 14:22:34');
INSERT INTO `wd_sys_operation_log` VALUES ('298', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:34', '2023-09-11 14:22:34');
INSERT INTO `wd_sys_operation_log` VALUES ('299', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:34', '2023-09-11 14:22:34');
INSERT INTO `wd_sys_operation_log` VALUES ('300', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:34', '2023-09-11 14:22:34');
INSERT INTO `wd_sys_operation_log` VALUES ('301', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:34', '2023-09-11 14:22:34');
INSERT INTO `wd_sys_operation_log` VALUES ('302', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:34', '2023-09-11 14:22:34');
INSERT INTO `wd_sys_operation_log` VALUES ('303', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:34', '2023-09-11 14:22:34');
INSERT INTO `wd_sys_operation_log` VALUES ('304', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:34', '2023-09-11 14:22:34');
INSERT INTO `wd_sys_operation_log` VALUES ('305', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:34', '2023-09-11 14:22:34');
INSERT INTO `wd_sys_operation_log` VALUES ('306', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:22:34', '2023-09-11 14:22:34');
INSERT INTO `wd_sys_operation_log` VALUES ('307', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:35', '2023-09-11 14:22:35');
INSERT INTO `wd_sys_operation_log` VALUES ('308', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:35', '2023-09-11 14:22:35');
INSERT INTO `wd_sys_operation_log` VALUES ('309', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:35', '2023-09-11 14:22:35');
INSERT INTO `wd_sys_operation_log` VALUES ('310', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:35', '2023-09-11 14:22:35');
INSERT INTO `wd_sys_operation_log` VALUES ('311', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:22:35', '2023-09-11 14:22:35');
INSERT INTO `wd_sys_operation_log` VALUES ('312', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:35', '2023-09-11 14:22:35');
INSERT INTO `wd_sys_operation_log` VALUES ('313', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:35', '2023-09-11 14:22:35');
INSERT INTO `wd_sys_operation_log` VALUES ('314', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:35', '2023-09-11 14:22:35');
INSERT INTO `wd_sys_operation_log` VALUES ('315', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:35', '2023-09-11 14:22:35');
INSERT INTO `wd_sys_operation_log` VALUES ('316', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:35', '2023-09-11 14:22:35');
INSERT INTO `wd_sys_operation_log` VALUES ('317', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:36', '2023-09-11 14:22:36');
INSERT INTO `wd_sys_operation_log` VALUES ('318', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:36', '2023-09-11 14:22:36');
INSERT INTO `wd_sys_operation_log` VALUES ('319', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:36', '2023-09-11 14:22:36');
INSERT INTO `wd_sys_operation_log` VALUES ('320', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:36', '2023-09-11 14:22:36');
INSERT INTO `wd_sys_operation_log` VALUES ('321', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:36', '2023-09-11 14:22:36');
INSERT INTO `wd_sys_operation_log` VALUES ('322', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:36', '2023-09-11 14:22:36');
INSERT INTO `wd_sys_operation_log` VALUES ('323', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:22:36', '2023-09-11 14:22:36');
INSERT INTO `wd_sys_operation_log` VALUES ('324', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:36', '2023-09-11 14:22:36');
INSERT INTO `wd_sys_operation_log` VALUES ('325', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:22:36', '2023-09-11 14:22:36');
INSERT INTO `wd_sys_operation_log` VALUES ('326', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:36', '2023-09-11 14:22:36');
INSERT INTO `wd_sys_operation_log` VALUES ('327', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:22:36', '2023-09-11 14:22:36');
INSERT INTO `wd_sys_operation_log` VALUES ('328', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:22:36', '2023-09-11 14:22:36');
INSERT INTO `wd_sys_operation_log` VALUES ('329', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:22:36', '2023-09-11 14:22:36');
INSERT INTO `wd_sys_operation_log` VALUES ('330', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:36', '2023-09-11 14:22:36');
INSERT INTO `wd_sys_operation_log` VALUES ('331', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', '江西省-萍乡市', '1', '\0', '2023-09-11 14:22:36', '2023-09-11 14:22:36');
INSERT INTO `wd_sys_operation_log` VALUES ('332', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:22:36', '2023-09-11 14:22:36');
INSERT INTO `wd_sys_operation_log` VALUES ('333', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:22:37', '2023-09-11 14:22:37');
INSERT INTO `wd_sys_operation_log` VALUES ('334', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:22:37', '2023-09-11 14:22:37');
INSERT INTO `wd_sys_operation_log` VALUES ('335', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:37', '2023-09-11 14:22:37');
INSERT INTO `wd_sys_operation_log` VALUES ('336', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', '江西省-萍乡市', '1', '\0', '2023-09-11 14:22:37', '2023-09-11 14:22:37');
INSERT INTO `wd_sys_operation_log` VALUES ('337', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:22:37', '2023-09-11 14:22:37');
INSERT INTO `wd_sys_operation_log` VALUES ('338', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:37', '2023-09-11 14:22:37');
INSERT INTO `wd_sys_operation_log` VALUES ('339', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:37', '2023-09-11 14:22:37');
INSERT INTO `wd_sys_operation_log` VALUES ('340', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:37', '2023-09-11 14:22:37');
INSERT INTO `wd_sys_operation_log` VALUES ('341', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:37', '2023-09-11 14:22:37');
INSERT INTO `wd_sys_operation_log` VALUES ('342', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:22:37', '2023-09-11 14:22:37');
INSERT INTO `wd_sys_operation_log` VALUES ('343', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:37', '2023-09-11 14:22:37');
INSERT INTO `wd_sys_operation_log` VALUES ('344', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', '江西省-萍乡市', '1', '\0', '2023-09-11 14:22:37', '2023-09-11 14:22:37');
INSERT INTO `wd_sys_operation_log` VALUES ('345', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:37', '2023-09-11 14:22:37');
INSERT INTO `wd_sys_operation_log` VALUES ('346', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:37', '2023-09-11 14:22:37');
INSERT INTO `wd_sys_operation_log` VALUES ('347', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:22:38', '2023-09-11 14:22:38');
INSERT INTO `wd_sys_operation_log` VALUES ('348', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:38', '2023-09-11 14:22:38');
INSERT INTO `wd_sys_operation_log` VALUES ('349', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:38', '2023-09-11 14:22:38');
INSERT INTO `wd_sys_operation_log` VALUES ('350', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:22:38', '2023-09-11 14:22:38');
INSERT INTO `wd_sys_operation_log` VALUES ('351', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:22:38', '2023-09-11 14:22:38');
INSERT INTO `wd_sys_operation_log` VALUES ('352', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:22:38', '2023-09-11 14:22:38');
INSERT INTO `wd_sys_operation_log` VALUES ('353', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:22:38', '2023-09-11 14:22:38');
INSERT INTO `wd_sys_operation_log` VALUES ('354', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', '江西省-萍乡市', '1', '\0', '2023-09-11 14:22:38', '2023-09-11 14:22:38');
INSERT INTO `wd_sys_operation_log` VALUES ('355', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:38', '2023-09-11 14:22:38');
INSERT INTO `wd_sys_operation_log` VALUES ('356', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:38', '2023-09-11 14:22:38');
INSERT INTO `wd_sys_operation_log` VALUES ('357', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:38', '2023-09-11 14:22:38');
INSERT INTO `wd_sys_operation_log` VALUES ('358', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:22:38', '2023-09-11 14:22:38');
INSERT INTO `wd_sys_operation_log` VALUES ('359', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:38', '2023-09-11 14:22:38');
INSERT INTO `wd_sys_operation_log` VALUES ('360', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:38', '2023-09-11 14:22:38');
INSERT INTO `wd_sys_operation_log` VALUES ('361', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:22:39', '2023-09-11 14:22:39');
INSERT INTO `wd_sys_operation_log` VALUES ('362', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:39', '2023-09-11 14:22:39');
INSERT INTO `wd_sys_operation_log` VALUES ('363', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:39', '2023-09-11 14:22:39');
INSERT INTO `wd_sys_operation_log` VALUES ('364', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:39', '2023-09-11 14:22:39');
INSERT INTO `wd_sys_operation_log` VALUES ('365', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:22:39', '2023-09-11 14:22:39');
INSERT INTO `wd_sys_operation_log` VALUES ('366', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:22:39', '2023-09-11 14:22:39');
INSERT INTO `wd_sys_operation_log` VALUES ('367', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:22:39', '2023-09-11 14:22:39');
INSERT INTO `wd_sys_operation_log` VALUES ('368', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:22:39', '2023-09-11 14:22:39');
INSERT INTO `wd_sys_operation_log` VALUES ('369', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:22:39', '2023-09-11 14:22:39');
INSERT INTO `wd_sys_operation_log` VALUES ('370', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:39', '2023-09-11 14:22:39');
INSERT INTO `wd_sys_operation_log` VALUES ('371', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:22:39', '2023-09-11 14:22:39');
INSERT INTO `wd_sys_operation_log` VALUES ('372', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', '江西省-萍乡市', '1', '\0', '2023-09-11 14:22:39', '2023-09-11 14:22:39');
INSERT INTO `wd_sys_operation_log` VALUES ('373', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:22:39', '2023-09-11 14:22:39');
INSERT INTO `wd_sys_operation_log` VALUES ('374', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:22:40', '2023-09-11 14:22:40');
INSERT INTO `wd_sys_operation_log` VALUES ('375', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:40', '2023-09-11 14:22:40');
INSERT INTO `wd_sys_operation_log` VALUES ('376', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:22:40', '2023-09-11 14:22:40');
INSERT INTO `wd_sys_operation_log` VALUES ('377', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:22:40', '2023-09-11 14:22:40');
INSERT INTO `wd_sys_operation_log` VALUES ('378', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:22:40', '2023-09-11 14:22:40');
INSERT INTO `wd_sys_operation_log` VALUES ('379', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:40', '2023-09-11 14:22:40');
INSERT INTO `wd_sys_operation_log` VALUES ('380', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:40', '2023-09-11 14:22:40');
INSERT INTO `wd_sys_operation_log` VALUES ('381', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:40', '2023-09-11 14:22:40');
INSERT INTO `wd_sys_operation_log` VALUES ('382', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:22:40', '2023-09-11 14:22:40');
INSERT INTO `wd_sys_operation_log` VALUES ('383', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', '江西省-萍乡市', '1', '\0', '2023-09-11 14:22:40', '2023-09-11 14:22:40');
INSERT INTO `wd_sys_operation_log` VALUES ('384', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:22:40', '2023-09-11 14:22:40');
INSERT INTO `wd_sys_operation_log` VALUES ('385', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:40', '2023-09-11 14:22:40');
INSERT INTO `wd_sys_operation_log` VALUES ('386', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:22:40', '2023-09-11 14:22:40');
INSERT INTO `wd_sys_operation_log` VALUES ('387', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:40', '2023-09-11 14:22:40');
INSERT INTO `wd_sys_operation_log` VALUES ('388', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:41', '2023-09-11 14:22:41');
INSERT INTO `wd_sys_operation_log` VALUES ('389', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:41', '2023-09-11 14:22:41');
INSERT INTO `wd_sys_operation_log` VALUES ('390', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:22:41', '2023-09-11 14:22:41');
INSERT INTO `wd_sys_operation_log` VALUES ('391', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', '江西省-萍乡市', '1', '\0', '2023-09-11 14:22:41', '2023-09-11 14:22:41');
INSERT INTO `wd_sys_operation_log` VALUES ('392', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:22:41', '2023-09-11 14:22:41');
INSERT INTO `wd_sys_operation_log` VALUES ('393', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:41', '2023-09-11 14:22:41');
INSERT INTO `wd_sys_operation_log` VALUES ('394', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:41', '2023-09-11 14:22:41');
INSERT INTO `wd_sys_operation_log` VALUES ('395', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:41', '2023-09-11 14:22:41');
INSERT INTO `wd_sys_operation_log` VALUES ('396', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', '江西省-萍乡市', '1', '\0', '2023-09-11 14:22:41', '2023-09-11 14:22:41');
INSERT INTO `wd_sys_operation_log` VALUES ('397', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:22:41', '2023-09-11 14:22:41');
INSERT INTO `wd_sys_operation_log` VALUES ('398', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', '江西省-萍乡市', '1', '\0', '2023-09-11 14:22:42', '2023-09-11 14:22:42');
INSERT INTO `wd_sys_operation_log` VALUES ('399', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:42', '2023-09-11 14:22:42');
INSERT INTO `wd_sys_operation_log` VALUES ('400', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:42', '2023-09-11 14:22:42');
INSERT INTO `wd_sys_operation_log` VALUES ('401', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:22:42', '2023-09-11 14:22:42');
INSERT INTO `wd_sys_operation_log` VALUES ('402', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:22:42', '2023-09-11 14:22:42');
INSERT INTO `wd_sys_operation_log` VALUES ('403', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:42', '2023-09-11 14:22:42');
INSERT INTO `wd_sys_operation_log` VALUES ('404', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:22:42', '2023-09-11 14:22:42');
INSERT INTO `wd_sys_operation_log` VALUES ('405', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:22:42', '2023-09-11 14:22:42');
INSERT INTO `wd_sys_operation_log` VALUES ('406', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:22:42', '2023-09-11 14:22:42');
INSERT INTO `wd_sys_operation_log` VALUES ('407', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:42', '2023-09-11 14:22:42');
INSERT INTO `wd_sys_operation_log` VALUES ('408', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:42', '2023-09-11 14:22:42');
INSERT INTO `wd_sys_operation_log` VALUES ('409', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:42', '2023-09-11 14:22:42');
INSERT INTO `wd_sys_operation_log` VALUES ('410', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:42', '2023-09-11 14:22:42');
INSERT INTO `wd_sys_operation_log` VALUES ('411', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:42', '2023-09-11 14:22:42');
INSERT INTO `wd_sys_operation_log` VALUES ('412', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', '江西省-萍乡市', '1', '\0', '2023-09-11 14:22:42', '2023-09-11 14:22:42');
INSERT INTO `wd_sys_operation_log` VALUES ('413', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:42', '2023-09-11 14:22:42');
INSERT INTO `wd_sys_operation_log` VALUES ('414', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:42', '2023-09-11 14:22:42');
INSERT INTO `wd_sys_operation_log` VALUES ('415', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:22:42', '2023-09-11 14:22:42');
INSERT INTO `wd_sys_operation_log` VALUES ('416', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:43', '2023-09-11 14:22:43');
INSERT INTO `wd_sys_operation_log` VALUES ('417', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:43', '2023-09-11 14:22:43');
INSERT INTO `wd_sys_operation_log` VALUES ('418', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:22:43', '2023-09-11 14:22:43');
INSERT INTO `wd_sys_operation_log` VALUES ('419', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', '江西省-萍乡市', '1', '\0', '2023-09-11 14:22:43', '2023-09-11 14:22:43');
INSERT INTO `wd_sys_operation_log` VALUES ('420', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:43', '2023-09-11 14:22:43');
INSERT INTO `wd_sys_operation_log` VALUES ('421', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:22:43', '2023-09-11 14:22:43');
INSERT INTO `wd_sys_operation_log` VALUES ('422', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:43', '2023-09-11 14:22:43');
INSERT INTO `wd_sys_operation_log` VALUES ('423', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:22:43', '2023-09-11 14:22:43');
INSERT INTO `wd_sys_operation_log` VALUES ('424', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:43', '2023-09-11 14:22:43');
INSERT INTO `wd_sys_operation_log` VALUES ('425', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:22:43', '2023-09-11 14:22:43');
INSERT INTO `wd_sys_operation_log` VALUES ('426', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:22:43', '2023-09-11 14:22:43');
INSERT INTO `wd_sys_operation_log` VALUES ('427', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:22:43', '2023-09-11 14:22:43');
INSERT INTO `wd_sys_operation_log` VALUES ('428', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:22:43', '2023-09-11 14:22:43');
INSERT INTO `wd_sys_operation_log` VALUES ('429', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:43', '2023-09-11 14:22:43');
INSERT INTO `wd_sys_operation_log` VALUES ('430', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:43', '2023-09-11 14:22:43');
INSERT INTO `wd_sys_operation_log` VALUES ('431', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:22:44', '2023-09-11 14:22:44');
INSERT INTO `wd_sys_operation_log` VALUES ('432', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:44', '2023-09-11 14:22:44');
INSERT INTO `wd_sys_operation_log` VALUES ('433', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:44', '2023-09-11 14:22:44');
INSERT INTO `wd_sys_operation_log` VALUES ('434', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:44', '2023-09-11 14:22:44');
INSERT INTO `wd_sys_operation_log` VALUES ('435', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:44', '2023-09-11 14:22:44');
INSERT INTO `wd_sys_operation_log` VALUES ('436', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:44', '2023-09-11 14:22:44');
INSERT INTO `wd_sys_operation_log` VALUES ('437', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:44', '2023-09-11 14:22:44');
INSERT INTO `wd_sys_operation_log` VALUES ('438', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:22:44', '2023-09-11 14:22:44');
INSERT INTO `wd_sys_operation_log` VALUES ('439', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:44', '2023-09-11 14:22:44');
INSERT INTO `wd_sys_operation_log` VALUES ('440', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:44', '2023-09-11 14:22:44');
INSERT INTO `wd_sys_operation_log` VALUES ('441', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:44', '2023-09-11 14:22:44');
INSERT INTO `wd_sys_operation_log` VALUES ('442', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:44', '2023-09-11 14:22:44');
INSERT INTO `wd_sys_operation_log` VALUES ('443', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:44', '2023-09-11 14:22:44');
INSERT INTO `wd_sys_operation_log` VALUES ('444', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:44', '2023-09-11 14:22:44');
INSERT INTO `wd_sys_operation_log` VALUES ('445', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:44', '2023-09-11 14:22:44');
INSERT INTO `wd_sys_operation_log` VALUES ('446', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:45', '2023-09-11 14:22:45');
INSERT INTO `wd_sys_operation_log` VALUES ('447', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:45', '2023-09-11 14:22:45');
INSERT INTO `wd_sys_operation_log` VALUES ('448', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:45', '2023-09-11 14:22:45');
INSERT INTO `wd_sys_operation_log` VALUES ('449', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:45', '2023-09-11 14:22:45');
INSERT INTO `wd_sys_operation_log` VALUES ('450', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:45', '2023-09-11 14:22:45');
INSERT INTO `wd_sys_operation_log` VALUES ('451', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:45', '2023-09-11 14:22:45');
INSERT INTO `wd_sys_operation_log` VALUES ('452', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:45', '2023-09-11 14:22:45');
INSERT INTO `wd_sys_operation_log` VALUES ('453', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:45', '2023-09-11 14:22:45');
INSERT INTO `wd_sys_operation_log` VALUES ('454', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:45', '2023-09-11 14:22:45');
INSERT INTO `wd_sys_operation_log` VALUES ('455', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:45', '2023-09-11 14:22:45');
INSERT INTO `wd_sys_operation_log` VALUES ('456', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:45', '2023-09-11 14:22:45');
INSERT INTO `wd_sys_operation_log` VALUES ('457', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:45', '2023-09-11 14:22:45');
INSERT INTO `wd_sys_operation_log` VALUES ('458', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:46', '2023-09-11 14:22:46');
INSERT INTO `wd_sys_operation_log` VALUES ('459', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:46', '2023-09-11 14:22:46');
INSERT INTO `wd_sys_operation_log` VALUES ('460', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:46', '2023-09-11 14:22:46');
INSERT INTO `wd_sys_operation_log` VALUES ('461', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:46', '2023-09-11 14:22:46');
INSERT INTO `wd_sys_operation_log` VALUES ('462', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:46', '2023-09-11 14:22:46');
INSERT INTO `wd_sys_operation_log` VALUES ('463', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:46', '2023-09-11 14:22:46');
INSERT INTO `wd_sys_operation_log` VALUES ('464', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:46', '2023-09-11 14:22:46');
INSERT INTO `wd_sys_operation_log` VALUES ('465', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:46', '2023-09-11 14:22:46');
INSERT INTO `wd_sys_operation_log` VALUES ('466', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:46', '2023-09-11 14:22:46');
INSERT INTO `wd_sys_operation_log` VALUES ('467', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:46', '2023-09-11 14:22:46');
INSERT INTO `wd_sys_operation_log` VALUES ('468', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:46', '2023-09-11 14:22:46');
INSERT INTO `wd_sys_operation_log` VALUES ('469', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:46', '2023-09-11 14:22:46');
INSERT INTO `wd_sys_operation_log` VALUES ('470', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:46', '2023-09-11 14:22:46');
INSERT INTO `wd_sys_operation_log` VALUES ('471', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:46', '2023-09-11 14:22:46');
INSERT INTO `wd_sys_operation_log` VALUES ('472', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:47', '2023-09-11 14:22:47');
INSERT INTO `wd_sys_operation_log` VALUES ('473', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:47', '2023-09-11 14:22:47');
INSERT INTO `wd_sys_operation_log` VALUES ('474', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:47', '2023-09-11 14:22:47');
INSERT INTO `wd_sys_operation_log` VALUES ('475', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:47', '2023-09-11 14:22:47');
INSERT INTO `wd_sys_operation_log` VALUES ('476', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:47', '2023-09-11 14:22:47');
INSERT INTO `wd_sys_operation_log` VALUES ('477', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:47', '2023-09-11 14:22:47');
INSERT INTO `wd_sys_operation_log` VALUES ('478', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:47', '2023-09-11 14:22:47');
INSERT INTO `wd_sys_operation_log` VALUES ('479', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:47', '2023-09-11 14:22:47');
INSERT INTO `wd_sys_operation_log` VALUES ('480', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:47', '2023-09-11 14:22:47');
INSERT INTO `wd_sys_operation_log` VALUES ('481', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:47', '2023-09-11 14:22:47');
INSERT INTO `wd_sys_operation_log` VALUES ('482', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:47', '2023-09-11 14:22:47');
INSERT INTO `wd_sys_operation_log` VALUES ('483', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:47', '2023-09-11 14:22:47');
INSERT INTO `wd_sys_operation_log` VALUES ('484', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:47', '2023-09-11 14:22:47');
INSERT INTO `wd_sys_operation_log` VALUES ('485', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:48', '2023-09-11 14:22:48');
INSERT INTO `wd_sys_operation_log` VALUES ('486', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:48', '2023-09-11 14:22:48');
INSERT INTO `wd_sys_operation_log` VALUES ('487', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:48', '2023-09-11 14:22:48');
INSERT INTO `wd_sys_operation_log` VALUES ('488', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:48', '2023-09-11 14:22:48');
INSERT INTO `wd_sys_operation_log` VALUES ('489', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:48', '2023-09-11 14:22:48');
INSERT INTO `wd_sys_operation_log` VALUES ('490', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:48', '2023-09-11 14:22:48');
INSERT INTO `wd_sys_operation_log` VALUES ('491', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:48', '2023-09-11 14:22:48');
INSERT INTO `wd_sys_operation_log` VALUES ('492', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:48', '2023-09-11 14:22:48');
INSERT INTO `wd_sys_operation_log` VALUES ('493', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:48', '2023-09-11 14:22:48');
INSERT INTO `wd_sys_operation_log` VALUES ('494', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:48', '2023-09-11 14:22:48');
INSERT INTO `wd_sys_operation_log` VALUES ('495', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:48', '2023-09-11 14:22:48');
INSERT INTO `wd_sys_operation_log` VALUES ('496', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:48', '2023-09-11 14:22:48');
INSERT INTO `wd_sys_operation_log` VALUES ('497', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:48', '2023-09-11 14:22:48');
INSERT INTO `wd_sys_operation_log` VALUES ('498', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:48', '2023-09-11 14:22:48');
INSERT INTO `wd_sys_operation_log` VALUES ('499', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:49', '2023-09-11 14:22:49');
INSERT INTO `wd_sys_operation_log` VALUES ('500', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:49', '2023-09-11 14:22:49');
INSERT INTO `wd_sys_operation_log` VALUES ('501', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:49', '2023-09-11 14:22:49');
INSERT INTO `wd_sys_operation_log` VALUES ('502', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:49', '2023-09-11 14:22:49');
INSERT INTO `wd_sys_operation_log` VALUES ('503', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:49', '2023-09-11 14:22:49');
INSERT INTO `wd_sys_operation_log` VALUES ('504', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:49', '2023-09-11 14:22:49');
INSERT INTO `wd_sys_operation_log` VALUES ('505', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:49', '2023-09-11 14:22:49');
INSERT INTO `wd_sys_operation_log` VALUES ('506', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:49', '2023-09-11 14:22:49');
INSERT INTO `wd_sys_operation_log` VALUES ('507', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:49', '2023-09-11 14:22:49');
INSERT INTO `wd_sys_operation_log` VALUES ('508', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:49', '2023-09-11 14:22:49');
INSERT INTO `wd_sys_operation_log` VALUES ('509', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:49', '2023-09-11 14:22:49');
INSERT INTO `wd_sys_operation_log` VALUES ('510', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:49', '2023-09-11 14:22:49');
INSERT INTO `wd_sys_operation_log` VALUES ('511', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:49', '2023-09-11 14:22:49');
INSERT INTO `wd_sys_operation_log` VALUES ('512', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:49', '2023-09-11 14:22:49');
INSERT INTO `wd_sys_operation_log` VALUES ('513', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:49', '2023-09-11 14:22:49');
INSERT INTO `wd_sys_operation_log` VALUES ('514', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:50', '2023-09-11 14:22:50');
INSERT INTO `wd_sys_operation_log` VALUES ('515', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:50', '2023-09-11 14:22:50');
INSERT INTO `wd_sys_operation_log` VALUES ('516', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:50', '2023-09-11 14:22:50');
INSERT INTO `wd_sys_operation_log` VALUES ('517', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:50', '2023-09-11 14:22:50');
INSERT INTO `wd_sys_operation_log` VALUES ('518', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:50', '2023-09-11 14:22:50');
INSERT INTO `wd_sys_operation_log` VALUES ('519', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:50', '2023-09-11 14:22:50');
INSERT INTO `wd_sys_operation_log` VALUES ('520', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:50', '2023-09-11 14:22:50');
INSERT INTO `wd_sys_operation_log` VALUES ('521', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:50', '2023-09-11 14:22:50');
INSERT INTO `wd_sys_operation_log` VALUES ('522', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:50', '2023-09-11 14:22:50');
INSERT INTO `wd_sys_operation_log` VALUES ('523', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:50', '2023-09-11 14:22:50');
INSERT INTO `wd_sys_operation_log` VALUES ('524', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:50', '2023-09-11 14:22:50');
INSERT INTO `wd_sys_operation_log` VALUES ('525', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:50', '2023-09-11 14:22:50');
INSERT INTO `wd_sys_operation_log` VALUES ('526', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:50', '2023-09-11 14:22:50');
INSERT INTO `wd_sys_operation_log` VALUES ('527', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:51', '2023-09-11 14:22:51');
INSERT INTO `wd_sys_operation_log` VALUES ('528', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:51', '2023-09-11 14:22:51');
INSERT INTO `wd_sys_operation_log` VALUES ('529', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:51', '2023-09-11 14:22:51');
INSERT INTO `wd_sys_operation_log` VALUES ('530', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:51', '2023-09-11 14:22:51');
INSERT INTO `wd_sys_operation_log` VALUES ('531', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:51', '2023-09-11 14:22:51');
INSERT INTO `wd_sys_operation_log` VALUES ('532', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:51', '2023-09-11 14:22:51');
INSERT INTO `wd_sys_operation_log` VALUES ('533', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:51', '2023-09-11 14:22:51');
INSERT INTO `wd_sys_operation_log` VALUES ('534', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:51', '2023-09-11 14:22:51');
INSERT INTO `wd_sys_operation_log` VALUES ('535', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:51', '2023-09-11 14:22:51');
INSERT INTO `wd_sys_operation_log` VALUES ('536', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:51', '2023-09-11 14:22:51');
INSERT INTO `wd_sys_operation_log` VALUES ('537', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:51', '2023-09-11 14:22:51');
INSERT INTO `wd_sys_operation_log` VALUES ('538', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:51', '2023-09-11 14:22:51');
INSERT INTO `wd_sys_operation_log` VALUES ('539', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:51', '2023-09-11 14:22:51');
INSERT INTO `wd_sys_operation_log` VALUES ('540', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:51', '2023-09-11 14:22:51');
INSERT INTO `wd_sys_operation_log` VALUES ('541', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:51', '2023-09-11 14:22:51');
INSERT INTO `wd_sys_operation_log` VALUES ('542', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:51', '2023-09-11 14:22:51');
INSERT INTO `wd_sys_operation_log` VALUES ('543', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:52', '2023-09-11 14:22:52');
INSERT INTO `wd_sys_operation_log` VALUES ('544', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:52', '2023-09-11 14:22:52');
INSERT INTO `wd_sys_operation_log` VALUES ('545', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:52', '2023-09-11 14:22:52');
INSERT INTO `wd_sys_operation_log` VALUES ('546', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:52', '2023-09-11 14:22:52');
INSERT INTO `wd_sys_operation_log` VALUES ('547', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:52', '2023-09-11 14:22:52');
INSERT INTO `wd_sys_operation_log` VALUES ('548', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:52', '2023-09-11 14:22:52');
INSERT INTO `wd_sys_operation_log` VALUES ('549', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:52', '2023-09-11 14:22:52');
INSERT INTO `wd_sys_operation_log` VALUES ('550', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:52', '2023-09-11 14:22:52');
INSERT INTO `wd_sys_operation_log` VALUES ('551', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:52', '2023-09-11 14:22:52');
INSERT INTO `wd_sys_operation_log` VALUES ('552', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:52', '2023-09-11 14:22:52');
INSERT INTO `wd_sys_operation_log` VALUES ('553', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:52', '2023-09-11 14:22:52');
INSERT INTO `wd_sys_operation_log` VALUES ('554', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:53', '2023-09-11 14:22:53');
INSERT INTO `wd_sys_operation_log` VALUES ('555', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:53', '2023-09-11 14:22:53');
INSERT INTO `wd_sys_operation_log` VALUES ('556', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:53', '2023-09-11 14:22:53');
INSERT INTO `wd_sys_operation_log` VALUES ('557', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:53', '2023-09-11 14:22:53');
INSERT INTO `wd_sys_operation_log` VALUES ('558', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:53', '2023-09-11 14:22:53');
INSERT INTO `wd_sys_operation_log` VALUES ('559', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:53', '2023-09-11 14:22:53');
INSERT INTO `wd_sys_operation_log` VALUES ('560', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:53', '2023-09-11 14:22:53');
INSERT INTO `wd_sys_operation_log` VALUES ('561', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:53', '2023-09-11 14:22:53');
INSERT INTO `wd_sys_operation_log` VALUES ('562', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:53', '2023-09-11 14:22:53');
INSERT INTO `wd_sys_operation_log` VALUES ('563', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:53', '2023-09-11 14:22:53');
INSERT INTO `wd_sys_operation_log` VALUES ('564', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:53', '2023-09-11 14:22:53');
INSERT INTO `wd_sys_operation_log` VALUES ('565', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:53', '2023-09-11 14:22:53');
INSERT INTO `wd_sys_operation_log` VALUES ('566', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:53', '2023-09-11 14:22:53');
INSERT INTO `wd_sys_operation_log` VALUES ('567', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:53', '2023-09-11 14:22:53');
INSERT INTO `wd_sys_operation_log` VALUES ('568', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:54', '2023-09-11 14:22:54');
INSERT INTO `wd_sys_operation_log` VALUES ('569', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:54', '2023-09-11 14:22:54');
INSERT INTO `wd_sys_operation_log` VALUES ('570', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:54', '2023-09-11 14:22:54');
INSERT INTO `wd_sys_operation_log` VALUES ('571', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:54', '2023-09-11 14:22:54');
INSERT INTO `wd_sys_operation_log` VALUES ('572', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:54', '2023-09-11 14:22:54');
INSERT INTO `wd_sys_operation_log` VALUES ('573', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:54', '2023-09-11 14:22:54');
INSERT INTO `wd_sys_operation_log` VALUES ('574', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:54', '2023-09-11 14:22:54');
INSERT INTO `wd_sys_operation_log` VALUES ('575', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:54', '2023-09-11 14:22:54');
INSERT INTO `wd_sys_operation_log` VALUES ('576', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:54', '2023-09-11 14:22:54');
INSERT INTO `wd_sys_operation_log` VALUES ('577', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:54', '2023-09-11 14:22:54');
INSERT INTO `wd_sys_operation_log` VALUES ('578', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:54', '2023-09-11 14:22:54');
INSERT INTO `wd_sys_operation_log` VALUES ('579', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:54', '2023-09-11 14:22:54');
INSERT INTO `wd_sys_operation_log` VALUES ('580', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:54', '2023-09-11 14:22:54');
INSERT INTO `wd_sys_operation_log` VALUES ('581', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', null, '3', '\0', '2023-09-11 14:22:54', '2023-09-11 14:22:54');
INSERT INTO `wd_sys_operation_log` VALUES ('582', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:54', '2023-09-11 14:22:54');
INSERT INTO `wd_sys_operation_log` VALUES ('583', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '182.105.6.161', '江西省-萍乡市', '3', '\0', '2023-09-11 14:22:54', '2023-09-11 14:22:54');
INSERT INTO `wd_sys_operation_log` VALUES ('584', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:55', '2023-09-11 14:22:55');
INSERT INTO `wd_sys_operation_log` VALUES ('585', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:55', '2023-09-11 14:22:55');
INSERT INTO `wd_sys_operation_log` VALUES ('586', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:55', '2023-09-11 14:22:55');
INSERT INTO `wd_sys_operation_log` VALUES ('587', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:55', '2023-09-11 14:22:55');
INSERT INTO `wd_sys_operation_log` VALUES ('588', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:55', '2023-09-11 14:22:55');
INSERT INTO `wd_sys_operation_log` VALUES ('589', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:55', '2023-09-11 14:22:55');
INSERT INTO `wd_sys_operation_log` VALUES ('590', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:55', '2023-09-11 14:22:55');
INSERT INTO `wd_sys_operation_log` VALUES ('591', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:55', '2023-09-11 14:22:55');
INSERT INTO `wd_sys_operation_log` VALUES ('592', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:55', '2023-09-11 14:22:55');
INSERT INTO `wd_sys_operation_log` VALUES ('593', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:55', '2023-09-11 14:22:55');
INSERT INTO `wd_sys_operation_log` VALUES ('594', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:55', '2023-09-11 14:22:55');
INSERT INTO `wd_sys_operation_log` VALUES ('595', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:55', '2023-09-11 14:22:55');
INSERT INTO `wd_sys_operation_log` VALUES ('596', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:55', '2023-09-11 14:22:55');
INSERT INTO `wd_sys_operation_log` VALUES ('597', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:55', '2023-09-11 14:22:55');
INSERT INTO `wd_sys_operation_log` VALUES ('598', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:55', '2023-09-11 14:22:55');
INSERT INTO `wd_sys_operation_log` VALUES ('599', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:55', '2023-09-11 14:22:55');
INSERT INTO `wd_sys_operation_log` VALUES ('600', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:55', '2023-09-11 14:22:55');
INSERT INTO `wd_sys_operation_log` VALUES ('601', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:56', '2023-09-11 14:22:56');
INSERT INTO `wd_sys_operation_log` VALUES ('602', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:56', '2023-09-11 14:22:56');
INSERT INTO `wd_sys_operation_log` VALUES ('603', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:56', '2023-09-11 14:22:56');
INSERT INTO `wd_sys_operation_log` VALUES ('604', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:22:56', '2023-09-11 14:22:56');
INSERT INTO `wd_sys_operation_log` VALUES ('605', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:56', '2023-09-11 14:22:56');
INSERT INTO `wd_sys_operation_log` VALUES ('606', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:56', '2023-09-11 14:22:56');
INSERT INTO `wd_sys_operation_log` VALUES ('607', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:56', '2023-09-11 14:22:56');
INSERT INTO `wd_sys_operation_log` VALUES ('608', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:56', '2023-09-11 14:22:56');
INSERT INTO `wd_sys_operation_log` VALUES ('609', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:56', '2023-09-11 14:22:56');
INSERT INTO `wd_sys_operation_log` VALUES ('610', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:22:56', '2023-09-11 14:22:56');
INSERT INTO `wd_sys_operation_log` VALUES ('611', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:56', '2023-09-11 14:22:56');
INSERT INTO `wd_sys_operation_log` VALUES ('612', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:56', '2023-09-11 14:22:56');
INSERT INTO `wd_sys_operation_log` VALUES ('613', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:56', '2023-09-11 14:22:56');
INSERT INTO `wd_sys_operation_log` VALUES ('614', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:56', '2023-09-11 14:22:56');
INSERT INTO `wd_sys_operation_log` VALUES ('615', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:57', '2023-09-11 14:22:57');
INSERT INTO `wd_sys_operation_log` VALUES ('616', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:57', '2023-09-11 14:22:57');
INSERT INTO `wd_sys_operation_log` VALUES ('617', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:22:57', '2023-09-11 14:22:57');
INSERT INTO `wd_sys_operation_log` VALUES ('618', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:57', '2023-09-11 14:22:57');
INSERT INTO `wd_sys_operation_log` VALUES ('619', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:57', '2023-09-11 14:22:57');
INSERT INTO `wd_sys_operation_log` VALUES ('620', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:57', '2023-09-11 14:22:57');
INSERT INTO `wd_sys_operation_log` VALUES ('621', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:22:57', '2023-09-11 14:22:57');
INSERT INTO `wd_sys_operation_log` VALUES ('622', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:22:57', '2023-09-11 14:22:57');
INSERT INTO `wd_sys_operation_log` VALUES ('623', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:57', '2023-09-11 14:22:57');
INSERT INTO `wd_sys_operation_log` VALUES ('624', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:57', '2023-09-11 14:22:57');
INSERT INTO `wd_sys_operation_log` VALUES ('625', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:58', '2023-09-11 14:22:58');
INSERT INTO `wd_sys_operation_log` VALUES ('626', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:58', '2023-09-11 14:22:58');
INSERT INTO `wd_sys_operation_log` VALUES ('627', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:58', '2023-09-11 14:22:58');
INSERT INTO `wd_sys_operation_log` VALUES ('628', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:58', '2023-09-11 14:22:58');
INSERT INTO `wd_sys_operation_log` VALUES ('629', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:58', '2023-09-11 14:22:58');
INSERT INTO `wd_sys_operation_log` VALUES ('630', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:58', '2023-09-11 14:22:58');
INSERT INTO `wd_sys_operation_log` VALUES ('631', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:58', '2023-09-11 14:22:58');
INSERT INTO `wd_sys_operation_log` VALUES ('632', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:58', '2023-09-11 14:22:58');
INSERT INTO `wd_sys_operation_log` VALUES ('633', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:58', '2023-09-11 14:22:58');
INSERT INTO `wd_sys_operation_log` VALUES ('634', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:58', '2023-09-11 14:22:58');
INSERT INTO `wd_sys_operation_log` VALUES ('635', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:22:58', '2023-09-11 14:22:58');
INSERT INTO `wd_sys_operation_log` VALUES ('636', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:58', '2023-09-11 14:22:58');
INSERT INTO `wd_sys_operation_log` VALUES ('637', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:58', '2023-09-11 14:22:58');
INSERT INTO `wd_sys_operation_log` VALUES ('638', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:58', '2023-09-11 14:22:58');
INSERT INTO `wd_sys_operation_log` VALUES ('639', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:59', '2023-09-11 14:22:59');
INSERT INTO `wd_sys_operation_log` VALUES ('640', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:59', '2023-09-11 14:22:59');
INSERT INTO `wd_sys_operation_log` VALUES ('641', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:59', '2023-09-11 14:22:59');
INSERT INTO `wd_sys_operation_log` VALUES ('642', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:22:59', '2023-09-11 14:22:59');
INSERT INTO `wd_sys_operation_log` VALUES ('643', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:59', '2023-09-11 14:22:59');
INSERT INTO `wd_sys_operation_log` VALUES ('644', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:59', '2023-09-11 14:22:59');
INSERT INTO `wd_sys_operation_log` VALUES ('645', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:59', '2023-09-11 14:22:59');
INSERT INTO `wd_sys_operation_log` VALUES ('646', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:59', '2023-09-11 14:22:59');
INSERT INTO `wd_sys_operation_log` VALUES ('647', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:22:59', '2023-09-11 14:22:59');
INSERT INTO `wd_sys_operation_log` VALUES ('648', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:22:59', '2023-09-11 14:22:59');
INSERT INTO `wd_sys_operation_log` VALUES ('649', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:59', '2023-09-11 14:22:59');
INSERT INTO `wd_sys_operation_log` VALUES ('650', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:59', '2023-09-11 14:22:59');
INSERT INTO `wd_sys_operation_log` VALUES ('651', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:22:59', '2023-09-11 14:22:59');
INSERT INTO `wd_sys_operation_log` VALUES ('652', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:22:59', '2023-09-11 14:22:59');
INSERT INTO `wd_sys_operation_log` VALUES ('653', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:00', '2023-09-11 14:23:00');
INSERT INTO `wd_sys_operation_log` VALUES ('654', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:23:00', '2023-09-11 14:23:00');
INSERT INTO `wd_sys_operation_log` VALUES ('655', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:23:00', '2023-09-11 14:23:00');
INSERT INTO `wd_sys_operation_log` VALUES ('656', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:23:00', '2023-09-11 14:23:00');
INSERT INTO `wd_sys_operation_log` VALUES ('657', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', '江西省-萍乡市', '2', '\0', '2023-09-11 14:23:00', '2023-09-11 14:23:00');
INSERT INTO `wd_sys_operation_log` VALUES ('658', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:00', '2023-09-11 14:23:00');
INSERT INTO `wd_sys_operation_log` VALUES ('659', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:23:00', '2023-09-11 14:23:00');
INSERT INTO `wd_sys_operation_log` VALUES ('660', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:00', '2023-09-11 14:23:00');
INSERT INTO `wd_sys_operation_log` VALUES ('661', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:23:00', '2023-09-11 14:23:00');
INSERT INTO `wd_sys_operation_log` VALUES ('662', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:23:00', '2023-09-11 14:23:00');
INSERT INTO `wd_sys_operation_log` VALUES ('663', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[2]]', '182.105.6.161', null, '2', '\0', '2023-09-11 14:23:00', '2023-09-11 14:23:00');
INSERT INTO `wd_sys_operation_log` VALUES ('664', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:23:00', '2023-09-11 14:23:00');
INSERT INTO `wd_sys_operation_log` VALUES ('665', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:23:00', '2023-09-11 14:23:00');
INSERT INTO `wd_sys_operation_log` VALUES ('666', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:23:00', '2023-09-11 14:23:00');
INSERT INTO `wd_sys_operation_log` VALUES ('667', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:23:01', '2023-09-11 14:23:01');
INSERT INTO `wd_sys_operation_log` VALUES ('668', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:01', '2023-09-11 14:23:01');
INSERT INTO `wd_sys_operation_log` VALUES ('669', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:23:01', '2023-09-11 14:23:01');
INSERT INTO `wd_sys_operation_log` VALUES ('670', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:23:01', '2023-09-11 14:23:01');
INSERT INTO `wd_sys_operation_log` VALUES ('671', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:23:01', '2023-09-11 14:23:01');
INSERT INTO `wd_sys_operation_log` VALUES ('672', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:01', '2023-09-11 14:23:01');
INSERT INTO `wd_sys_operation_log` VALUES ('673', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:23:01', '2023-09-11 14:23:01');
INSERT INTO `wd_sys_operation_log` VALUES ('674', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:23:01', '2023-09-11 14:23:01');
INSERT INTO `wd_sys_operation_log` VALUES ('675', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:01', '2023-09-11 14:23:01');
INSERT INTO `wd_sys_operation_log` VALUES ('676', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:23:01', '2023-09-11 14:23:01');
INSERT INTO `wd_sys_operation_log` VALUES ('677', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:23:01', '2023-09-11 14:23:01');
INSERT INTO `wd_sys_operation_log` VALUES ('678', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:02', '2023-09-11 14:23:02');
INSERT INTO `wd_sys_operation_log` VALUES ('679', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:02', '2023-09-11 14:23:02');
INSERT INTO `wd_sys_operation_log` VALUES ('680', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:02', '2023-09-11 14:23:02');
INSERT INTO `wd_sys_operation_log` VALUES ('681', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:23:02', '2023-09-11 14:23:02');
INSERT INTO `wd_sys_operation_log` VALUES ('682', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:23:02', '2023-09-11 14:23:02');
INSERT INTO `wd_sys_operation_log` VALUES ('683', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:23:02', '2023-09-11 14:23:02');
INSERT INTO `wd_sys_operation_log` VALUES ('684', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:23:02', '2023-09-11 14:23:02');
INSERT INTO `wd_sys_operation_log` VALUES ('685', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:02', '2023-09-11 14:23:02');
INSERT INTO `wd_sys_operation_log` VALUES ('686', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:02', '2023-09-11 14:23:02');
INSERT INTO `wd_sys_operation_log` VALUES ('687', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:02', '2023-09-11 14:23:02');
INSERT INTO `wd_sys_operation_log` VALUES ('688', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:23:02', '2023-09-11 14:23:02');
INSERT INTO `wd_sys_operation_log` VALUES ('689', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:23:02', '2023-09-11 14:23:02');
INSERT INTO `wd_sys_operation_log` VALUES ('690', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:02', '2023-09-11 14:23:02');
INSERT INTO `wd_sys_operation_log` VALUES ('691', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:23:02', '2023-09-11 14:23:02');
INSERT INTO `wd_sys_operation_log` VALUES ('692', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:23:03', '2023-09-11 14:23:03');
INSERT INTO `wd_sys_operation_log` VALUES ('693', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:23:03', '2023-09-11 14:23:03');
INSERT INTO `wd_sys_operation_log` VALUES ('694', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:03', '2023-09-11 14:23:03');
INSERT INTO `wd_sys_operation_log` VALUES ('695', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:03', '2023-09-11 14:23:03');
INSERT INTO `wd_sys_operation_log` VALUES ('696', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:23:03', '2023-09-11 14:23:03');
INSERT INTO `wd_sys_operation_log` VALUES ('697', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:03', '2023-09-11 14:23:03');
INSERT INTO `wd_sys_operation_log` VALUES ('698', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:23:03', '2023-09-11 14:23:03');
INSERT INTO `wd_sys_operation_log` VALUES ('699', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:23:03', '2023-09-11 14:23:03');
INSERT INTO `wd_sys_operation_log` VALUES ('700', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:03', '2023-09-11 14:23:03');
INSERT INTO `wd_sys_operation_log` VALUES ('701', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:03', '2023-09-11 14:23:03');
INSERT INTO `wd_sys_operation_log` VALUES ('702', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:03', '2023-09-11 14:23:03');
INSERT INTO `wd_sys_operation_log` VALUES ('703', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:23:03', '2023-09-11 14:23:03');
INSERT INTO `wd_sys_operation_log` VALUES ('704', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', '江西省-萍乡市', '1', '\0', '2023-09-11 14:23:03', '2023-09-11 14:23:03');
INSERT INTO `wd_sys_operation_log` VALUES ('705', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:23:03', '2023-09-11 14:23:03');
INSERT INTO `wd_sys_operation_log` VALUES ('706', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:03', '2023-09-11 14:23:03');
INSERT INTO `wd_sys_operation_log` VALUES ('707', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:04', '2023-09-11 14:23:04');
INSERT INTO `wd_sys_operation_log` VALUES ('708', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:23:04', '2023-09-11 14:23:04');
INSERT INTO `wd_sys_operation_log` VALUES ('709', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:23:04', '2023-09-11 14:23:04');
INSERT INTO `wd_sys_operation_log` VALUES ('710', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:23:04', '2023-09-11 14:23:04');
INSERT INTO `wd_sys_operation_log` VALUES ('711', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:23:04', '2023-09-11 14:23:04');
INSERT INTO `wd_sys_operation_log` VALUES ('712', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', '江西省-萍乡市', '1', '\0', '2023-09-11 14:23:04', '2023-09-11 14:23:04');
INSERT INTO `wd_sys_operation_log` VALUES ('713', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:04', '2023-09-11 14:23:04');
INSERT INTO `wd_sys_operation_log` VALUES ('714', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:04', '2023-09-11 14:23:04');
INSERT INTO `wd_sys_operation_log` VALUES ('715', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:04', '2023-09-11 14:23:04');
INSERT INTO `wd_sys_operation_log` VALUES ('716', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:04', '2023-09-11 14:23:04');
INSERT INTO `wd_sys_operation_log` VALUES ('717', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:04', '2023-09-11 14:23:04');
INSERT INTO `wd_sys_operation_log` VALUES ('718', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:04', '2023-09-11 14:23:04');
INSERT INTO `wd_sys_operation_log` VALUES ('719', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', '江西省-萍乡市', '1', '\0', '2023-09-11 14:23:04', '2023-09-11 14:23:04');
INSERT INTO `wd_sys_operation_log` VALUES ('720', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:23:04', '2023-09-11 14:23:04');
INSERT INTO `wd_sys_operation_log` VALUES ('721', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:23:04', '2023-09-11 14:23:04');
INSERT INTO `wd_sys_operation_log` VALUES ('722', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:04', '2023-09-11 14:23:04');
INSERT INTO `wd_sys_operation_log` VALUES ('723', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:23:04', '2023-09-11 14:23:04');
INSERT INTO `wd_sys_operation_log` VALUES ('724', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:23:05', '2023-09-11 14:23:05');
INSERT INTO `wd_sys_operation_log` VALUES ('725', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:05', '2023-09-11 14:23:05');
INSERT INTO `wd_sys_operation_log` VALUES ('726', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:05', '2023-09-11 14:23:05');
INSERT INTO `wd_sys_operation_log` VALUES ('727', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:23:05', '2023-09-11 14:23:05');
INSERT INTO `wd_sys_operation_log` VALUES ('728', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:23:05', '2023-09-11 14:23:05');
INSERT INTO `wd_sys_operation_log` VALUES ('729', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:23:05', '2023-09-11 14:23:05');
INSERT INTO `wd_sys_operation_log` VALUES ('730', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:23:05', '2023-09-11 14:23:05');
INSERT INTO `wd_sys_operation_log` VALUES ('731', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:05', '2023-09-11 14:23:05');
INSERT INTO `wd_sys_operation_log` VALUES ('732', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:05', '2023-09-11 14:23:05');
INSERT INTO `wd_sys_operation_log` VALUES ('733', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:05', '2023-09-11 14:23:05');
INSERT INTO `wd_sys_operation_log` VALUES ('734', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:05', '2023-09-11 14:23:05');
INSERT INTO `wd_sys_operation_log` VALUES ('735', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:23:05', '2023-09-11 14:23:05');
INSERT INTO `wd_sys_operation_log` VALUES ('736', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:05', '2023-09-11 14:23:05');
INSERT INTO `wd_sys_operation_log` VALUES ('737', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:23:05', '2023-09-11 14:23:05');
INSERT INTO `wd_sys_operation_log` VALUES ('738', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', '江西省-萍乡市', '1', '\0', '2023-09-11 14:23:05', '2023-09-11 14:23:05');
INSERT INTO `wd_sys_operation_log` VALUES ('739', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:23:05', '2023-09-11 14:23:05');
INSERT INTO `wd_sys_operation_log` VALUES ('740', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:23:06', '2023-09-11 14:23:06');
INSERT INTO `wd_sys_operation_log` VALUES ('741', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:23:06', '2023-09-11 14:23:06');
INSERT INTO `wd_sys_operation_log` VALUES ('742', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:06', '2023-09-11 14:23:06');
INSERT INTO `wd_sys_operation_log` VALUES ('743', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:23:06', '2023-09-11 14:23:06');
INSERT INTO `wd_sys_operation_log` VALUES ('744', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:06', '2023-09-11 14:23:06');
INSERT INTO `wd_sys_operation_log` VALUES ('745', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:23:06', '2023-09-11 14:23:06');
INSERT INTO `wd_sys_operation_log` VALUES ('746', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:06', '2023-09-11 14:23:06');
INSERT INTO `wd_sys_operation_log` VALUES ('747', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:06', '2023-09-11 14:23:06');
INSERT INTO `wd_sys_operation_log` VALUES ('748', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:06', '2023-09-11 14:23:06');
INSERT INTO `wd_sys_operation_log` VALUES ('749', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:23:06', '2023-09-11 14:23:06');
INSERT INTO `wd_sys_operation_log` VALUES ('750', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:23:06', '2023-09-11 14:23:06');
INSERT INTO `wd_sys_operation_log` VALUES ('751', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:23:06', '2023-09-11 14:23:06');
INSERT INTO `wd_sys_operation_log` VALUES ('752', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:06', '2023-09-11 14:23:06');
INSERT INTO `wd_sys_operation_log` VALUES ('753', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:06', '2023-09-11 14:23:06');
INSERT INTO `wd_sys_operation_log` VALUES ('754', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:07', '2023-09-11 14:23:07');
INSERT INTO `wd_sys_operation_log` VALUES ('755', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:07', '2023-09-11 14:23:07');
INSERT INTO `wd_sys_operation_log` VALUES ('756', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:23:07', '2023-09-11 14:23:07');
INSERT INTO `wd_sys_operation_log` VALUES ('757', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', '江西省-萍乡市', '1', '\0', '2023-09-11 14:23:07', '2023-09-11 14:23:07');
INSERT INTO `wd_sys_operation_log` VALUES ('758', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', '江西省-萍乡市', '1', '\0', '2023-09-11 14:23:07', '2023-09-11 14:23:07');
INSERT INTO `wd_sys_operation_log` VALUES ('759', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:07', '2023-09-11 14:23:07');
INSERT INTO `wd_sys_operation_log` VALUES ('760', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:23:07', '2023-09-11 14:23:07');
INSERT INTO `wd_sys_operation_log` VALUES ('761', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:07', '2023-09-11 14:23:07');
INSERT INTO `wd_sys_operation_log` VALUES ('762', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:07', '2023-09-11 14:23:07');
INSERT INTO `wd_sys_operation_log` VALUES ('763', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[1]]', '182.105.6.161', null, '1', '\0', '2023-09-11 14:23:07', '2023-09-11 14:23:07');
INSERT INTO `wd_sys_operation_log` VALUES ('764', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:23:07', '2023-09-11 14:23:07');
INSERT INTO `wd_sys_operation_log` VALUES ('765', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:07', '2023-09-11 14:23:07');
INSERT INTO `wd_sys_operation_log` VALUES ('766', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', '江西省-萍乡市', '4', '\0', '2023-09-11 14:23:07', '2023-09-11 14:23:07');
INSERT INTO `wd_sys_operation_log` VALUES ('767', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[4]]', '182.105.6.161', null, '4', '\0', '2023-09-11 14:23:08', '2023-09-11 14:23:08');
INSERT INTO `wd_sys_operation_log` VALUES ('768', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[22, 44, 55]]', '59.39.252.210', '广东省-东莞市', '22', '\0', '2023-09-11 15:56:26', '2023-09-11 15:56:26');
INSERT INTO `wd_sys_operation_log` VALUES ('769', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[22, 44, 55]]', '59.39.252.210', '广东省-东莞市', '44', '\0', '2023-09-11 15:56:27', '2023-09-11 15:56:27');
INSERT INTO `wd_sys_operation_log` VALUES ('770', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[22, 44, 55]]', '59.39.252.210', '广东省-东莞市', '55', '\0', '2023-09-11 15:56:27', '2023-09-11 15:56:27');
INSERT INTO `wd_sys_operation_log` VALUES ('771', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '59.39.252.210', '广东省-东莞市', '3', '\0', '2023-09-11 15:57:42', '2023-09-11 15:57:42');
INSERT INTO `wd_sys_operation_log` VALUES ('772', '1', 'superman', '2', '5', '0', '5', '删除部门信息:[[3]]', '59.39.252.210', '广东省-东莞市', '3', '\0', '2023-09-11 16:45:41', '2023-09-11 16:45:41');
INSERT INTO `wd_sys_operation_log` VALUES ('773', '2', 'zhouwenqi', '2', '5', '0', '5', '删除部门信息:[[3]]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '3', '\0', '2023-09-11 16:49:48', '2023-09-11 16:49:48');
INSERT INTO `wd_sys_operation_log` VALUES ('774', '1', 'superman', '1', '5', '0', '5', '修改部门信息:xxxxx[M423332]', '182.105.6.161', '江西省-萍乡市', '5', '\0', '2023-09-12 09:22:57', '2023-09-12 09:22:57');
INSERT INTO `wd_sys_operation_log` VALUES ('775', '40', 'xiaoma8', '0', '5', '0', '0', '注册个人信息:xiaoma8[40]', '182.105.6.161', '江西省-萍乡市', '40', '\0', '2023-09-12 10:11:55', '2023-09-12 10:11:55');
INSERT INTO `wd_sys_operation_log` VALUES ('776', '1', 'superman', '1', '5', '0', '5', '修改部门信息:研发部门[0029342]', '127.0.0.1', '-', '1', '\0', '2023-09-12 12:11:32', '2023-09-12 12:11:32');
INSERT INTO `wd_sys_operation_log` VALUES ('777', '1', 'superman', '1', '5', '0', '5', '修改部门信息:研发部门[0029342]', '127.0.0.1', '-', '1', '\0', '2023-09-12 12:29:56', '2023-09-12 12:29:56');
INSERT INTO `wd_sys_operation_log` VALUES ('778', '1', 'superman', '1', '5', '0', '5', '修改部门信息:研发部门[0029342]', '127.0.0.1', '-', '1', '\0', '2023-09-12 12:30:44', '2023-09-12 12:30:44');
INSERT INTO `wd_sys_operation_log` VALUES ('779', '1', 'superman', '1', '5', '0', '5', '修改部门信息:yyyyy[234234]', '127.0.0.1', '-', '6', '\0', '2023-09-12 15:12:05', '2023-09-12 15:12:05');
INSERT INTO `wd_sys_operation_log` VALUES ('780', '2', 'zhouwenqi', '0', '5', '0', '10', '创建系统公告:广数队器热', '0:0:0:0:0:0:0:1', '广东省-东莞市', '1', '\0', '2023-09-20 01:05:29', '2023-09-20 01:05:29');
INSERT INTO `wd_sys_operation_log` VALUES ('781', '2', 'zhouwenqi', '2', '5', '0', '10', '删除公告信息:[[22, 33, 44]]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '22', '\0', '2023-09-20 01:10:39', '2023-09-20 01:10:39');
INSERT INTO `wd_sys_operation_log` VALUES ('782', '2', 'zhouwenqi', '2', '5', '0', '10', '删除公告信息:[[22, 33, 44]]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '33', '\0', '2023-09-20 01:10:39', '2023-09-20 01:10:39');
INSERT INTO `wd_sys_operation_log` VALUES ('783', '2', 'zhouwenqi', '2', '5', '0', '10', '删除公告信息:[[22, 33, 44]]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '44', '\0', '2023-09-20 01:10:40', '2023-09-20 01:10:40');
INSERT INTO `wd_sys_operation_log` VALUES ('784', '2', 'zhouwenqi', '1', '5', '0', '10', '修改系统公告:之等千44会头', '0:0:0:0:0:0:0:1', '广东省-东莞市', '1', '\0', '2023-09-20 01:49:37', '2023-09-20 01:49:37');
INSERT INTO `wd_sys_operation_log` VALUES ('785', '2', 'zhouwenqi', '10', '5', '0', '10', '推送公告消息:之等千44会头', '0:0:0:0:0:0:0:1', '广东省-东莞市', '1', '\0', '2023-09-20 02:06:15', '2023-09-20 02:06:15');
INSERT INTO `wd_sys_operation_log` VALUES ('786', '2', 'zhouwenqi', '10', '5', '0', '10', '推送公告消息:之等千44会头', '0:0:0:0:0:0:0:1', '广东省-东莞市', '1', '\0', '2023-09-20 02:07:27', '2023-09-20 02:07:27');
INSERT INTO `wd_sys_operation_log` VALUES ('787', '2', 'zhouwenqi', '10', '5', '0', '10', '推送公告消息:之等千44会头', '0:0:0:0:0:0:0:1', '广东省-东莞市', '1', '\0', '2023-09-20 02:17:38', '2023-09-20 02:17:38');
INSERT INTO `wd_sys_operation_log` VALUES ('788', '2', 'zhouwenqi', '10', '5', '0', '10', '推送公告消息:之等千44会头', '0:0:0:0:0:0:0:1', '广东省-东莞市', '1', '\0', '2023-09-20 02:18:38', '2023-09-20 02:18:38');
INSERT INTO `wd_sys_operation_log` VALUES ('789', '2', 'zhouwenqi', '2', '5', '0', '9', '删除系统消息:[[44, 22, 66]]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '44', '\0', '2023-09-20 03:02:39', '2023-09-20 03:02:39');
INSERT INTO `wd_sys_operation_log` VALUES ('790', '2', 'zhouwenqi', '2', '5', '0', '9', '删除系统消息:[[44, 22, 66]]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '22', '\0', '2023-09-20 03:02:39', '2023-09-20 03:02:39');
INSERT INTO `wd_sys_operation_log` VALUES ('791', '2', 'zhouwenqi', '2', '5', '0', '9', '删除系统消息:[[44, 22, 66]]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '66', '\0', '2023-09-20 03:02:40', '2023-09-20 03:02:40');
INSERT INTO `wd_sys_operation_log` VALUES ('792', '1', 'superman', '1', '5', '0', '10', '修改系统公告:之等千44会头1', '106.5.205.64', '江西省-萍乡市', '1', '\0', '2023-09-22 10:22:36', '2023-09-22 10:22:36');
INSERT INTO `wd_sys_operation_log` VALUES ('793', '1', 'superman', '0', '5', '0', '10', '创建系统公告:测试公告', '106.5.205.64', '江西省-萍乡市', '2', '\0', '2023-09-22 10:22:55', '2023-09-22 10:22:55');
INSERT INTO `wd_sys_operation_log` VALUES ('794', '1', 'superman', '0', '5', '0', '10', '创建系统公告:随便来一条公告', '106.5.205.64', '江西省-萍乡市', '3', '\0', '2023-09-22 10:23:08', '2023-09-22 10:23:08');
INSERT INTO `wd_sys_operation_log` VALUES ('795', '1', 'superman', '2', '5', '0', '10', '删除公告信息:[[3]]', '106.5.205.64', '江西省-萍乡市', '3', '\0', '2023-09-22 10:23:31', '2023-09-22 10:23:31');
INSERT INTO `wd_sys_operation_log` VALUES ('796', '1', 'superman', '0', '5', '0', '10', '创建系统公告:是大法官的房贷', '106.5.205.64', '江西省-萍乡市', '4', '\0', '2023-09-22 10:23:44', '2023-09-22 10:23:44');
INSERT INTO `wd_sys_operation_log` VALUES ('797', '1', 'superman', '0', '5', '0', '10', '创建系统公告:发生的水电费水电费', '106.5.205.64', '江西省-萍乡市', '5', '\0', '2023-09-22 10:23:49', '2023-09-22 10:23:49');
INSERT INTO `wd_sys_operation_log` VALUES ('798', '1', 'superman', '2', '5', '0', '10', '删除公告信息:[[5, 4]]', '106.5.205.64', '江西省-萍乡市', '5', '\0', '2023-09-22 10:23:55', '2023-09-22 10:23:55');
INSERT INTO `wd_sys_operation_log` VALUES ('799', '1', 'superman', '2', '5', '0', '10', '删除公告信息:[[5, 4]]', '106.5.205.64', '江西省-萍乡市', '4', '\0', '2023-09-22 10:23:56', '2023-09-22 10:23:56');
INSERT INTO `wd_sys_operation_log` VALUES ('800', '2', 'zhouwenqi', '0', '5', '0', '3', '创建字典信息:革该两44[664564]', '119.128.113.79', '广东省-东莞市', '5', '\0', '2023-09-23 15:12:49', '2023-09-23 15:12:49');
INSERT INTO `wd_sys_operation_log` VALUES ('801', '1', 'superman', '10', '5', '0', '10', '推送公告消息:测试公告', '106.5.205.64', '江西省-萍乡市', '2', '\0', '2023-09-23 16:37:13', '2023-09-23 16:37:13');
INSERT INTO `wd_sys_operation_log` VALUES ('802', '1', 'superman', '10', '5', '0', '10', '推送公告消息:测试公告', '106.5.205.253', '江西省-萍乡市', '2', '\0', '2023-09-25 21:18:39', '2023-09-25 21:18:39');
INSERT INTO `wd_sys_operation_log` VALUES ('803', '2', 'zhouwenqi', '10', '5', '0', '10', '推送公告消息:之等千44会头1', '113.91.250.35', '广东省-深圳市', '1', '\0', '2023-09-25 21:21:09', '2023-09-25 21:21:09');
INSERT INTO `wd_sys_operation_log` VALUES ('804', '2', 'zhouwenqi', '10', '5', '0', '10', '推送公告消息:之等千44会头1', '113.91.250.35', '广东省-深圳市', '1', '\0', '2023-09-25 21:21:36', '2023-09-25 21:21:36');
INSERT INTO `wd_sys_operation_log` VALUES ('805', '2', 'zhouwenqi', '10', '5', '0', '10', '推送公告消息:之等千44会头1', '113.91.250.35', '广东省-深圳市', '1', '\0', '2023-09-25 21:23:29', '2023-09-25 21:23:29');
INSERT INTO `wd_sys_operation_log` VALUES ('806', '2', 'zhouwenqi', '10', '5', '0', '10', '推送公告消息:之等千44会头1', '0:0:0:0:0:0:0:1', '广东省-东莞市', '1', '\0', '2023-09-25 21:54:39', '2023-09-25 21:54:39');
INSERT INTO `wd_sys_operation_log` VALUES ('807', '2', 'zhouwenqi', '10', '5', '0', '10', '推送公告消息:之等千44会头1', '113.91.250.35', '广东省-深圳市', '1', '\0', '2023-09-25 21:55:21', '2023-09-25 21:55:21');
INSERT INTO `wd_sys_operation_log` VALUES ('808', '2', 'zhouwenqi', '10', '5', '0', '10', '推送公告消息:之等千44会头1', '127.0.0.1', '-', '1', '\0', '2023-09-25 22:05:28', '2023-09-25 22:05:28');
INSERT INTO `wd_sys_operation_log` VALUES ('809', '2', 'zhouwenqi', '10', '5', '0', '10', '推送公告消息:之等千44会头1', '127.0.0.1', '-', '1', '\0', '2023-09-25 22:13:49', '2023-09-25 22:13:49');
INSERT INTO `wd_sys_operation_log` VALUES ('810', '2', 'zhouwenqi', '10', '5', '0', '10', '推送公告消息:之等千44会头1', '113.91.250.35', '广东省-深圳市', '1', '\0', '2023-09-25 22:15:22', '2023-09-25 22:15:22');
INSERT INTO `wd_sys_operation_log` VALUES ('811', '2', 'zhouwenqi', '10', '5', '0', '10', '推送公告消息:之等千44会头1', '113.91.250.35', '广东省-深圳市', '1', '\0', '2023-09-25 22:15:33', '2023-09-25 22:15:33');
INSERT INTO `wd_sys_operation_log` VALUES ('812', '1', 'superman', '10', '5', '0', '10', '推送公告消息:测试公告', '106.5.205.253', '江西省-萍乡市', '2', '\0', '2023-09-25 22:56:18', '2023-09-25 22:56:18');
INSERT INTO `wd_sys_operation_log` VALUES ('813', '1', 'superman', '10', '5', '0', '10', '推送公告消息:测试公告', '106.5.205.253', '江西省-萍乡市', '2', '\0', '2023-09-25 22:56:54', '2023-09-25 22:56:54');
INSERT INTO `wd_sys_operation_log` VALUES ('814', '2', 'zhouwenqi', '1', '5', '0', '10', '修改系统公告:之等千会头', '0:0:0:0:0:0:0:1', '广东省-东莞市', '1', '\0', '2023-09-25 23:10:21', '2023-09-25 23:10:21');
INSERT INTO `wd_sys_operation_log` VALUES ('815', '1', 'superman', '10', '5', '0', '10', '推送公告消息:测试公告', '182.105.6.68', '江西省-萍乡市', '2', '\0', '2023-09-28 14:02:29', '2023-09-28 14:02:29');
INSERT INTO `wd_sys_operation_log` VALUES ('816', '1', 'superman', '10', '5', '0', '10', '推送公告消息:测试公告', '182.105.6.68', '江西省-萍乡市', '2', '\0', '2023-09-28 14:21:47', '2023-09-28 14:21:47');
INSERT INTO `wd_sys_operation_log` VALUES ('817', '1', 'superman', '10', '5', '0', '10', '推送公告消息:测试公告', '182.105.6.68', '江西省-萍乡市', '2', '\0', '2023-09-28 14:38:17', '2023-09-28 14:38:17');
INSERT INTO `wd_sys_operation_log` VALUES ('818', '1', 'superman', '10', '5', '0', '10', '推送公告消息:测试公告', '182.105.6.68', '江西省-萍乡市', '2', '\0', '2023-09-28 14:39:02', '2023-09-28 14:39:02');
INSERT INTO `wd_sys_operation_log` VALUES ('819', '1', 'superman', '10', '5', '0', '10', '推送公告消息:测试公告', '182.105.6.68', '江西省-萍乡市', '2', '\0', '2023-09-28 14:40:14', '2023-09-28 14:40:14');
INSERT INTO `wd_sys_operation_log` VALUES ('820', '1', 'superman', '10', '5', '0', '10', '推送公告消息:测试公告', '182.105.6.68', '江西省-萍乡市', '2', '\0', '2023-09-28 14:42:20', '2023-09-28 14:42:20');
INSERT INTO `wd_sys_operation_log` VALUES ('821', '1', 'superman', '10', '5', '0', '10', '推送公告消息:测试公告', '182.105.6.68', '江西省-萍乡市', '2', '\0', '2023-09-28 14:43:03', '2023-09-28 14:43:03');
INSERT INTO `wd_sys_operation_log` VALUES ('822', '1', 'superman', '10', '5', '0', '10', '推送公告消息:测试公告', '182.105.6.68', '江西省-萍乡市', '2', '\0', '2023-09-28 14:44:08', '2023-09-28 14:44:08');
INSERT INTO `wd_sys_operation_log` VALUES ('823', '1', 'superman', '10', '5', '0', '10', '推送公告消息:测试公告', '182.105.6.68', '江西省-萍乡市', '2', '\0', '2023-09-28 14:52:52', '2023-09-28 14:52:52');
INSERT INTO `wd_sys_operation_log` VALUES ('824', '1', 'superman', '10', '5', '0', '10', '推送公告消息:测试公告', '182.105.6.68', '江西省-萍乡市', '2', '\0', '2023-09-28 14:53:03', '2023-09-28 14:53:03');
INSERT INTO `wd_sys_operation_log` VALUES ('825', '1', 'superman', '10', '5', '0', '10', '推送公告消息:测试公告', '182.105.6.68', '江西省-萍乡市', '2', '\0', '2023-09-28 14:53:35', '2023-09-28 14:53:35');
INSERT INTO `wd_sys_operation_log` VALUES ('826', '1', 'superman', '10', '5', '0', '10', '推送公告消息:测试公告', '182.105.6.68', '江西省-萍乡市', '2', '\0', '2023-09-28 14:53:55', '2023-09-28 14:53:55');
INSERT INTO `wd_sys_operation_log` VALUES ('827', '1', 'superman', '10', '5', '0', '10', '推送公告消息:测试公告', '182.105.6.68', '江西省-萍乡市', '2', '\0', '2023-09-28 15:01:56', '2023-09-28 15:01:56');
INSERT INTO `wd_sys_operation_log` VALUES ('828', '1', 'superman', '10', '5', '0', '10', '推送公告消息:测试公告', '182.105.6.68', '江西省-萍乡市', '2', '\0', '2023-09-28 15:03:10', '2023-09-28 15:03:10');
INSERT INTO `wd_sys_operation_log` VALUES ('829', '1', 'superman', '10', '5', '0', '10', '推送公告消息:测试公告', '182.105.6.68', '江西省-萍乡市', '2', '\0', '2023-09-28 15:03:24', '2023-09-28 15:03:24');
INSERT INTO `wd_sys_operation_log` VALUES ('830', '1', 'superman', '10', '5', '0', '10', '推送公告消息:测试公告', '182.105.6.68', '江西省-萍乡市', '2', '\0', '2023-09-28 15:06:27', '2023-09-28 15:06:27');
INSERT INTO `wd_sys_operation_log` VALUES ('831', '1', 'superman', '10', '5', '0', '10', '推送公告消息:测试公告', '182.105.6.68', '江西省-萍乡市', '2', '\0', '2023-09-28 15:09:12', '2023-09-28 15:09:12');
INSERT INTO `wd_sys_operation_log` VALUES ('832', '1', 'superman', '10', '5', '0', '10', '推送公告消息:测试公告', '182.105.6.68', '江西省-萍乡市', '2', '\0', '2023-09-28 15:13:50', '2023-09-28 15:13:50');
INSERT INTO `wd_sys_operation_log` VALUES ('833', '1', 'superman', '10', '5', '0', '10', '推送公告消息:测试公告', '59.39.224.138', '广东省-东莞市', '2', '\0', '2023-09-28 15:17:54', '2023-09-28 15:17:54');
INSERT INTO `wd_sys_operation_log` VALUES ('834', '1', 'superman', '1', '5', '0', '0', '修改登录密码:superman[1]', '182.105.9.130', '江西省-萍乡市', '1', '\0', '2023-10-10 15:01:04', '2023-10-10 15:01:04');
INSERT INTO `wd_sys_operation_log` VALUES ('835', '1', 'superman', '1', '5', '0', '0', '删除系统用户:xiaoma8[40]', '182.105.9.130', '江西省-萍乡市', '40', '\0', '2023-10-10 15:03:48', '2023-10-10 15:03:48');
INSERT INTO `wd_sys_operation_log` VALUES ('836', '1', 'superman', '1', '5', '0', '0', '删除系统用户:xiaoma[39]', '182.105.9.130', '江西省-萍乡市', '39', '\0', '2023-10-10 15:03:51', '2023-10-10 15:03:51');
INSERT INTO `wd_sys_operation_log` VALUES ('837', '1', 'superman', '0', '5', '0', '2', '创建角色信息:预览人员[role:test]', '182.105.9.130', '江西省-萍乡市', '8', '\0', '2023-10-10 15:05:07', '2023-10-10 15:05:07');
INSERT INTO `wd_sys_operation_log` VALUES ('838', '1', 'superman', '1', '5', '0', '2', '修改角色权限:预览人员[role:test]', '182.105.9.130', '江西省-萍乡市', '8', '\0', '2023-10-10 15:06:12', '2023-10-10 15:06:12');
INSERT INTO `wd_sys_operation_log` VALUES ('839', '1', 'superman', '0', '5', '0', '0', '创建系统用户:test12[41]', '182.105.9.130', '江西省-萍乡市', '41', '\0', '2023-10-10 15:07:50', '2023-10-10 15:07:50');
INSERT INTO `wd_sys_operation_log` VALUES ('840', '1', 'superman', '5', '5', '0', '7', '删除登录日志:[[2]]', '182.105.9.130', '江西省-萍乡市', '2', '\0', '2023-10-10 15:36:05', '2023-10-10 15:36:05');
INSERT INTO `wd_sys_operation_log` VALUES ('841', '41', 'test12', '1', '5', '0', '0', '修改个人资料:null[41]', '182.105.9.130', '江西省-萍乡市', '41', '\0', '2023-10-10 15:36:53', '2023-10-10 15:36:53');
INSERT INTO `wd_sys_operation_log` VALUES ('842', '41', 'test12', '1', '5', '0', '0', '修改个人资料:null[41]', '182.105.9.130', '江西省-萍乡市', '41', '\0', '2023-10-10 15:37:09', '2023-10-10 15:37:09');
INSERT INTO `wd_sys_operation_log` VALUES ('843', '41', 'test12', '10', '5', '0', '10', '推送公告消息:测试公告', '120.216.251.155', null, '2', '\0', '2023-10-16 11:05:52', '2023-10-16 11:05:52');
INSERT INTO `wd_sys_operation_log` VALUES ('844', '41', 'test12', '1', '5', '0', '0', '修改个人资料:null[41]', '120.216.251.155', null, '41', '\0', '2023-10-16 11:08:28', '2023-10-16 11:08:28');
INSERT INTO `wd_sys_operation_log` VALUES ('845', '41', 'test12', '10', '5', '0', '10', '推送公告消息:测试公告', '219.146.150.238', '山东省-淄博市', '2', '\0', '2023-10-16 12:43:04', '2023-10-16 12:43:04');
INSERT INTO `wd_sys_operation_log` VALUES ('846', '41', 'test12', '10', '5', '0', '10', '推送公告消息:测试公告', '117.162.228.175', '江西省-萍乡市', '2', '\0', '2023-10-23 17:22:12', '2023-10-23 17:22:12');
INSERT INTO `wd_sys_operation_log` VALUES ('847', '41', 'test12', '1', '5', '0', '0', '修改个人资料:null[41]', '183.15.179.85', '广东省-深圳市', '41', '\0', '2023-11-14 11:25:00', '2023-11-14 11:25:00');
INSERT INTO `wd_sys_operation_log` VALUES ('848', '2', 'zhouwenqi', '11', '5', '0', '9', '系统用户二次验证:[zhouwenqi]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-12-07 14:30:00', '2023-12-07 14:30:00');
INSERT INTO `wd_sys_operation_log` VALUES ('849', '2', 'zhouwenqi', '11', '5', '0', '0', '系统用户二次验证:[zhouwenqi]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-12-07 14:34:27', '2023-12-07 14:34:27');
INSERT INTO `wd_sys_operation_log` VALUES ('850', '2', 'zhouwenqi', '11', '5', '0', '0', '系统用户二次验证:[zhouwenqi]', '0:0:0:0:0:0:0:1', '广东省-东莞市', '2', '\0', '2023-12-07 14:37:28', '2023-12-07 14:37:28');

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
  `secret_key` varchar(255) DEFAULT NULL COMMENT '密钥',
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
