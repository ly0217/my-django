/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 8.0.19 : Database - job_test
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`job_test` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `job_test`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add 导航坐标',7,'add_basegeocoordinatefiled'),(26,'Can change 导航坐标',7,'change_basegeocoordinatefiled'),(27,'Can delete 导航坐标',7,'delete_basegeocoordinatefiled'),(28,'Can view 导航坐标',7,'view_basegeocoordinatefiled'),(29,'Can add 企业基本信息',8,'add_enterprise'),(30,'Can change 企业基本信息',8,'change_enterprise'),(31,'Can delete 企业基本信息',8,'delete_enterprise'),(32,'Can view 企业基本信息',8,'view_enterprise'),(33,'Can add 标签',9,'add_label'),(34,'Can change 标签',9,'change_label'),(35,'Can delete 标签',9,'delete_label'),(36,'Can view 标签',9,'view_label'),(37,'Can add 职位基本信息',10,'add_position'),(38,'Can change 职位基本信息',10,'change_position'),(39,'Can delete 职位基本信息',10,'delete_position'),(40,'Can view 职位基本信息',10,'view_position'),(41,'Can add 资格证书',11,'add_credentials'),(42,'Can change 资格证书',11,'change_credentials'),(43,'Can delete 资格证书',11,'delete_credentials'),(44,'Can view 资格证书',11,'view_credentials'),(45,'Can add 项目经历',12,'add_projectexperience'),(46,'Can change 项目经历',12,'change_projectexperience'),(47,'Can delete 项目经历',12,'delete_projectexperience'),(48,'Can view 项目经历',12,'view_projectexperience'),(49,'Can add 工作简历',13,'add_resume'),(50,'Can change 工作简历',13,'change_resume'),(51,'Can delete 工作简历',13,'delete_resume'),(52,'Can view 工作简历',13,'view_resume'),(53,'Can add 简历投递记录',14,'add_delivery_record'),(54,'Can change 简历投递记录',14,'change_delivery_record'),(55,'Can delete 简历投递记录',14,'delete_delivery_record'),(56,'Can view 简历投递记录',14,'view_delivery_record'),(57,'Can add 求职用户',15,'add_user'),(58,'Can change 求职用户',15,'change_user'),(59,'Can delete 求职用户',15,'delete_user'),(60,'Can view 求职用户',15,'view_user'),(61,'Can add 工作类型',16,'add_jobtype'),(62,'Can change 工作类型',16,'change_jobtype'),(63,'Can delete 工作类型',16,'delete_jobtype'),(64,'Can view 工作类型',16,'view_jobtype'),(65,'Can add 工作经历',17,'add_workexperience'),(66,'Can change 工作经历',17,'change_workexperience'),(67,'Can delete 工作经历',17,'delete_workexperience'),(68,'Can view 工作经历',17,'view_workexperience'),(69,'Can add 邀请面试',18,'add_interview'),(70,'Can change 邀请面试',18,'change_interview'),(71,'Can delete 邀请面试',18,'delete_interview'),(72,'Can view 邀请面试',18,'view_interview');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `coordinate` */

DROP TABLE IF EXISTS `coordinate`;

CREATE TABLE `coordinate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `createTime` datetime(6) NOT NULL,
  `updateTime` datetime(6) NOT NULL,
  `delete` int NOT NULL,
  `lon` double NOT NULL,
  `lat` double NOT NULL,
  `alt` double DEFAULT NULL,
  `coordinate_system` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `coordinate` */

insert  into `coordinate`(`id`,`createTime`,`updateTime`,`delete`,`lon`,`lat`,`alt`,`coordinate_system`) values (1,'2022-04-25 12:14:05.000000','2022-04-25 12:14:06.000000',1,106.32,29.36,0,0);

/*Table structure for table `credentials` */

DROP TABLE IF EXISTS `credentials`;

CREATE TABLE `credentials` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `credentials` */

/*Table structure for table `delivery_record` */

DROP TABLE IF EXISTS `delivery_record`;

CREATE TABLE `delivery_record` (
  `id` int NOT NULL AUTO_INCREMENT,
  `createTime` datetime(6) NOT NULL,
  `updateTime` datetime(6) NOT NULL,
  `delete` int NOT NULL,
  `state` int NOT NULL,
  `position_id` int NOT NULL,
  `resume_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `delivery_record_position_id_6dda7367_fk_position_id` (`position_id`),
  KEY `delivery_record_resume_id_fc489d2a_fk_resume_id` (`resume_id`),
  CONSTRAINT `delivery_record_position_id_6dda7367_fk_position_id` FOREIGN KEY (`position_id`) REFERENCES `position` (`id`),
  CONSTRAINT `delivery_record_resume_id_fc489d2a_fk_resume_id` FOREIGN KEY (`resume_id`) REFERENCES `resume` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `delivery_record` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_general_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'enterprise','basegeocoordinatefiled'),(8,'enterprise','enterprise'),(9,'enterprise','label'),(10,'enterprise','position'),(11,'Job_seekers','credentials'),(14,'Job_seekers','delivery_record'),(18,'Job_seekers','interview'),(16,'Job_seekers','jobtype'),(12,'Job_seekers','projectexperience'),(13,'Job_seekers','resume'),(15,'Job_seekers','user'),(17,'Job_seekers','workexperience'),(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (1,'contenttypes','0001_initial','2022-04-24 08:43:11.638937'),(2,'auth','0001_initial','2022-04-24 08:43:17.175571'),(3,'admin','0001_initial','2022-04-24 08:43:18.178838'),(4,'admin','0002_logentry_remove_auto_add','2022-04-24 08:43:18.221511'),(5,'admin','0003_logentry_add_action_flag_choices','2022-04-24 08:43:18.265602'),(6,'contenttypes','0002_remove_content_type_name','2022-04-24 08:43:19.040061'),(7,'auth','0002_alter_permission_name_max_length','2022-04-24 08:43:19.454946'),(8,'auth','0003_alter_user_email_max_length','2022-04-24 08:43:19.545889'),(9,'auth','0004_alter_user_username_opts','2022-04-24 08:43:19.589862'),(10,'auth','0005_alter_user_last_login_null','2022-04-24 08:43:19.941111'),(11,'auth','0006_require_contenttypes_0002','2022-04-24 08:43:19.978088'),(12,'auth','0007_alter_validators_add_error_messages','2022-04-24 08:43:20.010311'),(13,'auth','0008_alter_user_username_max_length','2022-04-24 08:43:20.477875'),(14,'auth','0009_alter_user_last_name_max_length','2022-04-24 08:43:20.897043'),(15,'auth','0010_alter_group_name_max_length','2022-04-24 08:43:20.995071'),(16,'auth','0011_update_proxy_permissions','2022-04-24 08:43:21.060852'),(17,'auth','0012_alter_user_first_name_max_length','2022-04-24 08:43:21.513598'),(18,'sessions','0001_initial','2022-04-24 08:43:21.855092'),(19,'enterprise','0001_initial','2022-04-24 08:43:34.642275'),(20,'Job_seekers','0001_initial','2022-04-24 08:43:40.784698');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `django_session` */

/*Table structure for table `enterprise` */

DROP TABLE IF EXISTS `enterprise`;

CREATE TABLE `enterprise` (
  `id` int NOT NULL AUTO_INCREMENT,
  `createTime` datetime(6) NOT NULL,
  `updateTime` datetime(6) NOT NULL,
  `delete` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `avatarUrl` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `notes` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(254) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `passWord` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `introduction` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `founded` varchar(55) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `registered_capital` varchar(55) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `employees` varchar(55) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `corporate_representative` varchar(55) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `coordinate_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `enterprise_coordinate_id_1838542a_fk_coordinate_id` (`coordinate_id`),
  CONSTRAINT `enterprise_coordinate_id_1838542a_fk_coordinate_id` FOREIGN KEY (`coordinate_id`) REFERENCES `coordinate` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `enterprise` */

insert  into `enterprise`(`id`,`createTime`,`updateTime`,`delete`,`name`,`avatarUrl`,`notes`,`address`,`phone`,`email`,`passWord`,`introduction`,`founded`,`registered_capital`,`employees`,`corporate_representative`,`coordinate_id`) values (1,'2022-04-25 12:14:29.000000','2022-04-25 12:14:31.000000',1,'test1','123.jpg',NULL,'重庆渝北','023-145678923',NULL,'123456','公司成立于..','2012-12-06','1000万','50~100','张三',1);

/*Table structure for table `interview` */

DROP TABLE IF EXISTS `interview`;

CREATE TABLE `interview` (
  `id` int NOT NULL AUTO_INCREMENT,
  `createTime` datetime(6) NOT NULL,
  `updateTime` datetime(6) NOT NULL,
  `delete` int NOT NULL,
  `interviewTime` datetime(6) DEFAULT NULL,
  `interview_address` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `state` int NOT NULL,
  `position_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `interview_position_id_d53dfacc_fk_position_id` (`position_id`),
  KEY `interview_user_id_f3f4b68a_fk_user_id` (`user_id`),
  CONSTRAINT `interview_position_id_d53dfacc_fk_position_id` FOREIGN KEY (`position_id`) REFERENCES `position` (`id`),
  CONSTRAINT `interview_user_id_f3f4b68a_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `interview` */

/*Table structure for table `job_type` */

DROP TABLE IF EXISTS `job_type`;

CREATE TABLE `job_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `sub_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_type_sub_id_c2d939ca_fk_job_type_id` (`sub_id`),
  CONSTRAINT `job_type_sub_id_c2d939ca_fk_job_type_id` FOREIGN KEY (`sub_id`) REFERENCES `job_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `job_type` */

/*Table structure for table `label` */

DROP TABLE IF EXISTS `label`;

CREATE TABLE `label` (
  `id` int NOT NULL AUTO_INCREMENT,
  `label` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `label` */

/*Table structure for table `position` */

DROP TABLE IF EXISTS `position`;

CREATE TABLE `position` (
  `id` int NOT NULL AUTO_INCREMENT,
  `createTime` datetime(6) NOT NULL,
  `updateTime` datetime(6) NOT NULL,
  `delete` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `min_salary` int DEFAULT NULL,
  `max_salary` int DEFAULT NULL,
  `job_requirement` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `recruits` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `releaseTime` datetime(6) NOT NULL,
  `job_address` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `state` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `position` */

/*Table structure for table `position_table` */

DROP TABLE IF EXISTS `position_table`;

CREATE TABLE `position_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `position_id` int NOT NULL,
  `label_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `position_table_position_id_label_id_2eb91cc5_uniq` (`position_id`,`label_id`),
  KEY `position_table_label_id_3141b2f0_fk_label_id` (`label_id`),
  CONSTRAINT `position_table_label_id_3141b2f0_fk_label_id` FOREIGN KEY (`label_id`) REFERENCES `label` (`id`),
  CONSTRAINT `position_table_position_id_db5cfcba_fk_position_id` FOREIGN KEY (`position_id`) REFERENCES `position` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `position_table` */

/*Table structure for table `project_experience` */

DROP TABLE IF EXISTS `project_experience`;

CREATE TABLE `project_experience` (
  `id` int NOT NULL AUTO_INCREMENT,
  `createTime` datetime(6) NOT NULL,
  `updateTime` datetime(6) NOT NULL,
  `delete` int NOT NULL,
  `startTime` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `endTime` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `project_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `project_description` varchar(1000) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `project_experience` */

/*Table structure for table `resume` */

DROP TABLE IF EXISTS `resume`;

CREATE TABLE `resume` (
  `id` int NOT NULL AUTO_INCREMENT,
  `createTime` datetime(6) NOT NULL,
  `updateTime` datetime(6) NOT NULL,
  `delete` int NOT NULL,
  `self_assessment` varchar(2000) COLLATE utf8mb4_general_ci NOT NULL,
  `job_type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_type_id` (`job_type_id`),
  CONSTRAINT `resume_job_type_id_efa542c9_fk_job_type_id` FOREIGN KEY (`job_type_id`) REFERENCES `job_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `resume` */

/*Table structure for table `resume_label` */

DROP TABLE IF EXISTS `resume_label`;

CREATE TABLE `resume_label` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `resume_id` int NOT NULL,
  `label_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `resume_label_resume_id_label_id_adb59b4f_uniq` (`resume_id`,`label_id`),
  KEY `resume_label_label_id_55b86b8e_fk_label_id` (`label_id`),
  CONSTRAINT `resume_label_label_id_55b86b8e_fk_label_id` FOREIGN KEY (`label_id`) REFERENCES `label` (`id`),
  CONSTRAINT `resume_label_resume_id_e212c9fb_fk_resume_id` FOREIGN KEY (`resume_id`) REFERENCES `resume` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `resume_label` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `createTime` datetime(6) NOT NULL,
  `updateTime` datetime(6) NOT NULL,
  `delete` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `avatarUrl` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `notes` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(254) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `passWord` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `birthday` datetime(6) NOT NULL,
  `height` int DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `qualifications` varchar(55) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gender` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `user` */

insert  into `user`(`id`,`createTime`,`updateTime`,`delete`,`name`,`avatarUrl`,`notes`,`address`,`phone`,`email`,`passWord`,`birthday`,`height`,`weight`,`qualifications`,`gender`) values (1,'2022-04-25 12:17:26.000000','2022-04-25 12:17:29.000000',1,'test1','456.jpg',NULL,'重庆渝北','023-2567893',NULL,'123456','2009-01-13 12:18:09.000000',165,50,'本科',1);

/*Table structure for table `work_experience` */

DROP TABLE IF EXISTS `work_experience`;

CREATE TABLE `work_experience` (
  `id` int NOT NULL AUTO_INCREMENT,
  `createTime` datetime(6) NOT NULL,
  `updateTime` datetime(6) NOT NULL,
  `delete` int NOT NULL,
  `startTime` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `endTime` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `enterprise_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `job_description` varchar(1000) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `work_experience` */

/*Table structure for table `work_experience_label` */

DROP TABLE IF EXISTS `work_experience_label`;

CREATE TABLE `work_experience_label` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `workexperience_id` int NOT NULL,
  `label_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Work_experience_label_workexperience_id_label_id_e6528432_uniq` (`workexperience_id`,`label_id`),
  KEY `Work_experience_label_label_id_a42cb87d_fk_label_id` (`label_id`),
  CONSTRAINT `Work_experience_labe_workexperience_id_59026170_fk_work_expe` FOREIGN KEY (`workexperience_id`) REFERENCES `work_experience` (`id`),
  CONSTRAINT `Work_experience_label_label_id_a42cb87d_fk_label_id` FOREIGN KEY (`label_id`) REFERENCES `label` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `work_experience_label` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
