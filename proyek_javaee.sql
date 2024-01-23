-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2023 at 05:24 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `proyek_javaee`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking_ruangan`
--

CREATE TABLE `booking_ruangan` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_ruangan` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `jam` time NOT NULL,
  `waktu` int(11) NOT NULL,
  `keperluan` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking_ruangan`
--

INSERT INTO `booking_ruangan` (`id`, `id_user`, `id_ruangan`, `tanggal`, `jam`, `waktu`, `keperluan`, `status`, `created_at`) VALUES
(16, 1, 1, '2023-12-14', '17:02:00', 1, 'jasdlf', 0, '2023-12-13 09:02:06'),
(17, 1, 1, '2023-12-14', '17:03:00', 1, 'dfd', 0, '2023-12-13 13:04:11'),
(18, 1, 1, '2023-12-14', '17:15:00', 1, 'asdfsa', 0, '2023-12-13 13:15:19');

-- --------------------------------------------------------

--
-- Table structure for table `izin_bermalam`
--

CREATE TABLE `izin_bermalam` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `keperluan` varchar(100) NOT NULL,
  `tanggal` date NOT NULL,
  `jam` time DEFAULT NULL,
  `kembali` date NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `izin_bermalam`
--

INSERT INTO `izin_bermalam` (`id`, `id_user`, `keperluan`, `tanggal`, `jam`, `kembali`, `status`, `created_at`) VALUES
(18, 1, 'sjdalkf', '2023-12-14', '23:01:00', '2023-12-16', 1, '2023-12-13 15:01:11');

-- --------------------------------------------------------

--
-- Table structure for table `izin_keluar`
--

CREATE TABLE `izin_keluar` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `keperluan` varchar(100) NOT NULL,
  `tanggal` date NOT NULL,
  `jam` time NOT NULL,
  `jam_kembali` time NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `izin_keluar`
--

INSERT INTO `izin_keluar` (`id`, `id_user`, `keperluan`, `tanggal`, `jam`, `jam_kembali`, `status`, `created_at`) VALUES
(13, 1, 'pangkas', '2023-12-15', '11:21:00', '13:21:00', 1, '2023-12-14 04:21:43');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_kaos`
--

CREATE TABLE `pembelian_kaos` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `ukuran` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `total` double NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembelian_kaos`
--

INSERT INTO `pembelian_kaos` (`id`, `id_user`, `ukuran`, `jumlah`, `total`, `status`, `created_at`) VALUES
(1, 1, 3, 1, 100000, 1, '2023-12-12 06:46:01');

-- --------------------------------------------------------

--
-- Table structure for table `request_surat`
--

CREATE TABLE `request_surat` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_surat` int(11) NOT NULL,
  `keperluan` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ruangan`
--

CREATE TABLE `ruangan` (
  `id` int(11) NOT NULL,
  `nama_ruangan` varchar(20) NOT NULL,
  `deskripsi_ruangan` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ruangan`
--

INSERT INTO `ruangan` (`id`, `nama_ruangan`, `deskripsi_ruangan`, `created_at`) VALUES
(1, 'audit', 'ruangan audit', '2023-12-07 06:02:08'),
(7, 'gd 515', 'lapangan hijau', '2023-12-07 14:35:43');

-- --------------------------------------------------------

--
-- Table structure for table `surat`
--

CREATE TABLE `surat` (
  `id` int(11) NOT NULL,
  `nama_surat` varchar(20) NOT NULL,
  `deskripsi` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `surat`
--

INSERT INTO `surat` (`id`, `nama_surat`, `deskripsi`, `created_at`) VALUES
(2, 'Surat Pemutihan', 'asdlasdfkj', '2023-12-13 15:55:44'),
(3, 'asdfasdf', 'asdfa', '2023-12-13 15:56:09');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `no_telepon` bigint(20) NOT NULL,
  `no_ktp` bigint(20) NOT NULL,
  `nim` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama`, `no_telepon`, `no_ktp`, `nim`, `username`, `password`) VALUES
(1, 'benned', 8123123, 12312312312, '1231321', 'ben', 'tam'),
(3, 'PAULINA TAMBUNAN', 123123123123, 123132123, '12312311231', 'asdfsadf', 'adsfasdf'),
(4, 'Suandika', 12312312, 123123123123, '123123', 'suan', 'suan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking_ruangan`
--
ALTER TABLE `booking_ruangan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_ruangan` (`id_ruangan`);

--
-- Indexes for table `izin_bermalam`
--
ALTER TABLE `izin_bermalam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `izin_keluar`
--
ALTER TABLE `izin_keluar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `pembelian_kaos`
--
ALTER TABLE `pembelian_kaos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `request_surat`
--
ALTER TABLE `request_surat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `ruangan`
--
ALTER TABLE `ruangan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surat`
--
ALTER TABLE `surat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking_ruangan`
--
ALTER TABLE `booking_ruangan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `izin_bermalam`
--
ALTER TABLE `izin_bermalam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `izin_keluar`
--
ALTER TABLE `izin_keluar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `pembelian_kaos`
--
ALTER TABLE `pembelian_kaos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `request_surat`
--
ALTER TABLE `request_surat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ruangan`
--
ALTER TABLE `ruangan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `surat`
--
ALTER TABLE `surat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking_ruangan`
--
ALTER TABLE `booking_ruangan`
  ADD CONSTRAINT `booking_ruangan_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `booking_ruangan_ibfk_2` FOREIGN KEY (`id_ruangan`) REFERENCES `ruangan` (`id`);

--
-- Constraints for table `izin_bermalam`
--
ALTER TABLE `izin_bermalam`
  ADD CONSTRAINT `izin_bermalam_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Constraints for table `izin_keluar`
--
ALTER TABLE `izin_keluar`
  ADD CONSTRAINT `izin_keluar_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Constraints for table `pembelian_kaos`
--
ALTER TABLE `pembelian_kaos`
  ADD CONSTRAINT `pembelian_kaos_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Constraints for table `request_surat`
--
ALTER TABLE `request_surat`
  ADD CONSTRAINT `request_surat_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
