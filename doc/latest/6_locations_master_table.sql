-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2021 at 03:25 AM
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
-- Database: `1`
--

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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `locations_master_table`
--
ALTER TABLE `locations_master_table`
  ADD PRIMARY KEY (`location_master_id`),
  ADD KEY `location_type_id` (`location_type_id`),
  ADD KEY `floor` (`floor`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `locations_master_table`
--
ALTER TABLE `locations_master_table`
  MODIFY `location_master_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `locations_master_table`
--
ALTER TABLE `locations_master_table`
  ADD CONSTRAINT `locations_master_table_ibfk_1` FOREIGN KEY (`location_type_id`) REFERENCES `locations_type_table` (`type_id`),
  ADD CONSTRAINT `locations_master_table_ibfk_2` FOREIGN KEY (`floor`) REFERENCES `floors_table` (`floor_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
