-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:5050
-- Generation Time: Jan 20, 2022 at 02:04 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sampledb`
--

-- --------------------------------------------------------

--
-- Table structure for table `all_address`
--

CREATE TABLE `all_address` (
  `address_id` int(50) NOT NULL,
  `u_id` int(50) NOT NULL,
  `postal_code` int(10) NOT NULL,
  `house_number` int(11) NOT NULL,
  `street_name` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(50) NOT NULL,
  `c_id` int(50) NOT NULL,
  `c_FirstName` varchar(255) NOT NULL,
  `c_LastName` varchar(255) NOT NULL,
  `c_phoneNo` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer_current_service_req`
--

CREATE TABLE `customer_current_service_req` (
  `current_service_id` int(50) NOT NULL,
  `service_id` int(50) NOT NULL,
  `customer_id` int(50) NOT NULL,
  `sp_id` int(50) NOT NULL,
  `service_date` date NOT NULL,
  `payment` int(10) NOT NULL,
  `distance` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer_favourite_sp`
--

CREATE TABLE `customer_favourite_sp` (
  `fav_sp_id` int(50) NOT NULL,
  `sp_id` int(50) NOT NULL,
  `customer_id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer_service_history`
--

CREATE TABLE `customer_service_history` (
  `service_id` int(50) NOT NULL,
  `customer_id` int(50) NOT NULL,
  `service_date` date NOT NULL,
  `sp_id` int(50) NOT NULL,
  `payment` int(10) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `new_address_customer`
--

CREATE TABLE `new_address_customer` (
  `address_id` int(50) NOT NULL,
  `customer_id` int(50) NOT NULL,
  `postal_code` int(10) NOT NULL,
  `house_no` int(10) NOT NULL,
  `street_name` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `phone_number` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `service_provider`
--

CREATE TABLE `service_provider` (
  `sp_id` int(50) NOT NULL,
  `sp_FirstName` varchar(255) NOT NULL,
  `sp_LastName` varchar(255) NOT NULL,
  `sp_phoneNo` int(10) NOT NULL,
  `sp_gender` varchar(20) DEFAULT NULL,
  `sp_avatar` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sp_block_customer`
--

CREATE TABLE `sp_block_customer` (
  `block_id` int(50) NOT NULL,
  `sp_id` int(50) NOT NULL,
  `customer_id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sp_new_service_req`
--

CREATE TABLE `sp_new_service_req` (
  `service_id` int(50) NOT NULL,
  `s_date` date NOT NULL,
  `customer_id` int(50) NOT NULL,
  `payment_amount` int(20) NOT NULL,
  `service_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sp_ratings`
--

CREATE TABLE `sp_ratings` (
  `rating_id` int(50) NOT NULL,
  `sp_id` int(50) NOT NULL,
  `customer_id` int(50) NOT NULL,
  `ontime_rating` int(10) NOT NULL,
  `qualityOfService_rating` int(10) NOT NULL,
  `friendly_rating` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sp_upcoming_service_req`
--

CREATE TABLE `sp_upcoming_service_req` (
  `upcoming_s_id` int(50) NOT NULL,
  `service_id` int(50) NOT NULL,
  `sp_id` int(50) NOT NULL,
  `distance` int(20) NOT NULL,
  `service_status` tinyint(1) NOT NULL,
  `payment_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(50) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `pass` varchar(255) NOT NULL,
  `user_type` varchar(255) NOT NULL,
  `reg_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `all_address`
--
ALTER TABLE `all_address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `u_id` (`u_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `c_id` (`c_id`);

--
-- Indexes for table `customer_current_service_req`
--
ALTER TABLE `customer_current_service_req`
  ADD PRIMARY KEY (`current_service_id`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `sp_id` (`sp_id`);

--
-- Indexes for table `customer_favourite_sp`
--
ALTER TABLE `customer_favourite_sp`
  ADD PRIMARY KEY (`fav_sp_id`),
  ADD KEY `sp_id` (`sp_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `customer_service_history`
--
ALTER TABLE `customer_service_history`
  ADD PRIMARY KEY (`service_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `sp_id` (`sp_id`);

--
-- Indexes for table `new_address_customer`
--
ALTER TABLE `new_address_customer`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `service_provider`
--
ALTER TABLE `service_provider`
  ADD PRIMARY KEY (`sp_id`);

--
-- Indexes for table `sp_block_customer`
--
ALTER TABLE `sp_block_customer`
  ADD PRIMARY KEY (`block_id`),
  ADD KEY `sp_id` (`sp_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `sp_new_service_req`
--
ALTER TABLE `sp_new_service_req`
  ADD PRIMARY KEY (`service_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `sp_ratings`
--
ALTER TABLE `sp_ratings`
  ADD PRIMARY KEY (`rating_id`),
  ADD KEY `sp_id` (`sp_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `sp_upcoming_service_req`
--
ALTER TABLE `sp_upcoming_service_req`
  ADD PRIMARY KEY (`upcoming_s_id`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `sp_id` (`sp_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `all_address`
--
ALTER TABLE `all_address`
  MODIFY `address_id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_current_service_req`
--
ALTER TABLE `customer_current_service_req`
  MODIFY `current_service_id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_favourite_sp`
--
ALTER TABLE `customer_favourite_sp`
  MODIFY `fav_sp_id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_service_history`
--
ALTER TABLE `customer_service_history`
  MODIFY `service_id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `new_address_customer`
--
ALTER TABLE `new_address_customer`
  MODIFY `address_id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_provider`
--
ALTER TABLE `service_provider`
  MODIFY `sp_id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_block_customer`
--
ALTER TABLE `sp_block_customer`
  MODIFY `block_id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_new_service_req`
--
ALTER TABLE `sp_new_service_req`
  MODIFY `service_id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_ratings`
--
ALTER TABLE `sp_ratings`
  MODIFY `rating_id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_upcoming_service_req`
--
ALTER TABLE `sp_upcoming_service_req`
  MODIFY `upcoming_s_id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(50) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `all_address`
--
ALTER TABLE `all_address`
  ADD CONSTRAINT `all_address_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `customer_current_service_req`
--
ALTER TABLE `customer_current_service_req`
  ADD CONSTRAINT `customer_current_service_req_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `customer_service_history` (`service_id`),
  ADD CONSTRAINT `customer_current_service_req_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `customer_current_service_req_ibfk_3` FOREIGN KEY (`sp_id`) REFERENCES `service_provider` (`sp_id`);

--
-- Constraints for table `customer_favourite_sp`
--
ALTER TABLE `customer_favourite_sp`
  ADD CONSTRAINT `customer_favourite_sp_ibfk_1` FOREIGN KEY (`sp_id`) REFERENCES `service_provider` (`sp_id`),
  ADD CONSTRAINT `customer_favourite_sp_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `customer_service_history`
--
ALTER TABLE `customer_service_history`
  ADD CONSTRAINT `customer_service_history_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `customer_service_history_ibfk_2` FOREIGN KEY (`sp_id`) REFERENCES `service_provider` (`sp_id`);

--
-- Constraints for table `new_address_customer`
--
ALTER TABLE `new_address_customer`
  ADD CONSTRAINT `new_address_customer_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `sp_block_customer`
--
ALTER TABLE `sp_block_customer`
  ADD CONSTRAINT `sp_block_customer_ibfk_1` FOREIGN KEY (`sp_id`) REFERENCES `service_provider` (`sp_id`),
  ADD CONSTRAINT `sp_block_customer_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `sp_new_service_req`
--
ALTER TABLE `sp_new_service_req`
  ADD CONSTRAINT `sp_new_service_req_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `sp_ratings`
--
ALTER TABLE `sp_ratings`
  ADD CONSTRAINT `sp_ratings_ibfk_1` FOREIGN KEY (`sp_id`) REFERENCES `service_provider` (`sp_id`),
  ADD CONSTRAINT `sp_ratings_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `sp_upcoming_service_req`
--
ALTER TABLE `sp_upcoming_service_req`
  ADD CONSTRAINT `sp_upcoming_service_req_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `sp_new_service_req` (`service_id`),
  ADD CONSTRAINT `sp_upcoming_service_req_ibfk_2` FOREIGN KEY (`sp_id`) REFERENCES `service_provider` (`sp_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
