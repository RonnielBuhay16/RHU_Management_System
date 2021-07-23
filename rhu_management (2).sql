-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 23, 2021 at 01:49 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rhu_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `Account_ID` int(11) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Account_Type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`Account_ID`, `Username`, `Password`, `Account_Type`) VALUES
(1, 'admin', 'admin', 'admin'),
(21, 'ronniel.buhay', '25d55ad283aa400af464c76d713c07ad', 'User'),
(22, 'maribel.erna', '25d55ad283aa400af464c76d713c07ad', 'BHW'),
(23, 'alex.gheil', '25d55ad283aa400af464c76d713c07ad', 'User');

-- --------------------------------------------------------

--
-- Table structure for table `adult_disease`
--

CREATE TABLE `adult_disease` (
  `Adult_ID` int(11) NOT NULL,
  `Disease_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `adult_records`
--

CREATE TABLE `adult_records` (
  `Adult_ID` int(11) NOT NULL,
  `First_Name` varchar(255) NOT NULL,
  `Middle_Name` varchar(255) NOT NULL,
  `Last_Name` varchar(255) NOT NULL,
  `Barangay_ID` int(11) NOT NULL,
  `Gender` varchar(255) NOT NULL,
  `Birthday` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

CREATE TABLE `announcement` (
  `Announcement_ID` int(11) NOT NULL,
  `Message` varchar(255) NOT NULL,
  `Time` varchar(255) NOT NULL,
  `Date` date NOT NULL,
  `Barangay_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `barangay`
--

CREATE TABLE `barangay` (
  `Barangay_ID` int(11) NOT NULL,
  `Barangay_Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barangay`
--

INSERT INTO `barangay` (`Barangay_ID`, `Barangay_Name`) VALUES
(1, 'Acle'),
(2, 'Bayudbud'),
(3, 'Bolboc'),
(4, 'Burgos'),
(5, 'Dalima'),
(6, 'Dao'),
(7, 'Ginhawa'),
(8, 'Lumbangan'),
(9, 'Luna'),
(10, 'Luntal'),
(11, 'Magahis'),
(12, 'Malibu'),
(13, 'Mataywanac'),
(14, 'Palincaro'),
(15, 'Putol'),
(16, 'Rillo'),
(17, 'Rizal'),
(18, 'Sabang'),
(19, 'San Jose'),
(20, 'Talon'),
(21, 'Toong'),
(22, 'Tuyon-Tuyon');

-- --------------------------------------------------------

--
-- Table structure for table `bhw_staff`
--

CREATE TABLE `bhw_staff` (
  `Account_ID` int(11) NOT NULL,
  `First_Name` varchar(255) NOT NULL,
  `Middle_Name` varchar(255) NOT NULL,
  `Last_Name` varchar(255) NOT NULL,
  `Barangay_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bhw_staff`
--

INSERT INTO `bhw_staff` (`Account_ID`, `First_Name`, `Middle_Name`, `Last_Name`, `Barangay_ID`) VALUES
(22, 'Maribel', 'Cabadin', 'Erna', 11);

-- --------------------------------------------------------

--
-- Table structure for table `checkup`
--

CREATE TABLE `checkup` (
  `Checkup_ID` int(11) NOT NULL,
  `Account_ID` int(11) NOT NULL,
  `Purpose` varchar(255) NOT NULL,
  `Date` date NOT NULL,
  `Time` varchar(255) NOT NULL,
  `Status` varchar(255) NOT NULL,
  `SMS_Status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `child_info`
--

CREATE TABLE `child_info` (
  `Child_ID` int(11) NOT NULL,
  `Mother_ID` int(11) NOT NULL,
  `First_Name` varchar(255) NOT NULL,
  `Middle_Name` varchar(255) NOT NULL,
  `Last_Name` varchar(255) NOT NULL,
  `Gender` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `child_vaccines`
--

CREATE TABLE `child_vaccines` (
  `Vaccination_ID` int(11) NOT NULL,
  `Child_ID` int(11) NOT NULL,
  `Vaccine_ID` int(11) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `close_contact`
--

CREATE TABLE `close_contact` (
  `C_Record_ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `covid_cases`
--

CREATE TABLE `covid_cases` (
  `C_Record_ID` int(11) NOT NULL,
  `First_Name` varchar(255) NOT NULL,
  `Middle_Name` varchar(255) NOT NULL,
  `Last_Name` varchar(255) NOT NULL,
  `Barangay_ID` int(11) NOT NULL,
  `Gender` varchar(255) NOT NULL,
  `Age` int(11) NOT NULL,
  `Quarantine` tinyint(1) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `death_cases`
--

CREATE TABLE `death_cases` (
  `D_Record_ID` int(11) NOT NULL,
  `First_Name` varchar(255) NOT NULL,
  `Middle_Name` varchar(255) NOT NULL,
  `Last_Name` varchar(255) NOT NULL,
  `Barangay_ID` int(11) NOT NULL,
  `Gender` varchar(255) NOT NULL,
  `Age` int(11) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dengue_cases`
--

CREATE TABLE `dengue_cases` (
  `D_Record_ID` int(11) NOT NULL,
  `First_Name` varchar(255) NOT NULL,
  `Middle_Name` varchar(255) NOT NULL,
  `Last_Name` varchar(255) NOT NULL,
  `Barangay_ID` int(11) NOT NULL,
  `Gender` varchar(255) NOT NULL,
  `Age` int(11) NOT NULL,
  `InHospital` varchar(25) NOT NULL,
  `Date` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `disease`
--

CREATE TABLE `disease` (
  `Disease_ID` int(11) NOT NULL,
  `Disease_Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `household_records`
--

CREATE TABLE `household_records` (
  `H_Record_ID` int(11) NOT NULL,
  `Housenumber` int(11) NOT NULL,
  `Toilet_ID` int(11) NOT NULL,
  `Water_Source_ID` int(11) NOT NULL,
  `Use_Iodized` int(11) NOT NULL,
  `Barangay_ID` int(11) NOT NULL,
  `Date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mother_records`
--

CREATE TABLE `mother_records` (
  `Mother_ID` int(11) NOT NULL,
  `First_Name` varchar(255) NOT NULL,
  `Middle_Name` varchar(255) NOT NULL,
  `Last_Name` varchar(255) NOT NULL,
  `Barangay_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pregnacy_records`
--

CREATE TABLE `pregnacy_records` (
  `P_Record_ID` int(11) NOT NULL,
  `Mother_ID` int(11) NOT NULL,
  `Age` int(11) NOT NULL,
  `Pregnancy_Count` int(11) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rhu_staff`
--

CREATE TABLE `rhu_staff` (
  `Account_ID` int(11) NOT NULL,
  `First_Name` varchar(255) NOT NULL,
  `Middle_Name` varchar(255) NOT NULL,
  `Last_Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `senior_citizen_vaccine`
--

CREATE TABLE `senior_citizen_vaccine` (
  `Adult_ID` int(11) NOT NULL,
  `Vaccine_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_cases`
--

CREATE TABLE `tb_cases` (
  `TB_Record_ID` int(11) NOT NULL,
  `First_Name` varchar(255) NOT NULL,
  `Middle_Name` varchar(255) NOT NULL,
  `Last_Name` varchar(255) NOT NULL,
  `Barangay_ID` int(11) NOT NULL,
  `Gender` varchar(255) NOT NULL,
  `Age` int(11) NOT NULL,
  `Dots` varchar(10) NOT NULL,
  `Date` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `toilet`
--

CREATE TABLE `toilet` (
  `Toilet_ID` int(11) NOT NULL,
  `Toilet_Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vaccine`
--

CREATE TABLE `vaccine` (
  `Vaccine_ID` int(11) NOT NULL,
  `Vaccine_Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vaccine_stock`
--

CREATE TABLE `vaccine_stock` (
  `Vaccine_ID` int(11) NOT NULL,
  `Batch` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Expiry_Date` date NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `water_souce`
--

CREATE TABLE `water_souce` (
  `Water_Source_ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`Account_ID`);

--
-- Indexes for table `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`Announcement_ID`);

--
-- Indexes for table `barangay`
--
ALTER TABLE `barangay`
  ADD PRIMARY KEY (`Barangay_ID`);

--
-- Indexes for table `child_info`
--
ALTER TABLE `child_info`
  ADD PRIMARY KEY (`Child_ID`);

--
-- Indexes for table `dengue_cases`
--
ALTER TABLE `dengue_cases`
  ADD PRIMARY KEY (`D_Record_ID`);

--
-- Indexes for table `mother_records`
--
ALTER TABLE `mother_records`
  ADD PRIMARY KEY (`Mother_ID`);

--
-- Indexes for table `tb_cases`
--
ALTER TABLE `tb_cases`
  ADD PRIMARY KEY (`TB_Record_ID`);

--
-- Indexes for table `toilet`
--
ALTER TABLE `toilet`
  ADD PRIMARY KEY (`Toilet_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `Account_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `barangay`
--
ALTER TABLE `barangay`
  MODIFY `Barangay_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
