/*
 Navicat Premium Data Transfer

 Source Server         : testmysql
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : localhost:3306
 Source Schema         : employee

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 25/11/2020 17:58:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept`  (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `dname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `f_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `manage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'James',
  PRIMARY KEY (`did`) USING BTREE,
  INDEX `f_id`(`f_id`) USING BTREE,
  CONSTRAINT `dept_ibfk_1` FOREIGN KEY (`f_id`) REFERENCES `t_emp` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES (1, '研发部', '1003', '魏晓葵');
INSERT INTO `dept` VALUES (2, '测试部', '1003', '谢浩荣');
INSERT INTO `dept` VALUES (3, '运营部', '1003', '肖宇恒');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `n_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` date NULL DEFAULT NULL,
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `n_id`(`n_id`) USING BTREE,
  CONSTRAINT `notice_ibfk_1` FOREIGN KEY (`n_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, 'james', 'aaa', 'bbbb', NULL, NULL);

-- ----------------------------
-- Table structure for t_emp
-- ----------------------------
DROP TABLE IF EXISTS `t_emp`;
CREATE TABLE `t_emp`  (
  `id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `salary` double(7, 2) NULL DEFAULT NULL,
  `age` int(3) NULL DEFAULT NULL,
  `did` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `t_id`(`did`) USING BTREE,
  CONSTRAINT `t_emp_ibfk_1` FOREIGN KEY (`did`) REFERENCES `dept` (`did`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_emp
-- ----------------------------
INSERT INTO `t_emp` VALUES ('1003', 'kitty', 1024.55, 18, 2);
INSERT INTO `t_emp` VALUES ('1004', '小王', 11024.55, 18, 3);
INSERT INTO `t_emp` VALUES ('1010', '张飞', 71024.55, 24, 2);
INSERT INTO `t_emp` VALUES ('1012', '虞姬', 91024.55, 26, 3);
INSERT INTO `t_emp` VALUES ('1013', '甄姬', 21024.55, 29, 2);
INSERT INTO `t_emp` VALUES ('205f2751', '曹达华', 22220.00, 12, 1);
INSERT INTO `t_emp` VALUES ('2bd161a8', '魏无羡hhe', 22222.00, 13, 1);
INSERT INTO `t_emp` VALUES ('3', 'xiao', 61024.55, 31, 2);
INSERT INTO `t_emp` VALUES ('38a5b83f', 'jamw', 1000.00, -25, 2);
INSERT INTO `t_emp` VALUES ('560acae3', '王小明', 33333.00, 18, 2);
INSERT INTO `t_emp` VALUES ('69acf0a9', '马可波罗', 13000.00, 26, 2);
INSERT INTO `t_emp` VALUES ('6e7dd133', 'ddd', 11111.11, 25, 1);
INSERT INTO `t_emp` VALUES ('722fa99a', '爱的', 9999.99, 33, 1);
INSERT INTO `t_emp` VALUES ('730b0c65', '王进荣', 30000.11, 23, 1);
INSERT INTO `t_emp` VALUES ('7b572aec', '驱蚊器', 212.00, 21, 3);
INSERT INTO `t_emp` VALUES ('97acccd7', 'jame小明', 1000.11, 25, 1);
INSERT INTO `t_emp` VALUES ('aa1d8a8b', '王小东', 4435.00, 44, 1);
INSERT INTO `t_emp` VALUES ('b44d257f', '武则天', 12222.00, 38, 1);
INSERT INTO `t_emp` VALUES ('cbfd59f4', '成龙', 1222.00, 34, 1);
INSERT INTO `t_emp` VALUES ('d5b6a67d', '吴泽狗', 11.00, 123, 2);
INSERT INTO `t_emp` VALUES ('e4cbc85a', '张三丰', 11111.00, 22, 2);
INSERT INTO `t_emp` VALUES ('e90fc077', '魏晓葵', 1111.00, 22, 1);
INSERT INTO `t_emp` VALUES ('f619dd9f', '小明', 1000.00, 25, 1);
INSERT INTO `t_emp` VALUES ('fa61723a', '小菜', 1111.00, 17, 2);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `realname` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '男',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'root', 'root', 'root', '男');
INSERT INTO `t_user` VALUES ('10ea', '一二三四', '谢浩荣', '1234', '女');
INSERT INTO `t_user` VALUES ('13444', '老李', 'invb', '666666', '女');
INSERT INTO `t_user` VALUES ('13840', '急急急', '黄金经济', 'jiajia!', '女');
INSERT INTO `t_user` VALUES ('1459', '吴亦凡', '谢浩荣', '1234', '女');
INSERT INTO `t_user` VALUES ('15542', '老王', 'hevf', '4225', '女');
INSERT INTO `t_user` VALUES ('18877', '老朱', 'chkv', '71022', '女');
INSERT INTO `t_user` VALUES ('2', 'admin', 'admin', 'admin', '男');
INSERT INTO `t_user` VALUES ('3', 'kitty', 'kitty', 'kitty', '女');
INSERT INTO `t_user` VALUES ('3441', 'god', '谢浩荣', '1234', '女');
INSERT INTO `t_user` VALUES ('3867', '老吴', 'bsap', '19015', '女');
INSERT INTO `t_user` VALUES ('44249', '老秦', 'fxlp', '241115', '女');
INSERT INTO `t_user` VALUES ('47533', '老孙', 'eche', '274', '女');
INSERT INTO `t_user` VALUES ('4f1c', '老朱', 'asd', 'asd', '女');
INSERT INTO `t_user` VALUES ('6', '大荣神', 'james', '1111', '男');
INSERT INTO `t_user` VALUES ('60166', '老吴', 'bkrj', '10189', '女');
INSERT INTO `t_user` VALUES ('65731', '老沈', 'hifr', '8518', '女');
INSERT INTO `t_user` VALUES ('6650', '555', '555', '555', '女');
INSERT INTO `t_user` VALUES ('68320', 'rootroot', '王泽鑫', 'rootroot', '女');
INSERT INTO `t_user` VALUES ('6de7', 'web', 'sadd', 'wed', '女');
INSERT INTO `t_user` VALUES ('76307', 'abcd', '王泽鑫', 'helloworld', '女');
INSERT INTO `t_user` VALUES ('79844', 'helloworld6', '王泽鑫', 'helloworld', '女');
INSERT INTO `t_user` VALUES ('7a5a', 'halo', '谢浩荣', '1234', '女');
INSERT INTO `t_user` VALUES ('89437', '老杨', 'jgji', '698', '男');
INSERT INTO `t_user` VALUES ('90b6', 'fate', 'fate', 'fate', '女');
INSERT INTO `t_user` VALUES ('91184', 'mama', 'mama', '123456', '女');
INSERT INTO `t_user` VALUES ('93423', 'mmm', 'yixi', '123456', '女');
INSERT INTO `t_user` VALUES ('94dc', '1111111', '1111111', '222', '女');
INSERT INTO `t_user` VALUES ('990d', 'Berserker', 'Berserker', '1234', '女');
INSERT INTO `t_user` VALUES ('99209', '123', '123', '123', '女');
INSERT INTO `t_user` VALUES ('9ea4', 'pig', 'pig', '123', '女');
INSERT INTO `t_user` VALUES ('a1af', 'hello', '谢浩荣', '1234', '女');
INSERT INTO `t_user` VALUES ('a8bd', 'halo4', 'bob', '1234', '女');
INSERT INTO `t_user` VALUES ('b431', 'asd', 'asd', 'asd', '女');
INSERT INTO `t_user` VALUES ('b602', 'cat', 'cat', '1234', '女');
INSERT INTO `t_user` VALUES ('b903', '222', '222', '222', '女');
INSERT INTO `t_user` VALUES ('c8f3', 'halo11', '浩荣', '1234', '女');
INSERT INTO `t_user` VALUES ('cafe', '老李hah', 'ALOO', '11111', '女');
INSERT INTO `t_user` VALUES ('d078', 'QQQ', 'xacx', '1132333333', '女');
INSERT INTO `t_user` VALUES ('d647', 'dog', 'dog', '1234', '女');
INSERT INTO `t_user` VALUES ('e58f', 'aaa', 'aaa', 'aaa', '女');
INSERT INTO `t_user` VALUES ('f3e6', 'halo16', '谢浩荣1', '1234', '女');
INSERT INTO `t_user` VALUES ('f56c', 'qwe', '吴邪', '123456', '女');

SET FOREIGN_KEY_CHECKS = 1;
