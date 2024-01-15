/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 80029
Source Host           : localhost:3306
Source Database       : project

Target Server Type    : MYSQL
Target Server Version : 80029
File Encoding         : 65001

Date: 2024-01-15 16:43:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for nav
-- ----------------------------
DROP TABLE IF EXISTS `nav`;
CREATE TABLE `nav` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `type_id` int DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `nav_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `navtype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of nav
-- ----------------------------
INSERT INTO `nav` VALUES ('1', 'openAi', 'https://chat.openai.com/', '3', '2023-12-25 21:19:20');
INSERT INTO `nav` VALUES ('2', '百度', 'https://www.baidu.com', '1', '2023-12-25 21:25:40');
INSERT INTO `nav` VALUES ('3', '111', '211', '2', '2023-12-25 21:25:51');
INSERT INTO `nav` VALUES ('4', '222', '333', '1', '2023-12-25 21:26:03');

-- ----------------------------
-- Table structure for navtype
-- ----------------------------
DROP TABLE IF EXISTS `navtype`;
CREATE TABLE `navtype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of navtype
-- ----------------------------
INSERT INTO `navtype` VALUES ('1', '前端');
INSERT INTO `navtype` VALUES ('2', '后端');
INSERT INTO `navtype` VALUES ('3', '工具');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `roleName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roleSign` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `status` int DEFAULT '0',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('2', '角色名称1', '角色标识', '角色描述', '0', '0', '2024-01-12 15:38:23');
INSERT INTO `role` VALUES ('3', '角色名称2', '角色标识2', '角色描述2', '1', '0', '2024-01-12 15:59:28');
INSERT INTO `role` VALUES ('4', '角色名称3', '角色标识3', '角色描述3', '3', '1', '2024-01-12 15:59:53');

-- ----------------------------
-- Table structure for token
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `indate_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`user_id`),
  CONSTRAINT `id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of token
-- ----------------------------
INSERT INTO `token` VALUES ('1', '1', 'aaabbbccc123345678', '2024-01-15 09:59:53', '2024-01-15 11:59:56');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '密码',
  `no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '账号',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL COMMENT '姓名',
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '手机号',
  `isValid` varchar(4) COLLATE utf8_unicode_ci DEFAULT 'Y' COMMENT '是否有效默认Y',
  `age` int DEFAULT NULL COMMENT '年龄',
  `sex` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL COMMENT '性别',
  `createdTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'Lyu', null, '123123', '01', '张三1', '15942458888', 'Y', '19', '0', '2024-01-15 11:01:15');
INSERT INTO `user` VALUES ('2', null, null, '123123', '01', '张三111', '15942458888', 'Y', '19', '0', '2024-01-15 11:01:19');
INSERT INTO `user` VALUES ('3', null, null, '123456', '03', '张三3', '15942458888', 'Y', null, '0', '2024-01-15 11:01:23');
