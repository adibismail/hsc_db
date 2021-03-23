-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2021 at 03:24 AM
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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `floors_table`
--
ALTER TABLE `floors_table`
  ADD PRIMARY KEY (`floor_id`),
  ADD KEY `building_id` (`building_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `floors_table`
--
ALTER TABLE `floors_table`
  MODIFY `floor_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `floors_table`
--
ALTER TABLE `floors_table`
  ADD CONSTRAINT `floors_table_ibfk_1` FOREIGN KEY (`building_id`) REFERENCES `buildings_table` (`building_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
