/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 80029
Source Host           : localhost:3306
Source Database       : project

Target Server Type    : MYSQL
Target Server Version : 80029
File Encoding         : 65001

Date: 2024-01-17 16:43:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$320000$3grOwkkPQif7pswxGUu3jl$t7L9SWU9GdmmrBFYmEAlbj69mhURaLR4kcNgjUxmKh0=', '2022-01-05 02:35:49.966899', '1', 'admin', '', '', '', '1', '1', '2021-12-14 08:43:28.236196');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for myweb_about
-- ----------------------------
DROP TABLE IF EXISTS `myweb_about`;
CREATE TABLE `myweb_about` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of myweb_about
-- ----------------------------
INSERT INTO `myweb_about` VALUES ('1', '标题11', '简介2222', '2021-12-14 08:52:00.000000', '2021-12-14 08:52:00.000000');

-- ----------------------------
-- Table structure for myweb_blog
-- ----------------------------
DROP TABLE IF EXISTS `myweb_blog`;
CREATE TABLE `myweb_blog` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `pic` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `abstracts` longtext COLLATE utf8_unicode_ci NOT NULL,
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `blogCategory_id` bigint NOT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci,
  `sort` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `myweb_blog_blogCategory_id_7b025c8b_fk_myweb_blogcategory_id` (`blogCategory_id`),
  CONSTRAINT `myweb_blog_blogCategory_id_7b025c8b_fk_myweb_blogcategory_id` FOREIGN KEY (`blogCategory_id`) REFERENCES `myweb_blogcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of myweb_blog
-- ----------------------------
INSERT INTO `myweb_blog` VALUES ('1', 'Django允许media文件路径', '3_Wy2I5Vf.jpg', 'Django中media文件夹是我们文件(比如头像、文件、视频等)数据十分重要的存放处，这里以用户头像的上传以及media文件的访问为例为大家详细讲解下media的相关实例。', '2021-12-15 06:33:00.000000', '2021-12-20 07:45:00.000000', '1', '<p>模块化是一种处理复杂系统分解为更好的可管理模块的方式。 所谓的模块化开发就是封装细节，提供使用接口，彼此之间互不影响，每个模块都是实现某一特定的功能。</p>', null);
INSERT INTO `myweb_blog` VALUES ('2', '33', '8.jpg', '44', '2021-12-15 06:33:00.000000', '2021-12-15 06:33:00.000000', '1', null, null);
INSERT INTO `myweb_blog` VALUES ('3', '2344', '4_rMU9zJw.jpg', '4444', '2021-12-15 06:33:00.000000', '2021-12-15 06:33:00.000000', '2', null, null);
INSERT INTO `myweb_blog` VALUES ('4', '标题在这里', '1.jpg', '摘要', '2021-12-22 03:38:00.000000', '2021-12-23 01:58:00.000000', '1', '<p>模块化是一种处理复杂系统分解为更好的可管理模块的方式。 所谓的模块化开发就是封装细节，提供使用接口，彼此之间互不影响，每个模块都是实现某一特定的功能。</p>', null);
INSERT INTO `myweb_blog` VALUES ('5', '测试数据', '4_zNwAZTm.jpg', '照耀', '2021-12-22 08:58:00.000000', '2021-12-23 01:57:00.000000', '2', '<p>Django中media文件夹是我们文件(比如头像、文件、视频等)数据十分重要的存放处，这里以用户头像的上传以及media文件的访问为例为大家详细讲解下media的相关实例Django中media文件夹是我们文件(比如头像、文件、视频等)数据十分重要的存放处，这里以用户头像的上传以及media文件的访问为例为大家详细讲解下media的相关实例</p>', null);
INSERT INTO `myweb_blog` VALUES ('6', '500', '8.jpg', '服务器错误，请联系管理员。', '2024-01-17 11:15:13.747000', '2024-01-17 11:15:13.747000', '1', '<i>123</i>', null);
INSERT INTO `myweb_blog` VALUES ('7', '33434', '8.jpg', '服务器错误，请联系管理员。', '2024-01-17 13:19:20.414000', '2024-01-17 13:19:20.414000', '1', '<i>123</i>', '0');
INSERT INTO `myweb_blog` VALUES ('8', '22', '8.jpg', '服务器错误，请联系管理员。', '2024-01-17 13:21:16.897000', '2024-01-17 13:21:16.897000', '1', '<i>123</i>', '0');
INSERT INTO `myweb_blog` VALUES ('9', '332', '8.jpg', '服务器错误，请联系管理员。', '2024-01-17 13:21:53.646000', '2024-01-17 13:21:53.646000', '1', '<i>123</i>', '0');

-- ----------------------------
-- Table structure for myweb_blogcategory
-- ----------------------------
DROP TABLE IF EXISTS `myweb_blogcategory`;
CREATE TABLE `myweb_blogcategory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `sort` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of myweb_blogcategory
-- ----------------------------
INSERT INTO `myweb_blogcategory` VALUES ('1', '前端', '2021-12-14 08:44:00.000000', '2021-12-14 08:44:00.000000', '0');
INSERT INTO `myweb_blogcategory` VALUES ('2', '后端', '2021-12-14 08:44:00.000000', '2021-12-14 08:44:00.000000', '1');

-- ----------------------------
-- Table structure for myweb_contact
-- ----------------------------
DROP TABLE IF EXISTS `myweb_contact`;
CREATE TABLE `myweb_contact` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `desc` longtext CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `is_del` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of myweb_contact
-- ----------------------------
INSERT INTO `myweb_contact` VALUES ('33', '昵称在这里', '20122109@stu.nun.edu.cn', 'Have a cool project in mind? contact me.', '2021-12-21 09:06:15.430824', '2021-12-21 09:06:15.430824', '0');
INSERT INTO `myweb_contact` VALUES ('34', 'ThankYou_Ly', '7123@qq.com', 'Have a cool project in mind? contact me.', '2021-12-22 02:40:27.594937', '2021-12-22 02:40:27.594937', '0');
INSERT INTO `myweb_contact` VALUES ('35', '昵称在这里', '20122109@stu.nun.edu.cn', '如果将此设置为 True 会导致无限重定向，这可能意味着你的网站是在代理服务器后面运行的，并且无法判断哪些请求是安全的，哪些不是。你的代理服务器可能会设置一个头来指示安全请求；你可以通过找出该头并相应地配置 SECURE_PROXY_SSL_HEADER 设置来纠正这个问题。', '2021-12-22 02:44:51.652174', '2021-12-22 02:44:51.652174', '0');
INSERT INTO `myweb_contact` VALUES ('36', '昵称在这里', '745458741@QQ.COM', '这里是内容', '2021-12-22 09:56:35.424581', '2021-12-22 09:56:35.424581', '0');
INSERT INTO `myweb_contact` VALUES ('37', 'ThankYou_Ly', '745458741@qq.com', '123123', '2022-01-04 09:39:23.582545', '2022-01-04 09:39:23.582545', '0');
INSERT INTO `myweb_contact` VALUES ('38', 'ThankYou_Ly', '20122109@stu.nun.edu.cn', '本站信息', '2022-01-18 07:08:33.574740', '2022-01-18 07:08:33.574740', '0');
INSERT INTO `myweb_contact` VALUES ('39', 'ThankYou_Ly', '20122109@stu.nun.edu.cn', '本站信息', '2022-01-18 07:08:51.860824', '2022-01-18 07:08:51.860824', '0');
INSERT INTO `myweb_contact` VALUES ('40', 'ThankYou_Ly', '745458741@qq.com', '你有什么话要对我说吗？可以畅所欲言o~', '2022-01-18 07:09:22.937775', '2022-01-18 07:09:22.937775', '0');
INSERT INTO `myweb_contact` VALUES ('41', 'ThankYou_Ly', '745458741@qq.com', '你有什么话要对我说吗？可以畅所欲言o~', '2022-01-18 07:09:35.617340', '2022-01-18 07:09:35.617340', '0');
INSERT INTO `myweb_contact` VALUES ('42', 'ThankYou_Ly', '745458741@qq.com', '123123123', '2022-01-18 07:09:51.961460', '2022-01-18 07:09:51.961460', '0');
INSERT INTO `myweb_contact` VALUES ('43', 'ThankYou_Ly', '745458741@qq.com', '123123123', '2022-01-18 07:10:00.883946', '2022-01-18 07:10:00.883946', '0');
INSERT INTO `myweb_contact` VALUES ('44', 'ThankYou_Ly', '745458741@qq.com', '你有什么话要对我说吗？可以畅所欲言o~', '2022-01-18 07:10:24.064915', '2022-01-18 07:10:24.064915', '0');
INSERT INTO `myweb_contact` VALUES ('45', '昵称在这里', '745458741@qq.com', '566', '2022-01-18 07:10:51.433036', '2022-01-18 07:10:51.433036', '0');
INSERT INTO `myweb_contact` VALUES ('46', '昵称在这里', '20122109@stu.nun.edu.cn', '32323', '2022-01-18 07:12:13.657578', '2022-01-18 07:12:13.657578', '0');
INSERT INTO `myweb_contact` VALUES ('47', '123', '745458741@qq.com', '123', '2022-01-18 07:34:04.432516', '2022-01-18 07:34:04.432516', '0');
INSERT INTO `myweb_contact` VALUES ('48', '本站信息', '20122109@stu.nun.edu.cn', '博客名：Lyu\'s Blog\n\n链接：http://lyudev.cn/\n\n博客图标：http://lyudev.cn/static/img/person-img2.b56906f.jpg\n\n简介：对前端一窍不通，对后端一无所知。', '2022-01-18 07:39:56.445785', '2022-01-18 07:39:56.445785', '0');

-- ----------------------------
-- Table structure for myweb_imagecategory
-- ----------------------------
DROP TABLE IF EXISTS `myweb_imagecategory`;
CREATE TABLE `myweb_imagecategory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `is_del` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of myweb_imagecategory
-- ----------------------------
INSERT INTO `myweb_imagecategory` VALUES ('1', '线上设计部', '2021-12-14 08:45:00.000000', '2021-12-14 08:45:00.000000', '0');
INSERT INTO `myweb_imagecategory` VALUES ('2', '静物光影', '2021-12-14 08:48:00.000000', '2021-12-14 08:48:00.000000', '0');

-- ----------------------------
-- Table structure for myweb_indexabout
-- ----------------------------
DROP TABLE IF EXISTS `myweb_indexabout`;
CREATE TABLE `myweb_indexabout` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of myweb_indexabout
-- ----------------------------
INSERT INTO `myweb_indexabout` VALUES ('1', 'ThankYou_Lyu', '前端工程师 & 后端工程师', '2021-12-14 08:46:00.000000', '2021-12-14 08:46:00.000000');

-- ----------------------------
-- Table structure for myweb_indexaboutlink
-- ----------------------------
DROP TABLE IF EXISTS `myweb_indexaboutlink`;
CREATE TABLE `myweb_indexaboutlink` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `pic` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `is_del` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of myweb_indexaboutlink
-- ----------------------------
INSERT INTO `myweb_indexaboutlink` VALUES ('1', '掘金', 'https://juejin.cn/user/3360520101703134', '2.png', '2021-12-14 08:45:00.000000', '2021-12-24 03:44:00.000000', '0');
INSERT INTO `myweb_indexaboutlink` VALUES ('2', 'GitHub', 'https://github.com/lvbaoxin', '3.png', '2021-12-24 03:44:00.000000', '2021-12-24 03:44:00.000000', '0');
INSERT INTO `myweb_indexaboutlink` VALUES ('3', '500px', 'https://500px.com.cn/lbx745458741', '4.png', '2021-12-24 03:46:00.000000', '2021-12-24 03:46:00.000000', '0');
INSERT INTO `myweb_indexaboutlink` VALUES ('4', '68design', 'https://lbx19920118.68design.net/', '5.png', '2021-12-24 03:47:00.000000', '2021-12-24 03:47:00.000000', '0');

-- ----------------------------
-- Table structure for myweb_link
-- ----------------------------
DROP TABLE IF EXISTS `myweb_link`;
CREATE TABLE `myweb_link` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `src` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `avatarLink` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `is_del` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of myweb_link
-- ----------------------------
INSERT INTO `myweb_link` VALUES ('1', 'ThankYou_Lyu', '123', 'https://www.jianshu.com/u/5aae0fccb4a3', 'https://upload.jianshu.io/users/upload_avatars/16430024/4d583b15-17f0-4348-9b70-8fbcfec91de4.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/180/h/180', '2021-12-15 06:34:00.000000', '2021-12-15 06:34:00.000000', '0');

-- ----------------------------
-- Table structure for myweb_nav
-- ----------------------------
DROP TABLE IF EXISTS `myweb_nav`;
CREATE TABLE `myweb_nav` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `component` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `is_del` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of myweb_nav
-- ----------------------------
INSERT INTO `myweb_nav` VALUES ('1', 'home', '首页', '/home', 'Home', '2021-12-15 08:20:00.000000', '2021-12-15 08:20:00.000000', '0');
INSERT INTO `myweb_nav` VALUES ('3', 'about', '简介', '/about', 'About', '2021-12-15 08:24:00.000000', '2021-12-15 08:24:00.000000', '0');
INSERT INTO `myweb_nav` VALUES ('4', 'resumes', '项目', '/resumes', 'Resumes', '2021-12-15 08:24:00.000000', '2021-12-15 08:24:00.000000', '0');
INSERT INTO `myweb_nav` VALUES ('5', 'portfolio', '作品集', '/portfolio', 'Portfolio', '2021-12-15 08:25:00.000000', '2021-12-15 08:25:00.000000', '0');
INSERT INTO `myweb_nav` VALUES ('6', 'blog', '文章', '/blog', 'Blog', '2021-12-15 08:25:00.000000', '2021-12-15 08:25:00.000000', '0');
INSERT INTO `myweb_nav` VALUES ('7', 'link', '友情链接', '/link', 'Link', '2021-12-15 08:26:00.000000', '2021-12-15 08:26:00.000000', '0');
INSERT INTO `myweb_nav` VALUES ('8', 'contact', '联系', '/contact', 'Contact', '2021-12-15 08:26:00.000000', '2021-12-15 08:26:00.000000', '0');

-- ----------------------------
-- Table structure for myweb_portfolio
-- ----------------------------
DROP TABLE IF EXISTS `myweb_portfolio`;
CREATE TABLE `myweb_portfolio` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `pic` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `imagecategory_id` bigint NOT NULL,
  `is_del` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myweb_portfolio_imagecategory_id_76653cac_fk_myweb_ima` (`imagecategory_id`),
  CONSTRAINT `myweb_portfolio_imagecategory_id_76653cac_fk_myweb_ima` FOREIGN KEY (`imagecategory_id`) REFERENCES `myweb_imagecategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of myweb_portfolio
-- ----------------------------
INSERT INTO `myweb_portfolio` VALUES ('14', '大连二零壹玖年正月十五烟花', '1_yNBZLqM.jpg', '2022-01-10 08:43:00.000000', '2022-01-10 08:43:00.000000', '2', '0');
INSERT INTO `myweb_portfolio` VALUES ('16', '大连电视台', '2.jpg', '2022-01-10 08:45:00.000000', '2022-01-10 08:45:00.000000', '2', '0');
INSERT INTO `myweb_portfolio` VALUES ('17', '天津眼', '3ec66a4aaee54ad59f29dd980dfc8b71.jpg', '2022-01-10 08:45:00.000000', '2022-01-10 08:45:00.000000', '2', '0');
INSERT INTO `myweb_portfolio` VALUES ('18', '北京天安门', '7db025c2b2b64902a366376247d43db8.jpg', '2022-01-10 08:45:00.000000', '2022-01-10 08:45:00.000000', '2', '0');
INSERT INTO `myweb_portfolio` VALUES ('19', '大连东港港口', '1911accd2872470fa754f18f35c8fdd1.jpg', '2022-01-10 08:46:00.000000', '2022-01-10 08:46:00.000000', '2', '0');
INSERT INTO `myweb_portfolio` VALUES ('20', '大连一方城堡', '622540b306484a69b67726bfd55be37c.jpg', '2022-01-10 08:46:00.000000', '2022-01-10 08:46:00.000000', '2', '0');
INSERT INTO `myweb_portfolio` VALUES ('21', '大连高新园区跨海大桥', 'b94ac76786e14c579695666c1aa1c558.jpg', '2022-01-10 08:47:00.000000', '2022-01-10 08:47:00.000000', '2', '0');
INSERT INTO `myweb_portfolio` VALUES ('22', '天津滨海新区', 'bda43ffc801d466b9732d41146ffd207.jpg', '2022-01-10 08:47:00.000000', '2022-01-10 08:47:00.000000', '2', '0');
INSERT INTO `myweb_portfolio` VALUES ('23', '大连旅顺口区大船', 'ca6d8024fe9548b69888a54da8dd136c.jpg', '2022-01-10 08:48:00.000000', '2022-01-10 08:48:00.000000', '2', '0');
INSERT INTO `myweb_portfolio` VALUES ('24', '大连', 'c84dcd9bb2b04280a4c923c99eeebecc.jpg', '2022-01-10 08:49:00.000000', '2022-01-10 08:49:00.000000', '2', '0');
INSERT INTO `myweb_portfolio` VALUES ('25', '建华集团提前出版', 'tqn8qr8qhrtwvyjodpdx.jpg', '2022-01-10 08:59:00.000000', '2022-01-10 08:59:00.000000', '1', '0');
INSERT INTO `myweb_portfolio` VALUES ('26', '珍奥提前出版', 'rl18ucv3eci0m647ss2t.jpg', '2022-01-10 09:02:00.000000', '2022-01-10 09:02:00.000000', '1', '0');
INSERT INTO `myweb_portfolio` VALUES ('27', '威海健身小程序', 'yfsgmduz86jjhe1f2tsj.jpg', '2022-01-10 09:03:00.000000', '2022-01-10 09:03:00.000000', '1', '1');
INSERT INTO `myweb_portfolio` VALUES ('28', '玩具联盟小程序', 'mvnlu2ttzekp7hcxgct3.jpg', '2022-01-10 09:06:00.000000', '2022-01-10 09:06:00.000000', '1', '1');
INSERT INTO `myweb_portfolio` VALUES ('29', '大连春天旅行社首页', 'og9w9d19tvbw2gxl5qjv.jpg', '2022-01-10 09:09:00.000000', '2022-01-10 09:09:00.000000', '1', '0');
INSERT INTO `myweb_portfolio` VALUES ('30', '大连芯冠科技有限公司首页', '3fdp74ze3sgxkes2kfy2.jpg', '2022-01-10 09:13:00.000000', '2022-01-10 09:13:00.000000', '1', '0');
INSERT INTO `myweb_portfolio` VALUES ('31', '大连市公安指挥中心首页', 'x93vt4ucu7vdaj0ku511.jpg', '2022-01-10 09:14:00.000000', '2022-01-10 09:14:00.000000', '1', '0');
INSERT INTO `myweb_portfolio` VALUES ('32', '大连圣释瑜伽首页', 'knzp7co9jtzn47mki0ek.jpg', '2022-01-10 09:15:00.000000', '2022-01-10 09:15:00.000000', '1', '0');

-- ----------------------------
-- Table structure for myweb_skills
-- ----------------------------
DROP TABLE IF EXISTS `myweb_skills`;
CREATE TABLE `myweb_skills` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `num` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `is_del` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of myweb_skills
-- ----------------------------
INSERT INTO `myweb_skills` VALUES ('1', 'PhotoShop', '80', '2021-12-14 08:49:00.000000', '2021-12-14 08:49:00.000000', '0');
INSERT INTO `myweb_skills` VALUES ('2', 'HTML/CSS', '80', '2021-12-14 08:49:00.000000', '2021-12-14 08:49:00.000000', '0');
INSERT INTO `myweb_skills` VALUES ('3', 'Vue', '60', '2021-12-14 08:49:00.000000', '2021-12-14 08:49:00.000000', '0');
INSERT INTO `myweb_skills` VALUES ('4', 'Python', '35', '2022-01-07 09:37:00.000000', '2022-01-07 09:37:00.000000', '0');
INSERT INTO `myweb_skills` VALUES ('5', 'Django', '35', '2022-01-07 09:37:00.000000', '2022-01-07 09:37:00.000000', '0');

-- ----------------------------
-- Table structure for myweb_studied
-- ----------------------------
DROP TABLE IF EXISTS `myweb_studied`;
CREATE TABLE `myweb_studied` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `time` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `school` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `major` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `is_del` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of myweb_studied
-- ----------------------------
INSERT INTO `myweb_studied` VALUES ('1', '2019-2021', '大连大学', '计算机科学与技术', '2021-12-14 08:50:00.000000', '2021-12-14 08:50:00.000000', '0');
INSERT INTO `myweb_studied` VALUES ('2', '2014-2016', '大连大学2', '计算机软件', '2021-12-14 08:50:00.000000', '2021-12-14 08:50:00.000000', '0');

-- ----------------------------
-- Table structure for myweb_worked
-- ----------------------------
DROP TABLE IF EXISTS `myweb_worked`;
CREATE TABLE `myweb_worked` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `time` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `company` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `responsibility` longtext CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `is_del` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of myweb_worked
-- ----------------------------
INSERT INTO `myweb_worked` VALUES ('1', '2017年5月-2017年9月', '智慧党建大数据可视化分析平台管理系统', '项目采用 layui iframe 版本，主要功能模块有智慧党建（党员信息，学历，年龄，预备\r\n党员等信息），综合治理（人口信息，出警次数，重点管控人员，出警类别，历年人口数对比等信\r\n息），审批服务（审批服务统计，热力图展示，县、街道、社区办案排名等信息），经济发展（GDP, 工业主营收入，工业企业利润，GDP 同比曲线，税收收入占比等），市场监管（市场主体分布图，\r\n特种设备热力分布图，营业状态基本情况等信息），综合执法（总体案件数，处置成功占比，案件\r\n分类总体排行，执法人员学历信息等信息）的增删改查，echarts 图的展示，用户登录，修改密码。', '2021-12-14 08:51:00.000000', '2021-12-14 08:51:00.000000', '0');
INSERT INTO `myweb_worked` VALUES ('2', '2017年10月-2018年1月', '大数据可视化分析平台', '项目采用 Bootstrap 框架，主要功能模块有智慧党建大数据可视化分析平台，综合治理\r\n大数据可视化分析平台，审批服务大数据可视化分析平台，经济发展大数据可视化分析平台，市场\r\n监管大数据可视化分析平台，综合执法大数据智能分析平台的数据大屏可视化，echarts 图的展示，\r\n热力图的展示。', '2021-12-14 08:51:00.000000', '2021-12-14 08:51:00.000000', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of token
-- ----------------------------

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
INSERT INTO `user` VALUES ('2', 'admin', null, '123123', '01', '张三111', '15942458888', 'Y', '19', '0', '2024-01-15 11:01:19');
INSERT INTO `user` VALUES ('3', 'admin2', null, '123456', '03', '张三3', '15942458888', 'Y', null, '0', '2024-01-15 11:01:23');
