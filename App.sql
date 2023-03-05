-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 05, 2023 at 06:18 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `App`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_setting`
--

CREATE TABLE `app_setting` (
  `id` int(11) NOT NULL,
  `app_name` varchar(255) DEFAULT NULL,
  `client_id` text DEFAULT NULL,
  `secret_id` text DEFAULT NULL,
  `shop` text NOT NULL,
  `scope` text DEFAULT NULL,
  `redirect_url` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `app_setting`
--

INSERT INTO `app_setting` (`id`, `app_name`, `client_id`, `secret_id`, `shop`, `scope`, `redirect_url`) VALUES
(1, 'test-app-4584', 'ab82efef3ed3c96b92b4db9bf576a544', '5466241c714b95cb7ffd028361e6e813', 'brijesh-singh1.myshopify.com', 'read_orders,write_products', 'http://localhost/test-app/generate_token.php');

-- --------------------------------------------------------

--
-- Table structure for table `user_setting`
--

CREATE TABLE `user_setting` (
  `id` int(11) NOT NULL,
  `hmac` text DEFAULT NULL,
  `host` text DEFAULT NULL,
  `shop` text NOT NULL,
  `code` text NOT NULL,
  `access_token` text DEFAULT NULL,
  `payment_status` int(11) DEFAULT NULL,
  `charge_id` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_setting`
--

INSERT INTO `user_setting` (`id`, `hmac`, `host`, `shop`, `code`, `access_token`, `payment_status`, `charge_id`) VALUES
(1, '932546193bc991c339559e9d6b597e48433bf9bd7e7eb773d9bb80fd843681fd', 'YWRtaW4uc2hvcGlmeS5jb20vc3RvcmUvYnJpamVzaC1zaW5naDE', 'brijesh-singh1.myshopify.com', '43ea075a8fd5d2ce75300f5a4b7af5c3', 'shpua_93b68e0454a62c6b1c9db484d3d0fff5', 2, '28660039977');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_setting`
--
ALTER TABLE `app_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_setting`
--
ALTER TABLE `user_setting`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_setting`
--
ALTER TABLE `app_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_setting`
--
ALTER TABLE `user_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
