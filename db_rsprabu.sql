-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 19, 2024 at 12:18 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_rsprabu`
--

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `kd_dokter` varchar(10) NOT NULL,
  `nama_dokter` varchar(20) NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `spesialis` varchar(30) NOT NULL,
  `harga` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`kd_dokter`, `nama_dokter`, `no_telp`, `jenis_kelamin`, `alamat`, `spesialis`, `harga`) VALUES
('D001', 'Dzakir Naik', '083174844798', 'Laki-Laki', 'BANDUNG', 'GIGI', 500000),
('D002', 'Megawati', '081375992404', 'Perempuan', 'BANDUNG', 'GIZI', 1000000);

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `kd_resep` varchar(10) NOT NULL,
  `resep_obat` varchar(100) NOT NULL,
  `dosis` varchar(100) NOT NULL,
  `harga` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`kd_resep`, `resep_obat`, `dosis`, `harga`) VALUES
('OB001', 'Oskadon', '3', 100000),
('OB002', 'Combantrin', '6', 200000);

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `kd_pasien` varchar(10) NOT NULL,
  `nama_pasien` varchar(20) NOT NULL,
  `umur` varchar(10) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `alamat` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`kd_pasien`, `nama_pasien`, `umur`, `jenis_kelamin`, `alamat`) VALUES
('P001', 'Raden Kiansantang', '27', 'Laki-Laki', 'BANDUNG'),
('P002', 'Sri Baduga', '34', 'Perempuan', 'BANDUNG');

-- --------------------------------------------------------

--
-- Table structure for table `pemeriksaan`
--

CREATE TABLE `pemeriksaan` (
  `kd_pemeriksaan` varchar(10) NOT NULL,
  `kd_dokter` varchar(10) NOT NULL,
  `nama_dokter` varchar(20) NOT NULL,
  `kd_pasien` varchar(10) NOT NULL,
  `nama_pasien` varchar(20) NOT NULL,
  `diagnosa` varchar(100) NOT NULL,
  `tgl_pemeriksaan` varchar(10) NOT NULL,
  `hasil` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pemeriksaan`
--

INSERT INTO `pemeriksaan` (`kd_pemeriksaan`, `kd_dokter`, `nama_dokter`, `kd_pasien`, `nama_pasien`, `diagnosa`, `tgl_pemeriksaan`, `hasil`) VALUES
('KP001', 'D001', 'Dzakir Naik', 'P001', 'Raden Kiansantang', 'Berat', '2024-07-11', 'Rawat Inap'),
('KP002', 'D002', 'Megawati', 'P002', 'Sri Baduga', 'Ringan', '2024-07-14', 'Rawat Jalan');

-- --------------------------------------------------------

--
-- Table structure for table `perawat`
--

CREATE TABLE `perawat` (
  `kd_perawat` varchar(10) NOT NULL,
  `nama_perawat` varchar(20) NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `alamat` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `perawat`
--

INSERT INTO `perawat` (`kd_perawat`, `nama_perawat`, `no_telp`, `jenis_kelamin`, `alamat`) VALUES
('PE001', 'Pablo', '089867455654', 'Laki-Laki', 'BANDUNG');

-- --------------------------------------------------------

--
-- Table structure for table `rawat_inap`
--

CREATE TABLE `rawat_inap` (
  `kd_inap` varchar(10) NOT NULL,
  `kd_ruangan` varchar(10) NOT NULL,
  `nama_ruangan` varchar(20) NOT NULL,
  `biaya` int(30) NOT NULL,
  `kd_dokter` varchar(10) NOT NULL,
  `nama_dokter` varchar(20) NOT NULL,
  `spesialis` varchar(30) NOT NULL,
  `biaya_dokter` int(30) NOT NULL,
  `kd_pasien` varchar(10) NOT NULL,
  `nama_pasien` varchar(20) NOT NULL,
  `kd_perawat` varchar(10) NOT NULL,
  `nama_perawat` varchar(20) NOT NULL,
  `tgl_inap` date NOT NULL,
  `tgl_keluar` date DEFAULT NULL,
  `lama_menginap` varchar(10) DEFAULT NULL,
  `total_biaya` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `rawat_inap`
--

INSERT INTO `rawat_inap` (`kd_inap`, `kd_ruangan`, `nama_ruangan`, `biaya`, `kd_dokter`, `nama_dokter`, `spesialis`, `biaya_dokter`, `kd_pasien`, `nama_pasien`, `kd_perawat`, `nama_perawat`, `tgl_inap`, `tgl_keluar`, `lama_menginap`, `total_biaya`) VALUES
('RI001', 'R001', 'JAVA', 200000, 'D001', 'Dzakir Naik', 'GIGI', 500000, 'P001', 'Raden Kiansantang', 'PE001', 'Pablo', '2024-07-11', '2024-07-14', '3', 'Rp. 1.100.000');

-- --------------------------------------------------------

--
-- Table structure for table `rawat_jalan`
--

CREATE TABLE `rawat_jalan` (
  `kd_jalan` varchar(10) NOT NULL,
  `kd_dokter` varchar(10) NOT NULL,
  `nama_dokter` varchar(20) NOT NULL,
  `spesialis` varchar(30) NOT NULL,
  `biaya_dokter` int(30) NOT NULL,
  `kd_pasien` varchar(10) NOT NULL,
  `nama_pasien` varchar(20) NOT NULL,
  `kd_resep` varchar(10) NOT NULL,
  `resep_obat` varchar(100) NOT NULL,
  `harga` int(30) NOT NULL,
  `tgl_periksa` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `rawat_jalan`
--

INSERT INTO `rawat_jalan` (`kd_jalan`, `kd_dokter`, `nama_dokter`, `spesialis`, `biaya_dokter`, `kd_pasien`, `nama_pasien`, `kd_resep`, `resep_obat`, `harga`, `tgl_periksa`) VALUES
('RJ001', 'D002', 'Megawati', 'GIZI', 1000000, 'P002', 'Sri Baduga', 'OB002', 'Combantrin', 200000, '2024-07-14');

-- --------------------------------------------------------

--
-- Table structure for table `ruangan`
--

CREATE TABLE `ruangan` (
  `kd_ruangan` varchar(10) NOT NULL,
  `nama_ruangan` varchar(20) NOT NULL,
  `biaya` int(30) NOT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ruangan`
--

INSERT INTO `ruangan` (`kd_ruangan`, `nama_ruangan`, `biaya`, `type`) VALUES
('R001', 'JAVA', 200000, 'UMUM'),
('R002', 'HTML', 150000, 'UMUM'),
('R003', 'PYTHON', 450000, 'VIP'),
('R004', 'KOTLIN', 250000, 'UMUM');

-- --------------------------------------------------------

--
-- Table structure for table `user_pengguna`
--

CREATE TABLE `user_pengguna` (
  `id_pengguna` varchar(4) NOT NULL,
  `nama_pengguna` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `no_telp_pengguna` varchar(14) NOT NULL,
  `alamat_pengguna` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_pengguna`
--

INSERT INTO `user_pengguna` (`id_pengguna`, `nama_pengguna`, `username`, `password`, `no_telp_pengguna`, `alamat_pengguna`) VALUES
('P001', 'DAULAH EL ISLAMI', 'daulah', '22552011256', '085786404992', 'BANDUNG, JAWA BARAT');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`kd_dokter`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`kd_resep`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`kd_pasien`);

--
-- Indexes for table `pemeriksaan`
--
ALTER TABLE `pemeriksaan`
  ADD PRIMARY KEY (`kd_pemeriksaan`),
  ADD KEY `kd_pasien` (`kd_pasien`),
  ADD KEY `kd_dokter` (`kd_dokter`);

--
-- Indexes for table `perawat`
--
ALTER TABLE `perawat`
  ADD PRIMARY KEY (`kd_perawat`);

--
-- Indexes for table `rawat_inap`
--
ALTER TABLE `rawat_inap`
  ADD PRIMARY KEY (`kd_inap`),
  ADD KEY `kd_pasien` (`kd_pasien`),
  ADD KEY `kd_dokter` (`kd_dokter`),
  ADD KEY `kd_perawat` (`kd_perawat`),
  ADD KEY `kd_ruangan` (`kd_ruangan`);

--
-- Indexes for table `rawat_jalan`
--
ALTER TABLE `rawat_jalan`
  ADD PRIMARY KEY (`kd_jalan`),
  ADD KEY `kd_pasien` (`kd_pasien`),
  ADD KEY `kd_dokter` (`kd_dokter`),
  ADD KEY `kd_resep` (`kd_resep`);

--
-- Indexes for table `ruangan`
--
ALTER TABLE `ruangan`
  ADD PRIMARY KEY (`kd_ruangan`);

--
-- Indexes for table `user_pengguna`
--
ALTER TABLE `user_pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pemeriksaan`
--
ALTER TABLE `pemeriksaan`
  ADD CONSTRAINT `pemeriksaan_ibfk_1` FOREIGN KEY (`kd_pasien`) REFERENCES `pasien` (`kd_pasien`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pemeriksaan_ibfk_2` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `rawat_inap`
--
ALTER TABLE `rawat_inap`
  ADD CONSTRAINT `rawat_inap_ibfk_1` FOREIGN KEY (`kd_pasien`) REFERENCES `pemeriksaan` (`kd_pasien`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rawat_inap_ibfk_2` FOREIGN KEY (`kd_ruangan`) REFERENCES `ruangan` (`kd_ruangan`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `rawat_inap_ibfk_3` FOREIGN KEY (`kd_perawat`) REFERENCES `perawat` (`kd_perawat`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `rawat_jalan`
--
ALTER TABLE `rawat_jalan`
  ADD CONSTRAINT `rawat_jalan_ibfk_1` FOREIGN KEY (`kd_pasien`) REFERENCES `pemeriksaan` (`kd_pasien`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rawat_jalan_ibfk_2` FOREIGN KEY (`kd_resep`) REFERENCES `obat` (`kd_resep`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
