-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 12, 2025 at 05:29 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `amdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `actor`
--

CREATE TABLE `actor` (
  `SSN` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Street` varchar(100) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `StateAb` char(2) DEFAULT NULL,
  `ZipCode` int(11) DEFAULT NULL,
  `Bdate` date DEFAULT NULL,
  `SignDate` date DEFAULT NULL,
  `Sex` char(1) DEFAULT NULL,
  `ARole` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `actor`
--

INSERT INTO `actor` (`SSN`, `Name`, `Street`, `City`, `StateAb`, `ZipCode`, `Bdate`, `SignDate`, `Sex`, `ARole`) VALUES
(111111111, 'Robert Downey Jr.', 'Broadway', 'New York', 'NY', 10001, '1965-04-04', '2023-01-01', 'M', 'Lead'),
(222222222, 'Chris Evans', 'Main St', 'Los Angeles', 'CA', 90001, '1981-06-13', '2023-02-01', 'M', 'Lead'),
(333333333, 'Scarlett Johansson', 'Elm St', 'Atlanta', 'GA', 30301, '1984-11-22', '2023-03-01', 'F', 'Supporting'),
(444444444, 'Mark Ruffalo', 'Park Ave', 'San Francisco', 'CA', 94101, '1967-11-22', '2023-04-01', 'M', 'Supporting'),
(555555555, 'Chris Hemsworth', 'Ocean Dr', 'Miami', 'FL', 33101, '1983-08-11', '2023-05-01', 'M', 'Lead'),
(666666666, 'Jeremy Renner', 'Sunset Blvd', 'Seattle', 'WA', 98101, '1971-01-07', '2023-06-01', 'M', 'Cameo');

-- --------------------------------------------------------

--
-- Table structure for table `acts_in`
--

CREATE TABLE `acts_in` (
  `MovieId` int(11) NOT NULL,
  `ActorSSN` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `acts_in`
--

INSERT INTO `acts_in` (`MovieId`, `ActorSSN`) VALUES
(201, 111111111),
(202, 222222222),
(203, 333333333),
(204, 444444444),
(205, 555555555),
(206, 666666666);

-- --------------------------------------------------------

--
-- Table structure for table `contract`
--

CREATE TABLE `contract` (
  `CtId` int(11) NOT NULL,
  `BuyerName` varchar(100) DEFAULT NULL,
  `Sdate` date DEFAULT NULL,
  `Edate` date DEFAULT NULL,
  `MovieId` int(11) DEFAULT NULL,
  `SPrice` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contract`
--

INSERT INTO `contract` (`CtId`, `BuyerName`, `Sdate`, `Edate`, `MovieId`, `SPrice`) VALUES
(1, 'HBO Max', '2023-07-01', '2024-07-01', 201, 50000000),
(2, 'Disney+', '2023-08-01', '2024-08-01', 202, 60000000),
(3, 'Netflix', '2023-09-01', '2024-09-01', 203, 70000000);

-- --------------------------------------------------------

--
-- Table structure for table `directed_by`
--

CREATE TABLE `directed_by` (
  `MovieId` int(11) NOT NULL,
  `DirectorId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `directed_by`
--

INSERT INTO `directed_by` (`MovieId`, `DirectorId`) VALUES
(201, 1),
(202, 2),
(203, 3);

-- --------------------------------------------------------

--
-- Table structure for table `director`
--

CREATE TABLE `director` (
  `Did` int(11) NOT NULL,
  `Dname` varchar(100) DEFAULT NULL,
  `Dphone` char(12) DEFAULT NULL,
  `Dmail` varchar(100) DEFAULT NULL,
  `Street` varchar(100) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `StateAb` char(2) DEFAULT NULL,
  `ZipCode` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `director`
--

INSERT INTO `director` (`Did`, `Dname`, `Dphone`, `Dmail`, `Street`, `City`, `StateAb`, `ZipCode`) VALUES
(1, 'Christopher Nolan', '123-456-7890', 'nolan@example.com', '123 Elm Street', 'Hollywood', 'CA', 90038),
(2, 'Anthony Russo', '234-567-8901', 'russo@example.com', '456 Maple Ave', 'Beverly Hills', 'CA', 90210),
(3, 'Greta Gerwig', '345-678-9012', 'gerwig@example.com', '789 Oak Lane', 'Santa Monica', 'CA', 90401);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `FeedbackId` int(11) NOT NULL,
  `ViewerId` int(11) DEFAULT NULL,
  `MovieId` int(11) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Comments` varchar(500) DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL,
  `Reaction` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`FeedbackId`, `ViewerId`, `MovieId`, `Date`, `Comments`, `Rating`, `Reaction`) VALUES
(1, 1, 201, '2023-06-15', 'Great movie!', 9, 'Love'),
(2, 2, 202, '2023-07-20', 'Average', 6, 'Love'),
(3, 3, 203, '2023-08-10', 'Excellent!', 10, 'Love'),
(4, 4, 204, '2023-09-01', 'Not bad', 7, 'Like'),
(5, 5, 205, '2023-10-05', 'Loved it!', 8, 'Like');

-- --------------------------------------------------------

--
-- Table structure for table `invested_by`
--

CREATE TABLE `invested_by` (
  `MovieId` int(11) NOT NULL,
  `ProductionHouseId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invested_by`
--

INSERT INTO `invested_by` (`MovieId`, `ProductionHouseId`) VALUES
(201, 1),
(202, 2),
(203, 3),
(204, 1),
(205, 2),
(206, 3);

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `MovieId` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `TagLine` varchar(500) DEFAULT NULL,
  `Genre` varchar(100) DEFAULT NULL,
  `Languages` varchar(100) DEFAULT NULL,
  `Category` varchar(100) DEFAULT NULL,
  `Rdate` date DEFAULT NULL,
  `Writer` varchar(100) DEFAULT NULL,
  `TotalCost` decimal(10,0) DEFAULT NULL,
  `Platform` varchar(100) DEFAULT NULL,
  `AvgRating` decimal(3,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`MovieId`, `Name`, `TagLine`, `Genre`, `Languages`, `Category`, `Rdate`, `Writer`, `TotalCost`, `Platform`, `AvgRating`) VALUES
(201, 'Inception', 'Your mind is the scene of the crime', 'Sci-Fi', 'English', 'Feature', '2023-07-21', 'Christopher Nolan', 160000000, 'HBO Max', 8.8),
(202, 'Avengers: Endgame', 'Part of the journey is the end', 'Action', 'English', 'Feature', '2019-04-26', 'Christopher Markus', 356000000, 'Disney+', 8.4),
(203, 'Oppenheimer', 'The story of the father of the atomic bomb', 'Drama', 'English', 'Feature', '2023-07-21', 'Christopher Nolan', 100000000, 'HBO Max', 8.6),
(204, 'Dune Part 2', 'Beyond fear, destiny awaits', 'Sci-Fi', 'English', 'Feature', '2023-11-03', 'Frank Herbert', 200000000, 'Amazon Prime', 8.2),
(205, 'Barbie', 'She’s everything. He’s just Ken.', 'Comedy', 'English', 'Feature', '2023-07-21', 'Greta Gerwig', 145000000, 'Netflix', 7.4),
(206, 'The Marvels', 'Higher. Further. Faster. Together.', 'Action', 'English', 'Feature', '2023-11-10', 'Nia DaCosta', 275000000, 'Disney+', 6.9);

-- --------------------------------------------------------

--
-- Table structure for table `production_house`
--

CREATE TABLE `production_house` (
  `PId` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `Street` varchar(100) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `StateAB` char(2) DEFAULT NULL,
  `ZipCode` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `production_house`
--

INSERT INTO `production_house` (`PId`, `Name`, `StartDate`, `Street`, `City`, `StateAB`, `ZipCode`) VALUES
(1, 'Warner Bros', '1923-04-04', 'Burbank Blvd', 'Burbank', 'CA', 91505),
(2, 'Marvel Studios', '1993-11-30', 'Park Ave', 'Los Angeles', 'CA', 90067),
(3, 'Universal Pictures', '1912-04-30', 'Hollywood Blvd', 'Hollywood', 'CA', 90028);

-- --------------------------------------------------------

--
-- Table structure for table `sponsor`
--

CREATE TABLE `sponsor` (
  `SponsorshipId` int(11) NOT NULL,
  `SigningDate` date DEFAULT NULL,
  `CompanyName` varchar(100) DEFAULT NULL,
  `Percentage` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sponsor`
--

INSERT INTO `sponsor` (`SponsorshipId`, `SigningDate`, `CompanyName`, `Percentage`) VALUES
(1, '2023-06-01', 'Coca-Cola', 10),
(2, '2023-07-01', 'Samsung', 20),
(3, '2023-08-01', 'Nike', 15);

-- --------------------------------------------------------

--
-- Table structure for table `sponsored_by`
--

CREATE TABLE `sponsored_by` (
  `MovieId` int(11) NOT NULL,
  `SponsorshipId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sponsored_by`
--

INSERT INTO `sponsored_by` (`MovieId`, `SponsorshipId`) VALUES
(201, 1),
(202, 2),
(203, 3);

-- --------------------------------------------------------

--
-- Table structure for table `viewer`
--

CREATE TABLE `viewer` (
  `ViewerId` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Sex` char(1) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `CITY` varchar(100) DEFAULT NULL,
  `StateAb` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `viewer`
--

INSERT INTO `viewer` (`ViewerId`, `Name`, `Sex`, `EMAIL`, `Age`, `CITY`, `StateAb`) VALUES
(1, 'Alice', 'F', 'alice@example.com', 25, 'Los Angeles', 'CA'),
(2, 'Bob', 'M', 'bob@example.com', 34, 'New York', 'NY'),
(3, 'Charlie', 'M', 'charlie@example.com', 29, 'Chicago', 'IL'),
(4, 'Diana', 'F', 'diana@example.com', 21, 'Houston', 'TX'),
(5, 'Eve', 'F', 'eve@example.com', 30, 'Phoenix', 'AZ');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`SSN`);

--
-- Indexes for table `acts_in`
--
ALTER TABLE `acts_in`
  ADD PRIMARY KEY (`MovieId`,`ActorSSN`),
  ADD KEY `ActorSSN` (`ActorSSN`);

--
-- Indexes for table `contract`
--
ALTER TABLE `contract`
  ADD PRIMARY KEY (`CtId`),
  ADD KEY `MovieId` (`MovieId`);

--
-- Indexes for table `directed_by`
--
ALTER TABLE `directed_by`
  ADD PRIMARY KEY (`MovieId`,`DirectorId`),
  ADD KEY `DirectorId` (`DirectorId`);

--
-- Indexes for table `director`
--
ALTER TABLE `director`
  ADD PRIMARY KEY (`Did`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`FeedbackId`),
  ADD KEY `ViewerId` (`ViewerId`),
  ADD KEY `MovieId` (`MovieId`);

--
-- Indexes for table `invested_by`
--
ALTER TABLE `invested_by`
  ADD PRIMARY KEY (`MovieId`,`ProductionHouseId`),
  ADD KEY `ProductionHouseId` (`ProductionHouseId`);

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`MovieId`);

--
-- Indexes for table `production_house`
--
ALTER TABLE `production_house`
  ADD PRIMARY KEY (`PId`);

--
-- Indexes for table `sponsor`
--
ALTER TABLE `sponsor`
  ADD PRIMARY KEY (`SponsorshipId`);

--
-- Indexes for table `sponsored_by`
--
ALTER TABLE `sponsored_by`
  ADD PRIMARY KEY (`MovieId`,`SponsorshipId`),
  ADD KEY `SponsorshipId` (`SponsorshipId`);

--
-- Indexes for table `viewer`
--
ALTER TABLE `viewer`
  ADD PRIMARY KEY (`ViewerId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `acts_in`
--
ALTER TABLE `acts_in`
  ADD CONSTRAINT `acts_in_ibfk_1` FOREIGN KEY (`MovieId`) REFERENCES `movie` (`MovieId`),
  ADD CONSTRAINT `acts_in_ibfk_2` FOREIGN KEY (`ActorSSN`) REFERENCES `actor` (`SSN`);

--
-- Constraints for table `contract`
--
ALTER TABLE `contract`
  ADD CONSTRAINT `contract_ibfk_1` FOREIGN KEY (`MovieId`) REFERENCES `movie` (`MovieId`);

--
-- Constraints for table `directed_by`
--
ALTER TABLE `directed_by`
  ADD CONSTRAINT `directed_by_ibfk_1` FOREIGN KEY (`MovieId`) REFERENCES `movie` (`MovieId`),
  ADD CONSTRAINT `directed_by_ibfk_2` FOREIGN KEY (`DirectorId`) REFERENCES `director` (`Did`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`ViewerId`) REFERENCES `viewer` (`ViewerId`),
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`MovieId`) REFERENCES `movie` (`MovieId`);

--
-- Constraints for table `invested_by`
--
ALTER TABLE `invested_by`
  ADD CONSTRAINT `invested_by_ibfk_1` FOREIGN KEY (`MovieId`) REFERENCES `movie` (`MovieId`),
  ADD CONSTRAINT `invested_by_ibfk_2` FOREIGN KEY (`ProductionHouseId`) REFERENCES `production_house` (`PId`);

--
-- Constraints for table `sponsored_by`
--
ALTER TABLE `sponsored_by`
  ADD CONSTRAINT `sponsored_by_ibfk_1` FOREIGN KEY (`MovieId`) REFERENCES `movie` (`MovieId`),
  ADD CONSTRAINT `sponsored_by_ibfk_2` FOREIGN KEY (`SponsorshipId`) REFERENCES `sponsor` (`SponsorshipId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
