-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 12 ديسمبر 2019 الساعة 10:48
-- إصدار الخادم: 10.1.40-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cvdbaftermigrate`
--

-- --------------------------------------------------------

--
-- بنية الجدول `admin_comments`
--

CREATE TABLE `admin_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `comment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recieved_email_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `admin_comments`
--

INSERT INTO `admin_comments` (`id`, `comment`, `recieved_email_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'xxx', 13, 31, '2019-11-25 06:22:55', '2019-11-25 06:22:55'),
(2, 'comment xxx', 13, 31, '2019-11-25 06:23:06', '2019-11-25 06:23:06'),
(3, 'comment xxx', 14, 31, '2019-11-25 06:23:18', '2019-11-25 06:23:18'),
(4, 'comment xxx5', 14, 31, '2019-11-25 06:23:24', '2019-11-25 06:23:24');

-- --------------------------------------------------------

--
-- بنية الجدول `admin_done_email_logs`
--

CREATE TABLE `admin_done_email_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `recieved_email_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `admin_done_email_logs`
--

INSERT INTO `admin_done_email_logs` (`id`, `recieved_email_id`, `user_id`, `created_at`, `updated_at`) VALUES
(4, 13, 33, '2019-12-10 09:25:06', '2019-12-10 09:25:06'),
(7, 13, 33, '2019-12-10 09:26:58', '2019-12-10 09:26:58'),
(8, 13, 33, '2019-12-12 07:16:36', '2019-12-12 07:16:36'),
(10, 13, 33, '2019-12-12 07:46:57', '2019-12-12 07:46:57');

-- --------------------------------------------------------

--
-- بنية الجدول `admin_email_assign_logs`
--

CREATE TABLE `admin_email_assign_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `recieved_email_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `to_assigned_admin_user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `admin_email_assign_logs`
--

INSERT INTO `admin_email_assign_logs` (`id`, `recieved_email_id`, `user_id`, `to_assigned_admin_user_id`, `created_at`, `updated_at`) VALUES
(1, 13, 31, 1, '2019-11-23 07:39:15', '2019-11-23 07:39:15'),
(2, 14, 31, 1, '2019-11-23 07:39:37', '2019-11-23 07:39:37'),
(3, 14, 31, 2, '2019-11-23 07:39:45', '2019-11-23 07:39:45'),
(4, 13, 31, 2, '2019-11-23 07:39:50', '2019-11-23 07:39:50');

-- --------------------------------------------------------

--
-- بنية الجدول `admin_note_done_email_logs`
--

CREATE TABLE `admin_note_done_email_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `recieved_email_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `admin_note_done_email_logs`
--

INSERT INTO `admin_note_done_email_logs` (`id`, `recieved_email_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 13, 33, '2019-12-10 09:28:17', '2019-12-10 09:28:17'),
(2, 13, 33, '2019-12-12 07:22:11', '2019-12-12 07:22:11');

-- --------------------------------------------------------

--
-- بنية الجدول `admin_open_logs`
--

CREATE TABLE `admin_open_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `recieved_email_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `admin_open_logs`
--

INSERT INTO `admin_open_logs` (`id`, `recieved_email_id`, `user_id`, `created_at`, `updated_at`) VALUES
(20, 13, 33, '2019-12-10 09:14:32', '2019-12-10 09:14:32'),
(21, 13, 33, '2019-12-10 09:18:39', '2019-12-10 09:18:39');

-- --------------------------------------------------------

--
-- بنية الجدول `admin_replied_emails`
--

CREATE TABLE `admin_replied_emails` (
  `id` int(10) UNSIGNED NOT NULL,
  `replyed_email_body` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `replyed_email_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cc` int(10) UNSIGNED DEFAULT NULL,
  `recieved_email_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `admin_replied_emails`
--

INSERT INTO `admin_replied_emails` (`id`, `replyed_email_body`, `replyed_email_title`, `cc`, `recieved_email_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'xxxx', 'xxxx', 0, 13, 31, '2019-11-23 07:44:50', '2019-11-23 07:44:50'),
(2, 'xxxx', 'xxxx', 0, 14, 31, '2019-11-23 07:44:56', '2019-11-23 07:44:56'),
(3, 'comment body', 'comment title', NULL, 13, 33, '2019-12-12 07:36:13', '2019-12-12 07:36:13'),
(4, 'comment body', 'comment title', NULL, 13, 33, '2019-12-12 07:39:40', '2019-12-12 07:39:40');

-- --------------------------------------------------------

--
-- بنية الجدول `admin_restore_email_logs`
--

CREATE TABLE `admin_restore_email_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `recieved_email_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `admin_restore_email_logs`
--

INSERT INTO `admin_restore_email_logs` (`id`, `recieved_email_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 13, 33, '2019-12-10 17:40:39', '2019-12-10 17:40:39'),
(2, 13, 33, '2019-12-10 17:53:09', '2019-12-10 17:53:09'),
(3, 13, 33, '2019-12-10 17:53:47', '2019-12-10 17:53:47'),
(5, 13, 33, '2019-12-10 17:57:00', '2019-12-10 17:57:00'),
(6, 13, 33, '2019-12-11 07:58:58', '2019-12-11 07:58:58'),
(7, 13, 33, '2019-12-11 09:11:51', '2019-12-11 09:11:51'),
(8, 13, 33, '2019-12-11 09:12:56', '2019-12-11 09:12:56'),
(9, 13, 33, '2019-12-12 07:18:37', '2019-12-12 07:18:37');

-- --------------------------------------------------------

--
-- بنية الجدول `companies`
--

CREATE TABLE `companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `main_language_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `company_status_id` int(10) UNSIGNED DEFAULT NULL,
  `company_method_verfication_id` int(10) UNSIGNED DEFAULT NULL,
  `admin_description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_numner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_user_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `companies`
--

INSERT INTO `companies` (`id`, `main_language_id`, `created_at`, `updated_at`, `is_verified`, `company_status_id`, `company_method_verfication_id`, `admin_description`, `email`, `contact_numner`, `admin_user_id`, `user_id`) VALUES
(1, 2, NULL, NULL, 0, NULL, 1, 'this is good company', '', '', 1, 2),
(3, 2, NULL, NULL, 0, 4, 2, '', '', '', NULL, 2);

-- --------------------------------------------------------

--
-- بنية الجدول `company_admins_logs`
--

CREATE TABLE `company_admins_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_status_id` int(10) UNSIGNED NOT NULL,
  `company_method_verfication_id` int(10) UNSIGNED NOT NULL,
  `admin_description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `company_admins_logs`
--

INSERT INTO `company_admins_logs` (`id`, `company_status_id`, `company_method_verfication_id`, `admin_description`, `created_at`, `updated_at`, `company_id`, `user_id`) VALUES
(1, 1, 1, 'this is good company', '2019-09-30 07:05:42', '2019-09-30 07:05:42', 0, NULL),
(2, 4, 1, 'this is good company', '2019-09-30 07:08:18', '2019-09-30 07:08:18', 0, NULL),
(3, 1, 1, 'this is good company', '2019-09-30 07:08:26', '2019-09-30 07:08:26', 0, NULL),
(4, 1, 1, 'this is good company', '2019-09-30 07:09:34', '2019-09-30 07:09:34', 0, NULL),
(5, 1, 1, 'this is good company', '2019-09-30 07:17:07', '2019-09-30 07:17:07', 1, NULL),
(6, 1, 1, 'this is good company', '2019-09-30 07:18:33', '2019-09-30 07:18:33', 1, 2),
(7, 4, 1, 'this is gooخخخخd company', '2019-09-30 07:18:39', '2019-09-30 07:18:39', 1, 2),
(8, 1, 1, 'this is good company', '2019-10-15 16:22:50', '2019-10-15 16:22:50', 1, 1),
(9, 1, 1, 'this is good company', '2019-10-16 04:17:54', '2019-10-16 04:17:54', 1, 1);

-- --------------------------------------------------------

--
-- بنية الجدول `company_industries`
--

CREATE TABLE `company_industries` (
  `id` int(10) UNSIGNED NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_industry_parent_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `company_industries`
--

INSERT INTO `company_industries` (`id`, `verified`, `created_at`, `updated_at`, `company_industry_parent_id`) VALUES
(1, 1, NULL, NULL, 1),
(2, 1, NULL, NULL, NULL),
(3, 1, NULL, NULL, NULL),
(4, 1, NULL, NULL, NULL),
(5, 1, NULL, NULL, NULL),
(6, 1, NULL, NULL, NULL),
(7, 1, NULL, NULL, NULL),
(8, 1, NULL, NULL, NULL),
(9, 1, NULL, NULL, NULL),
(10, 1, NULL, NULL, NULL),
(11, 1, NULL, NULL, NULL),
(12, 1, NULL, NULL, NULL),
(13, 1, NULL, NULL, NULL),
(14, 1, NULL, NULL, NULL),
(15, 1, NULL, NULL, NULL),
(16, 1, NULL, NULL, NULL),
(17, 1, NULL, NULL, NULL),
(18, 1, NULL, NULL, NULL),
(19, 1, NULL, NULL, NULL),
(20, 1, NULL, NULL, NULL),
(21, 1, NULL, NULL, NULL),
(22, 1, NULL, NULL, NULL),
(23, 1, NULL, NULL, NULL),
(24, 1, NULL, NULL, NULL),
(25, 1, NULL, NULL, NULL),
(26, 1, NULL, NULL, NULL),
(27, 1, NULL, NULL, NULL),
(28, 1, NULL, NULL, NULL),
(29, 1, NULL, NULL, NULL),
(30, 1, NULL, NULL, NULL),
(31, 1, NULL, NULL, NULL),
(32, 1, NULL, NULL, NULL),
(33, 1, NULL, NULL, NULL),
(34, 1, NULL, NULL, NULL),
(35, 1, NULL, NULL, NULL),
(36, 1, NULL, NULL, NULL),
(37, 1, NULL, NULL, NULL),
(38, 1, NULL, NULL, NULL),
(39, 1, NULL, NULL, NULL),
(40, 1, NULL, NULL, NULL),
(41, 1, NULL, NULL, NULL),
(42, 1, NULL, NULL, NULL),
(43, 1, NULL, NULL, NULL),
(44, 1, NULL, NULL, NULL),
(45, 1, NULL, NULL, NULL),
(46, 1, NULL, NULL, NULL),
(47, 1, NULL, NULL, NULL),
(48, 1, NULL, NULL, NULL),
(49, 1, NULL, NULL, NULL),
(50, 1, NULL, NULL, NULL),
(51, 1, NULL, NULL, NULL),
(52, 1, NULL, NULL, NULL),
(53, 1, NULL, NULL, NULL),
(54, 1, NULL, NULL, NULL),
(55, 1, NULL, NULL, NULL),
(56, 1, NULL, NULL, NULL),
(57, 1, NULL, NULL, NULL),
(58, 1, NULL, NULL, NULL),
(59, 1, NULL, NULL, NULL),
(60, 1, NULL, NULL, NULL),
(61, 1, NULL, NULL, NULL),
(62, 1, NULL, NULL, NULL),
(63, 1, NULL, NULL, NULL),
(64, 1, NULL, NULL, NULL),
(65, 1, NULL, NULL, NULL),
(66, 1, NULL, NULL, NULL),
(67, 1, NULL, NULL, NULL),
(68, 1, NULL, NULL, NULL),
(69, 1, NULL, NULL, NULL),
(70, 1, NULL, NULL, NULL),
(71, 1, NULL, NULL, NULL),
(72, 1, NULL, NULL, NULL),
(73, 1, NULL, NULL, NULL),
(74, 1, NULL, NULL, NULL),
(75, 1, NULL, NULL, NULL),
(76, 1, NULL, NULL, NULL),
(77, 1, NULL, NULL, NULL),
(78, 1, NULL, NULL, NULL),
(79, 1, NULL, NULL, NULL),
(80, 1, NULL, NULL, NULL),
(81, 1, NULL, NULL, NULL),
(82, 1, NULL, NULL, NULL),
(83, 1, NULL, NULL, NULL),
(84, 1, NULL, NULL, NULL),
(85, 1, NULL, NULL, NULL),
(86, 1, NULL, NULL, NULL),
(87, 1, NULL, NULL, NULL),
(88, 1, NULL, NULL, NULL),
(89, 1, NULL, NULL, NULL),
(90, 1, NULL, NULL, NULL),
(91, 1, NULL, NULL, NULL),
(92, 1, NULL, NULL, NULL),
(93, 1, NULL, NULL, NULL),
(94, 1, NULL, NULL, NULL),
(95, 1, NULL, NULL, NULL),
(96, 1, NULL, NULL, NULL),
(97, 1, NULL, NULL, NULL),
(98, 1, NULL, NULL, NULL),
(99, 1, NULL, NULL, NULL),
(100, 1, NULL, NULL, NULL),
(101, 1, NULL, NULL, NULL),
(102, 1, NULL, NULL, NULL),
(103, 1, NULL, NULL, NULL),
(104, 1, NULL, NULL, NULL),
(105, 1, NULL, NULL, NULL),
(106, 1, NULL, NULL, NULL),
(107, 1, NULL, NULL, NULL),
(108, 1, NULL, NULL, NULL),
(109, 1, NULL, NULL, NULL),
(110, 1, NULL, NULL, NULL),
(111, 1, NULL, NULL, NULL),
(112, 1, NULL, NULL, NULL),
(113, 1, NULL, NULL, NULL),
(114, 1, NULL, NULL, NULL),
(115, 1, NULL, NULL, NULL),
(116, 1, NULL, NULL, NULL),
(117, 1, NULL, NULL, NULL),
(118, 1, NULL, NULL, NULL),
(119, 1, NULL, NULL, NULL),
(120, 1, NULL, NULL, NULL),
(121, 1, NULL, NULL, NULL),
(122, 1, NULL, NULL, NULL),
(123, 1, NULL, NULL, NULL),
(124, 1, NULL, NULL, NULL),
(125, 1, NULL, NULL, NULL),
(126, 1, NULL, NULL, NULL),
(127, 1, NULL, NULL, NULL),
(128, 1, NULL, NULL, NULL),
(129, 1, NULL, NULL, NULL),
(130, 1, NULL, NULL, NULL),
(131, 1, NULL, NULL, NULL),
(132, 1, NULL, NULL, NULL),
(133, 1, NULL, NULL, NULL),
(134, 1, NULL, NULL, NULL),
(135, 1, NULL, NULL, NULL),
(136, 1, NULL, NULL, NULL),
(137, 1, NULL, NULL, NULL),
(138, 1, NULL, NULL, NULL),
(139, 1, NULL, NULL, NULL),
(140, 1, NULL, NULL, NULL),
(141, 1, NULL, NULL, NULL),
(142, 1, NULL, NULL, NULL),
(143, 1, NULL, NULL, NULL),
(144, 1, NULL, NULL, NULL),
(145, 1, NULL, NULL, NULL),
(146, 1, NULL, NULL, NULL),
(147, 1, NULL, NULL, NULL),
(148, 1, NULL, NULL, NULL),
(149, 1, NULL, NULL, NULL),
(150, 1, NULL, NULL, NULL),
(151, 1, NULL, NULL, NULL),
(152, 1, NULL, NULL, NULL),
(153, 1, NULL, NULL, NULL),
(154, 1, NULL, NULL, NULL),
(155, 1, NULL, NULL, NULL),
(156, 1, NULL, NULL, NULL),
(157, 1, NULL, NULL, NULL),
(158, 1, NULL, NULL, NULL),
(159, 1, NULL, NULL, NULL),
(160, 1, NULL, NULL, NULL),
(161, 1, NULL, NULL, NULL),
(162, 1, NULL, NULL, NULL),
(163, 1, NULL, NULL, NULL),
(164, 1, NULL, NULL, NULL),
(165, 1, NULL, NULL, NULL),
(166, 1, NULL, NULL, NULL),
(167, 1, NULL, NULL, NULL),
(168, 1, NULL, NULL, NULL),
(169, 1, NULL, NULL, NULL),
(170, 1, NULL, NULL, NULL),
(171, 1, NULL, NULL, NULL),
(172, 1, NULL, NULL, NULL),
(173, 1, NULL, NULL, NULL),
(174, 1, NULL, NULL, NULL),
(175, 1, NULL, NULL, NULL),
(176, 1, NULL, NULL, NULL),
(177, 1, NULL, NULL, NULL),
(178, 1, NULL, NULL, NULL),
(179, 1, NULL, NULL, NULL),
(180, 1, NULL, NULL, NULL),
(181, 1, NULL, NULL, NULL),
(182, 1, NULL, NULL, NULL),
(183, 1, NULL, NULL, NULL),
(184, 1, NULL, NULL, NULL),
(185, 1, NULL, NULL, NULL),
(186, 1, NULL, NULL, NULL),
(187, 1, NULL, NULL, NULL),
(188, 1, NULL, NULL, NULL),
(189, 1, NULL, NULL, NULL),
(190, 1, NULL, NULL, NULL),
(191, 1, NULL, NULL, NULL),
(192, 1, NULL, NULL, NULL),
(193, 1, NULL, NULL, NULL),
(194, 1, NULL, NULL, NULL),
(195, 1, NULL, NULL, NULL),
(196, 1, NULL, NULL, NULL),
(197, 1, NULL, NULL, NULL),
(198, 1, NULL, NULL, NULL),
(199, 1, NULL, NULL, NULL),
(200, 1, NULL, NULL, NULL),
(201, 1, NULL, NULL, NULL),
(202, 1, NULL, NULL, NULL),
(203, 1, NULL, NULL, NULL),
(204, 1, NULL, NULL, NULL),
(205, 1, NULL, NULL, NULL),
(206, 1, NULL, NULL, NULL),
(207, 1, NULL, NULL, NULL),
(208, 1, NULL, NULL, NULL),
(209, 1, NULL, NULL, NULL),
(210, 1, NULL, NULL, NULL),
(211, 1, NULL, NULL, NULL),
(212, 1, NULL, NULL, NULL),
(213, 1, NULL, NULL, NULL),
(214, 1, NULL, NULL, NULL),
(215, 1, NULL, NULL, NULL),
(216, 1, NULL, NULL, NULL),
(217, 1, NULL, NULL, NULL),
(218, 1, NULL, NULL, NULL),
(219, 1, NULL, NULL, NULL),
(220, 1, NULL, NULL, NULL),
(221, 1, NULL, NULL, NULL),
(222, 1, NULL, NULL, NULL),
(223, 1, NULL, NULL, NULL),
(224, 1, NULL, NULL, NULL),
(225, 1, NULL, NULL, NULL),
(226, 1, NULL, NULL, NULL),
(227, 1, NULL, NULL, NULL),
(228, 1, NULL, NULL, NULL),
(229, 1, NULL, NULL, NULL),
(230, 1, NULL, NULL, NULL),
(231, 1, NULL, NULL, NULL),
(232, 1, NULL, NULL, NULL),
(233, 1, NULL, NULL, NULL),
(234, 1, NULL, NULL, NULL),
(235, 1, NULL, NULL, NULL),
(236, 1, NULL, NULL, NULL),
(237, 1, NULL, NULL, NULL),
(238, 1, NULL, NULL, NULL),
(239, 1, NULL, NULL, NULL),
(240, 1, NULL, NULL, NULL),
(241, 1, NULL, NULL, NULL),
(242, 1, NULL, NULL, NULL),
(243, 1, NULL, NULL, NULL),
(244, 1, NULL, NULL, NULL),
(245, 1, NULL, NULL, NULL),
(246, 1, NULL, NULL, NULL),
(247, 1, NULL, NULL, NULL),
(248, 1, NULL, NULL, NULL),
(249, 1, NULL, NULL, NULL),
(250, 1, NULL, NULL, NULL),
(251, 1, NULL, NULL, NULL),
(252, 1, NULL, NULL, NULL),
(253, 1, NULL, NULL, NULL),
(254, 1, NULL, NULL, NULL),
(255, 1, NULL, NULL, NULL),
(256, 1, NULL, NULL, NULL),
(257, 1, NULL, NULL, NULL),
(258, 1, NULL, NULL, NULL),
(259, 1, NULL, NULL, NULL),
(260, 1, NULL, NULL, NULL),
(261, 1, NULL, NULL, NULL),
(262, 1, NULL, NULL, NULL),
(263, 1, NULL, NULL, NULL),
(264, 1, NULL, NULL, NULL),
(265, 1, NULL, NULL, NULL),
(266, 1, NULL, NULL, NULL),
(267, 1, NULL, NULL, NULL),
(268, 1, NULL, NULL, NULL),
(269, 1, NULL, NULL, NULL),
(270, 1, NULL, NULL, NULL),
(271, 1, NULL, NULL, NULL),
(272, 1, NULL, NULL, NULL),
(273, 1, NULL, NULL, NULL),
(274, 1, NULL, NULL, NULL),
(275, 1, NULL, NULL, NULL),
(276, 1, NULL, NULL, NULL),
(277, 1, NULL, NULL, NULL),
(278, 1, NULL, NULL, NULL),
(279, 1, NULL, NULL, NULL),
(280, 1, NULL, NULL, NULL),
(281, 1, NULL, NULL, NULL),
(282, 1, NULL, NULL, NULL),
(283, 1, NULL, NULL, NULL),
(284, 1, NULL, NULL, NULL),
(285, 1, NULL, NULL, NULL),
(286, 1, NULL, NULL, NULL),
(287, 1, NULL, NULL, NULL),
(288, 1, NULL, NULL, NULL),
(289, 1, NULL, NULL, NULL),
(290, 1, NULL, NULL, NULL),
(291, 1, NULL, NULL, NULL),
(292, 1, NULL, NULL, NULL),
(293, 1, NULL, NULL, NULL),
(294, 1, NULL, NULL, NULL),
(295, 1, NULL, NULL, NULL),
(296, 1, NULL, NULL, NULL),
(297, 1, NULL, NULL, NULL),
(298, 1, NULL, NULL, NULL),
(299, 1, NULL, NULL, NULL),
(300, 1, NULL, NULL, NULL),
(301, 1, NULL, NULL, NULL),
(302, 1, NULL, NULL, NULL),
(303, 1, NULL, NULL, NULL),
(304, 1, NULL, NULL, NULL),
(305, 1, NULL, NULL, NULL),
(306, 1, NULL, NULL, NULL),
(307, 1, NULL, NULL, NULL),
(308, 1, NULL, NULL, NULL),
(309, 1, NULL, NULL, NULL),
(310, 1, NULL, NULL, NULL),
(311, 1, NULL, NULL, NULL),
(312, 1, NULL, NULL, NULL),
(313, 1, NULL, NULL, NULL),
(314, 1, NULL, NULL, NULL),
(315, 1, NULL, NULL, NULL),
(316, 1, NULL, NULL, NULL),
(317, 1, NULL, NULL, NULL),
(318, 1, NULL, NULL, NULL),
(319, 1, NULL, NULL, NULL),
(320, 1, NULL, NULL, NULL),
(321, 1, NULL, NULL, NULL),
(322, 1, NULL, NULL, NULL),
(323, 1, NULL, NULL, NULL),
(324, 1, NULL, NULL, NULL),
(325, 1, NULL, NULL, NULL),
(326, 0, '2019-06-16 08:13:15', '2019-06-16 08:13:15', NULL),
(327, 0, '2019-06-16 08:14:14', '2019-06-16 08:14:14', NULL),
(328, 0, '2019-06-26 04:45:09', '2019-06-26 04:45:09', NULL),
(329, 0, '2019-06-26 04:49:57', '2019-06-26 04:49:57', NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `company_industries_for_companies`
--

CREATE TABLE `company_industries_for_companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_profile_id` int(10) UNSIGNED NOT NULL,
  `company_industry_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `company_industries_for_companies`
--

INSERT INTO `company_industries_for_companies` (`id`, `company_profile_id`, `company_industry_id`, `created_at`, `updated_at`) VALUES
(31, 1, 1, NULL, NULL),
(32, 2, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `company_industry_parents`
--

CREATE TABLE `company_industry_parents` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `company_industry_parents`
--

INSERT INTO `company_industry_parents` (`id`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `company_industry_parent_trans`
--

CREATE TABLE `company_industry_parent_trans` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_industry_parent_id` int(10) UNSIGNED DEFAULT NULL,
  `translated_languages_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `company_industry_parent_trans`
--

INSERT INTO `company_industry_parent_trans` (`id`, `company_industry_parent_id`, `translated_languages_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'company_industry_parent', NULL, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `company_industry_translations`
--

CREATE TABLE `company_industry_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_industry_id` int(10) UNSIGNED DEFAULT NULL,
  `translated_languages_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `company_industry_translations`
--

INSERT INTO `company_industry_translations` (`id`, `company_industry_id`, `translated_languages_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Abortion Policy/Anti-Abortion', NULL, NULL),
(2, 2, 1, 'Abortion Policy/Pro-Abortion Rights', NULL, NULL),
(3, 3, 1, 'Accounting', NULL, NULL),
(4, 4, 1, 'Advertising/Public Relations', NULL, NULL),
(5, 5, 1, 'Aerospace, Defense Contractors', NULL, NULL),
(6, 6, 1, 'Agribusiness', NULL, NULL),
(7, 7, 1, 'Agricultural Services & Products', NULL, NULL),
(8, 8, 1, 'Agriculture', NULL, NULL),
(9, 9, 1, 'Air Transport', NULL, NULL),
(10, 10, 1, 'Air Transport Unions', NULL, NULL),
(11, 11, 1, 'Airlines', NULL, NULL),
(12, 12, 1, 'Alcoholic Beverages', NULL, NULL),
(13, 13, 1, 'Alternative Energy Production & Services', NULL, NULL),
(14, 14, 1, 'Alternative Dispute Resolution', NULL, NULL),
(15, 15, 1, 'Alternative Medicine', NULL, NULL),
(16, 16, 1, 'Animation', NULL, NULL),
(17, 17, 1, 'Apparel & Fashion', NULL, NULL),
(18, 18, 1, 'Architectural Services', NULL, NULL),
(19, 19, 1, 'Architecture & Planning', NULL, NULL),
(20, 20, 1, 'Arts & Crafts', NULL, NULL),
(21, 21, 1, 'Attorneys/Law Firms', NULL, NULL),
(22, 22, 1, 'Auto Dealers', NULL, NULL),
(23, 23, 1, 'Auto Dealers, Japanese', NULL, NULL),
(24, 24, 1, 'Auto Manufacturers', NULL, NULL),
(25, 25, 1, 'Automotive', NULL, NULL),
(26, 26, 1, 'Aviation & Aerospace', NULL, NULL),
(27, 27, 1, 'Banking', NULL, NULL),
(28, 28, 1, 'Banking, Mortgage', NULL, NULL),
(29, 29, 1, 'Banks, Commercial', NULL, NULL),
(30, 30, 1, 'Banks, Savings & Loans', NULL, NULL),
(31, 31, 1, 'Bars & Restaurants', NULL, NULL),
(32, 32, 1, 'Beer, Wine & Liquor', NULL, NULL),
(33, 33, 1, 'Biotechnology', NULL, NULL),
(34, 34, 1, 'Books, Magazines & Newspapers', NULL, NULL),
(35, 35, 1, 'Broadcast Media', NULL, NULL),
(36, 36, 1, 'Builders/General Contractors', NULL, NULL),
(37, 37, 1, 'Builders/Residential', NULL, NULL),
(38, 38, 1, 'Building Materials & Equipment', NULL, NULL),
(39, 39, 1, 'Building Trade Unions ', NULL, NULL),
(40, 40, 1, 'Business Associations', NULL, NULL),
(41, 41, 1, 'Business Services', NULL, NULL),
(42, 42, 1, 'Business Supplies & Equipment', NULL, NULL),
(43, 43, 1, 'Cable & Satellite TV Production & Distribution', NULL, NULL),
(44, 44, 1, 'Candidate Committees ', NULL, NULL),
(45, 45, 1, 'Candidate Committees, Democratic', NULL, NULL),
(46, 46, 1, 'Candidate Committees, Republican', NULL, NULL),
(47, 47, 1, 'Capital Markets', NULL, NULL),
(48, 48, 1, 'Car Dealers', NULL, NULL),
(49, 49, 1, 'Car Dealers, Imports', NULL, NULL),
(50, 50, 1, 'Car Manufacturers', NULL, NULL),
(51, 51, 1, 'Casinos / Gambling', NULL, NULL),
(52, 52, 1, 'Cattle Ranchers/Livestock', NULL, NULL),
(53, 53, 1, 'Chemical & Related Manufacturing', NULL, NULL),
(54, 54, 1, 'Chiropractors', NULL, NULL),
(55, 55, 1, 'Civil Servants/Public Officials', NULL, NULL),
(56, 56, 1, 'Civic & Social Organization', NULL, NULL),
(57, 57, 1, 'Clergy & Religious Organizations ', NULL, NULL),
(58, 58, 1, 'Clothing Manufacturing', NULL, NULL),
(59, 59, 1, 'Coal Mining', NULL, NULL),
(60, 60, 1, 'Colleges, Universities & Schools', NULL, NULL),
(61, 61, 1, 'Commercial Banks', NULL, NULL),
(62, 62, 1, 'Commercial TV & Radio Stations', NULL, NULL),
(63, 63, 1, 'Commercial Real Estate', NULL, NULL),
(64, 64, 1, 'Communications/Electronics', NULL, NULL),
(65, 65, 1, 'Computer Software', NULL, NULL),
(66, 66, 1, 'Computer & Network Security', NULL, NULL),
(67, 67, 1, 'Computer Games', NULL, NULL),
(68, 68, 1, 'Computer Hardware', NULL, NULL),
(69, 69, 1, 'Computer Networking', NULL, NULL),
(70, 70, 1, 'Conservative/Republican', NULL, NULL),
(71, 71, 1, 'Construction', NULL, NULL),
(72, 72, 1, 'Construction Services', NULL, NULL),
(73, 73, 1, 'Construction Unions', NULL, NULL),
(74, 74, 1, 'Consumer Electronics', NULL, NULL),
(75, 75, 1, 'Consumer Goods', NULL, NULL),
(76, 76, 1, 'Consumer Services', NULL, NULL),
(77, 77, 1, 'Cosmetics', NULL, NULL),
(78, 78, 1, 'Credit Unions', NULL, NULL),
(79, 79, 1, 'Crop Production & Basic Processing', NULL, NULL),
(80, 80, 1, 'Cruise Lines', NULL, NULL),
(81, 81, 1, 'Cruise Ships & Lines', NULL, NULL),
(82, 82, 1, 'Dairy', NULL, NULL),
(83, 83, 1, 'Defense', NULL, NULL),
(84, 84, 1, 'Defense Aerospace', NULL, NULL),
(85, 85, 1, 'Defense Electronics', NULL, NULL),
(86, 86, 1, 'Defense/Foreign Policy Advocates', NULL, NULL),
(87, 87, 1, 'Democratic Candidate Committees ', NULL, NULL),
(88, 88, 1, 'Democratic Leadership PACs', NULL, NULL),
(89, 89, 1, 'Democratic/Liberal ', NULL, NULL),
(90, 90, 1, 'Dentists', NULL, NULL),
(91, 91, 1, 'Design', NULL, NULL),
(92, 92, 1, 'Doctors & Other Health Professionals', NULL, NULL),
(93, 93, 1, 'Drug Manufacturers', NULL, NULL),
(94, 94, 1, 'Education ', NULL, NULL),
(95, 95, 1, 'E-learning', NULL, NULL),
(96, 96, 1, 'Electric Utilities', NULL, NULL),
(97, 97, 1, 'Electrical & Electronic Manufacturing', NULL, NULL),
(98, 98, 1, 'Electronics Manufacturing & Equipment', NULL, NULL),
(99, 99, 1, 'Electronics, Defense Contractors', NULL, NULL),
(100, 100, 1, 'Energy & Natural Resources', NULL, NULL),
(101, 101, 1, 'Entertainment Industry', NULL, NULL),
(102, 102, 1, 'Environment ', NULL, NULL),
(103, 103, 1, 'Events Services', NULL, NULL),
(104, 104, 1, 'Executive Office', NULL, NULL),
(105, 105, 1, 'Facilities Services', NULL, NULL),
(106, 106, 1, 'Farm Bureaus', NULL, NULL),
(107, 107, 1, 'Farming', NULL, NULL),
(108, 108, 1, 'Financial Services', NULL, NULL),
(109, 109, 1, 'Finance / Credit Companies', NULL, NULL),
(110, 110, 1, 'Finance, Insurance & Real Estate', NULL, NULL),
(111, 111, 1, 'Fine Art', NULL, NULL),
(112, 112, 1, 'Fishery', NULL, NULL),
(113, 113, 1, 'Food & Beverage', NULL, NULL),
(114, 114, 1, 'Food Processing & Sales', NULL, NULL),
(115, 115, 1, 'Food Production', NULL, NULL),
(116, 116, 1, 'Food Stores', NULL, NULL),
(117, 117, 1, 'For-profit Education', NULL, NULL),
(118, 118, 1, 'For-profit Prisons', NULL, NULL),
(119, 119, 1, 'Foreign & Defense Policy ', NULL, NULL),
(120, 120, 1, 'Forestry & Forest Products', NULL, NULL),
(121, 121, 1, 'Foundations, Philanthropists & Non-Profits', NULL, NULL),
(122, 122, 1, 'Funeral Services', NULL, NULL),
(123, 123, 1, 'Fundraising', NULL, NULL),
(124, 124, 1, 'Furniture', NULL, NULL),
(125, 125, 1, 'Gambling & Casinos', NULL, NULL),
(126, 126, 1, 'Gambling, Indian Casinos', NULL, NULL),
(127, 127, 1, 'Garbage Collection/Waste Management', NULL, NULL),
(128, 128, 1, 'Gas & Oil', NULL, NULL),
(129, 129, 1, 'Gay & Lesbian Rights & Issues', NULL, NULL),
(130, 130, 1, 'General Contractors', NULL, NULL),
(131, 131, 1, 'Glass, Ceramics & Concrete', NULL, NULL),
(132, 132, 1, 'Government Employee Unions', NULL, NULL),
(133, 133, 1, 'Government Employees', NULL, NULL),
(134, 134, 1, 'Government Administration', NULL, NULL),
(135, 135, 1, 'Government Relations', NULL, NULL),
(136, 136, 1, 'Graphic Design', NULL, NULL),
(137, 137, 1, 'Gun Control ', NULL, NULL),
(138, 138, 1, 'Health', NULL, NULL),
(139, 139, 1, 'Health, Wellness & Fitness', NULL, NULL),
(140, 140, 1, 'Health Services/HMOs', NULL, NULL),
(141, 141, 1, 'Hedge Funds', NULL, NULL),
(142, 142, 1, 'Higher Education', NULL, NULL),
(143, 143, 1, 'Home Builders', NULL, NULL),
(144, 144, 1, 'Hospital & Health Care', NULL, NULL),
(145, 145, 1, 'Hospitality', NULL, NULL),
(146, 146, 1, 'Human Resources', NULL, NULL),
(147, 147, 1, 'Hospitals & Nursing Homes', NULL, NULL),
(148, 148, 1, 'Hotels, Motels & Tourism', NULL, NULL),
(149, 149, 1, 'Human Rights ', NULL, NULL),
(150, 150, 1, 'Import & Export', NULL, NULL),
(151, 151, 1, 'Individual & Family Services', NULL, NULL),
(152, 152, 1, 'Industrial Automation', NULL, NULL),
(153, 153, 1, 'Information Services', NULL, NULL),
(154, 154, 1, 'Information Technology & Services', NULL, NULL),
(155, 155, 1, 'Ideological/Single-Issue', NULL, NULL),
(156, 156, 1, 'Indian Gaming', NULL, NULL),
(157, 157, 1, 'Industrial Unions ', NULL, NULL),
(158, 158, 1, 'Insurance', NULL, NULL),
(159, 159, 1, 'Internet', NULL, NULL),
(160, 160, 1, 'International Affairs', NULL, NULL),
(161, 161, 1, 'International Trade & Development', NULL, NULL),
(162, 162, 1, 'Internet', NULL, NULL),
(163, 163, 1, 'Investment Banking/Venture', NULL, NULL),
(164, 164, 1, 'Investment Management', NULL, NULL),
(165, 165, 1, 'Judiciary', NULL, NULL),
(166, 166, 1, 'Labor', NULL, NULL),
(167, 167, 1, 'Law Enforcement', NULL, NULL),
(168, 168, 1, 'Law Practice', NULL, NULL),
(169, 169, 1, 'Lawyers & Lobbyists', NULL, NULL),
(170, 170, 1, 'Lawyers / Law Firms', NULL, NULL),
(171, 171, 1, 'Legal Services', NULL, NULL),
(172, 172, 1, 'Legislative Office', NULL, NULL),
(173, 173, 1, 'Leadership PACs ', NULL, NULL),
(174, 174, 1, 'Leisure & Travel', NULL, NULL),
(175, 175, 1, 'Libraries', NULL, NULL),
(176, 176, 1, 'Logistics & Supply Chain', NULL, NULL),
(177, 177, 1, 'Luxury Goods & Jewelry', NULL, NULL),
(178, 178, 1, 'Liberal/Democratic', NULL, NULL),
(179, 179, 1, 'Liquor, Wine & Beer', NULL, NULL),
(180, 180, 1, 'Livestock', NULL, NULL),
(181, 181, 1, 'Lobbyists', NULL, NULL),
(182, 182, 1, 'Lodging / Tourism', NULL, NULL),
(183, 183, 1, 'Logging, Timber & Paper Mills', NULL, NULL),
(184, 184, 1, 'Manufacturing, Misc', NULL, NULL),
(185, 185, 1, 'Marine Transport', NULL, NULL),
(186, 186, 1, 'Machinery', NULL, NULL),
(187, 187, 1, 'Management Consulting', NULL, NULL),
(188, 188, 1, 'Maritime', NULL, NULL),
(189, 189, 1, 'Marketing & Advertising', NULL, NULL),
(190, 190, 1, 'Market Research', NULL, NULL),
(191, 191, 1, 'Mechanical or Industrial Engineering', NULL, NULL),
(192, 192, 1, 'Media Production', NULL, NULL),
(193, 193, 1, 'Meat processing & products', NULL, NULL),
(194, 194, 1, 'Medical Supplies', NULL, NULL),
(195, 195, 1, 'Medical Device', NULL, NULL),
(196, 196, 1, 'Medical Practice', NULL, NULL),
(197, 197, 1, 'Mental Health Care', NULL, NULL),
(198, 198, 1, 'Military', NULL, NULL),
(199, 199, 1, 'Mining & Metals', NULL, NULL),
(200, 200, 1, 'Motion Pictures & Film', NULL, NULL),
(201, 201, 1, 'Museums & Institutions', NULL, NULL),
(202, 202, 1, 'Music', NULL, NULL),
(203, 203, 1, 'Misc Business', NULL, NULL),
(204, 204, 1, 'Misc Finance', NULL, NULL),
(205, 205, 1, 'Misc Manufacturing & Distributing ', NULL, NULL),
(206, 206, 1, 'Misc Unions ', NULL, NULL),
(207, 207, 1, 'Miscellaneous Defense', NULL, NULL),
(208, 208, 1, 'Miscellaneous Services', NULL, NULL),
(209, 209, 1, 'Mortgage Bankers & Brokers', NULL, NULL),
(210, 210, 1, 'Motion Picture Production & Distribution', NULL, NULL),
(211, 211, 1, 'Music Production', NULL, NULL),
(212, 212, 1, 'Natural Gas Pipelines', NULL, NULL),
(213, 213, 1, 'Nanotechnology', NULL, NULL),
(214, 214, 1, 'Newspaper, Magazine & Book Publishing', NULL, NULL),
(215, 215, 1, 'Non-profits, Foundations & Philanthropists', NULL, NULL),
(216, 216, 1, 'Non-profit Organization Management', NULL, NULL),
(217, 217, 1, 'Nurses', NULL, NULL),
(218, 218, 1, 'Nursing Homes/Hospitals', NULL, NULL),
(219, 219, 1, 'Nutritional & Dietary Supplements', NULL, NULL),
(220, 220, 1, 'Oil & Gas', NULL, NULL),
(221, 221, 1, 'Online Publishing', NULL, NULL),
(222, 222, 1, 'Outsourcing/Offshoring', NULL, NULL),
(223, 223, 1, 'Other', NULL, NULL),
(224, 224, 1, 'Payday Lenders', NULL, NULL),
(225, 225, 1, 'Package/Freight Delivery', NULL, NULL),
(226, 226, 1, 'Packaging & Containers', NULL, NULL),
(227, 227, 1, 'Paper & Forest Products', NULL, NULL),
(228, 228, 1, 'Performing Arts', NULL, NULL),
(229, 229, 1, 'Pharmaceutical Manufacturing', NULL, NULL),
(230, 230, 1, 'Pharmaceuticals / Health Products', NULL, NULL),
(231, 231, 1, 'Phone Companies', NULL, NULL),
(232, 232, 1, 'Physicians & Other Health Professionals', NULL, NULL),
(233, 233, 1, 'Philanthropy', NULL, NULL),
(234, 234, 1, 'Photography', NULL, NULL),
(235, 235, 1, 'Plastics', NULL, NULL),
(236, 236, 1, 'Political Organization', NULL, NULL),
(237, 237, 1, 'Postal Unions', NULL, NULL),
(238, 238, 1, 'Poultry & Eggs', NULL, NULL),
(239, 239, 1, 'Power Utilities', NULL, NULL),
(240, 240, 1, 'Printing & Publishing', NULL, NULL),
(241, 241, 1, 'Private Equity & Investment Firms', NULL, NULL),
(242, 242, 1, 'Private Equity & Investment Firms', NULL, NULL),
(243, 243, 1, 'Private Equity & Investment Firms', NULL, NULL),
(244, 244, 1, 'Professional Training', NULL, NULL),
(245, 245, 1, 'Pro-Israel ', NULL, NULL),
(246, 246, 1, 'Professional Sports, Sports Arenas & Related Equipment & Services', NULL, NULL),
(247, 247, 1, 'Program Development', NULL, NULL),
(248, 248, 1, 'Public Policy', NULL, NULL),
(249, 249, 1, 'Public Relations', NULL, NULL),
(250, 250, 1, 'Public Safety', NULL, NULL),
(251, 251, 1, 'Publishing', NULL, NULL),
(252, 252, 1, 'Progressive/Democratic', NULL, NULL),
(253, 253, 1, 'Public Employees', NULL, NULL),
(254, 254, 1, 'Public Sector Unions ', NULL, NULL),
(255, 255, 1, 'Publishing & Printing', NULL, NULL),
(256, 256, 1, 'Radio/TV Stations', NULL, NULL),
(257, 257, 1, 'Railroads', NULL, NULL),
(258, 258, 1, 'Ranching', NULL, NULL),
(259, 259, 1, 'Real Estate', NULL, NULL),
(260, 260, 1, 'Record Companies/Singers', NULL, NULL),
(261, 261, 1, 'Recorded Music & Music Production', NULL, NULL),
(262, 262, 1, 'Recreation / Live Entertainment', NULL, NULL),
(263, 263, 1, 'Religious Organizations/Clergy', NULL, NULL),
(264, 264, 1, 'Religious Institutions', NULL, NULL),
(265, 265, 1, 'Renewables & Environment', NULL, NULL),
(266, 266, 1, 'Republican Candidate Committees ', NULL, NULL),
(267, 267, 1, 'Republican Leadership PACs', NULL, NULL),
(268, 268, 1, 'Republican/Conservative ', NULL, NULL),
(269, 269, 1, 'Restaurants & Drinking Establishments', NULL, NULL),
(270, 270, 1, 'Retail Sales', NULL, NULL),
(271, 271, 1, 'Retired ', NULL, NULL),
(272, 272, 1, 'Research', NULL, NULL),
(273, 273, 1, 'Retail', NULL, NULL),
(274, 274, 1, 'Savings & Loans', NULL, NULL),
(275, 275, 1, 'Schools/Education', NULL, NULL),
(276, 276, 1, 'Sea Transport', NULL, NULL),
(277, 277, 1, 'Semiconductors', NULL, NULL),
(278, 278, 1, 'Shipbuilding', NULL, NULL),
(279, 279, 1, 'Security & Investigations', NULL, NULL),
(280, 280, 1, 'Special Trade Contractors', NULL, NULL),
(281, 281, 1, 'Sporting Goods', NULL, NULL),
(282, 282, 1, 'Sports', NULL, NULL),
(283, 283, 1, 'Staffing & Recruiting', NULL, NULL),
(284, 284, 1, 'Supermarkets', NULL, NULL),
(285, 285, 1, 'Steel Production ', NULL, NULL),
(286, 286, 1, 'Stock Brokers/Investment Industry', NULL, NULL),
(287, 287, 1, 'Student Loan Companies', NULL, NULL),
(288, 288, 1, 'Sugar Cane & Sugar Beets', NULL, NULL),
(289, 289, 1, 'Teachers Unions', NULL, NULL),
(290, 290, 1, 'Teachers/Education', NULL, NULL),
(291, 291, 1, 'Telecom Services & Equipment', NULL, NULL),
(292, 292, 1, 'Telecommunications', NULL, NULL),
(293, 293, 1, 'Telephone Utilities', NULL, NULL),
(294, 294, 1, 'Textiles ', NULL, NULL),
(295, 295, 1, 'Think Tanks', NULL, NULL),
(296, 296, 1, 'Timber, Logging & Paper Mills', NULL, NULL),
(297, 297, 1, 'Tobacco', NULL, NULL),
(298, 298, 1, 'Transportation', NULL, NULL),
(299, 299, 1, 'Translation & Localization', NULL, NULL),
(300, 300, 1, 'Transportation/Trucking/Railroad', NULL, NULL),
(301, 301, 1, 'Trash Collection/Waste Management', NULL, NULL),
(302, 302, 1, 'Trucking', NULL, NULL),
(303, 303, 1, 'TV / Movies / Music', NULL, NULL),
(304, 304, 1, 'TV Production', NULL, NULL),
(305, 305, 1, 'Utilities', NULL, NULL),
(306, 306, 1, 'Unions', NULL, NULL),
(307, 307, 1, 'Unions, Airline', NULL, NULL),
(308, 308, 1, 'Unions, Building Trades', NULL, NULL),
(309, 309, 1, 'Unions, Industrial', NULL, NULL),
(310, 310, 1, 'Unions, Misc', NULL, NULL),
(311, 311, 1, 'Unions, Public Sector', NULL, NULL),
(312, 312, 1, 'Unions, Teacher', NULL, NULL),
(313, 313, 1, 'Unions, Transportation', NULL, NULL),
(314, 314, 1, 'Universities, Colleges & Schools', NULL, NULL),
(315, 315, 1, 'Vegetables & Fruits', NULL, NULL),
(316, 316, 1, 'Venture Capital', NULL, NULL),
(317, 317, 1, 'Veterinary', NULL, NULL),
(318, 318, 1, 'Waste Management', NULL, NULL),
(319, 319, 1, 'Wine, Beer & Liquor', NULL, NULL),
(320, 320, 1, 'Women\'s Issues', NULL, NULL),
(321, 321, 1, 'Warehousing', NULL, NULL),
(322, 322, 1, 'Wholesale', NULL, NULL),
(323, 323, 1, 'Wine & Spirits', NULL, NULL),
(324, 324, 1, 'Wireless', NULL, NULL),
(325, 325, 1, 'Writing & Editing', NULL, NULL),
(513, 1, 2, 'سياسة الإجهاض / مكافحة الإجهاض', NULL, NULL),
(514, 2, 2, 'سياسة الإجهاض / الحقوق المؤيدة للإجهاض', NULL, NULL),
(515, 3, 2, 'محاسبة', NULL, NULL),
(516, 4, 2, 'الإعلان / العلاقات العامة', NULL, NULL),
(517, 5, 2, 'الفضاء ، الدفاع المقاولين', NULL, NULL),
(518, 6, 2, 'الأعمال الزراعية', NULL, NULL),
(519, 7, 2, 'الخدمات والمنتجات الزراعية', NULL, NULL),
(520, 8, 2, 'الزراعة', NULL, NULL),
(521, 9, 2, 'النقل الجوي', NULL, NULL),
(522, 10, 2, 'اتحادات النقل الجوي', NULL, NULL),
(523, 11, 2, 'الخطوط الجوية', NULL, NULL),
(524, 12, 2, 'المشروبات الكحولية', NULL, NULL),
(525, 13, 2, 'إنتاج الطاقة البديلة والخدمات', NULL, NULL),
(526, 14, 2, 'الحلول البديلة لفض المنازعات', NULL, NULL),
(527, 15, 2, 'الطب البديل', NULL, NULL),
(528, 16, 2, 'الرسوم المتحركة', NULL, NULL),
(529, 17, 2, 'ملابس وأزياء', NULL, NULL),
(530, 18, 2, 'الخدمات المعمارية', NULL, NULL),
(531, 19, 2, 'العمارة والتخطيط', NULL, NULL),
(532, 20, 2, 'فنون وحرف', NULL, NULL),
(533, 21, 2, 'المحامون / الشركات القانونية', NULL, NULL),
(534, 22, 2, 'تجار السيارات', NULL, NULL),
(535, 23, 2, 'تجار السيارات ، اليابانية', NULL, NULL),
(536, 24, 2, 'مصنعي السيارات', NULL, NULL),
(537, 326, 1, 'aa', '2019-06-16 08:13:15', '2019-06-16 08:13:15'),
(538, 327, 1, 'ss', '2019-06-16 08:14:14', '2019-06-16 08:14:14'),
(539, 328, 1, 'Program Development', '2019-06-26 04:45:09', '2019-06-26 04:45:09'),
(540, 329, 1, 'Program Development', '2019-06-26 04:49:57', '2019-06-26 04:49:57');

-- --------------------------------------------------------

--
-- بنية الجدول `company_locations`
--

CREATE TABLE `company_locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `is_main_office` tinyint(1) DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` decimal(18,15) DEFAULT NULL,
  `longitude` decimal(18,15) DEFAULT NULL,
  `company_profile_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `verified_by_google` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `company_locations`
--

INSERT INTO `company_locations` (`id`, `is_main_office`, `city`, `country`, `name`, `postal_code`, `street_address`, `latitude`, `longitude`, `company_profile_id`, `created_at`, `updated_at`, `verified_by_google`) VALUES
(6, 0, 'نبك', 'Syria', NULL, '92', 'main street', '35.520050600000000', '35.789027600000054', 1, NULL, NULL, 1),
(7, NULL, NULL, 'Libanon', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- بنية الجدول `company_method_verfications`
--

CREATE TABLE `company_method_verfications` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `method_verfication_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `company_method_verfications`
--

INSERT INTO `company_method_verfications` (`id`, `created_at`, `updated_at`, `method_verfication_name`) VALUES
(1, NULL, NULL, 'google'),
(2, NULL, NULL, 'visit to company');

-- --------------------------------------------------------

--
-- بنية الجدول `company_profiles`
--

CREATE TABLE `company_profiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `company_websit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_size_id` int(10) UNSIGNED DEFAULT NULL,
  `company_type_id` int(10) UNSIGNED DEFAULT NULL,
  `is_month` tinyint(1) DEFAULT NULL,
  `founded` date DEFAULT NULL,
  `path_company_imagelogo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `workinghours` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `company_profiles`
--

INSERT INTO `company_profiles` (`id`, `company_id`, `company_websit`, `company_size_id`, `company_type_id`, `is_month`, `founded`, `path_company_imagelogo`, `created_at`, `updated_at`, `workinghours`) VALUES
(1, 1, 'www.companysit.com', 1, 1, 1, '2014-01-01', NULL, NULL, NULL, ''),
(2, 3, 'www.cars.com', NULL, 2, NULL, NULL, NULL, NULL, NULL, '');

-- --------------------------------------------------------

--
-- بنية الجدول `company_profile_translations`
--

CREATE TABLE `company_profile_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_profile_id` int(10) UNSIGNED NOT NULL,
  `translated_languages_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `company_profile_translations`
--

INSERT INTO `company_profile_translations` (`id`, `company_description`, `name`, `company_profile_id`, `translated_languages_id`, `created_at`, `updated_at`) VALUES
(1, 'تراسل', 'تراسل  Company', 1, 2, NULL, NULL),
(2, 'Trassul ', 'Trassul   Company', 1, 1, NULL, NULL),
(3, 'cars', 'cars', 2, 3, NULL, NULL),
(4, 'سيارات', 'سيارات', 2, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `company_sizes`
--

CREATE TABLE `company_sizes` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `company_sizes`
--

INSERT INTO `company_sizes` (`id`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL),
(2, NULL, NULL),
(3, NULL, NULL),
(4, NULL, NULL),
(5, NULL, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `company_size_translations`
--

CREATE TABLE `company_size_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_size_id` int(10) UNSIGNED DEFAULT NULL,
  `translated_languages_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `company_size_translations`
--

INSERT INTO `company_size_translations` (`id`, `company_size_id`, `translated_languages_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '1-9 Employees', NULL, NULL),
(2, 2, 1, '10-49 Employees', NULL, NULL),
(3, 3, 1, '50-99 Employees', NULL, NULL),
(4, 4, 1, '100-499 Employees', NULL, NULL),
(5, 5, 1, '500 Employees or More', NULL, NULL),
(6, 1, 2, '1-9 موظف', NULL, NULL),
(7, 2, 2, '10-49 موظف', NULL, NULL),
(8, 3, 2, '50-99 موظف', NULL, NULL),
(9, 4, 2, '100-499 موظف', NULL, NULL),
(10, 5, 2, '500 موظف أو أكثر', NULL, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `company_social_medias`
--

CREATE TABLE `company_social_medias` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_profile_id` int(10) UNSIGNED NOT NULL,
  `company_social_media_info` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `social_media_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `company_social_medias`
--

INSERT INTO `company_social_medias` (`id`, `company_profile_id`, `company_social_media_info`, `social_media_id`, `created_at`, `updated_at`) VALUES
(5, 1, 'https://facebook.com/1', 1, NULL, NULL),
(6, 1, 'https://facebook.com/2', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `company_specialties_for_companies`
--

CREATE TABLE `company_specialties_for_companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_profile_id` int(10) UNSIGNED NOT NULL,
  `specialty_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `company_specialties_for_companies`
--

INSERT INTO `company_specialties_for_companies` (`id`, `company_profile_id`, `specialty_id`, `created_at`, `updated_at`) VALUES
(5, 1, 32, NULL, NULL),
(6, 1, 33, NULL, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `company_statuses`
--

CREATE TABLE `company_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `company_statuses`
--

INSERT INTO `company_statuses` (`id`, `created_at`, `updated_at`, `title`) VALUES
(1, NULL, NULL, 'verified'),
(2, NULL, NULL, 'Not Verified'),
(3, NULL, NULL, 'Seems Fake'),
(4, NULL, NULL, 'fake'),
(5, NULL, NULL, 'Not checked');

-- --------------------------------------------------------

--
-- بنية الجدول `company_types`
--

CREATE TABLE `company_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `company_types`
--

INSERT INTO `company_types` (`id`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL),
(2, NULL, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `company_type_translations`
--

CREATE TABLE `company_type_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `translated_languages_id` int(10) UNSIGNED NOT NULL,
  `company_type_id` int(10) UNSIGNED NOT NULL,
  `company_type_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `company_type_translations`
--

INSERT INTO `company_type_translations` (`id`, `translated_languages_id`, `company_type_id`, `company_type_name`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Exchange company', NULL, NULL),
(2, 2, 1, 'شركة صرافة', NULL, NULL),
(3, 1, 2, 'commercial Corporation', NULL, NULL),
(4, 2, 2, 'شركة تجارية', NULL, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `contact_informations`
--

CREATE TABLE `contact_informations` (
  `id` int(10) UNSIGNED NOT NULL,
  `resume_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `contact_informations`
--

INSERT INTO `contact_informations` (`id`, `resume_id`, `created_at`, `updated_at`) VALUES
(17, 1, '2019-06-16 06:01:35', '2019-06-16 06:01:35'),
(18, 2, '2019-06-16 06:15:00', '2019-06-16 06:15:00');

-- --------------------------------------------------------

--
-- بنية الجدول `contact_main_catagories`
--

CREATE TABLE `contact_main_catagories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `contact_main_catagories`
--

INSERT INTO `contact_main_catagories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'account', NULL, NULL),
(2, 'complain', NULL, NULL),
(3, 'recommendation/ request', NULL, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `contact_numbers`
--

CREATE TABLE `contact_numbers` (
  `id` int(10) UNSIGNED NOT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_information_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone_type_id` int(10) UNSIGNED DEFAULT NULL,
  `country_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `contact_numbers`
--

INSERT INTO `contact_numbers` (`id`, `phone_number`, `contact_information_id`, `created_at`, `updated_at`, `phone_type_id`, `country_id`) VALUES
(45, '526565630', 18, '2019-06-16 06:15:00', '2019-06-16 06:15:00', 1, 1),
(48, '91546526', 17, '2019-07-06 08:34:25', '2019-07-06 08:34:25', 1, 1);

-- --------------------------------------------------------

--
-- بنية الجدول `contact_sub_categories`
--

CREATE TABLE `contact_sub_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_main_catagory_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `contact_sub_categories`
--

INSERT INTO `contact_sub_categories` (`id`, `name`, `contact_main_catagory_id`, `created_at`, `updated_at`) VALUES
(1, 'hacked ', 1, NULL, NULL),
(2, 'need to activated', 1, NULL, NULL),
(3, 'how to deactivated', 1, NULL, NULL),
(4, 'Privacy ', 1, NULL, NULL),
(5, 'cannot log in ', 1, NULL, NULL),
(6, 'control visibility ', 1, NULL, NULL),
(7, 'how to delete my account', 1, NULL, NULL),
(8, 'other', 1, NULL, NULL),
(9, ' complain  Option 1', 2, NULL, NULL),
(10, ' complain  Option 2', 2, NULL, NULL),
(11, ' recommendation/ request 1', 3, NULL, NULL),
(12, ' recommendation/ request 2', 3, NULL, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `countries`
--

INSERT INTO `countries` (`id`, `code`) VALUES
(1, '+963'),
(2, '+961');

-- --------------------------------------------------------

--
-- بنية الجدول `country_translations`
--

CREATE TABLE `country_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_id` int(10) UNSIGNED DEFAULT NULL,
  `translated_languages_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `country_translations`
--

INSERT INTO `country_translations` (`id`, `country_id`, `translated_languages_id`, `name`) VALUES
(1, 1, 1, 'Syria'),
(2, 2, 1, 'Lebanon'),
(3, 1, 2, 'سوريا'),
(4, 2, 2, 'لبنان');

-- --------------------------------------------------------

--
-- بنية الجدول `current_locations`
--

CREATE TABLE `current_locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `personal_information_id` int(10) UNSIGNED NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` decimal(18,15) DEFAULT NULL,
  `longitude` decimal(18,15) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `current_locations`
--

INSERT INTO `current_locations` (`id`, `personal_information_id`, `country`, `city`, `postal_code`, `street_address`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES
(19, 2, 'سوريا', 'منطقة اللاذقية', NULL, 'سوريا', '35.520050600000000', '35.789027600000054', '2019-06-24 17:40:26', '2019-06-24 17:40:26'),
(22, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-09 03:43:17', '2019-07-09 03:43:17');

-- --------------------------------------------------------

--
-- بنية الجدول `c_m_c_translations`
--

CREATE TABLE `c_m_c_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `contact_main_catagory_id` int(10) UNSIGNED NOT NULL,
  `translated_languages_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `c_m_c_translations`
--

INSERT INTO `c_m_c_translations` (`id`, `contact_main_catagory_id`, `translated_languages_id`, `name`) VALUES
(1, 1, 2, 'حساب'),
(2, 1, 1, 'account'),
(3, 2, 2, 'شكوى'),
(4, 2, 1, 'complain'),
(5, 3, 2, 'توصية / طلب'),
(6, 3, 1, 'recommendation/ request');

-- --------------------------------------------------------

--
-- بنية الجدول `c_s_c_translations`
--

CREATE TABLE `c_s_c_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `contact_sub_category_id` int(10) UNSIGNED NOT NULL,
  `translated_languages_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `c_s_c_translations`
--

INSERT INTO `c_s_c_translations` (`id`, `contact_sub_category_id`, `translated_languages_id`, `name`) VALUES
(1, 5, 2, 'لا يمكن تسجيل الدخول'),
(2, 5, 1, 'cannot log in '),
(3, 6, 2, 'لايمكن التحكم بالمظهر'),
(4, 6, 1, 'control visibility '),
(5, 7, 2, 'كيفية حذف حسابي'),
(6, 7, 1, 'how to delete my account'),
(7, 4, 2, 'خصوصية'),
(8, 4, 1, 'Privacy '),
(9, 3, 2, 'كيفية التعطيل'),
(10, 3, 1, 'how to deactivated'),
(11, 2, 2, 'نحتاج الى التفعيل'),
(12, 2, 1, 'need to activated');

-- --------------------------------------------------------

--
-- بنية الجدول `degree_levels`
--

CREATE TABLE `degree_levels` (
  `id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `degree_levels`
--

INSERT INTO `degree_levels` (`id`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8);

-- --------------------------------------------------------

--
-- بنية الجدول `degree_level_translations`
--

CREATE TABLE `degree_level_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `degree_level_id` int(10) UNSIGNED DEFAULT NULL,
  `translated_languages_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `degree_level_translations`
--

INSERT INTO `degree_level_translations` (`id`, `degree_level_id`, `translated_languages_id`, `name`) VALUES
(1, 1, 1, 'Secondary School Or Equivalent'),
(2, 2, 1, 'High school or equivalent'),
(3, 3, 1, 'Diploma'),
(4, 4, 1, 'Associate Degree'),
(5, 5, 1, 'Bachelor\'s degree'),
(6, 6, 1, 'Higher diploma'),
(7, 7, 1, 'Master\'s degree'),
(8, 8, 1, 'Doctorate/ PhD'),
(9, 1, 2, 'مدرسة اعدادية أو ما يعادلها'),
(10, 2, 2, 'الثانوية العامة أو ما يعادلها'),
(11, 3, 2, 'شهادة دبلوم'),
(12, 4, 2, 'شهادة جامعية'),
(13, 5, 2, 'درجة البكالريوس'),
(14, 6, 2, 'دبلوم عالي'),
(15, 7, 2, 'ماجيستير'),
(16, 8, 2, 'دكتوراه');

-- --------------------------------------------------------

--
-- بنية الجدول `education`
--

CREATE TABLE `education` (
  `id` int(10) UNSIGNED NOT NULL,
  `resume_id` int(10) UNSIGNED NOT NULL,
  `major_id` int(10) UNSIGNED DEFAULT NULL,
  `minor_id` int(10) UNSIGNED DEFAULT NULL,
  `to` date DEFAULT NULL,
  `isPresent` tinyint(1) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isFromMonthPresent` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isToMonthPresent` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grade` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_grade` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `degree_level_id` int(10) UNSIGNED DEFAULT NULL,
  `institution_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `education`
--

INSERT INTO `education` (`id`, `resume_id`, `major_id`, `minor_id`, `to`, `isPresent`, `order`, `created_at`, `updated_at`, `description`, `from`, `isFromMonthPresent`, `isToMonthPresent`, `grade`, `full_grade`, `degree_level_id`, `institution_id`) VALUES
(161, 1, 150, NULL, '2018-01-01', 0, 2, '2019-07-04 06:35:29', '2019-07-07 05:46:32', 'aaaaaaa', '2015-01-01 09:35:29', '0', '0', NULL, NULL, 3, 3),
(162, 1, 151, NULL, '2018-01-01', 0, 1, '2019-07-07 05:46:32', '2019-07-07 05:46:32', NULL, '2014-01-01 08:46:32', '0', '0', NULL, NULL, 3, 1);

-- --------------------------------------------------------

--
-- بنية الجدول `education_projects`
--

CREATE TABLE `education_projects` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `education_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `emails`
--

CREATE TABLE `emails` (
  `id` int(10) UNSIGNED NOT NULL,
  `email_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_information_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `emails`
--

INSERT INTO `emails` (`id`, `email_address`, `contact_information_id`, `created_at`, `updated_at`) VALUES
(77, 'aa@gmail.com', 18, '2019-06-16 06:15:00', '2019-06-16 06:15:00'),
(80, 'ss@gmail.com', 17, '2019-07-06 08:34:25', '2019-07-06 08:34:25'),
(81, 'aa@gmail.com', 17, '2019-07-06 08:34:25', '2019-07-06 08:34:25');

-- --------------------------------------------------------

--
-- بنية الجدول `employment_types`
--

CREATE TABLE `employment_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `employment_type_parent_id` int(10) UNSIGNED DEFAULT NULL,
  `work_experience_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `employment_types`
--

INSERT INTO `employment_types` (`id`, `employment_type_parent_id`, `work_experience_id`, `created_at`, `updated_at`) VALUES
(41, 4, 10, '2019-05-12 05:36:24', '2019-05-12 05:36:24'),
(42, 6, 10, '2019-05-12 05:36:24', '2019-05-12 05:36:24'),
(45, 5, 11, '2019-07-11 09:22:44', '2019-07-11 09:22:44'),
(46, 7, 11, '2019-07-11 09:22:44', '2019-07-11 09:22:44');

-- --------------------------------------------------------

--
-- بنية الجدول `employment_type_parents`
--

CREATE TABLE `employment_type_parents` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `employment_type_parents`
--

INSERT INTO `employment_type_parents` (`id`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, NULL),
(2, NULL, NULL, NULL),
(3, NULL, NULL, NULL),
(4, 1, NULL, NULL),
(5, 1, NULL, NULL),
(6, 2, NULL, NULL),
(7, 2, NULL, NULL),
(8, 2, NULL, NULL),
(9, 3, NULL, NULL),
(10, 3, NULL, NULL),
(11, 3, NULL, NULL),
(12, 3, NULL, NULL),
(13, 3, NULL, NULL),
(14, 3, NULL, NULL),
(15, 3, NULL, NULL),
(16, 3, NULL, NULL),
(17, 3, NULL, NULL),
(18, 3, NULL, NULL),
(19, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `emp_type_parent_translations`
--

CREATE TABLE `emp_type_parent_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `employment_type_parent_id` int(10) UNSIGNED DEFAULT NULL,
  `translated_languages_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `emp_type_parent_translations`
--

INSERT INTO `emp_type_parent_translations` (`id`, `employment_type_parent_id`, `translated_languages_id`, `name`) VALUES
(1, 1, 1, 'Period'),
(2, 2, 1, 'Working Place'),
(3, 3, 1, 'More Options'),
(4, 4, 1, 'Full Time '),
(5, 5, 1, 'Part Time'),
(6, 6, 1, 'Remote Working'),
(7, 7, 1, 'Indoor Working '),
(8, 8, 1, 'Outdoor Working '),
(9, 9, 1, 'Partnership'),
(10, 10, 1, 'Probation'),
(11, 11, 1, 'Shift Workers'),
(12, 12, 1, 'Daily Hire And Weekly Hire'),
(13, 13, 1, 'Temporary Worker'),
(14, 14, 1, 'Seasonal Staff'),
(15, 15, 1, 'Voluntary'),
(16, 16, 1, 'Outsourcing'),
(17, 17, 1, 'Casual'),
(18, 18, 1, 'Fixed Term'),
(19, 19, 1, 'Commission'),
(32, 1, 2, 'فترة'),
(33, 2, 2, 'مكان العمل'),
(34, 3, 2, 'المزيد من الخيارات'),
(35, 4, 2, 'دوام كامل'),
(36, 5, 2, 'دوام جزئى'),
(37, 6, 2, 'العمل عن بعد'),
(38, 7, 2, 'العمل في الأماكن المغلقة'),
(39, 8, 2, 'العمل في الهواء الطلق'),
(40, 9, 2, 'شراكة'),
(41, 10, 2, 'فترة تجربة'),
(42, 11, 2, 'أعمال مناوبة'),
(44, 12, 2, 'تأجير يومي واستئجار أسبوعي'),
(45, 13, 2, 'عامل مؤقت'),
(46, 14, 2, 'موظفين موسميين'),
(47, 15, 2, 'تطوعي'),
(48, 16, 2, 'الاستعانة بمصادر خارجية'),
(49, 17, 2, 'عامل عادي'),
(50, 18, 2, 'مدة محددة'),
(51, 19, 2, 'سمسرة');

-- --------------------------------------------------------

--
-- بنية الجدول `institutions`
--

CREATE TABLE `institutions` (
  `id` int(10) UNSIGNED NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `institution_type_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `institutions`
--

INSERT INTO `institutions` (`id`, `url`, `country`, `city`, `street_address`, `verified`, `created_at`, `updated_at`, `institution_type_id`) VALUES
(1, 'www.tishreen.edu.sy', 'syria', 'Lattakia', 'bla', 1, NULL, NULL, 2),
(2, 'damascusuniversity.edu.sy', 'syria', 'Damascus', '', 1, NULL, NULL, 2),
(3, 'alepuniv.edu.sy', 'syria', 'Aleppo', '', 1, NULL, NULL, 2),
(4, 'svuonline.org', 'syria', 'Damascus', '', 1, NULL, NULL, 2),
(5, 'aust.edu.sy/', 'syria', 'Hama', '', 1, NULL, NULL, 2),
(6, '	alfuratuniv.edu.sy', 'syria', 'Deir ezzor', '', 1, NULL, NULL, 2),
(7, ' albaath-univ.edu.sy', 'syria', 'Homs', '', 1, NULL, NULL, 2),
(8, 'ru.edu.sy', 'syria', 'Daraa', '', 1, NULL, NULL, 2),
(9, 'spu.edu.sy', 'syria', 'Damascus', '', 1, NULL, NULL, 2),
(10, 'aiu.edu.sy', 'syria', 'Daraa', '', 1, NULL, NULL, 2),
(11, 'iust.edu.sy', 'syria', 'Damascus', '', 1, NULL, NULL, 2),
(12, 'uok.edu.sy', 'syria', ' Deir Atiyah', '', 1, NULL, NULL, 2),
(13, 'ypu.edu.sy', 'syria', 'Rif Dimashq', '', 1, NULL, NULL, 2),
(14, 'wiu.edu.sy', 'syria', 'Homs', '', 1, NULL, NULL, 2),
(15, 'wpu.edu.sy', 'syria', 'Hama', '', 1, NULL, NULL, 2),
(16, 'hpu.sy', 'syria', 'Homs', '', 1, NULL, NULL, 2),
(17, 'syria.aast.edu', 'syria', 'Lattakia', '', 1, NULL, NULL, 2),
(18, 'au.edu.sy', 'syria', 'Tartus', '', 1, NULL, NULL, 2),
(19, 'gu-aleppo.net', 'syria', 'Aleppo', '', 1, NULL, NULL, 2),
(20, 'ebla-uni.edu.sy', 'syria', 'Idlib', '', 1, NULL, NULL, 2),
(21, 'must.edu.sy/', 'syria', 'Qamishli', '', 1, NULL, NULL, 2),
(22, 'uu-sy.com', 'syria', 'Ar Raqqah', '', 1, NULL, NULL, 2),
(23, 'jude.edu.sy', 'syria', 'Deir ezzor', '', 1, NULL, NULL, 2),
(24, 'manara.edu.sy', 'syria', 'Lattakia', '', 1, NULL, NULL, 2),
(25, 'www.hiba.edu.sy', 'syria', 'Damascus', '', 1, NULL, NULL, 2),
(30, 'Secondary School.com', 'syria', 'aa', NULL, 0, '2019-06-27 06:36:11', '2019-06-27 07:04:10', NULL),
(31, 'High School.com', 'syria', 'aa', NULL, 0, '2019-06-27 07:06:04', '2019-06-27 10:27:46', 1),
(33, 'university.com', 'syria', 'aa', NULL, 0, '2019-06-27 09:44:38', '2019-06-27 10:17:35', 2);

-- --------------------------------------------------------

--
-- بنية الجدول `institution_translations`
--

CREATE TABLE `institution_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `institution_id` int(10) UNSIGNED DEFAULT NULL,
  `translated_languages_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `institution_translations`
--

INSERT INTO `institution_translations` (`id`, `institution_id`, `translated_languages_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Tihreen University', NULL, NULL),
(2, 2, 1, 'Damascus University', NULL, NULL),
(3, 3, 1, 'Aleppo University', NULL, NULL),
(4, 4, 1, 'Syrian Virtual University', NULL, NULL),
(5, 5, 1, 'Arab Private University for Science and Technology', NULL, NULL),
(6, 6, 1, 'Al-Furat University', NULL, NULL),
(7, 7, 1, 'Al-Baath University', NULL, NULL),
(8, 8, 1, 'Al-Rasheed University', NULL, NULL),
(9, 9, 1, 'Syrian International University for Science and Technology', NULL, NULL),
(10, 10, 1, 'Arab International University', NULL, NULL),
(11, 11, 1, 'International University for Science and Technology', NULL, NULL),
(12, 12, 1, 'University of Kalamoon', NULL, NULL),
(13, 13, 1, 'Yarmouk Private University', NULL, NULL),
(14, 14, 1, 'Wadi International University', NULL, NULL),
(15, 15, 1, 'Al-Wataniya Private University', NULL, NULL),
(16, 16, 1, 'Al Hawash University', NULL, NULL),
(17, 17, 1, 'Arab Academy for Science, Technology and Maritime Transport', NULL, NULL),
(18, 18, 1, 'Al-Andalus University for Medical Sciences', NULL, NULL),
(19, 19, 1, 'University Shahba', NULL, NULL),
(20, 20, 1, 'Ebla Private University', NULL, NULL),
(21, 21, 1, 'Mamoun University for Science and Technology', NULL, NULL),
(22, 22, 1, 'Ittihad Private University', NULL, NULL),
(23, 23, 1, 'Al-Jazeera University', NULL, NULL),
(24, 24, 1, 'manara university', NULL, NULL),
(25, 25, 1, 'Higher Institute of Business Administration', NULL, NULL),
(32, 1, 2, 'جامعة تشرين', NULL, NULL),
(33, 2, 2, 'جامعة دمشق', NULL, NULL),
(34, 3, 2, 'جامعة حلب', NULL, NULL),
(35, 4, 2, 'الجامعة الافتراضية السورية', NULL, NULL),
(36, 5, 2, 'الجامعة العربية الخاصة للعلوم والتكنولوجيا', NULL, NULL),
(37, 6, 2, ' جامعة الفرات', NULL, NULL),
(38, 7, 2, 'جامعة البعث', NULL, NULL),
(39, 8, 2, 'جامعة الرشيد الدولية الخاصة للعلوم والتكنولوجيا', NULL, NULL),
(40, 9, 2, 'الجامعة السورية الخاصة', NULL, NULL),
(41, 10, 2, 'الجامعة العربية الدولية', NULL, NULL),
(42, 11, 2, 'الجامعة الدولية للعلوم والتكنولوجيا', NULL, NULL),
(43, 12, 2, 'جامعة القلمون', NULL, NULL),
(44, 13, 2, 'جامعة اليرموك الخاصة', NULL, NULL),
(45, 14, 2, 'جامعة الوادي الدولية', NULL, NULL),
(46, 15, 2, 'الجامعة الوطنية الخاصة', NULL, NULL),
(47, 16, 2, 'جامعة الحواش الخاصة', NULL, NULL),
(48, 17, 2, 'الاكاديمية العربية للعلوم والتكنولوجيا والنقل البحري', NULL, NULL),
(49, 18, 2, 'جامعة الأندلس للعلوم الطبية', NULL, NULL),
(50, 19, 2, 'جامعة الشهباء الخاصة', NULL, NULL),
(51, 20, 2, ' جامعة ايبلا الخاصة', NULL, NULL),
(52, 21, 2, 'جامعة المأمون الخاصة للعلوم والتكنولوجيا', NULL, NULL),
(53, 22, 2, 'جامعة الاتحاد الخاصة', NULL, NULL),
(54, 23, 2, ' جامعة الجزيرة', NULL, NULL),
(55, 24, 2, 'جامعة المنارة الخاصة', NULL, NULL),
(56, 25, 2, 'المعهد العالي لادارة الأعمال', NULL, NULL),
(67, 30, 1, 'Secondary School', '2019-06-27 06:36:11', '2019-06-27 10:16:34'),
(69, 31, 1, 'High School', '2019-06-27 07:06:04', '2019-06-27 10:27:46'),
(73, 33, 1, 'university', '2019-06-27 09:44:38', '2019-06-27 10:17:35');

-- --------------------------------------------------------

--
-- بنية الجدول `institution_types`
--

CREATE TABLE `institution_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `institution_types`
--

INSERT INTO `institution_types` (`id`, `type`, `created_at`, `updated_at`) VALUES
(1, 'High School', NULL, NULL),
(2, 'University', NULL, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `international_languages`
--

CREATE TABLE `international_languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `international_languages`
--

INSERT INTO `international_languages` (`id`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL),
(2, NULL, NULL),
(3, NULL, NULL),
(4, NULL, NULL),
(5, NULL, NULL),
(6, NULL, NULL),
(7, NULL, NULL),
(8, NULL, NULL),
(9, NULL, NULL),
(10, NULL, NULL),
(11, NULL, NULL),
(12, NULL, NULL),
(13, NULL, NULL),
(14, NULL, NULL),
(15, NULL, NULL),
(16, NULL, NULL),
(17, NULL, NULL),
(18, NULL, NULL),
(19, NULL, NULL),
(20, NULL, NULL),
(21, NULL, NULL),
(22, NULL, NULL),
(23, NULL, NULL),
(24, NULL, NULL),
(25, NULL, NULL),
(26, NULL, NULL),
(27, NULL, NULL),
(28, NULL, NULL),
(29, NULL, NULL),
(30, NULL, NULL),
(31, NULL, NULL),
(32, NULL, NULL),
(33, NULL, NULL),
(34, NULL, NULL),
(35, NULL, NULL),
(36, NULL, NULL),
(37, NULL, NULL),
(38, NULL, NULL),
(39, NULL, NULL),
(40, NULL, NULL),
(41, NULL, NULL),
(42, NULL, NULL),
(43, NULL, NULL),
(44, NULL, NULL),
(45, NULL, NULL),
(46, NULL, NULL),
(47, NULL, NULL),
(48, NULL, NULL),
(49, NULL, NULL),
(50, NULL, NULL),
(51, NULL, NULL),
(52, NULL, NULL),
(53, NULL, NULL),
(54, NULL, NULL),
(55, NULL, NULL),
(56, NULL, NULL),
(57, NULL, NULL),
(58, NULL, NULL),
(59, NULL, NULL),
(60, NULL, NULL),
(61, NULL, NULL),
(62, NULL, NULL),
(63, NULL, NULL),
(64, NULL, NULL),
(65, NULL, NULL),
(66, NULL, NULL),
(67, NULL, NULL),
(68, NULL, NULL),
(69, NULL, NULL),
(70, NULL, NULL),
(71, NULL, NULL),
(72, NULL, NULL),
(73, NULL, NULL),
(74, NULL, NULL),
(75, NULL, NULL),
(76, NULL, NULL),
(77, NULL, NULL),
(78, NULL, NULL),
(79, NULL, NULL),
(80, NULL, NULL),
(81, NULL, NULL),
(82, NULL, NULL),
(83, NULL, NULL),
(84, NULL, NULL),
(85, NULL, NULL),
(86, NULL, NULL),
(87, NULL, NULL),
(88, NULL, NULL),
(89, NULL, NULL),
(90, NULL, NULL),
(91, NULL, NULL),
(92, NULL, NULL),
(93, NULL, NULL),
(94, NULL, NULL),
(95, NULL, NULL),
(96, NULL, NULL),
(97, NULL, NULL),
(98, NULL, NULL),
(99, NULL, NULL),
(100, NULL, NULL),
(101, NULL, NULL),
(102, NULL, NULL),
(103, NULL, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `international_language_trans`
--

CREATE TABLE `international_language_trans` (
  `id` int(10) UNSIGNED NOT NULL,
  `international_language_id` int(10) UNSIGNED DEFAULT NULL,
  `translated_languages_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `international_language_trans`
--

INSERT INTO `international_language_trans` (`id`, `international_language_id`, `translated_languages_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Afrikaans ', NULL, NULL),
(2, 2, 1, 'Akan', NULL, NULL),
(3, 3, 1, 'Albanian', NULL, NULL),
(4, 4, 1, 'Armenian ', NULL, NULL),
(5, 5, 1, 'Amharic ', NULL, NULL),
(6, 6, 1, 'Arabic ', NULL, NULL),
(7, 7, 1, 'Assamese ', NULL, NULL),
(8, 8, 1, 'Awadhi', NULL, NULL),
(9, 9, 1, 'Azerbaijani', NULL, NULL),
(10, 10, 1, 'Bamanankan ', NULL, NULL),
(11, 11, 1, 'Balochi ', NULL, NULL),
(12, 12, 1, 'Konkani', NULL, NULL),
(13, 13, 1, 'Lahnda', NULL, NULL),
(14, 14, 1, 'Bengali  ', NULL, NULL),
(15, 15, 1, 'Bhojpuri ', NULL, NULL),
(16, 16, 1, 'Burmese ', NULL, NULL),
(17, 17, 1, 'Cebuano', NULL, NULL),
(18, 18, 1, 'Chewa ', NULL, NULL),
(19, 19, 1, 'Chhattisgarhi', NULL, NULL),
(20, 20, 1, 'Chinese ', NULL, NULL),
(21, 21, 1, 'Chittagonian ', NULL, NULL),
(22, 22, 1, 'Czech ', NULL, NULL),
(23, 23, 1, 'Deccan ', NULL, NULL),
(24, 24, 1, 'Dhundhari ', NULL, NULL),
(25, 25, 1, 'Dutch ', NULL, NULL),
(26, 26, 1, 'Eastern Min  ', NULL, NULL),
(27, 27, 1, 'English', NULL, NULL),
(28, 28, 1, 'French', NULL, NULL),
(29, 29, 1, 'Fula', NULL, NULL),
(30, 30, 1, 'German', NULL, NULL),
(31, 31, 1, 'Greek', NULL, NULL),
(32, 32, 1, 'Gujarati', NULL, NULL),
(33, 33, 1, 'Haitian Creole', NULL, NULL),
(34, 34, 1, 'Hakka', NULL, NULL),
(35, 35, 1, 'Haryanvi', NULL, NULL),
(36, 36, 1, 'Hausa', NULL, NULL),
(37, 37, 1, 'Hiligaynon / Ilonggo', NULL, NULL),
(38, 38, 1, 'Hindi', NULL, NULL),
(39, 39, 1, 'Hmong', NULL, NULL),
(40, 40, 1, 'Hungarian', NULL, NULL),
(41, 41, 1, 'Igbo', NULL, NULL),
(42, 42, 1, 'Ilocano', NULL, NULL),
(43, 43, 1, 'Italian', NULL, NULL),
(44, 44, 1, 'Japanese', NULL, NULL),
(45, 45, 1, 'Javanese', NULL, NULL),
(46, 46, 1, 'Kannada', NULL, NULL),
(47, 47, 1, 'Kazakh', NULL, NULL),
(48, 48, 1, 'Khmer', NULL, NULL),
(49, 49, 1, 'Kinyarwanda', NULL, NULL),
(50, 50, 1, 'Kirundi', NULL, NULL),
(51, 51, 1, 'Korean', NULL, NULL),
(52, 52, 1, 'Kurdish', NULL, NULL),
(53, 53, 1, 'Madurese', NULL, NULL),
(54, 54, 1, 'Magahi', NULL, NULL),
(55, 55, 1, 'Maithili', NULL, NULL),
(56, 56, 1, 'Malagasy', NULL, NULL),
(57, 57, 1, 'Malay ', NULL, NULL),
(58, 58, 1, 'Indonesian ', NULL, NULL),
(59, 59, 1, 'Malayalam', NULL, NULL),
(60, 60, 1, 'Mandarin  ', NULL, NULL),
(61, 61, 1, 'Marathi', NULL, NULL),
(62, 62, 1, 'Marwari', NULL, NULL),
(63, 63, 1, 'Mossi', NULL, NULL),
(64, 64, 1, 'Xhosa', NULL, NULL),
(65, 65, 1, 'Belarusian ', NULL, NULL),
(66, 66, 1, 'Nepali ', NULL, NULL),
(67, 67, 1, 'Northern Min ', NULL, NULL),
(68, 68, 1, 'Odia  ', NULL, NULL),
(69, 69, 1, 'Oromo ', NULL, NULL),
(70, 70, 1, 'Pashto ', NULL, NULL),
(71, 71, 1, 'Persian ', NULL, NULL),
(72, 72, 1, 'Polish ', NULL, NULL),
(73, 73, 1, 'Portuguese ', NULL, NULL),
(74, 74, 1, 'Punjabi ', NULL, NULL),
(75, 75, 1, 'Quechua ', NULL, NULL),
(76, 76, 1, 'Romanian ', NULL, NULL),
(77, 77, 1, 'Russian ', NULL, NULL),
(78, 78, 1, 'Saraiki ', NULL, NULL),
(79, 79, 1, 'Serbo-Croatian ', NULL, NULL),
(80, 80, 1, 'Shona ', NULL, NULL),
(81, 81, 1, 'Sindhi ', NULL, NULL),
(82, 82, 1, 'Sinhalese', NULL, NULL),
(83, 83, 1, 'Somali ', NULL, NULL),
(84, 84, 1, 'Southern Min   ', NULL, NULL),
(85, 85, 1, 'Spanish ', NULL, NULL),
(86, 86, 1, 'Sundanese ', NULL, NULL),
(87, 87, 1, 'Swedish ', NULL, NULL),
(88, 88, 1, 'Sylheti ', NULL, NULL),
(89, 89, 1, 'Filipino  ', NULL, NULL),
(90, 90, 1, 'Tamil ', NULL, NULL),
(91, 91, 1, 'Telugu ', NULL, NULL),
(92, 92, 1, 'Thai ', NULL, NULL),
(93, 93, 1, 'Turkish ', NULL, NULL),
(94, 94, 1, 'Turkmen ', NULL, NULL),
(95, 95, 1, 'Ukrainian ', NULL, NULL),
(96, 96, 1, 'Urdu ', NULL, NULL),
(97, 97, 1, 'Uyghur ', NULL, NULL),
(98, 98, 1, 'Uzbek', NULL, NULL),
(99, 99, 1, 'Vietnamese ', NULL, NULL),
(100, 100, 1, 'Xiang  ', NULL, NULL),
(101, 101, 1, 'Yoruba ', NULL, NULL),
(102, 102, 1, 'Zhuang ', NULL, NULL),
(103, 103, 1, 'Zulu ', NULL, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `internet_communications`
--

CREATE TABLE `internet_communications` (
  `id` int(10) UNSIGNED NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_information_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `internet_communication_type_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `internet_communications`
--

INSERT INTO `internet_communications` (`id`, `address`, `contact_information_id`, `created_at`, `updated_at`, `internet_communication_type_id`) VALUES
(37, '0969176269', 18, '2019-06-16 06:15:00', '2019-06-16 06:15:00', 12),
(40, '0969176269', 17, '2019-07-06 08:34:25', '2019-07-06 08:34:25', 12);

-- --------------------------------------------------------

--
-- بنية الجدول `internet_communication_types`
--

CREATE TABLE `internet_communication_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `internet_communication_types`
--

INSERT INTO `internet_communication_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'AIM', NULL, NULL),
(2, 'Hangouts', NULL, NULL),
(3, 'ICQ', NULL, NULL),
(4, 'IMO', NULL, NULL),
(5, 'JusTalk', NULL, NULL),
(6, 'Line', NULL, NULL),
(7, 'QQ', NULL, NULL),
(8, 'Skype', NULL, NULL),
(9, 'Telegram', NULL, NULL),
(10, 'Viber', NULL, NULL),
(11, 'WeChat', NULL, NULL),
(12, 'Whatsapp', NULL, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `majors`
--

CREATE TABLE `majors` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '1',
  `major_parent_id` int(10) UNSIGNED DEFAULT NULL,
  `institution_type_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `majors`
--

INSERT INTO `majors` (`id`, `created_at`, `updated_at`, `verified`, `major_parent_id`, `institution_type_id`) VALUES
(1, NULL, NULL, 1, 1, 2),
(2, NULL, NULL, 1, NULL, 2),
(3, NULL, NULL, 1, NULL, 2),
(4, NULL, NULL, 1, NULL, 2),
(5, NULL, NULL, 1, NULL, 2),
(6, NULL, NULL, 1, NULL, 2),
(7, NULL, NULL, 1, NULL, 2),
(8, NULL, NULL, 1, NULL, 2),
(9, NULL, NULL, 1, NULL, 2),
(10, NULL, NULL, 1, NULL, 2),
(11, NULL, NULL, 1, NULL, 2),
(12, NULL, NULL, 1, NULL, 2),
(13, NULL, NULL, 1, NULL, 2),
(14, NULL, NULL, 1, NULL, 2),
(15, NULL, NULL, 1, NULL, 2),
(16, NULL, NULL, 1, NULL, 2),
(17, NULL, NULL, 1, NULL, 2),
(18, NULL, NULL, 1, NULL, 2),
(19, NULL, NULL, 1, NULL, 2),
(20, NULL, NULL, 1, NULL, 2),
(21, NULL, NULL, 1, NULL, 2),
(22, NULL, NULL, 1, NULL, 2),
(23, NULL, NULL, 1, NULL, 2),
(24, NULL, NULL, 1, NULL, 2),
(25, NULL, NULL, 1, NULL, 2),
(26, NULL, NULL, 1, NULL, 2),
(27, NULL, NULL, 1, NULL, 2),
(28, NULL, NULL, 1, NULL, 2),
(29, NULL, NULL, 1, NULL, 2),
(30, NULL, NULL, 1, NULL, 2),
(31, NULL, NULL, 1, NULL, 2),
(32, NULL, NULL, 1, NULL, 2),
(33, NULL, NULL, 1, NULL, 2),
(34, NULL, NULL, 1, NULL, 2),
(35, NULL, NULL, 1, NULL, 2),
(36, NULL, NULL, 1, NULL, 2),
(37, NULL, NULL, 1, NULL, 2),
(38, NULL, NULL, 1, NULL, 2),
(39, NULL, NULL, 1, NULL, 2),
(40, NULL, NULL, 1, NULL, 2),
(41, NULL, NULL, 1, NULL, 2),
(42, NULL, NULL, 1, NULL, 2),
(43, NULL, NULL, 1, NULL, 2),
(44, NULL, NULL, 1, NULL, 2),
(45, NULL, NULL, 1, NULL, 2),
(46, NULL, NULL, 1, NULL, 2),
(47, NULL, NULL, 1, NULL, 2),
(48, NULL, NULL, 1, NULL, 2),
(49, NULL, NULL, 1, NULL, 2),
(50, NULL, NULL, 1, NULL, 2),
(51, NULL, NULL, 1, NULL, 2),
(52, NULL, NULL, 1, NULL, 2),
(53, NULL, NULL, 1, NULL, 2),
(54, NULL, NULL, 1, NULL, 2),
(55, NULL, NULL, 1, NULL, 2),
(56, NULL, NULL, 1, NULL, 2),
(57, NULL, NULL, 1, NULL, 2),
(58, NULL, NULL, 1, NULL, 2),
(59, NULL, NULL, 1, NULL, 2),
(60, NULL, NULL, 1, NULL, 2),
(61, NULL, NULL, 1, NULL, 2),
(62, NULL, NULL, 1, NULL, 2),
(63, NULL, NULL, 1, NULL, 2),
(64, NULL, NULL, 1, NULL, 2),
(65, NULL, NULL, 1, NULL, 2),
(66, NULL, NULL, 1, NULL, 2),
(67, NULL, NULL, 1, NULL, 2),
(68, NULL, NULL, 1, NULL, 2),
(69, NULL, NULL, 1, NULL, 2),
(70, NULL, NULL, 1, NULL, 2),
(71, NULL, NULL, 1, NULL, 2),
(72, NULL, NULL, 1, NULL, 2),
(73, NULL, NULL, 1, NULL, 2),
(74, NULL, NULL, 1, NULL, 2),
(75, NULL, NULL, 1, NULL, 2),
(76, NULL, NULL, 1, NULL, 2),
(77, NULL, NULL, 1, NULL, 2),
(78, NULL, NULL, 1, NULL, 2),
(79, NULL, NULL, 1, NULL, 2),
(80, NULL, NULL, 1, NULL, 2),
(81, NULL, NULL, 1, NULL, 2),
(82, NULL, NULL, 1, NULL, 2),
(83, NULL, NULL, 1, NULL, 2),
(84, NULL, NULL, 1, NULL, 2),
(85, NULL, NULL, 1, NULL, 2),
(86, NULL, NULL, 1, NULL, 2),
(87, NULL, NULL, 1, NULL, 2),
(88, NULL, NULL, 1, NULL, 2),
(89, NULL, NULL, 1, NULL, 2),
(90, NULL, NULL, 1, NULL, 2),
(91, NULL, NULL, 1, NULL, 2),
(92, NULL, NULL, 1, NULL, 2),
(93, NULL, NULL, 1, NULL, 2),
(94, NULL, NULL, 1, NULL, 2),
(95, NULL, NULL, 1, NULL, 2),
(96, NULL, NULL, 1, NULL, 2),
(97, NULL, NULL, 1, NULL, 2),
(98, NULL, NULL, 1, NULL, 2),
(99, NULL, NULL, 1, NULL, 2),
(100, NULL, NULL, 1, NULL, 2),
(101, NULL, NULL, 1, NULL, 2),
(102, NULL, NULL, 1, NULL, 2),
(103, NULL, NULL, 1, NULL, 2),
(104, NULL, NULL, 1, NULL, 2),
(105, NULL, NULL, 1, NULL, 2),
(106, NULL, NULL, 1, NULL, 2),
(107, NULL, NULL, 1, NULL, 2),
(108, NULL, NULL, 1, NULL, 2),
(109, NULL, NULL, 1, NULL, 2),
(110, NULL, NULL, 1, NULL, 2),
(111, NULL, NULL, 1, NULL, 2),
(112, NULL, NULL, 1, NULL, 2),
(113, NULL, NULL, 1, NULL, 2),
(114, NULL, NULL, 1, NULL, 2),
(115, NULL, NULL, 1, NULL, 2),
(116, NULL, NULL, 1, NULL, 2),
(117, NULL, NULL, 1, NULL, 2),
(118, NULL, NULL, 1, NULL, 2),
(119, NULL, NULL, 1, NULL, 2),
(120, NULL, NULL, 1, NULL, 2),
(121, NULL, NULL, 1, NULL, 2),
(122, NULL, NULL, 1, NULL, 2),
(123, NULL, NULL, 1, NULL, 2),
(124, NULL, NULL, 1, NULL, 2),
(125, NULL, NULL, 1, NULL, 2),
(126, NULL, NULL, 1, NULL, 2),
(127, NULL, NULL, 1, NULL, 2),
(128, NULL, NULL, 1, NULL, 2),
(129, NULL, NULL, 1, NULL, 2),
(130, NULL, NULL, 1, NULL, 2),
(131, NULL, NULL, 1, NULL, 2),
(132, NULL, NULL, 1, NULL, 2),
(133, NULL, NULL, 1, NULL, 2),
(134, NULL, NULL, 1, NULL, 2),
(135, NULL, NULL, 1, NULL, 2),
(136, NULL, NULL, 1, NULL, 2),
(137, NULL, NULL, 1, NULL, 2),
(138, NULL, NULL, 1, NULL, 2),
(139, NULL, NULL, 1, NULL, 2),
(140, NULL, NULL, 1, NULL, 2),
(141, NULL, NULL, 1, NULL, 2),
(142, NULL, NULL, 1, NULL, 2),
(143, NULL, NULL, 1, NULL, 2),
(144, NULL, NULL, 1, NULL, 2),
(145, NULL, NULL, 1, NULL, 2),
(146, NULL, NULL, 1, NULL, 1),
(147, NULL, NULL, 1, NULL, 1),
(148, NULL, NULL, 1, NULL, 1),
(149, '2019-06-27 10:27:46', '2019-06-27 10:27:46', 0, NULL, 1),
(150, '2019-07-04 06:35:29', '2019-07-04 06:35:29', 0, NULL, 2),
(151, '2019-07-07 05:46:32', '2019-07-07 05:46:32', 0, NULL, 2);

-- --------------------------------------------------------

--
-- بنية الجدول `major_parents`
--

CREATE TABLE `major_parents` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `major_parents`
--

INSERT INTO `major_parents` (`id`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `major_parent_translations`
--

CREATE TABLE `major_parent_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `major_parent_id` int(10) UNSIGNED DEFAULT NULL,
  `translated_languages_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `major_parent_translations`
--

INSERT INTO `major_parent_translations` (`id`, `major_parent_id`, `translated_languages_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'major_parent', NULL, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `major_translations`
--

CREATE TABLE `major_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `major_id` int(10) UNSIGNED DEFAULT NULL,
  `translated_languages_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `major_translations`
--

INSERT INTO `major_translations` (`id`, `major_id`, `translated_languages_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Agricultural and Domestic Animal Services', NULL, NULL),
(2, 2, 1, 'Agricultural and Food Products Processing ', NULL, NULL),
(3, 3, 1, 'Agricultural Business and Management', NULL, NULL),
(4, 4, 1, 'Agricultural Mechanization ', NULL, NULL),
(5, 5, 1, 'Agricultural Production Operations ', NULL, NULL),
(6, 6, 1, 'Agricultural Public Services', NULL, NULL),
(7, 7, 1, 'Animal Sciences ', NULL, NULL),
(8, 8, 1, 'Applied Horticulture and Horticultural Business Service ', NULL, NULL),
(9, 9, 1, 'Food Science and Technology ', NULL, NULL),
(10, 10, 1, 'International Agriculture ', NULL, NULL),
(11, 11, 1, 'Plant Sciences ', NULL, NULL),
(12, 12, 1, 'Soil Sciences ', NULL, NULL),
(13, 13, 1, 'Architectural History and Criticism ', NULL, NULL),
(14, 14, 1, 'Architectural Sciences and Technology ', NULL, NULL),
(15, 15, 1, 'Architecture ', NULL, NULL),
(16, 16, 1, 'City/Urban, Community and Regional Planning ', NULL, NULL),
(17, 17, 1, 'Environmental Design ', NULL, NULL),
(18, 18, 1, 'Interior Architecture ', NULL, NULL),
(19, 19, 1, 'Landscape Architecture ', NULL, NULL),
(20, 20, 1, 'Real Estate Development ', NULL, NULL),
(21, 21, 1, 'Area studies  ', NULL, NULL),
(22, 22, 1, 'Ethnic studies ', NULL, NULL),
(23, 23, 1, 'Aviation / Flight Training  ', NULL, NULL),
(24, 24, 1, 'Biochemistry, Biophysics and Molecular Biology ', NULL, NULL),
(25, 25, 1, 'Biology ', NULL, NULL),
(26, 26, 1, 'Biomathematics, Bioinformatics, and Computational Biology ', NULL, NULL),
(27, 27, 1, 'Biotechnology ', NULL, NULL),
(28, 28, 1, 'Botany/Plant Biology ', NULL, NULL),
(29, 29, 1, 'Cell/Cellular Biology and Anatomical Sciences ', NULL, NULL),
(30, 30, 1, 'Ecology, Evolution, Systematics, and Population Biology ', NULL, NULL),
(31, 31, 1, 'Genetics ', NULL, NULL),
(32, 32, 1, 'Microbiological Sciences and Immunology ', NULL, NULL),
(33, 33, 1, 'Molecular Medicine ', NULL, NULL),
(34, 34, 1, 'Neurobiology and Neurosciences ', NULL, NULL),
(35, 35, 1, 'Pharmacology and Toxicology ', NULL, NULL),
(36, 36, 1, 'Physiology, Pathology and Related Science ', NULL, NULL),
(37, 37, 1, 'Zoology/Animal Biology ', NULL, NULL),
(38, 38, 1, 'Accounting and Related Services ', NULL, NULL),
(39, 39, 1, 'Business Administration, Management and Operations ', NULL, NULL),
(40, 40, 1, 'Business Operations Support and Assistant Services ', NULL, NULL),
(41, 41, 1, 'Business/Commerce ', NULL, NULL),
(42, 42, 1, 'Business/Corporate Communications ', NULL, NULL),
(43, 43, 1, 'Business/Managerial Economics ', NULL, NULL),
(44, 44, 1, 'Construction Management ', NULL, NULL),
(45, 45, 1, 'Entrepreneurial and Small Business Operations ', NULL, NULL),
(46, 46, 1, 'Finance and Financial Management Services ', NULL, NULL),
(47, 47, 1, 'General Sales, Merchandising and Related Marketing Operations ', NULL, NULL),
(48, 48, 1, 'Hospitality Administration/Management ', NULL, NULL),
(49, 49, 1, 'Human Resources Management and Services ', NULL, NULL),
(50, 50, 1, 'Insurance ', NULL, NULL),
(51, 51, 1, 'International Business ', NULL, NULL),
(52, 52, 1, 'Management Information Systems and Services ', NULL, NULL),
(53, 53, 1, 'Management Sciences and Quantitative Methods ', NULL, NULL),
(54, 54, 1, 'Marketing ', NULL, NULL),
(55, 55, 1, 'Real Estate ', NULL, NULL),
(56, 56, 1, 'Specialized Sales, Merchandising and Marketing Operations ', NULL, NULL),
(57, 57, 1, 'Taxation ', NULL, NULL),
(58, 58, 1, 'Telecommunications Management ', NULL, NULL),
(59, 59, 1, 'Communication and Media Studies ', NULL, NULL),
(60, 60, 1, 'Journalism ', NULL, NULL),
(61, 61, 1, 'Public Relations, Advertising, and Applied Communication ', NULL, NULL),
(62, 62, 1, 'Publishing ', NULL, NULL),
(63, 63, 1, 'Radio, Television, and Digital Communication ', NULL, NULL),
(64, 64, 1, 'Audiovisual Communications Technologies/Technicians ', NULL, NULL),
(65, 65, 1, 'Communications Technology/Technician ', NULL, NULL),
(66, 66, 1, 'Graphic Communications ', NULL, NULL),
(67, 67, 1, 'Computer and Information Sciences ', NULL, NULL),
(68, 68, 1, 'Computer Programming ', NULL, NULL),
(69, 69, 1, 'Computer Science ', NULL, NULL),
(70, 70, 1, 'Computer Software and Media Applications ', NULL, NULL),
(71, 71, 1, 'Computer Systems Analysis ', NULL, NULL),
(72, 72, 1, 'Computer Systems Networking and Telecommunications ', NULL, NULL),
(73, 73, 1, 'Computer/Information Technology Administration and Management ', NULL, NULL),
(74, 74, 1, 'Data Entry/Microcomputer Applications ', NULL, NULL),
(75, 75, 1, 'Data Processing ', NULL, NULL),
(76, 76, 1, 'Information Science/Studies ', NULL, NULL),
(77, 77, 1, 'Architectural Engineering Technologies/Technicians ', NULL, NULL),
(78, 78, 1, 'Civil Engineering Technologies/Technicians ', NULL, NULL),
(79, 79, 1, 'Computer Engineering Technologies/Technicians ', NULL, NULL),
(80, 80, 1, 'Construction Engineering Technologies ', NULL, NULL),
(81, 81, 1, 'Drafting/Design Engineering Technologies/Technicians ', NULL, NULL),
(82, 82, 1, 'Electrical Engineering Technologies/Technicians ', NULL, NULL),
(83, 83, 1, 'Electromechanical Instrumentation and Maintenance Technologies/Technicians ', NULL, NULL),
(84, 84, 1, 'Environmental Control Technologies/Technicians ', NULL, NULL),
(85, 85, 1, 'Industrial Production Technologies/Technicians ', NULL, NULL),
(86, 86, 1, 'Mechanical Engineering ', NULL, NULL),
(87, 87, 1, 'Mining and Petroleum Technologies/Technicians ', NULL, NULL),
(88, 88, 1, 'Nanotechnology ', NULL, NULL),
(89, 89, 1, 'Nuclear Engineering Technologies/Technicians ', NULL, NULL),
(90, 90, 1, 'Quality Control and Safety Technologies/Technicians ', NULL, NULL),
(91, 91, 1, 'Aerospace, Aeronautical and Astronautical Engineering ', NULL, NULL),
(92, 92, 1, 'Agricultural Engineering ', NULL, NULL),
(93, 93, 1, 'Architectural Engineering ', NULL, NULL),
(94, 94, 1, 'Biochemical Engineering', NULL, NULL),
(95, 95, 1, 'Biological/Biosystems Engineering ', NULL, NULL),
(96, 96, 1, 'Biomedical/Medical Engineering ', NULL, NULL),
(97, 97, 1, 'Ceramic Sciences and Engineering ', NULL, NULL),
(98, 98, 1, 'Chemical Engineering ', NULL, NULL),
(99, 99, 1, 'Civil Engineering ', NULL, NULL),
(100, 100, 1, 'Computer Engineering ', NULL, NULL),
(101, 101, 1, 'Construction Engineering ', NULL, NULL),
(102, 102, 1, 'Electrical, Electronics and Communications Engineering ', NULL, NULL),
(103, 103, 1, 'Electromechanical Engineering ', NULL, NULL),
(104, 104, 1, 'Engineering Chemistry ', NULL, NULL),
(105, 105, 1, 'Engineering Mechanics ', NULL, NULL),
(106, 106, 1, 'Engineering Physics ', NULL, NULL),
(107, 107, 1, 'Environmental/Environmental Health Engineering ', NULL, NULL),
(108, 108, 1, 'Geological/Geophysical Engineering ', NULL, NULL),
(109, 109, 1, 'Industrial Engineering ', NULL, NULL),
(110, 110, 1, 'Manufacturing Engineering ', NULL, NULL),
(111, 111, 1, 'Mechanical Engineering ', NULL, NULL),
(112, 112, 1, 'Mechatronics, Robotics, and Automation Engineering ', NULL, NULL),
(113, 113, 1, 'Metallurgical Engineering ', NULL, NULL),
(114, 114, 1, 'Mining and Mineral Engineering ', NULL, NULL),
(115, 115, 1, 'Naval Architecture and Marine Engineering ', NULL, NULL),
(116, 116, 1, 'Nuclear Engineering ', NULL, NULL),
(117, 117, 1, 'English Language and Literature ', NULL, NULL),
(118, 118, 1, 'Literature ', NULL, NULL),
(119, 119, 1, 'Advanced/Graduate Dentistry and Oral Sciences ', NULL, NULL),
(120, 120, 1, 'Allied Health and Medical Assisting Services ', NULL, NULL),
(121, 121, 1, 'Applied Mathematics ', NULL, NULL),
(122, 122, 1, 'Mathematics ', NULL, NULL),
(123, 123, 1, 'Astronomy and Astrophysics ', NULL, NULL),
(124, 124, 1, 'Atmospheric Sciences and Meteorology ', NULL, NULL),
(125, 125, 1, 'Chemistry ', NULL, NULL),
(126, 126, 1, 'Geological and Earth Sciences/Geosciences ', NULL, NULL),
(127, 127, 1, 'Physics ', NULL, NULL),
(128, 128, 1, 'Psychology ', NULL, NULL),
(129, 129, 1, 'Experimental Psychology ', NULL, NULL),
(130, 130, 1, 'Anthropology ', NULL, NULL),
(131, 131, 1, 'Archeology ', NULL, NULL),
(132, 132, 1, 'Criminology ', NULL, NULL),
(133, 133, 1, 'Economics ', NULL, NULL),
(134, 134, 1, 'Geography and Cartography', NULL, NULL),
(135, 135, 1, 'Political Science and Government ', NULL, NULL),
(136, 136, 1, 'Sociology ', NULL, NULL),
(137, 137, 1, 'Arts, Entertainment ,and Media Management ', NULL, NULL),
(138, 138, 1, 'Crafts/Craft Design, Folk Art and Artisanry ', NULL, NULL),
(139, 139, 1, 'Design and Applied Arts ', NULL, NULL),
(140, 140, 1, 'Drama/Theatre Arts and Stagecraft ', NULL, NULL),
(141, 141, 1, 'Film/Video and Photographic Arts ', NULL, NULL),
(142, 142, 1, 'Fine and Studio Arts ', NULL, NULL),
(143, 143, 1, 'Music ', NULL, NULL),
(144, 144, 1, 'Visual and Performing Arts ', NULL, NULL),
(145, 145, 1, 'Information Engineering ', NULL, NULL),
(268, 1, 2, 'الخدمات الزراعية والحيوانية المحلية', NULL, NULL),
(269, 2, 2, 'معالجة المنتجات الزراعيةوالغذائية', NULL, NULL),
(270, 3, 2, 'إدارة الأعمال الزراعية', NULL, NULL),
(271, 4, 2, 'مكننة زراعية', NULL, NULL),
(272, 5, 2, 'عمليات الإنتاج الزارعي', NULL, NULL),
(273, 6, 2, 'الخدمات العامة الزراعية', NULL, NULL),
(274, 7, 2, ' علوم الحيوان', NULL, NULL),
(275, 8, 2, 'البستنة التطبيقية وخدمات الأعمال البستانية', NULL, NULL),
(276, 9, 2, 'علم الغذاء والتكنولوجيا', NULL, NULL),
(277, 10, 2, 'الزراعة الدولية', NULL, NULL),
(278, 11, 2, 'علوم النبات', NULL, NULL),
(279, 12, 2, 'علوم التربة', NULL, NULL),
(280, 13, 2, 'التاريخ المعماري والنقد', NULL, NULL),
(281, 14, 2, 'العلوم المعمارية والتكنولوجيا', NULL, NULL),
(282, 15, 2, 'الهندسة المعارية', NULL, NULL),
(283, 16, 2, 'تخطيط المدن / المناطق الحضرية والتخطيط المجتمعي والإقليمي', NULL, NULL),
(284, 17, 2, 'التصميم البيئي', NULL, NULL),
(285, 18, 2, 'العمارة الداخلية', NULL, NULL),
(286, 19, 2, 'هندسة المناظر الطبيعية', NULL, NULL),
(287, 20, 2, 'التطوير العقاري', NULL, NULL),
(288, 21, 2, 'دراسات المنطقة', NULL, NULL),
(289, 22, 2, 'الدراسات العرقية', NULL, NULL),
(290, 23, 2, 'الطيران / التدريب على الطيران', NULL, NULL),
(291, 24, 2, 'الكيمياء الحيوية والفيزياء الحيوية والبيولوجيا الجزيئية', NULL, NULL),
(292, 25, 2, 'علم الأحياء', NULL, NULL),
(293, 146, 1, 'Scientific', NULL, NULL),
(294, 146, 2, 'العلمي', NULL, NULL),
(295, 147, 1, 'Literary', NULL, NULL),
(296, 147, 2, 'الأدبي', NULL, NULL),
(297, 148, 1, 'Other', NULL, NULL),
(298, 148, 2, 'آخرى', NULL, NULL),
(299, 149, 1, 'ss', '2019-06-27 10:27:46', '2019-06-27 10:27:46'),
(300, 150, 1, 'Computer Programming', '2019-07-04 06:35:29', '2019-07-04 06:35:29'),
(301, 151, 1, 'Information Engineering', '2019-07-07 05:46:32', '2019-07-07 05:46:32');

-- --------------------------------------------------------

--
-- بنية الجدول `marital_statuses`
--

CREATE TABLE `marital_statuses` (
  `id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `marital_statuses`
--

INSERT INTO `marital_statuses` (`id`) VALUES
(1),
(2),
(3),
(4),
(5),
(6);

-- --------------------------------------------------------

--
-- بنية الجدول `marital_status_translations`
--

CREATE TABLE `marital_status_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `marital_status_id` int(10) UNSIGNED DEFAULT NULL,
  `translated_languages_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `marital_status_translations`
--

INSERT INTO `marital_status_translations` (`id`, `marital_status_id`, `translated_languages_id`, `name`) VALUES
(3, 1, 1, 'Single'),
(4, 2, 1, 'Engaged'),
(5, 3, 1, 'Married'),
(6, 4, 1, 'Widowed'),
(7, 5, 1, 'Separated'),
(8, 6, 1, 'Divorced'),
(9, 1, 2, 'أعزب'),
(10, 2, 2, 'مرتبط'),
(11, 3, 2, 'متزوج'),
(12, 4, 2, 'أرمل'),
(13, 5, 2, 'منفصل'),
(14, 6, 2, 'مطلق');

-- --------------------------------------------------------

--
-- بنية الجدول `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_08_01_180003_create_resumes_table', 1),
(4, '2018_08_01_180139_create_objectives_table', 1),
(5, '2018_08_01_180208_create_summaries_table', 1),
(6, '2018_08_01_180257_create_personal_informations_table', 1),
(7, '2018_08_01_180343_create_place_of_births_table', 1),
(8, '2018_08_01_180401_create_current_locations_table', 1),
(9, '2018_08_01_180419_create_nationalities_table', 1),
(10, '2018_08_01_180505_create_contact_informations_table', 1),
(11, '2018_08_01_180518_create_emails_table', 1),
(12, '2018_08_01_180531_create_contact_numbers_table', 1),
(13, '2018_08_01_180553_create_internet_communications_table', 1),
(14, '2018_08_01_180612_create_personal_links_table', 1),
(15, '2018_08_01_180935_nationality_personal_information_table', 1),
(16, '2018_08_18_160202_create_universities_table', 1),
(17, '2018_08_18_160231_create_majors_table', 1),
(18, '2018_08_18_160239_create_minors_table', 1),
(19, '2018_08_18_160248_create_education_table', 1),
(20, '2018_08_18_160256_create_education_projects_table', 1),
(21, '2018_08_26_102356_create_major_groups_table', 1),
(22, '2018_08_26_104210_add_verified_to_major', 1),
(23, '2018_08_26_105324_add_verified_to_minor', 1),
(24, '2018_09_15_113550_update_university_table', 1),
(25, '2018_09_15_113727_update_education_table', 1),
(26, '2018_09_15_114430_update_fromFieldeducation_table', 1),
(27, '2018_09_15_115121_update_createfromFieldeducation_table', 1),
(28, '2018_09_16_133731_update_fromMonthFieldeducation_table', 1),
(29, '2018_09_16_133934_update_toMonthFieldeducation_table', 1),
(30, '2018_09_22_091507_change_grade_Type', 1),
(31, '2018_09_22_091705_update_change_grade_Type', 1),
(32, '2018_09_29_083202_addVerifiedUniversity', 1),
(33, '2018_09_29_145001_create-international-languages-table', 1),
(34, '2018_09_29_145110_create-languages-table', 1),
(35, '2018_09_29_172607_create-diplomas-table', 1),
(36, '2018_10_06_140606_create_drivings_table', 1),
(37, '2018_10_06_141145_create_driving_categories_table', 1),
(38, '2018_10_20_134113_create_achievements_table', 2),
(39, '2018_10_20_161503_create_memberships_table', 2),
(40, '2018_10_20_163548_create_projects_table', 2),
(41, '2018_10_20_163713_create_publications_table', 2),
(42, '2018_10_20_163822_create_volunteers_table', 2),
(43, '2019_04_17_141449_update_achievement_table', 3),
(44, '2019_04_17_185740_update_memberships_table', 4),
(45, '2019_04_17_192038_update_projects_table', 5),
(46, '2019_04_17_192110_update_publications_table', 5),
(47, '2019_04_17_192145_update_volunteers_table', 5),
(48, '2019_04_22_192038_create_hobbies_interests_table', 6),
(49, '2019_04_23_194654_create_conferences_workshop_seminars_table', 7),
(51, '2019_04_24_062552_create_portfolio_table', 8),
(52, '2019_04_24_201722_create_training_table', 9),
(53, '2019_04_26_185436_update_ispresent_training_table', 10),
(54, '2019_04_27_091041_create_Certifications_table', 11),
(55, '2019_04_29_062149_create_training_table', 12),
(56, '2019_05_01_065748_create_re_references_table', 12),
(57, '2019_05_08_091426_update_training_table', 12),
(59, '2019_05_09_055818_create_company_industries_table', 13),
(60, '2019_05_09_055945_create_employment_type_parent_table', 13),
(61, '2019_05_09_060153_create_work_experience_table', 13),
(62, '2019_05_09_060239_create_employment_type_table', 13),
(63, '2019_05_12_074030_update_work_exp_table', 14),
(65, '2019_05_09_055703_create_companies_table', 15),
(66, '2019_05_12_074724_update_company_table', 15),
(67, '2019_05_14_150334_create_skill_type_parents_table', 16),
(68, '2019_05_14_150607_create_skill_types_table', 16),
(69, '2019_05_14_151109_create_skills_table', 16),
(70, '2019_05_14_153038_Add_order_to_skills_table', 16),
(72, '2019_05_21_123508_create_translated_languages_table', 17),
(73, '2019_05_21_123728_update_resumes_table', 18),
(74, '2019_05_21_135043_create_marital_status_table', 19),
(75, '2019_05_22_014037_create_marital_status_translation_table', 19),
(76, '2019_05_22_022431_update_personal_informations_table', 20),
(77, '2019_05_22_085310_create_nationality_translation_table', 21),
(78, '2019_05_22_093629_update_nationalities_table', 22),
(79, '2019_05_22_205459_create_phone_types_table', 23),
(81, '2019_05_22_210037_create_phone_types_translations_table', 24),
(82, '2019_05_22_224024_update_contact_numbers_table', 25),
(83, '2019_05_23_105016_create_countries_table', 26),
(84, '2019_05_23_111118_create_country_translations_table', 27),
(85, '2019_05_23_112717_update_contact_numbers2_table', 28),
(86, '2019_05_25_073044_update_driving_table', 29),
(87, '2019_05_25_091819_create_university_translations_table', 30),
(88, '2019_05_25_115823_create_major_translations_table', 31),
(89, '2019_05_25_115956_create_minor_translations_table', 32),
(90, '2019_05_25_120426_create_company_industry_translations_table', 33),
(91, '2019_05_26_090700_update_major_translations_table', 34),
(92, '2019_05_26_092021_update_university_translations_table', 35),
(93, '2019_05_26_092119_update_minor_translations_table', 35),
(94, '2019_05_26_125141_create_company_industry_translations_table', 36),
(95, '2019_05_26_125409_create_employment_type_parent_translations_table', 37),
(96, '2019_05_27_072306_update_company_industry_translations_table', 38),
(97, '2019_05_27_095017_craete_conferences_type_table', 39),
(98, '2019_05_27_100051_update_conference_type_translations_table', 40),
(99, '2019_05_27_104617_update_conferences_workshop_seminars_table', 41),
(100, '2019_05_28_065053_create_degree_levels_table', 42),
(101, '2019_05_28_065342_create_degree_level_translations_table', 43),
(102, '2019_05_28_072325_update_education2_table', 44),
(103, '2019_05_28_095911_update_re_references_table', 45),
(104, '2019_05_29_084448_create_international_language_trans_table', 46),
(105, '2019_05_29_091655_update_languages1_table', 47),
(106, '2019_05_29_093700_create_self_assessment_table', 48),
(107, '2019_05_29_093859_create_self_assessment_trans_table', 49),
(108, '2019_05_29_094058_Add_self_assessment_to_languages_table', 50),
(109, '2019_05_29_111201_create_language_assessment_table', 51),
(110, '2019_05_30_075655_update_languages_table', 52),
(111, '2019_06_01_083336_create_translated_languages_table', 53),
(112, '2019_06_01_083429_update_resumes_table', 54),
(113, '2019_06_01_083520_create_marital_status_table', 54),
(114, '2019_06_01_083550_create_marital_status_translation_table', 54),
(115, '2019_06_01_083633_update_personal_informations_table', 54),
(116, '2019_06_01_083723_create_nationality_translation_table', 54),
(117, '2019_06_01_083813_update_nationalities_table', 54),
(118, '2019_06_01_105950_create_phone_types_table', 54),
(119, '2019_06_01_110036_create_phone_types_translations_table', 54),
(120, '2019_06_01_110122_update_contact_numbers_table', 54),
(121, '2019_06_01_110345_create_countries_table', 54),
(122, '2019_06_01_110618_create_country_translations_table', 54),
(123, '2019_06_01_110744_update_contact_numbers2_table', 54),
(124, '2019_06_01_112212_update_driving_table', 54),
(125, '2019_06_01_113715_create_university_translations_table', 54),
(126, '2019_06_02_070240_create_major_translations_table', 54),
(127, '2019_06_02_070323_create_minor_translations_table', 54),
(128, '2019_06_02_070341_create_company_industry_translations_table', 54),
(129, '2019_06_02_070642_create_employment_type_parent_translations_table', 54),
(130, '2019_06_02_073420_craete_conferences_type_table', 54),
(131, '2019_06_02_073512_create_conference_type_translations_table', 54),
(132, '2019_06_02_073553_update_conferences_workshop_seminars_table', 54),
(133, '2019_06_02_075047_create_degree_levels_table', 54),
(134, '2019_06_02_075059_create_degree_level_translations_table', 54),
(135, '2019_06_02_075131_update_education2_table', 54),
(136, '2019_06_02_075310_update_re_references_table', 54),
(137, '2019_06_02_085549_create_international_language_trans_table', 54),
(138, '2019_06_02_085622_update_languages1_table', 54),
(139, '2019_06_02_085648_create_self_assessment_table', 54),
(140, '2019_06_02_085709_create_self_assessment_trans_table', 54),
(141, '2019_06_02_085743_create_language_assessment_table', 54),
(142, '2019_06_02_085804_update_languages_table', 54),
(145, '2019_06_02_121335_create_parent_major_table', 55),
(146, '2019_06_02_121542_create_parent_major_translation_table', 55),
(147, '2019_06_03_070939_create_company_industry_parent_table', 56),
(148, '2019_06_03_071233_create_company_industry_parent_trans_table', 56),
(149, '2019_06_03_071946_update_major_table', 57),
(150, '2019_06_03_072800_update_company_industry_table', 58),
(151, '2019_06_03_081651_create_skill_type_trans_table', 59),
(152, '2019_06_03_091633_create_skill_type_parent_trans_table', 60),
(153, '2019_06_03_094105_update_skill_type_parent_table', 61),
(154, '2019_06_03_094741_update_skill_type_table', 62),
(155, '2019_06_03_095149_create_skill_levels_table', 63),
(156, '2019_06_03_095214_create_skill_level_trans_table', 63),
(157, '2019_06_03_100700_update_skills_table', 64),
(158, '2019_06_04_070619_create_parent_major_table', 65),
(159, '2019_06_04_070845_create_parent_major_translation_table', 65),
(160, '2019_06_04_070933_update_major_table', 65),
(161, '2019_06_04_072418_create_company_industry_parent_table', 65),
(162, '2019_06_04_072428_create_company_industry_parent_trans_table', 65),
(163, '2019_06_04_072454_update_company_industry_table', 65),
(164, '2019_06_04_074858_create_skill_type_basic_parents_table', 66),
(165, '2019_06_04_075150_create_skill_type_basic_parent_trans_table', 66),
(166, '2019_06_04_075543_update_skill_type_parents_table', 67),
(167, '2019_06_15_073902_create_social_media_table', 68),
(168, '2019_06_15_074218_update_personal_links_table', 69),
(169, '2019_06_16_073900_create_internet_communication_types_table', 70),
(170, '2019_06_16_074226_update_internet_communication_table', 71),
(172, '2019_06_16_095541_add_count_to_resumes_table', 72),
(173, '2019_06_22_205110_add_count_to_resumes_table', 73),
(174, '2019_06_25_073543_create_institutions_table', 74),
(175, '2019_06_25_073605_create_institution_translations_table', 74),
(176, '2019_06_25_073646_edit_education_table', 74),
(177, '2019_06_25_074856_create_institution_types_table', 75),
(178, '2019_06_25_075150_edit_institutions_table', 76),
(179, '2019_06_25_075209_edit_majors_table', 76),
(180, '2019_06_26_070651_rename_companeis_table', 77),
(181, '2019_06_26_080000_create_company_sizes_table', 78),
(183, '2019_06_26_080058_create_company_size_trans_table', 79),
(184, '2019_06_26_095620_edit_work_exp_companies_table', 80),
(185, '2019_06_26_120013_create_valid_years_table', 81),
(186, '2019_06_26_120029_create_valid_year_translations_table', 81),
(187, '2019_06_26_122742_edit_certification_table', 82),
(188, '2019_06_27_112516_create_institutions_table', 83),
(189, '2019_06_27_112705_create_institution_translations_table', 83),
(190, '2019_06_27_112811_edit_education_table', 83),
(191, '2019_06_27_112902_create_institution_types_table', 83),
(192, '2019_06_27_112952_edit_institutions_table', 83),
(193, '2019_06_27_113006_edit_majors_table', 83),
(194, '2019_06_27_133638_edit_skill_types_table', 84),
(196, '2019_06_27_143351_edit_skill_types2_table', 85),
(197, '2019_06_27_144124_edit_skill_types3_table', 86),
(198, '2019_06_29_071507_edit_skill_type_trans_table', 87),
(199, '2019_06_29_100807_create_reference_informations_table', 88),
(200, '2019_06_29_110445_edit_re_references_table', 89),
(201, '2019_08_05_10000_create_companies_table', 90),
(202, '2019_08_05_103714_create_company_profile_translations_table', 90),
(203, '2019_08_06_071215_create_company_profiles_table', 90),
(204, '2019_08_06_071324_create_company_locations_table', 90),
(205, '2019_08_06_071359_create_company_social_medias_table', 90),
(206, '2019_08_06_071437_create_company_specialties_for_companies_table', 90),
(207, '2019_08_06_071511_create_company_industries_for_companies_table', 90),
(208, '2019_08_06_071537_create_specialty_table', 90),
(209, '2019_08_06_071609_create_specialty_translations_table', 90),
(210, '2019_08_06_071641_create_company_types_table', 90),
(211, '2019_08_06_071707_create_company_type_translations_table', 90),
(212, '2019_08_07_052812_CompanyLink', 90),
(213, '2019_08_07_053159_CompanyProfileTranlationLink', 90),
(214, '2019_08_07_053406_CompanyProfileLink', 90),
(215, '2019_08_07_053749_CompanySpecialtiesForCompanyLink', 90),
(216, '2019_08_07_062952_edit_compnay_locations_table', 91),
(217, '2019_08_07_162951_edit_compnay_table', 92),
(218, '2019_08_07_262951_edit_compnay_profile_table', 93),
(219, '2019_08_07_162952_add_socialite_fields_to_users_table', 94),
(220, '2019_08_07_162953_add_socialite_fields_to_users_table_email_verified_at', 95),
(221, '2019_08_07_162955_add_email_verified_at_to_users_table', 96),
(222, '2016_06_01_000001_create_oauth_auth_codes_table', 97),
(223, '2016_06_01_000002_create_oauth_access_tokens_table', 97),
(224, '2016_06_01_000003_create_oauth_refresh_tokens_table', 97),
(225, '2016_06_01_000004_create_oauth_clients_table', 97),
(226, '2016_06_01_000005_create_oauth_personal_access_clients_table', 97),
(227, '2019_09_14_055523_create_company_statuses_table', 97),
(228, '2019_09_14_055651_create_company_method_verfications_table', 97),
(229, '2019_09_14_055935_create_admins_table', 97),
(230, '2019_09_14_055935_edit_compnay_table', 97),
(231, '2019_09_14_065935_add_relations_compnay_table', 98),
(232, '2019_09_14_066935_edit_compnay_table', 99),
(233, '2019_08_07_172951_edit_compnay_table', 100),
(234, '2016_09_18_115526_drop_admin_table', 101),
(235, '2011_09_14_065935_add_relations_compnay_table', 102),
(236, '2011_09_18_195935_rename_admins_logs_table', 103),
(237, '2011_09_18_195935_edit_company_admins_logs_table', 104),
(239, '2011_09_30_065201_create_roles_table', 105),
(240, '2011_09_30_065958_create_role_user_table', 106),
(241, '2011_09_30_065958_create_contact_main_catagories_table', 107),
(242, '2011_09_30_065968_create_contact_sub_categories_table', 108),
(243, '2011_09_30_066958_create_recieved_emails_table', 108),
(244, '2011_09_30_066988_create_pre_defined_emails_table', 108),
(245, '2011_09_30_067958_create_admin_comments_table', 108),
(246, '2011_09_30_068958_create_admin_open_logs_table', 108),
(247, '2011_09_30_069958_create_admin_replied_emails_table', 108),
(248, '2011_09_30_070958_create_admin_email_assign_logs_table', 108),
(249, '2011_09_30_071958_create_admin_done_email_logs_table', 108),
(250, '2011_09_30_072958_create_admin_restore_email_logs_table', 108),
(251, '2011_09_30_073958_edit_recieved_emails_table', 108),
(252, '2011_09_30_074958_edit_column_recieved_emails_table', 109),
(253, '2010_09_30_075958_create_c_m_c_translations_table', 110),
(254, '2010_09_30_075958_create_c_s_c_translations_table', 110),
(255, '2011_09_30_076058_rename_column_in_admin_email_assign_logs_table', 111),
(256, '2011_09_30_076158_edit_email_column_recieved_emails_table', 112),
(257, '2011_09_30_076168_edit_user_id_column_recieved_emails_table', 113),
(258, '2011_09_30_076268_drop_unique_email_column_recieved_emails_table', 114),
(260, '2011_09_30_076358_edit_pre_defined_emails_table', 115),
(261, '2011_09_30_071958_create_admin_not_done_email_logs_table', 116),
(262, '2011_09_30_073958_add_recieved_emails_table', 117),
(263, '2011_09_30_076158_edit_admin_replied_emails_table', 118);

-- --------------------------------------------------------

--
-- بنية الجدول `minors`
--

CREATE TABLE `minors` (
  `id` int(10) UNSIGNED NOT NULL,
  `major_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `minors`
--

INSERT INTO `minors` (`id`, `major_id`, `created_at`, `updated_at`, `verified`) VALUES
(1, 1, NULL, NULL, 1),
(2, 1, NULL, NULL, 1),
(3, 1, NULL, NULL, 1),
(4, 1, NULL, NULL, 1),
(5, 3, NULL, NULL, 1),
(6, 3, NULL, NULL, 1),
(7, 3, NULL, NULL, 1),
(8, 3, NULL, NULL, 1),
(9, 3, NULL, NULL, 1),
(10, 3, NULL, NULL, 1),
(11, 4, NULL, NULL, 1),
(12, 4, NULL, NULL, 1),
(13, 4, NULL, NULL, 1),
(14, 5, NULL, NULL, 1),
(15, 5, NULL, NULL, 1),
(16, 5, NULL, NULL, 1),
(17, 5, NULL, NULL, 1),
(18, 5, NULL, NULL, 1),
(19, 5, NULL, NULL, 1),
(20, 5, NULL, NULL, 1),
(21, 5, NULL, NULL, 1),
(22, 6, NULL, NULL, 1),
(23, 6, NULL, NULL, 1),
(24, 7, NULL, NULL, 1),
(25, 7, NULL, NULL, 1),
(26, 7, NULL, NULL, 1),
(27, 7, NULL, NULL, 1),
(28, 7, NULL, NULL, 1),
(29, 7, NULL, NULL, 1),
(30, 7, NULL, NULL, 1),
(31, 8, NULL, NULL, 1),
(32, 8, NULL, NULL, 1),
(33, 8, NULL, NULL, 1),
(34, 8, NULL, NULL, 1),
(35, 8, NULL, NULL, 1),
(36, 8, NULL, NULL, 1),
(37, 8, NULL, NULL, 1),
(38, 9, NULL, NULL, 1),
(39, 9, NULL, NULL, 1),
(40, 11, NULL, NULL, 1),
(41, 11, NULL, NULL, 1),
(42, 11, NULL, NULL, 1),
(43, 11, NULL, NULL, 1),
(44, 11, NULL, NULL, 1),
(45, 11, NULL, NULL, 1),
(46, 12, NULL, NULL, 1),
(47, 12, NULL, NULL, 1),
(48, 12, NULL, NULL, 1),
(49, 14, NULL, NULL, 1),
(50, 14, NULL, NULL, 1),
(51, 21, NULL, NULL, 1),
(52, 21, NULL, NULL, 1),
(53, 21, NULL, NULL, 1),
(54, 21, NULL, NULL, 1),
(55, 21, NULL, NULL, 1),
(56, 21, NULL, NULL, 1),
(57, 21, NULL, NULL, 1),
(58, 21, NULL, NULL, 1),
(59, 21, NULL, NULL, 1),
(60, 21, NULL, NULL, 1),
(61, 21, NULL, NULL, 1),
(62, 21, NULL, NULL, 1),
(63, 21, NULL, NULL, 1),
(64, 21, NULL, NULL, 1),
(65, 21, NULL, NULL, 1),
(66, 21, NULL, NULL, 1),
(67, 21, NULL, NULL, 1),
(68, 21, NULL, NULL, 1),
(69, 21, NULL, NULL, 1),
(70, 21, NULL, NULL, 1),
(71, 21, NULL, NULL, 1),
(72, 21, NULL, NULL, 1),
(73, 21, NULL, NULL, 1),
(74, 21, NULL, NULL, 1),
(75, 21, NULL, NULL, 1),
(76, 21, NULL, NULL, 1),
(77, 21, NULL, NULL, 1),
(78, 21, NULL, NULL, 1),
(79, 21, NULL, NULL, 1),
(80, 21, NULL, NULL, 1),
(81, 21, NULL, NULL, 1),
(82, 21, NULL, NULL, 1),
(83, 21, NULL, NULL, 1),
(84, 21, NULL, NULL, 1),
(85, 22, NULL, NULL, 1),
(86, 22, NULL, NULL, 1),
(87, 22, NULL, NULL, 1),
(88, 22, NULL, NULL, 1),
(89, 22, NULL, NULL, 1),
(90, 22, NULL, NULL, 1),
(91, 22, NULL, NULL, 1),
(92, 22, NULL, NULL, 1),
(93, 22, NULL, NULL, 1),
(94, 24, NULL, NULL, 1),
(95, 24, NULL, NULL, 1),
(96, 24, NULL, NULL, 1),
(97, 24, NULL, NULL, 1),
(98, 24, NULL, NULL, 1),
(99, 24, NULL, NULL, 1),
(100, 24, NULL, NULL, 1),
(101, 24, NULL, NULL, 1),
(102, 24, NULL, NULL, 1),
(103, 25, NULL, NULL, 1),
(104, 25, NULL, NULL, 1),
(105, 26, NULL, NULL, 1),
(106, 26, NULL, NULL, 1),
(107, 26, NULL, NULL, 1),
(108, 26, NULL, NULL, 1),
(109, 28, NULL, NULL, 1),
(110, 28, NULL, NULL, 1),
(111, 28, NULL, NULL, 1),
(112, 28, NULL, NULL, 1),
(113, 29, NULL, NULL, 1),
(114, 29, NULL, NULL, 1),
(115, 29, NULL, NULL, 1),
(116, 29, NULL, NULL, 1),
(117, 29, NULL, NULL, 1),
(118, 30, NULL, NULL, 1),
(119, 30, NULL, NULL, 1),
(120, 30, NULL, NULL, 1),
(121, 30, NULL, NULL, 1),
(122, 30, NULL, NULL, 1),
(123, 30, NULL, NULL, 1),
(124, 30, NULL, NULL, 1),
(125, 30, NULL, NULL, 1),
(126, 30, NULL, NULL, 1),
(127, 30, NULL, NULL, 1),
(128, 31, NULL, NULL, 1),
(129, 31, NULL, NULL, 1),
(130, 31, NULL, NULL, 1),
(131, 31, NULL, NULL, 1),
(132, 31, NULL, NULL, 1),
(133, 31, NULL, NULL, 1),
(134, 31, NULL, NULL, 1),
(135, 32, NULL, NULL, 1),
(136, 32, NULL, NULL, 1),
(137, 32, NULL, NULL, 1),
(138, 32, NULL, NULL, 1),
(139, 32, NULL, NULL, 1),
(140, 32, NULL, NULL, 1),
(141, 32, NULL, NULL, 1),
(142, 34, NULL, NULL, 1),
(143, 34, NULL, NULL, 1),
(144, 34, NULL, NULL, 1),
(145, 34, NULL, NULL, 1),
(146, 35, NULL, NULL, 1),
(147, 35, NULL, NULL, 1),
(148, 35, NULL, NULL, 1),
(149, 35, NULL, NULL, 1),
(150, 35, NULL, NULL, 1),
(152, 35, NULL, NULL, 1),
(153, 35, NULL, NULL, 1),
(154, 36, NULL, NULL, 1),
(155, 36, NULL, NULL, 1),
(156, 36, NULL, NULL, 1),
(157, 36, NULL, NULL, 1),
(158, 36, NULL, NULL, 1),
(159, 36, NULL, NULL, 1),
(160, 36, NULL, NULL, 1),
(161, 36, NULL, NULL, 1),
(162, 36, NULL, NULL, 1),
(163, 36, NULL, NULL, 1),
(164, 36, NULL, NULL, 1),
(165, 37, NULL, NULL, 1),
(166, 37, NULL, NULL, 1),
(167, 37, NULL, NULL, 1),
(168, 37, NULL, NULL, 1),
(169, 37, NULL, NULL, 1),
(170, 38, NULL, NULL, 1),
(171, 38, NULL, NULL, 1),
(172, 38, NULL, NULL, 1),
(173, 38, NULL, NULL, 1),
(174, 38, NULL, NULL, 1),
(175, 39, NULL, NULL, 1),
(176, 39, NULL, NULL, 1),
(177, 39, NULL, NULL, 1),
(178, 39, NULL, NULL, 1),
(179, 39, NULL, NULL, 1),
(180, 39, NULL, NULL, 1),
(181, 39, NULL, NULL, 1),
(182, 39, NULL, NULL, 1),
(183, 39, NULL, NULL, 1),
(184, 39, NULL, NULL, 1),
(185, 39, NULL, NULL, 1),
(186, 39, NULL, NULL, 1),
(187, 40, NULL, NULL, 1),
(188, 40, NULL, NULL, 1),
(189, 40, NULL, NULL, 1),
(190, 40, NULL, NULL, 1),
(191, 40, NULL, NULL, 1),
(192, 40, NULL, NULL, 1),
(193, 40, NULL, NULL, 1),
(194, 40, NULL, NULL, 1),
(195, 45, NULL, NULL, 1),
(196, 45, NULL, NULL, 1),
(197, 45, NULL, NULL, 1),
(198, 46, NULL, NULL, 1),
(199, 46, NULL, NULL, 1),
(200, 46, NULL, NULL, 1),
(201, 46, NULL, NULL, 1),
(202, 46, NULL, NULL, 1),
(203, 46, NULL, NULL, 1),
(204, 46, NULL, NULL, 1),
(205, 47, NULL, NULL, 1),
(206, 47, NULL, NULL, 1),
(207, 47, NULL, NULL, 1),
(208, 47, NULL, NULL, 1),
(209, 48, NULL, NULL, 1),
(210, 48, NULL, NULL, 1),
(211, 48, NULL, NULL, 1),
(212, 48, NULL, NULL, 1),
(213, 48, NULL, NULL, 1),
(215, 48, NULL, NULL, 1),
(216, 48, NULL, NULL, 1),
(217, 49, NULL, NULL, 1),
(218, 49, NULL, NULL, 1),
(219, 49, NULL, NULL, 1),
(220, 49, NULL, NULL, 1),
(221, 49, NULL, NULL, 1),
(222, 51, NULL, NULL, 1),
(223, 52, NULL, NULL, 1),
(224, 52, NULL, NULL, 1),
(225, 52, NULL, NULL, 1),
(226, 53, NULL, NULL, 1),
(227, 53, NULL, NULL, 1),
(228, 53, NULL, NULL, 1),
(229, 54, NULL, NULL, 1),
(230, 54, NULL, NULL, 1),
(231, 54, NULL, NULL, 1),
(232, 56, NULL, NULL, 1),
(233, 56, NULL, NULL, 1),
(234, 56, NULL, NULL, 1),
(235, 56, NULL, NULL, 1),
(236, 56, NULL, NULL, 1),
(237, 56, NULL, NULL, 1),
(238, 56, NULL, NULL, 1),
(239, 56, NULL, NULL, 1),
(240, 56, NULL, NULL, 1),
(241, 56, NULL, NULL, 1),
(242, 59, NULL, NULL, 1),
(243, 59, NULL, NULL, 1),
(244, 60, NULL, NULL, 1),
(245, 60, NULL, NULL, 1),
(246, 60, NULL, NULL, 1),
(247, 61, NULL, NULL, 1),
(248, 61, NULL, NULL, 1),
(249, 61, NULL, NULL, 1),
(250, 61, NULL, NULL, 1),
(251, 61, NULL, NULL, 1),
(252, 61, NULL, NULL, 1),
(253, 61, NULL, NULL, 1),
(254, 63, NULL, NULL, 1),
(255, 63, NULL, NULL, 1),
(256, 64, NULL, NULL, 1),
(257, 64, NULL, NULL, 1),
(258, 64, NULL, NULL, 1),
(259, 65, NULL, NULL, 1),
(260, 65, NULL, NULL, 1),
(261, 65, NULL, NULL, 1),
(262, 65, NULL, NULL, 1),
(263, 65, NULL, NULL, 1),
(264, 65, NULL, NULL, 1),
(265, 65, NULL, NULL, 1),
(266, 65, NULL, NULL, 1),
(267, 67, NULL, NULL, 1),
(268, 67, NULL, NULL, 1),
(269, 67, NULL, NULL, 1),
(270, 67, NULL, NULL, 1),
(271, 68, NULL, NULL, 1),
(272, 68, NULL, NULL, 1),
(273, 68, NULL, NULL, 1),
(274, 70, NULL, NULL, 1),
(275, 70, NULL, NULL, 1),
(276, 70, NULL, NULL, 1),
(277, 70, NULL, NULL, 1),
(278, 70, NULL, NULL, 1),
(279, 73, NULL, NULL, 1),
(280, 73, NULL, NULL, 1),
(281, 73, NULL, NULL, 1),
(282, 73, NULL, NULL, 1),
(283, 73, NULL, NULL, 1),
(284, 73, NULL, NULL, 1),
(285, 73, NULL, NULL, 1),
(286, 79, NULL, NULL, 1),
(287, 79, NULL, NULL, 1),
(288, 79, NULL, NULL, 1),
(289, 79, NULL, NULL, 1),
(290, 80, NULL, NULL, 1),
(291, 81, NULL, NULL, 1),
(292, 81, NULL, NULL, 1),
(293, 81, NULL, NULL, 1),
(294, 81, NULL, NULL, 1),
(295, 81, NULL, NULL, 1),
(296, 81, NULL, NULL, 1),
(297, 82, NULL, NULL, 1),
(298, 82, NULL, NULL, 1),
(299, 82, NULL, NULL, 1),
(300, 82, NULL, NULL, 1),
(301, 83, NULL, NULL, 1),
(302, 83, NULL, NULL, 1),
(303, 83, NULL, NULL, 1),
(304, 83, NULL, NULL, 1),
(305, 83, NULL, NULL, 1),
(306, 84, NULL, NULL, 1),
(307, 84, NULL, NULL, 1),
(308, 84, NULL, NULL, 1),
(309, 84, NULL, NULL, 1),
(310, 84, NULL, NULL, 1),
(311, 84, NULL, NULL, 1),
(312, 85, NULL, NULL, 1),
(313, 85, NULL, NULL, 1),
(314, 85, NULL, NULL, 1),
(315, 85, NULL, NULL, 1),
(316, 85, NULL, NULL, 1),
(317, 85, NULL, NULL, 1),
(318, 85, NULL, NULL, 1),
(319, 86, NULL, NULL, 1),
(320, 86, NULL, NULL, 1),
(321, 86, NULL, NULL, 1),
(322, 87, NULL, NULL, 1),
(323, 87, NULL, NULL, 1),
(324, 90, NULL, NULL, 1),
(325, 90, NULL, NULL, 1),
(326, 90, NULL, NULL, 1),
(327, 90, NULL, NULL, 1),
(328, 98, NULL, NULL, 1),
(329, 99, NULL, NULL, 1),
(330, 99, NULL, NULL, 1),
(331, 99, NULL, NULL, 1),
(332, 99, NULL, NULL, 1),
(333, 100, NULL, NULL, 1),
(334, 100, NULL, NULL, 1),
(335, 102, NULL, NULL, 1),
(336, 102, NULL, NULL, 1),
(337, 102, NULL, NULL, 1),
(338, 118, NULL, NULL, 1),
(339, 118, NULL, NULL, 1),
(340, 118, NULL, NULL, 1),
(341, 118, NULL, NULL, 1),
(342, 118, NULL, NULL, 1),
(343, 119, NULL, NULL, 1),
(344, 119, NULL, NULL, 1),
(345, 119, NULL, NULL, 1),
(346, 119, NULL, NULL, 1),
(347, 119, NULL, NULL, 1),
(348, 119, NULL, NULL, 1),
(349, 119, NULL, NULL, 1),
(350, 119, NULL, NULL, 1),
(351, 119, NULL, NULL, 1),
(352, 119, NULL, NULL, 1),
(353, 119, NULL, NULL, 1),
(354, 120, NULL, NULL, 1),
(355, 120, NULL, NULL, 1),
(356, 120, NULL, NULL, 1),
(357, 120, NULL, NULL, 1),
(358, 120, NULL, NULL, 1),
(359, 120, NULL, NULL, 1),
(360, 120, NULL, NULL, 1),
(361, 120, NULL, NULL, 1),
(362, 120, NULL, NULL, 1),
(363, 120, NULL, NULL, 1),
(364, 120, NULL, NULL, 1),
(365, 120, NULL, NULL, 1),
(366, 120, NULL, NULL, 1),
(367, 120, NULL, NULL, 1),
(368, 121, NULL, NULL, 1),
(369, 121, NULL, NULL, 1),
(370, 121, NULL, NULL, 1),
(371, 121, NULL, NULL, 1),
(372, 122, NULL, NULL, 1),
(373, 122, NULL, NULL, 1),
(374, 122, NULL, NULL, 1),
(375, 122, NULL, NULL, 1),
(376, 125, NULL, NULL, 1),
(377, 125, NULL, NULL, 1),
(378, 125, NULL, NULL, 1),
(379, 125, NULL, NULL, 1),
(380, 125, NULL, NULL, 1),
(381, 125, NULL, NULL, 1),
(382, 125, NULL, NULL, 1),
(383, 125, NULL, NULL, 1),
(384, 125, NULL, NULL, 1),
(385, 127, NULL, NULL, 1),
(386, 127, NULL, NULL, 1),
(387, 127, NULL, NULL, 1),
(388, 127, NULL, NULL, 1),
(389, 127, NULL, NULL, 1),
(390, 127, NULL, NULL, 1),
(391, 127, NULL, NULL, 1),
(392, 127, NULL, NULL, 1),
(393, 129, NULL, NULL, 1),
(394, 129, NULL, NULL, 1),
(395, 129, NULL, NULL, 1),
(396, 129, NULL, NULL, 1),
(397, 129, NULL, NULL, 1),
(398, 129, NULL, NULL, 1),
(399, 129, NULL, NULL, 1),
(400, 129, NULL, NULL, 1),
(401, 130, NULL, NULL, 1),
(402, 130, NULL, NULL, 1),
(403, 130, NULL, NULL, 1),
(404, 133, NULL, NULL, 1),
(405, 133, NULL, NULL, 1),
(406, 133, NULL, NULL, 1),
(407, 133, NULL, NULL, 1),
(408, 139, NULL, NULL, 1),
(409, 139, NULL, NULL, 1),
(410, 139, NULL, NULL, 1),
(411, 139, NULL, NULL, 1),
(412, 139, NULL, NULL, 1),
(413, 139, NULL, NULL, 1),
(414, 139, NULL, NULL, 1),
(415, 139, NULL, NULL, 1),
(416, 139, NULL, NULL, 1),
(417, 140, NULL, NULL, 1),
(418, 140, NULL, NULL, 1),
(419, 140, NULL, NULL, 1),
(420, 140, NULL, NULL, 1),
(421, 140, NULL, NULL, 1),
(422, 140, NULL, NULL, 1),
(423, 140, NULL, NULL, 1),
(424, 140, NULL, NULL, 1),
(425, 141, NULL, NULL, 1),
(426, 141, NULL, NULL, 1),
(427, 141, NULL, NULL, 1),
(428, 141, NULL, NULL, 1),
(429, 142, NULL, NULL, 1),
(430, 142, NULL, NULL, 1),
(431, 142, NULL, NULL, 1),
(432, 142, NULL, NULL, 1),
(433, 142, NULL, NULL, 1),
(434, 142, NULL, NULL, 1),
(435, 142, NULL, NULL, 1),
(436, 142, NULL, NULL, 1),
(437, 142, NULL, NULL, 1),
(438, 142, NULL, NULL, 1),
(439, 143, NULL, NULL, 1),
(440, 143, NULL, NULL, 1),
(441, 143, NULL, NULL, 1),
(442, 143, NULL, NULL, 1),
(443, 143, NULL, NULL, 1),
(444, 143, NULL, NULL, 1),
(445, 143, NULL, NULL, 1),
(446, 143, NULL, NULL, 1),
(447, 143, NULL, NULL, 1),
(448, 143, NULL, NULL, 1),
(449, 143, NULL, NULL, 1),
(450, 143, NULL, NULL, 1),
(451, 143, NULL, NULL, 1),
(452, 143, NULL, NULL, 1),
(453, 39, NULL, NULL, 1),
(454, 61, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- بنية الجدول `minor_translations`
--

CREATE TABLE `minor_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `minor_id` int(10) UNSIGNED DEFAULT NULL,
  `translated_languages_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `minor_translations`
--

INSERT INTO `minor_translations` (`id`, `minor_id`, `translated_languages_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Animal Training', NULL, NULL),
(2, 2, 1, 'Dog/Pet/Animal Grooming', NULL, NULL),
(3, 3, 1, 'Equestrian/Equine Studies', NULL, NULL),
(4, 4, 1, 'Taxidermy/Taxidermist', NULL, NULL),
(5, 5, 1, 'Agribusiness/Agricultural Business Operations', NULL, NULL),
(6, 6, 1, 'Agricultural Business and Management', NULL, NULL),
(7, 7, 1, 'Agricultural Business Technology', NULL, NULL),
(8, 8, 1, 'Agricultural Economics', NULL, NULL),
(9, 9, 1, 'Agricultural/Farm Supplies Retailing and Wholesaling', NULL, NULL),
(10, 10, 1, 'Farm/Farm and Ranch Management', NULL, NULL),
(11, 11, 1, ' Agricultural Mechanics and Equipment/Machine Technology', NULL, NULL),
(12, 12, 1, 'Agricultural Mechanization', NULL, NULL),
(13, 13, 1, 'Agricultural Power Machinery Operation', NULL, NULL),
(14, 14, 1, 'Agricultural Production Operations', NULL, NULL),
(15, 15, 1, 'Agroecology and Sustainable Agriculture', NULL, NULL),
(16, 16, 1, 'Animal/Livestock Husbandry and Production', NULL, NULL),
(17, 17, 1, 'Aquaculture', NULL, NULL),
(18, 18, 1, 'Crop Production', NULL, NULL),
(19, 19, 1, 'Dairy Husbandry and Production', NULL, NULL),
(20, 20, 1, 'Horse Husbandry/Equine Science and Management', NULL, NULL),
(21, 21, 1, 'Viticulture and Enology', NULL, NULL),
(22, 22, 1, 'Agricultural and Extension Education Services', NULL, NULL),
(23, 23, 1, 'Agricultural Communication/Journalism', NULL, NULL),
(24, 24, 1, 'Agricultural Animal Breeding', NULL, NULL),
(25, 25, 1, 'Animal Health', NULL, NULL),
(26, 26, 1, 'Animal Nutrition', NULL, NULL),
(27, 27, 1, 'Animal Sciences', NULL, NULL),
(28, 28, 1, 'Dairy Science', NULL, NULL),
(29, 29, 1, 'Livestock Management', NULL, NULL),
(30, 30, 1, 'Poultry Science', NULL, NULL),
(31, 31, 1, 'Applied Horticulture/Horticulture Operations', NULL, NULL),
(32, 32, 1, 'Floriculture/Floristry Operations and Management', NULL, NULL),
(33, 33, 1, 'Greenhouse Operations and Management', NULL, NULL),
(34, 34, 1, 'Landscaping and Groundskeeping', NULL, NULL),
(35, 35, 1, 'Ornamental Horticulture', NULL, NULL),
(36, 36, 1, 'Plant Nursery Operations and Management', NULL, NULL),
(37, 37, 1, 'Turf and Turfgrass Management', NULL, NULL),
(38, 38, 1, 'Food Science', NULL, NULL),
(39, 39, 1, 'Food Technology and Processing', NULL, NULL),
(40, 40, 1, 'Agricultural and Horticultural Plant Breeding', NULL, NULL),
(41, 41, 1, 'Agronomy and Crop Science', NULL, NULL),
(42, 42, 1, 'Horticultural Science', NULL, NULL),
(43, 43, 1, 'Plant Protection and Integrated Pest Management', NULL, NULL),
(44, 44, 1, 'Plant Sciences', NULL, NULL),
(45, 45, 1, 'Range Science and Management', NULL, NULL),
(46, 46, 1, 'Soil Chemistry and Physic', NULL, NULL),
(47, 47, 1, 'Soil Microbiology', NULL, NULL),
(48, 48, 1, 'Soil Science and Agronomy', NULL, NULL),
(49, 49, 1, 'Architectural and Building Sciences/Technology', NULL, NULL),
(50, 50, 1, 'Architectural Technology/Technician', NULL, NULL),
(51, 51, 1, 'African Studies', NULL, NULL),
(52, 52, 1, 'American/United States Studies/Civilization', NULL, NULL),
(53, 53, 1, 'Asian Studies/Civilization', NULL, NULL),
(54, 54, 1, 'Balkans Studies', NULL, NULL),
(55, 55, 1, 'Baltic Studies', NULL, NULL),
(56, 56, 1, 'Canadian Studies', NULL, NULL),
(57, 57, 1, 'Caribbean Studies', NULL, NULL),
(58, 58, 1, 'Chinese Studies', NULL, NULL),
(59, 59, 1, 'Commonwealth Studies', NULL, NULL),
(60, 60, 1, 'East Asian Studies', NULL, NULL),
(61, 61, 1, 'European Studies/Civilization', NULL, NULL),
(62, 62, 1, 'French Studies', NULL, NULL),
(63, 63, 1, 'German Studies', NULL, NULL),
(64, 64, 1, 'Irish Studies', NULL, NULL),
(65, 65, 1, 'Italian Studies', NULL, NULL),
(66, 66, 1, 'Japanese Studies', NULL, NULL),
(67, 67, 1, 'Korean Studies', NULL, NULL),
(68, 68, 1, 'Latin American and Caribbean Studies', NULL, NULL),
(69, 69, 1, 'Latin American Studies', NULL, NULL),
(70, 70, 1, 'Near and Middle Eastern Studies', NULL, NULL),
(71, 71, 1, 'Pacific Area/Pacific Rim Studies', NULL, NULL),
(72, 72, 1, 'Polish Studie', NULL, NULL),
(73, 73, 1, 'Regional Studies (US, Canadian, Foreign)', NULL, NULL),
(74, 74, 1, 'Russian Studies', NULL, NULL),
(75, 75, 1, 'Russian, Central European, East European and Eurasian Studies', NULL, NULL),
(76, 76, 1, 'Scandinavian Studies', NULL, NULL),
(77, 77, 1, 'Slavic Studies', NULL, NULL),
(78, 78, 1, 'South Asian Studies', NULL, NULL),
(79, 79, 1, 'southeast Asian Studies', NULL, NULL),
(80, 80, 1, 'Spanish and Iberian Studies', NULL, NULL),
(81, 81, 1, 'Tibetan Studies', NULL, NULL),
(82, 82, 1, 'Ukraine Studies', NULL, NULL),
(83, 83, 1, 'Ural-Altaic and Central Asian Studies', NULL, NULL),
(84, 84, 1, 'Western European Studies', NULL, NULL),
(85, 85, 1, 'African-American/Black Studies', NULL, NULL),
(86, 86, 1, 'American Indian/Native American Studies', NULL, NULL),
(87, 87, 1, 'Asian-American Studies', NULL, NULL),
(88, 88, 1, 'Deaf Studies', NULL, NULL),
(89, 89, 1, 'Disability Studies', NULL, NULL),
(90, 90, 1, 'Folklore Studies', NULL, NULL),
(91, 91, 1, 'Gay/Lesbian Studies', NULL, NULL),
(92, 92, 1, 'Hispanic-American, Puerto Rican, and Mexican-American/Chicano Studies', NULL, NULL),
(93, 93, 1, 'Women\'s Studies', NULL, NULL),
(94, 94, 1, 'Biochemistry', NULL, NULL),
(95, 95, 1, 'Biochemistry and Molecular Biology', NULL, NULL),
(96, 96, 1, 'Biophysics', NULL, NULL),
(97, 97, 1, 'Molecular Biochemistry', NULL, NULL),
(98, 98, 1, 'Molecular Biology', NULL, NULL),
(99, 99, 1, 'Molecular Biophysics', NULL, NULL),
(100, 100, 1, 'Photobiology', NULL, NULL),
(101, 101, 1, 'Radiation Biology/Radiobiology', NULL, NULL),
(102, 102, 1, 'Structural Biology', NULL, NULL),
(103, 103, 1, 'Biology/Biological Sciences', NULL, NULL),
(104, 104, 1, 'Biomedical Sciences', NULL, NULL),
(105, 105, 1, 'Bioinformatics', NULL, NULL),
(106, 106, 1, 'Biometry/Biometrics', NULL, NULL),
(107, 107, 1, 'Biostatistics', NULL, NULL),
(108, 108, 1, 'Computational Biology', NULL, NULL),
(109, 109, 1, 'Botany/Plant Biology', NULL, NULL),
(110, 110, 1, 'Plant Molecular Bio', NULL, NULL),
(111, 111, 1, 'Plant Pathology/Phytopathology', NULL, NULL),
(112, 112, 1, 'Plant Physiology', NULL, NULL),
(113, 113, 1, 'Anatomy', NULL, NULL),
(114, 114, 1, 'Cell Biology and Anatomy', NULL, NULL),
(115, 115, 1, 'Cell/Cellular and Molecular Biology', NULL, NULL),
(116, 116, 1, 'Cell/Cellular Biology and Histology', NULL, NULL),
(117, 117, 1, 'Developmental Biology and Embryology', NULL, NULL),
(118, 118, 1, 'Aquatic Biology/Limnology', NULL, NULL),
(119, 119, 1, 'Conservation Biology', NULL, NULL),
(120, 120, 1, 'Ecology', NULL, NULL),
(121, 121, 1, 'Ecology and Evolutionary Biology', NULL, NULL),
(122, 122, 1, 'Environmental Biology', NULL, NULL),
(123, 123, 1, 'Epidemiology', NULL, NULL),
(124, 124, 1, 'Evolutionary Biology', NULL, NULL),
(125, 125, 1, 'Marine Biology and Biological Oceanography', NULL, NULL),
(126, 126, 1, 'Population Biology', NULL, NULL),
(127, 127, 1, 'Systematic Biology/Biological Systematics', NULL, NULL),
(128, 128, 1, 'Animal Genetics', NULL, NULL),
(129, 129, 1, 'Genetics', NULL, NULL),
(130, 130, 1, 'Genome Sciences/Genomics', NULL, NULL),
(131, 131, 1, 'Human/Medical Genetics', NULL, NULL),
(132, 132, 1, 'Microbial and Eukaryotic Genetics', NULL, NULL),
(133, 133, 1, 'Molecular Genetics', NULL, NULL),
(134, 134, 1, 'Plant Genetics', NULL, NULL),
(135, 135, 1, 'Immunology', NULL, NULL),
(136, 136, 1, 'Medical Microbiology and Bacteriology', NULL, NULL),
(137, 137, 1, 'Microbiology', NULL, NULL),
(138, 138, 1, 'Microbiology and Immunology', NULL, NULL),
(139, 139, 1, 'Mycology', NULL, NULL),
(140, 140, 1, 'Parasitology', NULL, NULL),
(141, 141, 1, 'Virology', NULL, NULL),
(142, 142, 1, 'Neuroanatomy', NULL, NULL),
(143, 143, 1, 'Neurobiology and Anatomy', NULL, NULL),
(144, 144, 1, 'Neurobiology and Behavior', NULL, NULL),
(145, 145, 1, 'Neuroscience', NULL, NULL),
(146, 146, 1, 'Environmental Toxicology', NULL, NULL),
(147, 147, 1, 'Molecular Pharmacology', NULL, NULL),
(148, 148, 1, 'Molecular Toxicology', NULL, NULL),
(149, 149, 1, 'Neuropharmacology', NULL, NULL),
(150, 150, 1, 'Pharmacology', NULL, NULL),
(151, 152, 1, 'Pharmacology and Toxicology', NULL, NULL),
(152, 153, 1, 'Toxicology', NULL, NULL),
(153, 154, 1, 'Aerospace Physiology and Medicine', NULL, NULL),
(154, 155, 1, 'Cardiovascular Science', NULL, NULL),
(155, 156, 1, 'Cell Physiology', NULL, NULL),
(156, 157, 1, 'Endocrinology', NULL, NULL),
(157, 158, 1, 'Exercise Physiology', NULL, NULL),
(158, 159, 1, 'Molecular Physiology', NULL, NULL),
(159, 160, 1, 'Oncology and Cancer Biology', NULL, NULL),
(160, 161, 1, 'Pathology/Experimental Pathology', NULL, NULL),
(161, 162, 1, 'Physiology', NULL, NULL),
(162, 163, 1, 'Reproductive Biology', NULL, NULL),
(163, 164, 1, 'Vision Science/Physiological Optics', NULL, NULL),
(164, 165, 1, 'Animal Behavior and Ethology', NULL, NULL),
(165, 166, 1, 'Animal Physiology', NULL, NULL),
(166, 167, 1, 'Entomology', NULL, NULL),
(167, 168, 1, 'Wildlife Biology', NULL, NULL),
(168, 169, 1, 'Zoology/Animal Biology', NULL, NULL),
(169, 170, 1, 'Accounting', NULL, NULL),
(170, 171, 1, 'Accounting and Business/Management', NULL, NULL),
(171, 172, 1, 'Accounting and Finance', NULL, NULL),
(172, 173, 1, 'Accounting Technology/Technician and Bookkeeping', NULL, NULL),
(173, 174, 1, 'Auditing', NULL, NULL),
(174, 175, 1, 'Business Administration and Management', NULL, NULL),
(175, 176, 1, 'Customer Service Management', NULL, NULL),
(176, 177, 1, 'E-Commerce/Electronic Commerce', NULL, NULL),
(177, 178, 1, 'Logistics, Materials, and Supply Chain Management', NULL, NULL),
(178, 179, 1, 'Non-Profit/Public/Organizational Management', NULL, NULL),
(179, 180, 1, 'Office Management and Supervision', NULL, NULL),
(180, 181, 1, 'Operations Management and Supervision', NULL, NULL),
(181, 182, 1, 'Organizational Leadership', NULL, NULL),
(182, 183, 1, 'Project Management', NULL, NULL),
(183, 184, 1, 'Purchasing, Procurement/Acquisitions and Contracts Management', NULL, NULL),
(184, 185, 1, 'Research and Development Management', NULL, NULL),
(185, 186, 1, 'Transportation/Mobility Management', NULL, NULL),
(186, 187, 1, 'Administrative Assistant and Secretarial Science', NULL, NULL),
(187, 188, 1, 'Business/Office Automation/Technology/Data Entry', NULL, NULL),
(188, 189, 1, 'Customer Service Support/Call Center/Teleservice Operation', NULL, NULL),
(189, 190, 1, 'Executive Assistant/Executive Secretary', NULL, NULL),
(190, 191, 1, 'General Office Occupations and Clerical Services', NULL, NULL),
(191, 192, 1, 'Parts, Warehousing, and Inventory Management Operations', NULL, NULL),
(192, 193, 1, 'Receptionist', NULL, NULL),
(193, 194, 1, 'Traffic, Customs, and Transportation Clerk/Technician', NULL, NULL),
(194, 195, 1, 'Entrepreneurship/Entrepreneurial Studies', NULL, NULL),
(195, 196, 1, 'Franchising and Franchise Operations', NULL, NULL),
(196, 197, 1, 'Small Business Administration/Management', NULL, NULL),
(197, 198, 1, 'Banking and Financial Support Services', NULL, NULL),
(198, 199, 1, 'Credit Management', NULL, NULL),
(199, 200, 1, 'Finance', NULL, NULL),
(200, 201, 1, 'Financial Planning and Services', NULL, NULL),
(201, 202, 1, 'International Finance', NULL, NULL),
(202, 203, 1, 'Investments and Securitie', NULL, NULL),
(203, 204, 1, 'Public Finance', NULL, NULL),
(204, 205, 1, 'Merchandising and Buying Operations', NULL, NULL),
(205, 206, 1, 'Retailing and Retail Operations', NULL, NULL),
(206, 207, 1, 'Sales, Distribution, and Marketing Operations', NULL, NULL),
(207, 208, 1, 'Selling Skills and Sales Operations', NULL, NULL),
(208, 209, 1, 'Hospitality Administration/Management', NULL, NULL),
(209, 210, 1, 'Hotel, Motel, and Restaurant Management', NULL, NULL),
(210, 211, 1, 'Hotel/Motel Administration/Management', NULL, NULL),
(211, 212, 1, 'Meeting and Event Planning', NULL, NULL),
(212, 213, 1, 'Resort Management', NULL, NULL),
(213, 215, 1, 'Restaurant/Food Services Management', NULL, NULL),
(214, 216, 1, 'Tourism and Travel Services Management', NULL, NULL),
(215, 217, 1, 'Human Resources Development', NULL, NULL),
(216, 218, 1, 'Human Resources Management/Personnel Administration', NULL, NULL),
(217, 219, 1, 'Labor and Industrial Relations', NULL, NULL),
(218, 220, 1, 'Labor Studies', NULL, NULL),
(219, 221, 1, 'Organizational Behavior Studies', NULL, NULL),
(220, 222, 1, 'International Business/Trade/Commerce', NULL, NULL),
(221, 223, 1, 'Information Resources Management', NULL, NULL),
(222, 224, 1, 'Knowledge Management', NULL, NULL),
(223, 225, 1, 'Management Information Systems', NULL, NULL),
(224, 226, 1, 'Actuarial Science', NULL, NULL),
(225, 227, 1, 'Business Statistics', NULL, NULL),
(226, 228, 1, 'Management Science', NULL, NULL),
(227, 229, 1, 'International Marketing', NULL, NULL),
(228, 230, 1, 'Marketing Research', NULL, NULL),
(229, 231, 1, 'Marketing/Marketing Management', NULL, NULL),
(230, 232, 1, 'Apparel and Accessories Marketing Operations', NULL, NULL),
(231, 233, 1, 'Auctioneering', NULL, NULL),
(232, 234, 1, 'Business and Personal/Financial Services Marketing Operation', NULL, NULL),
(233, 235, 1, 'Fashion Merchandising', NULL, NULL),
(234, 236, 1, 'Fashion Modeling', NULL, NULL),
(235, 237, 1, 'Hospitality and Recreation Marketing Operations', NULL, NULL),
(236, 238, 1, 'Special Products Marketing Operations', NULL, NULL),
(237, 239, 1, 'Tourism and Travel Services Marketing Operation', NULL, NULL),
(238, 240, 1, 'Tourism Promotion Operations', NULL, NULL),
(239, 241, 1, 'Vehicle and Vehicle Parts and Accessories Marketing Operations', NULL, NULL),
(240, 242, 1, 'Mass Communication/Media Studies', NULL, NULL),
(241, 243, 1, 'Speech Communication and Rhetoric', NULL, NULL),
(242, 244, 1, 'Broadcast Journalism', NULL, NULL),
(243, 245, 1, 'Journalism', NULL, NULL),
(244, 246, 1, 'Photojournalism', NULL, NULL),
(245, 247, 1, 'Advertising', NULL, NULL),
(246, 248, 1, 'Health Communication', NULL, NULL),
(247, 249, 1, 'Organizational Communication', NULL, NULL),
(248, 250, 1, 'Political Communication', NULL, NULL),
(249, 251, 1, 'Public Relations/Image Management', NULL, NULL),
(250, 252, 1, 'Sports Communication', NULL, NULL),
(251, 253, 1, 'Technical and Scientific Communication', NULL, NULL),
(252, 254, 1, 'Digital Communication and Media/Multimedia', NULL, NULL),
(253, 255, 1, 'Radio and Television', NULL, NULL),
(254, 256, 1, 'Photographic and Film/Video Technology/Technician and Assistant', NULL, NULL),
(255, 257, 1, 'Radio and Television Broadcasting Technology/Technician', NULL, NULL),
(256, 258, 1, 'Recording Arts Technology/Technician', NULL, NULL),
(257, 259, 1, 'Animation, Interactive Technology, Video Graphics and Special Effects', NULL, NULL),
(258, 260, 1, 'Computer Typography and Composition Equipment Operator', NULL, NULL),
(259, 261, 1, 'Graphic and Printing Equipment Operator Production', NULL, NULL),
(260, 262, 1, 'Graphic Communications', NULL, NULL),
(261, 263, 1, 'Platemaker/Imager', NULL, NULL),
(262, 264, 1, 'Prepress/Desktop Publishing and Digital Imaging Design', NULL, NULL),
(263, 265, 1, 'Printing Management', NULL, NULL),
(264, 266, 1, 'Printing Press Operator', NULL, NULL),
(265, 267, 1, 'Artificial Intelligence', NULL, NULL),
(266, 268, 1, 'Computer and Information Sciences', NULL, NULL),
(267, 269, 1, 'Informatics', NULL, NULL),
(268, 270, 1, 'Information Technology', NULL, NULL),
(269, 271, 1, 'Computer Programming, Specific Applications', NULL, NULL),
(270, 272, 1, 'Computer Programming, Vendor/Product Certification', NULL, NULL),
(271, 273, 1, 'Computer Programming/Programmer', NULL, NULL),
(272, 274, 1, 'Computer Graphics', NULL, NULL),
(273, 275, 1, 'Data Modeling/Warehousing and Database ', NULL, NULL),
(274, 276, 1, 'Administration', NULL, NULL),
(275, 277, 1, 'Modeling, Virtual Environments and Simulation', NULL, NULL),
(276, 278, 1, 'Web Page, Digital/Multimedia and Information Resources Design', NULL, NULL),
(277, 279, 1, 'Computer and Information Systems Security/Information Assurance', NULL, NULL),
(278, 280, 1, 'Computer Support Specialist', NULL, NULL),
(279, 281, 1, 'Information Technology Project Management', NULL, NULL),
(280, 282, 1, 'Network and System Administration/Administrator', NULL, NULL),
(281, 283, 1, 'System, Networking, and LAN/WAN ', NULL, NULL),
(282, 284, 1, 'Management/Manager', NULL, NULL),
(283, 285, 1, 'Web/Multimedia Management and Webmaster', NULL, NULL),
(284, 286, 1, 'Computer Engineering Technology/Technician', NULL, NULL),
(285, 287, 1, 'Computer Hardware Technology/Technician', NULL, NULL),
(286, 288, 1, 'Computer Software Technology/Technician', NULL, NULL),
(287, 289, 1, 'Computer Technology/Computer Systems Technology', NULL, NULL),
(288, 290, 1, 'Construction Engineering Technology/Technician', NULL, NULL),
(289, 291, 1, 'Architectural Drafting and Architectural CAD/CADD', NULL, NULL),
(290, 292, 1, 'CAD/CADD Drafting and/or Design Technology/Technician', NULL, NULL),
(291, 293, 1, 'Civil Drafting and Civil Engineering CAD/CADD', NULL, NULL),
(292, 294, 1, 'Drafting and Design Technology/Technician', NULL, NULL),
(293, 295, 1, 'Electrical/Electronics Drafting and Electrical/Electronics CAD/CADD', NULL, NULL),
(294, 296, 1, 'Mechanical Drafting and Mechanical Drafting CAD/CADD', NULL, NULL),
(295, 297, 1, 'Electrical, Electronic and Communications Engineering Technology/Technician', NULL, NULL),
(296, 298, 1, 'Integrated Circuit Design', NULL, NULL),
(297, 299, 1, 'Laser and Optical Technology/Technician', NULL, NULL),
(298, 300, 1, 'Telecommunications Technology/Technician', NULL, NULL),
(299, 301, 1, 'Automation Engineer Technology/Technician', NULL, NULL),
(300, 302, 1, 'Biomedical Technology/Technician', NULL, NULL),
(301, 303, 1, 'Electromechanical Technology/Electromechanical Engineering Technology', NULL, NULL),
(302, 304, 1, 'Instrumentation Technology/Technician', NULL, NULL),
(303, 305, 1, 'Robotics Technology/Technician', NULL, NULL),
(304, 306, 1, ' Energy Management and Systems Technology/Technician', NULL, NULL),
(305, 307, 1, 'Environmental Engineering Technology/Environmental Technology', NULL, NULL),
(306, 308, 1, 'Hazardous Materials Management and Waste Technology/Technician', NULL, NULL),
(307, 309, 1, 'Heating, Ventilation, Air Conditioning and Refrigeration Engineering Technology/Technician', NULL, NULL),
(308, 310, 1, 'Solar Energy Technology/Technician', NULL, NULL),
(309, 311, 1, 'Water Quality and Wastewater Treatment Management and Recycling Technology/Technician', NULL, NULL),
(310, 312, 1, 'Chemical Engineering Technology/Technician', NULL, NULL),
(311, 313, 1, ' Industrial Technology/Technician', NULL, NULL),
(312, 314, 1, 'Manufacturing Engineering Technology/Technician', NULL, NULL),
(313, 315, 1, 'Metallurgical Technology/Technician', NULL, NULL),
(314, 316, 1, 'Plastics and Polymer Engineering Technology/Technician', NULL, NULL),
(315, 317, 1, 'Semiconductor Manufacturing Technology', NULL, NULL),
(316, 318, 1, 'Welding Engineering Technology/Technician', NULL, NULL),
(317, 319, 1, 'Aeronautical/Aerospace Engineering Technology/Technician', NULL, NULL),
(318, 320, 1, 'Automotive Engineering Technology/Technician', NULL, NULL),
(319, 321, 1, 'Mechanical Engineering/Mechanical Technology/Technician', NULL, NULL),
(320, 322, 1, 'Mining Technology/Technician', NULL, NULL),
(321, 323, 1, 'Petroleum Technology/Technician', NULL, NULL),
(322, 324, 1, 'Hazardous Materials Information Systems Technology/Technician', NULL, NULL),
(323, 325, 1, 'Industrial Safety Technology/Technician', NULL, NULL),
(324, 326, 1, 'Occupational Safety and Health Technology/Technician', NULL, NULL),
(325, 327, 1, 'Quality Control Technology/Technician', NULL, NULL),
(326, 328, 1, 'Chemical and Biomolecular Engineering', NULL, NULL),
(327, 329, 1, 'Water Resources Engineering', NULL, NULL),
(328, 330, 1, 'Geotechnical and Geoenvironmental Engineering', NULL, NULL),
(329, 331, 1, 'Structural Engineering', NULL, NULL),
(330, 332, 1, 'Transportation and Highway Engineering', NULL, NULL),
(331, 333, 1, 'Computer Software Engineering', NULL, NULL),
(332, 334, 1, 'Computer Hardware Engineering', NULL, NULL),
(333, 335, 1, 'Electrical and Electronics Engineering', NULL, NULL),
(334, 336, 1, 'Laser and Optical Engineering', NULL, NULL),
(335, 337, 1, 'Telecommunications Engineering', NULL, NULL),
(336, 338, 1, 'American Literature (Canadian)', NULL, NULL),
(337, 339, 1, 'American Literature (United States)', NULL, NULL),
(338, 340, 1, 'Children\'s and Adolescent Literature', NULL, NULL),
(339, 341, 1, 'English Literature ', NULL, NULL),
(340, 342, 1, 'General Literature', NULL, NULL),
(341, 343, 1, 'Advanced General Dentistry', NULL, NULL),
(342, 344, 1, 'Dental Clinical Sciences', NULL, NULL),
(343, 345, 1, 'Dental Materials', NULL, NULL),
(344, 346, 1, 'Dental Public Health and Education', NULL, NULL),
(345, 347, 1, 'Endodontics/Endodontology', NULL, NULL),
(346, 348, 1, 'Oral Biology and Oral and Maxillofacial Pathology', NULL, NULL),
(347, 349, 1, 'Oral/Maxillofacial Surgery', NULL, NULL),
(348, 350, 1, 'Orthodontics/Orthodontology', NULL, NULL),
(349, 351, 1, 'Pediatric Dentistry/Pedodontics', NULL, NULL),
(350, 352, 1, 'Periodontics/Periodontology', NULL, NULL),
(351, 353, 1, 'Prosthodontics/Prosthodontology', NULL, NULL),
(352, 354, 1, 'Anesthesiologist Assistant', NULL, NULL),
(353, 355, 1, 'Chiropractic Assistant/Technician', NULL, NULL),
(354, 356, 1, 'Clinical/Medical Laboratory Assistant', NULL, NULL),
(355, 357, 1, 'Emergency Care Attendant', NULL, NULL),
(356, 358, 1, 'Lactation Consultant', NULL, NULL),
(357, 359, 1, 'Medical/Clinical Assistant', NULL, NULL),
(358, 360, 1, 'Occupational Therapist Assistant', NULL, NULL),
(359, 361, 1, 'Pathology/Pathologist Assistant', NULL, NULL),
(360, 362, 1, 'Pharmacy Technician/Assistant', NULL, NULL),
(361, 363, 1, 'Physical Therapy Technician/Assistant', NULL, NULL),
(362, 364, 1, 'Radiologist Assistant', NULL, NULL),
(363, 365, 1, 'Respiratory Therapy Technician/Assistant', NULL, NULL),
(364, 366, 1, 'Speech-Language Pathology Assistant', NULL, NULL),
(365, 367, 1, 'Veterinary/Animal Health Technology/Technician and Veterinary Assistant', NULL, NULL),
(366, 368, 1, 'Computational and Applied Mathematics', NULL, NULL),
(367, 369, 1, 'Computational Mathematics', NULL, NULL),
(368, 370, 1, 'Financial Mathematics', NULL, NULL),
(369, 371, 1, 'Mathematical Biology', NULL, NULL),
(370, 372, 1, 'Algebra and Number Theory', NULL, NULL),
(371, 373, 1, 'Analysis and Functional Analysis', NULL, NULL),
(372, 374, 1, 'Geometry/Geometric Analysis', NULL, NULL),
(373, 375, 1, 'Topology and Foundations', NULL, NULL),
(374, 376, 1, 'Analytical Chemistry', NULL, NULL),
(375, 377, 1, 'Chemical Physics', NULL, NULL),
(376, 378, 1, 'Environmental Chemistry', NULL, NULL),
(377, 379, 1, 'Forensic Chemistry', NULL, NULL),
(378, 380, 1, 'Inorganic Chemistry', NULL, NULL),
(379, 381, 1, 'Organic Chemistry', NULL, NULL),
(380, 382, 1, 'Physical Chemistry', NULL, NULL),
(381, 383, 1, 'Polymer Chemistry', NULL, NULL),
(382, 384, 1, 'Theoretical Chemistry', NULL, NULL),
(383, 385, 1, 'Acoustics', NULL, NULL),
(384, 386, 1, 'Atomic/Molecular Physics', NULL, NULL),
(385, 387, 1, 'Condensed Matter and Materials Physics', NULL, NULL),
(386, 388, 1, 'Elementary Particle Physics', NULL, NULL),
(387, 389, 1, 'Nuclear Physics', NULL, NULL),
(388, 390, 1, 'Optics/Optical Sciences', NULL, NULL),
(389, 391, 1, 'Plasma and High-Temperature Physics', NULL, NULL),
(390, 392, 1, 'Theoretical and Mathematical Physics', NULL, NULL),
(391, 393, 1, 'Cognitive Psychology and Psycholinguistics', NULL, NULL),
(392, 394, 1, 'Comparative Psychology', NULL, NULL),
(393, 395, 1, 'Developmental and Child Psychology', NULL, NULL),
(394, 396, 1, 'Personality Psychology', NULL, NULL),
(395, 397, 1, 'Physiological Psychology/Psychobiology', NULL, NULL),
(396, 398, 1, 'Psychometrics and Quantitative Psychology', NULL, NULL),
(397, 399, 1, 'Psychopharmacology', NULL, NULL),
(398, 400, 1, 'Social Psychology', NULL, NULL),
(399, 401, 1, 'Cultural Anthropology', NULL, NULL),
(400, 402, 1, 'Medical Anthropology', NULL, NULL),
(401, 403, 1, 'Physical and Biological Anthropology', NULL, NULL),
(402, 404, 1, 'Applied Economics', NULL, NULL),
(403, 405, 1, 'Development Economics and International Development', NULL, NULL),
(404, 406, 1, 'Econometrics and Quantitative Economics', NULL, NULL),
(405, 407, 1, 'International Economics', NULL, NULL),
(406, 408, 1, 'Commercial and Advertising Art', NULL, NULL),
(407, 409, 1, 'Commercial Photography', NULL, NULL),
(408, 410, 1, 'Design and Visual Communications', NULL, NULL),
(409, 411, 1, 'Fashion/Apparel Design', NULL, NULL),
(410, 412, 1, 'Game and Interactive Media Design', NULL, NULL),
(411, 413, 1, 'Graphic Design', NULL, NULL),
(412, 414, 1, 'Illustration', NULL, NULL),
(413, 415, 1, 'Industrial and Product Design', NULL, NULL),
(414, 416, 1, 'Interior Design', NULL, NULL),
(415, 417, 1, 'Acting', NULL, NULL),
(416, 418, 1, 'Costume Design', NULL, NULL),
(417, 419, 1, 'Directing and Theatrical Production', NULL, NULL),
(418, 420, 1, 'Drama and Dramatics/Theatre Arts', NULL, NULL),
(419, 421, 1, 'Musical Theatre', NULL, NULL),
(420, 422, 1, 'Playwriting and Screenwriting', NULL, NULL),
(421, 423, 1, 'Technical Theatre/Theatre Design and Technology', NULL, NULL),
(422, 424, 1, 'Theatre Literature, History and Criticism', NULL, NULL),
(423, 425, 1, 'Cinematography and Film/Video Production', NULL, NULL),
(424, 426, 1, 'Documentary Production', NULL, NULL),
(425, 427, 1, 'Film/Cinema/Video Studies', NULL, NULL),
(426, 428, 1, 'Photography', NULL, NULL),
(427, 429, 1, 'Art History, Criticism and Conservation', NULL, NULL),
(428, 430, 1, 'Art/Art Studies', NULL, NULL),
(429, 431, 1, 'Ceramic Arts and Ceramics', NULL, NULL),
(430, 432, 1, 'Drawing', NULL, NULL),
(431, 433, 1, 'Fiber, Textile and Weaving Arts', NULL, NULL),
(432, 434, 1, 'Intermedia/Multimedia', NULL, NULL),
(433, 435, 1, 'Metal and Jewelry Arts', NULL, NULL),
(434, 436, 1, 'Painting', NULL, NULL),
(435, 437, 1, 'Printmaking', NULL, NULL),
(436, 438, 1, 'Sculpture', NULL, NULL),
(437, 439, 1, 'Brass Instruments', NULL, NULL),
(438, 440, 1, 'Conducting', NULL, NULL),
(439, 441, 1, ' Jazz Studies', NULL, NULL),
(440, 442, 1, 'Keyboard Instruments', NULL, NULL),
(441, 443, 1, 'Music History, Literature, and Theory', NULL, NULL),
(442, 444, 1, 'Music Pedagogy', NULL, NULL),
(443, 445, 1, 'Music Performance', NULL, NULL),
(444, 446, 1, 'Music Technology', NULL, NULL),
(445, 447, 1, 'Music Theory and Composition', NULL, NULL),
(446, 448, 1, 'Musicology and Ethnomusicology', NULL, NULL),
(447, 449, 1, 'Percussion Instruments', NULL, NULL),
(448, 450, 1, 'Stringed Instruments', NULL, NULL),
(449, 451, 1, 'Voice and Opera', NULL, NULL),
(450, 452, 1, 'Woodwind Instruments', NULL, NULL),
(451, 453, 1, 'Retail Management', NULL, NULL),
(452, 454, 1, 'International and Intercultural Communication', NULL, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `mytable_11`
--

CREATE TABLE `mytable_11` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `nationalities`
--

CREATE TABLE `nationalities` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `nationalities`
--

INSERT INTO `nationalities` (`id`, `created_at`, `updated_at`) VALUES
(4, NULL, NULL),
(8, NULL, NULL),
(10, NULL, NULL),
(12, NULL, NULL),
(16, NULL, NULL),
(20, NULL, NULL),
(24, NULL, NULL),
(28, NULL, NULL),
(31, NULL, NULL),
(32, NULL, NULL),
(36, NULL, NULL),
(40, NULL, NULL),
(44, NULL, NULL),
(48, NULL, NULL),
(50, NULL, NULL),
(51, NULL, NULL),
(52, NULL, NULL),
(56, NULL, NULL),
(60, NULL, NULL),
(64, NULL, NULL),
(68, NULL, NULL),
(70, NULL, NULL),
(72, NULL, NULL),
(74, NULL, NULL),
(76, NULL, NULL),
(84, NULL, NULL),
(86, NULL, NULL),
(90, NULL, NULL),
(92, NULL, NULL),
(96, NULL, NULL),
(100, NULL, NULL),
(104, NULL, NULL),
(108, NULL, NULL),
(112, NULL, NULL),
(116, NULL, NULL),
(120, NULL, NULL),
(124, NULL, NULL),
(132, NULL, NULL),
(136, NULL, NULL),
(140, NULL, NULL),
(144, NULL, NULL),
(148, NULL, NULL),
(152, NULL, NULL),
(156, NULL, NULL),
(158, NULL, NULL),
(162, NULL, NULL),
(166, NULL, NULL),
(170, NULL, NULL),
(174, NULL, NULL),
(175, NULL, NULL),
(178, NULL, NULL),
(180, NULL, NULL),
(184, NULL, NULL),
(188, NULL, NULL),
(191, NULL, NULL),
(192, NULL, NULL),
(196, NULL, NULL),
(203, NULL, NULL),
(204, NULL, NULL),
(208, NULL, NULL),
(212, NULL, NULL),
(214, NULL, NULL),
(218, NULL, NULL),
(222, NULL, NULL),
(226, NULL, NULL),
(231, NULL, NULL),
(232, NULL, NULL),
(233, NULL, NULL),
(234, NULL, NULL),
(238, NULL, NULL),
(239, NULL, NULL),
(242, NULL, NULL),
(246, NULL, NULL),
(248, NULL, NULL),
(250, NULL, NULL),
(254, NULL, NULL),
(258, NULL, NULL),
(260, NULL, NULL),
(262, NULL, NULL),
(266, NULL, NULL),
(268, NULL, NULL),
(270, NULL, NULL),
(275, NULL, NULL),
(276, NULL, NULL),
(288, NULL, NULL),
(292, NULL, NULL),
(296, NULL, NULL),
(300, NULL, NULL),
(304, NULL, NULL),
(308, NULL, NULL),
(312, NULL, NULL),
(316, NULL, NULL),
(320, NULL, NULL),
(324, NULL, NULL),
(328, NULL, NULL),
(332, NULL, NULL),
(334, NULL, NULL),
(336, NULL, NULL),
(340, NULL, NULL),
(344, NULL, NULL),
(348, NULL, NULL),
(352, NULL, NULL),
(356, NULL, NULL),
(360, NULL, NULL),
(364, NULL, NULL),
(368, NULL, NULL),
(372, NULL, NULL),
(376, NULL, NULL),
(380, NULL, NULL),
(384, NULL, NULL),
(388, NULL, NULL),
(392, NULL, NULL),
(398, NULL, NULL),
(400, NULL, NULL),
(404, NULL, NULL),
(408, NULL, NULL),
(410, NULL, NULL),
(414, NULL, NULL),
(417, NULL, NULL),
(418, NULL, NULL),
(422, NULL, NULL),
(426, NULL, NULL),
(428, NULL, NULL),
(430, NULL, NULL),
(434, NULL, NULL),
(438, NULL, NULL),
(440, NULL, NULL),
(442, NULL, NULL),
(446, NULL, NULL),
(450, NULL, NULL),
(454, NULL, NULL),
(458, NULL, NULL),
(462, NULL, NULL),
(466, NULL, NULL),
(470, NULL, NULL),
(474, NULL, NULL),
(478, NULL, NULL),
(480, NULL, NULL),
(484, NULL, NULL),
(492, NULL, NULL),
(496, NULL, NULL),
(498, NULL, NULL),
(499, NULL, NULL),
(500, NULL, NULL),
(504, NULL, NULL),
(508, NULL, NULL),
(512, NULL, NULL),
(516, NULL, NULL),
(520, NULL, NULL),
(524, NULL, NULL),
(528, NULL, NULL),
(531, NULL, NULL),
(533, NULL, NULL),
(534, NULL, NULL),
(535, NULL, NULL),
(540, NULL, NULL),
(548, NULL, NULL),
(554, NULL, NULL),
(558, NULL, NULL),
(562, NULL, NULL),
(566, NULL, NULL),
(570, NULL, NULL),
(574, NULL, NULL),
(578, NULL, NULL),
(580, NULL, NULL),
(581, NULL, NULL),
(583, NULL, NULL),
(584, NULL, NULL),
(585, NULL, NULL),
(586, NULL, NULL),
(591, NULL, NULL),
(598, NULL, NULL),
(600, NULL, NULL),
(604, NULL, NULL),
(608, NULL, NULL),
(612, NULL, NULL),
(616, NULL, NULL),
(620, NULL, NULL),
(624, NULL, NULL),
(626, NULL, NULL),
(630, NULL, NULL),
(634, NULL, NULL),
(638, NULL, NULL),
(642, NULL, NULL),
(643, NULL, NULL),
(646, NULL, NULL),
(652, NULL, NULL),
(654, NULL, NULL),
(659, NULL, NULL),
(660, NULL, NULL),
(662, NULL, NULL),
(663, NULL, NULL),
(666, NULL, NULL),
(670, NULL, NULL),
(674, NULL, NULL),
(678, NULL, NULL),
(682, NULL, NULL),
(686, NULL, NULL),
(688, NULL, NULL),
(690, NULL, NULL),
(694, NULL, NULL),
(702, NULL, NULL),
(703, NULL, NULL),
(704, NULL, NULL),
(705, NULL, NULL),
(706, NULL, NULL),
(710, NULL, NULL),
(716, NULL, NULL),
(724, NULL, NULL),
(728, NULL, NULL),
(729, NULL, NULL),
(732, NULL, NULL),
(740, NULL, NULL),
(744, NULL, NULL),
(748, NULL, NULL),
(752, NULL, NULL),
(756, NULL, NULL),
(760, NULL, NULL),
(762, NULL, NULL),
(764, NULL, NULL),
(768, NULL, NULL),
(772, NULL, NULL),
(776, NULL, NULL),
(780, NULL, NULL),
(784, NULL, NULL),
(788, NULL, NULL),
(792, NULL, NULL),
(795, NULL, NULL),
(796, NULL, NULL),
(798, NULL, NULL),
(800, NULL, NULL),
(804, NULL, NULL),
(807, NULL, NULL),
(818, NULL, NULL),
(826, NULL, NULL),
(831, NULL, NULL),
(832, NULL, NULL),
(833, NULL, NULL),
(834, NULL, NULL),
(840, NULL, NULL),
(850, NULL, NULL),
(854, NULL, NULL),
(858, NULL, NULL),
(860, NULL, NULL),
(862, NULL, NULL),
(876, NULL, NULL),
(882, NULL, NULL),
(887, NULL, NULL),
(894, NULL, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `nationality_personal_information`
--

CREATE TABLE `nationality_personal_information` (
  `nationality_id` int(10) UNSIGNED NOT NULL,
  `personal_information_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `nationality_personal_information`
--

INSERT INTO `nationality_personal_information` (`nationality_id`, `personal_information_id`, `created_at`, `updated_at`) VALUES
(4, 34, NULL, NULL),
(4, 35, NULL, NULL),
(4, 36, NULL, NULL),
(8, 36, NULL, NULL),
(4, 37, NULL, NULL),
(4, 38, NULL, NULL),
(4, 39, NULL, NULL),
(4, 40, NULL, NULL),
(4, 41, NULL, NULL),
(4, 2, NULL, NULL),
(4, 3, NULL, NULL),
(8, 3, NULL, NULL),
(4, 4, NULL, NULL),
(8, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `nationality_translations`
--

CREATE TABLE `nationality_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `nationality_id` int(10) UNSIGNED DEFAULT NULL,
  `translated_languages_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `nationality_translations`
--

INSERT INTO `nationality_translations` (`id`, `nationality_id`, `translated_languages_id`, `name`) VALUES
(256, 4, 1, 'Afghan'),
(257, 8, 1, 'Albanian'),
(258, 10, 1, 'Antarctic'),
(259, 12, 1, 'Algerian'),
(260, 16, 1, 'American Samoan'),
(261, 20, 1, 'Andorran'),
(262, 24, 1, 'Angolan'),
(263, 28, 1, 'Antiguan or Barbudan'),
(264, 31, 1, 'Azerbaijani, Azeri'),
(265, 32, 1, 'Argentine'),
(266, 36, 1, 'Australian'),
(267, 40, 1, 'Austrian'),
(268, 44, 1, 'Bahamian'),
(269, 48, 1, 'Bahraini'),
(270, 50, 1, 'Bangladeshi'),
(271, 51, 1, 'Armenian'),
(272, 52, 1, 'Barbadian'),
(273, 56, 1, 'Belgian'),
(274, 60, 1, 'Bermudian, Bermudan'),
(275, 64, 1, 'Bhutanese'),
(276, 68, 1, 'Bolivian'),
(277, 70, 1, 'Bosnian or Herzegovinian'),
(278, 72, 1, 'Motswana, Botswanan'),
(279, 74, 1, 'Bouvet Island'),
(280, 76, 1, 'Brazilian'),
(281, 84, 1, 'Belizean'),
(282, 86, 1, 'BIOT'),
(283, 90, 1, 'Solomon Island'),
(284, 92, 1, 'British Virgin Island'),
(285, 96, 1, 'Bruneian'),
(286, 100, 1, 'Bulgarian'),
(287, 104, 1, 'Burmese'),
(288, 108, 1, 'Burundian'),
(289, 112, 1, 'Belarusian'),
(290, 116, 1, 'Cambodian'),
(291, 120, 1, 'Cameroonian'),
(292, 124, 1, 'Canadian'),
(293, 132, 1, 'Cabo Verdean'),
(294, 136, 1, 'Caymanian'),
(295, 140, 1, 'Central African'),
(296, 144, 1, 'Sri Lankan'),
(297, 148, 1, 'Chadian'),
(298, 152, 1, 'Chilean'),
(299, 156, 1, 'Chinese'),
(300, 158, 1, 'Chinese, Taiwanese'),
(301, 162, 1, 'Christmas Island'),
(302, 166, 1, 'Cocos Island'),
(303, 170, 1, 'Colombian'),
(304, 174, 1, 'Comoran, Comorian'),
(305, 175, 1, 'Mahoran'),
(306, 178, 1, 'Congolese'),
(307, 180, 1, 'Congolese'),
(308, 184, 1, 'Cook Island'),
(309, 188, 1, 'Costa Rican'),
(310, 191, 1, 'Croatian'),
(311, 192, 1, 'Cuban'),
(312, 196, 1, 'Cypriot'),
(313, 203, 1, 'Czech'),
(314, 204, 1, 'Beninese, Beninois'),
(315, 208, 1, 'Danish'),
(316, 212, 1, 'Dominican'),
(317, 214, 1, 'Dominican'),
(318, 218, 1, 'Ecuadorian'),
(319, 222, 1, 'Salvadoran'),
(320, 226, 1, 'Equatorial Guinean, Equatoguinean'),
(321, 231, 1, 'Ethiopian'),
(322, 232, 1, 'Eritrean'),
(323, 233, 1, 'Estonian'),
(324, 234, 1, 'Faroese'),
(325, 238, 1, 'Falkland Island'),
(326, 239, 1, 'South Georgia or South Sandwich Islands'),
(327, 242, 1, 'Fijian'),
(328, 246, 1, 'Finnish'),
(329, 248, 1, 'Åland Island'),
(330, 250, 1, 'French'),
(331, 254, 1, 'French Guianese'),
(332, 258, 1, 'French Polynesian'),
(333, 260, 1, 'French Southern Territories'),
(334, 262, 1, 'Djiboutian'),
(335, 266, 1, 'Gabonese'),
(336, 268, 1, 'Georgian'),
(337, 270, 1, 'Gambian'),
(338, 275, 1, 'Palestinian'),
(339, 276, 1, 'German'),
(340, 288, 1, 'Ghanaian'),
(341, 292, 1, 'Gibraltar'),
(342, 296, 1, 'I-Kiribati'),
(343, 300, 1, 'Greek, Hellenic'),
(344, 304, 1, 'Greenlandic'),
(345, 308, 1, 'Grenadian'),
(346, 312, 1, 'Guadeloupe'),
(347, 316, 1, 'Guamanian, Guambat'),
(348, 320, 1, 'Guatemalan'),
(349, 324, 1, 'Guinean'),
(350, 328, 1, 'Guyanese'),
(351, 332, 1, 'Haitian'),
(352, 334, 1, 'Heard Island or McDonald Islands'),
(353, 336, 1, 'Vatican'),
(354, 340, 1, 'Honduran'),
(355, 344, 1, 'Hong Kong, Hong Kongese'),
(356, 348, 1, 'Hungarian, Magyar'),
(357, 352, 1, 'Icelandic'),
(358, 356, 1, 'Indian'),
(359, 360, 1, 'Indonesian'),
(360, 364, 1, 'Iranian, Persian'),
(361, 368, 1, 'Iraqi'),
(362, 372, 1, 'Irish'),
(363, 376, 1, 'palestinian'),
(364, 380, 1, 'Italian'),
(365, 384, 1, 'Ivorian'),
(366, 388, 1, 'Jamaican'),
(367, 392, 1, 'Japanese'),
(368, 398, 1, 'Kazakhstani, Kazakh'),
(369, 400, 1, 'Jordanian'),
(370, 404, 1, 'Kenyan'),
(371, 408, 1, 'North Korean'),
(372, 410, 1, 'South Korean'),
(373, 414, 1, 'Kuwaiti'),
(374, 417, 1, 'Kyrgyzstani, Kyrgyz, Kirgiz, Kirghiz'),
(375, 418, 1, 'Lao, Laotian'),
(376, 422, 1, 'Lebanese'),
(377, 426, 1, 'Basotho'),
(378, 428, 1, 'Latvian'),
(379, 430, 1, 'Liberian'),
(380, 434, 1, 'Libyan'),
(381, 438, 1, 'Liechtenstein'),
(382, 440, 1, 'Lithuanian'),
(383, 442, 1, 'Luxembourg, Luxembourgish'),
(384, 446, 1, 'Macanese, Chinese'),
(385, 450, 1, 'Malagasy'),
(386, 454, 1, 'Malawian'),
(387, 458, 1, 'Malaysian'),
(388, 462, 1, 'Maldivian'),
(389, 466, 1, 'Malian, Malinese'),
(390, 470, 1, 'Maltese'),
(391, 474, 1, 'Martiniquais, Martinican'),
(392, 478, 1, 'Mauritanian'),
(393, 480, 1, 'Mauritian'),
(394, 484, 1, 'Mexican'),
(395, 492, 1, 'Monégasque, Monacan'),
(396, 496, 1, 'Mongolian'),
(397, 498, 1, 'Moldovan'),
(398, 499, 1, 'Montenegrin'),
(399, 500, 1, 'Montserratian'),
(400, 504, 1, 'Moroccan'),
(401, 508, 1, 'Mozambican'),
(402, 512, 1, 'Omani'),
(403, 516, 1, 'Namibian'),
(404, 520, 1, 'Nauruan'),
(405, 524, 1, 'Nepali, Nepalese'),
(406, 528, 1, 'Dutch, Netherlandic'),
(407, 531, 1, 'Curaçaoan'),
(408, 533, 1, 'Aruban'),
(409, 534, 1, 'Sint Maarten'),
(410, 535, 1, 'Bonaire'),
(411, 540, 1, 'New Caledonian'),
(412, 548, 1, 'Ni-Vanuatu, Vanuatuan'),
(413, 554, 1, 'New Zealand, NZ'),
(414, 558, 1, 'Nicaraguan'),
(415, 562, 1, 'Nigerien'),
(416, 566, 1, 'Nigerian'),
(417, 570, 1, 'Niuean'),
(418, 574, 1, 'Norfolk Island'),
(419, 578, 1, 'Norwegian'),
(420, 580, 1, 'Northern Marianan'),
(421, 581, 1, 'American'),
(422, 583, 1, 'Micronesian'),
(423, 584, 1, 'Marshallese'),
(424, 585, 1, 'Palauan'),
(425, 586, 1, 'Pakistani'),
(426, 591, 1, 'Panamanian'),
(427, 598, 1, 'Papua New Guinean, Papuan'),
(428, 600, 1, 'Paraguayan'),
(429, 604, 1, 'Peruvian'),
(430, 608, 1, 'Philippine, Filipino'),
(431, 612, 1, 'Pitcairn Island'),
(432, 616, 1, 'Polish'),
(433, 620, 1, 'Portuguese'),
(434, 624, 1, 'Bissau-Guinean'),
(435, 626, 1, 'Timorese'),
(436, 630, 1, 'Puerto Rican'),
(437, 634, 1, 'Qatari'),
(438, 638, 1, 'Réunionese, Réunionnais'),
(439, 642, 1, 'Romanian'),
(440, 643, 1, 'Russian'),
(441, 646, 1, 'Rwandan'),
(442, 652, 1, 'Barthélemois'),
(443, 654, 1, 'Saint Helenian'),
(444, 659, 1, 'Kittitian or Nevisian'),
(445, 660, 1, 'Anguillan'),
(446, 662, 1, 'Saint Lucian'),
(447, 663, 1, 'Saint-Martinoise'),
(448, 666, 1, 'Saint-Pierrais or Miquelonnais'),
(449, 670, 1, 'Saint Vincentian, Vincentian'),
(450, 674, 1, 'Sammarinese'),
(451, 678, 1, 'São Toméan'),
(452, 682, 1, 'Saudi Arabian'),
(453, 686, 1, 'Senegalese'),
(454, 688, 1, 'Serbian'),
(455, 690, 1, 'Seychellois'),
(456, 694, 1, 'Sierra Leonean'),
(457, 702, 1, 'Singaporean'),
(458, 703, 1, 'Slovak'),
(459, 704, 1, 'Vietnamese'),
(460, 705, 1, 'Slovenian, Slovene'),
(461, 706, 1, 'Somali, Somalian'),
(462, 710, 1, 'South African'),
(463, 716, 1, 'Zimbabwean'),
(464, 724, 1, 'Spanish'),
(465, 728, 1, 'South Sudanese'),
(466, 729, 1, 'Sudanese'),
(467, 732, 1, 'Sahrawi, Sahrawian, Sahraouian'),
(468, 740, 1, 'Surinamese'),
(469, 744, 1, 'Svalbard'),
(470, 748, 1, 'Swazi'),
(471, 752, 1, 'Swedish'),
(472, 756, 1, 'Swiss'),
(473, 760, 1, 'Syrian'),
(474, 762, 1, 'Tajikistani'),
(475, 764, 1, 'Thai'),
(476, 768, 1, 'Togolese'),
(477, 772, 1, 'Tokelauan'),
(478, 776, 1, 'Tongan'),
(479, 780, 1, 'Trinidadian or Tobagonian'),
(480, 784, 1, 'Emirati, Emirian, Emiri'),
(481, 788, 1, 'Tunisian'),
(482, 792, 1, 'Turkish'),
(483, 795, 1, 'Turkmen'),
(484, 796, 1, 'Turks and Caicos Island'),
(485, 798, 1, 'Tuvaluan'),
(486, 800, 1, 'Ugandan'),
(487, 804, 1, 'Ukrainian'),
(488, 807, 1, 'Macedonian'),
(489, 818, 1, 'Egyptian'),
(490, 826, 1, 'British, UK'),
(491, 831, 1, 'Channel Island'),
(492, 832, 1, 'Channel Island'),
(493, 833, 1, 'Manx'),
(494, 834, 1, 'Tanzanian'),
(495, 840, 1, 'American'),
(496, 850, 1, 'U.S. Virgin Island'),
(497, 854, 1, 'Burkinabé'),
(498, 858, 1, 'Uruguayan'),
(499, 860, 1, 'Uzbekistani, Uzbek'),
(500, 862, 1, 'Venezuelan'),
(501, 876, 1, 'Wallis and Futuna, Wallisian or Futunan'),
(502, 882, 1, 'Samoan'),
(503, 887, 1, 'Yemeni'),
(504, 894, 1, 'Zambian'),
(511, 4, 2, 'أفغان'),
(512, 760, 2, 'سورية'),
(513, 8, 2, 'ألبانية'),
(514, 12, 2, 'جزائرية'),
(515, 10, 2, 'إنتاركتيكا '),
(516, 16, 2, 'ساموا الأمريكية'),
(517, 20, 2, 'أندورا'),
(518, 24, 2, 'أنغولية'),
(519, 28, 2, 'أنتيغوا وبربودان'),
(520, 31, 2, 'الأذرية الأذربيجانية'),
(521, 32, 2, 'الأرجنتينة '),
(522, 36, 2, 'الأسترالية'),
(523, 44, 2, 'الباهامية'),
(524, 48, 2, 'البحرينية'),
(525, 50, 2, 'البنغالية'),
(526, 51, 2, 'الأرمينية'),
(527, 52, 2, 'الباربادوسية'),
(528, 56, 2, 'البلجيكية'),
(529, 60, 2, 'البارموديانية'),
(530, 64, 2, 'البوتانية'),
(531, 68, 2, 'البوليفية'),
(532, 70, 2, 'البوسنية والهيزروفونية'),
(533, 72, 2, 'الموتسوانية والبوتسوانانية'),
(534, 74, 2, 'جزيرة بوفيت'),
(535, 76, 2, 'البرازيلية'),
(536, 84, 2, 'البليزية'),
(537, 86, 2, 'بيوت'),
(538, 90, 2, 'جزيرة سليمان'),
(539, 92, 2, 'جزيرة فيرجن البريطانية '),
(540, 96, 2, 'البرناوية'),
(541, 100, 2, 'البلغارية'),
(542, 104, 2, 'البورمية'),
(543, 108, 2, 'البوروندية'),
(544, 112, 2, 'البيلاروسية'),
(545, 116, 2, 'المكبودية'),
(546, 120, 2, 'الكاميرونية'),
(547, 124, 2, 'الكندية'),
(548, 132, 2, 'الكابوفيرديانية'),
(549, 136, 2, 'الكايمانية'),
(550, 140, 2, 'إفريقيا الوسطى'),
(551, 144, 2, 'السيرلانكية'),
(552, 148, 2, 'التشادية'),
(553, 152, 2, 'التشيلية'),
(554, 156, 2, 'الصينية'),
(555, 158, 2, 'الصينية والتايوانية'),
(556, 162, 2, 'جزيرة الكريسماس'),
(557, 166, 2, 'جزيرة كوكوس'),
(558, 170, 2, 'الكولومبية'),
(559, 175, 2, 'المايوتية'),
(560, 178, 2, 'الكونغولية'),
(561, 180, 2, 'الكونغولية'),
(562, 184, 2, 'جزيرة كوك'),
(563, 188, 2, 'الكوستاريكية'),
(564, 191, 2, 'الكرواتية'),
(565, 192, 2, 'الكوبية'),
(566, 196, 2, 'القبرصية'),
(567, 203, 2, 'التشيكية'),
(568, 204, 2, 'البنينة والبنوينية'),
(569, 208, 2, 'الدنماركية'),
(570, 212, 2, 'الدومينيكية'),
(571, 214, 2, 'الدومينيكية'),
(572, 218, 2, 'الإكوادورية'),
(573, 222, 2, 'السلفادورية'),
(574, 226, 2, 'غينيا الإستوائية'),
(575, 231, 2, 'الحبشية'),
(576, 233, 2, 'الإستونية'),
(577, 234, 2, 'جزر فارو'),
(578, 238, 2, 'جزيرة فوكلاند'),
(579, 239, 2, 'جورحيا الجنوبية '),
(580, 242, 2, 'الفيجية'),
(581, 246, 2, 'الفنلندية'),
(582, 248, 2, 'جزيرة أولاند'),
(583, 250, 2, 'الفرنسية'),
(584, 254, 2, 'الجويانية الفرنسية '),
(585, 258, 2, 'البولينيزية الفرنسية'),
(586, 260, 2, 'المناطق الجنوبية لفرنسا'),
(587, 262, 2, 'الجيبوتية'),
(588, 266, 2, 'الجابونية'),
(589, 268, 2, 'الجورجية'),
(590, 270, 2, 'الغامبية'),
(591, 275, 2, 'الفلسطينية '),
(592, 276, 2, 'الألمانية'),
(593, 288, 2, 'الغانية'),
(594, 292, 2, 'جبل طارق'),
(595, 296, 2, 'الكيريباتية'),
(596, 300, 2, 'اليونانية والهلينية'),
(597, 304, 2, 'غرينلاند'),
(598, 308, 2, 'جرينادا'),
(599, 312, 2, 'جوادلوب'),
(600, 316, 2, 'الغوامانية '),
(601, 320, 2, 'الغواتيمالية'),
(602, 324, 2, 'الغينية'),
(603, 328, 2, 'الغيانية'),
(604, 332, 2, 'الهايتية'),
(605, 334, 2, 'جزيرةهيردأوجزرمالكدونالد'),
(606, 336, 2, 'الفاتيكان'),
(607, 340, 2, 'الهندوراسية'),
(608, 344, 2, 'هونج كونج'),
(609, 340, 2, 'هندوراس'),
(610, 348, 2, 'المجرية'),
(611, 352, 2, 'الأيسلندية'),
(612, 356, 2, 'الهندية'),
(613, 360, 2, 'الإندونيسية'),
(614, 364, 2, 'الإيرانية'),
(615, 368, 2, 'العراقية'),
(616, 372, 2, 'الإيرلندية'),
(617, 376, 2, 'الفلسطينية');

-- --------------------------------------------------------

--
-- بنية الجدول `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('08ee2cdc690816dab6a0e50a8ffc8970921262598e7b28b697051ecf5458ffd186c20d52bcd32b2e', NULL, 3, NULL, '[]', 0, '2019-10-03 06:11:50', '2019-10-03 06:11:50', '2020-10-03 09:11:50'),
('181dc780ab3452242fc7a6cc5d3e124318313230b5088081c555c81069165a33a98eecf8da93bd7c', 32, 6, 'MyApp', '[\"*\"]', 0, '2019-11-26 05:36:21', '2019-11-26 05:36:21', '2020-11-26 07:36:21'),
('20175197ac1c97549d89b13a44707cb81ec65cf708b87a177c553328218b85986c3d59da0745a981', 32, 6, 'MyApp', '[\"user\"]', 0, '2019-10-09 15:43:43', '2019-10-09 15:43:43', '2020-10-09 18:43:43'),
('211a134d205df022abb3ebccd504b62831cf44647d72da538ecd1c8c4c3ed8b02f6055bbef191b93', 7, 6, 'MyApp', '[\"employeer\"]', 0, '2019-10-19 09:13:24', '2019-10-19 09:13:24', '2020-10-19 12:13:24'),
('22f156fea2b529ceae55a625f64f0d66b03ed7ae65a8fb7d7e915458a511a0e46160487d453336c6', 7, 6, 'MyApp', '[\"employeer\"]', 0, '2019-10-19 09:15:34', '2019-10-19 09:15:34', '2020-10-19 12:15:34'),
('28cbd2f0bce894b7befb09976f6914aa8fb26a06436a5c464eb3b2667a8a56af0672734dafc3abde', 19, 6, 'MyApp', '[\"*\"]', 0, '2019-10-20 03:55:01', '2019-10-20 03:55:01', '2020-10-20 06:55:01'),
('292edc07b97517c8f325b2d13f957d72542fe91bb9dbbd48761d2fa51686808585a63332dcc1a11c', 25, 6, 'MyApp', '[\"*\"]', 0, '2019-10-20 04:00:27', '2019-10-20 04:00:27', '2020-10-20 07:00:27'),
('2e43cd375cd85e06a0ac5006258bd6d5eada89caf5433d5f7606b3de9451a039502cb4b9f5f45dc5', 22, 6, 'MyApp', '[\"*\"]', 0, '2019-10-20 03:57:22', '2019-10-20 03:57:22', '2020-10-20 06:57:22'),
('31ff12c0020191378126d544b429479d7aa8e0c3fce952c1347cdc167ef4c440ce745ac5fa3db37e', 28, 6, 'MyApp', '[\"*\"]', 0, '2019-10-20 05:00:10', '2019-10-20 05:00:10', '2020-10-20 08:00:10'),
('32e0870ea8d0bc53ebcb8aedc5bf72e2887ebe24a4e4f61a8f9511fa6a30c1a5d8cf58e59a1f8449', 33, 6, 'MyApp', '[\"*\"]', 0, '2019-12-10 08:37:27', '2019-12-10 08:37:27', '2020-12-10 10:37:27'),
('37cd13755d5fc21d9b5e29ea33d90d6324489f1c522cd44a7b5f84f468f75ed6112ae8282130e01c', 8, 6, 'MyApp', '[\"*\"]', 0, '2019-10-20 03:46:56', '2019-10-20 03:46:56', '2020-10-20 06:46:56'),
('3b04b311a30cdc85c2f19e1dca1232cce73790073927ced209e4521a36468778bd2c5647c256e3fc', 3, 6, 'MyApp', '[\"user\"]', 0, '2019-10-17 06:40:28', '2019-10-17 06:40:28', '2020-10-17 09:40:28'),
('3b288c6e04ea47a6494f6a3c44ef934146abc89abb7437a5acfb84f56a21736ceb846fdf999270fa', 7, 6, 'MyApp', '[\"user\"]', 0, '2019-10-19 08:59:21', '2019-10-19 08:59:21', '2020-10-19 11:59:21'),
('41eed7e4651ec774e40cdb110eb648da66b6f405c9fd4ccc72c1c5b5974649f319e995afa3491131', 7, 6, 'MyApp', '[\"user\"]', 0, '2019-10-19 09:11:53', '2019-10-19 09:11:53', '2020-10-19 12:11:53'),
('49116477a500f77caf74f426f71fe6419eee5a37d9c609d19a9384c7668ef3010d95aa6a9c342aaa', 27, 6, 'MyApp', '[\"user\"]', 0, '2019-10-05 07:33:35', '2019-10-05 07:33:35', '2020-10-05 10:33:35'),
('4f8fe454b41a036d6894650d4caf6b223c1be7d6b3fe41ae422d0cda27a28d143482cb028ba80c90', 1, 6, 'MyApp', '[\"user\"]', 0, '2019-10-11 15:53:00', '2019-10-11 15:53:00', '2020-10-11 18:53:00'),
('563fca1c31b46dd9f228465494a7297a7acd868ae6a9d402ed0545385bf6837d0ac1f5df7f356e03', NULL, 3, NULL, '[]', 0, '2019-10-03 06:19:14', '2019-10-03 06:19:14', '2020-10-03 09:19:14'),
('691c66a7b0c3be9230bb9b3c8e867faca15be64085fa5ca1d103e170bbe44e17a67976ea84a9fc94', 7, 6, 'MyApp', '[\"user\"]', 0, '2019-10-20 03:35:01', '2019-10-20 03:35:01', '2020-10-20 06:35:01'),
('6b40213a1dd758de1481a0cfc8b5f8b4c8db2df7950de740315c6770bd4a480518d497aaa2b1c2ab', 27, 6, 'MyApp', '[\"user\"]', 0, '2019-10-20 04:03:05', '2019-10-20 04:03:05', '2020-10-20 07:03:05'),
('6c95bba80181fde74ba59cbae9a06119240b1c25ced9e8a936c1bb165dc08e78ecc6a0c1cb5a5f54', 6, 6, 'MyApp', '[\"user\",\"employeer\"]', 0, '2019-10-19 08:52:06', '2019-10-19 08:52:06', '2020-10-19 11:52:06'),
('775d5e2214f5fc817529aab49be9aa7332662b606c5eecda6a20ffcca48aacfab5253c95d347a525', 1, 6, 'MyApp', '[\"user\"]', 0, '2019-10-11 16:07:59', '2019-10-11 16:07:59', '2020-10-11 19:07:59'),
('7b139a9911d93d1972d3a0250eec0ec7e8cb4291903b97f0cd1e3835c12710aece5b7f35ac44e7e6', 33, 6, 'MyApp', '[\"admin\"]', 0, '2019-12-10 17:16:09', '2019-12-10 17:16:09', '2020-12-10 19:16:09'),
('90a6670e89769982148ebb6a84639aef071493ae1af2496c01f5a8f41da1156825603dce50529575', 26, 6, 'MyApp', '[\"*\"]', 0, '2019-10-20 04:01:14', '2019-10-20 04:01:14', '2020-10-20 07:01:14'),
('96dc1f4b732d1881e477066a726f1a8c38bbfaeee471c865696f22185e70323f5d9a712fa28f8feb', 29, 6, 'MyApp', '[\"*\"]', 0, '2019-11-13 07:08:49', '2019-11-13 07:08:49', '2020-11-13 09:08:49'),
('9daf97d13dd06efb54a6470b71c4e86d0de8947f495d1bd0c54225646cfe027b1f9c41884ccb22b4', 7, 6, 'MyApp', '[\"user\"]', 0, '2019-10-20 03:19:01', '2019-10-20 03:19:01', '2020-10-20 06:19:01'),
('9ee6b999d57783e84f6fd12acaad23667f6dfbcf9e36c0fdfbddec47f0d43c52d53776243c7688b7', NULL, 3, NULL, '[]', 0, '2019-10-03 19:08:32', '2019-10-03 19:08:32', '2020-10-03 22:08:32'),
('a4528979c3399996db08b6dfdef0866aa04c750b51175b7a8942c75a818e24050d41a3863d573683', 23, 6, 'MyApp', '[\"*\"]', 0, '2019-10-20 03:58:38', '2019-10-20 03:58:38', '2020-10-20 06:58:38'),
('a503c77e2a942ba7729f58036c26ea85bb16230f4416151eae20d37895ceab501ec1d73d3462324d', 33, 6, 'MyApp', '[\"user\"]', 0, '2019-10-09 15:49:39', '2019-10-09 15:49:39', '2020-10-09 18:49:39'),
('a5426cd1632486dd1416b78ffda4f02f063260275ee8e522a0600bddebfa186157aceaf564f6eee5', 33, 6, 'MyApp', '[\"admin\"]', 0, '2019-12-10 17:15:25', '2019-12-10 17:15:25', '2020-12-10 19:15:25'),
('a5d143928cea086989720fcdbca41502e61931defa05b3b0f974584ddfc0eeb4f00cdabab60e8acb', 35, 6, 'MyApp', '[\"user\"]', 0, '2019-10-11 04:11:19', '2019-10-11 04:11:19', '2020-10-11 07:11:19'),
('a62bc8fba67bbd2feac49d4fbc05eeb08e26424bc079e0b8e6151a0d99a2cb852ef9efdf8010de2f', 26, 6, 'MyApp', '[\"employeer\"]', 0, '2019-10-05 07:32:08', '2019-10-05 07:32:08', '2020-10-05 10:32:08'),
('a8df639f7ff5a2287ce7037208044b08ca4d4e0e55bcbd1b81913cc5c9fc299d88789eec8eb42da3', 24, 6, 'MyApp', '[\"*\"]', 0, '2019-10-20 03:59:18', '2019-10-20 03:59:18', '2020-10-20 06:59:18'),
('aa67740f26b4a8db2abd7675424b601809cbea4bfa06a3f4837048c4e25431be3fc883851fff4811', 36, 6, 'MyApp', '[\"user\"]', 0, '2019-10-11 07:31:23', '2019-10-11 07:31:23', '2020-10-11 10:31:23'),
('aa8dfb2ac0f4572ac851c7e6d88bd52214b8caee89cde4f27b0631eb03aa875ba0e18ecd6e2bee90', 1, 6, 'MyApp', '[\"employeer\"]', 0, '2019-10-11 17:11:24', '2019-10-11 17:11:24', '2020-10-11 20:11:24'),
('b176489e14284e160e9e35c134390b87ada7c7b59d448a0427330e49812c831e808f7765da7b5394', 4, 6, 'MyApp', '[\"user\"]', 0, '2019-10-19 05:37:35', '2019-10-19 05:37:35', '2020-10-19 08:37:35'),
('b335dced797ca4f9317198aba2aa2be11512a18c6ba81d5462be423a12c91fe387d1dfe7f397eaef', NULL, 3, NULL, '[]', 0, '2019-10-04 04:41:10', '2019-10-04 04:41:10', '2020-10-04 07:41:10'),
('bd598e3fd446adb60dd2394513c33c503790c0fb1dd54b603fb836a84938d5e665f82326af9e628f', 1, 6, 'MyApp', '[\"employeer\"]', 0, '2019-10-11 17:33:36', '2019-10-11 17:33:36', '2020-10-11 20:33:36'),
('bf17adfe3b1bd9b57dc2d73bc4a3b5ab1993e37b2d9be29cbfb4547510b953b25170550c351f49bc', 1, 6, 'MyApp', '[\"employeer\"]', 0, '2019-10-11 16:09:36', '2019-10-11 16:09:36', '2020-10-11 19:09:36'),
('c5c492b3de0c74b96407e2c0ca28e075a2601dc8f0091d2a03aba77df6fd7af5edd65129cc7d80d6', 7, 6, 'MyApp', '[\"employeer\"]', 0, '2019-10-19 09:18:27', '2019-10-19 09:18:27', '2020-10-19 12:18:27'),
('c67ddb30780d20326fbce53bbe4fae55f10a3f50ee28495f7047b6b1011f3c7a1e97537bf096ef8b', 24, 6, 'MyApp', '[]', 0, '2019-10-05 03:58:18', '2019-10-05 03:58:18', '2020-10-05 06:58:18'),
('c82adc43c15f259c574f1780a87f79f9441b44ef135cf7ccdfe52f3b21d516c91e982b99b7c4f1bc', NULL, 3, NULL, '[]', 0, '2019-10-03 06:21:21', '2019-10-03 06:21:21', '2020-10-03 09:21:21'),
('d0f61f57bceb68847b1fcc189c0ffd79a2f2fd95617641f102f7f8a29802379a674964ba79eee30b', 2, 6, 'MyApp', '[\"user\"]', 0, '2019-10-15 15:52:31', '2019-10-15 15:52:31', '2020-10-15 18:52:31'),
('d394b5743dec63bde6072b9268c13a17f7cfa40129d4671594d645e488845ef01f413fceda035bf6', 30, 6, 'MyApp', '[\"*\"]', 0, '2019-11-13 07:09:03', '2019-11-13 07:09:03', '2020-11-13 09:09:03'),
('d91dc0635643303faf33714bcc11101d735f5338f5fbe83066ff05860b3a62f4d86eae5289576b44', 7, 6, 'MyApp', '[\"user\"]', 0, '2019-10-19 09:18:55', '2019-10-19 09:18:55', '2020-10-19 12:18:55'),
('dad9a33af290784b78fe4c185f58051c2726d61bd17585ce6e80b9098575ab34b3d82fc97f7d58c7', 25, 6, 'MyApp', '[\"*\"]', 0, '2019-10-05 04:51:58', '2019-10-05 04:51:58', '2020-10-05 07:51:58'),
('db1a32ed65752e417b553da4eed74fda7afb8bb105240e73e4df31dd64c5457dab8ba170a06e238f', 1, 6, 'MyApp', '[\"employeer\"]', 0, '2019-10-11 17:34:32', '2019-10-11 17:34:32', '2020-10-11 20:34:32'),
('efcc0af00d598fe628911997468018f7bc8d5e9ffdc47df948e5f32b7116b6e0733d7f2c18c319a2', 30, 6, 'MyApp', '[\"user\"]', 0, '2019-10-09 04:17:16', '2019-10-09 04:17:16', '2020-10-09 07:17:16'),
('f10fc844fc0cc786e7aab93f0e87543e10d4c7afa4dbffcb786a2caced58b30aa9ac8d9f20052977', 31, 6, 'MyApp', '[\"*\"]', 0, '2019-11-16 09:48:36', '2019-11-16 09:48:36', '2020-11-16 11:48:36'),
('f67d6ea8eff5da1a0174feae874ac0e2bd7e332d4e83e549bad096700c2eceabf005ac62cb5782c1', 1, 6, 'MyApp', '[\"employeer\"]', 0, '2019-10-11 17:34:00', '2019-10-11 17:34:00', '2020-10-11 20:34:00');

-- --------------------------------------------------------

--
-- بنية الجدول `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'Lspw3K4sVQm0F6a1wtN1la2cOfrYlp7GEtCGpcM5', 'http://localhost', 1, 0, 0, '2019-10-03 03:20:20', '2019-10-03 03:20:20'),
(2, NULL, 'Laravel Password Grant Client', 'L9p0BctqlvWUlGLHJie1GPs16nMVsd8lZSTXK3MO', 'http://localhost', 0, 1, 0, '2019-10-03 03:20:20', '2019-10-03 03:20:20'),
(3, 0, 'clientyaser', '3BAFuDcuGxrCPs48QRp6OSzsMzFUkF2t1btS8syF', 'http://localhost/auth/callback', 0, 0, 0, '2019-10-03 05:52:10', '2019-10-03 05:52:10'),
(4, NULL, 'Laravel Personal Access Client', 'fw77Oxs5UA2PjUYQ1j2ulV4ivkIDiKqUjTehR9UQ', 'http://localhost', 1, 0, 0, '2019-10-03 19:06:57', '2019-10-03 19:06:57'),
(5, NULL, 'Laravel Password Grant Client', 'Yn9eK1L05lfqUAx5gJOBmx724JkqDRRRlWmQefwD', 'http://localhost', 0, 1, 0, '2019-10-03 19:06:57', '2019-10-03 19:06:57'),
(6, NULL, 'Laravel Personal Access Client', 'IgIzoFdMJ9gkZwzNeyxpPF2h1RbTJN5EEk4N1Ujq', 'http://localhost', 1, 0, 0, '2019-10-05 02:51:31', '2019-10-05 02:51:31'),
(7, NULL, 'Laravel Password Grant Client', 'MIR2NUC80xIDk1HqA8lz7OtQADOc0lXltWokXkBu', 'http://localhost', 0, 1, 0, '2019-10-05 02:51:31', '2019-10-05 02:51:31'),
(8, 11, 'test', 'xjiOZx4WVjI378nTklgk5vSMVlW2BEod5Jwf8fPP', 'http://localhost/auth/callback', 0, 0, 0, '2019-10-09 15:50:00', '2019-10-09 15:50:00');

-- --------------------------------------------------------

--
-- بنية الجدول `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-10-03 03:20:20', '2019-10-03 03:20:20'),
(2, 4, '2019-10-03 19:06:57', '2019-10-03 19:06:57'),
(3, 6, '2019-10-05 02:51:31', '2019-10-05 02:51:31');

-- --------------------------------------------------------

--
-- بنية الجدول `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `personal_informations`
--

CREATE TABLE `personal_informations` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_picture` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resume_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `resume_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `marital_status_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `personal_informations`
--

INSERT INTO `personal_informations` (`id`, `first_name`, `middle_name`, `last_name`, `profile_picture`, `resume_title`, `gender`, `date_of_birth`, `resume_id`, `created_at`, `updated_at`, `marital_status_id`) VALUES
(2, 'dania', NULL, 'khamis', NULL, NULL, 'female', '2014-04-16', 1, '2019-05-19 05:13:50', '2019-06-24 17:40:26', 1),
(4, 'dania', NULL, 'kh', NULL, NULL, 'female', '2014-04-16', 2, '2019-07-09 03:39:53', '2019-07-09 03:43:17', NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `personal_links`
--

CREATE TABLE `personal_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_information_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `social_media_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `personal_links`
--

INSERT INTO `personal_links` (`id`, `url`, `contact_information_id`, `created_at`, `updated_at`, `social_media_id`) VALUES
(30, 'dania Khamis', 18, '2019-06-16 06:15:00', '2019-06-16 06:15:00', 6),
(33, 'dania Khamis', 17, '2019-07-06 08:34:25', '2019-07-06 08:34:25', 6);

-- --------------------------------------------------------

--
-- بنية الجدول `phone_types`
--

CREATE TABLE `phone_types` (
  `id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `phone_types`
--

INSERT INTO `phone_types` (`id`) VALUES
(1),
(2),
(3);

-- --------------------------------------------------------

--
-- بنية الجدول `phone_type_translations`
--

CREATE TABLE `phone_type_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `phone_type_id` int(10) UNSIGNED DEFAULT NULL,
  `translated_languages_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `phone_type_translations`
--

INSERT INTO `phone_type_translations` (`id`, `phone_type_id`, `translated_languages_id`, `name`) VALUES
(1, 1, 1, 'Work'),
(2, 2, 1, 'Personal'),
(3, 3, 1, 'Home'),
(4, 1, 2, 'العمل'),
(5, 2, 2, 'شخصي'),
(6, 3, 2, 'المنزل');

-- --------------------------------------------------------

--
-- بنية الجدول `place_of_births`
--

CREATE TABLE `place_of_births` (
  `id` int(10) UNSIGNED NOT NULL,
  `personal_information_id` int(10) UNSIGNED NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` decimal(18,15) DEFAULT NULL,
  `longitude` decimal(18,15) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `place_of_births`
--

INSERT INTO `place_of_births` (`id`, `personal_information_id`, `country`, `city`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES
(20, 2, 'سوريا', NULL, '34.802074999999990', '38.996814999999970', '2019-06-24 17:40:26', '2019-06-24 17:40:26'),
(21, 3, NULL, NULL, NULL, NULL, '2019-06-30 04:13:06', '2019-06-30 04:13:06'),
(23, 4, NULL, NULL, NULL, NULL, '2019-07-09 03:43:17', '2019-07-09 03:43:17');

-- --------------------------------------------------------

--
-- بنية الجدول `pre_defined_emails`
--

CREATE TABLE `pre_defined_emails` (
  `id` int(10) UNSIGNED NOT NULL,
  `contact_main_catagory_id` int(10) UNSIGNED NOT NULL,
  `contact_sub_category_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `message` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `template_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `pre_defined_emails`
--

INSERT INTO `pre_defined_emails` (`id`, `contact_main_catagory_id`, `contact_sub_category_id`, `user_id`, `message`, `email_title`, `created_at`, `updated_at`, `template_title`) VALUES
(6, 1, 2, 31, 'xxxxxx..', 'xxxxxxx', '2019-11-16 11:35:47', '2019-11-16 11:35:47', 'xxxxxxx'),
(9, 1, 2, 31, 'xxxxxx..', 'xxsxdxxx', '2019-11-21 03:53:59', '2019-11-21 03:53:59', 'xxrxrxxx');

-- --------------------------------------------------------

--
-- بنية الجدول `recieved_emails`
--

CREATE TABLE `recieved_emails` (
  `id` int(10) UNSIGNED NOT NULL,
  `contact_main_catagory_id` int(10) UNSIGNED NOT NULL,
  `contact_sub_category_id` int(10) UNSIGNED NOT NULL,
  `delete_by_admin_user_id` int(10) UNSIGNED DEFAULT NULL,
  `last_admin_comment_id` int(10) UNSIGNED DEFAULT NULL,
  `last_admin_done_email_log_id` int(10) UNSIGNED DEFAULT NULL,
  `last_admin_note_done_email_log_id` int(10) UNSIGNED DEFAULT NULL,
  `last_admin_open_log_id` int(10) UNSIGNED DEFAULT NULL,
  `last_admin_replied_email_id` int(10) UNSIGNED DEFAULT NULL,
  `last_admin_restore_email_log_id` int(10) UNSIGNED DEFAULT NULL,
  `translated_languages_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `message` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` int(10) UNSIGNED DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `recieved_emails`
--

INSERT INTO `recieved_emails` (`id`, `contact_main_catagory_id`, `contact_sub_category_id`, `delete_by_admin_user_id`, `last_admin_comment_id`, `last_admin_done_email_log_id`, `last_admin_note_done_email_log_id`, `last_admin_open_log_id`, `last_admin_replied_email_id`, `last_admin_restore_email_log_id`, `translated_languages_id`, `user_id`, `message`, `email`, `is_deleted`, `deleted_at`, `created_at`, `updated_at`) VALUES
(13, 1, 2, 33, NULL, 33, NULL, 21, 33, NULL, 1, NULL, 'problem in …..', 0, 1, '2019-12-12 09:46:57', '2019-11-14 08:45:53', '2019-12-12 07:46:57'),
(14, 1, 2, NULL, NULL, NULL, NULL, NULL, 31, NULL, 1, 30, 'problem in …..', NULL, 0, '2019-11-23 09:44:56', '2019-11-14 08:46:24', '2019-11-23 07:44:56'),
(15, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'problem in coyrse…..', 0, 0, '2019-11-27 08:43:11', '2019-11-27 06:43:11', '2019-11-27 06:43:11'),
(16, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'problem in …..', 0, 0, '2019-11-27 08:44:15', '2019-11-27 06:44:15', '2019-11-27 06:44:15');

-- --------------------------------------------------------

--
-- بنية الجدول `resumes`
--

CREATE TABLE `resumes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'Resume',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `translated_languages_id` int(10) UNSIGNED DEFAULT NULL,
  `count_copy` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `resumes`
--

INSERT INTO `resumes` (`id`, `user_id`, `created_at`, `updated_at`, `name`, `active`, `translated_languages_id`, `count_copy`) VALUES
(1, 1, '2018-09-28 18:00:00', '2019-07-01 05:11:08', 'Resume', 0, 1, 2),
(2, 1, '2019-05-19 05:13:50', '2019-07-07 07:40:02', 'resume 2', 0, 1, 0);

-- --------------------------------------------------------

--
-- بنية الجدول `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'main admin', NULL, NULL),
(2, 'employeer', 'employeer', NULL, NULL),
(3, 'user', 'user', NULL, NULL),
(4, 'sub admin', 'sub admin', NULL, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `role_user`
--

CREATE TABLE `role_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `role_user`
--

INSERT INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 3, 7, '2019-10-19 08:59:21', '2019-10-19 08:59:21'),
(2, 1, 26, '2019-10-20 04:01:14', '2019-10-20 04:01:14'),
(3, 3, 27, '2019-10-20 04:03:05', '2019-10-20 04:03:05'),
(4, 1, 28, '2019-10-20 05:00:10', '2019-10-20 05:00:10'),
(5, 1, 29, '2019-11-13 07:08:49', '2019-11-13 07:08:49'),
(6, 1, 30, '2019-11-13 07:09:03', '2019-11-13 07:09:03'),
(7, 1, 31, '2019-11-16 09:48:36', '2019-11-16 09:48:36'),
(8, 1, 32, '2019-11-26 05:36:21', '2019-11-26 05:36:21'),
(9, 1, 33, '2019-12-10 08:37:27', '2019-12-10 08:37:27');

-- --------------------------------------------------------

--
-- بنية الجدول `social_media`
--

CREATE TABLE `social_media` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `social_media`
--

INSERT INTO `social_media` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Askfm', NULL, NULL),
(2, 'Blogger', NULL, NULL),
(3, 'Behance', NULL, NULL),
(4, 'Delicious', NULL, NULL),
(5, 'Diigo', NULL, NULL),
(6, 'Facebook', NULL, NULL),
(7, 'Flicker', NULL, NULL),
(8, 'Google', NULL, NULL),
(9, 'Instagram', NULL, NULL),
(10, 'LinkedIn', NULL, NULL),
(11, 'Livejournal', NULL, NULL),
(12, 'Medium', NULL, NULL),
(13, 'MySpace', NULL, NULL),
(14, 'Odnoklassniki', NULL, NULL),
(15, 'Pinterest', NULL, NULL),
(16, 'plurk', NULL, NULL),
(17, 'QZone', NULL, NULL),
(18, 'Reddit', NULL, NULL),
(19, 'StumbleUpon', NULL, NULL),
(20, 'ScoopIt', NULL, NULL),
(21, 'Sina Weibo', NULL, NULL),
(22, 'Snapchat', NULL, NULL),
(23, 'Snapfish', NULL, NULL),
(24, 'Taringa', NULL, NULL),
(25, 'Tumbler', NULL, NULL),
(26, 'Twitter', NULL, NULL),
(27, 'Viadeo', NULL, NULL),
(28, 'Vine', NULL, NULL),
(29, 'VKontakte', NULL, NULL),
(30, 'Wordpress', NULL, NULL),
(31, 'Xing', NULL, NULL),
(32, 'Xanga', NULL, NULL),
(33, 'YouTube', NULL, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `specialty`
--

CREATE TABLE `specialty` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_industry_id` int(10) UNSIGNED NOT NULL,
  `is_verfied` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `specialty`
--

INSERT INTO `specialty` (`id`, `company_industry_id`, `is_verfied`, `created_at`, `updated_at`) VALUES
(2, 65, 0, NULL, NULL),
(3, 65, 0, NULL, NULL),
(14, 65, 0, NULL, NULL),
(15, 65, 0, NULL, NULL),
(22, 65, 0, NULL, NULL),
(23, 65, 0, NULL, NULL),
(24, 65, 0, NULL, NULL),
(25, 65, 0, NULL, NULL),
(26, 65, 0, NULL, NULL),
(27, 65, 0, NULL, NULL),
(30, 65, 0, NULL, NULL),
(31, 65, 0, NULL, NULL),
(32, 65, 0, NULL, NULL),
(33, 65, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `specialty_translations`
--

CREATE TABLE `specialty_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `specialty_id` int(10) UNSIGNED NOT NULL,
  `translated_languages_id` int(10) UNSIGNED NOT NULL,
  `specialty_translation_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `specialty_translations`
--

INSERT INTO `specialty_translations` (`id`, `specialty_id`, `translated_languages_id`, `specialty_translation_name`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'web', NULL, NULL),
(2, 3, 1, 'c++', NULL, NULL),
(13, 14, 2, 'web', NULL, NULL),
(14, 15, 2, 'c++', NULL, NULL),
(21, 22, 2, 'web', NULL, NULL),
(22, 23, 2, 'c++', NULL, NULL),
(23, 24, 2, 'web', NULL, NULL),
(24, 25, 2, 'c++', NULL, NULL),
(25, 26, 1, 'web', NULL, NULL),
(26, 27, 1, 'c++', NULL, NULL),
(27, 30, 1, 'web', NULL, NULL),
(28, 31, 1, 'c++', NULL, NULL),
(29, 32, 2, 'web', NULL, NULL),
(30, 33, 2, 'c++', NULL, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `translated_languages`
--

CREATE TABLE `translated_languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `translated_languages`
--

INSERT INTO `translated_languages` (`id`, `name`) VALUES
(1, 'English'),
(2, 'Arabic'),
(3, 'French');

-- --------------------------------------------------------

--
-- بنية الجدول `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `provider_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verified` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `verification_token` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `users`
--

INSERT INTO `users` (`id`, `provider_name`, `provider_id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `verified`, `verification_token`, `created_at`, `updated_at`, `avatar`) VALUES
(1, NULL, NULL, 'ahmad', '11111@gg.com', NULL, '$2y$10$IOQ36X88oxMY04KXe85OguOGFozj9oiq0zS3PJmH2jn.6ZrX5V2DW', NULL, '0', NULL, '2019-10-11 15:53:00', '2019-10-11 15:53:00', NULL),
(2, NULL, NULL, 'yaser', 'yaser@yaser.yas', NULL, '$2y$10$P.7usJoHgjHMMrNjZukga.QuE0u5y9.S9uIvNCrR0Z5fFBuq2EOwS', NULL, '0', NULL, '2019-10-15 15:52:31', '2019-10-15 15:52:31', NULL),
(3, NULL, NULL, 'yaser1', 'yase1r@yaser.yas', NULL, '$2y$10$iL5GusS9DkWgeLpZpSrUwuTrf6aPR8zCli6ey1AmZ2rVuzvh1boxm', NULL, '0', NULL, '2019-10-17 06:40:27', '2019-10-17 06:40:27', NULL),
(4, NULL, NULL, 'yaser', 'yaser@ee.com', NULL, '$2y$10$6VCI1LB9.3G4VEo3xS3gP.Lj6t5qgq3AjUs4HDfOpJHk2mwPPDySW', NULL, '0', NULL, '2019-10-19 05:37:35', '2019-10-19 05:37:35', NULL),
(6, NULL, NULL, 'yaser1', 'yaser1@ee.com', NULL, '$2y$10$7Gdt2fxDsDJ8hFqwaECabOVqQTaXrMCtXCh9a2CftttbgMHWHwwoi', NULL, '0', NULL, '2019-10-19 08:52:06', '2019-10-19 08:52:06', NULL),
(7, NULL, NULL, 'yaser13', 'yaser31@ee.com', NULL, '$2y$10$.7e7ba/Mb3p150mKAhuvLeTtKT3R.FEiOZ7cBm.fAomHBCLV1Zm7m', NULL, '0', NULL, '2019-10-19 08:59:21', '2019-10-19 08:59:21', NULL),
(8, NULL, NULL, 'yaseradmin', 'yaseradmin@ee.com', NULL, '$2y$10$drlJu1IFIIGqKTbmQJtryePT6sXjVR7iMOObaL0oXTcYBJ0UB2ote', NULL, '0', NULL, '2019-10-20 03:46:56', '2019-10-20 03:46:56', NULL),
(16, NULL, NULL, 'yaseradmin1', 'yaseradmin1@ee.com', NULL, '$2y$10$gf0GskTnptNlo09Hyf6cN.2Pi2p9isV54GBxeo3NDoOBgPzASf23S', NULL, '0', NULL, '2019-10-20 03:53:11', '2019-10-20 03:53:11', NULL),
(17, NULL, NULL, 'yaseradmin1', 'yaseradmin11@ee.com', NULL, '$2y$10$vb1GIY6KY/IAuvZ/55yLoODFX5WTLvZ5BE.QHsGpkyxs9T9H5xAye', NULL, '0', NULL, '2019-10-20 03:53:29', '2019-10-20 03:53:29', NULL),
(18, NULL, NULL, 'yaseradmin1', 'yaseradmin121@ee.com', NULL, '$2y$10$nesJEnIB1Rm5Vwjl2JkE/uALKXeNS8NJqmAtDvcgv9MVcpQ6p7cBO', NULL, '0', NULL, '2019-10-20 03:54:38', '2019-10-20 03:54:38', NULL),
(19, NULL, NULL, 'yaseradmin1', 'yaseradmin2121@ee.com', NULL, '$2y$10$EbcdrqS2V..O136baA4mh.IXPaNPcwURw.UyNinZ50FS3h463pXYe', NULL, '0', NULL, '2019-10-20 03:55:01', '2019-10-20 03:55:01', NULL),
(20, NULL, NULL, 'yaseradmin1', 'yaseradminw2121@ee.com', NULL, '$2y$10$jQg9xTR4IvHJvwBNFifWueVuKUa2IPzivf0mJn325dVNPBPxZv7tm', NULL, '0', NULL, '2019-10-20 03:55:32', '2019-10-20 03:55:32', NULL),
(21, NULL, NULL, 'yaseradmin1', 'yaseradmindw2121@ee.com', NULL, '$2y$10$O.X.WGjem9rL6fdbxLXBHuQk5Ct1KxiNpUPTWLHAJGZZnTHOdEyUK', NULL, '0', NULL, '2019-10-20 03:55:48', '2019-10-20 03:55:48', NULL),
(22, NULL, NULL, 'yaseradmin1', 'yaseradmiendw2121@ee.com', NULL, '$2y$10$nKzb9ZBENUQY5GQjVQeO9efG4dh.4gi69e.bFiXBSDYLIc8VY1G.W', NULL, '0', NULL, '2019-10-20 03:57:21', '2019-10-20 03:57:21', NULL),
(23, NULL, NULL, 'yaseradmin1', 'yaseradmidendw2121@ee.com', NULL, '$2y$10$A3R7pdrxmlJpBSt6vYmr7ueqixwrVeQcLWdocw7VUDtscdteFL0w.', NULL, '0', NULL, '2019-10-20 03:58:38', '2019-10-20 03:58:38', NULL),
(24, NULL, NULL, 'yaseradmin1', 'yaseraddmidendw2121@ee.com', NULL, '$2y$10$LsSK0F9rBiKqXFIy7qf02ee/vLj8wxWlAA4uA7g7f/tuDsRMruZRS', NULL, '0', NULL, '2019-10-20 03:59:18', '2019-10-20 03:59:18', NULL),
(25, NULL, NULL, 'yaseradmin1', 'yasedraddmidendw2121@ee.com', NULL, '$2y$10$dOpnwT2UFXNHq4aiiCiRv.dDP.JR9Dhk8gdwgbodt9/c5eUTbt7tO', NULL, '0', NULL, '2019-10-20 04:00:27', '2019-10-20 04:00:27', NULL),
(26, NULL, NULL, 'yaseradmin1', 'yasedradddmidendw2121@ee.com', NULL, '$2y$10$8VB1aMALUZv1iwaUp9xubepNv7mD70O1h2u.BU/3BzYjm5b.w5G6W', NULL, '0', NULL, '2019-10-20 04:01:13', '2019-10-20 04:01:13', NULL),
(27, NULL, NULL, 'yaseradmin1', 'yasesdradddmidendw2121@ee.com', NULL, '$2y$10$FPwwCm5m.kV59K.2NHU31ewlkFQ7vfAACzIyMwfH1VVjU.3UkariK', NULL, '0', NULL, '2019-10-20 04:03:05', '2019-10-20 04:03:05', NULL),
(28, NULL, NULL, 'yaseradmin1', 'yaser_admin@ee.com', NULL, '$2y$10$.LE8vVvtsEQvY8vUi4ithuHIwme/ywjJMXD69AThD8jIM2kizojC6', NULL, '0', NULL, '2019-10-20 05:00:09', '2019-10-20 05:00:09', NULL),
(29, NULL, NULL, 'yaser111', 'yaser111@yaser.yas', NULL, '$2y$10$zIe/Uhn.0IzggWAbaKx7L.m2CSKfHAqXJ5Og5lxMZhLr.JFzlj/be', NULL, '0', NULL, '2019-11-13 07:08:49', '2019-11-13 07:08:49', NULL),
(30, NULL, NULL, 'yaser111', 'yaser11551@yaser.yas', NULL, '$2y$10$5AhIOXtc0DNjHBHc3xp4tevTuckunXRQWktMC3dAfXtngiTPHObZS', NULL, '0', NULL, '2019-11-13 07:09:03', '2019-11-13 07:09:03', NULL),
(31, NULL, NULL, 'y454', '444rr@gmail.com', NULL, '$2y$10$au5.QZh/EHC.xGxbXdnAbOc7cfvlU1Y05y5igOd/tNKNMubKw3SbG', NULL, '0', NULL, '2019-11-16 09:48:35', '2019-11-16 09:48:35', NULL),
(32, NULL, NULL, 'yaser', 'omran@ff.com', NULL, '$2y$10$x7vYUDEKCOkbvldxO1em0OJW9ByGmI9m92pDZO5lgqTSQnb1qhPZi', NULL, '0', NULL, '2019-11-26 05:36:21', '2019-11-26 05:36:21', NULL),
(33, NULL, NULL, 'yasss', 'ahmad12345@eee.com', NULL, '$2y$10$Z5Gts2u2OiPb2zp9TXlc1ek.0n0mi/Nc616jBniU2xRQQiY09TLPG', NULL, '0', NULL, '2019-12-10 08:37:27', '2019-12-10 08:37:27', NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `work_experiences`
--

CREATE TABLE `work_experiences` (
  `id` int(10) UNSIGNED NOT NULL,
  `resume_id` int(10) UNSIGNED NOT NULL,
  `company_industry_id` int(10) UNSIGNED DEFAULT NULL,
  `from` date DEFAULT NULL,
  `to` date DEFAULT NULL,
  `isPresent` tinyint(1) DEFAULT NULL,
  `isFromMonthPresent` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isToMonthPresent` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `work_experiences`
--

INSERT INTO `work_experiences` (`id`, `resume_id`, `company_industry_id`, `from`, `to`, `isPresent`, `isFromMonthPresent`, `isToMonthPresent`, `job_title`, `description`, `order`, `created_at`, `updated_at`) VALUES
(10, 1, 1, '2014-01-01', NULL, 1, '1', NULL, 'programming', NULL, 2, '2019-05-12 05:18:16', '2019-07-07 05:53:57'),
(11, 1, 1, '2014-01-01', NULL, 1, '1', NULL, 'programming', NULL, 1, '2019-07-07 05:53:57', '2019-07-11 09:22:44');

-- --------------------------------------------------------

--
-- بنية الجدول `work_exp_companies`
--

CREATE TABLE `work_exp_companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `work_experience_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verified_by_google` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_size_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `work_exp_companies`
--

INSERT INTO `work_exp_companies` (`id`, `work_experience_id`, `name`, `country`, `city`, `company_website`, `company_description`, `verified_by_google`, `created_at`, `updated_at`, `company_size_id`) VALUES
(5, 10, 'automata4', 'syria', NULL, 'automata4.com', NULL, 1, '2019-05-12 05:36:24', '2019-05-12 05:36:24', 1),
(8, 11, 'q', 'syria', NULL, 'asasa', NULL, 1, '2019-07-11 09:22:44', '2019-07-11 09:22:44', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_comments`
--
ALTER TABLE `admin_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_comments_user_id_foreign` (`user_id`),
  ADD KEY `admin_comments_recieved_email_id_foreign` (`recieved_email_id`);

--
-- Indexes for table `admin_done_email_logs`
--
ALTER TABLE `admin_done_email_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_done_email_logs_user_id_foreign` (`user_id`),
  ADD KEY `admin_done_email_logs_recieved_email_id_foreign` (`recieved_email_id`);

--
-- Indexes for table `admin_email_assign_logs`
--
ALTER TABLE `admin_email_assign_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_email_assign_logs_to_assigned_admin_user_id_foreign` (`to_assigned_admin_user_id`),
  ADD KEY `admin_email_assign_logs_from_assigned_admin_user_id_foreign` (`user_id`),
  ADD KEY `admin_email_assign_logs_recieved_email_id_foreign` (`recieved_email_id`);

--
-- Indexes for table `admin_note_done_email_logs`
--
ALTER TABLE `admin_note_done_email_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_note_done_email_logs_user_id_foreign` (`user_id`),
  ADD KEY `admin_note_done_email_logs_recieved_email_id_foreign` (`recieved_email_id`);

--
-- Indexes for table `admin_open_logs`
--
ALTER TABLE `admin_open_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_open_logs_user_id_foreign` (`user_id`),
  ADD KEY `admin_open_logs_recieved_email_id_foreign` (`recieved_email_id`);

--
-- Indexes for table `admin_replied_emails`
--
ALTER TABLE `admin_replied_emails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_replied_emails_user_id_foreign` (`user_id`),
  ADD KEY `admin_replied_emails_recieved_email_id_foreign` (`recieved_email_id`);

--
-- Indexes for table `admin_restore_email_logs`
--
ALTER TABLE `admin_restore_email_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_restore_email_logs_user_id_foreign` (`user_id`),
  ADD KEY `admin_restore_email_logs_recieved_email_id_foreign` (`recieved_email_id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companies_main_language_id_foreign` (`main_language_id`),
  ADD KEY `companies_company_status_id_foreign` (`company_status_id`),
  ADD KEY `companies_company_method_verfication_id_foreign` (`company_method_verfication_id`),
  ADD KEY `companies_admin_user_id_foreign` (`admin_user_id`),
  ADD KEY `companies_user_id_foreign` (`user_id`);

--
-- Indexes for table `company_admins_logs`
--
ALTER TABLE `company_admins_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admins_logs_companies_status_id_foreign` (`company_status_id`),
  ADD KEY `admins_logs_company_method_verfication_id_foreign` (`company_method_verfication_id`),
  ADD KEY `company_admins_logs_user_id_foreign` (`user_id`);

--
-- Indexes for table `company_industries`
--
ALTER TABLE `company_industries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_industries_company_industry_parent_id_foreign` (`company_industry_parent_id`);

--
-- Indexes for table `company_industries_for_companies`
--
ALTER TABLE `company_industries_for_companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_industries_for_companies_company_profile_id_foreign` (`company_profile_id`),
  ADD KEY `company_industries_for_companies_company_industry_id_foreign` (`company_industry_id`);

--
-- Indexes for table `company_industry_parents`
--
ALTER TABLE `company_industry_parents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_industry_parent_trans`
--
ALTER TABLE `company_industry_parent_trans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_industry_parent_trans_company_industry_parent_id_foreign` (`company_industry_parent_id`),
  ADD KEY `company_industry_parent_trans_translated_languages_id_foreign` (`translated_languages_id`);

--
-- Indexes for table `company_industry_translations`
--
ALTER TABLE `company_industry_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_industry_translations_company_industry_id_foreign` (`company_industry_id`),
  ADD KEY `company_industry_translations_translated_languages_id_foreign` (`translated_languages_id`);

--
-- Indexes for table `company_locations`
--
ALTER TABLE `company_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_locations_company_profile_id_foreign` (`company_profile_id`);

--
-- Indexes for table `company_method_verfications`
--
ALTER TABLE `company_method_verfications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_profiles`
--
ALTER TABLE `company_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_profiles_company_type_id_foreign` (`company_type_id`),
  ADD KEY `company_profiles_company_size_id_foreign` (`company_size_id`),
  ADD KEY `company_profiles_company_id_foreign` (`company_id`);

--
-- Indexes for table `company_profile_translations`
--
ALTER TABLE `company_profile_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_profile_translations_translated_languages_id_foreign` (`translated_languages_id`),
  ADD KEY `company_profile_translations_company_profile_id_foreign` (`company_profile_id`);

--
-- Indexes for table `company_sizes`
--
ALTER TABLE `company_sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_size_translations`
--
ALTER TABLE `company_size_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_size_translations_company_size_id_foreign` (`company_size_id`),
  ADD KEY `company_size_translations_translated_languages_id_foreign` (`translated_languages_id`);

--
-- Indexes for table `company_social_medias`
--
ALTER TABLE `company_social_medias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_social_medias_company_profile_id_foreign` (`company_profile_id`),
  ADD KEY `company_social_medias_social_media_id_foreign` (`social_media_id`);

--
-- Indexes for table `company_specialties_for_companies`
--
ALTER TABLE `company_specialties_for_companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_specialties_for_companies_company_profile_id_foreign` (`company_profile_id`),
  ADD KEY `company_specialties_for_companies_specialty_id_foreign` (`specialty_id`);

--
-- Indexes for table `company_statuses`
--
ALTER TABLE `company_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_types`
--
ALTER TABLE `company_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_type_translations`
--
ALTER TABLE `company_type_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_type_translations_translated_languages_id_foreign` (`translated_languages_id`),
  ADD KEY `company_type_translations_company_type_id_foreign` (`company_type_id`);

--
-- Indexes for table `contact_informations`
--
ALTER TABLE `contact_informations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_informations_resume_id_foreign` (`resume_id`);

--
-- Indexes for table `contact_main_catagories`
--
ALTER TABLE `contact_main_catagories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_numbers`
--
ALTER TABLE `contact_numbers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_numbers_contact_information_id_foreign` (`contact_information_id`),
  ADD KEY `contact_numbers_phone_types_id_foreign` (`phone_type_id`),
  ADD KEY `contact_numbers_country_id_foreign` (`country_id`);

--
-- Indexes for table `contact_sub_categories`
--
ALTER TABLE `contact_sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_sub_categories_contact_main_catagory_id_foreign` (`contact_main_catagory_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country_translations`
--
ALTER TABLE `country_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_translations_country_id_foreign` (`country_id`),
  ADD KEY `country_translations_translated_languages_id_foreign` (`translated_languages_id`);

--
-- Indexes for table `current_locations`
--
ALTER TABLE `current_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `current_locations_personal_information_id_foreign` (`personal_information_id`);

--
-- Indexes for table `c_m_c_translations`
--
ALTER TABLE `c_m_c_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `c_m_c_translations_contact_main_category_id_foreign` (`contact_main_catagory_id`),
  ADD KEY `c_m_c_translations_translated_languages_id_foreign` (`translated_languages_id`);

--
-- Indexes for table `c_s_c_translations`
--
ALTER TABLE `c_s_c_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `c_s_c_translations_contact_sub_category_id_foreign` (`contact_sub_category_id`),
  ADD KEY `c_s_c_translations_translated_languages_id_foreign` (`translated_languages_id`);

--
-- Indexes for table `degree_levels`
--
ALTER TABLE `degree_levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `degree_level_translations`
--
ALTER TABLE `degree_level_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `degree_level_translations_degree_level_id_foreign` (`degree_level_id`),
  ADD KEY `degree_level_translations_translated_languages_id_foreign` (`translated_languages_id`);

--
-- Indexes for table `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`id`),
  ADD KEY `education_major_id_foreign` (`major_id`),
  ADD KEY `education_minor_id_foreign` (`minor_id`),
  ADD KEY `education_resume_id_foreign` (`resume_id`),
  ADD KEY `education_degree_level_id_foreign` (`degree_level_id`),
  ADD KEY `education_institution_id_foreign` (`institution_id`);

--
-- Indexes for table `education_projects`
--
ALTER TABLE `education_projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `education_projects_education_id_foreign` (`education_id`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emails_contact_information_id_foreign` (`contact_information_id`);

--
-- Indexes for table `employment_types`
--
ALTER TABLE `employment_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employment_types_employment_type_parent_id_foreign` (`employment_type_parent_id`),
  ADD KEY `employment_types_work_experience_id_foreign` (`work_experience_id`);

--
-- Indexes for table `employment_type_parents`
--
ALTER TABLE `employment_type_parents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emp_type_parent_translations`
--
ALTER TABLE `emp_type_parent_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emp_type_parent_foreign` (`employment_type_parent_id`),
  ADD KEY `emp_type_parent_translations_translated_languages_id_foreign` (`translated_languages_id`);

--
-- Indexes for table `institutions`
--
ALTER TABLE `institutions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `institutions_institution_type_id_foreign` (`institution_type_id`);

--
-- Indexes for table `institution_translations`
--
ALTER TABLE `institution_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `institution_translations_institution_id_foreign` (`institution_id`),
  ADD KEY `institution_translations_translated_languages_id_foreign` (`translated_languages_id`);

--
-- Indexes for table `institution_types`
--
ALTER TABLE `institution_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `international_languages`
--
ALTER TABLE `international_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `international_language_trans`
--
ALTER TABLE `international_language_trans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `international_language_trans_international_language_id_foreign` (`international_language_id`),
  ADD KEY `international_language_trans_translated_languages_id_foreign` (`translated_languages_id`);

--
-- Indexes for table `internet_communications`
--
ALTER TABLE `internet_communications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `internet_communications_contact_information_id_foreign` (`contact_information_id`),
  ADD KEY `internet_communications_internet_communication_type_id_foreign` (`internet_communication_type_id`);

--
-- Indexes for table `internet_communication_types`
--
ALTER TABLE `internet_communication_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `majors`
--
ALTER TABLE `majors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `majors_major_parent_id_foreign` (`major_parent_id`),
  ADD KEY `majors_institution_type_id_foreign` (`institution_type_id`);

--
-- Indexes for table `major_parents`
--
ALTER TABLE `major_parents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `major_parent_translations`
--
ALTER TABLE `major_parent_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `major_parent_translations_major_parent_id_foreign` (`major_parent_id`),
  ADD KEY `major_parent_translations_translated_languages_id_foreign` (`translated_languages_id`);

--
-- Indexes for table `major_translations`
--
ALTER TABLE `major_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `major_translations_major_id_foreign` (`major_id`),
  ADD KEY `major_translations_translated_languages_id_foreign` (`translated_languages_id`);

--
-- Indexes for table `marital_statuses`
--
ALTER TABLE `marital_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marital_status_translations`
--
ALTER TABLE `marital_status_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marital_status_translation_marital_status_id_foreign` (`marital_status_id`),
  ADD KEY `marital_status_translation_translated_languages_id_foreign` (`translated_languages_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `minors`
--
ALTER TABLE `minors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `minors_major_id_foreign` (`major_id`);

--
-- Indexes for table `minor_translations`
--
ALTER TABLE `minor_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `minor_translations_minor_id_foreign` (`minor_id`),
  ADD KEY `minor_translations_translated_languages_id_foreign` (`translated_languages_id`);

--
-- Indexes for table `mytable_11`
--
ALTER TABLE `mytable_11`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nationalities`
--
ALTER TABLE `nationalities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nationality_personal_information`
--
ALTER TABLE `nationality_personal_information`
  ADD KEY `nationality_personal_information_nationality_id_foreign` (`nationality_id`),
  ADD KEY `nationality_personal_information_personal_information_id_foreign` (`personal_information_id`);

--
-- Indexes for table `nationality_translations`
--
ALTER TABLE `nationality_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nationality_translations_nationality_id_foreign` (`nationality_id`),
  ADD KEY `nationality_translations_translated_languages_id_foreign` (`translated_languages_id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_informations`
--
ALTER TABLE `personal_informations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `personal_informations_resume_id_foreign` (`resume_id`),
  ADD KEY `personal_informations_marital_status_id_foreign` (`marital_status_id`);

--
-- Indexes for table `personal_links`
--
ALTER TABLE `personal_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `personal_links_contact_information_id_foreign` (`contact_information_id`),
  ADD KEY `personal_links_social_media_id_foreign` (`social_media_id`);

--
-- Indexes for table `phone_types`
--
ALTER TABLE `phone_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone_type_translations`
--
ALTER TABLE `phone_type_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phone_types_translations_phone_types_id_foreign` (`phone_type_id`),
  ADD KEY `phone_types_translations_translated_languages_id_foreign` (`translated_languages_id`);

--
-- Indexes for table `place_of_births`
--
ALTER TABLE `place_of_births`
  ADD PRIMARY KEY (`id`),
  ADD KEY `place_of_births_personal_information_id_foreign` (`personal_information_id`);

--
-- Indexes for table `pre_defined_emails`
--
ALTER TABLE `pre_defined_emails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pre_defined_emails_email_title_unique` (`email_title`),
  ADD UNIQUE KEY `pre_defined_emails_template_title_unique` (`template_title`),
  ADD KEY `pre_defined_emails_contact_main_catagory_id_foreign` (`contact_main_catagory_id`),
  ADD KEY `pre_defined_emails_contact_sub_category_id_foreign` (`contact_sub_category_id`),
  ADD KEY `pre_defined_emails_user_id_foreign` (`user_id`);

--
-- Indexes for table `recieved_emails`
--
ALTER TABLE `recieved_emails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recieved_emails_contact_main_catagory_id_foreign` (`contact_main_catagory_id`),
  ADD KEY `recieved_emails_contact_sub_category_id_foreign` (`contact_sub_category_id`),
  ADD KEY `recieved_emails_user_id_foreign` (`user_id`),
  ADD KEY `recieved_emails_translated_languages_id_foreign` (`translated_languages_id`),
  ADD KEY `recieved_emails_last_admin_comment_id_foreign` (`last_admin_comment_id`),
  ADD KEY `recieved_emails_last_admin_restore_email_log_id_foreign` (`last_admin_restore_email_log_id`),
  ADD KEY `recieved_emails_last_admin_done_email_log_id_foreign` (`last_admin_done_email_log_id`),
  ADD KEY `recieved_emails_last_admin_replied_email_id_foreign` (`last_admin_replied_email_id`),
  ADD KEY `recieved_emails_last_admin_note_done_email_log_id_foreign` (`last_admin_note_done_email_log_id`);

--
-- Indexes for table `resumes`
--
ALTER TABLE `resumes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resumes_user_id_foreign` (`user_id`),
  ADD KEY `resumes_translated_languages_id_foreign` (`translated_languages_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_user_user_id_foreign` (`user_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `social_media`
--
ALTER TABLE `social_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `specialty`
--
ALTER TABLE `specialty`
  ADD PRIMARY KEY (`id`),
  ADD KEY `specialty_company_industry_id_foreign` (`company_industry_id`);

--
-- Indexes for table `specialty_translations`
--
ALTER TABLE `specialty_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `specialty_translations_specialty_id_foreign` (`specialty_id`),
  ADD KEY `specialty_translations_translated_languages_id_foreign` (`translated_languages_id`);

--
-- Indexes for table `translated_languages`
--
ALTER TABLE `translated_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `work_experiences`
--
ALTER TABLE `work_experiences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `work_experiences_company_industry_id_foreign` (`company_industry_id`),
  ADD KEY `work_experiences_resume_id_foreign` (`resume_id`);

--
-- Indexes for table `work_exp_companies`
--
ALTER TABLE `work_exp_companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companies_work_experience_id_foreign` (`work_experience_id`),
  ADD KEY `work_exp_companies_company_size_id_foreign` (`company_size_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_comments`
--
ALTER TABLE `admin_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admin_done_email_logs`
--
ALTER TABLE `admin_done_email_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `admin_email_assign_logs`
--
ALTER TABLE `admin_email_assign_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admin_note_done_email_logs`
--
ALTER TABLE `admin_note_done_email_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_open_logs`
--
ALTER TABLE `admin_open_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `admin_replied_emails`
--
ALTER TABLE `admin_replied_emails`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admin_restore_email_logs`
--
ALTER TABLE `admin_restore_email_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `company_admins_logs`
--
ALTER TABLE `company_admins_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `company_industries`
--
ALTER TABLE `company_industries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=330;

--
-- AUTO_INCREMENT for table `company_industries_for_companies`
--
ALTER TABLE `company_industries_for_companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `company_industry_parents`
--
ALTER TABLE `company_industry_parents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `company_industry_parent_trans`
--
ALTER TABLE `company_industry_parent_trans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `company_industry_translations`
--
ALTER TABLE `company_industry_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=541;

--
-- AUTO_INCREMENT for table `company_locations`
--
ALTER TABLE `company_locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `company_method_verfications`
--
ALTER TABLE `company_method_verfications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `company_profiles`
--
ALTER TABLE `company_profiles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `company_profile_translations`
--
ALTER TABLE `company_profile_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `company_sizes`
--
ALTER TABLE `company_sizes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `company_size_translations`
--
ALTER TABLE `company_size_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `company_social_medias`
--
ALTER TABLE `company_social_medias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `company_specialties_for_companies`
--
ALTER TABLE `company_specialties_for_companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `company_statuses`
--
ALTER TABLE `company_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `company_types`
--
ALTER TABLE `company_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `company_type_translations`
--
ALTER TABLE `company_type_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contact_informations`
--
ALTER TABLE `contact_informations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `contact_main_catagories`
--
ALTER TABLE `contact_main_catagories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contact_numbers`
--
ALTER TABLE `contact_numbers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `contact_sub_categories`
--
ALTER TABLE `contact_sub_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `country_translations`
--
ALTER TABLE `country_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `current_locations`
--
ALTER TABLE `current_locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `c_m_c_translations`
--
ALTER TABLE `c_m_c_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `c_s_c_translations`
--
ALTER TABLE `c_s_c_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `degree_levels`
--
ALTER TABLE `degree_levels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `degree_level_translations`
--
ALTER TABLE `degree_level_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `education`
--
ALTER TABLE `education`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

--
-- AUTO_INCREMENT for table `education_projects`
--
ALTER TABLE `education_projects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `employment_types`
--
ALTER TABLE `employment_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `employment_type_parents`
--
ALTER TABLE `employment_type_parents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `emp_type_parent_translations`
--
ALTER TABLE `emp_type_parent_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `institutions`
--
ALTER TABLE `institutions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `institution_translations`
--
ALTER TABLE `institution_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `institution_types`
--
ALTER TABLE `institution_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `international_languages`
--
ALTER TABLE `international_languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `international_language_trans`
--
ALTER TABLE `international_language_trans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `internet_communications`
--
ALTER TABLE `internet_communications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `internet_communication_types`
--
ALTER TABLE `internet_communication_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `majors`
--
ALTER TABLE `majors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT for table `major_parents`
--
ALTER TABLE `major_parents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `major_parent_translations`
--
ALTER TABLE `major_parent_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `major_translations`
--
ALTER TABLE `major_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=302;

--
-- AUTO_INCREMENT for table `marital_statuses`
--
ALTER TABLE `marital_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `marital_status_translations`
--
ALTER TABLE `marital_status_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=264;

--
-- AUTO_INCREMENT for table `minors`
--
ALTER TABLE `minors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=455;

--
-- AUTO_INCREMENT for table `minor_translations`
--
ALTER TABLE `minor_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=453;

--
-- AUTO_INCREMENT for table `mytable_11`
--
ALTER TABLE `mytable_11`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nationalities`
--
ALTER TABLE `nationalities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=895;

--
-- AUTO_INCREMENT for table `nationality_translations`
--
ALTER TABLE `nationality_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=618;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `personal_informations`
--
ALTER TABLE `personal_informations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_links`
--
ALTER TABLE `personal_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `phone_types`
--
ALTER TABLE `phone_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `phone_type_translations`
--
ALTER TABLE `phone_type_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `place_of_births`
--
ALTER TABLE `place_of_births`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `pre_defined_emails`
--
ALTER TABLE `pre_defined_emails`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `recieved_emails`
--
ALTER TABLE `recieved_emails`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `resumes`
--
ALTER TABLE `resumes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `social_media`
--
ALTER TABLE `social_media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `specialty`
--
ALTER TABLE `specialty`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `specialty_translations`
--
ALTER TABLE `specialty_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `translated_languages`
--
ALTER TABLE `translated_languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `work_experiences`
--
ALTER TABLE `work_experiences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `work_exp_companies`
--
ALTER TABLE `work_exp_companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- قيود الجداول المحفوظة
--

--
-- القيود للجدول `admin_comments`
--
ALTER TABLE `admin_comments`
  ADD CONSTRAINT `admin_comments_recieved_email_id_foreign` FOREIGN KEY (`recieved_email_id`) REFERENCES `recieved_emails` (`id`),
  ADD CONSTRAINT `admin_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- القيود للجدول `admin_done_email_logs`
--
ALTER TABLE `admin_done_email_logs`
  ADD CONSTRAINT `admin_done_email_logs_recieved_email_id_foreign` FOREIGN KEY (`recieved_email_id`) REFERENCES `recieved_emails` (`id`),
  ADD CONSTRAINT `admin_done_email_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- القيود للجدول `admin_email_assign_logs`
--
ALTER TABLE `admin_email_assign_logs`
  ADD CONSTRAINT `admin_email_assign_logs_from_assigned_admin_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `admin_email_assign_logs_recieved_email_id_foreign` FOREIGN KEY (`recieved_email_id`) REFERENCES `recieved_emails` (`id`),
  ADD CONSTRAINT `admin_email_assign_logs_to_assigned_admin_user_id_foreign` FOREIGN KEY (`to_assigned_admin_user_id`) REFERENCES `users` (`id`);

--
-- القيود للجدول `admin_note_done_email_logs`
--
ALTER TABLE `admin_note_done_email_logs`
  ADD CONSTRAINT `admin_note_done_email_logs_recieved_email_id_foreign` FOREIGN KEY (`recieved_email_id`) REFERENCES `recieved_emails` (`id`),
  ADD CONSTRAINT `admin_note_done_email_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- القيود للجدول `admin_open_logs`
--
ALTER TABLE `admin_open_logs`
  ADD CONSTRAINT `admin_open_logs_recieved_email_id_foreign` FOREIGN KEY (`recieved_email_id`) REFERENCES `recieved_emails` (`id`),
  ADD CONSTRAINT `admin_open_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- القيود للجدول `admin_replied_emails`
--
ALTER TABLE `admin_replied_emails`
  ADD CONSTRAINT `admin_replied_emails_recieved_email_id_foreign` FOREIGN KEY (`recieved_email_id`) REFERENCES `recieved_emails` (`id`),
  ADD CONSTRAINT `admin_replied_emails_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- القيود للجدول `admin_restore_email_logs`
--
ALTER TABLE `admin_restore_email_logs`
  ADD CONSTRAINT `admin_restore_email_logs_recieved_email_id_foreign` FOREIGN KEY (`recieved_email_id`) REFERENCES `recieved_emails` (`id`),
  ADD CONSTRAINT `admin_restore_email_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- القيود للجدول `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `companies_admin_user_id_foreign` FOREIGN KEY (`admin_user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `companies_company_method_verfication_id_foreign` FOREIGN KEY (`company_method_verfication_id`) REFERENCES `company_method_verfications` (`id`),
  ADD CONSTRAINT `companies_company_status_id_foreign` FOREIGN KEY (`company_status_id`) REFERENCES `company_statuses` (`id`),
  ADD CONSTRAINT `companies_main_language_id_foreign` FOREIGN KEY (`main_language_id`) REFERENCES `translated_languages` (`id`),
  ADD CONSTRAINT `companies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- القيود للجدول `company_admins_logs`
--
ALTER TABLE `company_admins_logs`
  ADD CONSTRAINT `admins_logs_companies_status_id_foreign` FOREIGN KEY (`company_status_id`) REFERENCES `company_statuses` (`id`),
  ADD CONSTRAINT `admins_logs_company_method_verfication_id_foreign` FOREIGN KEY (`company_method_verfication_id`) REFERENCES `company_method_verfications` (`id`),
  ADD CONSTRAINT `company_admins_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- القيود للجدول `company_industries`
--
ALTER TABLE `company_industries`
  ADD CONSTRAINT `company_industries_company_industry_parent_id_foreign` FOREIGN KEY (`company_industry_parent_id`) REFERENCES `company_industry_parents` (`id`);

--
-- القيود للجدول `company_industries_for_companies`
--
ALTER TABLE `company_industries_for_companies`
  ADD CONSTRAINT `company_industries_for_companies_company_industry_id_foreign` FOREIGN KEY (`company_industry_id`) REFERENCES `company_industries` (`id`),
  ADD CONSTRAINT `company_industries_for_companies_company_profile_id_foreign` FOREIGN KEY (`company_profile_id`) REFERENCES `company_profiles` (`id`);

--
-- القيود للجدول `company_industry_parent_trans`
--
ALTER TABLE `company_industry_parent_trans`
  ADD CONSTRAINT `company_industry_parent_trans_company_industry_parent_id_foreign` FOREIGN KEY (`company_industry_parent_id`) REFERENCES `company_industry_parents` (`id`),
  ADD CONSTRAINT `company_industry_parent_trans_translated_languages_id_foreign` FOREIGN KEY (`translated_languages_id`) REFERENCES `translated_languages` (`id`);

--
-- القيود للجدول `company_industry_translations`
--
ALTER TABLE `company_industry_translations`
  ADD CONSTRAINT `company_industry_translations_company_industry_id_foreign` FOREIGN KEY (`company_industry_id`) REFERENCES `company_industries` (`id`),
  ADD CONSTRAINT `company_industry_translations_translated_languages_id_foreign` FOREIGN KEY (`translated_languages_id`) REFERENCES `translated_languages` (`id`);

--
-- القيود للجدول `company_locations`
--
ALTER TABLE `company_locations`
  ADD CONSTRAINT `company_locations_company_profile_id_foreign` FOREIGN KEY (`company_profile_id`) REFERENCES `company_profiles` (`id`);

--
-- القيود للجدول `company_profiles`
--
ALTER TABLE `company_profiles`
  ADD CONSTRAINT `company_profiles_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `company_profiles_company_size_id_foreign` FOREIGN KEY (`company_size_id`) REFERENCES `company_sizes` (`id`),
  ADD CONSTRAINT `company_profiles_company_type_id_foreign` FOREIGN KEY (`company_type_id`) REFERENCES `company_types` (`id`);

--
-- القيود للجدول `company_profile_translations`
--
ALTER TABLE `company_profile_translations`
  ADD CONSTRAINT `company_profile_translations_company_profile_id_foreign` FOREIGN KEY (`company_profile_id`) REFERENCES `company_profiles` (`id`),
  ADD CONSTRAINT `company_profile_translations_translated_languages_id_foreign` FOREIGN KEY (`translated_languages_id`) REFERENCES `translated_languages` (`id`);

--
-- القيود للجدول `company_size_translations`
--
ALTER TABLE `company_size_translations`
  ADD CONSTRAINT `company_size_translations_company_size_id_foreign` FOREIGN KEY (`company_size_id`) REFERENCES `company_sizes` (`id`),
  ADD CONSTRAINT `company_size_translations_translated_languages_id_foreign` FOREIGN KEY (`translated_languages_id`) REFERENCES `translated_languages` (`id`);

--
-- القيود للجدول `company_social_medias`
--
ALTER TABLE `company_social_medias`
  ADD CONSTRAINT `company_social_medias_company_profile_id_foreign` FOREIGN KEY (`company_profile_id`) REFERENCES `company_profiles` (`id`),
  ADD CONSTRAINT `company_social_medias_social_media_id_foreign` FOREIGN KEY (`social_media_id`) REFERENCES `social_media` (`id`);

--
-- القيود للجدول `company_specialties_for_companies`
--
ALTER TABLE `company_specialties_for_companies`
  ADD CONSTRAINT `company_specialties_for_companies_company_profile_id_foreign` FOREIGN KEY (`company_profile_id`) REFERENCES `company_profiles` (`id`),
  ADD CONSTRAINT `company_specialties_for_companies_specialty_id_foreign` FOREIGN KEY (`specialty_id`) REFERENCES `specialty` (`id`);

--
-- القيود للجدول `company_type_translations`
--
ALTER TABLE `company_type_translations`
  ADD CONSTRAINT `company_type_translations_company_type_id_foreign` FOREIGN KEY (`company_type_id`) REFERENCES `company_types` (`id`),
  ADD CONSTRAINT `company_type_translations_translated_languages_id_foreign` FOREIGN KEY (`translated_languages_id`) REFERENCES `translated_languages` (`id`);

--
-- القيود للجدول `contact_informations`
--
ALTER TABLE `contact_informations`
  ADD CONSTRAINT `contact_informations_resume_id_foreign` FOREIGN KEY (`resume_id`) REFERENCES `resumes` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `contact_numbers`
--
ALTER TABLE `contact_numbers`
  ADD CONSTRAINT `contact_numbers_contact_information_id_foreign` FOREIGN KEY (`contact_information_id`) REFERENCES `contact_informations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contact_numbers_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  ADD CONSTRAINT `contact_numbers_phone_types_id_foreign` FOREIGN KEY (`phone_type_id`) REFERENCES `phone_types` (`id`);

--
-- القيود للجدول `contact_sub_categories`
--
ALTER TABLE `contact_sub_categories`
  ADD CONSTRAINT `contact_sub_categories_contact_main_catagory_id_foreign` FOREIGN KEY (`contact_main_catagory_id`) REFERENCES `contact_main_catagories` (`id`);

--
-- القيود للجدول `country_translations`
--
ALTER TABLE `country_translations`
  ADD CONSTRAINT `country_translations_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  ADD CONSTRAINT `country_translations_translated_languages_id_foreign` FOREIGN KEY (`translated_languages_id`) REFERENCES `translated_languages` (`id`);

--
-- القيود للجدول `current_locations`
--
ALTER TABLE `current_locations`
  ADD CONSTRAINT `current_locations_personal_information_id_foreign` FOREIGN KEY (`personal_information_id`) REFERENCES `personal_informations` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `c_m_c_translations`
--
ALTER TABLE `c_m_c_translations`
  ADD CONSTRAINT `c_m_c_translations_contact_main_category_id_foreign` FOREIGN KEY (`contact_main_catagory_id`) REFERENCES `contact_main_catagories` (`id`),
  ADD CONSTRAINT `c_m_c_translations_translated_languages_id_foreign` FOREIGN KEY (`translated_languages_id`) REFERENCES `translated_languages` (`id`);

--
-- القيود للجدول `c_s_c_translations`
--
ALTER TABLE `c_s_c_translations`
  ADD CONSTRAINT `c_s_c_translations_contact_sub_category_id_foreign` FOREIGN KEY (`contact_sub_category_id`) REFERENCES `contact_sub_categories` (`id`),
  ADD CONSTRAINT `c_s_c_translations_translated_languages_id_foreign` FOREIGN KEY (`translated_languages_id`) REFERENCES `translated_languages` (`id`);

--
-- القيود للجدول `degree_level_translations`
--
ALTER TABLE `degree_level_translations`
  ADD CONSTRAINT `degree_level_translations_degree_level_id_foreign` FOREIGN KEY (`degree_level_id`) REFERENCES `degree_levels` (`id`),
  ADD CONSTRAINT `degree_level_translations_translated_languages_id_foreign` FOREIGN KEY (`translated_languages_id`) REFERENCES `translated_languages` (`id`);

--
-- القيود للجدول `education`
--
ALTER TABLE `education`
  ADD CONSTRAINT `education_degree_level_id_foreign` FOREIGN KEY (`degree_level_id`) REFERENCES `degree_levels` (`id`),
  ADD CONSTRAINT `education_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`id`),
  ADD CONSTRAINT `education_major_id_foreign` FOREIGN KEY (`major_id`) REFERENCES `majors` (`id`),
  ADD CONSTRAINT `education_minor_id_foreign` FOREIGN KEY (`minor_id`) REFERENCES `minors` (`id`),
  ADD CONSTRAINT `education_resume_id_foreign` FOREIGN KEY (`resume_id`) REFERENCES `resumes` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `education_projects`
--
ALTER TABLE `education_projects`
  ADD CONSTRAINT `education_projects_education_id_foreign` FOREIGN KEY (`education_id`) REFERENCES `education` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `emails`
--
ALTER TABLE `emails`
  ADD CONSTRAINT `emails_contact_information_id_foreign` FOREIGN KEY (`contact_information_id`) REFERENCES `contact_informations` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `employment_types`
--
ALTER TABLE `employment_types`
  ADD CONSTRAINT `employment_types_employment_type_parent_id_foreign` FOREIGN KEY (`employment_type_parent_id`) REFERENCES `employment_type_parents` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employment_types_work_experience_id_foreign` FOREIGN KEY (`work_experience_id`) REFERENCES `work_experiences` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `emp_type_parent_translations`
--
ALTER TABLE `emp_type_parent_translations`
  ADD CONSTRAINT `emp_type_parent_foreign` FOREIGN KEY (`employment_type_parent_id`) REFERENCES `employment_type_parents` (`id`),
  ADD CONSTRAINT `emp_type_parent_translations_translated_languages_id_foreign` FOREIGN KEY (`translated_languages_id`) REFERENCES `translated_languages` (`id`);

--
-- القيود للجدول `institutions`
--
ALTER TABLE `institutions`
  ADD CONSTRAINT `institutions_institution_type_id_foreign` FOREIGN KEY (`institution_type_id`) REFERENCES `institution_types` (`id`);

--
-- القيود للجدول `institution_translations`
--
ALTER TABLE `institution_translations`
  ADD CONSTRAINT `institution_translations_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`id`),
  ADD CONSTRAINT `institution_translations_translated_languages_id_foreign` FOREIGN KEY (`translated_languages_id`) REFERENCES `translated_languages` (`id`);

--
-- القيود للجدول `international_language_trans`
--
ALTER TABLE `international_language_trans`
  ADD CONSTRAINT `international_language_trans_international_language_id_foreign` FOREIGN KEY (`international_language_id`) REFERENCES `international_languages` (`id`),
  ADD CONSTRAINT `international_language_trans_translated_languages_id_foreign` FOREIGN KEY (`translated_languages_id`) REFERENCES `translated_languages` (`id`);

--
-- القيود للجدول `internet_communications`
--
ALTER TABLE `internet_communications`
  ADD CONSTRAINT `internet_communications_contact_information_id_foreign` FOREIGN KEY (`contact_information_id`) REFERENCES `contact_informations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `internet_communications_internet_communication_type_id_foreign` FOREIGN KEY (`internet_communication_type_id`) REFERENCES `internet_communication_types` (`id`);

--
-- القيود للجدول `majors`
--
ALTER TABLE `majors`
  ADD CONSTRAINT `majors_institution_type_id_foreign` FOREIGN KEY (`institution_type_id`) REFERENCES `institution_types` (`id`),
  ADD CONSTRAINT `majors_major_parent_id_foreign` FOREIGN KEY (`major_parent_id`) REFERENCES `major_parents` (`id`);

--
-- القيود للجدول `major_parent_translations`
--
ALTER TABLE `major_parent_translations`
  ADD CONSTRAINT `major_parent_translations_major_parent_id_foreign` FOREIGN KEY (`major_parent_id`) REFERENCES `major_parents` (`id`),
  ADD CONSTRAINT `major_parent_translations_translated_languages_id_foreign` FOREIGN KEY (`translated_languages_id`) REFERENCES `translated_languages` (`id`);

--
-- القيود للجدول `major_translations`
--
ALTER TABLE `major_translations`
  ADD CONSTRAINT `major_translations_major_id_foreign` FOREIGN KEY (`major_id`) REFERENCES `majors` (`id`),
  ADD CONSTRAINT `major_translations_translated_languages_id_foreign` FOREIGN KEY (`translated_languages_id`) REFERENCES `translated_languages` (`id`);

--
-- القيود للجدول `marital_status_translations`
--
ALTER TABLE `marital_status_translations`
  ADD CONSTRAINT `marital_status_translation_marital_status_id_foreign` FOREIGN KEY (`marital_status_id`) REFERENCES `marital_statuses` (`id`),
  ADD CONSTRAINT `marital_status_translation_translated_languages_id_foreign` FOREIGN KEY (`translated_languages_id`) REFERENCES `translated_languages` (`id`);

--
-- القيود للجدول `minor_translations`
--
ALTER TABLE `minor_translations`
  ADD CONSTRAINT `minor_translations_minor_id_foreign` FOREIGN KEY (`minor_id`) REFERENCES `minors` (`id`),
  ADD CONSTRAINT `minor_translations_translated_languages_id_foreign` FOREIGN KEY (`translated_languages_id`) REFERENCES `translated_languages` (`id`);

--
-- القيود للجدول `nationality_translations`
--
ALTER TABLE `nationality_translations`
  ADD CONSTRAINT `nationality_translations_nationality_id_foreign` FOREIGN KEY (`nationality_id`) REFERENCES `nationalities` (`id`),
  ADD CONSTRAINT `nationality_translations_translated_languages_id_foreign` FOREIGN KEY (`translated_languages_id`) REFERENCES `translated_languages` (`id`);

--
-- القيود للجدول `personal_informations`
--
ALTER TABLE `personal_informations`
  ADD CONSTRAINT `personal_informations_marital_status_id_foreign` FOREIGN KEY (`marital_status_id`) REFERENCES `marital_statuses` (`id`);

--
-- القيود للجدول `personal_links`
--
ALTER TABLE `personal_links`
  ADD CONSTRAINT `personal_links_social_media_id_foreign` FOREIGN KEY (`social_media_id`) REFERENCES `social_media` (`id`);

--
-- القيود للجدول `phone_type_translations`
--
ALTER TABLE `phone_type_translations`
  ADD CONSTRAINT `phone_types_translations_phone_types_id_foreign` FOREIGN KEY (`phone_type_id`) REFERENCES `phone_types` (`id`),
  ADD CONSTRAINT `phone_types_translations_translated_languages_id_foreign` FOREIGN KEY (`translated_languages_id`) REFERENCES `translated_languages` (`id`);

--
-- القيود للجدول `pre_defined_emails`
--
ALTER TABLE `pre_defined_emails`
  ADD CONSTRAINT `pre_defined_emails_contact_main_catagory_id_foreign` FOREIGN KEY (`contact_main_catagory_id`) REFERENCES `contact_main_catagories` (`id`),
  ADD CONSTRAINT `pre_defined_emails_contact_sub_category_id_foreign` FOREIGN KEY (`contact_sub_category_id`) REFERENCES `contact_sub_categories` (`id`),
  ADD CONSTRAINT `pre_defined_emails_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- القيود للجدول `recieved_emails`
--
ALTER TABLE `recieved_emails`
  ADD CONSTRAINT `recieved_emails_contact_main_catagory_id_foreign` FOREIGN KEY (`contact_main_catagory_id`) REFERENCES `contact_main_catagories` (`id`),
  ADD CONSTRAINT `recieved_emails_contact_sub_category_id_foreign` FOREIGN KEY (`contact_sub_category_id`) REFERENCES `contact_sub_categories` (`id`),
  ADD CONSTRAINT `recieved_emails_last_admin_comment_id_foreign` FOREIGN KEY (`last_admin_comment_id`) REFERENCES `contact_main_catagories` (`id`),
  ADD CONSTRAINT `recieved_emails_last_admin_done_email_log_id_foreign` FOREIGN KEY (`last_admin_done_email_log_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `recieved_emails_last_admin_note_done_email_log_id_foreign` FOREIGN KEY (`last_admin_note_done_email_log_id`) REFERENCES `admin_note_done_email_logs` (`id`),
  ADD CONSTRAINT `recieved_emails_last_admin_replied_email_id_foreign` FOREIGN KEY (`last_admin_replied_email_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `recieved_emails_last_admin_restore_email_log_id_foreign` FOREIGN KEY (`last_admin_restore_email_log_id`) REFERENCES `contact_sub_categories` (`id`),
  ADD CONSTRAINT `recieved_emails_translated_languages_id_foreign` FOREIGN KEY (`translated_languages_id`) REFERENCES `translated_languages` (`id`),
  ADD CONSTRAINT `recieved_emails_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- القيود للجدول `resumes`
--
ALTER TABLE `resumes`
  ADD CONSTRAINT `resumes_translated_languages_id_foreign` FOREIGN KEY (`translated_languages_id`) REFERENCES `translated_languages` (`id`);

--
-- القيود للجدول `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- القيود للجدول `specialty`
--
ALTER TABLE `specialty`
  ADD CONSTRAINT `specialty_company_industry_id_foreign` FOREIGN KEY (`company_industry_id`) REFERENCES `company_industries` (`id`);

--
-- القيود للجدول `specialty_translations`
--
ALTER TABLE `specialty_translations`
  ADD CONSTRAINT `specialty_translations_specialty_id_foreign` FOREIGN KEY (`specialty_id`) REFERENCES `specialty` (`id`),
  ADD CONSTRAINT `specialty_translations_translated_languages_id_foreign` FOREIGN KEY (`translated_languages_id`) REFERENCES `translated_languages` (`id`);

--
-- القيود للجدول `work_exp_companies`
--
ALTER TABLE `work_exp_companies`
  ADD CONSTRAINT `companies_work_experience_id_foreign` FOREIGN KEY (`work_experience_id`) REFERENCES `work_experiences` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `work_exp_companies_company_size_id_foreign` FOREIGN KEY (`company_size_id`) REFERENCES `company_sizes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
