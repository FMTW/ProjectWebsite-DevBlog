-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 28, 2019 at 02:36 PM
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
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `account_id` binary(11) NOT NULL,
  `username` varchar(16) CHARACTER SET utf8 NOT NULL,
  `email` varchar(256) CHARACTER SET utf8 NOT NULL,
  `password` varchar(256) CHARACTER SET utf8 NOT NULL,
  `github_link` int(11) DEFAULT NULL,
  `youtube_link` int(11) DEFAULT NULL,
  `patreon_link` int(11) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `accessed` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`account_id`, `username`, `email`, `password`, `github_link`, `youtube_link`, `patreon_link`, `created`, `accessed`) VALUES
(0x069ed4d52484f83620d610, 'username', 'email@email.com', '$2y$10$kG1Dqk0smdnNCjRghk6E7eZROgBUCST/ciQe8y0njzb8wCfpAysem', NULL, NULL, NULL, '2019-09-25 03:18:13', '2019-09-25 03:18:13'),
(0x2a7ea395ad2acee33f642f, 'Suibianla', 'suibianla@suibianla.com', '$2y$10$rJ4WsOOwao3ATC56rexovuW1K0ZlM1wWeNtxjacwqeEf0dw0heZTu', NULL, NULL, NULL, '2019-09-25 04:57:46', '2019-09-25 04:57:46'),
(0x5a6dc424d700b645da2f7c, 'FMT_WL', 'norris.wu@outlook.com', '$2y$10$xgpcveM6tXsk8Aaju.GK4uaMdgmgkEypJavvQFITpq0csr55vn6Re', NULL, NULL, NULL, '2019-09-25 04:57:10', '2019-09-25 04:57:10'),
(0xf510600c64849dfc83af4f, 'Unity3D', 'admin@unity3d.com', '$2y$10$iJaH.FfTP93fBqMvXv3jqehxgFgxQDvKgagZ2OUY6bcLUDG78wNeW', NULL, NULL, NULL, '2019-09-25 04:57:29', '2019-09-25 04:57:29');

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `article_id` int(11) NOT NULL,
  `account_id` binary(11) NOT NULL,
  `article_title` text CHARACTER SET utf8 NOT NULL,
  `article_text_content` text CHARACTER SET utf8 NOT NULL,
  `created` timestamp(5) NOT NULL DEFAULT current_timestamp(5) ON UPDATE current_timestamp(5)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`article_id`, `account_id`, `article_title`, `article_text_content`, `created`) VALUES
(1, 0x2a7ea395ad2acee33f642f, 'This is an article about what lorem ipsum is like', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut morbi tincidunt augue interdum velit euismod in pellentesque massa. Tincidunt augue interdum velit euismod in pellentesque. Platea dictumst quisque sagittis purus sit amet. Ipsum faucibus vitae aliquet nec. Auctor urna nunc id cursus metus. Posuere ac ut consequat semper viverra nam. Turpis egestas sed tempus urna et pharetra pharetra. Diam phasellus vestibulum lorem sed risus. Adipiscing elit ut aliquam purus sit amet.', '2019-09-25 04:59:33.98788'),
(2, 0xf510600c64849dfc83af4f, 'cras sed felis eget velit aliquet', 'turpis massa sed elementum tempus egestas sed sed risus pretium quam vulputate dignissim suspendisse in est ante in nibh mauris cursus mattis molestie a iaculis at erat pellentesque adipiscing commodo elit at imperdiet dui accumsan sit amet nulla facilisi morbi tempus iaculis urna id volutpat lacus laoreet non curabitur gravida arcu ac tortor dignissim convallis aenean et tortor at risus viverra adipiscing at in tellus integer feugiat scelerisque varius morbi', '2019-09-25 04:59:34.00963'),
(3, 0x2a7ea395ad2acee33f642f, 'id leo in vitae turpis massa', 'vulputate odio ut enim blandit volutpat maecenas volutpat blandit aliquam etiam erat velit scelerisque in dictum non consectetur a erat nam at lectus urna duis convallis convallis tellus id interdum velit laoreet id donec ultrices tincidunt arcu non sodales neque sodales ut etiam sit amet nisl purus in mollis nunc', '2019-09-25 04:59:34.01434'),
(4, 0xf510600c64849dfc83af4f, 'odio pellentesque diam volutpat commodo sed', 'a arcu cursus vitae congue mauris rhoncus aenean vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas maecenas pharetra convallis posuere morbi leo urna molestie at elementum eu facilisis sed odio morbi quis commodo odio aenean sed adipiscing diam donec', '2019-09-25 04:59:34.02255'),
(5, 0x2a7ea395ad2acee33f642f, 'nunc lobortis mattis aliquam faucibus', 'eu lobortis elementum nibh tellus molestie nunc non blandit massa enim nec dui nunc mattis enim ut tellus elementum sagittis vitae et leo duis ut diam quam nulla porttitor massa id neque aliquam vestibulum morbi blandit cursus risus at ultrices', '2019-09-25 04:59:34.03195'),
(6, 0xf510600c64849dfc83af4f, 'How the Lightweight Render Pipeline is evolving', 'The Lightweight Render Pipeline (LWRP) was designed to be a fast, scalable pipeline enabling high-quality graphics across all mobile devices. Over the last year, this Scriptable Render Pipeline has become production-ready, and we have continued to extend its features, performance, and platform support.\r\n\r\nWe wanted the render pipeline to have broad applications with universal benefits. It is now a powerful solution that delivers beauty and performance while scaling to a wide range of platforms. Whether you’re building 2D, 3D, VR, or AR projects, if you want to develop once and deploy everywhere, this is the rendering technology to use. In 2019.3, the LWRP has evolved into the Universal Render Pipeline. ', '2019-09-25 04:59:34.03740'),
(7, 0x2a7ea395ad2acee33f642f, 'Title7', 'content7', '2019-09-25 04:59:34.04186'),
(8, 0x5a6dc424d700b645da2f7c, 'Title8', 'content8', '2019-09-25 04:59:34.04617'),
(9, 0x5a6dc424d700b645da2f7c, 'Title9', 'content9', '2019-09-25 04:59:34.05095'),
(10, 0x5a6dc424d700b645da2f7c, 'Shaping the world with real-time 3D: Unite Copenhagen keynote highlights', '<h3>Shape the world</h3>\r\n\r\n<p>The revolutionary ways games are powering visual content continues to inspire us. New consoles, streaming distributions, tools, and ideas are changing the landscape when it comes to interactivity, graphical power, and social connectivity. Simply put, game technology and game makers are shaping the world.</p>\r\n\r\n<p>Real-time 3D opens up possibilities for every creator and is unlocking innovations in industries in brand new ways. We\'re already seeing it used in the automotive and transportation industry, as well as architecture and construction. Soon, we\'ll see it used to practice and perform microscopic surgery; engage with with artificial intelligence and train robots; and even influence the design of manufacturing factory floor layouts. It is an incredible time to be a creator - and we\'re so proud to be a part of this journey.</p>\r\n\r\n<p>Over the last few years, we\'ve shown you the astonishing scale and performance you can achieve with our Data-Oriented Tech Stack (DOTS). Our Megacity demo demonstrates that it\'s possible to use DOTS to create a project with more than 4.5 million renders and hundreds of thousands of game objects and audio sources.</p>', '2019-09-25 04:59:34.05656');

-- --------------------------------------------------------

--
-- Table structure for table `article_comment`
--

CREATE TABLE `article_comment` (
  `article_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `article_comment`
--

INSERT INTO `article_comment` (`article_id`, `comment_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(9, 10),
(9, 11),
(10, 12);

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `content` text CHARACTER SET utf8 NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`comment_id`, `account_id`, `content`, `created`) VALUES
(1, 1, 'comment1', '0000-00-00 00:00:00'),
(2, 2, 'comment2', '0000-00-00 00:00:00'),
(3, 1, 'comment3', '0000-00-00 00:00:00'),
(4, 2, 'comment4', '0000-00-00 00:00:00'),
(5, 3, 'comment5', '0000-00-00 00:00:00'),
(6, 4, 'comment6', '0000-00-00 00:00:00'),
(7, 5, 'comment7', '2019-09-04 05:29:25'),
(8, 3, 'comment8', '2019-09-04 05:29:25'),
(9, 3, 'comment9', '2019-09-04 05:29:25'),
(10, 4, 'comment10', '2019-09-04 05:29:25'),
(11, 5, 'comment11', '2019-09-04 05:29:25'),
(12, 3, 'comment12', '2019-09-04 05:29:25');

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `image_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `filename` varchar(256) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`image_id`, `article_id`, `filename`) VALUES
(1, 6, 'article_6_0.png'),
(2, 6, 'article_6_1.jpg'),
(3, 6, 'article_6_2.jpg'),
(4, 6, 'article_6_3.jpg'),
(5, 6, 'article_6_4.png'),
(6, 6, 'article_6_5.png'),
(7, 6, 'article_6_6.jpg'),
(8, 6, 'article_6_7.png'),
(9, 6, 'article_6_8.png'),
(10, 6, 'article_6_9.png');

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE `page` (
  `page_id` int(11) NOT NULL COMMENT 'page id',
  `name` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `menu` varchar(64) NOT NULL,
  `menu_order` int(2) NOT NULL DEFAULT 0,
  `level` int(1) NOT NULL DEFAULT 0,
  `content` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`page_id`, `name`, `url`, `menu`, `menu_order`, `level`, `content`, `active`) VALUES
(1, 'Welcome to our dev blog.', '../index.php', 'Home', 1, 1, 'Welcome to our shop. Buy stuff here.', 1),
(2, 'Log in to your account', 'login.php', 'Login', 2, 0, 'Log in to your account. If you don\'t have an account you can register <a href=\"/register\">Here</a>', 1),
(3, 'Register for a free account', 'register.php', 'Register', 3, 0, 'Register for a free account. Already have an account? Log in <a href=\"/login\">here</a>', 1),
(4, 'Your Account Details', 'account.php', 'Account', 4, 2, 'Your account details.', 1),
(5, 'Log out of your account', 'logout.php', 'Logout', 6, 2, 'Sign out of your account', 1);

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
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`account_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`article_id`);

--
-- Indexes for table `article_comment`
--
ALTER TABLE `article_comment`
  ADD KEY `article_id` (`article_id`),
  ADD KEY `comment_id` (`comment_id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `comment_ibfk_1` (`account_id`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`image_id`);

--
-- Indexes for table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`video_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'page id', AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `article_comment`
--
ALTER TABLE `article_comment`
  ADD CONSTRAINT `article_comment_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`),
  ADD CONSTRAINT `article_comment_ibfk_2` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`comment_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
