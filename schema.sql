-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 20, 2020 at 11:31 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `schema`
--

-- --------------------------------------------------------

--
-- Table structure for table `chamber`
--

CREATE TABLE `chamber` (
  `c_id` int(10) UNSIGNED NOT NULL,
  `c_name` varchar(20) NOT NULL,
  `c_timing` datetime DEFAULT NULL,
  `c_address` varchar(50) DEFAULT NULL,
  `c_phone` varchar(15) DEFAULT NULL,
  `d_id` int(10) UNSIGNED NOT NULL,
  `h_id` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `d_id` int(10) UNSIGNED NOT NULL,
  `d_name` varchar(20) NOT NULL,
  `d_password_hash` varchar(20) NOT NULL,
  `d_email` varchar(50) NOT NULL,
  `d_phone` varchar(15) DEFAULT NULL,
  `d_address` varchar(50) DEFAULT NULL,
  `d_qualification` varchar(20) NOT NULL,
  `d_dob` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`d_id`, `d_name`, `d_password_hash`, `d_email`, `d_phone`, `d_address`, `d_qualification`, `d_dob`) VALUES
(1, 'zain', 'zain123', 'zain@gmail.com', '9876543210', 'chennai', 'Mbbs', '1998-09-29');

-- --------------------------------------------------------

--
-- Table structure for table `emergency_contact`
--

CREATE TABLE `emergency_contact` (
  `ec_id` int(10) UNSIGNED NOT NULL,
  `ec_name` varchar(20) NOT NULL,
  `ec_phone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `emergency_contact`
--

INSERT INTO `emergency_contact` (`ec_id`, `ec_name`, `ec_phone`) VALUES
(1, 'riz', '9876543210');

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `h_id` varchar(20) NOT NULL,
  `h_name` varchar(20) NOT NULL,
  `h_location` varchar(50) DEFAULT NULL,
  `h_password_hash` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hospital`
--

INSERT INTO `hospital` (`h_id`, `h_name`, `h_location`, `h_password_hash`) VALUES
('1', 'Medical center', 'melur', 'medicalcenter123');

-- --------------------------------------------------------

--
-- Table structure for table `hospital_staff`
--

CREATE TABLE `hospital_staff` (
  `hs_id` int(10) UNSIGNED NOT NULL,
  `hs_name` varchar(20) NOT NULL,
  `hs_email` varchar(50) NOT NULL,
  `hs_password_hash` varchar(20) NOT NULL,
  `h_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hospital_staff`
--

INSERT INTO `hospital_staff` (`hs_id`, `hs_name`, `hs_email`, `hs_password_hash`, `h_id`) VALUES
(3, 'umar', 'umar@gmail.com', 'umar123', '1');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `p_id` int(10) UNSIGNED NOT NULL,
  `p_name` varchar(20) NOT NULL,
  `p_email` varchar(50) NOT NULL,
  `p_phone` varchar(15) NOT NULL,
  `p_gender` char(1) DEFAULT NULL,
  `p_dob` date DEFAULT NULL,
  `p_height` int(11) DEFAULT NULL,
  `p_weight` int(11) DEFAULT NULL,
  `p_password_hash` varchar(40) NOT NULL,
  `p_password_salt` varchar(40) DEFAULT NULL,
  `ec_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`p_id`, `p_name`, `p_email`, `p_phone`, `p_gender`, `p_dob`, `p_height`, `p_weight`, `p_password_hash`, `p_password_salt`, `ec_id`) VALUES
(1, ' riz', 'riz@gmail.com', '9876543210', 'F', '2000-02-23', 6, 58, 'riz123', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `pres_id` int(10) UNSIGNED NOT NULL,
  `diagnosis` varchar(50) DEFAULT NULL,
  `symptoms` varchar(50) DEFAULT NULL,
  `test_needed` varchar(50) DEFAULT NULL,
  `medication` varchar(50) DEFAULT NULL,
  `p_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`pres_id`, `diagnosis`, `symptoms`, `test_needed`, `medication`, `p_id`) VALUES
(1, 'viral fever', 'head ache', 'blood test', 'nil', 1);

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `test_id` int(11) NOT NULL,
  `test_name` varchar(20) NOT NULL,
  `test_result` varchar(50) DEFAULT NULL,
  `test_report` varchar(50) DEFAULT NULL,
  `p_id` int(10) UNSIGNED NOT NULL,
  `d_id` int(10) UNSIGNED DEFAULT NULL,
  `pres_id` int(10) UNSIGNED DEFAULT NULL,
  `hs_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chamber`
--
ALTER TABLE `chamber`
  ADD PRIMARY KEY (`c_id`),
  ADD KEY `fk7` (`d_id`),
  ADD KEY `fk8` (`h_id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`d_id`),
  ADD UNIQUE KEY `d_email` (`d_email`);

--
-- Indexes for table `emergency_contact`
--
ALTER TABLE `emergency_contact`
  ADD PRIMARY KEY (`ec_id`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`h_id`);

--
-- Indexes for table `hospital_staff`
--
ALTER TABLE `hospital_staff`
  ADD PRIMARY KEY (`hs_id`),
  ADD UNIQUE KEY `hs_email` (`hs_email`),
  ADD KEY `fk9` (`h_id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`p_id`),
  ADD UNIQUE KEY `p_email` (`p_email`),
  ADD KEY `fk1` (`ec_id`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`pres_id`),
  ADD KEY `fk2` (`p_id`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`test_id`),
  ADD KEY `fk3` (`p_id`),
  ADD KEY `fk4` (`d_id`),
  ADD KEY `fk5` (`pres_id`),
  ADD KEY `fk6` (`hs_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chamber`
--
ALTER TABLE `chamber`
  MODIFY `c_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `d_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `emergency_contact`
--
ALTER TABLE `emergency_contact`
  MODIFY `ec_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hospital_staff`
--
ALTER TABLE `hospital_staff`
  MODIFY `hs_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `p_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `pres_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `test_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chamber`
--
ALTER TABLE `chamber`
  ADD CONSTRAINT `fk7` FOREIGN KEY (`d_id`) REFERENCES `doctor` (`d_id`),
  ADD CONSTRAINT `fk8` FOREIGN KEY (`h_id`) REFERENCES `hospital` (`h_id`);

--
-- Constraints for table `hospital_staff`
--
ALTER TABLE `hospital_staff`
  ADD CONSTRAINT `fk9` FOREIGN KEY (`h_id`) REFERENCES `hospital` (`h_id`);

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`ec_id`) REFERENCES `emergency_contact` (`ec_id`);

--
-- Constraints for table `prescription`
--
ALTER TABLE `prescription`
  ADD CONSTRAINT `fk2` FOREIGN KEY (`p_id`) REFERENCES `patient` (`p_id`);

--
-- Constraints for table `test`
--
ALTER TABLE `test`
  ADD CONSTRAINT `fk3` FOREIGN KEY (`p_id`) REFERENCES `patient` (`p_id`),
  ADD CONSTRAINT `fk4` FOREIGN KEY (`d_id`) REFERENCES `doctor` (`d_id`),
  ADD CONSTRAINT `fk5` FOREIGN KEY (`pres_id`) REFERENCES `prescription` (`pres_id`),
  ADD CONSTRAINT `fk6` FOREIGN KEY (`hs_id`) REFERENCES `hospital_staff` (`hs_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
