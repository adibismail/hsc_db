CREATE DATABASE  IF NOT EXISTS `hsc_localhost_250321` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hsc_localhost_250321`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: hsc-1.cpbju5kqfree.ap-southeast-1.rds.amazonaws.com    Database: hsc_localhost_250321
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `activity_log_table`
--

DROP TABLE IF EXISTS `activity_log_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_log_table` (
  `log_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `log_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gateway_id` bigint unsigned DEFAULT NULL,
  `beacon_id` bigint unsigned DEFAULT NULL,
  `rssi` bigint DEFAULT NULL,
  `battery_level` float DEFAULT NULL,
  `x_value` float DEFAULT NULL,
  `y_value` float DEFAULT NULL,
  `z_value` float DEFAULT NULL,
  `rawData` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50621 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `alerts_table`
--

DROP TABLE IF EXISTS `alerts_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alerts_table` (
  `alert_id` bigint NOT NULL AUTO_INCREMENT,
  `beacon_id` bigint unsigned DEFAULT NULL,
  `occured_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `resolved_at` timestamp NULL DEFAULT NULL,
  `reader_id` bigint unsigned DEFAULT NULL,
  `rules_id` bigint unsigned DEFAULT NULL,
  `action` tinyint(1) DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`alert_id`),
  KEY `rules_id` (`rules_id`),
  KEY `user_id` (`user_id`),
  KEY `reader_id` (`reader_id`),
  KEY `beacon_id` (`beacon_id`),
  CONSTRAINT `alerts_table_ibfk_1` FOREIGN KEY (`rules_id`) REFERENCES `rules_table` (`rules_id`),
  CONSTRAINT `alerts_table_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users_table` (`user_id`),
  CONSTRAINT `alerts_table_ibfk_3` FOREIGN KEY (`reader_id`) REFERENCES `gateways_table` (`gateway_id`),
  CONSTRAINT `alerts_table_ibfk_4` FOREIGN KEY (`beacon_id`) REFERENCES `beacons_table` (`beacon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `beacons_table`
--

DROP TABLE IF EXISTS `beacons_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `beacons_table` (
  `beacon_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `beacon_type` int unsigned DEFAULT NULL,
  `beacon_mac` varchar(17) DEFAULT NULL,
  `current_loc` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`beacon_id`),
  UNIQUE KEY `beacon_id` (`beacon_id`),
  KEY `beacon_type` (`beacon_type`),
  KEY `current_loc` (`current_loc`),
  CONSTRAINT `beacons_table_ibfk_1` FOREIGN KEY (`beacon_type`) REFERENCES `beacons_type_table` (`beacon_type_id`),
  CONSTRAINT `beacons_table_ibfk_2` FOREIGN KEY (`current_loc`) REFERENCES `gateways_table` (`gateway_id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `beacons_type_table`
--

DROP TABLE IF EXISTS `beacons_type_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `beacons_type_table` (
  `beacon_type_id` int unsigned NOT NULL AUTO_INCREMENT,
  `beacon_type_desc` tinytext,
  PRIMARY KEY (`beacon_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `buildings_table`
--

DROP TABLE IF EXISTS `buildings_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buildings_table` (
  `building_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `detail` text,
  `floor_num` int NOT NULL,
  `address` varchar(255) NOT NULL,
  `lat` double(8,2) DEFAULT NULL,
  `lng` double(8,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `id` int DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`building_id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `floors_table`
--

DROP TABLE IF EXISTS `floors_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `floors_table` (
  `floor_id` int unsigned NOT NULL AUTO_INCREMENT,
  `id` bigint unsigned NOT NULL,
  `number` int NOT NULL,
  `building_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `alias` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`floor_id`),
  UNIQUE KEY `floors_table_id_unique` (`id`),
  KEY `building_id` (`building_id`),
  CONSTRAINT `floors_table_ibfk_1` FOREIGN KEY (`building_id`) REFERENCES `buildings_table` (`building_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gateway_zones`
--

DROP TABLE IF EXISTS `gateway_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gateway_zones` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `geoJson` longtext NOT NULL,
  `mac_addr` varchar(17) NOT NULL,
  `location` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image_id` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gateway_zones_mac_addr_foreign` (`mac_addr`),
  CONSTRAINT `gateway_zones_mac_addr_foreign` FOREIGN KEY (`mac_addr`) REFERENCES `gateways_table` (`mac_addr`) ON DELETE CASCADE,
  CONSTRAINT `gateway_zones_chk_1` CHECK (json_valid(`geoJson`))
) ENGINE=InnoDB AUTO_INCREMENT=600 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gateways_table`
--

DROP TABLE IF EXISTS `gateways_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gateways_table` (
  `gateway_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `mac_addr` varchar(17) DEFAULT NULL,
  `reader_ip` varchar(45) DEFAULT NULL,
  `location_id` bigint unsigned DEFAULT NULL,
  `reader_status` tinyint(1) DEFAULT NULL,
  `up_status` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `down_status` timestamp NULL DEFAULT NULL,
  `assigned` tinyint(1) DEFAULT NULL,
  `serial` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`gateway_id`),
  UNIQUE KEY `gateways_table_mac_addr_unique` (`mac_addr`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `gateways_table_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `locations_master_table` (`location_master_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=425 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locations_master_table`
--

DROP TABLE IF EXISTS `locations_master_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations_master_table` (
  `location_master_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `location_type_id` bigint unsigned DEFAULT NULL,
  `parent_location_id` bigint unsigned DEFAULT NULL,
  `location_description` varchar(255) DEFAULT NULL,
  `floor` int unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`location_master_id`),
  KEY `location_type_id` (`location_type_id`),
  KEY `floor` (`floor`),
  CONSTRAINT `locations_master_table_ibfk_1` FOREIGN KEY (`location_type_id`) REFERENCES `locations_type_table` (`type_id`),
  CONSTRAINT `locations_master_table_ibfk_2` FOREIGN KEY (`floor`) REFERENCES `floors_table` (`floor_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locations_type_table`
--

DROP TABLE IF EXISTS `locations_type_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations_type_table` (
  `type_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `location_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `map_files`
--

DROP TABLE IF EXISTS `map_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `map_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `floor_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `map_files_floor_id_unique` (`floor_id`),
  CONSTRAINT `map_files_floor_id_foreign` FOREIGN KEY (`floor_id`) REFERENCES `floors_table` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `residents_table`
--

DROP TABLE IF EXISTS `residents_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `residents_table` (
  `resident_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `beacon_id` bigint unsigned DEFAULT NULL,
  `resident_fName` varchar(45) DEFAULT NULL,
  `resident_lName` varchar(45) DEFAULT NULL,
  `resident_age` int DEFAULT NULL,
  `wheelchair` tinyint(1) DEFAULT NULL,
  `walking_cane` tinyint(1) DEFAULT NULL,
  `x_value` float DEFAULT NULL,
  `y_value` float DEFAULT NULL,
  `z_value` float DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `gender` varchar(1) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`resident_id`),
  UNIQUE KEY `resident_id` (`resident_id`),
  KEY `beacon_id` (`beacon_id`),
  CONSTRAINT `residents_table_ibfk_1` FOREIGN KEY (`beacon_id`) REFERENCES `beacons_table` (`beacon_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`),
  UNIQUE KEY `roles_color_unique` (`color`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rules_beacon_table`
--

DROP TABLE IF EXISTS `rules_beacon_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rules_beacon_table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `beacon_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `beacon_id` (`beacon_id`),
  CONSTRAINT `rules_beacon_table_ibfk_1` FOREIGN KEY (`beacon_id`) REFERENCES `beacons_table` (`beacon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rules_table`
--

DROP TABLE IF EXISTS `rules_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rules_table` (
  `rules_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `x_threshold` float DEFAULT NULL,
  `y_threshold` float DEFAULT NULL,
  `z_threshold` float DEFAULT NULL,
  `x_frequency` int DEFAULT NULL,
  `y_frequency` int DEFAULT NULL,
  `z_frequency` int DEFAULT NULL,
  `alert_action` tinyint(1) DEFAULT NULL,
  `attendance` tinyint(1) DEFAULT NULL,
  `geofence` tinyint(1) DEFAULT NULL,
  `rules_type_id` bigint unsigned DEFAULT NULL,
  `scope_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `battery_threshold` int DEFAULT NULL,
  PRIMARY KEY (`rules_id`),
  KEY `rules_type_id` (`rules_type_id`),
  KEY `scope_id` (`scope_id`),
  CONSTRAINT `rules_table_ibfk_1` FOREIGN KEY (`rules_type_id`) REFERENCES `rules_type_table` (`rules_type_id`),
  CONSTRAINT `rules_table_ibfk_2` FOREIGN KEY (`scope_id`) REFERENCES `scopes_table` (`scope_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rules_type_table`
--

DROP TABLE IF EXISTS `rules_type_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rules_type_table` (
  `rules_type_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `rules_type_desc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`rules_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scope_beacons_table`
--

DROP TABLE IF EXISTS `scope_beacons_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scope_beacons_table` (
  `scope_beacon_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `scope_id` bigint unsigned DEFAULT NULL,
  `beacon_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`scope_beacon_id`),
  KEY `scope_id` (`scope_id`),
  KEY `beacon_id` (`beacon_id`),
  CONSTRAINT `scope_beacons_table_ibfk_1` FOREIGN KEY (`scope_id`) REFERENCES `scopes_table` (`scope_id`),
  CONSTRAINT `scope_beacons_table_ibfk_2` FOREIGN KEY (`beacon_id`) REFERENCES `beacons_table` (`beacon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4582 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scope_locations_master_table`
--

DROP TABLE IF EXISTS `scope_locations_master_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scope_locations_master_table` (
  `scope_location_master_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `scope_id` bigint unsigned DEFAULT NULL,
  `location_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`scope_location_master_id`),
  KEY `scope_id` (`scope_id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `scope_locations_master_table_ibfk_1` FOREIGN KEY (`scope_id`) REFERENCES `scopes_table` (`scope_id`),
  CONSTRAINT `scope_locations_master_table_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `locations_master_table` (`location_master_id`)
) ENGINE=InnoDB AUTO_INCREMENT=861 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scopes_table`
--

DROP TABLE IF EXISTS `scopes_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scopes_table` (
  `scope_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `gateway_dwell_time` varchar(45) DEFAULT NULL,
  `days` bit(7) DEFAULT NULL,
  `start_time` time NOT NULL,
  `duration` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`scope_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_right_table`
--

DROP TABLE IF EXISTS `users_right_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_right_table` (
  `user_right_id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `restriction` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_right_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_table`
--

DROP TABLE IF EXISTS `users_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_table` (
  `user_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `beacon_id` bigint unsigned DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  `right_id` int DEFAULT NULL,
  `fName` varchar(20) DEFAULT NULL,
  `lName` varchar(20) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `gender` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `type_id` (`type_id`),
  KEY `right_id` (`right_id`),
  KEY `beacon_id` (`beacon_id`),
  CONSTRAINT `users_table_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `users_type_table` (`user_type_id`),
  CONSTRAINT `users_table_ibfk_2` FOREIGN KEY (`right_id`) REFERENCES `users_right_table` (`user_right_id`),
  CONSTRAINT `users_table_ibfk_3` FOREIGN KEY (`beacon_id`) REFERENCES `beacons_table` (`beacon_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_type_table`
--

DROP TABLE IF EXISTS `users_type_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_type_table` (
  `user_type_id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(20) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-19 15:06:21
