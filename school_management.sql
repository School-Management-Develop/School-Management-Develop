/*
 Navicat Premium Data Transfer

 Source Server         : System host
 Source Server Type    : MySQL
 Source Server Version : 80039
 Source Host           : db-a148084b-9e8f-450b-b6e0-8b9c052d202e.ap-southeast-1.public.db.laravel.cloud:3306
 Source Schema         : main

 Target Server Type    : MySQL
 Target Server Version : 80039
 File Encoding         : 65001

 Date: 21/04/2026 16:09:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for borrows
-- ----------------------------
DROP TABLE IF EXISTS `borrows`;
CREATE TABLE `borrows`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `student_id` bigint UNSIGNED NOT NULL,
  `item_id` bigint UNSIGNED NOT NULL,
  `qty` int UNSIGNED NOT NULL DEFAULT 1,
  `borrow_date` datetime NOT NULL,
  `due_date` date NULL DEFAULT NULL,
  `return_date` datetime NULL DEFAULT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'BORROWED',
  `call_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'not_yet_called',
  `call_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `called_at` timestamp NULL DEFAULT NULL,
  `called_by` bigint UNSIGNED NULL DEFAULT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `approved_by` bigint UNSIGNED NULL DEFAULT NULL,
  `returned_by` bigint UNSIGNED NULL DEFAULT NULL,
  `return_notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `condition` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `borrows_student_id_index`(`student_id` ASC) USING BTREE,
  INDEX `borrows_item_id_index`(`item_id` ASC) USING BTREE,
  INDEX `borrows_status_index`(`status` ASC) USING BTREE,
  INDEX `borrows_approved_by_foreign`(`approved_by` ASC) USING BTREE,
  INDEX `borrows_returned_by_foreign`(`returned_by` ASC) USING BTREE,
  INDEX `borrows_called_by_foreign`(`called_by` ASC) USING BTREE,
  INDEX `borrows_deleted_by_foreign`(`deleted_by` ASC) USING BTREE,
  CONSTRAINT `borrows_approved_by_foreign` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `borrows_called_by_foreign` FOREIGN KEY (`called_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `borrows_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `borrows_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`Itemid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `borrows_returned_by_foreign` FOREIGN KEY (`returned_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `borrows_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of borrows
-- ----------------------------
INSERT INTO `borrows` VALUES (75, 54, 1, 2, '2026-04-20 08:45:15', NULL, '2026-04-20 12:19:00', 'RETURNED', 'not_yet_called', NULL, NULL, NULL, NULL, 9, 7, NULL, 'Good', '2026-04-20 08:45:15', '2026-04-20 12:19:26', NULL, NULL);
INSERT INTO `borrows` VALUES (76, 55, 1, 2, '2026-04-20 09:05:56', NULL, '2026-04-20 11:52:00', 'RETURNED', 'not_yet_called', NULL, NULL, NULL, NULL, 9, 7, NULL, 'Good', '2026-04-20 09:05:56', '2026-04-20 11:52:44', NULL, NULL);
INSERT INTO `borrows` VALUES (77, 56, 1, 2, '2026-04-20 09:11:50', NULL, '2026-04-20 11:47:00', 'RETURNED', 'not_yet_called', NULL, NULL, NULL, NULL, 2, 14, NULL, 'Good', '2026-04-20 09:11:50', '2026-04-20 11:47:25', NULL, NULL);
INSERT INTO `borrows` VALUES (78, 57, 1, 3, '2026-04-20 10:27:14', NULL, '2026-04-20 11:47:00', 'RETURNED', 'not_yet_called', NULL, NULL, NULL, NULL, 2, 14, NULL, 'Good', '2026-04-20 10:27:14', '2026-04-20 11:47:38', NULL, NULL);
INSERT INTO `borrows` VALUES (79, 58, 1, 1, '2026-04-20 11:49:46', NULL, '2026-04-20 16:48:00', 'RETURNED', 'not_yet_called', NULL, NULL, NULL, NULL, 7, 7, NULL, 'Good', '2026-04-20 11:49:46', '2026-04-20 16:49:02', NULL, NULL);
INSERT INTO `borrows` VALUES (80, 59, 1, 1, '2026-04-20 13:14:30', NULL, '2026-04-20 16:10:00', 'RETURNED', 'not_yet_called', NULL, NULL, NULL, 'អរគុណ', 7, 7, NULL, 'Good', '2026-04-20 13:14:30', '2026-04-20 16:11:08', NULL, NULL);
INSERT INTO `borrows` VALUES (81, 60, 1, 1, '2026-04-20 13:18:45', NULL, '2026-04-20 16:18:00', 'RETURNED', 'not_yet_called', NULL, NULL, NULL, NULL, 7, 7, NULL, 'Good', '2026-04-20 13:18:45', '2026-04-20 16:18:10', NULL, NULL);
INSERT INTO `borrows` VALUES (82, 61, 1, 1, '2026-04-20 13:33:32', NULL, '2026-04-20 16:15:00', 'RETURNED', 'not_yet_called', NULL, NULL, NULL, NULL, 7, 7, NULL, 'Good', '2026-04-20 13:33:32', '2026-04-20 16:15:45', NULL, NULL);
INSERT INTO `borrows` VALUES (83, 62, 1, 1, '2026-04-20 13:43:56', NULL, '2026-04-20 17:20:00', 'RETURNED', 'not_yet_called', NULL, NULL, NULL, NULL, 7, 7, NULL, 'Good', '2026-04-20 13:43:56', '2026-04-20 17:20:11', NULL, NULL);
INSERT INTO `borrows` VALUES (84, 63, 1, 1, '2026-04-20 13:54:51', NULL, '2026-04-20 17:18:00', 'RETURNED', 'not_yet_called', NULL, NULL, NULL, NULL, 7, 7, NULL, 'Good', '2026-04-20 13:54:51', '2026-04-20 17:18:14', NULL, NULL);
INSERT INTO `borrows` VALUES (85, 64, 1, 2, '2026-04-20 14:41:26', NULL, '2026-04-20 17:13:00', 'RETURNED', 'not_yet_called', NULL, NULL, NULL, NULL, 7, 7, NULL, 'Good', '2026-04-20 14:41:26', '2026-04-20 17:13:54', NULL, NULL);
INSERT INTO `borrows` VALUES (86, 66, 1, 1, '2026-04-20 17:48:52', NULL, '2026-04-20 20:42:00', 'RETURNED', 'not_yet_called', NULL, NULL, NULL, NULL, 7, 3, NULL, 'Good', '2026-04-20 17:48:52', '2026-04-20 20:42:36', NULL, NULL);
INSERT INTO `borrows` VALUES (87, 67, 1, 1, '2026-04-20 18:59:40', NULL, '2026-04-20 20:42:00', 'RETURNED', 'not_yet_called', NULL, NULL, NULL, NULL, 3, 3, NULL, 'Good', '2026-04-20 18:59:40', '2026-04-20 20:43:29', NULL, NULL);
INSERT INTO `borrows` VALUES (88, 68, 9, 1, '2026-04-21 06:48:35', NULL, NULL, 'BORROWED', 'not_yet_called', NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, '2026-04-21 06:48:35', '2026-04-21 13:45:19', '2026-04-21 13:45:19', 7);
INSERT INTO `borrows` VALUES (89, 42, 1, 1, '2026-04-21 07:10:43', NULL, '2026-04-21 11:43:00', 'RETURNED', 'not_yet_called', NULL, NULL, NULL, NULL, 3, 1, NULL, 'Good', '2026-04-21 07:10:43', '2026-04-21 11:43:43', NULL, NULL);
INSERT INTO `borrows` VALUES (90, 69, 1, 2, '2026-04-21 07:12:40', NULL, '2026-04-21 11:43:00', 'RETURNED', 'not_yet_called', NULL, NULL, NULL, NULL, 6, 1, NULL, 'Good', '2026-04-21 07:12:40', '2026-04-21 11:43:29', NULL, NULL);
INSERT INTO `borrows` VALUES (91, 70, 1, 1, '2026-04-21 07:34:08', NULL, '2026-04-21 10:20:00', 'RETURNED', 'not_yet_called', NULL, NULL, NULL, NULL, 12, 9, NULL, 'Good', '2026-04-21 07:34:08', '2026-04-21 10:20:33', NULL, NULL);
INSERT INTO `borrows` VALUES (92, 58, 1, 1, '2026-04-21 08:46:24', NULL, '2026-04-21 10:11:00', 'RETURNED', 'not_yet_called', NULL, NULL, NULL, NULL, 2, 9, NULL, 'Good', '2026-04-21 08:46:24', '2026-04-21 10:18:44', NULL, NULL);
INSERT INTO `borrows` VALUES (93, 71, 1, 2, '2026-04-21 08:46:45', NULL, '2026-04-21 11:47:00', 'RETURNED', 'not_yet_called', NULL, NULL, NULL, NULL, 2, 1, NULL, 'Good', '2026-04-21 08:46:45', '2026-04-21 11:52:19', NULL, NULL);
INSERT INTO `borrows` VALUES (94, 72, 1, 2, '2026-04-21 09:04:25', NULL, '2026-04-21 11:43:00', 'RETURNED', 'not_yet_called', NULL, NULL, NULL, NULL, 9, 1, NULL, 'Good', '2026-04-21 09:04:25', '2026-04-21 11:43:16', NULL, NULL);
INSERT INTO `borrows` VALUES (95, 73, 1, 2, '2026-04-21 10:11:20', NULL, '2026-04-21 11:44:00', 'RETURNED', 'not_yet_called', NULL, NULL, NULL, NULL, 9, 1, NULL, 'Good', '2026-04-21 10:11:20', '2026-04-21 11:44:54', NULL, NULL);
INSERT INTO `borrows` VALUES (96, 74, 1, 1, '2026-04-21 10:29:08', NULL, '2026-04-21 11:47:00', 'RETURNED', 'not_yet_called', NULL, NULL, NULL, NULL, 6, 1, NULL, 'Good', '2026-04-21 10:29:08', '2026-04-21 11:47:07', NULL, NULL);
INSERT INTO `borrows` VALUES (97, 75, 1, 1, '2026-04-21 12:56:10', NULL, NULL, 'BORROWED', 'not_yet_called', NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, '2026-04-21 12:56:10', '2026-04-21 12:56:10', NULL, NULL);
INSERT INTO `borrows` VALUES (98, 76, 1, 1, '2026-04-21 13:21:07', NULL, '2026-04-21 15:00:00', 'RETURNED', 'not_yet_called', NULL, NULL, NULL, NULL, 7, 7, NULL, 'Good', '2026-04-21 13:21:07', '2026-04-21 15:01:00', NULL, NULL);
INSERT INTO `borrows` VALUES (99, 77, 1, 1, '2026-04-21 14:34:38', NULL, NULL, 'BORROWED', 'not_yet_called', NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, '2026-04-21 14:34:38', '2026-04-21 14:34:38', NULL, NULL);

-- ----------------------------
-- Table structure for cache
-- ----------------------------
DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache`  (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`) USING BTREE,
  INDEX `cache_expiration_index`(`expiration` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cache
-- ----------------------------

-- ----------------------------
-- Table structure for cache_locks
-- ----------------------------
DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE `cache_locks`  (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`) USING BTREE,
  INDEX `cache_locks_expiration_index`(`expiration` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cache_locks
-- ----------------------------

-- ----------------------------
-- Table structure for deleted_items
-- ----------------------------
DROP TABLE IF EXISTS `deleted_items`;
CREATE TABLE `deleted_items`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `deleted_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of deleted_items
-- ----------------------------

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for groups
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups`  (
  `group_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`group_id`) USING BTREE,
  UNIQUE INDEX `groups_group_name_unique`(`group_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 196 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of groups
-- ----------------------------
INSERT INTO `groups` VALUES (37, 'DU3', '2026-03-01 23:42:54', '2026-03-01 23:42:54');
INSERT INTO `groups` VALUES (38, 'DU1', '2026-03-01 23:42:54', '2026-03-01 23:42:54');
INSERT INTO `groups` VALUES (39, 'DU10', '2026-03-01 23:42:54', '2026-03-01 23:42:54');
INSERT INTO `groups` VALUES (40, 'DU7', '2026-03-01 23:42:54', '2026-03-01 23:42:54');
INSERT INTO `groups` VALUES (41, 'DU5', '2026-03-01 23:42:54', '2026-03-01 23:42:54');
INSERT INTO `groups` VALUES (42, 'DU2.6', '2026-03-01 23:42:54', '2026-03-01 23:42:54');
INSERT INTO `groups` VALUES (43, 'DU15', '2026-03-01 23:42:54', '2026-03-01 23:42:54');
INSERT INTO `groups` VALUES (44, 'DU13.14', '2026-03-01 23:42:54', '2026-03-01 23:42:54');
INSERT INTO `groups` VALUES (45, 'DU4', '2026-03-01 23:42:54', '2026-03-01 23:42:54');
INSERT INTO `groups` VALUES (46, 'DU8', '2026-03-01 23:42:54', '2026-03-01 23:42:54');
INSERT INTO `groups` VALUES (47, 'SU1.2', '2026-03-01 23:44:18', '2026-03-01 23:44:18');
INSERT INTO `groups` VALUES (48, 'SU3', '2026-03-01 23:44:18', '2026-03-01 23:44:18');
INSERT INTO `groups` VALUES (49, 'SU4.13', '2026-03-01 23:44:18', '2026-03-01 23:44:18');
INSERT INTO `groups` VALUES (50, 'SU5', '2026-03-01 23:44:18', '2026-03-01 23:44:18');
INSERT INTO `groups` VALUES (51, 'SU6', '2026-03-01 23:44:18', '2026-03-01 23:44:18');
INSERT INTO `groups` VALUES (52, 'SU7.9', '2026-03-01 23:44:18', '2026-03-01 23:44:18');
INSERT INTO `groups` VALUES (53, 'SU8', '2026-03-01 23:44:18', '2026-03-01 23:44:18');
INSERT INTO `groups` VALUES (54, 'SU10', '2026-03-01 23:44:18', '2026-03-01 23:44:18');
INSERT INTO `groups` VALUES (55, 'SU14.23', '2026-03-01 23:44:18', '2026-03-01 23:44:18');
INSERT INTO `groups` VALUES (56, 'SU15', '2026-03-01 23:44:18', '2026-03-01 23:44:18');
INSERT INTO `groups` VALUES (57, 'SU20', '2026-03-01 23:44:18', '2026-03-01 23:44:18');
INSERT INTO `groups` VALUES (58, 'SU24.34', '2026-03-01 23:44:18', '2026-03-01 23:44:18');
INSERT INTO `groups` VALUES (59, 'SU25', '2026-03-01 23:44:18', '2026-03-01 23:44:18');
INSERT INTO `groups` VALUES (60, 'SU30', '2026-03-01 23:44:18', '2026-03-01 23:44:18');
INSERT INTO `groups` VALUES (61, 'SU33.53', '2026-03-01 23:44:18', '2026-03-01 23:44:18');
INSERT INTO `groups` VALUES (62, 'SU35', '2026-03-01 23:44:18', '2026-03-01 23:44:18');
INSERT INTO `groups` VALUES (63, 'SU40', '2026-03-01 23:44:18', '2026-03-01 23:44:18');
INSERT INTO `groups` VALUES (64, 'SU43.44', '2026-03-01 23:44:18', '2026-03-01 23:44:18');
INSERT INTO `groups` VALUES (65, 'SU54', '2026-03-01 23:44:18', '2026-03-01 23:44:18');
INSERT INTO `groups` VALUES (66, 'SV1', '2026-03-01 23:45:35', '2026-03-01 23:45:35');
INSERT INTO `groups` VALUES (67, 'SV2.6', '2026-03-01 23:45:35', '2026-03-01 23:45:35');
INSERT INTO `groups` VALUES (68, 'SV3', '2026-03-01 23:45:35', '2026-03-01 23:45:35');
INSERT INTO `groups` VALUES (69, 'SV4.14', '2026-03-01 23:45:35', '2026-03-01 23:45:35');
INSERT INTO `groups` VALUES (70, 'SV5', '2026-03-01 23:45:35', '2026-03-01 23:45:35');
INSERT INTO `groups` VALUES (71, 'SV7', '2026-03-01 23:45:35', '2026-03-01 23:45:35');
INSERT INTO `groups` VALUES (72, 'SV8.16', '2026-03-01 23:45:35', '2026-03-01 23:45:35');
INSERT INTO `groups` VALUES (73, 'SV9', '2026-03-01 23:45:35', '2026-03-01 23:45:35');
INSERT INTO `groups` VALUES (74, 'SV10', '2026-03-01 23:45:35', '2026-03-01 23:45:35');
INSERT INTO `groups` VALUES (75, 'SV11.12', '2026-03-01 23:45:35', '2026-03-01 23:45:35');
INSERT INTO `groups` VALUES (76, 'SV13.23', '2026-03-01 23:45:35', '2026-03-01 23:45:35');
INSERT INTO `groups` VALUES (77, 'SV15', '2026-03-01 23:45:35', '2026-03-01 23:45:35');
INSERT INTO `groups` VALUES (78, 'SV20', '2026-03-01 23:45:35', '2026-03-01 23:45:35');
INSERT INTO `groups` VALUES (79, 'SV24.33', '2026-03-01 23:45:35', '2026-03-01 23:45:35');
INSERT INTO `groups` VALUES (80, 'SV25', '2026-03-01 23:45:35', '2026-03-01 23:45:35');
INSERT INTO `groups` VALUES (81, 'SV30', '2026-03-01 23:45:35', '2026-03-01 23:45:35');
INSERT INTO `groups` VALUES (82, 'SV34', '2026-03-01 23:45:35', '2026-03-01 23:45:35');
INSERT INTO `groups` VALUES (83, 'SV35', '2026-03-01 23:45:35', '2026-03-01 23:45:35');
INSERT INTO `groups` VALUES (84, 'SV40', '2026-03-01 23:45:35', '2026-03-01 23:45:35');
INSERT INTO `groups` VALUES (85, 'SV45', '2026-03-01 23:45:35', '2026-03-01 23:45:35');
INSERT INTO `groups` VALUES (86, 'SV50', '2026-03-01 23:45:35', '2026-03-01 23:45:35');
INSERT INTO `groups` VALUES (87, 'SW1', '2026-03-01 23:47:06', '2026-03-01 23:47:06');
INSERT INTO `groups` VALUES (88, 'SW2', '2026-03-01 23:47:06', '2026-03-01 23:47:06');
INSERT INTO `groups` VALUES (89, 'SW3', '2026-03-01 23:47:06', '2026-03-01 23:47:06');
INSERT INTO `groups` VALUES (90, 'SW4', '2026-03-01 23:47:06', '2026-03-01 23:47:06');
INSERT INTO `groups` VALUES (91, 'SW5', '2026-03-01 23:47:06', '2026-03-01 23:47:06');
INSERT INTO `groups` VALUES (92, 'SW6', '2026-03-01 23:47:06', '2026-03-01 23:47:06');
INSERT INTO `groups` VALUES (93, 'SW7', '2026-03-01 23:47:06', '2026-03-01 23:47:06');
INSERT INTO `groups` VALUES (94, 'SW8', '2026-03-01 23:47:06', '2026-03-01 23:47:06');
INSERT INTO `groups` VALUES (95, 'SW9', '2026-03-01 23:47:06', '2026-03-01 23:47:06');
INSERT INTO `groups` VALUES (96, 'SW10', '2026-03-01 23:47:06', '2026-03-01 23:47:06');
INSERT INTO `groups` VALUES (97, 'SW11', '2026-03-01 23:47:06', '2026-03-01 23:47:06');
INSERT INTO `groups` VALUES (98, 'SW13', '2026-03-01 23:47:06', '2026-03-01 23:47:06');
INSERT INTO `groups` VALUES (99, 'SW14', '2026-03-01 23:47:06', '2026-03-01 23:47:06');
INSERT INTO `groups` VALUES (100, 'SW15', '2026-03-01 23:47:06', '2026-03-01 23:47:06');
INSERT INTO `groups` VALUES (101, 'SW20', '2026-03-01 23:47:06', '2026-03-01 23:47:06');
INSERT INTO `groups` VALUES (102, 'SW23', '2026-03-01 23:47:06', '2026-03-01 23:47:06');
INSERT INTO `groups` VALUES (103, 'SW24', '2026-03-01 23:47:06', '2026-03-01 23:47:06');
INSERT INTO `groups` VALUES (104, 'SW25', '2026-03-01 23:47:06', '2026-03-01 23:47:06');
INSERT INTO `groups` VALUES (105, 'SW30', '2026-03-01 23:47:06', '2026-03-01 23:47:06');
INSERT INTO `groups` VALUES (106, 'SW33', '2026-03-01 23:47:06', '2026-03-01 23:47:06');
INSERT INTO `groups` VALUES (107, 'SW34', '2026-03-01 23:47:06', '2026-03-01 23:47:06');
INSERT INTO `groups` VALUES (108, 'SW35', '2026-03-01 23:47:06', '2026-03-01 23:47:06');
INSERT INTO `groups` VALUES (109, 'SW40', '2026-03-01 23:47:06', '2026-03-01 23:47:06');
INSERT INTO `groups` VALUES (110, 'SW43', '2026-03-01 23:47:06', '2026-03-01 23:47:06');
INSERT INTO `groups` VALUES (111, 'SX1', '2026-03-01 23:47:45', '2026-03-01 23:47:45');
INSERT INTO `groups` VALUES (112, 'SX2', '2026-03-01 23:47:45', '2026-03-01 23:47:45');
INSERT INTO `groups` VALUES (113, 'SX3', '2026-03-01 23:47:45', '2026-03-01 23:47:45');
INSERT INTO `groups` VALUES (114, 'SX4', '2026-03-01 23:47:45', '2026-03-01 23:47:45');
INSERT INTO `groups` VALUES (115, 'SX5', '2026-03-01 23:47:45', '2026-03-01 23:47:45');
INSERT INTO `groups` VALUES (116, 'SX6', '2026-03-01 23:47:45', '2026-03-01 23:47:45');
INSERT INTO `groups` VALUES (117, 'SX7', '2026-03-01 23:47:45', '2026-03-01 23:47:45');
INSERT INTO `groups` VALUES (118, 'SX8', '2026-03-01 23:47:45', '2026-03-01 23:47:45');
INSERT INTO `groups` VALUES (119, 'SX9', '2026-03-01 23:47:45', '2026-03-01 23:47:45');
INSERT INTO `groups` VALUES (120, 'SX10', '2026-03-01 23:47:45', '2026-03-01 23:47:45');
INSERT INTO `groups` VALUES (121, 'SX11', '2026-03-01 23:47:45', '2026-03-01 23:47:45');
INSERT INTO `groups` VALUES (122, 'SX12', '2026-03-01 23:47:45', '2026-03-01 23:47:45');
INSERT INTO `groups` VALUES (123, 'SX13', '2026-03-01 23:47:45', '2026-03-01 23:47:45');
INSERT INTO `groups` VALUES (124, 'SX14', '2026-03-01 23:47:45', '2026-03-01 23:47:45');
INSERT INTO `groups` VALUES (125, 'SX15', '2026-03-01 23:47:45', '2026-03-01 23:47:45');
INSERT INTO `groups` VALUES (126, 'SX16', '2026-03-01 23:47:45', '2026-03-01 23:47:45');
INSERT INTO `groups` VALUES (127, 'SX17', '2026-03-01 23:47:45', '2026-03-01 23:47:45');
INSERT INTO `groups` VALUES (128, 'SX18', '2026-03-01 23:47:45', '2026-03-01 23:47:45');
INSERT INTO `groups` VALUES (129, 'SX20', '2026-03-01 23:47:45', '2026-03-01 23:47:45');
INSERT INTO `groups` VALUES (130, 'SX23', '2026-03-01 23:47:45', '2026-03-01 23:47:45');
INSERT INTO `groups` VALUES (131, 'SX24', '2026-03-01 23:47:45', '2026-03-01 23:47:45');
INSERT INTO `groups` VALUES (132, 'SX25', '2026-03-01 23:47:45', '2026-03-01 23:47:45');
INSERT INTO `groups` VALUES (133, 'SX33', '2026-03-01 23:47:45', '2026-03-01 23:47:45');
INSERT INTO `groups` VALUES (134, 'SX34', '2026-03-01 23:47:45', '2026-03-01 23:47:45');
INSERT INTO `groups` VALUES (135, 'DV1', '2026-03-01 23:48:49', '2026-03-01 23:48:49');
INSERT INTO `groups` VALUES (136, 'DV2', '2026-03-01 23:48:49', '2026-03-01 23:48:49');
INSERT INTO `groups` VALUES (137, 'DV3', '2026-03-01 23:48:49', '2026-03-01 23:48:49');
INSERT INTO `groups` VALUES (138, 'DV4', '2026-03-01 23:48:49', '2026-03-01 23:48:49');
INSERT INTO `groups` VALUES (139, 'DV5', '2026-03-01 23:48:49', '2026-03-01 23:48:49');
INSERT INTO `groups` VALUES (140, 'DV6', '2026-03-01 23:48:49', '2026-03-01 23:48:49');
INSERT INTO `groups` VALUES (141, 'DV7', '2026-03-01 23:48:49', '2026-03-01 23:48:49');
INSERT INTO `groups` VALUES (142, 'DV8', '2026-03-01 23:48:49', '2026-03-01 23:48:49');
INSERT INTO `groups` VALUES (143, 'DV10', '2026-03-01 23:48:49', '2026-03-01 23:48:49');
INSERT INTO `groups` VALUES (144, 'DV13', '2026-03-01 23:48:49', '2026-03-01 23:48:49');
INSERT INTO `groups` VALUES (145, 'DV15', '2026-03-01 23:48:49', '2026-03-01 23:48:49');
INSERT INTO `groups` VALUES (146, 'DW1', '2026-03-01 23:49:16', '2026-03-01 23:49:16');
INSERT INTO `groups` VALUES (147, 'DW2', '2026-03-01 23:49:16', '2026-03-01 23:49:16');
INSERT INTO `groups` VALUES (148, 'DW3', '2026-03-01 23:49:16', '2026-03-01 23:49:16');
INSERT INTO `groups` VALUES (149, 'DW4', '2026-03-01 23:49:16', '2026-03-01 23:49:16');
INSERT INTO `groups` VALUES (150, 'DW5', '2026-03-01 23:49:16', '2026-03-01 23:49:16');
INSERT INTO `groups` VALUES (151, 'DW6', '2026-03-01 23:49:16', '2026-03-01 23:49:16');
INSERT INTO `groups` VALUES (152, 'DW7', '2026-03-01 23:49:16', '2026-03-01 23:49:16');
INSERT INTO `groups` VALUES (153, 'DW10', '2026-03-01 23:49:16', '2026-03-01 23:49:16');
INSERT INTO `groups` VALUES (154, 'DW13', '2026-03-01 23:49:16', '2026-03-01 23:49:16');
INSERT INTO `groups` VALUES (155, 'DW14', '2026-03-01 23:49:16', '2026-03-01 23:49:16');
INSERT INTO `groups` VALUES (156, 'DW15', '2026-03-01 23:49:16', '2026-03-01 23:49:16');
INSERT INTO `groups` VALUES (157, 'DW20', '2026-03-01 23:49:16', '2026-03-01 23:49:16');
INSERT INTO `groups` VALUES (158, 'DX1', '2026-03-01 23:50:03', '2026-03-01 23:50:03');
INSERT INTO `groups` VALUES (159, 'DX2', '2026-03-01 23:50:03', '2026-03-01 23:50:03');
INSERT INTO `groups` VALUES (160, 'DX3', '2026-03-01 23:50:03', '2026-03-01 23:50:03');
INSERT INTO `groups` VALUES (161, 'DX4', '2026-03-01 23:50:03', '2026-03-01 23:50:03');
INSERT INTO `groups` VALUES (162, 'DX5', '2026-03-01 23:50:03', '2026-03-01 23:50:03');
INSERT INTO `groups` VALUES (163, 'DX6', '2026-03-01 23:50:03', '2026-03-01 23:50:03');
INSERT INTO `groups` VALUES (164, 'DX7', '2026-03-01 23:50:03', '2026-03-01 23:50:03');
INSERT INTO `groups` VALUES (165, 'DX8', '2026-03-01 23:50:03', '2026-03-01 23:50:03');
INSERT INTO `groups` VALUES (166, 'DX10', '2026-03-01 23:50:03', '2026-03-01 23:50:03');
INSERT INTO `groups` VALUES (167, 'DX13', '2026-03-01 23:50:03', '2026-03-01 23:50:03');
INSERT INTO `groups` VALUES (168, 'ASK1', '2026-03-01 23:50:41', '2026-03-01 23:50:41');
INSERT INTO `groups` VALUES (169, 'ASK2', '2026-03-01 23:50:41', '2026-03-01 23:50:41');
INSERT INTO `groups` VALUES (170, 'ASK3', '2026-03-01 23:50:41', '2026-03-01 23:50:41');
INSERT INTO `groups` VALUES (171, 'ASK4', '2026-03-01 23:50:41', '2026-03-01 23:50:41');
INSERT INTO `groups` VALUES (172, 'ASK5', '2026-03-01 23:50:41', '2026-03-01 23:50:41');
INSERT INTO `groups` VALUES (173, 'ASK10', '2026-03-01 23:50:41', '2026-03-01 23:50:41');
INSERT INTO `groups` VALUES (174, 'ADK1', '2026-03-01 23:51:09', '2026-03-01 23:51:09');
INSERT INTO `groups` VALUES (175, 'ADK3', '2026-03-01 23:51:09', '2026-03-01 23:51:09');
INSERT INTO `groups` VALUES (176, 'ADK5', '2026-03-01 23:51:09', '2026-03-01 23:51:09');
INSERT INTO `groups` VALUES (177, 'ASL1', '2026-03-01 23:51:42', '2026-03-01 23:51:42');
INSERT INTO `groups` VALUES (178, 'ASL2', '2026-03-01 23:51:42', '2026-03-01 23:51:42');
INSERT INTO `groups` VALUES (179, 'ASL3', '2026-03-01 23:51:42', '2026-03-01 23:51:42');
INSERT INTO `groups` VALUES (180, 'ASL4', '2026-03-01 23:51:42', '2026-03-01 23:51:42');
INSERT INTO `groups` VALUES (181, 'ASL5', '2026-03-01 23:51:42', '2026-03-01 23:51:42');
INSERT INTO `groups` VALUES (182, 'ASL6', '2026-03-01 23:51:42', '2026-03-01 23:51:42');
INSERT INTO `groups` VALUES (183, 'ASL10', '2026-03-01 23:51:42', '2026-03-01 23:51:42');
INSERT INTO `groups` VALUES (184, 'ADL1', '2026-03-01 23:52:14', '2026-03-01 23:52:14');
INSERT INTO `groups` VALUES (185, 'ADL5', '2026-03-01 23:52:14', '2026-03-01 23:52:14');
INSERT INTO `groups` VALUES (186, 'SBP1', '2026-03-01 23:53:05', '2026-03-01 23:53:05');
INSERT INTO `groups` VALUES (187, 'SBP2', '2026-03-01 23:53:05', '2026-03-01 23:53:05');
INSERT INTO `groups` VALUES (188, 'SBP3', '2026-03-01 23:53:05', '2026-03-01 23:53:05');
INSERT INTO `groups` VALUES (189, 'SBP5', '2026-03-01 23:53:05', '2026-03-01 23:53:05');
INSERT INTO `groups` VALUES (190, 'SBO1', '2026-03-01 23:53:30', '2026-03-01 23:53:30');
INSERT INTO `groups` VALUES (191, 'SBO5', '2026-03-01 23:53:30', '2026-03-01 23:53:30');
INSERT INTO `groups` VALUES (192, 'SBN1', '2026-03-01 23:53:52', '2026-03-01 23:53:52');
INSERT INTO `groups` VALUES (193, 'SR4.13.3', '2026-03-28 17:23:19', '2026-03-28 17:23:19');
INSERT INTO `groups` VALUES (194, 'SS10', '2026-03-28 17:23:53', '2026-03-28 17:23:53');
INSERT INTO `groups` VALUES (195, 'DV3.4', '2026-04-20 13:32:43', '2026-04-20 13:32:43');

-- ----------------------------
-- Table structure for item_histories
-- ----------------------------
DROP TABLE IF EXISTS `item_histories`;
CREATE TABLE `item_histories`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `borrow_id` bigint UNSIGNED NULL DEFAULT NULL,
  `student_id` bigint UNSIGNED NULL DEFAULT NULL,
  `item_id` bigint UNSIGNED NULL DEFAULT NULL,
  `user_id` bigint UNSIGNED NULL DEFAULT NULL,
  `approved_by` bigint UNSIGNED NULL DEFAULT NULL,
  `returned_by` bigint UNSIGNED NULL DEFAULT NULL,
  `action` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `action_at` datetime NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `item_histories_borrow_id_index`(`borrow_id` ASC) USING BTREE,
  INDEX `item_histories_student_id_index`(`student_id` ASC) USING BTREE,
  INDEX `item_histories_item_id_index`(`item_id` ASC) USING BTREE,
  INDEX `item_histories_user_id_index`(`user_id` ASC) USING BTREE,
  INDEX `item_histories_approved_by_index`(`approved_by` ASC) USING BTREE,
  INDEX `item_histories_returned_by_index`(`returned_by` ASC) USING BTREE,
  INDEX `item_histories_action_index`(`action` ASC) USING BTREE,
  CONSTRAINT `item_histories_approved_by_foreign` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `item_histories_borrow_id_foreign` FOREIGN KEY (`borrow_id`) REFERENCES `borrows` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `item_histories_returned_by_foreign` FOREIGN KEY (`returned_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `item_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 130 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item_histories
-- ----------------------------
INSERT INTO `item_histories` VALUES (83, 75, 54, 1, 9, 9, NULL, 'Borrowed', 'Long borrowed 2 x Socket for កុសល សករ៉ា.', '2026-04-20 08:45:15', '2026-04-20 08:45:15', '2026-04-20 08:45:15');
INSERT INTO `item_histories` VALUES (84, 76, 55, 1, 9, 9, NULL, 'Borrowed', 'Long borrowed 2 x Socket for លីម គីមថេង.', '2026-04-20 09:05:56', '2026-04-20 09:05:56', '2026-04-20 09:05:56');
INSERT INTO `item_histories` VALUES (85, 77, 56, 1, 2, 2, NULL, 'Borrowed', 'Piseth borrowed 2 x Socket for Neat Somnang.', '2026-04-20 09:11:50', '2026-04-20 09:11:50', '2026-04-20 09:11:50');
INSERT INTO `item_histories` VALUES (86, 78, 57, 1, 2, 2, NULL, 'Borrowed', 'Piseth borrowed 3 x Socket for ឌុល ពុទ្ធារី.', '2026-04-20 10:27:14', '2026-04-20 10:27:14', '2026-04-20 10:27:14');
INSERT INTO `item_histories` VALUES (87, 77, 56, 1, 14, 2, 14, 'Returned', 'In returned 2 x Socket from Neat Somnang.', '2026-04-20 11:47:00', '2026-04-20 11:47:25', '2026-04-20 11:47:25');
INSERT INTO `item_histories` VALUES (88, 78, 57, 1, 14, 2, 14, 'Returned', 'In returned 3 x Socket from ឌុល ពុទ្ធារី.', '2026-04-20 11:47:00', '2026-04-20 11:47:38', '2026-04-20 11:47:38');
INSERT INTO `item_histories` VALUES (89, 79, 58, 1, 7, 7, NULL, 'Borrowed', 'Vanchha borrowed 1 x Socket for Chork socheata.', '2026-04-20 11:49:46', '2026-04-20 11:49:46', '2026-04-20 11:49:46');
INSERT INTO `item_histories` VALUES (90, 76, 55, 1, 7, 9, 7, 'Returned', 'Vanchha returned 2 x Socket from លីម គីមថេង.', '2026-04-20 11:52:00', '2026-04-20 11:52:44', '2026-04-20 11:52:44');
INSERT INTO `item_histories` VALUES (91, 75, 54, 1, 7, 9, 7, 'Returned', 'Vanchha returned 2 x Socket from កុសល សករ៉ា.', '2026-04-20 12:19:00', '2026-04-20 12:19:26', '2026-04-20 12:19:26');
INSERT INTO `item_histories` VALUES (92, 80, 59, 1, 7, 7, NULL, 'Borrowed', 'Vanchha borrowed 1 x Socket for ជឹម ជៀម.', '2026-04-20 13:14:30', '2026-04-20 13:14:30', '2026-04-20 13:14:30');
INSERT INTO `item_histories` VALUES (93, 81, 60, 1, 7, 7, NULL, 'Borrowed', 'Vanchha borrowed 1 x Socket for Ngiemchansreng.', '2026-04-20 13:18:45', '2026-04-20 13:18:45', '2026-04-20 13:18:45');
INSERT INTO `item_histories` VALUES (94, 82, 61, 1, 7, 7, NULL, 'Borrowed', 'Vanchha borrowed 1 x Socket for Te LyYou.', '2026-04-20 13:33:32', '2026-04-20 13:33:32', '2026-04-20 13:33:32');
INSERT INTO `item_histories` VALUES (95, 83, 62, 1, 7, 7, NULL, 'Borrowed', 'Vanchha borrowed 1 x Socket for Rom thanun.', '2026-04-20 13:43:56', '2026-04-20 13:43:56', '2026-04-20 13:43:56');
INSERT INTO `item_histories` VALUES (96, 84, 63, 1, 7, 7, NULL, 'Borrowed', 'Vanchha borrowed 1 x Socket for Mout navy.', '2026-04-20 13:54:51', '2026-04-20 13:54:51', '2026-04-20 13:54:51');
INSERT INTO `item_histories` VALUES (97, 85, 64, 1, 7, 7, NULL, 'Borrowed', 'Vanchha borrowed 2 x Socket for Oum keotraiveth.', '2026-04-20 14:41:26', '2026-04-20 14:41:26', '2026-04-20 14:41:26');
INSERT INTO `item_histories` VALUES (98, 80, 59, 1, 7, 7, 7, 'Returned', 'Vanchha returned 1 x ព្រី from ជឹម ជៀម.', '2026-04-20 16:10:00', '2026-04-20 16:11:08', '2026-04-20 16:11:08');
INSERT INTO `item_histories` VALUES (99, 82, 61, 1, 7, 7, 7, 'Returned', 'Vanchha returned 1 x Socket from Te LyYou.', '2026-04-20 16:15:00', '2026-04-20 16:15:45', '2026-04-20 16:15:45');
INSERT INTO `item_histories` VALUES (100, 81, 60, 1, 7, 7, 7, 'Returned', 'Vanchha returned 1 x Socket from Ngiemchansreng.', '2026-04-20 16:18:00', '2026-04-20 16:18:10', '2026-04-20 16:18:10');
INSERT INTO `item_histories` VALUES (101, 79, 58, 1, 7, 7, 7, 'Returned', 'Vanchha returned 1 x Socket from Chork socheata.', '2026-04-20 16:48:00', '2026-04-20 16:49:02', '2026-04-20 16:49:02');
INSERT INTO `item_histories` VALUES (102, 85, 64, 1, 7, 7, 7, 'Returned', 'Vanchha returned 2 x Socket from Oum keotraiveth.', '2026-04-20 17:13:00', '2026-04-20 17:13:54', '2026-04-20 17:13:54');
INSERT INTO `item_histories` VALUES (103, 84, 63, 1, 7, 7, 7, 'Returned', 'Vanchha returned 1 x Socket from Mout navy.', '2026-04-20 17:18:00', '2026-04-20 17:18:14', '2026-04-20 17:18:14');
INSERT INTO `item_histories` VALUES (104, 83, 62, 1, 7, 7, 7, 'Returned', 'Vanchha returned 1 x Socket from Rom thanun.', '2026-04-20 17:20:00', '2026-04-20 17:20:11', '2026-04-20 17:20:11');
INSERT INTO `item_histories` VALUES (105, 86, 66, 1, 7, 7, NULL, 'Borrowed', 'Vanchha borrowed 1 x Socket for Sombo phanit.', '2026-04-20 17:48:52', '2026-04-20 17:48:52', '2026-04-20 17:48:52');
INSERT INTO `item_histories` VALUES (106, 87, 67, 1, 3, 3, NULL, 'Borrowed', 'Fouy borrowed 1 x Socket for ម៉ាន់ ពៅ.', '2026-04-20 18:59:40', '2026-04-20 18:59:40', '2026-04-20 18:59:40');
INSERT INTO `item_histories` VALUES (107, 86, 66, 1, 3, 7, 3, 'Returned', 'Fouy returned 1 x ព្រី from Sombo phanit.', '2026-04-20 20:42:00', '2026-04-20 20:42:36', '2026-04-20 20:42:36');
INSERT INTO `item_histories` VALUES (108, 87, 67, 1, 3, 3, 3, 'Returned', 'Fouy returned 1 x ព្រី from ម៉ាន់ ពៅ.', '2026-04-20 20:42:00', '2026-04-20 20:43:29', '2026-04-20 20:43:29');
INSERT INTO `item_histories` VALUES (109, 88, 68, 9, 6, 6, NULL, 'Borrowed', 'Sothea borrowed 1 x other for Chhorn Sothea.', '2026-04-21 06:48:35', '2026-04-21 06:48:35', '2026-04-21 06:48:35');
INSERT INTO `item_histories` VALUES (110, 89, 42, 1, 3, 3, NULL, 'Borrowed', 'Fouy borrowed 1 x Socket for Mann Yivfouy.', '2026-04-21 07:10:43', '2026-04-21 07:10:43', '2026-04-21 07:10:43');
INSERT INTO `item_histories` VALUES (111, 90, 69, 1, 6, 6, NULL, 'Borrowed', 'Sothea borrowed 2 x Socket for Srun Bun Visoth.', '2026-04-21 07:12:40', '2026-04-21 07:12:40', '2026-04-21 07:12:40');
INSERT INTO `item_histories` VALUES (112, 91, 70, 1, 12, 12, NULL, 'Borrowed', 'Sothun borrowed 1 x Socket for Soeun seavmeng.', '2026-04-21 07:34:08', '2026-04-21 07:34:08', '2026-04-21 07:34:08');
INSERT INTO `item_histories` VALUES (113, 92, 58, 1, 2, 2, NULL, 'Borrowed', 'Piseth borrowed 1 x Socket for Chork socheata.', '2026-04-21 08:46:24', '2026-04-21 08:46:24', '2026-04-21 08:46:24');
INSERT INTO `item_histories` VALUES (114, 93, 71, 1, 2, 2, NULL, 'Borrowed', 'Piseth borrowed 2 x Socket for Savon Dara Sann.', '2026-04-21 08:46:45', '2026-04-21 08:46:45', '2026-04-21 08:46:45');
INSERT INTO `item_histories` VALUES (115, 94, 72, 1, 9, 9, NULL, 'Borrowed', 'Long borrowed 2 x Socket for Chea sokty.', '2026-04-21 09:04:25', '2026-04-21 09:04:25', '2026-04-21 09:04:25');
INSERT INTO `item_histories` VALUES (116, 95, 73, 1, 9, 9, NULL, 'Borrowed', 'Long borrowed 2 x Socket for Heng mengleap.', '2026-04-21 10:11:20', '2026-04-21 10:11:20', '2026-04-21 10:11:20');
INSERT INTO `item_histories` VALUES (117, 92, 58, 1, 9, 2, 9, 'Returned', 'Long returned 1 x Socket from Chork socheata.', '2026-04-21 10:11:00', '2026-04-21 10:18:44', '2026-04-21 10:18:44');
INSERT INTO `item_histories` VALUES (118, 91, 70, 1, 9, 12, 9, 'Returned', 'Long returned 1 x Socket from Soeun seavmeng.', '2026-04-21 10:20:00', '2026-04-21 10:20:33', '2026-04-21 10:20:33');
INSERT INTO `item_histories` VALUES (119, 96, 74, 1, 6, 6, NULL, 'Borrowed', 'Sothea borrowed 1 x Socket for Rin SREYYA.', '2026-04-21 10:29:08', '2026-04-21 10:29:08', '2026-04-21 10:29:08');
INSERT INTO `item_histories` VALUES (120, 94, 72, 1, 1, 9, 1, 'Returned', 'Chivorn returned 2 x Socket from Chea sokty.', '2026-04-21 11:43:00', '2026-04-21 11:43:16', '2026-04-21 11:43:16');
INSERT INTO `item_histories` VALUES (121, 90, 69, 1, 1, 6, 1, 'Returned', 'Chivorn returned 2 x Socket from Srun Bun Visoth.', '2026-04-21 11:43:00', '2026-04-21 11:43:29', '2026-04-21 11:43:29');
INSERT INTO `item_histories` VALUES (122, 89, 42, 1, 1, 3, 1, 'Returned', 'Chivorn returned 1 x Socket from Mann Yivfouy.', '2026-04-21 11:43:00', '2026-04-21 11:43:43', '2026-04-21 11:43:43');
INSERT INTO `item_histories` VALUES (123, 95, 73, 1, 1, 9, 1, 'Returned', 'Chivorn returned 2 x Socket from Heng mengleap.', '2026-04-21 11:44:00', '2026-04-21 11:44:54', '2026-04-21 11:44:54');
INSERT INTO `item_histories` VALUES (124, 96, 74, 1, 1, 6, 1, 'Returned', 'Chivorn returned 1 x Socket from Rin SREYYA.', '2026-04-21 11:47:00', '2026-04-21 11:47:07', '2026-04-21 11:47:07');
INSERT INTO `item_histories` VALUES (125, 93, 71, 1, 1, 2, 1, 'Returned', 'Chivorn returned 2 x Socket from Savon Dara Sann.', '2026-04-21 11:47:00', '2026-04-21 11:52:19', '2026-04-21 11:52:19');
INSERT INTO `item_histories` VALUES (126, 97, 75, 1, 7, 7, NULL, 'Borrowed', 'Vanchha borrowed 1 x Socket for Penh souytry.', '2026-04-21 12:56:10', '2026-04-21 12:56:10', '2026-04-21 12:56:10');
INSERT INTO `item_histories` VALUES (127, 98, 76, 1, 7, 7, NULL, 'Borrowed', 'Vanchha borrowed 1 x Socket for sroy kimhong.', '2026-04-21 13:21:07', '2026-04-21 13:21:07', '2026-04-21 13:21:07');
INSERT INTO `item_histories` VALUES (128, 99, 77, 1, 7, 7, NULL, 'Borrowed', 'Vanchha borrowed 1 x Socket for Leng Dara.', '2026-04-21 14:34:38', '2026-04-21 14:34:38', '2026-04-21 14:34:38');
INSERT INTO `item_histories` VALUES (129, 98, 76, 1, 7, 7, 7, 'Returned', 'Vanchha returned 1 x ព្រី from sroy kimhong.', '2026-04-21 15:00:00', '2026-04-21 15:01:00', '2026-04-21 15:01:00');

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items`  (
  `Itemid` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name_kh` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `available` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `qty` int NOT NULL DEFAULT 0,
  `borrow` int NOT NULL DEFAULT 0,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `status` tinyint NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`Itemid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO `items` VALUES (1, 'Socket', 'ព្រី', 0.00, 'items/EiVeaiq9D4pzURkf3xyqFrjx937Ae5sIMnYyCFCw.jpg', 16, 0, NULL, 1, '2026-03-06 09:16:16', '2026-04-21 07:34:38');
INSERT INTO `items` VALUES (2, 'Adaptor​ Laptop', 'ឆ្នាំងសាក Laptop', 0.00, 'items/GCg0bGeYVp5BX7fcc31HIzilvKUXiVDrK6SKs698.webp', 10, 0, NULL, 1, '2026-03-06 09:19:50', '2026-04-20 11:55:36');
INSERT INTO `items` VALUES (9, 'other', 'ផ្សេងៗ', 1.00, 'items/4c3I9ADhAl7RUBZakkS5ZmojS2wu7HHFBd4oiFoL.png', 10, 0, NULL, 1, '2026-03-23 17:42:31', '2026-04-21 13:45:19');

-- ----------------------------
-- Table structure for job_batches
-- ----------------------------
DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `cancelled_at` int NULL DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of job_batches
-- ----------------------------

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED NULL DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `jobs_queue_index`(`queue` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '0001_01_01_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '0001_01_01_000001_create_cache_table', 1);
INSERT INTO `migrations` VALUES (3, '0001_01_01_000002_create_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2026_02_24_095304_create_items_table', 1);
INSERT INTO `migrations` VALUES (5, '2026_02_24_101039_add_image_to_items_table', 1);
INSERT INTO `migrations` VALUES (6, '2026_02_26_131746_create_students_table', 1);
INSERT INTO `migrations` VALUES (7, '2026_02_26_170413_create_groups_table', 1);
INSERT INTO `migrations` VALUES (8, '2026_02_26_170542_alter_students_add_group_id_drop_group_name', 1);
INSERT INTO `migrations` VALUES (9, '2026_02_26_190009_add_group_id_to_students_table', 1);
INSERT INTO `migrations` VALUES (10, '2026_02_27_113143_add_id_to_students_table', 1);
INSERT INTO `migrations` VALUES (11, '2026_03_01_080000_create_borrows_table', 1);
INSERT INTO `migrations` VALUES (12, '2026_03_01_084942_add_foreign_keys_to_borrows_table', 1);
INSERT INTO `migrations` VALUES (13, '2026_03_01_091711_add_qty_to_borrows_table', 1);
INSERT INTO `migrations` VALUES (14, '2026_03_01_103012_change_return_date_to_datetime_in_borrows_table', 1);
INSERT INTO `migrations` VALUES (15, '2026_03_01_115624_add_unique_student_group_phone_to_students_table', 1);
INSERT INTO `migrations` VALUES (16, '2026_03_01_120354_add_unique_student_name_group_to_students_table', 1);
INSERT INTO `migrations` VALUES (17, '2026_03_02_015901_add_role_status_to_users_table', 1);
INSERT INTO `migrations` VALUES (18, '2026_03_02_170126_create_student_submissions_table', 1);
INSERT INTO `migrations` VALUES (19, '2026_03_03_080142_add_unique_phone_number_to_students_and_submissions', 1);
INSERT INTO `migrations` VALUES (20, '2026_03_03_103849_add_unique_phone_to_student_submissions', 1);
INSERT INTO `migrations` VALUES (21, '2026_03_03_120753_add_gender_to_students_table', 1);
INSERT INTO `migrations` VALUES (22, '2026_03_09_093500_add_borrow_fields_to_submissions_table', 2);
INSERT INTO `migrations` VALUES (23, '2026_03_13_002550_add_photo_to_users_table', 3);
INSERT INTO `migrations` VALUES (24, '2026_03_13_235925_create_item_histories_table', 4);
INSERT INTO `migrations` VALUES (25, '2026_03_14_011415_add_approved_by_and_returned_by_to_borrows_table', 4);
INSERT INTO `migrations` VALUES (26, '2026_03_20_020823_add_call_fields_to_borrows_table', 5);
INSERT INTO `migrations` VALUES (27, '2026_03_23_120000_add_name_kh_to_items_table', 6);
INSERT INTO `migrations` VALUES (28, '2026_04_02_202823_add_skip_group_change_to_student_submissions_table', 7);
INSERT INTO `migrations` VALUES (29, '2026_04_06_215735_delete_item', 7);
INSERT INTO `migrations` VALUES (30, '2026_04_10_073615_add_soft_deletes_to_borrows_table', 8);

-- ----------------------------
-- Table structure for password_reset_tokens
-- ----------------------------
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of password_reset_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` bigint UNSIGNED NULL DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sessions_user_id_index`(`user_id` ASC) USING BTREE,
  INDEX `sessions_last_activity_index`(`last_activity` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO `sessions` VALUES ('1AszCfI5uto4fId6QLOjp2soWBTOnZh5AsTzV83i', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieXBpQ25NWXRHTUVTamZCdmUyd2xrcWJDc2dBdDBOWWQ3Ym12OEdwdiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWdpc3Rlci1zdHVkZW50IjtzOjU6InJvdXRlIjtzOjE2OiJzdHVkZW50LnJlZ2lzdGVyIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1773216405);
INSERT INTO `sessions` VALUES ('E2hKLwAVT9kwLbKS1gTifP3LQutvdqw19p9ECF9p', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMFhwdFE3T1dTbnIzZUtEQ2UwZGhjVzVDeFZGV084Z2FRTmtYVzhiRyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Nzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWdpc3Rlci9jaGVjay1zdHVkZW50LW5hbWU/c3R1ZGVudF9uYW1lPUNodWwlMjBDaGl2b3JuIjtzOjU6InJvdXRlIjtzOjI1OiJyZWdpc3Rlci5jaGVja1N0dWRlbnROYW1lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1773134723);
INSERT INTO `sessions` VALUES ('KKdh5k1S5xagNlW9ULWlDFyl0BLHN5YYw8KGeUTs', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTXI2VVpleDBENmZpT0xjVFdlQXM0NmlMNE5zVXZ4bTRSdnp6VVl1dSI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czozNjoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FkbWluL3N0dWRlbnRzIjtzOjU6InJvdXRlIjtzOjE0OiJzdHVkZW50cy5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1773213663);
INSERT INTO `sessions` VALUES ('rOdlL2pp01R3FBJe5zD0hKJ0tqjfzKKSD1NVu9gp', 1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.3 Safari/605.1.15', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoia1RXMnFVSVBZQWRGUTNOdmVzN2p0VGlKZGV0TlhQTmp5UGV4UWVUYiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTE6Imh0dHA6Ly9yZW5hdG8tYmFya3kta25veC5uZ3Jvay1mcmVlLmRldi9hZG1pbi9pdGVtcyI7czo1OiJyb3V0ZSI7czoxMToiaXRlbXMuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1773213458);
INSERT INTO `sessions` VALUES ('u33RVr34ggNLBCS1R81X0Edl4hlcjhrdU85hkY6c', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVHZIRWJMbkJHaUF2M1k0QkJjb0dseTJ1Rk4zYlR2SnRvUllGRFJLdiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly9yZW5hdG8tYmFya3kta25veC5uZ3Jvay1mcmVlLmRldi9hZG1pbi9kYXNoYm9hcmQiO3M6NToicm91dGUiO3M6MTU6ImFkbWluLmRhc2hib2FyZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1773213493);
INSERT INTO `sessions` VALUES ('WsU1ozgPsljkcpZgpZt7zR2mfqOvw05rjl9z3KZA', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUmVSMVVvb2R5WWdVZ0tPQWs4bXhEM0JuQUlDTWk0M3dWYlhnNDdvdSI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czozNzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FkbWluL2Rhc2hib2FyZCI7czo1OiJyb3V0ZSI7czoxNToiYWRtaW4uZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1773135172);

-- ----------------------------
-- Table structure for student_submissions
-- ----------------------------
DROP TABLE IF EXISTS `student_submissions`;
CREATE TABLE `student_submissions`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `student_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `group_id` bigint UNSIGNED NULL DEFAULT NULL,
  `item_id` bigint UNSIGNED NULL DEFAULT NULL,
  `qty` int NOT NULL DEFAULT 1,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'BORROWED',
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `due_date` date NULL DEFAULT NULL,
  `student_id` bigint UNSIGNED NULL DEFAULT NULL,
  `is_student_existing` tinyint(1) NOT NULL DEFAULT 0,
  `is_student_added` tinyint(1) NOT NULL DEFAULT 0,
  `is_borrow_approved` tinyint(1) NOT NULL DEFAULT 0,
  `skip_group_change` tinyint(1) NOT NULL DEFAULT 0,
  `gender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `submissions_phone_number_unique`(`phone_number` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 142 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of student_submissions
-- ----------------------------
INSERT INTO `student_submissions` VALUES (116, 'កុសល សករ៉ា', '0763575325', 88, 1, 2, 'BORROWED', NULL, NULL, 54, 1, 1, 1, 0, 'Male', NULL, '2026-04-20 08:44:30', '2026-04-20 08:45:15');
INSERT INTO `student_submissions` VALUES (117, 'លីម គីមថេង', '016399574', 66, 1, 2, 'BORROWED', NULL, NULL, 55, 1, 1, 1, 0, 'Male', NULL, '2026-04-20 09:05:43', '2026-04-20 09:05:56');
INSERT INTO `student_submissions` VALUES (118, 'Neat Somnang', '086418164', 88, 1, 2, 'BORROWED', NULL, NULL, 56, 1, 1, 1, 0, 'Male', NULL, '2026-04-20 09:10:11', '2026-04-20 09:11:50');
INSERT INTO `student_submissions` VALUES (119, 'ឌុល ពុទ្ធារី', '0764979980', 97, 1, 3, 'BORROWED', NULL, NULL, 57, 1, 1, 1, 0, 'Female', NULL, '2026-04-20 10:26:25', '2026-04-20 10:27:14');
INSERT INTO `student_submissions` VALUES (120, 'Chork socheata', '070403510', 178, 1, 1, 'BORROWED', NULL, NULL, 58, 1, 1, 1, 0, 'Female', NULL, '2026-04-20 11:49:22', '2026-04-20 11:49:46');
INSERT INTO `student_submissions` VALUES (121, 'ជឹម ជៀម', '066425172', 137, 1, 1, 'BORROWED', NULL, NULL, 59, 1, 1, 1, 0, 'Female', 'អរគុណ', '2026-04-20 13:14:22', '2026-04-20 13:14:30');
INSERT INTO `student_submissions` VALUES (122, 'Ngiemchansreng', '0976984160', 99, 1, 1, 'BORROWED', NULL, NULL, 60, 1, 1, 1, 0, 'Male', NULL, '2026-04-20 13:18:38', '2026-04-20 13:18:45');
INSERT INTO `student_submissions` VALUES (123, 'Te LyYou', '093688558', 195, 1, 1, 'BORROWED', NULL, NULL, 61, 1, 1, 1, 0, 'Female', NULL, '2026-04-20 13:33:17', '2026-04-20 13:33:32');
INSERT INTO `student_submissions` VALUES (124, 'Rom thanun', '0885004460', 99, 1, 1, 'BORROWED', NULL, NULL, 62, 1, 1, 1, 0, 'Male', NULL, '2026-04-20 13:43:37', '2026-04-20 13:43:56');
INSERT INTO `student_submissions` VALUES (125, 'Mout navy', '069789100', 195, 1, 1, 'BORROWED', NULL, NULL, 63, 1, 1, 1, 0, 'Female', NULL, '2026-04-20 13:54:28', '2026-04-20 13:54:51');
INSERT INTO `student_submissions` VALUES (126, 'Oum keotraiveth', '0969173087', 170, 1, 2, 'BORROWED', NULL, NULL, 64, 1, 1, 1, 0, 'Male', NULL, '2026-04-20 14:41:15', '2026-04-20 14:41:26');
INSERT INTO `student_submissions` VALUES (127, 'Sombo phanit', '011324475', 39, 1, 1, 'BORROWED', NULL, NULL, 66, 1, 1, 1, 0, 'Male', NULL, '2026-04-20 17:48:45', '2026-04-20 17:48:52');
INSERT INTO `student_submissions` VALUES (128, 'ម៉ាន់ ពៅ', '081827851', 143, 1, 1, 'BORROWED', NULL, NULL, 67, 1, 1, 1, 0, 'Male', NULL, '2026-04-20 18:59:33', '2026-04-20 18:59:40');
INSERT INTO `student_submissions` VALUES (131, 'Srun Bun Visoth', '0965621254', 67, 1, 2, 'BORROWED', NULL, NULL, 69, 1, 1, 1, 0, 'Male', NULL, '2026-04-21 07:12:19', '2026-04-21 07:12:40');
INSERT INTO `student_submissions` VALUES (132, 'Soeun seavmeng', '0719224829', 168, 1, 1, 'BORROWED', NULL, NULL, 70, 1, 1, 1, 0, 'Male', NULL, '2026-04-21 07:27:19', '2026-04-21 07:34:08');
INSERT INTO `student_submissions` VALUES (133, 'Chork socheata', '070403510', 178, 1, 1, 'BORROWED', NULL, NULL, 58, 1, 1, 1, 0, 'Female', NULL, '2026-04-21 08:25:40', '2026-04-21 08:46:24');
INSERT INTO `student_submissions` VALUES (134, 'Savon Dara Sann', '010735026', 93, 1, 2, 'BORROWED', NULL, NULL, 71, 1, 1, 1, 0, 'Male', NULL, '2026-04-21 08:46:08', '2026-04-21 08:46:45');
INSERT INTO `student_submissions` VALUES (135, 'Chea sokty', '068268203', 126, 1, 2, 'BORROWED', NULL, NULL, 72, 1, 1, 1, 0, 'Male', NULL, '2026-04-21 09:04:12', '2026-04-21 09:04:25');
INSERT INTO `student_submissions` VALUES (136, 'Heng mengleap', '010404344', 121, 1, 2, 'BORROWED', NULL, NULL, 73, 1, 1, 1, 0, 'Male', NULL, '2026-04-21 10:10:44', '2026-04-21 10:11:20');
INSERT INTO `student_submissions` VALUES (137, 'Rin SREYYA', '085213810', 121, 1, 1, 'BORROWED', NULL, NULL, 74, 1, 1, 1, 0, 'Female', NULL, '2026-04-21 10:28:55', '2026-04-21 10:29:08');
INSERT INTO `student_submissions` VALUES (138, 'Penh souytry', '086404072', 146, 1, 1, 'BORROWED', NULL, NULL, 75, 1, 1, 1, 0, 'Male', NULL, '2026-04-21 12:55:42', '2026-04-21 12:56:10');
INSERT INTO `student_submissions` VALUES (139, 'Te LyYou', '093688558', 195, 1, 1, 'BORROWED', NULL, NULL, NULL, 0, 0, 0, 0, 'Female', NULL, '2026-04-21 13:11:24', '2026-04-21 13:11:24');
INSERT INTO `student_submissions` VALUES (140, 'sroy kimhong', '095372492', 178, 1, 1, 'BORROWED', NULL, NULL, 76, 1, 1, 1, 0, 'Male', NULL, '2026-04-21 13:20:52', '2026-04-21 13:21:07');
INSERT INTO `student_submissions` VALUES (141, 'Leng Dara', '067818282', 65, 1, 1, 'BORROWED', NULL, NULL, 77, 1, 1, 1, 0, 'Male', NULL, '2026-04-21 14:34:24', '2026-04-21 14:34:38');

-- ----------------------------
-- Table structure for students
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students`  (
  `student_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `student_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `group_id` bigint UNSIGNED NULL DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`student_id`) USING BTREE,
  UNIQUE INDEX `students_name_group_unique`(`student_name` ASC, `group_id` ASC) USING BTREE,
  UNIQUE INDEX `students_phone_number_unique`(`phone_number` ASC) USING BTREE,
  INDEX `students_group_id_foreign`(`group_id` ASC) USING BTREE,
  INDEX `students_name_group_phone_unique`(`student_name` ASC, `group_id` ASC, `phone_number` ASC) USING BTREE,
  CONSTRAINT `students_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO `students` VALUES (38, 'Loum Vanchha', '069271230', 'Male', 59, 1, '2026-04-02 15:45:21', '2026-04-09 23:09:37');
INSERT INTO `students` VALUES (39, 'Sour Sombo', '011593677', 'Male', 59, 1, '2026-04-02 16:01:30', '2026-04-02 16:01:30');
INSERT INTO `students` VALUES (42, 'Mann Yivfouy', '092 161 702', 'Male', 67, 1, '2026-04-03 09:04:58', '2026-04-10 19:41:13');
INSERT INTO `students` VALUES (52, 'Rann Dara', '091892847', 'Male', 70, 1, '2026-04-11 09:02:21', '2026-04-11 09:02:21');
INSERT INTO `students` VALUES (54, 'កុសល សករ៉ា', '0763575325', 'Male', 88, 1, '2026-04-20 08:45:11', '2026-04-20 08:45:11');
INSERT INTO `students` VALUES (55, 'លីម គីមថេង', '016399574', 'Male', 66, 1, '2026-04-20 09:05:54', '2026-04-20 09:05:54');
INSERT INTO `students` VALUES (56, 'Neat Somnang', '086418164', 'Male', 88, 1, '2026-04-20 09:11:39', '2026-04-20 09:11:39');
INSERT INTO `students` VALUES (57, 'ឌុល ពុទ្ធារី', '0764979980', 'Female', 97, 1, '2026-04-20 10:27:00', '2026-04-20 10:27:00');
INSERT INTO `students` VALUES (58, 'Chork socheata', '070403510', 'Female', 178, 1, '2026-04-20 11:49:41', '2026-04-20 11:49:41');
INSERT INTO `students` VALUES (59, 'ជឹម ជៀម', '066425172', 'Male', 137, 1, '2026-04-20 13:14:29', '2026-04-20 19:40:52');
INSERT INTO `students` VALUES (60, 'Ngiemchansreng', '0976984160', 'Male', 99, 1, '2026-04-20 13:18:44', '2026-04-20 13:18:44');
INSERT INTO `students` VALUES (61, 'Te LyYou', '093688558', 'Female', 195, 1, '2026-04-20 13:33:29', '2026-04-20 13:33:29');
INSERT INTO `students` VALUES (62, 'Rom thanun', '0885004460', 'Male', 99, 1, '2026-04-20 13:43:53', '2026-04-20 13:43:53');
INSERT INTO `students` VALUES (63, 'Mout navy', '069789100', 'Female', 195, 1, '2026-04-20 13:54:47', '2026-04-20 13:54:47');
INSERT INTO `students` VALUES (64, 'Oum keotraiveth', '0969173087', 'Male', 170, 1, '2026-04-20 14:41:25', '2026-04-20 14:41:25');
INSERT INTO `students` VALUES (65, 'Sorn Sopanha', '0695501320', 'Male', 67, 1, '2026-04-20 15:44:23', '2026-04-20 15:44:23');
INSERT INTO `students` VALUES (66, 'Sombo phanit', '011324475', 'Male', 39, 1, '2026-04-20 17:48:50', '2026-04-20 17:48:50');
INSERT INTO `students` VALUES (67, 'ម៉ាន់ ពៅ', '081827851', 'Male', 143, 1, '2026-04-20 18:59:39', '2026-04-20 18:59:39');
INSERT INTO `students` VALUES (68, 'Chhorn Sothea', '0969202136', 'Male', 67, 1, '2026-04-21 06:48:29', '2026-04-21 06:48:29');
INSERT INTO `students` VALUES (69, 'Srun Bun Visoth', '0965621254', 'Male', 67, 1, '2026-04-21 07:12:34', '2026-04-21 07:12:34');
INSERT INTO `students` VALUES (70, 'Soeun seavmeng', '0719224829', 'Male', 168, 1, '2026-04-21 07:29:08', '2026-04-21 07:29:08');
INSERT INTO `students` VALUES (71, 'Savon Dara Sann', '010735026', 'Male', 93, 1, '2026-04-21 08:46:30', '2026-04-21 08:46:30');
INSERT INTO `students` VALUES (72, 'Chea sokty', '068268203', 'Male', 126, 1, '2026-04-21 09:04:20', '2026-04-21 09:04:20');
INSERT INTO `students` VALUES (73, 'Heng mengleap', '010404344', 'Male', 121, 1, '2026-04-21 10:11:18', '2026-04-21 10:11:18');
INSERT INTO `students` VALUES (74, 'Rin SREYYA', '085213810', 'Female', 121, 1, '2026-04-21 10:29:05', '2026-04-21 10:29:05');
INSERT INTO `students` VALUES (75, 'Penh souytry', '086404072', 'Male', 146, 1, '2026-04-21 12:56:07', '2026-04-21 12:56:07');
INSERT INTO `students` VALUES (76, 'sroy kimhong', '095372492', 'Male', 178, 1, '2026-04-21 13:21:01', '2026-04-21 13:21:01');
INSERT INTO `students` VALUES (77, 'Leng Dara', '067818282', 'Male', 65, 1, '2026-04-21 14:34:37', '2026-04-21 14:34:37');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'student',
  `status` tinyint NOT NULL DEFAULT 1,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Chivorn', 'chulchivorn@gmail.com', 'users/KqUF0GQRckbUD19a5RA7fQwfFAGlb2lYncFciTnK.jpg', NULL, '$2y$12$1NWLbUXDTGesNEC2VItijeRRuKPJWyKs2zzKnCsxFLY.CCTc7t8Fm', 'admin', 1, 'cWmkQZopWYMWmQl5Ww2hPFOVAMdGMXoIyQevUIv7N7D67RpR7awp2VEcVi2z', '2026-03-05 13:26:16', '2026-03-30 16:48:50');
INSERT INTO `users` VALUES (2, 'Piseth', 'teangpiseth01@gmail.com', 'users/3qFn18TxX258aiy7GaMLdr7MOqtUdUCXUSjNNj46.jpg', NULL, '$2y$12$R.IV5/l7Sesq47xGtTW9q.fA7UT9mHR3o2ySvoiqs9ux3XbFu8YkW', 'staff', 1, 'kUht51llHYmDNrImkS7VopzviPYPH8x7LrX6e3aPEY78uMFyxphkhvo6FWp3', '2026-03-12 16:48:46', '2026-04-02 16:34:30');
INSERT INTO `users` VALUES (3, 'Fouy', 'mannyivfouy@gmail.com', 'profile/4rmpHF9v7PWy3TywhAFtXIfMsNxIw5Xwakf3wnVR.jpg', NULL, '$2y$12$iz.Bvmv62bbW/E6qlPwyrufC9z6oXBptuyBRQw3y5qtrKT82NlbG.', 'staff', 1, NULL, '2026-03-13 16:41:57', '2026-04-20 19:15:11');
INSERT INTO `users` VALUES (4, 'Torika', 'panha5266@gmail.com', 'profile/6BPSM5JwlLU3TZg8smoPB6loIDSfSp6uRx0TXKLq.png', NULL, '$2y$12$RvNIXTIs4dRoyMfq1Qz1R.mLm.pHDgGcHc0.zog6n7Cp2UpRJH2LK', 'staff', 1, NULL, '2026-03-13 16:43:00', '2026-04-20 20:21:07');
INSERT INTO `users` VALUES (5, 'Kosal', 'kosal@gmail.com', 'users/20niYMsEPZKCLnEm9T5XA5q7OLjtqo4S8cBTmPd9.jpg', NULL, '$2y$12$kguTsdQJ1waKpMCsEXdodO7mO.dX7ZcPHT01XhB7exM14WNdvDVOO', 'staff', 1, NULL, '2026-03-18 13:15:11', '2026-03-26 17:01:32');
INSERT INTO `users` VALUES (6, 'Sothea', 'konnuth1@gmail.com', 'profile/RN3aufAyN5GM3TkfDIeWWb9q7VsQUBZJmJkGLuUe.jpg', NULL, '$2y$12$NB1eA7wxg419HGtYNTbYN.Q9QGssaXGeipUAvLv6ugR79rLXIvG6C', 'staff', 1, 'snvRANihSrNyHsxxMH3RoleQjKXdCvcP8UEHMMpvMVdodBe41OoYnbtfzMPS', '2026-03-18 13:53:37', '2026-04-20 09:15:29');
INSERT INTO `users` VALUES (7, 'Vanchha', 'vanchha@gmail.com', 'profile/sDoJNzRqKwU40moNaT53ij7mX3uBwtwu5fA1Kyrf.jpg', NULL, '$2y$12$CFMx1cqAy1Ttj91.2xAJMuOTDTcng5UJ12MF3gM5P6fL0iuOVI3Zm', 'staff', 1, NULL, '2026-03-26 16:54:23', '2026-04-09 23:05:42');
INSERT INTO `users` VALUES (8, 'Dara', 'dara@gmail.com', 'profile/BQjaKFgYTQzmxerHi8ooIKG7ibgDF8n2PiagZXog.png', NULL, '$2y$12$iWHUd2WSajwU0MtTuFnTVeCN4kNjgMYn5YGhSNYTho8aR82grS4o6', 'staff', 1, NULL, '2026-03-26 17:28:45', '2026-04-20 19:17:05');
INSERT INTO `users` VALUES (9, 'Long', 'long@gmail.com', NULL, NULL, '$2y$12$m0Q7uyLPsds5ZUW5QckLTu3029B5kKia/KCC.3FOlR999v071TtVy', 'staff', 1, NULL, '2026-03-27 13:48:54', '2026-03-27 13:48:54');
INSERT INTO `users` VALUES (10, 'Vannak', 'vannak@gmail.com', NULL, NULL, '$2y$12$XicC3UZK/bpRRXpMNf/.7emC3vHlaAf4pe7QFat3wma0bo0W5DtOO', 'staff', 1, NULL, '2026-03-28 16:55:32', '2026-03-28 16:55:32');
INSERT INTO `users` VALUES (11, 'sombo', 'soursombo@gmail.com', 'users/ZaNaJD5dDys2tE2CM2BAkeNL29gjlNnt7maxz8cz.jpg', NULL, '$2y$12$LcWFt/JKobfd3EYIIPaR3OUNbFzrGztwmxRj4OrIf0P/yVUt395cC', 'staff', 1, NULL, '2026-03-28 16:56:00', '2026-04-09 18:18:15');
INSERT INTO `users` VALUES (12, 'Sothun', 'sothun@gmail.com', 'profile/YJv6cHhIYzw5vcBTEJycR9UFnqNv68yR1ajde0FG.jpg', NULL, '$2y$12$TmzBPQGjQ4Rj1aG5A7HW0.hKwWlA7yambA1rrMnfR5R2pxJDEjrui', 'staff', 1, NULL, '2026-03-28 16:56:45', '2026-04-20 09:19:34');
INSERT INTO `users` VALUES (13, 'Thearith', 'khoeurnthearith@gmail.com', NULL, NULL, '$2y$12$LBxlfapVDAK6LPtdkm74K.BvfbT5tDkEG/5SwkFasGnlfQg7shziq', 'admin', 1, NULL, '2026-04-02 16:00:42', '2026-04-02 16:00:42');
INSERT INTO `users` VALUES (14, 'In', 'in@gmail.com', NULL, NULL, '$2y$12$4LWTHVfJe578S9WE1IapOuIRv0R4CBh2LY7NSEK8sma6x1aCwh.kS', 'admin', 1, NULL, '2026-04-02 16:38:41', '2026-04-02 16:38:41');
INSERT INTO `users` VALUES (15, 'Thearayu', 'Thearayu@gmail.com', NULL, NULL, '$2y$12$QrItJjuwTnQIVM8zbEReNOp5ZyXBu1JfQZvDJpJs9AXOpQARsMKoS', 'staff', 1, NULL, '2026-04-09 18:19:37', '2026-04-10 16:00:09');
INSERT INTO `users` VALUES (16, 'Pheak', 'pheak@gmail.com', NULL, NULL, '$2y$12$rMcX3Q9E1ew3vfEH3RYJQODdFa0F8bMu7c5ELnw9d8OYu39FJTFmG', 'staff', 1, NULL, '2026-04-20 09:10:03', '2026-04-20 09:10:03');
INSERT INTO `users` VALUES (17, 'maintenance', 'maintenance@gmail.com', NULL, NULL, '$2y$12$i5O9zcYM//AhfYyLLcxRKOM8rwPA.pl2r3u9FIB75x1DCBZgktbt6', 'admin', 1, NULL, '2026-04-20 13:03:30', '2026-04-20 13:05:23');

SET FOREIGN_KEY_CHECKS = 1;
