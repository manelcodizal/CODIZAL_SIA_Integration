-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 16, 2026 at 09:06 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `payment_gateway_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `transaction_id` varchar(80) NOT NULL,
  `idempotency_key` varchar(100) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `customer_name` varchar(120) NOT NULL,
  `payment_method` varchar(30) NOT NULL,
  `status` enum('SUCCESS','FAILED','PENDING') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `transaction_id`, `idempotency_key`, `order_id`, `amount`, `customer_name`, `payment_method`, `status`, `created_at`) VALUES
(1, 'TXN-1D924972', 'cart-order-1', 1, 1250.00, 'Marinel Codizal', 'CARD', 'SUCCESS', '2026-10-16 06:37:57'),
(2, 'TXN-8BED97D4', 'cart-order-2', 2, 1900.00, 'Ryland Grace', 'EWALLET', 'SUCCESS', '2026-10-16 06:39:21'),
(3, 'TXN-2A6EFEB5', 'cart-order-3', 3, 4100.00, 'Eva Stratt', 'BANK', 'SUCCESS', '2026-10-16 06:40:09'),
(4, 'TXN-C7B27AE1', 'cart-order-4', 4, 1250.00, 'Leon Kennedy', 'CARD', 'FAILED', '2026-10-16 06:43:50'),
(5, 'TXN-E3BD98F6', 'cart-order-5', 5, 1900.00, 'Ada Wong', 'EWALLET', 'FAILED', '2026-10-16 06:44:31'),
(6, 'TXN-7E06FCC7', 'cart-order-6', 6, 4100.00, 'Ethan Winters', 'BANK', 'FAILED', '2026-10-16 06:45:15'),
(7, 'TXN-C215CCA3', 'cart-order-7', 7, 1250.00, 'Hinako Shimizu', 'CARD', 'PENDING', '2026-10-16 06:49:01'),
(8, 'TXN-4E6013F3', 'cart-order-8', 8, 1900.00, 'Heather Mason', 'EWALLET', 'PENDING', '2026-10-16 06:49:35'),
(9, 'TXN-C63EADF9', 'cart-order-9', 9, 4100.00, 'Simon Ordell', 'BANK', 'PENDING', '2026-10-16 06:50:03'),
(10, 'TXN-B3B08091', 'cart-order-13', 13, 4100.00, 'Marinel Codizal', 'EWALLET', 'SUCCESS', '2026-10-16 07:03:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transaction_id` (`transaction_id`),
  ADD UNIQUE KEY `idempotency_key` (`idempotency_key`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
