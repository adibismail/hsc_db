-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 16, 2021 at 10:39 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `2`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log_table`
--

CREATE TABLE `activity_log_table` (
  `log_id` bigint(20) UNSIGNED NOT NULL,
  `log_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `gateway_id` bigint(20) UNSIGNED DEFAULT NULL,
  `beacon_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rssi` bigint(20) DEFAULT NULL,
  `battery_level` float DEFAULT NULL,
  `x_value` float DEFAULT NULL,
  `y_value` float DEFAULT NULL,
  `z_value` float DEFAULT NULL,
  `rawData` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `alerts_table`
--

CREATE TABLE `alerts_table` (
  `alert_id` bigint(20) NOT NULL,
  `occured_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `resolved_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reader_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rules_id` bigint(20) UNSIGNED DEFAULT NULL,
  `action` tinyint(4) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `beacons_table`
--

CREATE TABLE `beacons_table` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `beacon_type` int(10) UNSIGNED DEFAULT NULL,
  `beacon_mac` varchar(17) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `beacons_type_table`
--

CREATE TABLE `beacons_type_table` (
  `beacon_type_id` int(10) UNSIGNED NOT NULL,
  `beacon_type_desc` tinytext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `buildings_table`
--

CREATE TABLE `buildings_table` (
  `building_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `detail` text DEFAULT NULL,
  `floor_num` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `lat` double(8,2) NOT NULL,
  `lng` double(8,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `floors_table`
--

CREATE TABLE `floors_table` (
  `floor_id` int(10) UNSIGNED NOT NULL,
  `id` bigint(20) UNSIGNED NOT NULL,
  `number` int(11) NOT NULL,
  `building_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gateways_table`
--

CREATE TABLE `gateways_table` (
  `gateway_id` bigint(20) UNSIGNED NOT NULL,
  `mac_addr` varchar(17) DEFAULT NULL,
  `reader_ip` varchar(45) DEFAULT NULL,
  `location_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reader_status` tinyint(4) DEFAULT NULL,
  `up_status` tinytext DEFAULT NULL,
  `assigned` tinyint(4) DEFAULT NULL,
  `serial` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `locations_master_table`
--

CREATE TABLE `locations_master_table` (
  `location_master_id` bigint(20) UNSIGNED NOT NULL,
  `location_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `parent_location_id` bigint(20) UNSIGNED DEFAULT NULL,
  `location_description` tinytext DEFAULT NULL,
  `floor` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `locations_type_table`
--

CREATE TABLE `locations_type_table` (
  `type_id` bigint(20) UNSIGNED NOT NULL,
  `location_type` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `residents_table`
--

CREATE TABLE `residents_table` (
  `resident_id` bigint(20) UNSIGNED NOT NULL,
  `beacon_id` bigint(20) UNSIGNED DEFAULT NULL,
  `resident_fName` tinytext DEFAULT NULL,
  `resident_lName` tinytext DEFAULT NULL,
  `resident_age` int(11) DEFAULT NULL,
  `wheelchair` tinyint(4) DEFAULT NULL,
  `walking_cane` tinyint(4) DEFAULT NULL,
  `x_value` float DEFAULT NULL,
  `y_value` float DEFAULT NULL,
  `z_value` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rules_table`
--

CREATE TABLE `rules_table` (
  `rules_id` bigint(20) UNSIGNED NOT NULL,
  `description` tinytext DEFAULT NULL,
  `x_threshold` float DEFAULT NULL,
  `y_threshold` float DEFAULT NULL,
  `z_threshold` float DEFAULT NULL,
  `x_frequency` int(11) DEFAULT NULL,
  `y_frequency` int(11) DEFAULT NULL,
  `z_frequency` int(11) DEFAULT NULL,
  `alert_option` tinyint(4) DEFAULT NULL,
  `attendance` tinyint(4) DEFAULT NULL,
  `geoence` tinyint(4) DEFAULT NULL,
  `rules_type_id` bigint(20) UNSIGNED NOT NULL,
  `scope_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rules_type_table`
--

CREATE TABLE `rules_type_table` (
  `rules_type_id` bigint(20) UNSIGNED NOT NULL,
  `rules_type_desc` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `scopes_table`
--

CREATE TABLE `scopes_table` (
  `scope_id` int(10) UNSIGNED NOT NULL,
  `gateway_id` int(10) UNSIGNED DEFAULT NULL,
  `gateway_dwell_time` varchar(45) DEFAULT NULL,
  `start_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `end_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users_right_table`
--

CREATE TABLE `users_right_table` (
  `user_right_id` int(11) NOT NULL,
  `description` tinytext DEFAULT NULL,
  `restriction` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users_table`
--

CREATE TABLE `users_table` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `beacon_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `alert_id` bigint(20) DEFAULT NULL,
  `right_id` int(11) DEFAULT NULL,
  `fName` varchar(20) DEFAULT NULL,
  `lName` varchar(20) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users_type_table`
--

CREATE TABLE `users_type_table` (
  `user_type_id` int(11) NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `description` tinytext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log_table`
--
ALTER TABLE `activity_log_table`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `gateway_id` (`gateway_id`),
  ADD KEY `beacon_id` (`beacon_id`);

--
-- Indexes for table `alerts_table`
--
ALTER TABLE `alerts_table`
  ADD PRIMARY KEY (`alert_id`),
  ADD KEY `rules_id` (`rules_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `reader_id` (`reader_id`);

--
-- Indexes for table `beacons_table`
--
ALTER TABLE `beacons_table`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `beacon_type` (`beacon_type`);

--
-- Indexes for table `beacons_type_table`
--
ALTER TABLE `beacons_type_table`
  ADD PRIMARY KEY (`beacon_type_id`);

--
-- Indexes for table `buildings_table`
--
ALTER TABLE `buildings_table`
  ADD PRIMARY KEY (`building_id`);

--
-- Indexes for table `floors_table`
--
ALTER TABLE `floors_table`
  ADD PRIMARY KEY (`floor_id`),
  ADD KEY `building_id` (`building_id`);

--
-- Indexes for table `gateways_table`
--
ALTER TABLE `gateways_table`
  ADD PRIMARY KEY (`gateway_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `locations_master_table`
--
ALTER TABLE `locations_master_table`
  ADD PRIMARY KEY (`location_master_id`),
  ADD KEY `location_type_id` (`location_type_id`),
  ADD KEY `floor` (`floor`);

--
-- Indexes for table `locations_type_table`
--
ALTER TABLE `locations_type_table`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `residents_table`
--
ALTER TABLE `residents_table`
  ADD PRIMARY KEY (`resident_id`),
  ADD UNIQUE KEY `resident_id` (`resident_id`),
  ADD KEY `beacon_id` (`beacon_id`);

--
-- Indexes for table `rules_table`
--
ALTER TABLE `rules_table`
  ADD PRIMARY KEY (`rules_id`,`rules_type_id`,`scope_id`),
  ADD KEY `rules_type_id` (`rules_type_id`),
  ADD KEY `scope_id` (`scope_id`);

--
-- Indexes for table `rules_type_table`
--
ALTER TABLE `rules_type_table`
  ADD PRIMARY KEY (`rules_type_id`);

--
-- Indexes for table `scopes_table`
--
ALTER TABLE `scopes_table`
  ADD PRIMARY KEY (`scope_id`);

--
-- Indexes for table `users_right_table`
--
ALTER TABLE `users_right_table`
  ADD PRIMARY KEY (`user_right_id`);

--
-- Indexes for table `users_table`
--
ALTER TABLE `users_table`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `right_id` (`right_id`),
  ADD KEY `beacon_id` (`beacon_id`);

--
-- Indexes for table `users_type_table`
--
ALTER TABLE `users_type_table`
  ADD PRIMARY KEY (`user_type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log_table`
--
ALTER TABLE `activity_log_table`
  MODIFY `log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `alerts_table`
--
ALTER TABLE `alerts_table`
  MODIFY `alert_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `beacons_table`
--
ALTER TABLE `beacons_table`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `beacons_type_table`
--
ALTER TABLE `beacons_type_table`
  MODIFY `beacon_type_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `buildings_table`
--
ALTER TABLE `buildings_table`
  MODIFY `building_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `floors_table`
--
ALTER TABLE `floors_table`
  MODIFY `floor_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gateways_table`
--
ALTER TABLE `gateways_table`
  MODIFY `gateway_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations_master_table`
--
ALTER TABLE `locations_master_table`
  MODIFY `location_master_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations_type_table`
--
ALTER TABLE `locations_type_table`
  MODIFY `type_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `residents_table`
--
ALTER TABLE `residents_table`
  MODIFY `resident_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rules_table`
--
ALTER TABLE `rules_table`
  MODIFY `rules_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rules_type_table`
--
ALTER TABLE `rules_type_table`
  MODIFY `rules_type_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `scopes_table`
--
ALTER TABLE `scopes_table`
  MODIFY `scope_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_right_table`
--
ALTER TABLE `users_right_table`
  MODIFY `user_right_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_table`
--
ALTER TABLE `users_table`
  MODIFY `user_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_type_table`
--
ALTER TABLE `users_type_table`
  MODIFY `user_type_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_log_table`
--
ALTER TABLE `activity_log_table`
  ADD CONSTRAINT `activity_log_table_ibfk_1` FOREIGN KEY (`gateway_id`) REFERENCES `gateways_table` (`gateway_id`),
  ADD CONSTRAINT `activity_log_table_ibfk_2` FOREIGN KEY (`beacon_id`) REFERENCES `beacons_table` (`id`);

--
-- Constraints for table `alerts_table`
--
ALTER TABLE `alerts_table`
  ADD CONSTRAINT `alerts_table_ibfk_1` FOREIGN KEY (`rules_id`) REFERENCES `rules_table` (`rules_id`),
  ADD CONSTRAINT `alerts_table_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users_table` (`user_id`),
  ADD CONSTRAINT `alerts_table_ibfk_3` FOREIGN KEY (`reader_id`) REFERENCES `gateways_table` (`gateway_id`);

--
-- Constraints for table `beacons_table`
--
ALTER TABLE `beacons_table`
  ADD CONSTRAINT `beacons_table_ibfk_1` FOREIGN KEY (`beacon_type`) REFERENCES `beacons_type_table` (`beacon_type_id`);

--
-- Constraints for table `floors_table`
--
ALTER TABLE `floors_table`
  ADD CONSTRAINT `floors_table_ibfk_1` FOREIGN KEY (`building_id`) REFERENCES `buildings_table` (`building_id`) ON UPDATE CASCADE;

--
-- Constraints for table `gateways_table`
--
ALTER TABLE `gateways_table`
  ADD CONSTRAINT `gateways_table_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `locations_master_table` (`location_master_id`) ON UPDATE CASCADE;

--
-- Constraints for table `locations_master_table`
--
ALTER TABLE `locations_master_table`
  ADD CONSTRAINT `locations_master_table_ibfk_1` FOREIGN KEY (`location_type_id`) REFERENCES `locations_type_table` (`type_id`),
  ADD CONSTRAINT `locations_master_table_ibfk_2` FOREIGN KEY (`floor`) REFERENCES `floors_table` (`floor_id`) ON DELETE CASCADE;

--
-- Constraints for table `residents_table`
--
ALTER TABLE `residents_table`
  ADD CONSTRAINT `residents_table_ibfk_1` FOREIGN KEY (`beacon_id`) REFERENCES `beacons_table` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `rules_table`
--
ALTER TABLE `rules_table`
  ADD CONSTRAINT `rules_table_ibfk_1` FOREIGN KEY (`rules_type_id`) REFERENCES `rules_type_table` (`rules_type_id`),
  ADD CONSTRAINT `rules_table_ibfk_2` FOREIGN KEY (`scope_id`) REFERENCES `scopes_table` (`scope_id`);

--
-- Constraints for table `users_table`
--
ALTER TABLE `users_table`
  ADD CONSTRAINT `users_table_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `users_type_table` (`user_type_id`),
  ADD CONSTRAINT `users_table_ibfk_2` FOREIGN KEY (`right_id`) REFERENCES `users_right_table` (`user_right_id`),
  ADD CONSTRAINT `users_table_ibfk_3` FOREIGN KEY (`beacon_id`) REFERENCES `beacons_table` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
