-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2024 at 07:46 PM
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
-- Database: `pcost_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` char(36) NOT NULL COMMENT 'รหัสกิจกรรมแบบ UUID',
  `user_id` char(36) DEFAULT NULL COMMENT 'รหัสผู้ใช้ที่ทำกิจกรรม',
  `action` varchar(100) NOT NULL COMMENT 'ชื่อกิจกรรมที่ทำ',
  `entity_type` varchar(50) NOT NULL COMMENT 'ประเภทของเอนทิตีที่เกี่ยวข้อง',
  `entity_id` char(36) NOT NULL COMMENT 'รหัสของเอนทิตีที่เกี่ยวข้อง',
  `description` text DEFAULT NULL COMMENT 'รายละเอียดเพิ่มเติมของกิจกรรม',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'วันเวลาที่ทำกิจกรรม'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` char(36) NOT NULL COMMENT 'รหัสหมวดหมู่แบบ UUID',
  `name` varchar(100) NOT NULL COMMENT 'ชื่อหมวดหมู่',
  `type` enum('service','main','sub') NOT NULL COMMENT 'ประเภทหมวดหมู่',
  `parent_id` char(36) DEFAULT NULL COMMENT 'รหัสหมวดหมู่หลัก (สำหรับ subcategory)',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'วันที่สร้างหมวดหมู่',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'วันที่แก้ไขข้อมูลหมวดหมู่ล่าสุด',
  `created_by` char(36) DEFAULT NULL COMMENT 'รหัสผู้ใช้ที่สร้างหมวดหมู่',
  `updated_by` char(36) DEFAULT NULL COMMENT 'รหัสผู้ใช้ที่แก้ไขข้อมูลหมวดหมู่ล่าสุด'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` char(36) NOT NULL COMMENT 'รหัสความคิดเห็นแบบ UUID',
  `content` text NOT NULL COMMENT 'เนื้อหาความคิดเห็น',
  `parent_id` char(36) DEFAULT NULL COMMENT 'รหัสความคิดเห็นหลัก (สำหรับการตอบกลับ)',
  `entity_type` enum('project','ticket','knowledge_base') NOT NULL COMMENT 'ประเภทของเอนทิตีที่เกี่ยวข้อง',
  `entity_id` char(36) NOT NULL COMMENT 'รหัสของเอนทิตีที่เกี่ยวข้อง',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'วันเวลาที่สร้างความคิดเห็น',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'วันเวลาที่แก้ไขความคิดเห็นล่าสุด',
  `created_by` char(36) DEFAULT NULL COMMENT 'รหัสผู้ใช้ที่สร้างความคิดเห็น',
  `updated_by` char(36) DEFAULT NULL COMMENT 'รหัสผู้ใช้ที่แก้ไขความคิดเห็นล่าสุด'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` char(36) NOT NULL COMMENT 'รหัสลูกค้าแบบ UUID',
  `customer_name` varchar(100) NOT NULL COMMENT 'ชื่อลูกค้า',
  `contact_person` varchar(100) DEFAULT NULL COMMENT 'ชื่อผู้ติดต่อ',
  `contact_company` varchar(100) DEFAULT NULL COMMENT 'ชื่อบริษัทผู้ติดต่อ',
  `email` varchar(100) DEFAULT NULL COMMENT 'อีเมลลูกค้า',
  `phone` varchar(20) DEFAULT NULL COMMENT 'เบอร์โทรศัพท์',
  `address` text DEFAULT NULL COMMENT 'ที่อยู่',
  `remake` varchar(100) DEFAULT NULL COMMENT 'รายละเอียดเพิ่มเติม',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'วันที่สร้างข้อมูลลูกค้า',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'วันที่แก้ไขข้อมูลลูกค้าล่าสุด',
  `created_by` char(36) DEFAULT NULL COMMENT 'รหัสผู้ใช้ที่สร้างข้อมูลลูกค้า',
  `updated_by` char(36) DEFAULT NULL COMMENT 'รหัสผู้ใช้ที่แก้ไขข้อมูลลูกค้าล่าสุด'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` char(36) NOT NULL COMMENT 'รหัสใบแจ้งหนี้แบบ UUID',
  `project_id` char(36) NOT NULL COMMENT 'รหัสโครงการที่เกี่ยวข้อง',
  `invoice_number` varchar(50) NOT NULL COMMENT 'เลขที่ใบแจ้งหนี้ (ต้องไม่ซ้ำกัน)',
  `invoice_date` date NOT NULL COMMENT 'วันที่ออกใบแจ้งหนี้',
  `due_date` date NOT NULL COMMENT 'วันครบกำหนดชำระ',
  `total_amount` decimal(10,2) NOT NULL COMMENT 'จำนวนเงินรวมในใบแจ้งหนี้',
  `status` enum('draft','sent','paid','overdue','cancelled') NOT NULL COMMENT ' สถานะของใบแจ้งหนี้',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'วันเวลาที่สร้างใบแจ้งหนี้',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'วันเวลาที่แก้ไขข้อมูลล่าสุด',
  `created_by` char(36) DEFAULT NULL COMMENT 'รหัสผู้ใช้ที่สร้างใบแจ้งหนี้',
  `updated_by` char(36) DEFAULT NULL COMMENT 'รหัสผู้ใช้ที่แก้ไขข้อมูลล่าสุด'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `knowledge_base`
--

CREATE TABLE `knowledge_base` (
  `id` char(36) NOT NULL COMMENT 'รหัสบทความแบบ UUID',
  `title` varchar(200) NOT NULL COMMENT 'หัวข้อ',
  `description` text NOT NULL COMMENT 'รายละเอียด',
  `service_category_id` char(36) DEFAULT NULL COMMENT 'รหัส Service category',
  `category_id` char(36) DEFAULT NULL COMMENT 'รหัส Category',
  `subcategory_id` char(36) DEFAULT NULL COMMENT 'รหัส Subcategory',
  `solution` text DEFAULT NULL COMMENT 'สาเหตุของปัญหา',
  `resolve` text DEFAULT NULL COMMENT 'วิธีการแก้ไข',
  `service_type` enum('Incident','Service','other') NOT NULL COMMENT 'ประเภทการบริการ',
  `status` enum('draft','published','archived') NOT NULL DEFAULT 'draft' COMMENT 'สถานะบทความ',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'วันที่สร้างบทความ',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'นที่แก้ไขบทความล่าสุด',
  `created_by` char(36) DEFAULT NULL COMMENT 'รหัสผู้ใช้ที่สร้างบทความ',
  `updated_by` char(36) DEFAULT NULL COMMENT 'รหัสผู้ใช้ที่แก้ไขบทความล่าสุด'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `knowledge_base_images`
--

CREATE TABLE `knowledge_base_images` (
  `id` char(36) NOT NULL COMMENT 'รหัสรูปภาพแบบ UUID',
  `knowledge_base_id` char(36) NOT NULL COMMENT 'รหัสบทความที่เกี่ยวข้อง',
  `image_path` varchar(255) NOT NULL COMMENT 'ที่อยู่ของไฟล์รูปภาพ',
  `caption` varchar(255) DEFAULT NULL COMMENT 'คำอธิบายภาพ',
  `display_order` int(11) DEFAULT NULL COMMENT 'ลำดับการแสดงผล',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'วันที่เพิ่มรูปภาพ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` char(36) NOT NULL COMMENT 'รหัสการชำระเงินแบบ UUID',
  `invoice_id` char(36) NOT NULL COMMENT 'รหัสใบแจ้งหนี้ที่เกี่ยวข้อง',
  `amount` decimal(10,2) NOT NULL COMMENT 'จำนวนเงินที่ชำระ',
  `payment_date` date NOT NULL COMMENT 'วันที่ชำระเงิน',
  `payment_method` enum('cash','bank_transfer','credit_card','other') NOT NULL COMMENT 'วิธีการชำระเงิน',
  `notes` text DEFAULT NULL COMMENT 'หมายเหตุเพิ่มเติม',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'วันเวลาที่บันทึกการชำระเงิน',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'วันเวลาที่แก้ไขข้อมูลล่าสุด',
  `created_by` char(36) DEFAULT NULL COMMENT 'หัสผู้ใช้ที่บันทึกการชำระเงิน',
  `updated_by` char(36) DEFAULT NULL COMMENT 'รหัสผู้ใช้ที่แก้ไขข้อมูลล่าสุด'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` char(36) NOT NULL COMMENT 'รหัสสินค้า/บริการแบบ UUID',
  `product_name` varchar(100) NOT NULL COMMENT 'ชื่อสินค้า/บริการ',
  `description` text DEFAULT NULL COMMENT 'รายละเอียดสินค้า/บริการ',
  `unit_price` decimal(10,2) NOT NULL COMMENT 'ราคาต่อหน่วย',
  `product_type` enum('main','secondary') NOT NULL DEFAULT 'main' COMMENT 'ประเภทสินค้า (หลัก/รอง)',
  `supplier_id` char(36) DEFAULT NULL COMMENT 'รหัสซัพพลายเออร์',
  `comment` text DEFAULT NULL COMMENT 'รายละเอียดเพิ่มเติม',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'วันที่สร้างข้อมูลสินค้า/บริการ',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'วันที่แก้ไขข้อมูลสินค้า/บริการล่าสุด',
  `created_by` char(36) DEFAULT NULL COMMENT 'รหัสผู้ใช้ที่สร้างข้อมูลสินค้า/บริการ',
  `updated_by` char(36) DEFAULT NULL COMMENT 'รหัสผู้ใช้ที่แก้ไขข้อมูลสินค้า/บริการล่าสุด',
  `warranty_period` int(11) DEFAULT NULL COMMENT 'เก็บระยะเวลาการรับประกันเป็นจำนวนวัน',
  `warranty_description` text DEFAULT NULL COMMENT 'เก็บรายละเอียดการรับประกัน',
  `warranty_terms` text DEFAULT NULL COMMENT ' เก็บเงื่อนไขการรับประกัน'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` char(36) NOT NULL COMMENT 'รหัสโครงการแบบ UUID',
  `project_name` varchar(100) NOT NULL COMMENT 'ชื่อโครงการ',
  `description` text DEFAULT NULL COMMENT 'รายละเอียดโครงการ',
  `due_date` date DEFAULT NULL COMMENT 'วันเสนองานขาย',
  `po_date` date DEFAULT NULL COMMENT 'วันที่เซ็นสัญญาขาย',
  `start_date` date DEFAULT NULL COMMENT 'วันที่เริ่มโครงการ',
  `end_date` date DEFAULT NULL COMMENT 'วันที่สิ้นสุดโครงการ',
  `contract_number` varchar(50) DEFAULT NULL COMMENT 'เลขที่สัญญา',
  `project_status` enum('Wiating for approve','On-Hold','Quotation','Negotiation','Bidding','Win','Lost','Cancelled') NOT NULL DEFAULT 'Wiating for approve' COMMENT 'สถานะโครงการ',
  `customer_id` char(36) DEFAULT NULL COMMENT 'รหัสลูกค้า',
  `manager_id` char(36) DEFAULT NULL COMMENT 'รหัสผู้จัดการโครงการ',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'วันที่สร้างโครงการ',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'วันที่แก้ไขข้อมูลโครงการล่าสุด',
  `created_by` char(36) DEFAULT NULL COMMENT 'รหัสผู้ใช้ที่สร้างโครงการ',
  `updated_by` char(36) DEFAULT NULL COMMENT 'รหัสผู้ใช้ที่แก้ไขข้อมูลโครงการล่าสุด'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_costs`
--

CREATE TABLE `project_costs` (
  `id` char(36) NOT NULL COMMENT 'รหัสต้นทุนโครงการแบบ UUID',
  `project_id` char(36) NOT NULL COMMENT 'รหัสโครงการ',
  `vat_rate` decimal(5,2) NOT NULL COMMENT 'อัตราภาษีมูลค่าเพิ่ม (VAT)',
  `sale_price` decimal(15,2) NOT NULL COMMENT 'ราคาขาย (ไม่รวม VAT)',
  `sale_price_with_vat` decimal(15,2) NOT NULL COMMENT 'ราคาขาย (รวม VAT)',
  `cost_price` decimal(15,2) NOT NULL COMMENT 'ราคาต้นทุน (ไม่รวม VAT)',
  `cost_price_with_vat` decimal(15,2) NOT NULL COMMENT 'ราคาต้นทุน (รวม VAT)',
  `profit` decimal(15,2) NOT NULL COMMENT 'กำไร',
  `profit_percentage` decimal(5,2) NOT NULL COMMENT 'เปอร์เซ็นต์กำไร',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'วันที่สร้างข้อมูลต้นทุน',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'วันที่แก้ไขข้อมูลต้นทุนล่าสุด',
  `created_by` char(36) DEFAULT NULL COMMENT 'รหัสผู้ใช้ที่สร้างข้อมูลต้นทุน',
  `updated_by` char(36) DEFAULT NULL COMMENT 'รหัสผู้ใช้ที่แก้ไขข้อมูลต้นทุนล่าสุด'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_files`
--

CREATE TABLE `project_files` (
  `id` char(36) NOT NULL COMMENT 'รหัสไฟล์แบบ UUID',
  `project_id` char(36) NOT NULL COMMENT 'รหัสโครงการที่เกี่ยวข้อง',
  `file_name` varchar(255) NOT NULL COMMENT ' ชื่อไฟล์',
  `file_path` varchar(255) NOT NULL COMMENT 'ที่อยู่ของไฟล์',
  `file_type` varchar(50) DEFAULT NULL COMMENT 'ประเภทของไฟล์',
  `file_size` int(11) DEFAULT NULL COMMENT 'ขนาดของไฟล์ (หน่วยเป็นไบต์)',
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'วันเวลาที่อัพโหลดไฟล์',
  `uploaded_by` char(36) DEFAULT NULL COMMENT 'รหัสผู้ใช้ที่อัพโหลดไฟล์'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_products`
--

CREATE TABLE `project_products` (
  `id` char(36) NOT NULL COMMENT 'รหัสความสัมพันธ์แบบ UUID',
  `project_id` char(36) NOT NULL COMMENT 'รหัสโครงการ',
  `product_id` char(36) NOT NULL COMMENT 'รหัสสินค้า/บริการ',
  `quantity` int(11) NOT NULL COMMENT 'จำนวนสินค้า/บริการที่ใช้ในโครงการ',
  `unit_price` decimal(10,2) NOT NULL COMMENT 'ราคาต่อหน่วยในโครงการนี้',
  `total_price` decimal(10,2) NOT NULL COMMENT 'ราคารวมของสินค้า/บริการในโครงการนี้',
  `notes` text DEFAULT NULL COMMENT 'หมายเหตุหรือรายละเอียดเพิ่มเติม',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'วันที่สร้างความสัมพันธ์',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'วันที่แก้ไขล่าสุด',
  `created_by` char(36) DEFAULT NULL COMMENT 'รหัสผู้ใช้ที่สร้างความสัมพันธ์',
  `updated_by` char(36) DEFAULT NULL COMMENT 'รหัสผู้ใช้ที่แก้ไขล่าสุด'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` char(36) NOT NULL COMMENT 'รหัสซัพพลายเออร์แบบ UUID',
  `supplier_name` varchar(100) NOT NULL COMMENT 'ชื่อซัพพลายเออร์',
  `contact_person` varchar(100) DEFAULT NULL COMMENT 'ชื่อผู้ติดต่อ',
  `email` varchar(100) DEFAULT NULL COMMENT 'อีเมลซัพพลายเออร์',
  `phone` varchar(20) DEFAULT NULL COMMENT 'เบอร์โทรศัพท์',
  `address` text DEFAULT NULL COMMENT 'ที่อยู่',
  `is_internal` tinyint(1) NOT NULL COMMENT 'เป็นซัพพลายเออร์ภายในหรือไม่',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'วันที่สร้างข้อมูลซัพพลายเออร์',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'วันที่แก้ไขข้อมูลซัพพลายเออร์ล่าสุด',
  `created_by` char(36) DEFAULT NULL COMMENT 'รหัสผู้ใช้ที่สร้างข้อมูลซัพพลายเออร์',
  `updated_by` char(36) DEFAULT NULL COMMENT 'รหัสผู้ใช้ที่แก้ไขข้อมูลซัพพลายเออร์ล่าสุด'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` char(36) NOT NULL COMMENT 'รหัสทีมแบบ UUID',
  `team_name` varchar(100) NOT NULL COMMENT 'ชื่อทีม',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'วันที่สร้างทีม',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'วันที่แก้ไขข้อมูลทีมล่าสุด',
  `created_by` char(36) DEFAULT NULL COMMENT 'รหัสผู้ใช้ที่สร้างทีม',
  `updated_by` char(36) DEFAULT NULL COMMENT 'รหัสผู้ใช้ที่แก้ไขข้อมูลทีมล่าสุด'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` char(36) NOT NULL COMMENT 'รหัส ticket แบบ UUID',
  `title` varchar(200) NOT NULL COMMENT 'หัวข้อ ticket',
  `status` enum('open','in_progress','resolved','closed') NOT NULL DEFAULT 'open' COMMENT 'สถานะ ticket',
  `priority` enum('low','medium','high','urgent') NOT NULL DEFAULT 'medium' COMMENT 'ความสำคัญของ ticket',
  `type` enum('incident','service') NOT NULL COMMENT 'ประเภท ticket (เหตุการณ์หรือบริการ)',
  `service_category_id` char(36) DEFAULT NULL COMMENT 'รหัส Service category',
  `category_id` char(36) DEFAULT NULL COMMENT 'รหัส Category',
  `subcategory_id` char(36) DEFAULT NULL COMMENT 'รหัส Subcategory',
  `description` text DEFAULT NULL COMMENT 'รายละเอียดปัญหา',
  `solution` text DEFAULT NULL COMMENT 'สาเหตุของปัญหา',
  `resolve` text DEFAULT NULL COMMENT 'วิธีการแก้ไข',
  `project_id` char(36) DEFAULT NULL COMMENT 'รหัสโครงการที่เกี่ยวข้อง',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'วันที่สร้าง ticket',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'วันที่แก้ไข ticket ล่าสุด',
  `created_by` char(36) DEFAULT NULL COMMENT 'รหัสผู้ใช้ที่สร้าง ticket',
  `updated_by` char(36) DEFAULT NULL COMMENT 'รหัสผู้ใช้ที่แก้ไข ticket ล่าสุด'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_assignments`
--

CREATE TABLE `ticket_assignments` (
  `id` char(36) NOT NULL COMMENT 'รหัสการมอบหมายงานแบบ UUID',
  `ticket_id` char(36) NOT NULL COMMENT 'รหัส ticket',
  `user_id` char(36) NOT NULL COMMENT 'รหัสผู้ใช้ที่ได้รับมอบหมาย',
  `role` enum('helpdesk','engineer') NOT NULL COMMENT 'บทบาทของผู้ได้รับมอบหมาย',
  `assigned_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'วันที่มอบหมายงาน',
  `assigned_by` char(36) DEFAULT NULL COMMENT 'รหัสผู้ใช้ที่มอบหมายงาน'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` char(36) NOT NULL COMMENT 'รหัสผู้ใช้แบบ UUID',
  `username` varchar(50) NOT NULL COMMENT 'ชื่อผู้ใช้สำหรับเข้าสู่ระบบ (ห้ามซ้ำ)',
  `password` varchar(255) NOT NULL COMMENT 'รหัสผ่านที่เข้ารหัสแล้ว',
  `email` varchar(100) NOT NULL COMMENT 'อีเมลผู้ใช้งาน (ห้ามซ้ำ)',
  `first_name` varchar(50) NOT NULL COMMENT 'ชื่อจริง',
  `last_name` varchar(50) NOT NULL COMMENT 'นามสกุล',
  `role` enum('executive','sale_supervisor','seller','service_supervisor','helpdesk','engineer') NOT NULL COMMENT 'บทบาทของผู้ใช้',
  `team_id` char(36) DEFAULT NULL COMMENT 'รหัสทีมที่ผู้ใช้สังกัด',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'วันที่สร้างบัญชีผู้ใช้',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'วันที่แก้ไขข้อมูลผู้ใช้ล่าสุด',
  `created_by` char(36) DEFAULT NULL COMMENT 'รหัสผู้ใช้ที่สร้างบัญชีนี้',
  `updated_by` char(36) DEFAULT NULL COMMENT 'รหัสผู้ใช้ที่แก้ไขข้อมูลบัญชีนี้ล่าสุด'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_projects`
--

CREATE TABLE `user_projects` (
  `id` char(36) NOT NULL COMMENT 'รหัสความสัมพันธ์แบบ UUID',
  `user_id` char(36) NOT NULL COMMENT 'รหัสผู้ใช้',
  `project_id` char(36) NOT NULL COMMENT 'รหัสโครงการ',
  `role` enum('project_manager','team_member','stakeholder','client') NOT NULL COMMENT 'บทบาทของผู้ใช้ในโครงการ',
  `start_date` date DEFAULT NULL COMMENT 'วันที่เริ่มมีส่วนร่วมในโครงการ',
  `end_date` date DEFAULT NULL COMMENT 'วันที่สิ้นสุดการมีส่วนร่วมในโครงการ (ถ้ามี)',
  `notes` text DEFAULT NULL COMMENT 'หมายเหตุหรือรายละเอียดเพิ่มเติม',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'วันที่สร้างความสัมพันธ์',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'วันที่แก้ไขล่าสุด',
  `created_by` char(36) DEFAULT NULL COMMENT 'รหัสผู้ใช้ที่สร้างความสัมพันธ์',
  `updated_by` char(36) DEFAULT NULL COMMENT 'รหัสผู้ใช้ที่แก้ไขล่าสุด'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoice_number` (`invoice_number`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `knowledge_base`
--
ALTER TABLE `knowledge_base`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_category_id` (`service_category_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `subcategory_id` (`subcategory_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `knowledge_base_images`
--
ALTER TABLE `knowledge_base_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `knowledge_base_id` (`knowledge_base_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_id` (`invoice_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `manager_id` (`manager_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `project_costs`
--
ALTER TABLE `project_costs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `project_files`
--
ALTER TABLE `project_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `uploaded_by` (`uploaded_by`);

--
-- Indexes for table `project_products`
--
ALTER TABLE `project_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_team_created_by` (`created_by`),
  ADD KEY `fk_team_updated_by` (`updated_by`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_category_id` (`service_category_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `subcategory_id` (`subcategory_id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `ticket_assignments`
--
ALTER TABLE `ticket_assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_id` (`ticket_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `assigned_by` (`assigned_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_user_team` (`team_id`),
  ADD KEY `fk_user_created_by` (`created_by`),
  ADD KEY `fk_user_updated_by` (`updated_by`);

--
-- Indexes for table `user_projects`
--
ALTER TABLE `user_projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `categories_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `categories_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `comments` (`id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `comments_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `customers_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `invoices_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `invoices_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `knowledge_base`
--
ALTER TABLE `knowledge_base`
  ADD CONSTRAINT `knowledge_base_ibfk_1` FOREIGN KEY (`service_category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `knowledge_base_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `knowledge_base_ibfk_3` FOREIGN KEY (`subcategory_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `knowledge_base_ibfk_4` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `knowledge_base_ibfk_5` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `knowledge_base_images`
--
ALTER TABLE `knowledge_base_images`
  ADD CONSTRAINT `knowledge_base_images_ibfk_1` FOREIGN KEY (`knowledge_base_id`) REFERENCES `knowledge_base` (`id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`),
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `payments_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `products_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `projects_ibfk_2` FOREIGN KEY (`manager_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `projects_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `projects_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `project_costs`
--
ALTER TABLE `project_costs`
  ADD CONSTRAINT `project_costs_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `project_costs_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `project_costs_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `project_files`
--
ALTER TABLE `project_files`
  ADD CONSTRAINT `project_files_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `project_files_ibfk_2` FOREIGN KEY (`uploaded_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `project_products`
--
ALTER TABLE `project_products`
  ADD CONSTRAINT `project_products_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `project_products_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `project_products_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `project_products_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD CONSTRAINT `suppliers_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `suppliers_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `teams`
--
ALTER TABLE `teams`
  ADD CONSTRAINT `fk_team_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_team_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`service_category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `tickets_ibfk_3` FOREIGN KEY (`subcategory_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `tickets_ibfk_4` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `tickets_ibfk_5` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `tickets_ibfk_6` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `ticket_assignments`
--
ALTER TABLE `ticket_assignments`
  ADD CONSTRAINT `ticket_assignments_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`),
  ADD CONSTRAINT `ticket_assignments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `ticket_assignments_ibfk_3` FOREIGN KEY (`assigned_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_user_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_user_team` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`),
  ADD CONSTRAINT `fk_user_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_projects`
--
ALTER TABLE `user_projects`
  ADD CONSTRAINT `user_projects_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_projects_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `user_projects_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_projects_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
