-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 09, 2018 at 10:29 AM
-- Server version: 5.6.21
-- PHP Version: 5.5.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `section_b`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE IF NOT EXISTS `contacts` (
`contact_id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `phone_number` varchar(40) NOT NULL,
  `address` varchar(40) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'user id from user table'
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`contact_id`, `name`, `phone_number`, `address`, `user_id`) VALUES
(1, 'Oleta Level', '+442032960159', '10 London Wall, London EC2M 6SA, UK', 1),
(2, 'Maida Harju', '+442032960899', 'Woodside House, 94 Tockholes Rd, Darwen ', 2),
(3, 'Lia Pigford', '+442032960182', '23 Westmorland Cl, Darwen BB3 2TQ, UK', 3),
(4, 'Ghislaine Darden', '+442032960427', '20-24 Knowlesly Rd, Darwen BB3 2NE, UK', 4),
(5, 'Jana Spitler', '+442032960370', '4 St Lucia Cl, Darwen BB3 0SJ, UK', 5),
(6, 'Dolly Detweiler', '+442032960977', '18 Johnson Rd, Darwen BB3, UK', 6),
(7, 'Stanley Vanderhoof', '+442032960000', '17 Anchor Ave, Darwen BB3 0AZ, UK', 7),
(8, 'Adan Milian', '+442032960011', '20 Ellerbeck Rd, Darwen BB3 3EX, UK', 8),
(9, 'Marivel Molina', '+442032960013', 'Tockholes Rd, Darwen BB3, UK', 9),
(10, 'Kris Everett', '+442032960012', 'Pinewood, Tockholes Rd, Darwen BB3 1JY, ', 10);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`user_id` int(11) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`) VALUES
(1, '+442032960159', 'password'),
(2, '+442032960899', 'password'),
(3, '+442032960182', 'password'),
(4, '+442032960427', 'password'),
(5, '+442032960370', 'password'),
(6, '+442032960977', 'password'),
(7, '+442032960000', 'password'),
(8, '+442032960011', 'password'),
(9, '+442032960013', 'password'),
(10, '+442032960012', 'password');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
 ADD PRIMARY KEY (`contact_id`), ADD UNIQUE KEY `contact_id` (`contact_id`), ADD UNIQUE KEY `phone_number` (`phone_number`), ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`user_id`), ADD UNIQUE KEY `user_id` (`user_id`), ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
ADD CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
