-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Jul 2023 pada 04.09
-- Versi server: 10.4.28-MariaDB
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
USE `rental`;  /* <--- PERBAIKAN 1: Memilih database tujuan */

-- --------------------------------------------------------

--
-- Struktur dari tabel `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL PRIMARY KEY, /* <--- Mengubahnya di sini */
  `username` varchar(50) NOT NULL UNIQUE, /* <--- Menetapkan username sebagai UNIQUE */
  `email` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `NIK` int(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `accounts`
--
-- ... (Data lainnya) ...
--

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL PRIMARY KEY, /* <--- Menetapkan id sebagai PRIMARY KEY */
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- ... (Struktur tabel biodata, car, cobapesanan lainnya) ...
--

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `accounts`
--
ALTER TABLE `accounts`
  /* HAPUS: ADD PRIMARY KEY (`username`), <--- PERBAIKAN 2: Baris ini dihapus */
  ADD UNIQUE KEY `username_unique` (`username`), /* <--- Mengganti UNIQUE KEY yang lebih jelas */
  ADD UNIQUE KEY `id_unique` (`id`), /* <--- Menambahkan agar ID tetap unik */
  ADD KEY `hub_biodata` (`NIK`);

--
-- Indeks untuk tabel `admin`
--
/* HAPUS: ALTER TABLE `admin` ADD PRIMARY KEY (`id`); Karena sudah diatur di CREATE TABLE */

--
-- Indeks untuk tabel `biodata`
--
/* HAPUS: ALTER TABLE `biodata` ADD PRIMARY KEY (`nik`); Karena sudah diatur di CREATE TABLE */

--
-- Indeks untuk tabel `car`
--
/* HAPUS: ALTER TABLE `car` ADD PRIMARY KEY (`plat_mobil`); Karena sudah diatur di CREATE TABLE */

--
-- Indeks untuk tabel `cobapesanan`
--
/* HAPUS: ALTER TABLE `cobapesanan` ADD PRIMARY KEY (`id`); Karena sudah diatur di CREATE TABLE */

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `car`
--
ALTER TABLE `car`
  MODIFY `id_mobil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `cobapesanan`
--
ALTER TABLE `cobapesanan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `hub_biodata` FOREIGN KEY (`NIK`) REFERENCES `biodata` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `cobapesanan`
--
ALTER TABLE `cobapesanan`
  ADD CONSTRAINT `wa` FOREIGN KEY (`nik`) REFERENCES `biodata` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
