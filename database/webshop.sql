-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 06, 2021 lúc 09:26 PM
-- Phiên bản máy phục vụ: 10.4.14-MariaDB
-- Phiên bản PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `webshop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `level` int(11) NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `level`, `created`) VALUES
(1, 'Group20', 'admin@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 0, 2147483647),
(2, 'Group20', 'mod@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 1, 2147483647);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `catalog`
--

CREATE TABLE `catalog` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `sort_order` tinyint(4) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `catalog`
--

INSERT INTO `catalog` (`id`, `name`, `description`, `parent_id`, `sort_order`, `created`) VALUES
(1, 'Beauty', '', 0, 1, '2020-11-10 05:35:21'),
(2, 'Best seller', '', 0, 2, '2020-11-10 05:35:21'),
(3, 'Discount', '', 0, 3, '2020-11-10 05:35:21'),
(4, 'News', '', 0, 4, '2020-11-10 05:35:21'),
(5, 'Cart', '', 0, 6, '2020-11-10 05:35:21'),
(6, 'Contact', '', 0, 5, '2017-04-22 05:37:02'),
(7, 'MAC', '', 1, 1, '2020-11-10 05:35:21'),
(8, 'BLACK ROUGE', '', 1, 2, '2020-11-10 05:35:21'),
(9, 'Matte Lipstick', '', 8, 1, '2020-11-10 05:35:21'),
(10, 'Matte Lipstick', '', 7, 1, '2020-11-10 05:35:21'),
(11, 'Sheer Lipstick', '', 7, 2, '2020-11-10 05:35:21'),
(12, 'DIOR', '', 1, 4, '2020-11-10 05:35:21'),
(13, 'Matte Lipstick', '', 12, 1, '2020-11-10 05:35:21'),
(14, 'Sheer Lipstick', '', 12, 2, '2020-11-10 05:35:21'),
(15, 'CHANEL', '', 1, 5, '2020-11-10 05:35:21'),
(16, '3CE', '', 1, 6, '2020-11-10 05:35:21'),
(17, 'Matte Lipstick', '', 16, 1, '2020-11-10 05:35:21'),
(18, 'Sheer Lipstick', '', 16, 2, '2020-11-10 05:35:21'),
(19, 'Matte Lipstick', '', 15, 1, '2020-11-10 05:35:21'),
(20, 'Sheer Lipstick', '', 15, 2, '2020-11-10 05:35:21'),
(21, 'Sheer Lipstick', '', 8, 2, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `transaction_id` int(100) NOT NULL,
  `product_id` int(100) NOT NULL,
  `qty` int(100) NOT NULL DEFAULT 0,
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`id`, `transaction_id`, `product_id`, `qty`, `amount`, `status`) VALUES
(21, 15, 1, 1, '430000.00', 0),
(20, 15, 21, 2, '290000.00', 0),
(19, 15, 16, 1, '580000.00', 0),
(18, 15, 2, 2, '900000.00', 0),
(17, 14, 22, 1, '300000.00', 0),
(16, 13, 17, 1, '450000.00', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(255) NOT NULL,
  `catalog_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(15,2) NOT NULL DEFAULT 0.00,
  `discount` int(11) DEFAULT 0,
  `image_link` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `image_list` text COLLATE utf8_unicode_ci NOT NULL,
  `view` int(11) NOT NULL DEFAULT 0,
  `buyed` int(255) NOT NULL,
  `rate_total` int(255) NOT NULL DEFAULT 4,
  `rate_count` int(255) NOT NULL DEFAULT 1,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `catalog_id`, `name`, `content`, `price`, `discount`, `image_link`, `image_list`, `view`, `buyed`, `rate_total`, `rate_count`, `created`) VALUES
(1, 11, 'MAC CHILI 602 BRICK RED', '<p style=\"margin: 10px 0px; padding: 0px; margin-block-start: 0px; margin-block-end: 0px; text-rendering: geometricprecision; color: #333333; font-family: Helvetica, Arial, \'DejaVu Sans\', \'Liberation Sans\', Freesans, sans-serif; font-size: 16px;\">The special color blending formula blending 3 shades of red, orange and brown allows Chili to satisfy both light and impressive makeup styles. When you apply a very thin layer and spread it evenly or in a lip-style style, the lipstick will turn on a soft, earthy-brown color that is very gentle but still no less attractive; When you hit a pile of layers, the lipstick will turn into a deep red, extremely impressive personality. In addition, thanks to the unique earthy red color, Chili is also very suitable for cheeks, spreading evenly on both cheeks will create a very beautiful blush effect, extremely suitable in autumn.</p>\r\n', '430000.00', 0, 'mac1.png', '[\"chili.jpg\"]', 26, 17, 14, 5, 1493983674),
(2, 11, 'MAC RUBY WOO 512', '<p style=\"margin: 10px 0px; padding: 0px; margin-block-start: 0px; margin-block-end: 0px; text-rendering: geometricprecision; color: #333333; font-family: Helvetica, Arial, \'DejaVu Sans\', \'Liberation Sans\', Freesans, sans-serif; font-size: 16px;\">The special color blending formula blending 3 shades of red, orange and brown allows Chili to satisfy both light and impressive makeup styles. When you apply a very thin layer and spread it evenly or in a lip-style style, the lipstick will turn on a soft, earthy-brown color that is very gentle but still no less attractive; When you hit a pile of layers, the lipstick will turn into a deep red, extremely impressive personality. In addition, thanks to the unique earthy red color, Chili is also very suitable for cheeks, spreading evenly on both cheeks will create a very beautiful blush effect, extremely suitable in autumn.</p>\r\n', '450000.00', 0, 'mac2.jpg', '', 3, 1, 4, 1, 1493983674),
(3, 14, 'DIOR ROUGE 642 READY BROWN CORAL', '<p>The special color blending formula blending 3 shades of red, orange and brown allows Chili to satisfy both light and impressive makeup styles. When you apply a very thin layer and spread it evenly or in a lip-style style, the lipstick will turn on a soft, earthy-brown color that is very gentle but still no less attractive; When you hit a pile of layers, the lipstick will turn into a deep red, extremely impressive personality. In addition, thanks to the unique earthy red color, Chili is also very suitable for cheeks, spreading evenly on both cheeks will create a very beautiful blush effect, extremely suitable in autumn.</p>\r\n', '800000.00', 150000, 'd1.jpg', '', 43, 4, 16, 4, 1493983674),
(4, 10, 'MAC RETRO MATTE LIQUID LIP COLOR', '<p style=\"margin: 10px 0px; padding: 0px; margin-block-start: 0px; margin-block-end: 0px; text-rendering: geometricprecision; color: #333333; font-family: Helvetica, Arial, \'DejaVu Sans\', \'Liberation Sans\', Freesans, sans-serif; font-size: 16px;\">The special color blending formula blending 3 shades of red, orange and brown allows Chili to satisfy both light and impressive makeup styles. When you apply a very thin layer and spread it evenly or in a lip-style style, the lipstick will turn on a soft, earthy-brown color that is very gentle but still no less attractive; When you hit a pile of layers, the lipstick will turn into a deep red, extremely impressive personality. In addition, thanks to the unique earthy red color, Chili is also very suitable for cheeks, spreading evenly on both cheeks will create a very beautiful blush effect, extremely suitable in autumn.</p>\r\n', '450000.00', 0, 'mac3.jpg', '', 17, 7, 18, 4, 1493983674),
(12, 10, 'MAC POWDER KISS LIQUID LIP COLOR', '<p style=\"margin: 10px 0px; padding: 0px; margin-block-start: 0px; margin-block-end: 0px; text-rendering: geometricprecision; color: #333333; font-family: Helvetica, Arial, \'DejaVu Sans\', \'Liberation Sans\', Freesans, sans-serif; font-size: 16px;\">The special color blending formula blending 3 shades of red, orange and brown allows Chili to satisfy both light and impressive makeup styles. When you apply a very thin layer and spread it evenly or in a lip-style style, the lipstick will turn on a soft, earthy-brown color that is very gentle but still no less attractive; When you hit a pile of layers, the lipstick will turn into a deep red, extremely impressive personality. In addition, thanks to the unique earthy red color, Chili is also very suitable for cheeks, spreading evenly on both cheeks will create a very beautiful blush effect, extremely suitable in autumn.</p>\r\n', '720000.00', 0, 'mac4.jpg', '', 28, 3, 9, 2, 0),
(13, 21, 'BLACK ROUGE VELVET LIPTINT R03', '<p style=\"margin: 10px 0px; padding: 0px; margin-block-start: 0px; margin-block-end: 0px; text-rendering: geometricprecision; color: #333333; font-family: Helvetica, Arial, \'DejaVu Sans\', \'Liberation Sans\', Freesans, sans-serif; font-size: 16px;\">The special color blending formula blending 3 shades of red, orange and brown allows Chili to satisfy both light and impressive makeup styles. When you apply a very thin layer and spread it evenly or in a lip-style style, the lipstick will turn on a soft, earthy-brown color that is very gentle but still no less attractive; When you hit a pile of layers, the lipstick will turn into a deep red, extremely impressive personality. In addition, thanks to the unique earthy red color, Chili is also very suitable for cheeks, spreading evenly on both cheeks will create a very beautiful blush effect, extremely suitable in autumn.</p>\r\n', '200000.00', 0, 'br4.jpg', '', 6, 1, 4, 1, 1493983674),
(6, 9, 'BLACK ROUGE CREAM MATTE ROUGE VER 1 CM06', '<p style=\"margin: 10px 0px; padding: 0px; margin-block-start: 0px; margin-block-end: 0px; text-rendering: geometricprecision; color: #333333; font-family: Helvetica, Arial, \'DejaVu Sans\', \'Liberation Sans\', Freesans, sans-serif; font-size: 16px;\">The special color blending formula blending 3 shades of red, orange and brown allows Chili to satisfy both light and impressive makeup styles. When you apply a very thin layer and spread it evenly or in a lip-style style, the lipstick will turn on a soft, earthy-brown color that is very gentle but still no less attractive; When you hit a pile of layers, the lipstick will turn into a deep red, extremely impressive personality. In addition, thanks to the unique earthy red color, Chili is also very suitable for cheeks, spreading evenly on both cheeks will create a very beautiful blush effect, extremely suitable in autumn.</p>\r\n', '300000.00', 100000, 'br3.jpg', '', 16, 7, 18, 4, 1493983674),
(7, 9, 'BLACK ROUGE COLOR LOCK 13 H05', '<p style=\"margin: 10px 0px; padding: 0px; margin-block-start: 0px; margin-block-end: 0px; text-rendering: geometricprecision; color: #333333; font-family: Helvetica, Arial, \'DejaVu Sans\', \'Liberation Sans\', Freesans, sans-serif; font-size: 16px;\">The special color blending formula blending 3 shades of red, orange and brown allows Chili to satisfy both light and impressive makeup styles. When you apply a very thin layer and spread it evenly or in a lip-style style, the lipstick will turn on a soft, earthy-brown color that is very gentle but still no less attractive; When you hit a pile of layers, the lipstick will turn into a deep red, extremely impressive personality. In addition, thanks to the unique earthy red color, Chili is also very suitable for cheeks, spreading evenly on both cheeks will create a very beautiful blush effect, extremely suitable in autumn.</p>\r\n', '450000.00', 100000, 'br5.jpg', '', 20, 6, 13, 3, 1493983674),
(9, 9, 'BLACK ROUGE A06 AIRFIT VELVET TINT', '<p style=\"margin: 10px 0px; padding: 0px; margin-block-start: 0px; margin-block-end: 0px; text-rendering: geometricprecision; color: #333333; font-family: Helvetica, Arial, \'DejaVu Sans\', \'Liberation Sans\', Freesans, sans-serif; font-size: 16px;\">The special color blending formula blending 3 shades of red, orange and brown allows Chili to satisfy both light and impressive makeup styles. When you apply a very thin layer and spread it evenly or in a lip-style style, the lipstick will turn on a soft, earthy-brown color that is very gentle but still no less attractive; When you hit a pile of layers, the lipstick will turn into a deep red, extremely impressive personality. In addition, thanks to the unique earthy red color, Chili is also very suitable for cheeks, spreading evenly on both cheeks will create a very beautiful blush effect, extremely suitable in autumn.</p>\r\n', '180000.00', 100000, 'br2.jpg', '', 2, 40, 4, 1, 1493983674),
(11, 20, 'CHANEL LEROUGE CRAYON DE COULEUR', '<p>The special color blending formula blending 3 shades of red, orange and brown allows Chili to satisfy both light and impressive makeup styles. When you apply a very thin layer and spread it evenly or in a lip-style style, the lipstick will turn on a soft, earthy-brown color that is very gentle but still no less attractive; When you hit a pile of layers, the lipstick will turn into a deep red, extremely impressive personality. In addition, thanks to the unique earthy red color, Chili is also very suitable for cheeks, spreading evenly on both cheeks will create a very beautiful blush effect, extremely suitable in autumn.</p>\r\n', '800000.00', 10000, 'chanel5.jpg', '', 35, 3, 5, 1, 1493983674),
(10, 20, 'CHANEL ROUGE COCO FLASH', '<p>The special color blending formula blending 3 shades of red, orange and brown allows Chili to satisfy both light and impressive makeup styles. When you apply a very thin layer and spread it evenly or in a lip-style style, the lipstick will turn on a soft, earthy-brown color that is very gentle but still no less attractive; When you hit a pile of layers, the lipstick will turn into a deep red, extremely impressive personality. In addition, thanks to the unique earthy red color, Chili is also very suitable for cheeks, spreading evenly on both cheeks will create a very beautiful blush effect, extremely suitable in autumn.</p>\r\n', '1029000.00', 60000, 'chanel1.jpg', '', 9, 2, 4, 1, 1493983674),
(14, 19, 'CHANEL ROUGE COCO GLOSS TOP COAT', '<p style=\"margin: 10px 0px; padding: 0px; margin-block-start: 0px; margin-block-end: 0px; text-rendering: geometricprecision; color: #333333; font-family: Helvetica, Arial, \'DejaVu Sans\', \'Liberation Sans\', Freesans, sans-serif; font-size: 16px;\">The special color blending formula blending 3 shades of red, orange and brown allows Chili to satisfy both light and impressive makeup styles. When you apply a very thin layer and spread it evenly or in a lip-style style, the lipstick will turn on a soft, earthy-brown color that is very gentle but still no less attractive; When you hit a pile of layers, the lipstick will turn into a deep red, extremely impressive personality. In addition, thanks to the unique earthy red color, Chili is also very suitable for cheeks, spreading evenly on both cheeks will create a very beautiful blush effect, extremely suitable in autumn.</p>\r\n', '200000.00', 50000, 'chanel4.jpg', '', 3, 2, 4, 1, 1493983674),
(15, 20, 'CHANEL ROUGE ALLURE', '<p style=\"margin: 10px 0px; padding: 0px; margin-block-start: 0px; margin-block-end: 0px; text-rendering: geometricprecision; color: #333333; font-family: Helvetica, Arial, \'DejaVu Sans\', \'Liberation Sans\', Freesans, sans-serif; font-size: 16px;\">The special color blending formula blending 3 shades of red, orange and brown allows Chili to satisfy both light and impressive makeup styles. When you apply a very thin layer and spread it evenly or in a lip-style style, the lipstick will turn on a soft, earthy-brown color that is very gentle but still no less attractive; When you hit a pile of layers, the lipstick will turn into a deep red, extremely impressive personality. In addition, thanks to the unique earthy red color, Chili is also very suitable for cheeks, spreading evenly on both cheeks will create a very beautiful blush effect, extremely suitable in autumn.</p>\r\n', '350000.00', 180000, 'chanel.jpg', '', 4, 1, 4, 1, 1493983674),
(16, 13, 'DIOR ADDICT GLOW COLOR AWAKENING', '<p style=\"margin: 10px 0px; padding: 0px; margin-block-start: 0px; margin-block-end: 0px; text-rendering: geometricprecision; color: #333333; font-family: Helvetica, Arial, \'DejaVu Sans\', \'Liberation Sans\', Freesans, sans-serif; font-size: 16px;\">The special color blending formula blending 3 shades of red, orange and brown allows Chili to satisfy both light and impressive makeup styles. When you apply a very thin layer and spread it evenly or in a lip-style style, the lipstick will turn on a soft, earthy-brown color that is very gentle but still no less attractive; When you hit a pile of layers, the lipstick will turn into a deep red, extremely impressive personality. In addition, thanks to the unique earthy red color, Chili is also very suitable for cheeks, spreading evenly on both cheeks will create a very beautiful blush effect, extremely suitable in autumn.</p>\r\n', '580000.00', 0, 'd3.jpg', '', 4, 3, 13, 3, 1493983674),
(17, 13, 'DIOR ROUGE 641 ULTRA SPICE ', '<p style=\"margin: 10px 0px; padding: 0px; margin-block-start: 0px; margin-block-end: 0px; text-rendering: geometricprecision; color: #333333; font-family: Helvetica, Arial, \'DejaVu Sans\', \'Liberation Sans\', Freesans, sans-serif; font-size: 16px;\">The special color blending formula blending 3 shades of red, orange and brown allows Chili to satisfy both light and impressive makeup styles. When you apply a very thin layer and spread it evenly or in a lip-style style, the lipstick will turn on a soft, earthy-brown color that is very gentle but still no less attractive; When you hit a pile of layers, the lipstick will turn into a deep red, extremely impressive personality. In addition, thanks to the unique earthy red color, Chili is also very suitable for cheeks, spreading evenly on both cheeks will create a very beautiful blush effect, extremely suitable in autumn.</p>\r\n', '500000.00', 50000, 'd2.jpg', '', 37, 1, 14, 4, 1493983674),
(18, 14, 'DIOR DIORIFIC MATLIPSTICK', '<p style=\"margin: 10px 0px; padding: 0px; margin-block-start: 0px; margin-block-end: 0px; text-rendering: geometricprecision; color: #333333; font-family: Helvetica, Arial, \'DejaVu Sans\', \'Liberation Sans\', Freesans, sans-serif; font-size: 16px;\">The special color blending formula blending 3 shades of red, orange and brown allows Chili to satisfy both light and impressive makeup styles. When you apply a very thin layer and spread it evenly or in a lip-style style, the lipstick will turn on a soft, earthy-brown color that is very gentle but still no less attractive; When you hit a pile of layers, the lipstick will turn into a deep red, extremely impressive personality. In addition, thanks to the unique earthy red color, Chili is also very suitable for cheeks, spreading evenly on both cheeks will create a very beautiful blush effect, extremely suitable in autumn.</p>\r\n', '900000.00', 0, 'd4.jpg', '', 1, 1, 5, 1, 0),
(19, 17, '3CE VELVET LIPTINT PRIVATE ', '<p style=\"margin: 10px 0px; padding: 0px; margin-block-start: 0px; margin-block-end: 0px; text-rendering: geometricprecision; color: #333333; font-family: Helvetica, Arial, \'DejaVu Sans\', \'Liberation Sans\', Freesans, sans-serif; font-size: 16px;\">The special color blending formula blending 3 shades of red, orange and brown allows Chili to satisfy both light and impressive makeup styles. When you apply a very thin layer and spread it evenly or in a lip-style style, the lipstick will turn on a soft, earthy-brown color that is very gentle but still no less attractive; When you hit a pile of layers, the lipstick will turn into a deep red, extremely impressive personality. In addition, thanks to the unique earthy red color, Chili is also very suitable for cheeks, spreading evenly on both cheeks will create a very beautiful blush effect, extremely suitable in autumn.</p>\r\n', '390000.00', 50000, '3ce5.jpg', '', 2, 1, 4, 1, 1493983674),
(20, 17, '3CE VELVET LIPTINT DAFFOLIL', '<p style=\"margin: 10px 0px; padding: 0px; margin-block-start: 0px; margin-block-end: 0px; text-rendering: geometricprecision; color: #333333; font-family: Helvetica, Arial, \'DejaVu Sans\', \'Liberation Sans\', Freesans, sans-serif; font-size: 16px;\">The special color blending formula blending 3 shades of red, orange and brown allows Chili to satisfy both light and impressive makeup styles. When you apply a very thin layer and spread it evenly or in a lip-style style, the lipstick will turn on a soft, earthy-brown color that is very gentle but still no less attractive; When you hit a pile of layers, the lipstick will turn into a deep red, extremely impressive personality. In addition, thanks to the unique earthy red color, Chili is also very suitable for cheeks, spreading evenly on both cheeks will create a very beautiful blush effect, extremely suitable in autumn.</p>\r\n', '380000.00', 90000, '3ce1.jpg', '', 32, 1, 4, 1, 1493983674),
(21, 18, '3CE MAT LIP COLOR 228 RED SEVENTIES', '<p style=\"margin: 10px 0px; padding: 0px; margin-block-start: 0px; margin-block-end: 0px; text-rendering: geometricprecision; color: #333333; font-family: Helvetica, Arial, \'DejaVu Sans\', \'Liberation Sans\', Freesans, sans-serif; font-size: 16px;\">The special color blending formula blending 3 shades of red, orange and brown allows Chili to satisfy both light and impressive makeup styles. When you apply a very thin layer and spread it evenly or in a lip-style style, the lipstick will turn on a soft, earthy-brown color that is very gentle but still no less attractive; When you hit a pile of layers, the lipstick will turn into a deep red, extremely impressive personality. In addition, thanks to the unique earthy red color, Chili is also very suitable for cheeks, spreading evenly on both cheeks will create a very beautiful blush effect, extremely suitable in autumn.</p>\r\n', '180000.00', 35000, '3ce3.jpg', '', 1, 1, 4, 1, 1493983674),
(49, 10, 'hehe', '<p>No Price</p>\r\n', '250000.00', 0, '7a8d2bd7cb9b44755b1cf897056e33d1.jpg', '[]', 0, 0, 4, 1, 1609091069);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `image_link` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `slider`
--

INSERT INTO `slider` (`id`, `name`, `image_link`, `link`, `sort_order`, `created`) VALUES
(1, '1', 'lip1.jpg', 'http://localhost/webshop/product/view/10', 1, '2020-11-10 15:24:43'),
(4, '2', 'lip2.jpg', 'http://localhost/webshop/product/view/1', 4, '2020-11-10 15:24:43'),
(5, '3', 'lip3.jpg', 'http://localhost/webshop/dior-rouge-641-ultra-spice-p17', 3, '2020-11-10 15:24:43');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `user_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_phone` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `payment` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `transaction`
--

INSERT INTO `transaction` (`id`, `status`, `user_id`, `user_name`, `user_email`, `user_phone`, `user_address`, `message`, `amount`, `payment`, `created`) VALUES
(14, 0, 8, 'Dung hehe', 'Dungpham9400@gmail.com', '123', 'hehe', 'haha', '300000.00', '', 1606186659),
(15, 0, 8, 'Dung', 'Dungpham9400@gmail.com', '123', 'hehe', 'hehee', '2200000.00', '', 1606189025),
(13, 0, 0, 'Dung', 'Dungpham9400@gmail.com', '0379662226', 'hehe', 'hehe', '450000.00', '', 1606185485);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `phone`, `address`, `created`) VALUES
(11, 'Group20', 'user@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '097741521', 'Thai Binh', 2021),
(8, 'Dung', 'Dungpham9400@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '0379662226', 'Thai Binh', 2020);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `catalog`
--
ALTER TABLE `catalog`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `catalog`
--
ALTER TABLE `catalog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT cho bảng `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
