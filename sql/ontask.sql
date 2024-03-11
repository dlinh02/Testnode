-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th3 11, 2024 lúc 06:29 AM
-- Phiên bản máy phục vụ: 8.0.30
-- Phiên bản PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ontask`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `congviec`
--

CREATE TABLE `congviec` (
  `macongviec` int NOT NULL,
  `tencongviec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `manguoigiaoviec` int NOT NULL,
  `ngaygiao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `thoihan` datetime NOT NULL,
  `maloaitrangthaicongviec` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhba`
--

CREATE TABLE `danhba` (
  `madanhba` int NOT NULL,
  `manguoisohuu` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhsachnguoinhanviec`
--

CREATE TABLE `danhsachnguoinhanviec` (
  `macongviec` int NOT NULL,
  `manguoinhan` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhsachnguoitrongdanhba`
--

CREATE TABLE `danhsachnguoitrongdanhba` (
  `madanhba` int NOT NULL,
  `mataikhoan` int NOT NULL,
  `hovaten` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sodienthoai` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhsachthanhviennhom`
--

CREATE TABLE `danhsachthanhviennhom` (
  `manhom` int NOT NULL,
  `mataikhoan` int NOT NULL,
  `maloaiquyen` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `filehinh`
--

CREATE TABLE `filehinh` (
  `mafilehinh` int NOT NULL,
  `matinnhan` int NOT NULL,
  `tenfilehinh` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tenloai` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaiquyen`
--

CREATE TABLE `loaiquyen` (
  `maloaiquyen` int NOT NULL,
  `tenloaiquyen` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `loaiquyen`
--

INSERT INTO `loaiquyen` (`maloaiquyen`, `tenloaiquyen`) VALUES
(1, 'Trưởng nhóm'),
(2, 'Phó nhóm');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaithongbao`
--

CREATE TABLE `loaithongbao` (
  `maloaithongbao` int NOT NULL,
  `tenloaithongbao` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaitinnhan`
--

CREATE TABLE `loaitinnhan` (
  `maloaitinnhan` int NOT NULL,
  `tenloaitinnhan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaitrangthaicongviec`
--

CREATE TABLE `loaitrangthaicongviec` (
  `maloaitrangthaicongviec` int NOT NULL,
  `tentrangthai` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhom`
--

CREATE TABLE `nhom` (
  `manhom` int NOT NULL,
  `tennhom` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `matruongnhom` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `mataikhoan` int NOT NULL,
  `sodienthoai` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `matkhau` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `diachi` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hodem` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ten` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NgaySinh` date NOT NULL,
  `gioitinh` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thongbao`
--

CREATE TABLE `thongbao` (
  `mathongbao` int NOT NULL,
  `manguoigui` int NOT NULL,
  `maloaithongbao` int NOT NULL,
  `noidung` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `thoigian` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trangthai` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thongbao_taikhoan`
--

CREATE TABLE `thongbao_taikhoan` (
  `mathongbao` int NOT NULL,
  `mataikhoan` int NOT NULL,
  `maloaithongbao` int NOT NULL,
  `trangthai` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thongtinbaocaotiendo`
--

CREATE TABLE `thongtinbaocaotiendo` (
  `mabaocaotiendo` int NOT NULL,
  `macongviec` int NOT NULL,
  `manguoigui` int NOT NULL,
  `noidung` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `thoigiangui` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tinnhan`
--

CREATE TABLE `tinnhan` (
  `matinnhan` int NOT NULL,
  `maloaitinnhan` int NOT NULL,
  `manguoigui` int NOT NULL,
  `manguoinhan` int NOT NULL,
  `manhomnhan` int NOT NULL,
  `noidung` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `thoigiangui` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `congviec`
--
ALTER TABLE `congviec`
  ADD PRIMARY KEY (`macongviec`),
  ADD KEY `manguoigiaoviec` (`manguoigiaoviec`),
  ADD KEY `maloaitrangthaicongviec` (`maloaitrangthaicongviec`);

--
-- Chỉ mục cho bảng `danhba`
--
ALTER TABLE `danhba`
  ADD PRIMARY KEY (`madanhba`),
  ADD KEY `manguoisohuu` (`manguoisohuu`);

--
-- Chỉ mục cho bảng `danhsachnguoinhanviec`
--
ALTER TABLE `danhsachnguoinhanviec`
  ADD KEY `macongviec` (`macongviec`),
  ADD KEY `manguoinhan` (`manguoinhan`);

--
-- Chỉ mục cho bảng `danhsachnguoitrongdanhba`
--
ALTER TABLE `danhsachnguoitrongdanhba`
  ADD KEY `mataikhoan` (`mataikhoan`),
  ADD KEY `madanhba` (`madanhba`);

--
-- Chỉ mục cho bảng `danhsachthanhviennhom`
--
ALTER TABLE `danhsachthanhviennhom`
  ADD KEY `manhom` (`manhom`),
  ADD KEY `mataikhoan` (`mataikhoan`),
  ADD KEY `maloaiquyen` (`maloaiquyen`);

--
-- Chỉ mục cho bảng `filehinh`
--
ALTER TABLE `filehinh`
  ADD PRIMARY KEY (`mafilehinh`),
  ADD KEY `matinnhan` (`matinnhan`);

--
-- Chỉ mục cho bảng `loaiquyen`
--
ALTER TABLE `loaiquyen`
  ADD PRIMARY KEY (`maloaiquyen`);

--
-- Chỉ mục cho bảng `loaithongbao`
--
ALTER TABLE `loaithongbao`
  ADD PRIMARY KEY (`maloaithongbao`);

--
-- Chỉ mục cho bảng `loaitinnhan`
--
ALTER TABLE `loaitinnhan`
  ADD PRIMARY KEY (`maloaitinnhan`);

--
-- Chỉ mục cho bảng `loaitrangthaicongviec`
--
ALTER TABLE `loaitrangthaicongviec`
  ADD PRIMARY KEY (`maloaitrangthaicongviec`);

--
-- Chỉ mục cho bảng `nhom`
--
ALTER TABLE `nhom`
  ADD PRIMARY KEY (`manhom`),
  ADD KEY `matruongnhom` (`matruongnhom`);

--
-- Chỉ mục cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`mataikhoan`);

--
-- Chỉ mục cho bảng `thongbao`
--
ALTER TABLE `thongbao`
  ADD PRIMARY KEY (`mathongbao`),
  ADD KEY `manguoigui` (`manguoigui`),
  ADD KEY `maloaithongbao` (`maloaithongbao`),
  ADD KEY `trangthai` (`trangthai`);

--
-- Chỉ mục cho bảng `thongbao_taikhoan`
--
ALTER TABLE `thongbao_taikhoan`
  ADD KEY `mathongbao` (`mathongbao`),
  ADD KEY `mataikhoan` (`mataikhoan`),
  ADD KEY `maloaithongbao` (`maloaithongbao`);

--
-- Chỉ mục cho bảng `thongtinbaocaotiendo`
--
ALTER TABLE `thongtinbaocaotiendo`
  ADD PRIMARY KEY (`mabaocaotiendo`),
  ADD KEY `macongviec` (`macongviec`),
  ADD KEY `manguoigui` (`manguoigui`);

--
-- Chỉ mục cho bảng `tinnhan`
--
ALTER TABLE `tinnhan`
  ADD PRIMARY KEY (`matinnhan`),
  ADD KEY `manguoigui` (`manguoigui`),
  ADD KEY `manguoinhan` (`manguoinhan`),
  ADD KEY `manhomnhan` (`manhomnhan`),
  ADD KEY `maloaitinnhan` (`maloaitinnhan`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `congviec`
--
ALTER TABLE `congviec`
  MODIFY `macongviec` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `danhba`
--
ALTER TABLE `danhba`
  MODIFY `madanhba` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `filehinh`
--
ALTER TABLE `filehinh`
  MODIFY `mafilehinh` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `loaiquyen`
--
ALTER TABLE `loaiquyen`
  MODIFY `maloaiquyen` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `loaithongbao`
--
ALTER TABLE `loaithongbao`
  MODIFY `maloaithongbao` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `loaitinnhan`
--
ALTER TABLE `loaitinnhan`
  MODIFY `maloaitinnhan` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `loaitrangthaicongviec`
--
ALTER TABLE `loaitrangthaicongviec`
  MODIFY `maloaitrangthaicongviec` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `nhom`
--
ALTER TABLE `nhom`
  MODIFY `manhom` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  MODIFY `mataikhoan` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `thongbao`
--
ALTER TABLE `thongbao`
  MODIFY `mathongbao` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `thongtinbaocaotiendo`
--
ALTER TABLE `thongtinbaocaotiendo`
  MODIFY `mabaocaotiendo` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tinnhan`
--
ALTER TABLE `tinnhan`
  MODIFY `matinnhan` int NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `congviec`
--
ALTER TABLE `congviec`
  ADD CONSTRAINT `congviec_ibfk_1` FOREIGN KEY (`manguoigiaoviec`) REFERENCES `taikhoan` (`mataikhoan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `congviec_ibfk_2` FOREIGN KEY (`maloaitrangthaicongviec`) REFERENCES `loaitrangthaicongviec` (`maloaitrangthaicongviec`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `danhba`
--
ALTER TABLE `danhba`
  ADD CONSTRAINT `danhba_ibfk_1` FOREIGN KEY (`manguoisohuu`) REFERENCES `taikhoan` (`mataikhoan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `danhsachnguoinhanviec`
--
ALTER TABLE `danhsachnguoinhanviec`
  ADD CONSTRAINT `danhsachnguoinhanviec_ibfk_1` FOREIGN KEY (`manguoinhan`) REFERENCES `taikhoan` (`mataikhoan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `danhsachnguoinhanviec_ibfk_2` FOREIGN KEY (`macongviec`) REFERENCES `congviec` (`macongviec`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `danhsachnguoitrongdanhba`
--
ALTER TABLE `danhsachnguoitrongdanhba`
  ADD CONSTRAINT `danhsachnguoitrongdanhba_ibfk_1` FOREIGN KEY (`madanhba`) REFERENCES `danhba` (`madanhba`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `danhsachnguoitrongdanhba_ibfk_2` FOREIGN KEY (`mataikhoan`) REFERENCES `taikhoan` (`mataikhoan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `danhsachthanhviennhom`
--
ALTER TABLE `danhsachthanhviennhom`
  ADD CONSTRAINT `danhsachthanhviennhom_ibfk_1` FOREIGN KEY (`mataikhoan`) REFERENCES `taikhoan` (`mataikhoan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `danhsachthanhviennhom_ibfk_2` FOREIGN KEY (`manhom`) REFERENCES `nhom` (`manhom`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `danhsachthanhviennhom_ibfk_3` FOREIGN KEY (`maloaiquyen`) REFERENCES `loaiquyen` (`maloaiquyen`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `filehinh`
--
ALTER TABLE `filehinh`
  ADD CONSTRAINT `filehinh_ibfk_1` FOREIGN KEY (`matinnhan`) REFERENCES `tinnhan` (`matinnhan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `nhom`
--
ALTER TABLE `nhom`
  ADD CONSTRAINT `nhom_ibfk_1` FOREIGN KEY (`matruongnhom`) REFERENCES `taikhoan` (`mataikhoan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `thongbao_taikhoan`
--
ALTER TABLE `thongbao_taikhoan`
  ADD CONSTRAINT `thongbao_taikhoan_ibfk_1` FOREIGN KEY (`maloaithongbao`) REFERENCES `loaithongbao` (`maloaithongbao`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `thongbao_taikhoan_ibfk_2` FOREIGN KEY (`mathongbao`) REFERENCES `thongbao` (`mathongbao`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `thongbao_taikhoan_ibfk_3` FOREIGN KEY (`mataikhoan`) REFERENCES `taikhoan` (`mataikhoan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `thongtinbaocaotiendo`
--
ALTER TABLE `thongtinbaocaotiendo`
  ADD CONSTRAINT `thongtinbaocaotiendo_ibfk_1` FOREIGN KEY (`macongviec`) REFERENCES `congviec` (`macongviec`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `thongtinbaocaotiendo_ibfk_2` FOREIGN KEY (`manguoigui`) REFERENCES `taikhoan` (`mataikhoan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `tinnhan`
--
ALTER TABLE `tinnhan`
  ADD CONSTRAINT `tinnhan_ibfk_1` FOREIGN KEY (`manguoigui`) REFERENCES `taikhoan` (`mataikhoan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tinnhan_ibfk_2` FOREIGN KEY (`manguoinhan`) REFERENCES `taikhoan` (`mataikhoan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tinnhan_ibfk_3` FOREIGN KEY (`manhomnhan`) REFERENCES `nhom` (`manhom`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tinnhan_ibfk_4` FOREIGN KEY (`maloaitinnhan`) REFERENCES `loaitinnhan` (`maloaitinnhan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
