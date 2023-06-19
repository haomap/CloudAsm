-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 16, 2023 lúc 10:23 AM
-- Phiên bản máy phục vụ: 10.4.25-MariaDB
-- Phiên bản PHP: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `online_shopping`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `Cat_ID` varchar(10) NOT NULL,
  `Cat_Name` varchar(30) NOT NULL,
  `Cat_Des` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`Cat_ID`, `Cat_Name`, `Cat_Des`) VALUES
('C01', 'Toy1', 'Children');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `Username` varchar(20) NOT NULL,
  `Password` varchar(40) NOT NULL,
  `CustName` varchar(30) NOT NULL,
  `gender` int(11) NOT NULL,
  `Address` varchar(1000) NOT NULL,
  `telephone` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `CusDate` int(11) NOT NULL,
  `CusMonth` int(11) NOT NULL,
  `CusYear` int(11) NOT NULL,
  `SSN` varchar(10) DEFAULT NULL,
  `ActiveCode` varchar(100) NOT NULL,
  `state` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`Username`, `Password`, `CustName`, `gender`, `Address`, `telephone`, `email`, `CusDate`, `CusMonth`, `CusYear`, `SSN`, `ActiveCode`, `state`) VALUES
('abc', 'fcea920f7412b5da7be0cf42b8c93759', 'Le Vu Hai', 0, 'Bac Lieu', '0949800908', 'Abc@gmail.com', 24, 10, 2002, '', '', 0),
('DEF', '25d55ad283aa400af464c76d713c07ad', 'DEF', 0, 'Can Tho', '0949800908', 'Def@gmail.com', 25, 10, 2002, '', '', 0),
('Finn', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyen Hung Dung', 0, 'Can Tho', '0903100550', 'nhdung.CPL@gmail.com', 31, 8, 1980, '', '', 0),
('haile', 'e10adc3949ba59abbe56e057f20f883e', 'Le Vu Hai', 0, 'Bac Lieu', '0919942775', 'hailvgcc200225@', 25, 10, 2002, '', '', 1),
('lvh', 'e10adc3949ba59abbe56e057f20f883e', 'levuhai', 0, 'Bac Lieu', '0949800908', 'abcd@gmai.com', 15, 12, 2002, '', '', 0),
('nhdung', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyen Hung Dung', 0, 'Can Thow', '0903100550', 'nhdung@gmail.com', 31, 8, 1980, '', '', 0),
('qwe', 'e10adc3949ba59abbe56e057f20f883e', 'Le Vu Hai', 0, 'Bac Lieu', '0949800908', 'qwe@gmail.com', 17, 10, 2003, '', '', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `OrderID` varchar(6) NOT NULL,
  `OrderDate` datetime NOT NULL,
  `DeliveryDate` datetime NOT NULL,
  `Delivery_loca` varchar(200) NOT NULL,
  `Payment` int(11) NOT NULL,
  `username` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `Product_ID` varchar(10) NOT NULL,
  `Product_Name` varchar(30) NOT NULL,
  `Price` bigint(20) NOT NULL,
  `oldPrice` decimal(12,2) NOT NULL,
  `SmallDesc` varchar(1000) NOT NULL,
  `DetailDesc` text NOT NULL,
  `ProDate` datetime NOT NULL,
  `Pro_qty` int(11) NOT NULL,
  `Pro_image` varchar(200) NOT NULL,
  `Cat_ID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`Product_ID`, `Product_Name`, `Price`, `oldPrice`, `SmallDesc`, `DetailDesc`, `ProDate`, `Pro_qty`, `Pro_image`, `Cat_ID`) VALUES
('C00', 'Toytoy', 30000, '0.00', 'Children', '', '2023-06-14 10:48:56', 20, 'h20.jpg', 'C01');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`Cat_ID`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Username`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `username` (`username`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product_ID`),
  ADD KEY `Cat_ID` (`Cat_ID`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`username`) REFERENCES `customer` (`Username`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`Cat_ID`) REFERENCES `category` (`Cat_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
