-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2025 at 11:33 PM
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
-- Database: `ecommerce_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `description`) VALUES
(1, 'Test Category', 'Category used for test products');

-- --------------------------------------------------------

--
-- Table structure for table `login_logs`
--

CREATE TABLE `login_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `success` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login_logs`
--

INSERT INTO `login_logs` (`id`, `user_id`, `username`, `ip`, `success`, `created_at`) VALUES
(1, 2, 'hmm', '::1', 1, '2025-10-24 01:38:48'),
(2, 2, 'hmm', '::1', 0, '2025-10-24 01:38:56'),
(3, 2, 'hmm', '::1', 1, '2025-10-24 01:39:04'),
(4, 1, 'heko', '::1', 1, '2025-10-24 01:39:22'),
(5, 2, 'hmm', '::1', 1, '2025-10-24 01:39:55'),
(6, 1, 'heko', '::1', 1, '2025-10-24 01:40:47'),
(7, 1, 'heko', '::1', 1, '2025-10-24 01:42:00'),
(8, 1, 'heko', '::1', 1, '2025-10-24 01:43:34'),
(9, 1, 'heko', '::1', 1, '2025-10-24 01:44:49'),
(10, 1, 'heko', '::1', 1, '2025-10-24 01:47:26'),
(11, 2, 'hmm', '::1', 1, '2025-10-24 01:47:35'),
(12, 1, 'heko', '::1', 1, '2025-10-24 01:50:39'),
(13, 1, 'heko', '::1', 1, '2025-10-24 01:53:09'),
(14, 1, 'heko', '::1', 1, '2025-10-24 01:53:29'),
(15, 1, 'heko', '::1', 1, '2025-10-24 01:55:34'),
(16, 1, 'heko', '::1', 1, '2025-10-24 02:29:08'),
(17, 1, 'heko', '::1', 1, '2025-10-24 04:03:51'),
(18, 3, 'test3', '::1', 1, '2025-10-24 04:06:22'),
(19, 1, 'heko', '::1', 1, '2025-10-24 04:08:54'),
(20, 2, 'hmm', '::1', 1, '2025-10-24 04:27:14'),
(21, 1, 'heko', '::1', 1, '2025-10-24 04:38:31'),
(22, 4, 'kaupat', '::1', 1, '2025-10-24 05:13:51'),
(23, 5, 'parasavid', '::1', 1, '2025-10-24 05:16:24'),
(24, 1, 'heko', '::1', 1, '2025-10-24 05:17:14');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_date` datetime DEFAULT current_timestamp(),
  `status` enum('pending','paid','shipped','delivered','cancelled') DEFAULT 'pending',
  `total_amount` decimal(10,2) DEFAULT NULL,
  `shipping_address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `order_date`, `status`, `total_amount`, `shipping_address`) VALUES
(1, NULL, '2025-10-23 10:20:44', 'paid', 5499.89, 'house 19 Alco Homes Compound, Villarin Street, Zone 8, Carmen.'),
(2, 2, '2025-10-24 00:11:54', 'delivered', 499.99, 'wewewew'),
(3, 1, '2025-10-24 03:25:14', 'delivered', 299.00, 'wewew'),
(4, 2, '2025-10-24 04:27:31', '', 123.00, 'qwewqeqweqweqw'),
(5, 2, '2025-10-24 04:31:29', 'shipped', 489.00, 'to pagatpat'),
(6, 4, '2025-10-24 05:14:20', 'paid', 568.00, 'sa among balay lang boss!'),
(7, 5, '2025-10-24 05:17:00', 'delivered', 975.00, 'ilang francis lang boss!');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(1, 1, 1, 11, 499.99),
(2, 2, 1, 1, 499.99),
(3, 3, 1, 1, 299.00),
(4, 4, NULL, 1, 123.00),
(5, 5, 1, 1, 299.00),
(6, 5, NULL, 1, 67.00),
(7, 5, NULL, 1, 123.00),
(8, 6, 1, 1, 299.00),
(9, 6, 5, 3, 67.00),
(10, 6, 6, 1, 68.00),
(11, 7, 1, 1, 299.00),
(12, 7, 5, 4, 67.00),
(13, 7, 6, 6, 68.00);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_date` datetime DEFAULT current_timestamp(),
  `status` enum('success','failed','refunded') DEFAULT 'success'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `order_id`, `amount`, `payment_method`, `payment_date`, `status`) VALUES
(1, 1, 5499.89, 'guest_pay', '2025-10-23 10:20:44', 'success'),
(2, 2, 499.99, 'guest_pay', '2025-10-24 00:11:54', 'success'),
(3, 3, 299.00, 'guest_pay', '2025-10-24 03:25:14', 'success'),
(4, 4, 123.00, 'guest_pay', '2025-10-24 04:27:31', 'success'),
(5, 5, 489.00, 'guest_pay', '2025-10-24 04:31:29', 'success'),
(6, 6, 568.00, 'guest_pay', '2025-10-24 05:14:20', 'success'),
(7, 7, 975.00, 'guest_pay', '2025-10-24 05:17:00', 'success');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) DEFAULT 0,
  `category_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `name`, `description`, `price`, `stock`, `category_id`, `image`) VALUES
(1, 'test product', 'yawaaaaaa', 299.00, 96, 1, 'holdlaugh.jpeg\r\n'),
(5, 'Mike', 'Just dont do it!', 67.00, 60, 1, 'p_68fa92e7099538.38392377.jpeg'),
(6, 'jorban', 'Goated', 68.00, 61, 1, 'p_68fa92fc9a7aa0.86067475.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `rating` tinyint(4) NOT NULL CHECK (`rating` between 1 and 5),
  `comment` text DEFAULT NULL,
  `review_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('customer','admin') DEFAULT 'customer',
  `date_joined` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password_hash`, `role`, `date_joined`) VALUES
(1, 'heko', 'heko123@gmail.com', '$2y$10$0fU30iIBBF2QEaNCXBiUVuyc/1mYm2Am2R9wA4jpncfsTaanbVdRe', 'admin', '2025-10-23 23:56:39'),
(2, 'hmm', 'hmm@gmail.com', '$2y$10$uNz5lzk8EF4XS.coo.UAOuYFsXYEk4kDzXs9P2Iqm7zJhQa7ZUTlq', 'customer', '2025-10-24 00:11:31'),
(3, 'test3', 'test3@gmail.com', '$2y$10$aB859AcQpuvbCplS//UfSOLCqTmUZhqNNbg2GhraQ77iNAKbOxMT2', 'customer', '2025-10-24 04:06:03'),
(4, 'kaupat', 'kaupat@gmail.com', '$2y$10$TvrqDJRY2KGnpsWRVb9JZelrqXZg6E3o0PPjwDpOXA/Tr.QWhs3/6', 'customer', '2025-10-24 05:13:42'),
(5, 'parasavid', 'parasavid123@gmail.com', '$2y$10$2czZOSoaOrnLVzeYKG.R1OCV3iOGwSImkmuwTQFY6TW5gYuC3brMy', 'customer', '2025-10-24 05:16:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `login_logs`
--
ALTER TABLE `login_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `status` (`status`),
  ADD KEY `order_date` (`order_date`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `email_2` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `login_logs`
--
ALTER TABLE `login_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `login_logs`
--
ALTER TABLE `login_logs`
  ADD CONSTRAINT `login_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE SET NULL;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
