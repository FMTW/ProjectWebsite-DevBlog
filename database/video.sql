-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 25, 2019 at 09:30 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dev_blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE `video` (
  `video_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `url` varchar(256) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `video`
--

INSERT INTO `video` (`video_id`, `article_id`, `url`) VALUES
(1, 1, 'https://www.youtube.com/watch?v=j48LtUkZRjU'),
(2, 2, 'https://www.youtube.com/watch?v=G9Otw12OUvE'),
(3, 3, 'https://www.youtube.com/watch?v=wwm98VdzD8s'),
(4, 4, 'https://www.youtube.com/watch?v=_LaVvGlkBDs'),
(5, 5, 'https://www.youtube.com/watch?v=LNLVOjbrQj4'),
(6, 6, 'https://www.youtube.com/watch?v=DInV-jHm9rk'),
(7, 7, 'https://www.youtube.com/watch?v=0deXRHX9C08'),
(8, 8, 'https://www.youtube.com/watch?v=MWQv2Bagwgk'),
(9, 9, 'https://www.youtube.com/watch?v=jvtFUfJ6CP8'),
(10, 10, 'https://www.youtube.com/embed/r2UpIpBS_-s');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`video_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
