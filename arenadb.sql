-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 29, 2017 at 07:32 PM
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
-- Table structure for table `followsgame`
--

CREATE TABLE IF NOT EXISTS `followsgame` (
  `SpecID` char(9) NOT NULL,
  `GameID` char(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `followsgame`
--

INSERT INTO `followsgame` (`SpecID`, `GameID`) VALUES
('000000001', '000440');

-- --------------------------------------------------------

--
-- Table structure for table `followsleague`
--

CREATE TABLE IF NOT EXISTS `followsleague` (
  `SpecID` char(9) NOT NULL,
  `LgID` char(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `followsleague`
--

INSERT INTO `followsleague` (`SpecID`, `LgID`) VALUES
('000000001', '000000199');

-- --------------------------------------------------------

--
-- Table structure for table `followsplayer`
--

CREATE TABLE IF NOT EXISTS `followsplayer` (
  `SpecID` char(9) NOT NULL,
  `playerID` char(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `followsplayer`
--

INSERT INTO `followsplayer` (`SpecID`, `playerID`) VALUES
('999999999', '000000001'),
('000000001', '010101010'),
('000000001', '999999999');

-- --------------------------------------------------------

--
-- Table structure for table `followsteam`
--

CREATE TABLE IF NOT EXISTS `followsteam` (
  `SpecID` char(9) NOT NULL,
  `teamID` char(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `followsteam`
--

INSERT INTO `followsteam` (`SpecID`, `teamID`) VALUES
('000000001', '000000002');

-- --------------------------------------------------------

--
-- Table structure for table `followstourn`
--

CREATE TABLE IF NOT EXISTS `followstourn` (
  `SpecID` char(9) NOT NULL,
  `TrnID` char(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `followstourn`
--

INSERT INTO `followstourn` (`SpecID`, `TrnID`) VALUES
('000000001', '000000150');

-- --------------------------------------------------------

--
-- Table structure for table `format`
--

CREATE TABLE IF NOT EXISTS `format` (
  `FID` char(6) NOT NULL,
  `FName` varchar(50) NOT NULL,
  `Fdesc` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `format`
--

INSERT INTO `format` (`FID`, `FName`, `Fdesc`) VALUES
('000001', 'Single Elimination', 'Contestants are out of the tournament when they lose a series.');

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

CREATE TABLE IF NOT EXISTS `game` (
  `GID` char(6) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `TeamCount` int(11) DEFAULT NULL,
  `TeamSize` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `game`
--

INSERT INTO `game` (`GID`, `Name`, `TeamCount`, `TeamSize`) VALUES
('000001', 'Chess', 2, 1),
('000440', 'Team Fortress 2 6s', 2, 6);

-- --------------------------------------------------------

--
-- Table structure for table `gamedigi`
--

CREATE TABLE IF NOT EXISTS `gamedigi` (
  `gmID` char(6) NOT NULL DEFAULT '',
  `Developer` varchar(50) DEFAULT NULL,
  `CurVersion` varchar(25) DEFAULT NULL,
  `GmLogo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gamedigi`
--

INSERT INTO `gamedigi` (`gmID`, `Developer`, `CurVersion`, `GmLogo`) VALUES
('000440', 'Valve Corporation', '2017-08-03', 'filepath');

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
-- Table structure for table `leaguememberplyr`
--

CREATE TABLE IF NOT EXISTS `leaguememberplyr` (
  `leagueID` char(9) NOT NULL,
  `plyrID` char(9) NOT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leaguememberplyr`
--

INSERT INTO `leaguememberplyr` (`leagueID`, `plyrID`, `startDate`, `endDate`) VALUES
('000000199', '000000001', '2017-09-29', NULL),
('000000199', '000010000', '2017-09-29', NULL),
('000000199', '000020000', '2017-09-29', NULL),
('000000199', '000030000', '2017-09-29', NULL),
('000000199', '000040000', '2017-09-29', NULL),
('000000199', '000100000', '2017-09-29', NULL),
('000000199', '000200000', '2017-09-29', NULL),
('000000199', '000300000', '2017-09-29', NULL),
('000000199', '000400000', '2017-09-29', NULL),
('000000199', '000500000', '2017-09-29', NULL),
('000000199', '010101010', '2017-09-29', NULL),
('000000199', '101010101', '2017-09-29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `leaguememberteam`
--

CREATE TABLE IF NOT EXISTS `leaguememberteam` (
  `leagueID` char(9) NOT NULL,
  `TeamID` char(9) NOT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leaguememberteam`
--

INSERT INTO `leaguememberteam` (`leagueID`, `TeamID`, `startDate`, `endDate`) VALUES
('000000199', '000000000', '2017-09-29', NULL),
('000000199', '000000002', '2017-09-29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `matchhist000001`
--

CREATE TABLE IF NOT EXISTS `matchhist000001` (
  `MID` char(9) NOT NULL,
  `matchDate` date NOT NULL,
  `winnerPlayer` char(3) DEFAULT NULL,
  `TournID` char(9) DEFAULT NULL,
  `replay` varchar(100) DEFAULT NULL,
  `whiteP` char(9) DEFAULT NULL,
  `blackP` char(9) DEFAULT NULL,
  `whtScore` int(11) DEFAULT NULL,
  `whtSecsLeft` int(11) DEFAULT NULL,
  `blkScore` int(11) DEFAULT NULL,
  `blkSecsLeft` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `matchhist000001`
--

INSERT INTO `matchhist000001` (`MID`, `matchDate`, `winnerPlayer`, `TournID`, `replay`, `whiteP`, `blackP`, `whtScore`, `whtSecsLeft`, `blkScore`, `blkSecsLeft`) VALUES
('000000001', '2016-05-12', 'blk', NULL, 'videolink', '000000001', '999999999', 12, 1230, 17, 3);

-- --------------------------------------------------------

--
-- Table structure for table `matchhist000440`
--

CREATE TABLE IF NOT EXISTS `matchhist000440` (
  `MID` char(9) NOT NULL,
  `matchDate` date NOT NULL,
  `winnerTeam` int(11) DEFAULT NULL,
  `TournID` char(9) DEFAULT NULL,
  `replay` varchar(100) DEFAULT NULL,
  `Version` date DEFAULT NULL,
  `team1` char(9) DEFAULT NULL,
  `t1p1` char(9) DEFAULT NULL,
  `t1p2` char(9) DEFAULT NULL,
  `t1p3` char(9) DEFAULT NULL,
  `t1p4` char(9) DEFAULT NULL,
  `t1p5` char(9) DEFAULT NULL,
  `t1p6` char(9) DEFAULT NULL,
  `team2` char(9) DEFAULT NULL,
  `t2p1` char(9) DEFAULT NULL,
  `t2p2` char(9) DEFAULT NULL,
  `t2p3` char(9) DEFAULT NULL,
  `t2p4` char(9) DEFAULT NULL,
  `t2p5` char(9) DEFAULT NULL,
  `t2p6` char(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `matchhist000440`
--

INSERT INTO `matchhist000440` (`MID`, `matchDate`, `winnerTeam`, `TournID`, `replay`, `Version`, `team1`, `t1p1`, `t1p2`, `t1p3`, `t1p4`, `t1p5`, `t1p6`, `team2`, `t2p1`, `t2p2`, `t2p3`, `t2p4`, `t2p5`, `t2p6`) VALUES
('000000001', '2017-09-30', 1, '000000150', 'videolink', '2017-01-16', '000000002', '000000001', '000100000', '000200000', '000300000', '000400000', '000500000', '000000000', '010101010', '101010101', '000010000', '000020000', '000030000', '000040000'),
('000000002', '2018-09-30', NULL, '000000151', NULL, NULL, '000000000', NULL, NULL, NULL, NULL, NULL, NULL, '000000002', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `matchscores000440`
--

CREATE TABLE IF NOT EXISTS `matchscores000440` (
  `MatchID` char(9) NOT NULL,
  `playerID` char(9) NOT NULL,
  `score` int(11) DEFAULT NULL,
  `kills` int(11) DEFAULT NULL,
  `deaths` int(11) DEFAULT NULL,
  `assists` int(11) DEFAULT NULL,
  `healing` int(11) DEFAULT NULL,
  `damage` int(11) DEFAULT NULL,
  `Captures` int(11) DEFAULT NULL,
  `Defenses` int(11) DEFAULT NULL,
  `Destructions` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `matchscores000440`
--

INSERT INTO `matchscores000440` (`MatchID`, `playerID`, `score`, `kills`, `deaths`, `assists`, `healing`, `damage`, `Captures`, `Defenses`, `Destructions`) VALUES
('000000001', '000000001', 50, 32, 1, 5, 0, 6552, 7, 3, 0),
('000000001', '000010000', 7, 2, 10, 8, 0, 341, 5, 4, 3),
('000000001', '000020000', 15, 8, 5, 3, 300, 2560, 6, 2, 3),
('000000001', '000030000', 4, 1, 3, 2, 0, 544, 2, 4, 1),
('000000001', '000040000', 9, 5, 3, 2, 0, 450, 2, 2, 2),
('000000001', '000100000', 32, 12, 5, 23, 4321, 312, 5, 3, 2),
('000000001', '000200000', 20, 10, 5, 10, 0, 3312, NULL, NULL, NULL),
('000000001', '000300000', 20, 10, 5, 2, 600, 2331, NULL, NULL, NULL),
('000000001', '000400000', 20, 10, 5, 23, 53, 1000, NULL, NULL, NULL),
('00000001', '000500000', 13, 6, 3, 2, 0, 600, NULL, NULL, NULL),
('000000001', '010101010', 0, 0, 30, 0, 0, 1, NULL, NULL, NULL),
('000000001', '101010101', 3, 2, 12, 4, 1234, 325, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `passwords`
--

CREATE TABLE IF NOT EXISTS `passwords` (
  `UIDno` char(9) DEFAULT NULL,
  `encrypted` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passwords`
--

INSERT INTO `passwords` (`UIDno`, `encrypted`) VALUES
('000000001', 'MyPasswordButEncrypted'),
('000000100', 'a23457yhsdf097'),
('000011112', 'q34otyi80er7y'),
('010101010', 'aseopy673w'),
('101010101', 'a0w8e56'),
('999999999', '999999999'),
('000010000', 'h346yusr'),
('000020000', 'w34uy6hs'),
('000030000', 'h43wteh5b'),
('000040000', 'h3e6hjutsr'),
('000100000', '35yrjnhe3'),
('000200000', 'j35hynj357jk'),
('000300000', 'j35yj73weryj'),
('000400000', '35whjn5ryj76'),
('000500000', '3576yjh3we5y6j7');

-- --------------------------------------------------------

--
-- Table structure for table `playsfor`
--

CREATE TABLE IF NOT EXISTS `playsfor` (
  `TeamID` char(9) DEFAULT NULL,
  `PlayerID` char(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `playsfor`
--

INSERT INTO `playsfor` (`TeamID`, `PlayerID`) VALUES
('000000000', '010101010'),
('000000000', '101010101'),
('000000000', '000020000'),
('000000000', '000030000'),
('000000000', '000040000'),
('000000002', '000100000'),
('000000002', '000200000'),
('000000002', '000300000'),
('000000002', '000400000'),
('000000002', '000500000'),
('000000002', '000000001'),
('000000000', '000010000');

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE IF NOT EXISTS `team` (
  `TmID` char(9) NOT NULL,
  `LogoLocation` varchar(50) DEFAULT NULL,
  `Name` varchar(30) NOT NULL,
  `OwnerID` char(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`TmID`, `LogoLocation`, `Name`, `OwnerID`) VALUES
('000000000', 'filepath', 'Big Nothings', '000011112'),
('000000002', 'filepath', 'Somebodies', '000000001');

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
('000000150', 'Dinky Tourney 2017', 'filepath', '2017-09-30', '2017-09-30', '000000199', '000001'),
('000000151', 'Dinky Tourney 2018', 'filepath', '2018-09-30', '2018-09-30', '000000199', '000001');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `UID` char(9) NOT NULL,
  `Username` varchar(30) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Nickname` varchar(30) NOT NULL DEFAULT 'NewUser',
  `DateJoined` date DEFAULT NULL,
  `isOp` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UID`, `Username`, `Email`, `Nickname`, `DateJoined`, `isOp`) VALUES
('000000001', 'Gauss', 'gaussnine@gmail.com', 'Gauss', '2017-09-27', 1),
('000000100', 'DaBoss99', 'owner@dinkyLeague.mine', 'Pretentious League Owner', '2015-11-16', 0),
('000010000', 'nobody3', '3@nothing.net', 'nobody3', '2017-01-01', 0),
('000011112', 'nothingismine', 'biggestnobody@nothing.net', 'OwnerofNothings', '1999-11-28', 0),
('000020000', 'nobody4', '4@nothing.net', 'nobody4', '2017-01-01', 0),
('000030000', 'nobody5', '5@nothing.net', 'nobody5', '2017-01-01', 0),
('000040000', 'nobody6', '6@nothing.net', 'nobody6', '2017-01-01', 0),
('000100000', 'some1', '1@people.com', 'some1', '2017-01-01', 0),
('000200000', 'some2', '2@people.com', 'some2', '2017-01-01', 0),
('000300000', 'some3', '3@people.com', 'some3', '2017-01-01', 0),
('000400000', 'some4', '4@people.com', 'some4', '2017-01-01', 0),
('000500000', 'some5', '5@people.com', 'some5', '2017-01-01', 0),
('010101010', 'MrCellophane', 'nobody@nothing.net', 'GreatBigNobody00', '2000-01-01', 0),
('101010101', 'nobody2', 'nobody2@nothing.net', 'nobody2', '2017-09-06', 0),
('999999999', 'TheLastOne', 'survivor@apocalypse.net', 'hello?', '4062-11-27', 0);

-- --------------------------------------------------------

--
-- Table structure for table `winnerslgplyr`
--

CREATE TABLE IF NOT EXISTS `winnerslgplyr` (
  `LeagueID` char(9) NOT NULL,
  `playerID` char(9) DEFAULT NULL,
  `winDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `winnerslgplyr`
--

INSERT INTO `winnerslgplyr` (`LeagueID`, `playerID`, `winDate`) VALUES
('000000199', '000000001', '2017-02-02'),
('000000199', '000100000', '2017-02-02'),
('000000199', '000200000', '2017-02-02'),
('000000199', '000300000', '2017-02-02'),
('000000199', '000400000', '2017-02-02'),
('000000199', '000500000', '2017-02-02');

-- --------------------------------------------------------

--
-- Table structure for table `winnerslgteam`
--

CREATE TABLE IF NOT EXISTS `winnerslgteam` (
  `LeagueID` char(9) NOT NULL,
  `TeamID` char(9) DEFAULT NULL,
  `winDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `winnerslgteam`
--

INSERT INTO `winnerslgteam` (`LeagueID`, `TeamID`, `winDate`) VALUES
('000000199', '000000002', '2017-02-02');

-- --------------------------------------------------------

--
-- Table structure for table `winnerstrnplyr`
--

CREATE TABLE IF NOT EXISTS `winnerstrnplyr` (
  `TournID` char(9) NOT NULL,
  `player` char(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `winnerstrnplyr`
--

INSERT INTO `winnerstrnplyr` (`TournID`, `player`) VALUES
('000000150', '000000001'),
('000000150', '000100000'),
('000000150', '000200000'),
('000000150', '000300000'),
('000000150', '000400000'),
('000000150', '000500000');

-- --------------------------------------------------------

--
-- Table structure for table `winnerstrnteam`
--

CREATE TABLE IF NOT EXISTS `winnerstrnteam` (
  `TournID` char(9) NOT NULL,
  `TeamID` char(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `winnerstrnteam`
--

INSERT INTO `winnerstrnteam` (`TournID`, `TeamID`) VALUES
('000000150', '000000002');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `followsgame`
--
ALTER TABLE `followsgame`
  ADD UNIQUE KEY `SpecID` (`SpecID`,`GameID`),
  ADD KEY `GameID` (`GameID`);

--
-- Indexes for table `followsleague`
--
ALTER TABLE `followsleague`
  ADD UNIQUE KEY `SpecID` (`SpecID`,`LgID`),
  ADD KEY `LgID` (`LgID`);

--
-- Indexes for table `followsplayer`
--
ALTER TABLE `followsplayer`
  ADD UNIQUE KEY `SpecID` (`SpecID`,`playerID`),
  ADD KEY `playerID` (`playerID`);

--
-- Indexes for table `followsteam`
--
ALTER TABLE `followsteam`
  ADD UNIQUE KEY `SpecID` (`SpecID`,`teamID`),
  ADD KEY `teamID` (`teamID`);

--
-- Indexes for table `followstourn`
--
ALTER TABLE `followstourn`
  ADD UNIQUE KEY `SpecID` (`SpecID`,`TrnID`),
  ADD KEY `TrnID` (`TrnID`);

--
-- Indexes for table `format`
--
ALTER TABLE `format`
  ADD PRIMARY KEY (`FID`),
  ADD UNIQUE KEY `FName` (`FName`);

--
-- Indexes for table `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`GID`);

--
-- Indexes for table `gamedigi`
--
ALTER TABLE `gamedigi`
  ADD PRIMARY KEY (`gmID`);

--
-- Indexes for table `league`
--
ALTER TABLE `league`
  ADD PRIMARY KEY (`LID`),
  ADD UNIQUE KEY `NAME` (`NAME`),
  ADD KEY `lgOwnerID` (`lgOwnerID`);

--
-- Indexes for table `leaguememberplyr`
--
ALTER TABLE `leaguememberplyr`
  ADD UNIQUE KEY `leagueID` (`leagueID`,`plyrID`),
  ADD KEY `plyrID` (`plyrID`);

--
-- Indexes for table `leaguememberteam`
--
ALTER TABLE `leaguememberteam`
  ADD UNIQUE KEY `leagueID` (`leagueID`,`TeamID`),
  ADD KEY `TeamID` (`TeamID`);

--
-- Indexes for table `matchhist000001`
--
ALTER TABLE `matchhist000001`
  ADD PRIMARY KEY (`MID`),
  ADD KEY `whiteP` (`whiteP`),
  ADD KEY `blackP` (`blackP`),
  ADD KEY `TournID` (`TournID`);

--
-- Indexes for table `matchhist000440`
--
ALTER TABLE `matchhist000440`
  ADD PRIMARY KEY (`MID`),
  ADD KEY `TournID` (`TournID`),
  ADD KEY `t1p1` (`t1p1`),
  ADD KEY `t1p2` (`t1p2`),
  ADD KEY `t1p3` (`t1p3`),
  ADD KEY `t1p4` (`t1p4`),
  ADD KEY `t1p5` (`t1p5`),
  ADD KEY `t1p6` (`t1p6`),
  ADD KEY `t2p1` (`t2p1`),
  ADD KEY `t2p2` (`t2p2`),
  ADD KEY `t2p3` (`t2p3`),
  ADD KEY `t2p4` (`t2p4`),
  ADD KEY `t2p5` (`t2p5`),
  ADD KEY `t2p6` (`t2p6`),
  ADD KEY `team1` (`team1`),
  ADD KEY `team2` (`team2`);

--
-- Indexes for table `matchscores000440`
--
ALTER TABLE `matchscores000440`
  ADD UNIQUE KEY `MatchID_2` (`MatchID`,`playerID`),
  ADD KEY `MatchID` (`MatchID`),
  ADD KEY `playerID` (`playerID`);

--
-- Indexes for table `passwords`
--
ALTER TABLE `passwords`
  ADD UNIQUE KEY `UIDno` (`UIDno`);

--
-- Indexes for table `playsfor`
--
ALTER TABLE `playsfor`
  ADD UNIQUE KEY `PlayerID` (`PlayerID`),
  ADD KEY `TeamID` (`TeamID`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`TmID`),
  ADD UNIQUE KEY `Name` (`Name`),
  ADD KEY `OwnerID` (`OwnerID`);

--
-- Indexes for table `tournament`
--
ALTER TABLE `tournament`
  ADD PRIMARY KEY (`TID`),
  ADD KEY `leagueID` (`leagueID`),
  ADD KEY `FormatID` (`FormatID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UID`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `Username_2` (`Username`,`Email`);

--
-- Indexes for table `winnerslgplyr`
--
ALTER TABLE `winnerslgplyr`
  ADD UNIQUE KEY `LeagueID` (`LeagueID`,`playerID`),
  ADD KEY `playerID` (`playerID`);

--
-- Indexes for table `winnerslgteam`
--
ALTER TABLE `winnerslgteam`
  ADD UNIQUE KEY `LeagueID` (`LeagueID`,`TeamID`),
  ADD KEY `TeamID` (`TeamID`);

--
-- Indexes for table `winnerstrnplyr`
--
ALTER TABLE `winnerstrnplyr`
  ADD UNIQUE KEY `TournID` (`TournID`,`player`),
  ADD KEY `player` (`player`);

--
-- Indexes for table `winnerstrnteam`
--
ALTER TABLE `winnerstrnteam`
  ADD UNIQUE KEY `TournID` (`TournID`,`TeamID`),
  ADD KEY `TeamID` (`TeamID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `followsgame`
--
ALTER TABLE `followsgame`
  ADD CONSTRAINT `followsgame_ibfk_1` FOREIGN KEY (`SpecID`) REFERENCES `user` (`UID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `followsgame_ibfk_2` FOREIGN KEY (`GameID`) REFERENCES `game` (`GID`) ON UPDATE CASCADE;

--
-- Constraints for table `followsleague`
--
ALTER TABLE `followsleague`
  ADD CONSTRAINT `followsleague_ibfk_1` FOREIGN KEY (`SpecID`) REFERENCES `user` (`UID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `followsleague_ibfk_2` FOREIGN KEY (`LgID`) REFERENCES `league` (`LID`) ON UPDATE CASCADE;

--
-- Constraints for table `followsplayer`
--
ALTER TABLE `followsplayer`
  ADD CONSTRAINT `followsplayer_ibfk_1` FOREIGN KEY (`SpecID`) REFERENCES `user` (`UID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `followsplayer_ibfk_2` FOREIGN KEY (`playerID`) REFERENCES `user` (`UID`) ON UPDATE CASCADE;

--
-- Constraints for table `followsteam`
--
ALTER TABLE `followsteam`
  ADD CONSTRAINT `followsteam_ibfk_1` FOREIGN KEY (`SpecID`) REFERENCES `user` (`UID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `followsteam_ibfk_2` FOREIGN KEY (`teamID`) REFERENCES `team` (`TmID`) ON UPDATE CASCADE;

--
-- Constraints for table `followstourn`
--
ALTER TABLE `followstourn`
  ADD CONSTRAINT `followstourn_ibfk_1` FOREIGN KEY (`SpecID`) REFERENCES `user` (`UID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `followstourn_ibfk_2` FOREIGN KEY (`TrnID`) REFERENCES `tournament` (`TID`) ON UPDATE CASCADE;

--
-- Constraints for table `gamedigi`
--
ALTER TABLE `gamedigi`
  ADD CONSTRAINT `gamedigi_ibfk_1` FOREIGN KEY (`gmID`) REFERENCES `game` (`GID`) ON UPDATE CASCADE;

--
-- Constraints for table `league`
--
ALTER TABLE `league`
  ADD CONSTRAINT `league_ibfk_1` FOREIGN KEY (`lgOwnerID`) REFERENCES `user` (`UID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `leaguememberplyr`
--
ALTER TABLE `leaguememberplyr`
  ADD CONSTRAINT `leaguememberplyr_ibfk_1` FOREIGN KEY (`leagueID`) REFERENCES `league` (`LID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `leaguememberplyr_ibfk_2` FOREIGN KEY (`plyrID`) REFERENCES `user` (`UID`) ON UPDATE CASCADE;

--
-- Constraints for table `leaguememberteam`
--
ALTER TABLE `leaguememberteam`
  ADD CONSTRAINT `leaguememberteam_ibfk_1` FOREIGN KEY (`leagueID`) REFERENCES `league` (`LID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `leaguememberteam_ibfk_2` FOREIGN KEY (`TeamID`) REFERENCES `team` (`TmID`) ON UPDATE CASCADE;

--
-- Constraints for table `matchhist000001`
--
ALTER TABLE `matchhist000001`
  ADD CONSTRAINT `matchhist000001_ibfk_1` FOREIGN KEY (`whiteP`) REFERENCES `user` (`UID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `matchhist000001_ibfk_2` FOREIGN KEY (`blackP`) REFERENCES `user` (`UID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `matchhist000001_ibfk_3` FOREIGN KEY (`TournID`) REFERENCES `tournament` (`TID`) ON UPDATE CASCADE;

--
-- Constraints for table `matchhist000440`
--
ALTER TABLE `matchhist000440`
  ADD CONSTRAINT `matchhist000440_ibfk_1` FOREIGN KEY (`TournID`) REFERENCES `tournament` (`TID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `matchhist000440_ibfk_10` FOREIGN KEY (`t2p3`) REFERENCES `user` (`UID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `matchhist000440_ibfk_11` FOREIGN KEY (`t2p4`) REFERENCES `user` (`UID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `matchhist000440_ibfk_12` FOREIGN KEY (`t2p5`) REFERENCES `user` (`UID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `matchhist000440_ibfk_13` FOREIGN KEY (`t2p6`) REFERENCES `user` (`UID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `matchhist000440_ibfk_14` FOREIGN KEY (`team1`) REFERENCES `team` (`TmID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `matchhist000440_ibfk_15` FOREIGN KEY (`team2`) REFERENCES `team` (`TmID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `matchhist000440_ibfk_2` FOREIGN KEY (`t1p1`) REFERENCES `user` (`UID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `matchhist000440_ibfk_3` FOREIGN KEY (`t1p2`) REFERENCES `user` (`UID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `matchhist000440_ibfk_4` FOREIGN KEY (`t1p3`) REFERENCES `user` (`UID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `matchhist000440_ibfk_5` FOREIGN KEY (`t1p4`) REFERENCES `user` (`UID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `matchhist000440_ibfk_6` FOREIGN KEY (`t1p5`) REFERENCES `user` (`UID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `matchhist000440_ibfk_7` FOREIGN KEY (`t1p6`) REFERENCES `user` (`UID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `matchhist000440_ibfk_8` FOREIGN KEY (`t2p1`) REFERENCES `user` (`UID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `matchhist000440_ibfk_9` FOREIGN KEY (`t2p2`) REFERENCES `user` (`UID`) ON UPDATE CASCADE;

--
-- Constraints for table `matchscores000440`
--
ALTER TABLE `matchscores000440`
  ADD CONSTRAINT `matchscores000440_ibfk_1` FOREIGN KEY (`MatchID`) REFERENCES `matchhist000440` (`MID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `matchscores000440_ibfk_2` FOREIGN KEY (`playerID`) REFERENCES `user` (`UID`) ON UPDATE CASCADE;

--
-- Constraints for table `passwords`
--
ALTER TABLE `passwords`
  ADD CONSTRAINT `passwords_ibfk_1` FOREIGN KEY (`UIDno`) REFERENCES `user` (`UID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `playsfor`
--
ALTER TABLE `playsfor`
  ADD CONSTRAINT `playsfor_ibfk_1` FOREIGN KEY (`PlayerID`) REFERENCES `user` (`UID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `playsfor_ibfk_2` FOREIGN KEY (`TeamID`) REFERENCES `team` (`TmID`);

--
-- Constraints for table `team`
--
ALTER TABLE `team`
  ADD CONSTRAINT `team_ibfk_1` FOREIGN KEY (`OwnerID`) REFERENCES `user` (`UID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `tournament`
--
ALTER TABLE `tournament`
  ADD CONSTRAINT `tournament_ibfk_1` FOREIGN KEY (`leagueID`) REFERENCES `league` (`LID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tournament_ibfk_2` FOREIGN KEY (`FormatID`) REFERENCES `format` (`FID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `winnerslgplyr`
--
ALTER TABLE `winnerslgplyr`
  ADD CONSTRAINT `winnerslgplyr_ibfk_1` FOREIGN KEY (`LeagueID`) REFERENCES `league` (`LID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `winnerslgplyr_ibfk_2` FOREIGN KEY (`playerID`) REFERENCES `user` (`UID`) ON UPDATE CASCADE;

--
-- Constraints for table `winnerslgteam`
--
ALTER TABLE `winnerslgteam`
  ADD CONSTRAINT `winnerslgteam_ibfk_1` FOREIGN KEY (`LeagueID`) REFERENCES `league` (`LID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `winnerslgteam_ibfk_2` FOREIGN KEY (`TeamID`) REFERENCES `team` (`TmID`) ON UPDATE CASCADE;

--
-- Constraints for table `winnerstrnplyr`
--
ALTER TABLE `winnerstrnplyr`
  ADD CONSTRAINT `winnerstrnplyr_ibfk_1` FOREIGN KEY (`TournID`) REFERENCES `tournament` (`TID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `winnerstrnplyr_ibfk_2` FOREIGN KEY (`player`) REFERENCES `user` (`UID`) ON UPDATE CASCADE;

--
-- Constraints for table `winnerstrnteam`
--
ALTER TABLE `winnerstrnteam`
  ADD CONSTRAINT `winnerstrnteam_ibfk_1` FOREIGN KEY (`TournID`) REFERENCES `tournament` (`TID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `winnerstrnteam_ibfk_2` FOREIGN KEY (`TeamID`) REFERENCES `team` (`TmID`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
