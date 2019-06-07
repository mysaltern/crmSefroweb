/*
 Navicat Premium Data Transfer

 Source Server         : portal
 Source Server Type    : MySQL
 Source Server Version : 100131
 Source Host           : localhost:3306
 Source Schema         : sefrowebcms

 Target Server Type    : MySQL
 Target Server Version : 100131
 File Encoding         : 65001

 Date: 07/06/2019 20:41:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for about
-- ----------------------------
DROP TABLE IF EXISTS `about`;
CREATE TABLE `about`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tell` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tell2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `lat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `lng` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of about
-- ----------------------------
INSERT INTO `about` VALUES (2, 'dfgdfg', 'dgdg', '', '35.74593135576459', '51.37545183563236');

-- ----------------------------
-- Table structure for auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE `auth_assignment`  (
  `item_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`, `user_id`) USING BTREE,
  INDEX `idx-auth_assignment-user_id`(`user_id`) USING BTREE,
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_assignment
-- ----------------------------
INSERT INTO `auth_assignment` VALUES ('admin', '1', 1);

-- ----------------------------
-- Table structure for auth_item
-- ----------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item`  (
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE,
  INDEX `rule_name`(`rule_name`) USING BTREE,
  INDEX `idx-auth_item-type`(`type`) USING BTREE,
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_item
-- ----------------------------
INSERT INTO `auth_item` VALUES ('admin', 1, NULL, NULL, NULL, 1, NULL);

-- ----------------------------
-- Table structure for auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE `auth_item_child`  (
  `parent` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`, `child`) USING BTREE,
  INDEX `child`(`child`) USING BTREE,
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule`  (
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` char(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `entityId` int(11) NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `level` smallint(6) NOT NULL DEFAULT 1,
  `createdBy` int(11) NOT NULL,
  `updatedBy` int(11) NOT NULL,
  `relatedTo` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `url` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `createdAt` int(11) NOT NULL,
  `updatedAt` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx-Comment-entity`(`entity`) USING BTREE,
  INDEX `idx-Comment-status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 'cdaec8da', 2, 'nazare 1', NULL, 1, 1, 1, 'common\\models\\News:2', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/news/index', 2, 1554380749, 1559922208);
INSERT INTO `comment` VALUES (2, 'cdaec8da', 3, 'nazare 2222', NULL, 1, 1, 1, 'common\\models\\News:2', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/news/index', 3, 1554380749, 1559922227);

-- ----------------------------
-- Table structure for crm_addresstypes
-- ----------------------------
DROP TABLE IF EXISTS `crm_addresstypes`;
CREATE TABLE `crm_addresstypes`  (
  `id` int(11) NOT NULL,
  `addressType` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of crm_addresstypes
-- ----------------------------
INSERT INTO `crm_addresstypes` VALUES (1, 'منزل', 1, 0, NULL, '2017-04-04 07:01:01.000', NULL, 36);
INSERT INTO `crm_addresstypes` VALUES (2, 'دفتر مرکزی', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `crm_addresstypes` VALUES (3, 'کارخانه', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `crm_addresstypes` VALUES (4, 'محل کار', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for crm_callnumbertypes
-- ----------------------------
DROP TABLE IF EXISTS `crm_callnumbertypes`;
CREATE TABLE `crm_callnumbertypes`  (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of crm_callnumbertypes
-- ----------------------------
INSERT INTO `crm_callnumbertypes` VALUES (1, 'تلفن ', 1, 0, NULL, '2017-04-04 07:00:51.000', NULL, 36);
INSERT INTO `crm_callnumbertypes` VALUES (2, 'همراه', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `crm_callnumbertypes` VALUES (3, 'فکس', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for crm_contactaddresses
-- ----------------------------
DROP TABLE IF EXISTS `crm_contactaddresses`;
CREATE TABLE `crm_contactaddresses`  (
  `id` int(11) NOT NULL,
  `addressTypeID` int(11) DEFAULT NULL,
  `addressDesc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `postalCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `contactID` int(11) DEFAULT NULL,
  `customerID` int(11) DEFAULT NULL,
  `cityID` int(11) DEFAULT NULL,
  `address` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `addressTypeID`(`addressTypeID`) USING BTREE,
  INDEX `cityID`(`cityID`) USING BTREE,
  INDEX `contactID`(`contactID`) USING BTREE,
  INDEX `customerID`(`customerID`) USING BTREE,
  CONSTRAINT `crm_contactaddresses_ibfk_1` FOREIGN KEY (`addressTypeID`) REFERENCES `crm_addresstypes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_contactaddresses_ibfk_2` FOREIGN KEY (`cityID`) REFERENCES `glb_city` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_contactaddresses_ibfk_3` FOREIGN KEY (`contactID`) REFERENCES `crm_contacts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_contactaddresses_ibfk_4` FOREIGN KEY (`customerID`) REFERENCES `sle_customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of crm_contactaddresses
-- ----------------------------
INSERT INTO `crm_contactaddresses` VALUES (1033, 1, '', '1', 71, 1067, 1139, '2', 1, 1, '2017-05-07 13:55:37.000', NULL, 1038, NULL);
INSERT INTO `crm_contactaddresses` VALUES (1034, 4, NULL, '5345345435', 72, 1068, 1432, 'qwewqeqweqe', 1, 1, '2017-05-08 10:37:35.000', NULL, 37, NULL);
INSERT INTO `crm_contactaddresses` VALUES (1035, 2, NULL, '', 72, 1068, 1467, '35345345345', 1, 0, '2017-05-08 15:41:52.000', NULL, 37, NULL);
INSERT INTO `crm_contactaddresses` VALUES (1036, 1, NULL, 'سیب', 73, 1069, 1346, 'سیب', 1, 0, '2017-05-31 08:51:18.000', NULL, 1039, NULL);
INSERT INTO `crm_contactaddresses` VALUES (1037, 2, NULL, '123', 74, 1070, 1465, 'asdada', 1, 1, '2017-05-31 09:49:21.000', NULL, 36, NULL);
INSERT INTO `crm_contactaddresses` VALUES (1038, 1, NULL, '', 74, 1070, 1257, 'تست تست تست', 1, 1, '2017-05-31 10:47:38.000', NULL, 36, NULL);
INSERT INTO `crm_contactaddresses` VALUES (1039, 1, NULL, '', 74, 1070, 1139, 'asdad', 1, 1, '2017-05-31 10:55:02.000', NULL, 36, NULL);
INSERT INTO `crm_contactaddresses` VALUES (1040, 1, NULL, '', 74, 1070, 1139, 'asfd', 1, 0, '2017-05-31 10:55:41.000', NULL, 36, NULL);
INSERT INTO `crm_contactaddresses` VALUES (1041, 1, NULL, '', 74, 1070, 1139, 'dfg', 1, 0, '2017-05-31 10:55:53.000', NULL, 36, NULL);
INSERT INTO `crm_contactaddresses` VALUES (1042, 1, NULL, '', 75, 1071, 1139, '', 1, 0, '2017-06-06 14:20:17.000', NULL, 3, NULL);
INSERT INTO `crm_contactaddresses` VALUES (1043, 1, NULL, '13657', 76, 1072, 1161, 'تهران', 1, 1, '2017-06-07 08:39:16.000', NULL, 34, NULL);
INSERT INTO `crm_contactaddresses` VALUES (1044, 1, NULL, '13657', 76, 1072, 1429, 'تهران - خ شریعتی', 1, 0, '2017-06-07 08:46:18.000', NULL, 34, NULL);
INSERT INTO `crm_contactaddresses` VALUES (1045, 1, NULL, '', 71, 1067, 1139, 'etrtet', 1, 1, '2017-06-07 11:33:16.000', NULL, 1038, NULL);
INSERT INTO `crm_contactaddresses` VALUES (1046, 1, NULL, '', 71, 1067, 1139, 'werw', 1, 1, '2017-06-07 14:39:41.000', NULL, 1038, NULL);
INSERT INTO `crm_contactaddresses` VALUES (1047, 1, NULL, '', 71, 1067, 1139, 'dtye', 1, 1, '2017-06-07 14:46:09.000', NULL, 1038, NULL);
INSERT INTO `crm_contactaddresses` VALUES (1048, 1, NULL, '', 71, 1067, 1139, 'dtye', 1, 1, '2017-06-07 14:46:53.000', NULL, 1038, NULL);
INSERT INTO `crm_contactaddresses` VALUES (1049, 1, NULL, '', 71, 1067, 1139, '34t53', 1, 1, '2017-06-07 14:47:02.000', NULL, 1038, NULL);
INSERT INTO `crm_contactaddresses` VALUES (1050, 1, NULL, '', 71, 1067, 1139, 'werwr', 1, 1, '2017-06-07 14:47:14.000', NULL, 1038, NULL);
INSERT INTO `crm_contactaddresses` VALUES (1051, 1, NULL, '1231231', 73, 1069, 1383, 'آدرس منزل', 1, 0, '2017-07-02 10:53:58.000', NULL, 1039, NULL);
INSERT INTO `crm_contactaddresses` VALUES (1052, 1, NULL, '10', NULL, NULL, 1316, 'test api ast ', 1, 0, '2017-07-05 08:39:33.000', NULL, 61, NULL);
INSERT INTO `crm_contactaddresses` VALUES (1053, 1, NULL, '10', 73, 1069, 1316, 'test api ast ', 1, 0, '2017-07-05 08:39:58.000', NULL, 1039, NULL);
INSERT INTO `crm_contactaddresses` VALUES (1054, 1, NULL, '10', 73, 1069, 1316, 'test api ast  2', 1, 1, '2017-07-05 08:40:42.000', NULL, 1039, NULL);
INSERT INTO `crm_contactaddresses` VALUES (1055, 1, NULL, '12312312', 79, 1075, 1468, 'fdsfsdf', 1, 1, '2017-07-05 08:54:20.000', NULL, 1, NULL);
INSERT INTO `crm_contactaddresses` VALUES (1056, 1, NULL, '10', 73, 1069, 1316, 'test api ast  2', 1, 0, '2017-07-05 09:43:51.000', NULL, 1039, NULL);
INSERT INTO `crm_contactaddresses` VALUES (1057, 1, NULL, '12313123', 79, 1075, 1432, 'asdad', 1, 0, '2017-07-05 15:40:13.000', NULL, 1, NULL);
INSERT INTO `crm_contactaddresses` VALUES (1061, 2, NULL, '123123', 81, 1076, 1139, 'شفقی', 1, 0, '2017-07-08 10:34:07.000', NULL, 1044, NULL);
INSERT INTO `crm_contactaddresses` VALUES (1062, 1, NULL, '3333', 75, 1071, 1139, '', 1, 1, '2017-07-12 12:13:51.000', NULL, 3, NULL);
INSERT INTO `crm_contactaddresses` VALUES (1063, 1, NULL, 'asd', 75, 1071, 1139, '', 1, 1, '2017-07-12 12:17:11.000', NULL, 3, NULL);
INSERT INTO `crm_contactaddresses` VALUES (1064, 1, NULL, '2342342', 75, 1071, 1139, 'ew', 1, 1, '2017-07-12 12:27:20.000', NULL, 3, NULL);
INSERT INTO `crm_contactaddresses` VALUES (1065, 3, NULL, 'sdfsdf', 75, 1071, 1139, '', 1, 1, '2017-07-12 12:27:49.000', NULL, 3, NULL);
INSERT INTO `crm_contactaddresses` VALUES (1066, 1, NULL, '', 75, 1071, 1139, '', 1, 1, '2017-07-12 12:56:51.000', NULL, 3, NULL);
INSERT INTO `crm_contactaddresses` VALUES (1067, 1, NULL, '', 75, 1071, 1139, '', 1, 1, '2017-07-15 08:19:32.000', NULL, 3, NULL);
INSERT INTO `crm_contactaddresses` VALUES (1068, 1, NULL, '', 75, 1071, 1139, '', 1, 0, '2017-07-15 08:54:09.000', NULL, 3, NULL);
INSERT INTO `crm_contactaddresses` VALUES (1069, 1, NULL, '', 75, 1071, 1139, '', 1, 0, '2017-07-15 09:02:08.000', NULL, 3, NULL);
INSERT INTO `crm_contactaddresses` VALUES (1070, 1, NULL, '1111111111', 75, 1071, 1139, 'سی', 1, 0, '2017-07-15 09:18:31.000', NULL, 3, NULL);
INSERT INTO `crm_contactaddresses` VALUES (1071, 1, NULL, 'فففففففففف', 75, 1071, 1139, 'هعه', 1, 0, '2017-07-15 10:00:19.000', NULL, 3, NULL);
INSERT INTO `crm_contactaddresses` VALUES (2058, 1, NULL, '12312312', 71, 1067, 1139, 'rtyryr', 1, 0, '2017-08-20 10:48:14.000', NULL, 1038, NULL);
INSERT INTO `crm_contactaddresses` VALUES (2060, 2, NULL, '123123', NULL, NULL, 1139, 'شفقی', 1, 0, '2017-08-27 12:58:14.000', NULL, 21, NULL);
INSERT INTO `crm_contactaddresses` VALUES (2061, 2, NULL, '123123', 79, 1075, 1139, 'شفقی', 1, 0, '2017-08-27 13:00:02.000', NULL, 1, NULL);
INSERT INTO `crm_contactaddresses` VALUES (2062, 2, NULL, '123123', 79, 1075, 1139, 'شفقی', 1, 0, '2017-08-27 13:02:43.000', NULL, 1, NULL);
INSERT INTO `crm_contactaddresses` VALUES (2063, 2, NULL, '123123', NULL, NULL, 1139, 'شفقی', 1, 0, '2017-08-27 13:03:01.000', NULL, 1, NULL);
INSERT INTO `crm_contactaddresses` VALUES (2064, 2, NULL, '123123', 79, NULL, 1139, 'شفقی', 1, 0, '2017-08-27 13:03:10.000', NULL, 1, NULL);
INSERT INTO `crm_contactaddresses` VALUES (2065, 2, NULL, '123123', 79, 1075, 1139, 'شفقی', 1, 0, '2017-08-27 13:05:07.000', NULL, 1, NULL);
INSERT INTO `crm_contactaddresses` VALUES (2066, 2, NULL, '123123', NULL, NULL, 1139, 'شفقی', 1, 0, '2017-08-27 13:05:30.000', NULL, 1, NULL);
INSERT INTO `crm_contactaddresses` VALUES (2067, 2, NULL, '123123', NULL, NULL, 1139, 'شفقی', 1, 0, '2017-08-27 13:07:53.000', NULL, 1, NULL);
INSERT INTO `crm_contactaddresses` VALUES (2068, 2, NULL, '123123', 79, NULL, 1139, 'شفقی', 1, 0, '2017-08-27 13:08:11.000', NULL, 1, NULL);
INSERT INTO `crm_contactaddresses` VALUES (2069, 2, NULL, '123123', 79, 1075, 1139, 'شفقی', 1, 0, '2017-08-27 13:09:45.000', NULL, 1, NULL);
INSERT INTO `crm_contactaddresses` VALUES (2070, 2, NULL, '123123', 79, 1075, 1139, 'شفقی', 1, 0, '2017-08-27 13:13:01.000', NULL, 1, NULL);
INSERT INTO `crm_contactaddresses` VALUES (2071, 2, NULL, '123123', 79, 1075, 1139, 'شفقی', 1, 0, '2017-08-27 13:14:31.000', NULL, 1, NULL);
INSERT INTO `crm_contactaddresses` VALUES (2072, 2, NULL, '123123', 79, 1075, 1139, 'شفقی', 1, 0, '2017-08-27 13:14:49.000', NULL, 1, NULL);
INSERT INTO `crm_contactaddresses` VALUES (2073, 2, NULL, '123123', 79, 1075, 1139, 'شفقی', 1, 0, '2017-08-27 13:14:56.000', NULL, 1, NULL);
INSERT INTO `crm_contactaddresses` VALUES (2074, 2, NULL, '123123', 79, 1075, 1139, 'شفقی', 1, 0, '2017-08-27 13:15:05.000', NULL, 1, NULL);
INSERT INTO `crm_contactaddresses` VALUES (2075, 2, NULL, '123123', 79, 1075, 1139, 'شفقی', 1, 0, '2017-08-27 13:15:20.000', NULL, 1, NULL);
INSERT INTO `crm_contactaddresses` VALUES (2076, 2, NULL, '123123', 79, 1075, 1139, 'شفقی', 1, 0, '2017-08-27 13:15:28.000', NULL, 1, NULL);
INSERT INTO `crm_contactaddresses` VALUES (2077, 2, NULL, '123123', 79, 1075, 1139, 'شفقی', 1, 0, '2017-08-27 13:17:03.000', NULL, 1, NULL);
INSERT INTO `crm_contactaddresses` VALUES (2078, 2, NULL, '123123', 79, 1075, 1139, 'شفقی', 1, 0, '2017-08-27 13:20:05.000', NULL, 1, NULL);
INSERT INTO `crm_contactaddresses` VALUES (2079, 1, NULL, '1797951514', 84, 1079, 1470, 'asdad', 1, 0, '2017-11-12 12:19:09.000', NULL, 2, NULL);

-- ----------------------------
-- Table structure for crm_contactcallnumbers
-- ----------------------------
DROP TABLE IF EXISTS `crm_contactcallnumbers`;
CREATE TABLE `crm_contactcallnumbers`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contactID` int(11) DEFAULT NULL,
  `customerID` int(11) DEFAULT NULL,
  `callNumberType` int(11) DEFAULT NULL,
  `numberDesc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `callNumber` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `callNumberType`(`callNumberType`) USING BTREE,
  INDEX `contactID`(`contactID`) USING BTREE,
  INDEX `customerID`(`customerID`) USING BTREE,
  CONSTRAINT `crm_contactcallnumbers_ibfk_1` FOREIGN KEY (`callNumberType`) REFERENCES `crm_callnumbertypes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_contactcallnumbers_ibfk_2` FOREIGN KEY (`contactID`) REFERENCES `crm_contacts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_contactcallnumbers_ibfk_3` FOREIGN KEY (`customerID`) REFERENCES `sle_customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3159 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of crm_contactcallnumbers
-- ----------------------------
INSERT INTO `crm_contactcallnumbers` VALUES (1137, 71, 1067, 1, NULL, '09336086658', 1, 0, '2017-05-07 13:50:26.000', NULL, 1038, NULL);
INSERT INTO `crm_contactcallnumbers` VALUES (1138, 71, 1067, 2, NULL, '02145012121', 1, 0, '2017-05-07 13:50:26.000', NULL, 1038, NULL);
INSERT INTO `crm_contactcallnumbers` VALUES (1139, 72, 1068, 1, NULL, '11', 1, 0, '2017-05-08 10:36:57.000', NULL, 37, NULL);
INSERT INTO `crm_contactcallnumbers` VALUES (1140, 72, 1068, 2, NULL, '213123123123', 1, 0, '2017-05-08 10:36:57.000', NULL, 37, NULL);
INSERT INTO `crm_contactcallnumbers` VALUES (1141, 73, 1069, 1, NULL, '123', 1, 0, '2017-05-31 08:51:07.000', NULL, 1039, NULL);
INSERT INTO `crm_contactcallnumbers` VALUES (1142, 73, 1069, 2, NULL, '02188313424', 1, 0, '2017-05-31 08:51:07.000', NULL, 1039, NULL);
INSERT INTO `crm_contactcallnumbers` VALUES (1143, 74, 1070, 1, NULL, '23423', 1, 0, '2017-05-31 09:48:53.000', NULL, 36, NULL);
INSERT INTO `crm_contactcallnumbers` VALUES (1144, 74, 1070, 2, NULL, '34234', 1, 0, '2017-05-31 09:48:53.000', NULL, 36, NULL);
INSERT INTO `crm_contactcallnumbers` VALUES (1145, 75, 1071, 1, NULL, '90909090909', 1, 0, '2017-06-06 14:12:27.000', NULL, 3, NULL);
INSERT INTO `crm_contactcallnumbers` VALUES (1146, 75, 1071, 2, NULL, '12123123213', 1, 0, '2017-06-06 14:12:27.000', NULL, 3, NULL);
INSERT INTO `crm_contactcallnumbers` VALUES (1147, 76, 1072, 1, NULL, '09123852350', 1, 0, '2017-06-07 08:38:33.000', NULL, 34, NULL);
INSERT INTO `crm_contactcallnumbers` VALUES (1148, 76, 1072, 2, NULL, '66733637', 1, 0, '2017-06-07 08:38:33.000', NULL, 34, NULL);
INSERT INTO `crm_contactcallnumbers` VALUES (1149, 77, 1073, 1, NULL, '', 1, 0, '2017-06-14 08:11:06.000', NULL, 1040, NULL);
INSERT INTO `crm_contactcallnumbers` VALUES (1150, 77, 1073, 2, NULL, '', 1, 0, '2017-06-14 08:11:06.000', NULL, 1040, NULL);
INSERT INTO `crm_contactcallnumbers` VALUES (1151, 78, 1074, 1, NULL, '', 1, 0, '2017-06-14 11:06:04.000', NULL, 1042, NULL);
INSERT INTO `crm_contactcallnumbers` VALUES (1152, 78, 1074, 2, NULL, '', 1, 0, '2017-06-14 11:06:04.000', NULL, 1042, NULL);
INSERT INTO `crm_contactcallnumbers` VALUES (1153, 79, 1075, 1, NULL, '024500450454', 1, 0, '2017-07-05 08:28:37.000', NULL, 1, NULL);
INSERT INTO `crm_contactcallnumbers` VALUES (1154, 79, 1075, 2, NULL, '01211212121212', 1, 0, '2017-07-05 08:28:37.000', NULL, 1, NULL);
INSERT INTO `crm_contactcallnumbers` VALUES (1155, 81, 1076, 1, NULL, '09336086658', 1, 0, '2017-07-05 15:50:32.000', NULL, 1044, NULL);
INSERT INTO `crm_contactcallnumbers` VALUES (1156, 81, 1076, 2, NULL, '02166506656', 1, 0, '2017-07-05 15:50:32.000', NULL, 1044, NULL);
INSERT INTO `crm_contactcallnumbers` VALUES (1157, 82, 1077, 1, NULL, '09336086658', 1, 0, '2017-07-08 08:36:53.000', NULL, 1044, NULL);
INSERT INTO `crm_contactcallnumbers` VALUES (1158, 82, 1077, 2, NULL, '02166506656', 1, 0, '2017-07-08 08:36:53.000', NULL, 1044, NULL);
INSERT INTO `crm_contactcallnumbers` VALUES (1159, 83, 1078, 1, NULL, '09336086658', 1, 0, '2017-07-08 09:43:20.000', NULL, 1044, NULL);
INSERT INTO `crm_contactcallnumbers` VALUES (1160, 83, 1078, 2, NULL, '02166506656', 1, 0, '2017-07-08 09:43:20.000', NULL, 1044, NULL);
INSERT INTO `crm_contactcallnumbers` VALUES (1161, 84, 1079, 1, NULL, '09336086658', 1, 0, '2017-07-08 10:19:38.000', NULL, 1046, NULL);
INSERT INTO `crm_contactcallnumbers` VALUES (1162, 84, 1079, 2, NULL, '02166506656', 1, 0, '2017-07-08 10:19:38.000', NULL, 1046, NULL);
INSERT INTO `crm_contactcallnumbers` VALUES (1163, 85, 1080, 1, NULL, '09336086658', 1, 0, '2017-07-08 10:19:44.000', NULL, 1046, NULL);
INSERT INTO `crm_contactcallnumbers` VALUES (1164, 85, 1080, 2, NULL, '02166506656', 1, 0, '2017-07-08 10:19:44.000', NULL, 1046, NULL);
INSERT INTO `crm_contactcallnumbers` VALUES (1165, 86, 1081, 1, NULL, '09336086658', 1, 0, '2017-07-09 09:23:06.000', NULL, 1046, NULL);
INSERT INTO `crm_contactcallnumbers` VALUES (1166, 86, 1081, 2, NULL, '02166506656', 1, 0, '2017-07-09 09:23:06.000', NULL, 1046, NULL);
INSERT INTO `crm_contactcallnumbers` VALUES (2157, 1082, 2077, 1, NULL, '09336086658', 1, 0, '2017-11-12 12:18:52.000', NULL, 2, NULL);
INSERT INTO `crm_contactcallnumbers` VALUES (2158, 1082, 2077, 2, NULL, '02188326560', 1, 0, '2017-11-12 12:18:52.000', NULL, 2, NULL);
INSERT INTO `crm_contactcallnumbers` VALUES (3157, 2082, 3077, 1, NULL, '09336086658', 1, 0, '2018-01-16 15:45:23.000', NULL, 1046, NULL);
INSERT INTO `crm_contactcallnumbers` VALUES (3158, 2082, 3077, 2, NULL, '02166506656', 1, 0, '2018-01-16 15:45:24.000', NULL, 1046, NULL);

-- ----------------------------
-- Table structure for crm_contactfavorites
-- ----------------------------
DROP TABLE IF EXISTS `crm_contactfavorites`;
CREATE TABLE `crm_contactfavorites`  (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ContactID` int(11) DEFAULT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  INDEX `ContactID`(`ContactID`) USING BTREE,
  INDEX `ProductID`(`ProductID`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `crm_contactfavorites_ibfk_1` FOREIGN KEY (`ContactID`) REFERENCES `crm_contacts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_contactfavorites_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `inv_products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_contactfavorites_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of crm_contactfavorites
-- ----------------------------
INSERT INTO `crm_contactfavorites` VALUES (13, 1039, NULL, 158, 1, 0, '2017-06-18 12:12:21.000', NULL, 1039, NULL);
INSERT INTO `crm_contactfavorites` VALUES (14, 33, NULL, 156, 1, 0, '2017-06-18 12:13:53.000', NULL, 1039, NULL);
INSERT INTO `crm_contactfavorites` VALUES (18, 1039, NULL, 155, 1, 0, '2017-06-18 12:43:02.000', NULL, 1039, NULL);
INSERT INTO `crm_contactfavorites` VALUES (19, 1039, NULL, 152, 0, 0, '2017-06-18 12:43:08.000', NULL, 1039, NULL);
INSERT INTO `crm_contactfavorites` VALUES (21, 1, NULL, 152, 1, 0, '2017-09-03 12:37:26.000', NULL, NULL, NULL);
INSERT INTO `crm_contactfavorites` VALUES (15, 1039, NULL, 167, 1, 0, '2017-06-18 12:18:40.000', NULL, 1039, NULL);
INSERT INTO `crm_contactfavorites` VALUES (16, 1039, NULL, 156, 0, 0, '2017-06-18 12:20:50.000', NULL, 1039, NULL);
INSERT INTO `crm_contactfavorites` VALUES (17, 1039, NULL, 164, 1, 0, '2017-06-18 12:21:13.000', NULL, 1039, NULL);

-- ----------------------------
-- Table structure for crm_contacts
-- ----------------------------
DROP TABLE IF EXISTS `crm_contacts`;
CREATE TABLE `crm_contacts`  (
  `id` int(11) NOT NULL,
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `lName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `customerID` int(11) DEFAULT NULL,
  `nationalCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `insuranceCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `departmentID` int(11) DEFAULT NULL,
  `positionID` int(11) DEFAULT NULL,
  `contactTypeID` int(11) DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `gender` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `contactTypeID`(`contactTypeID`) USING BTREE,
  INDEX `customerID`(`customerID`) USING BTREE,
  INDEX `departmentID`(`departmentID`) USING BTREE,
  INDEX `positionID`(`positionID`) USING BTREE,
  INDEX `userID`(`userID`) USING BTREE,
  CONSTRAINT `crm_contacts_ibfk_1` FOREIGN KEY (`contactTypeID`) REFERENCES `crm_contacttypes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_contacts_ibfk_2` FOREIGN KEY (`customerID`) REFERENCES `sle_customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_contacts_ibfk_3` FOREIGN KEY (`departmentID`) REFERENCES `crm_departments` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_contacts_ibfk_4` FOREIGN KEY (`positionID`) REFERENCES `crm_positions` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_contacts_ibfk_5` FOREIGN KEY (`userID`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of crm_contacts
-- ----------------------------
INSERT INTO `crm_contacts` VALUES (71, NULL, NULL, 'Mohammad', 'Saltanatpouri', 1038, 1067, '1234567890', NULL, NULL, NULL, NULL, 1, 0, '2017-05-07 13:50:26.000', NULL, 1038, NULL, 1);
INSERT INTO `crm_contacts` VALUES (72, NULL, NULL, 'asda', 'asdsad', 37, 1068, '123123', NULL, NULL, NULL, NULL, 1, 0, '2017-05-08 10:36:57.000', NULL, 37, NULL, 1);
INSERT INTO `crm_contacts` VALUES (73, NULL, NULL, 'سفش', 'فثسف', 1039, 1069, '343', NULL, NULL, NULL, NULL, 1, 0, '2017-05-31 08:51:07.000', NULL, 1039, NULL, 0);
INSERT INTO `crm_contacts` VALUES (74, NULL, NULL, 'sdf', 'sdfsf', 36, 1070, '2131231', NULL, NULL, NULL, NULL, 1, 0, '2017-05-31 09:48:53.000', NULL, 36, NULL, 1);
INSERT INTO `crm_contacts` VALUES (75, NULL, NULL, 'سی', 'سی', 3, 1071, '1212221121', NULL, NULL, NULL, NULL, 1, 0, '2017-06-06 14:12:27.000', NULL, 3, NULL, NULL);
INSERT INTO `crm_contacts` VALUES (76, NULL, NULL, 'مححد', 'معززی', 34, 1072, '0067793983', NULL, NULL, NULL, NULL, 1, 0, '2017-06-07 08:38:33.000', NULL, 34, NULL, 0);
INSERT INTO `crm_contacts` VALUES (77, NULL, NULL, 'milad', 'saltanatpouri', 1040, 1073, '', NULL, NULL, NULL, NULL, 1, 0, '2017-06-14 08:11:06.000', NULL, 1040, NULL, 0);
INSERT INTO `crm_contacts` VALUES (78, NULL, NULL, '', '', 1042, 1074, '', NULL, NULL, NULL, NULL, 1, 0, '2017-06-14 11:06:04.000', NULL, 1042, NULL, NULL);
INSERT INTO `crm_contacts` VALUES (79, NULL, NULL, '1', '2', 1, 1075, '12', NULL, NULL, NULL, NULL, 1, 0, '2017-07-05 08:28:37.000', NULL, 1, NULL, 1);
INSERT INTO `crm_contacts` VALUES (81, NULL, NULL, 'milad', 'saltanatpouri', 1044, 1076, '1231231233', NULL, NULL, NULL, NULL, 1, 0, '2017-07-05 15:50:32.000', NULL, 1044, NULL, 1);
INSERT INTO `crm_contacts` VALUES (82, NULL, NULL, 'milad', 'saltanatpouri', 1044, 1077, '1231231233', NULL, NULL, NULL, NULL, 1, 0, '2017-07-08 08:36:53.000', NULL, 1044, NULL, 1);
INSERT INTO `crm_contacts` VALUES (83, NULL, NULL, 'milad', 'saltanatpouri', 1044, 1078, '1231231233', NULL, NULL, NULL, NULL, 1, 0, '2017-07-08 09:43:20.000', NULL, 1044, NULL, 1);
INSERT INTO `crm_contacts` VALUES (84, NULL, NULL, 'milad', 'saltanatpouri', 2, 1079, '1231231233', NULL, NULL, NULL, NULL, 1, 0, '2017-07-08 10:19:38.000', NULL, 1046, NULL, 1);
INSERT INTO `crm_contacts` VALUES (85, NULL, NULL, 'milad', 'saltanatpouri', 1046, 1080, '1231231233', NULL, NULL, NULL, NULL, 1, 0, '2017-07-08 10:19:44.000', NULL, 1046, NULL, 1);
INSERT INTO `crm_contacts` VALUES (86, NULL, NULL, 'milad', 'saltanatpouri', 1046, 1081, '1231231233', NULL, NULL, NULL, NULL, 1, 0, '2017-07-09 09:23:06.000', NULL, 1046, NULL, 1);
INSERT INTO `crm_contacts` VALUES (1082, NULL, NULL, 'asdasd', 'asdad', 2, 2077, '123', NULL, NULL, NULL, NULL, 1, 0, '2017-11-12 12:18:52.000', NULL, 2, NULL, 0);
INSERT INTO `crm_contacts` VALUES (2082, NULL, NULL, 'milad', 'saltanatpouri', 1046, 3077, '1231231233', NULL, NULL, NULL, NULL, 1, 0, '2018-01-16 15:45:24.000', NULL, 1046, NULL, 1);

-- ----------------------------
-- Table structure for crm_contacttypes
-- ----------------------------
DROP TABLE IF EXISTS `crm_contacttypes`;
CREATE TABLE `crm_contacttypes`  (
  `id` int(11) NOT NULL,
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of crm_contacttypes
-- ----------------------------
INSERT INTO `crm_contacttypes` VALUES (1, '1', 'مشتریان', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `crm_contacttypes` VALUES (2, '2', 'پرسنل', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for crm_departments
-- ----------------------------
DROP TABLE IF EXISTS `crm_departments`;
CREATE TABLE `crm_departments`  (
  `id` int(11) NOT NULL,
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of crm_departments
-- ----------------------------
INSERT INTO `crm_departments` VALUES (1, '1', 'فروش', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `crm_departments` VALUES (2, '2', 'تولید', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `crm_departments` VALUES (3, '3', 'بازرگانی', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for crm_positions
-- ----------------------------
DROP TABLE IF EXISTS `crm_positions`;
CREATE TABLE `crm_positions`  (
  `id` int(11) NOT NULL,
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of crm_positions
-- ----------------------------
INSERT INTO `crm_positions` VALUES (1, '1', 'مدیر عامل', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `crm_positions` VALUES (2, '2', 'مدیر بازرگانی', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `crm_positions` VALUES (3, '3', 'مدیر فروش', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `crm_positions` VALUES (4, '4', 'کارمند فروش', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for filemanager_mediafile
-- ----------------------------
DROP TABLE IF EXISTS `filemanager_mediafile`;
CREATE TABLE `filemanager_mediafile`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `alt` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `thumbs` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of filemanager_mediafile
-- ----------------------------
INSERT INTO `filemanager_mediafile` VALUES (15, 'a.jpg', 'image/jpeg', '/uploads//2019/04/a.jpg', NULL, '324760', NULL, 'a:3:{s:5:\"small\";s:29:\"/uploads//2019/04/a-small.jpg\";s:6:\"medium\";s:30:\"/uploads//2019/04/a-medium.jpg\";s:5:\"large\";s:29:\"/uploads//2019/04/a-large.jpg\";}', 1554828300, NULL);
INSERT INTO `filemanager_mediafile` VALUES (16, 'photo2017-12-0912-52-23.jpg', 'image/jpeg', '/uploads/2019/04/photo2017-12-0912-52-23.jpg', NULL, '65316', NULL, 'a:3:{s:5:\"small\";s:50:\"/uploads/2019/04/photo2017-12-0912-52-23-small.jpg\";s:6:\"medium\";s:51:\"/uploads/2019/04/photo2017-12-0912-52-23-medium.jpg\";s:5:\"large\";s:50:\"/uploads/2019/04/photo2017-12-0912-52-23-large.jpg\";}', 1554830094, NULL);
INSERT INTO `filemanager_mediafile` VALUES (17, 'comingsoon.png', 'image/png', '/uploads2/2019/04/comingsoon.png', NULL, '14656', NULL, 'a:3:{s:5:\"small\";s:38:\"/uploads2/2019/04/comingsoon-small.png\";s:6:\"medium\";s:39:\"/uploads2/2019/04/comingsoon-medium.png\";s:5:\"large\";s:38:\"/uploads2/2019/04/comingsoon-large.png\";}', 1554830136, NULL);
INSERT INTO `filemanager_mediafile` VALUES (18, 'img7495.jpg', 'image/jpeg', '/uploads/2019/04/img7495.jpg', NULL, '11965', NULL, 'a:3:{s:5:\"small\";s:34:\"/uploads/2019/04/img7495-small.jpg\";s:6:\"medium\";s:35:\"/uploads/2019/04/img7495-medium.jpg\";s:5:\"large\";s:34:\"/uploads/2019/04/img7495-large.jpg\";}', 1554830169, NULL);
INSERT INTO `filemanager_mediafile` VALUES (19, 'a.jpg', 'image/jpeg', '/uploads/2019/04/a.jpg', NULL, '324760', NULL, 'a:3:{s:5:\"small\";s:28:\"/uploads/2019/04/a-small.jpg\";s:6:\"medium\";s:29:\"/uploads/2019/04/a-medium.jpg\";s:5:\"large\";s:28:\"/uploads/2019/04/a-large.jpg\";}', 1554833204, NULL);
INSERT INTO `filemanager_mediafile` VALUES (20, 'lottery.png', 'image/png', '/uploads/2019/05/lottery.png', NULL, '418682', NULL, 'a:3:{s:5:\"small\";s:34:\"/uploads/2019/05/lottery-small.png\";s:6:\"medium\";s:35:\"/uploads/2019/05/lottery-medium.png\";s:5:\"large\";s:34:\"/uploads/2019/05/lottery-large.png\";}', 1557673570, NULL);

-- ----------------------------
-- Table structure for filemanager_mediafile_tag
-- ----------------------------
DROP TABLE IF EXISTS `filemanager_mediafile_tag`;
CREATE TABLE `filemanager_mediafile_tag`  (
  `mediafile_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  INDEX `filemanager_mediafile_tag_mediafile_id__mediafile_id`(`mediafile_id`) USING BTREE,
  INDEX `filemanager_mediafile_tag_tag_id__tag_id`(`tag_id`) USING BTREE,
  CONSTRAINT `filemanager_mediafile_tag_mediafile_id__mediafile_id` FOREIGN KEY (`mediafile_id`) REFERENCES `filemanager_mediafile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `filemanager_mediafile_tag_tag_id__tag_id` FOREIGN KEY (`tag_id`) REFERENCES `filemanager_tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for filemanager_owners
-- ----------------------------
DROP TABLE IF EXISTS `filemanager_owners`;
CREATE TABLE `filemanager_owners`  (
  `mediafile_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `owner_attribute` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`mediafile_id`, `owner_id`, `owner`, `owner_attribute`) USING BTREE,
  CONSTRAINT `filemanager_owners_ref_mediafile` FOREIGN KEY (`mediafile_id`) REFERENCES `filemanager_mediafile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for filemanager_tag
-- ----------------------------
DROP TABLE IF EXISTS `filemanager_tag`;
CREATE TABLE `filemanager_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for glb_city
-- ----------------------------
DROP TABLE IF EXISTS `glb_city`;
CREATE TABLE `glb_city`  (
  `id` int(11) NOT NULL,
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `provinceID` int(11) DEFAULT NULL,
  `centerID` int(11) DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `provinceID`(`provinceID`) USING BTREE,
  CONSTRAINT `glb_city_ibfk_1` FOREIGN KEY (`provinceID`) REFERENCES `glb_province` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of glb_city
-- ----------------------------
INSERT INTO `glb_city` VALUES (1139, '115', 'آذرشهر', 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1140, '102', 'تبريز', 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1141, '201', 'ارومیه', 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1142, '210', 'بوكان', 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1143, '301', 'اردبيل', 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1144, '402', 'اصفهان', 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1145, '809', 'اسلامشهر', 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1146, '804', 'شميرانات', 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1147, '808', 'شهريار', 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1148, '1901', 'كرج', 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1149, '806', 'ورامين', 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1150, '1601', 'بيرجند', 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1151, '1013', 'قوچان', 104, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1152, '1016', 'مشهد', 104, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1153, '1301', 'بجنورد', 99, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1154, '1102', 'انديمشك', 105, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1155, '1103', 'اهواز', 105, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1156, '1107', 'خرمشهر', 105, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1157, '1112', 'شوشتر', 105, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1158, '707', 'شيراز', 98, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1159, '1702', 'تاكستان', 109, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1160, '1701', 'قزوين', 109, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1161, '1801', 'قم', 110, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1162, '2108', 'كرمان', 112, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1163, '2202', 'كرمانشاه', 113, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1164, '2405', 'گرگان', 115, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1165, '2505', 'رشت', 116, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1166, '2511', 'لاهيجان', 116, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1167, '2702', 'بابل', 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1168, '2801', 'اراك', 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1169, '3004', 'همدان', 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1170, '3104', 'مهريز', 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1171, '3105', 'يزد', 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1172, '801', 'تهران', 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1173, '231000', 'یاسوج', 114, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1174, '221000', 'باختران', 113, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1175, '213', 'اشنويه ', 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1176, '1020', 'سرخس ', 104, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1177, '1906', 'مردآباد', 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1178, '2605', 'دورود', 117, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1179, '704', 'جهرم ', 98, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1180, '2905', 'ميناب ', 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1181, '408', 'فلاورجان ', 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1182, '711', 'لارستان', 98, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1183, '1015', 'گناباد', 104, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1184, '1114', 'شوش ', 105, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1185, '104', 'مراغه', 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1186, '1703', 'قزوين ', 109, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1187, '404', 'خوانسار', 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1188, '1205', 'خرمدره ', 106, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1189, '111', 'كليبر', 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1190, '802', 'دماوند', 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1191, '2708', 'تنكابن', 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1192, '1403', 'شاهرود', 107, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1193, '3006', 'اسدآباد', 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1194, '302', 'بيله سوار', 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1195, '2515', 'سياهكل', 116, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1196, '3001', 'تويسركان', 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1197, '905', 'اردل ', 103, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1198, '1006', 'تربت جام ', 104, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1199, '2408', 'راميان', 115, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1200, '2301', 'بوير احمد', 114, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1201, '1101', 'آبادان ', 105, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1202, '2303', 'گچساران', 114, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1203, '1025', 'مشهد', 104, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1204, '715', 'لامرد', 98, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1205, '206', 'ماكو', 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1206, '1010', 'طبس', 104, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1207, '121', 'عجب شير', 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1208, '504', 'شيروان و چرد اول', 100, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1209, '1603', 'سربيشه', 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1210, '719', 'زرين دشت ', 98, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1211, '1004', 'تايباد', 104, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1212, '2204', 'سرپل ذهاب', 113, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1213, '901', 'بر.جن', 103, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1214, '415', 'نطنز', 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1215, '2608', 'پلدختر', 117, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1216, '604', 'دشتي', 101, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1217, '1017', 'نيشابور', 104, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1218, '1116', 'اميديه ', 105, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1219, '1002', 'بجنورد', 104, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1220, '1018', 'چناران', 104, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1221, '1305', 'گرمه و جاجرم', 99, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1222, '419', 'تيران و كرون', 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1223, '507', 'ايوان ', 100, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1224, '2807', 'سربند', 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1225, '214', 'چالدران', 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1226, '2504', 'طوالش', 116, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1227, '108', 'بناب ', 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1228, '2102', 'بم ', 112, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1229, '2502', 'استانه اشرفيه', 116, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1230, '1904', 'نظرآباد', 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1231, '2207', 'كنگاور', 113, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1232, '2705', 'قائمشهر', 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1233, '503', 'دهلران ', 100, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1234, '2803', 'تفرش', 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1235, '407', 'فريدونشهر', 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1236, '2201', 'اسلام آباد غرب', 113, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1237, '2105', 'زرند', 112, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1238, '2203', 'پاوه ', 113, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1239, '202', 'پيرانشهر', 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1240, '708', 'فسا', 98, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1241, '2510', 'لنگرود', 116, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1242, '2806', 'ساوه ', 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1243, '2402', 'بندرتركمن', 115, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1244, '1608', 'بشرويه', 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1245, '2503', 'بندر انزلي', 116, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1246, '709', 'فيروزآباد', 98, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1247, '2507', 'رودسر', 116, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1248, '405', 'سميرم ', 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1249, '1014', 'كاشمر', 104, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1250, '1606', 'سرايان', 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1251, '502', 'دره شهر', 100, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1252, '1607', 'فردوس', 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1253, '109', 'بستان آباد', 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1254, '1907', 'طالقان', 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1255, '105', 'مرند', 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1256, '307', 'كوثر', 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1257, '409', 'شهررضا', 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1258, '306', 'پارس آباد', 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1259, '1506', 'سراوان', 108, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1260, '303', 'خلخال ', 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1261, '2506', 'رودبار', 116, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1262, '2709', 'بابلسر', 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1263, '812', 'فيروزكوه', 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1264, '1401', 'دامغان ', 107, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1265, '1008', 'سبزوار', 104, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1266, '2005', 'قروه ', 111, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1267, '2208', 'گيلانغرب', 113, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1268, '1304', 'مانه و سملقان', 99, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1269, '2111', 'راور', 112, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1270, '605', 'دير', 101, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1271, '1505', 'زاهدان ', 108, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1272, '2109', 'كهنوج', 112, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1273, '212', 'تكاب', 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1274, '2711', 'فريدونکنار', 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1275, '2409', 'آزادشهر', 115, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1276, '2514', 'رضوانشهر', 116, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1277, '1007', 'درگز', 104, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1278, '3003', 'نهاوند', 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1279, '2715', 'نکا', 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1280, '204', 'سردشت', 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1281, '2604', 'دلفان ', 117, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1282, '1024', 'جاجرم ', 104, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1283, '2001', 'بانه ', 111, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1284, '1019', 'خواف ', 104, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1285, '2107', 'شهر بابك', 112, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1286, '803', 'ري', 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1287, '1903', 'هشتگرد', 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1288, '208', 'مياندواب', 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1289, '807', 'ساوجبلاغ', 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1290, '1902', 'کمالشهر', 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1291, '203', 'خوي ', 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1292, '1501', 'ايرانشهر', 108, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1293, '2403', 'علي آباد', 115, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1294, '207', 'مهاباد', 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1295, '1110', 'رامهرمز', 105, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1296, '2707', 'نوشهر', 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1297, '2508', 'صومعه سرا', 116, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1298, '810', 'رباط كريم', 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1299, '1113', 'مسجد سليمان', 105, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1300, '2104', 'رفسنجان', 112, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1301, '2704', 'گلوگاه', 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1302, '2407', 'مينودشت', 115, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1303, '2206', 'قصرشيرين ', 113, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1304, '3101', 'اردكان', 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1305, '1106', 'بهبهان', 105, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1306, '2802', 'اشتيان ', 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1307, '705', 'داراب ', 98, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1308, '1003', 'بيرجند', 104, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1309, '1602', 'درميان', 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1310, '2404', 'كردكوي', 115, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1311, '2609', 'سلسله ', 117, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1312, '1204', 'ايجرود', 106, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1313, '2606', 'كوهدشت', 117, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1314, '2603', 'خرم آباد', 117, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1315, '1009', 'شيروان ', 104, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1316, '1507', 'نيك شهر', 108, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1317, '2607', 'ازنا', 117, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1318, '308', 'نمين ', 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1319, '2601', 'اليگودرز', 117, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1320, '1011', 'فردوس', 104, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1321, '602', 'تنگستان ', 101, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1322, '2004', 'سنندج ', 111, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1323, '2302', 'كهكيلويه', 114, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1324, '3102', 'بافق ', 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1325, '2904', 'قشم ', 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1326, '3002', 'ملاير', 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1327, '903', 'فارسان ', 103, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1328, '1201', 'ابهر', 106, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1329, '412', 'لنجان ', 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1330, '1105', 'بندر ماهشهر', 105, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1331, '1203', 'زنجان ', 106, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1332, '1502', 'چابهار', 108, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1333, '501', 'ايلام ', 100, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1334, '2808', 'محلات ', 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1335, '2509', 'فومن', 116, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1336, '713', 'ممسني', 98, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1337, '2413', 'گاليكش', 115, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1338, '211', 'شاهين دژ', 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1339, '209', 'نقده ', 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1340, '2007', 'ديواندره ', 111, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1341, '2411', 'فاضل آباد', 115, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1342, '716', 'بوانات', 98, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1343, '2101', 'بافت ', 112, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1344, '2103', 'جيرفت ', 112, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1345, '717', 'ارسنجان', 98, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1346, '1402', 'سمنان ', 107, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1347, '401', 'اردستان', 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1348, '2714', 'نور', 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1349, '702', 'استهبان ', 98, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1350, '116', 'اسكو', 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1351, '1303', 'اسفراين', 99, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1352, '113', 'جلفا', 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1353, '811', 'پاكدشت', 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1354, '1021', 'نهبندان', 104, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1355, '2706', 'چالوس', 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1356, '416', 'برخوار اروميمه', 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1357, '1023', 'برداسكن', 104, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1358, '2513', 'املش', 116, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1359, '2701', 'ساري', 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1360, '1206', 'طارم', 106, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1361, '2414', 'مراوه تپه', 115, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1362, '2703', 'بهشهر', 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1363, '710', 'كازرون', 98, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1364, '2406', 'گنبد كاوس', 115, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1365, '902', 'شهركرد', 103, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1366, '2205', 'سنقر', 113, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1367, '3108', 'صدوق ', 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1368, '410', 'كاشان', 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1369, '2901', 'ابوموسي', 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1370, '505', 'مهران', 100, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1371, '2805', 'دليجان ', 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1372, '2903', 'بندرلنگه ', 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1373, '3103', 'تفت ', 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1374, '1108', 'دزفول ', 105, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1375, '2907', 'رودان ', 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1376, '304', 'مشكين شهر', 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1377, '110', 'شبستر', 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1378, '1605', 'نهبندان', 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1379, '2106', 'سيرجان', 112, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1380, '2501', 'استارا', 116, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1381, '1306', 'فاروج', 99, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1382, '2906', 'بندرجاسك', 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1383, '1202', 'خدابنده ', 106, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1384, '406', 'فريدون', 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1385, '2410', 'خان ببين', 115, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1386, '1115', 'باغ ملك', 105, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1387, '712', 'مرودشت', 98, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1388, '2209', 'جوانرود', 113, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1389, '720', 'قير و کارزين', 98, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1390, '106', 'ميانه', 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1391, '411', 'گلپايگان ', 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1392, '1109', 'دشت آزادگان', 105, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1393, '2110', 'بردسير', 112, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1394, '2211', 'هرسين ', 113, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1395, '2422', 'آق قلا', 115, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1396, '2902', 'بندرعباس ', 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1397, '3005', 'كبوتر آهنگ', 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1398, '2002', 'بيجار', 111, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1399, '101', 'اهر', 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1400, '2713', 'محمود آباد', 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1401, '3007', 'بهار', 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1402, '606', 'كنگان', 101, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1403, '3008', 'رزن ', 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1404, '607', 'گناوه ', 101, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1405, '2712', 'رامسر', 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1406, '608', 'ديلم ', 101, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1407, '2908', 'حاجي آباد', 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1408, '2006', 'مريوان ', 111, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1409, '2416', 'گميش تپه', 115, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1410, '904', 'لردگان ', 103, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1411, '2003', 'سقز', 111, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1412, '2602', 'بروجرد', 117, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1413, '701', 'آباده ', 98, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1414, '1022', 'فريمان', 104, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1415, '603', 'دشتستان ', 101, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1416, '2512', 'شفت', 116, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1417, '112', 'هريس', 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1418, '1504', 'زابل ', 108, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1419, '205', 'سلماس ', 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1420, '2412', 'كلاله', 115, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1421, '1404', 'گرمسار', 107, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1422, '413', 'نائين', 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1423, '718', 'خرم بيد', 98, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1424, '2804', 'خمين ', 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1425, '714', 'ني ريز', 98, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1426, '1302', 'شيروان', 99, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1427, '417', 'مباركه', 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1428, '418', 'آران و بيدگل', 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1429, '1503', 'خاش ', 108, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1430, '1104', 'ايذه ', 105, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1431, '1905', 'اشتهارد', 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1432, '1207', 'ماه نشان', 106, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1433, '103', 'سراب', 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1434, '1005', 'تربت حيدريه ', 104, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1435, '107', 'هشترود', 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1436, '414', 'نجف آباد', 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1437, '703', 'اقليد', 98, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1438, '1111', 'شادگان', 105, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1439, '1604', 'قاينات', 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1440, '2401', 'بندرگز', 115, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1441, '3106', 'ميبد', 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1442, '1001', 'اسفراين ', 104, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1443, '305', 'گرمي ', 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1444, '601', 'بوشهر', 101, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1445, '114', 'ملكان', 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1446, '2008', 'كامياران', 111, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1447, '403', 'خميني شهر', 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1448, '3107', 'ابركوه', 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1449, '309', 'نير', 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1450, '506', 'آبدانان', 100, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1451, '706', 'سپيدان ', 98, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1452, '2710', 'آمل', 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1453, '2210', 'صحنه', 113, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1454, '2809', 'فرمهین', 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1455, '122', 'خسروشاه', 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1456, '123', 'ایلخچی', 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1457, '124', 'گوگان', 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1458, '125', 'ممقان', 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1459, '126', 'صوفیان', 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1460, '127', 'ورزقان', 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1461, '128', 'هادیشهر', 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1462, '129', 'تسوج', 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1463, '130', 'سهند', 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1464, '131', 'ترکمنچای', 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1465, '132', 'تیکمه داش', 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1466, '3109', 'طبس', 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1467, '420', 'قمصر', 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1468, '1609', 'طبس گلشن', 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1469, '215', 'پل دشت', 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1470, '216', 'قره ضیالدین', 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1471, '814', 'رودهن', 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_city` VALUES (1472, '1117', 'آغاجاری', 105, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for glb_province
-- ----------------------------
DROP TABLE IF EXISTS `glb_province`;
CREATE TABLE `glb_province`  (
  `id` int(11) NOT NULL,
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `countryID` int(11) DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `countryID`(`countryID`) USING BTREE,
  CONSTRAINT `glb_province_ibfk_1` FOREIGN KEY (`countryID`) REFERENCES `glb_country` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of glb_province
-- ----------------------------
INSERT INTO `glb_province` VALUES (61, '1', 'تهران', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province` VALUES (92, '6', 'آذربايجان شرقي', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province` VALUES (93, '7', 'آذربايجان غربي', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province` VALUES (94, '2', 'اردبيل', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province` VALUES (95, '4', 'اصفهان', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province` VALUES (97, '12', 'خراسان جنوبي', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province` VALUES (98, '17', 'فارس', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province` VALUES (99, '10', 'خراسان شمالي', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province` VALUES (100, '5', 'ايلام', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province` VALUES (101, '8', 'بوشهر', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province` VALUES (103, '9', 'چهارمحال وبختياري', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province` VALUES (104, '11', 'خراسان رضوي', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province` VALUES (105, '13', 'خوزستان', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province` VALUES (106, '14', 'زنجان', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province` VALUES (107, '15', 'سمنان', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province` VALUES (108, '16', 'سيستان و بلوچستان', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province` VALUES (109, '18', 'قزوين', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province` VALUES (110, '19', 'قم', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province` VALUES (111, '20', 'كردستان', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province` VALUES (112, '21', 'كرمان', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province` VALUES (113, '22', 'كرمانشاه', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province` VALUES (114, '23', 'كهگيلويه وبويراحمد', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province` VALUES (115, '24', 'گلستان', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province` VALUES (116, '25', 'گيلان', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province` VALUES (117, '26', 'لرستان', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province` VALUES (118, '27', 'مازندران', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province` VALUES (119, '28', 'مركزي', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province` VALUES (120, '29', 'هرمزگان', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province` VALUES (121, '30', 'همدان', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province` VALUES (122, '31', 'يزد', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province` VALUES (124, '73', 'سيستان وبلوچستان', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province` VALUES (125, '3', 'البرز', 1, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for glb_province_copy1
-- ----------------------------
DROP TABLE IF EXISTS `glb_province_copy1`;
CREATE TABLE `glb_province_copy1`  (
  `id` int(11) NOT NULL,
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `countryID` int(11) DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `countryID`(`countryID`) USING BTREE,
  CONSTRAINT `glb_province_copy1_ibfk_1` FOREIGN KEY (`countryID`) REFERENCES `glb_country` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of glb_province_copy1
-- ----------------------------
INSERT INTO `glb_province_copy1` VALUES (61, '1', 'تهران', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province_copy1` VALUES (92, '6', 'آذربايجان شرقي', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province_copy1` VALUES (93, '7', 'آذربايجان غربي', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province_copy1` VALUES (94, '2', 'اردبيل', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province_copy1` VALUES (95, '4', 'اصفهان', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province_copy1` VALUES (97, '12', 'خراسان جنوبي', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province_copy1` VALUES (98, '17', 'فارس', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province_copy1` VALUES (99, '10', 'خراسان شمالي', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province_copy1` VALUES (100, '5', 'ايلام', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province_copy1` VALUES (101, '8', 'بوشهر', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province_copy1` VALUES (103, '9', 'چهارمحال وبختياري', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province_copy1` VALUES (104, '11', 'خراسان رضوي', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province_copy1` VALUES (105, '13', 'خوزستان', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province_copy1` VALUES (106, '14', 'زنجان', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province_copy1` VALUES (107, '15', 'سمنان', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province_copy1` VALUES (108, '16', 'سيستان و بلوچستان', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province_copy1` VALUES (109, '18', 'قزوين', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province_copy1` VALUES (110, '19', 'قم', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province_copy1` VALUES (111, '20', 'كردستان', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province_copy1` VALUES (112, '21', 'كرمان', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province_copy1` VALUES (113, '22', 'كرمانشاه', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province_copy1` VALUES (114, '23', 'كهگيلويه وبويراحمد', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province_copy1` VALUES (115, '24', 'گلستان', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province_copy1` VALUES (116, '25', 'گيلان', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province_copy1` VALUES (117, '26', 'لرستان', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province_copy1` VALUES (118, '27', 'مازندران', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province_copy1` VALUES (119, '28', 'مركزي', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province_copy1` VALUES (120, '29', 'هرمزگان', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province_copy1` VALUES (121, '30', 'همدان', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province_copy1` VALUES (122, '31', 'يزد', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province_copy1` VALUES (124, '73', 'سيستان وبلوچستان', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `glb_province_copy1` VALUES (125, '3', 'البرز', 1, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for inv_productbasketdetails
-- ----------------------------
DROP TABLE IF EXISTS `inv_productbasketdetails`;
CREATE TABLE `inv_productbasketdetails`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `basketID` int(11) DEFAULT NULL,
  `productID` int(11) DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `basketID`(`basketID`) USING BTREE,
  INDEX `productID`(`productID`) USING BTREE,
  CONSTRAINT `inv_productbasketdetails_ibfk_1` FOREIGN KEY (`basketID`) REFERENCES `inv_productbaskets` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for inv_productbaskets
-- ----------------------------
DROP TABLE IF EXISTS `inv_productbaskets`;
CREATE TABLE `inv_productbaskets`  (
  `id` int(11) NOT NULL,
  `basketName` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `productMainID` int(11) DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `productMainID`(`productMainID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for inv_productcategories
-- ----------------------------
DROP TABLE IF EXISTS `inv_productcategories`;
CREATE TABLE `inv_productcategories`  (
  `id` int(11) NOT NULL,
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parentID` int(11) DEFAULT NULL,
  `levelno` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `imageID` int(11) DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `imageID`(`imageID`) USING BTREE,
  CONSTRAINT `inv_productcategories_ibfk_1` FOREIGN KEY (`imageID`) REFERENCES `glb_images` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for inv_productcategoryrel
-- ----------------------------
DROP TABLE IF EXISTS `inv_productcategoryrel`;
CREATE TABLE `inv_productcategoryrel`  (
  `id` int(11) NOT NULL,
  `productID` int(11) DEFAULT NULL,
  `productCategoryID` int(11) DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `productID`(`productID`) USING BTREE,
  INDEX `productCategoryID`(`productCategoryID`) USING BTREE,
  CONSTRAINT `inv_productcategoryrel_ibfk_2` FOREIGN KEY (`productCategoryID`) REFERENCES `inv_productcategories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for inv_productdiscountdetails
-- ----------------------------
DROP TABLE IF EXISTS `inv_productdiscountdetails`;
CREATE TABLE `inv_productdiscountdetails`  (
  `id` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `fromCount` int(11) DEFAULT NULL,
  `toCount` int(11) DEFAULT NULL,
  `ProductDiscountID` int(11) NOT NULL,
  `ProductPriceTypeID` int(11) DEFAULT NULL,
  `CustomerTypeID` int(11) DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `discountPercent` double DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `CustomerTypeID`(`CustomerTypeID`) USING BTREE,
  INDEX `ProductPriceTypeID`(`ProductPriceTypeID`) USING BTREE,
  INDEX `ProductID`(`ProductID`) USING BTREE,
  INDEX `ProductDiscountID`(`ProductDiscountID`) USING BTREE,
  CONSTRAINT `inv_productdiscountdetails_ibfk_2` FOREIGN KEY (`ProductPriceTypeID`) REFERENCES `inv_productpricetypes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `inv_productdiscountdetails_ibfk_4` FOREIGN KEY (`ProductDiscountID`) REFERENCES `inv_productdiscounts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for inv_productdiscounts
-- ----------------------------
DROP TABLE IF EXISTS `inv_productdiscounts`;
CREATE TABLE `inv_productdiscounts`  (
  `id` int(11) NOT NULL,
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `execTime` datetime(3) DEFAULT NULL,
  `expirationTime` datetime(3) DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inv_productdiscounts
-- ----------------------------
INSERT INTO `inv_productdiscounts` VALUES (1, '1', 'تخفیفات 1', '2017-01-01 00:00:00.000', '2018-01-01 00:00:00.000', 1, 0, NULL, NULL, NULL, NULL);
INSERT INTO `inv_productdiscounts` VALUES (2, '2', 'تخفیفات 2', '2017-01-02 00:00:00.000', '2019-01-21 00:00:00.000', 1, 0, NULL, NULL, NULL, NULL);
INSERT INTO `inv_productdiscounts` VALUES (3, '12', 'تخفیفات 3', '2017-01-02 00:00:00.000', '2019-01-02 00:00:00.000', 1, 0, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for inv_productlinks
-- ----------------------------
DROP TABLE IF EXISTS `inv_productlinks`;
CREATE TABLE `inv_productlinks`  (
  `id` int(11) NOT NULL,
  `productLinkSharedID` int(11) DEFAULT NULL,
  `productID` int(11) DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `productID`(`productID`) USING BTREE,
  INDEX `productLinkSharedID`(`productLinkSharedID`) USING BTREE,
  CONSTRAINT `inv_productlinks_ibfk_2` FOREIGN KEY (`productLinkSharedID`) REFERENCES `inv_productlinkshared` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for inv_productlinkshared
-- ----------------------------
DROP TABLE IF EXISTS `inv_productlinkshared`;
CREATE TABLE `inv_productlinkshared`  (
  `id` int(11) NOT NULL,
  `linkTypeID` int(11) DEFAULT NULL,
  `linkSharedName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inv_productlinkshared
-- ----------------------------
INSERT INTO `inv_productlinkshared` VALUES (1, 1, 'محصول جدید', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `inv_productlinkshared` VALUES (2, 1, 'محصول پر فروش', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `inv_productlinkshared` VALUES (3, 2, 'محصولات مرتبط 3', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `inv_productlinkshared` VALUES (4, 2, 'محصولات مرتبط 4', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `inv_productlinkshared` VALUES (5, 3, 'محصولات تکمیلی 5', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `inv_productlinkshared` VALUES (6, 3, 'محصولات تکمیلی 6', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `inv_productlinkshared` VALUES (7, 3, 'محصولات تکمیلی 7', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for inv_productlinktypes
-- ----------------------------
DROP TABLE IF EXISTS `inv_productlinktypes`;
CREATE TABLE `inv_productlinktypes`  (
  `id` int(11) NOT NULL,
  `linkTypeName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inv_productlinktypes
-- ----------------------------
INSERT INTO `inv_productlinktypes` VALUES (1, 'نمایش های محصول', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `inv_productlinktypes` VALUES (2, 'محصولات مرتبط', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `inv_productlinktypes` VALUES (3, 'محصولات تکمیلی', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for inv_productmanufacturers
-- ----------------------------
DROP TABLE IF EXISTS `inv_productmanufacturers`;
CREATE TABLE `inv_productmanufacturers`  (
  `id` int(11) NOT NULL,
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inv_productmanufacturers
-- ----------------------------
INSERT INTO `inv_productmanufacturers` VALUES (1, '1', 'Abri Form', 1, 0, '2017-01-04 11:30:05.000', '2017-01-04 12:49:18.000', NULL, NULL);
INSERT INTO `inv_productmanufacturers` VALUES (2, '2', 'Dermalex', 1, 0, '2017-01-04 11:30:54.000', NULL, NULL, NULL);
INSERT INTO `inv_productmanufacturers` VALUES (3, '3', 'Pharmalife', 1, 0, '2017-01-04 11:31:10.000', NULL, NULL, NULL);
INSERT INTO `inv_productmanufacturers` VALUES (4, '4', 'Atsez', 1, 0, '2017-01-04 11:32:25.000', NULL, NULL, NULL);
INSERT INTO `inv_productmanufacturers` VALUES (5, '5', 'Agicor', 1, 0, '2017-01-04 11:32:39.000', NULL, NULL, NULL);
INSERT INTO `inv_productmanufacturers` VALUES (6, '8', '21 سنتري', 1, 0, '2017-01-04 14:38:38.000', '2017-01-11 09:43:12.000', 2, 2);
INSERT INTO `inv_productmanufacturers` VALUES (7, '10', 'Lenus Pharma', 1, 0, '2017-01-04 14:40:52.000', '2017-01-11 09:43:49.000', 2, 2);
INSERT INTO `inv_productmanufacturers` VALUES (8, '12', 'Lorganique', 1, 0, '2017-01-11 09:44:31.000', NULL, 2, NULL);
INSERT INTO `inv_productmanufacturers` VALUES (9, '100', 'Med Trust', 1, 0, '2017-01-11 09:44:49.000', NULL, 2, NULL);
INSERT INTO `inv_productmanufacturers` VALUES (10, '101', 'NovelityLife', 1, 0, '2017-01-11 09:56:40.000', NULL, 2, NULL);
INSERT INTO `inv_productmanufacturers` VALUES (11, '103', 'Pharmalife', 1, 0, '2017-01-11 09:56:54.000', NULL, 2, NULL);
INSERT INTO `inv_productmanufacturers` VALUES (12, '110', 'Spring Leaf', 1, 0, '2017-01-11 09:57:17.000', NULL, 2, NULL);
INSERT INTO `inv_productmanufacturers` VALUES (13, '110', 'T-RQ', 1, 0, '2017-01-11 09:57:33.000', NULL, 2, NULL);
INSERT INTO `inv_productmanufacturers` VALUES (14, '120', 'آ.اِ.گ', 1, 0, '2017-01-11 09:57:59.000', NULL, 2, NULL);
INSERT INTO `inv_productmanufacturers` VALUES (15, '130', 'Apipharma', 1, 0, '2017-01-11 09:58:21.000', NULL, 2, NULL);
INSERT INTO `inv_productmanufacturers` VALUES (16, '140', 'Atsez', 1, 0, '2017-01-11 09:58:36.000', NULL, 2, NULL);
INSERT INTO `inv_productmanufacturers` VALUES (17, '111', 'Agicor', 1, 0, '2017-01-11 09:58:51.000', NULL, 2, NULL);
INSERT INTO `inv_productmanufacturers` VALUES (18, '121', 'Adapta', 1, 0, '2017-01-11 09:59:10.000', NULL, 2, NULL);
INSERT INTO `inv_productmanufacturers` VALUES (19, '145', 'Adidas', 1, 0, '2017-01-11 09:59:44.000', NULL, 2, NULL);
INSERT INTO `inv_productmanufacturers` VALUES (20, '146', 'biopol', 1, 0, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for inv_productpacking
-- ----------------------------
DROP TABLE IF EXISTS `inv_productpacking`;
CREATE TABLE `inv_productpacking`  (
  `id` int(11) NOT NULL,
  `productID` int(11) DEFAULT NULL,
  `productPackingLevel` int(11) DEFAULT NULL,
  `productPackingTypeID` int(11) DEFAULT NULL,
  `productPackingValue` int(11) DEFAULT NULL,
  `productUnitID` int(11) DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `productID`(`productID`) USING BTREE,
  INDEX `productPackingTypeID`(`productPackingTypeID`) USING BTREE,
  INDEX `productUnitID`(`productUnitID`) USING BTREE,
  CONSTRAINT `inv_productpacking_ibfk_2` FOREIGN KEY (`productPackingTypeID`) REFERENCES `inv_productpackingtypes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `inv_productpacking_ibfk_3` FOREIGN KEY (`productUnitID`) REFERENCES `inv_productunits` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for inv_productpackingtypes
-- ----------------------------
DROP TABLE IF EXISTS `inv_productpackingtypes`;
CREATE TABLE `inv_productpackingtypes`  (
  `id` int(11) NOT NULL,
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inv_productpackingtypes
-- ----------------------------
INSERT INTO `inv_productpackingtypes` VALUES (2, '1', 'بسته', 1, 0, NULL, NULL, NULL, NULL);
INSERT INTO `inv_productpackingtypes` VALUES (3, '2', 'جعبه', 1, 0, NULL, NULL, NULL, NULL);
INSERT INTO `inv_productpackingtypes` VALUES (4, '3', 'گالن', 1, 0, NULL, NULL, NULL, NULL);
INSERT INTO `inv_productpackingtypes` VALUES (5, '4', 'تیوپ', 1, 0, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for inv_productpricedetails
-- ----------------------------
DROP TABLE IF EXISTS `inv_productpricedetails`;
CREATE TABLE `inv_productpricedetails`  (
  `id` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `ProductPriceID` int(11) NOT NULL,
  `ProductPriceTypeID` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ProductPriceTypeID`(`ProductPriceTypeID`) USING BTREE,
  INDEX `ProductID`(`ProductID`) USING BTREE,
  INDEX `ProductPriceID`(`ProductPriceID`) USING BTREE,
  CONSTRAINT `inv_productpricedetails_ibfk_1` FOREIGN KEY (`ProductPriceTypeID`) REFERENCES `inv_productpricetypes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `inv_productpricedetails_ibfk_3` FOREIGN KEY (`ProductPriceID`) REFERENCES `inv_productprices` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for inv_productprices
-- ----------------------------
DROP TABLE IF EXISTS `inv_productprices`;
CREATE TABLE `inv_productprices`  (
  `id` int(11) NOT NULL,
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `execTime` datetime(3) DEFAULT NULL,
  `expirationTime` datetime(3) DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inv_productprices
-- ----------------------------
INSERT INTO `inv_productprices` VALUES (1, '1', 'بخشنامه شماره 1', '2017-01-02 00:00:00.000', '2020-01-01 00:00:00.000', 1, 0, '2017-01-01 00:00:00.000', '2017-01-01 00:00:00.000', 1, 1);
INSERT INTO `inv_productprices` VALUES (2, '2', 'بخشنامه شماره 2', '2016-01-01 00:00:00.000', '2019-01-01 00:00:00.000', 1, 0, NULL, NULL, NULL, NULL);
INSERT INTO `inv_productprices` VALUES (3, '3', 'بخشنامه شماره3', '2017-02-01 00:00:00.000', '2019-01-01 00:00:00.000', 1, 0, NULL, NULL, NULL, NULL);
INSERT INTO `inv_productprices` VALUES (4, '4', 'بخشنامه شماره 4', '2017-01-01 00:00:00.000', '2020-01-01 00:00:00.000', 1, 0, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for inv_productpricetypes
-- ----------------------------
DROP TABLE IF EXISTS `inv_productpricetypes`;
CREATE TABLE `inv_productpricetypes`  (
  `id` int(11) NOT NULL,
  `code` int(11) DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inv_productpricetypes
-- ----------------------------
INSERT INTO `inv_productpricetypes` VALUES (1, 1, 'قیمت خرید', 1, 0, NULL, NULL, NULL, NULL);
INSERT INTO `inv_productpricetypes` VALUES (2, 2, 'قیمت فروش', 1, 0, NULL, NULL, NULL, NULL);
INSERT INTO `inv_productpricetypes` VALUES (3, 3, 'قیمت مصرف کننده', 1, 0, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for inv_productprizedetails
-- ----------------------------
DROP TABLE IF EXISTS `inv_productprizedetails`;
CREATE TABLE `inv_productprizedetails`  (
  `id` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `customerTypeID` int(11) DEFAULT NULL,
  `productPrizeID` int(11) NOT NULL,
  `fromCount` int(11) DEFAULT NULL,
  `toCount` int(11) DEFAULT NULL,
  `per` int(11) DEFAULT NULL,
  `prizeCount` int(11) DEFAULT NULL,
  `prizeProductID` int(11) NOT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `customerTypeID`(`customerTypeID`) USING BTREE,
  INDEX `productID`(`productID`) USING BTREE,
  INDEX `productPrizeID`(`productPrizeID`) USING BTREE,
  CONSTRAINT `inv_productprizedetails_ibfk_1` FOREIGN KEY (`customerTypeID`) REFERENCES `sle_customertypes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `inv_productprizedetails_ibfk_3` FOREIGN KEY (`productPrizeID`) REFERENCES `inv_productprizes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for inv_productprizes
-- ----------------------------
DROP TABLE IF EXISTS `inv_productprizes`;
CREATE TABLE `inv_productprizes`  (
  `id` int(11) NOT NULL,
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `execTime` datetime(3) DEFAULT NULL,
  `expirationTime` datetime(3) DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inv_productprizes
-- ----------------------------
INSERT INTO `inv_productprizes` VALUES (9, '', '2342', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for inv_products
-- ----------------------------
DROP TABLE IF EXISTS `inv_products`;
CREATE TABLE `inv_products`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `invProductManufacturerID` int(11) DEFAULT NULL,
  `invProductSupplierID` int(11) DEFAULT NULL,
  `invProductSharedCodeID` bigint(20) DEFAULT NULL,
  `invProductTypeID` int(11) DEFAULT NULL,
  `invProductShapeID` int(11) DEFAULT NULL,
  `invProductCategoryID` int(11) DEFAULT NULL,
  `summary` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `invProductTypeID`(`invProductTypeID`) USING BTREE,
  INDEX `invProductCategoryID`(`invProductCategoryID`) USING BTREE,
  INDEX `invProductManufacturerID`(`invProductManufacturerID`) USING BTREE,
  INDEX `invProductSupplierID`(`invProductSupplierID`) USING BTREE,
  INDEX `invProductSharedCodeID`(`invProductSharedCodeID`) USING BTREE,
  INDEX `invProductShapeID`(`invProductShapeID`) USING BTREE,
  CONSTRAINT `inv_products_ibfk_1` FOREIGN KEY (`invProductTypeID`) REFERENCES `inv_producttypes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `inv_products_ibfk_2` FOREIGN KEY (`invProductCategoryID`) REFERENCES `inv_productcategories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `inv_products_ibfk_3` FOREIGN KEY (`invProductManufacturerID`) REFERENCES `inv_productmanufacturers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `inv_products_ibfk_4` FOREIGN KEY (`invProductSupplierID`) REFERENCES `inv_productsuppliers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `inv_products_ibfk_5` FOREIGN KEY (`invProductSharedCodeID`) REFERENCES `inv_productsharedcodes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `inv_products_ibfk_6` FOREIGN KEY (`invProductShapeID`) REFERENCES `inv_productshapes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for inv_productshapes
-- ----------------------------
DROP TABLE IF EXISTS `inv_productshapes`;
CREATE TABLE `inv_productshapes`  (
  `id` int(11) NOT NULL,
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inv_productshapes
-- ----------------------------
INSERT INTO `inv_productshapes` VALUES (2, NULL, 'قرص', 1, 0, '2017-01-04 11:33:22.000', NULL, NULL, NULL);
INSERT INTO `inv_productshapes` VALUES (3, NULL, 'آمپول', 1, 0, '2017-01-04 11:33:30.000', NULL, NULL, NULL);
INSERT INTO `inv_productshapes` VALUES (4, NULL, 'پماد', 1, 0, '2017-01-04 11:33:38.000', NULL, NULL, NULL);
INSERT INTO `inv_productshapes` VALUES (5, NULL, 'کرم', 1, 0, '2017-01-04 15:00:50.000', NULL, 2, NULL);
INSERT INTO `inv_productshapes` VALUES (6, NULL, 'لوازم کودک', 1, 0, '2017-01-11 10:40:10.000', NULL, 2, NULL);

-- ----------------------------
-- Table structure for inv_productsharedcodes
-- ----------------------------
DROP TABLE IF EXISTS `inv_productsharedcodes`;
CREATE TABLE `inv_productsharedcodes`  (
  `id` bigint(20) NOT NULL,
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `code_shared` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for inv_productspecifications
-- ----------------------------
DROP TABLE IF EXISTS `inv_productspecifications`;
CREATE TABLE `inv_productspecifications`  (
  `id` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `productSpecificationTypeID` int(11) DEFAULT NULL,
  `productSpecificationValueInt` int(11) DEFAULT NULL,
  `productSpecificationValueDecimal` decimal(18, 0) DEFAULT NULL,
  `productSpecificationValueBit` tinyint(4) DEFAULT NULL,
  `productSpecificationSelectionID` int(11) DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `productSpecificationTypeID`(`productSpecificationTypeID`) USING BTREE,
  INDEX `productID`(`productID`) USING BTREE,
  CONSTRAINT `inv_productspecifications_ibfk_1` FOREIGN KEY (`productSpecificationTypeID`) REFERENCES `inv_productspecificationtypes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for inv_productspecificationselections
-- ----------------------------
DROP TABLE IF EXISTS `inv_productspecificationselections`;
CREATE TABLE `inv_productspecificationselections`  (
  `id` int(11) NOT NULL,
  `selectionName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `productSpecificationTypeID` int(11) DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `productSpecificationTypeID`(`productSpecificationTypeID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inv_productspecificationselections
-- ----------------------------
INSERT INTO `inv_productspecificationselections` VALUES (29, 'قرمز', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `inv_productspecificationselections` VALUES (30, 'زرد', 1, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for inv_productspecificationtypes
-- ----------------------------
DROP TABLE IF EXISTS `inv_productspecificationtypes`;
CREATE TABLE `inv_productspecificationtypes`  (
  `id` int(11) NOT NULL,
  `productSpecificationName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `productUnitID` int(11) DEFAULT NULL,
  `isInt` tinyint(4) DEFAULT NULL,
  `isDecimal` tinyint(4) DEFAULT NULL,
  `isSelection` tinyint(4) DEFAULT NULL,
  `isBit` tinyint(4) DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `productUnitID`(`productUnitID`) USING BTREE,
  CONSTRAINT `inv_productspecificationtypes_ibfk_1` FOREIGN KEY (`productUnitID`) REFERENCES `inv_productunits` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inv_productspecificationtypes
-- ----------------------------
INSERT INTO `inv_productspecificationtypes` VALUES (1, 'رنگ', NULL, NULL, NULL, 1, NULL, 1, 0, NULL, NULL, NULL, NULL);
INSERT INTO `inv_productspecificationtypes` VALUES (2, 'وزن', 1, 1, NULL, 1, NULL, 1, 0, NULL, NULL, NULL, NULL);
INSERT INTO `inv_productspecificationtypes` VALUES (3, 'محل مصرف', NULL, NULL, NULL, 1, NULL, 1, 0, NULL, NULL, NULL, NULL);
INSERT INTO `inv_productspecificationtypes` VALUES (4, 'سن مصرف', NULL, NULL, NULL, 1, NULL, 1, 0, NULL, NULL, NULL, NULL);
INSERT INTO `inv_productspecificationtypes` VALUES (5, 'نوع محفظه', NULL, NULL, NULL, 1, NULL, 1, 0, NULL, NULL, NULL, NULL);
INSERT INTO `inv_productspecificationtypes` VALUES (6, 'جنسیت مصرف', NULL, NULL, NULL, 1, NULL, 1, 0, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for inv_productsuppliers
-- ----------------------------
DROP TABLE IF EXISTS `inv_productsuppliers`;
CREATE TABLE `inv_productsuppliers`  (
  `id` int(11) NOT NULL,
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inv_productsuppliers
-- ----------------------------
INSERT INTO `inv_productsuppliers` VALUES (2, NULL, 'پورا پخش', 1, 0, '2017-01-04 11:20:57.000', NULL, NULL, NULL);
INSERT INTO `inv_productsuppliers` VALUES (3, NULL, 'داروخانه پورا', 1, 0, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for inv_producttypes
-- ----------------------------
DROP TABLE IF EXISTS `inv_producttypes`;
CREATE TABLE `inv_producttypes`  (
  `id` int(11) NOT NULL,
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inv_producttypes
-- ----------------------------
INSERT INTO `inv_producttypes` VALUES (16, NULL, 'وارداتی', 1, 0, NULL, NULL, NULL, NULL);
INSERT INTO `inv_producttypes` VALUES (17, NULL, 'تولید داخل', 1, 0, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for inv_productunits
-- ----------------------------
DROP TABLE IF EXISTS `inv_productunits`;
CREATE TABLE `inv_productunits`  (
  `id` int(11) NOT NULL,
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inv_productunits
-- ----------------------------
INSERT INTO `inv_productunits` VALUES (1, '1', 'گرم', 1, 0, NULL, NULL, NULL, NULL);
INSERT INTO `inv_productunits` VALUES (2, '2', 'میلی متر', 1, 0, NULL, NULL, NULL, NULL);
INSERT INTO `inv_productunits` VALUES (3, '3', 'کیلوگرم', 1, 0, NULL, NULL, NULL, NULL);
INSERT INTO `inv_productunits` VALUES (4, '4', 'سانتی متر', 1, 0, NULL, NULL, NULL, NULL);
INSERT INTO `inv_productunits` VALUES (5, '5', 'عدد', 1, 0, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for logvisitor
-- ----------------------------
DROP TABLE IF EXISTS `logvisitor`;
CREATE TABLE `logvisitor`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `time` int(10) UNSIGNED DEFAULT NULL,
  `rfc822` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `get` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `post` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `cookies` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `session` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `scheme` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `protocol` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `port` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `browser` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `language` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_ip`(`ip`) USING BTREE,
  INDEX `idx_time`(`time`) USING BTREE,
  INDEX `idx_uri`(`uri`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1462 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of logvisitor
-- ----------------------------
INSERT INTO `logvisitor` VALUES (1, '::1', 1554377483, 'Thu, 04 Apr 19 13:31:23 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/logvisitor', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (2, '::1', 1554377493, 'Thu, 04 Apr 19 13:31:33 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/logvisitor', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (3, '::1', 1554377499, 'Thu, 04 Apr 19 13:31:39 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/news/1', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (4, '::1', 1554377501, 'Thu, 04 Apr 19 13:31:41 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/file?id=5ca34ccf06d55.jpg', '{\"id\":\"5ca34ccf06d55.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (5, '::1', 1554377501, 'Thu, 04 Apr 19 13:31:41 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/logvisitor', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (6, '::1', 1554377505, 'Thu, 04 Apr 19 13:31:45 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/news/1', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (7, '::1', 1554377505, 'Thu, 04 Apr 19 13:31:45 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/file?id=5ca34ccf06d55.jpg', '{\"id\":\"5ca34ccf06d55.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (8, '::1', 1554377508, 'Thu, 04 Apr 19 13:31:48 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/logvisitor', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (9, '::1', 1554377563, 'Thu, 04 Apr 19 13:32:43 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/logvisitor', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (10, '::1', 1554377564, 'Thu, 04 Apr 19 13:32:44 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/logvisitor/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (11, '::1', 1554377571, 'Thu, 04 Apr 19 13:32:51 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/logvisitor/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (12, '::1', 1554377571, 'Thu, 04 Apr 19 13:32:51 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/logvisitor', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (13, '::1', 1554377596, 'Thu, 04 Apr 19 13:33:16 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/logvisitor', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (14, '::1', 1554377605, 'Thu, 04 Apr 19 13:33:25 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/logvisitor', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (15, '::1', 1554377649, 'Thu, 04 Apr 19 13:34:09 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/site/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (16, '::1', 1554377650, 'Thu, 04 Apr 19 13:34:10 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/site/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (17, '::1', 1554377657, 'Thu, 04 Apr 19 13:34:17 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (18, '::1', 1554377658, 'Thu, 04 Apr 19 13:34:18 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/file?id=5ca34ccf06d55.jpg', '{\"id\":\"5ca34ccf06d55.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (19, '::1', 1554377658, 'Thu, 04 Apr 19 13:34:18 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/file?id=7', '{\"id\":\"7\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (20, '::1', 1554377664, 'Thu, 04 Apr 19 13:34:24 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (21, '::1', 1554377664, 'Thu, 04 Apr 19 13:34:24 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/file?id=5ca34ccf06d55.jpg', '{\"id\":\"5ca34ccf06d55.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (22, '::1', 1554377664, 'Thu, 04 Apr 19 13:34:24 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/file?id=7', '{\"id\":\"7\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (23, '::1', 1554377788, 'Thu, 04 Apr 19 13:36:28 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/logvisitor', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (24, '::1', 1554377834, 'Thu, 04 Apr 19 13:37:14 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (25, '::1', 1554377835, 'Thu, 04 Apr 19 13:37:15 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/file?id=5ca34ccf06d55.jpg', '{\"id\":\"5ca34ccf06d55.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (26, '::1', 1554377835, 'Thu, 04 Apr 19 13:37:15 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/file?id=7', '{\"id\":\"7\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (27, '::1', 1554377840, 'Thu, 04 Apr 19 13:37:20 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/logvisitor', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (28, '::1', 1554380027, 'Thu, 04 Apr 19 14:13:47 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/yii-gallery-manager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (29, '::1', 1554380104, 'Thu, 04 Apr 19 14:15:04 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (30, '::1', 1554380309, 'Thu, 04 Apr 19 14:18:29 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/comment/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (31, '::1', 1554380340, 'Thu, 04 Apr 19 14:19:00 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/comment/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (32, '::1', 1554380364, 'Thu, 04 Apr 19 14:19:24 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/comments/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (33, '::1', 1554380378, 'Thu, 04 Apr 19 14:19:38 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/comments/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (34, '::1', 1554380484, 'Thu, 04 Apr 19 14:21:24 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (35, '::1', 1554380624, 'Thu, 04 Apr 19 14:23:44 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (36, '::1', 1554380719, 'Thu, 04 Apr 19 14:25:19 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (37, '::1', 1554380721, 'Thu, 04 Apr 19 14:25:21 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/file?id=5ca34ccf06d55.jpg', '{\"id\":\"5ca34ccf06d55.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (38, '::1', 1554380721, 'Thu, 04 Apr 19 14:25:21 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/file?id=7', '{\"id\":\"7\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (39, '::1', 1554380748, 'Thu, 04 Apr 19 14:25:48 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/comment/default/create?entity=%C3%AFcih%0C%C2%84%C3%B4%C2%ACH%C2%BFL%15F%C3%91%C2%AFk0765a03014e2a1b73c0e92a86f0f2e1ad7b2b992e6cf62760da3ce3d84979de4V%C2%8As%C3%87j1%C3%B0%C3%96R%08X%C2%BE7Q%15Y%C2%B4%0Ee%11%', '{\"entity\":\"\\u00efcih\\f\\u0084\\u00f4\\u00acH\\u00bfL\\u0015F\\u00d1\\u00afk0765a03014e2a1b73c0e92a86f0f2e1ad7b2b992e6cf62760da3ce3d84979de4V\\u008as\\u00c7j1\\u00f0\\u00d6R\\bX\\u00be7Q\\u0015Y\\u00b4\\u000ee\\u0011\\\\c\\u00c6\\u00f1\\u001fS\\u00a1i\\u00ee&.0A\\u0086\\u00f1\\u00972\\u00e5\\u00far\\u00da\\u00d6N\\u00ce\\u0004\\u0082\\b\\u00fe\\u00abE\\ba \\u0090]2%)\\u00d8B\\u00dd\\u00c7C\\\"\\u00a5\\u001bl\\u0017\\u00f5\\u001d\\u00f6{\\u00f0P\\u00ad>\\u00a0\\u00bb\\u00f4\\u00c1\\u00b1po\\u00939k\\u0081\\u00fc\\u0087;\\u001a\\u00ae:\\u00bb\\\\\\u00a0\"}', '{\"_csrf-backend\":\"xYEAi_4iI00trCteWfN6qQIKhBBboyKp0Dh1iAA4L06tzFnpmRZvFU7WYmoWrE7mUWfOXmzKZfvmcDvtQU0YCg==\",\"CommentModel\":{\"content\":\"test\",\"parentId\":\"\",\"url\":\"\\/cmsSefroweb\\/cmsSefroweb\\/backend\\/web\\/index.php\\/news\\/index\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (40, '::1', 1554380749, 'Thu, 04 Apr 19 14:25:49 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/news/index?_pjax=%23comment-pjax-container-w0', '{\"_pjax\":\"#comment-pjax-container-w0\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (41, '::1', 1554380803, 'Thu, 04 Apr 19 14:26:43 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/comments/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (42, '::1', 1554380804, 'Thu, 04 Apr 19 14:26:44 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/comments/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (43, '::1', 1554380806, 'Thu, 04 Apr 19 14:26:46 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/gii/model', '[]', '{\"_csrf-backend\":\"8cw-MN00quFyyJY4oOIOAvVNp3pyaM8pxpxud3LTwYSZgWdSugDmuRGy3wzvvTpNpiDtNEUBiHvw1CASM6b2wA==\",\"Generator\":{\"tableName\":\"news\",\"modelClass\":\"News\",\"standardizeCapitals\":\"0\",\"singularize\":\"0\",\"ns\":\"common\\\\models\",\"baseClass\":\"yii\\\\db\\\\ActiveRecord\",\"db\":\"db\",\"useTablePrefix\":\"0\",\"generateRelations\":\"all\",\"generateRelationsFromCurrentSchema\":\"1\",\"generateLabelsFromComments\":\"0\",\"generateQuery\":\"1\",\"queryNs\":\"common\\\\models\",\"queryClass\":\"NewsQuery\",\"queryBaseClass\":\"yii\\\\db\\\\ActiveQuery\",\"enableI18N\":\"0\",\"messageCategory\":\"app\",\"useSchemaName\":\"1\",\"template\":\"default\"},\"preview\":\"\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (44, '::1', 1554380808, 'Thu, 04 Apr 19 14:26:48 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/comments/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (45, '::1', 1554380887, 'Thu, 04 Apr 19 14:28:07 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/comments/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (46, '::1', 1554381435, 'Thu, 04 Apr 19 14:37:15 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/comments/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (47, '::1', 1554381436, 'Thu, 04 Apr 19 14:37:16 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/comments/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (48, '::1', 1554381443, 'Thu, 04 Apr 19 14:37:23 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/comments/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (49, '::1', 1554381444, 'Thu, 04 Apr 19 14:37:24 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/comments/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (50, '::1', 1554381461, 'Thu, 04 Apr 19 14:37:41 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/comments/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (51, '::1', 1554381463, 'Thu, 04 Apr 19 14:37:43 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (52, '::1', 1554381463, 'Thu, 04 Apr 19 14:37:43 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/file?id=5ca34ccf06d55.jpg', '{\"id\":\"5ca34ccf06d55.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (53, '::1', 1554381463, 'Thu, 04 Apr 19 14:37:43 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/file?id=7', '{\"id\":\"7\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (54, '::1', 1554381484, 'Thu, 04 Apr 19 14:38:04 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/comments/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (55, '::1', 1554381493, 'Thu, 04 Apr 19 14:38:13 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/comments/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (56, '::1', 1554381568, 'Thu, 04 Apr 19 14:39:28 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/comments/manage', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (57, '::1', 1554381602, 'Thu, 04 Apr 19 14:40:02 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/comment/manage/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (58, '::1', 1554381630, 'Thu, 04 Apr 19 14:40:30 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (59, '::1', 1554381632, 'Thu, 04 Apr 19 14:40:32 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/update?id=1', '{\"id\":\"1\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (60, '::1', 1554381634, 'Thu, 04 Apr 19 14:40:34 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/info?id=1', '{\"id\":\"1\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (61, '::1', 1554381639, 'Thu, 04 Apr 19 14:40:39 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/update-profile?id=1', '{\"id\":\"1\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (62, '::1', 1554381640, 'Thu, 04 Apr 19 14:40:40 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/update?id=1', '{\"id\":\"1\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (63, '::1', 1554381654, 'Thu, 04 Apr 19 14:40:54 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/comment/manage/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (64, '::1', 1554381655, 'Thu, 04 Apr 19 14:40:55 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/comment/manage/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (65, '::1', 1554381744, 'Thu, 04 Apr 19 14:42:24 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/comment/manage/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (66, '::1', 1554381744, 'Thu, 04 Apr 19 14:42:24 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/comment/manage/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (67, '::1', 1554381759, 'Thu, 04 Apr 19 14:42:39 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/comment/manage/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (68, '::1', 1554381765, 'Thu, 04 Apr 19 14:42:45 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/comment/manage/update?id=1', '{\"id\":\"1\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (69, '::1', 1554381774, 'Thu, 04 Apr 19 14:42:54 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/comment/manage/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (70, '::1', 1554381827, 'Thu, 04 Apr 19 14:43:47 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (71, '::1', 1554381827, 'Thu, 04 Apr 19 14:43:47 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/file?id=5ca34ccf06d55.jpg', '{\"id\":\"5ca34ccf06d55.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (72, '::1', 1554381827, 'Thu, 04 Apr 19 14:43:47 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/file?id=7', '{\"id\":\"7\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (73, '::1', 1554381829, 'Thu, 04 Apr 19 14:43:49 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/logvisitor', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (74, '::1', 1554381831, 'Thu, 04 Apr 19 14:43:51 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/comment/manage/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (75, '::1', 1554381833, 'Thu, 04 Apr 19 14:43:53 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/logvisitor', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (76, '::1', 1554381840, 'Thu, 04 Apr 19 14:44:00 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/comment/manage/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (77, '::1', 1554381844, 'Thu, 04 Apr 19 14:44:04 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/comment/manage/index?CommentSearch%5Bid%5D=&CommentSearch%5Bcontent%5D=&CommentSearch%5BrelatedTo%5D=&CommentSearch%5BcreatedBy%5D=&CommentSearch%5Bstatus%5D=0&_pjax=%23p0', '{\"CommentSearch\":{\"id\":\"\",\"content\":\"\",\"relatedTo\":\"\",\"createdBy\":\"\",\"status\":\"0\"},\"_pjax\":\"#p0\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (78, '::1', 1554381846, 'Thu, 04 Apr 19 14:44:06 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/comment/manage/index?CommentSearch%5Bid%5D=&CommentSearch%5Bcontent%5D=&CommentSearch%5BrelatedTo%5D=&CommentSearch%5BcreatedBy%5D=&CommentSearch%5Bstatus%5D=1&_pjax=%23p0', '{\"CommentSearch\":{\"id\":\"\",\"content\":\"\",\"relatedTo\":\"\",\"createdBy\":\"\",\"status\":\"1\"},\"_pjax\":\"#p0\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (79, '::1', 1554381853, 'Thu, 04 Apr 19 14:44:13 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/comment/manage/update?id=1', '{\"id\":\"1\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (80, '::1', 1554381857, 'Thu, 04 Apr 19 14:44:17 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/comment/manage/update?id=1', '{\"id\":\"1\"}', '{\"_csrf-backend\":\"hIoaX7nUNs5D73LQuy_euf6ix5VB8TKStZltP5hQRZ7sx0M93uB6liCVO-T0cOr2rc-N23aYdcCD0SNa2SVy2g==\",\"CommentModel\":{\"content\":\"test\",\"status\":\"1\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (81, '::1', 1554381857, 'Thu, 04 Apr 19 14:44:17 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/comment/manage/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (82, '::1', 1554382019, 'Thu, 04 Apr 19 14:46:59 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/comment/manage/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (83, '::1', 1554382065, 'Thu, 04 Apr 19 14:47:45 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/comment/manage/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (84, '::1', 1554382066, 'Thu, 04 Apr 19 14:47:46 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/comment/manage/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (85, '::1', 1554382137, 'Thu, 04 Apr 19 14:48:57 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/comment/manage/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (86, '::1', 1554571523, 'Sat, 06 Apr 19 19:25:23 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (87, '::1', 1554571525, 'Sat, 06 Apr 19 19:25:25 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/default/settings', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (88, '::1', 1554571529, 'Sat, 06 Apr 19 19:25:29 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/resize', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (89, '::1', 1554571530, 'Sat, 06 Apr 19 19:25:30 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/default/settings', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (90, '::1', 1554571532, 'Sat, 06 Apr 19 19:25:32 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (91, '::1', 1554571533, 'Sat, 06 Apr 19 19:25:33 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (92, '::1', 1554571534, 'Sat, 06 Apr 19 19:25:34 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (93, '::1', 1554571539, 'Sat, 06 Apr 19 19:25:39 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/uploadmanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (94, '::1', 1554571560, 'Sat, 06 Apr 19 19:26:00 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/upload', '[]', '{\"tagIds\":\"undefined\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (95, '::1', 1554571560, 'Sat, 06 Apr 19 19:26:00 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/upload', '[]', '{\"tagIds\":\"undefined\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (96, '::1', 1554571560, 'Sat, 06 Apr 19 19:26:00 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/upload', '[]', '{\"tagIds\":\"undefined\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (97, '::1', 1554571769, 'Sat, 06 Apr 19 19:29:29 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (98, '::1', 1554571770, 'Sat, 06 Apr 19 19:29:30 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (99, '::1', 1554571794, 'Sat, 06 Apr 19 19:29:54 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (100, '::1', 1554571794, 'Sat, 06 Apr 19 19:29:54 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (101, '::1', 1554572000, 'Sat, 06 Apr 19 19:33:20 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (102, '::1', 1554572001, 'Sat, 06 Apr 19 19:33:21 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (103, '::1', 1554572028, 'Sat, 06 Apr 19 19:33:48 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (104, '::1', 1554572028, 'Sat, 06 Apr 19 19:33:48 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (105, '::1', 1554572031, 'Sat, 06 Apr 19 19:33:51 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager?MediafileSearch%5BtagIds%5D=', '{\"MediafileSearch\":{\"tagIds\":\"\"}}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (106, '::1', 1554572036, 'Sat, 06 Apr 19 19:33:56 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/info?id=3&strictThumb=undefined', '{\"id\":\"3\",\"strictThumb\":\"undefined\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (107, '::1', 1554572041, 'Sat, 06 Apr 19 19:34:01 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/update?id=3', '{\"id\":\"3\"}', '{\"_csrf-backend\":\"rdOBNS9fuWDp6_XXore1oL5P1nBERn-wschHzwLJ3ZD6tvdhZA_8JYG_j43Ug8LV-DydGBMQNf_HigWYaauL3A==\",\"Mediafile\":{\"tagIds\":\"\",\"alt\":\"\",\"description\":\"\"},\"url\":\"\\/uploads\\/2019\\/04\\/a.jpg\",\"id\":\"3\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (108, '::1', 1554572044, 'Sat, 06 Apr 19 19:34:04 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/delete?id=3', '{\"id\":\"3\"}', '{\"id\":\"3\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (109, '::1', 1554572046, 'Sat, 06 Apr 19 19:34:06 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/info?id=1&strictThumb=undefined', '{\"id\":\"1\",\"strictThumb\":\"undefined\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (110, '::1', 1554572048, 'Sat, 06 Apr 19 19:34:08 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/default/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (111, '::1', 1554572098, 'Sat, 06 Apr 19 19:34:58 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (112, '::1', 1554572099, 'Sat, 06 Apr 19 19:34:59 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (113, '::1', 1554572104, 'Sat, 06 Apr 19 19:35:04 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/acticle/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (114, '::1', 1554572106, 'Sat, 06 Apr 19 19:35:06 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (115, '::1', 1554572108, 'Sat, 06 Apr 19 19:35:08 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (116, '::1', 1554572108, 'Sat, 06 Apr 19 19:35:08 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (117, '::1', 1554572112, 'Sat, 06 Apr 19 19:35:12 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/uploadmanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (118, '::1', 1554572118, 'Sat, 06 Apr 19 19:35:18 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/upload', '[]', '{\"tagIds\":\"undefined\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (119, '::1', 1554572175, 'Sat, 06 Apr 19 19:36:15 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (120, '::1', 1554572176, 'Sat, 06 Apr 19 19:36:16 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (121, '::1', 1554572203, 'Sat, 06 Apr 19 19:36:43 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (122, '::1', 1554572203, 'Sat, 06 Apr 19 19:36:43 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (123, '::1', 1554572221, 'Sat, 06 Apr 19 19:37:01 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/uploadmanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (124, '::1', 1554572227, 'Sat, 06 Apr 19 19:37:07 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/upload', '[]', '{\"tagIds\":\"undefined\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (125, '::1', 1554572277, 'Sat, 06 Apr 19 19:37:57 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/uploadmanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (126, '::1', 1554572278, 'Sat, 06 Apr 19 19:37:58 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (127, '::1', 1554572281, 'Sat, 06 Apr 19 19:38:01 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/info?id=5&strictThumb=undefined', '{\"id\":\"5\",\"strictThumb\":\"undefined\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (128, '::1', 1554572289, 'Sat, 06 Apr 19 19:38:09 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/info?id=5&strictThumb=undefined', '{\"id\":\"5\",\"strictThumb\":\"undefined\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (129, '::1', 1554572289, 'Sat, 06 Apr 19 19:38:09 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/info?id=5&strictThumb=undefined', '{\"id\":\"5\",\"strictThumb\":\"undefined\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (130, '::1', 1554572311, 'Sat, 06 Apr 19 19:38:31 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (131, '::1', 1554572312, 'Sat, 06 Apr 19 19:38:32 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (132, '::1', 1554572319, 'Sat, 06 Apr 19 19:38:39 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/info?id=5&strictThumb=undefined', '{\"id\":\"5\",\"strictThumb\":\"undefined\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (133, '::1', 1554572319, 'Sat, 06 Apr 19 19:38:39 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/info?id=5&strictThumb=undefined', '{\"id\":\"5\",\"strictThumb\":\"undefined\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (134, '::1', 1554572322, 'Sat, 06 Apr 19 19:38:42 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/uploadmanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (135, '::1', 1554572329, 'Sat, 06 Apr 19 19:38:49 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/upload', '[]', '{\"tagIds\":\"undefined\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (136, '::1', 1554572334, 'Sat, 06 Apr 19 19:38:54 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/uploadmanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (137, '::1', 1554572344, 'Sat, 06 Apr 19 19:39:04 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (138, '::1', 1554572346, 'Sat, 06 Apr 19 19:39:06 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/default/settings', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (139, '::1', 1554572348, 'Sat, 06 Apr 19 19:39:08 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/resize', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (140, '::1', 1554572350, 'Sat, 06 Apr 19 19:39:10 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/default/settings', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (141, '::1', 1554572363, 'Sat, 06 Apr 19 19:39:23 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (142, '::1', 1554572366, 'Sat, 06 Apr 19 19:39:26 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/info?id=6&strictThumb=undefined', '{\"id\":\"6\",\"strictThumb\":\"undefined\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (143, '::1', 1554572370, 'Sat, 06 Apr 19 19:39:30 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/uploadmanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (144, '::1', 1554572377, 'Sat, 06 Apr 19 19:39:37 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/upload', '[]', '{\"tagIds\":\"undefined\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (145, '::1', 1554572382, 'Sat, 06 Apr 19 19:39:42 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/uploadmanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (146, '::1', 1554572382, 'Sat, 06 Apr 19 19:39:42 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/uploadmanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (147, '::1', 1554572384, 'Sat, 06 Apr 19 19:39:44 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/uploadmanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (148, '::1', 1554572434, 'Sat, 06 Apr 19 19:40:34 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/upload', '[]', '{\"tagIds\":\"undefined\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (149, '::1', 1554572441, 'Sat, 06 Apr 19 19:40:41 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/uploadmanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (150, '::1', 1554572448, 'Sat, 06 Apr 19 19:40:48 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (151, '::1', 1554572479, 'Sat, 06 Apr 19 19:41:19 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (152, '::1', 1554572480, 'Sat, 06 Apr 19 19:41:20 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (153, '::1', 1554572486, 'Sat, 06 Apr 19 19:41:26 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/uploadmanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (154, '::1', 1554572494, 'Sat, 06 Apr 19 19:41:34 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/upload', '[]', '{\"tagIds\":\"undefined\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (155, '::1', 1554572495, 'Sat, 06 Apr 19 19:41:35 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/cmsSefroweb/cmsSefroweb/uploads/2019/04/comingsoon-fm.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (156, '::1', 1554826439, 'Tue, 09 Apr 19 18:13:59 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (157, '::1', 1554826442, 'Tue, 09 Apr 19 18:14:02 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/cmsSefroweb/cmsSefroweb/uploads/2019/04/comingsoon-fm.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (158, '::1', 1554826802, 'Tue, 09 Apr 19 18:20:02 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (159, '::1', 1554826803, 'Tue, 09 Apr 19 18:20:03 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (160, '::1', 1554826804, 'Tue, 09 Apr 19 18:20:04 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/cmsSefroweb/cmsSefroweb/uploads/2019/04/comingsoon-fm.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (161, '::1', 1554826841, 'Tue, 09 Apr 19 18:20:41 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (162, '::1', 1554826841, 'Tue, 09 Apr 19 18:20:41 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (163, '::1', 1554826842, 'Tue, 09 Apr 19 18:20:42 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/cmsSefroweb/cmsSefroweb/uploads/2019/04/comingsoon-fm.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (164, '::1', 1554826866, 'Tue, 09 Apr 19 18:21:06 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (165, '::1', 1554826867, 'Tue, 09 Apr 19 18:21:07 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (166, '::1', 1554826868, 'Tue, 09 Apr 19 18:21:08 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/cmsSefroweb/cmsSefroweb/uploads/2019/04/comingsoon-fm.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (167, '::1', 1554826885, 'Tue, 09 Apr 19 18:21:25 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (168, '::1', 1554826885, 'Tue, 09 Apr 19 18:21:25 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (169, '::1', 1554826886, 'Tue, 09 Apr 19 18:21:26 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/cmsSefroweb/cmsSefroweb/uploads/2019/04/comingsoon-fm.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (170, '::1', 1554826907, 'Tue, 09 Apr 19 18:21:47 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (171, '::1', 1554826907, 'Tue, 09 Apr 19 18:21:47 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (172, '::1', 1554826908, 'Tue, 09 Apr 19 18:21:48 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/cmsSefroweb/cmsSefroweb/uploads/2019/04/comingsoon-fm.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (173, '::1', 1554827343, 'Tue, 09 Apr 19 18:29:03 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/uploadmanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (174, '::1', 1554827350, 'Tue, 09 Apr 19 18:29:10 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/upload', '[]', '{\"tagIds\":\"undefined\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (175, '::1', 1554827351, 'Tue, 09 Apr 19 18:29:11 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/milad.com/uploads//2019/04/img7495-fm.jpg', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (176, '::1', 1554827356, 'Tue, 09 Apr 19 18:29:16 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (177, '::1', 1554827357, 'Tue, 09 Apr 19 18:29:17 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/milad.com/uploads//2019/04/img7495-fm.jpg', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (178, '::1', 1554827357, 'Tue, 09 Apr 19 18:29:17 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/cmsSefroweb/cmsSefroweb/uploads/2019/04/comingsoon-fm.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (179, '::1', 1554827520, 'Tue, 09 Apr 19 18:32:00 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/uploadmanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (180, '::1', 1554827526, 'Tue, 09 Apr 19 18:32:06 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/upload', '[]', '{\"tagIds\":\"undefined\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (181, '::1', 1554827528, 'Tue, 09 Apr 19 18:32:08 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/uploadmanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (182, '::1', 1554827533, 'Tue, 09 Apr 19 18:32:13 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (183, '::1', 1554827534, 'Tue, 09 Apr 19 18:32:14 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/milad.com/uploads//2019/04/img7495-fm.jpg', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (184, '::1', 1554827534, 'Tue, 09 Apr 19 18:32:14 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/cmsSefroweb/cmsSefroweb/uploads/2019/04/comingsoon-fm.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (185, '::1', 1554827547, 'Tue, 09 Apr 19 18:32:27 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/uploadmanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (186, '::1', 1554827553, 'Tue, 09 Apr 19 18:32:33 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/upload', '[]', '{\"tagIds\":\"undefined\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (187, '::1', 1554827567, 'Tue, 09 Apr 19 18:32:47 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (188, '::1', 1554827568, 'Tue, 09 Apr 19 18:32:48 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/milad.com/uploads//2019/04/img7495-fm.jpg', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (189, '::1', 1554827568, 'Tue, 09 Apr 19 18:32:48 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/cmsSefroweb/cmsSefroweb/uploads/2019/04/comingsoon-fm.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (190, '::1', 1554827604, 'Tue, 09 Apr 19 18:33:24 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/resize', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (191, '::1', 1554827637, 'Tue, 09 Apr 19 18:33:57 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/resize', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (192, '::1', 1554827654, 'Tue, 09 Apr 19 18:34:14 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/resize', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (193, '::1', 1554827658, 'Tue, 09 Apr 19 18:34:18 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/resize', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (194, '::1', 1554827664, 'Tue, 09 Apr 19 18:34:24 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/resize', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (195, '::1', 1554827668, 'Tue, 09 Apr 19 18:34:28 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/resize', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (196, '::1', 1554827697, 'Tue, 09 Apr 19 18:34:57 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/uploadmanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (197, '::1', 1554827712, 'Tue, 09 Apr 19 18:35:12 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/upload', '[]', '{\"tagIds\":\"undefined\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (198, '::1', 1554827713, 'Tue, 09 Apr 19 18:35:13 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/cmsSefroweb/cmsSefroweb/frontend/web//uploads//2019/04/comingsoon-fm.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (199, '::1', 1554827718, 'Tue, 09 Apr 19 18:35:18 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/cmsSefroweb/cmsSefroweb/frontend/web//uploads//2019/04/comingsoon.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (200, '::1', 1554827721, 'Tue, 09 Apr 19 18:35:21 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/uploadmanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (201, '::1', 1554827722, 'Tue, 09 Apr 19 18:35:22 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/default/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (202, '::1', 1554827723, 'Tue, 09 Apr 19 18:35:23 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (203, '::1', 1554827724, 'Tue, 09 Apr 19 18:35:24 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (204, '::1', 1554827725, 'Tue, 09 Apr 19 18:35:25 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/cmsSefroweb/cmsSefroweb/uploads/2019/04/comingsoon-fm.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (205, '::1', 1554827725, 'Tue, 09 Apr 19 18:35:25 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/milad.com/uploads//2019/04/img7495-fm.jpg', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (206, '::1', 1554827726, 'Tue, 09 Apr 19 18:35:26 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/cmsSefroweb/cmsSefroweb/frontend/web//uploads//2019/04/comingsoon-fm.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (207, '::1', 1554827733, 'Tue, 09 Apr 19 18:35:33 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/cmsSefroweb/cmsSefroweb/frontend/web//uploads//2019/04/comingsoon-fm.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (208, '::1', 1554827935, 'Tue, 09 Apr 19 18:38:55 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/uploadmanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (209, '::1', 1554827952, 'Tue, 09 Apr 19 18:39:12 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/default/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (210, '::1', 1554827954, 'Tue, 09 Apr 19 18:39:14 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/default/settings', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (211, '::1', 1554827955, 'Tue, 09 Apr 19 18:39:15 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/resize', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (212, '::1', 1554827962, 'Tue, 09 Apr 19 18:39:22 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/default/settings', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (213, '::1', 1554827964, 'Tue, 09 Apr 19 18:39:24 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/default/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (214, '::1', 1554827965, 'Tue, 09 Apr 19 18:39:25 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (215, '::1', 1554827966, 'Tue, 09 Apr 19 18:39:26 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (216, '::1', 1554827967, 'Tue, 09 Apr 19 18:39:27 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/milad.com/uploads//2019/04/img7495-fm.jpg', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (217, '::1', 1554827967, 'Tue, 09 Apr 19 18:39:27 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/cmsSefroweb/cmsSefroweb/frontend/web//uploads//2019/04/comingsoon-fm.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (218, '::1', 1554827967, 'Tue, 09 Apr 19 18:39:27 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/cmsSefroweb/cmsSefroweb/uploads/2019/04/comingsoon-fm.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (219, '::1', 1554828020, 'Tue, 09 Apr 19 18:40:20 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/cmsSefroweb/cmsSefroweb/frontend/web//uploads/2019/04/comingsoon-fm.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (220, '::1', 1554828096, 'Tue, 09 Apr 19 18:41:36 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/uploadmanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (221, '::1', 1554828167, 'Tue, 09 Apr 19 18:42:47 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/upload', '[]', '{\"tagIds\":\"undefined\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (222, '::1', 1554828170, 'Tue, 09 Apr 19 18:42:50 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (223, '::1', 1554828171, 'Tue, 09 Apr 19 18:42:51 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/cmsSefroweb/cmsSefroweb/frontend/web//uploads//2019/04/comingsoon-fm.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (224, '::1', 1554828172, 'Tue, 09 Apr 19 18:42:52 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/uploadmanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (225, '::1', 1554828177, 'Tue, 09 Apr 19 18:42:57 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/upload', '[]', '{\"tagIds\":\"undefined\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (226, '::1', 1554828199, 'Tue, 09 Apr 19 18:43:19 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/upload', '[]', '{\"tagIds\":\"undefined\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (227, '::1', 1554828200, 'Tue, 09 Apr 19 18:43:20 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/localhost/cmsSefroweb/cmsSefroweb//uploads//2019/04/photo2016-10-2202-19-48-fm.jpg', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (228, '::1', 1554828228, 'Tue, 09 Apr 19 18:43:48 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/upload', '[]', '{\"tagIds\":\"undefined\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (229, '::1', 1554828244, 'Tue, 09 Apr 19 18:44:04 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/localhost/cmsSefroweb/cmsSefroweb//uploads//2019/04/photo2016-10-2202-19-48-fm.jpg', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (230, '::1', 1554828270, 'Tue, 09 Apr 19 18:44:30 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/upload', '[]', '{\"tagIds\":\"undefined\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (231, '::1', 1554828271, 'Tue, 09 Apr 19 18:44:31 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/@frontend/web//uploads//2019/04/comingsoon-fm.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (232, '::1', 1554828300, 'Tue, 09 Apr 19 18:45:00 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/upload', '[]', '{\"tagIds\":\"undefined\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (233, '::1', 1554828394, 'Tue, 09 Apr 19 18:46:34 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/localhost/cmsSefroweb/cmsSefroweb//uploads//2019/04/photo2016-10-2202-19-48-fm.jpg', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (234, '::1', 1554828405, 'Tue, 09 Apr 19 18:46:45 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (235, '::1', 1554828406, 'Tue, 09 Apr 19 18:46:46 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (236, '::1', 1554829095, 'Tue, 09 Apr 19 18:58:15 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/localhost/cmsSefroweb/cmsSefroweb//uploads//2019/04/photo2016-10-2202-19-48-fm.jpg', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (237, '::1', 1554830067, 'Tue, 09 Apr 19 19:14:27 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (238, '::1', 1554830068, 'Tue, 09 Apr 19 19:14:28 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (239, '::1', 1554830078, 'Tue, 09 Apr 19 19:14:38 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/localhost/cmsSefroweb/cmsSefroweb//uploads//2019/04/photo2016-10-2202-19-48-fm.jpg', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (240, '::1', 1554830082, 'Tue, 09 Apr 19 19:14:42 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (241, '::1', 1554830082, 'Tue, 09 Apr 19 19:14:42 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (242, '::1', 1554830085, 'Tue, 09 Apr 19 19:14:45 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/uploadmanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (243, '::1', 1554830093, 'Tue, 09 Apr 19 19:14:53 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/upload', '[]', '{\"tagIds\":\"undefined\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (244, '::1', 1554830098, 'Tue, 09 Apr 19 19:14:58 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (245, '::1', 1554830136, 'Tue, 09 Apr 19 19:15:36 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/upload', '[]', '{\"tagIds\":\"undefined\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (246, '::1', 1554830169, 'Tue, 09 Apr 19 19:16:09 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/upload', '[]', '{\"tagIds\":\"undefined\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (247, '::1', 1554830520, 'Tue, 09 Apr 19 19:22:00 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (248, '::1', 1554830533, 'Tue, 09 Apr 19 19:22:13 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (249, '::1', 1554830534, 'Tue, 09 Apr 19 19:22:14 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (250, '::1', 1554830544, 'Tue, 09 Apr 19 19:22:24 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (251, '::1', 1554830545, 'Tue, 09 Apr 19 19:22:25 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (252, '::1', 1554830580, 'Tue, 09 Apr 19 19:23:00 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (253, '::1', 1554830580, 'Tue, 09 Apr 19 19:23:00 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (254, '::1', 1554830586, 'Tue, 09 Apr 19 19:23:06 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (255, '::1', 1554830586, 'Tue, 09 Apr 19 19:23:06 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (256, '::1', 1554830600, 'Tue, 09 Apr 19 19:23:20 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (257, '::1', 1554830604, 'Tue, 09 Apr 19 19:23:24 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (258, '::1', 1554830610, 'Tue, 09 Apr 19 19:23:30 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (259, '::1', 1554830610, 'Tue, 09 Apr 19 19:23:30 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (260, '::1', 1554830631, 'Tue, 09 Apr 19 19:23:51 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (261, '::1', 1554830632, 'Tue, 09 Apr 19 19:23:52 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (262, '::1', 1554830639, 'Tue, 09 Apr 19 19:23:59 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (263, '::1', 1554830640, 'Tue, 09 Apr 19 19:24:00 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (264, '::1', 1554830649, 'Tue, 09 Apr 19 19:24:09 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (265, '::1', 1554830650, 'Tue, 09 Apr 19 19:24:10 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (266, '::1', 1554830718, 'Tue, 09 Apr 19 19:25:18 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (267, '::1', 1554830719, 'Tue, 09 Apr 19 19:25:19 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (268, '::1', 1554830779, 'Tue, 09 Apr 19 19:26:19 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (269, '::1', 1554830779, 'Tue, 09 Apr 19 19:26:19 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (270, '::1', 1554830786, 'Tue, 09 Apr 19 19:26:26 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (271, '::1', 1554830787, 'Tue, 09 Apr 19 19:26:27 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (272, '::1', 1554830836, 'Tue, 09 Apr 19 19:27:16 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (273, '::1', 1554830837, 'Tue, 09 Apr 19 19:27:17 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (274, '::1', 1554830849, 'Tue, 09 Apr 19 19:27:29 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (275, '::1', 1554830850, 'Tue, 09 Apr 19 19:27:30 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (276, '::1', 1554830860, 'Tue, 09 Apr 19 19:27:40 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (277, '::1', 1554830861, 'Tue, 09 Apr 19 19:27:41 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (278, '::1', 1554830869, 'Tue, 09 Apr 19 19:27:49 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (279, '::1', 1554830869, 'Tue, 09 Apr 19 19:27:49 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (280, '::1', 1554830887, 'Tue, 09 Apr 19 19:28:07 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (281, '::1', 1554830888, 'Tue, 09 Apr 19 19:28:08 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (282, '::1', 1554830917, 'Tue, 09 Apr 19 19:28:37 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (283, '::1', 1554830918, 'Tue, 09 Apr 19 19:28:38 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (284, '::1', 1554831773, 'Tue, 09 Apr 19 19:42:53 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (285, '::1', 1554831774, 'Tue, 09 Apr 19 19:42:54 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (286, '::1', 1554831853, 'Tue, 09 Apr 19 19:44:13 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (287, '::1', 1554831854, 'Tue, 09 Apr 19 19:44:14 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (288, '::1', 1554831929, 'Tue, 09 Apr 19 19:45:29 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (289, '::1', 1554831930, 'Tue, 09 Apr 19 19:45:30 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (290, '::1', 1554831937, 'Tue, 09 Apr 19 19:45:37 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (291, '::1', 1554831938, 'Tue, 09 Apr 19 19:45:38 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (292, '::1', 1554831943, 'Tue, 09 Apr 19 19:45:43 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (293, '::1', 1554831944, 'Tue, 09 Apr 19 19:45:44 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (294, '::1', 1554831949, 'Tue, 09 Apr 19 19:45:49 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (295, '::1', 1554831950, 'Tue, 09 Apr 19 19:45:50 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (296, '::1', 1554831977, 'Tue, 09 Apr 19 19:46:17 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (297, '::1', 1554831977, 'Tue, 09 Apr 19 19:46:17 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (298, '::1', 1554831984, 'Tue, 09 Apr 19 19:46:24 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (299, '::1', 1554831984, 'Tue, 09 Apr 19 19:46:24 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (300, '::1', 1554832152, 'Tue, 09 Apr 19 19:49:12 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (301, '::1', 1554832153, 'Tue, 09 Apr 19 19:49:13 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (302, '::1', 1554832194, 'Tue, 09 Apr 19 19:49:54 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (303, '::1', 1554832195, 'Tue, 09 Apr 19 19:49:55 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (304, '::1', 1554832227, 'Tue, 09 Apr 19 19:50:27 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (305, '::1', 1554832228, 'Tue, 09 Apr 19 19:50:28 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (306, '::1', 1554832255, 'Tue, 09 Apr 19 19:50:55 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (307, '::1', 1554832255, 'Tue, 09 Apr 19 19:50:55 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (308, '::1', 1554832293, 'Tue, 09 Apr 19 19:51:33 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (309, '::1', 1554832293, 'Tue, 09 Apr 19 19:51:33 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (310, '::1', 1554832295, 'Tue, 09 Apr 19 19:51:35 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/file?id=/uploads/2019/04/img7495.jpg', '{\"id\":\"\\/uploads\\/2019\\/04\\/img7495.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (311, '::1', 1554832295, 'Tue, 09 Apr 19 19:51:35 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/file?id=/uploads//2019/04/a.jpg', '{\"id\":\"\\/uploads\\/\\/2019\\/04\\/a.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (312, '::1', 1554832295, 'Tue, 09 Apr 19 19:51:35 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/file?id=/uploads/2019/04/photo2017-12-0912-52-23.jpg', '{\"id\":\"\\/uploads\\/2019\\/04\\/photo2017-12-0912-52-23.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (313, '::1', 1554832295, 'Tue, 09 Apr 19 19:51:35 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/file?id=/uploads2/2019/04/comingsoon.png', '{\"id\":\"\\/uploads2\\/2019\\/04\\/comingsoon.png\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (314, '::1', 1554832303, 'Tue, 09 Apr 19 19:51:43 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (315, '::1', 1554832303, 'Tue, 09 Apr 19 19:51:43 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (316, '::1', 1554832304, 'Tue, 09 Apr 19 19:51:44 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/file?id=/uploads/2019/04/photo2017-12-0912-52-23.jpg', '{\"id\":\"\\/uploads\\/2019\\/04\\/photo2017-12-0912-52-23.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (317, '::1', 1554832304, 'Tue, 09 Apr 19 19:51:44 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/file?id=/uploads//2019/04/a.jpg', '{\"id\":\"\\/uploads\\/\\/2019\\/04\\/a.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (318, '::1', 1554832304, 'Tue, 09 Apr 19 19:51:44 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/file?id=/uploads2/2019/04/comingsoon.png', '{\"id\":\"\\/uploads2\\/2019\\/04\\/comingsoon.png\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (319, '::1', 1554832304, 'Tue, 09 Apr 19 19:51:44 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/file?id=/uploads/2019/04/img7495.jpg', '{\"id\":\"\\/uploads\\/2019\\/04\\/img7495.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (320, '::1', 1554832319, 'Tue, 09 Apr 19 19:51:59 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (321, '::1', 1554832319, 'Tue, 09 Apr 19 19:51:59 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (322, '::1', 1554832320, 'Tue, 09 Apr 19 19:52:00 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/file?id=/uploads/2019/04/img7495.jpg', '{\"id\":\"\\/uploads\\/2019\\/04\\/img7495.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (323, '::1', 1554832320, 'Tue, 09 Apr 19 19:52:00 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/file?id=/uploads2/2019/04/comingsoon.png', '{\"id\":\"\\/uploads2\\/2019\\/04\\/comingsoon.png\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (324, '::1', 1554832320, 'Tue, 09 Apr 19 19:52:00 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/file?id=/uploads/2019/04/photo2017-12-0912-52-23.jpg', '{\"id\":\"\\/uploads\\/2019\\/04\\/photo2017-12-0912-52-23.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (325, '::1', 1554832320, 'Tue, 09 Apr 19 19:52:00 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/file?id=/uploads//2019/04/a.jpg', '{\"id\":\"\\/uploads\\/\\/2019\\/04\\/a.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (326, '::1', 1554832832, 'Tue, 09 Apr 19 20:00:32 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (327, '::1', 1554832833, 'Tue, 09 Apr 19 20:00:33 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (328, '::1', 1554832834, 'Tue, 09 Apr 19 20:00:34 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/@frontend?id=/uploads2/2019/04/comingsoon.png', '{\"id\":\"\\/uploads2\\/2019\\/04\\/comingsoon.png\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (329, '::1', 1554832834, 'Tue, 09 Apr 19 20:00:34 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/@frontend?id=/uploads//2019/04/a.jpg', '{\"id\":\"\\/uploads\\/\\/2019\\/04\\/a.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (330, '::1', 1554832834, 'Tue, 09 Apr 19 20:00:34 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/@frontend?id=/uploads/2019/04/img7495.jpg', '{\"id\":\"\\/uploads\\/2019\\/04\\/img7495.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (331, '::1', 1554832834, 'Tue, 09 Apr 19 20:00:34 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/@frontend?id=/uploads/2019/04/photo2017-12-0912-52-23.jpg', '{\"id\":\"\\/uploads\\/2019\\/04\\/photo2017-12-0912-52-23.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (332, '::1', 1554832885, 'Tue, 09 Apr 19 20:01:25 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (333, '::1', 1554832886, 'Tue, 09 Apr 19 20:01:26 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (334, '::1', 1554832887, 'Tue, 09 Apr 19 20:01:27 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/frontend/uploads//uploads/2019/04/photo2017-12-0912-52-23.jpg', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (335, '::1', 1554832887, 'Tue, 09 Apr 19 20:01:27 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/frontend/uploads//uploads/2019/04/img7495.jpg', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (336, '::1', 1554832887, 'Tue, 09 Apr 19 20:01:27 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/frontend/uploads//uploads2/2019/04/comingsoon.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (337, '::1', 1554832887, 'Tue, 09 Apr 19 20:01:27 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/frontend/uploads//uploads//2019/04/a.jpg', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (338, '::1', 1554832911, 'Tue, 09 Apr 19 20:01:51 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (339, '::1', 1554832912, 'Tue, 09 Apr 19 20:01:52 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (340, '::1', 1554832934, 'Tue, 09 Apr 19 20:02:14 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (341, '::1', 1554832935, 'Tue, 09 Apr 19 20:02:15 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (342, '::1', 1554832960, 'Tue, 09 Apr 19 20:02:40 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (343, '::1', 1554832961, 'Tue, 09 Apr 19 20:02:41 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (344, '::1', 1554832994, 'Tue, 09 Apr 19 20:03:14 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (345, '::1', 1554832995, 'Tue, 09 Apr 19 20:03:15 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (346, '::1', 1554833017, 'Tue, 09 Apr 19 20:03:37 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (347, '::1', 1554833018, 'Tue, 09 Apr 19 20:03:38 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (348, '::1', 1554833032, 'Tue, 09 Apr 19 20:03:52 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (349, '::1', 1554833033, 'Tue, 09 Apr 19 20:03:53 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (350, '::1', 1554833033, 'Tue, 09 Apr 19 20:03:53 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (351, '::1', 1554833055, 'Tue, 09 Apr 19 20:04:15 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (352, '::1', 1554833055, 'Tue, 09 Apr 19 20:04:15 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (353, '::1', 1554833065, 'Tue, 09 Apr 19 20:04:25 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/default/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (354, '::1', 1554833067, 'Tue, 09 Apr 19 20:04:27 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (355, '::1', 1554833068, 'Tue, 09 Apr 19 20:04:28 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (356, '::1', 1554833190, 'Tue, 09 Apr 19 20:06:30 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/default/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (357, '::1', 1554833191, 'Tue, 09 Apr 19 20:06:31 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (358, '::1', 1554833192, 'Tue, 09 Apr 19 20:06:32 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (359, '::1', 1554833192, 'Tue, 09 Apr 19 20:06:32 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (360, '::1', 1554833196, 'Tue, 09 Apr 19 20:06:36 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/uploadmanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (361, '::1', 1554833204, 'Tue, 09 Apr 19 20:06:44 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/upload', '[]', '{\"tagIds\":\"undefined\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (362, '::1', 1554833278, 'Tue, 09 Apr 19 20:07:58 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (363, '::1', 1554833310, 'Tue, 09 Apr 19 20:08:30 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (364, '::1', 1554963147, 'Thu, 11 Apr 19 08:12:27 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (365, '::1', 1554963155, 'Thu, 11 Apr 19 08:12:35 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (366, '::1', 1554963157, 'Thu, 11 Apr 19 08:12:37 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/uploadmanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (367, '::1', 1555054890, 'Fri, 12 Apr 19 09:41:30 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/file?id=5ca34ccf06d55.jpg', '{\"id\":\"5ca34ccf06d55.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (368, '::1', 1555054915, 'Fri, 12 Apr 19 09:41:55 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (369, '::1', 1555054917, 'Fri, 12 Apr 19 09:41:57 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (370, '::1', 1555054919, 'Fri, 12 Apr 19 09:41:59 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/file?id=7', '{\"id\":\"7\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (371, '::1', 1555054919, 'Fri, 12 Apr 19 09:41:59 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/file?id=5ca34ccf06d55.jpg', '{\"id\":\"5ca34ccf06d55.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (372, '::1', 1555054920, 'Fri, 12 Apr 19 09:42:00 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/logvisitor', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (373, '::1', 1555054924, 'Fri, 12 Apr 19 09:42:04 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/logvisitor', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (374, '::1', 1555054928, 'Fri, 12 Apr 19 09:42:08 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/comment/manage/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (375, '::1', 1555055684, 'Fri, 12 Apr 19 09:54:44 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/menu', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (376, '::1', 1555055988, 'Fri, 12 Apr 19 09:59:48 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (377, '::1', 1555055990, 'Fri, 12 Apr 19 09:59:50 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (378, '::1', 1555055991, 'Fri, 12 Apr 19 09:59:51 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (379, '::1', 1555056054, 'Fri, 12 Apr 19 10:00:54 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (380, '::1', 1555056054, 'Fri, 12 Apr 19 10:00:54 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/file?id=5ca34ccf06d55.jpg', '{\"id\":\"5ca34ccf06d55.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (381, '::1', 1555056054, 'Fri, 12 Apr 19 10:00:54 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/file?id=7', '{\"id\":\"7\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (382, '::1', 1555056055, 'Fri, 12 Apr 19 10:00:55 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/acticle/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (383, '::1', 1555056056, 'Fri, 12 Apr 19 10:00:56 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/logvisitor', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (384, '::1', 1555056061, 'Fri, 12 Apr 19 10:01:01 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/comment/manage/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (385, '::1', 1555058134, 'Fri, 12 Apr 19 10:35:34 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (386, '::1', 1555058138, 'Fri, 12 Apr 19 10:35:38 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/update?id=1', '{\"id\":\"1\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (387, '::1', 1555058142, 'Fri, 12 Apr 19 10:35:42 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (388, '::1', 1555058145, 'Fri, 12 Apr 19 10:35:45 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/update?id=1', '{\"id\":\"1\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (389, '::1', 1555058417, 'Fri, 12 Apr 19 10:40:17 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/rbac', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (390, '::1', 1555058436, 'Fri, 12 Apr 19 10:40:36 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/rbac/route', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (391, '::1', 1555058487, 'Fri, 12 Apr 19 10:41:27 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/rbac/route', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (392, '::1', 1555058584, 'Fri, 12 Apr 19 10:43:04 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/rbac/route', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (393, '::1', 1555058586, 'Fri, 12 Apr 19 10:43:06 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/rbac/route', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (394, '::1', 1555058614, 'Fri, 12 Apr 19 10:43:34 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/rbac/route', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (395, '::1', 1555058626, 'Fri, 12 Apr 19 10:43:46 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (396, '::1', 1555058629, 'Fri, 12 Apr 19 10:43:49 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/update?id=1', '{\"id\":\"1\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (397, '::1', 1555059035, 'Fri, 12 Apr 19 10:50:35 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/update?id=1', '{\"id\":\"1\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (398, '::1', 1555059038, 'Fri, 12 Apr 19 10:50:38 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/rbac/assignment', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (399, '::1', 1555059043, 'Fri, 12 Apr 19 10:50:43 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/rbac/assignment', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (400, '::1', 1555059153, 'Fri, 12 Apr 19 10:52:33 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (401, '::1', 1555059158, 'Fri, 12 Apr 19 10:52:38 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (402, '::1', 1555059174, 'Fri, 12 Apr 19 10:52:54 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (403, '::1', 1555059180, 'Fri, 12 Apr 19 10:53:00 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/update?id=1', '{\"id\":\"1\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (404, '::1', 1555059182, 'Fri, 12 Apr 19 10:53:02 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/update-profile?id=1', '{\"id\":\"1\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (405, '::1', 1555059184, 'Fri, 12 Apr 19 10:53:04 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/info?id=1', '{\"id\":\"1\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (406, '::1', 1555059187, 'Fri, 12 Apr 19 10:53:07 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (407, '::1', 1555059190, 'Fri, 12 Apr 19 10:53:10 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/create', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (408, '::1', 1555059194, 'Fri, 12 Apr 19 10:53:14 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/create', '[]', '{\"_csrf-backend\":\"dXtUul5lxWR9aHGPncp68L6mWYWi8Djtyrgccm4iU9oiHiLuFTWAIRU8C9Xr_g2F-NUS7fWmcqK8-l4lBUAFlg==\",\"User\":{\"email\":\"dasdad@asdasd.com\",\"username\":\"\",\"password\":\"\"},\"ajax\":\"w3\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (409, '::1', 1555059196, 'Fri, 12 Apr 19 10:53:16 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/create', '[]', '{\"_csrf-backend\":\"dXtUul5lxWR9aHGPncp68L6mWYWi8Djtyrgccm4iU9oiHiLuFTWAIRU8C9Xr_g2F-NUS7fWmcqK8-l4lBUAFlg==\",\"User\":{\"email\":\"dasdad@asdasd.com\",\"username\":\"asdad\",\"password\":\"\"},\"ajax\":\"w3\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (410, '::1', 1555059198, 'Fri, 12 Apr 19 10:53:18 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/create', '[]', '{\"_csrf-backend\":\"dXtUul5lxWR9aHGPncp68L6mWYWi8Djtyrgccm4iU9oiHiLuFTWAIRU8C9Xr_g2F-NUS7fWmcqK8-l4lBUAFlg==\",\"User\":{\"email\":\"dasdad@asdasd.com\",\"username\":\"asdad\",\"password\":\"asdadasd\"},\"ajax\":\"w3\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (411, '::1', 1555059198, 'Fri, 12 Apr 19 10:53:18 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/create', '[]', '{\"_csrf-backend\":\"dXtUul5lxWR9aHGPncp68L6mWYWi8Djtyrgccm4iU9oiHiLuFTWAIRU8C9Xr_g2F-NUS7fWmcqK8-l4lBUAFlg==\",\"User\":{\"email\":\"dasdad@asdasd.com\",\"username\":\"asdad\",\"password\":\"asdadasd\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (412, '::1', 1555059199, 'Fri, 12 Apr 19 10:53:19 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/update?id=2', '{\"id\":\"2\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (413, '::1', 1555059201, 'Fri, 12 Apr 19 10:53:21 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/info?id=2', '{\"id\":\"2\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (414, '::1', 1555059203, 'Fri, 12 Apr 19 10:53:23 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (415, '::1', 1555059209, 'Fri, 12 Apr 19 10:53:29 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/update?id=2', '{\"id\":\"2\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (416, '::1', 1555059211, 'Fri, 12 Apr 19 10:53:31 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/update-profile?id=2', '{\"id\":\"2\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (417, '::1', 1555059213, 'Fri, 12 Apr 19 10:53:33 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/info?id=2', '{\"id\":\"2\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (418, '::1', 1555059217, 'Fri, 12 Apr 19 10:53:37 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (419, '::1', 1555059269, 'Fri, 12 Apr 19 10:54:29 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (420, '::1', 1555059271, 'Fri, 12 Apr 19 10:54:31 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (421, '::1', 1555059272, 'Fri, 12 Apr 19 10:54:32 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (422, '::1', 1555059273, 'Fri, 12 Apr 19 10:54:33 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (423, '::1', 1555059275, 'Fri, 12 Apr 19 10:54:35 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/update?id=2', '{\"id\":\"2\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (424, '::1', 1555059277, 'Fri, 12 Apr 19 10:54:37 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/update-profile?id=2', '{\"id\":\"2\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (425, '::1', 1555059278, 'Fri, 12 Apr 19 10:54:38 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/info?id=2', '{\"id\":\"2\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (426, '::1', 1555059469, 'Fri, 12 Apr 19 10:57:49 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/assignments', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (427, '::1', 1555059481, 'Fri, 12 Apr 19 10:58:01 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/assignments?id=2', '{\"id\":\"2\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (428, '::1', 1555059495, 'Fri, 12 Apr 19 10:58:15 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/assignments?id=1', '{\"id\":\"1\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (429, '::1', 1555059499, 'Fri, 12 Apr 19 10:58:19 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/assignments?id=2', '{\"id\":\"2\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (430, '::1', 1555059500, 'Fri, 12 Apr 19 10:58:20 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/assignments', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (431, '::1', 1555059515, 'Fri, 12 Apr 19 10:58:35 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/assignments?id=133', '{\"id\":\"133\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (432, '::1', 1555060110, 'Fri, 12 Apr 19 11:08:30 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/assignments?id=133', '{\"id\":\"133\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (433, '::1', 1555060114, 'Fri, 12 Apr 19 11:08:34 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (434, '::1', 1555060118, 'Fri, 12 Apr 19 11:08:38 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (435, '::1', 1555060122, 'Fri, 12 Apr 19 11:08:42 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/update?id=2', '{\"id\":\"2\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (436, '::1', 1555060125, 'Fri, 12 Apr 19 11:08:45 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/assignments?id=2', '{\"id\":\"2\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (437, '::1', 1555060146, 'Fri, 12 Apr 19 11:09:06 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (438, '::1', 1555060148, 'Fri, 12 Apr 19 11:09:08 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/user/admin/update?id=1', '{\"id\":\"1\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (439, '::1', 1555060178, 'Fri, 12 Apr 19 11:09:38 +0200', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/logvisitor', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (440, '::1', 1555259872, 'Sun, 14 Apr 19 18:37:52 +0200', '/cmsSefroweb/crmSefroweb/backend/web/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (441, '::1', 1555260538, 'Sun, 14 Apr 19 18:48:58 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (442, '::1', 1555260538, 'Sun, 14 Apr 19 18:48:58 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/acticle/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (443, '::1', 1555260540, 'Sun, 14 Apr 19 18:49:00 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/comment/manage/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (444, '::1', 1555260557, 'Sun, 14 Apr 19 18:49:17 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (445, '::1', 1555260740, 'Sun, 14 Apr 19 18:52:20 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (446, '::1', 1555260797, 'Sun, 14 Apr 19 18:53:17 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (447, '::1', 1555261032, 'Sun, 14 Apr 19 18:57:12 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (448, '::1', 1555261084, 'Sun, 14 Apr 19 18:58:04 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (449, '::1', 1555261273, 'Sun, 14 Apr 19 19:01:13 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (450, '::1', 1555261333, 'Sun, 14 Apr 19 19:02:13 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (451, '::1', 1555261349, 'Sun, 14 Apr 19 19:02:29 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (452, '::1', 1555261391, 'Sun, 14 Apr 19 19:03:11 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (453, '::1', 1555261395, 'Sun, 14 Apr 19 19:03:15 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (454, '::1', 1555261420, 'Sun, 14 Apr 19 19:03:40 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (455, '::1', 1555261478, 'Sun, 14 Apr 19 19:04:38 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (456, '::1', 1555261575, 'Sun, 14 Apr 19 19:06:15 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (457, '::1', 1555261609, 'Sun, 14 Apr 19 19:06:49 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (458, '::1', 1555261615, 'Sun, 14 Apr 19 19:06:55 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1555261610214', '{\"_\":\"1555261610214\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (459, '::1', 1555261658, 'Sun, 14 Apr 19 19:07:38 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1555261610215', '{\"_\":\"1555261610215\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (460, '::1', 1555261692, 'Sun, 14 Apr 19 19:08:12 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1555261610216', '{\"_\":\"1555261610216\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (461, '::1', 1555261742, 'Sun, 14 Apr 19 19:09:02 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1555261610217', '{\"_\":\"1555261610217\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (462, '::1', 1555261788, 'Sun, 14 Apr 19 19:09:48 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1555261610218', '{\"_\":\"1555261610218\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (463, '::1', 1555261887, 'Sun, 14 Apr 19 19:11:27 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1555261610219', '{\"_\":\"1555261610219\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (464, '::1', 1555262065, 'Sun, 14 Apr 19 19:14:25 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1555261610220', '{\"_\":\"1555261610220\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (465, '::1', 1555262117, 'Sun, 14 Apr 19 19:15:17 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1555261610221', '{\"_\":\"1555261610221\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (466, '::1', 1555262148, 'Sun, 14 Apr 19 19:15:48 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1555261610222', '{\"_\":\"1555261610222\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (467, '::1', 1555262218, 'Sun, 14 Apr 19 19:16:58 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1555261610223', '{\"_\":\"1555261610223\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (468, '::1', 1555262286, 'Sun, 14 Apr 19 19:18:06 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1555261610224', '{\"_\":\"1555261610224\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (469, '::1', 1555262334, 'Sun, 14 Apr 19 19:18:54 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (470, '::1', 1555262383, 'Sun, 14 Apr 19 19:19:43 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (471, '::1', 1555262396, 'Sun, 14 Apr 19 19:19:56 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (472, '::1', 1555262536, 'Sun, 14 Apr 19 19:22:16 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (473, '::1', 1555262629, 'Sun, 14 Apr 19 19:23:49 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (474, '::1', 1555262679, 'Sun, 14 Apr 19 19:24:39 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (475, '::1', 1555262882, 'Sun, 14 Apr 19 19:28:02 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (476, '::1', 1555262930, 'Sun, 14 Apr 19 19:28:50 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create', '[]', '{\"_csrf-backend\":\"VfZjynPxDA-QPomLV6BH9hXYIzkEQPaJgcHydc5IOtQCkxWeOKFJSvhq89EhlDCDU6toUVMWvMb3g7AipSpsmA==\",\"InvProducts\":{\"code\":\"123\",\"name\":\"\",\"invProductManufacturerID\":\"1\",\"invProductSupplierID\":\"2\",\"invProductTypeID\":\"16\",\"invProductShapeID\":\"2\",\"invProductCategoryID\":\"4\",\"summary\":\"\",\"description\":\"\",\"file\":\"\",\"active\":\"0\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (477, '::1', 1555262930, 'Sun, 14 Apr 19 19:28:50 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/view', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (478, '::1', 1555262935, 'Sun, 14 Apr 19 19:28:55 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (479, '::1', 1555262939, 'Sun, 14 Apr 19 19:28:59 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (480, '::1', 1555262942, 'Sun, 14 Apr 19 19:29:02 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1555262940304', '{\"_\":\"1555262940304\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (481, '::1', 1555262948, 'Sun, 14 Apr 19 19:29:08 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1555262940304', '{\"_\":\"1555262940304\"}', '{\"_csrf-backend\":\"fKkeKlOY5hzi87q1I5kHMb2ofnv26io8N28UvDQDiXgrzGh-GMijWYqnwO9VrXBE-9s1E6G8YHNBLVbrX2HfNA==\",\"InvProducts\":{\"code\":\"123\",\"name\":\"\",\"invProductManufacturerID\":\"1\",\"invProductSupplierID\":\"2\",\"invProductTypeID\":\"16\",\"invProductShapeID\":\"2\",\"invProductCategoryID\":\"4\",\"summary\":\"\",\"description\":\"\",\"file\":\"\",\"active\":\"0\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (482, '::1', 1555263870, 'Sun, 14 Apr 19 19:44:30 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1555262940305', '{\"_\":\"1555262940305\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (483, '::1', 1555263877, 'Sun, 14 Apr 19 19:44:37 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1555262940305', '{\"_\":\"1555262940305\"}', '{\"_csrf-backend\":\"zGUsH6i3RhSZIXquHSgOlmuA1ppiOb0jw4bmqVy4OISbAFpL4-cDUfF1APRrHHnjLfOd8jVv92y1xKT-N9puyA==\",\"InvProducts\":{\"code\":\"3242\",\"name\":\"\",\"invProductManufacturerID\":\"1\",\"invProductSupplierID\":\"2\",\"invProductTypeID\":\"16\",\"invProductShapeID\":\"2\",\"invProductCategoryID\":\"4\",\"summary\":\"\",\"description\":\"\",\"file\":\"\",\"active\":\"0\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (484, '::1', 1555263877, 'Sun, 14 Apr 19 19:44:37 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products?_pjax=%23crud-datatable-pjax', '{\"_pjax\":\"#crud-datatable-pjax\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (485, '::1', 1555263885, 'Sun, 14 Apr 19 19:44:45 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/delete/1', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (486, '::1', 1556302788, 'Fri, 26 Apr 19 20:19:48 +0200', '/cmsSefroweb/crmSefroweb/backend/web/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (487, '::1', 1556302790, 'Fri, 26 Apr 19 20:19:50 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/login', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (488, '::1', 1556302800, 'Fri, 26 Apr 19 20:20:00 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/login', '[]', '{\"_csrf-backend\":\"BqfQbyFUCSiILk1mGAHXh1hfcmdBIvXql7O7s7HZEh00xIMbEzdGettaG1RRNuO0ETU9BAVmu43C6tz9geFncA==\",\"login-form\":{\"login\":\"admin\",\"password\":\"momibs450\",\"rememberMe\":\"0\"},\"ajax\":\"login-form\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (489, '::1', 1556302805, 'Fri, 26 Apr 19 20:20:05 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/login', '[]', '{\"_csrf-backend\":\"BqfQbyFUCSiILk1mGAHXh1hfcmdBIvXql7O7s7HZEh00xIMbEzdGettaG1RRNuO0ETU9BAVmu43C6tz9geFncA==\",\"login-form\":{\"login\":\"admin\",\"password\":\"123456\",\"rememberMe\":\"0\"},\"ajax\":\"login-form\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (490, '::1', 1556302806, 'Fri, 26 Apr 19 20:20:06 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/login', '[]', '{\"_csrf-backend\":\"BqfQbyFUCSiILk1mGAHXh1hfcmdBIvXql7O7s7HZEh00xIMbEzdGettaG1RRNuO0ETU9BAVmu43C6tz9geFncA==\",\"login-form\":{\"login\":\"admin\",\"password\":\"123456\",\"rememberMe\":\"0\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (491, '::1', 1556302807, 'Fri, 26 Apr 19 20:20:07 +0200', '/cmsSefroweb/crmSefroweb/backend/web/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (492, '::1', 1557670884, 'Sun, 12 May 19 16:21:24 +0200', '/cmsSefroweb/crmSefroweb/backend/web/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (493, '::1', 1557670886, 'Sun, 12 May 19 16:21:26 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/login', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (494, '::1', 1557670909, 'Sun, 12 May 19 16:21:49 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/login', '[]', '{\"_csrf-backend\":\"W5qInfS1I_NRt_8ZLJMK0rrQC05o4ex4aI1jH1ytitw0wMrehdRJ3hmFmC4epE-Yy6ZyNi6QjzUQxFNAEu__rA==\",\"login-form\":{\"login\":\"admin\",\"password\":\"123456\",\"rememberMe\":\"0\"},\"ajax\":\"login-form\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (495, '::1', 1557670910, 'Sun, 12 May 19 16:21:50 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/login', '[]', '{\"_csrf-backend\":\"W5qInfS1I_NRt_8ZLJMK0rrQC05o4ex4aI1jH1ytitw0wMrehdRJ3hmFmC4epE-Yy6ZyNi6QjzUQxFNAEu__rA==\",\"login-form\":{\"login\":\"admin\",\"password\":\"123456\",\"rememberMe\":\"0\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (496, '::1', 1557670911, 'Sun, 12 May 19 16:21:51 +0200', '/cmsSefroweb/crmSefroweb/backend/web/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (497, '::1', 1557673510, 'Sun, 12 May 19 17:05:10 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/comment/manage/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (498, '::1', 1557673520, 'Sun, 12 May 19 17:05:20 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (499, '::1', 1557673522, 'Sun, 12 May 19 17:05:22 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=7', '{\"id\":\"7\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (500, '::1', 1557673522, 'Sun, 12 May 19 17:05:22 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=5ca34ccf06d55.jpg', '{\"id\":\"5ca34ccf06d55.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (501, '::1', 1557673525, 'Sun, 12 May 19 17:05:25 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (502, '::1', 1557673528, 'Sun, 12 May 19 17:05:28 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (503, '::1', 1557673532, 'Sun, 12 May 19 17:05:32 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (504, '::1', 1557673543, 'Sun, 12 May 19 17:05:43 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/filemanager/file/uploadmanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (505, '::1', 1557673569, 'Sun, 12 May 19 17:06:09 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/filemanager/file/upload', '[]', '{\"tagIds\":\"undefined\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (506, '::1', 1557673575, 'Sun, 12 May 19 17:06:15 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (507, '::1', 1557673580, 'Sun, 12 May 19 17:06:20 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/filemanager/default/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (508, '::1', 1557673583, 'Sun, 12 May 19 17:06:23 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (509, '::1', 1557673586, 'Sun, 12 May 19 17:06:26 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (510, '::1', 1557673711, 'Sun, 12 May 19 17:08:31 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/product', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (511, '::1', 1557673720, 'Sun, 12 May 19 17:08:40 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/product/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (512, '::1', 1557673733, 'Sun, 12 May 19 17:08:53 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (513, '::1', 1557673737, 'Sun, 12 May 19 17:08:57 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1557673734882', '{\"_\":\"1557673734882\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (514, '::1', 1557675806, 'Sun, 12 May 19 17:43:26 +0200', '/cmsSefroweb/crmSefroweb/backend/web/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (515, '::1', 1557675876, 'Sun, 12 May 19 17:44:36 +0200', '/cmsSefroweb/crmSefroweb/backend/web/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (516, '::1', 1557675881, 'Sun, 12 May 19 17:44:41 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (517, '::1', 1557675885, 'Sun, 12 May 19 17:44:45 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=5ca34ccf06d55.jpg', '{\"id\":\"5ca34ccf06d55.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (518, '::1', 1557675885, 'Sun, 12 May 19 17:44:45 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=7', '{\"id\":\"7\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (519, '::1', 1557675892, 'Sun, 12 May 19 17:44:52 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/location/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (520, '::1', 1557675901, 'Sun, 12 May 19 17:45:01 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/site/location', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (521, '::1', 1557675918, 'Sun, 12 May 19 17:45:18 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/site/location', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (522, '::1', 1557675937, 'Sun, 12 May 19 17:45:37 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/site/location', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (523, '::1', 1557681038, 'Sun, 12 May 19 19:10:38 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/site/location', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (524, '::1', 1557681053, 'Sun, 12 May 19 19:10:53 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/site/location', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (525, '::1', 1557681073, 'Sun, 12 May 19 19:11:13 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/site/location', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (526, '::1', 1557681084, 'Sun, 12 May 19 19:11:24 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/site/location', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (527, '::1', 1557681091, 'Sun, 12 May 19 19:11:31 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/site/location', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (528, '::1', 1557681128, 'Sun, 12 May 19 19:12:08 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/site/location', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (529, '::1', 1557681269, 'Sun, 12 May 19 19:14:29 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/site/location', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (530, '::1', 1557681454, 'Sun, 12 May 19 19:17:34 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/site/location', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (531, '::1', 1557681513, 'Sun, 12 May 19 19:18:33 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/site/location', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (532, '::1', 1557681550, 'Sun, 12 May 19 19:19:10 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/site/location', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (533, '::1', 1557681565, 'Sun, 12 May 19 19:19:25 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/site/location', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (534, '::1', 1557681963, 'Sun, 12 May 19 19:26:03 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/gii', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (535, '::1', 1557681967, 'Sun, 12 May 19 19:26:07 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/gii/model', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (536, '::1', 1557681980, 'Sun, 12 May 19 19:26:20 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/gii/model', '[]', '{\"_csrf-backend\":\"qcKRso-rwF3tTwDgAavpljPIQ7N_xrkBVZTcz1zxIkrDiMnF-tmTOac8TZNQnaDGcYURiiCtwWICubq5JIBrDw==\",\"Generator\":{\"tableName\":\"about\",\"modelClass\":\"About\",\"standardizeCapitals\":\"0\",\"singularize\":\"0\",\"ns\":\"common\\\\models\",\"baseClass\":\"yii\\\\db\\\\ActiveRecord\",\"db\":\"db\",\"useTablePrefix\":\"0\",\"generateRelations\":\"all\",\"generateRelationsFromCurrentSchema\":\"1\",\"generateLabelsFromComments\":\"0\",\"generateQuery\":\"1\",\"queryNs\":\"common\\\\models\",\"queryClass\":\"AboutQuery\",\"queryBaseClass\":\"yii\\\\db\\\\ActiveQuery\",\"enableI18N\":\"0\",\"messageCategory\":\"app\",\"useSchemaName\":\"1\",\"template\":\"default\"},\"preview\":\"\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (537, '::1', 1557681987, 'Sun, 12 May 19 19:26:27 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/gii/model', '[]', '{\"_csrf-backend\":\"SUwgjY5qhh75V2g65MiQdkxhoeAsmfD1t5lbgsiHQ3cjBnj6-xjVerMkJUm1_tkmDizz2XPyiJbgtD30sPYKMg==\",\"Generator\":{\"tableName\":\"about\",\"modelClass\":\"About\",\"standardizeCapitals\":\"0\",\"singularize\":\"0\",\"ns\":\"common\\\\models\",\"baseClass\":\"yii\\\\db\\\\ActiveRecord\",\"db\":\"db\",\"useTablePrefix\":\"0\",\"generateRelations\":\"all\",\"generateRelationsFromCurrentSchema\":\"1\",\"generateLabelsFromComments\":\"0\",\"generateQuery\":\"1\",\"queryNs\":\"common\\\\models\",\"queryClass\":\"AboutQuery\",\"queryBaseClass\":\"yii\\\\db\\\\ActiveQuery\",\"enableI18N\":\"0\",\"messageCategory\":\"app\",\"useSchemaName\":\"1\",\"template\":\"default\"},\"answers\":{\"ef8b8353fb7d2c9114032a702ddef3bb\":\"1\",\"270201040b800648a86c569e2f3afd1f\":\"1\"},\"generate\":\"\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (538, '::1', 1557681995, 'Sun, 12 May 19 19:26:35 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/gii/crud', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (539, '::1', 1557682066, 'Sun, 12 May 19 19:27:46 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/gii/crud', '[]', '{\"_csrf-backend\":\"OJnXb393HLmSvOfmo9_RcHHvzJdt1-MW1pOoz00mLxtS048YCgVP3djPqpXy6ZggM6KerjK8m3WBvs65NVdmXg==\",\"Generator\":{\"modelClass\":\"common\\\\models\\\\About\",\"searchModelClass\":\"common\\\\models\\\\AboutSearch\",\"controllerClass\":\"backend\\\\controllers\\\\AboutController\",\"viewPath\":\"@backend\\/views\\/about\",\"baseControllerClass\":\"yii\\\\web\\\\Controller\",\"indexWidgetType\":\"grid\",\"enableI18N\":\"1\",\"enablePjax\":\"0\",\"messageCategory\":\"app\",\"template\":\"default\"},\"preview\":\"\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (540, '::1', 1557682082, 'Sun, 12 May 19 19:28:02 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/gii/crud', '[]', '{\"_csrf-backend\":\"xAPTu3ZjRxDlFNW621bcduSCHStgh9mkqcSTQ37s4giuSYvMAxEUdK9nmMmKYJUmps9PEj_socf-6fU1Bp2rTQ==\",\"Generator\":{\"modelClass\":\"common\\\\models\\\\About\",\"searchModelClass\":\"common\\\\models\\\\AboutSearch\",\"controllerClass\":\"backend\\\\controllers\\\\AboutController\",\"viewPath\":\"@backend\\/views\\/about\",\"baseControllerClass\":\"yii\\\\web\\\\Controller\",\"indexWidgetType\":\"grid\",\"enableI18N\":\"1\",\"enablePjax\":\"0\",\"messageCategory\":\"app\",\"template\":\"default\"},\"answers\":{\"071b45b46730f7475cd2f8ddc514f0db\":\"1\",\"23de8d12851509115b7c3c3064dbdaa8\":\"1\",\"4daea847e9eaaf436fe14153ee1fef3a\":\"1\",\"a5050a38e880bb99be201badffb932a6\":\"1\",\"87f93d248ad1ddc72e206a7d79306fe2\":\"1\",\"39c215568f1c584f7606da1fba12e499\":\"1\",\"7b2e69858c19d9ca039c23485fb63854\":\"1\",\"6a0408748163a73fd5527ae37101c714\":\"1\"},\"generate\":\"\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (541, '::1', 1557682105, 'Sun, 12 May 19 19:28:25 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/about', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (542, '::1', 1557682122, 'Sun, 12 May 19 19:28:42 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/about/create', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (543, '::1', 1557682135, 'Sun, 12 May 19 19:28:55 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/about/create', '[]', '{\"_csrf-backend\":\"Im5ZwpUdqU7fS_cGAfHhuWUO7-EsdXsT7U81bc2-jy1IJAG14G_6KpU4unVQx6jpJ0O92HMeA3C6YlMbtc_GaA==\",\"About\":{\"tell\":\"wer\",\"tell2\":\"\",\"address\":\"\",\"lat\":\"\",\"lng\":\"\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (544, '::1', 1557682135, 'Sun, 12 May 19 19:28:55 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/about/1', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (545, '::1', 1557682138, 'Sun, 12 May 19 19:28:58 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/about/update/1', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (546, '::1', 1557682183, 'Sun, 12 May 19 19:29:43 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/about/update/1', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (547, '::1', 1557682294, 'Sun, 12 May 19 19:31:34 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/about/update/1', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (548, '::1', 1557682305, 'Sun, 12 May 19 19:31:45 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/about/update/1', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (549, '::1', 1557682339, 'Sun, 12 May 19 19:32:19 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/about/update/1', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (550, '::1', 1557682371, 'Sun, 12 May 19 19:32:51 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/about/update/1', '[]', '{\"_csrf-backend\":\"Tin2EFXdw7KEpfPNDK3KoVvjZQsezJ_3A4Rlhj4YemkkY65nIK-Q1s7Wvr5dm4PxGa43MkGn55RUqQPwRmkzLA==\",\"About\":{\"tell\":\"09336086658\",\"tell2\":\"09124941324\",\"address\":\"tehran - kh asdasdasd asd adas-da sdas as dasda d asdad a\",\"lat\":\"35.74593135576459\",\"lng\":\"51.37545183563236\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (551, '::1', 1557682371, 'Sun, 12 May 19 19:32:51 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/about/1', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (552, '::1', 1557682381, 'Sun, 12 May 19 19:33:01 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/about/update/1', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (553, '::1', 1557682531, 'Sun, 12 May 19 19:35:31 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/about/update/1', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (554, '::1', 1557682532, 'Sun, 12 May 19 19:35:32 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/about/update', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (555, '::1', 1557682614, 'Sun, 12 May 19 19:36:54 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/about/update', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (556, '::1', 1557682633, 'Sun, 12 May 19 19:37:13 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/about/update', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (557, '::1', 1557682645, 'Sun, 12 May 19 19:37:25 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/about/update', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (558, '::1', 1557682670, 'Sun, 12 May 19 19:37:50 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/about/update', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (559, '::1', 1557682714, 'Sun, 12 May 19 19:38:34 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/about/update', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (560, '::1', 1557682739, 'Sun, 12 May 19 19:38:59 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/about/update', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (561, '::1', 1557682758, 'Sun, 12 May 19 19:39:18 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/about/update', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (562, '::1', 1557682758, 'Sun, 12 May 19 19:39:18 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/about/create', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (563, '::1', 1557682782, 'Sun, 12 May 19 19:39:42 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/about/create', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (564, '::1', 1557683009, 'Sun, 12 May 19 19:43:29 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/about/create', '[]', '{\"_csrf-backend\":\"bOkYNEC4QP8duAKs7XLLoEFpgCfGKIPPwZcttzLRzc8Go0BDNcoTm1fLT9-8RILwAyTSHplD-6yWukvBSqCEig==\",\"About\":{\"tell\":\"dfgdfg\",\"tell2\":\"dgdg\",\"address\":\"\",\"lat\":\"35.74593135576459\",\"lng\":\"51.37545183563236\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (565, '::1', 1557683010, 'Sun, 12 May 19 19:43:30 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/about/update', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (566, '::1', 1557684924, 'Sun, 12 May 19 20:15:24 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (567, '::1', 1557684927, 'Sun, 12 May 19 20:15:27 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=5ca34ccf06d55.jpg', '{\"id\":\"5ca34ccf06d55.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (568, '::1', 1557684927, 'Sun, 12 May 19 20:15:27 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=7', '{\"id\":\"7\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (569, '::1', 1557684935, 'Sun, 12 May 19 20:15:35 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/site/location', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (570, '::1', 1557684953, 'Sun, 12 May 19 20:15:53 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/site/location', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (571, '::1', 1557685230, 'Sun, 12 May 19 20:20:30 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/site/location', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (572, '::1', 1557685265, 'Sun, 12 May 19 20:21:05 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/site/location', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (573, '::1', 1557685274, 'Sun, 12 May 19 20:21:14 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/site/location', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (574, '::1', 1557685306, 'Sun, 12 May 19 20:21:46 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/site/location', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (575, '::1', 1557685317, 'Sun, 12 May 19 20:21:57 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/site/location', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (576, '::1', 1557685344, 'Sun, 12 May 19 20:22:24 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/site/location', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (577, '::1', 1557685390, 'Sun, 12 May 19 20:23:10 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/site/location', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (578, '::1', 1557685615, 'Sun, 12 May 19 20:26:55 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/site/location', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (579, '::1', 1557685626, 'Sun, 12 May 19 20:27:06 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/site/location', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (580, '::1', 1557685681, 'Sun, 12 May 19 20:28:01 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/site/location', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (581, '::1', 1557685740, 'Sun, 12 May 19 20:29:00 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/site/location', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (582, '::1', 1557830877, 'Tue, 14 May 19 12:47:57 +0200', '/cmsSefroweb/crmSefroweb/backend/web/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (583, '::1', 1557830877, 'Tue, 14 May 19 12:47:57 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/login', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (584, '::1', 1557830884, 'Tue, 14 May 19 12:48:04 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/login', '[]', '{\"_csrf-backend\":\"8uPj2-DIFpVppsUjpaYGiPbgAgDMr0s9a-co_3jkeTa9lbOil6d04QfKkHeS3z79hK9hTJjBAlcagnmbSLIfUg==\",\"login-form\":{\"login\":\"admin\",\"password\":\"123456\",\"rememberMe\":\"0\"},\"ajax\":\"login-form\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (585, '::1', 1557830884, 'Tue, 14 May 19 12:48:04 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/login', '[]', '{\"_csrf-backend\":\"8uPj2-DIFpVppsUjpaYGiPbgAgDMr0s9a-co_3jkeTa9lbOil6d04QfKkHeS3z79hK9hTJjBAlcagnmbSLIfUg==\",\"login-form\":{\"login\":\"admin\",\"password\":\"123456\",\"rememberMe\":\"0\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (586, '::1', 1557830884, 'Tue, 14 May 19 12:48:04 +0200', '/cmsSefroweb/crmSefroweb/backend/web/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (587, '::1', 1557830888, 'Tue, 14 May 19 12:48:08 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/about/update', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (588, '::1', 1557830912, 'Tue, 14 May 19 12:48:32 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (589, '::1', 1557830913, 'Tue, 14 May 19 12:48:33 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=5ca34ccf06d55.jpg', '{\"id\":\"5ca34ccf06d55.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (590, '::1', 1557830913, 'Tue, 14 May 19 12:48:33 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=7', '{\"id\":\"7\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (591, '::1', 1557830915, 'Tue, 14 May 19 12:48:35 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/acticle/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (592, '::1', 1557830917, 'Tue, 14 May 19 12:48:37 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (593, '::1', 1557830917, 'Tue, 14 May 19 12:48:37 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=5ca34ccf06d55.jpg', '{\"id\":\"5ca34ccf06d55.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (594, '::1', 1557830917, 'Tue, 14 May 19 12:48:37 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=7', '{\"id\":\"7\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (595, '::1', 1557831858, 'Tue, 14 May 19 13:04:18 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (596, '::1', 1557831860, 'Tue, 14 May 19 13:04:20 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu/creator/create', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (597, '::1', 1557831866, 'Tue, 14 May 19 13:04:26 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu/creator/create', '[]', '{\"_csrf-backend\":\"9DeyORW_Bu1cNBBr-eu3eU9sDOUe3_S02bv-g_wRlwutYN1xJY9emwpxZw3Uru00KC47kGepspmI0qbXs2v8cg==\",\"Model\":{\"menu_name\":\"home\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (598, '::1', 1557831866, 'Tue, 14 May 19 13:04:26 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu/creator/update?id=1', '{\"id\":\"1\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (599, '::1', 1557831867, 'Tue, 14 May 19 13:04:27 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu/creator/update?id=1', '{\"id\":\"1\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (600, '::1', 1557831893, 'Tue, 14 May 19 13:04:53 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu/creator/update?id=1', '{\"id\":\"1\"}', '{\"update\":\"true\",\"menu\":\"{\\n    \\\"left\\\": [\\n        {\\n            \\\"label\\\": \\\"home\\\",\\n            \\\"type\\\": \\\"link\\\"\\n        }\\n    ],\\n    \\\"right\\\": []\\n}\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (601, '::1', 1557831901, 'Tue, 14 May 19 13:05:01 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu/creator/update?id=1', '{\"id\":\"1\"}', '{\"update\":\"true\",\"menu\":\"{\\n    \\\"left\\\": [\\n        {\\n            \\\"label\\\": \\\"home\\\",\\n            \\\"type\\\": \\\"link\\\"\\n        }\\n    ],\\n    \\\"right\\\": []\\n}\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (602, '::1', 1557831907, 'Tue, 14 May 19 13:05:07 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (603, '::1', 1557831911, 'Tue, 14 May 19 13:05:11 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/admin/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (604, '::1', 1557831913, 'Tue, 14 May 19 13:05:13 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (605, '::1', 1557831914, 'Tue, 14 May 19 13:05:14 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/comment/manage/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (606, '::1', 1557831915, 'Tue, 14 May 19 13:05:15 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/logvisitor', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (607, '::1', 1557831916, 'Tue, 14 May 19 13:05:16 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/acticle/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (608, '::1', 1557831920, 'Tue, 14 May 19 13:05:20 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (609, '::1', 1557831920, 'Tue, 14 May 19 13:05:20 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=5ca34ccf06d55.jpg', '{\"id\":\"5ca34ccf06d55.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (610, '::1', 1557831920, 'Tue, 14 May 19 13:05:20 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=7', '{\"id\":\"7\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (611, '::1', 1557831921, 'Tue, 14 May 19 13:05:21 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/about/update', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (612, '::1', 1557832228, 'Tue, 14 May 19 13:10:28 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/category', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (613, '::1', 1557832277, 'Tue, 14 May 19 13:11:17 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (614, '::1', 1557832297, 'Tue, 14 May 19 13:11:37 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/logvisitor', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (615, '::1', 1557832407, 'Tue, 14 May 19 13:13:27 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/category', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (616, '::1', 1557832444, 'Tue, 14 May 19 13:14:04 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/category', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (617, '::1', 1557832583, 'Tue, 14 May 19 13:16:23 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/category', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (618, '::1', 1557832603, 'Tue, 14 May 19 13:16:43 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/category', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (619, '::1', 1557832685, 'Tue, 14 May 19 13:18:05 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/category', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (620, '::1', 1557832732, 'Tue, 14 May 19 13:18:52 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/category', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (621, '::1', 1557832758, 'Tue, 14 May 19 13:19:18 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/category', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (622, '::1', 1557832855, 'Tue, 14 May 19 13:20:55 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/category', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (623, '::1', 1557832877, 'Tue, 14 May 19 13:21:17 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/category', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (624, '::1', 1557832914, 'Tue, 14 May 19 13:21:54 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/category', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (625, '::1', 1557832918, 'Tue, 14 May 19 13:21:58 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/category/create?_=1557832914445', '{\"_\":\"1557832914445\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (626, '::1', 1557832942, 'Tue, 14 May 19 13:22:22 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/category/1?_=1557832914446', '{\"_\":\"1557832914446\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (627, '::1', 1557832950, 'Tue, 14 May 19 13:22:30 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/category/update/1?_=1557832914447', '{\"_\":\"1557832914447\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (628, '::1', 1557833021, 'Tue, 14 May 19 13:23:41 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/category/create?_=1557832914448', '{\"_\":\"1557832914448\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (629, '::1', 1557833032, 'Tue, 14 May 19 13:23:52 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/category/create?_=1557832914449', '{\"_\":\"1557832914449\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (630, '::1', 1557833060, 'Tue, 14 May 19 13:24:20 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/category/index?_pjax=%23crud-datatable-pjax', '{\"_pjax\":\"#crud-datatable-pjax\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (631, '::1', 1557833061, 'Tue, 14 May 19 13:24:21 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/category/create?_=1557832914450', '{\"_\":\"1557832914450\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (632, '::1', 1557834968, 'Tue, 14 May 19 13:56:08 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orders', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (633, '::1', 1557835170, 'Tue, 14 May 19 13:59:30 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orders', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (634, '::1', 1557835200, 'Tue, 14 May 19 14:00:00 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orders', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (635, '::1', 1557835238, 'Tue, 14 May 19 14:00:38 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orders', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (636, '::1', 1557835272, 'Tue, 14 May 19 14:01:12 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orders', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (637, '::1', 1557835316, 'Tue, 14 May 19 14:01:56 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orders', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (638, '::1', 1557835406, 'Tue, 14 May 19 14:03:26 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orders', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (639, '::1', 1557835496, 'Tue, 14 May 19 14:04:56 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orders', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (640, '::1', 1557835797, 'Tue, 14 May 19 14:09:57 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orders', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (641, '::1', 1557835908, 'Tue, 14 May 19 14:11:48 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orders', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (642, '::1', 1557835942, 'Tue, 14 May 19 14:12:22 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orders', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (643, '::1', 1557835978, 'Tue, 14 May 19 14:12:58 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orders', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (644, '::1', 1557835997, 'Tue, 14 May 19 14:13:17 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orders', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (645, '::1', 1557836039, 'Tue, 14 May 19 14:13:59 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orders', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (646, '::1', 1557836050, 'Tue, 14 May 19 14:14:10 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orderdetail?id=1088&_pjax=%23crud-datatable-pjax', '{\"id\":\"1088\",\"_pjax\":\"#crud-datatable-pjax\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (647, '::1', 1557836050, 'Tue, 14 May 19 14:14:10 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orderdetail?id=1088', '{\"id\":\"1088\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (648, '::1', 1557836117, 'Tue, 14 May 19 14:15:17 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orderdetail?id=1088', '{\"id\":\"1088\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (649, '::1', 1557836128, 'Tue, 14 May 19 14:15:28 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orderdetail?id=1088', '{\"id\":\"1088\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (650, '::1', 1557836164, 'Tue, 14 May 19 14:16:04 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orderdetail?id=1088', '{\"id\":\"1088\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (651, '::1', 1557836209, 'Tue, 14 May 19 14:16:49 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orderdetail?id=1088', '{\"id\":\"1088\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (652, '::1', 1557836259, 'Tue, 14 May 19 14:17:39 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orderdetail?id=1088', '{\"id\":\"1088\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (653, '::1', 1557836277, 'Tue, 14 May 19 14:17:57 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orderdetail?id=1088', '{\"id\":\"1088\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (654, '::1', 1557836283, 'Tue, 14 May 19 14:18:03 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orderdetail?id=1088', '{\"id\":\"1088\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (655, '::1', 1557836297, 'Tue, 14 May 19 14:18:17 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orderdetail?id=1088', '{\"id\":\"1088\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (656, '::1', 1557836304, 'Tue, 14 May 19 14:18:24 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orderdetail?id=1088', '{\"id\":\"1088\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (657, '::1', 1557836337, 'Tue, 14 May 19 14:18:57 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orderdetail?id=1088', '{\"id\":\"1088\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (658, '::1', 1557836383, 'Tue, 14 May 19 14:19:43 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orderdetail?id=1088', '{\"id\":\"1088\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (659, '::1', 1557836385, 'Tue, 14 May 19 14:19:45 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orderdetail/create?_=1557836383633', '{\"_\":\"1557836383633\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (660, '::1', 1557836397, 'Tue, 14 May 19 14:19:57 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orders', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (661, '::1', 1557836401, 'Tue, 14 May 19 14:20:01 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orderdetail?id=1088&_pjax=%23crud-datatable-pjax', '{\"id\":\"1088\",\"_pjax\":\"#crud-datatable-pjax\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (662, '::1', 1557836406, 'Tue, 14 May 19 14:20:06 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orderdetail?id=1082&_pjax=%23crud-datatable-pjax', '{\"id\":\"1082\",\"_pjax\":\"#crud-datatable-pjax\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (663, '::1', 1557836410, 'Tue, 14 May 19 14:20:10 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orderdetail?id=1082&_pjax=%23crud-datatable-pjax', '{\"id\":\"1082\",\"_pjax\":\"#crud-datatable-pjax\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (664, '::1', 1557836441, 'Tue, 14 May 19 14:20:41 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orderdetail?id=1097&_pjax=%23crud-datatable-pjax', '{\"id\":\"1097\",\"_pjax\":\"#crud-datatable-pjax\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (665, '::1', 1557836445, 'Tue, 14 May 19 14:20:45 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orders', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (666, '::1', 1557836491, 'Tue, 14 May 19 14:21:31 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orders', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (667, '::1', 1557836494, 'Tue, 14 May 19 14:21:34 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orders/create?_=1557836491652', '{\"_\":\"1557836491652\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (668, '::1', 1557836527, 'Tue, 14 May 19 14:22:07 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orders/create?_=1557836491653', '{\"_\":\"1557836491653\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (669, '::1', 1557836530, 'Tue, 14 May 19 14:22:10 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orders/create?_=1557836491654', '{\"_\":\"1557836491654\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (670, '::1', 1557836544, 'Tue, 14 May 19 14:22:24 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orders/create?_=1557836491655', '{\"_\":\"1557836491655\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (671, '::1', 1557836555, 'Tue, 14 May 19 14:22:35 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orders/create?_=1557836491656', '{\"_\":\"1557836491656\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (672, '::1', 1557836577, 'Tue, 14 May 19 14:22:57 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orders', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (673, '::1', 1557836579, 'Tue, 14 May 19 14:22:59 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orders/create?_=1557836578189', '{\"_\":\"1557836578189\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (674, '::1', 1557836602, 'Tue, 14 May 19 14:23:22 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orders/create?_=1557836578190', '{\"_\":\"1557836578190\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (675, '::1', 1557836604, 'Tue, 14 May 19 14:23:24 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orders/create?_=1557836578191', '{\"_\":\"1557836578191\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (676, '::1', 1557836622, 'Tue, 14 May 19 14:23:42 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orders/create?_=1557836578192', '{\"_\":\"1557836578192\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (677, '::1', 1557837547, 'Tue, 14 May 19 14:39:07 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orders', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (678, '::1', 1557837576, 'Tue, 14 May 19 14:39:36 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orders/create?_=1557837547939', '{\"_\":\"1557837547939\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (679, '::1', 1557872366, 'Wed, 15 May 19 00:19:26 +0200', '/cmsSefroweb/crmSefroweb/backend/web/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (680, '::1', 1557872368, 'Wed, 15 May 19 00:19:28 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/login', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (681, '::1', 1557872387, 'Wed, 15 May 19 00:19:47 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/login', '[]', '{\"_csrf-backend\":\"AtuAlFRcyTFZBqbDXDbCWhitdMjr0DcNYVbR4qvwxdpdr9DbZTH_cGBB5_AvVYsdTuA5oqSVADgqboeT7JXzkw==\",\"login-form\":{\"login\":\"admin\",\"password\":\"123456\",\"rememberMe\":\"0\"},\"ajax\":\"login-form\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (682, '::1', 1557872388, 'Wed, 15 May 19 00:19:48 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/login', '[]', '{\"_csrf-backend\":\"AtuAlFRcyTFZBqbDXDbCWhitdMjr0DcNYVbR4qvwxdpdr9DbZTH_cGBB5_AvVYsdTuA5oqSVADgqboeT7JXzkw==\",\"login-form\":{\"login\":\"admin\",\"password\":\"123456\",\"rememberMe\":\"0\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (683, '::1', 1557872390, 'Wed, 15 May 19 00:19:50 +0200', '/cmsSefroweb/crmSefroweb/backend/web/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (684, '::1', 1557872393, 'Wed, 15 May 19 00:19:53 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/about/update', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (685, '::1', 1558339719, 'Mon, 20 May 19 10:08:39 +0200', '/cmsSefroweb/crmSefroweb/backend/web/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (686, '::1', 1558339720, 'Mon, 20 May 19 10:08:40 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/login', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (687, '::1', 1558339721, 'Mon, 20 May 19 10:08:41 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/web/assets/css/nucleo-icons.css', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (688, '::1', 1558339721, 'Mon, 20 May 19 10:08:41 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/web/assets/css/black-dashboard.css?v=1.0.0', '{\"v\":\"1.0.0\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (689, '::1', 1558339721, 'Mon, 20 May 19 10:08:41 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/web/assets/js/core/jquery.min.js', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (690, '::1', 1558339721, 'Mon, 20 May 19 10:08:41 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/web/assets/demo/demo.css', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (691, '::1', 1558339721, 'Mon, 20 May 19 10:08:41 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/web/assets/js/core/popper.min.js', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (692, '::1', 1558339721, 'Mon, 20 May 19 10:08:41 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/web/assets/css/mrh.css', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (693, '::1', 1558339721, 'Mon, 20 May 19 10:08:41 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/web/assets/js/core/bootstrap.min.js', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (694, '::1', 1558339721, 'Mon, 20 May 19 10:08:41 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/web/assets/js/plugins/perfect-scrollbar.jquery.min.js', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (695, '::1', 1558339721, 'Mon, 20 May 19 10:08:41 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/web/assets/js/plugins/chartjs.min.js', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (696, '::1', 1558339721, 'Mon, 20 May 19 10:08:41 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/web/assets/js/plugins/bootstrap-notify.js', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (697, '::1', 1558339722, 'Mon, 20 May 19 10:08:42 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/web/assets/js/black-dashboard.min.js?v=1.0.0', '{\"v\":\"1.0.0\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (698, '::1', 1558339722, 'Mon, 20 May 19 10:08:42 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/web/assets/demo/demo.js', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (699, '::1', 1558339722, 'Mon, 20 May 19 10:08:42 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/assets/img/anime3.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (700, '::1', 1558339734, 'Mon, 20 May 19 10:08:54 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/login', '[]', '{\"_csrf-backend\":\"ZBueXQCkWpcRxzYBX1M2GJk-7L-qqcz9TojE27yYajQhKPskVeoKxymlZ2tyKlFT_Gmi1J3ClJ4_urWO6_AwcQ==\",\"login-form\":{\"login\":\"admin\",\"password\":\"123456\",\"rememberMe\":\"0\"},\"ajax\":\"login-form\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (701, '::1', 1558339735, 'Mon, 20 May 19 10:08:55 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/login', '[]', '{\"_csrf-backend\":\"ZBueXQCkWpcRxzYBX1M2GJk-7L-qqcz9TojE27yYajQhKPskVeoKxymlZ2tyKlFT_Gmi1J3ClJ4_urWO6_AwcQ==\",\"login-form\":{\"login\":\"admin\",\"password\":\"123456\",\"rememberMe\":\"0\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (702, '::1', 1558339735, 'Mon, 20 May 19 10:08:55 +0200', '/cmsSefroweb/crmSefroweb/backend/web/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (703, '::1', 1558339740, 'Mon, 20 May 19 10:09:00 +0200', '/cmsSefroweb/crmSefroweb/backend/web/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (704, '::1', 1558339763, 'Mon, 20 May 19 10:09:23 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (705, '::1', 1558339771, 'Mon, 20 May 19 10:09:31 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/about', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (706, '::1', 1558339790, 'Mon, 20 May 19 10:09:50 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/about', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (707, '::1', 1558339808, 'Mon, 20 May 19 10:10:08 +0200', '/cmsSefroweb/crmSefroweb/backend/web/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (708, '::1', 1558340063, 'Mon, 20 May 19 10:14:23 +0200', '/cmsSefroweb/crmSefroweb/backend/web/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (709, '::1', 1558340117, 'Mon, 20 May 19 10:15:17 +0200', '/cmsSefroweb/crmSefroweb/backend/web/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (710, '::1', 1558340173, 'Mon, 20 May 19 10:16:13 +0200', '/cmsSefroweb/crmSefroweb/backend/web/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (711, '::1', 1558340233, 'Mon, 20 May 19 10:17:13 +0200', '/cmsSefroweb/crmSefroweb/backend/web/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (712, '::1', 1558340811, 'Mon, 20 May 19 10:26:51 +0200', '/cmsSefroweb/crmSefroweb/backend/web/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (713, '::1', 1558340814, 'Mon, 20 May 19 10:26:54 +0200', '/cmsSefroweb/crmSefroweb/backend/web/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (714, '::1', 1558340830, 'Mon, 20 May 19 10:27:10 +0200', '/cmsSefroweb/crmSefroweb/backend/web/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (715, '::1', 1558340955, 'Mon, 20 May 19 10:29:15 +0200', '/cmsSefroweb/crmSefroweb/backend/web/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (716, '::1', 1558340997, 'Mon, 20 May 19 10:29:57 +0200', '/cmsSefroweb/crmSefroweb/backend/web/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (717, '::1', 1558341004, 'Mon, 20 May 19 10:30:04 +0200', '/cmsSefroweb/crmSefroweb/backend/web/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (718, '::1', 1558341059, 'Mon, 20 May 19 10:30:59 +0200', '/cmsSefroweb/crmSefroweb/backend/web/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (719, '::1', 1558341102, 'Mon, 20 May 19 10:31:42 +0200', '/cmsSefroweb/crmSefroweb/backend/web/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (720, '::1', 1558341126, 'Mon, 20 May 19 10:32:06 +0200', '/cmsSefroweb/crmSefroweb/backend/web/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (721, '::1', 1558341132, 'Mon, 20 May 19 10:32:12 +0200', '/cmsSefroweb/crmSefroweb/backend/web/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (722, '::1', 1558341222, 'Mon, 20 May 19 10:33:42 +0200', '/cmsSefroweb/crmSefroweb/backend/web/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (723, '::1', 1558341241, 'Mon, 20 May 19 10:34:01 +0200', '/cmsSefroweb/crmSefroweb/backend/web/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (724, '::1', 1558341294, 'Mon, 20 May 19 10:34:54 +0200', '/cmsSefroweb/crmSefroweb/backend/web/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (725, '::1', 1558341318, 'Mon, 20 May 19 10:35:18 +0200', '/cmsSefroweb/crmSefroweb/backend/web/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (726, '::1', 1558342527, 'Mon, 20 May 19 10:55:27 +0200', '/cmsSefroweb/crmSefroweb/backend/web/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (727, '::1', 1558344409, 'Mon, 20 May 19 11:26:49 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (728, '::1', 1558344410, 'Mon, 20 May 19 11:26:50 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/assetsCustom/img/anime3.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (729, '::1', 1558344413, 'Mon, 20 May 19 11:26:53 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1558344411165', '{\"_\":\"1558344411165\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (730, '::1', 1558344422, 'Mon, 20 May 19 11:27:02 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (731, '::1', 1558344422, 'Mon, 20 May 19 11:27:02 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/assetsCustom/img/anime3.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (732, '::1', 1558344424, 'Mon, 20 May 19 11:27:04 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1558344422555', '{\"_\":\"1558344422555\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (733, '::1', 1558344431, 'Mon, 20 May 19 11:27:11 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (734, '::1', 1558344432, 'Mon, 20 May 19 11:27:12 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/assetsCustom/img/anime3.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (735, '::1', 1558344449, 'Mon, 20 May 19 11:27:29 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (736, '::1', 1558344460, 'Mon, 20 May 19 11:27:40 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (737, '::1', 1558344460, 'Mon, 20 May 19 11:27:40 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/assetsCustom/img/anime3.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (738, '::1', 1558344866, 'Mon, 20 May 19 11:34:26 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (739, '::1', 1558344866, 'Mon, 20 May 19 11:34:26 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/assetsCustom/img/anime3.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (740, '::1', 1558344873, 'Mon, 20 May 19 11:34:33 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1558344870471', '{\"_\":\"1558344870471\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (741, '::1', 1558344881, 'Mon, 20 May 19 11:34:41 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (742, '::1', 1558344881, 'Mon, 20 May 19 11:34:41 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/assetsCustom/img/anime3.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (743, '::1', 1558344884, 'Mon, 20 May 19 11:34:44 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1558344882842', '{\"_\":\"1558344882842\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (744, '::1', 1558344890, 'Mon, 20 May 19 11:34:50 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (745, '::1', 1558344891, 'Mon, 20 May 19 11:34:51 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/assetsCustom/img/anime3.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (746, '::1', 1558344893, 'Mon, 20 May 19 11:34:53 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1558344891681', '{\"_\":\"1558344891681\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (747, '::1', 1558344896, 'Mon, 20 May 19 11:34:56 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (748, '::1', 1558344897, 'Mon, 20 May 19 11:34:57 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/assetsCustom/img/anime3.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (749, '::1', 1558344898, 'Mon, 20 May 19 11:34:58 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1558344897297', '{\"_\":\"1558344897297\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (750, '::1', 1558344905, 'Mon, 20 May 19 11:35:05 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (751, '::1', 1558344905, 'Mon, 20 May 19 11:35:05 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/assetsCustom/img/anime3.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (752, '::1', 1558344907, 'Mon, 20 May 19 11:35:07 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1558344906091', '{\"_\":\"1558344906091\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (753, '::1', 1558344915, 'Mon, 20 May 19 11:35:15 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (754, '::1', 1558344916, 'Mon, 20 May 19 11:35:16 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/assetsCustom/img/anime3.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (755, '::1', 1558344918, 'Mon, 20 May 19 11:35:18 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1558344916643', '{\"_\":\"1558344916643\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (756, '::1', 1558344929, 'Mon, 20 May 19 11:35:29 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (757, '::1', 1558344930, 'Mon, 20 May 19 11:35:30 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/assetsCustom/img/anime3.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (758, '::1', 1558344932, 'Mon, 20 May 19 11:35:32 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1558344930801', '{\"_\":\"1558344930801\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (759, '::1', 1558345129, 'Mon, 20 May 19 11:38:49 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (760, '::1', 1558345131, 'Mon, 20 May 19 11:38:51 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/assetsCustom/img/anime3.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (761, '::1', 1558345133, 'Mon, 20 May 19 11:38:53 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1558345131684', '{\"_\":\"1558345131684\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (762, '::1', 1558345144, 'Mon, 20 May 19 11:39:04 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (763, '::1', 1558345145, 'Mon, 20 May 19 11:39:05 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/assetsCustom/img/anime3.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (764, '::1', 1558345151, 'Mon, 20 May 19 11:39:11 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1558345145792', '{\"_\":\"1558345145792\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (765, '::1', 1558345171, 'Mon, 20 May 19 11:39:31 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (766, '::1', 1558345172, 'Mon, 20 May 19 11:39:32 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/assetsCustom/img/anime3.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (767, '::1', 1558345175, 'Mon, 20 May 19 11:39:35 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1558345172901', '{\"_\":\"1558345172901\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (768, '::1', 1558345181, 'Mon, 20 May 19 11:39:41 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (769, '::1', 1558345182, 'Mon, 20 May 19 11:39:42 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/assetsCustom/img/anime3.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (770, '::1', 1558346001, 'Mon, 20 May 19 11:53:21 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (771, '::1', 1558346002, 'Mon, 20 May 19 11:53:22 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/assetsCustom/img/anime3.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (772, '::1', 1558346724, 'Mon, 20 May 19 12:05:24 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (773, '::1', 1558346725, 'Mon, 20 May 19 12:05:25 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/assetsCustom/img/anime3.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (774, '::1', 1558346795, 'Mon, 20 May 19 12:06:35 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (775, '::1', 1558346796, 'Mon, 20 May 19 12:06:36 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/assetsCustom/img/anime3.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (776, '::1', 1558346807, 'Mon, 20 May 19 12:06:47 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1558346796204', '{\"_\":\"1558346796204\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (777, '::1', 1558346810, 'Mon, 20 May 19 12:06:50 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1558346796205', '{\"_\":\"1558346796205\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (778, '::1', 1558346830, 'Mon, 20 May 19 12:07:10 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (779, '::1', 1558346830, 'Mon, 20 May 19 12:07:10 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/assetsCustom/img/anime3.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (780, '::1', 1558346833, 'Mon, 20 May 19 12:07:13 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1558346831685', '{\"_\":\"1558346831685\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (781, '::1', 1558346838, 'Mon, 20 May 19 12:07:18 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (782, '::1', 1558346842, 'Mon, 20 May 19 12:07:22 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/assetsCustom/img/anime3.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (783, '::1', 1558346844, 'Mon, 20 May 19 12:07:24 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1558346842722', '{\"_\":\"1558346842722\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (784, '::1', 1558346853, 'Mon, 20 May 19 12:07:33 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (785, '::1', 1558346854, 'Mon, 20 May 19 12:07:34 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/assetsCustom/img/anime3.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (786, '::1', 1558346856, 'Mon, 20 May 19 12:07:36 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1558346855188', '{\"_\":\"1558346855188\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (787, '::1', 1558346862, 'Mon, 20 May 19 12:07:42 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (788, '::1', 1558346868, 'Mon, 20 May 19 12:07:48 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/assetsCustom/img/anime3.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (789, '::1', 1558346873, 'Mon, 20 May 19 12:07:53 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1558346868719', '{\"_\":\"1558346868719\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (790, '::1', 1558346885, 'Mon, 20 May 19 12:08:05 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (791, '::1', 1558346889, 'Mon, 20 May 19 12:08:09 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/assetsCustom/img/anime3.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (792, '::1', 1558346891, 'Mon, 20 May 19 12:08:11 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1558346889798', '{\"_\":\"1558346889798\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (793, '::1', 1558346898, 'Mon, 20 May 19 12:08:18 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (794, '::1', 1558346903, 'Mon, 20 May 19 12:08:23 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/assetsCustom/img/anime3.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (795, '::1', 1558346906, 'Mon, 20 May 19 12:08:26 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1558346903203', '{\"_\":\"1558346903203\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (796, '::1', 1558347334, 'Mon, 20 May 19 12:15:34 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1558346903204', '{\"_\":\"1558346903204\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (797, '::1', 1558350993, 'Mon, 20 May 19 13:16:33 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (798, '::1', 1558350994, 'Mon, 20 May 19 13:16:34 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/assetsCustom/img/anime3.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (799, '::1', 1558350997, 'Mon, 20 May 19 13:16:37 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1558350994892', '{\"_\":\"1558350994892\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (800, '::1', 1558351012, 'Mon, 20 May 19 13:16:52 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (801, '::1', 1558351013, 'Mon, 20 May 19 13:16:53 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/assetsCustom/img/anime3.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (802, '::1', 1558351016, 'Mon, 20 May 19 13:16:56 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1558351013648', '{\"_\":\"1558351013648\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (803, '::1', 1558351189, 'Mon, 20 May 19 13:19:49 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (804, '::1', 1558351191, 'Mon, 20 May 19 13:19:51 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/assetsCustom/img/anime3.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (805, '::1', 1558351224, 'Mon, 20 May 19 13:20:24 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1558351191113', '{\"_\":\"1558351191113\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (806, '::1', 1558351267, 'Mon, 20 May 19 13:21:07 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1558351191114', '{\"_\":\"1558351191114\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (807, '::1', 1558351391, 'Mon, 20 May 19 13:23:11 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/about', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (808, '::1', 1558351393, 'Mon, 20 May 19 13:23:13 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/about/create', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (809, '::1', 1558351393, 'Mon, 20 May 19 13:23:13 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/about/update', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (810, '::1', 1558351394, 'Mon, 20 May 19 13:23:14 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/assetsCustom/img/anime3.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (811, '::1', 1558644814, 'Thu, 23 May 19 22:53:34 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (812, '::1', 1558644816, 'Thu, 23 May 19 22:53:36 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/assetsCustom/img/anime3.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (813, '::1', 1558644819, 'Thu, 23 May 19 22:53:39 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1558644817490', '{\"_\":\"1558644817490\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (814, '::1', 1558644856, 'Thu, 23 May 19 22:54:16 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (815, '::1', 1558644857, 'Thu, 23 May 19 22:54:17 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/assetsCustom/img/anime3.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (816, '::1', 1558644912, 'Thu, 23 May 19 22:55:12 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1558644857658', '{\"_\":\"1558644857658\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (817, '::1', 1558644915, 'Thu, 23 May 19 22:55:15 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (818, '::1', 1558644916, 'Thu, 23 May 19 22:55:16 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/assetsCustom/img/anime3.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (819, '::1', 1558644948, 'Thu, 23 May 19 22:55:48 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (820, '::1', 1558644951, 'Thu, 23 May 19 22:55:51 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/assetsCustom/img/anime3.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (821, '::1', 1558644954, 'Thu, 23 May 19 22:55:54 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1558644951565', '{\"_\":\"1558644951565\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (822, '::1', 1558645042, 'Thu, 23 May 19 22:57:22 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/gii', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (823, '::1', 1558645044, 'Thu, 23 May 19 22:57:24 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/gii/model', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (824, '::1', 1558645045, 'Thu, 23 May 19 22:57:25 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/gii/ajaxcrud', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (825, '::1', 1558645055, 'Thu, 23 May 19 22:57:35 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/gii/model', '[]', '{\"_csrf-backend\":\"iQE_acHe1Ck85IpIiHjAwrWa_zVxB-gEFIyhNrSFf7__RVMhlOuEWQmz5SH6T4Ov_K6rZjJJnUJE4O8b-9c0zA==\",\"Generator\":{\"tableName\":\"slider\",\"modelClass\":\"Slider\",\"standardizeCapitals\":\"0\",\"singularize\":\"0\",\"ns\":\"common\\\\models\",\"baseClass\":\"yii\\\\db\\\\ActiveRecord\",\"db\":\"db\",\"useTablePrefix\":\"0\",\"generateRelations\":\"all\",\"generateRelationsFromCurrentSchema\":\"1\",\"generateLabelsFromComments\":\"0\",\"generateQuery\":\"1\",\"queryNs\":\"common\\\\models\",\"queryClass\":\"SliderQuery\",\"queryBaseClass\":\"yii\\\\db\\\\ActiveQuery\",\"enableI18N\":\"0\",\"messageCategory\":\"app\",\"useSchemaName\":\"1\",\"template\":\"default\"},\"preview\":\"\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (826, '::1', 1558645063, 'Thu, 23 May 19 22:57:43 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/gii/model', '[]', '{\"_csrf-backend\":\"42qH0kiurFa0Pi1n36EjYITgB6bP-cSN-yldt4GNw5GVLuuaHZv8JoFpQg6tlmANzdRT9Yy3scurRROazt-I4g==\",\"Generator\":{\"tableName\":\"slider\",\"modelClass\":\"Slider\",\"standardizeCapitals\":\"0\",\"singularize\":\"0\",\"ns\":\"common\\\\models\",\"baseClass\":\"yii\\\\db\\\\ActiveRecord\",\"db\":\"db\",\"useTablePrefix\":\"0\",\"generateRelations\":\"all\",\"generateRelationsFromCurrentSchema\":\"1\",\"generateLabelsFromComments\":\"0\",\"generateQuery\":\"1\",\"queryNs\":\"common\\\\models\",\"queryClass\":\"SliderQuery\",\"queryBaseClass\":\"yii\\\\db\\\\ActiveQuery\",\"enableI18N\":\"0\",\"messageCategory\":\"app\",\"useSchemaName\":\"1\",\"template\":\"default\"},\"answers\":{\"fc7b2a708f3835d8acb34084c27d7c2b\":\"1\",\"9869171ddd34559798acd092a6a6394a\":\"1\"},\"generate\":\"\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (827, '::1', 1558645090, 'Thu, 23 May 19 22:58:10 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/gii/ajaxcrud', '[]', '{\"_csrf-backend\":\"wo3D7nz_8CbX84-tncZdzht9I7r06CmPSFE5WbjroFG0ya-mKcqgVuKk4MTv8R6jUkl36bemXMkYPXd097nrIg==\",\"Generator\":{\"modelClass\":\"common\\\\models\\\\Slider\",\"searchModelClass\":\"common\\\\models\\\\SliderSearch\",\"controllerClass\":\"backend\\\\controllers\\\\SliderController\",\"viewPath\":\"@backend\\/views\\/slider\",\"baseControllerClass\":\"yii\\\\web\\\\Controller\",\"enableI18N\":\"0\",\"messageCategory\":\"app\",\"template\":\"default\"},\"preview\":\"\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (828, '::1', 1558645111, 'Thu, 23 May 19 22:58:31 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/gii/ajaxcrud', '[]', '{\"_csrf-backend\":\"o3AWv6Ad4Q24Ge8JX9s4xOT64GQRBtKL68ln4CaCXO3VNHr39SixfY1OgGAt7Huprc60N1JIp827pSnNadAXng==\",\"Generator\":{\"modelClass\":\"common\\\\models\\\\Slider\",\"searchModelClass\":\"common\\\\models\\\\SliderSearch\",\"controllerClass\":\"backend\\\\controllers\\\\SliderController\",\"viewPath\":\"@backend\\/views\\/slider\",\"baseControllerClass\":\"yii\\\\web\\\\Controller\",\"enableI18N\":\"0\",\"messageCategory\":\"app\",\"template\":\"default\"},\"answers\":{\"9616aaca26800b01842a282258b3d74b\":\"1\",\"084dbb31ceba44565508ee7a3501dcb6\":\"1\",\"5d3f0b050686199333d1fe56eae8a69c\":\"1\",\"2ce05dbb42789f2b5087122f0be4139e\":\"1\",\"049e9893c53f58234f818faa32134344\":\"1\",\"77a2b8478c31ad7772cb6e55f8387d1e\":\"1\",\"b4523aa8e492588026787ca58b4956c3\":\"1\",\"d13178bf1c2f35bf611d9149a15c93bb\":\"1\"},\"generate\":\"\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (829, '::1', 1558645134, 'Thu, 23 May 19 22:58:54 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/slider', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (830, '::1', 1558645137, 'Thu, 23 May 19 22:58:57 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/slider/create?_=1558645134990', '{\"_\":\"1558645134990\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (831, '::1', 1558645143, 'Thu, 23 May 19 22:59:03 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/slider', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (832, '::1', 1558645148, 'Thu, 23 May 19 22:59:08 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/slider/create?_=1558645145568', '{\"_\":\"1558645145568\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (833, '::1', 1558645186, 'Thu, 23 May 19 22:59:46 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/slider/create?_=1558645145569', '{\"_\":\"1558645145569\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (834, '::1', 1558645192, 'Thu, 23 May 19 22:59:52 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/slider/create?_=1558645145570', '{\"_\":\"1558645145570\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (835, '::1', 1558684503, 'Fri, 24 May 19 09:55:03 +0200', '/cmsSefroweb/crmSefroweb/backend/web/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'http', 'HTTP/1.1', '80', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (836, '::1', 1558684503, 'Fri, 24 May 19 09:55:03 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/login', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'http', 'HTTP/1.1', '80', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (837, '::1', 1558684504, 'Fri, 24 May 19 09:55:04 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/assetsCustom/img/anime3.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'http', 'HTTP/1.1', '80', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (838, '::1', 1558684558, 'Fri, 24 May 19 09:55:58 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/slider', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (839, '::1', 1558684572, 'Fri, 24 May 19 09:56:12 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (840, '::1', 1558684573, 'Fri, 24 May 19 09:56:13 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/assetsCustom/img/anime3.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (841, '::1', 1558684573, 'Fri, 24 May 19 09:56:13 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=5ca34ccf06d55.jpg', '{\"id\":\"5ca34ccf06d55.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (842, '::1', 1558684573, 'Fri, 24 May 19 09:56:13 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=7', '{\"id\":\"7\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (843, '::1', 1558684576, 'Fri, 24 May 19 09:56:16 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/create', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (844, '::1', 1558684576, 'Fri, 24 May 19 09:56:16 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/assetsCustom/img/anime3.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (845, '::1', 1558695558, 'Fri, 24 May 19 12:59:18 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/create', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (846, '::1', 1558695573, 'Fri, 24 May 19 12:59:33 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (847, '::1', 1558695575, 'Fri, 24 May 19 12:59:35 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=7', '{\"id\":\"7\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (848, '::1', 1558695575, 'Fri, 24 May 19 12:59:35 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/assetsCustom/img/anime3.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (849, '::1', 1558695575, 'Fri, 24 May 19 12:59:35 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=5ca34ccf06d55.jpg', '{\"id\":\"5ca34ccf06d55.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (850, '::1', 1558695754, 'Fri, 24 May 19 13:02:34 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (851, '::1', 1558695755, 'Fri, 24 May 19 13:02:35 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=5ca34ccf06d55.jpg', '{\"id\":\"5ca34ccf06d55.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (852, '::1', 1558695755, 'Fri, 24 May 19 13:02:35 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=7', '{\"id\":\"7\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (853, '::1', 1558695755, 'Fri, 24 May 19 13:02:35 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/assetsCustom/img/anime3.png', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (854, '::1', 1558695774, 'Fri, 24 May 19 13:02:54 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (855, '::1', 1558695868, 'Fri, 24 May 19 13:04:28 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (856, '::1', 1558696498, 'Fri, 24 May 19 13:14:58 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (857, '::1', 1558696621, 'Fri, 24 May 19 13:17:01 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (858, '::1', 1558699123, 'Fri, 24 May 19 13:58:43 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (859, '::1', 1558699126, 'Fri, 24 May 19 13:58:46 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (860, '::1', 1558699259, 'Fri, 24 May 19 14:00:59 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (861, '::1', 1558699269, 'Fri, 24 May 19 14:01:09 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (862, '::1', 1558699295, 'Fri, 24 May 19 14:01:35 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (863, '::1', 1558699332, 'Fri, 24 May 19 14:02:12 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (864, '::1', 1558699360, 'Fri, 24 May 19 14:02:40 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (865, '::1', 1558699374, 'Fri, 24 May 19 14:02:54 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (866, '::1', 1558710380, 'Fri, 24 May 19 17:06:20 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (867, '::1', 1558710461, 'Fri, 24 May 19 17:07:41 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (868, '::1', 1558710485, 'Fri, 24 May 19 17:08:05 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (869, '::1', 1558710516, 'Fri, 24 May 19 17:08:36 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (870, '::1', 1558710531, 'Fri, 24 May 19 17:08:51 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (871, '::1', 1558710534, 'Fri, 24 May 19 17:08:54 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (872, '::1', 1558710587, 'Fri, 24 May 19 17:09:47 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (873, '::1', 1558710620, 'Fri, 24 May 19 17:10:20 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (874, '::1', 1558710632, 'Fri, 24 May 19 17:10:32 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (875, '::1', 1558710636, 'Fri, 24 May 19 17:10:36 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (876, '::1', 1558710645, 'Fri, 24 May 19 17:10:45 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (877, '::1', 1558710661, 'Fri, 24 May 19 17:11:01 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (878, '::1', 1558710661, 'Fri, 24 May 19 17:11:01 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/login', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (879, '::1', 1558710681, 'Fri, 24 May 19 17:11:21 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (880, '::1', 1558710681, 'Fri, 24 May 19 17:11:21 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/login', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (881, '::1', 1558710686, 'Fri, 24 May 19 17:11:26 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/site/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (882, '::1', 1558710686, 'Fri, 24 May 19 17:11:26 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/login', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (883, '::1', 1558710714, 'Fri, 24 May 19 17:11:54 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/login', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (884, '::1', 1558710720, 'Fri, 24 May 19 17:12:00 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/login', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (885, '::1', 1558711405, 'Fri, 24 May 19 17:23:25 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/login', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (886, '::1', 1559055040, 'Tue, 28 May 19 16:50:40 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/slider', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (887, '::1', 1559055130, 'Tue, 28 May 19 16:52:10 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (888, '::1', 1559055131, 'Tue, 28 May 19 16:52:11 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=7', '{\"id\":\"7\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (889, '::1', 1559055131, 'Tue, 28 May 19 16:52:11 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=5ca34ccf06d55.jpg', '{\"id\":\"5ca34ccf06d55.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (890, '::1', 1559055189, 'Tue, 28 May 19 16:53:09 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (891, '::1', 1559055189, 'Tue, 28 May 19 16:53:09 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=7', '{\"id\":\"7\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (892, '::1', 1559055189, 'Tue, 28 May 19 16:53:09 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=5ca34ccf06d55.jpg', '{\"id\":\"5ca34ccf06d55.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (893, '::1', 1559055232, 'Tue, 28 May 19 16:53:52 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (894, '::1', 1559055232, 'Tue, 28 May 19 16:53:52 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=7', '{\"id\":\"7\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (895, '::1', 1559055232, 'Tue, 28 May 19 16:53:52 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=5ca34ccf06d55.jpg', '{\"id\":\"5ca34ccf06d55.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (896, '::1', 1559055233, 'Tue, 28 May 19 16:53:53 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (897, '::1', 1559055234, 'Tue, 28 May 19 16:53:54 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=5ca34ccf06d55.jpg', '{\"id\":\"5ca34ccf06d55.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (898, '::1', 1559055234, 'Tue, 28 May 19 16:53:54 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=7', '{\"id\":\"7\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (899, '::1', 1559055236, 'Tue, 28 May 19 16:53:56 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (900, '::1', 1559055289, 'Tue, 28 May 19 16:54:49 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1559055236891', '{\"_\":\"1559055236891\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (901, '::1', 1559055356, 'Tue, 28 May 19 16:55:56 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (902, '::1', 1559055380, 'Tue, 28 May 19 16:56:20 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (903, '::1', 1559055389, 'Tue, 28 May 19 16:56:29 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (904, '::1', 1559055401, 'Tue, 28 May 19 16:56:41 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (905, '::1', 1559055421, 'Tue, 28 May 19 16:57:01 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (906, '::1', 1559055437, 'Tue, 28 May 19 16:57:17 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (907, '::1', 1559055454, 'Tue, 28 May 19 16:57:34 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (908, '::1', 1559055469, 'Tue, 28 May 19 16:57:49 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (909, '::1', 1559055473, 'Tue, 28 May 19 16:57:53 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (910, '::1', 1559055505, 'Tue, 28 May 19 16:58:25 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (911, '::1', 1559055510, 'Tue, 28 May 19 16:58:30 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/productmanufacturers/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (912, '::1', 1559055524, 'Tue, 28 May 19 16:58:44 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/productmanufacturers/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (913, '::1', 1559055538, 'Tue, 28 May 19 16:58:58 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/productmanufacturers/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (914, '::1', 1559055727, 'Tue, 28 May 19 17:02:07 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/productmanufacturers/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (915, '::1', 1559055844, 'Tue, 28 May 19 17:04:04 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/productmanufacturers/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (916, '::1', 1559055848, 'Tue, 28 May 19 17:04:08 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/productdiscounts/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (917, '::1', 1559055878, 'Tue, 28 May 19 17:04:38 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/productdiscounts/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (918, '::1', 1559055920, 'Tue, 28 May 19 17:05:20 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/productdiscounts/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (919, '::1', 1559055971, 'Tue, 28 May 19 17:06:11 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/productdiscounts/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (920, '::1', 1559055991, 'Tue, 28 May 19 17:06:31 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/productdiscounts/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (921, '::1', 1559056007, 'Tue, 28 May 19 17:06:47 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/productdiscounts/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (922, '::1', 1559056010, 'Tue, 28 May 19 17:06:50 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/productdiscounts/create?_=1559056007542', '{\"_\":\"1559056007542\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (923, '::1', 1559056103, 'Tue, 28 May 19 17:08:23 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/productdiscounts/1?_=1559056007543', '{\"_\":\"1559056007543\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (924, '::1', 1559056256, 'Tue, 28 May 19 17:10:56 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/productdiscountsdetail/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (925, '::1', 1559056270, 'Tue, 28 May 19 17:11:10 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/productdiscountsdetails/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (926, '::1', 1559056286, 'Tue, 28 May 19 17:11:26 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/productdiscountsdetail/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (927, '::1', 1559056286, 'Tue, 28 May 19 17:11:26 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/productdiscounts/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (928, '::1', 1559056287, 'Tue, 28 May 19 17:11:27 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/productmanufacturers/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (929, '::1', 1559056289, 'Tue, 28 May 19 17:11:29 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (930, '::1', 1559056293, 'Tue, 28 May 19 17:11:33 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (931, '::1', 1559056498, 'Tue, 28 May 19 17:14:58 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (932, '::1', 1559056550, 'Tue, 28 May 19 17:15:50 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (933, '::1', 1559056554, 'Tue, 28 May 19 17:15:54 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (934, '::1', 1559056821, 'Tue, 28 May 19 17:20:21 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (935, '::1', 1559056851, 'Tue, 28 May 19 17:20:51 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (936, '::1', 1559056860, 'Tue, 28 May 19 17:21:00 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (937, '::1', 1559056878, 'Tue, 28 May 19 17:21:18 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (938, '::1', 1559056885, 'Tue, 28 May 19 17:21:25 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (939, '::1', 1559056918, 'Tue, 28 May 19 17:21:58 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (940, '::1', 1559057338, 'Tue, 28 May 19 17:28:58 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (941, '::1', 1559057378, 'Tue, 28 May 19 17:29:38 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (942, '::1', 1559057449, 'Tue, 28 May 19 17:30:49 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (943, '::1', 1559057456, 'Tue, 28 May 19 17:30:56 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (944, '::1', 1559057474, 'Tue, 28 May 19 17:31:14 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (945, '::1', 1559057487, 'Tue, 28 May 19 17:31:27 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (946, '::1', 1559057500, 'Tue, 28 May 19 17:31:40 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (947, '::1', 1559057525, 'Tue, 28 May 19 17:32:05 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (948, '::1', 1559057549, 'Tue, 28 May 19 17:32:29 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (949, '::1', 1559057589, 'Tue, 28 May 19 17:33:09 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (950, '::1', 1559057595, 'Tue, 28 May 19 17:33:15 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (951, '::1', 1559057596, 'Tue, 28 May 19 17:33:16 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (952, '::1', 1559061450, 'Tue, 28 May 19 18:37:30 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (953, '::1', 1559061743, 'Tue, 28 May 19 18:42:23 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/admin/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (954, '::1', 1559061837, 'Tue, 28 May 19 18:43:57 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/admin/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (955, '::1', 1559061844, 'Tue, 28 May 19 18:44:04 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/admin/update?id=2', '{\"id\":\"2\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (956, '::1', 1559061846, 'Tue, 28 May 19 18:44:06 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/admin/assignments?id=2', '{\"id\":\"2\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (957, '::1', 1559061852, 'Tue, 28 May 19 18:44:12 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/rbac/permission/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (958, '::1', 1559061882, 'Tue, 28 May 19 18:44:42 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/admin/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (959, '::1', 1559061886, 'Tue, 28 May 19 18:44:46 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/rbac/role/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (960, '::1', 1559061927, 'Tue, 28 May 19 18:45:27 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/rbac/role/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (961, '::1', 1559061931, 'Tue, 28 May 19 18:45:31 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/rbac/role/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (962, '::1', 1559062371, 'Tue, 28 May 19 18:52:51 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/rbac/permission/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (963, '::1', 1559062373, 'Tue, 28 May 19 18:52:53 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/rbac/permission/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (964, '::1', 1559062437, 'Tue, 28 May 19 18:53:57 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/site/logout', '[]', '{\"_csrf-backend\":\"pA1mLXS6RsuNNjHHcXFrx165ChB_FodXt19zAuNpM3HKPBRnDY0Zs_UORfM9KyT2COYzSSYl8ySFbBE20193Kw==\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (965, '::1', 1559062437, 'Tue, 28 May 19 18:53:57 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (966, '::1', 1559062437, 'Tue, 28 May 19 18:53:57 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/login', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (967, '::1', 1559062443, 'Tue, 28 May 19 18:54:03 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/login', '[]', '{\"_csrf-backend\":\"71BAX2ziMYdEBiV0oJjNzLrMbhHZlvlCCsRK5iehK_yBYTIVFdVu_zw-UUDswoL97JNXSICljTE49yjSF5dvpg==\",\"login-form\":{\"login\":\"admin\",\"password\":\"123456\",\"rememberMe\":\"0\"},\"ajax\":\"login-form\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (968, '::1', 1559062443, 'Tue, 28 May 19 18:54:03 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/login', '[]', '{\"_csrf-backend\":\"71BAX2ziMYdEBiV0oJjNzLrMbhHZlvlCCsRK5iehK_yBYTIVFdVu_zw-UUDswoL97JNXSICljTE49yjSF5dvpg==\",\"login-form\":{\"login\":\"admin\",\"password\":\"123456\",\"rememberMe\":\"0\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (969, '::1', 1559062444, 'Tue, 28 May 19 18:54:04 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (970, '::1', 1559062446, 'Tue, 28 May 19 18:54:06 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/admin/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (971, '::1', 1559062449, 'Tue, 28 May 19 18:54:09 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/admin/update?id=2', '{\"id\":\"2\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (972, '::1', 1559062450, 'Tue, 28 May 19 18:54:10 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/admin/assignments?id=2', '{\"id\":\"2\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (973, '::1', 1559062453, 'Tue, 28 May 19 18:54:13 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/rbac/role/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (974, '::1', 1559062456, 'Tue, 28 May 19 18:54:16 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/admin/assignments?id=2', '{\"id\":\"2\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (975, '::1', 1559062458, 'Tue, 28 May 19 18:54:18 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/rbac/permission/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (976, '::1', 1559062460, 'Tue, 28 May 19 18:54:20 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/admin/assignments?id=2', '{\"id\":\"2\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (977, '::1', 1559062462, 'Tue, 28 May 19 18:54:22 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/rbac/rule/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (978, '::1', 1559062464, 'Tue, 28 May 19 18:54:24 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/admin/assignments?id=2', '{\"id\":\"2\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (979, '::1', 1559062467, 'Tue, 28 May 19 18:54:27 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/rbac/role/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (980, '::1', 1559062851, 'Tue, 28 May 19 19:00:51 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/rbac/role/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (981, '::1', 1559062854, 'Tue, 28 May 19 19:00:54 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/admin/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (982, '::1', 1559062858, 'Tue, 28 May 19 19:00:58 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/admin/update?id=2', '{\"id\":\"2\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (983, '::1', 1559062860, 'Tue, 28 May 19 19:01:00 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/admin/assignments?id=2', '{\"id\":\"2\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (984, '::1', 1559062866, 'Tue, 28 May 19 19:01:06 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/admin/update?id=2', '{\"id\":\"2\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (985, '::1', 1559062868, 'Tue, 28 May 19 19:01:08 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/admin/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (986, '::1', 1559062871, 'Tue, 28 May 19 19:01:11 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/admin/update?id=2', '{\"id\":\"2\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (987, '::1', 1559062873, 'Tue, 28 May 19 19:01:13 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/admin/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (988, '::1', 1559062875, 'Tue, 28 May 19 19:01:15 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/admin/update?id=1', '{\"id\":\"1\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (989, '::1', 1559062878, 'Tue, 28 May 19 19:01:18 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/admin/assignments?id=1', '{\"id\":\"1\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (990, '::1', 1559062878, 'Tue, 28 May 19 19:01:18 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/admin/update?id=1', '{\"id\":\"1\"}', '{\"_csrf-backend\":\"10Q_rAV3Mf2S0MBe963vJrAnUl4ZlKiQQs67hrwILG2wIQvUfzVSsdmcswu5zNtN911kZyujw_UNuZbw6X9nBg==\",\"User\":{\"email\":\"mysaltern@gmail.com\",\"username\":\"admin\",\"password\":\"\"},\"ajax\":\"w0\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (991, '::1', 1559062881, 'Tue, 28 May 19 19:01:21 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/admin/assignments?id=1', '{\"id\":\"1\"}', '{\"_csrf-backend\":\"O8GdCaRzklBzVyDmoqhj2bRxNDRTiA0PTbhSDpcC8-VcpKlx3jHxHDgbU7PsyVey8wsCDWG_ZmoCz394wnW4jg==\",\"Assignment\":{\"user_id\":\"1\",\"items\":[\"admin\"]}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (992, '::1', 1559062884, 'Tue, 28 May 19 19:01:24 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/admin/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (993, '::1', 1559063075, 'Tue, 28 May 19 19:04:35 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/rbac/role/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (994, '::1', 1559063328, 'Tue, 28 May 19 19:08:48 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/rbac/role/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (995, '::1', 1559063333, 'Tue, 28 May 19 19:08:53 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/admin/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (996, '::1', 1559063383, 'Tue, 28 May 19 19:09:43 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/rbac/role/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (997, '::1', 1559063387, 'Tue, 28 May 19 19:09:47 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/admin/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (998, '::1', 1559063390, 'Tue, 28 May 19 19:09:50 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/admin/update?id=2', '{\"id\":\"2\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (999, '::1', 1559063393, 'Tue, 28 May 19 19:09:53 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/rbac/permission/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1000, '::1', 1559063398, 'Tue, 28 May 19 19:09:58 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/rbac/permission/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1001, '::1', 1559063794, 'Tue, 28 May 19 19:16:34 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/rbac/permission/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1002, '::1', 1559066908, 'Tue, 28 May 19 20:08:28 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/admin/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1003, '::1', 1559069045, 'Tue, 28 May 19 20:44:05 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/rbac/permission/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1004, '::1', 1559069050, 'Tue, 28 May 19 20:44:10 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/logvisitor', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1005, '::1', 1559069086, 'Tue, 28 May 19 20:44:46 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/logvisitor', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1006, '::1', 1559069091, 'Tue, 28 May 19 20:44:51 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orders', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1007, '::1', 1559069094, 'Tue, 28 May 19 20:44:54 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orders/create?_=1559069092239', '{\"_\":\"1559069092239\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1008, '::1', 1559069138, 'Tue, 28 May 19 20:45:38 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orders', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1009, '::1', 1559069485, 'Tue, 28 May 19 20:51:25 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1010, '::1', 1559069487, 'Tue, 28 May 19 20:51:27 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=5ca34ccf06d55.jpg', '{\"id\":\"5ca34ccf06d55.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1011, '::1', 1559069487, 'Tue, 28 May 19 20:51:27 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=7', '{\"id\":\"7\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1012, '::1', 1559070469, 'Tue, 28 May 19 21:07:49 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/rbac/role/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1013, '::1', 1559071534, 'Tue, 28 May 19 21:25:34 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orders', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1014, '::1', 1559071570, 'Tue, 28 May 19 21:26:10 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orders/create?_=1559071535946', '{\"_\":\"1559071535946\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1015, '::1', 1559071774, 'Tue, 28 May 19 21:29:34 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orders', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1016, '::1', 1559071818, 'Tue, 28 May 19 21:30:18 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orders', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1017, '::1', 1559071865, 'Tue, 28 May 19 21:31:05 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orders', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1018, '::1', 1559072209, 'Tue, 28 May 19 21:36:49 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orders', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1019, '::1', 1559072243, 'Tue, 28 May 19 21:37:23 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orders', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1020, '::1', 1559072278, 'Tue, 28 May 19 21:37:58 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orders', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1021, '::1', 1559072286, 'Tue, 28 May 19 21:38:06 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1022, '::1', 1559072290, 'Tue, 28 May 19 21:38:10 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1023, '::1', 1559072357, 'Tue, 28 May 19 21:39:17 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1024, '::1', 1559072372, 'Tue, 28 May 19 21:39:32 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/productdiscounts/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1025, '::1', 1559072378, 'Tue, 28 May 19 21:39:38 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/productdiscountsdetails/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1026, '::1', 1559072406, 'Tue, 28 May 19 21:40:06 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/productdiscountsdetails/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1027, '::1', 1559072410, 'Tue, 28 May 19 21:40:10 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/productdiscountdetails/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1028, '::1', 1559072488, 'Tue, 28 May 19 21:41:28 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/productdiscountdetails/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1029, '::1', 1559072525, 'Tue, 28 May 19 21:42:05 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/productdiscountdetails/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1030, '::1', 1559072533, 'Tue, 28 May 19 21:42:13 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/productdiscountdetails/create?_=1559072525825', '{\"_\":\"1559072525825\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1031, '::1', 1559072586, 'Tue, 28 May 19 21:43:06 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/productdiscountdetails/create?_=1559072525826', '{\"_\":\"1559072525826\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1032, '::1', 1559072695, 'Tue, 28 May 19 21:44:55 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/productdiscountdetails/create?_=1559072525827', '{\"_\":\"1559072525827\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1033, '::1', 1559072789, 'Tue, 28 May 19 21:46:29 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/productdiscountdetails/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1034, '::1', 1559072792, 'Tue, 28 May 19 21:46:32 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orders/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1035, '::1', 1559072812, 'Tue, 28 May 19 21:46:52 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1036, '::1', 1559734272, 'Wed, 05 Jun 19 13:31:12 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/login', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1037, '::1', 1559734277, 'Wed, 05 Jun 19 13:31:17 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/login', '[]', '{\"_csrf-backend\":\"C8jjQvaG91Z_vVzB2j_6CYe_o5aLZ8XULhVe3t8HJGxdproaxOCxBz3Ebq69XsxQttnl4uwxq-RdJSSYpzZsXA==\",\"login-form\":{\"login\":\"admin\",\"password\":\"123456\",\"rememberMe\":\"0\"},\"ajax\":\"login-form\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1038, '::1', 1559734277, 'Wed, 05 Jun 19 13:31:17 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/login', '[]', '{\"_csrf-backend\":\"C8jjQvaG91Z_vVzB2j_6CYe_o5aLZ8XULhVe3t8HJGxdproaxOCxBz3Ebq69XsxQttnl4uwxq-RdJSSYpzZsXA==\",\"login-form\":{\"login\":\"admin\",\"password\":\"123456\",\"rememberMe\":\"0\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1039, '::1', 1559734278, 'Wed, 05 Jun 19 13:31:18 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1040, '::1', 1559735742, 'Wed, 05 Jun 19 13:55:42 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/gii', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1041, '::1', 1559735745, 'Wed, 05 Jun 19 13:55:45 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1042, '::1', 1559735747, 'Wed, 05 Jun 19 13:55:47 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1043, '::1', 1559735754, 'Wed, 05 Jun 19 13:55:54 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/create?_=1559735748637', '{\"_\":\"1559735748637\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1044, '::1', 1559735904, 'Wed, 05 Jun 19 13:58:24 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/productdiscounts/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1045, '::1', 1559735911, 'Wed, 05 Jun 19 13:58:31 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/orders/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1046, '::1', 1559735915, 'Wed, 05 Jun 19 13:58:35 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1047, '::1', 1559735921, 'Wed, 05 Jun 19 13:58:41 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/productdiscountdetails/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1048, '::1', 1559735931, 'Wed, 05 Jun 19 13:58:51 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/productdiscounts/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1049, '::1', 1559735933, 'Wed, 05 Jun 19 13:58:53 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/productdiscounts/create?_=1559735931536', '{\"_\":\"1559735931536\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1050, '::1', 1559736294, 'Wed, 05 Jun 19 14:04:54 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/productdiscounts/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1051, '::1', 1559736331, 'Wed, 05 Jun 19 14:05:31 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/productdiscounts/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1052, '::1', 1559736333, 'Wed, 05 Jun 19 14:05:33 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1053, '::1', 1559736335, 'Wed, 05 Jun 19 14:05:35 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=5ca34ccf06d55.jpg', '{\"id\":\"5ca34ccf06d55.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1054, '::1', 1559736335, 'Wed, 05 Jun 19 14:05:35 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=7', '{\"id\":\"7\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1055, '::1', 1559736576, 'Wed, 05 Jun 19 14:09:36 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/logvisitor', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1056, '::1', 1559736587, 'Wed, 05 Jun 19 14:09:47 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/logvisitor', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1057, '::1', 1559736610, 'Wed, 05 Jun 19 14:10:10 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/logvisitor/logvisitor', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1058, '::1', 1559736630, 'Wed, 05 Jun 19 14:10:30 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/logvisitor', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1059, '::1', 1559736677, 'Wed, 05 Jun 19 14:11:17 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/logvisitor', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1060, '::1', 1559736693, 'Wed, 05 Jun 19 14:11:33 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/logvisitor', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1061, '::1', 1559736989, 'Wed, 05 Jun 19 14:16:29 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/logvisitor', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1062, '::1', 1559737015, 'Wed, 05 Jun 19 14:16:55 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/logvisitor', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1063, '::1', 1559737303, 'Wed, 05 Jun 19 14:21:43 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1064, '::1', 1559737305, 'Wed, 05 Jun 19 14:21:45 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=5ca34ccf06d55.jpg', '{\"id\":\"5ca34ccf06d55.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1065, '::1', 1559737305, 'Wed, 05 Jun 19 14:21:45 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=7', '{\"id\":\"7\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1066, '::1', 1559737436, 'Wed, 05 Jun 19 14:23:56 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/logvisitor', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1067, '::1', 1559737439, 'Wed, 05 Jun 19 14:23:59 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/logvisitor/users/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1068, '::1', 1559737450, 'Wed, 05 Jun 19 14:24:10 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1069, '::1', 1559737463, 'Wed, 05 Jun 19 14:24:23 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/login', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1070, '::1', 1559737463, 'Wed, 05 Jun 19 14:24:23 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1071, '::1', 1559737472, 'Wed, 05 Jun 19 14:24:32 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/login', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1072, '::1', 1559737472, 'Wed, 05 Jun 19 14:24:32 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1073, '::1', 1559737484, 'Wed, 05 Jun 19 14:24:44 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/admin/assignments?id=2', '{\"id\":\"2\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1074, '::1', 1559737492, 'Wed, 05 Jun 19 14:24:52 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/admin/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1075, '::1', 1559737500, 'Wed, 05 Jun 19 14:25:00 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/admin/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1076, '::1', 1559737503, 'Wed, 05 Jun 19 14:25:03 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/users/admin', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1077, '::1', 1559737517, 'Wed, 05 Jun 19 14:25:17 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/admin/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1078, '::1', 1559737522, 'Wed, 05 Jun 19 14:25:22 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/orders/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1079, '::1', 1559737524, 'Wed, 05 Jun 19 14:25:24 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/admin', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1080, '::1', 1559737527, 'Wed, 05 Jun 19 14:25:27 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/user/admin', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1081, '::1', 1559737548, 'Wed, 05 Jun 19 14:25:48 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/logvisitor', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1082, '::1', 1559737551, 'Wed, 05 Jun 19 14:25:51 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/admin', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1083, '::1', 1559737553, 'Wed, 05 Jun 19 14:25:53 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/admin', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1084, '::1', 1559737554, 'Wed, 05 Jun 19 14:25:54 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/admin', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1085, '::1', 1559737585, 'Wed, 05 Jun 19 14:26:25 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/admin', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1086, '::1', 1559737645, 'Wed, 05 Jun 19 14:27:25 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/admin', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1087, '::1', 1559737648, 'Wed, 05 Jun 19 14:27:28 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1088, '::1', 1559737650, 'Wed, 05 Jun 19 14:27:30 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1089, '::1', 1559737659, 'Wed, 05 Jun 19 14:27:39 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu/creator/update?id=1', '{\"id\":\"1\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1090, '::1', 1559737659, 'Wed, 05 Jun 19 14:27:39 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu/creator/update?id=1', '{\"id\":\"1\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1091, '::1', 1559737664, 'Wed, 05 Jun 19 14:27:44 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1092, '::1', 1559737676, 'Wed, 05 Jun 19 14:27:56 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1093, '::1', 1559737677, 'Wed, 05 Jun 19 14:27:57 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1094, '::1', 1559737679, 'Wed, 05 Jun 19 14:27:59 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu/creator/create', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1095, '::1', 1559737682, 'Wed, 05 Jun 19 14:28:02 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1096, '::1', 1559737684, 'Wed, 05 Jun 19 14:28:04 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu/creator/update?id=1', '{\"id\":\"1\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1097, '::1', 1559737684, 'Wed, 05 Jun 19 14:28:04 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu/creator/update?id=1', '{\"id\":\"1\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1098, '::1', 1559737688, 'Wed, 05 Jun 19 14:28:08 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1099, '::1', 1559737692, 'Wed, 05 Jun 19 14:28:12 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu/creator/create', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1100, '::1', 1559737697, 'Wed, 05 Jun 19 14:28:17 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu/creator/create', '[]', '{\"_csrf-backend\":\"j6xNOG-WJnYAyxYUDAniDRaEtuwiV5dvTVbOqlI8qaDMlRhWPtFiH2muWl9rZNB8Qsv0rmkn4AM8IaT6GUTT_w==\",\"Model\":{\"menu_name\":\"news\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1101, '::1', 1559737697, 'Wed, 05 Jun 19 14:28:17 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu/creator/update?id=2', '{\"id\":\"2\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1102, '::1', 1559737698, 'Wed, 05 Jun 19 14:28:18 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu/creator/update?id=2', '{\"id\":\"2\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1103, '::1', 1559737700, 'Wed, 05 Jun 19 14:28:20 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu/creator/update?id=2', '{\"id\":\"2\"}', '{\"update\":\"true\",\"menu\":\"{\\n    \\\"left\\\": [],\\n    \\\"right\\\": []\\n}\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1104, '::1', 1559737707, 'Wed, 05 Jun 19 14:28:27 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu/creator/update?id=2', '{\"id\":\"2\"}', '{\"update\":\"true\",\"menu\":\"{\\n    \\\"left\\\": [],\\n    \\\"right\\\": []\\n}\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1105, '::1', 1559737722, 'Wed, 05 Jun 19 14:28:42 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu/creator/update?id=2', '{\"id\":\"2\"}', '{\"update\":\"true\",\"menu\":\"{\\n    \\\"left\\\": [],\\n    \\\"right\\\": []\\n}\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1106, '::1', 1559737725, 'Wed, 05 Jun 19 14:28:45 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1107, '::1', 1559737727, 'Wed, 05 Jun 19 14:28:47 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu/creator/view?id=2', '{\"id\":\"2\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1108, '::1', 1559737731, 'Wed, 05 Jun 19 14:28:51 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1109, '::1', 1559737734, 'Wed, 05 Jun 19 14:28:54 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu/creator/update?id=2', '{\"id\":\"2\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1110, '::1', 1559737735, 'Wed, 05 Jun 19 14:28:55 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu/creator/update?id=2', '{\"id\":\"2\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1111, '::1', 1559737739, 'Wed, 05 Jun 19 14:28:59 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu/creator/update?id=2', '{\"id\":\"2\"}', '{\"update\":\"true\",\"menu\":\"{\\n    \\\"left\\\": [],\\n    \\\"right\\\": []\\n}\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1112, '::1', 1559737758, 'Wed, 05 Jun 19 14:29:18 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu/creator/update?id=2', '{\"id\":\"2\"}', '{\"update\":\"true\",\"menu\":\"{\\n    \\\"left\\\": [],\\n    \\\"right\\\": []\\n}\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1113, '::1', 1559737759, 'Wed, 05 Jun 19 14:29:19 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu/creator/update?id=2', '{\"id\":\"2\"}', '{\"update\":\"true\",\"menu\":\"{\\n    \\\"left\\\": [],\\n    \\\"right\\\": []\\n}\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1114, '::1', 1559737762, 'Wed, 05 Jun 19 14:29:22 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu/creator/update?id=2', '{\"id\":\"2\"}', '{\"update\":\"true\",\"menu\":\"{\\n    \\\"left\\\": [],\\n    \\\"right\\\": []\\n}\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1115, '::1', 1559737763, 'Wed, 05 Jun 19 14:29:23 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1116, '::1', 1559737765, 'Wed, 05 Jun 19 14:29:25 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu/creator/update?id=2', '{\"id\":\"2\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1117, '::1', 1559737766, 'Wed, 05 Jun 19 14:29:26 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu/creator/update?id=2', '{\"id\":\"2\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1118, '::1', 1559737854, 'Wed, 05 Jun 19 14:30:54 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu/creator/update?id=2', '{\"id\":\"2\"}', '{\"update\":\"true\",\"menu\":\"{\\n    \\\"left\\\": [],\\n    \\\"right\\\": []\\n}\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1119, '::1', 1559737858, 'Wed, 05 Jun 19 14:30:58 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu/creator/update?id=2', '{\"id\":\"2\"}', '{\"update\":\"true\",\"menu\":\"{\\n    \\\"left\\\": [\\n        {\\n            \\\"label\\\": \\\"tyry\\\",\\n            \\\"url\\\": \\\"rtyrtyrt\\\",\\n            \\\"type\\\": \\\"link\\\"\\n        }\\n    ],\\n    \\\"right\\\": []\\n}\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1120, '::1', 1559737870, 'Wed, 05 Jun 19 14:31:10 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu/creator/update?id=2', '{\"id\":\"2\"}', '{\"update\":\"true\",\"menu\":\"{\\n    \\\"left\\\": [\\n        {\\n            \\\"label\\\": \\\"tyry\\\",\\n            \\\"url\\\": \\\"rtyrtyrt\\\",\\n            \\\"type\\\": \\\"link\\\"\\n        },\\n        {\\n            \\\"label\\\": \\\"news\\\",\\n            \\\"url\\\": \\\"news\\/index\\\",\\n            \\\"type\\\": \\\"link\\\"\\n        }\\n    ],\\n    \\\"right\\\": []\\n}\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1121, '::1', 1559737874, 'Wed, 05 Jun 19 14:31:14 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu/creator/update?id=2', '{\"id\":\"2\"}', '{\"update\":\"true\",\"menu\":\"{\\n    \\\"left\\\": [\\n        {\\n            \\\"label\\\": \\\"news\\\",\\n            \\\"url\\\": \\\"news\\/index\\\",\\n            \\\"type\\\": \\\"link\\\"\\n        }\\n    ],\\n    \\\"right\\\": []\\n}\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1122, '::1', 1559737876, 'Wed, 05 Jun 19 14:31:16 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu/creator/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1123, '::1', 1559737880, 'Wed, 05 Jun 19 14:31:20 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1124, '::1', 1559737882, 'Wed, 05 Jun 19 14:31:22 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu/creator/update?id=2', '{\"id\":\"2\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1125, '::1', 1559737883, 'Wed, 05 Jun 19 14:31:23 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu/creator/update?id=2', '{\"id\":\"2\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1126, '::1', 1559737892, 'Wed, 05 Jun 19 14:31:32 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu/creator/update?id=2', '{\"id\":\"2\"}', '{\"update\":\"true\",\"menu\":\"{\\n    \\\"left\\\": [\\n        {\\n            \\\"label\\\": \\\"news\\\",\\n            \\\"url\\\": \\\"news\\/index\\\",\\n            \\\"type\\\": \\\"link\\\"\\n        },\\n        {\\n            \\\"label\\\": \\\"news\\\",\\n            \\\"url\\\": \\\"news\\/index\\\",\\n            \\\"type\\\": \\\"link\\\"\\n        }\\n    ],\\n    \\\"right\\\": []\\n}\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1127, '::1', 1559737896, 'Wed, 05 Jun 19 14:31:36 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu/creator/update?id=2', '{\"id\":\"2\"}', '{\"update\":\"true\",\"menu\":\"{\\n    \\\"left\\\": [\\n        {\\n            \\\"label\\\": \\\"news\\\",\\n            \\\"url\\\": \\\"news\\/index\\\",\\n            \\\"type\\\": \\\"link\\\"\\n        }\\n    ],\\n    \\\"right\\\": []\\n}\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1128, '::1', 1559737897, 'Wed, 05 Jun 19 14:31:37 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu/creator/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1129, '::1', 1559737908, 'Wed, 05 Jun 19 14:31:48 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1130, '::1', 1559737912, 'Wed, 05 Jun 19 14:31:52 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu/creator/view?id=2', '{\"id\":\"2\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1131, '::1', 1559737918, 'Wed, 05 Jun 19 14:31:58 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu/creator/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1132, '::1', 1559737949, 'Wed, 05 Jun 19 14:32:29 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1133, '::1', 1559738016, 'Wed, 05 Jun 19 14:33:36 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/products/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1134, '::1', 1559738663, 'Wed, 05 Jun 19 14:44:23 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/menu', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1135, '::1', 1559738672, 'Wed, 05 Jun 19 14:44:32 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/gallery', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1136, '::1', 1559738706, 'Wed, 05 Jun 19 14:45:06 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1137, '::1', 1559738734, 'Wed, 05 Jun 19 14:45:34 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1138, '::1', 1559738737, 'Wed, 05 Jun 19 14:45:37 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/about/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1139, '::1', 1559738751, 'Wed, 05 Jun 19 14:45:51 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/about/create', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1140, '::1', 1559738751, 'Wed, 05 Jun 19 14:45:51 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/about/update', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1141, '::1', 1559738768, 'Wed, 05 Jun 19 14:46:08 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/about/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1142, '::1', 1559738772, 'Wed, 05 Jun 19 14:46:12 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/about/update/2', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1143, '::1', 1559738784, 'Wed, 05 Jun 19 14:46:24 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/about/update/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1144, '::1', 1559738795, 'Wed, 05 Jun 19 14:46:35 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/article/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1145, '::1', 1559738796, 'Wed, 05 Jun 19 14:46:36 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/about/update', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1146, '::1', 1559739537, 'Wed, 05 Jun 19 14:58:57 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/about/update', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1147, '::1', 1559739818, 'Wed, 05 Jun 19 15:03:38 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/about/update', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1148, '::1', 1559739841, 'Wed, 05 Jun 19 15:04:01 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1149, '::1', 1559739861, 'Wed, 05 Jun 19 15:04:21 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1150, '::1', 1559739862, 'Wed, 05 Jun 19 15:04:22 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=5ca34ccf06d55.jpg', '{\"id\":\"5ca34ccf06d55.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1151, '::1', 1559739862, 'Wed, 05 Jun 19 15:04:22 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=7', '{\"id\":\"7\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1152, '::1', 1559739870, 'Wed, 05 Jun 19 15:04:30 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1153, '::1', 1559739871, 'Wed, 05 Jun 19 15:04:31 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=5ca34ccf06d55.jpg', '{\"id\":\"5ca34ccf06d55.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1154, '::1', 1559739871, 'Wed, 05 Jun 19 15:04:31 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=7', '{\"id\":\"7\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1155, '::1', 1559739891, 'Wed, 05 Jun 19 15:04:51 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1156, '::1', 1559739892, 'Wed, 05 Jun 19 15:04:52 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=5ca34ccf06d55.jpg', '{\"id\":\"5ca34ccf06d55.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1157, '::1', 1559739892, 'Wed, 05 Jun 19 15:04:52 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=7', '{\"id\":\"7\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1158, '::1', 1559739973, 'Wed, 05 Jun 19 15:06:13 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1159, '::1', 1559739973, 'Wed, 05 Jun 19 15:06:13 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=7', '{\"id\":\"7\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1160, '::1', 1559739973, 'Wed, 05 Jun 19 15:06:13 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=5ca34ccf06d55.jpg', '{\"id\":\"5ca34ccf06d55.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1161, '::1', 1559748369, 'Wed, 05 Jun 19 17:26:09 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/create', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1162, '::1', 1559748527, 'Wed, 05 Jun 19 17:28:47 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/create', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1163, '::1', 1559748554, 'Wed, 05 Jun 19 17:29:14 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/create', '[]', '{\"_csrf-backend\":\"FI9lKJav6b1i3dlsXxSTs0Mg6Qa6nDjbQE8OqmuITf1XtjBGx-it1Au4lSc4eaHCF2-rRPHsT7cxOGT6IPA3og==\",\"News\":{\"title\":\"afsdf\",\"content\":\"<p>fsdf<\\/p>\",\"desc\":\"<p>sdfsdf<\\/p>\",\"photo\":\"\",\"publish_date_\":\"1398\\/03\\/16\",\"active\":\"1\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1164, '::1', 1559749318, 'Wed, 05 Jun 19 17:41:58 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/create', '[]', '{\"_csrf-backend\":\"FI9lKJav6b1i3dlsXxSTs0Mg6Qa6nDjbQE8OqmuITf1XtjBGx-it1Au4lSc4eaHCF2-rRPHsT7cxOGT6IPA3og==\",\"News\":{\"title\":\"afsdf\",\"content\":\"<p>fsdf<\\/p>\",\"desc\":\"<p>sdfsdf<\\/p>\",\"photo\":\"\",\"publish_date_\":\"1398\\/03\\/16\",\"active\":\"1\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1165, '::1', 1559803096, 'Thu, 06 Jun 19 08:38:16 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/create', '[]', '{\"_csrf-backend\":\"FI9lKJav6b1i3dlsXxSTs0Mg6Qa6nDjbQE8OqmuITf1XtjBGx-it1Au4lSc4eaHCF2-rRPHsT7cxOGT6IPA3og==\",\"News\":{\"title\":\"afsdf\",\"content\":\"<p>fsdf<\\/p>\",\"desc\":\"<p>sdfsdf<\\/p>\",\"photo\":\"\",\"publish_date_\":\"1398\\/03\\/16\",\"active\":\"1\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1166, '::1', 1559803113, 'Thu, 06 Jun 19 08:38:33 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/create', '[]', '{\"_csrf-backend\":\"FI9lKJav6b1i3dlsXxSTs0Mg6Qa6nDjbQE8OqmuITf1XtjBGx-it1Au4lSc4eaHCF2-rRPHsT7cxOGT6IPA3og==\",\"News\":{\"title\":\"afsdf\",\"content\":\"<p>fsdf<\\/p>\",\"desc\":\"<p>sdfsdf<\\/p>\",\"photo\":\"\",\"publish_date_\":\"1398\\/03\\/16\",\"active\":\"1\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1167, '::1', 1559803125, 'Thu, 06 Jun 19 08:38:45 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/create', '[]', '{\"_csrf-backend\":\"FI9lKJav6b1i3dlsXxSTs0Mg6Qa6nDjbQE8OqmuITf1XtjBGx-it1Au4lSc4eaHCF2-rRPHsT7cxOGT6IPA3og==\",\"News\":{\"title\":\"afsdf\",\"content\":\"<p>fsdf<\\/p>\",\"desc\":\"<p>sdfsdf<\\/p>\",\"photo\":\"\",\"publish_date_\":\"1398\\/03\\/16\",\"active\":\"1\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1168, '::1', 1559803163, 'Thu, 06 Jun 19 08:39:23 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/create', '[]', '{\"_csrf-backend\":\"FI9lKJav6b1i3dlsXxSTs0Mg6Qa6nDjbQE8OqmuITf1XtjBGx-it1Au4lSc4eaHCF2-rRPHsT7cxOGT6IPA3og==\",\"News\":{\"title\":\"afsdf\",\"content\":\"<p>fsdf<\\/p>\",\"desc\":\"<p>sdfsdf<\\/p>\",\"photo\":\"\",\"publish_date_\":\"1398\\/03\\/16\",\"active\":\"1\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1169, '::1', 1559803169, 'Thu, 06 Jun 19 08:39:29 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/create', '[]', '{\"_csrf-backend\":\"FI9lKJav6b1i3dlsXxSTs0Mg6Qa6nDjbQE8OqmuITf1XtjBGx-it1Au4lSc4eaHCF2-rRPHsT7cxOGT6IPA3og==\",\"News\":{\"title\":\"afsdf\",\"content\":\"<p>fsdf<\\/p>\",\"desc\":\"<p>sdfsdf<\\/p>\",\"photo\":\"\",\"publish_date_\":\"1398\\/03\\/16\",\"active\":\"1\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1170, '::1', 1559803169, 'Thu, 06 Jun 19 08:39:29 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/5', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1171, '::1', 1559803278, 'Thu, 06 Jun 19 08:41:18 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/create', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1172, '::1', 1559803317, 'Thu, 06 Jun 19 08:41:57 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/create', '[]', '{\"_csrf-backend\":\"2vLdHY6ZsteEQ9y5c0KflUthLxQgLwpwQ5VEAReE7YKZy4hz3972vu0mkPIUL63kHy5tVmtffRwy4i5RXPyX3Q==\",\"News\":{\"title\":\"svv\",\"content\":\"<p>sdvs<\\/p>\",\"desc\":\"<p>sdfds<\\/p>\",\"photo\":\"\",\"publish_date_\":\"1398\\/03\\/17\",\"active\":\"1\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1173, '::1', 1559803331, 'Thu, 06 Jun 19 08:42:11 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/create', '[]', '{\"_csrf-backend\":\"2vLdHY6ZsteEQ9y5c0KflUthLxQgLwpwQ5VEAReE7YKZy4hz3972vu0mkPIUL63kHy5tVmtffRwy4i5RXPyX3Q==\",\"News\":{\"title\":\"svv\",\"content\":\"<p>sdvs<\\/p>\",\"desc\":\"<p>sdfds<\\/p>\",\"photo\":\"\",\"publish_date_\":\"1398\\/03\\/17\",\"active\":\"1\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1174, '::1', 1559803348, 'Thu, 06 Jun 19 08:42:28 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/create', '[]', '{\"_csrf-backend\":\"2vLdHY6ZsteEQ9y5c0KflUthLxQgLwpwQ5VEAReE7YKZy4hz3972vu0mkPIUL63kHy5tVmtffRwy4i5RXPyX3Q==\",\"News\":{\"title\":\"svv\",\"content\":\"<p>sdvs<\\/p>\",\"desc\":\"<p>sdfds<\\/p>\",\"photo\":\"\",\"publish_date_\":\"1398\\/03\\/17\",\"active\":\"1\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1175, '::1', 1559803407, 'Thu, 06 Jun 19 08:43:27 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/create', '[]', '{\"_csrf-backend\":\"2vLdHY6ZsteEQ9y5c0KflUthLxQgLwpwQ5VEAReE7YKZy4hz3972vu0mkPIUL63kHy5tVmtffRwy4i5RXPyX3Q==\",\"News\":{\"title\":\"svv\",\"content\":\"<p>sdvs<\\/p>\",\"desc\":\"<p>sdfds<\\/p>\",\"photo\":\"\",\"publish_date_\":\"1398\\/03\\/17\",\"active\":\"1\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1176, '::1', 1559803486, 'Thu, 06 Jun 19 08:44:46 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/create', '[]', '{\"_csrf-backend\":\"2vLdHY6ZsteEQ9y5c0KflUthLxQgLwpwQ5VEAReE7YKZy4hz3972vu0mkPIUL63kHy5tVmtffRwy4i5RXPyX3Q==\",\"News\":{\"title\":\"svv\",\"content\":\"<p>sdvs<\\/p>\",\"desc\":\"<p>sdfds<\\/p>\",\"photo\":\"\",\"publish_date_\":\"1398\\/03\\/17\",\"active\":\"1\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1177, '::1', 1559803488, 'Thu, 06 Jun 19 08:44:48 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/create', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1178, '::1', 1559804463, 'Thu, 06 Jun 19 09:01:03 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/create', '[]', '{\"_csrf-backend\":\"RRkcd68Kmoqxl3o5LBljSnTD0q_WBrBVbfoJ4jw_CGEGIEkZ_k3e49jyNnJLdFE7IIyQ7Z12xzkcjWOyd0dyPg==\",\"News\":{\"title\":\"joij\",\"content\":\"<p>ijoo<\\/p>\",\"desc\":\"<p>joioij<\\/p>\",\"photo\":\"\",\"publish_date_\":\"1398\\/03\\/17\",\"active\":\"0\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1179, '::1', 1559804463, 'Thu, 06 Jun 19 09:01:03 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/6', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1180, '::1', 1559804464, 'Thu, 06 Jun 19 09:01:04 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=8', '{\"id\":\"8\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1181, '::1', 1559804474, 'Thu, 06 Jun 19 09:01:14 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/create', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1182, '::1', 1559804483, 'Thu, 06 Jun 19 09:01:23 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/create', '[]', '{\"_csrf-backend\":\"ZwfXkL6qSprdm687Fr74LSa5wHXrsYLkoEbXHzcmOq4kPoL-7-0O87T-43Bx08pccvaCN6DB9YjRMb1PfF5A8Q==\",\"News\":{\"title\":\"jnni\",\"content\":\"<p>nin<\\/p>\",\"desc\":\"<p>npijij<\\/p>\",\"photo\":\"\",\"publish_date_\":\"\",\"active\":\"0\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1183, '::1', 1559804498, 'Thu, 06 Jun 19 09:01:38 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/create', '[]', '{\"_csrf-backend\":\"ZwfXkL6qSprdm687Fr74LSa5wHXrsYLkoEbXHzcmOq4kPoL-7-0O87T-43Bx08pccvaCN6DB9YjRMb1PfF5A8Q==\",\"News\":{\"title\":\"jnni\",\"content\":\"<p>nin<\\/p>\",\"desc\":\"<p>npijij<\\/p>\",\"photo\":\"\",\"publish_date_\":\"\",\"active\":\"0\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1184, '::1', 1559804538, 'Thu, 06 Jun 19 09:02:18 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/create', '[]', '{\"_csrf-backend\":\"ZwfXkL6qSprdm687Fr74LSa5wHXrsYLkoEbXHzcmOq4kPoL-7-0O87T-43Bx08pccvaCN6DB9YjRMb1PfF5A8Q==\",\"News\":{\"title\":\"jnni\",\"content\":\"<p>nin<\\/p>\",\"desc\":\"<p>npijij<\\/p>\",\"photo\":\"\",\"publish_date_\":\"\",\"active\":\"0\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1185, '::1', 1559804555, 'Thu, 06 Jun 19 09:02:35 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/create', '[]', '{\"_csrf-backend\":\"ZwfXkL6qSprdm687Fr74LSa5wHXrsYLkoEbXHzcmOq4kPoL-7-0O87T-43Bx08pccvaCN6DB9YjRMb1PfF5A8Q==\",\"News\":{\"title\":\"jnni\",\"content\":\"<p>nin<\\/p>\",\"desc\":\"<p>npijij<\\/p>\",\"photo\":\"\",\"publish_date_\":\"\",\"active\":\"0\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1186, '::1', 1559804567, 'Thu, 06 Jun 19 09:02:47 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/create', '[]', '{\"_csrf-backend\":\"ZwfXkL6qSprdm687Fr74LSa5wHXrsYLkoEbXHzcmOq4kPoL-7-0O87T-43Bx08pccvaCN6DB9YjRMb1PfF5A8Q==\",\"News\":{\"title\":\"jnni\",\"content\":\"<p>nin<\\/p>\",\"desc\":\"<p>npijij<\\/p>\",\"photo\":\"\",\"publish_date_\":\"\",\"active\":\"0\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1187, '::1', 1559804567, 'Thu, 06 Jun 19 09:02:47 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/7', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1188, '::1', 1559804586, 'Thu, 06 Jun 19 09:03:06 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/update/7', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1189, '::1', 1559804587, 'Thu, 06 Jun 19 09:03:07 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=', '{\"id\":\"\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1190, '::1', 1559804594, 'Thu, 06 Jun 19 09:03:14 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/update/7', '[]', '{\"_csrf-backend\":\"GK1QjfKFIQVKFp-1ig5egAe9jYglrr4w2kiZTp5VI3lblAXjo8JlbCNz0_7tY2zxU_LPym7eyVyrP_Me1S1ZJg==\",\"News\":{\"title\":\"jnni\",\"content\":\"<p>nin<\\/p>\",\"desc\":\"<p>npijij<\\/p>\",\"photo\":\"\",\"publish_date_\":\"\",\"active\":\"0\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1191, '::1', 1559804595, 'Thu, 06 Jun 19 09:03:15 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/7', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1192, '::1', 1559804595, 'Thu, 06 Jun 19 09:03:15 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=9', '{\"id\":\"9\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1193, '::1', 1559804614, 'Thu, 06 Jun 19 09:03:34 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/article/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1194, '::1', 1559804724, 'Thu, 06 Jun 19 09:05:24 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/gii', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1195, '::1', 1559804727, 'Thu, 06 Jun 19 09:05:27 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/gii/model', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1196, '::1', 1559804745, 'Thu, 06 Jun 19 09:05:45 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/gii/model', '[]', '{\"_csrf-backend\":\"qZLDC9fyVncvEvVH2UcpWAb6v0Fr5Rm9YuZYng9Jzbjqq5ZlhrUSHkZ3uQy-KhspUrX9AyCVbtETkTLORDG35w==\",\"Generator\":{\"tableName\":\"news\",\"modelClass\":\"News\",\"standardizeCapitals\":\"0\",\"singularize\":\"0\",\"ns\":\"common\\\\models\",\"baseClass\":\"yii\\\\db\\\\ActiveRecord\",\"db\":\"db\",\"useTablePrefix\":\"0\",\"generateRelations\":\"all\",\"generateRelationsFromCurrentSchema\":\"1\",\"generateLabelsFromComments\":\"0\",\"generateQuery\":\"1\",\"queryNs\":\"common\\\\models\",\"queryClass\":\"NewsQuery\",\"queryBaseClass\":\"yii\\\\db\\\\ActiveQuery\",\"enableI18N\":\"0\",\"messageCategory\":\"app\",\"useSchemaName\":\"1\",\"template\":\"default\"},\"preview\":\"\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1197, '::1', 1559804749, 'Thu, 06 Jun 19 09:05:49 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/gii/default/diff?id=model&file=afbdd1b22442a080bf6ed94b18baa475', '{\"id\":\"model\",\"file\":\"afbdd1b22442a080bf6ed94b18baa475\"}', '{\"_csrf-backend\":\"syKDVMB2H80EBC2GxntT-5zbRo3mYVYJkI5AwG5ppqzwG9Y6kTFbpG1hYc2hFmGKyJQEz60RIWXh-SqQJRHc8w==\",\"Generator\":{\"tableName\":\"news\",\"modelClass\":\"News\",\"standardizeCapitals\":\"0\",\"singularize\":\"0\",\"ns\":\"common\\\\models\",\"baseClass\":\"yii\\\\db\\\\ActiveRecord\",\"db\":\"db\",\"useTablePrefix\":\"0\",\"generateRelations\":\"all\",\"generateRelationsFromCurrentSchema\":\"1\",\"generateLabelsFromComments\":\"0\",\"generateQuery\":\"1\",\"queryNs\":\"common\\\\models\",\"queryClass\":\"NewsQuery\",\"queryBaseClass\":\"yii\\\\db\\\\ActiveQuery\",\"enableI18N\":\"0\",\"messageCategory\":\"app\",\"useSchemaName\":\"1\",\"template\":\"default\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1198, '::1', 1559804824, 'Thu, 06 Jun 19 09:07:04 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/article/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1199, '::1', 1559804884, 'Thu, 06 Jun 19 09:08:04 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/article/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1200, '::1', 1559804884, 'Thu, 06 Jun 19 09:08:04 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=7', '{\"id\":\"7\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1201, '::1', 1559804884, 'Thu, 06 Jun 19 09:08:04 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=9', '{\"id\":\"9\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1202, '::1', 1559804884, 'Thu, 06 Jun 19 09:08:04 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=8', '{\"id\":\"8\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1203, '::1', 1559804885, 'Thu, 06 Jun 19 09:08:05 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=5ca34ccf06d55.jpg', '{\"id\":\"5ca34ccf06d55.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1204, '::1', 1559804953, 'Thu, 06 Jun 19 09:09:13 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/article/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1205, '::1', 1559804953, 'Thu, 06 Jun 19 09:09:13 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=7', '{\"id\":\"7\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1206, '::1', 1559804953, 'Thu, 06 Jun 19 09:09:13 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=5ca34ccf06d55.jpg', '{\"id\":\"5ca34ccf06d55.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1207, '::1', 1559804954, 'Thu, 06 Jun 19 09:09:14 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=9', '{\"id\":\"9\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1208, '::1', 1559804954, 'Thu, 06 Jun 19 09:09:14 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=8', '{\"id\":\"8\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1209, '::1', 1559804982, 'Thu, 06 Jun 19 09:09:42 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/article/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1210, '::1', 1559804983, 'Thu, 06 Jun 19 09:09:43 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=7', '{\"id\":\"7\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1211, '::1', 1559804983, 'Thu, 06 Jun 19 09:09:43 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=5ca34ccf06d55.jpg', '{\"id\":\"5ca34ccf06d55.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1212, '::1', 1559804983, 'Thu, 06 Jun 19 09:09:43 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=9', '{\"id\":\"9\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1213, '::1', 1559804983, 'Thu, 06 Jun 19 09:09:43 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=8', '{\"id\":\"8\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1214, '::1', 1559804999, 'Thu, 06 Jun 19 09:09:59 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/article/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1215, '::1', 1559804999, 'Thu, 06 Jun 19 09:09:59 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=5ca34ccf06d55.jpg', '{\"id\":\"5ca34ccf06d55.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1216, '::1', 1559804999, 'Thu, 06 Jun 19 09:09:59 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=7', '{\"id\":\"7\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1217, '::1', 1559804999, 'Thu, 06 Jun 19 09:09:59 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=8', '{\"id\":\"8\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1218, '::1', 1559804999, 'Thu, 06 Jun 19 09:09:59 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=9', '{\"id\":\"9\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1219, '::1', 1559805057, 'Thu, 06 Jun 19 09:10:57 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/article/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1220, '::1', 1559805057, 'Thu, 06 Jun 19 09:10:57 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=7', '{\"id\":\"7\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1221, '::1', 1559805057, 'Thu, 06 Jun 19 09:10:57 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=5ca34ccf06d55.jpg', '{\"id\":\"5ca34ccf06d55.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1222, '::1', 1559805057, 'Thu, 06 Jun 19 09:10:57 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=8', '{\"id\":\"8\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1223, '::1', 1559805057, 'Thu, 06 Jun 19 09:10:57 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=9', '{\"id\":\"9\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1224, '::1', 1559805182, 'Thu, 06 Jun 19 09:13:02 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/article/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1225, '::1', 1559805186, 'Thu, 06 Jun 19 09:13:06 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/article/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1226, '::1', 1559805187, 'Thu, 06 Jun 19 09:13:07 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=5ca34ccf06d55.jpg', '{\"id\":\"5ca34ccf06d55.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1227, '::1', 1559805187, 'Thu, 06 Jun 19 09:13:07 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=7', '{\"id\":\"7\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1228, '::1', 1559805187, 'Thu, 06 Jun 19 09:13:07 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=9', '{\"id\":\"9\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1229, '::1', 1559805187, 'Thu, 06 Jun 19 09:13:07 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=8', '{\"id\":\"8\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1230, '::1', 1559805220, 'Thu, 06 Jun 19 09:13:40 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/article/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1231, '::1', 1559805221, 'Thu, 06 Jun 19 09:13:41 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=5ca34ccf06d55.jpg', '{\"id\":\"5ca34ccf06d55.jpg\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1232, '::1', 1559805221, 'Thu, 06 Jun 19 09:13:41 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=7', '{\"id\":\"7\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1233, '::1', 1559805221, 'Thu, 06 Jun 19 09:13:41 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=9', '{\"id\":\"9\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1234, '::1', 1559805221, 'Thu, 06 Jun 19 09:13:41 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=8', '{\"id\":\"8\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1235, '::1', 1559805256, 'Thu, 06 Jun 19 09:14:16 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/article/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1236, '::1', 1559805317, 'Thu, 06 Jun 19 09:15:17 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/article/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1237, '::1', 1559805319, 'Thu, 06 Jun 19 09:15:19 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/article/create', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1238, '::1', 1559805333, 'Thu, 06 Jun 19 09:15:33 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/article/create', '[]', '{\"_csrf-backend\":\"StIFR-WghFPVcRdIMd0fcbfwT0WUJ_vwIWz1Kf365dwJ61AptOfAOrwUWwNWsC0A478NB99XjJxQG595toKfgw==\",\"News\":{\"title\":\"klmlkm\",\"content\":\"<p>kkkk<\\/p>\",\"desc\":\"<p>km<\\/p>\",\"photo\":\"\",\"publish_date_\":\"\",\"active\":\"0\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1239, '::1', 1559805333, 'Thu, 06 Jun 19 09:15:33 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/article/8', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1240, '::1', 1559805337, 'Thu, 06 Jun 19 09:15:37 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/article/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1241, '::1', 1559805622, 'Thu, 06 Jun 19 09:20:22 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1242, '::1', 1559805624, 'Thu, 06 Jun 19 09:20:24 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/pages/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1243, '::1', 1559842056, 'Thu, 06 Jun 19 19:27:36 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/pages/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1244, '::1', 1559845194, 'Thu, 06 Jun 19 20:19:54 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1245, '::1', 1559845196, 'Thu, 06 Jun 19 20:19:56 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/create', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1246, '::1', 1559845266, 'Thu, 06 Jun 19 20:21:06 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1247, '::1', 1559845268, 'Thu, 06 Jun 19 20:21:08 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1248, '::1', 1559845270, 'Thu, 06 Jun 19 20:21:10 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1249, '::1', 1559845369, 'Thu, 06 Jun 19 20:22:49 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1250, '::1', 1559845370, 'Thu, 06 Jun 19 20:22:50 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1251, '::1', 1559845375, 'Thu, 06 Jun 19 20:22:55 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1252, '::1', 1559845377, 'Thu, 06 Jun 19 20:22:57 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1253, '::1', 1559845378, 'Thu, 06 Jun 19 20:22:58 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1254, '::1', 1559845388, 'Thu, 06 Jun 19 20:23:08 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/filemanager/default/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1255, '::1', 1559845389, 'Thu, 06 Jun 19 20:23:09 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/filemanager/default/settings', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1256, '::1', 1559845394, 'Thu, 06 Jun 19 20:23:14 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/filemanager/default/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1257, '::1', 1559845396, 'Thu, 06 Jun 19 20:23:16 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/filemanager/default/settings', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1258, '::1', 1559845398, 'Thu, 06 Jun 19 20:23:18 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/filemanager/file/resize', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1259, '::1', 1559845405, 'Thu, 06 Jun 19 20:23:25 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/filemanager/default/settings', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1260, '::1', 1559845410, 'Thu, 06 Jun 19 20:23:30 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/filemanager/default/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1261, '::1', 1559845411, 'Thu, 06 Jun 19 20:23:31 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/filemanager/file/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1262, '::1', 1559845413, 'Thu, 06 Jun 19 20:23:33 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1263, '::1', 1559845419, 'Thu, 06 Jun 19 20:23:39 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/filemanager/file/uploadmanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1264, '::1', 1559845425, 'Thu, 06 Jun 19 20:23:45 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/filemanager/file/filemanager', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1265, '::1', 1559845436, 'Thu, 06 Jun 19 20:23:56 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1266, '::1', 1559845439, 'Thu, 06 Jun 19 20:23:59 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/create', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1267, '::1', 1559845461, 'Thu, 06 Jun 19 20:24:21 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/create', '[]', '{\"_csrf-backend\":\"7dF9kFxUTKWpqH2pWPBucbIj4rTvbiExNjhdeV9CrSGu6Cj-DRMIzMDNMeI_nVwA5myg9qQeVl1HTzcpFDrXfg==\",\"News\":{\"title\":\"fdgdgf\",\"content\":\"<p>fgdg<\\/p>\",\"desc\":\"<p><a title=\\\"loo\\\" href=\\\"..\\/..\\/..\\/..\\/frontend\\/web\\/\\/uploads\\/2019\\/05\\/lottery.png\\\">https:\\/\\/localhost\\/cmsSefroweb\\/crmSefroweb\\/frontend\\/web\\/\\/uploads\\/2019\\/05\\/lottery.png<\\/a><\\/p>\",\"photo\":\"\",\"publish_date_\":\"\",\"active\":\"0\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1268, '::1', 1559845461, 'Thu, 06 Jun 19 20:24:21 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/9', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1269, '::1', 1559845470, 'Thu, 06 Jun 19 20:24:30 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/update/9', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1270, '::1', 1559845471, 'Thu, 06 Jun 19 20:24:31 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=', '{\"id\":\"\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1271, '::1', 1559846315, 'Thu, 06 Jun 19 20:38:35 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/update/9', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1272, '::1', 1559846316, 'Thu, 06 Jun 19 20:38:36 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=', '{\"id\":\"\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1273, '::1', 1559846331, 'Thu, 06 Jun 19 20:38:51 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/update/9', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1274, '::1', 1559846332, 'Thu, 06 Jun 19 20:38:52 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=', '{\"id\":\"\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1275, '::1', 1559846691, 'Thu, 06 Jun 19 20:44:51 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/update/9', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1276, '::1', 1559846711, 'Thu, 06 Jun 19 20:45:11 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/update/9', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1277, '::1', 1559846711, 'Thu, 06 Jun 19 20:45:11 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=', '{\"id\":\"\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1278, '::1', 1559846731, 'Thu, 06 Jun 19 20:45:31 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/update/9', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1279, '::1', 1559846732, 'Thu, 06 Jun 19 20:45:32 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=', '{\"id\":\"\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1280, '::1', 1559846751, 'Thu, 06 Jun 19 20:45:51 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/update/9', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1281, '::1', 1559846751, 'Thu, 06 Jun 19 20:45:51 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=', '{\"id\":\"\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1282, '::1', 1559846781, 'Thu, 06 Jun 19 20:46:21 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/update/9', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1283, '::1', 1559846782, 'Thu, 06 Jun 19 20:46:22 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=', '{\"id\":\"\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1284, '::1', 1559846797, 'Thu, 06 Jun 19 20:46:37 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/update/9', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1285, '::1', 1559846802, 'Thu, 06 Jun 19 20:46:42 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/update/9', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1286, '::1', 1559846806, 'Thu, 06 Jun 19 20:46:46 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/update/9', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1287, '::1', 1559846807, 'Thu, 06 Jun 19 20:46:47 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=', '{\"id\":\"\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1288, '::1', 1559846822, 'Thu, 06 Jun 19 20:47:02 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/update/9', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1289, '::1', 1559846828, 'Thu, 06 Jun 19 20:47:08 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/update/9', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1290, '::1', 1559846828, 'Thu, 06 Jun 19 20:47:08 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=', '{\"id\":\"\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1291, '::1', 1559846865, 'Thu, 06 Jun 19 20:47:45 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/update/9', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1292, '::1', 1559846865, 'Thu, 06 Jun 19 20:47:45 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=', '{\"id\":\"\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1293, '::1', 1559846888, 'Thu, 06 Jun 19 20:48:08 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/update/9', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1294, '::1', 1559846888, 'Thu, 06 Jun 19 20:48:08 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=', '{\"id\":\"\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1295, '::1', 1559846936, 'Thu, 06 Jun 19 20:48:56 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/update/9', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1296, '::1', 1559846936, 'Thu, 06 Jun 19 20:48:56 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=', '{\"id\":\"\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1297, '::1', 1559846946, 'Thu, 06 Jun 19 20:49:06 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/update/\'plugins\'%20=%3E%20[%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22advlist%20autolink%20lists%20link%20image%20charmap%20print%20preview%20hr%20anchor%20pagebreak%20placeholder%22,%20%20%20', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1298, '::1', 1559847027, 'Thu, 06 Jun 19 20:50:27 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/update/9', '[]', '{\"_csrf-backend\":\"Mgz6NGqkb8g1tsdzRH7HhqsqMYqUpSxDEoc1P8dty2dxNa9aO-MroVzTizgjE_X3_2VzyN_VWy9j8F9vjBWxOA==\",\"News\":{\"title\":\"fdgdgf\",\"content\":\"<p>dfssdfsfgdg<\\/p>\\r\\n<p>&nbsp;<\\/p>\\r\\n<p>&nbsp;<\\/p>\\r\\n<p>&nbsp;<\\/p>\\r\\n<p>&nbsp;<\\/p>\\r\\n<p><img src=\\\"..\\/..\\/..\\/..\\/..\\/frontend\\/web\\/\\/uploads\\/2019\\/05\\/lottery.png\\\" alt=\\\"sad\\\" width=\\\"600\\\" height=\\\"600\\\" \\/><\\/p>\",\"desc\":\"<p><a title=\\\"loo\\\" href=\\\"..\\/..\\/..\\/..\\/frontend\\/web\\/uploads\\/2019\\/05\\/lottery.png\\\">https:\\/\\/localhost\\/cmsSefroweb\\/crmSefroweb\\/frontend\\/web\\/\\/uploads\\/2019\\/05\\/lottery.png<\\/a><\\/p>\",\"photo\":\"\",\"publish_date_\":\"\",\"active\":\"0\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1299, '::1', 1559847027, 'Thu, 06 Jun 19 20:50:27 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/9', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1300, '::1', 1559847034, 'Thu, 06 Jun 19 20:50:34 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/update/9', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1301, '::1', 1559847034, 'Thu, 06 Jun 19 20:50:34 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=', '{\"id\":\"\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1302, '::1', 1559847044, 'Thu, 06 Jun 19 20:50:44 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/9', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1303, '::1', 1559847055, 'Thu, 06 Jun 19 20:50:55 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/update/9', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1304, '::1', 1559847055, 'Thu, 06 Jun 19 20:50:55 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=', '{\"id\":\"\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1305, '::1', 1559847085, 'Thu, 06 Jun 19 20:51:25 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/update/9', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1306, '::1', 1559847085, 'Thu, 06 Jun 19 20:51:25 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=', '{\"id\":\"\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1307, '::1', 1559847093, 'Thu, 06 Jun 19 20:51:33 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/update/9', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1308, '::1', 1559847094, 'Thu, 06 Jun 19 20:51:34 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=', '{\"id\":\"\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1309, '::1', 1559847106, 'Thu, 06 Jun 19 20:51:46 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/update/9', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1310, '::1', 1559847107, 'Thu, 06 Jun 19 20:51:47 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=', '{\"id\":\"\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1311, '::1', 1559847113, 'Thu, 06 Jun 19 20:51:53 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/update/9', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1312, '::1', 1559847113, 'Thu, 06 Jun 19 20:51:53 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=', '{\"id\":\"\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1313, '::1', 1559847153, 'Thu, 06 Jun 19 20:52:33 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/update/9', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1314, '::1', 1559847154, 'Thu, 06 Jun 19 20:52:34 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=', '{\"id\":\"\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1315, '::1', 1559847169, 'Thu, 06 Jun 19 20:52:49 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/update/9', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1316, '::1', 1559847169, 'Thu, 06 Jun 19 20:52:49 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=', '{\"id\":\"\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1317, '::1', 1559847216, 'Thu, 06 Jun 19 20:53:36 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/news/update/9', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1318, '::1', 1559847216, 'Thu, 06 Jun 19 20:53:36 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=', '{\"id\":\"\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1319, '::1', 1559900800, 'Fri, 07 Jun 19 11:46:40 +0200', '/cmsSefroweb/crmSefroweb/backend/web/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1320, '::1', 1559900801, 'Fri, 07 Jun 19 11:46:41 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/login', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1321, '::1', 1559900811, 'Fri, 07 Jun 19 11:46:51 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/login', '[]', '{\"_csrf-backend\":\"tJy3NE4uAhlTtRnifPmql1AXGSxpL7sftHXwLllAHPj8rtRtelRKeBT2NIQJwcmvNltXbT4X3ybzNLpcKjVUlw==\",\"login-form\":{\"login\":\"admin\",\"password\":\"123456\",\"rememberMe\":\"0\"},\"ajax\":\"login-form\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1322, '::1', 1559900811, 'Fri, 07 Jun 19 11:46:51 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/user/login', '[]', '{\"_csrf-backend\":\"tJy3NE4uAhlTtRnifPmql1AXGSxpL7sftHXwLllAHPj8rtRtelRKeBT2NIQJwcmvNltXbT4X3ybzNLpcKjVUlw==\",\"login-form\":{\"login\":\"admin\",\"password\":\"123456\",\"rememberMe\":\"0\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1323, '::1', 1559900812, 'Fri, 07 Jun 19 11:46:52 +0200', '/cmsSefroweb/crmSefroweb/backend/web/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1324, '::1', 1559901231, 'Fri, 07 Jun 19 11:53:51 +0200', '/cmsSefroweb/crmSefroweb/backend/web/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1325, '::1', 1559901249, 'Fri, 07 Jun 19 11:54:09 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/gii', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1326, '::1', 1559901252, 'Fri, 07 Jun 19 11:54:12 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/gii/model', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1327, '::1', 1559901267, 'Fri, 07 Jun 19 11:54:27 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/gii/model', '[]', '{\"_csrf-backend\":\"gGVCHDdqaSjgwRdAkoJukLEfRC9FnlJbapbW7fbgZafEPzFDTzwkfbiVYSbT1wjn2VszcCj_f3Zf4YSrpZgt9w==\",\"Generator\":{\"tableName\":\"page\",\"modelClass\":\"Page\",\"standardizeCapitals\":\"0\",\"singularize\":\"0\",\"ns\":\"common\\\\models\",\"baseClass\":\"yii\\\\db\\\\ActiveRecord\",\"db\":\"db\",\"useTablePrefix\":\"0\",\"generateRelations\":\"all\",\"generateRelationsFromCurrentSchema\":\"1\",\"generateLabelsFromComments\":\"0\",\"generateQuery\":\"1\",\"queryNs\":\"common\\\\models\",\"queryClass\":\"PageQuery\",\"queryBaseClass\":\"yii\\\\db\\\\ActiveQuery\",\"enableI18N\":\"0\",\"messageCategory\":\"app\",\"useSchemaName\":\"1\",\"template\":\"default\"},\"preview\":\"\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1328, '::1', 1559901277, 'Fri, 07 Jun 19 11:54:37 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/gii/model', '[]', '{\"_csrf-backend\":\"5NYVk4fbD_8L1euJW-7N6XI7Cgu1zm9OeomBmXzDQeKgjGbM_41CqlOBne8au6ueGn99VNivQmNP_tPfL7sJsg==\",\"Generator\":{\"tableName\":\"page\",\"modelClass\":\"Page\",\"standardizeCapitals\":\"0\",\"singularize\":\"0\",\"ns\":\"common\\\\models\",\"baseClass\":\"yii\\\\db\\\\ActiveRecord\",\"db\":\"db\",\"useTablePrefix\":\"0\",\"generateRelations\":\"all\",\"generateRelationsFromCurrentSchema\":\"1\",\"generateLabelsFromComments\":\"0\",\"generateQuery\":\"1\",\"queryNs\":\"common\\\\models\",\"queryClass\":\"PageQuery\",\"queryBaseClass\":\"yii\\\\db\\\\ActiveQuery\",\"enableI18N\":\"0\",\"messageCategory\":\"app\",\"useSchemaName\":\"1\",\"template\":\"default\"},\"answers\":{\"70114b491e9d5ffac3ecb7b32f118931\":\"1\",\"6c075d191fc352902d2a3c7de8415d39\":\"1\"},\"generate\":\"\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1329, '::1', 1559901281, 'Fri, 07 Jun 19 11:54:41 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/gii/ajaxcrud', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1330, '::1', 1559901319, 'Fri, 07 Jun 19 11:55:19 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/gii/ajaxcrud', '[]', '{\"_csrf-backend\":\"KBepDRszJMC1eTm9xY6wMeKTUpCTHAX5O6i_qitKkHZsTdpSY2Vple0tT9uE29ZGitclz_59KNQO3-3seDLYJg==\",\"Generator\":{\"modelClass\":\"common\\\\models\\\\Page\",\"searchModelClass\":\"common\\\\models\\\\PageSearch\",\"controllerClass\":\"backend\\\\controllers\\\\PageController\",\"viewPath\":\"@backend\\/views\\/page\",\"baseControllerClass\":\"yii\\\\web\\\\Controller\",\"enableI18N\":\"0\",\"messageCategory\":\"app\",\"template\":\"default\"},\"preview\":\"\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1331, '::1', 1559901324, 'Fri, 07 Jun 19 11:55:24 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/gii/ajaxcrud', '[]', '{\"_csrf-backend\":\"t3nBtD-fqxNsqlhpE_RdaJHA1ZgqdmKrQWgL1pwbbeTzI7LrR8nmRjT-Lg9SoTsf-YSix0cXT4Z0H1mQz2MltA==\",\"Generator\":{\"modelClass\":\"common\\\\models\\\\Page\",\"searchModelClass\":\"common\\\\models\\\\PageSearch\",\"controllerClass\":\"backend\\\\controllers\\\\PageController\",\"viewPath\":\"@backend\\/views\\/page\",\"baseControllerClass\":\"yii\\\\web\\\\Controller\",\"enableI18N\":\"0\",\"messageCategory\":\"app\",\"template\":\"default\"},\"answers\":{\"77b35f92e81356f5dc45f3d4546434f1\":\"1\",\"52c805f5d3e5ed3a0cd6720326ba7843\":\"1\",\"79b54d17b789c431addc31ce7fc1a850\":\"1\",\"b577ff4cac969a54992d37dc6d8e38dd\":\"1\",\"b076fb151b513f0416ca73ec8e7d073f\":\"1\",\"fc453f0fd5eefd44697eaca5ba3675c5\":\"1\",\"4f1fbd28112cba08d508645ffea212f7\":\"1\",\"332b9b2f7569122efa595e02cf7dc53a\":\"1\"},\"generate\":\"\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1332, '::1', 1559901668, 'Fri, 07 Jun 19 12:01:08 +0200', '/cmsSefroweb/crmSefroweb/backend/web/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1333, '::1', 1559901691, 'Fri, 07 Jun 19 12:01:31 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/gii/model', '[]', '{\"_csrf-backend\":\"GV1omFZyvpOBPxSsL4NyHr8Wf7PIuFMpPjIDAKL4G6ddBxvHLiTzxtlrYspu1hRp11II7KXZfgQLRVFG8YBT9w==\",\"Generator\":{\"tableName\":\"page\",\"modelClass\":\"Page\",\"standardizeCapitals\":\"0\",\"singularize\":\"0\",\"ns\":\"common\\\\models\",\"baseClass\":\"yii\\\\db\\\\ActiveRecord\",\"db\":\"db\",\"useTablePrefix\":\"0\",\"generateRelations\":\"all\",\"generateRelationsFromCurrentSchema\":\"1\",\"generateLabelsFromComments\":\"0\",\"generateQuery\":\"1\",\"queryNs\":\"common\\\\models\",\"queryClass\":\"PageQuery\",\"queryBaseClass\":\"yii\\\\db\\\\ActiveQuery\",\"enableI18N\":\"0\",\"messageCategory\":\"app\",\"useSchemaName\":\"1\",\"template\":\"default\"},\"preview\":\"\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1334, '::1', 1559901698, 'Fri, 07 Jun 19 12:01:38 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/gii/model', '[]', '{\"_csrf-backend\":\"mO-jG-7ltVwZMpUeitJvwLMKJH30ntY1WcLOyyWl6-PctdBElrP4CUFm43jLhwm3205TIpn_-xhstZyNdt2jsw==\",\"Generator\":{\"tableName\":\"page\",\"modelClass\":\"Page\",\"standardizeCapitals\":\"0\",\"singularize\":\"0\",\"ns\":\"common\\\\models\",\"baseClass\":\"yii\\\\db\\\\ActiveRecord\",\"db\":\"db\",\"useTablePrefix\":\"0\",\"generateRelations\":\"all\",\"generateRelationsFromCurrentSchema\":\"1\",\"generateLabelsFromComments\":\"0\",\"generateQuery\":\"1\",\"queryNs\":\"common\\\\models\",\"queryClass\":\"PageQuery\",\"queryBaseClass\":\"yii\\\\db\\\\ActiveQuery\",\"enableI18N\":\"0\",\"messageCategory\":\"app\",\"useSchemaName\":\"1\",\"template\":\"default\"},\"answers\":{\"70114b491e9d5ffac3ecb7b32f118931\":\"1\"},\"generate\":\"\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1335, '::1', 1559901702, 'Fri, 07 Jun 19 12:01:42 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/gii/ajaxcrud', '[]', '{\"_csrf-backend\":\"mrF4MNCOX-TtdzyG4DrR2qFO_XDXCWXQAnZHoy9uyzre6wtvqNgSsbUjSuChb7etyQqKL7poSP03ARXlfBaDag==\",\"Generator\":{\"modelClass\":\"common\\\\models\\\\Page\",\"searchModelClass\":\"common\\\\models\\\\PageSearch\",\"controllerClass\":\"backend\\\\controllers\\\\PageController\",\"viewPath\":\"@backend\\/views\\/page\",\"baseControllerClass\":\"yii\\\\web\\\\Controller\",\"enableI18N\":\"0\",\"messageCategory\":\"app\",\"template\":\"default\"},\"preview\":\"\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1336, '::1', 1559901712, 'Fri, 07 Jun 19 12:01:52 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/gii/ajaxcrud', '[]', '{\"_csrf-backend\":\"zq2jjWkQ9so8xUVTHQtBmmH_--ZG48ijXtj4VOx3c56K99DSEUa7n2SRMzVcXiftCbuMuSuC5Y5rr6oSvw87zg==\",\"Generator\":{\"modelClass\":\"common\\\\models\\\\Page\",\"searchModelClass\":\"common\\\\models\\\\PageSearch\",\"controllerClass\":\"backend\\\\controllers\\\\PageController\",\"viewPath\":\"@backend\\/views\\/page\",\"baseControllerClass\":\"yii\\\\web\\\\Controller\",\"enableI18N\":\"0\",\"messageCategory\":\"app\",\"template\":\"default\"},\"answers\":{\"52c805f5d3e5ed3a0cd6720326ba7843\":\"1\",\"79b54d17b789c431addc31ce7fc1a850\":\"1\",\"b577ff4cac969a54992d37dc6d8e38dd\":\"1\",\"332b9b2f7569122efa595e02cf7dc53a\":\"1\"},\"generate\":\"\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1337, '::1', 1559901719, 'Fri, 07 Jun 19 12:01:59 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/pages/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1338, '::1', 1559901776, 'Fri, 07 Jun 19 12:02:56 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/pages/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1339, '::1', 1559901780, 'Fri, 07 Jun 19 12:03:00 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1340, '::1', 1559901783, 'Fri, 07 Jun 19 12:03:03 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/create?_=1559901781386', '{\"_\":\"1559901781386\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1341, '::1', 1559901938, 'Fri, 07 Jun 19 12:05:38 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/create?_=1559901781387', '{\"_\":\"1559901781387\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1342, '::1', 1559902666, 'Fri, 07 Jun 19 12:17:46 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/gii/model', '[]', '{\"_csrf-backend\":\"OMjF5C8P-i2afach3aHmiDWVAXjxwkL9vH0BX3BTxeh8kra7V1m3eMIp0Uec9ID_XdF2J5yjb9CJClMZIyuNuA==\",\"Generator\":{\"tableName\":\"page\",\"modelClass\":\"Page\",\"standardizeCapitals\":\"0\",\"singularize\":\"0\",\"ns\":\"common\\\\models\",\"baseClass\":\"yii\\\\db\\\\ActiveRecord\",\"db\":\"db\",\"useTablePrefix\":\"0\",\"generateRelations\":\"all\",\"generateRelationsFromCurrentSchema\":\"1\",\"generateLabelsFromComments\":\"0\",\"generateQuery\":\"1\",\"queryNs\":\"common\\\\models\",\"queryClass\":\"PageQuery\",\"queryBaseClass\":\"yii\\\\db\\\\ActiveQuery\",\"enableI18N\":\"0\",\"messageCategory\":\"app\",\"useSchemaName\":\"1\",\"template\":\"default\"},\"preview\":\"\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1343, '::1', 1559902672, 'Fri, 07 Jun 19 12:17:52 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/gii/model', '[]', '{\"_csrf-backend\":\"XZ6_VmMzwfjdVvr13UwyPcrM13zBsijCSVEPIauiTs8ZxMwJG2WMrYUCjJOcGVRKooigI6zTBe98Jl1n-NoGnw==\",\"Generator\":{\"tableName\":\"page\",\"modelClass\":\"Page\",\"standardizeCapitals\":\"0\",\"singularize\":\"0\",\"ns\":\"common\\\\models\",\"baseClass\":\"yii\\\\db\\\\ActiveRecord\",\"db\":\"db\",\"useTablePrefix\":\"0\",\"generateRelations\":\"all\",\"generateRelationsFromCurrentSchema\":\"1\",\"generateLabelsFromComments\":\"0\",\"generateQuery\":\"1\",\"queryNs\":\"common\\\\models\",\"queryClass\":\"PageQuery\",\"queryBaseClass\":\"yii\\\\db\\\\ActiveQuery\",\"enableI18N\":\"0\",\"messageCategory\":\"app\",\"useSchemaName\":\"1\",\"template\":\"default\"},\"answers\":{\"70114b491e9d5ffac3ecb7b32f118931\":\"1\"},\"generate\":\"\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1344, '::1', 1559902676, 'Fri, 07 Jun 19 12:17:56 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/gii/ajaxcrud', '[]', '{\"_csrf-backend\":\"5zuxtDvuKfy1cw_yo_jmIMC6OvwwfkDzLr5tgo8uFDujYcLrQ7hkqe0neZTirYBXqP5No10fbd4byT_E3FZcaw==\",\"Generator\":{\"modelClass\":\"common\\\\models\\\\Page\",\"searchModelClass\":\"common\\\\models\\\\PageSearch\",\"controllerClass\":\"backend\\\\controllers\\\\PageController\",\"viewPath\":\"@backend\\/views\\/page\",\"baseControllerClass\":\"yii\\\\web\\\\Controller\",\"enableI18N\":\"0\",\"messageCategory\":\"app\",\"template\":\"default\"},\"preview\":\"\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1345, '::1', 1559902681, 'Fri, 07 Jun 19 12:18:01 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/gii/ajaxcrud', '[]', '{\"_csrf-backend\":\"SqkzMeNbEXVlYGqm-uvV6L2eCCeWsID4yihFLrJ8gMsO80Bumw1cID00HMC7vrOf1dp_ePvRrdX_Xxdo4QTImw==\",\"Generator\":{\"modelClass\":\"common\\\\models\\\\Page\",\"searchModelClass\":\"common\\\\models\\\\PageSearch\",\"controllerClass\":\"backend\\\\controllers\\\\PageController\",\"viewPath\":\"@backend\\/views\\/page\",\"baseControllerClass\":\"yii\\\\web\\\\Controller\",\"enableI18N\":\"0\",\"messageCategory\":\"app\",\"template\":\"default\"},\"answers\":{\"52c805f5d3e5ed3a0cd6720326ba7843\":\"1\",\"79b54d17b789c431addc31ce7fc1a850\":\"1\",\"b577ff4cac969a54992d37dc6d8e38dd\":\"1\",\"332b9b2f7569122efa595e02cf7dc53a\":\"1\"},\"generate\":\"\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1346, '::1', 1559902746, 'Fri, 07 Jun 19 12:19:06 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/create?_=1559901781388', '{\"_\":\"1559901781388\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1347, '::1', 1559902760, 'Fri, 07 Jun 19 12:19:20 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/index?_pjax=%23crud-datatable-pjax', '{\"_pjax\":\"#crud-datatable-pjax\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1348, '::1', 1559902761, 'Fri, 07 Jun 19 12:19:21 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/create?_=1559901781389', '{\"_\":\"1559901781389\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1349, '::1', 1559902769, 'Fri, 07 Jun 19 12:19:29 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1350, '::1', 1559902770, 'Fri, 07 Jun 19 12:19:30 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/create?_=1559902769426', '{\"_\":\"1559902769426\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1351, '::1', 1559902786, 'Fri, 07 Jun 19 12:19:46 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/create?_=1559902769427', '{\"_\":\"1559902769427\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1352, '::1', 1559902792, 'Fri, 07 Jun 19 12:19:52 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/create?_=1559902769428', '{\"_\":\"1559902769428\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1353, '::1', 1559902803, 'Fri, 07 Jun 19 12:20:03 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/create?_=1559902769429', '{\"_\":\"1559902769429\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1354, '::1', 1559902806, 'Fri, 07 Jun 19 12:20:06 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1355, '::1', 1559902807, 'Fri, 07 Jun 19 12:20:07 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/create?_=1559902806732', '{\"_\":\"1559902806732\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1356, '::1', 1559902811, 'Fri, 07 Jun 19 12:20:11 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/create?_=1559902806733', '{\"_\":\"1559902806733\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1357, '::1', 1559902819, 'Fri, 07 Jun 19 12:20:19 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/create?_=1559902806734', '{\"_\":\"1559902806734\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1358, '::1', 1559902821, 'Fri, 07 Jun 19 12:20:21 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/index?_pjax=%23crud-datatable-pjax', '{\"_pjax\":\"#crud-datatable-pjax\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1359, '::1', 1559902822, 'Fri, 07 Jun 19 12:20:22 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/create?_=1559902806735', '{\"_\":\"1559902806735\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1360, '::1', 1559902825, 'Fri, 07 Jun 19 12:20:25 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/index?_pjax=%23crud-datatable-pjax', '{\"_pjax\":\"#crud-datatable-pjax\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1361, '::1', 1559902826, 'Fri, 07 Jun 19 12:20:26 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/create?_=1559902806736', '{\"_\":\"1559902806736\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1362, '::1', 1559902850, 'Fri, 07 Jun 19 12:20:50 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/create?_=1559902806737', '{\"_\":\"1559902806737\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1363, '::1', 1559902862, 'Fri, 07 Jun 19 12:21:02 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/create?_=1559902806738', '{\"_\":\"1559902806738\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1364, '::1', 1559902866, 'Fri, 07 Jun 19 12:21:06 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1365, '::1', 1559902869, 'Fri, 07 Jun 19 12:21:09 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/create?_=1559902866897', '{\"_\":\"1559902866897\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1366, '::1', 1559902877, 'Fri, 07 Jun 19 12:21:17 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/create?_=1559902866898', '{\"_\":\"1559902866898\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1367, '::1', 1559902904, 'Fri, 07 Jun 19 12:21:44 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/create?_=1559902866899', '{\"_\":\"1559902866899\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1368, '::1', 1559902906, 'Fri, 07 Jun 19 12:21:46 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1369, '::1', 1559902907, 'Fri, 07 Jun 19 12:21:47 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/create?_=1559902906927', '{\"_\":\"1559902906927\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1370, '::1', 1559902910, 'Fri, 07 Jun 19 12:21:50 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/create?_=1559902906928', '{\"_\":\"1559902906928\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1371, '::1', 1559902916, 'Fri, 07 Jun 19 12:21:56 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/create?_=1559902906929', '{\"_\":\"1559902906929\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1372, '::1', 1559902934, 'Fri, 07 Jun 19 12:22:14 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1373, '::1', 1559902936, 'Fri, 07 Jun 19 12:22:16 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/create?_=1559902935298', '{\"_\":\"1559902935298\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1374, '::1', 1559902940, 'Fri, 07 Jun 19 12:22:20 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/create?_=1559902935299', '{\"_\":\"1559902935299\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1375, '::1', 1559902952, 'Fri, 07 Jun 19 12:22:32 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1376, '::1', 1559902953, 'Fri, 07 Jun 19 12:22:33 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/create?_=1559902952576', '{\"_\":\"1559902952576\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1377, '::1', 1559902955, 'Fri, 07 Jun 19 12:22:35 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/create?_=1559902952577', '{\"_\":\"1559902952577\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1378, '::1', 1559903023, 'Fri, 07 Jun 19 12:23:43 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/gii/crud', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1379, '::1', 1559903255, 'Fri, 07 Jun 19 12:27:35 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/gii/crud', '[]', '{\"_csrf-backend\":\"uDuYbd9DlorfZIaH5RRRucRLbhnHnH7R9rkdvbyanQ_8YesypxXb34cw8OGkQTfOrA8ZRqr9U_zDzk_77-LVXw==\",\"Generator\":{\"modelClass\":\"common\\\\models\\\\Page\",\"searchModelClass\":\"common\\\\models\\\\PageSearch\",\"controllerClass\":\"backend\\\\controllers\\\\PageController\",\"viewPath\":\"@backend\\/views\\/page\",\"baseControllerClass\":\"yii\\\\web\\\\Controller\",\"indexWidgetType\":\"grid\",\"enableI18N\":\"0\",\"enablePjax\":\"0\",\"messageCategory\":\"app\",\"template\":\"default\"},\"preview\":\"\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1380, '::1', 1559903265, 'Fri, 07 Jun 19 12:27:45 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/gii/crud', '[]', '{\"_csrf-backend\":\"6Jz8_7cZfv36N18W8T0-BmjuRPHjuj94Rq20N9y-dk2sxo-gz08zqKJjKXCwaFhxAKozro7bElVz2uZxj8Y-HQ==\",\"Generator\":{\"modelClass\":\"common\\\\models\\\\Page\",\"searchModelClass\":\"common\\\\models\\\\PageSearch\",\"controllerClass\":\"backend\\\\controllers\\\\PageController\",\"viewPath\":\"@backend\\/views\\/page\",\"baseControllerClass\":\"yii\\\\web\\\\Controller\",\"indexWidgetType\":\"grid\",\"enableI18N\":\"0\",\"enablePjax\":\"0\",\"messageCategory\":\"app\",\"template\":\"default\"},\"answers\":{\"77b35f92e81356f5dc45f3d4546434f1\":\"1\",\"52c805f5d3e5ed3a0cd6720326ba7843\":\"1\",\"b577ff4cac969a54992d37dc6d8e38dd\":\"1\",\"6b42c3ba16a0da4b6a195a19b8b4c65f\":\"1\",\"b076fb151b513f0416ca73ec8e7d073f\":\"1\",\"fc453f0fd5eefd44697eaca5ba3675c5\":\"1\",\"4f1fbd28112cba08d508645ffea212f7\":\"1\",\"332b9b2f7569122efa595e02cf7dc53a\":\"1\"},\"generate\":\"\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1381, '::1', 1559903268, 'Fri, 07 Jun 19 12:27:48 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1382, '::1', 1559903270, 'Fri, 07 Jun 19 12:27:50 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/create', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1383, '::1', 1559903459, 'Fri, 07 Jun 19 12:30:59 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/create', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1384, '::1', 1559903481, 'Fri, 07 Jun 19 12:31:21 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/create', '[]', '{\"_csrf-backend\":\"wjRVq2jxtzZYlE9ewuZomY6JAWNCmmAcjTa4qnhWZ-eGbib0EKf6YwDAOTiDsw7u5s12PC_7TTG4QersKy4vtw==\",\"Page\":{\"title\":\"lioj\",\"summary\":\"ojoijoj\",\"desc\":\"<p>;okpokpk<\\/p>\\r\\n<p>fvfd<\\/p>\\r\\n<p>vd<\\/p>\\r\\n<p>vdf<\\/p>\",\"photo\":\"\",\"active\":\"1\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1385, '::1', 1559903506, 'Fri, 07 Jun 19 12:31:46 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/create', '[]', '{\"_csrf-backend\":\"wjRVq2jxtzZYlE9ewuZomY6JAWNCmmAcjTa4qnhWZ-eGbib0EKf6YwDAOTiDsw7u5s12PC_7TTG4QersKy4vtw==\",\"Page\":{\"title\":\"lioj\",\"summary\":\"ojoijoj\",\"desc\":\"<p>;okpokpk<\\/p>\\r\\n<p>fvfd<\\/p>\\r\\n<p>vd<\\/p>\\r\\n<p>vdf<\\/p>\",\"photo\":\"\",\"active\":\"1\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1386, '::1', 1559903546, 'Fri, 07 Jun 19 12:32:26 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/create', '[]', '{\"_csrf-backend\":\"wjRVq2jxtzZYlE9ewuZomY6JAWNCmmAcjTa4qnhWZ-eGbib0EKf6YwDAOTiDsw7u5s12PC_7TTG4QersKy4vtw==\",\"Page\":{\"title\":\"lioj\",\"summary\":\"ojoijoj\",\"desc\":\"<p>;okpokpk<\\/p>\\r\\n<p>fvfd<\\/p>\\r\\n<p>vd<\\/p>\\r\\n<p>vdf<\\/p>\",\"photo\":\"\",\"active\":\"1\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1387, '::1', 1559903569, 'Fri, 07 Jun 19 12:32:49 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/create', '[]', '{\"_csrf-backend\":\"wjRVq2jxtzZYlE9ewuZomY6JAWNCmmAcjTa4qnhWZ-eGbib0EKf6YwDAOTiDsw7u5s12PC_7TTG4QersKy4vtw==\",\"Page\":{\"title\":\"lioj\",\"summary\":\"ojoijoj\",\"desc\":\"<p>;okpokpk<\\/p>\\r\\n<p>fvfd<\\/p>\\r\\n<p>vd<\\/p>\\r\\n<p>vdf<\\/p>\",\"photo\":\"\",\"active\":\"1\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1388, '::1', 1559903580, 'Fri, 07 Jun 19 12:33:00 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/create', '[]', '{\"_csrf-backend\":\"wjRVq2jxtzZYlE9ewuZomY6JAWNCmmAcjTa4qnhWZ-eGbib0EKf6YwDAOTiDsw7u5s12PC_7TTG4QersKy4vtw==\",\"Page\":{\"title\":\"lioj\",\"summary\":\"ojoijoj\",\"desc\":\"<p>;okpokpk<\\/p>\\r\\n<p>fvfd<\\/p>\\r\\n<p>vd<\\/p>\\r\\n<p>vdf<\\/p>\",\"photo\":\"\",\"active\":\"1\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1389, '::1', 1559903581, 'Fri, 07 Jun 19 12:33:01 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/1', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1390, '::1', 1559903622, 'Fri, 07 Jun 19 12:33:42 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/1', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1391, '::1', 1559903679, 'Fri, 07 Jun 19 12:34:39 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/1', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1392, '::1', 1559903788, 'Fri, 07 Jun 19 12:36:28 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/1', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1393, '::1', 1559903788, 'Fri, 07 Jun 19 12:36:28 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=14', '{\"id\":\"14\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1394, '::1', 1559903820, 'Fri, 07 Jun 19 12:37:00 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/page/1', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1395, '::1', 1559903821, 'Fri, 07 Jun 19 12:37:01 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/file?id=14', '{\"id\":\"14\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1396, '::1', 1559904189, 'Fri, 07 Jun 19 12:43:09 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1397, '::1', 1559904227, 'Fri, 07 Jun 19 12:43:47 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/comment/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1398, '::1', 1559904232, 'Fri, 07 Jun 19 12:43:52 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/comment/manage/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1399, '::1', 1559904330, 'Fri, 07 Jun 19 12:45:30 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1400, '::1', 1559904355, 'Fri, 07 Jun 19 12:45:55 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1401, '::1', 1559904367, 'Fri, 07 Jun 19 12:46:07 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1402, '::1', 1559904392, 'Fri, 07 Jun 19 12:46:32 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1403, '::1', 1559904434, 'Fri, 07 Jun 19 12:47:14 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1404, '::1', 1559904467, 'Fri, 07 Jun 19 12:47:47 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1405, '::1', 1559904509, 'Fri, 07 Jun 19 12:48:29 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1406, '::1', 1559904541, 'Fri, 07 Jun 19 12:49:01 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1407, '::1', 1559904581, 'Fri, 07 Jun 19 12:49:41 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1408, '::1', 1559904662, 'Fri, 07 Jun 19 12:51:02 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1409, '::1', 1559904795, 'Fri, 07 Jun 19 12:53:15 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1410, '::1', 1559904809, 'Fri, 07 Jun 19 12:53:29 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1411, '::1', 1559904900, 'Fri, 07 Jun 19 12:55:00 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1412, '::1', 1559904923, 'Fri, 07 Jun 19 12:55:23 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1413, '::1', 1559905028, 'Fri, 07 Jun 19 12:57:08 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1414, '::1', 1559905114, 'Fri, 07 Jun 19 12:58:34 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/comment/manage/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1415, '::1', 1559915788, 'Fri, 07 Jun 19 15:56:28 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1416, '::1', 1559915875, 'Fri, 07 Jun 19 15:57:55 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1417, '::1', 1559915915, 'Fri, 07 Jun 19 15:58:35 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/gii/model', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1418, '::1', 1559915921, 'Fri, 07 Jun 19 15:58:41 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/gii/model', '[]', '{\"_csrf-backend\":\"-0kUtJdfBmTGl0I7GkeFhCl_0XKb6EscSzmHLKjNvBC_E2fr7wlLMZ7DNF1bEuPzQTumLfaJZjF-TtVq-7X0QA==\",\"Generator\":{\"tableName\":\"comment\",\"modelClass\":\"Comment\",\"standardizeCapitals\":\"0\",\"singularize\":\"0\",\"ns\":\"common\\\\models\",\"baseClass\":\"yii\\\\db\\\\ActiveRecord\",\"db\":\"db\",\"useTablePrefix\":\"0\",\"generateRelations\":\"all\",\"generateRelationsFromCurrentSchema\":\"1\",\"generateLabelsFromComments\":\"0\",\"generateQuery\":\"1\",\"queryNs\":\"common\\\\models\",\"queryClass\":\"CommentQuery\",\"queryBaseClass\":\"yii\\\\db\\\\ActiveQuery\",\"enableI18N\":\"0\",\"messageCategory\":\"app\",\"useSchemaName\":\"1\",\"template\":\"default\"},\"preview\":\"\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1419, '::1', 1559915926, 'Fri, 07 Jun 19 15:58:46 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/gii/model', '[]', '{\"_csrf-backend\":\"9v5IY49-KOW70WAuYRazmYuZaI7zcs6E7EEzWACEHliypDs89yhlsOOFFkggQ9Xu490f0Z4T46nZNmEeU_xWCA==\",\"Generator\":{\"tableName\":\"comment\",\"modelClass\":\"Comment\",\"standardizeCapitals\":\"0\",\"singularize\":\"0\",\"ns\":\"common\\\\models\",\"baseClass\":\"yii\\\\db\\\\ActiveRecord\",\"db\":\"db\",\"useTablePrefix\":\"0\",\"generateRelations\":\"all\",\"generateRelationsFromCurrentSchema\":\"1\",\"generateLabelsFromComments\":\"0\",\"generateQuery\":\"1\",\"queryNs\":\"common\\\\models\",\"queryClass\":\"CommentQuery\",\"queryBaseClass\":\"yii\\\\db\\\\ActiveQuery\",\"enableI18N\":\"0\",\"messageCategory\":\"app\",\"useSchemaName\":\"1\",\"template\":\"default\"},\"answers\":{\"19ff567acab15462b451dedac7828b77\":\"1\",\"03271033fd2461a6c792f5fd6adbde19\":\"1\"},\"generate\":\"\"}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1420, '::1', 1559915950, 'Fri, 07 Jun 19 15:59:10 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1421, '::1', 1559915960, 'Fri, 07 Jun 19 15:59:20 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1422, '::1', 1559915964, 'Fri, 07 Jun 19 15:59:24 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1423, '::1', 1559915986, 'Fri, 07 Jun 19 15:59:46 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1424, '::1', 1559916021, 'Fri, 07 Jun 19 16:00:21 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1425, '::1', 1559916248, 'Fri, 07 Jun 19 16:04:08 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1426, '::1', 1559916281, 'Fri, 07 Jun 19 16:04:41 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1427, '::1', 1559916296, 'Fri, 07 Jun 19 16:04:56 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1428, '::1', 1559916326, 'Fri, 07 Jun 19 16:05:26 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1429, '::1', 1559916338, 'Fri, 07 Jun 19 16:05:38 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1430, '::1', 1559916396, 'Fri, 07 Jun 19 16:06:36 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1431, '::1', 1559916700, 'Fri, 07 Jun 19 16:11:40 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1432, '::1', 1559916793, 'Fri, 07 Jun 19 16:13:13 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/comment/manage/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1433, '::1', 1559916811, 'Fri, 07 Jun 19 16:13:31 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/comment/manage/update?id=1', '{\"id\":\"1\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1434, '::1', 1559916818, 'Fri, 07 Jun 19 16:13:38 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/comment/manage/update?id=1', '{\"id\":\"1\"}', '{\"_csrf-backend\":\"kOiZE9tUainWIiKPA9WDUuIhm-ltW4k1_lWqHu_-JrvUsupMowInfI52VOlCgOUlimXstgA6pBjLIvhYvIZu6w==\",\"CommentModel\":{\"content\":\"test\",\"status\":\"0\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1435, '::1', 1559916818, 'Fri, 07 Jun 19 16:13:38 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/comment/manage/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1436, '::1', 1559916854, 'Fri, 07 Jun 19 16:14:14 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/comment/manage/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1437, '::1', 1559916857, 'Fri, 07 Jun 19 16:14:17 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/comment/manage/update?id=1', '{\"id\":\"1\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1438, '::1', 1559916863, 'Fri, 07 Jun 19 16:14:23 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/comment/manage/update?id=1', '{\"id\":\"1\"}', '{\"_csrf-backend\":\"U2nJpuRzS87IQ2W7p9YVApSvJtbNKRo0fOfbFX2R4LwXM7r5nCUGm5AXE93mg3N1_OtRiaBINxlJkIlTLumo7A==\",\"CommentModel\":{\"content\":\"test\",\"status\":\"1\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1439, '::1', 1559916864, 'Fri, 07 Jun 19 16:14:24 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/comment/manage/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1440, '::1', 1559917564, 'Fri, 07 Jun 19 16:26:04 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/comment/manage/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1441, '::1', 1559917568, 'Fri, 07 Jun 19 16:26:08 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1442, '::1', 1559922149, 'Fri, 07 Jun 19 17:42:29 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1443, '::1', 1559922164, 'Fri, 07 Jun 19 17:42:44 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/comment/manage/update?id=1', '{\"id\":\"1\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1444, '::1', 1559922207, 'Fri, 07 Jun 19 17:43:27 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/comment/manage/update?id=1', '{\"id\":\"1\"}', '{\"_csrf-backend\":\"3mA2027kiLH5PeHx8tYf6hj4zEzfb3PtpzvESNKFOlmaOkWMFrLF5KFpl5ezg3mdcLy7E7IOXsCSTJYOgf1yCQ==\",\"CommentModel\":{\"content\":\"test\",\"status\":\"2\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1445, '::1', 1559922208, 'Fri, 07 Jun 19 17:43:28 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/comment/manage/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1446, '::1', 1559922213, 'Fri, 07 Jun 19 17:43:33 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/comment/manage/update?id=1', '{\"id\":\"1\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1447, '::1', 1559922219, 'Fri, 07 Jun 19 17:43:39 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/comment/manage/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1448, '::1', 1559922222, 'Fri, 07 Jun 19 17:43:42 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/comment/manage/update?id=2', '{\"id\":\"2\"}', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1449, '::1', 1559922227, 'Fri, 07 Jun 19 17:43:47 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/comment/manage/update?id=2', '{\"id\":\"2\"}', '{\"_csrf-backend\":\"dW0xZ-NplE0Z5IQqAcf_mMtIqqTBnXhJzP3RIusCswIxN0I4mz_ZGEGw8kxAkpnvowzd-6z8VWT5ioNkuHr7Ug==\",\"CommentModel\":{\"content\":\"test\",\"status\":\"3\"}}', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'POST', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1450, '::1', 1559922227, 'Fri, 07 Jun 19 17:43:47 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/comment/manage/index', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1451, '::1', 1559922282, 'Fri, 07 Jun 19 17:44:42 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1452, '::1', 1559922938, 'Fri, 07 Jun 19 17:55:38 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1453, '::1', 1559923024, 'Fri, 07 Jun 19 17:57:04 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1454, '::1', 1559923027, 'Fri, 07 Jun 19 17:57:07 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1455, '::1', 1559923049, 'Fri, 07 Jun 19 17:57:29 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1456, '::1', 1559923283, 'Fri, 07 Jun 19 18:01:23 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1457, '::1', 1559923425, 'Fri, 07 Jun 19 18:03:45 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1458, '::1', 1559923499, 'Fri, 07 Jun 19 18:04:59 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1459, '::1', 1559923522, 'Fri, 07 Jun 19 18:05:22 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php/', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1460, '::1', 1559923636, 'Fri, 07 Jun 19 18:07:16 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');
INSERT INTO `logvisitor` VALUES (1461, '::1', 1559923682, 'Fri, 07 Jun 19 18:08:02 +0200', '/cmsSefroweb/crmSefroweb/backend/web/index.php', '[]', '[]', '{\"readOnly\":true}', '{\"flashParam\":\"__flash\",\"handler\":null}', 'GET', 'https', 'HTTP/1.1', '443', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0', 'en-US,en;q=0.5');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `menu_name` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`menu_id`) USING BTREE,
  INDEX `unique-index-menu-menu_name`(`menu_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '{\n    \"left\": [\n        {\n            \"label\": \"home\",\n            \"type\": \"link\"\n        }\n    ],\n    \"right\": []\n}', 'home');
INSERT INTO `menu` VALUES (2, '{\n    \"left\": [\n        {\n            \"label\": \"news\",\n            \"url\": \"news/index\",\n            \"type\": \"link\"\n        }\n    ],\n    \"right\": []\n}', 'news');

-- ----------------------------
-- Table structure for migration
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration`  (
  `version` varchar(180) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of migration
-- ----------------------------
INSERT INTO `migration` VALUES ('m000000_000000_base', 1554189347);
INSERT INTO `migration` VALUES ('m010101_100001_init_comment', 1554380283);
INSERT INTO `migration` VALUES ('m130524_201442_init', 1554189349);
INSERT INTO `migration` VALUES ('m140209_132017_init', 1554190895);
INSERT INTO `migration` VALUES ('m140403_174025_create_account_table', 1554190895);
INSERT INTO `migration` VALUES ('m140504_113157_update_tables', 1554190896);
INSERT INTO `migration` VALUES ('m140504_130429_create_token_table', 1554190897);
INSERT INTO `migration` VALUES ('m140506_102106_rbac_init', 1555057205);
INSERT INTO `migration` VALUES ('m140521_140055_page_item', 1554189932);
INSERT INTO `migration` VALUES ('m140830_171933_fix_ip_field', 1554190897);
INSERT INTO `migration` VALUES ('m140830_172703_change_account_table_name', 1554190897);
INSERT INTO `migration` VALUES ('m141018_105939_create_table_upload', 1554223504);
INSERT INTO `migration` VALUES ('m141129_130551_create_filemanager_mediafile_table', 1554571473);
INSERT INTO `migration` VALUES ('m141203_173402_create_filemanager_owners_table', 1554571473);
INSERT INTO `migration` VALUES ('m141203_175538_add_filemanager_owners_ref_mediafile_fk', 1554571473);
INSERT INTO `migration` VALUES ('m141222_110026_update_ip_field', 1554190897);
INSERT INTO `migration` VALUES ('m141222_135246_alter_username_length', 1554190897);
INSERT INTO `migration` VALUES ('m150614_103145_update_social_account_table', 1554190898);
INSERT INTO `migration` VALUES ('m150623_212711_fix_username_notnull', 1554190898);
INSERT INTO `migration` VALUES ('m151218_234654_add_timezone_to_profile', 1554190898);
INSERT INTO `migration` VALUES ('m160406_120743_onmotion_yii2_gallery', 1554202422);
INSERT INTO `migration` VALUES ('m160616_000010_add_filemanager_tags', 1554571473);
INSERT INTO `migration` VALUES ('m160629_121330_add_relatedTo_column_to_comment', 1554380283);
INSERT INTO `migration` VALUES ('m160929_103127_add_last_login_at_to_user_table', 1554190898);
INSERT INTO `migration` VALUES ('m161109_092304_rename_comment_table', 1554380283);
INSERT INTO `migration` VALUES ('m161114_094902_add_url_column_to_comment_table', 1554380283);
INSERT INTO `migration` VALUES ('m170101_000000_create_menu_table', 1554565077);
INSERT INTO `migration` VALUES ('m170101_000001_humanized_menu_name', 1554565077);
INSERT INTO `migration` VALUES ('m170809_141030_create_news_table', 1554202997);
INSERT INTO `migration` VALUES ('m170907_052038_rbac_add_index_on_auth_assignment_user_id', 1555057206);
INSERT INTO `migration` VALUES ('m180503_095540_add_desc_col', 1554202997);
INSERT INTO `migration` VALUES ('m180523_151638_rbac_updates_indexes_without_prefix', 1555057206);
INSERT INTO `migration` VALUES ('m190124_110200_add_verification_token_column_to_user_table', 1554189349);

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `date` int(11) NOT NULL,
  `date_update` int(11) DEFAULT NULL,
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` smallint(6) DEFAULT NULL,
  `publish_date` int(11) DEFAULT NULL,
  `active` smallint(6) DEFAULT NULL,
  `article` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (1, 'sdfsd', '<p>sdfsfsdfsf</p>', '5ca34ccf06d55.jpg', 0, 2147483647, 1554375672, '<p>sdfsd</p>\r\n<p>sdfsdfds</p>\r\n<p>sdfsffsfsd</p>', NULL, NULL, 0, NULL);
INSERT INTO `news` VALUES (2, 'sdf', '<p>fsdf</p>', '', 0, 0, NULL, '<p>sdf</p>', NULL, NULL, 1, NULL);
INSERT INTO `news` VALUES (3, 'fsd', '<p>sdfsdf</p>', '', 0, 1554191095, NULL, '<p>sdfsfsf</p>', NULL, NULL, 1, NULL);
INSERT INTO `news` VALUES (4, 'dfgdf', '<p>fdg</p>', '7', 0, 0, NULL, '<p><em><strong>fdgdfg</strong></em></p>', NULL, NULL, 0, NULL);
INSERT INTO `news` VALUES (5, 'afsdf', '<p>fsdf</p>', '', 0, 1559803169, NULL, '<p>sdfsdf</p>', NULL, NULL, 1, NULL);
INSERT INTO `news` VALUES (6, 'joij', '<p>ijoo</p>', '8', 0, 1559804463, NULL, '<p>joioij</p>', NULL, NULL, 0, NULL);
INSERT INTO `news` VALUES (7, 'jnni', '<p>nin</p>', '9', 0, 1559804567, 1559804595, '<p>npijij</p>', NULL, NULL, 0, NULL);
INSERT INTO `news` VALUES (8, 'klmlkm', '<p>kkkk</p>', '', 0, 1559805333, NULL, '<p>km</p>', NULL, NULL, 0, 1);
INSERT INTO `news` VALUES (9, 'fdgdgf', '<p>dfssdfsfgdg</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"../../../../../frontend/web//uploads/2019/05/lottery.png\" alt=\"sad\" width=\"600\" height=\"600\" /></p>', '', 0, 1559845461, 1559847027, '<p><a title=\"loo\" href=\"../../../../frontend/web/uploads/2019/05/lottery.png\">https://localhost/cmsSefroweb/crmSefroweb/frontend/web//uploads/2019/05/lottery.png</a></p>', NULL, NULL, 0, 0);

-- ----------------------------
-- Table structure for page
-- ----------------------------
DROP TABLE IF EXISTS `page`;
CREATE TABLE `page`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `summary` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `desc` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `active` tinyint(4) DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of page
-- ----------------------------
INSERT INTO `page` VALUES (1, 'lioj', 'ojoijoj', '<p>;okpokpk</p>\r\n<p>fvfd</p>\r\n<p>vd</p>\r\n<p>vdf</p>', 1, '14', 1559903581);

-- ----------------------------
-- Table structure for page_item
-- ----------------------------
DROP TABLE IF EXISTS `page_item`;
CREATE TABLE `page_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT 1,
  `rank` int(11) DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `brief` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `layout` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `visible` tinyint(1) DEFAULT 1,
  `page_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `page_description` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `page_keywords` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of page_item
-- ----------------------------
INSERT INTO `page_item` VALUES (1, 0, 0, 'Home page', NULL, NULL, NULL, NULL, '/', 'index', 0, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for profile
-- ----------------------------
DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile`  (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `public_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `timezone` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  CONSTRAINT `fk_user_profile` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of profile
-- ----------------------------
INSERT INTO `profile` VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `profile` VALUES (2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sle_banks
-- ----------------------------
DROP TABLE IF EXISTS `sle_banks`;
CREATE TABLE `sle_banks`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sle_cart
-- ----------------------------
DROP TABLE IF EXISTS `sle_cart`;
CREATE TABLE `sle_cart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `sessionID` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `sle_cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sle_cart
-- ----------------------------
INSERT INTO `sle_cart` VALUES (3, 2, 's36mrk8DSiIRl9kXgf3x5XSrfH0cpltV', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sle_cart` VALUES (4, NULL, 'QRaylBSRxMILNXVf4PtnldwT7Ya0zS8h', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sle_cart` VALUES (5, NULL, 'Cv1ryKrOLsC7zSObTOnvCQRSs1Zh8vKB', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sle_cartdetail
-- ----------------------------
DROP TABLE IF EXISTS `sle_cartdetail`;
CREATE TABLE `sle_cartdetail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cartID` int(11) DEFAULT NULL,
  `productID` int(11) DEFAULT NULL,
  `countNumber` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sle_cartdetail_ibfk_1`(`cartID`) USING BTREE,
  INDEX `sle_cartdetail_ibfk_2`(`productID`) USING BTREE,
  CONSTRAINT `sle_cartdetail_ibfk_1` FOREIGN KEY (`cartID`) REFERENCES `sle_cart` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sle_customer
-- ----------------------------
DROP TABLE IF EXISTS `sle_customer`;
CREATE TABLE `sle_customer`  (
  `id` int(11) NOT NULL,
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nationalCode` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `economicalCode` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `customerTypeID` int(11) DEFAULT NULL,
  `customerKindID` int(11) DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `customerTypeID`(`customerTypeID`) USING BTREE,
  INDEX `customerKindID`(`customerKindID`) USING BTREE,
  CONSTRAINT `sle_customer_ibfk_1` FOREIGN KEY (`customerTypeID`) REFERENCES `sle_customertypes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sle_customer_ibfk_2` FOREIGN KEY (`customerKindID`) REFERENCES `sle_customerkinds` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sle_customer
-- ----------------------------
INSERT INTO `sle_customer` VALUES (1066, NULL, NULL, '1231 23123123', NULL, NULL, 1, 1, 1, 0, '2017-05-07 11:34:38.000', NULL, 36, NULL);
INSERT INTO `sle_customer` VALUES (1067, NULL, NULL, 'Mohammad Saltanatpouri', NULL, NULL, 1, 1, 1, 0, '2017-05-07 13:50:23.000', NULL, 1038, NULL);
INSERT INTO `sle_customer` VALUES (1068, NULL, NULL, 'asda asdsad', NULL, NULL, 1, 1, 1, 0, '2017-05-08 10:36:55.000', NULL, 37, NULL);
INSERT INTO `sle_customer` VALUES (1069, NULL, NULL, 'سفش فثسف', NULL, NULL, 1, 1, 1, 0, '2017-05-31 08:51:07.000', NULL, 1039, NULL);
INSERT INTO `sle_customer` VALUES (1070, NULL, NULL, 'sdf sdfsf', NULL, NULL, 1, 1, 1, 0, '2017-05-31 09:48:53.000', NULL, 36, NULL);
INSERT INTO `sle_customer` VALUES (1071, NULL, NULL, 'سی سی', NULL, NULL, 1, 1, 1, 0, '2017-06-06 14:12:27.000', NULL, 3, NULL);
INSERT INTO `sle_customer` VALUES (1073, NULL, NULL, 'milad saltanatpouri', NULL, NULL, 1, 1, 1, 0, '2017-06-14 08:11:06.000', NULL, 1040, NULL);
INSERT INTO `sle_customer` VALUES (1074, NULL, NULL, ' ', NULL, NULL, 1, 1, 1, 0, '2017-06-14 11:06:04.000', NULL, 1042, NULL);
INSERT INTO `sle_customer` VALUES (1075, NULL, NULL, '1 2', NULL, NULL, 1, 1, 1, 0, '2017-07-05 08:28:36.000', NULL, 1, NULL);
INSERT INTO `sle_customer` VALUES (1076, NULL, NULL, 'milad saltanatpouri', NULL, NULL, 1, 1, 1, 0, '2017-07-05 15:50:32.000', NULL, 1044, NULL);
INSERT INTO `sle_customer` VALUES (1077, NULL, NULL, 'milad saltanatpouri', NULL, NULL, 1, 1, 1, 0, '2017-07-08 08:36:53.000', NULL, 1044, NULL);
INSERT INTO `sle_customer` VALUES (1078, NULL, NULL, 'milad saltanatpouri', NULL, NULL, 1, 1, 1, 0, '2017-07-08 09:43:20.000', NULL, 1044, NULL);
INSERT INTO `sle_customer` VALUES (1079, NULL, NULL, 'milad saltanatpouri', NULL, NULL, 1, 1, 1, 0, '2017-07-08 10:19:38.000', NULL, 1046, NULL);
INSERT INTO `sle_customer` VALUES (1080, NULL, NULL, 'milad saltanatpouri', NULL, NULL, 1, 1, 1, 0, '2017-07-08 10:19:44.000', NULL, 1046, NULL);
INSERT INTO `sle_customer` VALUES (1081, NULL, NULL, 'milad saltanatpouri', NULL, NULL, 1, 1, 1, 0, '2017-07-09 09:23:06.000', NULL, 1046, NULL);
INSERT INTO `sle_customer` VALUES (2077, NULL, NULL, 'asdasd asdad', NULL, NULL, 1, 1, 1, 0, '2017-11-12 12:18:52.000', NULL, 2, NULL);
INSERT INTO `sle_customer` VALUES (3077, NULL, NULL, 'milad saltanatpouri', NULL, NULL, 1, 1, 1, 0, '2018-01-16 15:45:23.000', NULL, 1046, NULL);

-- ----------------------------
-- Table structure for sle_customerkinds
-- ----------------------------
DROP TABLE IF EXISTS `sle_customerkinds`;
CREATE TABLE `sle_customerkinds`  (
  `id` int(11) NOT NULL,
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `isCompany` tinyint(4) DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sle_customerkinds
-- ----------------------------
INSERT INTO `sle_customerkinds` VALUES (1, NULL, 'حقیقی', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sle_customerkinds` VALUES (2, NULL, 'حقوقی', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sle_customertypes
-- ----------------------------
DROP TABLE IF EXISTS `sle_customertypes`;
CREATE TABLE `sle_customertypes`  (
  `id` int(11) NOT NULL,
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priceTypeID` int(11) DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `priceTypeID`(`priceTypeID`) USING BTREE,
  CONSTRAINT `sle_customertypes_ibfk_1` FOREIGN KEY (`priceTypeID`) REFERENCES `inv_productpricetypes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sle_customertypes
-- ----------------------------
INSERT INTO `sle_customertypes` VALUES (1, NULL, 'مشتریان فروشگاه اینترنتی', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sle_customertypes` VALUES (2, NULL, 'مشتریان عمده', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sle_orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `sle_orderdetail`;
CREATE TABLE `sle_orderdetail`  (
  `id` int(11) NOT NULL,
  `orderID` int(11) DEFAULT NULL,
  `productID` int(11) DEFAULT NULL,
  `amountPrice` double DEFAULT NULL COMMENT 'قیمت واحد',
  `countNumber` int(11) DEFAULT NULL COMMENT 'تعداد',
  `amountDiscount` double DEFAULT NULL COMMENT 'تخفیف واحد',
  `amoutTax` double DEFAULT NULL,
  `finalAmonutPrice` double DEFAULT NULL COMMENT 'قیمت کل بعد از تخفیف',
  `qtyPrize` int(11) DEFAULT NULL,
  `paymentTimeDays` int(11) DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `orderID`(`orderID`) USING BTREE,
  INDEX `productID`(`productID`) USING BTREE,
  CONSTRAINT `sle_orderdetail_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `sle_orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sle_orders
-- ----------------------------
DROP TABLE IF EXISTS `sle_orders`;
CREATE TABLE `sle_orders`  (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `contactID` int(11) DEFAULT NULL,
  `contactAddressID` int(11) DEFAULT NULL,
  `paymenttypeID` int(11) DEFAULT NULL,
  `paymentDetailID` int(11) DEFAULT NULL,
  `trackCode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `externalOrderCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `centerID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `centerID`(`centerID`) USING BTREE,
  INDEX `contactID`(`contactID`) USING BTREE,
  INDEX `contactAddressID`(`contactAddressID`) USING BTREE,
  INDEX `paymenttypeID`(`paymenttypeID`) USING BTREE,
  INDEX `paymentDetailID`(`paymentDetailID`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `sle_orders_ibfk_1` FOREIGN KEY (`centerID`) REFERENCES `glb_center` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sle_orders_ibfk_2` FOREIGN KEY (`contactID`) REFERENCES `crm_contacts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sle_orders_ibfk_3` FOREIGN KEY (`contactAddressID`) REFERENCES `crm_contactaddresses` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sle_orders_ibfk_4` FOREIGN KEY (`paymenttypeID`) REFERENCES `sle_paymenttypes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sle_orders_ibfk_5` FOREIGN KEY (`paymentDetailID`) REFERENCES `sle_paymentdetails` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sle_orders_ibfk_6` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sle_orderstatus
-- ----------------------------
DROP TABLE IF EXISTS `sle_orderstatus`;
CREATE TABLE `sle_orderstatus`  (
  `id` int(11) NOT NULL,
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` smallint(6) DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sle_orderstatus
-- ----------------------------
INSERT INTO `sle_orderstatus` VALUES (1, '1', 'تایید سفارش', 1, 1, 0, NULL, NULL, NULL, NULL, 'info');
INSERT INTO `sle_orderstatus` VALUES (2, '2', 'صدور فاکتور', 2, 1, 0, NULL, NULL, NULL, NULL, 'info');
INSERT INTO `sle_orderstatus` VALUES (3, '3', 'پردازش انبار', 3, 1, 0, NULL, NULL, NULL, NULL, 'info');
INSERT INTO `sle_orderstatus` VALUES (4, '4', 'ارسال سفارش', 4, 1, 0, NULL, NULL, NULL, NULL, 'success');
INSERT INTO `sle_orderstatus` VALUES (5, '5', 'دریافت توسط مشتری', 5, 1, 0, NULL, NULL, NULL, NULL, 'info');
INSERT INTO `sle_orderstatus` VALUES (6, '6', 'در حال بررسی', 6, 1, 0, NULL, NULL, NULL, NULL, 'danger');
INSERT INTO `sle_orderstatus` VALUES (7, '7', 'ارسال شده به سیستم مبنا', 7, 1, 0, NULL, NULL, NULL, NULL, 'warning');

-- ----------------------------
-- Table structure for sle_orderstatushistory
-- ----------------------------
DROP TABLE IF EXISTS `sle_orderstatushistory`;
CREATE TABLE `sle_orderstatushistory`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderID` int(11) DEFAULT NULL,
  `orderStatusID` int(11) DEFAULT NULL,
  `orderStatusChangeTime` datetime(3) DEFAULT NULL,
  `statusContactID` int(11) DEFAULT NULL,
  `orderStatusDesc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `orderID`(`orderID`) USING BTREE,
  INDEX `orderStatusID`(`orderStatusID`) USING BTREE,
  INDEX `statusContactID`(`statusContactID`) USING BTREE,
  CONSTRAINT `sle_orderstatushistory_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `sle_orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sle_orderstatushistory_ibfk_2` FOREIGN KEY (`orderStatusID`) REFERENCES `sle_orderstatus` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sle_orderstatushistory_ibfk_3` FOREIGN KEY (`statusContactID`) REFERENCES `crm_contacts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sle_paymentdetails
-- ----------------------------
DROP TABLE IF EXISTS `sle_paymentdetails`;
CREATE TABLE `sle_paymentdetails`  (
  `id` int(11) NOT NULL,
  `paymentTypeID` int(11) DEFAULT NULL,
  `transcationNumber` int(11) DEFAULT NULL,
  `bankID` int(11) DEFAULT NULL,
  `paymentTime` datetime(3) DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bankID`(`bankID`) USING BTREE,
  INDEX `paymentTypeID`(`paymentTypeID`) USING BTREE,
  CONSTRAINT `sle_paymentdetails_ibfk_1` FOREIGN KEY (`bankID`) REFERENCES `sle_banks` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sle_paymentdetails_ibfk_2` FOREIGN KEY (`paymentTypeID`) REFERENCES `sle_paymenttypes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sle_paymenttypes
-- ----------------------------
DROP TABLE IF EXISTS `sle_paymenttypes`;
CREATE TABLE `sle_paymenttypes`  (
  `id` int(11) NOT NULL,
  `paymentTypeName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sle_paymenttypes
-- ----------------------------
INSERT INTO `sle_paymenttypes` VALUES (1, 'پرداخت آنلاین', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sle_paymenttypes` VALUES (2, 'پوز در محل', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sle_saledocumentdtails
-- ----------------------------
DROP TABLE IF EXISTS `sle_saledocumentdtails`;
CREATE TABLE `sle_saledocumentdtails`  (
  `id` int(11) NOT NULL,
  `saleDocumentID` int(11) DEFAULT NULL,
  `productID` int(11) DEFAULT NULL,
  `invInventoryID` int(11) DEFAULT NULL,
  `orderDocumentDetailID` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `amountPrice` double DEFAULT NULL,
  `amountDiscount` double DEFAULT NULL,
  `amoutTax` double DEFAULT NULL,
  `finalAmonutPrice` double DEFAULT NULL,
  `paymentTimeDays` int(11) DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `invInventoryID`(`invInventoryID`) USING BTREE,
  INDEX `orderDocumentDetailID`(`orderDocumentDetailID`) USING BTREE,
  INDEX `productID`(`productID`) USING BTREE,
  INDEX `saleDocumentID`(`saleDocumentID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sle_saledocuments
-- ----------------------------
DROP TABLE IF EXISTS `sle_saledocuments`;
CREATE TABLE `sle_saledocuments`  (
  `id` int(11) NOT NULL,
  `invOperationID` int(11) DEFAULT NULL,
  `serial` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `subSerial` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `invInventoryID` int(11) DEFAULT NULL,
  `documentNo` int(11) DEFAULT NULL,
  `description` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `execTime` datetime(3) DEFAULT NULL,
  `amountDiscount` double DEFAULT NULL,
  `amountTax` double DEFAULT NULL,
  `amountAdditional` double DEFAULT NULL,
  `saleDocumentOrderID` int(11) DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `createdTime` datetime(3) DEFAULT NULL,
  `modifiedTime` datetime(3) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sle_saledocuments
-- ----------------------------
INSERT INTO `sle_saledocuments` VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for slider
-- ----------------------------
DROP TABLE IF EXISTS `slider`;
CREATE TABLE `slider`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `active` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `order` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for social_account
-- ----------------------------
DROP TABLE IF EXISTS `social_account`;
CREATE TABLE `social_account`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `data` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account_unique`(`provider`, `client_id`) USING BTREE,
  UNIQUE INDEX `account_unique_code`(`code`) USING BTREE,
  INDEX `fk_user_account`(`user_id`) USING BTREE,
  CONSTRAINT `fk_user_account` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for token
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token`  (
  `user_id` int(11) NOT NULL,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `type` smallint(6) NOT NULL,
  UNIQUE INDEX `token_unique`(`user_id`, `code`, `type`) USING BTREE,
  CONSTRAINT `fk_user_token` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of token
-- ----------------------------
INSERT INTO `token` VALUES (1, 'VYPlONftyH3ioTvV2JusVR62Fmz9KraI', 1554191095, 0);

-- ----------------------------
-- Table structure for uploaded_file
-- ----------------------------
DROP TABLE IF EXISTS `uploaded_file`;
CREATE TABLE `uploaded_file`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of uploaded_file
-- ----------------------------
INSERT INTO `uploaded_file` VALUES (1, 'coming_soon.png', 'E:\\xamppN\\htdocs\\cmsSefroweb\\cmsSefroweb\\common/upload\\5a\\a71cb079ca261d6f21130fe91ede11_coming_soon.png', 14656, 'image/png');
INSERT INTO `uploaded_file` VALUES (2, 'coming_soon.png', 'E:\\xamppN\\htdocs\\cmsSefroweb\\cmsSefroweb\\common/upload\\5f\\e7f8c0170f6c553115eb11c94bb0ac_coming_soon.png', 14656, 'image/png');
INSERT INTO `uploaded_file` VALUES (3, 'coming_soon.png', 'E:\\xamppN\\htdocs\\cmsSefroweb\\cmsSefroweb\\common/upload\\8e\\82a026232fb21387c420e5a3ef74ce_coming_soon.png', 14656, 'image/png');
INSERT INTO `uploaded_file` VALUES (4, 'IMG_7495.JPG', 'E:\\xamppN\\htdocs\\cmsSefroweb\\cmsSefroweb\\common/upload\\b4\\82c2a5752c2a2365fed0df1cca745c_IMG_7495.JPG', 11965, 'image/jpeg');
INSERT INTO `uploaded_file` VALUES (5, 'coming_soon.png', 'E:\\xamppN\\htdocs\\cmsSefroweb\\cmsSefroweb\\common/upload\\98\\dfad24e11d9d99ee81ef1b7e51adeb_coming_soon.png', 14656, 'image/png');
INSERT INTO `uploaded_file` VALUES (6, 'a.jpg', 'E:\\xamppN\\htdocs\\cmsSefroweb\\cmsSefroweb\\common/upload\\20\\4ecd74c07a3afc47ff3a54c320faac_a.jpg', 324760, 'image/jpeg');
INSERT INTO `uploaded_file` VALUES (7, 'a.jpg', 'E:\\xamppN\\htdocs\\cmsSefroweb\\cmsSefroweb\\common/upload\\f5\\d08fee7094b2d563a5572ea3dd7d26_a.jpg', 324760, 'image/jpeg');
INSERT INTO `uploaded_file` VALUES (8, 'lottery.jpg', 'E:\\xamppN\\htdocs\\cmsSefroweb\\crmSefroweb\\common/upload\\fd\\6331a5f27be0b759042edeabaa2cf8_lottery.jpg', 75434, 'image/jpeg');
INSERT INTO `uploaded_file` VALUES (9, 'lottery.jpg', 'E:\\xamppN\\htdocs\\cmsSefroweb\\crmSefroweb\\common/upload\\1c\\035c4bfde6299da76a072b922de78c_lottery.jpg', 75434, 'image/jpeg');
INSERT INTO `uploaded_file` VALUES (10, '2.jpg', 'E:\\xamppN\\htdocs\\cmsSefroweb\\crmSefroweb\\common/upload\\a9\\d098303405b7dc5dca9f9bb80743db_2.jpg', 173733, 'image/jpeg');
INSERT INTO `uploaded_file` VALUES (11, '2.jpg', 'E:\\xamppN\\htdocs\\cmsSefroweb\\crmSefroweb\\common/upload\\ca\\4dd4c3b311b9ffb9a78d91faa68211_2.jpg', 173733, 'image/jpeg');
INSERT INTO `uploaded_file` VALUES (12, '2.jpg', 'E:\\xamppN\\htdocs\\cmsSefroweb\\crmSefroweb\\common/upload\\cb\\a019e007e0f869ba177f47670da193_2.jpg', 173733, 'image/jpeg');
INSERT INTO `uploaded_file` VALUES (13, '2.jpg', 'E:\\xamppN\\htdocs\\cmsSefroweb\\crmSefroweb\\common/upload\\88\\0b2bd43b851cfc3e98291f3dabe94c_2.jpg', 173733, 'image/jpeg');
INSERT INTO `uploaded_file` VALUES (14, '2.jpg', 'E:\\xamppN\\htdocs\\cmsSefroweb\\crmSefroweb\\common/upload\\71\\cf6f17037c23149f43cd60384791e9_2.jpg', 173733, 'image/jpeg');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `confirmed_at` int(11) DEFAULT NULL,
  `unconfirmed_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `registration_ip` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `flags` int(11) NOT NULL DEFAULT 0,
  `last_login_at` int(11) DEFAULT NULL,
  `status` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_unique_username`(`username`) USING BTREE,
  UNIQUE INDEX `user_unique_email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'mysaltern@gmail.com', '$2y$10$pKM50Zds4bMpE7u8S8Uk2uTN2o6hgZRMQFpKBiId9Ouxz8r/xOUE.', 'C4a8r6cbPbRCW9oL7D6eNWWw-XhgsB7e', 1, NULL, NULL, '::1', 1554191095, 1554191095, 0, 1559900811, 20);
INSERT INTO `user` VALUES (2, 'asdad', 'dasdad@asdasd.com', '$2y$10$99Ff6dkENeIZ/Brnsd0xfOAhn/es9XYacHXUotio27QwcrLZGafdW', 'nGGXZz5MB4EI6Q3BSxFOGLe0VmgNlxPx', 1555059198, NULL, NULL, '::1', 1555059198, 1555059198, 0, NULL, NULL);

-- ----------------------------
-- Table structure for user2
-- ----------------------------
DROP TABLE IF EXISTS `user2`;
CREATE TABLE `user2`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 10,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `verification_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE,
  UNIQUE INDEX `password_reset_token`(`password_reset_token`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
