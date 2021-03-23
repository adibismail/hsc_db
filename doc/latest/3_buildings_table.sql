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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buildings_table`
--

INSERT INTO `buildings_table` (`building_id`, `name`, `detail`, `floor_num`, `address`, `lat`, `lng`, `created_at`, `updated_at`) VALUES
(1, 'Floor 1', 'St.John', 1, 'Singapore', 0.00, 0.00, '2021-03-22 02:11:06', NULL),
(2, 'Floor 2', 'St.John', 2, 'Singapore', 0.00, 0.00, '2021-03-22 02:11:06', NULL),
(3, 'Floor 3', 'St.John', 3, 'Singapore', 0.00, 0.00, '2021-03-22 02:11:06', NULL),
(4, 'Floor 4', 'St.John', 4, 'Singapore', 0.00, 0.00, '2021-03-22 02:11:06', NULL),
(5, 'Floor 5', 'St.John', 5, 'Singapore', 0.00, 0.00, '2021-03-22 02:11:06', NULL),
(6, 'Rooftop', 'St.John', 6, 'Singapore', 0.00, 0.00, '2021-03-22 02:11:06', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buildings_table`
--
ALTER TABLE `buildings_table`
  ADD PRIMARY KEY (`building_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buildings_table`
--
ALTER TABLE `buildings_table`
  MODIFY `building_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
