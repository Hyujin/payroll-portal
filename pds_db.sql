-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 24, 2022 at 10:46 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pds_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `deductions`
--

CREATE TABLE `deductions` (
  `id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `sss` decimal(20,1) DEFAULT NULL,
  `phic` decimal(20,2) NOT NULL,
  `pagibig` decimal(20,1) DEFAULT NULL,
  `others` decimal(20,1) DEFAULT NULL,
  `ca` decimal(20,1) DEFAULT NULL,
  `total_deductions` decimal(20,2) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deductions`
--

INSERT INTO `deductions` (`id`, `emp_id`, `sss`, `phic`, `pagibig`, `others`, `ca`, `total_deductions`, `created_on`) VALUES
(49, 0, '0.0', '0.00', '0.0', '0.0', '0.0', '0.00', '2022-01-12 04:17:40'),
(50, 13, '0.0', '0.00', '0.0', '0.0', '0.0', '0.00', '2022-01-12 04:29:33'),
(51, 13, '0.0', '0.00', '0.0', '0.0', '0.0', '0.00', '2022-01-12 04:29:57'),
(52, 13, '0.0', '0.00', '0.0', '0.0', '0.0', '0.00', '2022-01-12 04:30:49'),
(53, 13, '0.0', '0.00', '0.0', '0.0', '0.0', '0.00', '2022-01-12 04:31:10'),
(54, 13, '0.0', '0.00', '0.0', '0.0', '0.0', '0.00', '2022-01-12 04:31:32'),
(55, 13, '0.0', '0.00', '0.0', '0.0', '0.0', '0.00', '2022-01-12 04:31:55'),
(56, 0, '0.0', '0.00', '0.0', '0.0', '0.0', '0.00', '2022-01-12 04:31:55'),
(57, 13, '0.0', '0.00', '0.0', '0.0', '0.0', '0.00', '2022-01-13 01:28:20'),
(58, 13, '0.0', '0.00', '0.0', '0.0', '0.0', '0.00', '2022-01-13 01:30:07'),
(59, 0, '0.0', '0.00', '0.0', '0.0', '0.0', '0.00', '2022-01-13 01:30:07'),
(60, 13, '0.0', '0.00', '0.0', '0.0', '0.0', '0.00', '2022-01-13 02:05:52');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `type` varchar(32) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `full_name`, `role`, `type`, `created_on`) VALUES
(10, 'Yujin Yeongssil', 'Software Engineer', 'reg', '2022-01-04 05:05:05'),
(11, 'Khloe Khan', 'App Tester', 'comm', '2022-01-04 05:05:05'),
(12, 'Eli Mar Entrina', 'IT Support', 'reg', '2022-01-05 07:32:30'),
(13, 'ALFECHE, STEPHANIE', 'AGENT', 'comm', '2022-01-12 04:17:40'),
(16, 'Rajesh Koothrapali', 'External Vice-President', 'reg', '2022-01-13 02:52:45'),
(17, 'Sheldon Cooper', 'Director for Research Development and Extension', 'reg', '2022-01-13 03:25:34'),
(18, 'Stuart Little', 'Head of Security', 'comm', '2022-01-13 03:26:13');

-- --------------------------------------------------------

--
-- Table structure for table `emp_compensation`
--

CREATE TABLE `emp_compensation` (
  `id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `daily_rate` decimal(20,2) NOT NULL,
  `hr_rate` decimal(20,2) NOT NULL,
  `allow_hr_rate` decimal(20,2) NOT NULL,
  `nd_rate` decimal(20,2) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `emp_manhour`
--

CREATE TABLE `emp_manhour` (
  `id` int(10) UNSIGNED NOT NULL,
  `emp_id` int(11) NOT NULL,
  `total_worked_hrs` decimal(20,2) DEFAULT NULL,
  `total_nd_hrs` decimal(20,1) DEFAULT NULL,
  `reg_hol_hrs` decimal(20,2) DEFAULT NULL,
  `ot_hrs` decimal(20,2) DEFAULT NULL,
  `spl_hrs` decimal(20,2) DEFAULT NULL,
  `prem_hrs` decimal(20,2) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pay`
--

CREATE TABLE `pay` (
  `id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `basic_hrs` decimal(20,2) DEFAULT NULL,
  `nds_pay` decimal(20,2) DEFAULT NULL,
  `allow_pay` decimal(20,2) DEFAULT NULL,
  `dispute` decimal(20,2) DEFAULT NULL,
  `spl_pay` decimal(20,2) DEFAULT NULL,
  `reg_pay` decimal(20,2) DEFAULT NULL,
  `prem_pay` decimal(20,2) DEFAULT NULL,
  `ot_pay` decimal(20,2) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pay`
--

INSERT INTO `pay` (`id`, `emp_id`, `basic_hrs`, `nds_pay`, `allow_pay`, `dispute`, `spl_pay`, `reg_pay`, `prem_pay`, `ot_pay`, `created_on`) VALUES
(61, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '2022-01-12 04:17:40'),
(62, 13, NULL, NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '2022-01-12 04:29:33'),
(63, 13, NULL, NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '2022-01-12 04:29:57'),
(64, 13, NULL, NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '2022-01-12 04:30:49'),
(65, 13, NULL, NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '2022-01-12 04:31:10'),
(66, 13, NULL, NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '2022-01-12 04:31:32'),
(67, 13, NULL, NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '2022-01-12 04:31:55'),
(68, 0, NULL, NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '2022-01-12 04:31:55'),
(69, 13, NULL, NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '2022-01-13 01:28:20'),
(70, 13, NULL, NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '2022-01-13 01:30:07'),
(71, 0, NULL, NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '2022-01-13 01:30:07'),
(72, 13, NULL, NULL, '0.00', '0.00', '280.00', '150.00', '120.00', '135.00', '2022-01-13 02:05:52');

-- --------------------------------------------------------

--
-- Table structure for table `sales_compensation`
--

CREATE TABLE `sales_compensation` (
  `id` int(11) NOT NULL,
  `emp_id` int(64) NOT NULL,
  `total_sales` decimal(20,2) NOT NULL,
  `training_days` int(64) NOT NULL,
  `reg_hol_days` int(64) NOT NULL,
  `total_num_days` int(64) NOT NULL,
  `spl_hrs` decimal(20,2) NOT NULL,
  `prem_hrs` decimal(20,2) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sales_compensation`
--

INSERT INTO `sales_compensation` (`id`, `emp_id`, `total_sales`, `training_days`, `reg_hol_days`, `total_num_days`, `spl_hrs`, `prem_hrs`, `created_on`) VALUES
(1, 13, '80.00', 3, 2, 10, '0.00', '0.00', '2022-01-12 04:31:55'),
(2, 0, '0.00', 0, 0, 0, '0.00', '0.00', '2022-01-12 04:31:55'),
(4, 13, '80.00', 3, 2, 10, '0.00', '0.00', '2022-01-13 01:30:07'),
(5, 0, '0.00', 0, 0, 0, '0.00', '0.00', '2022-01-13 01:30:07'),
(6, 13, '80.00', 3, 2, 10, '0.00', '0.00', '2022-01-13 02:05:52');

-- --------------------------------------------------------

--
-- Table structure for table `sales_manhour`
--

CREATE TABLE `sales_manhour` (
  `id` int(10) UNSIGNED NOT NULL,
  `emp_id` int(11) NOT NULL,
  `training_rate` decimal(20,2) DEFAULT NULL,
  `sales_rate` decimal(20,2) DEFAULT NULL,
  `allow_rate` decimal(20,2) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sales_manhour`
--

INSERT INTO `sales_manhour` (`id`, `emp_id`, `training_rate`, `sales_rate`, `allow_rate`, `created_on`) VALUES
(1, 13, '0.00', '0.00', '0.00', '2022-01-12 04:31:55'),
(2, 0, '0.00', '0.00', '0.00', '2022-01-12 04:31:55'),
(3, 13, '0.00', '0.00', '0.00', '2022-01-13 01:30:07'),
(4, 0, '0.00', '0.00', '0.00', '2022-01-13 01:30:07'),
(5, 13, '120.00', '350.00', '100.00', '2022-01-13 02:05:52');

-- --------------------------------------------------------

--
-- Table structure for table `superuser`
--

CREATE TABLE `superuser` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `superuser`
--

INSERT INTO `superuser` (`id`, `username`, `password`) VALUES
(1, 'chelly', 'chelly123!@#');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `deductions`
--
ALTER TABLE `deductions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emp_compensation`
--
ALTER TABLE `emp_compensation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emp_manhour`
--
ALTER TABLE `emp_manhour`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pay`
--
ALTER TABLE `pay`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_compensation`
--
ALTER TABLE `sales_compensation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_manhour`
--
ALTER TABLE `sales_manhour`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `superuser`
--
ALTER TABLE `superuser`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `deductions`
--
ALTER TABLE `deductions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `emp_compensation`
--
ALTER TABLE `emp_compensation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `emp_manhour`
--
ALTER TABLE `emp_manhour`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `pay`
--
ALTER TABLE `pay`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `sales_compensation`
--
ALTER TABLE `sales_compensation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sales_manhour`
--
ALTER TABLE `sales_manhour`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `superuser`
--
ALTER TABLE `superuser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
