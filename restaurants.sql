-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 18, 2019 at 03:04 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restaurant_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_no` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(2083) CHARACTER SET utf8 DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `rating` enum('1','2','3','4','5') COLLATE utf8mb4_unicode_ci DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`id`, `name`, `address`, `phone_no`, `photo`, `description`, `rating`) VALUES
(1, 'Thalassa', 'Mapusa Goa', '9850033537', 'images/z1.png', 'Amazing place for a sunset view and good food Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus massa sem, commodo vel euismod ut, rutrum eget lacus. Praesent pulvinar augue lorem, vel elementum ipsum accumsan in. Vivamus mollis lobortis arcu. Fusce semper rhoncus tellus nec laoreet. Etiam ante tortor, pretium mollis porttitor sit amet, sollicitudin a lacus. Aenean ultricies. ', '5'),
(2, 'copperleaf', 'Chogm Road, Alto-Povorim, Penha de Franca, Goa', '7558298641', 'images/z2.png', 'Amazing food. Each and every dishes tasted so perfect. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ac mattis tellus. Donec ac egestas enim, nec dictum tortor. Morbi mollis tortor quis ex luctus iaculis. Donec in blandit est. Vestibulum laoreet nunc eu fermentum finibus. Quisque sed tempus justo. Maecenas nibh lorem, vulputate eu velit ut, tempor malesuada nunc. \\nnnnn Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ac mattis tellus. Donec ac egestas enim, nec dictum tortor. Morbi mollis tortor quis ex luctus iaculis. Donec in blandit est. Vestibulum laoreet nunc eu fermentum finibus. Quisque sed tempus justo. Maecenas nibh lorem, vulputate eu velit ut, tempor malesuada nunc. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ac mattis tellus. Donec ac egestas enim, nec dictum tortor. Morbi mollis tortor quis ex luctus iaculis. Donec in blandit est. Vestibulum laoreet nunc eu fermentum finibus. Quisque sed tempus justo. Maecenas nibh lorem, vulputate eu velit ut, tempor malesuada nunc. ', '4'),
(3, 'Amavi', 'Cottage Number 88, Behind The Art Chamber, Guaravaddo, Calangute, Goa', '9545384156', 'images/z3.jpg', 'Cuisines Continental. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam varius, risus nec vehicula venenatis, ligula metus aliquam elit, eu volutpat orci lorem convallis ipsum. Phasellus et lacinia nisl. Ut blandit mattis ex, ut placerat lacus sollicitudin sed. Vivamus facilisis urna vel euismod sodales. Vestibulum maximus. ', '5'),
(4, 'The Fishermans Wharf', 'Before The Leela, Mobor, Cavelossim, Goa', '9011018866', 'images/z4.jpg', 'Cuisines Seafood, Goan, North Indian, Continental, Asian . Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur hendrerit orci enim, nec pharetra enim vulputate a. Praesent rutrum, mi ut dignissim aliquam, nisl tortor suscipit augue, tincidunt rutrum mauris lorem et elit. Nunc eu nisi erat. Pellentesque et erat. ', '4'),
(5, 'Purple Martini', 'Anjuna Beach, Anjuna, Goa', '9871900995', 'images/z5.jpg', 'Cuisines Continental, Seafood, Italian, Mediterranean, North IndianCaravela Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur hendrerit orci enim, nec pharetra enim vulputate a. Praesent rutrum, mi ut dignissim aliquam, nisl tortor suscipit augue, tincidunt rutrum mauris lorem et elit. Nunc eu nisi erat. Pellentesque et erat. ', '3'),
(6, 'Cafe and Bistro', '27, 31st January Road, Panaji, Goa', '8322237448', 'images/z6.jpg', 'Great Breakfasts. Menu includes Beverages, Cafe, Sandwich, Italian, Pizza, Goan, Salad. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur hendrerit orci enim, nec pharetra enim vulputate a. Praesent rutrum, mi ut dignissim aliquam, nisl tortor suscipit augue, tincidunt rutrum mauris lorem et elit. Nunc eu nisi erat. Pellentesque et erat. ', '3'),
(7, 'Baba Au Rhum', '1054, Sim Vaddo, Anjuna, Goa', '9822866366', 'images/z7.jpg', 'Thin crust pizzas cooked in wooden ovens. Also popular for making breads, croissants and cakes . Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur hendrerit orci enim, nec pharetra enim vulputate a. Praesent rutrum, mi ut dignissim aliquam, nisl tortor suscipit augue, tincidunt rutrum mauris lorem et elit. Nunc eu nisi erat. Pellentesque et erat. ', '3'),
(8, 'Gunpowder', 'Anjuna Mapusa Road, Assagao, Goa Assagao', '0832 2268083', 'images/z8.jpg', 'Cuisines South Indian. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean ut lacus et tortor lobortis aliquam. Mauris gravida, tortor eget sodales laoreet, sem libero rutrum tellus, et rutrum urna lacus eu dui. Morbi sit amet vestibulum dolor. Aenean non quam lectus. Mauris quam lacus, facilisis id accumsan ut, consectetur nec lectus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur. ', '5'),
(9, 'Spice Traders', '495/2, Vagator Beach Rd, Chapora, Goa 403509', '8326718888', 'images/z9.jpg', 'Cuisines Thai, Chinese, Japanese, Sri Lankan, Vietnamese. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean ut lacus et tortor lobortis aliquam. Mauris gravida, tortor eget sodales laoreet, sem libero rutrum tellus, et rutrum urna lacus eu dui. Morbi sit amet vestibulum dolor. Aenean non quam lectus. Mauris quam lacus, facilisis id accumsan ut, consectetur nec lectus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur. ', '5'),
(10, 'Kokni Kanteen', 'Near Mahalaxmi Temple, Dr. Dada Vaidya Road, Panaji, Goa', '0832 2421972', 'images/z10.jpg', 'Cuisines Goan. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean ut lacus et tortor lobortis aliquam. Mauris gravida, tortor eget sodales laoreet, sem libero rutrum tellus, et rutrum urna lacus eu dui. Morbi sit amet vestibulum dolor. Aenean non quam lectus. Mauris quam lacus, facilisis id accumsan ut, consectetur nec lectus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur. ', '4');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
