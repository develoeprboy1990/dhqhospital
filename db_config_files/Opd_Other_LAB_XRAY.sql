-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 17, 2023 at 01:34 AM
-- Server version: 5.7.23-23
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aursoftc_dhqhospitalbtk`
--

-- --------------------------------------------------------

--
-- Table structure for table `lab_entry`
--

CREATE TABLE `lab_entry` (
  `id` int(11) NOT NULL,
  `receptNumber` int(11) NOT NULL,
  `yearly_no` varchar(255) NOT NULL,
  `patient_name` varchar(255) NOT NULL,
  `refrence` varchar(255) NOT NULL,
  `age` varchar(255) NOT NULL,
  `gander` varchar(255) NOT NULL,
  `address` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `dated` varchar(255) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `shift` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `tests` int(11) NOT NULL,
  `sync_status` int(11) NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL,
  `print` int(11) NOT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '1 for deleted'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lab_entry_details`
--

CREATE TABLE `lab_entry_details` (
  `id` int(11) NOT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `test_id` int(11) DEFAULT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '1 for deleted',
  `yearly` int(11) NOT NULL,
  `date` varchar(255) NOT NULL,
  `types` varchar(255) NOT NULL,
  `dept_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `opd_entry`
--

CREATE TABLE `opd_entry` (
  `id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `receptNumber` int(11) NOT NULL,
  `yearly_no` int(11) NOT NULL,
  `patient_name` varchar(255) NOT NULL,
  `refrence` varchar(255) NOT NULL,
  `age` varchar(255) NOT NULL,
  `gander` varchar(255) NOT NULL,
  `address` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `dated` varchar(255) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `shift` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `sync_status` int(11) NOT NULL DEFAULT '0' COMMENT '1 for sync data',
  `print` int(11) NOT NULL DEFAULT '0' COMMENT '1 for duplicate print',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '1 for deleted'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `other_entry`
--

CREATE TABLE `other_entry` (
  `id` int(11) NOT NULL,
  `receptNumber` int(11) NOT NULL,
  `yearly_no` varchar(255) NOT NULL,
  `patient_name` varchar(255) NOT NULL,
  `refrence` varchar(255) NOT NULL,
  `age` varchar(255) NOT NULL,
  `gander` varchar(255) NOT NULL,
  `shift` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `user_id` int(20) NOT NULL,
  `dept_id` varchar(255) NOT NULL,
  `sub_dept_id` int(11) DEFAULT NULL,
  `date` varchar(255) NOT NULL,
  `dated` date DEFAULT NULL,
  `price` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sync_status` int(11) NOT NULL DEFAULT '0' COMMENT '1 for synched',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '1 for deleted'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xray_entry`
--

CREATE TABLE `xray_entry` (
  `id` int(11) NOT NULL,
  `receptNumber` int(11) NOT NULL,
  `yearly_no` int(11) NOT NULL,
  `patient_name` varchar(255) NOT NULL,
  `refrence` varchar(255) NOT NULL,
  `age` varchar(255) NOT NULL,
  `gander` varchar(255) NOT NULL,
  `address` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `dated` varchar(255) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `shift` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `sync_status` int(11) NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL,
  `print` int(11) NOT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '1 for deleted'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xray_entry_details`
--

CREATE TABLE `xray_entry_details` (
  `id` int(11) NOT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `xray_type_id` int(11) DEFAULT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '1 for delete',
  `yearly` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lab_entry`
--
ALTER TABLE `lab_entry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lab_entry_details`
--
ALTER TABLE `lab_entry_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `opd_entry`
--
ALTER TABLE `opd_entry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `opdTable` (`type`,`receptNumber`,`yearly_no`,`patient_name`,`gander`,`date`,`dated`,`dept_id`,`user_id`,`shift`,`is_deleted`);

--
-- Indexes for table `other_entry`
--
ALTER TABLE `other_entry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `otherEntry` (`receptNumber`,`yearly_no`,`patient_name`,`gander`,`shift`,`user_id`,`dept_id`,`sub_dept_id`,`date`,`dated`,`type`,`is_deleted`);

--
-- Indexes for table `xray_entry`
--
ALTER TABLE `xray_entry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `xrayEntry` (`receptNumber`,`yearly_no`,`patient_name`,`gander`,`date`,`dated`,`dept_id`,`user_id`,`shift`,`quantity`,`type`,`is_deleted`);

--
-- Indexes for table `xray_entry_details`
--
ALTER TABLE `xray_entry_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `xraydetailEntry` (`entry_id`,`xray_type_id`,`is_deleted`,`yearly`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lab_entry`
--
ALTER TABLE `lab_entry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lab_entry_details`
--
ALTER TABLE `lab_entry_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `opd_entry`
--
ALTER TABLE `opd_entry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `other_entry`
--
ALTER TABLE `other_entry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xray_entry`
--
ALTER TABLE `xray_entry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xray_entry_details`
--
ALTER TABLE `xray_entry_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
