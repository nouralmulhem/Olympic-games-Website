-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 10, 2022 at 11:00 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `olympics`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `allmatches` (IN `id` INT)  BEGIN
SELECT * FROM MATCHE WHERE matche.Msport_ID=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getallsponsor` (IN `username1` VARCHAR(20))  BEGIN
 SELECT * FROM sponsor WHERE username =username1;
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getath` (IN `myid` INT)  BEGIN
SELECT * FROM athlete WHERE A_ID =myid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getusers` (IN `username22` VARCHAR(20))  BEGIN
SELECT * FROM users WHERE user_name= username22;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `matchid` (IN `NAME` VARCHAR(20))  BEGIN
SELECT M_ID FROM Matche WHERE Matche.M_Name=NAME;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `selectname` (IN `MID` INT)  BEGIN
SELECT Fname, Minit, Lname , A_ID FROM athlete,participation WHERE participation.MatchID=MID AND participation.AthleteID=athlete.A_ID;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `athlete`
--

CREATE TABLE `athlete` (
  `A_ID` int(11) NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Minit` char(1) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `Gender` enum('F','M') DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Country` varchar(20) DEFAULT NULL,
  `Weight` int(11) DEFAULT NULL,
  `Rank` int(11) NOT NULL DEFAULT 0,
  `Warnings` int(11) NOT NULL DEFAULT 0,
  `ClubID` int(11) DEFAULT NULL,
  `Strt_Date` date DEFAULT NULL,
  `SportID` int(11) DEFAULT NULL,
  `Athlete_Sponsor` varchar(20) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `athlete`
--

INSERT INTO `athlete` (`A_ID`, `Fname`, `Minit`, `Lname`, `Gender`, `Age`, `Country`, `Weight`, `Rank`, `Warnings`, `ClubID`, `Strt_Date`, `SportID`, `Athlete_Sponsor`, `username`) VALUES
(1, 'Ali', 'M', 'Taher', 'M', 33, 'Egypt', 80, 10, 1, 1, '2015-03-19', 19, NULL, 'Ali_Taher015'),
(2, 'Ali', 'A', 'Gamal', 'M', 24, 'Iraq', 79, 0, 0, 17, '2021-05-06', 9, NULL, 'Ali_Gamal'),
(3, 'Omar', 'G', 'Maher', 'M', 20, 'France', 77, 0, 0, 7, '2013-06-19', 3, NULL, 'Omar_Maher'),
(4, 'Maya', 'P', 'Haytham', 'F', 14, 'Egypt', 75, 0, 0, 10, '2015-11-04', 1, NULL, 'Maya_Haytham'),
(5, 'Alya', 'M', 'Mohamed', 'F', 12, 'Germany', 45, 0, 0, 6, '2017-07-04', 8, 'Visa', 'Alya_Mohamed'),
(6, 'Peter', 'A', 'Johon', 'M', 30, 'England', 85, 0, 0, 18, '2016-06-14', 9, 'Bridgestone', 'Peter_Johon'),
(7, 'Gamela', 'M', 'Nour', 'F', 18, 'Portugal', 65, 20, 1, 19, '2018-06-14', 19, 'Asics', 'Gamela_Nour'),
(8, 'Khaled', 'M', 'Aboud', 'M', 23, 'Lebnan', 90, 12, 1, 4, '2018-02-13', 19, NULL, 'Khaled_Aboud'),
(9, 'William', 'N', 'Peter', 'M', 24, 'Germany', 69, 3, 0, 17, '2010-07-21', 19, 'P_and_G', 'William_Peter'),
(10, 'Sarah', 'P', 'Ahmed', 'F', 23, 'Iraq', 65, 0, 0, 9, '2018-01-02', 7, 'Allianz', 'Sarah_Ahmed'),
(11, 'Zaki', 'N', 'Haitham', 'M', 27, 'Egypt', 77, 0, 0, 1, '2018-01-31', 7, NULL, 'Zaki_Haitham'),
(12, 'Khaled', 'P', 'Morsy', 'M', 25, 'lebnan', 68, 0, 0, 10, '2017-02-07', 12, 'Panasonic', 'Khaled_Morsy'),
(13, 'Mohamed', 'A', 'Khan', 'M', 32, 'India', 56, 0, 0, 17, '2016-03-03', 13, 'Atos', 'Mohamed_Khan'),
(14, 'Jessica', 'P', 'Thomas', 'F', 25, 'England', 65, 0, 0, 10, '2018-02-22', 18, NULL, 'Jessica_Thomas'),
(15, 'Maher', 'B', 'Ali', 'M', 29, 'Iraq', 76, 0, 0, 19, '2015-03-12', 14, 'Aggreko', 'Maher_Ali'),
(16, 'Aya', 'M', 'Amir', 'F', 21, 'Egypt', 65, 0, 0, 7, '2014-06-20', 9, NULL, 'Aya_Amir'),
(17, 'Bader', 'B', 'Karam', 'M', 24, 'Iraq', 68, 0, 0, 12, '2014-03-21', 11, NULL, 'Bader_Karam'),
(18, 'Mark', 'M', 'Charles', 'M', 22, 'France', 85, 0, 0, 13, '2014-06-21', 8, 'Ajinomoto', 'Mark_Charles'),
(19, 'David', 'C', 'Mark', 'M', 87, 'England', 65, 0, 0, 15, '2013-03-15', 12, 'Airbnb', 'David_Mark'),
(20, 'Christopher', 'C', 'David', 'M', 26, 'France', 76, 0, 0, 12, '2014-02-13', 3, 'P_and_G', 'Christopher_David'),
(21, 'Goda', 'G', 'Galal', 'M', 30, 'Egyptian', 59, 0, 0, 8, '2022-01-06', 18, NULL, 'Goda_Galal');

-- --------------------------------------------------------

--
-- Table structure for table `audience`
--

CREATE TABLE `audience` (
  `SSN` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Gender` enum('F','M') DEFAULT NULL,
  `Covid19_Test` tinyint(1) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `audience`
--

INSERT INTO `audience` (`SSN`, `Name`, `Gender`, `Covid19_Test`, `username`) VALUES
(12345, 'Basma Hatem', 'F', 0, 'Basma_Hatem'),
(12456, 'Zaki Khaled', 'M', 0, 'Zaki_Khaled'),
(13579, 'Farid Osman', 'M', 0, 'Farid_Osman'),
(23456, 'Gamal ElSayed', 'M', 0, 'Gamal_ElSayed'),
(24680, 'Ahmed Mohab', 'M', 0, 'Ahmed_Mohab'),
(25678, 'Khaled Hossam', 'M', 0, 'Khaled_Hossam'),
(32150, 'Gamela Ibrahim', 'F', 0, 'Gamela_Ibrahim'),
(34567, 'Jaseca Jhon', 'F', 0, 'Jaseca_Jhon'),
(45678, 'Omar Ali', 'M', 0, 'Omar_Ali01'),
(56341, 'Sarah Mohamed', 'F', 0, 'Sarah_Mohamed'),
(56932, 'Eman Mageed', 'F', 0, 'Eman_Mageed'),
(67890, 'Maya Kareem', 'F', 0, 'Maya_Kareem'),
(78012, 'Habiba Wahba', 'F', 0, 'Habiba_Wahba'),
(79042, 'Youssef Gamel', 'M', 0, 'Youssef_Gamel'),
(98702, 'Taher Mahmoud', 'M', 0, 'Taher_Mahmoud');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `City_Name` varchar(20) NOT NULL,
  `Near_Airport` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`City_Name`, `Near_Airport`) VALUES
('Athens', 'Athens International Airport'),
('Baku', 'Heydar Aliyev International Airport'),
('Barcelona', 'Barcelona International Airport'),
('Berlin', 'Berlin Brandenburg Airport'),
('Budapest', 'Budapest Airport'),
('Cardiff', 'Cardiff (CWL) Airport '),
('Dortmund', ' Dortmund (DTM) Airport'),
('Dublin', 'Dublin Airport'),
('Edinburgh', 'Edinburgh Airport'),
('Istanbul', 'Istanbul Ataturk Airport'),
('Kyiv', 'Kyiv International Airport (Sikorsky)'),
('London', 'London City Airport'),
('Madrid', 'Madrid–Barajas Airport'),
('Manchester', 'Manchester Airport'),
('Marseille', 'Marseille Provence Airport'),
('Milan', 'Milan Malpensa International Airport'),
('Moscow', 'Vnukovo International Airport'),
('Munich', 'Munich International Airport'),
('Rome', 'Rome Ciampino Airport'),
('Saint_Denis', 'Paris Charles de Gaulle Airport');

-- --------------------------------------------------------

--
-- Table structure for table `club`
--

CREATE TABLE `club` (
  `Club_ID` int(11) NOT NULL,
  `Club_Name` varchar(20) NOT NULL,
  `Location` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `club`
--

INSERT INTO `club` (`Club_ID`, `Club_Name`, `Location`) VALUES
(1, 'Al Ahly', 'Cairo-Egypt'),
(2, 'Zamalek SC', 'Cairo-Egypt'),
(3, 'Pyramids FC', 'Cairo-Egypt'),
(4, 'Ismaily SC', 'Ismailia-Egypt'),
(5, 'Al Ittihad Al Sakand', 'Alexandria-Egypt'),
(6, 'Bremen', 'Bremen-Germany'),
(7, 'Munich', 'Munich-Germany'),
(8, 'Dachau', 'Dachau-Germany'),
(9, 'Chelsea F.C.', 'Chelsea-UK'),
(10, 'Liverpool F.C.', 'Liverpool-UK'),
(11, 'Tottenham', 'Tottenham-UK'),
(12, 'Newcastle United F.C', ' Newcastle-UK'),
(13, 'Real Madrid CF', 'Madrid-Spain'),
(14, 'FC Barcelona', 'Barcelona-Spain'),
(15, 'Sevilla FC', 'Seville-Spain'),
(16, ' FC Bayern München', 'Munich-Germany'),
(17, 'Real Zaragoza', 'Zaragoza-Spain'),
(18, 'Benfica', 'lisbon-Portugal'),
(19, ' Paris Saint-Germain', 'Paris-France'),
(20, 'S.C. Braga', 'Braga-Portugal');

-- --------------------------------------------------------

--
-- Table structure for table `coach`
--

CREATE TABLE `coach` (
  `Coach_ID` int(11) NOT NULL,
  `Coach_Name` varchar(20) NOT NULL,
  `Gender` enum('F','M') DEFAULT NULL,
  `Clu_ID` int(11) DEFAULT NULL,
  `Strt_Date` date DEFAULT NULL,
  `SPORTID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `coach`
--

INSERT INTO `coach` (`Coach_ID`, `Coach_Name`, `Gender`, `Clu_ID`, `Strt_Date`, `SPORTID`) VALUES
(1, 'Ali Ahmed', 'M', 1, '2021-06-30', 19),
(2, 'Youssef Elhoseny', 'M', 2, '2017-07-27', 19),
(3, 'Abd ElRahman Ali', 'M', 4, '2022-01-03', 19),
(4, 'Donia Moahmed', 'F', 15, '2016-10-11', 19),
(5, 'Feryal Gamal', 'F', 5, '2021-12-05', 17),
(6, 'Hanaa Moahmed', 'F', 8, '2017-06-13', 17),
(7, 'Rana Gamel', 'F', 14, '2018-10-16', 17),
(8, 'Amr Moahmed', 'M', 10, '2018-06-12', 16),
(9, 'Mohamed Ali', 'M', 6, '2017-10-24', 16),
(10, 'Saeed Mohamed', 'M', 7, '2017-10-17', 16),
(11, 'Mahmoud El Sayed', 'M', 1, '2017-10-19', 16),
(12, 'Aya Hatem', 'F', 4, '2014-11-12', 1),
(13, 'Nesma Mohamed', 'F', 4, '2012-10-16', 1),
(14, 'Eman Hassan', 'F', 3, '2019-09-17', 7),
(15, 'Nada Hossam', 'F', 3, '2018-06-14', 7),
(16, 'Salah Ahmed', 'M', 20, '2018-06-13', 13),
(17, 'Badr Karam', 'M', 7, '2021-10-21', 13),
(18, 'Hossam Ashour', 'M', 9, '2017-06-14', 13),
(19, 'Shrouk Ashraf', 'M', 9, '2010-05-13', 14),
(20, 'Mohab Osman', 'M', 9, '2021-09-17', 14),
(21, 'Khaled Ali', 'M', 14, '2021-12-28', 12);

-- --------------------------------------------------------

--
-- Table structure for table `matche`
--

CREATE TABLE `matche` (
  `M_ID` int(11) NOT NULL,
  `M_Name` varchar(20) NOT NULL,
  `DateDay` date DEFAULT NULL,
  `S_Time` time DEFAULT NULL,
  `E_Time` time DEFAULT NULL,
  `Venue_N` varchar(20) DEFAULT NULL,
  `Msport_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `matche`
--

INSERT INTO `matche` (`M_ID`, `M_Name`, `DateDay`, `S_Time`, `E_Time`, `Venue_N`, `Msport_ID`) VALUES
(1, 'Archery 1', '2022-03-02', '10:19:00', '23:25:00', '	Camp_Nou', 19),
(2, 'Archery 2', '2022-02-09', '11:19:00', '13:26:00', '	Croke_Park', 19),
(3, 'Archery 3', '2022-02-18', '14:20:00', '15:26:00', 'Metropolitano_Stadiu', 19),
(4, 'Archery 4', '2022-01-29', '21:25:00', '23:26:00', 'Allianz_Arena', 19),
(5, 'Archery 5', '2022-02-01', '13:22:00', '15:00:00', 'Old_Trafford', 19),
(6, 'Badminton quarter', '2022-01-26', '21:25:00', '23:24:00', 'Murrayfield_Stadium', 17),
(7, 'Badminton Semi Final', '2022-02-23', '13:24:00', '15:24:00', 'Murrayfield_Stadium', 17),
(8, 'Badminton Final', '2022-03-01', '21:25:00', '23:25:00', 'Murrayfield_Stadium', 17),
(9, 'Bmx Racing 16 ', '2022-01-18', '12:26:00', '13:26:00', 'Signal_Iduna_Park', 16),
(10, 'Bmx Racing Quarter', '2022-01-20', '13:57:00', '15:57:00', 'Athens_Olympic_Stadi', 16),
(11, 'Bmx Racing Semi Fina', '2022-01-23', '21:57:00', '22:58:00', 'Signal_Iduna_Park', 16),
(12, 'Boxing 1', '2022-01-13', '13:59:00', '15:59:00', 'Olympiastadion', 1),
(13, 'Boxing 2', '2022-01-17', '23:59:00', '13:03:00', 'Ataturk_Olympic_Stad', 1),
(14, 'Diving 1', '2022-01-19', '13:00:00', '15:00:00', 'Athens_Olympic_Stadi', 7),
(15, 'Diving 2', '2022-01-27', '14:04:00', '15:00:00', 'Old_Trafford', 7),
(16, 'Equestrian 1', '2022-01-11', '12:01:00', '15:01:00', 'Ataturk_Olympic_Stad', 13),
(17, 'Equestrian 2', '2022-01-14', '11:02:00', '14:02:00', 'NSC_Olimpiyskiy', 13),
(18, 'Fencing 1', '2022-01-21', '13:02:00', '15:02:00', 'Stadio_Giuseppe', 14),
(19, 'Fencing 2', '2022-01-17', '15:11:00', '17:10:00', 'Murrayfield_Stadium', 14),
(20, 'Football1', '2022-01-26', '15:12:00', '19:12:00', 'Twickenham_Stadium', 12),
(21, 'Football 2', '2022-01-30', '21:14:00', '23:15:00', 'Metropolitano_Stadiu', 12),
(22, 'Match Semi Final', '2022-02-01', '20:32:00', '22:32:00', 'Millennium_Stadium', 12),
(23, 'Football Final', '2022-02-10', '17:33:00', '18:35:00', 'Old_Trafford', 12),
(24, 'Hockey 1', '2022-01-14', '21:39:00', '23:39:00', 'Athens_Olympic_Stadi', 18),
(25, 'Hockey 2', '2022-01-22', '14:45:00', '16:45:00', 'Baku_Olympic_Stadium', 18),
(26, 'Judo 1', '2022-01-29', '14:45:00', '16:45:00', 'Baku_Olympic_Stadium', 3),
(27, 'Judo 2', '2022-01-31', '22:51:00', '12:46:00', 'Millennium_Stadium', 3),
(28, 'Karate 1', '2022-01-21', '13:46:00', '15:46:00', 'Baku_Olympic_Stadium', 2),
(29, 'Karate 2', '2022-01-14', '14:55:00', '16:00:00', 'Signal_Iduna_Park', 2),
(30, 'Rhythmic 1', '2022-01-14', '14:55:00', '19:56:00', 'Ataturk_Olympic_Stad', 4),
(31, 'Rhythmic 2', '2022-01-28', '15:56:00', '16:56:00', 'NSC_Olimpiyskiy', 4),
(32, 'Sailing 1', '2022-01-13', '14:57:00', '16:57:00', 'Metropolitano_Stadiu', 20),
(33, 'Swimming 50 m', '2022-01-14', '14:58:00', '16:58:00', 'Stade_Velodrome', 8),
(34, 'Swimming 100m', '2022-01-19', '14:58:00', '16:02:00', 'Millennium_Stadium', 8),
(35, 'Shooting 1', '2022-01-14', '11:31:00', '13:00:00', 'Baku_Olympic_Stadium', 9),
(36, 'trial', '2022-01-07', '16:55:00', '19:54:00', 'Old_Trafford', 17);

-- --------------------------------------------------------

--
-- Table structure for table `medal`
--

CREATE TABLE `medal` (
  `Sport_Id` int(11) NOT NULL,
  `Type` enum('Gold','Silver','Bronze') NOT NULL,
  `Winner_ID` int(11) DEFAULT NULL,
  `Winning_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `medal`
--

INSERT INTO `medal` (`Sport_Id`, `Type`, `Winner_ID`, `Winning_Date`) VALUES
(1, 'Gold', NULL, NULL),
(1, 'Silver', NULL, NULL),
(1, 'Bronze', NULL, NULL),
(2, 'Gold', NULL, NULL),
(2, 'Silver', NULL, NULL),
(2, 'Bronze', NULL, NULL),
(3, 'Gold', NULL, NULL),
(3, 'Silver', NULL, NULL),
(3, 'Bronze', NULL, NULL),
(4, 'Gold', NULL, NULL),
(4, 'Silver', NULL, NULL),
(4, 'Bronze', NULL, NULL),
(5, 'Gold', NULL, NULL),
(5, 'Silver', NULL, NULL),
(5, 'Bronze', NULL, NULL),
(6, 'Gold', NULL, NULL),
(6, 'Silver', NULL, NULL),
(6, 'Bronze', NULL, NULL),
(7, 'Gold', NULL, NULL),
(7, 'Silver', NULL, NULL),
(7, 'Bronze', NULL, NULL),
(8, 'Gold', NULL, NULL),
(8, 'Silver', NULL, NULL),
(8, 'Bronze', NULL, NULL),
(9, 'Gold', NULL, NULL),
(9, 'Silver', NULL, NULL),
(9, 'Bronze', NULL, NULL),
(10, 'Gold', NULL, NULL),
(10, 'Silver', NULL, NULL),
(10, 'Bronze', NULL, NULL),
(11, 'Gold', NULL, NULL),
(11, 'Silver', NULL, NULL),
(11, 'Bronze', NULL, NULL),
(12, 'Gold', NULL, NULL),
(12, 'Silver', NULL, NULL),
(12, 'Bronze', NULL, NULL),
(13, 'Gold', NULL, NULL),
(13, 'Silver', NULL, NULL),
(13, 'Bronze', NULL, NULL),
(14, 'Gold', NULL, NULL),
(14, 'Silver', NULL, NULL),
(14, 'Bronze', NULL, NULL),
(15, 'Gold', NULL, NULL),
(15, 'Silver', NULL, NULL),
(15, 'Bronze', NULL, NULL),
(16, 'Gold', NULL, NULL),
(16, 'Silver', NULL, NULL),
(16, 'Bronze', NULL, NULL),
(17, 'Gold', NULL, NULL),
(17, 'Silver', NULL, NULL),
(17, 'Bronze', NULL, NULL),
(18, 'Gold', NULL, NULL),
(18, 'Silver', NULL, NULL),
(18, 'Bronze', NULL, NULL),
(19, 'Gold', NULL, NULL),
(19, 'Silver', NULL, NULL),
(19, 'Bronze', NULL, NULL),
(20, 'Gold', NULL, NULL),
(20, 'Silver', NULL, NULL),
(20, 'Bronze', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `participation`
--

CREATE TABLE `participation` (
  `AthleteID` int(11) NOT NULL,
  `MatchID` int(11) NOT NULL,
  `results` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `participation`
--

INSERT INTO `participation` (`AthleteID`, `MatchID`, `results`) VALUES
(1, 1, 0),
(1, 3, 0),
(1, 4, 0),
(2, 35, 0),
(5, 33, 0),
(5, 34, 0),
(7, 1, 0),
(7, 2, 0),
(7, 3, 0),
(8, 1, 0),
(9, 1, 0),
(9, 2, 0),
(9, 4, 0),
(10, 14, 0),
(10, 15, 0),
(11, 14, 0),
(11, 15, 0),
(14, 24, 0),
(14, 25, 0),
(18, 33, 0),
(18, 34, 0),
(21, 24, 0),
(21, 25, 0);

-- --------------------------------------------------------

--
-- Table structure for table `price`
--

CREATE TABLE `price` (
  `Type` varchar(20) NOT NULL,
  `Price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `price`
--

INSERT INTO `price` (`Type`, `Price`) VALUES
('Economic', 400),
('Premier', 600),
('VIP', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `referee`
--

CREATE TABLE `referee` (
  `Referee_ID` int(11) NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Minit` char(1) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `Gender` enum('F','M') NOT NULL,
  `Nationality` varchar(20) NOT NULL,
  `Rate` int(11) DEFAULT 0,
  `Sp_ID` int(11) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `referee`
--

INSERT INTO `referee` (`Referee_ID`, `Fname`, `Minit`, `Lname`, `Gender`, `Nationality`, `Rate`, `Sp_ID`, `username`) VALUES
(1, 'Kassem', 'B', 'Ali', 'M', 'Egyptian', 0, 3, 'Kassem _Ali'),
(2, 'Maher', 'B', 'Bader', 'M', 'Egyptian', 0, 4, 'Maher_Bader'),
(3, 'Peter', 'S', 'John', 'M', 'English', 0, 3, 'Peter_John'),
(4, 'Mariam', 'M', 'Amir', 'F', 'Egyptian', 2, 19, 'Mariam_Amir'),
(5, 'Oneho', 'G', 'Chi', 'M', 'Chainies', 0, 13, 'Oneho_Chi'),
(6, 'Khaled', 'P', 'Khan', 'M', 'indian', 0, 3, 'Khaled_Khan'),
(7, 'Ola', 'I', 'Hassan', 'F', 'spanish', 0, 4, 'Ola_Hassan'),
(8, 'Kara', 'F', 'John', 'F', 'English', 0, 4, 'Kara_John'),
(9, 'Clara', 'H', 'Peter', 'F', 'spanish', 0, 3, 'Clara_Peter'),
(10, 'Ali', 'M', 'Ahmed', 'M', 'Egyptian', 0, 13, 'Ali_Ahmed'),
(11, 'Morsy', 'N', 'Nader', 'M', 'Polish', 0, 1, 'Morsy_Nader'),
(12, 'Messi', 'K', 'Peter', 'M', 'spanish', 0, 13, 'Messi_Peter'),
(13, 'Khaled', 'P', 'Ahmed', 'M', 'Egyptian', 0, 19, 'Khaled_Ahmed'),
(14, 'Emilly', 'G', 'Thomas', 'F', 'English', 0, 1, 'Emilly_Thomas'),
(15, 'David', 'C', 'Charles', 'M', 'English', 0, 16, 'David_Charles'),
(16, 'Zaki', 'N', 'Nahed', 'M', 'Lebanese', 0, 9, 'Zaki_Nahed'),
(17, 'Sarah', 'P', 'Thomas', 'F', 'English', 0, 14, 'Sarah_Thomas'),
(18, 'Christopher', 'C', 'Charles', 'M', 'Italian', 0, 6, 'Christopher_Charles'),
(19, 'Zaki', 'N', 'Mohamed', 'M', 'Egyptian', 0, 8, 'Zaki_Mohamed'),
(20, 'Sarah', 'P', 'Ali', 'F', 'Egyptian', 0, 11, 'Sarah_Ali'),
(21, 'Ali', 'I', 'Elsayed', 'M', 'Egyptian', 0, 7, 'Ali_Elsead'),
(22, 'Elsyaed', 'I', 'Ali', 'M', 'Egyptian', 0, 18, 'Elsayed_Ali01');

-- --------------------------------------------------------

--
-- Table structure for table `referee_matches`
--

CREATE TABLE `referee_matches` (
  `RefereeID` int(11) NOT NULL,
  `MatchID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `referee_matches`
--

INSERT INTO `referee_matches` (`RefereeID`, `MatchID`) VALUES
(1, 26),
(1, 27),
(4, 1),
(4, 3),
(4, 4),
(6, 26),
(13, 2),
(13, 4),
(13, 5),
(16, 35),
(19, 33),
(19, 34),
(21, 14),
(21, 15),
(22, 24),
(22, 25);

-- --------------------------------------------------------

--
-- Table structure for table `sponsor`
--

CREATE TABLE `sponsor` (
  `Company` varchar(20) NOT NULL,
  `Product` varchar(40) DEFAULT NULL,
  `Nationality` varchar(20) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sponsor`
--

INSERT INTO `sponsor` (`Company`, `Product`, `Nationality`, `username`) VALUES
('Aggreko', 'Air Conditioners', 'the Netherlands', 'Aggreko'),
('Airbnb', 'Online Marketplace', 'American', 'Airbnb'),
('Ajinomoto', 'artificial turf', 'American', 'Ajinomoto'),
('Alibaba', 'E-commerce', 'Chinese', 'Alibaba_Ecommerce'),
('Allianz', 'Insurance', 'German', 'Allianz'),
('Asics', 'Food', 'Japanese', 'Asics01'),
('Atos', 'Multinational information technology (IT', 'French', 'Atos'),
('Bridgestone', 'Auto and Truck parts manufacturer', 'Japanese', 'Bridgestone'),
('Coca_Cola', 'Soda Drink', 'United States', 'Coca_Cola'),
('Dow', 'Chemical Products', 'American', 'Dow'),
('Intel', 'Microprocessors Integrated graphics', 'American', 'Intel_0'),
('Mengniu', 'Dairy', 'Chinese', 'Mengniu'),
('Nissin_Foods', 'Food', 'Japanese', 'Nissin_Foods'),
('Omega', 'Watches', 'Swiss', 'Omega001'),
('Panasonic', 'Elctronic Device', 'Japanese', 'Panasonic'),
('P_and_G', 'Household brands, Health, Beauty', 'American', 'P_and_G'),
('RR', 'WER', 'ERT', 'aaab'),
('Samsung', 'Electronic Devices', 'South Korean', 'Samsung'),
('Toyota', 'Cars', 'Japan', 'Toyota'),
('TVNZ', 'Television Network', 'New Zealand', 'TVNZ'),
('Visa', 'e-commerce', 'United Kingdom (UK)', 'Visa');

-- --------------------------------------------------------

--
-- Table structure for table `sport`
--

CREATE TABLE `sport` (
  `Sport_ID` int(11) NOT NULL,
  `Sport_Name` varchar(20) NOT NULL,
  `Season` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sport`
--

INSERT INTO `sport` (`Sport_ID`, `Sport_Name`, `Season`) VALUES
(1, 'Boxing', 'Summer'),
(2, 'Karate', 'Summer'),
(3, 'Judo', 'Winter'),
(4, 'Rhythmic Gymnastics', 'Summer'),
(5, 'Weightlifting', 'Summer'),
(6, 'Tennis', 'Summer'),
(7, 'Diving', 'Summer'),
(8, 'Swimming', 'Summer'),
(9, 'Shooting', 'Winter'),
(10, 'Volleyball', 'Winter'),
(11, 'Water Polo', 'Summer'),
(12, 'Football', 'Summer'),
(13, 'Equestrian', 'Summer'),
(14, 'Fencing', 'Winter'),
(15, 'Wrestling', 'Summer'),
(16, 'Bmx Racing', 'Summer'),
(17, 'Badminton', 'Winter'),
(18, 'Hockey', 'Summer'),
(19, 'Archery', 'Winter'),
(20, 'Sailing', 'Summer');

-- --------------------------------------------------------

--
-- Table structure for table `sports_sponsors`
--

CREATE TABLE `sports_sponsors` (
  `Sport_Id` int(11) NOT NULL,
  `company` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sports_sponsors`
--

INSERT INTO `sports_sponsors` (`Sport_Id`, `company`) VALUES
(3, 'Mengniu'),
(4, 'Aggreko'),
(4, 'Samsung'),
(7, 'Coca_Cola'),
(10, 'Airbnb'),
(11, 'Toyota'),
(12, 'Intel'),
(16, 'Omega');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `ID` int(11) NOT NULL,
  `Type` varchar(20) DEFAULT NULL,
  `Seat_Number` int(11) DEFAULT NULL,
  `Audience_SSN` int(11) DEFAULT NULL,
  `Booking_Date` date DEFAULT NULL,
  `M_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`ID`, `Type`, `Seat_Number`, `Audience_SSN`, `Booking_Date`, `M_ID`) VALUES
(1, 'VIP', 17, 12345, '2022-01-06', 12),
(2, 'VIP', 16, 12345, '2022-01-06', 29),
(3, 'Premier', 16, 12456, '2022-01-06', 30),
(4, 'VIP', 16, 12456, '2022-01-06', 24),
(5, 'Economic', 13, 45678, '2022-01-06', 19),
(6, 'VIP', 20, 56341, '2022-01-06', 13),
(7, 'VIP', 10, 56341, '2022-01-06', 5),
(8, 'VIP', 14, 56341, '2022-01-06', 32),
(9, 'Economic', 2, 25678, '2022-01-06', 20),
(10, 'Premier', 14, 25678, '2022-01-06', 6),
(11, 'VIP', 4, 32150, '2022-01-06', 32),
(12, 'VIP', 18, 79042, '2022-01-06', 24),
(13, 'VIP', 15, 79042, '2022-01-06', 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_name` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` enum('athlete','admin','referee','audience','sponsor') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_name`, `password`, `type`) VALUES
('aaab', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'sponsor'),
('Aggreko', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'sponsor'),
('Ahmed_Mohab', '$2y$10$F4TjkGdDttjL0VuXJlbWVuI4ZsNAbVVHhAHAfJCEVPeVQToUFy2Fq', 'audience'),
('Airbnb', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'sponsor'),
('Ajinomoto', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'sponsor'),
('Alibaba_Ecommerce', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'sponsor'),
('Ali_Ahmed', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'referee'),
('Ali_Elsead', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'referee'),
('Ali_Gamal', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'athlete'),
('Ali_Taher015', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'athlete'),
('Allianz', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'sponsor'),
('Alya_Mohamed', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'athlete'),
('Asics01', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'sponsor'),
('Atos', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'sponsor'),
('Aya_Amir', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'athlete'),
('Bader_Karam', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'athlete'),
('Basma_Elhoseny01', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'admin'),
('Basma_Hatem', '$2y$10$hRbyWWK0NvEKQJB.sgvOeOGPZxS.luWPv0TdflmK0BWUc79x1BBYC', 'audience'),
('Bridgestone', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'sponsor'),
('Christopher_Charles', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'referee'),
('Christopher_David', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'athlete'),
('Clara_Peter', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'referee'),
('Coca_Cola', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'sponsor'),
('David_Charles', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'referee'),
('David_Mark', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'athlete'),
('Dow', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'sponsor'),
('Elsayed_Ali01', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'referee'),
('Eman_Mageed', '$2y$10$vqYyVZXpX/bLzc2L/zmq4eYcm4iD/OGzpn6Jk7Nzm.atL9NjHaNa6', 'audience'),
('Emilly_Thomas', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'referee'),
('Farid_Osman', '$2y$10$KjbcZgVMt6DMnCAEgKIG6.3C4rk3Z70zMdCHCArP6XcVSdJUhyr1K', 'audience'),
('Gamal_ElSayed', '$2y$10$R4OZTN0uvuyhliWbwuAK7.PehM0ZqrB1yBU/2g/69zxoYpuZdUaUm', 'audience'),
('Gamela_Ibrahim', '$2y$10$gnU4hwcQqhWi1w5XU/otz.FtZ6gdTBajFByR5MSwuz2b7ThuFmdDe', 'audience'),
('Gamela_Nour', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'athlete'),
('Goda_Galal', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'athlete'),
('Habiba_Wahba', '$2y$10$Wpw1OodOiN8Wzzv7/nKJ8uRfPyvTbVlJ34r/dzebA0cRMqOkQrdVO', 'audience'),
('Intel_0', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'sponsor'),
('Jaseca_Jhon', '$2y$10$LdAeqkmezjD1hqelWDKd2.RfryFpOFDZ3j9sl84gSNFJRraEIP0oq', 'audience'),
('Jessica_Thomas', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'athlete'),
('Kara_John', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'referee'),
('Kassem _Ali', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'referee'),
('Khaled_Aboud', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'athlete'),
('Khaled_Ahmed', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'referee'),
('Khaled_Hossam', '$2y$10$fLsNJoT/r9tk66Pq6L7HBOdTz6kwKtv2Q3HAZSyrB8Lkj6k73C3TG', 'audience'),
('Khaled_Khan', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'referee'),
('Khaled_Morsy', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'athlete'),
('Maher_Ali', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'athlete'),
('Maher_Bader', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'referee'),
('Mariam_Amir', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'referee'),
('Mark_Charles', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'athlete'),
('Maya_Haytham', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'athlete'),
('Maya_Kareem', '$2y$10$SDqTTcjThcUKcGGo9K3np.L9XZ.w7JnuRw.p5XKrdddGk5Jyc.DT6', 'audience'),
('Mengniu', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'sponsor'),
('Messi_Peter', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'referee'),
('Mohamed_Khan', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'athlete'),
('Morsy_Nader', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'referee'),
('Nissin_Foods', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'sponsor'),
('Ola_Hassan', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'referee'),
('Omar_Ali01', '$2y$10$hIZZVRzcEtzq5BEHD8HtAe3J9QTLtqF3zTkfPRH./LNXDDFksDWuO', 'audience'),
('Omar_Maher', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'athlete'),
('Omega001', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'sponsor'),
('Oneho_Chi', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'referee'),
('Panasonic', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'sponsor'),
('Peter_John', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'referee'),
('Peter_Johon', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'athlete'),
('P_and_G', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'sponsor'),
('Samsung', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'sponsor'),
('Sarah_Ahmed', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'athlete'),
('Sarah_Ali', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'referee'),
('Sarah_Mohamed', '$2y$10$p4mg45OKfgd/HQCOiA6EIeFsaEwFnC2kqisOvEU1WvbMWNN.dVqN6', 'audience'),
('Sarah_Thomas', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'referee'),
('Taher_Mahmoud', '$2y$10$16EwEjZS5e0OmLQikjFsj.8XjauQx3psl6..O8Mt27fO7DqfGSjHS', 'audience'),
('Toyota', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'sponsor'),
('TVNZ', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'sponsor'),
('Visa', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'sponsor'),
('William_Peter', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'athlete'),
('Youssef_Gamel', '$2y$10$ZDaBaPp/G0UDtNr5egbqu.lwgA03p2.m2re1lOCjCNfT/ZgnBphoC', 'audience'),
('Zaki_Haitham', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'athlete'),
('Zaki_Khaled', '$2y$10$EKi3lp95vDSbhoHYi.UCfeRMfOv5PE0nBqNG4ZiI9.qDsw1UMVxoG', 'audience'),
('Zaki_Mohamed', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'referee'),
('Zaki_Nahed', '$2y$10$Gb3thROPBFa5qK5l7ahXSOmsmwu/OXq/C.RCIkgJ6iyFPWzp5OvJm', 'referee');

-- --------------------------------------------------------

--
-- Table structure for table `venue`
--

CREATE TABLE `venue` (
  `Venue_Name` varchar(20) NOT NULL,
  `Capacity` int(11) DEFAULT 0,
  `CityName` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `venue`
--

INSERT INTO `venue` (`Venue_Name`, `Capacity`, `CityName`) VALUES
('	Camp_Nou', 993541, 'Barcelona'),
('	Croke_Park', 82300, 'Dublin'),
('	Santiago_Stadium', 81044, 'Madrid'),
('Allianz_Arena', 75000, 'Munich'),
('Ataturk_Olympic_Stad', 76145, 'Istanbul'),
('Athens_Olympic_Stadi', 75000, 'Athens'),
('Baku_Olympic_Stadium', 68700, 'Baku'),
('Luzhniki_Stadium', 78011, 'Moscow'),
('Metropolitano_Stadiu', 67703, 'Madrid'),
('Millennium_Stadium', 74500, 'Cardiff'),
('Murrayfield_Stadium', 67144, 'Edinburgh'),
('NSC_Olimpiyskiy', 70050, 'Kyiv'),
('Old_Trafford', 74879, 'Manchester'),
('Olympiastadion', 74649, 'Berlin'),
('Puskas_Arena', 67215, 'Budapest'),
('Signal_Iduna_Park', 81359, 'Dortmund'),
('Stade_de_France', 80698, 'Saint_Denis'),
('Stade_Velodrome', 67394, 'Marseille'),
('Stadio_Giuseppe', 80018, 'Milan'),
('Stadio_Olimpico', 70634, 'Rome'),
('Twickenham_Stadium', 82000, 'London'),
('Wembley_Stadium', 90000, 'London');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `athlete`
--
ALTER TABLE `athlete`
  ADD PRIMARY KEY (`A_ID`),
  ADD KEY `ClubID` (`ClubID`),
  ADD KEY `SportID` (`SportID`),
  ADD KEY `Athlete_Sponsor` (`Athlete_Sponsor`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `audience`
--
ALTER TABLE `audience`
  ADD PRIMARY KEY (`SSN`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`City_Name`);

--
-- Indexes for table `club`
--
ALTER TABLE `club`
  ADD PRIMARY KEY (`Club_ID`),
  ADD UNIQUE KEY `Club_Name` (`Club_Name`);

--
-- Indexes for table `coach`
--
ALTER TABLE `coach`
  ADD PRIMARY KEY (`Coach_ID`),
  ADD KEY `Clu_ID` (`Clu_ID`),
  ADD KEY `SPORTID` (`SPORTID`);

--
-- Indexes for table `matche`
--
ALTER TABLE `matche`
  ADD PRIMARY KEY (`M_ID`),
  ADD UNIQUE KEY `M_Name` (`M_Name`),
  ADD KEY `Venue_N` (`Venue_N`),
  ADD KEY `Msport_ID` (`Msport_ID`);

--
-- Indexes for table `medal`
--
ALTER TABLE `medal`
  ADD PRIMARY KEY (`Sport_Id`,`Type`),
  ADD KEY `Winner_ID` (`Winner_ID`);

--
-- Indexes for table `participation`
--
ALTER TABLE `participation`
  ADD PRIMARY KEY (`AthleteID`,`MatchID`),
  ADD KEY `MatchID` (`MatchID`);

--
-- Indexes for table `price`
--
ALTER TABLE `price`
  ADD PRIMARY KEY (`Type`);

--
-- Indexes for table `referee`
--
ALTER TABLE `referee`
  ADD PRIMARY KEY (`Referee_ID`),
  ADD KEY `Sp_ID` (`Sp_ID`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `referee_matches`
--
ALTER TABLE `referee_matches`
  ADD PRIMARY KEY (`RefereeID`,`MatchID`),
  ADD KEY `MatchID` (`MatchID`);

--
-- Indexes for table `sponsor`
--
ALTER TABLE `sponsor`
  ADD PRIMARY KEY (`Company`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `sport`
--
ALTER TABLE `sport`
  ADD PRIMARY KEY (`Sport_ID`),
  ADD UNIQUE KEY `Sport_Name` (`Sport_Name`);

--
-- Indexes for table `sports_sponsors`
--
ALTER TABLE `sports_sponsors`
  ADD PRIMARY KEY (`Sport_Id`,`company`),
  ADD KEY `company` (`company`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Type` (`Type`),
  ADD KEY `Audience_SSN` (`Audience_SSN`),
  ADD KEY `M_ID` (`M_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_name`);

--
-- Indexes for table `venue`
--
ALTER TABLE `venue`
  ADD PRIMARY KEY (`Venue_Name`),
  ADD KEY `CityName` (`CityName`) USING BTREE;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `athlete`
--
ALTER TABLE `athlete`
  ADD CONSTRAINT `athlete_ibfk_1` FOREIGN KEY (`ClubID`) REFERENCES `club` (`Club_ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `athlete_ibfk_2` FOREIGN KEY (`SportID`) REFERENCES `sport` (`Sport_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `athlete_ibfk_3` FOREIGN KEY (`Athlete_Sponsor`) REFERENCES `sponsor` (`Company`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `athlete_ibfk_4` FOREIGN KEY (`username`) REFERENCES `users` (`user_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `audience`
--
ALTER TABLE `audience`
  ADD CONSTRAINT `audience_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`user_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `coach`
--
ALTER TABLE `coach`
  ADD CONSTRAINT `coach_ibfk_1` FOREIGN KEY (`Clu_ID`) REFERENCES `club` (`Club_ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `coach_ibfk_2` FOREIGN KEY (`SPORTID`) REFERENCES `sport` (`Sport_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `matche`
--
ALTER TABLE `matche`
  ADD CONSTRAINT `matche_ibfk_1` FOREIGN KEY (`Venue_N`) REFERENCES `venue` (`Venue_Name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `matche_ibfk_2` FOREIGN KEY (`Msport_ID`) REFERENCES `sport` (`Sport_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `medal`
--
ALTER TABLE `medal`
  ADD CONSTRAINT `medal_ibfk_1` FOREIGN KEY (`Winner_ID`) REFERENCES `athlete` (`A_ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `medal_ibfk_2` FOREIGN KEY (`Sport_Id`) REFERENCES `sport` (`Sport_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `participation`
--
ALTER TABLE `participation`
  ADD CONSTRAINT `participation_ibfk_1` FOREIGN KEY (`AthleteID`) REFERENCES `athlete` (`A_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `participation_ibfk_2` FOREIGN KEY (`MatchID`) REFERENCES `matche` (`M_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `referee`
--
ALTER TABLE `referee`
  ADD CONSTRAINT `referee_ibfk_1` FOREIGN KEY (`Sp_ID`) REFERENCES `sport` (`Sport_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `referee_ibfk_2` FOREIGN KEY (`username`) REFERENCES `users` (`user_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `referee_matches`
--
ALTER TABLE `referee_matches`
  ADD CONSTRAINT `referee_matches_ibfk_1` FOREIGN KEY (`MatchID`) REFERENCES `matche` (`M_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `referee_matches_ibfk_2` FOREIGN KEY (`RefereeID`) REFERENCES `referee` (`Referee_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sponsor`
--
ALTER TABLE `sponsor`
  ADD CONSTRAINT `sponsor_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`user_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sports_sponsors`
--
ALTER TABLE `sports_sponsors`
  ADD CONSTRAINT `sports_sponsors_ibfk_1` FOREIGN KEY (`company`) REFERENCES `sponsor` (`Company`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sports_sponsors_ibfk_2` FOREIGN KEY (`Sport_Id`) REFERENCES `sport` (`Sport_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`Type`) REFERENCES `price` (`Type`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`Audience_SSN`) REFERENCES `audience` (`SSN`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`M_ID`) REFERENCES `matche` (`M_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `venue`
--
ALTER TABLE `venue`
  ADD CONSTRAINT `venue_ibfk_1` FOREIGN KEY (`CityName`) REFERENCES `city` (`City_Name`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
