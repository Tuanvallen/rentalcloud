-- phpMyAdmin SQL Dump
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rental`
--
USE `rental`;  /* <--- BARIS KRITIS: Memilih database tujuan */

-- --------------------------------------------------------

--
-- Struktur dari tabel `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL UNIQUE, /* username harus UNIQUE */
  `email` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `NIK` int(18) NOT NULL,
  PRIMARY KEY (`id`), /* PRIMARY KEY pada ID */
  UNIQUE KEY `username_unique` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `accounts`
--
INSERT INTO `accounts` (`id`, `username`, `email`, `password`, `NIK`) VALUES
(1, 'banu', 'banu@gmail.com', '1234', 123123),
(5, 'bnm', 'bnm@gmail.com', '123', 7777),
(10, 'bolo', 'bolo@gmail.com', 'pbkdf2:sha256:600000$2rl6Gc8cV92bSfjN$5e43f385b2a6', 12345609),
(15, 'budi123', 'budi@gmail.com', '123', 789789789),
(9, 'bvn', 'bvn@gmail.com', '111', 777),
(12, 'dot', 'dotcom@gmail.com', '1234123', 2147483647),
(8, 'fera', 'fera@gmail.com', 'pbkdf2:sha256:600000$77d5nIPwITS7RfmP$0f6dcd90c8a8', 812345),
(11, 'fff', 'fff@gmail.com', '111', 89898),
(4, 'iku', 'iki@gmail.com', 'pbkdf2:sha256:600000$Yr1MjIfmX6QDTVuA$e8e14271b8f3', 9999),
(2, 'jokoo', 'joko@gmail.com', 'pbkdf2:sha256:600000$AEvPwKxjQ1UFPvGp$7ce716ecd853', 1234567),
(16, 'karen123', 'karen@gmail.com', '123', 666666),
(14, 'kelaz', 'kelaz@gmail.com', '123', 45454),
(6, 'nyeni', 'nyeni@gmail.com', 'pbkdf2:sha256:600000$M8VnxyAzOW1psH0B$565709a9651e', 12312312),
(7, 'suku', 'suku@gmail.com', '123', 43433),
(13, 'udin', 'udin@pm.me', '123', 121212),
(3, 'wangun', 'cinta@gmail.com', 'pbkdf2:sha256:600000$JxFSPrvtbeiPtwJO$fc579af71cc3', 123123412);

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL PRIMARY KEY,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `admin`
--
INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `biodata`
--

CREATE TABLE `biodata` (
  `nik` int(18) NOT NULL PRIMARY KEY,
  `nama_awal` varchar(50) NOT NULL,
-- ... (Kolom lainnya) ...
  `kelurahan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `biodata`
--
-- ... (Data lainnya) ...

-- --------------------------------------------------------

--
-- Struktur dari tabel `car`
--

CREATE TABLE `car` (
  `id_mobil` int(11) NOT NULL,
  `plat_mobil` varchar(255) NOT NULL PRIMARY KEY, /* plat_mobil sebagai Primary Key */
  `nama_mobil` varchar(255) DEFAULT NULL,
-- ... (Kolom lainnya) ...
  `Warna` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `car`
--
-- ... (Data lainnya) ...

-- --------------------------------------------------------

--
-- Struktur dari tabel `cobapesanan`
--

CREATE TABLE `cobapesanan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `jenis_mobil` varchar(255) DEFAULT NULL,
-- ... (Kolom lainnya) ...
  `nik` int(18) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `cobapesanan`
--
-- ... (Data lainnya) ...

--
-- Bagian AUTO_INCREMENT
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `car`
  MODIFY `id_mobil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26; /* BARIS YANG TADI ERROR */

ALTER TABLE `cobapesanan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Ketidakleluasaan (Foreign Key)
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `hub_biodata` FOREIGN KEY (`NIK`) REFERENCES `biodata` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `cobapesanan`
  ADD CONSTRAINT `wa` FOREIGN KEY (`nik`) REFERENCES `biodata` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
