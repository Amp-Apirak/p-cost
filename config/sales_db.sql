-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 25, 2024 at 07:51 PM
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
-- Database: `sales_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` char(36) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `company` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `company`, `address`, `phone`, `email`, `remark`, `created_by`, `created_at`) VALUES
('0', 'Apirapuk', 'PIT', 'เลขที่ 111/1 ธนพงษ์แมนชั่น ห้อง. 302 ซ. สันนิบาตเทศบาล แขวง จันทรเกษม', '0839595800', 'apira@gmail.com', 'เลขที่ 111/1 ธนพงษ์แมนชั่น ห้อง. 302 ซ. สันนิบาตเทศบาล แขวง จันทรเกษม', 2, '2024-09-25 08:16:44'),
('1', 'John Doe', 'TechCorp', '123 Main St, City A', '555-1234', 'john.doe@techcorp.com', 'ลูกค้าประจำ', 1, '2024-09-20 15:03:08'),
('10', 'Emma White', 'AutoMechanic', '707 Pinecone St, City J', '555-6789', 'emma.white@automechanic.com', 'ลูกค้าใหม่', 3, '2024-09-20 15:03:08'),
('11', 'Noah Harris', 'GreenEnergy', '808 Redwood St, City K', '555-2345', 'noah.harris@greenenergy.com', '', 2, '2024-09-20 15:03:08'),
('12', 'Ava Lewis', 'HealthPlus', '909 Sequoia St, City L', '555-5678', 'ava.lewis@healthplus.com', 'ลูกค้าประจำ', 1, '2024-09-20 15:03:08'),
('13', 'Benjamin Walker', 'BuildFuture', '1000 Willow St, City M', '555-7890', 'benjamin.walker@buildfuture.com', '', 2, '2024-09-20 15:03:08'),
('14', 'Mia Hall', 'StartUpLab', '1100 Cypress St, City N', '555-9012', 'mia.hall@startuplab.com', 'ลูกค้าใหม่', 3, '2024-09-20 15:03:08'),
('15', 'Lucas Clark', 'FinTech Solutions', '1200 Dogwood St, City O', '555-3456', 'lucas.clark@fintechsolutions.com', '', 1, '2024-09-20 15:03:08'),
('2', 'Jane Smith', 'Innovate Inc', '456 Elm St, City B', '555-5678', 'jane.smith@innovate.com', 'ลูกค้าใหม่', 2, '2024-09-20 15:03:08'),
('3', 'Michael Brown', 'Design Solutions', '789 Oak St, City C', '555-7890', 'michael.brown@design.com', '', 1, '2024-09-20 15:03:08'),
('4', 'Emily Davis', 'BuildIt', '101 Pine St, City D', '555-2345', 'emily.davis@buildit.com', 'ลูกค้าโครงการใหญ่', 3, '2024-09-20 15:03:08'),
('5', 'William Johnson', 'ConstructCo', '202 Maple St, City E', '555-6789', 'william.johnson@constructco.com', '', 2, '2024-09-20 15:03:08'),
('6', 'Olivia Wilson', 'WebCreatives', '303 Birch St, City F', '555-3456', 'olivia.wilson@webcreatives.com', 'ลูกค้าโครงการเล็ก', 1, '2024-09-20 15:03:08'),
('7', 'James Taylor', 'MarketingPro', '404 Cedar St, City G', '555-9012', 'james.taylor@marketingpro.com', '', 3, '2024-09-20 15:03:08'),
('8', 'Sophia Anderson', 'Smart Solutions', '505 Aspen St, City H', '555-7890', 'sophia.anderson@smartsolutions.com', 'ลูกค้าประจำ', 2, '2024-09-20 15:03:08'),
('9', 'Liam Martinez', 'SecurityTech', '606 Spruce St, City I', '555-4567', 'liam.martinez@securitytech.com', '', 1, '2024-09-20 15:03:08'),
('99bd8425-10a1-4f31-92a7-95d7cfe5648a', 'ทดสอบ', 'ทดสอบ', 'ทดสอบ', '0839595654', 'sdfs@gmail.com', 'sfdsfdfd', 2, '2024-09-25 11:09:17'),
('d178cd84-7ad8-4225-b044-381bd602a1e2', 'หดหกดหกด', 'หกดกหดกหด', 'กหดกหดกหดกห', '0839596547', 'ba@gmail.com', 'เหกเกเกหดเกหเหกด', 2, '2024-09-25 11:15:48'),
('e168d70a-ac37-49bd-8eb0-3c28e8696238', 'กหดฟกหดด', 'ฟกหดฟกหด', 'ฟกหดฟกหดฟกห', '0839545678', 'sdfdsfs@gmail.com', 'sdfdsfsdfdsf', 2, '2024-09-25 11:12:28');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` char(36) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_description` text DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_description`, `created_by`, `created_at`) VALUES
('1', 'Product A', 'This is a description for Product A.', '1', '2024-09-24 15:46:16'),
('10', 'Product J', 'This is a description for Product J.', '5', '2024-09-24 15:46:16'),
('2', 'Product B', 'This is a description for Product B.', '1', '2024-09-24 15:46:16'),
('3', 'Product C', 'This is a description for Product C.', '2', '2024-09-24 15:46:16'),
('4', 'Product D', 'This is a description for Product D.', '2', '2024-09-24 15:46:16'),
('5', 'Product E', 'This is a description for Product E.', '3', '2024-09-24 15:46:16'),
('6', 'Product F', 'This is a description for Product F.', '3', '2024-09-24 15:46:16'),
('7', 'Product G', 'This is a description for Product G.', '4', '2024-09-24 15:46:16'),
('8', 'Product H', 'This is a description for Product H.', '4', '2024-09-24 15:46:16'),
('9', 'Product I', 'This is a description for Product I.', '5', '2024-09-24 15:46:16');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `project_id` char(36) NOT NULL,
  `project_name` varchar(255) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `contract_no` varchar(50) DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `sales_date` date DEFAULT NULL,
  `seller` char(36) DEFAULT NULL,
  `sale_no_vat` decimal(10,2) DEFAULT NULL,
  `sale_vat` decimal(10,2) DEFAULT NULL,
  `cost_no_vat` decimal(10,2) DEFAULT NULL,
  `cost_vat` decimal(10,2) DEFAULT NULL,
  `gross_profit` decimal(10,2) DEFAULT NULL,
  `potential` decimal(5,2) NOT NULL COMMENT 'กำไรขั้นต้นแบบเปอร์เซ็นต์',
  `es_sale_no_vat` decimal(10,2) DEFAULT NULL,
  `es_cost_no_vat` decimal(10,2) DEFAULT NULL,
  `es_gp_no_vat` decimal(10,2) DEFAULT NULL,
  `customer_id` char(36) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` char(36) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `product_id` char(36) DEFAULT NULL,
  `vat` decimal(5,2) NOT NULL DEFAULT 0.00 COMMENT 'ภาษีมูลค่าเพิ่ม'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`project_id`, `project_name`, `start_date`, `end_date`, `status`, `contract_no`, `remark`, `sales_date`, `seller`, `sale_no_vat`, `sale_vat`, `cost_no_vat`, `cost_vat`, `gross_profit`, `potential`, `es_sale_no_vat`, `es_cost_no_vat`, `es_gp_no_vat`, `customer_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `product_id`, `vat`) VALUES
('1', 'Project Alpha', '2023-01-10', '2023-02-10', 'Win', 'CN001', 'Remark for project Alpha', '2023-01-10', '1', 95000.00, 5000.00, 85000.00, 10000.00, 10000.00, 80.50, 92000.00, 83000.00, 9000.00, '1', '2024-09-22 05:54:27', '1', '2024-09-25 04:26:30', 2, '1', 0.00),
('10', 'Project Kappa', '2023-10-10', '2023-11-10', 'Lost', 'CN010', 'Remark for project Kappa', '2023-10-15', '5', 520000.00, 30000.00, 450000.00, 70000.00, 70000.00, 81.00, 530000.00, 500000.00, 30000.00, '5', '2024-09-22 05:54:27', '5', '2024-09-25 04:27:01', 2, '8', 0.00),
('11', 'Project Lambda', '2023-11-01', '2023-12-01', 'On Hold', 'CN011', 'Remark for project Lambda', '2023-11-05', '1', 580000.00, 20000.00, 510000.00, 70000.00, 70000.00, 80.50, 590000.00, 560000.00, 30000.00, '1', '2024-09-22 05:54:27', '1', '2024-09-25 04:27:04', 3, '9', 0.00),
('12', 'Project Mu', '2023-12-10', '2024-01-10', 'Bidding', 'CN012', 'Remark for project Mu', '2023-12-15', '2', 630000.00, 20000.00, 540000.00, 90000.00, 90000.00, 82.00, 640000.00, 610000.00, 30000.00, '2', '2024-09-22 05:54:27', '2', '2024-09-25 04:27:08', 4, '4', 0.00),
('13', 'Project Nu', '2024-01-01', '2024-02-01', 'Lost', 'CN013', 'Remark for project Nu', '2024-01-05', '3', 680000.00, 20000.00, 580000.00, 100000.00, 100000.00, 82.50, 690000.00, 660000.00, 30000.00, '3', '2024-09-22 05:54:27', '3', '2024-09-25 04:27:11', 1, '6', 0.00),
('14', 'Project Xi', '2024-02-15', '2024-03-15', 'Cancelled', 'CN014', 'Remark for project Xi', '2024-02-20', '4', 720000.00, 30000.00, 620000.00, 100000.00, 100000.00, 81.00, 730000.00, 700000.00, 30000.00, '4', '2024-09-22 05:54:27', '4', '2024-09-25 04:27:15', 2, '10', 0.00),
('15', 'Project Omicron', '2024-03-05', '2024-04-05', 'Negotiation', 'CN015', 'Remark for project Omicron', '2024-03-10', '5', 770000.00, 30000.00, 670000.00, 100000.00, 100000.00, 81.50, 780000.00, 750000.00, 30000.00, '5', '2024-09-22 05:54:27', '5', '2024-09-25 04:27:19', 3, '5', 0.00),
('2', 'Project Beta', '2023-02-15', '2023-03-20', 'Win', 'CN002', 'Remark for project Beta', '2023-02-20', '2', 145000.00, 5000.00, 125000.00, 20000.00, 20000.00, 85.30, 140000.00, 130000.00, 10000.00, '2', '2024-09-22 05:54:27', '2', '2024-09-25 04:26:33', 1, '2', 0.00),
('3', 'Project Gamma', '2023-03-05', '2023-04-10', 'On Hold', 'CN003', 'Remark for project Gamma', '2023-03-10', '3', 190000.00, 10000.00, 160000.00, 30000.00, 30000.00, 80.00, 185000.00, 175000.00, 10000.00, '3', '2024-09-22 05:54:27', '3', '2024-09-25 04:26:36', 2, '3', 0.00),
('3f9e4fdf-3bf8-475e-be2e-6fdab2e452eb', 'โครงการระบบแพลตฟอร์มวิเคราะห์ข้อมูลและปัญญาประดิษฐ์ในบริการการดูแลการใช้ชีวิตและดูแลสุขภาพระยะยาวสำหรับผู้สูงอายุ', '2024-09-15', '2024-09-12', 'Win', 'C16F640358', 'โครงการระบบแพลตฟอร์มวิเคราะห์ข้อมูลและปัญญาประดิษฐ์ในบริการการดูแลการใช้ชีวิตและดูแลสุขภาพระยะยาวสำหรับผู้สูงอายุ', '2024-09-24', '3', 30000000.00, 32100000.00, 560747.66, 600000.00, 29439252.34, 98.13, 30000000.00, 560747.66, 29439252.34, '11', '2024-09-25 07:41:48', '2', '2024-09-25 16:59:46', 3, '2', 7.00),
('4', 'Project Delta', '2023-04-01', '2023-05-01', 'Cancelled', 'CN004', 'Remark for project Delta', '2023-04-05', '4', 240000.00, 10000.00, 210000.00, 30000.00, 30000.00, 79.00, 235000.00, 225000.00, 10000.00, '4', '2024-09-22 05:54:27', '4', '2024-09-25 04:26:39', 3, '4', 0.00),
('5', 'Project Epsilon', '2023-05-15', '2023-06-15', 'Quotation', 'CN005', 'Remark for project Epsilon', '2023-05-20', '5', 285000.00, 15000.00, 240000.00, 45000.00, 45000.00, 82.00, 290000.00, 270000.00, 20000.00, '5', '2024-09-22 05:54:27', '5', '2024-09-25 04:26:42', 2, '6', 0.00),
('6', 'Project Zeta', '2023-06-10', '2023-07-10', 'Quotation', 'CN006', 'Remark for project Zeta', '2023-06-15', '1', 330000.00, 20000.00, 290000.00, 40000.00, 40000.00, 81.00, 340000.00, 320000.00, 20000.00, '1', '2024-09-22 05:54:27', '1', '2024-09-25 04:26:45', 3, '3', 0.00),
('7', 'Project Eta', '2023-07-01', '2023-08-01', 'On Hold', 'CN007', 'Remark for project Eta', '2023-07-05', '2', 380000.00, 20000.00, 320000.00, 60000.00, 60000.00, 80.50, 390000.00, 370000.00, 20000.00, '2', '2024-09-22 05:54:27', '2', '2024-09-25 04:26:48', 1, '7', 0.00),
('8', 'Project Theta', '2023-08-05', '2023-09-05', 'Cancelled', 'CN008', 'Remark for project Theta', '2023-08-10', '3', 430000.00, 20000.00, 370000.00, 60000.00, 60000.00, 82.00, 440000.00, 420000.00, 20000.00, '3', '2024-09-22 05:54:27', '3', '2024-09-25 04:26:54', 4, '1', 0.00),
('9', 'Project Iota', '2023-09-01', '2023-10-01', 'Bidding', 'CN009', 'Remark for project Iota', '2023-09-05', '4', 480000.00, 20000.00, 410000.00, 70000.00, 70000.00, 81.50, 490000.00, 460000.00, 30000.00, '4', '2024-09-22 05:54:27', '4', '2024-09-25 04:26:58', 1, '5', 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `team_id` char(36) NOT NULL,
  `team_name` varchar(255) NOT NULL,
  `team_leader` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`team_id`, `team_name`, `team_leader`) VALUES
('1', 'Innovation', NULL),
('2', 'Sales A', NULL),
('3', 'Service', '2'),
('4', 'Point IT', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` char(36) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` enum('Executive','Sale Supervisor','Seller','Engineer') NOT NULL,
  `team_id` char(36) DEFAULT NULL,
  `position` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `company` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `username`, `email`, `role`, `team_id`, `position`, `phone`, `password`, `company`, `created_at`, `created_by`) VALUES
('1', 'Supachai', 'Bangpuk', 'Sale', 'ApirakSS@gmail.com', 'Seller', '2', 'IT', '0839595800', '$2y$10$AFDgtICvjsQ6EkPk.cUizOTf1HE1bCnBJXsLtCjJy7WijtNWTQsji', 'PIT', '2024-09-15 16:43:58', NULL),
('12', 'Rungnapa', 'Positakub', 'ying', 'Ying@gmail.com', 'Sale Supervisor', '3', 'Product Sale', '0839595888', '$2y$10$c7lOPwTFlqF/qsiFR/K1DuNPzfXae.PPsJ5O4NH2bIazwc8mWYsNq', 'PIT', '2024-09-17 15:26:14', 2),
('2', 'Apirak', 'Bangpuk', 'Admin', 'Apirak@gmail.com', 'Executive', '1', 'IT', '0839595800', '$2y$10$jcmTr.I9CthXOrWFC78XjuOjwPoZlbvF80M4RKow4RvnNbm1Ej8dO', 'PIT', '2024-09-15 16:43:58', NULL),
('2ae57cd7-cbe0-4608-a4e1-1b7c78d0163a', 'Apirak', 'Bangpuk', 'Test', 'Apirak@gmail.com', 'Executive', '1', 'IT', '0839595800', '$2y$10$vs1ljpTrkvgspkkTq3hm9.x9aibhb8cth4QXR36bLcU4Ant0IXKCK', 'PIT', '2024-09-25 07:57:03', 2),
('3', 'Apirak', 'Bangpuk', 'Supervisor', 'apirak.ba@gmail.com', 'Sale Supervisor', '1', 'IT support', NULL, '$2y$10$AFDgtICvjsQ6EkPk.cUizOTf1HE1bCnBJXsLtCjJy7WijtNWTQsji', 'PIT', '2024-09-15 16:43:58', NULL),
('4', 'Apirakt', 'Bangpuk', 'Support', 'apirakAA@gmail.com', 'Engineer', '3', 'IT Service', '0839595811', '$2y$10$AFDgtICvjsQ6EkPk.cUizOTf1HE1bCnBJXsLtCjJy7WijtNWTQsji', 'PIT', '2024-09-15 16:55:43', 2),
('49279c96-4158-48c7-a1c2-a996e867ad34', 'Apirak', 'Bangpukx', 'czxc', 'a@gmail.com', 'Engineer', '2', 'Product Sale', '0839595866', '$2y$10$rfHgTr0dFtZf/XIrULIa4.V2eh5L.LF20kKCmkB/4JHopzgZMzZUa', 'Point IT', '2024-09-25 09:29:51', 2),
('5', 'Panit', 'Poapun', 'Panit', 'Panit@gmail.com', 'Executive', '4', 'Executive Director', '0839595822', '$2y$10$eAar02e4iaTG6bhKs2XLfua7ck.2co.8dkla8VX0tVCC5cnQfc/E6', 'PIT', '2024-09-17 15:15:37', 2),
('66f3b9c48eff57.82225589', 'Kritpat', 'pumsorn', 'Kritpat', 'Kritpat@gmail.com', 'Engineer', '3', 'IT support', '0839595836', '$2y$10$ZOlZX8UoJJhVdmbPjLktA.nZuv7OnhzhdrKUkJNsqtGyhKIxf5x22', 'PIT', '2024-09-25 07:20:36', 2),
('66f3c074d3a618.04895052', 'Somchai', 'Bangpuk', 'Somchai', 'Somchai@gmail.com', 'Sale Supervisor', '2', 'Product Sale', '0839595889', '$2y$10$gia/NWu/Y/cwnHXRiv4dfuMihRA/tYsxebp5rzGAylI0SypRf1br6', 'Point IT', '2024-09-25 07:49:08', 2),
('d7d6b20c-079d-4ca8-8bd9-89ea2a1f531e', 'จาตินd', 'บีเวอร์', 'jit', 'php@gmail.com', 'Executive', '3', 'Service Manager', '0839595658', '$2y$10$xg2y9QqXma4uTlRYpgVtI.khjGNHTYbd8/no359BgCRBH9cKoUdC.', 'Point IT', '2024-09-25 08:00:50', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `products_ibfk_1` (`created_by`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`project_id`),
  ADD KEY `projects_ibfk_2` (`created_by`),
  ADD KEY `projects_ibfk_3` (`seller`),
  ADD KEY `projects_product_fk` (`product_id`),
  ADD KEY `projects_customer_fk` (`customer_id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`team_id`),
  ADD KEY `teams_ibfk_1` (`team_leader`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `users_team_fk` (`team_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_customer_fk` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `projects_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `projects_ibfk_3` FOREIGN KEY (`seller`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `projects_product_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `teams`
--
ALTER TABLE `teams`
  ADD CONSTRAINT `teams_ibfk_1` FOREIGN KEY (`team_leader`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_team_fk` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
