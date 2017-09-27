-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 27, 2017 at 08:44 PM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `arenadb`
--

-- --------------------------------------------------------

--
-- Table structure for table `league`
--

CREATE TABLE IF NOT EXISTS `league` (
  `LID` char(9) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `lgLogo` varchar(50) DEFAULT NULL,
  `lgOwnerID` char(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `league`
--

INSERT INTO `league` (`LID`, `NAME`, `lgLogo`, `lgOwnerID`) VALUES
('000000199', 'Dinky League', 'filepath', '000000100');

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE IF NOT EXISTS `team` (
  `TID` char(9) NOT NULL,
  `LogoLocation` varchar(50) DEFAULT NULL,
  `Name` varchar(30) NOT NULL,
  `OwnerID` char(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`TID`, `LogoLocation`, `Name`, `OwnerID`) VALUES
('000000000', 'filepath', 'Big Nothing', '000000001');

-- --------------------------------------------------------

--
-- Table structure for table `tournament`
--

CREATE TABLE IF NOT EXISTS `tournament` (
  `TID` char(9) NOT NULL,
  `TrnName` varchar(50) NOT NULL,
  `TrnLogo` varchar(50) DEFAULT NULL,
  `TrnStart` date DEFAULT NULL,
  `TrnEnd` date DEFAULT NULL,
  `leagueID` char(9) DEFAULT NULL,
  `FormatID` char(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tournament`
--

INSERT INTO `tournament` (`TID`, `TrnName`, `TrnLogo`, `TrnStart`, `TrnEnd`, `leagueID`, `FormatID`) VALUES
('000000150', 'Dinky Tourney', 'filepath', '2017-09-30', '2017-09-30', '000000199', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `UID` char(9) NOT NULL,
  `Username` varchar(30) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Nickname` varchar(30) NOT NULL DEFAULT 'NewUser',
  `psswrd` varchar(20) DEFAULT NULL,
  `DateJoined` date DEFAULT NULL,
  `isOp` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UID`, `Username`, `Email`, `Nickname`, `psswrd`, `DateJoined`, `isOp`) VALUES
('000000001', 'Gauss', 'gaussnine@gmail.com', 'Gauss', 'somethingencrypted', '2017-09-27', 1),
('000000100', 'DaBoss99', 'owner@dinkyLeague.mine', 'Pretentious League Owner', 'itsminetho', '2015-11-16', 0),
('999999999', 'TheLastOne', 'survivor@apocalypes.net', 'hello?', 'Imissthesegames', '4062-11-27', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `league`
--
ALTER TABLE `league`
  ADD PRIMARY KEY (`LID`),
  ADD UNIQUE KEY `NAME` (`NAME`),
  ADD KEY `lgOwnerID` (`lgOwnerID`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`TID`),
  ADD UNIQUE KEY `LogoLocation` (`LogoLocation`),
  ADD KEY `OwnerID` (`OwnerID`);

--
-- Indexes for table `tournament`
--
ALTER TABLE `tournament`
  ADD PRIMARY KEY (`TID`),
  ADD UNIQUE KEY `TrnName` (`TrnName`),
  ADD UNIQUE KEY `TrnLogo` (`TrnLogo`),
  ADD KEY `leagueID` (`leagueID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UID`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `Username_2` (`Username`,`Email`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `league`
--
ALTER TABLE `league`
  ADD CONSTRAINT `league_ibfk_1` FOREIGN KEY (`lgOwnerID`) REFERENCES `user` (`UID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `team`
--
ALTER TABLE `team`
  ADD CONSTRAINT `team_ibfk_1` FOREIGN KEY (`OwnerID`) REFERENCES `user` (`UID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `tournament`
--
ALTER TABLE `tournament`
  ADD CONSTRAINT `tournament_ibfk_1` FOREIGN KEY (`leagueID`) REFERENCES `league` (`LID`) ON DELETE SET NULL ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
