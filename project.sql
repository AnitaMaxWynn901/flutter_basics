-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 28, 2025 at 05:36 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `book_id` smallint(10) UNSIGNED NOT NULL,
  `book_name` varchar(40) NOT NULL,
  `category` enum('Sci-fi','Academic','Fantasy','Horror') NOT NULL,
  `status` enum('borrowed','pending','available','disabled') NOT NULL,
  `book_details` varchar(60) NOT NULL,
  `book_image` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`book_id`, `book_name`, `category`, `status`, `book_details`, `book_image`) VALUES
(1, 'Harry Potter 1', 'Sci-fi', 'pending', 'Harry Potter and The Philosopher\'s Stone', 'harrypotter1.jpg'),
(2, 'Harry Potter 2', 'Sci-fi', 'borrowed', 'Harry Potter and the Chamber of Secrets', 'harrypotter2.jpg'),
(3, 'Harry Potter 3', 'Sci-fi', 'available', 'Harry Potter and the Prisoner of Azkaban', 'harrypotter3.jpg'),
(4, 'Harry Potter 4', 'Sci-fi', 'pending', 'Harry Potter and the Goblets of Fire', 'harrypotter4.jpg'),
(5, 'Harry Potter 5', 'Sci-fi', 'pending', 'Harry Potter and the Orders of the Phoenix', 'harrypotter5.jpg'),
(6, 'Harry Potter 6', 'Sci-fi', 'disabled', 'Harry Potter and the Half-blood Prince', 'harrypotter6.jpg'),
(7, 'Harry Potter 7', 'Sci-fi', 'available', 'Harry Potter and the Deathly Hallows', 'harrypotter7.jpg'),
(8, 'Harry Potter 8', 'Sci-fi', 'available', 'Harry Potter and xxxxxx', 'harrypotter8.jpg'),
(9, 'Harry Potter 8', 'Sci-fi', 'available', 'Harry Potter and xxxxxx', 'harrypotter8.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `history_id` smallint(10) UNSIGNED NOT NULL,
  `book_id` smallint(10) UNSIGNED NOT NULL,
  `borrower_id` smallint(10) UNSIGNED NOT NULL,
  `staff_id` smallint(10) UNSIGNED DEFAULT NULL,
  `approver_id` smallint(10) UNSIGNED DEFAULT NULL,
  `borrow_date` date NOT NULL,
  `approve_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`history_id`, `book_id`, `borrower_id`, `staff_id`, `approver_id`, `borrow_date`, `approve_date`, `return_date`) VALUES
(1, 1, 1, NULL, NULL, '2024-11-01', NULL, NULL),
(2, 2, 2, NULL, 5, '2024-11-02', '2024-11-02', NULL),
(3, 3, 6, 4, 5, '2024-11-01', '2024-11-02', '2024-11-03'),
(4, 4, 2, NULL, NULL, '2024-11-04', NULL, NULL),
(5, 5, 6, NULL, NULL, '2024-11-04', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` smallint(10) UNSIGNED NOT NULL,
  `name` varchar(40) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(255) NOT NULL,
  `Phone Number` int(40) DEFAULT NULL,
  `role` enum('borrower','staff','lender') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `Phone Number`, `role`) VALUES
(1, 'Jesse Pinkman', 'User', '$2b$10$vMadhHXIqZTk/w3YTphKpeu0PFz1XFv0rkbqixYQ5VpT1KQCzoL2m', NULL, 'borrower'),
(2, 'Walter White', 'User1', '$2b$10$vMadhHXIqZTk/w3YTphKpeu0PFz1XFv0rkbqixYQ5VpT1KQCzoL2m', NULL, 'borrower'),
(3, 'John Smith', 'Staff', '$2b$10$y3zX1JIJrOwopss10RNIBO28hY41vLet1T6LdNu1.xLaxSdPt45fy', NULL, 'staff'),
(4, 'Jennie', 'Staff1', '$2b$10$T6sUFfWAb.qPgmZ7oRBtT.FYqKfAqfteQwRQUw88tpUdYvJViRKaW', NULL, 'staff'),
(5, 'Momo', 'Lender', '$2b$10$wYKXpGaBmhTr4FePdo8Gf.xIgFYGpgebaNd2faCVC82Uv/qJ.3EXq', NULL, 'lender'),
(6, 'abcd', 'User2', '$2b$10$VFChVjXtu.cWFZcUsC0DN.HjtmYZvrREsxAORILcM4reRQsiQeXVO', NULL, 'borrower'),
(7, 'afshj', 'User3', '$2b$10$NjIz0KdmNFCt76s09ZUCh.TH/r5n4r/C1eNGcOchGvUoh.0xEp/Uu', NULL, 'borrower');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`history_id`),
  ADD KEY `approver_id` (`approver_id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `borrower_id` (`borrower_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `book_id` smallint(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `history_id` smallint(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` smallint(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`approver_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `history_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`),
  ADD CONSTRAINT `history_ibfk_3` FOREIGN KEY (`borrower_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `history_ibfk_4` FOREIGN KEY (`staff_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
