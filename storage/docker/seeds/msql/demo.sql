
Warning: Declaration of Min_DB::connect($N, $V, $G) should be compatible with mysqli::connect($host = NULL, $user = NULL, $password = NULL, $database = NULL, $port = NULL, $socket = NULL) in /home/virtwww/w_fitness-cowberr_1c526b2b/http/frontend/web/js/adminer.php on line 1171
-- Adminer 4.2.1 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `achievements`;
CREATE TABLE `achievements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcat` int(11) DEFAULT NULL,
  `dat` timestamp NULL DEFAULT NULL,
  `dat_update` timestamp NULL DEFAULT NULL,
  `name` varchar(2048) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `tag` int(11) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `program_date_id` int(11) DEFAULT NULL,
  `date_achieved` timestamp NULL DEFAULT NULL,
  `exercise_id` int(11) DEFAULT NULL,
  `record` varchar(1000) DEFAULT NULL,
  `comment` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `albums`;
CREATE TABLE `albums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcat` int(11) DEFAULT NULL,
  `dat` timestamp NULL DEFAULT NULL,
  `dat_update` timestamp NULL DEFAULT NULL,
  `name` varchar(2048) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `tag` int(11) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `idx-auth_assignment-user_id` (`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('Admin',	'1',	1565966236);

DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('Admin',	1,	'Администратор',	NULL,	NULL,	1565966236,	1565966236),
('User',	1,	'Пользователь',	NULL,	NULL,	1565966236,	1565966236);

DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(6028) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `coaches_relations`;
CREATE TABLE `coaches_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `coach_id` int(11) DEFAULT NULL,
  `dat` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcat` int(11) DEFAULT NULL,
  `dat` timestamp NULL DEFAULT NULL,
  `dat_update` timestamp NULL DEFAULT NULL,
  `name` varchar(2048) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `tag` int(11) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `object` varchar(1000) DEFAULT NULL,
  `object_id` double DEFAULT NULL,
  `text` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `consult`;
CREATE TABLE `consult` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcat` int(11) DEFAULT NULL,
  `dat` timestamp NULL DEFAULT NULL,
  `dat_update` timestamp NULL DEFAULT NULL,
  `name` varchar(2048) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `tag` int(11) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `to_user_id` int(11) DEFAULT NULL,
  `text` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `consult_attach_image`;
CREATE TABLE `consult_attach_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `consult_id` int(11) NOT NULL,
  `photo_id` int(11) NOT NULL,
  `files` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `consult_id` (`consult_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `education`;
CREATE TABLE `education` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcat` int(11) DEFAULT NULL,
  `dat` timestamp NULL DEFAULT NULL,
  `dat_update` timestamp NULL DEFAULT NULL,
  `name` varchar(2048) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `tag` int(11) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `speciality` varchar(1000) DEFAULT NULL,
  `hash` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `exercises`;
CREATE TABLE `exercises` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcat` int(11) DEFAULT NULL,
  `dat` timestamp NULL DEFAULT NULL,
  `dat_update` timestamp NULL DEFAULT NULL,
  `name` varchar(2048) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `tag` int(11) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `photo` int(11) DEFAULT NULL,
  `video` int(11) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `friends`;
CREATE TABLE `friends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id1` int(11) DEFAULT NULL,
  `user_id2` int(11) DEFAULT NULL,
  `dat` timestamp NULL DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `gallery_picture`;
CREATE TABLE `gallery_picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcat` int(11) DEFAULT NULL,
  `dat` timestamp NULL DEFAULT NULL,
  `dat_update` timestamp NULL DEFAULT NULL,
  `name` varchar(2048) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `tag` int(11) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `file` varchar(1024) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `album_id` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcat` int(11) DEFAULT NULL,
  `dat` timestamp NULL DEFAULT NULL,
  `dat_update` timestamp NULL DEFAULT NULL,
  `name` varchar(2048) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `tag` int(11) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `avatar` varchar(1024) DEFAULT NULL,
  `descr` varchar(1000) DEFAULT NULL,
  `status` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `groups_users_applicants`;
CREATE TABLE `groups_users_applicants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dest` int(11) DEFAULT NULL,
  `tag` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcat` int(11) DEFAULT NULL,
  `dat` timestamp NULL DEFAULT NULL,
  `dat_update` timestamp NULL DEFAULT NULL,
  `name` varchar(2048) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `tag` int(11) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `object` varchar(100) DEFAULT NULL,
  `object_id` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `log_api`;
CREATE TABLE `log_api` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `controller` varchar(255) NOT NULL,
  `method` varchar(255) NOT NULL,
  `request` varchar(4096) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `log_api-status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `materials`;
CREATE TABLE `materials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcat` int(11) DEFAULT NULL,
  `dat` timestamp NULL DEFAULT NULL,
  `dat_update` timestamp NULL DEFAULT NULL,
  `name` varchar(2048) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `tag` int(11) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `subtitle` varchar(1000) DEFAULT NULL,
  `short` varchar(1000) DEFAULT NULL,
  `pic` varchar(1024) DEFAULT NULL,
  `meta_title` varchar(1000) DEFAULT NULL,
  `meta_keywords` varchar(1000) DEFAULT NULL,
  `meta_description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `materials_attach_image`;
CREATE TABLE `materials_attach_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `materials_id` int(11) NOT NULL,
  `photo_id` int(11) NOT NULL,
  `files` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `materials_id` (`materials_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `materials_attach_video`;
CREATE TABLE `materials_attach_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `materials_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `files` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `materials_id` (`materials_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base',	1562591443),
('m140506_102106_rbac_init',	1562591458),
('m150214_044831_init_user',	1562591452),
('m170907_052038_rbac_add_index_on_auth_assignment_user_id',	1562591459),
('m180523_151638_rbac_updates_indexes_without_prefix',	1562591459),
('m190721_125850_create_albums_table',	1565965428),
('m190721_130729_create_users_table',	1565965429),
('m190816_142909_materials_attach_video',	1565965774),
('m190816_143006_materials_attach_image',	1565965828),
('m190816_143113_consult_attach_image',	1565965904),
('m190816_143254_log_api',	1565965990),
('m190816_143353_init_user',	1565966116),
('m190816_143559_settings',	1565966188),
('m190816_143703_init',	1565966236),
('m190816_143827_achievements',	1565966540),
('m190816_144434_coaches_relations',	1565966837),
('m190816_144756_comments',	1565967131),
('m190816_145502_consult',	1565967414),
('m190816_145809_education',	1565967607),
('m190822_130942_exercises',	1566479540),
('m190822_131308_friends',	1566479753),
('m190822_131629_groups',	1566480028),
('m190822_132110_groups_users_applicants',	1566480148),
('m190822_132712_likes',	1566480540),
('m190822_133251_materials',	1566480948),
('m190822_133922_notifications',	1566481339),
('m190822_134453_gallery_picture',	1566481620),
('m190823_122957_program_dates',	1566563540),
('m190823_123258_programs',	1566563689),
('m190823_123624_program_sets',	1566563886),
('m190823_123855_programs_purposes_purposes',	1566564004),
('m190823_124133_purposes',	1566564164),
('m190823_124603_rating',	1566564433),
('m190823_124850_training_units',	1566564767),
('m190823_125341_users_groups_membership',	1566564927),
('m190823_125637_users_purposes_spec',	1566565030),
('m190823_125818_videos',	1566565233),
('m190823_130332_videos',	1566565444),
('m190823_130459_category',	1566565606);

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcat` int(11) DEFAULT NULL,
  `dat` timestamp NULL DEFAULT NULL,
  `dat_update` timestamp NULL DEFAULT NULL,
  `name` varchar(2048) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `tag` int(11) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `kind` varchar(1000) DEFAULT NULL,
  `id_kind` int(11) DEFAULT NULL,
  `checked` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timezone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profile_user_id` (`user_id`),
  CONSTRAINT `profile_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `profile` (`id`, `user_id`, `created_at`, `updated_at`, `full_name`, `timezone`) VALUES
(1,	1,	'2019-07-08 10:10:52',	NULL,	'the one',	NULL),
(2,	1,	'2019-09-05 10:00:14',	'2019-09-05 10:00:14',	NULL,	NULL);

DROP TABLE IF EXISTS `programs`;
CREATE TABLE `programs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcat` int(11) DEFAULT NULL,
  `dat` timestamp NULL DEFAULT NULL,
  `dat_update` timestamp NULL DEFAULT NULL,
  `name` varchar(2048) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `tag` int(11) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `available_from` timestamp NULL DEFAULT NULL,
  `available_till` timestamp NULL DEFAULT NULL,
  `assignee` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `programs_purposes_purposes`;
CREATE TABLE `programs_purposes_purposes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dest` int(11) DEFAULT NULL,
  `tag` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `program_dates`;
CREATE TABLE `program_dates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcat` int(11) DEFAULT NULL,
  `dat` timestamp NULL DEFAULT NULL,
  `dat_update` timestamp NULL DEFAULT NULL,
  `name` varchar(2048) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `tag` int(11) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `program` int(11) DEFAULT NULL,
  `training_date` timestamp NULL DEFAULT NULL,
  `program_set` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `program_sets`;
CREATE TABLE `program_sets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcat` int(11) DEFAULT NULL,
  `dat` timestamp NULL DEFAULT NULL,
  `dat_update` timestamp NULL DEFAULT NULL,
  `name` varchar(2048) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `tag` int(11) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `program_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `purposes`;
CREATE TABLE `purposes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcat` int(11) DEFAULT NULL,
  `dat` timestamp NULL DEFAULT NULL,
  `dat_update` timestamp NULL DEFAULT NULL,
  `name` varchar(2048) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `tag` int(11) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `prop` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `rating`;
CREATE TABLE `rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcat` int(11) DEFAULT NULL,
  `dat` timestamp NULL DEFAULT NULL,
  `dat_update` timestamp NULL DEFAULT NULL,
  `name` varchar(2048) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `tag` int(11) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `mark` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `can_admin` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `role` (`id`, `name`, `created_at`, `updated_at`, `can_admin`) VALUES
(1,	'Admin',	'2019-07-08 10:10:52',	NULL,	1),
(2,	'User',	'2019-07-08 10:10:52',	NULL,	0);

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) NOT NULL COMMENT 'Ключ',
  `value` text NOT NULL COMMENT 'Текст сообщения',
  `description` varchar(255) DEFAULT NULL COMMENT 'Описание',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `training_units`;
CREATE TABLE `training_units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcat` int(11) DEFAULT NULL,
  `dat` timestamp NULL DEFAULT NULL,
  `dat_update` timestamp NULL DEFAULT NULL,
  `name` varchar(2048) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `tag` int(11) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `exercise` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `repeats` varchar(1000) DEFAULT NULL,
  `rest_time` varchar(1000) DEFAULT NULL,
  `photo` int(11) DEFAULT NULL,
  `video` int(11) DEFAULT NULL,
  `coach_comment` varchar(1000) DEFAULT NULL,
  `program_sets_id` int(11) DEFAULT NULL,
  `weight` varchar(1000) DEFAULT NULL,
  `full_rest` int(11) DEFAULT NULL,
  `alt_time` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logged_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logged_in_at` timestamp NULL DEFAULT NULL,
  `created_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `banned_at` timestamp NULL DEFAULT NULL,
  `banned_reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_email` (`email`),
  UNIQUE KEY `user_username` (`username`),
  KEY `user_role_id` (`role_id`),
  CONSTRAINT `user_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `user` (`id`, `role_id`, `status`, `email`, `username`, `password`, `auth_key`, `access_token`, `logged_in_ip`, `logged_in_at`, `created_ip`, `created_at`, `updated_at`, `banned_at`, `banned_reason`) VALUES
(1,	1,	1,	'neo@neo.com',	'neo',	'$2y$13$dyVw4WkZGkABf2UrGWrhHO4ZmVBv.K4puhOL59Y9jQhIdj63TlV.O',	'ik9X7_fheKPtZCZw67r5cQ_9TZzSzDxn',	'A4TT-SJ4yrxb7c86Lwer5K4iwSHRe11G',	NULL,	NULL,	NULL,	'2019-07-08 10:10:52',	NULL,	NULL,	NULL);

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `describ` varchar(1000) DEFAULT NULL,
  `date_reg` varchar(255) DEFAULT NULL,
  `last_login` varchar(255) DEFAULT NULL,
  `disabled` int(11) DEFAULT NULL,
  `external` int(11) DEFAULT NULL,
  `external_id` varchar(255) DEFAULT NULL,
  `avatar` varchar(1024) DEFAULT NULL,
  `publicEmail` varchar(1000) DEFAULT NULL,
  `publicPhone` varchar(1000) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `vk_url` varchar(1000) DEFAULT NULL,
  `fb_url` varchar(1000) DEFAULT NULL,
  `tw_url` varchar(1000) DEFAULT NULL,
  `gp_url` varchar(1000) DEFAULT NULL,
  `mark` varchar(1000) DEFAULT NULL,
  `experience` double DEFAULT NULL,
  `occupation` varchar(1000) DEFAULT NULL,
  `rank` varchar(1000) DEFAULT NULL,
  `tempo` varchar(255) DEFAULT NULL,
  `favourite_sports` varchar(1000) DEFAULT NULL,
  `favourite_resttype` varchar(1000) DEFAULT NULL,
  `business_account` varchar(50) DEFAULT NULL,
  `business_inn` varchar(50) DEFAULT NULL,
  `business_kpp` varchar(50) DEFAULT NULL,
  `need_coach` int(11) DEFAULT NULL,
  `business_birthday` varchar(255) DEFAULT NULL,
  `business_address_reg` varchar(1000) DEFAULT NULL,
  `business_address_fact` varchar(1000) DEFAULT NULL,
  `business_passport` int(11) DEFAULT NULL,
  `business_passport_number` int(11) DEFAULT NULL,
  `business_passport_got` varchar(1000) DEFAULT NULL,
  `business_passport_fio` varchar(300) DEFAULT NULL,
  `business_account_corresp` varchar(200) DEFAULT NULL,
  `business_bank` varchar(1000) DEFAULT NULL,
  `business_bik` varchar(100) DEFAULT NULL,
  `business_contract` varchar(1000) DEFAULT NULL,
  `is_viewed` int(11) DEFAULT NULL,
  `auth_key` varchar(255) DEFAULT NULL COMMENT 'Токен',
  `banned_at` timestamp NULL DEFAULT NULL,
  `access_token` varchar(255) DEFAULT NULL COMMENT 'Токен',
  `banned_reason` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `external` (`external`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `users` (`id`, `login`, `name`, `password`, `email`, `describ`, `date_reg`, `last_login`, `disabled`, `external`, `external_id`, `avatar`, `publicEmail`, `publicPhone`, `gender`, `age`, `vk_url`, `fb_url`, `tw_url`, `gp_url`, `mark`, `experience`, `occupation`, `rank`, `tempo`, `favourite_sports`, `favourite_resttype`, `business_account`, `business_inn`, `business_kpp`, `need_coach`, `business_birthday`, `business_address_reg`, `business_address_fact`, `business_passport`, `business_passport_number`, `business_passport_got`, `business_passport_fio`, `business_account_corresp`, `business_bank`, `business_bik`, `business_contract`, `is_viewed`, `auth_key`, `banned_at`, `access_token`, `banned_reason`, `status`) VALUES
(1,	'test',	NULL,	'e10adc3949ba59abbe56e057f20f883e',	'test@gmail.com',	NULL,	'2019-09-05 16:00:14',	'2019-10-14 15:21:37',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'cPWe2jsb91Wl3FDBvEHC7-b3NQNkXxyG',	NULL,	'kLJgRlI4aOHIYrxsaeWpPWt75HhuSFki',	NULL,	2);

DROP TABLE IF EXISTS `users_groups_membership`;
CREATE TABLE `users_groups_membership` (
  `user_id` varchar(255) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `users_purposes_spec`;
CREATE TABLE `users_purposes_spec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dest` int(11) DEFAULT NULL,
  `tag` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `user_auth`;
CREATE TABLE `user_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `provider_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `provider_attributes` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_auth_provider_id` (`provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `user_token`;
CREATE TABLE `user_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `type` smallint(6) NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_token_token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `user_token` (`id`, `user_id`, `type`, `token`, `data`, `created_at`, `expired_at`) VALUES
(1,	1,	2,	'JvAzbAK2ntS0Rmz2Lskiaf70K1LRc6je',	NULL,	'2019-09-05 10:00:14',	NULL);

DROP TABLE IF EXISTS `videos`;
CREATE TABLE `videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcat` int(11) DEFAULT NULL,
  `dat` timestamp NULL DEFAULT NULL,
  `dat_update` timestamp NULL DEFAULT NULL,
  `name` varchar(2048) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `tag` int(11) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `link` varchar(1024) DEFAULT NULL,
  `choise` int(11) DEFAULT NULL,
  `preview_image` varchar(1024) DEFAULT NULL,
  `file` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 2019-10-14 12:40:41
