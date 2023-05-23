/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 80033 (8.0.33)
 Source Host           : localhost:3306
 Source Schema         : my_project

 Target Server Type    : MySQL
 Target Server Version : 80033 (8.0.33)
 File Encoding         : 65001

 Date: 23/05/2023 20:29:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for avatar
-- ----------------------------
DROP TABLE IF EXISTS `avatar`;
CREATE TABLE `avatar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL,
  `mimetype` varchar(30) DEFAULT NULL,
  `size` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `filename` (`filename`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `avatar_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of avatar
-- ----------------------------
BEGIN;
INSERT INTO `avatar` (`id`, `filename`, `mimetype`, `size`, `user_id`, `createAt`, `updateAt`) VALUES (4, '2f952d7a5ab5e86e9221f8b93ae368d9', 'image/png', 268548, 1, '2023-05-23 18:25:09', '2023-05-23 18:25:09');
INSERT INTO `avatar` (`id`, `filename`, `mimetype`, `size`, `user_id`, `createAt`, `updateAt`) VALUES (5, 'cfb0b81ade781b60a7505e091a67fc6f', 'image/png', 268548, 1, '2023-05-23 18:25:12', '2023-05-23 18:25:12');
INSERT INTO `avatar` (`id`, `filename`, `mimetype`, `size`, `user_id`, `createAt`, `updateAt`) VALUES (6, 'a2e094e1ba780958efb6ade7785ad4a8', 'image/jpeg', 204013, 1, '2023-05-23 18:48:19', '2023-05-23 18:48:19');
INSERT INTO `avatar` (`id`, `filename`, `mimetype`, `size`, `user_id`, `createAt`, `updateAt`) VALUES (7, '809beee43c67692b412049b7e3b98a42', 'image/jpeg', 204013, 1, '2023-05-23 20:08:14', '2023-05-23 20:08:14');
INSERT INTO `avatar` (`id`, `filename`, `mimetype`, `size`, `user_id`, `createAt`, `updateAt`) VALUES (8, '76b938eba00b5e73d1f73bf49f3ea28a', 'image/jpeg', 204013, 1, '2023-05-23 20:08:53', '2023-05-23 20:08:53');
INSERT INTO `avatar` (`id`, `filename`, `mimetype`, `size`, `user_id`, `createAt`, `updateAt`) VALUES (9, '58d9ff703fb1cce698281cf92c133048', 'image/jpeg', 204013, 1, '2023-05-23 20:09:02', '2023-05-23 20:09:02');
INSERT INTO `avatar` (`id`, `filename`, `mimetype`, `size`, `user_id`, `createAt`, `updateAt`) VALUES (10, '863bdc9e1c7052ac7ed751f48c387e32', 'image/png', 38021, 1, '2023-05-23 20:09:38', '2023-05-23 20:09:38');
COMMIT;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `moment_id` int NOT NULL,
  `user_id` int NOT NULL,
  `comment_id` int DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `moment_id` (`moment_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `comment_id` (`comment_id`) USING BTREE,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`moment_id`) REFERENCES `moment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of comment
-- ----------------------------
BEGIN;
INSERT INTO `comment` (`id`, `content`, `moment_id`, `user_id`, `comment_id`, `createAt`, `updateAt`) VALUES (1, 'kunkun打球太帅了', 2, 7, NULL, '2022-11-20 17:17:50', '2022-11-20 17:17:50');
INSERT INTO `comment` (`id`, `content`, `moment_id`, `user_id`, `comment_id`, `createAt`, `updateAt`) VALUES (2, '确实太帅了, 尤其是那个转身!!!', 2, 7, 1, '2022-11-20 17:25:06', '2022-11-20 17:25:06');
INSERT INTO `comment` (`id`, `content`, `moment_id`, `user_id`, `comment_id`, `createAt`, `updateAt`) VALUES (3, '你好啊, 李银河!', 3, 7, NULL, '2022-11-22 09:23:45', '2022-11-22 09:23:45');
INSERT INTO `comment` (`id`, `content`, `moment_id`, `user_id`, `comment_id`, `createAt`, `updateAt`) VALUES (4, '好好唱歌, 好好rap, 好好打篮球!', 4, 7, NULL, '2022-11-22 09:24:31', '2022-11-22 09:24:31');
INSERT INTO `comment` (`id`, `content`, `moment_id`, `user_id`, `comment_id`, `createAt`, `updateAt`) VALUES (5, '可以去NBA打球, 太厉害了!', 2, 7, NULL, '2022-11-22 11:53:23', '2022-11-22 11:53:23');
INSERT INTO `comment` (`id`, `content`, `moment_id`, `user_id`, `comment_id`, `createAt`, `updateAt`) VALUES (6, 'htii', 3, 1, NULL, '2023-05-23 11:25:44', '2023-05-23 11:25:44');
INSERT INTO `comment` (`id`, `content`, `moment_id`, `user_id`, `comment_id`, `createAt`, `updateAt`) VALUES (9, 'ppp', 3, 1, 2, '2023-05-23 11:26:30', '2023-05-23 11:26:30');
COMMIT;

-- ----------------------------
-- Table structure for label
-- ----------------------------
DROP TABLE IF EXISTS `label`;
CREATE TABLE `label` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of label
-- ----------------------------
BEGIN;
INSERT INTO `label` (`id`, `name`, `createAt`, `updateAt`) VALUES (1, '篮球', '2022-11-22 10:00:09', '2022-11-22 10:00:09');
INSERT INTO `label` (`id`, `name`, `createAt`, `updateAt`) VALUES (2, '唱歌', '2022-11-22 10:00:30', '2022-11-22 10:00:30');
INSERT INTO `label` (`id`, `name`, `createAt`, `updateAt`) VALUES (3, '跳舞', '2022-11-22 10:00:35', '2022-11-22 10:00:35');
INSERT INTO `label` (`id`, `name`, `createAt`, `updateAt`) VALUES (4, 'rap', '2022-11-22 10:00:39', '2022-11-22 10:00:39');
INSERT INTO `label` (`id`, `name`, `createAt`, `updateAt`) VALUES (5, '人生', '2022-11-22 10:57:50', '2022-11-22 10:57:50');
INSERT INTO `label` (`id`, `name`, `createAt`, `updateAt`) VALUES (6, '爱情', '2022-11-22 11:00:01', '2022-11-22 11:00:01');
INSERT INTO `label` (`id`, `name`, `createAt`, `updateAt`) VALUES (7, '友情', '2022-11-22 11:00:01', '2022-11-22 11:00:01');
INSERT INTO `label` (`id`, `name`, `createAt`, `updateAt`) VALUES (8, '哲学', '2022-11-22 11:00:01', '2022-11-22 11:00:01');
INSERT INTO `label` (`id`, `name`, `createAt`, `updateAt`) VALUES (9, 'll', '2023-05-23 11:32:59', '2023-05-23 11:32:59');
INSERT INTO `label` (`id`, `name`, `createAt`, `updateAt`) VALUES (10, 'pp', '2023-05-23 11:33:11', '2023-05-23 11:33:11');
COMMIT;

-- ----------------------------
-- Table structure for moment
-- ----------------------------
DROP TABLE IF EXISTS `moment`;
CREATE TABLE `moment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_id` int NOT NULL,
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  CONSTRAINT `moment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of moment
-- ----------------------------
BEGIN;
INSERT INTO `moment` (`id`, `content`, `user_id`, `createAt`, `updateAt`) VALUES (2, 'KUNKUN勇敢飞, IKUN永相随, 哈哈哈哈~', 7, '2022-11-20 15:17:14', '2022-11-20 16:59:22');
INSERT INTO `moment` (`id`, `content`, `user_id`, `createAt`, `updateAt`) VALUES (3, '444488888', 1, '2022-11-20 15:36:04', '2023-05-23 11:25:31');
INSERT INTO `moment` (`id`, `content`, `user_id`, `createAt`, `updateAt`) VALUES (4, 'KUNKUN勇敢飞~', 1, '2022-11-20 15:36:04', '2022-11-20 16:09:10');
INSERT INTO `moment` (`id`, `content`, `user_id`, `createAt`, `updateAt`) VALUES (5, '不要告诉我你不需要保护，不要告诉我你不寂寞，知微，我只希望你，在走过黑夜的那个时辰，不要倔强的选择一个人。', 3, '2022-11-20 15:36:04', '2022-11-20 15:36:04');
INSERT INTO `moment` (`id`, `content`, `user_id`, `createAt`, `updateAt`) VALUES (6, 'If you shed tears when you miss the sun, you also miss the stars.如果你因失去了太阳而流泪，那么你也将失去群星了。', 1, '2022-11-20 15:36:04', '2022-11-20 15:36:04');
INSERT INTO `moment` (`id`, `content`, `user_id`, `createAt`, `updateAt`) VALUES (7, '在世间万物中我都发现了你，渺小时，你是阳光下一粒种子，伟大时，你隐身在高山海洋里。', 2, '2022-11-20 15:36:04', '2022-11-20 15:36:04');
INSERT INTO `moment` (`id`, `content`, `user_id`, `createAt`, `updateAt`) VALUES (8, '某一天，突然发现，许多结果都与路径无关。', 4, '2022-11-20 15:36:04', '2022-11-20 15:36:04');
INSERT INTO `moment` (`id`, `content`, `user_id`, `createAt`, `updateAt`) VALUES (9, '限定目的，能使人生变得简洁。', 2, '2022-11-20 15:36:04', '2022-11-20 15:36:04');
INSERT INTO `moment` (`id`, `content`, `user_id`, `createAt`, `updateAt`) VALUES (10, '翅膀长在你的肩上，太在乎别人对于飞行姿势的批评，所以你飞不起来', 4, '2022-11-20 15:36:04', '2022-11-20 15:36:04');
INSERT INTO `moment` (`id`, `content`, `user_id`, `createAt`, `updateAt`) VALUES (11, '一个人至少拥有一个梦想，有一个理由去坚强。心若没有栖息的地方，到哪里都是在流浪。', 2, '2022-11-20 15:36:04', '2022-11-20 15:36:04');
INSERT INTO `moment` (`id`, `content`, `user_id`, `createAt`, `updateAt`) VALUES (12, '不乱于心，不困于情。不畏将来，不念过往。如此，安好。', 3, '2022-11-20 15:36:04', '2022-11-20 15:36:04');
INSERT INTO `moment` (`id`, `content`, `user_id`, `createAt`, `updateAt`) VALUES (13, '如果你给我的，和你给别人的是一样的，那我就不要了。', 3, '2022-11-20 15:36:04', '2022-11-20 15:36:04');
INSERT INTO `moment` (`id`, `content`, `user_id`, `createAt`, `updateAt`) VALUES (14, '故事的开头总是这样，适逢其会，猝不及防。故事的结局总是这样，花开两朵，天各一方。', 2, '2022-11-20 15:36:04', '2022-11-20 15:36:04');
INSERT INTO `moment` (`id`, `content`, `user_id`, `createAt`, `updateAt`) VALUES (15, '你不愿意种花，你说，我不愿看见它一点点凋落。是的，为了避免结束，你避免了一切开始。', 2, '2022-11-20 15:36:04', '2022-11-20 15:36:04');
INSERT INTO `moment` (`id`, `content`, `user_id`, `createAt`, `updateAt`) VALUES (16, '你如果认识从前的我，也许你会原谅现在的我。', 4, '2022-11-20 15:36:04', '2022-11-20 15:36:04');
INSERT INTO `moment` (`id`, `content`, `user_id`, `createAt`, `updateAt`) VALUES (17, '每一个不曾起舞的日子，都是对生命的辜负。', 2, '2022-11-20 15:36:04', '2022-11-20 15:36:04');
INSERT INTO `moment` (`id`, `content`, `user_id`, `createAt`, `updateAt`) VALUES (18, '向来缘浅，奈何情深。', 2, '2022-11-20 15:36:04', '2022-11-20 15:36:04');
INSERT INTO `moment` (`id`, `content`, `user_id`, `createAt`, `updateAt`) VALUES (19, '心之所向 素履以往 生如逆旅 一苇以航', 3, '2022-11-20 15:36:04', '2022-11-20 15:36:04');
INSERT INTO `moment` (`id`, `content`, `user_id`, `createAt`, `updateAt`) VALUES (20, '生如夏花之绚烂，死如秋叶之静美。', 3, '2022-11-20 15:36:04', '2022-11-20 15:36:04');
INSERT INTO `moment` (`id`, `content`, `user_id`, `createAt`, `updateAt`) VALUES (21, '答案很长，我准备用一生的时间来回答，你准备要听了吗？', 4, '2022-11-20 15:36:04', '2022-11-20 15:36:04');
INSERT INTO `moment` (`id`, `content`, `user_id`, `createAt`, `updateAt`) VALUES (22, '因为爱过，所以慈悲；因为懂得，所以宽容。', 4, '2022-11-20 15:36:04', '2022-11-20 15:36:04');
INSERT INTO `moment` (`id`, `content`, `user_id`, `createAt`, `updateAt`) VALUES (23, '我们听过无数的道理，却仍旧过不好这一生。', 1, '2022-11-20 15:36:04', '2022-11-20 15:36:04');
INSERT INTO `moment` (`id`, `content`, `user_id`, `createAt`, `updateAt`) VALUES (24, '我来不及认真地年轻，待明白过来时，只能选择认真地老去。', 2, '2022-11-20 15:36:04', '2022-11-20 15:36:04');
COMMIT;

-- ----------------------------
-- Table structure for moment_label
-- ----------------------------
DROP TABLE IF EXISTS `moment_label`;
CREATE TABLE `moment_label` (
  `moment_id` int NOT NULL,
  `label_id` int NOT NULL,
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`moment_id`,`label_id`) USING BTREE,
  KEY `label_id` (`label_id`) USING BTREE,
  CONSTRAINT `moment_label_ibfk_1` FOREIGN KEY (`moment_id`) REFERENCES `moment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `moment_label_ibfk_2` FOREIGN KEY (`label_id`) REFERENCES `label` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of moment_label
-- ----------------------------
BEGIN;
INSERT INTO `moment_label` (`moment_id`, `label_id`, `createAt`, `updateAt`) VALUES (2, 1, '2022-11-22 10:33:22', '2022-11-22 10:33:22');
INSERT INTO `moment_label` (`moment_id`, `label_id`, `createAt`, `updateAt`) VALUES (2, 2, '2022-11-22 11:17:38', '2022-11-22 11:17:38');
INSERT INTO `moment_label` (`moment_id`, `label_id`, `createAt`, `updateAt`) VALUES (2, 4, '2022-11-22 11:17:38', '2022-11-22 11:17:38');
INSERT INTO `moment_label` (`moment_id`, `label_id`, `createAt`, `updateAt`) VALUES (2, 6, '2022-11-22 11:17:38', '2022-11-22 11:17:38');
INSERT INTO `moment_label` (`moment_id`, `label_id`, `createAt`, `updateAt`) VALUES (2, 7, '2022-11-22 11:17:38', '2022-11-22 11:17:38');
INSERT INTO `moment_label` (`moment_id`, `label_id`, `createAt`, `updateAt`) VALUES (2, 8, '2022-11-22 11:17:38', '2022-11-22 11:17:38');
INSERT INTO `moment_label` (`moment_id`, `label_id`, `createAt`, `updateAt`) VALUES (3, 2, '2023-05-23 11:33:11', '2023-05-23 11:33:11');
INSERT INTO `moment_label` (`moment_id`, `label_id`, `createAt`, `updateAt`) VALUES (3, 4, '2023-05-23 11:33:11', '2023-05-23 11:33:11');
INSERT INTO `moment_label` (`moment_id`, `label_id`, `createAt`, `updateAt`) VALUES (3, 10, '2023-05-23 11:33:11', '2023-05-23 11:33:11');
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `avatar_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` (`id`, `name`, `password`, `createAt`, `updateAt`, `avatar_url`) VALUES (1, 'yqq', 'e10adc3949ba59abbe56e057f20f883e', '2022-11-20 15:34:14', '2023-05-23 20:09:02', 'http://localhost:8000/user/avatar/1');
INSERT INTO `user` (`id`, `name`, `password`, `createAt`, `updateAt`, `avatar_url`) VALUES (2, 'lilei', 'e10adc3949ba59abbe56e057f20f883e', '2022-11-20 15:35:39', '2022-11-20 15:35:39', NULL);
INSERT INTO `user` (`id`, `name`, `password`, `createAt`, `updateAt`, `avatar_url`) VALUES (3, 'hmm', 'e10adc3949ba59abbe56e057f20f883e', '2022-11-20 15:35:39', '2022-11-20 15:35:39', NULL);
INSERT INTO `user` (`id`, `name`, `password`, `createAt`, `updateAt`, `avatar_url`) VALUES (4, 'luly', 'e10adc3949ba59abbe56e057f20f883e', '2022-11-20 15:35:39', '2022-11-20 15:35:39', NULL);
INSERT INTO `user` (`id`, `name`, `password`, `createAt`, `updateAt`, `avatar_url`) VALUES (6, 'curry', 'e99a18c428cb38d5f260853678922e03', '2022-11-19 16:27:35', '2022-11-19 16:27:35', NULL);
INSERT INTO `user` (`id`, `name`, `password`, `createAt`, `updateAt`, `avatar_url`) VALUES (7, 'why', 'e10adc3949ba59abbe56e057f20f883e', '2022-11-19 16:29:00', '2022-11-22 15:24:03', 'http://localhost:8000/users/avatar/7');
INSERT INTO `user` (`id`, `name`, `password`, `createAt`, `updateAt`, `avatar_url`) VALUES (8, 'yqq2', 'e5e5d06e8e9f950414c4cd8eb18d9e7c', '2023-05-23 18:37:21', '2023-05-23 18:37:21', NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
