-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2021 at 07:50 AM
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
-- Database: `office_test`
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
  `beacon_id` bigint(20) UNSIGNED DEFAULT NULL,
  `occured_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `resolved_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reader_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rules_id` bigint(20) UNSIGNED DEFAULT NULL,
  `action` tinyint(1) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `beacons_table`
--

CREATE TABLE `beacons_table` (
  `beacon_id` bigint(20) UNSIGNED NOT NULL,
  `beacon_type` int(10) UNSIGNED DEFAULT NULL,
  `beacon_mac` varchar(17) DEFAULT NULL,
  `current_loc` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `beacons_table`
--

INSERT INTO `beacons_table` (`beacon_id`, `beacon_type`, `beacon_mac`, `current_loc`, `created_at`, `updated_at`) VALUES
(2, 1, 'AC233FA8C33B', NULL, '2021-03-26 06:37:38', NULL),
(3, 1, 'AC233FA8C33F', NULL, '2021-03-26 06:37:38', NULL),
(4, 1, 'AC233FA8C33D', NULL, '2021-03-26 06:37:38', NULL),
(5, 1, 'AC233FA8C330', NULL, '2021-03-26 06:37:38', NULL),
(6, 1, 'AC233FA8C337', NULL, '2021-03-26 06:37:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `beacons_type_table`
--

CREATE TABLE `beacons_type_table` (
  `beacon_type_id` int(10) UNSIGNED NOT NULL,
  `beacon_type_desc` tinytext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `beacons_type_table`
--

INSERT INTO `beacons_type_table` (`beacon_type_id`, `beacon_type_desc`) VALUES
(1, 'iBeacon'),
(2, 'tag');

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
  `lat` double(8,2) DEFAULT NULL,
  `lng` double(8,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buildings_table`
--

INSERT INTO `buildings_table` (`building_id`, `name`, `detail`, `floor_num`, `address`, `lat`, `lng`, `created_at`, `updated_at`) VALUES
(1, 'Floor 1', 'St. John', 1, 'Singapore', NULL, NULL, '2021-03-26 06:44:46', NULL),
(2, 'Floor 2', 'St. John', 2, 'Singapore', NULL, NULL, '2021-03-26 06:44:46', NULL),
(3, 'Floor 3', 'St. John', 3, 'Singapore', NULL, NULL, '2021-03-26 06:44:46', NULL),
(4, 'Floor 4', 'St. John', 4, 'Singapore', NULL, NULL, '2021-03-26 06:44:46', NULL),
(5, 'Floor 5', 'St. John', 5, 'Singapore', NULL, NULL, '2021-03-26 06:44:46', NULL),
(6, 'Floor 6', 'St. John', 6, 'Singapore', NULL, NULL, '2021-03-26 06:44:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `floors_table`
--

CREATE TABLE `floors_table` (
  `floor_id` int(10) UNSIGNED NOT NULL,
  `id` bigint(20) UNSIGNED NOT NULL,
  `number` int(11) NOT NULL,
  `building_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `floors_table`
--

INSERT INTO `floors_table` (`floor_id`, `id`, `number`, `building_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2021-03-22 02:11:06', NULL),
(2, 2, 1, 2, '2021-03-22 02:11:06', NULL),
(3, 3, 1, 3, '2021-03-22 02:11:06', NULL),
(4, 4, 1, 4, '2021-03-22 02:11:06', NULL),
(5, 5, 1, 5, '2021-03-22 02:11:06', NULL),
(6, 6, 1, 6, '2021-03-22 02:11:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gateways_table`
--

CREATE TABLE `gateways_table` (
  `gateway_id` bigint(20) UNSIGNED NOT NULL,
  `mac_addr` varchar(17) DEFAULT NULL,
  `reader_ip` varchar(45) DEFAULT NULL,
  `location_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reader_status` tinyint(1) DEFAULT NULL,
  `up_status` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `down_status` timestamp NULL DEFAULT NULL,
  `assigned` tinyint(1) DEFAULT NULL,
  `serial` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gateways_table`
--

INSERT INTO `gateways_table` (`gateway_id`, `mac_addr`, `reader_ip`, `location_id`, `reader_status`, `up_status`, `down_status`, `assigned`, `serial`, `created_at`, `updated_at`) VALUES
(1, 'AC233FC09C1D', NULL, 2, NULL, '2021-03-26 06:49:38', NULL, NULL, 'L1-RM-11', '2021-03-26 06:49:38', NULL),
(2, 'AC233FC09C55', NULL, 2, NULL, '2021-03-26 06:49:38', NULL, NULL, 'L1-RM-12', '2021-03-26 06:49:38', NULL),
(3, 'AC233FC09C5B', NULL, 2, NULL, '2021-03-26 06:49:38', NULL, NULL, 'L1-RM-13', '2021-03-26 06:49:38', NULL),
(4, 'AC233FC09CE8', NULL, 2, NULL, '2021-03-26 06:49:38', NULL, NULL, 'L1-RM-14', '2021-03-26 06:49:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `locations_master_table`
--

CREATE TABLE `locations_master_table` (
  `location_master_id` bigint(20) UNSIGNED NOT NULL,
  `location_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `parent_location_id` bigint(20) UNSIGNED DEFAULT NULL,
  `location_description` varchar(255) DEFAULT NULL,
  `floor` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `locations_master_table`
--

INSERT INTO `locations_master_table` (`location_master_id`, `location_type_id`, `parent_location_id`, `location_description`, `floor`) VALUES
(1, 1, NULL, 'Corridor', 1),
(2, 4, NULL, 'Canteen', 1),
(3, 6, NULL, 'Function Room', 1),
(4, 6, NULL, 'Kitchen', 1),
(5, 6, NULL, 'Pantry', 1),
(6, 6, NULL, 'Lift Area', 1),
(7, 6, NULL, 'Activity Room 1', 1),
(8, 6, NULL, 'Activity Room 2', 1),
(9, 6, NULL, 'Donations Sorting Room', 1),
(10, 6, NULL, 'Ancillary Office', 1),
(11, 6, NULL, 'Lobby', 1),
(12, 6, NULL, 'Bicycle Parking', 1),
(13, 5, NULL, 'Ladies Washroom', 1),
(14, 5, NULL, 'Mens Washroom', 1),
(15, 6, NULL, 'Parking', 1),
(16, 3, NULL, 'Room 1 Toilet', 2),
(17, 2, NULL, 'Room 1', 2),
(18, 3, NULL, 'Room 2 Toilet', 2),
(19, 2, NULL, 'Room 2', 2),
(20, 3, NULL, 'Room 3 Toilet', 2),
(21, 2, NULL, 'Room 3', 2),
(22, 3, NULL, 'Room 4 Toilet', 2),
(23, 2, NULL, 'Room 4', 2),
(24, 3, NULL, 'Room 5 Toilet', 2),
(25, 2, NULL, 'Room 5', 2),
(26, 3, NULL, 'Room 6 Toilet', 2),
(27, 2, NULL, 'Room 6', 2),
(28, 6, NULL, 'Counseling Room', 2),
(29, 6, NULL, 'Volunteer Room', 2),
(30, 6, NULL, 'Clinic Outer', 2),
(31, 6, NULL, 'Clinic Inner', 2),
(32, 6, NULL, 'Sick Bay', 2),
(33, 3, NULL, 'Sick Bay Toilet', 2),
(34, 2, NULL, 'Isolation Room (Male)', 2),
(35, 3, NULL, 'Isolation Toilet (Male)', 2),
(36, 2, NULL, 'Isolation Room (Female)', 2),
(37, 3, NULL, 'Isolation Toilet (Female)', 2),
(38, 6, NULL, 'Physiotherapy Room', 2),
(39, 6, NULL, 'Common Lounge', 2),
(40, 1, NULL, 'Corridor L2', 2),
(41, 5, NULL, 'Public Toilet', 2),
(42, 3, NULL, 'Room 1 Toilet', 3),
(43, 2, NULL, 'Room 1', 3),
(44, 3, NULL, 'Room 2 Toilet', 3),
(45, 2, NULL, 'Room 2', 3),
(46, 3, NULL, 'Room 3 Toilet', 3),
(47, 2, NULL, 'Room 3', 3),
(48, 3, NULL, 'Room 4 Toilet', 3),
(49, 2, NULL, 'Room 4', 3),
(50, 3, NULL, 'Room 5 Toilet', 3),
(51, 2, NULL, 'Room 5', 3),
(52, 3, NULL, 'Room 6 Toilet', 3),
(53, 2, NULL, 'Room 6', 3),
(54, 3, NULL, 'Room 7 Toilet', 3),
(55, 2, NULL, 'Room 7', 3),
(56, 3, NULL, 'Room 8 Toilet', 3),
(57, 2, NULL, 'Room 8', 3),
(58, 3, NULL, 'Room 9 Toilet', 3),
(59, 2, NULL, 'Room 9', 3),
(60, 3, NULL, 'Room 10 Toilet', 3),
(61, 2, NULL, 'Room 10', 3),
(62, 3, NULL, 'Room 11 Toilet', 3),
(63, 2, NULL, 'Room 11', 3),
(64, 3, NULL, 'Room 12 Toilet', 3),
(65, 2, NULL, 'Room 12', 3),
(66, 1, NULL, 'Corridor L3', 3),
(67, 6, NULL, 'Lobby L3', 3),
(68, 6, NULL, 'Nurse Station', 3),
(69, 3, NULL, 'Room 1 Toilet', 4),
(70, 2, NULL, 'Room 1', 4),
(71, 3, NULL, 'Room 2 Toilet', 4),
(72, 2, NULL, 'Room 2', 4),
(73, 3, NULL, 'Room 3 Toilet', 4),
(74, 2, NULL, 'Room 3', 4),
(75, 3, NULL, 'Room 4 Toilet', 4),
(76, 2, NULL, 'Room 4', 4),
(77, 3, NULL, 'Room 5 Toilet', 4),
(78, 2, NULL, 'Room 5', 4),
(79, 3, NULL, 'Room 6 Toilet', 4),
(80, 2, NULL, 'Room 6', 4),
(81, 3, NULL, 'Room 7 Toilet', 4),
(82, 2, NULL, 'Room 7', 4),
(83, 3, NULL, 'Room 8 Toilet', 4),
(84, 2, NULL, 'Room 8', 4),
(85, 3, NULL, 'Room 9 Toilet', 4),
(86, 2, NULL, 'Room 9', 4),
(87, 3, NULL, 'Room 10 Toilet', 4),
(88, 2, NULL, 'Room 10', 4),
(89, 3, NULL, 'Room 11 Toilet', 4),
(90, 2, NULL, 'Room 11', 4),
(91, 3, NULL, 'Room 12 Toilet', 4),
(92, 2, NULL, 'Room 12', 4),
(93, 1, NULL, 'Corridor L4', 4),
(94, 6, NULL, 'Lobby L4', 4),
(95, 6, NULL, 'Nurse Station', 4),
(96, 3, NULL, 'Room 1 Toilet', 5),
(97, 2, NULL, 'Room 1', 5),
(98, 3, NULL, 'Room 2 Toilet', 5),
(99, 2, NULL, 'Room 2', 5),
(100, 3, NULL, 'Room 3 Toilet', 5),
(101, 2, NULL, 'Room 3', 5),
(102, 3, NULL, 'Room 4 Toilet', 5),
(103, 2, NULL, 'Room 4', 5),
(104, 3, NULL, 'Room 5 Toilet', 5),
(105, 2, NULL, 'Room 5', 5),
(106, 3, NULL, 'Room 6 Toilet', 5),
(107, 2, NULL, 'Room 6', 5),
(108, 3, NULL, 'Room 7 Toilet', 5),
(109, 2, NULL, 'Room 7', 5),
(110, 3, NULL, 'Room 8 Toilet', 5),
(111, 2, NULL, 'Room 8', 5),
(112, 3, NULL, 'Room 9 Toilet', 5),
(113, 2, NULL, 'Room 9', 5),
(114, 2, NULL, 'Staff Room 1', 5),
(115, 2, NULL, 'Staff Room 2', 5),
(116, 3, NULL, 'Staff Bathroom', 5),
(117, 1, NULL, 'Corridor L5', 5),
(118, 6, NULL, 'Lobby L5', 5),
(119, 6, NULL, 'Nurse Station', 5),
(120, 6, NULL, 'Laundry', 6),
(121, 1, NULL, 'Roof Corridor', 6);

-- --------------------------------------------------------

--
-- Table structure for table `locations_type_table`
--

CREATE TABLE `locations_type_table` (
  `type_id` bigint(20) UNSIGNED NOT NULL,
  `location_type` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `locations_type_table`
--

INSERT INTO `locations_type_table` (`type_id`, `location_type`) VALUES
(1, 'Corridor'),
(2, 'Room'),
(3, 'Toilet'),
(4, 'Canteen'),
(5, 'Public Toilet'),
(6, 'Common Area');

-- --------------------------------------------------------

--
-- Table structure for table `residents_table`
--

CREATE TABLE `residents_table` (
  `resident_id` bigint(20) UNSIGNED NOT NULL,
  `beacon_id` bigint(20) UNSIGNED DEFAULT NULL,
  `resident_fName` varchar(45) DEFAULT NULL,
  `resident_lName` varchar(45) DEFAULT NULL,
  `resident_age` int(11) DEFAULT NULL,
  `wheelchair` tinyint(1) DEFAULT NULL,
  `walking_cane` tinyint(1) DEFAULT NULL,
  `x_value` float DEFAULT NULL,
  `y_value` float DEFAULT NULL,
  `z_value` float DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rules_beacon_table`
--

CREATE TABLE `rules_beacon_table` (
  `id` int(11) NOT NULL,
  `beacon_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rules_table`
--

CREATE TABLE `rules_table` (
  `rules_id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `x_threshold` float DEFAULT NULL,
  `y_threshold` float DEFAULT NULL,
  `z_threshold` float DEFAULT NULL,
  `x_frequency` int(11) DEFAULT NULL,
  `y_frequency` int(11) DEFAULT NULL,
  `z_frequency` int(11) DEFAULT NULL,
  `alert_action` tinyint(1) DEFAULT NULL,
  `attendance` tinyint(1) DEFAULT NULL,
  `geoence` tinyint(1) DEFAULT NULL,
  `rules_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `scope_id` bigint(20) UNSIGNED DEFAULT NULL
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
  `scope_id` bigint(20) UNSIGNED NOT NULL,
  `gateway_dwell_time` varchar(45) DEFAULT NULL,
  `days` bit(7) DEFAULT NULL,
  `start_time` time NOT NULL,
  `duration` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `scope_beacons_table`
--

CREATE TABLE `scope_beacons_table` (
  `scope_beacon_id` bigint(20) UNSIGNED NOT NULL,
  `scope_id` bigint(20) UNSIGNED DEFAULT NULL,
  `beacon_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `scope_locations_master_table`
--

CREATE TABLE `scope_locations_master_table` (
  `scope_location_master_id` bigint(20) UNSIGNED NOT NULL,
  `scope_id` bigint(20) UNSIGNED DEFAULT NULL,
  `location_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users_right_table`
--

CREATE TABLE `users_right_table` (
  `user_right_id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
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
  `right_id` int(11) DEFAULT NULL,
  `fName` varchar(20) DEFAULT NULL,
  `lName` varchar(20) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users_type_table`
--

CREATE TABLE `users_type_table` (
  `user_type_id` int(11) NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log_table`
--
ALTER TABLE `activity_log_table`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `alerts_table`
--
ALTER TABLE `alerts_table`
  ADD PRIMARY KEY (`alert_id`),
  ADD KEY `rules_id` (`rules_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `reader_id` (`reader_id`),
  ADD KEY `beacon_id` (`beacon_id`);

--
-- Indexes for table `beacons_table`
--
ALTER TABLE `beacons_table`
  ADD PRIMARY KEY (`beacon_id`),
  ADD UNIQUE KEY `beacon_id` (`beacon_id`),
  ADD KEY `beacon_type` (`beacon_type`),
  ADD KEY `current_loc` (`current_loc`);

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
-- Indexes for table `rules_beacon_table`
--
ALTER TABLE `rules_beacon_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `beacon_id` (`beacon_id`);

--
-- Indexes for table `rules_table`
--
ALTER TABLE `rules_table`
  ADD PRIMARY KEY (`rules_id`),
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
-- Indexes for table `scope_beacons_table`
--
ALTER TABLE `scope_beacons_table`
  ADD PRIMARY KEY (`scope_beacon_id`),
  ADD KEY `scope_id` (`scope_id`),
  ADD KEY `beacon_id` (`beacon_id`);

--
-- Indexes for table `scope_locations_master_table`
--
ALTER TABLE `scope_locations_master_table`
  ADD PRIMARY KEY (`scope_location_master_id`),
  ADD KEY `scope_id` (`scope_id`),
  ADD KEY `location_id` (`location_id`);

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
  MODIFY `beacon_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `beacons_type_table`
--
ALTER TABLE `beacons_type_table`
  MODIFY `beacon_type_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `buildings_table`
--
ALTER TABLE `buildings_table`
  MODIFY `building_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `floors_table`
--
ALTER TABLE `floors_table`
  MODIFY `floor_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `gateways_table`
--
ALTER TABLE `gateways_table`
  MODIFY `gateway_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `locations_master_table`
--
ALTER TABLE `locations_master_table`
  MODIFY `location_master_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `locations_type_table`
--
ALTER TABLE `locations_type_table`
  MODIFY `type_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `residents_table`
--
ALTER TABLE `residents_table`
  MODIFY `resident_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rules_beacon_table`
--
ALTER TABLE `rules_beacon_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `scope_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `scope_beacons_table`
--
ALTER TABLE `scope_beacons_table`
  MODIFY `scope_beacon_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `scope_locations_master_table`
--
ALTER TABLE `scope_locations_master_table`
  MODIFY `scope_location_master_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
-- Constraints for table `alerts_table`
--
ALTER TABLE `alerts_table`
  ADD CONSTRAINT `alerts_table_ibfk_1` FOREIGN KEY (`rules_id`) REFERENCES `rules_table` (`rules_id`),
  ADD CONSTRAINT `alerts_table_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users_table` (`user_id`),
  ADD CONSTRAINT `alerts_table_ibfk_3` FOREIGN KEY (`reader_id`) REFERENCES `gateways_table` (`gateway_id`),
  ADD CONSTRAINT `alerts_table_ibfk_4` FOREIGN KEY (`beacon_id`) REFERENCES `beacons_table` (`beacon_id`);

--
-- Constraints for table `beacons_table`
--
ALTER TABLE `beacons_table`
  ADD CONSTRAINT `beacons_table_ibfk_1` FOREIGN KEY (`beacon_type`) REFERENCES `beacons_type_table` (`beacon_type_id`),
  ADD CONSTRAINT `beacons_table_ibfk_2` FOREIGN KEY (`current_loc`) REFERENCES `gateways_table` (`gateway_id`);

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
  ADD CONSTRAINT `residents_table_ibfk_1` FOREIGN KEY (`beacon_id`) REFERENCES `beacons_table` (`beacon_id`) ON UPDATE CASCADE;

--
-- Constraints for table `rules_beacon_table`
--
ALTER TABLE `rules_beacon_table`
  ADD CONSTRAINT `rules_beacon_table_ibfk_1` FOREIGN KEY (`beacon_id`) REFERENCES `beacons_table` (`beacon_id`);

--
-- Constraints for table `rules_table`
--
ALTER TABLE `rules_table`
  ADD CONSTRAINT `rules_table_ibfk_1` FOREIGN KEY (`rules_type_id`) REFERENCES `rules_type_table` (`rules_type_id`),
  ADD CONSTRAINT `rules_table_ibfk_2` FOREIGN KEY (`scope_id`) REFERENCES `scopes_table` (`scope_id`);

--
-- Constraints for table `scope_beacons_table`
--
ALTER TABLE `scope_beacons_table`
  ADD CONSTRAINT `scope_beacons_table_ibfk_1` FOREIGN KEY (`scope_id`) REFERENCES `scopes_table` (`scope_id`),
  ADD CONSTRAINT `scope_beacons_table_ibfk_2` FOREIGN KEY (`beacon_id`) REFERENCES `beacons_table` (`beacon_id`);

--
-- Constraints for table `scope_locations_master_table`
--
ALTER TABLE `scope_locations_master_table`
  ADD CONSTRAINT `scope_locations_master_table_ibfk_1` FOREIGN KEY (`scope_id`) REFERENCES `scopes_table` (`scope_id`),
  ADD CONSTRAINT `scope_locations_master_table_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `locations_master_table` (`location_master_id`);

--
-- Constraints for table `users_table`
--
ALTER TABLE `users_table`
  ADD CONSTRAINT `users_table_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `users_type_table` (`user_type_id`),
  ADD CONSTRAINT `users_table_ibfk_2` FOREIGN KEY (`right_id`) REFERENCES `users_right_table` (`user_right_id`),
  ADD CONSTRAINT `users_table_ibfk_3` FOREIGN KEY (`beacon_id`) REFERENCES `beacons_table` (`beacon_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
