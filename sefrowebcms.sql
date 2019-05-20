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

 Date: 14/05/2019 16:13:01
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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 'cdaec8da', 2, 'test', NULL, 1, 1, 1, 'common\\models\\News:2', '/cmsSefroweb/cmsSefroweb/backend/web/index.php/news/index', 1, 1554380749, 1554381857);

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
) ENGINE = InnoDB AUTO_INCREMENT = 632 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '{\n    \"left\": [\n        {\n            \"label\": \"home\",\n            \"type\": \"link\"\n        }\n    ],\n    \"right\": []\n}', 'home');

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (1, 'sdfsd', '<p>sdfsfsdfsf</p>', '5ca34ccf06d55.jpg', 0, 2147483647, 1554375672, '<p>sdfsd</p>\r\n<p>sdfsdfds</p>\r\n<p>sdfsffsfsd</p>', NULL, NULL, 0);
INSERT INTO `news` VALUES (2, 'sdf', '<p>fsdf</p>', '', 0, 0, NULL, '<p>sdf</p>', NULL, NULL, 1);
INSERT INTO `news` VALUES (3, 'fsd', '<p>sdfsdf</p>', '', 0, 1554191095, NULL, '<p>sdfsfsf</p>', NULL, NULL, 1);
INSERT INTO `news` VALUES (4, 'dfgdf', '<p>fdg</p>', '7', 0, 0, NULL, '<p><em><strong>fdgdfg</strong></em></p>', NULL, NULL, 0);

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
-- Records of sle_orders
-- ----------------------------
INSERT INTO `sle_orders` VALUES (1081, 36, 74, 1041, NULL, NULL, NULL, 1, 0, '2017-06-04 11:40:49.000', NULL, 36, NULL, NULL, NULL);
INSERT INTO `sle_orders` VALUES (1082, 1039, 73, 1036, NULL, NULL, NULL, 1, 0, '2017-06-06 10:31:09.000', NULL, 1039, NULL, NULL, NULL);
INSERT INTO `sle_orders` VALUES (1083, 3, 75, 1042, NULL, NULL, NULL, 1, 0, '2017-06-07 07:42:21.000', NULL, 3, NULL, NULL, NULL);
INSERT INTO `sle_orders` VALUES (1084, 3, 75, 1042, NULL, NULL, NULL, 1, 0, '2017-06-07 07:57:23.000', NULL, 3, NULL, NULL, NULL);
INSERT INTO `sle_orders` VALUES (1085, 34, 76, 1044, NULL, NULL, NULL, 1, 0, '2017-06-07 08:46:38.000', NULL, 34, NULL, NULL, NULL);
INSERT INTO `sle_orders` VALUES (1086, 1038, 71, 1033, NULL, NULL, NULL, 1, 0, '2017-06-07 09:10:02.000', NULL, 1038, NULL, NULL, NULL);
INSERT INTO `sle_orders` VALUES (1087, 1038, 71, 1033, NULL, NULL, NULL, 1, 0, '2017-06-07 09:24:00.000', NULL, 1038, NULL, NULL, NULL);
INSERT INTO `sle_orders` VALUES (1088, 1038, 71, 1033, NULL, NULL, NULL, 1, 0, '2017-06-07 09:24:33.000', NULL, 1038, NULL, NULL, NULL);
INSERT INTO `sle_orders` VALUES (1089, 1038, 71, 1033, NULL, NULL, NULL, 1, 0, '2017-06-07 09:27:37.000', NULL, 1038, NULL, NULL, NULL);
INSERT INTO `sle_orders` VALUES (1090, 1038, 71, 1033, NULL, NULL, NULL, 1, 0, '2017-06-07 09:28:40.000', NULL, 1038, NULL, NULL, NULL);
INSERT INTO `sle_orders` VALUES (1091, 1038, 71, 1033, NULL, NULL, NULL, 1, 0, '2017-06-07 09:28:43.000', NULL, 1038, NULL, NULL, NULL);
INSERT INTO `sle_orders` VALUES (1092, 1038, 71, 1033, NULL, NULL, NULL, 1, 0, '2017-06-07 09:40:54.000', NULL, 1038, NULL, NULL, NULL);
INSERT INTO `sle_orders` VALUES (1093, 1038, 71, 1033, NULL, NULL, NULL, 1, 0, '2017-06-07 09:41:08.000', NULL, 1038, NULL, NULL, NULL);
INSERT INTO `sle_orders` VALUES (1094, 1038, 71, 1033, NULL, NULL, NULL, 1, 0, '2017-06-07 09:43:34.000', NULL, 1038, NULL, NULL, NULL);
INSERT INTO `sle_orders` VALUES (1095, 1038, 71, 1033, NULL, NULL, NULL, 1, 0, '2017-06-07 09:56:38.000', NULL, 1038, NULL, NULL, NULL);
INSERT INTO `sle_orders` VALUES (1096, 1038, 71, 1033, NULL, NULL, NULL, 1, 0, '2017-06-07 09:57:52.000', NULL, 1038, NULL, NULL, NULL);
INSERT INTO `sle_orders` VALUES (1097, 1038, 71, 1033, NULL, NULL, NULL, 1, 0, '2017-06-07 09:58:00.000', NULL, 1038, NULL, NULL, NULL);
INSERT INTO `sle_orders` VALUES (1098, 1038, 71, 1033, NULL, NULL, NULL, 1, 0, '2017-06-07 10:00:29.000', NULL, 1038, NULL, NULL, NULL);
INSERT INTO `sle_orders` VALUES (1104, 1038, 71, 1045, NULL, NULL, NULL, 1, 0, '2017-06-07 11:50:05.000', NULL, 1038, NULL, NULL, NULL);
INSERT INTO `sle_orders` VALUES (1105, 1039, 73, 1036, NULL, NULL, NULL, 1, 0, '2017-06-20 07:20:48.000', NULL, 1039, NULL, NULL, NULL);
INSERT INTO `sle_orders` VALUES (1106, 36, 74, 1041, NULL, NULL, NULL, 1, 0, '2017-08-16 14:41:16.000', NULL, 36, NULL, NULL, NULL);
INSERT INTO `sle_orders` VALUES (1107, 1038, 71, 2058, NULL, NULL, NULL, 1, 0, '2017-08-20 10:50:41.000', NULL, 1038, NULL, NULL, NULL);
INSERT INTO `sle_orders` VALUES (1108, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sle_orders` VALUES (1109, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sle_orders` VALUES (1110, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sle_orders` VALUES (1111, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sle_orders` VALUES (1112, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sle_orders` VALUES (1113, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sle_orders` VALUES (1114, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sle_orders` VALUES (1115, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sle_orders` VALUES (1116, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sle_orders` VALUES (1117, 1038, 71, 1033, NULL, NULL, NULL, 1, 0, '2017-09-10 11:27:20.000', NULL, 1038, NULL, NULL, NULL);
INSERT INTO `sle_orders` VALUES (1118, 1038, 71, 1033, NULL, NULL, NULL, 1, 0, '2017-09-10 11:27:32.000', NULL, 1038, NULL, NULL, NULL);
INSERT INTO `sle_orders` VALUES (1119, 1038, 71, 1033, NULL, NULL, NULL, 1, 0, '2017-09-10 11:28:30.000', NULL, 1038, NULL, NULL, NULL);
INSERT INTO `sle_orders` VALUES (1120, 1038, 71, 1033, NULL, NULL, NULL, 1, 0, '2017-09-10 11:53:27.000', NULL, 1038, NULL, NULL, NULL);
INSERT INTO `sle_orders` VALUES (1121, 1038, 71, 1033, NULL, NULL, NULL, 1, 0, '2017-09-10 12:02:59.000', NULL, 1038, NULL, NULL, NULL);
INSERT INTO `sle_orders` VALUES (1122, 1038, 71, 1033, NULL, NULL, NULL, 1, 0, '2017-09-10 12:03:10.000', NULL, 1038, NULL, NULL, NULL);
INSERT INTO `sle_orders` VALUES (1123, 1038, 71, 1033, NULL, NULL, NULL, 1, 0, '2017-09-10 12:03:34.000', NULL, 1038, NULL, NULL, NULL);
INSERT INTO `sle_orders` VALUES (1124, 1038, 71, 1033, NULL, NULL, NULL, 1, 0, '2017-09-10 12:03:55.000', NULL, 1038, NULL, NULL, NULL);
INSERT INTO `sle_orders` VALUES (1125, 1038, 71, 1033, NULL, NULL, NULL, 1, 0, '2017-09-10 12:03:59.000', NULL, 1038, NULL, NULL, NULL);
INSERT INTO `sle_orders` VALUES (1126, 1038, 71, 1033, NULL, NULL, NULL, 1, 0, '2017-09-10 12:12:09.000', NULL, 1038, NULL, NULL, NULL);
INSERT INTO `sle_orders` VALUES (1127, 1038, 71, 1033, NULL, NULL, NULL, 1, 0, '2017-09-10 12:12:26.000', NULL, 1038, NULL, NULL, NULL);
INSERT INTO `sle_orders` VALUES (1128, 1038, 71, 1033, NULL, NULL, NULL, 1, 0, '2017-09-10 12:13:11.000', NULL, 1038, NULL, NULL, NULL);
INSERT INTO `sle_orders` VALUES (1129, 1038, 71, 1033, NULL, NULL, NULL, 1, 0, '2017-09-10 12:13:14.000', NULL, 1038, NULL, NULL, NULL);
INSERT INTO `sle_orders` VALUES (1130, 1038, 71, 1033, NULL, NULL, NULL, 1, 0, '2017-09-10 12:20:40.000', NULL, 1038, NULL, '1', NULL);
INSERT INTO `sle_orders` VALUES (1131, 2, 84, NULL, NULL, NULL, NULL, 1, 0, '2017-11-14 06:54:33.000', NULL, 2, NULL, NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sle_orderstatushistory
-- ----------------------------
INSERT INTO `sle_orderstatushistory` VALUES (1, 1125, 6, NULL, 84, NULL, 1, NULL, '2018-05-15 12:02:16.000', NULL, 2, NULL);
INSERT INTO `sle_orderstatushistory` VALUES (11, 1130, 7, NULL, 84, NULL, 1, NULL, '2017-10-24 09:41:25.000', '2017-10-24 14:44:14.000', 2, 2);
INSERT INTO `sle_orderstatushistory` VALUES (12, 1126, 5, NULL, 84, NULL, 1, NULL, '2017-10-24 14:33:42.000', '2017-10-29 07:39:54.000', 2, 2);
INSERT INTO `sle_orderstatushistory` VALUES (13, 1125, 6, NULL, 84, NULL, 1, NULL, '2017-10-31 08:03:01.000', NULL, 2, NULL);
INSERT INTO `sle_orderstatushistory` VALUES (14, 1125, 7, NULL, 84, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sle_orderstatushistory` VALUES (15, 1081, 6, NULL, 84, NULL, 1, NULL, '2017-11-05 11:31:03.000', NULL, 2, NULL);
INSERT INTO `sle_orderstatushistory` VALUES (16, 1082, 6, NULL, 84, NULL, 1, NULL, '2017-11-05 11:36:12.000', NULL, 2, NULL);
INSERT INTO `sle_orderstatushistory` VALUES (17, 1113, 6, NULL, 84, NULL, 1, NULL, '2018-05-15 12:05:31.000', NULL, 2, NULL);
INSERT INTO `sle_orderstatushistory` VALUES (18, 1107, 6, NULL, 84, NULL, 1, NULL, '2018-05-15 12:05:42.000', NULL, 2, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
INSERT INTO `user` VALUES (1, 'admin', 'mysaltern@gmail.com', '$2y$10$pKM50Zds4bMpE7u8S8Uk2uTN2o6hgZRMQFpKBiId9Ouxz8r/xOUE.', 'C4a8r6cbPbRCW9oL7D6eNWWw-XhgsB7e', 1, NULL, NULL, '::1', 1554191095, 1554191095, 0, 1557830884, 10);
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