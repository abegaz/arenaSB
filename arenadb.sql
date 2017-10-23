-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2017 at 07:41 PM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `arenadb2`
--

-- --------------------------------------------------------

--
-- Table structure for table `followsgame`
--

CREATE TABLE IF NOT EXISTS `followsgame` (
  `SpecID` int(9) NOT NULL,
  `GameID` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `followsgame`
--

INSERT INTO `followsgame` (`SpecID`, `GameID`) VALUES
(0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `followsleague`
--

CREATE TABLE IF NOT EXISTS `followsleague` (
  `SpecID` int(9) NOT NULL,
  `LgID` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `followsleague`
--

INSERT INTO `followsleague` (`SpecID`, `LgID`) VALUES
(0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `followsplayer`
--

CREATE TABLE IF NOT EXISTS `followsplayer` (
  `SpecID` int(9) NOT NULL,
  `playerID` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `followsplayer`
--

INSERT INTO `followsplayer` (`SpecID`, `playerID`) VALUES
(14, 0),
(0, 12),
(0, 14);

-- --------------------------------------------------------

--
-- Table structure for table `followsteam`
--

CREATE TABLE IF NOT EXISTS `followsteam` (
  `SpecID` int(9) NOT NULL,
  `teamID` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `followsteam`
--

INSERT INTO `followsteam` (`SpecID`, `teamID`) VALUES
(0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `followstourn`
--

CREATE TABLE IF NOT EXISTS `followstourn` (
  `SpecID` int(9) NOT NULL,
  `TrnID` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `followstourn`
--

INSERT INTO `followstourn` (`SpecID`, `TrnID`) VALUES
(0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `format`
--

CREATE TABLE IF NOT EXISTS `format` (
  `FID` int(6) NOT NULL,
  `FName` varchar(50) NOT NULL,
  `Fdesc` varchar(300) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `format`
--

INSERT INTO `format` (`FID`, `FName`, `Fdesc`) VALUES
(1, 'Single Elimination', 'Contestants are out of the tournament when they lose a series.');

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

CREATE TABLE IF NOT EXISTS `game` (
  `GID` int(6) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `TeamCount` int(11) DEFAULT NULL,
  `TeamSize` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=441 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `game`
--

INSERT INTO `game` (`GID`, `Name`, `TeamCount`, `TeamSize`) VALUES
(1, 'Chess', 2, 1),
(2, 'Team Fortress 2 6s', 2, 6);

-- --------------------------------------------------------

--
-- Table structure for table `gamedigi`
--

CREATE TABLE IF NOT EXISTS `gamedigi` (
  `gmID` int(6) NOT NULL,
  `Developer` varchar(50) DEFAULT NULL,
  `CurVersion` varchar(25) DEFAULT NULL,
  `GmLogo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gamedigi`
--

INSERT INTO `gamedigi` (`gmID`, `Developer`, `CurVersion`, `GmLogo`) VALUES
(2, 'Valve Corporation', '2017-08-03', 'filepath');

-- --------------------------------------------------------

--
-- Table structure for table `league`
--

CREATE TABLE IF NOT EXISTS `league` (
  `LID` int(9) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `lgLogo` varchar(50) DEFAULT NULL,
  `lgOwnerID` int(9) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `league`
--

INSERT INTO `league` (`LID`, `NAME`, `lgLogo`, `lgOwnerID`) VALUES
(1, 'Dinky League', 'filepath', 1);

-- --------------------------------------------------------

--
-- Table structure for table `leaguememberplyr`
--

CREATE TABLE IF NOT EXISTS `leaguememberplyr` (
  `leagueID` int(9) NOT NULL,
  `plyrID` int(9) NOT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leaguememberplyr`
--

INSERT INTO `leaguememberplyr` (`leagueID`, `plyrID`, `startDate`, `endDate`) VALUES
(1, 0, '2017-09-29', NULL),
(1, 2, '2017-09-29', NULL),
(1, 4, '2017-09-29', NULL),
(1, 5, '2017-09-29', NULL),
(1, 6, '2017-09-29', NULL),
(1, 7, '2017-09-29', NULL),
(1, 8, '2017-09-29', NULL),
(1, 9, '2017-09-29', NULL),
(1, 10, '2017-09-29', NULL),
(1, 11, '2017-09-29', NULL),
(1, 12, '2017-09-29', NULL),
(1, 13, '2017-09-29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `leaguememberteam`
--

CREATE TABLE IF NOT EXISTS `leaguememberteam` (
  `leagueID` int(9) NOT NULL,
  `TeamID` int(9) NOT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leaguememberteam`
--

INSERT INTO `leaguememberteam` (`leagueID`, `TeamID`, `startDate`, `endDate`) VALUES
(1, 0, '2017-09-29', NULL),
(1, 1, '2017-09-29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `matchhist000001`
--

CREATE TABLE IF NOT EXISTS `matchhist000001` (
  `MID` int(9) NOT NULL,
  `matchDate` date NOT NULL,
  `winnerPlayer` char(3) DEFAULT NULL,
  `TournID` int(9) DEFAULT NULL,
  `replay` varchar(100) DEFAULT NULL,
  `whiteP` int(9) DEFAULT NULL,
  `blackP` int(9) DEFAULT NULL,
  `whtScore` int(11) DEFAULT NULL,
  `whtSecsLeft` int(11) DEFAULT NULL,
  `blkScore` int(11) DEFAULT NULL,
  `blkSecsLeft` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `matchhist000001`
--

INSERT INTO `matchhist000001` (`MID`, `matchDate`, `winnerPlayer`, `TournID`, `replay`, `whiteP`, `blackP`, `whtScore`, `whtSecsLeft`, `blkScore`, `blkSecsLeft`) VALUES
(1, '2016-05-12', 'blk', NULL, 'videolink', 0, 14, 12, 1230, 17, 3);

-- --------------------------------------------------------

--
-- Table structure for table `matchhist000002`
--

CREATE TABLE IF NOT EXISTS `matchhist000002` (
  `MID` int(9) NOT NULL,
  `matchDate` date NOT NULL,
  `winnerTeam` int(11) DEFAULT NULL,
  `TournID` int(9) DEFAULT NULL,
  `roundInfo` char(6) DEFAULT NULL,
  `replay` varchar(100) DEFAULT NULL,
  `Version` date DEFAULT NULL,
  `team1` int(9) DEFAULT NULL,
  `t1p1` int(9) DEFAULT NULL,
  `t1p2` int(9) DEFAULT NULL,
  `t1p3` int(9) DEFAULT NULL,
  `t1p4` int(9) DEFAULT NULL,
  `t1p5` int(9) DEFAULT NULL,
  `t1p6` int(9) DEFAULT NULL,
  `team2` int(9) DEFAULT NULL,
  `t2p1` int(9) DEFAULT NULL,
  `t2p2` int(9) DEFAULT NULL,
  `t2p3` int(9) DEFAULT NULL,
  `t2p4` int(9) DEFAULT NULL,
  `t2p5` int(9) DEFAULT NULL,
  `t2p6` int(9) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `matchhist000002`
--

INSERT INTO `matchhist000002` (`MID`, `matchDate`, `winnerTeam`, `TournID`, `roundInfo`, `replay`, `Version`, `team1`, `t1p1`, `t1p2`, `t1p3`, `t1p4`, `t1p5`, `t1p6`, `team2`, `t2p1`, `t2p2`, `t2p3`, `t2p4`, `t2p5`, `t2p6`) VALUES
(1, '2017-09-30', 1, 1, NULL, 'videolink', '2017-01-16', 1, 0, 7, 8, 9, 10, 11, 0, 12, 13, 2, 4, 5, 6),
(2, '2018-09-30', NULL, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `matchscores000002`
--

CREATE TABLE IF NOT EXISTS `matchscores000002` (
  `MatchID` int(9) NOT NULL,
  `playerID` int(9) NOT NULL,
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
-- Dumping data for table `matchscores000002`
--

INSERT INTO `matchscores000002` (`MatchID`, `playerID`, `score`, `kills`, `deaths`, `assists`, `healing`, `damage`, `Captures`, `Defenses`, `Destructions`) VALUES
(1, 0, 50, 32, 1, 5, 0, 6552, 7, 3, 0),
(1, 2, 7, 2, 10, 8, 0, 341, 5, 4, 3),
(1, 4, 15, 8, 5, 3, 300, 2560, 6, 2, 3),
(1, 5, 4, 1, 3, 2, 0, 544, 2, 4, 1),
(1, 6, 9, 5, 3, 2, 0, 450, 2, 2, 2),
(1, 7, 32, 12, 5, 23, 4321, 312, 5, 3, 2),
(1, 8, 20, 10, 5, 10, 0, 3312, NULL, NULL, NULL),
(1, 9, 20, 10, 5, 2, 600, 2331, NULL, NULL, NULL),
(1, 10, 20, 10, 5, 23, 53, 1000, NULL, NULL, NULL),
(1, 11, 13, 6, 3, 2, 0, 600, NULL, NULL, NULL),
(1, 12, 0, 0, 30, 0, 0, 1, NULL, NULL, NULL),
(1, 13, 3, 2, 12, 4, 1234, 325, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `passwords`
--

CREATE TABLE IF NOT EXISTS `passwords` (
  `UIDno` int(9) DEFAULT NULL,
  `encrypted` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passwords`
--

INSERT INTO `passwords` (`UIDno`, `encrypted`) VALUES
(0, 'MyPasswordButEncrypted'),
(1, 'a23457yhsdf097'),
(2, 'q34otyi80er7y'),
(3, 'aseopy673w'),
(4, 'a0w8e56'),
(14, '999999999'),
(5, 'h346yusr'),
(6, 'w34uy6hs'),
(7, 'h43wteh5b'),
(8, 'h3e6hjutsr'),
(9, '35yrjnhe3'),
(10, 'j35hynj357jk'),
(11, 'j35yj73weryj'),
(12, '35whjn5ryj76'),
(13, '3576yjh3we5y6j7');

-- --------------------------------------------------------

--
-- Table structure for table `playsfor`
--

CREATE TABLE IF NOT EXISTS `playsfor` (
  `TeamID` int(9) DEFAULT NULL,
  `PlayerID` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `playsfor`
--

INSERT INTO `playsfor` (`TeamID`, `PlayerID`) VALUES
(0, 2),
(0, 4),
(0, 5),
(0, 6),
(0, 12),
(0, 13),
(1, 0),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11);

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE IF NOT EXISTS `team` (
  `TmID` int(9) NOT NULL,
  `LogoLocation` varchar(50) DEFAULT NULL,
  `Name` varchar(30) NOT NULL,
  `OwnerID` int(9) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`TmID`, `LogoLocation`, `Name`, `OwnerID`) VALUES
(0, 'filepath', 'Big Nothings', 3),
(1, 'filepath', 'Somebodies', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tournament`
--

CREATE TABLE IF NOT EXISTS `tournament` (
  `TID` int(9) NOT NULL,
  `TrnName` varchar(50) NOT NULL,
  `TrnLogo` varchar(50) DEFAULT NULL,
  `TrnStart` date DEFAULT NULL,
  `TrnEnd` date DEFAULT NULL,
  `leagueID` int(9) DEFAULT NULL,
  `FormatID` char(6) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tournament`
--

INSERT INTO `tournament` (`TID`, `TrnName`, `TrnLogo`, `TrnStart`, `TrnEnd`, `leagueID`, `FormatID`) VALUES
(1, 'Dinky Tourney 2017', 'filepath', '2017-09-30', '2017-09-30', 1, '1'),
(2, 'Dinky Tourney 2018', 'filepath', '2018-09-30', '2018-09-30', 1, '1');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `UID` int(9) NOT NULL,
  `Username` varchar(30) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Nickname` varchar(30) NOT NULL DEFAULT 'NewUser',
  `DateJoined` date DEFAULT NULL,
  `isOp` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=1000000001 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UID`, `Username`, `Email`, `Nickname`, `DateJoined`, `isOp`) VALUES
(0, 'Gauss', 'gaussnine@gmail.com', 'Gauss', '2017-09-27', 1),
(1, 'DaBoss99', 'owner@dinkyLeague.mine', 'Pretentious League Owner', '2015-11-16', 0),
(2, 'nobody3', '3@nothing.net', 'nobody3', '2017-01-01', 0),
(3, 'nothingismine', 'biggestnobody@nothing.net', 'OwnerofNothings', '1999-11-28', 0),
(4, 'nobody4', '4@nothing.net', 'nobody4', '2017-01-01', 0),
(5, 'nobody5', '5@nothing.net', 'nobody5', '2017-01-01', 0),
(6, 'nobody6', '6@nothing.net', 'nobody6', '2017-01-01', 0),
(7, 'some1', '1@people.com', 'some1', '2017-01-01', 0),
(8, 'some2', '2@people.com', 'some2', '2017-01-01', 0),
(9, 'some3', '3@people.com', 'some3', '2017-01-01', 0),
(10, 'some4', '4@people.com', 'some4', '2017-01-01', 0),
(11, 'some5', '5@people.com', 'some5', '2017-01-01', 0),
(12, 'MrCellophane', 'nobody@nothing.net', 'GreatBigNobody00', '2000-01-01', 0),
(13, 'nobody2', 'nobody2@nothing.net', 'nobody2', '2017-09-06', 0),
(14, 'TheLastOne', 'survivor@apocalypse.net', 'hello?', '4062-11-27', 0);

-- --------------------------------------------------------

--
-- Table structure for table `winnerslgplyr`
--

CREATE TABLE IF NOT EXISTS `winnerslgplyr` (
  `LeagueID` int(9) NOT NULL,
  `playerID` int(9) DEFAULT NULL,
  `winDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `winnerslgplyr`
--

INSERT INTO `winnerslgplyr` (`LeagueID`, `playerID`, `winDate`) VALUES
(1, 0, '2017-02-02'),
(1, 7, '2017-02-02'),
(1, 8, '2017-02-02'),
(1, 9, '2017-02-02'),
(1, 10, '2017-02-02'),
(1, 11, '2017-02-02');

-- --------------------------------------------------------

--
-- Table structure for table `winnerslgteam`
--

CREATE TABLE IF NOT EXISTS `winnerslgteam` (
  `LeagueID` int(9) NOT NULL,
  `TeamID` int(9) DEFAULT NULL,
  `winDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `winnerslgteam`
--

INSERT INTO `winnerslgteam` (`LeagueID`, `TeamID`, `winDate`) VALUES
(1, 1, '2017-02-02');

-- --------------------------------------------------------

--
-- Table structure for table `winnerstrnplyr`
--

CREATE TABLE IF NOT EXISTS `winnerstrnplyr` (
  `TournID` int(9) NOT NULL,
  `player` int(9) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `winnerstrnplyr`
--

INSERT INTO `winnerstrnplyr` (`TournID`, `player`) VALUES
(1, 0),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11);

-- --------------------------------------------------------

--
-- Table structure for table `winnerstrnteam`
--

CREATE TABLE IF NOT EXISTS `winnerstrnteam` (
  `TournID` int(9) NOT NULL,
  `TeamID` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `winnerstrnteam`
--

INSERT INTO `winnerstrnteam` (`TournID`, `TeamID`) VALUES
(1, 1);

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
-- Indexes for table `matchhist000002`
--
ALTER TABLE `matchhist000002`
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
-- Indexes for table `matchscores000002`
--
ALTER TABLE `matchscores000002`
  ADD PRIMARY KEY (`MatchID`,`playerID`),
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
  ADD UNIQUE KEY `TeamID_2` (`TeamID`,`PlayerID`),
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
  ADD UNIQUE KEY `LeagueID_2` (`LeagueID`,`playerID`),
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
  ADD PRIMARY KEY (`TournID`,`player`),
  ADD UNIQUE KEY `TournID` (`TournID`,`player`),
  ADD KEY `player` (`player`);

--
-- Indexes for table `winnerstrnteam`
--
ALTER TABLE `winnerstrnteam`
  ADD UNIQUE KEY `TournID` (`TournID`,`TeamID`),
  ADD KEY `TeamID` (`TeamID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `format`
--
ALTER TABLE `format`
  MODIFY `FID` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `game`
--
ALTER TABLE `game`
  MODIFY `GID` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `league`
--
ALTER TABLE `league`
  MODIFY `LID` int(9) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `matchhist000001`
--
ALTER TABLE `matchhist000001`
  MODIFY `MID` int(9) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `matchhist000002`
--
ALTER TABLE `matchhist000002`
  MODIFY `MID` int(9) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `TmID` int(9) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tournament`
--
ALTER TABLE `tournament`
  MODIFY `TID` int(9) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UID` int(9) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
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
-- Constraints for table `matchhist000002`
--
ALTER TABLE `matchhist000002`
  ADD CONSTRAINT `matchhist000002_ibfk_1` FOREIGN KEY (`TournID`) REFERENCES `tournament` (`TID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `matchhist000002_ibfk_10` FOREIGN KEY (`t2p3`) REFERENCES `user` (`UID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `matchhist000002_ibfk_11` FOREIGN KEY (`t2p4`) REFERENCES `user` (`UID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `matchhist000002_ibfk_12` FOREIGN KEY (`t2p5`) REFERENCES `user` (`UID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `matchhist000002_ibfk_13` FOREIGN KEY (`t2p6`) REFERENCES `user` (`UID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `matchhist000002_ibfk_14` FOREIGN KEY (`team1`) REFERENCES `team` (`TmID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `matchhist000002_ibfk_15` FOREIGN KEY (`team2`) REFERENCES `team` (`TmID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `matchhist000002_ibfk_2` FOREIGN KEY (`t1p1`) REFERENCES `user` (`UID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `matchhist000002_ibfk_3` FOREIGN KEY (`t1p2`) REFERENCES `user` (`UID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `matchhist000002_ibfk_4` FOREIGN KEY (`t1p3`) REFERENCES `user` (`UID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `matchhist000002_ibfk_5` FOREIGN KEY (`t1p4`) REFERENCES `user` (`UID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `matchhist000002_ibfk_6` FOREIGN KEY (`t1p5`) REFERENCES `user` (`UID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `matchhist000002_ibfk_7` FOREIGN KEY (`t1p6`) REFERENCES `user` (`UID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `matchhist000002_ibfk_8` FOREIGN KEY (`t2p1`) REFERENCES `user` (`UID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `matchhist000002_ibfk_9` FOREIGN KEY (`t2p2`) REFERENCES `user` (`UID`) ON UPDATE CASCADE;

--
-- Constraints for table `matchscores000002`
--
ALTER TABLE `matchscores000002`
  ADD CONSTRAINT `matchscores000002_ibfk_1` FOREIGN KEY (`MatchID`) REFERENCES `matchhist000002` (`MID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `matchscores000002_ibfk_2` FOREIGN KEY (`playerID`) REFERENCES `user` (`UID`) ON UPDATE CASCADE;

--
-- Constraints for table `passwords`
--
ALTER TABLE `passwords`
  ADD CONSTRAINT `passwords_ibfk_1` FOREIGN KEY (`UIDno`) REFERENCES `user` (`UID`) ON UPDATE CASCADE;

--
-- Constraints for table `playsfor`
--
ALTER TABLE `playsfor`
  ADD CONSTRAINT `playsfor_ibfk_1` FOREIGN KEY (`TeamID`) REFERENCES `team` (`TmID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `playsfor_ibfk_2` FOREIGN KEY (`PlayerID`) REFERENCES `user` (`UID`) ON UPDATE CASCADE;

--
-- Constraints for table `team`
--
ALTER TABLE `team`
  ADD CONSTRAINT `team_ibfk_1` FOREIGN KEY (`OwnerID`) REFERENCES `user` (`UID`) ON UPDATE CASCADE;

--
-- Constraints for table `tournament`
--
ALTER TABLE `tournament`
  ADD CONSTRAINT `tournament_ibfk_1` FOREIGN KEY (`leagueID`) REFERENCES `league` (`LID`) ON UPDATE CASCADE;

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
