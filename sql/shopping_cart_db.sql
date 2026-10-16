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
-- Database: `shopping_cart_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(120) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` enum('PENDING_PAYMENT','PAID','PAYMENT_FAILED','PAYMENT_PENDING','INTEGRATION_ERROR') NOT NULL DEFAULT 'PENDING_PAYMENT',
  `gateway_transaction_id` varchar(80) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_name`, `total_amount`, `status`, `gateway_transaction_id`, `created_at`) VALUES
(1, 'Marinel Codizal', 1250.00, 'PAID', 'TXN-1D924972', '2026-10-16 06:37:57'),
(2, 'Ryland Grace', 1900.00, 'PAID', 'TXN-8BED97D4', '2026-10-16 06:39:21'),
(3, 'Eva Stratt', 4100.00, 'PAID', 'TXN-2A6EFEB5', '2026-10-16 06:40:09'),
(4, 'Leon Kennedy', 1250.00, 'PAYMENT_FAILED', 'TXN-C7B27AE1', '2026-10-16 06:43:50'),
(5, 'Ada Wong', 1900.00, 'PAYMENT_FAILED', 'TXN-E3BD98F6', '2026-10-16 06:44:31'),
(6, 'Ethan Winters', 4100.00, 'PAYMENT_FAILED', 'TXN-7E06FCC7', '2026-10-16 06:45:15'),
(7, 'Hinako Shimizu', 1250.00, 'PAYMENT_PENDING', 'TXN-C215CCA3', '2026-10-16 06:49:01'),
(8, 'Heather Mason', 1900.00, 'PAYMENT_PENDING', 'TXN-4E6013F3', '2026-10-16 06:49:35'),
(9, 'Simon Ordell', 4100.00, 'PAYMENT_PENDING', 'TXN-C63EADF9', '2026-10-16 06:50:03'),
(10, 'Estella de Vil', 1250.00, 'INTEGRATION_ERROR', NULL, '2026-10-16 06:58:07'),
(11, 'Cruella de Vil', 1900.00, 'INTEGRATION_ERROR', NULL, '2026-10-16 06:58:54'),
(12, 'Baroness von Hellman', 4100.00, 'INTEGRATION_ERROR', NULL, '2026-10-16 06:59:46'),
(13, 'Marinel Codizal', 4100.00, 'PAID', 'TXN-B3B08091', '2026-10-16 07:03:43');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(120) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `quantity`, `unit_price`) VALUES
(1, 1, 1, 'USB-C Hub', 1, 1250.00),
(2, 2, 1, 'USB-C Hub', 1, 1250.00),
(3, 2, 2, 'Wireless Mouse', 1, 650.00),
(4, 3, 1, 'USB-C Hub', 1, 1250.00),
(5, 3, 2, 'Wireless Mouse', 1, 650.00),
(6, 3, 3, 'Mechanical Keyboard', 1, 2200.00),
(7, 4, 1, 'USB-C Hub', 1, 1250.00),
(8, 5, 1, 'USB-C Hub', 1, 1250.00),
(9, 5, 2, 'Wireless Mouse', 1, 650.00),
(10, 6, 1, 'USB-C Hub', 1, 1250.00),
(11, 6, 2, 'Wireless Mouse', 1, 650.00),
(12, 6, 3, 'Mechanical Keyboard', 1, 2200.00),
(13, 7, 1, 'USB-C Hub', 1, 1250.00),
(14, 8, 1, 'USB-C Hub', 1, 1250.00),
(15, 8, 2, 'Wireless Mouse', 1, 650.00),
(16, 9, 1, 'USB-C Hub', 1, 1250.00),
(17, 9, 2, 'Wireless Mouse', 1, 650.00),
(18, 9, 3, 'Mechanical Keyboard', 1, 2200.00),
(19, 10, 1, 'USB-C Hub', 1, 1250.00),
(20, 11, 1, 'USB-C Hub', 1, 1250.00),
(21, 11, 2, 'Wireless Mouse', 1, 650.00),
(22, 12, 1, 'USB-C Hub', 1, 1250.00),
(23, 12, 2, 'Wireless Mouse', 1, 650.00),
(24, 12, 3, 'Mechanical Keyboard', 1, 2200.00),
(25, 13, 1, 'USB-C Hub', 1, 1250.00),
(26, 13, 2, 'Wireless Mouse', 1, 650.00),
(27, 13, 3, 'Mechanical Keyboard', 1, 2200.00);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 10
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `stock`) VALUES
(1, 'USB-C Hub', 'Multiport adapter for laptops', 1250.00, 96),
(2, 'Wireless Mouse', 'Basic wireless mouse', 650.00, 97),
(3, 'Mechanical Keyboard', 'Compact mechanical keyboard', 2200.00, 98);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
