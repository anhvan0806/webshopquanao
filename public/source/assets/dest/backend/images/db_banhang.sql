-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 11, 2020 lúc 08:43 AM
-- Phiên bản máy phục vụ: 10.4.10-MariaDB
-- Phiên bản PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `db_banhang`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bills`
--

CREATE TABLE `bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `date_order` date DEFAULT NULL,
  `total` float DEFAULT NULL COMMENT 'tổng tiền',
  `payment` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'hình thức thanh toán',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `order_status` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `bills`
--

INSERT INTO `bills` (`id`, `id_customer`, `date_order`, `total`, `payment`, `note`, `created_at`, `updated_at`, `order_status`) VALUES
(100, 102, '2019-12-06', 160000, 'COD', NULL, '2019-12-06 14:21:01', '2019-12-06 14:21:01', NULL),
(82, 84, '2019-12-06', 160000, 'COD', NULL, '2019-12-06 13:16:13', '2019-12-06 13:16:13', NULL),
(33, 33, '2019-12-04', 320000, 'ATM', 'lodna', '2019-12-04 01:39:30', '2019-12-04 01:39:30', NULL),
(29, 29, '2019-12-03', 160000, 'COD', NULL, '2019-12-03 15:38:02', '2019-12-03 15:38:02', NULL),
(28, 28, '2019-12-03', 160000, 'COD', 'khong', '2019-12-03 13:37:05', '2019-12-03 13:37:05', NULL),
(26, 26, '2019-12-03', 480000, 'COD', 'giao nhanh', '2019-12-03 13:33:31', '2019-12-03 13:33:31', NULL),
(101, 103, '2019-12-08', 170000, 'COD', 'alo', '2020-01-05 11:50:21', '2019-12-08 05:04:00', 0),
(102, 104, '2019-12-08', 160000, 'COD', NULL, '2020-01-05 11:51:19', '2019-12-08 06:46:40', 1),
(104, 106, '2020-01-03', 160000, 'ATM', NULL, '2020-01-05 11:50:37', '2020-01-03 07:26:52', 0),
(106, 108, '2020-01-05', 1760000, 'ATM', NULL, '2020-01-05 12:32:49', '2020-01-05 12:32:24', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill_detail`
--

CREATE TABLE `bill_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_bill` int(10) NOT NULL,
  `id_product` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL COMMENT 'số lượng',
  `unit_price` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `bill_detail`
--

INSERT INTO `bill_detail` (`id`, `id_bill`, `id_product`, `quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
(56, 34, 12, 1, 160000, '2019-12-04 10:42:12', '2019-12-04 10:42:12'),
(55, 34, 5, 1, 160000, '2019-12-04 10:42:12', '2019-12-04 10:42:12'),
(53, 33, 69, 1, 160000, '2019-12-04 01:39:30', '2019-12-04 01:39:30'),
(52, 33, 68, 1, 160000, '2019-12-04 01:39:30', '2019-12-04 01:39:30'),
(54, 34, 7, 2, 160000, '2019-12-04 10:42:12', '2019-12-04 10:42:12'),
(51, 32, 62, 2, 160000, '2019-12-03 16:24:55', '2019-12-03 16:24:55'),
(50, 32, 61, 1, 160000, '2019-12-03 16:24:55', '2019-12-03 16:24:55'),
(49, 31, 48, 2, 160000, '2019-12-03 16:22:19', '2019-12-03 16:22:19'),
(48, 30, 26, 1, 160000, '2019-12-03 15:42:30', '2019-12-03 15:42:30'),
(47, 30, 21, 1, 160000, '2019-12-03 15:42:30', '2019-12-03 15:42:30'),
(46, 30, 20, 1, 160000, '2019-12-03 15:42:30', '2019-12-03 15:42:30'),
(45, 30, 16, 1, 160000, '2019-12-03 15:42:30', '2019-12-03 15:42:30'),
(44, 29, 61, 1, 160000, '2019-12-03 15:38:02', '2019-12-03 15:38:02'),
(43, 28, 32, 1, 160000, '2019-12-03 13:37:05', '2019-12-03 13:37:05'),
(42, 27, 48, 1, 160000, '2019-12-03 13:36:05', '2019-12-03 13:36:05'),
(41, 27, 47, 1, 160000, '2019-12-03 13:36:05', '2019-12-03 13:36:05'),
(40, 26, 14, 1, 160000, '2019-12-03 13:33:31', '2019-12-03 13:33:31'),
(39, 26, 13, 1, 160000, '2019-12-03 13:33:31', '2019-12-03 13:33:31'),
(38, 26, 17, 1, 160000, '2019-12-03 13:33:31', '2019-12-03 13:33:31'),
(57, 34, 48, 1, 160000, '2019-12-04 10:42:12', '2019-12-04 10:42:12'),
(58, 35, 7, 1, 160000, '2019-12-04 10:49:08', '2019-12-04 10:49:08'),
(59, 36, 7, 1, 160000, '2019-12-04 10:50:35', '2019-12-04 10:50:35'),
(60, 37, 5, 1, 160000, '2019-12-04 10:51:35', '2019-12-04 10:51:35'),
(61, 38, 7, 1, 160000, '2019-12-04 14:05:35', '2019-12-04 14:05:35'),
(62, 39, 10, 1, 160000, '2019-12-04 14:36:27', '2019-12-04 14:36:27'),
(63, 40, 33, 1, 160000, '2019-12-04 15:26:17', '2019-12-04 15:26:17'),
(64, 40, 37, 1, 160000, '2019-12-04 15:26:17', '2019-12-04 15:26:17'),
(65, 41, 6, 1, 170000, '2019-12-05 06:21:34', '2019-12-05 06:21:34'),
(66, 52, 6, 1, 170000, '2019-12-06 07:17:32', '2019-12-06 07:17:32'),
(67, 53, 5, 1, 160000, '2019-12-06 07:21:21', '2019-12-06 07:21:21'),
(68, 55, 17, 1, 160000, '2019-12-06 07:25:03', '2019-12-06 07:25:03'),
(69, 56, 8, 1, 160000, '2019-12-06 07:34:25', '2019-12-06 07:34:25'),
(70, 57, 17, 1, 160000, '2019-12-06 07:57:31', '2019-12-06 07:57:31'),
(71, 63, 6, 1, 170000, '2019-12-06 08:17:11', '2019-12-06 08:17:11'),
(72, 63, 8, 1, 160000, '2019-12-06 08:17:11', '2019-12-06 08:17:11'),
(73, 64, 6, 1, 170000, '2019-12-06 08:23:08', '2019-12-06 08:23:08'),
(74, 64, 7, 2, 160000, '2019-12-06 08:23:08', '2019-12-06 08:23:08'),
(75, 64, 11, 1, 160000, '2019-12-06 08:23:08', '2019-12-06 08:23:08'),
(76, 65, 5, 1, 160000, '2019-12-06 08:25:17', '2019-12-06 08:25:17'),
(77, 65, 6, 1, 170000, '2019-12-06 08:25:17', '2019-12-06 08:25:17'),
(78, 65, 7, 1, 160000, '2019-12-06 08:25:17', '2019-12-06 08:25:17'),
(79, 66, 16, 1, 160000, '2019-12-06 08:28:56', '2019-12-06 08:28:56'),
(80, 66, 17, 1, 160000, '2019-12-06 08:28:56', '2019-12-06 08:28:56'),
(81, 67, 16, 1, 160000, '2019-12-06 08:35:58', '2019-12-06 08:35:58'),
(82, 67, 17, 1, 160000, '2019-12-06 08:35:58', '2019-12-06 08:35:58'),
(83, 68, 7, 1, 160000, '2019-12-06 08:42:50', '2019-12-06 08:42:50'),
(84, 68, 62, 2, 160000, '2019-12-06 08:42:50', '2019-12-06 08:42:50'),
(85, 69, 5, 1, 160000, '2019-12-06 08:49:56', '2019-12-06 08:49:56'),
(86, 70, 5, 1, 160000, '2019-12-06 12:40:24', '2019-12-06 12:40:24'),
(87, 71, 5, 1, 160000, '2019-12-06 12:42:28', '2019-12-06 12:42:28'),
(88, 72, 6, 1, 170000, '2019-12-06 12:44:59', '2019-12-06 12:44:59'),
(89, 73, 20, 1, 160000, '2019-12-06 12:47:44', '2019-12-06 12:47:44'),
(90, 74, 52, 1, 160000, '2019-12-06 12:49:43', '2019-12-06 12:49:43'),
(91, 75, 61, 1, 160000, '2019-12-06 12:52:01', '2019-12-06 12:52:01'),
(92, 76, 13, 1, 160000, '2019-12-06 12:56:33', '2019-12-06 12:56:33'),
(93, 77, 48, 1, 160000, '2019-12-06 12:57:48', '2019-12-06 12:57:48'),
(94, 78, 6, 1, 170000, '2019-12-06 13:06:52', '2019-12-06 13:06:52'),
(95, 79, 6, 1, 170000, '2019-12-06 13:08:49', '2019-12-06 13:08:49'),
(96, 80, 16, 1, 160000, '2019-12-06 13:13:01', '2019-12-06 13:13:01'),
(97, 81, 17, 1, 160000, '2019-12-06 13:14:25', '2019-12-06 13:14:25'),
(98, 84, 16, 1, 160000, '2019-12-06 13:20:38', '2019-12-06 13:20:38'),
(99, 85, 26, 1, 160000, '2019-12-06 13:25:19', '2019-12-06 13:25:19'),
(100, 85, 18, 1, 160000, '2019-12-06 13:25:19', '2019-12-06 13:25:19'),
(101, 86, 16, 1, 160000, '2019-12-06 13:29:06', '2019-12-06 13:29:06'),
(102, 89, 6, 1, 170000, '2019-12-06 13:35:21', '2019-12-06 13:35:21'),
(103, 91, 5, 1, 160000, '2019-12-06 13:46:08', '2019-12-06 13:46:08'),
(104, 91, 12, 1, 160000, '2019-12-06 13:46:08', '2019-12-06 13:46:08'),
(105, 92, 31, 1, 160000, '2019-12-06 13:48:26', '2019-12-06 13:48:26'),
(106, 93, 36, 1, 160000, '2019-12-06 13:49:45', '2019-12-06 13:49:45'),
(107, 94, 31, 1, 160000, '2019-12-06 13:50:38', '2019-12-06 13:50:38'),
(108, 94, 33, 1, 160000, '2019-12-06 13:50:38', '2019-12-06 13:50:38'),
(109, 95, 18, 1, 160000, '2019-12-06 13:52:07', '2019-12-06 13:52:07'),
(110, 96, 7, 1, 160000, '2019-12-06 13:53:53', '2019-12-06 13:53:53'),
(111, 97, 32, 1, 160000, '2019-12-06 13:55:29', '2019-12-06 13:55:29'),
(112, 98, 6, 1, 170000, '2019-12-06 13:56:39', '2019-12-06 13:56:39'),
(113, 99, 31, 2, 160000, '2019-12-06 14:01:55', '2019-12-06 14:01:55'),
(114, 99, 32, 1, 160000, '2019-12-06 14:01:55', '2019-12-06 14:01:55'),
(115, 100, 31, 1, 160000, '2019-12-06 14:21:04', '2019-12-06 14:21:04'),
(116, 101, 6, 1, 170000, '2019-12-08 05:04:04', '2019-12-08 05:04:04'),
(117, 102, 7, 1, 160000, '2019-12-08 06:46:44', '2019-12-08 06:46:44'),
(118, 103, 7, 1, 160000, '2020-01-03 05:50:40', '2020-01-03 05:50:40'),
(119, 104, 8, 1, 160000, '2020-01-03 07:26:56', '2020-01-03 07:26:56'),
(120, 105, 7, 1, 160000, '2020-01-05 11:52:05', '2020-01-05 11:52:05'),
(121, 106, 16, 11, 160000, '2020-01-05 12:32:39', '2020-01-05 12:32:39');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`id`, `name`, `gender`, `email`, `address`, `phone_number`, `note`, `created_at`, `updated_at`) VALUES
(34, 'như hoa', 'nam', 'hcmqn1@gmail.com', 'dũy uyen, quang nam', '0935662633', 'giao nhanh', '2019-12-04 10:42:12', '2019-12-04 10:42:12'),
(35, 'sam thi thanh nguyen', 'nam', '0369900436@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '4564556', NULL, '2019-12-04 10:48:45', '2019-12-04 10:48:45'),
(33, 'le an', 'nam', 'quynhblanh850@gmail.com', 'ktx khu A', '0852335523', 'lodna', '2019-12-04 01:39:30', '2019-12-04 01:39:30'),
(31, 'sam thi thanh nguyen', 'nam', 'happytanphat123@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '45', 's', '2019-12-03 16:22:19', '2019-12-03 16:22:19'),
(32, 'minh duc', 'nam', 'an123@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', 'a', '2019-12-03 16:24:55', '2019-12-03 16:24:55'),
(30, 'cc', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', 'ưqd', '2019-12-03 15:42:30', '2019-12-03 15:42:30'),
(29, 'van anh van', 'nam', 'hcmqn1@gmail.com', '15 nha trang', '0902332332', NULL, '2019-12-03 15:40:29', '2019-12-03 15:38:02'),
(27, 'nguyen hai dang', 'nam', 'hang@gmail.com', '10 ktx khu a', '090909090', '3 ngay phai co', '2019-12-03 13:36:05', '2019-12-03 13:36:05'),
(28, 'tri an', 'nam', 'an123@gmail.com', 'dong hoa di an binh duong', '0978667511', 'khong', '2019-12-03 13:37:05', '2019-12-03 13:37:05'),
(26, 'van cong tan phat', 'nam', 'phatvct99@gmail.com', '10 duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', 'giao nhanh', '2019-12-03 13:33:31', '2019-12-03 13:33:31'),
(36, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', 'lk', '2019-12-04 10:49:08', '2019-12-04 10:49:08'),
(37, 'sam thi thanh nguyen', 'nam', '0369900436@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', 'a', '2019-12-04 10:50:05', '2019-12-04 10:50:05'),
(38, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', 'tgf', '2019-12-04 10:50:35', '2019-12-04 10:50:35'),
(39, 'jhsdhh', 'nam', 'ngueyn@gmail.com', 'thu duc', '848', NULL, '2019-12-04 10:51:35', '2019-12-04 10:51:35'),
(40, 'dang hai', 'nam', 'haidang123@gmail.com', '123456', '123456', 'giao nhanh', '2019-12-04 14:05:35', '2019-12-04 14:05:35'),
(41, 'hang', 'nam', 'phatvct99@gmail.com', 'xcvxcv', '456456', 'vip pro', '2019-12-04 14:36:27', '2019-12-04 14:36:27'),
(42, 'cc', 'nam', 'hcmqn1@gmail.com', 'asdasd', '43534', 'cc', '2019-12-04 15:26:17', '2019-12-04 15:26:17'),
(43, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '54656456456', 'hfhfhfhfh', '2019-12-05 06:21:34', '2019-12-05 06:21:34'),
(44, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', 's', '2019-12-06 07:11:21', '2019-12-06 07:11:21'),
(45, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', 's', '2019-12-06 07:11:53', '2019-12-06 07:11:53'),
(46, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', 's', '2019-12-06 07:12:25', '2019-12-06 07:12:25'),
(47, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', 's', '2019-12-06 07:12:56', '2019-12-06 07:12:56'),
(48, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', 's', '2019-12-06 07:13:23', '2019-12-06 07:13:23'),
(49, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', 's', '2019-12-06 07:14:00', '2019-12-06 07:14:00'),
(50, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', 's', '2019-12-06 07:14:56', '2019-12-06 07:14:56'),
(51, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', 's', '2019-12-06 07:15:24', '2019-12-06 07:15:24'),
(52, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', 's', '2019-12-06 07:15:53', '2019-12-06 07:15:53'),
(53, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', 's', '2019-12-06 07:16:46', '2019-12-06 07:16:46'),
(54, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', 's', '2019-12-06 07:17:21', '2019-12-06 07:17:21'),
(55, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '345', NULL, '2019-12-06 07:21:17', '2019-12-06 07:21:17'),
(56, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', 'z', '2019-12-06 07:22:09', '2019-12-06 07:22:09'),
(57, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', 'z', '2019-12-06 07:24:52', '2019-12-06 07:24:52'),
(58, 'dang hai', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', NULL, '2019-12-06 07:34:21', '2019-12-06 07:34:21'),
(59, 'phat', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', NULL, '2019-12-06 07:57:27', '2019-12-06 07:57:27'),
(60, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', NULL, '2019-12-06 08:10:43', '2019-12-06 08:10:43'),
(61, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', NULL, '2019-12-06 08:11:53', '2019-12-06 08:11:53'),
(62, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', NULL, '2019-12-06 08:13:04', '2019-12-06 08:13:04'),
(63, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', NULL, '2019-12-06 08:15:17', '2019-12-06 08:15:17'),
(64, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', NULL, '2019-12-06 08:16:42', '2019-12-06 08:16:42'),
(65, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', NULL, '2019-12-06 08:17:07', '2019-12-06 08:17:07'),
(66, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'dfg', '768', NULL, '2019-12-06 08:23:04', '2019-12-06 08:23:04'),
(67, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', NULL, '2019-12-06 08:25:14', '2019-12-06 08:25:14'),
(68, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '435', NULL, '2019-12-06 08:28:53', '2019-12-06 08:28:53'),
(69, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', NULL, '2019-12-06 08:35:55', '2019-12-06 08:35:55'),
(70, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', NULL, '2019-12-06 08:42:47', '2019-12-06 08:42:47'),
(71, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', 'a', '2019-12-06 08:49:52', '2019-12-06 08:49:52'),
(72, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', 'aaa', '2019-12-06 12:40:20', '2019-12-06 12:40:20'),
(73, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', NULL, '2019-12-06 12:42:25', '2019-12-06 12:42:25'),
(74, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '45', NULL, '2019-12-06 12:44:55', '2019-12-06 12:44:55'),
(75, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', NULL, '2019-12-06 12:47:40', '2019-12-06 12:47:40'),
(76, 'phat', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', NULL, '2019-12-06 12:49:38', '2019-12-06 12:49:38'),
(77, 'phatvct99', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', NULL, '2019-12-06 12:51:57', '2019-12-06 12:51:57'),
(78, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', NULL, '2019-12-06 12:56:30', '2019-12-06 12:56:30'),
(79, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', NULL, '2019-12-06 12:57:45', '2019-12-06 12:57:45'),
(80, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '6', NULL, '2019-12-06 13:06:49', '2019-12-06 13:06:49'),
(81, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', NULL, '2019-12-06 13:08:36', '2019-12-06 13:08:36'),
(82, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '45', NULL, '2019-12-06 13:12:57', '2019-12-06 13:12:57'),
(83, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', NULL, '2019-12-06 13:14:21', '2019-12-06 13:14:21'),
(84, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', NULL, '2019-12-06 13:16:13', '2019-12-06 13:16:13'),
(85, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', NULL, '2019-12-06 13:19:58', '2019-12-06 13:19:58'),
(86, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', NULL, '2019-12-06 13:20:33', '2019-12-06 13:20:33'),
(87, 'VĂN CÔNG TẤN PHÁT', 'nam', 'phatvct99@gmail.com', '15 duy xuyên, quảng nam', '0932666512', NULL, '2019-12-06 13:25:16', '2019-12-06 13:25:16'),
(88, 'VĂN CÔNG TẤN PHÁT', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', NULL, '2019-12-06 13:29:02', '2019-12-06 13:29:02'),
(89, 'VĂN CÔNG TẤN PHÁT', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '33ZbqOf099gx', NULL, '2019-12-06 13:34:32', '2019-12-06 13:34:32'),
(90, 'VĂN CÔNG TẤN PHÁT', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '33ZbqOf099gx', NULL, '2019-12-06 13:35:01', '2019-12-06 13:35:01'),
(91, 'VĂN CÔNG TẤN PHÁT', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '33ZbqOf099gx', NULL, '2019-12-06 13:35:17', '2019-12-06 13:35:17'),
(92, 'VĂN CÔNG TẤN PHÁT', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', 'aaa', '2019-12-06 13:45:36', '2019-12-06 13:45:36'),
(93, 'VĂN CÔNG TẤN PHÁT', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', 'aaa', '2019-12-06 13:46:04', '2019-12-06 13:46:04'),
(94, 'tấn phát', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', 'a', '2019-12-06 13:48:22', '2019-12-06 13:48:22'),
(95, 'phát đẹp trai', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', NULL, '2019-12-06 13:49:41', '2019-12-06 13:49:41'),
(96, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', NULL, '2019-12-06 13:50:32', '2019-12-06 13:50:32'),
(97, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', NULL, '2019-12-06 13:52:03', '2019-12-06 13:52:03'),
(98, 'nguyen thi thanh sam', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', NULL, '2019-12-06 13:53:49', '2019-12-06 13:53:49'),
(99, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', NULL, '2019-12-06 13:55:25', '2019-12-06 13:55:25'),
(100, 'sam thi thanh nguyen', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', NULL, '2019-12-06 13:56:35', '2019-12-06 13:56:35'),
(101, 'tấn phát', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', NULL, '2019-12-06 14:01:51', '2019-12-06 14:01:51'),
(102, 'VĂN CÔNG TẤN PHÁT', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0934994611', NULL, '2019-12-06 14:21:01', '2019-12-06 14:21:01'),
(103, 'lê minh đức', 'nam', 'ducdocdinh19@gmail.com', 'hfhfhfh', '0121352523', 'alo', '2019-12-08 05:04:00', '2019-12-08 05:04:00'),
(104, 'VĂN CÔNG TẤN PHÁT', 'nam', 'phatvct99@gmail.com', 'duc nhuan, mo duc, duc nhuan, mo duc', '0773489230', NULL, '2019-12-08 06:46:40', '2019-12-08 06:46:40'),
(105, '17520885ádasd', 'nam', 'phatvct99@gmail.com', 'as', '234234234', NULL, '2020-01-03 05:50:32', '2020-01-03 05:50:32'),
(106, '17520885', 'nam', 'phatvct99@gmail.com', 'as', '0934994611', NULL, '2020-01-03 07:26:52', '2020-01-03 07:26:52'),
(107, '17520885', 'nam', 'phatvct99@gmail.com', 'as', '0934994611', 'd', '2020-01-05 11:51:57', '2020-01-05 11:51:57'),
(108, '17520885ádasd', 'nam', 'phatvct99@gmail.com', 'as', '0934994611', NULL, '2020-01-05 12:32:24', '2020-01-05 12:32:24');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

CREATE TABLE `news` (
  `id` int(10) NOT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'tiêu đề',
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'nội dung',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'hình',
  `create_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_products` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_type` int(10) UNSIGNED DEFAULT NULL,
  `description_products` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_price` float DEFAULT NULL,
  `promotion_price` float DEFAULT NULL,
  `image_products` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name_products`, `id_type`, `description_products`, `unit_price`, `promotion_price`, `image_products`, `unit`, `new`, `created_at`, `updated_at`) VALUES
(76, 'Rabbit Hell', 6, NULL, 250000, 200000, '1.webp', NULL, 1, NULL, NULL),
(77, 'Rabbit Hell', 6, NULL, 250000, 200000, '2.webp', NULL, 1, NULL, NULL),
(78, 'Rabbit Hell', 6, NULL, 250000, 200000, '008d45e7-e175-45b2-be12-761782b4b95e_295c5d582fa54fb3873cc734ab86110d_grande.webp', NULL, 1, NULL, NULL),
(79, 'Rabbit Hell', 6, NULL, 250000, 200000, '58c0f55a-730a-48ee-a513-eaf7fb627e71_fee9020b7187488d9ace082e265364b8_grande.webp', NULL, 1, NULL, NULL),
(80, 'Sweet Dream Jacket', 9, NULL, 250000, 200000, 'mat_sau_35d24e4e512d40d8b9a9e926363727eb_large.webp', NULL, 0, NULL, NULL),
(81, 'Rabbit Hell AA', 9, NULL, 250000, 200000, 'dai_sau_f5e3c07f133a42f9b1e1f4a7afe3c21a_large.webp', NULL, 0, NULL, NULL),
(82, 'Sweet Dream Jacket', 9, NULL, 250000, 200000, 'dai_sau_1609e4e394f14e5ca281d9fc4ca429db_large.webp', NULL, 0, NULL, NULL),
(83, 'Sweet Dream Jacket', 9, NULL, 250000, 200000, 'mat_truoc_568dcba25bc141a9843e195732f8ccb7_large.webp', NULL, 0, NULL, NULL),
(84, 'Rabbit Hell', 6, NULL, 250000, 200000, 'mat_sau_4dd139c0cbff490bb1ea3dffd8212080_master.webp', NULL, 0, NULL, NULL),
(85, 'Bad Generation', 7, NULL, 250000, 200000, 'dd.webp', NULL, 0, NULL, NULL),
(86, 'Bad Generation', 7, NULL, 250000, 200000, 'd.webp', NULL, 0, NULL, NULL),
(87, 'Trippy Colour Hoodie', 8, NULL, 250000, 200000, 'mat_truoc_4e8e8390c0404e1f914d94381af795d6_master.webp', NULL, 0, NULL, NULL),
(88, 'Trippy Colour Hoodie', 8, NULL, 250000, 200000, 'mat_truoc_f1d2e308f282449cbcf9773d4c5619cb_master.webp', NULL, 0, NULL, NULL),
(89, 'Trippy Colour Hoodie', 8, NULL, 250000, 200000, 'mat_truoc_4c3aaedf3e2d4dc59a2bc2507b8d9488_large.webp', NULL, 0, NULL, NULL),
(90, 'Trippy Colour Hoodie', 8, NULL, 250000, 200000, 'mat_truoc_3af47dbb8b2d44438e95fe07585a7c3c_master.webp', NULL, 0, NULL, NULL),
(91, 'RABBIT SHORT', 10, NULL, 250000, 200000, 'mat_truoc_e8fd45ce43684903b33610d855292623_large.webp', NULL, 0, NULL, NULL),
(92, 'RABBIT SHORT', 10, NULL, 250000, 200000, 'mat_truoc_56413a82f54e459ca31441edc7a6a1ed_large.webp', NULL, 0, NULL, NULL),
(93, 'RABBIT SHORT', 10, NULL, 250000, 200000, 'mat_truoc_56413a82f54e459ca31441edc7a6a1ed_large.webp', NULL, 0, NULL, NULL),
(94, 'RABBIT SHORT', 10, NULL, 250000, 200000, 'mat_truoc_7085c9a7a5d84beba1e529f8fec006f3_large.webp', NULL, 0, NULL, NULL),
(95, 'RABBIT SHORT', 10, NULL, 250000, 200000, 'mat_truoc_ae74100c6bdd42f1b576b6c39ad59d85_large.webp', NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slide`
--

CREATE TABLE `slide` (
  `id` int(11) NOT NULL,
  `link` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `slide`
--

INSERT INTO `slide` (`id`, `link`, `image`) VALUES
(1, '', '1.jpg'),
(2, '', '2.jpg'),
(3, '', '3.jpg'),
(4, '', '4.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(10) UNSIGNED NOT NULL,
  `admin_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `admin_email`, `admin_password`, `admin_name`, `admin_phone`, `created_at`, `updated_at`) VALUES
(1, 'admin@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Anh Văn', '0934994611', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `type_products`
--

CREATE TABLE `type_products` (
  `id_types` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `type_products`
--

INSERT INTO `type_products` (`id_types`, `name`, `description`, `image`, `created_at`, `updated_at`) VALUES
(6, 'T-SHIRT', NULL, NULL, NULL, NULL),
(7, 'HOODIE', NULL, NULL, NULL, NULL),
(8, 'QUẦN DÀI', NULL, NULL, NULL, NULL),
(9, 'ÁO TAY DÀI', NULL, NULL, NULL, NULL),
(10, 'SHORT', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `phone`, `address`, `remember_token`, `created_at`, `updated_at`) VALUES
(8, 'nguyen thi thanh sam', 'happytanphat123@gmail.com', '$2y$10$cl9F4.VfZo3SQgrFpVuhJe.2ZRSwwK/MvEZarrn1PMqhWqEhocriK', '435', 'duc nhuan, mo duc, duc nhuan, mo duc', NULL, '2019-12-01 03:02:49', '2019-12-01 03:02:49'),
(9, 'sam thi thanh nguyen', 'hcmqn1@gmail.com', '$2y$10$4JSukiDGMLM.nZP4Q2sYBu8xNEpAIFXJ8ofb1kURSfLmvnOQ55ysu', '0934994611', 'duc nhuan, mo duc, duc nhuan, mo duc', NULL, '2019-12-03 01:35:54', '2019-12-03 01:35:54'),
(10, 'văn công tấn phát', 'phatvct88@gmail.com', '$2y$10$eD7QkXLk9qJlKzRxMaPTCOXoHC5hMjOAsMXJnC2RXnFKkLOwPinEy', '435', '123456789', NULL, '2019-12-04 12:34:45', '2019-12-04 12:34:45'),
(11, 'hien nguyen', 'nhien@gmail.com', '$2y$10$FpUPMRLIssGUnA.s4ilCVOgiEqnZWU13hHy.M/.y6oDmXqJTUHiCO', '3458845', '4358 fnjsdf', NULL, '2019-12-04 12:37:13', '2019-12-04 12:37:13'),
(12, 'minh duc', 'alo123@gmail.com', '$2y$10$SihSVljK/YUukzlN1kFU8uvLJi43Y3Ofs8I.oAI291HP8cASSbku2', '010939399393', '67 dinh tien hoang', NULL, '2019-12-05 06:17:59', '2019-12-05 06:17:59'),
(13, 'tran van nguyeen', 'nguyen111@gmail.com', '$2y$10$oRqtEfYSNnQH5W2CmJ58wuBAF/YEx/J1nNYA3dgbavQBTIES1TwNS', '090233225', '10 thu duc hcm', NULL, '2019-12-05 13:31:11', '2019-12-05 13:31:11'),
(14, 'tấn phát', 'phatvct@gmail.com', '$2y$10$9LHJFmAxMOcBj5twAjvd/.jDPg63XE8U4vYEdkI.qb9zNfFD2M4R.', '123', 'hcm', NULL, '2020-01-05 16:48:53', '2020-01-05 16:48:53'),
(15, 'FDGDFG', 'quytran.1998@GMAIL.COM', '$2y$10$qQFzN6hXnU4Dg9VvdpgJs.7A3kMT50Oitd7Qg/l9BG0bE6OqZjISW', '32772950', 'DFGDFG', NULL, '2020-04-11 06:10:59', '2020-04-11 06:10:59');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bills_ibfk_1` (`id_customer`);

--
-- Chỉ mục cho bảng `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_id_type_foreign` (`id_type`);

--
-- Chỉ mục cho bảng `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Chỉ mục cho bảng `type_products`
--
ALTER TABLE `type_products`
  ADD PRIMARY KEY (`id_types`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT cho bảng `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT cho bảng `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `type_products`
--
ALTER TABLE `type_products`
  MODIFY `id_types` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_id_type_foreign` FOREIGN KEY (`id_type`) REFERENCES `type_products` (`id_types`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
