-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2018 at 01:04 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uguide`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `id` int(11) NOT NULL,
  `trip_id` int(11) NOT NULL,
  `sender_type` tinyint(1) NOT NULL,
  `title` varchar(20) NOT NULL,
  `content` text NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `id` int(11) NOT NULL,
  `trip_id` int(11) NOT NULL,
  `value` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`id`, `trip_id`, `value`) VALUES
(10, 11, 'Ticket');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `trip_id` int(11) NOT NULL,
  `date_paid` date DEFAULT NULL,
  `date_expired` date NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `proof` mediumblob,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id`, `trip_id`, `date_paid`, `date_expired`, `amount`, `proof`, `status`) VALUES
(3, 11, NULL, '2019-01-02', NULL, NULL, 'PENDING');

-- --------------------------------------------------------

--
-- Table structure for table `trip`
--

CREATE TABLE `trip` (
  `id` int(11) NOT NULL,
  `guide_id` int(11) DEFAULT NULL,
  `tourist_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(256) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `date` date NOT NULL,
  `min_budget` int(11) NOT NULL,
  `max_budget` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `destination` varchar(50) NOT NULL,
  `person` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `trip`
--

INSERT INTO `trip` (`id`, `guide_id`, `tourist_id`, `title`, `description`, `status`, `date`, `min_budget`, `max_budget`, `duration`, `destination`, `person`) VALUES
(11, NULL, 1, 'asdasd', 'sad', 1, '2018-12-31', 11313, 1231231, 12, 'aceh', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `user_type` varchar(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` char(60) NOT NULL,
  `email` varchar(50) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `location` varchar(50) NOT NULL,
  `gender` char(1) NOT NULL,
  `rating` float DEFAULT '0',
  `picture` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `user_type`, `username`, `password`, `email`, `fname`, `lname`, `phone`, `location`, `gender`, `rating`, `picture`) VALUES
(1, 'tourist', 'nvnrdhn', '$2y$15$3Q3fL2zwiYtAcA/B8mhffuQnqf9zc3..6/nmKXv5GA8EBpE0LUjp6', 'novanardhn_@live.com', 'novan', 'ardhana', '081285548731', 'Papua', 'M', 0, 0x6e6e2e6a7067),
(4, 'guide', 'guide1', '$2y$15$pL67TeXCdXBTeLbDrM9sqe3Vd8oePnd5m9hpemS506ktqJVXRlV4a', 'ryo37337@gmail.com', 'novan', 'ardhana', '12345678123', 'Kalsel', 'M', 0, 0x32332e4e4f56414e2e41524448414e415b315d2e4a5047),
(5, 'moderator', 'moderator1', '$2y$15$a6bN3EyETrEmngOp.c475.og8QBk2M3S90HXs9McG/yQxzBpaaLJW', 'momod@uguide.com', 'moder', 'ator', '123456789098', 'Sulsel', 'M', 0, 0x4a656f6e2e536f6d692e66756c6c2e39323039322e6a7067);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_activitytrip` (`trip_id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_servicetrip` (`trip_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_transtrip` (`trip_id`);

--
-- Indexes for table `trip`
--
ALTER TABLE `trip`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tripguide` (`guide_id`),
  ADD KEY `fk_triptourist` (`tourist_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `trip`
--
ALTER TABLE `trip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity`
--
ALTER TABLE `activity`
  ADD CONSTRAINT `fk_activitytrip` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`id`);

--
-- Constraints for table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `fk_servicetrip` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`id`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `fk_transtrip` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`id`);

--
-- Constraints for table `trip`
--
ALTER TABLE `trip`
  ADD CONSTRAINT `fk_tripguide` FOREIGN KEY (`guide_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `fk_triptourist` FOREIGN KEY (`tourist_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
