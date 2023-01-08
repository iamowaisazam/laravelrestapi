-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2023 at 05:34 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apis`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `active` tinyint(4) DEFAULT 0,
  `parent_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `title`, `description`, `active`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'Salary', NULL, 1, 17, '2022-11-06 08:36:55', '2022-11-06 11:44:02'),
(2, 'Rent', NULL, 1, 26, '2022-11-06 08:37:30', '2022-11-06 11:40:47'),
(3, 'Electric Bill', NULL, 1, 27, '2022-11-06 08:38:49', '2022-11-06 11:43:46'),
(4, 'tesw', 'asdasdasd', 1, 26, '2022-11-06 09:37:49', '2022-11-06 09:39:12'),
(5, 'testttt', 'dess', 1, 33, '2022-11-06 11:39:43', '2022-11-30 12:02:20'),
(6, 'Test Account', NULL, 1, 30, '2022-11-06 11:40:43', '2022-11-06 11:40:43'),
(7, 'Mr wahab', 'Gjguh', 1, 26, '2022-11-06 13:59:20', '2022-11-06 13:59:20');

-- --------------------------------------------------------

--
-- Table structure for table `account_categories`
--

CREATE TABLE `account_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `parent_id` bigint(11) UNSIGNED DEFAULT 0,
  `sort` int(11) NOT NULL DEFAULT 0,
  `debit_effect` varchar(50) DEFAULT NULL,
  `credit_effect` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_categories`
--

INSERT INTO `account_categories` (`id`, `title`, `parent_id`, `sort`, `debit_effect`, `credit_effect`, `created_at`, `updated_at`) VALUES
(1, 'Expense', 0, 3, 'increased', 'decreased', '2022-11-06 07:17:14', '2022-11-06 07:17:14'),
(4, 'Assets', 0, 1, 'decreased', 'Increased', '2022-11-06 07:37:43', '2022-11-06 07:37:43'),
(8, 'Liability', 0, 2, 'increased', 'decreased', '2022-11-06 07:51:01', '2022-11-06 07:51:01'),
(15, 'Income', 0, 4, 'decreased', 'increased', '2022-11-06 08:30:54', '2022-11-06 08:30:54'),
(16, 'Equity', 0, 5, 'decreased', 'increased', '2022-11-06 08:31:01', '2022-11-06 08:31:01'),
(17, 'Petty Cash', 4, 0, NULL, NULL, '2022-11-06 12:46:29', '2022-11-06 12:46:29'),
(18, 'Inventory', 4, 0, NULL, NULL, '2022-11-06 12:46:29', '2022-11-06 12:46:29'),
(19, 'Accounts Receivable', 4, 0, NULL, NULL, '2022-11-06 12:46:29', '2022-11-06 12:46:29'),
(20, 'Collected Sales Tax', 8, 0, NULL, NULL, '2022-11-06 12:48:28', '2022-11-06 12:48:28'),
(21, 'Accounts Payable', 8, 0, NULL, NULL, '2022-11-06 12:48:28', '2022-11-06 12:48:28'),
(22, 'Credit Memo', 8, 0, NULL, NULL, '2022-11-06 12:48:28', '2022-11-06 12:48:28'),
(23, 'Income Tax', 8, 0, NULL, NULL, '2022-11-06 12:48:28', '2022-11-06 12:48:28'),
(24, 'Payroll Tax', 8, 0, NULL, NULL, '2022-11-06 12:48:28', '2022-11-06 12:48:28'),
(25, 'Insurance', 1, 0, NULL, NULL, '2022-11-06 12:50:13', '2022-11-06 12:50:13'),
(26, 'Payroll', 1, 0, NULL, NULL, '2022-11-06 12:50:13', '2022-11-06 12:50:13'),
(27, 'Rent', 1, 0, NULL, NULL, '2022-11-06 12:50:13', '2022-11-06 12:50:13'),
(28, 'Electricity Bills', 1, 0, NULL, NULL, '2022-11-06 12:50:13', '2022-11-06 12:50:13'),
(29, 'Gas Bills', 1, 0, NULL, NULL, '2022-11-06 12:50:13', '2022-11-06 12:50:13'),
(30, 'Earned Interest', 15, 0, NULL, NULL, '2022-11-06 12:50:52', '2022-11-06 12:50:52'),
(31, 'Product Sales', 15, 0, NULL, NULL, '2022-11-06 12:50:52', '2022-11-06 12:50:52'),
(32, 'Retained Earnings', 16, 0, NULL, NULL, '2022-11-06 12:52:09', '2022-11-06 12:52:09'),
(33, 'Owner’s Equity', 16, 0, NULL, NULL, '2022-11-06 12:52:09', '2022-11-06 12:52:09'),
(34, 'Common Stock', 16, 0, NULL, NULL, '2022-11-06 12:52:09', '2022-11-06 12:52:09');

-- --------------------------------------------------------

--
-- Table structure for table `app`
--

CREATE TABLE `app` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `slug` varchar(120) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `excerpt` tinytext DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `images` tinytext DEFAULT NULL,
  `ordering` int(11) NOT NULL,
  `featured` tinyint(4) DEFAULT NULL,
  `active` tinyint(4) DEFAULT 0,
  `meta_title` varchar(100) DEFAULT NULL,
  `meta_description` tinytext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `title`, `slug`, `description`, `excerpt`, `image`, `images`, `ordering`, `featured`, `active`, `meta_title`, `meta_description`, `created_at`, `updated_at`) VALUES
(1, 'Oppo', 'oppo', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\n', NULL, 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221202124722.jpg', '27.jpg', 1, 1, 1, NULL, NULL, '2022-09-17 12:52:58', '2022-09-17 12:52:58'),
(3, 'Samsung', 'samsung', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\n', NULL, 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221202124722.jpg', '27.jpg', 1, 1, 1, NULL, NULL, '2022-09-17 12:52:58', '2022-09-17 12:52:58'),
(4, 'Q Mobile', 'q-mobile', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\n', NULL, 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221202124722.jpg', '27.jpg', 1, 1, 1, NULL, NULL, '2022-09-17 12:52:58', '2022-09-17 12:52:58'),
(5, 'Nadeem Electronics', 'nadeem-electronics', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\n', NULL, 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221202124722.jpg', '27.jpg', 1, 1, 1, NULL, NULL, '2022-09-17 12:52:58', '2022-09-17 12:52:58'),
(6, 'Xaomi', 'xaomi', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\n', NULL, 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221202124722.jpg', '27.jpg', 1, 1, 1, NULL, NULL, '2022-09-17 12:52:58', '2022-09-17 12:52:58'),
(7, 'Lays', 'lays', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\n', NULL, 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221202124722.jpg', '27.jpg', 1, 1, 1, NULL, NULL, '2022-09-17 12:52:58', '2022-09-17 12:52:58'),
(8, 'Asus', 'asus', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\n', NULL, 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221202124722.jpg', '27.jpg', 1, 1, 1, NULL, NULL, '2022-09-17 12:52:58', '2022-09-17 12:52:58'),
(9, 'Dell', 'dell', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\n', NULL, 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221202124722.jpg', '27.jpg', 1, 1, 1, NULL, NULL, '2022-09-17 12:52:58', '2022-09-17 12:52:58'),
(10, 'head and Shoulder', 'head-and-shoulder', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\n', NULL, 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221202124722.jpg', '27.jpg', 1, 1, 1, NULL, NULL, '2022-09-17 12:52:58', '2022-09-17 12:52:58'),
(11, 'Good Milk', 'good-milk', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\n', NULL, 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221202124722.jpg', '27.jpg', 1, 1, 1, NULL, NULL, '2022-09-17 12:52:58', '2022-09-17 12:52:58'),
(12, 'Pepsi', 'pepsi', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\n', NULL, 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221202124722.jpg', '27.jpg', 1, 1, 1, NULL, NULL, '2022-09-17 12:52:58', '2022-09-17 12:52:58'),
(13, 'Dew', 'dew', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\n', NULL, 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221202124722.jpg', '27.jpg', 1, 1, 1, NULL, NULL, '2022-09-17 12:52:58', '2022-09-17 12:52:58');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `guest_id` tinytext DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(30) NOT NULL,
  `slug` varchar(30) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `short_description` varchar(100) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT 0,
  `images` tinytext DEFAULT NULL,
  `featured` tinyint(4) NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `description`, `short_description`, `image`, `sort`, `images`, `featured`, `active`, `parent_id`, `created_at`, `updated_at`) VALUES
(24, 'Biscuits', 'biscuits', NULL, NULL, 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221202124722.jpg', 0, NULL, 1, 1, 35, '2022-11-06 14:12:58', '2022-11-07 08:52:42'),
(25, 'Snack', 'snack', NULL, NULL, 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221202124722.jpg', 0, NULL, 1, 1, 35, '2022-11-06 14:19:08', '2022-11-07 08:52:51'),
(26, 'Cold Drinks', 'cold-drinks', NULL, NULL, 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221202124722.jpg', 0, NULL, 1, 1, 35, '2022-11-06 14:20:02', '2022-11-06 14:20:02'),
(27, 'Milk', 'milk', NULL, NULL, 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221202124722.jpg', 0, NULL, 1, 1, 35, '2022-11-06 14:20:31', '2022-11-07 08:53:23'),
(28, 'Nimco', 'nimco', NULL, NULL, 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221202124722.jpg', 0, NULL, 1, 1, 35, '2022-11-07 06:53:41', '2022-11-07 08:53:15'),
(29, 'Chocolate', 'chocolate', NULL, NULL, 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221202124722.jpg', 0, NULL, 1, 1, 35, '2022-11-07 07:08:39', '2022-11-07 07:12:04'),
(30, 'Computer', 'computer', NULL, NULL, 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221202124722.jpg', 0, NULL, 1, 1, 35, '2022-11-07 07:08:39', '2022-11-07 07:12:04'),
(31, 'Mobile', 'mobile', NULL, NULL, 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221202124722.jpg', 0, NULL, 1, 1, 33, '2022-11-07 07:08:39', '2022-11-07 07:12:04'),
(32, 'Laptop', 'laptop', NULL, NULL, 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221202124722.jpg', 0, NULL, 1, 1, 33, '2022-11-07 07:08:39', '2022-11-07 07:12:04'),
(33, 'Electronics', 'electronics', NULL, NULL, 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221202124722.jpg', 0, NULL, 1, 1, 0, '2022-11-07 07:08:39', '2022-11-07 07:12:04'),
(34, 'Charger', 'charger', NULL, NULL, 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221202124722.jpg', 0, NULL, 1, 1, 33, '2022-11-07 07:08:39', '2022-11-07 07:12:04'),
(35, 'Food', 'food', NULL, NULL, 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221202124722.jpg', 0, NULL, 0, 1, 0, '2022-12-02 14:42:39', '2022-12-02 14:42:39'),
(36, 'Fashion', 'fashion', NULL, NULL, 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221202124722.jpg', 0, NULL, 0, 1, 0, '2022-12-02 14:42:39', '2022-12-02 14:42:39'),
(37, 'Shirt', 'shirt', NULL, NULL, 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221202124722.jpg', 0, NULL, 1, 1, 36, '2022-11-07 07:08:39', '2022-11-07 07:12:04'),
(38, 'Pent', 'pent', NULL, NULL, 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221202124722.jpg', 0, NULL, 1, 1, 36, '2022-11-07 07:08:39', '2022-11-07 07:12:04'),
(39, 'T Shirt', 't-shirt', NULL, NULL, 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221202124722.jpg', 0, NULL, 1, 1, 36, '2022-11-07 07:08:39', '2022-11-07 07:12:04'),
(40, 'Trouser', 'trouser', NULL, NULL, 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221202124722.jpg', 0, NULL, 1, 1, 36, '2022-11-07 07:08:39', '2022-11-07 07:12:04'),
(41, 'Health & Beauty', 'health-beauty', NULL, NULL, 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221202124722.jpg', 0, NULL, 0, 1, 0, '2022-12-02 14:42:39', '2022-12-02 14:42:39'),
(42, 'Facewash', 'facewash', NULL, NULL, 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221202124722.jpg', 0, NULL, 0, 1, 41, '2022-12-02 14:42:39', '2022-12-02 14:42:39'),
(43, 'Shampo', 'shampo', NULL, NULL, 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221202124722.jpg', 0, NULL, 0, 1, 41, '2022-12-02 14:42:39', '2022-12-02 14:42:39'),
(44, 'Creams', 'creams', NULL, NULL, 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221202124722.jpg', 0, NULL, 0, 1, 41, '2022-12-02 14:42:39', '2022-12-02 14:42:39');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logo` tinytext CHARACTER SET latin1 DEFAULT NULL,
  `cover` tinytext DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `name` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `email` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `country` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `state` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `city` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `zip_code` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `street_address` text CHARACTER SET latin1 DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `details` text CHARACTER SET latin1 DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `logo`, `cover`, `title`, `name`, `email`, `phone`, `country`, `state`, `city`, `zip_code`, `street_address`, `longitude`, `latitude`, `details`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, NULL, 'Garrick Conroy Sr.', 'Garrick Conroy Sr.@gmail.com', 'asdasdasd 2', 'Martinique', 'Connecticut', 'Louveniaport', 'asdasd', '58457 Bernier Loop\nLake Giovannaburgh, SC 92300-1765', NULL, NULL, 'Cum animi sed aut nihil qui aut.', '0', '2022-08-20 17:10:23', '2022-08-20 19:09:22'),
(2, NULL, NULL, NULL, 'Santina Schimmel', 'Santina Schimmel@gmail.com', 'asdasdasd', 'Niger', 'Missouri', 'Considineport', 'asdasd', '6652 Monahan Pine Apt. 624\nEast Kaseymouth, IN 88313', NULL, NULL, 'Quam magni quia tenetur quisquam.', '0', '2022-08-20 17:10:23', '2022-08-20 17:10:23'),
(3, NULL, NULL, NULL, 'Mr. Bo Weimann', 'Mr. Bo Weimann@gmail.com', 'asdasdasd', 'Lithuania', 'Virginia', 'North Morris', 'asdasd', '546 Ledner Lodge Suite 686\nNorth Rudyville, VT 09317-8093', NULL, NULL, 'Inventore architecto quis hic minima eveniet itaque sed.', '0', '2022-08-20 17:10:23', '2022-08-20 17:10:23'),
(4, NULL, NULL, NULL, 'Prof. Dee Abernathy IV', 'Prof. Dee Abernathy IV@gmail.com', 'asdasdasd', 'Anguilla', 'West Virginia', 'Skylafort', 'asdasd', '4379 Daron Points Apt. 774\nSouth Eliza, CA 95329-7052', NULL, NULL, 'Omnis amet minus officiis.', '0', '2022-08-20 17:10:23', '2022-08-20 17:10:23'),
(5, NULL, NULL, NULL, 'Dr. Autumn Morar IV', 'Dr. Autumn Morar IV@gmail.com', 'asdasdasd', 'China', 'Iowa', 'Juwanland', 'asdasd', '6980 Angeline Dale Suite 957\nNorth Maceychester, AR 92753', NULL, NULL, 'Incidunt omnis nemo placeat iure sint itaque.', '0', '2022-08-20 17:10:23', '2022-08-20 17:10:23'),
(6, NULL, NULL, NULL, 'Thomas Wunsch IV', 'Thomas Wunsch IV@gmail.com', 'asdasdasd', 'Czech Republic', 'Mississippi', 'New Bridgettetown', 'asdasd', '903 Wilderman Stream Apt. 128\nGerlachstad, NJ 37434', NULL, NULL, 'Dolore deleniti id quidem repellendus reprehenderit voluptas ullam.', '0', '2022-08-20 17:10:23', '2022-08-20 17:10:23'),
(7, NULL, NULL, NULL, 'Arden Konopelski', 'Arden Konopelski@gmail.com', 'asdasdasd', 'Solomon Islands', 'Massachusetts', 'Lomaberg', 'asdasd', '217 Jensen Well Apt. 149\nAngelitaberg, GA 86890', NULL, NULL, 'Blanditiis rerum accusantium doloremque harum error.', '0', '2022-08-20 17:10:23', '2022-08-20 17:10:23'),
(8, NULL, NULL, NULL, 'Prof. Chance Schneider PhD', 'Prof. Chance Schneider PhD@gmail.com', 'asdasdasd', 'South Georgia and the South Sa', 'North Carolina', 'East Chelsiebury', 'asdasd', '323 Alena Estate Apt. 506\nTremblaychester, AL 56768-3342', NULL, NULL, 'Vel sapiente qui aut sint.', '0', '2022-08-20 17:10:23', '2022-08-20 17:10:23'),
(9, NULL, NULL, NULL, 'Dock Osinski', 'Dock Osinski@gmail.com', 'asdasdasd', 'Northern Mariana Islands', 'New Mexico', 'O\'Haraborough', 'asdasd', '9400 Josh Flat\nMelvinaville, LA 03162-4377', NULL, NULL, 'Qui sunt quae ipsam sunt ut saepe perspiciatis.', '0', '2022-08-20 17:10:23', '2022-08-20 17:10:23'),
(10, NULL, NULL, NULL, 'Clotilde Quigley', 'Clotilde Quigley@gmail.com', 'asdasdasd', 'Dominica', 'New Mexico', 'New Kailyn', 'asdasd', '672 Kirlin Meadows\nCarletonstad, DE 15051', NULL, NULL, 'Reiciendis iure suscipit libero ad.', '0', '2022-08-20 17:10:23', '2022-08-20 17:10:23'),
(11, NULL, NULL, NULL, 'Dr. Tremayne McLaughlin', 'Dr. Tremayne McLaughlin@gmail.com', 'asdasdasd', 'Latvia', 'New York', 'New Noemy', 'asdasd', '48945 Vella Square Suite 237\nLake Nick, CA 41100-5256', NULL, NULL, 'Tempore voluptas quas eum libero beatae.', '0', '2022-08-20 17:10:23', '2022-08-20 17:10:23'),
(12, NULL, NULL, NULL, 'Leif Kerluke', 'Leif Kerluke@gmail.com', 'asdasdasd', 'Germany', 'Utah', 'North Zenaside', 'asdasd', '77435 William Lights Apt. 332\nAlizaville, MO 01340', NULL, NULL, 'Suscipit nobis eaque voluptatem qui.', '0', '2022-08-20 17:10:23', '2022-08-20 17:10:23'),
(13, NULL, NULL, NULL, 'Jimmy Senger', 'Jimmy Senger@gmail.com', 'asdasdasd', 'Montserrat', 'Louisiana', 'Mathewville', 'asdasd', '8345 Patience Lights\nLake Leonorastad, OK 75723-6249', NULL, NULL, 'Sunt error et quasi ad quia dolor aliquam.', '0', '2022-08-20 17:10:23', '2022-08-20 17:10:23'),
(14, NULL, NULL, NULL, 'Junior Considine', 'Junior Considine@gmail.com', 'asdasdasd', 'Finland', 'Rhode Island', 'Suzanneside', 'asdasd', '8301 Tommie Path Suite 232\nWest Oswaldoborough, OH 44449-7937', NULL, NULL, 'Aliquid impedit harum sed quia.', '0', '2022-08-20 17:10:23', '2022-08-20 17:10:23'),
(15, NULL, NULL, NULL, 'Noemy Klein', 'Noemy Klein@gmail.com', 'asdasdasd', 'Libyan Arab Jamahiriya', 'South Dakota', 'Lake Wilburnside', 'asdasd', '3014 Dietrich Light Suite 789\nLake Verda, MI 75804', NULL, NULL, 'Occaecati sed qui eius in dignissimos molestias.', '0', '2022-08-20 17:10:23', '2022-08-20 17:10:23'),
(16, NULL, NULL, NULL, 'Kane Fisher', 'Kane Fisher@gmail.com', 'asdasdasd', 'Guatemala', 'Georgia', 'East Nolan', 'asdasd', '11685 Thompson Streets\nBerthaside, MO 47910-0953', NULL, NULL, 'A in molestias est eaque.', '0', '2022-08-20 17:10:23', '2022-08-20 17:10:23'),
(17, NULL, NULL, NULL, 'Mrs. Angelita Jakubowski I', 'Mrs. Angelita Jakubowski I@gmail.com', 'asdasdasd', 'Botswana', 'Iowa', 'Cassinhaven', 'asdasd', '731 Larson Forest\nWest Kavonland, MS 97584', NULL, NULL, 'Facilis et libero ipsam est consequatur.', '0', '2022-08-20 17:10:23', '2022-08-20 17:10:23'),
(18, NULL, NULL, NULL, 'Ben Haley', 'Ben Haley@gmail.com', 'asdasdasd', 'Ghana', 'Hawaii', 'West Patrickburgh', 'asdasd', '381 King Path\nSouth Antonettatown, AK 48566-6805', NULL, NULL, 'Est molestiae qui quia et ut quo nihil.', '0', '2022-08-20 17:10:23', '2022-08-20 17:10:23'),
(19, NULL, NULL, NULL, 'Denesik', 'Mr. Tre Denesik@gmail.com', 'asdasdasd', 'Burundi', 'Arizona', 'Carolfurt', 'asdasd', '71322 Onie Parks\nWest Kyra, HI 14168-0821', NULL, NULL, 'Qui officiis rerum iusto sunt.', '0', '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(20, NULL, NULL, NULL, 'Ms. Zola Heller', 'Ms. Zola Heller@gmail.com', 'asdasdasd', 'Chile', 'District of Columbia', 'Antwanton', 'asdasd', '44127 Lehner Village Suite 734\nDurganburgh, WV 00762-4790', NULL, NULL, 'Dolor illo cupiditate doloribus dolorem omnis nobis.', '0', '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(21, NULL, NULL, NULL, 'Mr. Armando Jacobson', 'Mr. Armando Jacobson@gmail.com', 'asdasdasd', 'Benin', 'Ohio', 'Elsiechester', 'asdasd', '235 Robbie Parkways Suite 071\nAdellland, FL 29164', NULL, NULL, 'Amet eligendi nam esse quia.', '0', '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(22, NULL, NULL, NULL, 'Oran Batz', 'Oran Batz@gmail.com', 'asdasdasd', 'Venezuela', 'West Virginia', 'North Braedenview', 'asdasd', '632 Heidenreich Gateway\nJakobshire, AL 82613', NULL, NULL, 'Omnis recusandae et quis est voluptatibus nam harum.', '0', '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(23, NULL, NULL, NULL, 'Dr. Collin Blick', 'Dr. Collin Blick@gmail.com', 'asdasdasd', 'Marshall Islands', 'Kansas', 'West Abbigail', 'asdasd', '63665 Lockman Union Suite 041\nSporerport, UT 63337', NULL, NULL, 'Similique nesciunt nostrum magnam sequi atque neque consectetur repudiandae.', '0', '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(24, NULL, NULL, NULL, 'Mr. Cyril Dickinson', 'Mr. Cyril Dickinson@gmail.com', 'asdasdasd', 'Pakistan', 'Arkansas', 'Hardyshire', 'asdasd', '888 Jaiden Lakes\nKassulkeberg, GA 35925', NULL, NULL, 'Ipsam officia veritatis asperiores sint.', '0', '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(25, NULL, NULL, NULL, 'Elmer Price II', 'Elmer Price II@gmail.com', 'asdasdasd', 'American Samoa', 'New Mexico', 'Tillmanshire', 'asdasd', '2611 Batz Underpass\nAubreyhaven, WA 62990-2281', NULL, NULL, 'Consequatur sint doloribus ex assumenda sunt.', '0', '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(26, NULL, NULL, NULL, 'Prof. Carolyn O\'Hara V', 'Prof. Carolyn O\'Hara V@gmail.com', 'asdasdasd', 'San Marino', 'Connecticut', 'Bayerport', 'asdasd', '72672 Larry Mall\nNorth Ethel, MI 37166-6606', NULL, NULL, 'Iste nihil nemo labore sunt facilis.', '0', '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(27, NULL, NULL, NULL, 'Helen Bernier', 'Helen Bernier@gmail.com', 'asdasdasd', 'Trinidad and Tobago', 'Arizona', 'North Ladarius', 'asdasd', '4768 Kiara Road Apt. 701\nNorth Vergiefort, IL 29304-1980', NULL, NULL, 'Quo sunt qui voluptatem.', '0', '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(28, NULL, NULL, NULL, 'Consuelo Pollich', 'Consuelo Pollich@gmail.com', 'asdasdasd', 'Saint Martin', 'Mississippi', 'Carrollberg', 'asdasd', '68691 Moen Knolls\nLibbiehaven, KS 00804', NULL, NULL, 'Ad debitis vel modi sequi.', '0', '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(29, NULL, NULL, NULL, 'Lia Cassin', 'Lia Cassin@gmail.com', 'asdasdasd', 'Swaziland', 'Ohio', 'Heaneyview', 'asdasd', '8977 Prosacco Harbor\nSouth Brennonberg, SC 16249', NULL, NULL, 'Dolorum eum aut sint aliquid.', '0', '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(30, NULL, NULL, NULL, 'Lyda Hickle', 'Lyda Hickle@gmail.com', 'asdasdasd', 'Montserrat', 'Oregon', 'New Marianashire', 'asdasd', '1699 Emard Passage Apt. 809\nLehnerport, CA 74099-5203', NULL, NULL, 'Facere sit eum beatae voluptatem explicabo.', '0', '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(31, NULL, NULL, NULL, 'Velda Botsford', 'Velda Botsford@gmail.com', 'asdasdasd', 'Malaysia', 'South Dakota', 'West Abraham', 'asdasd', '983 Andrew Green\nLake Catharineburgh, PA 49753-6908', NULL, NULL, 'Aut velit dolor exercitationem harum.', '0', '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(32, NULL, NULL, NULL, 'Noelia Davis', 'Noelia Davis@gmail.com', 'asdasdasd', 'Mauritius', 'Ohio', 'Port Maximilianport', 'asdasd', '719 Sibyl Valleys Apt. 133\nNew Camille, DC 37871', NULL, NULL, 'Illum rerum possimus deleniti est illo.', '0', '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(33, NULL, NULL, NULL, 'Alvina Kuhic', 'Alvina Kuhic@gmail.com', 'asdasdasd', 'Spain', 'Idaho', 'New Carachester', 'asdasd', '22427 Hill Groves\nHymanfurt, MN 77862-6441', NULL, NULL, 'Dicta aliquid quod enim quo quasi.', '0', '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(34, NULL, NULL, NULL, 'Mr. Adrien Kohler MD', 'Mr. Adrien Kohler MD@gmail.com', 'asdasdasd', 'Suriname', 'North Carolina', 'West Roman', 'asdasd', '9043 Pearl Fords Suite 737\nWest Evertchester, ND 69549-2058', NULL, NULL, 'Dolorem laborum dolorem iste repellat architecto temporibus.', '0', '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(35, NULL, NULL, NULL, 'Dr. Stan Fadel', 'Dr. Stan Fadel@gmail.com', 'asdasdasd', 'Argentina', 'Missouri', 'Champlinmouth', 'asdasd', '26632 Annamae Knolls Apt. 121\nPort Lamarberg, FL 96390-1853', NULL, NULL, 'Fuga qui reiciendis suscipit at placeat consectetur asperiores.', '0', '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(36, NULL, NULL, NULL, 'Dr. Sydney Kertzmann Jr.', 'Dr. Sydney Kertzmann Jr.@gmail.com', 'asdasdasd', 'Albania', 'Pennsylvania', 'East Eloise', 'asdasd', '1675 Eric Road Apt. 550\nKeelingtown, MT 65566', NULL, NULL, 'Nisi dolor alias velit hic.', '0', '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(37, NULL, NULL, NULL, 'Jermey Kozey', 'Jermey Kozey@gmail.com', 'asdasdasd', 'Germany', 'New York', 'Powlowskiland', 'asdasd', '34200 Jerrod Vista Suite 038\nPort Hebertown, NM 43109', NULL, NULL, 'Ut doloribus aliquid autem fugit odit ipsum saepe eveniet.', '0', '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(38, NULL, NULL, NULL, 'Dr. Norbert Hyatt MD', 'Dr. Norbert Hyatt MD@gmail.com', 'asdasdasd', 'Suriname', 'Montana', 'South Zoeview', 'asdasd', '908 Hosea Groves\nFadelborough, MT 55972', NULL, NULL, 'Molestias rerum qui quo.', '0', '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(39, NULL, NULL, NULL, 'Agnes Luettgen', 'Agnes Luettgen@gmail.com', 'asdasdasd', 'Cape Verde', 'Ohio', 'Grahamfort', 'asdasd', '9084 Bashirian Via\nCaleighborough, PA 31191-5400', NULL, NULL, 'Earum repudiandae ducimus aliquid unde eius.', '0', '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(40, NULL, NULL, NULL, 'Ms. Stella Fahey IV', 'Ms. Stella Fahey IV@gmail.com', 'asdasdasd', 'Benin', 'Hawaii', 'North Leonardchester', 'asdasd', '1522 Von Cove\nPort Wallace, IA 82033-7433', NULL, NULL, 'Culpa ipsam dignissimos tenetur voluptates hic aut error exercitationem.', '0', '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(41, NULL, NULL, NULL, 'Valentin Mitchell', 'Valentin Mitchell@gmail.com', 'asdasdasd', 'Belize', 'South Carolina', 'Manteborough', 'asdasd', '510 Bashirian Springs\nNorth Ewald, OH 18872-3962', NULL, NULL, 'Quis neque ullam deserunt dolor molestias.', '0', '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(42, NULL, NULL, NULL, 'Jarrett Schneider', 'Jarrett Schneider@gmail.com', 'asdasdasd', 'Nepal', 'Alaska', 'North Gordonside', 'asdasd', '10961 Kulas Camp\nRauborough, HI 01788', NULL, NULL, 'Ut expedita incidunt unde vitae ipsum.', '0', '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(43, NULL, NULL, NULL, 'Dr. Leilani Keebler', 'Dr. Leilani Keebler@gmail.com', 'asdasdasd', 'Sierra Leone', 'North Dakota', 'East Orrinstad', 'asdasd', '9540 Will Lights Apt. 308\nEast Lilyshire, CO 91872', NULL, NULL, 'Aut fugit consequatur nihil et fugiat blanditiis.', '0', '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(44, NULL, NULL, NULL, 'Aleen Schuppe PhD', 'Aleen Schuppe PhD@gmail.com', 'asdasdasd', 'Honduras', 'Utah', 'Flavioberg', 'asdasd', '50104 Shawna Plaza\nTianaville, WA 64857', NULL, NULL, 'Corrupti et omnis nulla labore totam soluta.', '0', '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(45, NULL, NULL, NULL, 'Julius Will', 'Julius Will@gmail.com', 'asdasdasd', 'Reunion', 'North Dakota', 'Mireilleside', 'asdasd', '9886 Romaguera Hollow Suite 583\nNew Adalineview, IN 04747-2250', NULL, NULL, 'Neque id consequatur qui error commodi quia repellendus.', '0', '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(46, NULL, NULL, NULL, 'Brionna Ortiz', 'Brionna Ortiz@gmail.com', 'asdasdasd', 'Belize', 'West Virginia', 'Boehmville', 'asdasd', '37708 Barrows Square Apt. 115\nEast Jerrell, MS 21942', NULL, NULL, 'Blanditiis pariatur fugit quidem sed exercitationem perspiciatis.', '0', '2022-08-20 17:10:25', '2022-08-20 17:10:25'),
(47, NULL, NULL, NULL, 'Mellie Turner', 'Mellie Turner@gmail.com', 'asdasdasd', 'Aruba', 'Connecticut', 'South Zack', 'asdasd', '1803 Colleen Lake Apt. 537\nAbdielton, OK 05037', NULL, NULL, 'Id repudiandae adipisci repellendus amet.', '0', '2022-08-20 17:10:25', '2022-08-20 17:10:25'),
(48, NULL, NULL, NULL, 'Zula Homenick', 'Zula Homenick@gmail.com', 'asdasdasd', 'Zambia', 'Missouri', 'Aufderharborough', 'asdasd', '506 Sandra Rest\nNorth Carroll, MA 94335-3035', NULL, NULL, 'Qui sed et sit dignissimos quia quo autem.', '0', '2022-08-20 17:10:25', '2022-08-20 17:10:25'),
(49, NULL, NULL, NULL, 'Treva Barton', 'Treva Barton@gmail.com', 'asdasdasd', 'Saint Kitts and Nevis', 'South Dakota', 'East Norvalshire', 'asdasd', '9977 Grady Shore Suite 612\nArjunton, DE 60064-6112', NULL, NULL, 'Beatae ad consequatur aut nesciunt placeat nobis voluptates.', '0', '2022-08-20 17:10:25', '2022-08-20 17:10:25'),
(50, NULL, NULL, NULL, 'Jazmin Muller', 'Jazmin Muller@gmail.com', 'asdasdasd', 'Sri Lanka', 'Arizona', 'New Keon', 'asdasd', '7533 Nienow Union\nPort Lamar, OK 27001', NULL, NULL, 'Eveniet est vitae dolorem voluptas illum.', '0', '2022-08-20 17:10:25', '2022-08-20 17:10:25'),
(51, NULL, NULL, NULL, 'customer1', 'customer1gmail.com', NULL, 'country', 'state', 'city', 'zipcode', 'Address 2', NULL, NULL, 'details', '0', '2022-08-20 12:45:10', '2022-08-20 12:45:10'),
(52, NULL, NULL, NULL, 'customer12', 'customer12@gmail.com', NULL, 'country', 'state', 'city', 'zipcode', 'Address 2', NULL, NULL, 'details', '0', '2022-08-20 17:15:51', '2022-08-20 17:15:51'),
(53, NULL, NULL, NULL, 'customer122', 'customer122@gmail.com', NULL, 'country', 'state', 'city', 'zipcode', 'Address 2', NULL, NULL, 'details', '0', '2022-08-20 17:17:23', '2022-08-20 17:17:23'),
(54, NULL, NULL, NULL, 'customer1222', 'customer1222@gmail.com', NULL, 'country', 'state', 'city', 'zipcode', 'Address 2', NULL, NULL, 'details', '0', '2022-08-20 17:33:26', '2022-08-20 17:33:26'),
(55, NULL, NULL, NULL, 'customer16', 'customer1@gmail.com', 'asdasdasd', 'country', 'state', 'city', 'zipcode', 'Address 2', NULL, NULL, 'Itaquedsdsdsdsdsdsd', '0', '2022-08-20 17:33:51', '2022-08-20 17:34:34'),
(56, NULL, NULL, NULL, 'customer122234', 'customer122234@gmail.com', NULL, 'country', 'state', 'city', 'zipcode', 'Address 3', NULL, NULL, 'details', '0', '2022-08-20 17:52:06', '2022-08-20 17:55:18'),
(57, NULL, NULL, NULL, 'customer1222344', 'customer1222344@gmail.com', NULL, 'country', 'state', 'city', 'zipcode', 'Address 2', NULL, NULL, 'details', '0', '2022-08-20 19:09:50', '2022-08-20 19:09:50'),
(58, NULL, NULL, NULL, 'owais', 'owaisazam@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '2022-09-13 13:37:00', '2022-09-13 13:37:00');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `phone`, `country`, `state`, `city`, `zip_code`, `street_address`, `description`, `active`, `created_at`, `updated_at`) VALUES
(1, 'z', 'z@gmail.com', '112', 'qqqqw', 'test', 'zxzxzx', 'zzccccccc', '2', '1', 0, '2022-08-19 08:34:30', '2022-10-29 15:39:36'),
(11, 'iamowaisazam1', 'iamowaisazam@gmail.com', '031122393421', '1', '2', '3', '4', '5', '6', 1, '2022-09-04 05:20:16', '2022-10-28 19:34:47'),
(12, 'iamowaisazam5', 'iamowaisazam5@gmail.com', '03112239342', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2022-09-04 05:20:16', '2022-10-29 16:49:37'),
(13, 'vendor1', 'vendor1@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-09-17 06:25:13', '2022-10-29 16:47:41'),
(14, 'customer', 'customer1@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-09-17 07:02:54', '2022-10-28 19:34:46'),
(18, 'owaisazam1', 'owaisazam1@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-09-18 05:24:38', '2022-10-29 15:45:15'),
(19, 'owaisazam22', 'owaisazam22@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-09-18 05:25:42', '2022-10-28 19:34:49'),
(20, 'owaisazam33', 'owaisazam33@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-09-18 05:44:16', '2022-11-30 03:28:38'),
(21, 'owaisaza-m', 'test@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2022-09-18 08:31:28', '2022-10-29 11:59:49'),
(22, 'owaisazam34', 'owaisazam34@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-09-18 08:51:18', '2022-10-28 19:34:50');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `file_managers`
--

CREATE TABLE `file_managers` (
  `id` bigint(20) NOT NULL,
  `name` tinytext CHARACTER SET utf8mb4 DEFAULT NULL,
  `title` tinytext DEFAULT NULL,
  `orignal_name` tinytext DEFAULT NULL,
  `extension` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `size` double DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `path` tinytext DEFAULT NULL,
  `link` tinytext DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `file_managers`
--

INSERT INTO `file_managers` (`id`, `name`, `title`, `orignal_name`, `extension`, `size`, `active`, `path`, `link`, `description`, `created_at`, `updated_at`) VALUES
(52, '999999999920221029135602.png', '17 ppppzzz', '17.png', 'png', 43313, NULL, 'uploads/all/999999999920221029135602.png', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221029135602.png', 'zzzzzzzzzzzxzxzxz', '2022-10-29 08:56:02', '2022-10-31 03:46:55'),
(53, '999999999920221029135606.jpg', '12.jpg', '12.jpg', 'jpg', 50061, NULL, 'uploads/all/999999999920221029135606.jpg', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221029135606.jpg', NULL, '2022-10-29 08:56:06', '2022-10-29 08:56:06'),
(55, '999999999920221029135616.png', 'owais azam file', '3-3-1.png', 'png', 2749, NULL, 'uploads/all/999999999920221029135616.png', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221029135616.png', 'zzzzzzzzzz', '2022-10-29 08:56:16', '2022-10-29 11:43:59'),
(56, '1000000000020221029135621.png', '29.png', '29.png', 'png', 5816, NULL, 'uploads/all/1000000000020221029135621.png', 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221029135621.png', NULL, '2022-10-29 08:56:21', '2022-10-29 08:56:21'),
(57, '1000000000020221029135625.png', '8.png', '8.png', 'png', 40118, NULL, 'uploads/all/1000000000020221029135625.png', 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221029135625.png', NULL, '2022-10-29 08:56:25', '2022-10-29 08:56:25'),
(58, '999999999920221029135644.jpg', '12.jpg', '12.jpg', 'jpg', 50061, NULL, 'uploads/all/999999999920221029135644.jpg', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221029135644.jpg', NULL, '2022-10-29 08:56:44', '2022-10-29 08:56:44'),
(59, '999999999920221029135700.jpg', '28b20908r5f45r4922ra2card80fd1c178fb.jpg', '28b20908r5f45r4922ra2card80fd1c178fb.jpg', 'jpg', 53179, NULL, 'uploads/all/999999999920221029135700.jpg', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221029135700.jpg', NULL, '2022-10-29 08:57:00', '2022-10-29 08:57:00'),
(60, '1000000000020221029135706.jpg', '28b20908r5f45r4922ra2card80fd1c178fb.jpg', '28b20908r5f45r4922ra2card80fd1c178fb.jpg', 'jpg', 53179, NULL, 'uploads/all/1000000000020221029135706.jpg', 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221029135706.jpg', NULL, '2022-10-29 08:57:06', '2022-10-29 08:57:06'),
(61, '999999999920221029141413.jpg', '1_lyrics_setquotes.com.jpg', '1_lyrics_setquotes.com.jpg', 'jpg', 398934, NULL, 'uploads/all/999999999920221029141413.jpg', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221029141413.jpg', NULL, '2022-10-29 09:14:13', '2022-10-29 09:14:13'),
(62, '1000000000020221029141425.png', '03 Fire PNG Effects _ Nik Creations.png', '03 Fire PNG Effects _ Nik Creations.png', 'png', 777020, NULL, 'uploads/all/1000000000020221029141425.png', 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221029141425.png', NULL, '2022-10-29 09:14:25', '2022-10-29 09:14:25'),
(63, '1000000000020221029141806.jpg', '1_lyrics_setquotes.com.jpg', '1_lyrics_setquotes.com.jpg', 'jpg', 398934, NULL, 'uploads/all/1000000000020221029141806.jpg', 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221029141806.jpg', NULL, '2022-10-29 09:18:06', '2022-10-29 09:18:06'),
(64, '1000000000020221029141813.png', '8.png', '8.png', 'png', 40118, NULL, 'uploads/all/1000000000020221029141813.png', 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221029141813.png', NULL, '2022-10-29 09:18:13', '2022-10-29 09:18:13'),
(65, '999999999920221029141818.jpg', '12.jpg', '12.jpg', 'jpg', 50061, NULL, 'uploads/all/999999999920221029141818.jpg', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221029141818.jpg', NULL, '2022-10-29 09:18:18', '2022-10-29 09:18:18'),
(66, '999999999920221029141826.jpg', '500x580xSRK-Hritik1.jpg.pagespeed.ic_.cHRJsUqt_R1-370x297.jpg', '500x580xSRK-Hritik1.jpg.pagespeed.ic_.cHRJsUqt_R1-370x297.jpg', 'jpg', 25777, NULL, 'uploads/all/999999999920221029141826.jpg', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221029141826.jpg', NULL, '2022-10-29 09:18:26', '2022-10-29 09:18:26'),
(67, '1000000000020221029141924.png', '5-4.png', '5-4.png', 'png', 6696, NULL, 'uploads/all/1000000000020221029141924.png', 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221029141924.png', NULL, '2022-10-29 09:19:24', '2022-10-29 09:19:24'),
(68, '1000000000020221029141928.jpg', '2da669d58d2117dec6e01ae8561d8ebf.jpg', '2da669d58d2117dec6e01ae8561d8ebf.jpg', 'jpg', 48710, NULL, 'uploads/all/1000000000020221029141928.jpg', 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221029141928.jpg', NULL, '2022-10-29 09:19:28', '2022-10-29 09:19:28'),
(69, '999999999920221029141938.jpg', '2da669d58d2117dec6e01ae8561d8ebf.jpg', '2da669d58d2117dec6e01ae8561d8ebf.jpg', 'jpg', 48710, NULL, 'uploads/all/999999999920221029141938.jpg', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221029141938.jpg', NULL, '2022-10-29 09:19:38', '2022-10-29 09:19:38'),
(71, '1000000000020221029142151.jpg', '1_lyrics_setquotes.com.jpg', '1_lyrics_setquotes.com.jpg', 'jpg', 398934, NULL, 'uploads/all/1000000000020221029142151.jpg', 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221029142151.jpg', NULL, '2022-10-29 09:21:52', '2022-10-29 09:21:52'),
(72, '999999999920221029142158.jpg', '28b20908r5f45r4922ra2card80fd1c178fb.jpg', '28b20908r5f45r4922ra2card80fd1c178fb.jpg', 'jpg', 53179, NULL, 'uploads/all/999999999920221029142158.jpg', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221029142158.jpg', NULL, '2022-10-29 09:21:58', '2022-10-29 09:21:58'),
(73, '999999999920221029142924.jpg', '2da669d58d2117dec6e01ae8561d8ebf.jpg', '2da669d58d2117dec6e01ae8561d8ebf.jpg', 'jpg', 48710, NULL, 'uploads/all/999999999920221029142924.jpg', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221029142924.jpg', NULL, '2022-10-29 09:29:24', '2022-10-29 09:29:24'),
(74, '999999999920221029143047.png', '8.png', '8.png', 'png', 40118, NULL, 'uploads/all/999999999920221029143047.png', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221029143047.png', NULL, '2022-10-29 09:30:47', '2022-10-29 09:30:47'),
(75, '999999999920221029143053.jpg', '28b20908r5f45r4922ra2card80fd1c178fb.jpg', '28b20908r5f45r4922ra2card80fd1c178fb.jpg', 'jpg', 53179, NULL, 'uploads/all/999999999920221029143053.jpg', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221029143053.jpg', NULL, '2022-10-29 09:30:53', '2022-10-29 09:30:53'),
(76, '1000000000020221029143059.jpg', 'FB_IMG_1495363378903.jpg', 'FB_IMG_1495363378903.jpg', 'jpg', 44801, NULL, 'uploads/all/1000000000020221029143059.jpg', 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221029143059.jpg', NULL, '2022-10-29 09:30:59', '2022-10-29 09:30:59'),
(77, '999999999920221029143105.jpg', '41dcbba2409e9c32ce4a80505470d6bd.jpg', '41dcbba2409e9c32ce4a80505470d6bd.jpg', 'jpg', 50429, NULL, 'uploads/all/999999999920221029143105.jpg', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221029143105.jpg', NULL, '2022-10-29 09:31:05', '2022-10-29 09:31:05'),
(78, '1000000000020221029143111.jpg', '500x580xSRK-Hritik1.jpg.pagespeed.ic_.cHRJsUqt_R1-370x297.jpg', '500x580xSRK-Hritik1.jpg.pagespeed.ic_.cHRJsUqt_R1-370x297.jpg', 'jpg', 25777, NULL, 'uploads/all/1000000000020221029143111.jpg', 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221029143111.jpg', NULL, '2022-10-29 09:31:11', '2022-10-29 09:31:11'),
(79, '999999999920221029143117.png', '44-2.png', '44-2.png', 'png', 12130, NULL, 'uploads/all/999999999920221029143117.png', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221029143117.png', NULL, '2022-10-29 09:31:17', '2022-10-29 09:31:17'),
(80, '999999999920221029143123.jpg', '95a6657d6168e6d739b9f0ad1bbe8751.jpg', '95a6657d6168e6d739b9f0ad1bbe8751.jpg', 'jpg', 12871, NULL, 'uploads/all/999999999920221029143123.jpg', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221029143123.jpg', NULL, '2022-10-29 09:31:23', '2022-10-29 09:31:23'),
(81, '1000000000020221029143132.jpg', '10388016_492586070915645_357746866_n.jpg', '10388016_492586070915645_357746866_n.jpg', 'jpg', 21108, NULL, 'uploads/all/1000000000020221029143132.jpg', 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221029143132.jpg', NULL, '2022-10-29 09:31:32', '2022-10-29 09:31:32'),
(82, '999999999920221029143427.png', 'unnamed (9).png', 'unnamed (9).png', 'png', 84989, NULL, 'uploads/all/999999999920221029143427.png', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221029143427.png', NULL, '2022-10-29 09:34:27', '2022-10-29 09:34:27'),
(83, '1000000000020221029164419.png', '5-2.png', '5-2.png', 'png', 19656, NULL, 'uploads/all/1000000000020221029164419.png', 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221029164419.png', NULL, '2022-10-29 11:44:19', '2022-10-29 11:44:19'),
(84, '999999999920221029165316.jpg', '28b20908r5f45r4922ra2card80fd1c178fb.jpg', '28b20908r5f45r4922ra2card80fd1c178fb.jpg', 'jpg', 53179, NULL, 'uploads/all/999999999920221029165316.jpg', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221029165316.jpg', NULL, '2022-10-29 11:53:16', '2022-10-29 11:53:16'),
(86, '999999999920221029181456.jpg', 'FB_IMG_16669008702145840.jpg', 'FB_IMG_16669008702145840.jpg', 'jpg', 239125, NULL, 'uploads/all/999999999920221029181456.jpg', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221029181456.jpg', NULL, '2022-10-29 13:14:56', '2022-10-29 13:14:56'),
(87, '999999999920221029181534.png', 'code.jpeg', 'code.jpeg', 'png', 26598, NULL, 'uploads/all/999999999920221029181534.png', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221029181534.png', NULL, '2022-10-29 13:15:34', '2022-10-29 13:15:34'),
(88, '999999999920221029181613.png', 'code bmv', 'code.jpeg', 'png', 26598, NULL, 'uploads/all/999999999920221029181613.png', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221029181613.png', 'Gjvgjcjkdubv', '2022-10-29 13:16:13', '2022-10-29 13:17:12'),
(89, '1000000000020221130082813.png', 'code (9).jpeg', 'code (9).jpeg', 'png', 8396, NULL, 'uploads/all/1000000000020221130082813.png', 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221130082813.png', NULL, '2022-11-30 03:28:13', '2022-11-30 03:28:13'),
(90, '1000000000020221202124722.jpg', 'category1-img.jpg', 'category1-img.jpg', 'jpg', 14765, NULL, 'uploads/all/1000000000020221202124722.jpg', 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221202124722.jpg', NULL, '2022-12-02 07:47:22', '2022-12-02 07:47:22'),
(91, '1000000000020221202125052.jpg', 'product03-400x400.jpg', 'product03-400x400.jpg', 'jpg', 15335, NULL, 'uploads/all/1000000000020221202125052.jpg', 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221202125052.jpg', NULL, '2022-12-02 07:50:52', '2022-12-02 07:50:52'),
(92, '999999999920221202125059.jpg', 'product02-400x400.jpg', 'product02-400x400.jpg', 'jpg', 21630, NULL, 'uploads/all/999999999920221202125059.jpg', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221202125059.jpg', NULL, '2022-12-02 07:50:59', '2022-12-02 07:50:59'),
(93, '999999999920221202125108.jpg', 'product01-400x400.jpg', 'product01-400x400.jpg', 'jpg', 11940, NULL, 'uploads/all/999999999920221202125108.jpg', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221202125108.jpg', NULL, '2022-12-02 07:51:08', '2022-12-02 07:51:08'),
(94, '999999999920221202125117.jpg', 'product04-400x400.jpg', 'product04-400x400.jpg', 'jpg', 20112, NULL, 'uploads/all/999999999920221202125117.jpg', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221202125117.jpg', NULL, '2022-12-02 07:51:17', '2022-12-02 07:51:17'),
(95, '999999999920221202133608.jpg', 'home1-banner1-1.jpg', 'home1-banner1-1.jpg', 'jpg', 23112, NULL, 'uploads/all/999999999920221202133608.jpg', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221202133608.jpg', NULL, '2022-12-02 08:36:08', '2022-12-02 08:36:08'),
(96, '1000000000020221202133614.jpg', 'home1-banner1-2.jpg', 'home1-banner1-2.jpg', 'jpg', 22995, NULL, 'uploads/all/1000000000020221202133614.jpg', 'https://www.backend.azamsolutions.com/public/uploads/all/1000000000020221202133614.jpg', NULL, '2022-12-02 08:36:14', '2022-12-02 08:36:14'),
(97, '999999999920221202133620.jpg', 'home1-banner1-3.jpg', 'home1-banner1-3.jpg', 'jpg', 20730, NULL, 'uploads/all/999999999920221202133620.jpg', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221202133620.jpg', NULL, '2022-12-02 08:36:20', '2022-12-02 08:36:20');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` bigint(20) NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `id`, `token`, `user_id`, `created_at`, `expired_at`) VALUES
('iamowaisazam@gmail.com', 5, '820185', 11, NULL, '2022-09-04 07:19:43');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(4, 'App\\Models\\User', 2, 'tokens', '363e3276cffa69e385344b144bc5a25945f56c13b54ec1887c46fd4d67df9ad1', '[\"*\"]', NULL, NULL, '2022-09-03 13:09:20', '2022-09-03 13:09:20'),
(5, 'App\\Models\\User', 3, 'tokens', '05a5139f49a0e84a4808823e14fc5f9751a5eaf84b910c5fd94bd0cb22230871', '[\"*\"]', NULL, NULL, '2022-09-03 16:30:36', '2022-09-03 16:30:36'),
(6, 'App\\Models\\User', 2, 'tokens', 'ad209eb481e56ebfcb1141db75289043661a6dad713d452a1e3e1cddd84e826e', '[\"*\"]', NULL, NULL, '2022-09-03 17:22:30', '2022-09-03 17:22:30'),
(7, 'App\\Models\\User', 2, 'tokens', 'e58d83af8e00b0881f22c27b3e88b1a51c977235a059f5b1f2d3a090d10a814b', '[\"*\"]', NULL, NULL, '2022-09-03 17:24:00', '2022-09-03 17:24:00'),
(8, 'App\\Models\\User', 2, 'tokens', 'f75e3d6fd137b4d2db730ad49b5e04e174ebd32984c57f0b22fc1f584779b6f0', '[\"*\"]', NULL, NULL, '2022-09-03 17:24:12', '2022-09-03 17:24:12'),
(9, 'App\\Models\\User', 2, 'tokens', 'feb3cadf89ed1dbcaa934074ac0c33ea9c4d13981081c84c765a0e262cfb85fd', '[\"*\"]', NULL, NULL, '2022-09-03 17:24:35', '2022-09-03 17:24:35'),
(10, 'App\\Models\\User', 2, 'tokens', 'ecad0ffa834a5801d7cbdd5bd54e2b4dcb7bc6973ed92403ee5d94612459b70d', '[\"*\"]', NULL, NULL, '2022-09-03 17:25:08', '2022-09-03 17:25:08'),
(11, 'App\\Models\\User', 2, 'tokens', 'b0487f5ae798f6fe0063e67acab90e77a2c123a67a80e552c9e3ce57fb618db8', '[\"*\"]', NULL, NULL, '2022-09-03 17:25:32', '2022-09-03 17:25:32'),
(12, 'App\\Models\\User', 2, 'tokens', '6a4afbdc1e11d9a6e57eee49418b616e4f3ba5ab6b366d1cf851cdbf63cf82eb', '[\"*\"]', NULL, NULL, '2022-09-03 17:26:00', '2022-09-03 17:26:00'),
(13, 'App\\Models\\User', 2, 'tokens', '9c5798c5ad838602e16471f280a2011be172b516dc268160bde6d68f63908c00', '[\"*\"]', NULL, NULL, '2022-09-03 17:26:15', '2022-09-03 17:26:15'),
(14, 'App\\Models\\User', 2, 'tokens', '14708d9383b399ac471bc106a7ec6bef7b7b6b6ab6f129176f742cb08bdd4791', '[\"*\"]', NULL, NULL, '2022-09-03 17:26:33', '2022-09-03 17:26:33'),
(15, 'App\\Models\\User', 2, 'tokens', 'dd32798f92723ed8a9fa48653a2f8112f853805b4de1e47dca07605dd8796e5b', '[\"*\"]', NULL, NULL, '2022-09-03 17:38:22', '2022-09-03 17:38:22'),
(16, 'App\\Models\\User', 2, 'tokens', '2857896a2df0f927af8dec9f8609459163a7101d1f52051796bfbb1c3c8a10d2', '[\"*\"]', NULL, NULL, '2022-09-03 17:40:00', '2022-09-03 17:40:00'),
(17, 'App\\Models\\User', 2, 'tokens', '5e291cf54f25d1b02f800d910f51ef30e1b26487ed9d1ad656dc2e8e3817757e', '[\"*\"]', NULL, NULL, '2022-09-03 17:40:27', '2022-09-03 17:40:27'),
(18, 'App\\Models\\User', 2, 'tokens', 'c74dff651a32a27ae21416029ce7eae8c6b8d025b724caf0663eb799b82f3ae1', '[\"*\"]', NULL, NULL, '2022-09-03 17:41:43', '2022-09-03 17:41:43'),
(19, 'App\\Models\\User', 2, 'tokens', '1f57c7208a0508eec1f413f74344c1be1caa0600fe6bc491ea2c7e0965b207f2', '[\"*\"]', NULL, NULL, '2022-09-03 17:41:57', '2022-09-03 17:41:57'),
(20, 'App\\Models\\User', 2, 'tokens', 'e1bfcbce112f0c90da8c5246b4b2dacf2c4ae9f54c5e1b2afa9c5754f0af0cd2', '[\"*\"]', NULL, NULL, '2022-09-03 17:42:37', '2022-09-03 17:42:37'),
(21, 'App\\Models\\User', 2, 'tokens', '7ace414fec4299fbaae20c821e43a886c4d3d7d6aa8242a47906bf528f257050', '[\"*\"]', NULL, NULL, '2022-09-03 17:44:27', '2022-09-03 17:44:27'),
(22, 'App\\Models\\User', 2, 'tokens', '58aa60211f64a401ccf64c23bac2a1ddfef3b88a4a9bbd2f7125d1d76e88975b', '[\"*\"]', NULL, NULL, '2022-09-03 17:46:44', '2022-09-03 17:46:44'),
(23, 'App\\Models\\User', 2, 'tokens', 'bb1e3cfce96e29bae3346234eacc57d940b6cb7c4327d53f4d405f8110de7b58', '[\"*\"]', NULL, NULL, '2022-09-03 17:48:10', '2022-09-03 17:48:10'),
(24, 'App\\Models\\User', 2, 'tokens', '9f6a1d702be9870f1a7791458017b3650cd074f11e0311cc2389422eb3fe2c9d', '[\"*\"]', NULL, NULL, '2022-09-03 17:48:21', '2022-09-03 17:48:21'),
(25, 'App\\Models\\User', 2, 'tokens', 'e6bc715386623775e4f5662047a02d15e1e5da0f10e7be59c6d563eda32da1ca', '[\"*\"]', NULL, NULL, '2022-09-03 17:49:03', '2022-09-03 17:49:03'),
(26, 'App\\Models\\User', 2, 'tokens', 'a0d8f0b5bd7eb585d67c95b8444af30f5bc435a8e70854b44acbfedcf2a00dc8', '[\"*\"]', NULL, NULL, '2022-09-03 17:49:49', '2022-09-03 17:49:49'),
(27, 'App\\Models\\User', 2, 'tokens', '2fc99fd1529374e84fe240cc3ea1db098ab1ebaaac3ef5f68a2e8ff4c322ae2b', '[\"*\"]', NULL, NULL, '2022-09-03 17:52:39', '2022-09-03 17:52:39'),
(28, 'App\\Models\\User', 2, 'tokens', '534d34c48bed52e0aa17200dbfea8cbdf218e46c51374886c27725cf59b22540', '[\"*\"]', NULL, NULL, '2022-09-03 17:53:55', '2022-09-03 17:53:55'),
(29, 'App\\Models\\User', 2, 'tokens', '59cc64fd741d0f9a60a4fea7cace563372696505c709f4e83f2b76edcd8f7db2', '[\"*\"]', NULL, NULL, '2022-09-03 17:54:40', '2022-09-03 17:54:40'),
(30, 'App\\Models\\User', 2, 'tokens', 'feb3e0cc3712f568b091ebc70faea72a6fcbeeb0fda74225915d1c7dfc8a545a', '[\"*\"]', NULL, NULL, '2022-09-03 17:56:02', '2022-09-03 17:56:02'),
(31, 'App\\Models\\User', 2, 'tokens', '286e314f717acbff283d460635224153169de15b7e92d76a975d65d6d8750c13', '[\"*\"]', NULL, NULL, '2022-09-03 17:57:19', '2022-09-03 17:57:19'),
(32, 'App\\Models\\User', 2, 'tokens', '7c325792e1a79d9c37297643ef1238046af2502e68f61c675f3c85884995a683', '[\"*\"]', NULL, NULL, '2022-09-03 17:58:42', '2022-09-03 17:58:42'),
(33, 'App\\Models\\User', 2, 'tokens', '2d6e6eb2098c33465e72c6aca54c42ac091fb48baa34e04d73b0db315544340a', '[\"*\"]', NULL, NULL, '2022-09-03 17:59:10', '2022-09-03 17:59:10'),
(34, 'App\\Models\\User', 2, 'tokens', '7c2cdf60edea45b491e8dac64d523e0c1372d4127b2e473b39ec7440f8fe20e2', '[\"*\"]', NULL, NULL, '2022-09-03 18:00:13', '2022-09-03 18:00:13'),
(35, 'App\\Models\\User', 2, 'tokens', '7654d55d214a70190079a0f3ce3ce0464a3bd3fd491479e8706e95286b52c25e', '[\"*\"]', NULL, NULL, '2022-09-03 18:01:12', '2022-09-03 18:01:12'),
(36, 'App\\Models\\User', 2, 'tokens', 'b40b86703b7f333abc8f4e4bdde9b38dacc01fd3bb2280c08bcf784e3de60cd8', '[\"*\"]', NULL, NULL, '2022-09-03 18:04:50', '2022-09-03 18:04:50'),
(37, 'App\\Models\\User', 2, 'tokens', 'cea4dab6200bc2ba439cae51ac265e33a24c07cebd444f39b8f008fdbeb33fce', '[\"*\"]', NULL, NULL, '2022-09-03 18:05:09', '2022-09-03 18:05:09'),
(38, 'App\\Models\\User', 2, 'tokens', '802091d553da65485e6d396761d703c89802b0c317f21de4147944662d09339b', '[\"*\"]', NULL, NULL, '2022-09-03 18:09:06', '2022-09-03 18:09:06'),
(39, 'App\\Models\\User', 2, 'tokens', 'ab8baa8c38fbd4ff469f791f0baa9d20cc127f655ad074003bb4ae473b0a13c4', '[\"*\"]', NULL, NULL, '2022-09-03 18:10:03', '2022-09-03 18:10:03'),
(40, 'App\\Models\\User', 2, 'tokens', '2f397d06807f48856a29a2e542363170eea61f5ce1692cfad44b58827c44d4f9', '[\"*\"]', NULL, NULL, '2022-09-03 18:10:13', '2022-09-03 18:10:13'),
(41, 'App\\Models\\User', 2, 'tokens', '71ee38490a09d30ebf32c65ff56ecda9b6574891674310d8a0fd97b9e02fd25e', '[\"*\"]', NULL, NULL, '2022-09-03 18:11:22', '2022-09-03 18:11:22'),
(42, 'App\\Models\\User', 2, 'tokens', '269de1d9a8cfd183a9e2597513dd62a88fc430dbee6082358fe4c74699820b5b', '[\"*\"]', NULL, NULL, '2022-09-04 02:39:43', '2022-09-04 02:39:43'),
(43, 'App\\Models\\User', 2, 'tokens', '19d9513c7ec904a5b23bc153f49371da6f2d935198d8afb9f387df881281814b', '[\"*\"]', NULL, NULL, '2022-09-04 02:48:20', '2022-09-04 02:48:20'),
(44, 'App\\Models\\User', 2, 'tokens', '33cb1d22b5be64e407c47ac5e83690c7d68f2e795960944595783e3b5f6b4c36', '[\"*\"]', NULL, NULL, '2022-09-04 03:10:54', '2022-09-04 03:10:54'),
(45, 'App\\Models\\User', 2, 'tokens', 'b752e0a0b38bfec14f4af5b7bbd9d0ccc325ed43257db12a2fc5dec51cb1e163', '[\"*\"]', NULL, NULL, '2022-09-04 03:14:48', '2022-09-04 03:14:48'),
(47, 'App\\Models\\User', 5, 'tokens', 'd2e4784f4f816b24fe9669878d764e29ab7c0bb9aff50f40d3fbc516102e31ca', '[\"*\"]', NULL, NULL, '2022-09-04 04:41:38', '2022-09-04 04:41:38'),
(48, 'App\\Models\\User', 6, 'tokens', '0a0d29fd507ebcae9d7df5092d71815415f2164aa38f04437ce5f58cb55b64cf', '[\"*\"]', NULL, NULL, '2022-09-04 04:43:22', '2022-09-04 04:43:22'),
(49, 'App\\Models\\User', 7, 'tokens', 'c5c5e460d1d153c083e107cf6da18d1da4e413b5ad5de75910f7da527487c149', '[\"*\"]', NULL, NULL, '2022-09-04 04:44:10', '2022-09-04 04:44:10'),
(50, 'App\\Models\\User', 8, 'tokens', 'b4db3719bc3b675564a09a44a9ec6d685b3e5715091338dc673c6b28da18336c', '[\"*\"]', NULL, NULL, '2022-09-04 04:45:41', '2022-09-04 04:45:41'),
(51, 'App\\Models\\User', 9, 'tokens', '308b121ab049a31c43512b2416162b3ceb652a3bae84b27fdce8c69ecd97ea95', '[\"*\"]', NULL, NULL, '2022-09-04 05:17:21', '2022-09-04 05:17:21'),
(52, 'App\\Models\\User', 10, 'tokens', 'de3f1e2d74487405dfafa62a30fdacfe716648bc388b914ce9db50b7a4ad1220', '[\"*\"]', NULL, NULL, '2022-09-04 05:18:08', '2022-09-04 05:18:08'),
(53, 'App\\Models\\User', 11, 'tokens', 'c1d6659dd4215425d3e7a1d923231a5c4b72747a8a2ed780392dd9dbf289583d', '[\"*\"]', NULL, NULL, '2022-09-04 05:20:16', '2022-09-04 05:20:16'),
(54, 'App\\Models\\User', 11, 'auth_token', '66776b44220da6eded3dce2f902356506a730c6ba4b31457a5d94d0480759da8', '[\"*\"]', NULL, NULL, '2022-09-04 07:22:28', '2022-09-04 07:22:28'),
(55, 'App\\Models\\User', 11, 'auth_token', '3517445e15845beba1db6cee86b81608aadf1e301d950cb2ead6d267d2af6644', '[\"*\"]', '2022-09-11 04:31:24', NULL, '2022-09-11 04:19:50', '2022-09-11 04:31:24'),
(56, 'App\\Models\\User', 11, 'auth_token', '4ec403b68dd1740e0d788ab81d7ee09304e88c24a2b4897e4b890af9ff8c2009', '[\"*\"]', '2022-09-17 08:27:54', NULL, '2022-09-13 13:35:31', '2022-09-17 08:27:54');

-- --------------------------------------------------------

--
-- Table structure for table `prdouct_tag_relation`
--

CREATE TABLE `prdouct_tag_relation` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `tag_id` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prdouct_tag_relation`
--

INSERT INTO `prdouct_tag_relation` (`id`, `product_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(1, 34, 1, '2022-12-05 13:03:33', '2022-12-05 13:03:33'),
(2, 31, 1, '2022-12-05 13:03:33', '2022-12-05 13:03:33'),
(3, 34, 2, '2022-12-05 13:03:33', '2022-12-05 13:03:33'),
(4, 34, 4, '2022-12-05 13:03:33', '2022-12-05 13:03:33');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(30) NOT NULL,
  `slug` varchar(30) NOT NULL,
  `description` text DEFAULT NULL,
  `sku` tinytext DEFAULT NULL,
  `price` double DEFAULT NULL,
  `short_description` tinytext DEFAULT NULL,
  `image` text DEFAULT NULL,
  `images` tinytext DEFAULT NULL,
  `featured` tinyint(4) NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 0,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `vendor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tags_id` text DEFAULT NULL,
  `unit_id` bigint(20) DEFAULT NULL,
  `meta_title` varchar(100) DEFAULT NULL,
  `low_stock` double NOT NULL DEFAULT 0,
  `meta_description` tinytext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `description`, `sku`, `price`, `short_description`, `image`, `images`, `featured`, `active`, `category_id`, `brand_id`, `vendor_id`, `tags_id`, `unit_id`, `meta_title`, `low_stock`, `meta_description`, `created_at`, `updated_at`) VALUES
(34, 'Prince Biscuits - 12/10', 'prince-biscuits', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum. Morbi ornare lectus quis justo gravida semper. Nulla tellus mi, vulputate adipiscing cursus eu,', 'kkkk', 10, '...', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221202125117.jpg', NULL, 0, 1, 44, 1, 1, '1,2,3,5', 4, NULL, 0, NULL, '2022-11-06 14:26:21', '2022-11-06 14:26:48'),
(35, 'Product 3', 'product3', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum. Morbi ornare lectus quis justo gravida semper. Nulla tellus mi, vulputate adipiscing cursus eu,', 'product3', 29, 'dess', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221202125117.jpg', NULL, 0, 0, 43, 2, 2, '1,2,3,5', 1, NULL, 0, NULL, '2022-12-02 07:31:22', '2022-12-02 07:31:22'),
(36, 'Prince Biscuits 5', 'prince-biscuits5', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum. Morbi ornare lectus quis justo gravida semper. Nulla tellus mi, vulputate adipiscing cursus eu,', 'kkkk', 30, '...', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221202125117.jpg', NULL, 0, 1, 40, 4, 3, '1,2,3,5', 4, NULL, 0, NULL, '2022-11-06 14:26:21', '2022-11-06 14:26:48'),
(37, 'Prince Biscuits 6', 'prince-biscuits6', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum. Morbi ornare lectus quis justo gravida semper. Nulla tellus mi, vulputate adipiscing cursus eu,', 'kkkk', 40, '...', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221202125117.jpg', NULL, 0, 1, 38, 1, 4, '1,2,3,5', 4, NULL, 0, NULL, '2022-11-06 14:26:21', '2022-11-06 14:26:48'),
(38, 'Prince Biscuits 7', 'prince-biscuits7', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum. Morbi ornare lectus quis justo gravida semper. Nulla tellus mi, vulputate adipiscing cursus eu,', 'kkkk', 50, '...', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221202125117.jpg', NULL, 0, 1, 37, 1, 1, '1,2,3,5', 4, NULL, 0, NULL, '2022-11-06 14:26:21', '2022-11-06 14:26:48'),
(39, 'Prince Biscuits 8', 'prince-biscuits8', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum. Morbi ornare lectus quis justo gravida semper. Nulla tellus mi, vulputate adipiscing cursus eu,', 'kkkk', 60, '...', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221202125117.jpg', NULL, 0, 1, 28, 1, 2, '1,2,3,5', 4, NULL, 0, NULL, '2022-11-06 14:26:21', '2022-11-06 14:26:48'),
(40, 'Prince Biscuits 9', 'prince-biscuits9', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum. Morbi ornare lectus quis justo gravida semper. Nulla tellus mi, vulputate adipiscing cursus eu,', 'kkkk', 70, '...', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221202125117.jpg', NULL, 0, 1, 28, 1, 3, '1,2,3,5', 4, NULL, 0, NULL, '2022-11-06 14:26:21', '2022-11-06 14:26:48'),
(41, 'Prince Biscuits 10', 'prince-biscuits10', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum. Morbi ornare lectus quis justo gravida semper. Nulla tellus mi, vulputate adipiscing cursus eu,', 'kkkk', 71, '...', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221202125117.jpg', NULL, 0, 1, 24, 1, 4, '1,2,3,5', 4, NULL, 0, NULL, '2022-11-06 14:26:21', '2022-11-06 14:26:48'),
(42, 'Prince Biscuits 10', 'prince-biscuits10', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum. Morbi ornare lectus quis justo gravida semper. Nulla tellus mi, vulputate adipiscing cursus eu,', 'kkkk', 72, '...', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221202125117.jpg', NULL, 0, 1, 24, 1, 1, '1,2,3,5', 4, NULL, 0, NULL, '2022-11-06 14:26:21', '2022-11-06 14:26:48'),
(43, 'Prince Biscuits 10', 'prince-biscuits10', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum. Morbi ornare lectus quis justo gravida semper. Nulla tellus mi, vulputate adipiscing cursus eu,', 'kkkk', 73, '...', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221202125117.jpg', NULL, 0, 1, 24, 1, 2, '1,2,3,5', 4, NULL, 0, NULL, '2022-11-06 14:26:21', '2022-11-06 14:26:48'),
(44, 'Prince Biscuits 10', 'prince-biscuits10', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum. Morbi ornare lectus quis justo gravida semper. Nulla tellus mi, vulputate adipiscing cursus eu,', 'kkkk', 74, '...', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221202125117.jpg', NULL, 0, 1, 24, 4, 3, '1,2,3,5', 4, NULL, 0, NULL, '2022-11-06 14:26:21', '2022-11-06 14:26:48'),
(45, 'Prince Biscuits 10', 'prince-biscuits10', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum. Morbi ornare lectus quis justo gravida semper. Nulla tellus mi, vulputate adipiscing cursus eu,', 'kkkk', 75, '...', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221202125117.jpg', NULL, 0, 1, 24, 1, 4, '1,2,3,5', 4, NULL, 0, NULL, '2022-11-06 14:26:21', '2022-11-06 14:26:48'),
(46, 'Prince Biscuits 10', 'prince-biscuits10', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum. Morbi ornare lectus quis justo gravida semper. Nulla tellus mi, vulputate adipiscing cursus eu,', 'kkkk', 76, '...', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221202125117.jpg', NULL, 0, 1, 24, 1, 1, '1,2,3,5', 4, NULL, 0, NULL, '2022-11-06 14:26:21', '2022-11-06 14:26:48'),
(47, 'Prince Biscuits 10', 'prince-biscuits10', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum. Morbi ornare lectus quis justo gravida semper. Nulla tellus mi, vulputate adipiscing cursus eu,', 'kkkk', 77, '...', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221202125117.jpg', NULL, 0, 1, 24, 4, 2, '1,2,3,5', 4, NULL, 0, NULL, '2022-11-06 14:26:21', '2022-11-06 14:26:48'),
(48, 'Prince Biscuits 10', 'prince-biscuits10', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum. Morbi ornare lectus quis justo gravida semper. Nulla tellus mi, vulputate adipiscing cursus eu,', 'kkkk', 88, '...', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221202125117.jpg', NULL, 0, 1, 24, 1, 3, '1,2,3,5', 4, NULL, 0, NULL, '2022-11-06 14:26:21', '2022-11-06 14:26:48'),
(49, 'Prince Biscuits 10', 'prince-biscuits10', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum. Morbi ornare lectus quis justo gravida semper. Nulla tellus mi, vulputate adipiscing cursus eu,', 'kkkk', 81, '...', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221202125117.jpg', NULL, 0, 1, 24, 1, 4, '1,2', 4, NULL, 0, NULL, '2022-11-06 14:26:21', '2022-11-06 14:26:48'),
(50, 'Prince Biscuits 10', 'prince-biscuits10', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum. Morbi ornare lectus quis justo gravida semper. Nulla tellus mi, vulputate adipiscing cursus eu,', 'kkkk', 82, '...', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221202125117.jpg', NULL, 0, 1, 24, 1, 1, '1,2,5', 4, NULL, 0, NULL, '2022-11-06 14:26:21', '2022-11-06 14:26:48'),
(51, 'Prince Biscuits 10', 'prince-biscuits10', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum. Morbi ornare lectus quis justo gravida semper. Nulla tellus mi, vulputate adipiscing cursus eu,', 'kkkk', 83, '...', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221202125117.jpg', NULL, 0, 1, 24, 1, 2, '2,3,5', 4, NULL, 0, NULL, '2022-11-06 14:26:21', '2022-11-06 14:26:48'),
(52, 'Prince Biscuits 10', 'prince-biscuits10', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum. Morbi ornare lectus quis justo gravida semper. Nulla tellus mi, vulputate adipiscing cursus eu,', 'kkkk', 85, '...', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221202125117.jpg', NULL, 0, 1, 24, 1, 3, '1,2,5', 4, NULL, 0, NULL, '2022-11-06 14:26:21', '2022-11-06 14:26:48'),
(53, 'Prince Biscuits 10', 'prince-biscuits10', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum. Morbi ornare lectus quis justo gravida semper. Nulla tellus mi, vulputate adipiscing cursus eu,', 'kkkk', 89, '...', 'https://www.backend.azamsolutions.com/public/uploads/all/999999999920221202125117.jpg', NULL, 0, 1, 24, 1, 4, '1,2,3', 4, NULL, 0, NULL, '2022-11-06 14:26:21', '2022-11-06 14:26:48');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `description` text DEFAULT NULL,
  `rating` double DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `user_id`, `product_id`, `description`, `rating`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 34, NULL, 0, NULL, '2022-08-20 17:10:23', '2022-08-20 19:09:22'),
(2, 1, 34, NULL, 0, NULL, '2022-08-20 17:10:23', '2022-08-20 17:10:23'),
(3, 1, 34, NULL, 0, NULL, '2022-08-20 17:10:23', '2022-08-20 17:10:23'),
(4, 1, 0, NULL, 0, NULL, '2022-08-20 17:10:23', '2022-08-20 17:10:23'),
(5, 1, 34, NULL, 0, NULL, '2022-08-20 17:10:23', '2022-08-20 17:10:23'),
(6, 1, 34, NULL, 0, NULL, '2022-08-20 17:10:23', '2022-08-20 17:10:23'),
(7, 1, 34, NULL, 0, NULL, '2022-08-20 17:10:23', '2022-08-20 17:10:23'),
(8, 1, 34, NULL, 0, NULL, '2022-08-20 17:10:23', '2022-08-20 17:10:23'),
(9, 1, 34, NULL, 0, NULL, '2022-08-20 17:10:23', '2022-08-20 17:10:23'),
(10, 1, 34, NULL, 0, NULL, '2022-08-20 17:10:23', '2022-08-20 17:10:23'),
(11, 1, 34, NULL, 0, NULL, '2022-08-20 17:10:23', '2022-08-20 17:10:23'),
(12, 1, 34, NULL, 0, NULL, '2022-08-20 17:10:23', '2022-08-20 17:10:23'),
(13, 1, 34, NULL, 0, NULL, '2022-08-20 17:10:23', '2022-08-20 17:10:23'),
(14, 1, 34, NULL, 0, NULL, '2022-08-20 17:10:23', '2022-08-20 17:10:23'),
(15, 1, 34, NULL, 0, NULL, '2022-08-20 17:10:23', '2022-08-20 17:10:23'),
(16, 1, 34, NULL, 0, NULL, '2022-08-20 17:10:23', '2022-08-20 17:10:23'),
(17, 1, 34, NULL, 0, NULL, '2022-08-20 17:10:23', '2022-08-20 17:10:23'),
(18, 1, 34, NULL, 0, NULL, '2022-08-20 17:10:23', '2022-08-20 17:10:23'),
(19, 1, 34, NULL, 0, NULL, '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(20, 1, 34, NULL, 0, NULL, '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(21, 1, 34, NULL, 0, NULL, '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(22, 1, 34, NULL, 0, NULL, '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(23, 1, 34, NULL, 0, NULL, '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(24, 1, 34, NULL, 0, NULL, '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(25, 1, 34, NULL, 0, NULL, '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(26, 0, 0, NULL, 0, NULL, '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(27, 0, 0, NULL, 0, NULL, '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(28, 0, 0, NULL, 0, NULL, '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(29, 0, 0, NULL, 0, NULL, '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(30, 0, 0, NULL, 0, NULL, '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(31, 0, 0, NULL, 0, NULL, '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(32, 0, 0, NULL, 0, NULL, '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(33, 0, 0, NULL, 0, NULL, '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(34, 0, 0, NULL, 0, NULL, '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(35, 0, 0, NULL, 0, NULL, '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(36, 0, 0, NULL, 0, NULL, '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(37, 0, 0, NULL, 0, NULL, '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(38, 0, 0, NULL, 0, NULL, '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(39, 0, 0, NULL, 0, NULL, '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(40, 0, 0, NULL, 0, NULL, '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(41, 0, 0, NULL, 0, NULL, '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(42, 0, 0, NULL, 0, NULL, '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(43, 0, 0, NULL, 0, NULL, '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(44, 0, 0, NULL, 0, NULL, '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(45, 0, 0, NULL, 0, NULL, '2022-08-20 17:10:24', '2022-08-20 17:10:24'),
(46, 0, 0, NULL, 0, NULL, '2022-08-20 17:10:25', '2022-08-20 17:10:25'),
(47, 0, 0, NULL, 0, NULL, '2022-08-20 17:10:25', '2022-08-20 17:10:25'),
(48, 0, 0, NULL, 0, NULL, '2022-08-20 17:10:25', '2022-08-20 17:10:25'),
(49, 0, 0, NULL, 0, NULL, '2022-08-20 17:10:25', '2022-08-20 17:10:25'),
(50, 0, 0, NULL, 0, NULL, '2022-08-20 17:10:25', '2022-08-20 17:10:25'),
(51, 0, 0, NULL, 0, NULL, '2022-08-20 12:45:10', '2022-08-20 12:45:10'),
(52, 0, 0, NULL, 0, NULL, '2022-08-20 17:15:51', '2022-08-20 17:15:51'),
(53, 0, 0, NULL, 0, NULL, '2022-08-20 17:17:23', '2022-08-20 17:17:23'),
(54, 0, 0, NULL, 0, NULL, '2022-08-20 17:33:26', '2022-08-20 17:33:26'),
(55, 0, 0, NULL, 0, NULL, '2022-08-20 17:33:51', '2022-08-20 17:34:34'),
(56, 0, 0, NULL, 0, NULL, '2022-08-20 17:52:06', '2022-08-20 17:55:18'),
(57, 0, 0, NULL, 0, NULL, '2022-08-20 19:09:50', '2022-08-20 19:09:50'),
(58, 0, 0, NULL, 0, NULL, '2022-09-13 13:37:00', '2022-09-13 13:37:00'),
(112, 1, 34, 'nicerwview', 10, '1', '2022-12-05 06:46:34', '2022-12-05 06:46:34'),
(113, 1, 34, 'nicerwview', 10, '1', '2022-12-05 06:47:30', '2022-12-05 06:47:30');

-- --------------------------------------------------------

--
-- Table structure for table `product_tags`
--

CREATE TABLE `product_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `slug` varchar(120) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_tags`
--

INSERT INTO `product_tags` (`id`, `title`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Oppo', 'oppo', '2022-09-17 12:52:58', '2022-09-17 12:52:58'),
(3, 'Samsung', 'samsung', '2022-09-17 12:52:58', '2022-09-17 12:52:58'),
(4, 'Q Mobile', 'q-mobile', '2022-09-17 12:52:58', '2022-09-17 12:52:58'),
(5, 'Nadeem Electronics', 'nadeem-electronics', '2022-09-17 12:52:58', '2022-09-17 12:52:58'),
(6, 'Xaomi', 'xaomi', '2022-09-17 12:52:58', '2022-09-17 12:52:58'),
(7, 'Lays', 'lays', '2022-09-17 12:52:58', '2022-09-17 12:52:58'),
(8, 'Asus', 'asus', '2022-09-17 12:52:58', '2022-09-17 12:52:58'),
(9, 'Dell', 'dell', '2022-09-17 12:52:58', '2022-09-17 12:52:58'),
(10, 'head and Shoulder', 'head-and-shoulder', '2022-09-17 12:52:58', '2022-09-17 12:52:58'),
(11, 'Good Milk', 'good-milk', '2022-09-17 12:52:58', '2022-09-17 12:52:58'),
(12, 'Pepsi', 'pepsi', '2022-09-17 12:52:58', '2022-09-17 12:52:58'),
(13, 'Dew', 'dew', '2022-09-17 12:52:58', '2022-09-17 12:52:58');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_orders`
--

CREATE TABLE `purchase_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `serial_no` tinytext DEFAULT NULL,
  `ref` text DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` text DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `tax` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase_orders`
--

INSERT INTO `purchase_orders` (`id`, `vendor_id`, `serial_no`, `ref`, `date`, `status`, `subtotal`, `discount`, `tax`, `total`, `description`, `created_at`, `updated_at`) VALUES
(13, 2, '15252oo', 'Fbv23', '2022-11-08 00:28:43', 'approved', 996, 10, 2, 1004, 'Dessdxxx', '2022-11-06 14:29:41', '2022-11-06 18:03:02');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_items`
--

CREATE TABLE `purchase_order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL,
  `price` double DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `cost` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `tax` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase_order_items`
--

INSERT INTO `purchase_order_items` (`id`, `product_id`, `parent_id`, `price`, `quantity`, `cost`, `discount`, `tax`, `total`, `description`, `created_at`, `updated_at`) VALUES
(25, 34, 13, 20, 20, 400, 0, 0, 400, 'Des', '2022-11-06 14:30:57', '2022-11-06 14:30:57'),
(26, 34, 13, 20, 30, 600, 5, 9, 596, NULL, '2022-11-06 14:31:49', '2022-11-06 14:31:49');

-- --------------------------------------------------------

--
-- Table structure for table `sale_orders`
--

CREATE TABLE `sale_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `serial_no` tinytext DEFAULT NULL,
  `ref` text DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` text DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `tax` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sale_order_items`
--

CREATE TABLE `sale_order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL,
  `price` double DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `cost` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `tax` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(30) CHARACTER SET latin1 NOT NULL,
  `slug` varchar(30) CHARACTER SET latin1 NOT NULL,
  `description` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `thumbnail` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `gallery` tinytext DEFAULT NULL,
  `featured` int(11) NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  `excerpt` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `category_id`, `title`, `slug`, `description`, `thumbnail`, `gallery`, `featured`, `status`, `excerpt`, `created_at`, `updated_at`) VALUES
(1, 1, 'Category 1', '', NULL, NULL, NULL, 0, NULL, NULL, '2022-08-20 12:52:32', '2022-08-20 12:52:32'),
(2, 1, 'Category 2', '', NULL, NULL, NULL, 0, NULL, NULL, '2022-08-20 12:52:32', '2022-08-20 12:52:32'),
(4, 2, 'Category 4', '', NULL, NULL, NULL, 0, NULL, NULL, '2022-08-20 12:52:57', '2022-08-20 12:52:57'),
(5, 3, 'Category 5', '', NULL, NULL, NULL, 0, NULL, NULL, '2022-08-20 12:52:57', '2022-08-20 12:52:57'),
(6, 3, 'Category 6', '', NULL, NULL, NULL, 0, NULL, NULL, '2022-08-20 12:52:57', '2022-08-20 12:52:57'),
(8, 4, 'Category 8', 'cat8', NULL, NULL, NULL, 0, NULL, NULL, '2022-08-20 08:58:15', '2022-08-20 08:58:15'),
(9, 5, 'Category 90', 'cat-8', NULL, NULL, NULL, 0, NULL, NULL, '2022-08-20 09:19:20', '2022-08-20 09:19:20'),
(10, 5, 'Category00', 'cat-89', NULL, NULL, NULL, 0, NULL, NULL, '2022-08-20 09:21:26', '2022-08-20 09:21:26'),
(11, 1, 'Category001', 'cat-891', NULL, NULL, NULL, 0, NULL, NULL, '2022-08-20 10:14:07', '2022-08-20 10:14:07'),
(12, 2, 'Category0011', '121', NULL, NULL, NULL, 0, NULL, NULL, '2022-08-21 06:00:37', '2022-08-21 06:00:37'),
(13, 3, 'Category00111', '1211', NULL, NULL, NULL, 0, NULL, NULL, '2022-08-21 06:01:28', '2022-08-21 06:01:28'),
(14, 4, 'Category001111', '12111', NULL, NULL, NULL, 0, NULL, NULL, '2022-08-21 06:01:58', '2022-08-21 06:01:58'),
(15, 5, 'Category0011111', '121111', NULL, NULL, NULL, 0, NULL, NULL, '2022-08-21 06:05:44', '2022-08-21 06:05:44'),
(16, 4, 'Category00111111', '1211111', NULL, NULL, NULL, 0, NULL, NULL, '2022-08-21 06:06:17', '2022-08-21 06:06:17'),
(17, 3, 'Category001111111', '12111111', NULL, NULL, NULL, 0, NULL, NULL, '2022-08-21 06:07:03', '2022-08-21 06:07:03'),
(18, 2, 'Category0011111111', '121111111', NULL, NULL, NULL, 0, NULL, NULL, '2022-08-21 06:12:15', '2022-08-21 06:12:15'),
(19, 4, 'Category00111111111', '1212', 'asdasdasdas122', NULL, NULL, 0, NULL, NULL, '2022-08-21 07:51:02', '2022-08-21 07:58:29'),
(20, 1, 'Category1', 'category1', 'des', NULL, NULL, 0, NULL, 'excerpt', '2022-09-16 15:15:45', '2022-09-16 15:15:45');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `received_at` bigint(20) UNSIGNED NOT NULL,
  `amount` double DEFAULT NULL,
  `type` varchar(50) NOT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `date`, `account_id`, `received_at`, `amount`, `type`, `description`, `created_at`, `updated_at`) VALUES
(1, '2022-11-30 12:41:10', 3, 7, 100, 'debit', 'desss', '2022-11-30 12:41:10', '2022-11-30 16:53:21'),
(5, '2022-11-29 17:02:00', 3, 2, 400, 'credit', 'desss', '2022-11-30 12:01:23', '2022-11-30 16:53:12'),
(6, '2022-12-01 16:21:10', 3, 2, 100, 'debit', 'ssssssssssss', '2022-12-01 11:20:32', '2022-12-01 11:20:32');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `short_name` varchar(100) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `title`, `slug`, `short_name`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Ampere', 'ampere', 'amp', 1, '2022-10-25 12:10:36', '2022-10-31 02:48:44'),
(2, 'kilogram', 'kilogram', 'kg', 0, '2022-10-25 12:10:36', '2022-10-31 02:48:15'),
(3, 'Meter', 'meter', 'mt', 1, '2022-10-25 12:10:36', '2022-10-31 02:44:00'),
(4, 'Packet', 'packet', 'pk', 0, '2022-10-25 12:10:36', '2022-11-30 03:29:54'),
(6, 'Liter', 'liter', 'ltr', 1, '2022-10-25 12:10:36', '2022-10-31 02:48:47'),
(7, 'piece', 'piece', 'pcs', 0, '2022-10-25 12:10:36', '2022-11-30 03:29:51'),
(8, 'Article', 'article', 'art', 1, '2022-10-25 12:10:36', '2022-10-31 02:48:51');

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

CREATE TABLE `uploads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `orignal_name` varchar(100) DEFAULT NULL,
  `path` varchar(100) DEFAULT NULL,
  `size` double DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatet_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `extension` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `terms` tinyint(4) NOT NULL DEFAULT 0,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notification` tinyint(4) NOT NULL DEFAULT 0,
  `email_verified` tinyint(4) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `title`, `name`, `type`, `email`, `password`, `image`, `terms`, `phone`, `notification`, `email_verified`, `remember_token`, `email_verified_at`, `country`, `state`, `city`, `zip_code`, `street_address`, `longitude`, `latitude`, `cover`, `thumbnail`, `status`, `details`, `created_at`, `updated_at`) VALUES
(1, '', 'owaisazam', 'customer', 'owaisazam@gmail.com', '$2y$10$82sRX31.mvv4F6kGgxqgL.a3W3SkLG0oj1AqWjjyE9tVrBJ5U6Ada', NULL, 0, NULL, 0, 0, NULL, NULL, NULL, 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'blocked', NULL, '2022-08-19 08:34:30', '2022-09-18 08:49:25'),
(11, 'owais1234', 'iamowaisazam', '', 'iamowaisazam@gmail.com', '$2y$10$HcrCyNNp.w/5.Xcddsg4K.8XNLRMtXky0zH1pJP4T2VgeOiuzDtYe', NULL, 1, '03112239342', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'approved', NULL, '2022-09-04 05:20:16', '2022-09-18 08:50:07'),
(12, 'owais12345', 'iamowaisazam5', '', 'iamowaisazam5@gmail.com', '$2y$10$HcrCyNNp.w/5.Xcddsg4K.8XNLRMtXky0zH1pJP4T2VgeOiuzDtYe', NULL, 1, '03112239342', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, '2022-09-04 05:20:16', '2022-09-18 08:49:32'),
(13, NULL, 'vendor1', 'vendor', 'vendor1@gmail.com', '$2y$10$gby6KHczQJNwRLucKL/Cf.z1NyK4TqXHnB8lnvQT1BuSb6q1Fa4Xa', NULL, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'approved', NULL, '2022-09-17 06:25:13', '2022-09-18 08:50:13'),
(14, NULL, 'customer', 'customer', 'customer1@gmail.com', '$2y$10$0YUjnn9./ra/xLsO2cuTnOijNqS70sioEn13SQ799.6DrVwm6168u', NULL, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'approved', NULL, '2022-09-17 07:02:54', '2022-09-18 08:50:23'),
(18, NULL, 'owaisazam1', 'guest', 'owaisazam1@gmail.com', '$2y$10$oifCKSA/diI3erDsBlr2y.cIgWR/VeZprZBgnL/gFQT6XlbbVRE7e', NULL, 0, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, '2022-09-18 05:24:38', '2022-09-18 08:49:54'),
(19, NULL, 'owaisazam22', 'guest', 'owaisazam22@gmail.com', '$2y$10$owML6ptX7rXxXdcEdFWTBO9MzLXx08NRzDaxf7INhrj8f2Uf/FiTK', NULL, 0, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'approved', NULL, '2022-09-18 05:25:42', '2022-09-18 08:49:59'),
(20, NULL, 'owaisazam33', 'guest', 'owaisazam33@gmail.com', '$2y$10$0K.ASqjbr5isnUm5bY/c/ejeDsR.KY.J86CLq2s.4WogyqjJddeem', NULL, 0, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, '2022-09-18 05:44:16', '2022-09-18 08:49:47'),
(21, NULL, 'owaisaza-m', 'guest', 'test@gmail.com', '$2y$10$S1Lkt4BnTXuc5AWcHqBi8.wsuoS4xSaObnK4kHi8hOQMGDTcL.v4.', NULL, 0, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, '2022-09-18 08:31:28', '2022-09-18 08:49:38'),
(22, NULL, 'owaisazam34', 'guest', 'owaisazam34@gmail.com', '$2y$10$BfHXWD7JNKYCGqxFKi5sUuV3r3In6oIbtU0G.vzQom6n7ZnfCgK3O', NULL, 0, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'approved', NULL, '2022-09-18 08:51:18', '2022-09-18 08:51:18');

-- --------------------------------------------------------

--
-- Table structure for table `user_email_verifications`
--

CREATE TABLE `user_email_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(50) NOT NULL,
  `token` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `verified_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_email_verifications`
--

INSERT INTO `user_email_verifications` (`id`, `user_id`, `email`, `token`, `created_at`, `verified_at`) VALUES
(1, 11, 'iamowaisazam@gmail.com', '782754', '2022-09-04 10:20:16', NULL),
(2, 11, 'iamowaisazam@gmail.com', '968864', '2022-09-04 10:20:53', '2022-09-04 05:23:48');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `name`, `slug`, `email`, `phone`, `country`, `state`, `city`, `zip_code`, `street_address`, `description`, `active`, `created_at`, `updated_at`) VALUES
(1, 'OSHTIAQ Bhai', 'oshtiaq-bhai', 'owaisazam@gmail.com', '1', '2', 'test', '3', '4', '5', '6', 0, '2022-08-19 08:34:30', '2022-11-06 14:28:26'),
(2, 'Wahab Bhai', 'wahab-bhai', 'wahab@gmail.com', '12312', '123', '232', NULL, NULL, NULL, NULL, 0, '2022-11-06 16:21:59', '2022-11-06 16:21:59'),
(3, 'Salman Bhai', 'salman-bhai', 'salman@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2022-11-06 16:22:38', '2022-11-06 16:22:38'),
(4, 'Walking Vendor', 'walking-vendor', 'walking@gmail.com', '123123', 'asd', 'asd', 'sds', 'sds', 'sdsd', 'sdsd', 0, '2022-11-07 04:37:24', '2022-11-07 04:37:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `account_categories`
--
ALTER TABLE `account_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent_id`);

--
-- Indexes for table `app`
--
ALTER TABLE `app`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `file_managers`
--
ALTER TABLE `file_managers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `prdouct_tag_relation`
--
ALTER TABLE `prdouct_tag_relation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_tags`
--
ALTER TABLE `product_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`vendor_id`);

--
-- Indexes for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `order_id` (`parent_id`);

--
-- Indexes for table `sale_orders`
--
ALTER TABLE `sale_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sale_order_items`
--
ALTER TABLE `sale_order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `received_at` (`received_at`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `user_email_verifications`
--
ALTER TABLE `user_email_verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `account_categories`
--
ALTER TABLE `account_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `app`
--
ALTER TABLE `app`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `file_managers`
--
ALTER TABLE `file_managers`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `prdouct_tag_relation`
--
ALTER TABLE `prdouct_tag_relation`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `product_tags`
--
ALTER TABLE `product_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `sale_orders`
--
ALTER TABLE `sale_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `sale_order_items`
--
ALTER TABLE `sale_order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `uploads`
--
ALTER TABLE `uploads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `user_email_verifications`
--
ALTER TABLE `user_email_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `account_categories` (`id`);

--
-- Constraints for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  ADD CONSTRAINT `purchase_order_items_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `purchase_orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`received_at`) REFERENCES `accounts` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
