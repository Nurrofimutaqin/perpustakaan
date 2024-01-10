-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 10, 2024 at 04:07 AM
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
-- Database: `perpustakaan_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `authtoken_token`
--

CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authtoken_token`
--

INSERT INTO `authtoken_token` (`key`, `created`, `user_id`) VALUES
('966b56ab520ab4634532ce1e63090f70231ab454', '2024-01-03 04:36:15.382341', 2);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add category book', 6, 'add_categorybook'),
(22, 'Can change category book', 6, 'change_categorybook'),
(23, 'Can delete category book', 6, 'delete_categorybook'),
(24, 'Can view category book', 6, 'view_categorybook'),
(25, 'Can add book', 7, 'add_book'),
(26, 'Can change book', 7, 'change_book'),
(27, 'Can delete book', 7, 'delete_book'),
(28, 'Can view book', 7, 'view_book'),
(29, 'Can add user', 8, 'add_customuser'),
(30, 'Can change user', 8, 'change_customuser'),
(31, 'Can delete user', 8, 'delete_customuser'),
(32, 'Can view user', 8, 'view_customuser'),
(33, 'Can add peminjaman', 9, 'add_peminjaman'),
(34, 'Can change peminjaman', 9, 'change_peminjaman'),
(35, 'Can delete peminjaman', 9, 'delete_peminjaman'),
(36, 'Can view peminjaman', 9, 'view_peminjaman'),
(37, 'Can add login history', 10, 'add_loginhistory'),
(38, 'Can change login history', 10, 'change_loginhistory'),
(39, 'Can delete login history', 10, 'delete_loginhistory'),
(40, 'Can view login history', 10, 'view_loginhistory'),
(41, 'Can add Token', 11, 'add_token'),
(42, 'Can change Token', 11, 'change_token'),
(43, 'Can delete Token', 11, 'delete_token'),
(44, 'Can view Token', 11, 'view_token'),
(45, 'Can add token', 12, 'add_tokenproxy'),
(46, 'Can change token', 12, 'change_tokenproxy'),
(47, 'Can delete token', 12, 'delete_tokenproxy'),
(48, 'Can view token', 12, 'view_tokenproxy'),
(49, 'Can add blacklisted token', 13, 'add_blacklistedtoken'),
(50, 'Can change blacklisted token', 13, 'change_blacklistedtoken'),
(51, 'Can delete blacklisted token', 13, 'delete_blacklistedtoken'),
(52, 'Can view blacklisted token', 13, 'view_blacklistedtoken'),
(53, 'Can add outstanding token', 14, 'add_outstandingtoken'),
(54, 'Can change outstanding token', 14, 'change_outstandingtoken'),
(55, 'Can delete outstanding token', 14, 'delete_outstandingtoken'),
(56, 'Can view outstanding token', 14, 'view_outstandingtoken');

-- --------------------------------------------------------

--
-- Table structure for table `book_book`
--

CREATE TABLE `book_book` (
  `id` bigint(20) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `penerbit` varchar(255) NOT NULL,
  `penulis` varchar(255) DEFAULT NULL,
  `tahun_terbit` int(11) DEFAULT NULL,
  `cover` varchar(100) DEFAULT NULL,
  `categorybook_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_book`
--

INSERT INTO `book_book` (`id`, `judul`, `penerbit`, `penulis`, `tahun_terbit`, `cover`, `categorybook_id`) VALUES
(1, 'IPS', 'Gramedia', 'Penulis', 2023, 'cover/ips.jpeg', 1),
(2, 'Jujutsu Kaisen', 'Gramedia', 'Gege Akutami', 2022, 'cover/Jujutsu_kaisen.jpg', 3),
(3, '5 CM', 'Rizal Mantovani', 'Grasindo', 2005, 'cover/5cm.jpg', 2),
(4, 'Tokyo Revenger', 'Kodansha', 'Ken Wakui', 2022, 'cover/tokrev_RBB4o3m.jpeg', 3),
(7, 'Penunggu Gunung Salak', 'Airlangga', 'Rafasangaji', 2021, 'cover/salak.jpg', 2),
(8, 'Naruto Shipuden', 'Pierrot', 'Hayato Date', 2009, 'cover/narutosip.jpg', 3);

-- --------------------------------------------------------

--
-- Table structure for table `book_categorybook`
--

CREATE TABLE `book_categorybook` (
  `id` bigint(20) NOT NULL,
  `namaCategory` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_categorybook`
--

INSERT INTO `book_categorybook` (`id`, `namaCategory`) VALUES
(1, 'Pendidikan'),
(2, 'Pendakian'),
(3, 'Anime'),
(4, 'Ilmiah');

-- --------------------------------------------------------

--
-- Table structure for table `book_customuser`
--

CREATE TABLE `book_customuser` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_customuser`
--

INSERT INTO `book_customuser` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `role`) VALUES
(1, 'pbkdf2_sha256$600000$vIcfDU2EVFnQosSdrxdcAP$+HSHUM3xKmLkgdk001ziT5EjpN91p4OIonUcZQAVmeA=', '2024-01-09 03:02:05.138079', 1, 'admin', 'Super', 'Admin', 'adminsuper@gmail.com', 1, 1, '2024-01-02 12:42:12.323121', 'librarian'),
(2, 'pbkdf2_sha256$600000$qThG53LF69CQj8HCPvhuN4$0b9JrflKU9yRRXZZzyB70DcZOGL/Y5xfwROGerR44UU=', '2024-01-09 07:22:08.888184', 0, 'nurrofimutaqin', 'Nurrofi', 'Mutaqin', 'nurrofi.mtq19@gmail.com', 0, 1, '2024-01-03 03:44:35.542899', 'member'),
(3, 'pbkdf2_sha256$600000$2rgEypBSIMW00KUJClDFIn$APAQL22hGhvbD1MYecFXxw2HiN/s7HBPpfvEKf40jaY=', '2024-01-09 08:19:14.678315', 0, 'teguhtri', 'Teguh', 'Trimulyo', 'teguhtri@gmail.com', 0, 1, '2024-01-03 11:01:39.663791', 'member'),
(5, 'pbkdf2_sha256$600000$hTAPhjXKDMaOrgo0yPfSju$I0fD5D+GpN47qZwx1MqAzBz3CwmRlWeQZ+ndwSnKeNM=', '2024-01-09 02:46:06.746598', 0, 'kbr272', 'KBR', '272', 'kbr@gmail.com', 0, 1, '2024-01-04 06:31:35.151544', 'member'),
(6, 'pbkdf2_sha256$600000$mzepx2VPXedvZ6wWxErCxI$Pc3a32A0Ot3JAnHE5v6yKsQDo/cyJTI/R88+Tok94+0=', NULL, 0, 'opaksing', '', '', '', 0, 1, '2024-01-05 07:14:25.418902', 'member'),
(8, 'pbkdf2_sha256$600000$XGo6v8v7CyRBxJk3TLfUQw$973ZQ69bJ37jNM+qlnsm2BbsqmIwHkEV+sWSaPPkgsM=', NULL, 0, 'kocaklo', '', '', '', 0, 1, '2024-01-05 08:03:59.412584', 'member'),
(10, 'pbkdf2_sha256$600000$s7UKjXRoMCs6hMM2jrlYSp$Yf5W2jMnjMGf+2+/bPiU+fRtZxkLvhThCkgK/heFkk0=', NULL, 0, 'kapanlagi', 'kapal', 'lagi', 'kapan@gmail.com', 0, 1, '2024-01-05 09:31:14.037216', 'member'),
(11, 'pbkdf2_sha256$600000$0NF6nFdJo5EFq7XiRUVYMx$YsPChfc4VOpuAHkbc28t9WrFSxCa5flVvL++9DOKRfo=', NULL, 0, 'wowowowo', '', '', 'wowowo@gmail.com', 0, 1, '2024-01-05 09:44:31.553045', 'member'),
(12, 'pbkdf2_sha256$600000$YbEDnryAxt9zX2upza4GbM$EfMlizJyWKbipPexYQukLPO+NjeH002Usk8ow07kSpU=', '2024-01-05 09:49:30.803432', 0, 'exsansantoso', '', '', 'exsan@gmail.com', 0, 1, '2024-01-05 09:48:33.676816', 'member'),
(13, 'pbkdf2_sha256$600000$JCaXEZUsckkfUvcsinPz5l$ib2qf24ob+ow3fvnws0N5QeW/p3KwFWULULL/QQicTY=', NULL, 0, 'siapasiloe', '', '', 'siapasiloe@gmail.com', 0, 1, '2024-01-05 10:15:22.358288', 'librarian'),
(14, 'pbkdf2_sha256$600000$d1o5AED2QUsLavyfvdbhr2$2ud/N8xQPgvG3/q07G5gYoCz2pGwDP6ygCzPK3UyPyw=', '2024-01-08 09:04:29.142970', 0, 'nurrofi1111', 'Nurrofi', 'Mutaqin', 'nurrofi.mtq19@gmail.com', 0, 1, '2024-01-05 10:46:38.363487', 'member'),
(15, 'pbkdf2_sha256$600000$lXrzVtb7dYi530HEe6O59Q$baEKlos5hFHxJNypMAxo5doI81C2/7EG6CqqsvVPBDM=', '2024-01-09 05:47:24.804137', 0, 'rafasangaji', '', '', 'rafasangaji@gmail.com', 0, 1, '2024-01-08 09:27:55.004669', 'librarian'),
(16, 'pbkdf2_sha256$600000$NyWnZJO3pZdXTzB5jmjbRM$bH9PEQb0EL5O2krOkeuVZI6dIcJfjKpSWJVArwTtkm4=', '2024-01-09 10:36:24.403673', 0, 'jarotin19', '', '', '', 0, 1, '2024-01-09 10:36:08.162582', 'member');

-- --------------------------------------------------------

--
-- Table structure for table `book_customuser_groups`
--

CREATE TABLE `book_customuser_groups` (
  `id` bigint(20) NOT NULL,
  `customuser_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `book_customuser_user_permissions`
--

CREATE TABLE `book_customuser_user_permissions` (
  `id` bigint(20) NOT NULL,
  `customuser_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `book_loginhistory`
--

CREATE TABLE `book_loginhistory` (
  `id` bigint(20) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `successful` tinyint(1) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_loginhistory`
--

INSERT INTO `book_loginhistory` (`id`, `timestamp`, `successful`, `user_id`) VALUES
(1, '2024-01-02 13:00:12.057675', 1, 1),
(2, '2024-01-03 03:44:48.691857', 1, 2),
(3, '2024-01-03 07:46:09.866519', 1, 2),
(4, '2024-01-03 08:49:19.654213', 1, 2),
(5, '2024-01-03 09:01:15.143013', 1, 1),
(6, '2024-01-03 09:11:49.724057', 1, 1),
(7, '2024-01-03 09:12:22.387362', 1, 2),
(8, '2024-01-03 09:16:40.237818', 1, 1),
(9, '2024-01-04 04:51:01.233416', 1, 2),
(10, '2024-01-05 02:55:19.414709', 1, 2),
(11, '2024-01-05 04:24:41.356539', 1, 5),
(12, '2024-01-05 04:33:37.244615', 1, 1),
(13, '2024-01-05 06:36:36.417564', 1, 1),
(14, '2024-01-05 07:24:23.167885', 1, 2),
(15, '2024-01-05 07:26:20.892539', 1, 2),
(16, '2024-01-05 07:55:21.520093', 1, 1),
(17, '2024-01-05 08:02:55.685175', 1, 5),
(18, '2024-01-05 09:49:30.808293', 1, 12),
(19, '2024-01-05 10:08:10.717251', 1, 1),
(20, '2024-01-08 05:36:17.793122', 1, 14),
(21, '2024-01-08 08:49:14.301553', 1, 2),
(22, '2024-01-08 09:04:29.146817', 1, 14),
(23, '2024-01-08 09:22:26.614531', 1, 1),
(24, '2024-01-08 09:25:38.797746', 1, 1),
(25, '2024-01-08 09:31:46.541066', 1, 2),
(26, '2024-01-08 10:30:45.848074', 1, 15),
(27, '2024-01-08 10:34:44.287020', 1, 3),
(28, '2024-01-08 10:46:00.684761', 1, 5),
(29, '2024-01-09 02:46:06.748001', 1, 5),
(30, '2024-01-09 02:46:56.529756', 1, 1),
(31, '2024-01-09 03:01:31.451921', 1, 1),
(32, '2024-01-09 03:02:05.140857', 1, 1),
(33, '2024-01-09 05:47:24.810859', 1, 15),
(34, '2024-01-09 07:22:08.892766', 1, 2),
(35, '2024-01-09 08:19:14.684165', 1, 3),
(36, '2024-01-09 10:36:24.406966', 1, 16);

-- --------------------------------------------------------

--
-- Table structure for table `book_peminjaman`
--

CREATE TABLE `book_peminjaman` (
  `id` bigint(20) NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `tanggal_kembali` date DEFAULT NULL,
  `tanggal_pengembalian` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `buku_id` bigint(20) NOT NULL,
  `member_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_peminjaman`
--

INSERT INTO `book_peminjaman` (`id`, `tanggal_pinjam`, `tanggal_kembali`, `tanggal_pengembalian`, `status`, `buku_id`, `member_id`) VALUES
(1, '2024-01-02', '2024-01-05', NULL, 0, 1, 1),
(2, '2024-01-03', '2024-01-05', NULL, 0, 1, 1),
(3, '2024-01-03', '2024-01-08', NULL, 0, 3, 2),
(4, '2024-01-05', '2024-01-08', NULL, 0, 1, 2),
(5, '2024-01-05', '2024-01-10', NULL, 0, 1, 1),
(6, '2024-01-05', '2024-01-10', NULL, 0, 1, 14),
(7, '2024-01-08', '2024-01-09', NULL, 0, 2, 3),
(8, '2024-01-08', '2024-01-10', NULL, 0, 8, 14),
(9, '2024-01-08', '2024-01-11', NULL, 0, 3, 14),
(10, '2024-01-08', '2024-01-15', NULL, 0, 7, 3),
(11, '2024-01-08', '2024-01-11', NULL, 0, 8, 2),
(12, '2024-01-08', '2024-01-11', NULL, 0, 2, 3),
(13, '2024-01-08', '2024-01-16', NULL, 0, 1, 3),
(14, '2024-01-08', '2024-01-10', NULL, 0, 4, 5),
(15, '2024-01-09', '2024-01-10', NULL, 0, 4, 3),
(16, '2024-01-09', '2024-01-12', NULL, 0, 8, 3),
(17, '2024-01-09', '2024-01-12', NULL, 0, 3, 16),
(18, '2024-01-10', '2024-01-11', NULL, 0, 2, 16),
(19, '2024-01-10', '2024-01-11', NULL, 0, 2, 16),
(20, '2024-01-10', '2024-01-12', NULL, 0, 3, 16),
(21, '2024-01-10', '2024-01-15', NULL, 0, 7, 16);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(11, 'authtoken', 'token'),
(12, 'authtoken', 'tokenproxy'),
(7, 'book', 'book'),
(6, 'book', 'categorybook'),
(8, 'book', 'customuser'),
(10, 'book', 'loginhistory'),
(9, 'book', 'peminjaman'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session'),
(13, 'token_blacklist', 'blacklistedtoken'),
(14, 'token_blacklist', 'outstandingtoken');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-01-02 12:38:45.196413'),
(2, 'contenttypes', '0002_remove_content_type_name', '2024-01-02 12:38:45.244259'),
(3, 'auth', '0001_initial', '2024-01-02 12:38:45.487915'),
(4, 'auth', '0002_alter_permission_name_max_length', '2024-01-02 12:38:45.545260'),
(5, 'auth', '0003_alter_user_email_max_length', '2024-01-02 12:38:45.559356'),
(6, 'auth', '0004_alter_user_username_opts', '2024-01-02 12:38:45.572394'),
(7, 'auth', '0005_alter_user_last_login_null', '2024-01-02 12:38:45.583292'),
(8, 'auth', '0006_require_contenttypes_0002', '2024-01-02 12:38:45.587070'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2024-01-02 12:38:45.597860'),
(10, 'auth', '0008_alter_user_username_max_length', '2024-01-02 12:38:45.605708'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2024-01-02 12:38:45.615831'),
(12, 'auth', '0010_alter_group_name_max_length', '2024-01-02 12:38:45.629790'),
(13, 'auth', '0011_update_proxy_permissions', '2024-01-02 12:38:45.642072'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2024-01-02 12:38:45.653158'),
(15, 'book', '0001_initial', '2024-01-02 12:38:45.974849'),
(16, 'admin', '0001_initial', '2024-01-02 12:38:46.089478'),
(17, 'admin', '0002_logentry_remove_auto_add', '2024-01-02 12:38:46.103410'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2024-01-02 12:38:46.122283'),
(19, 'book', '0002_delete_authuser', '2024-01-02 12:38:46.131523'),
(20, 'sessions', '0001_initial', '2024-01-02 12:38:46.159606'),
(21, 'book', '0003_customuser_phone', '2024-01-02 12:41:02.637305'),
(22, 'book', '0004_customuser_age', '2024-01-02 12:43:24.446685'),
(23, 'book', '0005_peminjaman_loginhistory', '2024-01-02 12:45:03.429944'),
(24, 'book', '0006_remove_customuser_age_remove_customuser_phone', '2024-01-03 03:39:55.947605'),
(25, 'authtoken', '0001_initial', '2024-01-03 04:35:26.292852'),
(26, 'authtoken', '0002_auto_20160226_1747', '2024-01-03 04:35:26.318591'),
(27, 'authtoken', '0003_tokenproxy', '2024-01-03 04:35:26.322265'),
(28, 'token_blacklist', '0001_initial', '2024-01-04 07:52:13.700654'),
(29, 'token_blacklist', '0002_outstandingtoken_jti_hex', '2024-01-04 07:52:13.717004'),
(30, 'token_blacklist', '0003_auto_20171017_2007', '2024-01-04 07:52:13.731532'),
(31, 'token_blacklist', '0004_auto_20171017_2013', '2024-01-04 07:52:13.798350'),
(32, 'token_blacklist', '0005_remove_outstandingtoken_jti', '2024-01-04 07:52:13.844633'),
(33, 'token_blacklist', '0006_auto_20171017_2113', '2024-01-04 07:52:13.870551'),
(34, 'token_blacklist', '0007_auto_20171017_2214', '2024-01-04 07:52:14.156957'),
(35, 'token_blacklist', '0008_migrate_to_bigautofield', '2024-01-04 07:52:14.406883'),
(36, 'token_blacklist', '0010_fix_migrate_to_bigautofield', '2024-01-04 07:52:14.452291'),
(37, 'token_blacklist', '0011_linearizes_history', '2024-01-04 07:52:14.455644'),
(38, 'token_blacklist', '0012_alter_outstandingtoken_user', '2024-01-04 07:52:14.469278');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('ijs4l9otdw5jyljeqyf4sohpx26kwq2y', '.eJxVjMsOwiAUBf-FtSG8Hy7d9xvIBS5SNZCUdmX8d9ukC92emTlvEmBba9gGLmHO5Eq4IZffMUJ6YjtIfkC7d5p6W5c50kOhJx106hlft9P9O6gw6l5rnqKUOntli0LvoESWUHBpUTCLCNyDNSrFko3WWXHlpWRut52IwgD5fAEMvzfd:1rN9T6:VRRdNcgzDb3AtYm6l_Ke3k72fYdmaj5aNJ90Q2D0HiQ', '2024-01-23 10:36:24.408767');

-- --------------------------------------------------------

--
-- Table structure for table `token_blacklist_blacklistedtoken`
--

CREATE TABLE `token_blacklist_blacklistedtoken` (
  `id` bigint(20) NOT NULL,
  `blacklisted_at` datetime(6) NOT NULL,
  `token_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `token_blacklist_blacklistedtoken`
--

INSERT INTO `token_blacklist_blacklistedtoken` (`id`, `blacklisted_at`, `token_id`) VALUES
(1, '2024-01-04 07:53:58.968065', 1),
(2, '2024-01-04 08:36:32.556406', 2),
(3, '2024-01-04 10:37:33.090002', 5),
(4, '2024-01-04 10:44:39.982572', 8),
(5, '2024-01-05 10:47:59.906381', 22),
(6, '2024-01-05 10:57:37.408976', 24);

-- --------------------------------------------------------

--
-- Table structure for table `token_blacklist_outstandingtoken`
--

CREATE TABLE `token_blacklist_outstandingtoken` (
  `id` bigint(20) NOT NULL,
  `token` longtext NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `expires_at` datetime(6) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `jti` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `token_blacklist_outstandingtoken`
--

INSERT INTO `token_blacklist_outstandingtoken` (`id`, `token`, `created_at`, `expires_at`, `user_id`, `jti`) VALUES
(1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNDM1ODM4NywiaWF0IjoxNzA0MzU0Nzg3LCJqdGkiOiI2MjdjYjZkMWQxYWM0YTI4YmM4YTJhZWUzNjVhOWYwMiIsInVzZXJfaWQiOjF9.c7CJfDeVYu4d2aH1uN1qrVAyvTawnDisdwS_jypdlbw', '2024-01-04 07:53:07.511123', '2024-01-04 08:53:07.000000', 1, '627cb6d1d1ac4a28bc8a2aee365a9f02'),
(2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNDM2MDkwNywiaWF0IjoxNzA0MzU3MzA3LCJqdGkiOiJjOWJhMWQ3OTVlN2I0MjkxOTgyYWVjMDI0ZDc5OWNiZCIsInVzZXJfaWQiOjF9.71LrBDbYKOvHmI9p8dAqGGF1CfI7w0KN3d7pWCoXaEg', '2024-01-04 08:35:07.604748', '2024-01-04 09:35:07.000000', 1, 'c9ba1d795e7b4291982aec024d799cbd'),
(3, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNDM2ODA4NywiaWF0IjoxNzA0MzY0NDg3LCJqdGkiOiI1NGFhNWM0YjJjNDE0MTg0OTU4MzA1YzVmNzJkNzc3MCIsInVzZXJfaWQiOjF9.Go1jvMkVFN05pAVcef31GlGEaymBGss7wdxMRBO62e0', '2024-01-04 10:34:47.671663', '2024-01-04 11:34:47.000000', 1, '54aa5c4b2c414184958305c5f72d7770'),
(4, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNDM2ODIyMiwiaWF0IjoxNzA0MzY0NjIyLCJqdGkiOiIxMjEzNTAxODNhYTU0N2UxYTUzOGMxMWFlOTk2NGNmYSIsInVzZXJfaWQiOjJ9.ZgJal28zi4RGXCZWmp51_nc-1J_KRfS7UMflqzt6vxY', '2024-01-04 10:37:02.341832', '2024-01-04 11:37:02.000000', 2, '121350183aa547e1a538c11ae9964cfa'),
(5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNDM2ODI1MywiaWF0IjoxNzA0MzY0NjUzLCJqdGkiOiJiMjRmNTlmODIzNGU0ZjE4YjlhYjYzOTIwMThkMTg5MCIsInVzZXJfaWQiOjJ9.nouZ1unlzN9LkYCzfNKIrsjY-J-59OZ1xSIH1xhcjWM', '2024-01-04 10:37:33.085001', '2024-01-04 11:37:33.000000', 2, 'b24f59f8234e4f18b9ab6392018d1890'),
(6, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNDM2ODI2OSwiaWF0IjoxNzA0MzY0NjY5LCJqdGkiOiI0NTRhNDMzOTU1YTk0NDkyODMxZDMwYjRmZTIwYTEyMSIsInVzZXJfaWQiOjJ9.a2nOqKGTrrM4i8a3pEIDpImRUzm92aD8WihwrbqL92A', '2024-01-04 10:37:49.173881', '2024-01-04 11:37:49.000000', 2, '454a433955a94492831d30b4fe20a121'),
(7, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNDM2ODYyNywiaWF0IjoxNzA0MzY1MDI3LCJqdGkiOiJiZjZhNjBiOTg2NGE0MTIyOTdmODgxZjk5YzFkM2MwNiIsInVzZXJfaWQiOjF9.5d5s4JppjOgoS0jOhZgKMln9sPs94RvI0Zvkaw55gV8', '2024-01-04 10:43:47.761495', '2024-01-04 11:43:47.000000', 1, 'bf6a60b9864a412297f881f99c1d3c06'),
(8, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNDM2ODY3OSwiaWF0IjoxNzA0MzY1MDc5LCJqdGkiOiJlYTlhNzU1MTgzODI0ZjI0OTFhNTU2NTQ1NTgxODNhNyIsInVzZXJfaWQiOjF9.r785LfZV94UsQiA50KkpX1eAEjgjxYOOjXp9baLnMOM', '2024-01-04 10:44:39.976121', '2024-01-04 11:44:39.000000', 1, 'ea9a755183824f2491a55654558183a7'),
(9, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNDM3NDY2OCwiaWF0IjoxNzA0MzcxMDY4LCJqdGkiOiIxZjMyNzU5MzM3OGY0ZjdmOTM5YWI3MWI4YzgxOWM2NiIsInVzZXJfaWQiOjJ9.6Agndqmeov8CgmPsAxElhliGJrk8C8UVB5tBg25zlE0', '2024-01-04 12:24:28.276668', '2024-01-04 13:24:28.000000', 2, '1f327593378f4f7f939ab71b8c819c66'),
(10, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNDM3NTAzNCwiaWF0IjoxNzA0MzcxNDM0LCJqdGkiOiJmMzZkZDI5OGJlYTM0MTgwOTBkYWQzZDc0NDU5N2U3YSIsInVzZXJfaWQiOjF9.2a0-6rGMtx23EbMTNJP7aSbkCV9BaZVZIUiKvHRHxo8', '2024-01-04 12:30:34.127586', '2024-01-04 13:30:34.000000', 1, 'f36dd298bea3418090dad3d744597e7a'),
(11, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNDQyODgyMywiaWF0IjoxNzA0NDI1MjIzLCJqdGkiOiIxYmJiZjk2YjEwNTQ0ZTY0OTEyYTliYTUwY2Y3MWNiNiIsInVzZXJfaWQiOjF9.mQWKS35qU7F1Kcsy-ouqJoOzjFQXkHFMi7_XUhZJgO4', '2024-01-05 03:27:03.546373', '2024-01-05 04:27:03.000000', 1, '1bbbf96b10544e64912a9ba50cf71cb6'),
(12, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNDQyOTU2NCwiaWF0IjoxNzA0NDI1OTY0LCJqdGkiOiI5ZmYwNWQ3MjFmNjU0ZGRkOWE0ZTMyZDg4ODI3YjZkYyIsInVzZXJfaWQiOjF9.hpiaES523Cfzy5PAe76X7ea2HG720goNaY-pp4XUkFw', '2024-01-05 03:39:24.455124', '2024-01-05 04:39:24.000000', 1, '9ff05d721f654ddd9a4e32d88827b6dc'),
(13, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNDQzMDc0NywiaWF0IjoxNzA0NDI3MTQ3LCJqdGkiOiJiNjk0N2NkMWNiNmQ0ZDY4ODM2NDI1YjM5MmNmY2M5NSIsInVzZXJfaWQiOjJ9.7qkB-VrrtnEBx4QqOL6vphAngOBjkfPKUCeWVQZXV3Q', '2024-01-05 03:59:07.214416', '2024-01-05 04:59:07.000000', 2, 'b6947cd1cb6d4d68836425b392cfcc95'),
(14, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNDQzMDkyNCwiaWF0IjoxNzA0NDI3MzI0LCJqdGkiOiJlMGYzOTM3Mjg4ZWU0YmVlYTFmNDUzY2RkNTgzMGVlOSIsInVzZXJfaWQiOjJ9.iSGNyIVZFc_-m5h64-Aw6z2NpNViLJLKH4nAwaX4uqg', '2024-01-05 04:02:04.831596', '2024-01-05 05:02:04.000000', 2, 'e0f3937288ee4beea1f453cdd5830ee9'),
(15, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNDQzMTE0NSwiaWF0IjoxNzA0NDI3NTQ1LCJqdGkiOiJlYmYyMDZjYTMxMDE0NjlmYjkzN2E4YjQyMWQxZDFjNyIsInVzZXJfaWQiOjJ9.up0QWKvqt9ftq7CkQZxIszqK5mpOePV9PxKYtZyis3c', '2024-01-05 04:05:45.442031', '2024-01-05 05:05:45.000000', 2, 'ebf206ca3101469fb937a8b421d1d1c7'),
(16, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNDQ0NTMxMiwiaWF0IjoxNzA0NDQxNzEyLCJqdGkiOiIxNjFjNThhYzU5Yzg0NjVkYmM3ZTIzYmY5OWM0ZjVkMyIsInVzZXJfaWQiOjJ9.9jJOZiZsB1EqKZz_41GDjLPELGrEWQJct4WoepYCQCQ', '2024-01-05 08:01:52.493367', '2024-01-05 09:01:52.000000', 2, '161c58ac59c8465dbc7e23bf99c4f5d3'),
(17, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNDQ0NTMzMywiaWF0IjoxNzA0NDQxNzMzLCJqdGkiOiI2OWViZjAwYWU2YmE0ODAzOGUwMDAyOTliNGM1NzZhYSIsInVzZXJfaWQiOjF9.edT-MZOL-a5oUsKjuFdXBzFFSoNiptZxBHeGXTKyUVo', '2024-01-05 08:02:13.557287', '2024-01-05 09:02:13.000000', 1, '69ebf00ae6ba48038e000299b4c576aa'),
(18, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNDQ1NDAxMSwiaWF0IjoxNzA0NDUwNDExLCJqdGkiOiI0NmJhNzZkYmJlZjQ0Y2E1YjVmNmQxMDg0Y2NmYWZkNSIsInVzZXJfaWQiOjF9.-x07pPxuqW0_SwWLgpANjVFJH6C8XBfiaAznNPKs9kY', '2024-01-05 10:26:51.786054', '2024-01-05 11:26:51.000000', 1, '46ba76dbbef44ca5b5f6d1084ccfafd5'),
(19, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNDQ1NDQ0MywiaWF0IjoxNzA0NDUwODQzLCJqdGkiOiJkZDhiMTkwODIzNzA0MWMxYjE1OWI2MmQ5YjZmNmNjNiIsInVzZXJfaWQiOjF9.KU30G6tSXg6DCFDzVLy6okVy32X5218FsDyZzeT52Kg', '2024-01-05 10:34:03.328746', '2024-01-05 11:34:03.000000', 1, 'dd8b1908237041c1b159b62d9b6f6cc6'),
(20, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNDQ1NTIzMCwiaWF0IjoxNzA0NDUxNjMwLCJqdGkiOiJjNDI0YmJmZTM2Mzc0ZDE4Yjc2OTFiZTQ1NzU3ZTM3MSIsInVzZXJfaWQiOjE0fQ.vX8M-LRJe-D6FSQyvmxDbAju7E2-59KlUBMibIv_mSk', '2024-01-05 10:47:10.207347', '2024-01-05 11:47:10.000000', 14, 'c424bbfe36374d18b7691be45757e371'),
(21, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNDQ1NTI1OSwiaWF0IjoxNzA0NDUxNjU5LCJqdGkiOiIyZGQwNzM4ZWY1NzQ0NzliOTEwNmUwNTUyNzk3MmJlNSIsInVzZXJfaWQiOjE0fQ.jT3P3sCYY4iUcl02lzhgUqdCz2cIueoJipuI4LFN5Hc', '2024-01-05 10:47:39.219557', '2024-01-05 11:47:39.000000', 14, '2dd0738ef574479b9106e05527972be5'),
(22, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNDQ1NTI3OSwiaWF0IjoxNzA0NDUxNjc5LCJqdGkiOiJhNDNiOTk5NDhlMmU0ZDA5YWNhY2YzZjgyNTdiOTMyOSIsInVzZXJfaWQiOjE0fQ.HGJJkNplU9kSlB5KqHi0M5lhuU08iRCW_f3ptRyawaY', '2024-01-05 10:47:59.896580', '2024-01-05 11:47:59.000000', 14, 'a43b99948e2e4d09acacf3f8257b9329'),
(23, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNDQ1NTMyNCwiaWF0IjoxNzA0NDUxNzI0LCJqdGkiOiI2YTc5YjRkODg0NjI0NmMwOTFiMDFhZjZiMjAwODJjYSIsInVzZXJfaWQiOjE0fQ.NWvFmkBJWaXfMQwI6z8wFJ6_DyR67kKvyFJ4dGBg4h4', '2024-01-05 10:48:44.545719', '2024-01-05 11:48:44.000000', 14, '6a79b4d8846246c091b01af6b20082ca'),
(24, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNDQ1NTc1MywiaWF0IjoxNzA0NDUyMTUzLCJqdGkiOiIwZDQxZjIwZDEzODE0OWRhOTNjNjVlMzhmYTczZmVjYiIsInVzZXJfaWQiOjF9.1oRlMoqbdH5WblQgVQSIAQdurV83nMVPWaiFOE9K9jc', '2024-01-05 10:55:53.304667', '2024-01-05 11:55:53.000000', 1, '0d41f20d138149da93c65e38fa73fecb'),
(25, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNDcwMjI5MCwiaWF0IjoxNzA0Njk4NjkwLCJqdGkiOiJiMTAwOTM0ZmQ1Zjk0NjBlOWRmMTg2NmNhZmJlYzRmMyIsInVzZXJfaWQiOjE0fQ.urnSqY56o1nRQ2gocbdwkV6e7VOSJYe_ojM0bNpm8vw', '2024-01-08 07:24:50.444921', '2024-01-08 08:24:50.000000', 14, 'b100934fd5f9460e9df1866cafbec4f3'),
(26, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNDcwNDU0MCwiaWF0IjoxNzA0NzAwOTQwLCJqdGkiOiIxZjk5NDZiODY3ZTQ0OTRiOWUxNjkyODA0YWJhYTY0ZSIsInVzZXJfaWQiOjE0fQ.KU8pEQQVnVYpuW3xIwbc2LhE0kifkogy7IlBXuVkixw', '2024-01-08 08:02:20.091195', '2024-01-08 09:02:20.000000', 14, '1f9946b867e4494b9e1692804abaa64e'),
(27, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNDc5NTM3NCwiaWF0IjoxNzA0NzkxNzc0LCJqdGkiOiIwNTAxOTI1Mzg3NmU0NTdlYTQ2MzQ5NDVlNDcxYjYxZiIsInVzZXJfaWQiOjE0fQ.w9Zg2uEh1yc-KXkSO96y-xxb4ze4Zvjfm5FRJGoJ3sI', '2024-01-09 09:16:14.785497', '2024-01-09 10:16:14.000000', 14, '05019253876e457ea4634945e471b61f'),
(28, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNDgwMDIzNCwiaWF0IjoxNzA0Nzk2NjM0LCJqdGkiOiIyMmY3NmY1Njk5MWQ0YjIzYmIyMzdiMTg0MDkzNjg1MCIsInVzZXJfaWQiOjE2fQ.K1abNsFV6iUhk8zTtQFY6lwLlijTk-nXTVtmTd2RL1M', '2024-01-09 10:37:14.114087', '2024-01-09 11:37:14.000000', 16, '22f76f56991d4b23bb237b1840936850'),
(29, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNDgwMTI5OCwiaWF0IjoxNzA0Nzk3Njk4LCJqdGkiOiI4MzQ4MjI5ODE3NDg0NjM5OTM1OTg0OWJiMTYyNzJmZiIsInVzZXJfaWQiOjE2fQ.VcOHwyqRDJzmn1xr-rY7zJ6UFRKcEh6UOLZp5QjyYGo', '2024-01-09 10:54:58.103728', '2024-01-09 11:54:58.000000', 16, '83482298174846399359849bb16272ff');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `book_book`
--
ALTER TABLE `book_book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_book_categorybook_id_717950a5_fk_book_categorybook_id` (`categorybook_id`);

--
-- Indexes for table `book_categorybook`
--
ALTER TABLE `book_categorybook`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book_customuser`
--
ALTER TABLE `book_customuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `book_customuser_groups`
--
ALTER TABLE `book_customuser_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `book_customuser_groups_customuser_id_group_id_d36cf534_uniq` (`customuser_id`,`group_id`),
  ADD KEY `book_customuser_groups_group_id_7a7a0664_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `book_customuser_user_permissions`
--
ALTER TABLE `book_customuser_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `book_customuser_user_per_customuser_id_permission_12ad351d_uniq` (`customuser_id`,`permission_id`),
  ADD KEY `book_customuser_user_permission_id_f7d2381f_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `book_loginhistory`
--
ALTER TABLE `book_loginhistory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_loginhistory_user_id_6c508af6_fk_book_customuser_id` (`user_id`);

--
-- Indexes for table `book_peminjaman`
--
ALTER TABLE `book_peminjaman`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_peminjaman_buku_id_172ed49b_fk_book_book_id` (`buku_id`),
  ADD KEY `book_peminjaman_member_id_e1af54b2_fk_book_customuser_id` (`member_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_book_customuser_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `token_blacklist_blacklistedtoken`
--
ALTER TABLE `token_blacklist_blacklistedtoken`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token_id` (`token_id`);

--
-- Indexes for table `token_blacklist_outstandingtoken`
--
ALTER TABLE `token_blacklist_outstandingtoken`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_uniq` (`jti`),
  ADD KEY `token_blacklist_outs_user_id_83bc629a_fk_book_cust` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `book_book`
--
ALTER TABLE `book_book`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `book_categorybook`
--
ALTER TABLE `book_categorybook`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `book_customuser`
--
ALTER TABLE `book_customuser`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `book_customuser_groups`
--
ALTER TABLE `book_customuser_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `book_customuser_user_permissions`
--
ALTER TABLE `book_customuser_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `book_loginhistory`
--
ALTER TABLE `book_loginhistory`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `book_peminjaman`
--
ALTER TABLE `book_peminjaman`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `token_blacklist_blacklistedtoken`
--
ALTER TABLE `token_blacklist_blacklistedtoken`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `token_blacklist_outstandingtoken`
--
ALTER TABLE `token_blacklist_outstandingtoken`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD CONSTRAINT `authtoken_token_user_id_35299eff_fk_book_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `book_customuser` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `book_book`
--
ALTER TABLE `book_book`
  ADD CONSTRAINT `book_book_categorybook_id_717950a5_fk_book_categorybook_id` FOREIGN KEY (`categorybook_id`) REFERENCES `book_categorybook` (`id`);

--
-- Constraints for table `book_customuser_groups`
--
ALTER TABLE `book_customuser_groups`
  ADD CONSTRAINT `book_customuser_grou_customuser_id_5f9ab683_fk_book_cust` FOREIGN KEY (`customuser_id`) REFERENCES `book_customuser` (`id`),
  ADD CONSTRAINT `book_customuser_groups_group_id_7a7a0664_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `book_customuser_user_permissions`
--
ALTER TABLE `book_customuser_user_permissions`
  ADD CONSTRAINT `book_customuser_user_customuser_id_2068872c_fk_book_cust` FOREIGN KEY (`customuser_id`) REFERENCES `book_customuser` (`id`),
  ADD CONSTRAINT `book_customuser_user_permission_id_f7d2381f_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `book_loginhistory`
--
ALTER TABLE `book_loginhistory`
  ADD CONSTRAINT `book_loginhistory_user_id_6c508af6_fk_book_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `book_customuser` (`id`);

--
-- Constraints for table `book_peminjaman`
--
ALTER TABLE `book_peminjaman`
  ADD CONSTRAINT `book_peminjaman_buku_id_172ed49b_fk_book_book_id` FOREIGN KEY (`buku_id`) REFERENCES `book_book` (`id`),
  ADD CONSTRAINT `book_peminjaman_member_id_e1af54b2_fk_book_customuser_id` FOREIGN KEY (`member_id`) REFERENCES `book_customuser` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_book_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `book_customuser` (`id`);

--
-- Constraints for table `token_blacklist_blacklistedtoken`
--
ALTER TABLE `token_blacklist_blacklistedtoken`
  ADD CONSTRAINT `token_blacklist_blacklistedtoken_token_id_3cc7fe56_fk` FOREIGN KEY (`token_id`) REFERENCES `token_blacklist_outstandingtoken` (`id`);

--
-- Constraints for table `token_blacklist_outstandingtoken`
--
ALTER TABLE `token_blacklist_outstandingtoken`
  ADD CONSTRAINT `token_blacklist_outs_user_id_83bc629a_fk_book_cust` FOREIGN KEY (`user_id`) REFERENCES `book_customuser` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
