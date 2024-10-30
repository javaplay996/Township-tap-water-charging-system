/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - sf-ssmj
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sf-ssmj` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `sf-ssmj`;

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='配置文件';

/*Data for the table `config` */

insert  into `config`(`id`,`name`,`value`) values (1,'picture1','http://localhost:8080/ssm1z8hn/upload/picture1.jpg'),(2,'picture2','http://localhost:8080/ssm1z8hn/upload/picture2.jpg'),(3,'picture3','http://localhost:8080/ssm1z8hn/upload/picture3.jpg'),(4,'homepage',NULL);

/*Table structure for table `dictionary` */

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` tinyint(4) DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字',
  `super_id` int(11) DEFAULT NULL COMMENT '父字段id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='字典表';

/*Data for the table `dictionary` */

insert  into `dictionary`(`id`,`dic_code`,`dic_name`,`code_index`,`index_name`,`super_id`,`create_time`) values (1,'whether_types','是否通过',2,'否',NULL,'2021-01-25 11:41:54'),(2,'whether_types','是否通过',1,'是',NULL,'2021-01-25 11:41:54');

/*Table structure for table `genghuanxinxi` */

DROP TABLE IF EXISTS `genghuanxinxi`;

CREATE TABLE `genghuanxinxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `yh_types` int(11) DEFAULT NULL COMMENT '更换用户',
  `sb_types` int(11) DEFAULT NULL COMMENT '更换水表',
  `changecause` varchar(255) DEFAULT NULL COMMENT '更换原因',
  `address` varchar(255) DEFAULT NULL COMMENT '家庭住址',
  `contact` varchar(255) DEFAULT NULL COMMENT '联系方式',
  `whether_types` int(11) DEFAULT NULL COMMENT '是否通过 Search',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `genghuanxinxi` */

insert  into `genghuanxinxi`(`id`,`yh_types`,`sb_types`,`changecause`,`address`,`contact`,`whether_types`) values (7,29,4,'123','123','123',1);

/*Table structure for table `liuyanxinxi` */

DROP TABLE IF EXISTS `liuyanxinxi`;

CREATE TABLE `liuyanxinxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `note` varchar(255) DEFAULT NULL COMMENT '留言信息',
  `yhnote` varchar(11) DEFAULT NULL COMMENT '留言人',
  `note_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '留言时间 Search',
  `reply` varchar(255) DEFAULT NULL COMMENT '回复',
  `glreply` varchar(11) DEFAULT NULL COMMENT '回复人',
  `reply_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '回复时间 Search',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `liuyanxinxi` */

insert  into `liuyanxinxi`(`id`,`note`,`yhnote`,`note_time`,`reply`,`glreply`,`reply_time`) values (9,'123','admin','2021-01-30 17:59:19','qweqweqwe','admin','2021-01-30 17:59:19'),(15,'123123','小夏','2021-02-01 15:36:56','123123123123','admin','2021-02-01 15:36:57'),(16,'33333333','小夏','2021-02-01 15:50:43','啊啊啊啊啊啊啊','admin','2021-02-01 15:50:44');

/*Table structure for table `shuibiaoxinxi` */

DROP TABLE IF EXISTS `shuibiaoxinxi`;

CREATE TABLE `shuibiaoxinxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sbname` varchar(255) DEFAULT NULL COMMENT '水表信息 Search',
  `money` decimal(10,0) DEFAULT NULL COMMENT '价格',
  `money_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `shuibiaoxinxi` */

insert  into `shuibiaoxinxi`(`id`,`sbname`,`money`,`money_time`) values (1,'水表1','1','2021-01-30 09:54:06'),(2,'水表2','2','2021-01-30 09:54:20'),(3,'水表3','3','2021-01-30 09:54:21'),(4,'水表4','4','2021-01-30 15:40:10');

/*Table structure for table `shuifeixinxi` */

DROP TABLE IF EXISTS `shuifeixinxi`;

CREATE TABLE `shuifeixinxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `money_time` varchar(2555) DEFAULT NULL COMMENT '抄水表时间 Search',
  `yh_types` tinyint(4) DEFAULT NULL COMMENT '用户id',
  `meterdata` int(255) DEFAULT NULL COMMENT '抄表数据',
  `sb_types` tinyint(4) DEFAULT NULL COMMENT '使用水表 Search',
  `notice_content` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `lastmeter` int(255) DEFAULT NULL COMMENT '上月抄表数据',
  `useyield` int(255) DEFAULT NULL COMMENT '用水量',
  `money` decimal(10,0) DEFAULT NULL COMMENT '价格',
  `maxmoney` decimal(10,0) DEFAULT NULL COMMENT '总价',
  `notice_time` date DEFAULT NULL COMMENT '缴费时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `shuifeixinxi` */

insert  into `shuifeixinxi`(`id`,`money_time`,`yh_types`,`meterdata`,`sb_types`,`notice_content`,`lastmeter`,`useyield`,`money`,`maxmoney`,`notice_time`) values (21,'2021-04',29,600,1,' asd撒旦\r\n',0,600,'1','600','2021-03-01'),(22,'2021-05',29,640,1,'刑法上的上的\r\n',600,40,'1','40','2021-03-01');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` int(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (1,1,'admin','users','管理员','sh43o3uuwpb32zb23hc1gp6uuevsdgq0','2021-01-28 18:04:51','2021-02-01 16:47:02'),(7,29,'小夏','users','用户','v4hfjz3oy35lgtsdj49nma5x9ggdent9','2021-02-01 15:47:14','2021-02-01 16:47:15');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) NOT NULL DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (1,'admin','admin','管理员','2021-01-28 18:04:51');

/*Table structure for table `xitonggonggao` */

DROP TABLE IF EXISTS `xitonggonggao`;

CREATE TABLE `xitonggonggao` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `biaoti` varchar(200) DEFAULT NULL COMMENT '标题 Search',
  `leixing` varchar(200) DEFAULT NULL COMMENT '类型',
  `neirong` longtext COMMENT '内容',
  `riqi` datetime DEFAULT NULL COMMENT '日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1608199351949 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统公告';

/*Data for the table `xitonggonggao` */

insert  into `xitonggonggao`(`id`,`addtime`,`biaoti`,`leixing`,`neirong`,`riqi`) values (1,'2020-12-17 17:35:20','2020/12/17日常公告','日常公告','公告信息','2020-12-17 17:34:43'),(2,'2020-12-17 17:35:40','2020/12/17紧急公告','紧急公告','公告信息','2020-12-17 17:35:22'),(3,'2020-12-17 17:36:13','2020/12/17其他公告','其他公告','公告信息','2020-12-17 17:35:43');

/*Table structure for table `yonghuxinxi` */

DROP TABLE IF EXISTS `yonghuxinxi`;

CREATE TABLE `yonghuxinxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户名称 Search',
  `account` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '密码',
  `img_photo` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '头像',
  `balance` decimal(10,2) DEFAULT NULL COMMENT '余额',
  `role` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '身份',
  `credit` int(255) DEFAULT NULL COMMENT '信誉',
  `sb_types` tinyint(11) DEFAULT NULL COMMENT '水表信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

/*Data for the table `yonghuxinxi` */

insert  into `yonghuxinxi`(`id`,`name`,`account`,`password`,`img_photo`,`balance`,`role`,`credit`,`sb_types`) values (1,'小札','111','111','http://localhost:8080/sf-ssmj/upload/1611825665203.JPG','9999949.00','用户',1,1),(2,'小站','222','222','http://localhost:8080/sf-ssmj/upload/1611825655680.JPG','40000.00','用户',0,2),(3,'汪汪','333','333','http://localhost:8080/sf-ssmj/upload/1611825644235.JPG','10000.00','用户',0,3),(29,'小夏','123','123','http://localhost:8080/sf-ssmj/file/download?fileName=1612165643038.JPG','443804.00','用户',1,4);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
