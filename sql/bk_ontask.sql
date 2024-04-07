-- --------------------------------------------------------
-- Host:                         mysql-363befa2-dotruong0704-3c7a.a.aivencloud.com
-- Server version:               8.0.30 - Source distribution
-- Server OS:                    Linux
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for defaultdb
CREATE DATABASE IF NOT EXISTS `defaultdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `defaultdb`;

-- Dumping structure for table defaultdb.congviec
CREATE TABLE IF NOT EXISTS `congviec` (
  `macongviec` int NOT NULL AUTO_INCREMENT,
  `tencongviec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `noidung` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `manguoigiaoviec` int NOT NULL,
  `manhom` int DEFAULT NULL,
  `ngaygiao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `thoihan` datetime NOT NULL,
  `maloaitrangthaicongviec` int NOT NULL,
  PRIMARY KEY (`macongviec`),
  KEY `manguoigiaoviec` (`manguoigiaoviec`),
  KEY `maloaitrangthaicongviec` (`maloaitrangthaicongviec`),
  KEY `manhom` (`manhom`),
  CONSTRAINT `congviec_ibfk_1` FOREIGN KEY (`manguoigiaoviec`) REFERENCES `taikhoan` (`mataikhoan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `congviec_ibfk_2` FOREIGN KEY (`maloaitrangthaicongviec`) REFERENCES `loaitrangthaicongviec` (`maloaitrangthaicongviec`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `manhom` FOREIGN KEY (`manhom`) REFERENCES `nhom` (`manhom`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table defaultdb.congviec: ~9 rows (approximately)
INSERT INTO `congviec` (`macongviec`, `tencongviec`, `noidung`, `manguoigiaoviec`, `manhom`, `ngaygiao`, `thoihan`, `maloaitrangthaicongviec`) VALUES
	(1, 'Tạo giao diện', 'Tạo giao diện phân công công việc', 2, NULL, '2024-04-06 00:00:00', '2024-07-29 00:00:00', 1),
	(2, 'Tạo giao diện', 'Tạo giao diện phân công công việc', 2, NULL, '2024-04-06 00:00:00', '2024-07-29 00:00:00', 1),
	(3, '123', 'qưe', 2, NULL, '2024-04-06 00:00:00', '2024-04-27 00:00:00', 1),
	(4, '123', 'qưe', 2, NULL, '2024-04-06 00:00:00', '2024-04-27 00:00:00', 1),
	(7, 'Tạo giao diện', 'Tạo giao diện phân công công việc', 2, 22, '2024-04-06 00:00:00', '2024-07-29 00:00:00', 1),
	(8, 'Tạo giao diện 2', 'Tạo giao diện phân công công việc', 2, 22, '2024-04-06 00:00:00', '2024-07-29 00:00:00', 1),
	(9, 'Test', 'Tạo giao diện phân công công việc', 3, 22, '2024-04-06 00:00:00', '2024-07-29 00:00:00', 1),
	(10, 'Test 2', 'Tạo', 3, NULL, '2024-04-06 00:00:00', '2024-07-29 00:00:00', 1),
	(12, 'Test 2', 'Tạo', 3, 21, '2024-04-06 00:00:00', '2024-07-29 00:00:00', 1);

-- Dumping structure for table defaultdb.danhba
CREATE TABLE IF NOT EXISTS `danhba` (
  `madanhba` int NOT NULL AUTO_INCREMENT,
  `chudanhba` int NOT NULL,
  `manguoitrongdanhba` int NOT NULL,
  `ten` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sodienthoai` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `trangthai` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`madanhba`),
  KEY `manguoisohuu` (`chudanhba`) USING BTREE,
  KEY `FK_danhba_taikhoan` (`manguoitrongdanhba`),
  CONSTRAINT `danhba_ibfk_1` FOREIGN KEY (`chudanhba`) REFERENCES `taikhoan` (`mataikhoan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_danhba_taikhoan` FOREIGN KEY (`manguoitrongdanhba`) REFERENCES `taikhoan` (`mataikhoan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table defaultdb.danhba: ~4 rows (approximately)
INSERT INTO `danhba` (`madanhba`, `chudanhba`, `manguoitrongdanhba`, `ten`, `sodienthoai`, `trangthai`) VALUES
	(1, 2, 1, 'Truong', '0905371627', 0),
	(2, 2, 3, 'Mẹ yêu', '0345607344', 1),
	(3, 1, 4, '123', '0973607710', 1),
	(4, 2, 4, '123', '0973607710', 0);

-- Dumping structure for table defaultdb.danhsachnguoinhanviec
CREATE TABLE IF NOT EXISTS `danhsachnguoinhanviec` (
  `macongviec` int NOT NULL,
  `manguoinhan` int NOT NULL,
  PRIMARY KEY (`macongviec`),
  KEY `macongviec` (`macongviec`),
  KEY `manguoinhan` (`manguoinhan`),
  CONSTRAINT `danhsachnguoinhanviec_ibfk_1` FOREIGN KEY (`manguoinhan`) REFERENCES `taikhoan` (`mataikhoan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `danhsachnguoinhanviec_ibfk_2` FOREIGN KEY (`macongviec`) REFERENCES `congviec` (`macongviec`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table defaultdb.danhsachnguoinhanviec: ~9 rows (approximately)
INSERT INTO `danhsachnguoinhanviec` (`macongviec`, `manguoinhan`) VALUES
	(1, 1),
	(2, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 2),
	(12, 2),
	(3, 3),
	(4, 3);

-- Dumping structure for table defaultdb.danhsachnguoitrongdanhba
CREATE TABLE IF NOT EXISTS `danhsachnguoitrongdanhba` (
  `madanhba` int NOT NULL,
  `mataikhoan` int NOT NULL,
  `hovaten` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sodienthoai` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`madanhba`),
  KEY `mataikhoan` (`mataikhoan`),
  KEY `madanhba` (`madanhba`),
  CONSTRAINT `danhsachnguoitrongdanhba_ibfk_1` FOREIGN KEY (`madanhba`) REFERENCES `danhba` (`madanhba`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `danhsachnguoitrongdanhba_ibfk_2` FOREIGN KEY (`mataikhoan`) REFERENCES `taikhoan` (`mataikhoan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table defaultdb.danhsachnguoitrongdanhba: ~0 rows (approximately)

-- Dumping structure for table defaultdb.danhsachthanhviennhom
CREATE TABLE IF NOT EXISTS `danhsachthanhviennhom` (
  `id` int NOT NULL AUTO_INCREMENT,
  `manhom` int NOT NULL,
  `mataikhoan` int NOT NULL,
  `maloaiquyen` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mataikhoan` (`mataikhoan`),
  KEY `maloaiquyen` (`maloaiquyen`),
  KEY `manhom` (`manhom`),
  CONSTRAINT `danhsachthanhviennhom_ibfk_1` FOREIGN KEY (`mataikhoan`) REFERENCES `taikhoan` (`mataikhoan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `danhsachthanhviennhom_ibfk_3` FOREIGN KEY (`maloaiquyen`) REFERENCES `loaiquyen` (`maloaiquyen`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_danhsachthanhviennhom_nhom` FOREIGN KEY (`manhom`) REFERENCES `nhom` (`manhom`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table defaultdb.danhsachthanhviennhom: ~9 rows (approximately)
INSERT INTO `danhsachthanhviennhom` (`id`, `manhom`, `mataikhoan`, `maloaiquyen`) VALUES
	(1, 20, 1, 1),
	(2, 20, 3, 1),
	(3, 20, 2, 2),
	(4, 21, 3, 1),
	(5, 21, 1, 1),
	(6, 21, 2, 2),
	(7, 22, 1, 1),
	(8, 22, 3, 1),
	(9, 22, 2, 2);

-- Dumping structure for table defaultdb.filehinh
CREATE TABLE IF NOT EXISTS `filehinh` (
  `mafilehinh` int NOT NULL AUTO_INCREMENT,
  `matinnhan` int NOT NULL,
  `tenfilehinh` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tenloai` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`mafilehinh`),
  KEY `matinnhan` (`matinnhan`),
  CONSTRAINT `filehinh_ibfk_1` FOREIGN KEY (`matinnhan`) REFERENCES `tinnhan` (`matinnhan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table defaultdb.filehinh: ~0 rows (approximately)

-- Dumping structure for view defaultdb.get_list_assign_task
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `get_list_assign_task` (
	`macongviec` INT(10) NOT NULL,
	`tencongviec` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`noidung` VARCHAR(1000) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`manguoigiaoviec` INT(10) NOT NULL,
	`manhom` INT(10) NULL,
	`manguoinhan` INT(10) NOT NULL,
	`ngaygiao` DATETIME NOT NULL,
	`thoihan` DATETIME NOT NULL,
	`maloaitrangthaicongviec` INT(10) NOT NULL,
	`tentrangthai` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_unicode_ci'
) ENGINE=MyISAM;

-- Dumping structure for view defaultdb.get_list_task_received
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `get_list_task_received` (
	`macongviec` INT(10) NOT NULL,
	`tencongviec` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`noidung` VARCHAR(1000) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`manguoigiaoviec` INT(10) NOT NULL,
	`manhom` INT(10) NULL,
	`manguoinhan` INT(10) NOT NULL,
	`ngaygiao` DATETIME NOT NULL,
	`thoihan` DATETIME NOT NULL,
	`maloaitrangthaicongviec` INT(10) NOT NULL,
	`tentrangthai` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`manguoigui` INT(10) NOT NULL,
	`noidungbaocao` VARCHAR(1000) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`thoigiangui` DATETIME NOT NULL
) ENGINE=MyISAM;

-- Dumping structure for view defaultdb.get_list_task_received_2
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `get_list_task_received_2` (
	`macongviec` INT(10) NOT NULL,
	`tencongviec` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`noidung` VARCHAR(1000) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`manguoigiaoviec` INT(10) NOT NULL,
	`manhom` INT(10) NULL,
	`manguoinhan` INT(10) NOT NULL,
	`ngaygiao` DATETIME NOT NULL,
	`thoihan` DATETIME NOT NULL,
	`maloaitrangthaicongviec` INT(10) NOT NULL,
	`tentrangthai` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_unicode_ci'
) ENGINE=MyISAM;

-- Dumping structure for view defaultdb.get_list_task_received_3
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `get_list_task_received_3` (
	`macongviec` INT(10) NOT NULL,
	`tencongviec` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`noidung` VARCHAR(1000) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`manguoigiaoviec` INT(10) NOT NULL,
	`manhom` INT(10) NULL,
	`manguoinhan` INT(10) NOT NULL,
	`ngaygiao` DATETIME NOT NULL,
	`thoihan` DATETIME NOT NULL,
	`maloaitrangthaicongviec` INT(10) NOT NULL,
	`tentrangthai` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_unicode_ci'
) ENGINE=MyISAM;

-- Dumping structure for view defaultdb.get_list_task_received_hasGr
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `get_list_task_received_hasGr` (
	`macongviec` INT(10) NOT NULL,
	`tencongviec` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`noidung` VARCHAR(1000) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`manguoigiaoviec` INT(10) NOT NULL,
	`manhom` INT(10) NULL,
	`manguoinhan` INT(10) NOT NULL,
	`ngaygiao` DATETIME NOT NULL,
	`thoihan` DATETIME NOT NULL,
	`maloaitrangthaicongviec` INT(10) NOT NULL,
	`tentrangthai` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_unicode_ci'
) ENGINE=MyISAM;

-- Dumping structure for view defaultdb.get_list_task_received_noGr
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `get_list_task_received_noGr` (
	`macongviec` INT(10) NOT NULL,
	`tencongviec` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`noidung` VARCHAR(1000) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`manguoigiaoviec` INT(10) NOT NULL,
	`manhom` INT(10) NULL,
	`manguoinhan` INT(10) NOT NULL,
	`ngaygiao` DATETIME NOT NULL,
	`thoihan` DATETIME NOT NULL,
	`maloaitrangthaicongviec` INT(10) NOT NULL,
	`tentrangthai` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_unicode_ci'
) ENGINE=MyISAM;

-- Dumping structure for table defaultdb.loaiquyen
CREATE TABLE IF NOT EXISTS `loaiquyen` (
  `maloaiquyen` int NOT NULL AUTO_INCREMENT,
  `tenloaiquyen` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`maloaiquyen`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table defaultdb.loaiquyen: ~1 rows (approximately)
INSERT INTO `loaiquyen` (`maloaiquyen`, `tenloaiquyen`) VALUES
	(1, 'Thành viên'),
	(2, 'Trưởng nhóm');

-- Dumping structure for table defaultdb.loaithongbao
CREATE TABLE IF NOT EXISTS `loaithongbao` (
  `maloaithongbao` int NOT NULL AUTO_INCREMENT,
  `tenloaithongbao` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`maloaithongbao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table defaultdb.loaithongbao: ~0 rows (approximately)

-- Dumping structure for table defaultdb.loaitinnhan
CREATE TABLE IF NOT EXISTS `loaitinnhan` (
  `maloaitinnhan` int NOT NULL AUTO_INCREMENT,
  `tenloaitinnhan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`maloaitinnhan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table defaultdb.loaitinnhan: ~0 rows (approximately)

-- Dumping structure for table defaultdb.loaitrangthaicongviec
CREATE TABLE IF NOT EXISTS `loaitrangthaicongviec` (
  `maloaitrangthaicongviec` int NOT NULL AUTO_INCREMENT,
  `tentrangthai` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`maloaitrangthaicongviec`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table defaultdb.loaitrangthaicongviec: ~2 rows (approximately)
INSERT INTO `loaitrangthaicongviec` (`maloaitrangthaicongviec`, `tentrangthai`) VALUES
	(1, 'Chưa bắt đầu'),
	(2, 'Đang thực hiện'),
	(3, 'Đã hoàn thành');

-- Dumping structure for table defaultdb.nhom
CREATE TABLE IF NOT EXISTS `nhom` (
  `manhom` int NOT NULL AUTO_INCREMENT,
  `tennhom` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `matruongnhom` int NOT NULL,
  PRIMARY KEY (`manhom`),
  KEY `matruongnhom` (`matruongnhom`),
  CONSTRAINT `nhom_ibfk_1` FOREIGN KEY (`matruongnhom`) REFERENCES `taikhoan` (`mataikhoan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table defaultdb.nhom: ~2 rows (approximately)
INSERT INTO `nhom` (`manhom`, `tennhom`, `matruongnhom`) VALUES
	(20, 'Nhóm test', 2),
	(21, '123', 2),
	(22, 'Nhóm test', 2);

-- Dumping structure for table defaultdb.taikhoan
CREATE TABLE IF NOT EXISTS `taikhoan` (
  `mataikhoan` int NOT NULL AUTO_INCREMENT,
  `sodienthoai` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `matkhau` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `diachi` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hodem` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ten` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ngaysinh` date NOT NULL,
  `gioitinh` tinyint(1) NOT NULL,
  `trangthai` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`mataikhoan`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table defaultdb.taikhoan: ~3 rows (approximately)
INSERT INTO `taikhoan` (`mataikhoan`, `sodienthoai`, `matkhau`, `email`, `diachi`, `hodem`, `ten`, `ngaysinh`, `gioitinh`, `trangthai`) VALUES
	(1, '0905371627', '123', 'dotruong@gmail.com', 'thon 9', 'do van', 'teuong', '2024-04-03', 1, 1),
	(2, '0336794265', '123', 'linhdieu@gmail.com', 'Dương Quảng Hàm', 'Diệu', 'Linhh', '2002-01-31', 0, 1),
	(3, '0345607344', '123', 'ngocninh@gmail.com', 'Núi Thành', 'Ngọc', 'Ninh', '1973-01-06', 1, 1),
	(4, '0973607710', '123', 'hando@gmail.com', 'Dark Ruồng', 'Đỗ Văn', 'Hân', '1970-01-01', 0, 1);

-- Dumping structure for table defaultdb.thongbao
CREATE TABLE IF NOT EXISTS `thongbao` (
  `mathongbao` int NOT NULL AUTO_INCREMENT,
  `manguoigui` int NOT NULL,
  `maloaithongbao` int NOT NULL,
  `noidung` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `thoigian` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trangthai` int NOT NULL,
  PRIMARY KEY (`mathongbao`),
  KEY `manguoigui` (`manguoigui`),
  KEY `maloaithongbao` (`maloaithongbao`),
  KEY `trangthai` (`trangthai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table defaultdb.thongbao: ~0 rows (approximately)

-- Dumping structure for table defaultdb.thongbao_taikhoan
CREATE TABLE IF NOT EXISTS `thongbao_taikhoan` (
  `mathongbao` int NOT NULL,
  `mataikhoan` int NOT NULL,
  `maloaithongbao` int NOT NULL,
  `trangthai` int NOT NULL,
  PRIMARY KEY (`mathongbao`),
  KEY `mathongbao` (`mathongbao`),
  KEY `mataikhoan` (`mataikhoan`),
  KEY `maloaithongbao` (`maloaithongbao`),
  CONSTRAINT `thongbao_taikhoan_ibfk_1` FOREIGN KEY (`maloaithongbao`) REFERENCES `loaithongbao` (`maloaithongbao`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `thongbao_taikhoan_ibfk_2` FOREIGN KEY (`mathongbao`) REFERENCES `thongbao` (`mathongbao`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `thongbao_taikhoan_ibfk_3` FOREIGN KEY (`mataikhoan`) REFERENCES `taikhoan` (`mataikhoan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table defaultdb.thongbao_taikhoan: ~0 rows (approximately)

-- Dumping structure for table defaultdb.thongtinbaocaotiendo
CREATE TABLE IF NOT EXISTS `thongtinbaocaotiendo` (
  `mabaocaotiendo` int NOT NULL AUTO_INCREMENT,
  `macongviec` int NOT NULL,
  `manguoigui` int NOT NULL,
  `noidung` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `thoigiangui` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`mabaocaotiendo`),
  KEY `macongviec` (`macongviec`),
  KEY `manguoigui` (`manguoigui`),
  CONSTRAINT `thongtinbaocaotiendo_ibfk_1` FOREIGN KEY (`macongviec`) REFERENCES `congviec` (`macongviec`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `thongtinbaocaotiendo_ibfk_2` FOREIGN KEY (`manguoigui`) REFERENCES `taikhoan` (`mataikhoan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table defaultdb.thongtinbaocaotiendo: ~3 rows (approximately)
INSERT INTO `thongtinbaocaotiendo` (`mabaocaotiendo`, `macongviec`, `manguoigui`, `noidung`, `thoigiangui`) VALUES
	(1, 1, 1, 'Đang chuẩn bị', '2024-04-06 21:06:12'),
	(2, 7, 1, 'ok nhận', '2024-04-06 22:53:49');

-- Dumping structure for table defaultdb.tinnhan
CREATE TABLE IF NOT EXISTS `tinnhan` (
  `matinnhan` int NOT NULL AUTO_INCREMENT,
  `maloaitinnhan` int NOT NULL,
  `manguoigui` int NOT NULL,
  `manguoinhan` int NOT NULL,
  `manhomnhan` int NOT NULL,
  `noidung` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `thoigiangui` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`matinnhan`),
  KEY `manguoigui` (`manguoigui`),
  KEY `manguoinhan` (`manguoinhan`),
  KEY `manhomnhan` (`manhomnhan`),
  KEY `maloaitinnhan` (`maloaitinnhan`),
  CONSTRAINT `tinnhan_ibfk_1` FOREIGN KEY (`manguoigui`) REFERENCES `taikhoan` (`mataikhoan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tinnhan_ibfk_2` FOREIGN KEY (`manguoinhan`) REFERENCES `taikhoan` (`mataikhoan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tinnhan_ibfk_3` FOREIGN KEY (`manhomnhan`) REFERENCES `nhom` (`manhom`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tinnhan_ibfk_4` FOREIGN KEY (`maloaitinnhan`) REFERENCES `loaitinnhan` (`maloaitinnhan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table defaultdb.tinnhan: ~0 rows (approximately)

-- Dumping structure for view defaultdb.get_list_assign_task
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `get_list_assign_task`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `get_list_assign_task` AS select `cv`.`macongviec` AS `macongviec`,`cv`.`tencongviec` AS `tencongviec`,`cv`.`noidung` AS `noidung`,`cv`.`manguoigiaoviec` AS `manguoigiaoviec`,`cv`.`manhom` AS `manhom`,`ds`.`manguoinhan` AS `manguoinhan`,`cv`.`ngaygiao` AS `ngaygiao`,`cv`.`thoihan` AS `thoihan`,`tt`.`maloaitrangthaicongviec` AS `maloaitrangthaicongviec`,`tt`.`tentrangthai` AS `tentrangthai` from ((`congviec` `cv` join `danhsachnguoinhanviec` `ds` on((`ds`.`macongviec` = `cv`.`macongviec`))) join `loaitrangthaicongviec` `tt` on((`tt`.`maloaitrangthaicongviec` = `cv`.`maloaitrangthaicongviec`))) where ((`cv`.`manguoigiaoviec` = `cv`.`manguoigiaoviec`) and ((`cv`.`manhom` = `cv`.`manhom`) or (`cv`.`manhom` is null)) and ((`ds`.`manguoinhan` = `ds`.`manguoinhan`) or (`ds`.`manguoinhan` is null)));

-- Dumping structure for view defaultdb.get_list_task_received
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `get_list_task_received`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `get_list_task_received` AS select `cv`.`macongviec` AS `macongviec`,`cv`.`tencongviec` AS `tencongviec`,`cv`.`noidung` AS `noidung`,`cv`.`manguoigiaoviec` AS `manguoigiaoviec`,`cv`.`manhom` AS `manhom`,`ds`.`manguoinhan` AS `manguoinhan`,`cv`.`ngaygiao` AS `ngaygiao`,`cv`.`thoihan` AS `thoihan`,`tt`.`maloaitrangthaicongviec` AS `maloaitrangthaicongviec`,`tt`.`tentrangthai` AS `tentrangthai`,`bc`.`manguoigui` AS `manguoigui`,`bc`.`noidung` AS `noidungbaocao`,`bc`.`thoigiangui` AS `thoigiangui` from (((`congviec` `cv` join `danhsachnguoinhanviec` `ds` on((`ds`.`macongviec` = `cv`.`macongviec`))) join `loaitrangthaicongviec` `tt` on((`tt`.`maloaitrangthaicongviec` = `cv`.`maloaitrangthaicongviec`))) join `thongtinbaocaotiendo` `bc` on((`bc`.`macongviec` = `cv`.`macongviec`))) where ((`ds`.`manguoinhan` = `ds`.`manguoinhan`) and ((`cv`.`manhom` = `cv`.`manhom`) or (`cv`.`manhom` is null)));

-- Dumping structure for view defaultdb.get_list_task_received_2
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `get_list_task_received_2`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `get_list_task_received_2` AS select `cv`.`macongviec` AS `macongviec`,`cv`.`tencongviec` AS `tencongviec`,`cv`.`noidung` AS `noidung`,`cv`.`manguoigiaoviec` AS `manguoigiaoviec`,`cv`.`manhom` AS `manhom`,`ds`.`manguoinhan` AS `manguoinhan`,`cv`.`ngaygiao` AS `ngaygiao`,`cv`.`thoihan` AS `thoihan`,`tt`.`maloaitrangthaicongviec` AS `maloaitrangthaicongviec`,`tt`.`tentrangthai` AS `tentrangthai` from ((`congviec` `cv` join `danhsachnguoinhanviec` `ds` on((`ds`.`macongviec` = `cv`.`macongviec`))) join `loaitrangthaicongviec` `tt` on((`tt`.`maloaitrangthaicongviec` = `cv`.`maloaitrangthaicongviec`))) where ((`ds`.`manguoinhan` = `ds`.`manguoinhan`) and ((`cv`.`manhom` = `cv`.`manhom`) or (`cv`.`manhom` is null)));

-- Dumping structure for view defaultdb.get_list_task_received_3
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `get_list_task_received_3`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `get_list_task_received_3` AS select `cv`.`macongviec` AS `macongviec`,`cv`.`tencongviec` AS `tencongviec`,`cv`.`noidung` AS `noidung`,`cv`.`manguoigiaoviec` AS `manguoigiaoviec`,`cv`.`manhom` AS `manhom`,`ds`.`manguoinhan` AS `manguoinhan`,`cv`.`ngaygiao` AS `ngaygiao`,`cv`.`thoihan` AS `thoihan`,`tt`.`maloaitrangthaicongviec` AS `maloaitrangthaicongviec`,`tt`.`tentrangthai` AS `tentrangthai` from ((`congviec` `cv` join `danhsachnguoinhanviec` `ds` on((`ds`.`macongviec` = `cv`.`macongviec`))) join `loaitrangthaicongviec` `tt` on((`tt`.`maloaitrangthaicongviec` = `cv`.`maloaitrangthaicongviec`))) where ((`ds`.`manguoinhan` = `ds`.`manguoinhan`) and ((`cv`.`manguoigiaoviec` = `cv`.`manguoigiaoviec`) or (`cv`.`manguoigiaoviec` is null)) and ((`cv`.`manhom` = `cv`.`manhom`) or (`cv`.`manhom` is null)));

-- Dumping structure for view defaultdb.get_list_task_received_hasGr
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `get_list_task_received_hasGr`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `get_list_task_received_hasGr` AS select `cv`.`macongviec` AS `macongviec`,`cv`.`tencongviec` AS `tencongviec`,`cv`.`noidung` AS `noidung`,`cv`.`manguoigiaoviec` AS `manguoigiaoviec`,`cv`.`manhom` AS `manhom`,`ds`.`manguoinhan` AS `manguoinhan`,`cv`.`ngaygiao` AS `ngaygiao`,`cv`.`thoihan` AS `thoihan`,`tt`.`maloaitrangthaicongviec` AS `maloaitrangthaicongviec`,`tt`.`tentrangthai` AS `tentrangthai` from ((`congviec` `cv` join `danhsachnguoinhanviec` `ds` on((`ds`.`macongviec` = `cv`.`macongviec`))) join `loaitrangthaicongviec` `tt` on((`tt`.`maloaitrangthaicongviec` = `cv`.`maloaitrangthaicongviec`))) where ((`ds`.`manguoinhan` = `ds`.`manguoinhan`) and (`cv`.`manhom` = `cv`.`manhom`));

-- Dumping structure for view defaultdb.get_list_task_received_noGr
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `get_list_task_received_noGr`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `get_list_task_received_noGr` AS select `cv`.`macongviec` AS `macongviec`,`cv`.`tencongviec` AS `tencongviec`,`cv`.`noidung` AS `noidung`,`cv`.`manguoigiaoviec` AS `manguoigiaoviec`,`cv`.`manhom` AS `manhom`,`ds`.`manguoinhan` AS `manguoinhan`,`cv`.`ngaygiao` AS `ngaygiao`,`cv`.`thoihan` AS `thoihan`,`tt`.`maloaitrangthaicongviec` AS `maloaitrangthaicongviec`,`tt`.`tentrangthai` AS `tentrangthai` from ((`congviec` `cv` join `danhsachnguoinhanviec` `ds` on((`ds`.`macongviec` = `cv`.`macongviec`))) join `loaitrangthaicongviec` `tt` on((`tt`.`maloaitrangthaicongviec` = `cv`.`maloaitrangthaicongviec`))) where (`ds`.`manguoinhan` = `ds`.`manguoinhan`);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
