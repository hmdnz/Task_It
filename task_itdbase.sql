-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 13, 2022 at 07:31 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `task_itdbase`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `comment` (IN `task_id` INT(100), IN `in_user_id` INT(100), IN `in_title` VARCHAR(100), IN `in_description` VARCHAR(100), IN `query_type` VARCHAR(100))  BEGIN
if query_type = 'insert' THEN INSERT INTO comment (task_id,user_id,title,description)
VALUES(in_task_id,in_user_id,in_title,in_description);

ELSEIF query_type = 'select' THEN SELECT * FROM comment;
END IF ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `project_procedure` (IN `in_id` INT(100), IN `in_title` VARCHAR(100), IN `in_description` VARCHAR(200), IN `in_created_by` VARCHAR(100), IN `in_created_at` TIMESTAMP, IN `in_expected_end` VARCHAR(100), IN `in_manager` VARCHAR(50), IN `in_status` VARCHAR(50), IN `in_approved_by` VARCHAR(50), IN `in_approved_at` TIMESTAMP, IN `query_type` VARCHAR(50))  BEGIN
IF query_type = 'insert' THEN INSERT INTO project(
id,title,description,created_by,created_at,expected_end,manager,status,approved_by,approved_at)
VALUES(
in_id,in_title,in_description,in_created_by,in_created_at,in_expected_end,in_manager,in_status,in_approved_by,in_approved_at);
ELSEIF query_type = 'select' THEN SELECT * FROM project;
ELSEIF query_type = 'update' THEN UPDATE `project` SET `title`=in_title,`description`=in_description,`created_by`=in_created_by,`created_at`=in_created_at,`expected_end`=in_expected_end,`manager`=in_manager,
`status`=in_status,`approved_by`=in_approved_by,`approved_at`=in_approved_at
WHERE id=in_id;
ELSEIF query_type = 'delete' THEN DELETE FROM project WHERE id=in_id;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `task` (IN `in_id` INT(100), IN `in_title` INT(100), IN `in_project` VARCHAR(100), IN `in_description` VARCHAR(100), IN `in_assigned_to` VARCHAR(100), IN `in_created_at` TIMESTAMP, IN `in_assigned_at` TIMESTAMP, IN `in_created_by` VARCHAR(300), IN `in_other_instructions` VARCHAR(200), IN `in_features_expectation` VARCHAR(50), IN `in_status` VARCHAR(50), IN `query_type` VARCHAR(50))  BEGIN

IF query_type = 'insert' THEN INSERT INTO task(id,title,project,description,assigned_to,created_at,assigned_at,created_by,other_instructions,features_expectation,status)
VALUES(in_id,in_title,in_project,in_description,in_assigned_to,in_created_at,in_assigned_at,in_created_by,in_other_instructions,in_features_expectation,in_status);

ELSEIF query_type = 'select' THEN SELECT * FROM task;
ELSEIF query_type = 'delete' THEN DELETE FROM task WHERE id=in_id;
ELSEIF query_type = 'update' THEN UPDATE `task` SET `id`=in_id,`title`=in_title,`project`=in_project,`description`=in_description,`assigned_to`=in_assigned_to,`created_at`=in_created_at,`assigned_at`=in_assigned_at,
`created_by`=in_created_by,`other_instructions`=in_other_instructions,`features_expectation`=in_features_expectation,`status`=in_status WHERE id=in_id;

END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `user` (IN `in_id` INT(100), IN `in_username` VARCHAR(100), IN `in_fullname` VARCHAR(100), IN `in_role` VARCHAR(100), IN `in_password` VARCHAR(100), IN `in_created_at` TIMESTAMP, IN `in_privilege` VARCHAR(50), IN `query_type` VARCHAR(50))  BEGIN
IF query_type = 'insert' THEN INSERT INTO user (id,username,fullname,role,password,created_at,privilege)
VALUES(in_id,in_username,in_fullname,in_role,in_password,in_created_at,in_privilege);

ELSEIF query_type = 'select' THEN SELECT * from user;
ELSEIF query_type = 'delete' THEN DELETE FROM user WHERE id=in_id;
END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `task_id` varchar(11) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `expected_end` varchar(100) NOT NULL,
  `manager` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `approved_by` varchar(50) NOT NULL,
  `approved_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `project` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `assigned_to` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `assigned_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` varchar(100) NOT NULL,
  `other_instructions` varchar(300) NOT NULL,
  `features_expectation` varchar(200) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `task_tracker`
--

CREATE TABLE `task_tracker` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `role` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `privilege` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task_tracker`
--
ALTER TABLE `task_tracker`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_tracker`
--
ALTER TABLE `task_tracker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
