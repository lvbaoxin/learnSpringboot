/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80200
Source Host           : localhost:3306
Source Database       : project

Target Server Type    : MYSQL
Target Server Version : 80200
File Encoding         : 65001

Date: 2023-12-25 21:58:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `nav`
-- ----------------------------
DROP TABLE IF EXISTS `nav`;
CREATE TABLE `nav` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `type_id` int DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `nav_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `navtype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Records of nav
-- ----------------------------
INSERT INTO `nav` VALUES ('1', 'openAi', 'https://chat.openai.com/', '3', '2023-12-25 21:19:20');
INSERT INTO `nav` VALUES ('2', '百度', 'https://www.baidu.com', '1', '2023-12-25 21:25:40');
INSERT INTO `nav` VALUES ('3', '111', '211', '2', '2023-12-25 21:25:51');
INSERT INTO `nav` VALUES ('4', '222', '333', '1', '2023-12-25 21:26:03');

-- ----------------------------
-- Table structure for `navtype`
-- ----------------------------
DROP TABLE IF EXISTS `navtype`;
CREATE TABLE `navtype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Records of navtype
-- ----------------------------
INSERT INTO `navtype` VALUES ('1', '前端');
INSERT INTO `navtype` VALUES ('2', '后端');
INSERT INTO `navtype` VALUES ('3', '工具');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '账号',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '姓名',
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '密码',
  `age` int DEFAULT NULL COMMENT '年龄',
  `sex` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '性别',
  `phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '手机号',
  `role_id` int NOT NULL COMMENT '角色0超级1管理员2普通',
  `isValid` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'Y' COMMENT '是否有效默认Y',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '01', '张三1', '123123', '19', '0', '15942458888', '0', 'Y');
INSERT INTO `user` VALUES ('2', '01', '张三111', '123123', '19', '0', '15942458888', '0', 'Y');
INSERT INTO `user` VALUES ('3', '03', '张三3', '123456', null, '0', '15942458888', '0', 'Y');
