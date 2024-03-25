-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 09, 2021 at 05:52 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory_barang`
--

-- --------------------------------------------------------

--
-- Table structure for table `barangs`
--

CREATE TABLE `barangs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `devisi_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barangs`
--

INSERT INTO `barangs` (`id`, `devisi_id`, `user_id`, `nama_barang`, `jumlah_barang`, `created_at`, `updated_at`) VALUES
(15, 3, 3, 'Tiang X Banner', '100', '2021-10-09 03:15:13', NULL),
(16, 3, 3, 'BahanspandukStandar 280', '100', '2021-10-09 03:15:13', NULL),
(17, 3, 3, 'BahanSpandukHirest 280', '100', '2021-10-09 03:16:55', NULL),
(18, 3, 3, 'BahanSpandukKorchin', '100', '2021-10-09 03:17:43', NULL),
(19, 3, 3, 'Eco Solvent ', '100', '2021-10-09 03:17:43', NULL),
(20, 3, 3, 'Kertas HVS', '100', '2021-10-09 03:18:38', NULL),
(21, 3, 3, 'Streples', '100', '2021-10-09 03:18:38', NULL),
(22, 3, 3, 'Plastik Ukuran A3\r\n', '100', '2021-10-09 03:20:58', NULL),
(23, 3, 3, 'Plastik Ukuran A5\r\n', '100', '2021-10-09 03:20:58', NULL),
(24, 3, 3, 'Solasi', '100', '2021-10-09 03:22:24', NULL),
(25, 2, 2, 'KertasAlbatros', '100', '2021-10-09 03:23:01', NULL),
(26, 2, 2, 'Sticker Vinyl standar', '100', '2021-10-09 03:23:01', NULL),
(27, 2, 2, 'Sticker Vinyl Ritrama', '100', '2021-10-09 03:23:47', NULL),
(28, 2, 2, 'Sticker Vinyl 3M', '100', '2021-10-09 03:23:47', NULL),
(29, 2, 2, 'Sticker Vinyl Graftac', '100', '2021-10-09 03:24:42', NULL),
(30, 2, 2, 'Sticker Transparant', '100', '2021-10-09 03:24:42', NULL),
(31, 2, 2, 'Eco Solvent', '100', '2021-10-09 03:25:42', NULL),
(32, 2, 2, 'Jarum Gunting', '100', '2021-10-09 03:25:42', NULL),
(33, 2, 2, 'Roll Banner', '100', '2021-10-09 03:26:45', NULL),
(34, 1, 1, 'Stiker Cromo', '100', '2021-10-09 03:33:49', NULL),
(35, 1, 1, 'Stiker Vinyl', '100', '2021-10-09 03:33:49', NULL),
(36, 1, 1, 'Stiker Transparant', '100', '2021-10-09 03:34:42', NULL),
(37, 1, 1, 'BW', '100', '2021-10-09 03:34:42', NULL),
(38, 1, 1, 'Linen', '100', '2021-10-09 03:35:39', NULL),
(39, 1, 1, 'Jasmine', '100', '2021-10-09 03:35:39', NULL),
(40, 1, 1, 'Photo Paper', '100', '2021-10-09 03:36:26', NULL),
(42, 1, 1, 'AC210', '100', '2021-10-09 03:37:04', NULL),
(43, 1, 1, 'AP120', '100', '2021-10-09 03:37:04', NULL),
(44, 1, 1, 'AC230', '100', '2021-10-09 03:39:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `barang_keluars`
--

CREATE TABLE `barang_keluars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `barang_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `devisi_id` bigint(20) UNSIGNED NOT NULL,
  `qty` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Triggers `barang_keluars`
--
DELIMITER $$
CREATE TRIGGER `barang_keluars_cancel` AFTER DELETE ON `barang_keluars` FOR EACH ROW BEGIN
	UPDATE barangs SET jumlah_barang = jumlah_barang + OLD.qty WHERE id = OLD.barang_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `barang_keluars_ok` AFTER INSERT ON `barang_keluars` FOR EACH ROW BEGIN
	UPDATE barangs SET jumlah_barang = jumlah_barang - NEW.qty WHERE id = NEW.barang_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `devisis`
--

CREATE TABLE `devisis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_devisi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `devisis`
--

INSERT INTO `devisis` (`id`, `nama_devisi`, `created_at`, `updated_at`) VALUES
(1, 'Docu', '2021-09-20 05:57:56', '2021-10-08 00:59:30'),
(2, 'Indoor', '2021-09-20 05:58:03', '2021-10-08 00:59:22'),
(3, 'Outdoor', '2021-09-20 05:58:15', '2021-10-03 05:19:10'),
(5, 'Administrator', '2021-10-08 01:01:44', '2021-10-08 01:01:44');

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
-- Table structure for table `kategoris`
--

CREATE TABLE `kategoris` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_kategori` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_09_19_032719_create_kategoris_table', 1),
(6, '2021_09_19_133359_create_devisis_table', 1),
(7, '2021_09_19_152259_add_devisi_id_to_users_table', 1),
(8, '2021_09_20_040948_create_barangs_table', 1),
(10, '2021_09_21_141710_create_barang_keluars_table', 2),
(12, '2021_09_26_132408_create_barang_keluars_table', 3),
(13, '2014_10_12_200000_add_two_factor_columns_to_users_table', 4),
(14, '2021_09_29_022416_create_sessions_table', 4),
(15, '2021_09_30_030715_add_user_id_to_barang_keluars_table', 5),
(16, '2021_10_03_131752_create_barang_keluars_table', 6),
(18, '2021_10_05_033859_create_barang_keluars_table', 7),
(19, '2021_10_05_075522_create_barang_keluars_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('EcQJFKXptK91Bj7KuLDCgqq4TJkgRMi8iPkx4rPg', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZmREbFVRVGtEcFpDem83S3I2TnhxbnBMOFhhWTFhYUpFYWU5VXJRRSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fX0=', 1633751465);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `devisi_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `devisi_id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'Syahril Hidayat', 'syahril@example.com', NULL, '$2y$10$cefyw5E3r43rw6w4.41R/.a54cvl2s4c/xAN2PJXIR/uS7hEPa2kC', NULL, NULL, NULL, '2021-09-20 13:10:23', NULL),
(2, 2, 'Muhammad Hasan', 'hasan@example.com', NULL, '$2y$10$cefyw5E3r43rw6w4.41R/.a54cvl2s4c/xAN2PJXIR/uS7hEPa2kC', NULL, NULL, NULL, '2021-09-20 13:10:23', NULL),
(3, 3, 'Maharani', 'rani@example.com', NULL, '$2y$10$cefyw5E3r43rw6w4.41R/.a54cvl2s4c/xAN2PJXIR/uS7hEPa2kC', NULL, NULL, NULL, '2021-09-20 13:11:56', NULL),
(4, 1, 'Aril', 'aril@example.com', NULL, '$2y$10$2z9Lszt9Yi/3KcN6ZtdB2.CjaLN.1gqDan4lk772AuIpSB8nf0ZKu', NULL, NULL, NULL, '2021-09-24 07:19:56', '2021-09-24 07:19:56'),
(5, 2, 'hidayat', 'hidayat@example.com', NULL, '$2y$10$d2KHIkQchDVrgpSvYanWI.1BKqGD0HrA2lYBQ.Y./eQO8jwk8j3CC', NULL, NULL, NULL, '2021-09-30 08:26:19', '2021-09-30 08:26:19'),
(6, 5, 'Administrator', 'admin@example.com', NULL, '$2y$10$ne5KhSw5qpuhauFoeBf3MO5XqphD1w/OOmVyZytHNyubgjXVmFK2G', NULL, NULL, NULL, '2021-10-08 06:54:23', '2021-10-08 06:54:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barangs`
--
ALTER TABLE `barangs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barang_keluars`
--
ALTER TABLE `barang_keluars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barang_keluars_barang_id_foreign` (`barang_id`),
  ADD KEY `barang_keluars_user_id_foreign` (`user_id`),
  ADD KEY `barang_keluars_devisi_id_foreign` (`devisi_id`);

--
-- Indexes for table `devisis`
--
ALTER TABLE `devisis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `kategoris`
--
ALTER TABLE `kategoris`
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
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_devisi_id_foreign` (`devisi_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barangs`
--
ALTER TABLE `barangs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `barang_keluars`
--
ALTER TABLE `barang_keluars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `devisis`
--
ALTER TABLE `devisis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategoris`
--
ALTER TABLE `kategoris`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang_keluars`
--
ALTER TABLE `barang_keluars`
  ADD CONSTRAINT `barang_keluars_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `barangs` (`id`),
  ADD CONSTRAINT `barang_keluars_devisi_id_foreign` FOREIGN KEY (`devisi_id`) REFERENCES `devisis` (`id`),
  ADD CONSTRAINT `barang_keluars_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_devisi_id_foreign` FOREIGN KEY (`devisi_id`) REFERENCES `devisis` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
