-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 17, 2023 at 01:33 AM
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
-- Table structure for table `adjust_stock`
--

CREATE TABLE `adjust_stock` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `qty` double NOT NULL,
  `memos` text NOT NULL,
  `adj_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adjust_stock`
--

INSERT INTO `adjust_stock` (`id`, `item_id`, `qty`, `memos`, `adj_date`) VALUES
(1, 26, -3700, '', '2020-02-19');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '1 for deleted',
  `dep_name` text NOT NULL,
  `dept_nick` varchar(200) DEFAULT NULL,
  `dept_price` int(11) DEFAULT NULL,
  `view` text NOT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '1 for deleted',
  `add_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `parent_id`, `dep_name`, `dept_nick`, `dept_price`, `view`, `is_deleted`, `add_date`) VALUES
(1, 0, 'Male OPD', 'M', 10, 'OPD', 0, '0000-00-00 00:00:00'),
(2, 0, 'GYNE', 'GYNE', 10, 'OPD', 0, '0000-00-00 00:00:00'),
(3, 0, 'CASUALTY', 'CASU', 10, 'OPD', 0, '0000-00-00 00:00:00'),
(4, 0, 'ECG', 'ECG', 60, 'OTHER', 0, '0000-00-00 00:00:00'),
(5, 0, 'ECHO', 'ECHO', 500, 'OTHER', 0, '0000-00-00 00:00:00'),
(6, 0, 'PHYSIOTHERAPY A', 'PHY(A)', 50, 'OTHER', 0, '0000-00-00 00:00:00'),
(7, 0, 'PHYSIOTHERAPY B', 'PHY(B)', 50, 'OTHER', 0, '0000-00-00 00:00:00'),
(8, 0, 'WARDS', 'WARD', 20, 'OTHER', 0, '0000-00-00 00:00:00'),
(9, 0, 'OTs', 'OT', 100, 'OTHER', 0, '0000-00-00 00:00:00'),
(10, 0, 'Female Ultrasound', 'US', 180, 'OTHER', 0, '0000-00-00 00:00:00'),
(11, 0, 'AMBUANCE', 'AMBU', 0, 'OTHER', 0, '0000-00-00 00:00:00'),
(13, 0, 'LABOUR ROOM', 'LR', 20, 'OTHER', 0, '0000-00-00 00:00:00'),
(14, 0, 'PRIVATE ROOM', 'PR', 200, 'OTHER', 0, '0000-00-00 00:00:00'),
(15, 0, 'XRAY', 'XRAY', 150, 'XRAY', 0, '0000-00-00 00:00:00'),
(16, 0, 'LABORATORY', 'LAB', 0, 'LAB', 0, '0000-00-00 00:00:00'),
(18, 11, 'A-1005 BATKHELA TO PESHAWAR HMC', '1005', 840, 'OTHER', 0, '0000-00-00 00:00:00'),
(19, 11, 'A-1005 BATKHELA TO PESHAWAR KTH', '1005', 810, 'OTHER', 0, '0000-00-00 00:00:00'),
(20, 11, 'A-1005 BATKHELA TO PESHAWAR LRH', '1005', 720, 'OTHER', 0, '0000-00-00 00:00:00'),
(21, 11, 'A-1005 BATKHELA TO SWAT KADNEY CENTER', '1005', 360, 'OTHER', 0, '0000-00-00 00:00:00'),
(22, 11, 'A-1005 BATKHELA TO SWAT CENTER HOSPITAL', '1005', 360, 'OTHER', 0, '0000-00-00 00:00:00'),
(23, 11, 'A-1034 BATKHELA TO PESHAWAR HMC', '1034', 840, 'OTHER', 0, '0000-00-00 00:00:00'),
(24, 11, 'A-1034 BATKHELA TO PESHAWAR KTH', '1034', 810, 'OTHER', 0, '0000-00-00 00:00:00'),
(25, 11, 'A-1034 BATKHELA TO PESHAWAR LRH', '1034', 720, 'OTHER', 0, '0000-00-00 00:00:00'),
(26, 11, 'A-1034 BATKHELA TO SWAT KADNEY CENTER', '1034', 360, 'OTHER', 0, '0000-00-00 00:00:00'),
(27, 11, 'A-1034 BATKHELA TO SWAT CENTER HOSPITAL', '1034', 360, 'OTHER', 0, '0000-00-00 00:00:00'),
(28, 11, 'A-1033 BATKHELA TO PESHAWAR HMC', '1033', 840, 'OTHER', 0, '0000-00-00 00:00:00'),
(29, 11, 'A-1033 BATKHELA TO PESHAWAR KTH', '1033', 810, 'OTHER', 0, '0000-00-00 00:00:00'),
(30, 11, 'A-1033 BATKHELA TO PESHAWAR LRH', '1033', 720, 'OTHER', 0, '0000-00-00 00:00:00'),
(31, 11, 'A-1033 BATKHELA TO SWAT KADNEY CENTER', '1033', 360, 'OTHER', 0, '0000-00-00 00:00:00'),
(32, 11, 'A-1033 BATKHELA TO SWAT CENTER HOSPITAL', '1033', 360, 'OTHER', 0, '0000-00-00 00:00:00'),
(33, 11, 'X-68-5028 BATKHELA TO PESHAWAR HMC', '5028', 840, 'OTHER', 0, '0000-00-00 00:00:00'),
(34, 11, 'X-68-5028 BATKHELA TO PESHAWAR KTH', '5028', 810, 'OTHER', 0, '0000-00-00 00:00:00'),
(35, 11, 'X-68-5028 BATKHELA TO PESHAWAR LRH', '5028', 720, 'OTHER', 0, '0000-00-00 00:00:00'),
(36, 11, 'X-68-5028 BATKHELA TO SWAT KADNEY CENTER', '5028', 450, 'OTHER', 0, '0000-00-00 00:00:00'),
(37, 11, 'X-68-5028 BATKHELA TO SWAT CENTER HOSPITAL', '5028', 360, 'OTHER', 0, '0000-00-00 00:00:00'),
(38, 8, 'MALE SURGICAL WARD', 'MS', 20, 'OTHER', 0, '0000-00-00 00:00:00'),
(39, 8, 'FEMALE SURGICAL WARD', 'FS', 20, 'OTHER', 0, '0000-00-00 00:00:00'),
(40, 8, 'MALE MEDICAL WARD', 'MM', 20, 'OTHER', 0, '0000-00-00 00:00:00'),
(41, 8, 'FEMALE MEDICAL WARD', 'FM', 20, 'OTHER', 0, '0000-00-00 00:00:00'),
(42, 8, 'MALE ENT WARD', 'MENT', 20, 'OTHER', 0, '0000-00-00 00:00:00'),
(43, 8, 'FEMALE ENT WARD', 'FENT', 20, 'OTHER', 0, '0000-00-00 00:00:00'),
(44, 8, 'MALE EYE WARD', 'ME', 20, 'OTHER', 0, '0000-00-00 00:00:00'),
(45, 8, 'FEMALE EYE WARD', 'FE', 20, 'OTHER', 0, '0000-00-00 00:00:00'),
(46, 8, 'ICU WARD', 'ICU', 20, 'OTHER', 0, '0000-00-00 00:00:00'),
(47, 8, 'GYNE WARD', 'GYBE', 20, 'OTHER', 0, '0000-00-00 00:00:00'),
(48, 8, 'CHILDREN WARD', 'CHIL', 20, 'OTHER', 0, '0000-00-00 00:00:00'),
(49, 8, 'NURSERY WARD', 'NURS', 20, 'OTHER', 0, '0000-00-00 00:00:00'),
(50, 8, 'NEURO SURGERY NEU', '1033', 20, 'OTHER', 0, '0000-00-00 00:00:00'),
(51, 8, 'ORTHOPEDIC WARD', 'ORTH', 20, 'OTHER', 0, '0000-00-00 00:00:00'),
(52, 8, 'DENTAL WARD', 'DENT', 20, 'OTHER', 0, '0000-00-00 00:00:00'),
(53, 9, 'SURGICAL OT', 'SURG', 100, 'OTHER', 0, '0000-00-00 00:00:00'),
(54, 9, 'ORTHOPEDIC OT', 'ORTH', 100, 'OTHER', 0, '0000-00-00 00:00:00'),
(55, 9, 'EYE OT', 'EYE', 100, 'OTHER', 0, '0000-00-00 00:00:00'),
(56, 9, 'GAYNE OT', 'GYNE', 100, 'OTHER', 0, '0000-00-00 00:00:00'),
(57, 9, 'ENT OT', 'ENT', 100, 'OTHER', 0, '0000-00-00 00:00:00'),
(58, 9, 'MAXILO FACIAL SURGERY OT', 'MAXI', 100, 'OTHER', 0, '0000-00-00 00:00:00'),
(59, 0, 'FEMALE OPD ', 'FM', 10, 'OPD', 0, '0000-00-00 00:00:00'),
(60, 0, 'MALE 2ND OPD', 'M2', 10, 'OPD', 0, '0000-00-00 00:00:00'),
(61, 6, 'S.W.D', 'SWD', 50, 'OTHER', 0, '0000-00-00 00:00:00'),
(62, 6, 'I.R.R', 'IRR', 50, 'OTHER', 0, '0000-00-00 00:00:00'),
(63, 6, 'U.S THERAPY ', 'UST', 50, 'OTHER', 0, '0000-00-00 00:00:00'),
(64, 6, 'TENS', 'TENS', 50, 'OTHER', 0, '0000-00-00 00:00:00'),
(65, 6, 'EXERCISES FOR CP CHILD', 'CPCHILD', 50, 'OTHER', 0, '0000-00-00 00:00:00'),
(66, 6, 'EXCERCISES SESSION', 'ES', 50, 'OTHER', 0, '0000-00-00 00:00:00'),
(67, 7, 'S.W.D', 'SWD', 50, 'OTHER', 0, '0000-00-00 00:00:00'),
(68, 7, 'I.R.R', 'IRR', 50, 'OTHER', 0, '0000-00-00 00:00:00'),
(69, 7, 'U.S THERAPY ', 'UST', 50, 'OTHER', 0, '0000-00-00 00:00:00'),
(70, 7, 'TENS', 'TENS', 50, 'OTHER', 0, '0000-00-00 00:00:00'),
(71, 7, 'EXERCISES FOR CP CHILD', 'CPCHILD', 50, 'OTHER', 0, '0000-00-00 00:00:00'),
(72, 7, 'EXCERCISES SESSION', 'ES', 50, 'OTHER', 0, '0000-00-00 00:00:00'),
(73, 11, 'A-1034 from DHQ (H) Batkhela to Islamabad', 'A-1034', 1620, 'OTHER', 0, '0000-00-00 00:00:00'),
(74, 11, 'A-1005 BATKHELA TO MARDAN HOSPITAL', 'A-1005', 450, 'OTHER', 0, '0000-00-00 00:00:00'),
(75, 11, 'A-1033 BATKHELA TO MARDAN HOSPITAL', 'A-1033', 450, 'OTHER', 0, '0000-00-00 00:00:00'),
(76, 11, 'A-1034 BATKHELA TO MARDAN HOSPITAL', 'A-1034', 450, 'OTHER', 0, '0000-00-00 00:00:00'),
(77, 11, 'X-68-5028 BATKHELA TO MARDAN HOSPITAL', 'X-68-5028', 450, 'OTHER', 0, '0000-00-00 00:00:00'),
(85, 0, 'PHARMACY', 'PH', 0, 'Pharmacy', 0, '0000-00-00 00:00:00'),
(86, 85, 'UNIT INDENT', 'UIND', 0, 'Pharmacy', 1, '0000-00-00 00:00:00'),
(87, 85, 'x-ray', 'xy', 0, 'Pharmacy', 0, '0000-00-00 00:00:00'),
(88, 85, 'laboratory', 'lab', 0, 'Pharmacy', 0, '0000-00-00 00:00:00'),
(89, 85, 'MEDICINE', 'med', 0, 'Pharmacy', 0, '0000-00-00 00:00:00'),
(90, 85, 'ROGHEM', 'ROG', 0, 'Pharmacy', 1, '0000-00-00 00:00:00'),
(91, 85, 'INSULINE', 'INS', 0, 'Pharmacy', 1, '0000-00-00 00:00:00'),
(93, 85, 'Bedding and clothing', 'BC', 0, 'Pharmacy', 0, '0000-00-00 00:00:00'),
(94, 85, 'MEDICINE AND EQUIPMENT', 'M and EQ', 0, 'Pharmacy', 0, '0000-00-00 00:00:00'),
(95, 85, 'BLOOD BANK', 'BB', 0, 'Pharmacy', 0, '0000-00-00 00:00:00'),
(96, 0, 'Blood Bank', 'BB', 0, 'LAB', 0, '0000-00-00 00:00:00'),
(97, 0, 'Male Ultrasound 2', 'M/US2', 180, 'OTHER', 0, '0000-00-00 00:00:00'),
(98, 0, '2nd Laboratory', 'LAB2', 0, 'LAB', 0, '0000-00-00 00:00:00'),
(99, 0, '2nd Female OPD', '2FOPD', 10, 'OPD', 0, '0000-00-00 00:00:00'),
(100, 0, 'Male Ultrasound', 'M/US', 180, 'OTHER', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `name`) VALUES
(1, 'Malakand'),
(2, 'Swat'),
(3, 'Lower Dir'),
(4, 'Upper Dir'),
(5, 'Other'),
(6, 'Malakand'),
(7, 'Bajur');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `type`) VALUES
(1, 'test', '74'),
(2, 'Medical Female Ward', 'unit_name'),
(3, 'Surgical Male Ward', 'unit_name'),
(4, 'Surgical Female Ward', 'unit_name'),
(5, 'Children  Ward', 'unit_name'),
(6, 'Nursary Ward', 'unit_name'),
(7, 'Eye ward', 'unit_name'),
(8, 'ENT Ward', 'unit_name'),
(9, 'Main Operation theater', 'unit_name'),
(10, 'Eye Operation theater', 'unit_name'),
(11, 'Labour room Morning shift', 'unit_name'),
(12, 'Labour room evening  shift', 'unit_name'),
(13, '', 'unit_name'),
(14, 'Labour room Night shift', 'unit_name'),
(15, 'Casualty Morning Shift', 'unit_name'),
(16, 'Casualty Evening A Shift', 'unit_name'),
(17, 'Casualty Evening B Shift', 'unit_name'),
(18, 'Casualty Night  A Shift', 'unit_name'),
(19, 'Casualty Night B Shift', 'unit_name'),
(20, 'Casualty Special Sunday Shift', 'unit_name'),
(21, 'Main OPD', 'unit_name'),
(22, 'Dressing Room', 'unit_name'),
(23, 'Gynae Ward', 'unit_name'),
(24, 'Gynae OPD', 'unit_name'),
(25, 'Dental Unit Male', 'unit_name'),
(26, 'Dental Unit Male', 'unit_name'),
(27, 'Dental Unit Female', 'unit_name'),
(28, 'Physiotherapy OPD', 'unit_name'),
(29, 'CCU/ICU', 'unit_name'),
(30, 'CCU/ICU/RR', 'unit_name'),
(31, 'Private Room', 'unit_name'),
(32, 'Laboratory', 'unit_name'),
(33, 'X-ray unit', 'unit_name'),
(34, 'Blood Bank', 'unit_name'),
(35, 'Dr.Fazli Rahim', 'cons_specailist'),
(36, 'Dr.Hayat Shehzad', 'cons_specailist'),
(37, 'Dr. Shugufta Murad', 'cons_specailist'),
(38, 'Dr.Shahid Wasim', 'cons_specailist'),
(39, 'Dr. Asghar Khan', 'cons_specailist'),
(40, 'Dr.Ghani Ur Rehman', 'cons_specailist'),
(41, 'Dr.Mohammad Saeed ', 'cons_specailist'),
(42, 'Dr. Abdul Ghafoor ', 'cons_specailist'),
(43, 'Dr. Kifayatullah', 'cons_specailist'),
(44, 'Dr.Abdul Qadeem', 'cons_specailist'),
(45, 'Dr. Mohammad Ali', 'cons_specailist'),
(46, 'Sher Mohammad', 'cons_specailist'),
(47, 'Mr.Inayat Ur Rehman', 'cons_specailist'),
(48, 'Dr.Saudullah', 'cons_specailist'),
(49, 'Dr.Shugufta Zeb', 'cons_specailist'),
(50, 'Dr wajih muhammad', 'Advisor'),
(51, 'Mr.Jamil', 'ward_incharge'),
(52, 'Mrs.Kalsoom', 'ward_incharge'),
(53, 'Mr.M.Younis', 'ward_incharge'),
(54, 'Mrs.Lubna', 'ward_incharge'),
(55, 'Mr.Naik Zamin', 'ward_incharge'),
(56, 'Murad Ali Shah', 'ward_incharge'),
(57, 'Mr.Tariq', 'ward_incharge'),
(58, 'Mrs.Zakia', 'ward_incharge'),
(59, 'Mrs.Zakia', 'ward_incharge'),
(60, 'Mr.Rashid Ullah', 'ward_incharge'),
(61, 'Mrs.Nargis', 'ward_incharge'),
(62, 'Mr.Amjid', 'ward_incharge'),
(63, 'Mr.Shahid Aziz', 'ward_incharge'),
(64, 'Mr.Ashfaq', 'ward_incharge'),
(65, 'Mr.Atif', 'ward_incharge'),
(66, 'Mr.Fazli Rahim', 'ward_incharge'),
(67, 'Mr.Tufail', 'ward_incharge'),
(68, 'Mr.Adnan', 'ward_incharge'),
(69, 'Mr. Nisar', 'ward_incharge'),
(70, 'Mr.Kashif', 'ward_incharge'),
(71, 'Mr.Nisar Ahmad', 'ward_incharge'),
(72, 'Mr. Ziarat Khan', 'ward_incharge'),
(73, 'Mr. Sher Mohammad', 'ward_incharge'),
(74, 'Mr.Mushtaq Hussain', 'ward_incharge'),
(75, 'Mr.Mushtaq Hussain', 'ward_incharge'),
(76, 'Mr.Inayat Ur Rehman', 'ward_incharge'),
(77, 'Mr.Inayat Ur Rehman', 'ward_incharge'),
(78, 'Mr.M.Nawaz', 'ward_incharge'),
(79, 'Mr.Iqbal Shaheen', 'ward_incharge'),
(80, 'Dr. Saeed Ur Rahman', 'issue_from'),
(102, 'MCC Supplier', 'Supplier'),
(103, 'Local Supplier', 'Supplier'),
(104, 'Donation', 'Supplier'),
(125, 'medicine', 'category'),
(127, 'Wajih Muhammad', 'store_keeper'),
(128, 'syrup', 'category'),
(129, 'tablets', 'category'),
(130, 'injection', 'category'),
(132, 'film', 'category'),
(133, 'XRay', 'category'),
(134, 'I /V SET', 'category'),
(135, 'bandge gauze', 'category'),
(136, 'Infusion', 'category'),
(137, 'SIKL', 'category'),
(138, 'catton', 'category'),
(139, 'cream', 'category'),
(140, 'insuline', 'category'),
(141, 'SOLUTION', 'category'),
(142, 'suture', 'category'),
(143, 'influsion', 'category'),
(144, 'surgical', 'category'),
(145, 'contigency', 'category');

-- --------------------------------------------------------

--
-- Table structure for table `hospital_info`
--

CREATE TABLE `hospital_info` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `logo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hospital_info`
--

INSERT INTO `hospital_info` (`id`, `name`, `address`, `logo`) VALUES
(1, 'DHQ HOSPITAL BATKHAILA', 'BATKHAILA', 'https://dhqhospitalbtk.com/images/logo.png');

-- --------------------------------------------------------

--
-- Table structure for table `indent_sub_name`
--

CREATE TABLE `indent_sub_name` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `indent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `indent_sub_name`
--

INSERT INTO `indent_sub_name` (`id`, `name`, `indent_id`) VALUES
(18, 'insulin', 0),
(19, 'film', 87),
(20, 'medicine', 89),
(21, 'x ray', 87);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `category` varchar(50) NOT NULL,
  `quantity` double NOT NULL,
  `batch_no` varchar(50) NOT NULL,
  `expiry` date NOT NULL,
  `low_limit` int(11) NOT NULL,
  `company` varchar(20) NOT NULL,
  `med_type` int(11) NOT NULL,
  `product_type` int(11) NOT NULL,
  `product_cat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`, `name`, `category`, `quantity`, `batch_no`, `expiry`, `low_limit`, `company`, `med_type`, `product_type`, `product_cat`) VALUES
(10, 'Tab / clopidogel / 75 mg / locril', 'tablets', 27550, '9001', '2022-06-30', 0, 'Company', 3, 0, 20),
(11, 'Tab / tranexaimc acid / 500mr / brino', 'tablets', 1575, '013d', '2020-07-31', 0, 'Company', 3, 0, 20),
(12, 'Tab / Metronidazole / 400mg / Riam', 'tablets', 14710, 'T531', '2021-10-31', 0, 'Company', 3, 0, 20),
(13, 'Tab / Losartan Potassium+Hydrochlorothiazide / 500mg+12.5mg. / Xavor diu', 'tablets', 0, '1y156', '2021-09-30', 0, 'Company', 3, 0, 20),
(14, 'Tab / Divalproex Sodium / 500mg / Dapakan', 'tablets', 21540, '402', '2020-11-30', 0, 'Company', 3, 0, 20),
(15, 'Tab / Carbamazepine / 200mg / Teril', 'tablets', 40600, '7761', '2022-10-31', 0, 'Company', 3, 0, 20),
(16, 'Tab / Paracetamol / 500mg / Pedrol', 'tablets', 87055, 'a323', '2021-11-30', 0, 'Company', 3, 0, 20),
(17, 'Tab / pantoprazole / 20 mg / Neege', 'tablets', 20583, '006e', '2021-10-31', 0, 'Company', 3, 0, 20),
(18, 'Tab / aceclofenac / 100mg / Alkaris', 'tablets', 72225, '006e', '2021-08-31', 0, 'Company', 3, 0, 20),
(19, 'Tab / rosuvastatin / 10mg / Omnitor', 'tablets', 25020, '9003', '2022-07-31', 0, 'Company', 3, 0, 20),
(20, 'Tab / loratadine / 10mg / Lorid', 'tablets', 43065, '10 A334', '2022-11-30', 0, 'Company', 3, 0, 20),
(21, 'Syrup / Acefylline piperazine / 120 ml / Brophyl', 'syrup', 3689, '10 y 547', '2022-01-31', 0, 'Company', 3, 0, 20),
(22, 'Syrup/Paracetamol BP/120 mg/Pedrol', 'Syrup', 3804, '10 Y 434', '2021-11-30', 100, 'Company', 3, 1, 20),
(23, 'Syrup / Metronidazole Benzoate BP / 200mg/5ml / Riam', 'syrup', 2571, 'w 799', '2020-10-31', 0, 'Company', 3, 0, 20),
(26, 'film size', 'film', 3250, '.....', '0000-00-00', 0, 'Local', 1, 21, 21),
(28, 'Inj / Streptokinase BP / 1.5 MIU / ESKINASE', 'injection', 40, '19002', '2021-05-31', 5, 'Company', 1, 1, 20),
(29, 'Inj / Oxytocin / 5 IU / TOCINOX', 'injection', 10850, '987092', '2021-08-31', 500, 'Company', 1, 1, 20),
(30, 'IV SET / UNISET /  / UNISET', 'I /V SET', 35700, '191004', '2022-09-30', 1000, 'Company', 1, 1, 20),
(31, 'Inj / Disposible Syringes / 5cc / Disposible Syringes', 'injection', 49100, '1910502', '2022-09-30', 1000, 'Company', 1, 1, 20),
(32, 'gauze / gauz sawab / 10cm *10cm / pakband', 'bandge gauze', 4710, '0221', '2022-09-30', 100, 'Company', 1, 1, 20),
(33, 'Inj / Dexamethasone Sodium Phosphate / 4 mg /ml / DEXAMEDRON', 'injection', 26000, '981024', '2022-10-31', 1000, 'Company', 1, 1, 20),
(34, 'Solid / CRIP BANDAGE /  / CRIP BANDAGE', 'bandge gauze', 1420, '0363', '2022-10-31', 100, 'Company', 1, 1, 20),
(35, 'Inf / Ciprofloxacin / 200mg / STERICIPRO', 'Infusion', 8450, '307019', '2021-10-18', 100, 'Company', 1, 1, 20),
(36, 'Inj / Vancomycin HCL / 500mg / VANCOM', 'injection', 270, '0051036', '2021-03-03', 320, 'Company', 1, 1, 20),
(37, 'Inf / Metronidazole / 500mg / STERIMET', 'Infusion', 13050, '308919', '2021-10-31', 100, 'Company', 1, 1, 20),
(38, 'Inj / immunoglobulin rabis / 2ml /300 iu / Berirab p', 'injection', 7, 'p100113706', '2021-11-30', 2, 'Company', 1, 1, 20),
(39, 'Inj / Omeprazole / 40mg / Loprot', 'injection', 40338, 'lib031', '2021-11-30', 1000, 'Company', 1, 1, 20),
(40, 'Inj / ketorolac tromethamine / 30 mg / Torsk', 'injection', 3600, 'tr 036 ', '2021-11-30', 100, 'Company', 1, 1, 20),
(41, 'Inf / Dextrose  Saline / 1000ml / UNISOL DS', 'Infusion', 520, '9113326', '2022-10-31', 50, 'Company', 1, 1, 20),
(42, 'Inf / NORMAL SALINE / 1000ml / UNISOL NS', 'Infusion', 1760, '9113341', '2022-06-30', 100, 'Company', 1, 1, 20),
(43, 'Inf / Ringer lactate solution +5 Dextrose / 500ml / UNSOL RLD', 'Infusion', 3500, '9111015', '2021-10-31', 100, 'Company', 1, 1, 20),
(44, 'Inj / Disposible Syringes / 10cc / UNIJECT ', 'injection', 48550, '19111002', '2022-06-30', 100, 'Company', 1, 1, 20),
(45, 'Inj / Ceftriaxone Sodium / 1gm / ANTRIX', 'injection', 31782, 'A 639', '2021-12-31', 100, 'Company', 1, 1, 20),
(46, 'Inj / Tramadol HCL / 100mg / Trafast', 'injection', 6300, '9j288', '2021-10-31', 100, 'Company', 1, 1, 20),
(47, 'Inf / Mannitol, / 500ml / UNIRETIC', 'Infusion', 475, '9114619', '2021-10-31', 10, 'Company', 1, 1, 20),
(48, 'Tab / Misoprostol / 200mcg / CYTOTOL', 'tablets', 1880, '135', '2021-09-30', 100, 'Company', 1, 1, 20),
(49, 'Inj / Midazolam / 5 ML / DORCOM', 'injection', 4150, '9J 292', '2021-11-30', 100, 'Company', 1, 1, 20),
(50, 'Inj / Atracurium Besylate / 10 mg / ACURON', 'injection', 800, '11919', '2021-04-30', 40, 'Company', 1, 1, 20),
(51, 'Inj / Diclofenac Sodium / 75mg/3ml / VOVERON', 'injection', 31200, '285', '2021-11-30', 500, 'Company', 1, 1, 20),
(52, 'Inj / Dimehydrinate / 50 MG / GRAVINATE', 'injection', 39600, 'A0052', '2022-11-30', 1000, 'Company', 1, 1, 20),
(53, 'Inj / Tranexamic Acid / 500mg / B STOP', 'injection', 950, '9K 323', '2022-11-30', 100, 'Company', 1, 1, 20),
(54, 'Solid/Plastic / ORTHOPLAST /  / GAYPSONA', 'bandge gauze', 1106, '22J19', '0000-00-00', 0, 'Company', 1, 1, 20),
(55, 'Inj / Mangesium sulphate / 10 ml / MGS', 'injection', 727, '660', '2022-06-30', 10, 'Company', 1, 1, 20),
(56, 'Inj / Nalbyphine Hydrochloride / 10mg / SONOTIC', 'injection', 0, '080E8', '2020-04-30', 12, 'Company', 1, 1, 20),
(57, 'Liquid / Salbutamol Nebulizer Solution / 20ml / ZAFTOLIN', 'medicine', 73, '75', '2021-07-31', 12, 'Company', 1, 1, 20),
(58, 'Solid/Plastic / ORTHO GAUZE /  / GUSE ROLL', 'Infusion', 298, '097', '0000-00-00', 0, 'Company', 1, 1, 20),
(59, 'Liquid / Black silk /  / black silk 4.0', 'SIKL', 72, '1019', '2020-10-31', 0, 'Company', 1, 1, 20),
(60, 'Solid / Cotton / 200gm / cotton', '', 744, '03 g19', '2022-06-30', 100, 'Company', 1, 1, 0),
(61, 'Liquid / Silver sulphadiazine / 1 % / ALUGEN', 'cream', 357, '065', '2020-12-31', 0, 'Company', 1, 1, 20),
(62, 'Liquid / Lignocaine / 2 % / XINO GEL', 'cream', 536, '039', '2020-12-31', 12, 'Company', 1, 1, 20),
(63, 'Inj / Arthemeter / 80mg/ml / ROTEM', 'injection', 1038, 'RT2 703Y', '2020-11-30', 12, 'Company', 1, 1, 20),
(64, 'Inj / Dobutamine / 250 MG / Dobutamine', 'injection', 100, 'Y19003', '2021-02-28', 0, 'Company', 1, 1, 20),
(65, 'Inj / Dopamine / 200mg / INOPAN', 'injection', 260, 'E19006', '2022-04-30', 0, 'Company', 1, 1, 20),
(66, 'Inj / Isosorbid Dinitrate / 10mg / SORBID', 'injection', 70, 'E10910', '2022-04-30', 12, 'Company', 1, 1, 20),
(67, 'Solid/Plastic / ROLL BANDAGE /  ', '', 48864, '0460', '2022-01-01', 12, 'Company', 1, 1, 0),
(68, 'Liquid / SURGICAL SCRUB / 450ML / PYODINE SS', 'SOLUTION', 289, '019E9', '2022-05-31', 12, 'Company', 1, 1, 20),
(69, 'Inj / Ceftriaxone / 500mg / ANTRIX', 'injection', 46598, 'A 634', '2022-12-31', 120, 'Company', 1, 1, 20),
(70, 'Inj / Hydrocortisone sodium / 250mg / HYZONATE', 'injection', 3160, '834', '2024-02-10', 120, 'Company', 1, 1, 20),
(71, 'Inj / Hydrocortisone sodium / 100mg / HYZONATE', 'injection', 3850, '741', '2024-02-10', 120, 'Company', 1, 1, 20),
(72, 'Inj / Antisnake venom / 1 VIL / Antisnake venom', 'injection', 8, 'AD5318094', '2022-09-30', 1, 'Local', 1, 1, 20),
(73, 'Inj / Lignocaine  Hcl+ Adrenaline / 10ML / Xylocaine', 'injection', 1700, 'co 473', '2021-05-31', 100, 'Local', 1, 1, 20),
(74, ' / Examinatin Gloves /  / Examinatin Gloves', 'bandge gauze', 87, '', '0000-00-00', 0, 'Company', 1, 1, 20),
(76, 'Inj / Diazepam / 10ml  / VALIUM', 'injection', 495, 'F1147', '2021-07-31', 22, 'Local', 1, 1, 20),
(77, 'Inj / Lignocaine Hcl PLAIN / 10 ml / Xylocaine', 'injection', 2600, 'C 1460', '2022-07-31', 100, 'Local', 1, 1, 20),
(78, 'Inj / Furosemide / 20mg/2ml / SUMEIDE', 'injection', 1400, 'SM 003', '2021-02-28', 0, 'Local', 1, 1, 20),
(79, 'Inj / Adreanaline / 1 ML / Adreanaline', 'injection', 1000, '', '0000-00-00', 0, 'Local', 1, 1, 20),
(80, 'Inj / Atropine sulphate / Img / Atropine sulphate', 'injection', 900, '180501', '2021-05-31', 100, 'Local', 1, 1, 20),
(81, 'sticking / sticking plaster /  / sticking plaster', 'bandge gauze', 1748, '1910020ct', '2022-04-30', 100, 'Local', 1, 1, 20),
(82, 'Inj / Phloroglucinol/Trimethylphloroglucinol / 1 ML / spasrid', 'injection', 426, ' co623', '2023-06-30', 0, 'Local', 1, 1, 20),
(83, 'Inj / digoxin / 2ml / LANOXIN', 'injection', 450, 'HLAAB', '2023-04-30', 0, 'Local', 1, 1, 20),
(84, 'Liquid / PYODINE / 450 ML / PYODINE S', 'SOLUTION', 379, '128E9', '2022-05-31', 0, 'Local', 1, 1, 20),
(85, 'ROLL / ECG ROLL /  / ECG ROLL', 'bandge gauze', 570, '', '0000-00-00', 0, 'Local', 1, 1, 20),
(86, 'Gel / ECG GEL /  / ECG GEL', 'SOLUTION', 20, '', '0000-00-00', 0, 'Local', 1, 1, 20),
(87, 'MASK / Nebulizer Mask /  / Nebulizer Mask', 'medicine', 193, '', '0000-00-00', 0, 'Company', 1, 1, 20),
(88, 'TUBE / FEEDING TUBE /  / FEEDING TUBE', 'medicine', 615, '', '0000-00-00', 0, 'Company', 1, 1, 20),
(89, 'ETT / ETT TUBE /  / ETT TUBE', 'medicine', 700, '', '0000-00-00', 0, 'Company', 1, 1, 20),
(90, 'Inj / Isoflurane / 100ml / RESTANE', 'injection', 120, 'NOO79A25', '2024-01-31', 10, 'Local', 1, 1, 20),
(91, 'Inj / Insulin / 70/30 / Insugate', 'injection', 1500, '', '0000-00-00', 0, 'Company', 1, 1, 18),
(92, 'Inj / Drotaverine HCI / 100ml / DROSPA', 'injection', 18800, 'DR 212', '2022-01-31', 50, 'Company', 1, 1, 20),
(93, 'Liquid / polygeline / 500ml / haemaccel', 'Infusion', 1043, 'wc155', '2022-11-30', 20, 'Company', 1, 1, 20),
(94, 'Inj / Enoxaparin sodium / 8000 iu 0.8 ml / clexane', 'injection', 750, '9s389', '2021-10-31', 100, 'Company', 1, 1, 20),
(95, 'Inj / Ceftriaxone Sodium / 2g / XTRACEF', 'injection', 4700, 'XF3 027B', '2022-02-28', 500, 'Company', 1, 1, 20),
(96, 'Solid/Plastic / IV BURETTE / 100ml / BIOSOFT', 'bandge gauze', 300, 'HSS 079', '0000-00-00', 12, 'Company', 1, 1, 20),
(97, 'Syrup / co-amoxiclav / 156.25/5ml / CO-Amoxi', 'syrup', 5000, '0001', '2021-12-31', 150, 'Company', 1, 1, 20),
(98, 'Tab / levofloxacin USP / 500mg / LEVOXIN', 'tablets', 50000, 'A0008', '2022-08-31', 1000, 'Company', 1, 1, 20),
(99, 'Inj / Human Anti-D Immunoglobulin PH.Eur / 300 ug / Rhophylac', '149', 78, 'p100123313', '2022-06-30', 10, 'Company', 1, 1, 20),
(100, 'Tablets / surgigut / 0 / catgut', 'tablets', 712, '1317', '2011-11-25', 100, 'Company', 1, 1, 20),
(101, 'suture / Silk Braided / 0 / B.silk', '125', 698, '1282', '2025-11-11', 100, 'Company', 1, 1, 20),
(102, 'injection / Pipeeracillin+tazobectam / 4.5gm / Tazopep', 'injection', 1074, '863', '2025-08-08', 300, 'Company', 1, 1, 20),
(103, 'Tablets / Capotopsil / 25 / Acatopsil', 'tablets', 920, '19', '2024-11-11', 400, 'Company', 1, 1, 20),
(104, 'Tablets / Glycrcye irinibate / 0.5 / Angised', 'tablets', 1000, 'xBr', '2014-02-12', 500, 'Company', 1, 1, 20),
(105, 'injection / Amiodaron150mg / 150mg / cardaron', 'injection', 1074, 'AH003', '2021-12-12', 500, 'Company', 1, 1, 20),
(106, 'influsion / unisol NS / 100ml / plodex 100ml', '143', 3553, '0102231', '2023-09-09', 500, 'Company', 1, 1, 20),
(107, 'injection / cefotaxin250 / 250ml / Otazim', 'Injection', 1878, '010', '2022-11-11', 500, 'Company', 1, 1, 0),
(108, 'injection / cefotaxin250 / 250ml / Otazim', 'injection', 1878, '010', '2022-11-11', 500, 'Company', 1, 1, 20),
(109, 'surgical / Bia bag / 910 / urine bag', 'medicine', 910, '20200208', '2023-09-09', 200, 'Company', 1, 1, 20),
(110, 'injection / cefoperazone +sulbactum / 5 / sozon2gm', 'injection', 4733, 'S.094', '2022-11-11', 500, 'Company', 1, 1, 20),
(111, 'influsion / sodium-bicrboant / 0 / Mini bc', 'Infusion', 238, '831820', '2023-10-10', 100, 'Company', 1, 1, 20),
(112, 'injection / pralidoxin / 20mg / p-doxine', 'injection', 70, 'FL006F', '2022-12-12', 10, 'Company', 1, 1, 20),
(113, 'injection / Nalbuphim / 0 / Bunail10l', 'injection', 1490, '210007', '2022-11-11', 500, 'Company', 1, 1, 20),
(114, 'injection / Metoprolol tartrate / 0 / merol', 'injection', 100, 'my009f', '2022-08-08', 10, 'Company', 1, 1, 20),
(115, 'injection / Anipricillin / 0 / 2Anpricilliin500', 'injection', 880, '350', '2022-09-09', 100, 'Company', 1, 1, 20),
(116, 'injection / Anipricillin / 0 / 2Anpricilliin500', 'injection', 880, '350', '2022-09-09', 100, 'Company', 1, 1, 20),
(117, 'surgical / Favocath / 0 / Canulla', 'medicine', 9500, 'E0018', '2025-06-06', 500, 'Company', 1, 1, 20),
(118, 'surgical / Favocath / 0 / Canulla', 'medicine', 9500, 'E0018', '2025-06-06', 500, 'Company', 1, 1, 20),
(119, 'injection / Valporatic sodium / o / Epivall', 'injection', 45, '202642', '2025-08-08', 10, 'Company', 1, 1, 20),
(120, 'surgical / Urocath / 0.5 / F/cathater', '144', 910, 'Hss082', '2025-09-09', 200, 'Company', 1, 1, 20),
(121, 'cotigency / ChloroxynLOL1000ML / 1000 / Dettol lotion', '145', 200, '1040', '2025-12-12', 50, 'Company', 1, 1, 20),
(122, 'surgical / Favocath / 0 / i/v canolla22', 'surgical', 4000, 'E00013', '2025-04-04', 500, 'Company', 1, 1, 19),
(123, 'surgical / Favocath / 0 / i/v canolla20', 'surgical', 1550, 'E00020', '2025-06-06', 500, 'Company', 1, 1, 20),
(124, 'surgical / Favocath / 0 / i/v canolla218', 'medicine', 1750, 'E0019', '2025-06-06', 500, 'Company', 1, 1, 20);

-- --------------------------------------------------------

--
-- Table structure for table `item_batch`
--

CREATE TABLE `item_batch` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `batch_no` varchar(50) NOT NULL,
  `expiry` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_batch`
--

INSERT INTO `item_batch` (`id`, `item_id`, `batch_no`, `expiry`) VALUES
(1, 1, 'eeef', '2020-03-01'),
(2, 2, '54TES', '2020-02-28'),
(3, 3, 'eeef', '2020-01-31'),
(4, 4, 'eeef', '2020-01-31'),
(5, 5, '', '0000-00-00'),
(6, 6, '3F45D', '2020-03-01'),
(7, 7, '3F45D', '2020-02-26'),
(8, 8, '3F45D', '2020-02-26'),
(9, 9, '3F45D', '1900-11-15'),
(10, 10, '9001', '2022-06-30'),
(11, 11, '013d', '2020-07-31'),
(12, 12, 'T531', '2021-10-31'),
(13, 13, '1y156', '2021-09-30'),
(14, 14, '402', '2020-11-30'),
(15, 15, '7761', '2022-10-31'),
(16, 16, 'a323', '2021-11-30'),
(17, 17, '006e', '2021-10-31'),
(18, 18, '006e', '2021-08-31'),
(19, 19, '9003', '2022-07-31'),
(20, 20, '10 A334', '2022-11-30'),
(21, 21, '10 y 547', '2022-01-31'),
(22, 22, '', '0000-00-00'),
(23, 23, 'w 799', '2020-10-31'),
(24, 24, 'safs3', '2020-02-25'),
(26, 26, '.....', '0000-00-00'),
(28, 28, '19002', '2021-05-31'),
(29, 29, '987092', '2021-08-31'),
(30, 30, '191004', '2022-09-30'),
(31, 31, '1910502', '2022-09-30'),
(32, 32, '0221', '2022-09-30'),
(33, 33, '981024', '2022-10-31'),
(34, 34, '0363', '2022-10-31'),
(35, 35, '307019', '2021-10-18'),
(36, 36, '0051036', '2021-03-03'),
(37, 37, '308919', '2021-10-31'),
(38, 38, 'p100113706', '2021-11-30'),
(39, 39, 'lib031', '2021-11-30'),
(40, 40, 'tr 036 ', '2021-11-30'),
(41, 41, '9113326', '2022-10-31'),
(42, 42, '9113341', '2022-06-30'),
(43, 43, '9111015', '2021-10-31'),
(44, 44, '19111002', '2022-06-30'),
(45, 45, 'A 639', '2021-12-31'),
(46, 46, '9j288', '2021-10-31'),
(47, 47, '9114619', '2021-10-31'),
(48, 48, '135', '2021-09-30'),
(49, 49, '9J 292', '2021-11-30'),
(50, 50, '11919', '2021-04-30'),
(51, 51, '285', '2021-11-30'),
(52, 52, 'A0052', '2022-11-30'),
(53, 53, '9K 323', '2022-11-30'),
(54, 54, '22J19', '0000-00-00'),
(55, 55, '660', '2022-06-30'),
(56, 56, '080E8', '2020-04-30'),
(57, 57, '75', '2021-07-31'),
(58, 58, '097', '0000-00-00'),
(59, 59, '1019', '2020-10-31'),
(60, 60, '03 g19', '2022-06-30'),
(61, 61, '065', '2020-12-31'),
(62, 62, '039', '2020-12-31'),
(63, 63, 'RT2 703Y', '2020-11-30'),
(64, 64, 'Y19003', '2021-02-28'),
(65, 65, 'E19006', '2022-04-30'),
(66, 66, 'E10910', '2022-04-30'),
(67, 67, '0460', '2022-01-01'),
(68, 68, '019E9', '2022-05-31'),
(69, 69, 'A 634', '2022-12-31'),
(70, 70, '834', '2024-02-10'),
(71, 71, '741', '2024-02-10'),
(72, 72, 'AD5318094', '2022-09-30'),
(73, 73, 'co 473', '2021-05-31'),
(74, 74, '', '0000-00-00'),
(75, 75, '', '0000-00-00'),
(76, 76, 'F1147', '2021-07-31'),
(77, 77, 'C 1460', '2022-07-31'),
(78, 78, 'SM 003', '2021-02-28'),
(79, 79, '', '0000-00-00'),
(80, 80, '180501', '2021-05-31'),
(81, 81, '1910020ct', '2022-04-30'),
(82, 82, ' co623', '2023-06-30'),
(83, 83, 'HLAAB', '2023-04-30'),
(84, 84, '128E9', '2022-05-31'),
(85, 85, '', '0000-00-00'),
(86, 86, '', '0000-00-00'),
(87, 87, '', '0000-00-00'),
(88, 88, '', '0000-00-00'),
(89, 89, '', '0000-00-00'),
(90, 90, 'NOO79A25', '2024-01-31'),
(91, 91, '', '0000-00-00'),
(92, 92, 'DR 212', '2022-01-31'),
(93, 93, 'wc155', '2022-11-30'),
(94, 94, '9s389', '2021-10-31'),
(95, 95, 'XF3 027B', '2022-02-28'),
(96, 96, 'HSS 079', '0000-00-00'),
(97, 97, '0001', '2021-12-31'),
(98, 98, 'A0008', '2022-08-31'),
(99, 99, 'p100123313', '2022-06-30'),
(100, 100, '1317', '2011-11-25'),
(101, 101, '1282', '2025-11-11'),
(102, 102, '863', '2025-08-08'),
(103, 103, '19', '2024-11-11'),
(104, 104, 'xBr', '2014-02-12'),
(105, 105, 'AH003', '2021-12-12'),
(106, 106, '0102231', '2023-09-09'),
(107, 107, '010', '0000-00-00'),
(108, 108, '010', '2022-11-11'),
(109, 109, '20200208', '2023-09-09'),
(110, 110, 'S.094', '2022-11-11'),
(111, 111, '831820', '2023-10-10'),
(112, 112, 'FL006F', '2022-12-12'),
(113, 113, '210007', '2022-11-11'),
(114, 114, 'my009f', '2022-08-08'),
(115, 115, '350', '2022-09-09'),
(116, 116, '350', '2022-09-09'),
(117, 117, 'E0018', '2025-06-06'),
(118, 118, 'E0018', '2025-06-06'),
(119, 119, '202642', '2025-08-08'),
(120, 120, 'Hss082', '2025-09-09'),
(121, 121, '1040', '2025-12-12'),
(122, 122, 'E00013', '2025-04-04'),
(123, 123, 'E00020', '2025-06-06'),
(124, 124, 'E0019', '2025-06-06');

-- --------------------------------------------------------

--
-- Table structure for table `patient_indent_invoice`
--

CREATE TABLE `patient_indent_invoice` (
  `invoice_id` int(11) NOT NULL,
  `receptNumber` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `f_name` varchar(45) NOT NULL,
  `id_card` varchar(50) NOT NULL,
  `mobile_no` varchar(20) NOT NULL,
  `address` varchar(250) NOT NULL,
  `sex` varchar(50) NOT NULL,
  `pcr` int(11) NOT NULL,
  `last_pcr` int(11) NOT NULL,
  `us` int(11) NOT NULL,
  `date` date NOT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '1 for deleted'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_indent_invoice`
--

INSERT INTO `patient_indent_invoice` (`invoice_id`, `receptNumber`, `type`, `name`, `f_name`, `id_card`, `mobile_no`, `address`, `sex`, `pcr`, `last_pcr`, `us`, `date`, `is_deleted`) VALUES
(1, 1, 18, 'raza', 'ali', '123456789', '1234567890', '', 'Male', 0, 0, 0, '2020-02-12', 0),
(2, 2, 18, 'basit', 'ali', '1234567890', '1234567890', 'Dir Lower', 'Male', 0, 0, 0, '2020-02-12', 0);

-- --------------------------------------------------------

--
-- Table structure for table `patient_invoice_detail`
--

CREATE TABLE `patient_invoice_detail` (
  `id` int(11) NOT NULL,
  `inv_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `qty` double NOT NULL,
  `batch_no` varchar(50) NOT NULL,
  `expiry` date NOT NULL,
  `comment` text NOT NULL,
  `date` date NOT NULL,
  `inv_date` date NOT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '1 for deleted'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_invoice_detail`
--

INSERT INTO `patient_invoice_detail` (`id`, `inv_id`, `item_id`, `qty`, `batch_no`, `expiry`, `comment`, `date`, `inv_date`, `is_deleted`) VALUES
(1, 1, 91, 1, '', '0000-00-00', '', '2020-02-12', '0000-00-00', 0),
(2, 2, 91, 1, '', '0000-00-00', '', '2020-02-12', '0000-00-00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `supplier_invoice`
--

CREATE TABLE `supplier_invoice` (
  `id` int(11) NOT NULL,
  `receptNumber` int(11) NOT NULL,
  `supplier` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `product_type` int(11) NOT NULL,
  `sub_memo` varchar(255) NOT NULL,
  `statement` text NOT NULL,
  `dated` varchar(255) NOT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '1 for deleted',
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_invoice_detail`
--

CREATE TABLE `supplier_invoice_detail` (
  `id` int(11) NOT NULL,
  `inv_id` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `batch_no` varchar(20) NOT NULL,
  `expiry` date NOT NULL,
  `comment` varchar(500) NOT NULL,
  `inv_date` date NOT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '1 for deleted'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `testcategories`
--

CREATE TABLE `testcategories` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `price` double NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1 for enable'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `testcategories`
--

INSERT INTO `testcategories` (`id`, `name`, `parent_id`, `description`, `price`, `status`) VALUES
(295, 'CBC', 0, 'Parent Category', 100, 1),
(296, 'DLC', 0, 'Parent Category', 20, 1),
(297, 'BLOOD SUGAR', 0, 'Parent Category', 50, 1),
(298, 'S.BILIRUBIN TOTAL', 0, 'Parent Category', 50, 1),
(299, 'S.BILIRUBIN DIRECT', 0, 'Parent Category', 50, 1),
(300, 'S.BILIRUBIN INDIRECT ', 0, 'Parent Category', 50, 1),
(301, 'S.G.P.T', 0, 'Parent Category', 50, 1),
(302, 'ALK.PHOSPHATE ', 0, 'Parent Category', 50, 1),
(303, 'S.PROTENS', 0, 'Parent Category', 50, 1),
(304, 'S.ALBUMIN', 0, 'Parent Category', 50, 1),
(305, 'A/G RATIO', 0, 'Parent Category', 50, 1),
(306, 'S.URIC ACID', 0, 'Parent Category', 50, 1),
(307, 'S.UREA', 0, 'Parent Category', 50, 1),
(308, 'S.CREATININE', 0, 'Parent Category', 50, 1),
(309, 'C.K', 0, 'Parent Category', 50, 1),
(310, 'S.G.O.T', 0, 'Parent Category', 50, 1),
(311, 'L.D.H', 0, 'Parent Category', 50, 1),
(312, 'TRIGLYCERDES', 0, 'Parent Category', 50, 1),
(313, 'S.TOTAL CHOLESTROL', 0, 'Parent Category', 50, 1),
(314, 'S.CALCIUM', 0, 'Parent Category', 50, 1),
(315, 'SCRAPING FOR FUNGS', 0, 'Parent Category', 50, 1),
(316, 'SPUTUM FOR AFB', 0, 'Parent Category', 0, 1),
(317, 'STOOL EXAMINATION', 0, 'Parent Category', 30, 1),
(318, 'LD BODIES', 0, 'Parent Category', 100, 1),
(319, 'PREGNANCY TEST', 0, 'Parent Category', 50, 1),
(320, 'ASO TITRA', 0, 'Parent Category', 50, 1),
(321, 'RA FACTOR', 0, 'Parent Category', 50, 1),
(322, 'HBS AG', 0, 'Parent Category', 70, 1),
(323, 'HCV', 0, 'Parent Category', 100, 1),
(324, 'HIV', 0, 'Parent Category', 230, 1),
(325, 'ICT FOR TB', 0, 'Parent Category', 150, 1),
(326, 'TYPHIDOT', 0, 'Parent Category', 150, 1),
(327, 'H.PYALORI', 0, 'Parent Category', 150, 1),
(328, 'BLOOD GROUP', 0, 'Parent Category', 80, 1),
(329, 'SMEAR MP', 0, 'Parent Category', 0, 1),
(330, 'WIDAL', 0, 'Parent Category', 50, 1),
(331, 'BRUCILA TITRA', 0, 'Parent Category', 50, 1),
(332, 'TOXOPLASMA', 0, 'Parent Category', 150, 1),
(333, 'URINE RE', 0, 'Parent Category', 20, 1),
(334, 'TROP T', 0, 'Parent Category', 0, 1),
(335, 'TROP T', 0, 'Parent Category', 0, 0),
(336, 'HB', 0, 'Parent Category', 100, 0),
(337, 'ESR', 0, 'Parent Category', 50, 1),
(338, 'LFTs', 0, 'Parent Category', 150, 1),
(339, 'RFTs', 0, 'Parent Category', 100, 1),
(340, 'FBC', 0, 'Parent Category', 100, 0),
(341, 'RBS', 0, 'Parent Category', 50, 0),
(342, 'BLOOD SMEAR ', 0, 'Parent Category', 130, 1),
(343, 'TLC', 0, 'Parent Category', 20, 0),
(344, 'SEMAN ', 0, 'Parent Category', 50, 1),
(345, 'ATOMATIC CBC', 0, 'Parent Category', 100, 0),
(346, 'FBS', 0, 'Parent Category', 50, 0),
(348, 'BSR', 0, 'Parent Category', 50, 0),
(349, 'CT', 0, 'Parent Category', 20, 1),
(350, 'BT', 0, 'Parent Category', 20, 1),
(352, 'Retic Counts', 0, 'Parent Category', 20, 1),
(353, 'Platelet Counts', 0, 'Parent Category', 20, 0),
(354, 'ABO with RH Factor', 0, 'Parent Category', 80, 1),
(355, 'S. Amylase', 0, 'Parent Category', 150, 1),
(356, 'Lipid Profile', 0, 'Parent Category', 250, 1),
(357, 'LDL', 0, 'Parent Category', 80, 1),
(358, 'HDL', 0, 'Parent Category', 80, 1),
(359, 'S.Alk.Phosphetase', 0, 'Parent Category', 50, 1),
(360, 'Widat Test', 0, 'Parent Category', 50, 1),
(361, 'Brucella Test', 0, 'Parent Category', 50, 1),
(362, 'ASO Titer', 0, 'Parent Category', 50, 1),
(363, 'VDRL', 0, 'Parent Category', 150, 1),
(364, 'HBsAg', 0, 'Parent Category', 100, 1),
(365, 'HCV AB', 0, 'Parent Category', 100, 1),
(366, 'HBSAg & HCV Ab', 0, 'Parent Category', 170, 0),
(367, 'Typhidot 1gm 1gG', 0, 'Parent Category', 150, 0),
(368, 'taxo 1gm 1gG', 0, 'Parent Category', 150, 1),
(369, 'Urine 24 Hours Test', 0, 'Parent Category', 80, 0),
(370, 'C.K MB', 0, 'Parent Category', 100, 1),
(371, 'Blood Urea', 0, 'Parent Category', 50, 1),
(372, 'test ahsan', 0, 'Parent Category', 123, 0),
(373, '(BB) HBS AG', 0, 'Parent Category', 70, 1),
(374, '(BB) HCV', 0, 'Parent Category', 100, 1),
(375, '(BB) HIV', 0, 'Parent Category', 230, 1),
(376, '(BB) BLOOD GROUP', 0, 'Parent Category', 80, 1),
(377, '(BB) MP ICT', 0, 'Parent Category', 100, 1),
(378, '(BB) VDRL', 0, 'Parent Category', 150, 1),
(379, '(BB) CROSS MATCH', 0, 'Parent Category', 50, 1);

-- --------------------------------------------------------

--
-- Table structure for table `unit_indent_invoice`
--

CREATE TABLE `unit_indent_invoice` (
  `id` int(11) NOT NULL,
  `receptNumber` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `InvDate` varchar(255) NOT NULL,
  `unit_incharge` int(11) NOT NULL,
  `issuing_authority` int(11) NOT NULL,
  `invoice_reciever` int(11) NOT NULL,
  `issue_from` int(11) NOT NULL,
  `indent_type` int(11) NOT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '1 for deleted',
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `unit_indent_invoice_detail`
--

CREATE TABLE `unit_indent_invoice_detail` (
  `id` int(11) NOT NULL,
  `inv_id` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `batch_no` varchar(20) NOT NULL,
  `expiry` date NOT NULL,
  `deliver_quantity` varchar(255) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `inv_date` date NOT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '1 for deleted'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `name` text NOT NULL,
  `l_name` text NOT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` text,
  `is_admin` int(11) NOT NULL DEFAULT '0' COMMENT '1 for admin',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '1 for deleted',
  `added_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `security_type` int(11) NOT NULL,
  `security_code` varchar(255) NOT NULL,
  `shift` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `name`, `l_name`, `mobile`, `password`, `email`, `is_admin`, `is_deleted`, `added_at`, `updated_at`, `security_type`, `security_code`, `shift`) VALUES
(1, 'admin', 'Cat: A', 'Hospital Batkhela', '0932410242', '0593ceec983b97dc99e2f2836b76ceb8', 'dhhqh_btk_mkd@hotmail.com', 1, 0, '2019-09-19 08:58:02', NULL, 0, '', NULL),
(3, 'casualtymorning', 'Casualty OPD Morning', 'OPD', '', '249a66323bd63581cb6f13bf3410be69', '', 0, 0, '2020-01-06 08:34:04', NULL, 0, '', 'Morning'),
(5, 'wardotmorning', 'Ward OT Morning', 'OT', '', 'f2aa0367905c66db10dd157a63822a80', '', 0, 0, '2019-10-23 18:16:42', NULL, 0, '', 'Morning'),
(6, 'femaleopd', 'Female OPD', 'OPD', '', '17e9b25733a6842ebb90b53408f2d5f2', '', 0, 0, '2019-10-31 15:39:13', NULL, 0, '', NULL),
(7, 'maleopd', 'Male OPD', 'OPD', '', '5bd637b25e915953c5ec6ee5fb689785', '', 0, 0, '2019-10-31 15:39:43', NULL, 0, '', 'Evening'),
(8, 'secondmaleopd', '2nd Male', 'OPD', '', '166e4c5779b5e38653c1dfdd78934b2c', '', 0, 0, '2019-11-01 13:59:37', NULL, 0, '', NULL),
(9, 'cardiology', 'Cardiology', '', '', '86483bfca823c1203603f2d3ddd84b4f', '', 0, 0, '2019-11-01 20:01:07', NULL, 0, '', NULL),
(10, 'ultrasound', 'Ultrasound', '', '', 'd86b731d61164cd284b16cdc6bdf63a8', '', 0, 0, '2019-11-01 21:21:09', NULL, 0, '', NULL),
(11, 'gyneopd', 'Gyne OPD', 'OPD', '', 'ac1466abfc31a7d52c9cb52c237a9d75', '', 0, 0, '2019-11-01 21:42:00', NULL, 0, '', NULL),
(12, 'labonemorning', 'Laboratory One Morning', '', '', 'ecbfbb8afdd207752c6b6ce5abf1e0da', '', 0, 0, '2019-11-04 18:55:54', NULL, 0, '', 'Morning'),
(13, 'pharmacist', 'pharmacy', 'pharmacy', '', 'fd3051577824ada21b3df777812c66fa', '', 0, 0, '2020-02-02 20:36:14', NULL, 0, '', NULL),
(14, 'laboneevening', 'Laboratory One Evening', '', '', '1f47567728801442261f43da7003f97b', '', 0, 0, '2023-01-15 07:30:06', '2023-01-15 07:30:06', 0, '', 'Evening'),
(15, 'labonenight', 'Laboratory One Night', '', '', '88db02794289b27a258ef95b0c41fe7d', '', 0, 0, '2023-01-15 07:31:14', '2023-01-15 07:31:14', 0, '', 'Night'),
(16, 'labtwomorning', 'Laboratory Two Morning', '', '', '0abc438f2d83593d55c84471403e5aca', '', 0, 0, '2023-01-15 07:35:57', '2023-01-15 07:35:57', 0, '', 'Morning'),
(17, 'labtwoevening', 'Laboratory Two Evening', '', '', '29832b58b336644dac999c148074da8d', '', 0, 0, '2023-01-15 07:36:45', '2023-01-15 07:36:45', 0, '', 'Evening'),
(18, 'labtwonight', 'Laboratory Two Night', '', '', '464f10a9ead1a72784c037f2d13950b6', '', 0, 0, '2023-01-15 07:37:59', '2023-01-15 07:37:59', 0, '', 'Night'),
(19, 'wardotevening', 'Ward OTs Evening', '', '', '27199469764379092e5fee837c32c7b9', '', 0, 0, '2023-01-15 09:31:35', '2023-01-15 09:31:35', 0, '', 'Evening'),
(20, 'wardotnight', 'Ward OTs Night', '', '', '8816d7998c501edd702ff26843cb504d', '', 0, 0, '2023-01-15 09:32:31', '2023-01-15 09:32:31', 0, '', 'Night'),
(21, 'casualtyevening', 'Casualty Evening', '', '', '7d0111a0d5a665b6ddd19333e7603fc3', '', 0, 0, '2023-01-15 10:02:27', '2023-01-15 10:02:27', 0, '', 'Evening'),
(22, 'casualtynight', 'Casualty Night', '', '', '42769fd2147e25bb381fd6245b78ae8a', '', 0, 0, '2023-01-15 10:02:51', '2023-01-15 10:02:51', 0, '', 'Night');

-- --------------------------------------------------------

--
-- Table structure for table `user_departments`
--

CREATE TABLE `user_departments` (
  `id` int(20) NOT NULL,
  `user_id` int(20) NOT NULL,
  `dept_id` int(20) NOT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '1 fro deleted'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_departments`
--

INSERT INTO `user_departments` (`id`, `user_id`, `dept_id`, `is_deleted`) VALUES
(21, 2, 3, 0),
(22, 2, 11, 0),
(23, 4, 8, 0),
(24, 4, 9, 0),
(25, 4, 13, 0),
(26, 4, 14, 0),
(31, 6, 59, 0),
(32, 7, 1, 0),
(50, 8, 60, 0),
(69, 9, 4, 0),
(70, 9, 5, 0),
(71, 9, 6, 0),
(72, 9, 7, 0),
(73, 10, 10, 0),
(74, 11, 2, 0),
(116, 13, 85, 0),
(177, 1, 1, 0),
(178, 1, 2, 0),
(179, 1, 3, 0),
(180, 1, 4, 0),
(181, 1, 5, 0),
(182, 1, 6, 0),
(183, 1, 7, 0),
(184, 1, 8, 0),
(185, 1, 9, 0),
(186, 1, 10, 0),
(187, 1, 11, 0),
(188, 1, 13, 0),
(189, 1, 14, 0),
(190, 1, 15, 0),
(191, 1, 16, 0),
(192, 1, 59, 0),
(193, 1, 60, 0),
(194, 1, 85, 0),
(195, 1, 96, 0),
(196, 1, 97, 0),
(197, 1, 98, 0),
(198, 1, 99, 0),
(199, 1, 100, 0),
(200, 12, 16, 0),
(201, 12, 96, 0),
(202, 14, 16, 0),
(203, 14, 96, 0),
(204, 15, 16, 0),
(205, 15, 96, 0),
(206, 16, 98, 0),
(207, 17, 98, 0),
(208, 18, 98, 0),
(209, 5, 4, 0),
(210, 5, 5, 0),
(211, 5, 6, 0),
(212, 5, 7, 0),
(213, 5, 8, 0),
(214, 5, 9, 0),
(215, 5, 13, 0),
(216, 5, 14, 0),
(217, 19, 4, 0),
(218, 19, 5, 0),
(219, 19, 6, 0),
(220, 19, 7, 0),
(221, 19, 8, 0),
(222, 19, 9, 0),
(223, 19, 13, 0),
(224, 19, 14, 0),
(225, 20, 4, 0),
(226, 20, 5, 0),
(227, 20, 6, 0),
(228, 20, 7, 0),
(229, 20, 8, 0),
(230, 20, 9, 0),
(231, 20, 13, 0),
(232, 20, 14, 0),
(233, 3, 3, 0),
(234, 21, 3, 0),
(235, 22, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `vendor_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xray_sizes`
--

CREATE TABLE `xray_sizes` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xray_size_inventory`
--

CREATE TABLE `xray_size_inventory` (
  `id` int(11) NOT NULL,
  `xray_size_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xray_type`
--

CREATE TABLE `xray_type` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xray_type`
--

INSERT INTO `xray_type` (`id`, `name`, `price`) VALUES
(1, 'Chest', '150'),
(2, 'Abdomen', '150'),
(3, 'skull ap/lat', '150'),
(4, 'Spine', '150'),
(5, 'Lower Limbs (150)', '150'),
(6, 'Upper Limbs (150)', '150'),
(7, 'C. SPINE ', '150'),
(8, 'Sinogram', '150'),
(9, 'MCUG', '150'),
(10, 'Manual', '35'),
(13, 'PNS', '150'),
(14, 'Naso + PNS', '150'),
(15, 'KUB ', '150'),
(17, 'Lumber SPINE', '150'),
(19, 'wrist joint', '150'),
(20, 'Ankle joint', '150'),
(21, 'foot', '150'),
(22, 'ForeArams', '150'),
(24, 'Shoulder', '150'),
(25, 'Erict Abdomen', '150'),
(26, 'pelvice', '150'),
(27, 'hip joint', '150'),
(28, 'nasal bone', '150'),
(29, 'DORSAL SPINE', '150'),
(30, 'ELBOW JOINT', '150'),
(31, 'HAND AP/LAT', '150'),
(32, 'BARIUM STUDY', '150'),
(33, 'IVU', '150'),
(34, 'nasopharynx lat', '150'),
(35, 'face', '150'),
(36, 'mandible', '150'),
(37, 'KNEE JOINT', '150'),
(38, 'Thigh ap/ lat', '150'),
(39, 'RUG', '150');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adjust_stock`
--
ALTER TABLE `adjust_stock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hospital_info`
--
ALTER TABLE `hospital_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `indent_sub_name`
--
ALTER TABLE `indent_sub_name`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_batch`
--
ALTER TABLE `item_batch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_indent_invoice`
--
ALTER TABLE `patient_indent_invoice`
  ADD PRIMARY KEY (`invoice_id`);

--
-- Indexes for table `patient_invoice_detail`
--
ALTER TABLE `patient_invoice_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier_invoice`
--
ALTER TABLE `supplier_invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier_invoice_detail`
--
ALTER TABLE `supplier_invoice_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testcategories`
--
ALTER TABLE `testcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unit_indent_invoice`
--
ALTER TABLE `unit_indent_invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unit_indent_invoice_detail`
--
ALTER TABLE `unit_indent_invoice_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_departments`
--
ALTER TABLE `user_departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xray_sizes`
--
ALTER TABLE `xray_sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xray_size_inventory`
--
ALTER TABLE `xray_size_inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xray_type`
--
ALTER TABLE `xray_type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adjust_stock`
--
ALTER TABLE `adjust_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT for table `hospital_info`
--
ALTER TABLE `hospital_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `indent_sub_name`
--
ALTER TABLE `indent_sub_name`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `item_batch`
--
ALTER TABLE `item_batch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `patient_indent_invoice`
--
ALTER TABLE `patient_indent_invoice`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `patient_invoice_detail`
--
ALTER TABLE `patient_invoice_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `supplier_invoice`
--
ALTER TABLE `supplier_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier_invoice_detail`
--
ALTER TABLE `supplier_invoice_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `testcategories`
--
ALTER TABLE `testcategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=380;

--
-- AUTO_INCREMENT for table `unit_indent_invoice`
--
ALTER TABLE `unit_indent_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `unit_indent_invoice_detail`
--
ALTER TABLE `unit_indent_invoice_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `user_departments`
--
ALTER TABLE `user_departments`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=236;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xray_sizes`
--
ALTER TABLE `xray_sizes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xray_size_inventory`
--
ALTER TABLE `xray_size_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xray_type`
--
ALTER TABLE `xray_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
