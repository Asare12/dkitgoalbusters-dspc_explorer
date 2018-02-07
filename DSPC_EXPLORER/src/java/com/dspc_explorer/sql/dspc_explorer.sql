-- phpMyAdmin SQL Dump
-- version 4.6.6deb1+deb.cihar.com~trusty.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 07, 2018 at 09:00 PM
-- Server version: 5.5.54-0ubuntu0.14.04.1
-- PHP Version: 7.1.4-1+deb.sury.org~trusty+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dspc_explorer`
--
CREATE DATABASE IF NOT EXISTS `dspc_explorer` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `dspc_explorer`;

-- --------------------------------------------------------

--
-- Table structure for table `graveowner`
--

DROP TABLE IF EXISTS `graveowner`;
CREATE TABLE IF NOT EXISTS `graveowner` (
  `grave_id` int(11) NOT NULL,
  `grave_ref_code` varchar(50) DEFAULT NULL,
  `grave_owner_name` varchar(100) DEFAULT NULL,
  `grave_owner_address` varchar(150) DEFAULT NULL,
  `graveopen_date` date DEFAULT NULL,
  `grave_row` int(11) NOT NULL,
  `grave_depth` int(11) NOT NULL,
  `grave_location` varchar(100) DEFAULT NULL,
  `grave_image` longblob,
  `sectionId` int(11) NOT NULL,
  PRIMARY KEY (`grave_id`),
  KEY `sec_con` (`sectionId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `registrar`
--

DROP TABLE IF EXISTS `registrar`;
CREATE TABLE IF NOT EXISTS `registrar` (
  `reg_id` int(11) NOT NULL,
  `reg_first_name` varchar(100) DEFAULT NULL,
  `reg_middle_name` varchar(100) DEFAULT NULL,
  `reg_last_name` varchar(100) NOT NULL,
  `reg_sex` varchar(100) DEFAULT NULL,
  `reg_age` varchar(100) DEFAULT NULL,
  `reg_religion` varchar(100) DEFAULT NULL,
  `reg_occupation` varchar(100) DEFAULT NULL,
  `reg_death_location` varchar(100) DEFAULT NULL,
  `reg_marriage_status` varchar(100) DEFAULT NULL,
  `regdeath_date` date DEFAULT NULL,
  `regburial_date` date DEFAULT NULL,
  `graveId` int(11) NOT NULL,
  PRIMARY KEY (`reg_id`),
  KEY `gvn_con` (`graveId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
CREATE TABLE IF NOT EXISTS `section` (
  `sectionId` int(11) NOT NULL AUTO_INCREMENT,
  `sectionCode` varchar(50) DEFAULT NULL,
  `dateOpened` date DEFAULT NULL,
  `graveCount` int(11) NOT NULL,
  PRIMARY KEY (`sectionId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userType` int(11) NOT NULL DEFAULT '0',
  `userName` varchar(100) DEFAULT NULL,
  `userPassword` varchar(100) DEFAULT NULL,
  `passwordSalt` varchar(100) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobilePhone` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `graveowner`
--
ALTER TABLE `graveowner`
  ADD CONSTRAINT `sec_con` FOREIGN KEY (`sectionId`) REFERENCES `section` (`sectionId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `registrar`
--
ALTER TABLE `registrar`
  ADD CONSTRAINT `gvn_con` FOREIGN KEY (`graveId`) REFERENCES `graveowner` (`grave_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
