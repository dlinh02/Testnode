-- --------------------------------------------------------
-- Host:                         14.225.198.48
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
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
  `noidung` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table defaultdb.congviec: ~11 rows (approximately)
INSERT INTO `congviec` (`macongviec`, `tencongviec`, `noidung`, `manguoigiaoviec`, `manhom`, `ngaygiao`, `thoihan`, `maloaitrangthaicongviec`) VALUES
	(15, 'Tạo giao diện đăng nhập', 'Input: Thông tin đăng nhập\nOutput: Lưu thông tin vào redux user', 2, NULL, '2024-03-10 00:00:00', '2024-04-01 00:00:00', 3),
	(16, 'Tạo giao diện đăng kí', 'Input: Thông tin đăng kí\nOuput: Lưu thông tin vào redux user', 2, NULL, '2024-04-10 00:00:00', '2024-04-10 00:00:00', 2),
	(17, 'Tạo giao diện tin nhắn', 'Tạo trước giao diện, tích hợp realtime sau', 2, NULL, '2024-04-10 00:00:00', '2024-04-11 00:00:00', 1),
	(18, 'Tạo API Xoá danh bạ', 'Note: Giải quyết vấn đề thêm lại danh bạ khi đã xoá trước đó', 1, NULL, '2024-04-10 00:00:00', '2024-04-17 00:00:00', 3),
	(19, 'Tạo API thêm danh bạ', 'Input: tên, số điện thoại\nOuput: success: true, message: Thêm bạn thành công, trả về thông tin thêm vào\nsuccess: false, message: không tìm thấy người dùng\nInput: tên, số điện thoại\nOuput: success: true, message: Thêm bạn thành công, trả về thông tin thêm vào\nsuccess: false, message: không tìm thấy người dùng', 1, NULL, '2024-04-10 00:00:00', '2024-04-16 00:00:00', 1),
	(20, 'Tạo API tạo nhóm', 'Input: manguoigiao, manhom(nếu không có thì null) Output: congviec, danhsachnguoinhanviec, loaitrangthaicongviec', 1, NULL, '2024-04-11 00:00:00', '2024-04-14 00:00:00', 3),
	(21, 'Tạo API lấy danh sách công việc giao', 'Input: manguoigiao, manhom(nếu không có thì null)\nOutput: congviec, danhsachnguoinhanviec, loaitrangthaicongviec', 1, NULL, '2024-04-10 00:00:00', '2024-04-18 00:00:00', 2),
	(22, 'Tạo API lấy danh sách công việc nhận', 'Input: manguoinhan(id đang đăng nhập), manguoigiaoviec(id trưởng nhóm/null) manhom(nếu không có thì null)\nOutput: congviec, danhsachnguoinhanviec, loaitrangthaicongviec', 1, NULL, '2024-04-10 00:00:00', '2024-04-28 00:00:00', 3),
	(23, 'Tạo giao diện thêm danh bạ', 'nhớ responsive', 2, NULL, '2024-04-10 00:00:00', '2024-04-25 00:00:00', 1),
	(24, 'Tạo giao diện nhóm', 'Tương tự như danh bạ ', 2, NULL, '2024-04-10 00:00:00', '2024-04-14 00:00:00', 3),
	(25, 'Fix bug giao diện ', 'hahahahah', 2, NULL, '2024-04-17 00:00:00', '2024-05-05 00:00:00', 1);

-- Dumping structure for table defaultdb.danhba
CREATE TABLE IF NOT EXISTS `danhba` (
  `madanhba` int NOT NULL AUTO_INCREMENT,
  `chudanhba` int NOT NULL,
  `manguoitrongdanhba` int NOT NULL,
  `ten` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sodienthoai` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `trangthai` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`madanhba`),
  KEY `manguoisohuu` (`chudanhba`) USING BTREE,
  KEY `FK_danhba_taikhoan` (`manguoitrongdanhba`),
  CONSTRAINT `danhba_ibfk_1` FOREIGN KEY (`chudanhba`) REFERENCES `taikhoan` (`mataikhoan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_danhba_taikhoan` FOREIGN KEY (`manguoitrongdanhba`) REFERENCES `taikhoan` (`mataikhoan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table defaultdb.danhba: ~18 rows (approximately)
INSERT INTO `danhba` (`madanhba`, `chudanhba`, `manguoitrongdanhba`, `ten`, `sodienthoai`, `trangthai`) VALUES
	(1, 2, 1, 'Trường', '0905371627', 1),
	(2, 2, 3, 'Mẹ yêu', '0345607344', 1),
	(3, 1, 4, '123', '0973607710', 1),
	(5, 1, 2, 'Linh', '0336794265', 1),
	(6, 5, 2, 'Linh 2', '0336794265', 1),
	(7, 2, 5, 'Linh 1', '0336794264', 1),
	(8, 1, 6, 'zanquy', '0816977958', 1),
	(9, 2, 6, 'Quý Zăn', '0816977958', 1),
	(11, 6, 2, 'Dịu Lyn', '0336794265', 1),
	(12, 2, 7, 'Tạ Kim Yến', '0333384094', 1),
	(13, 1, 7, 'kim ziin', '0333384094', 1),
	(14, 7, 2, 'diệu link', '0336794265', 1),
	(15, 7, 1, 'Trường núi', '0905371627', 1),
	(16, 2, 8, 'Lê', '0973743580', 1),
	(17, 5, 1, 'truong sut', '0905371627', 1),
	(18, 6, 2, 'linh diệu', '0336794265', 1),
	(26, 9, 5, 'D.Linh', '0336794264', 1),
	(27, 3, 5, 'Con yêu', '0336794264', 1);

-- Dumping structure for table defaultdb.danhsachnguoinhanthongbao
CREATE TABLE IF NOT EXISTS `danhsachnguoinhanthongbao` (
  `madsnhan` int NOT NULL AUTO_INCREMENT,
  `mathongbao` int NOT NULL,
  `manguoinhan` int NOT NULL,
  PRIMARY KEY (`madsnhan`) USING BTREE,
  KEY `mataikhoan` (`manguoinhan`) USING BTREE,
  KEY `FK_danhsachnguoinhanthongbao_thongbao` (`mathongbao`),
  CONSTRAINT `danhsachnguoinhanthongbao_ibfk_3` FOREIGN KEY (`manguoinhan`) REFERENCES `taikhoan` (`mataikhoan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_danhsachnguoinhanthongbao_thongbao` FOREIGN KEY (`mathongbao`) REFERENCES `thongbao` (`mathongbao`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table defaultdb.danhsachnguoinhanthongbao: ~0 rows (approximately)
INSERT INTO `danhsachnguoinhanthongbao` (`madsnhan`, `mathongbao`, `manguoinhan`) VALUES
	(1, 9, 5),
	(2, 10, 5);

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

-- Dumping data for table defaultdb.danhsachnguoinhanviec: ~8 rows (approximately)
INSERT INTO `danhsachnguoinhanviec` (`macongviec`, `manguoinhan`) VALUES
	(15, 1),
	(16, 1),
	(17, 1),
	(23, 1),
	(24, 1),
	(18, 2),
	(19, 2),
	(20, 2),
	(21, 2),
	(22, 2),
	(25, 6);

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table defaultdb.danhsachthanhviennhom: ~19 rows (approximately)
INSERT INTO `danhsachthanhviennhom` (`id`, `manhom`, `mataikhoan`, `maloaiquyen`) VALUES
	(5, 21, 1, 1),
	(6, 21, 2, 2),
	(7, 22, 1, 1),
	(8, 22, 3, 1),
	(9, 22, 2, 2),
	(10, 23, 4, 1),
	(11, 23, 2, 1),
	(12, 23, 1, 2),
	(13, 24, 1, 1),
	(14, 24, 6, 1),
	(15, 24, 2, 2),
	(18, 21, 6, 1),
	(19, 20, 4, 1),
	(21, 20, 1, 1),
	(22, 21, 5, 1),
	(23, 21, 7, 1),
	(24, 21, 8, 1),
	(25, 24, 7, 1),
	(26, 24, 8, 1);

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

-- Dumping structure for view defaultdb.get_all_contact
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `get_all_contact` (
	`madanhba` INT(10) NOT NULL,
	`chudanhba` INT(10) NOT NULL,
	`manguoitrongdanhba` INT(10) NOT NULL,
	`ten` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`sodienthoai` VARCHAR(11) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`tinnhancuoi` TEXT NULL COLLATE 'utf8mb4_unicode_ci'
) ENGINE=MyISAM;

-- Dumping structure for view defaultdb.get_all_group
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `get_all_group` (
	`manhom` INT(10) NOT NULL,
	`tennhom` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`matruongnhom` INT(10) NOT NULL,
	`mataikhoan` INT(10) NOT NULL,
	`manhomnhan` INT(10) NULL,
	`tinnhancuoi` VARCHAR(1000) NULL COLLATE 'utf8mb4_unicode_ci'
) ENGINE=MyISAM;

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

-- Dumping structure for view defaultdb.get_list_notification
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `get_list_notification` (
	`manguoigui` INT(10) NOT NULL,
	`tennguoigui` VARCHAR(151) NULL COLLATE 'utf8mb4_unicode_ci',
	`manguoinhan` INT(10) NOT NULL,
	`maloaithongbao` INT(10) NOT NULL,
	`noidung` VARCHAR(1000) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`thoigian` DATETIME NOT NULL,
	`trangthai` INT(10) NOT NULL
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
	`tentrangthai` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_unicode_ci'
) ENGINE=MyISAM;

-- Dumping structure for table defaultdb.lichsuthaydoicongviec
CREATE TABLE IF NOT EXISTS `lichsuthaydoicongviec` (
  `mathaydoi` int NOT NULL AUTO_INCREMENT,
  `macongviec` int NOT NULL,
  `maloaitrangthaicongviec` int NOT NULL,
  `thoigianthaydoi` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`mathaydoi`),
  KEY `FK__congviec` (`macongviec`),
  KEY `FK__loaitrangthaicongviec` (`maloaitrangthaicongviec`),
  CONSTRAINT `FK__congviec` FOREIGN KEY (`macongviec`) REFERENCES `congviec` (`macongviec`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK__loaitrangthaicongviec` FOREIGN KEY (`maloaitrangthaicongviec`) REFERENCES `loaitrangthaicongviec` (`maloaitrangthaicongviec`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table defaultdb.lichsuthaydoicongviec: ~6 rows (approximately)
INSERT INTO `lichsuthaydoicongviec` (`mathaydoi`, `macongviec`, `maloaitrangthaicongviec`, `thoigianthaydoi`) VALUES
	(1, 20, 2, '2024-04-14 20:39:08'),
	(2, 22, 3, '2024-04-14 20:39:10'),
	(3, 21, 2, '2024-04-14 20:39:17'),
	(4, 20, 3, '2024-04-14 21:19:46'),
	(5, 15, 2, '2024-04-17 22:48:53'),
	(6, 15, 3, '2024-04-17 22:49:49');

-- Dumping structure for table defaultdb.loaiquyen
CREATE TABLE IF NOT EXISTS `loaiquyen` (
  `maloaiquyen` int NOT NULL AUTO_INCREMENT,
  `tenloaiquyen` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`maloaiquyen`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table defaultdb.loaiquyen: ~2 rows (approximately)
INSERT INTO `loaiquyen` (`maloaiquyen`, `tenloaiquyen`) VALUES
	(1, 'Thành viên'),
	(2, 'Trưởng nhóm');

-- Dumping structure for table defaultdb.loaithongbao
CREATE TABLE IF NOT EXISTS `loaithongbao` (
  `maloaithongbao` int NOT NULL AUTO_INCREMENT,
  `tenloaithongbao` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`maloaithongbao`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table defaultdb.loaithongbao: ~0 rows (approximately)
INSERT INTO `loaithongbao` (`maloaithongbao`, `tenloaithongbao`) VALUES
	(1, 'Tin nhắn'),
	(2, 'Lời mời danh bạ');

-- Dumping structure for table defaultdb.loaitinnhan
CREATE TABLE IF NOT EXISTS `loaitinnhan` (
  `maloaitinnhan` int NOT NULL AUTO_INCREMENT,
  `tenloaitinnhan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`maloaitinnhan`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table defaultdb.loaitinnhan: ~2 rows (approximately)
INSERT INTO `loaitinnhan` (`maloaitinnhan`, `tenloaitinnhan`) VALUES
	(1, 'pn'),
	(2, 'gr');

-- Dumping structure for table defaultdb.loaitrangthaicongviec
CREATE TABLE IF NOT EXISTS `loaitrangthaicongviec` (
  `maloaitrangthaicongviec` int NOT NULL AUTO_INCREMENT,
  `tentrangthai` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`maloaitrangthaicongviec`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table defaultdb.loaitrangthaicongviec: ~3 rows (approximately)
INSERT INTO `loaitrangthaicongviec` (`maloaitrangthaicongviec`, `tentrangthai`) VALUES
	(1, 'Chưa bắt đầu'),
	(2, 'Đang thực hiện'),
	(3, 'Đã hoàn thành');

-- Dumping structure for table defaultdb.loimoidanhba
CREATE TABLE IF NOT EXISTS `loimoidanhba` (
  `maloimoi` int NOT NULL AUTO_INCREMENT,
  `manguoigui` int NOT NULL,
  `manguoinhan` int NOT NULL,
  `trangthai` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`maloimoi`),
  KEY `FK__taikhoan` (`manguoigui`),
  KEY `FK__taikhoan_2` (`manguoinhan`),
  CONSTRAINT `FK__taikhoan` FOREIGN KEY (`manguoigui`) REFERENCES `taikhoan` (`mataikhoan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK__taikhoan_2` FOREIGN KEY (`manguoinhan`) REFERENCES `taikhoan` (`mataikhoan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table defaultdb.loimoidanhba: ~4 rows (approximately)
INSERT INTO `loimoidanhba` (`maloimoi`, `manguoigui`, `manguoinhan`, `trangthai`) VALUES
	(1, 2, 8, 1),
	(2, 5, 1, 1),
	(3, 6, 2, 1),
	(11, 9, 5, 1),
	(12, 3, 5, 1);

-- Dumping structure for table defaultdb.nhom
CREATE TABLE IF NOT EXISTS `nhom` (
  `manhom` int NOT NULL AUTO_INCREMENT,
  `tennhom` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `matruongnhom` int NOT NULL,
  PRIMARY KEY (`manhom`),
  KEY `matruongnhom` (`matruongnhom`),
  CONSTRAINT `nhom_ibfk_1` FOREIGN KEY (`matruongnhom`) REFERENCES `taikhoan` (`mataikhoan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table defaultdb.nhom: ~3 rows (approximately)
INSERT INTO `nhom` (`manhom`, `tennhom`, `matruongnhom`) VALUES
	(20, 'CNM nhóm 45', 2),
	(21, 'Nhóm 3 ERP', 2),
	(22, 'TTDN', 2),
	(23, 'test thanh vien nhom', 1),
	(24, 'Ae Báo', 2);

-- Dumping structure for view defaultdb.nhomwithtinnhancuoi
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `nhomwithtinnhancuoi` (
	`manhom` INT(10) NOT NULL,
	`tennhom` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`matruongnhom` INT(10) NOT NULL,
	`tinnhancuoi` TEXT NULL COLLATE 'utf8mb4_unicode_ci'
) ENGINE=MyISAM;

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table defaultdb.taikhoan: ~8 rows (approximately)
INSERT INTO `taikhoan` (`mataikhoan`, `sodienthoai`, `matkhau`, `email`, `diachi`, `hodem`, `ten`, `ngaysinh`, `gioitinh`, `trangthai`) VALUES
	(1, '0905371627', '123', 'dotruong@gmail.com', 'thon 9', 'Đỗ Vân', 'Trường', '2024-04-03', 0, 1),
	(2, '0336794265', '123', 'linhdieu@gmail.com', 'Dương Quảng Hàm', 'Diệu', 'Linh', '2002-01-30', 1, 1),
	(3, '0345607344', '123', 'ngocninh@gmail.com', 'Núi Thành', 'Ngọc', 'Ninh', '1973-01-06', 1, 1),
	(4, '0973607710', '123', 'hando@gmail.com', 'Dark Ruồng', 'Đỗ Văn', 'Hân', '1970-01-01', 0, 1),
	(5, '0336794264', '123', 'linhdieu3001@gmail.com', 'Núi Thành, Quảng Nam', 'Linh', 'Nguyễn Thị Diệu ', '2002-01-30', 0, 1),
	(6, '0816977958', 'quyzanne', 'quyvan1410@gmail.com', 'Bà Rịa', 'Văn Qúy', 'Nguyễn', '2002-10-14', 0, 1),
	(7, '0333384094', 'ntkyen', 'kim2117yen@gmail.com', 'Tiền Giang', 'xđ', 'Kim Yến ', '2002-11-27', 0, 1),
	(8, '0973743580', '123123', 'nguyenthile.work@gmail.com', 'Nghệ An', 'Nguyễn Thị', 'Lê', '2002-10-17', 0, 1),
	(9, '0948620100', '1', 'xuanhauk16@gmail.com', '123 Nguyễn Văn Bảo', 'Nguyễn Xuân', 'Hậu', '2002-09-24', 0, 1);

-- Dumping structure for table defaultdb.thongbao
CREATE TABLE IF NOT EXISTS `thongbao` (
  `mathongbao` int NOT NULL AUTO_INCREMENT,
  `manguoigui` int NOT NULL,
  `maloaithongbao` int NOT NULL,
  `noidung` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `thoigian` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trangthai` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`mathongbao`),
  KEY `manguoigui` (`manguoigui`),
  KEY `maloaithongbao` (`maloaithongbao`),
  KEY `trangthai` (`trangthai`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table defaultdb.thongbao: ~1 rows (approximately)
INSERT INTO `thongbao` (`mathongbao`, `manguoigui`, `maloaithongbao`, `noidung`, `thoigian`, `trangthai`) VALUES
	(1, 6, 2, 'Bạn có lời mời kết bạn mới từ', '2024-04-20 02:37:29', 1),
	(9, 9, 2, 'Bạn có lời mời kết bạn mới từ', '2024-04-20 21:53:05', 1),
	(10, 3, 2, 'Bạn có lời mời kết bạn mới từ', '2024-04-20 21:53:53', 0);

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

-- Dumping data for table defaultdb.thongtinbaocaotiendo: ~0 rows (approximately)

-- Dumping structure for table defaultdb.tinnhan
CREATE TABLE IF NOT EXISTS `tinnhan` (
  `matinnhan` int NOT NULL AUTO_INCREMENT,
  `maloaitinnhan` int NOT NULL,
  `manguoigui` int NOT NULL,
  `manguoinhan` int DEFAULT NULL,
  `manhomnhan` int DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=553 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table defaultdb.tinnhan: ~398 rows (approximately)
INSERT INTO `tinnhan` (`matinnhan`, `maloaitinnhan`, `manguoigui`, `manguoinhan`, `manhomnhan`, `noidung`, `thoigiangui`) VALUES
	(34, 1, 1, 2, NULL, 'Hi bạn iuu', '2024-04-10 17:00:00'),
	(35, 1, 2, 1, NULL, 'Hé luuu', '2024-04-10 17:00:00'),
	(36, 1, 1, 2, NULL, 'Cậu đang làm gì đấyyy', '2024-04-10 17:00:00'),
	(37, 1, 2, 1, NULL, 'Tớ đang fix bug cho cậu nè =))', '2024-04-10 17:00:00'),
	(38, 1, 1, 2, NULL, 'hihiii tớ cảm ơn cậu nhiềuuuu', '2024-04-10 18:38:35'),
	(39, 1, 1, 2, NULL, 'hi', '2024-04-12 17:28:15'),
	(40, 1, 2, 1, NULL, 'hiii', '2024-04-12 17:28:24'),
	(41, 1, 2, 1, NULL, 'hiii', '2024-04-12 17:33:50'),
	(42, 1, 2, 1, NULL, 'khát hay mắc', '2024-04-12 17:34:31'),
	(43, 1, 2, 1, NULL, 'Trường ơi', '2024-04-14 14:02:00'),
	(44, 1, 2, 1, NULL, 'Em test nếu anh kh onl thì sao', '2024-04-14 14:02:16'),
	(45, 1, 1, 2, NULL, '123', '2024-04-17 00:23:44'),
	(46, 1, 2, 1, NULL, '123', '2024-04-17 00:27:16'),
	(47, 1, 1, 2, NULL, '123', '2024-04-17 00:27:26'),
	(48, 1, 2, 1, NULL, 'linh nhăn cho tuỏng', '2024-04-17 00:27:43'),
	(49, 1, 2, 1, NULL, 'nhăn cho trường 1', '2024-04-17 00:31:39'),
	(50, 1, 2, 1, NULL, '2', '2024-04-17 00:35:14'),
	(51, 1, 2, 1, NULL, '123', '2024-04-17 00:35:30'),
	(52, 1, 2, 1, NULL, '123', '2024-04-17 00:35:39'),
	(53, 1, 2, 1, NULL, '123', '2024-04-17 00:36:50'),
	(54, 1, 2, 1, NULL, '123', '2024-04-17 00:38:27'),
	(55, 1, 2, 1, NULL, '123', '2024-04-17 00:38:31'),
	(56, 1, 2, 1, NULL, '123', '2024-04-17 00:40:09'),
	(57, 1, 2, 1, NULL, '123', '2024-04-17 00:40:49'),
	(58, 1, 2, 1, NULL, '123', '2024-04-17 00:41:20'),
	(59, 1, 2, 1, NULL, '123', '2024-04-17 00:42:34'),
	(60, 1, 2, 1, NULL, '123', '2024-04-17 00:43:23'),
	(61, 1, 2, 1, NULL, '123', '2024-04-17 00:43:28'),
	(62, 1, 2, 1, NULL, '123', '2024-04-17 00:45:59'),
	(63, 1, 2, 1, NULL, 'ádasdsadsad', '2024-04-17 00:47:51'),
	(64, 1, 2, 1, NULL, '123213', '2024-04-17 00:48:14'),
	(65, 1, 2, 1, NULL, 'ádsadasdadadasd', '2024-04-17 00:48:38'),
	(66, 1, 2, 1, NULL, '12312323', '2024-04-17 00:49:10'),
	(67, 1, 2, 1, NULL, 'ccccccc', '2024-04-17 00:50:47'),
	(68, 1, 2, 1, NULL, '123', '2024-04-17 00:51:07'),
	(69, 1, 2, 1, NULL, '123213', '2024-04-17 00:51:26'),
	(70, 1, 2, 1, NULL, '123', '2024-04-17 00:52:06'),
	(71, 1, 2, 1, NULL, '123', '2024-04-17 00:52:24'),
	(72, 1, 2, 1, NULL, '123', '2024-04-17 00:53:45'),
	(73, 1, 2, 1, NULL, '123', '2024-04-17 00:53:47'),
	(74, 1, 2, 1, NULL, 'vvvvvvvvvvvvvvvvvvvvvvvv', '2024-04-17 00:53:59'),
	(75, 1, 2, 1, NULL, 'zzzzzzzzzzzzzz', '2024-04-17 00:54:19'),
	(76, 1, 2, 1, NULL, 'aaaaaaaaaaaaaaaa', '2024-04-17 00:54:59'),
	(77, 1, 2, 1, NULL, 'oke let go', '2024-04-17 00:55:04'),
	(78, 1, 2, 1, NULL, 'oke luon nha', '2024-04-17 00:55:13'),
	(79, 1, 2, 1, NULL, 'oke gửi', '2024-04-17 00:56:15'),
	(80, 1, 1, 2, NULL, 't nhân đựo rôid m', '2024-04-17 00:56:24'),
	(81, 1, 2, 1, NULL, 'sáng m có dậy đi học không', '2024-04-17 00:57:04'),
	(82, 1, 2, 1, NULL, 'qưewqe', '2024-04-17 00:57:44'),
	(83, 1, 2, 1, NULL, 'qưewqe', '2024-04-17 00:57:46'),
	(84, 1, 2, 1, NULL, 'qưewqewqe', '2024-04-17 00:57:48'),
	(85, 1, 2, 1, NULL, '123213', '2024-04-17 00:59:05'),
	(86, 1, 2, 1, NULL, '123213', '2024-04-17 00:59:06'),
	(87, 1, 2, 1, NULL, 'ádasdsadasd', '2024-04-17 00:59:12'),
	(88, 1, 2, 1, NULL, '123123213', '2024-04-17 00:59:32'),
	(89, 1, 2, 1, NULL, '', '2024-04-17 00:59:37'),
	(90, 1, 2, 1, NULL, '', '2024-04-17 00:59:38'),
	(91, 1, 2, 1, NULL, '', '2024-04-17 00:59:38'),
	(92, 1, 2, 1, NULL, '123213123213', '2024-04-17 01:00:22'),
	(93, 1, 2, 1, NULL, '123213213', '2024-04-17 01:00:25'),
	(94, 1, 2, 1, NULL, '123213213', '2024-04-17 01:00:36'),
	(95, 1, 2, 1, NULL, '123', '2024-04-17 01:01:48'),
	(96, 1, 2, 1, NULL, '123', '2024-04-17 01:01:53'),
	(97, 1, 2, 1, NULL, 'qqqqqqqqqqqqqqq', '2024-04-17 01:01:56'),
	(98, 1, 2, 1, NULL, '111111111111111', '2024-04-17 01:02:00'),
	(99, 1, 2, 1, NULL, '1111111111111111111111111111', '2024-04-17 01:02:09'),
	(100, 1, 2, 1, NULL, '123213', '2024-04-17 01:02:44'),
	(101, 1, 2, 1, NULL, '123213', '2024-04-17 01:02:46'),
	(102, 1, 2, 1, NULL, '123123', '2024-04-17 01:02:53'),
	(103, 1, 2, 1, NULL, 'qưeqeqweqweqweqw', '2024-04-17 01:02:58'),
	(104, 1, 2, 1, NULL, 'qưewqewqe', '2024-04-17 01:03:00'),
	(105, 1, 2, 1, NULL, 'qewqewqewqe', '2024-04-17 01:03:06'),
	(106, 1, 2, 1, NULL, '213213213213123', '2024-04-17 01:03:14'),
	(107, 1, 2, 1, NULL, '123123', '2024-04-17 01:04:24'),
	(108, 1, 2, 1, NULL, '123213', '2024-04-17 01:04:27'),
	(109, 1, 2, 1, NULL, '123213123213123123213', '2024-04-17 01:04:56'),
	(110, 1, 2, 1, NULL, '123213123213213123', '2024-04-17 01:05:00'),
	(111, 1, 2, 1, NULL, 'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq', '2024-04-17 01:05:05'),
	(112, 1, 2, 1, NULL, '111111111111111111111111', '2024-04-17 01:05:27'),
	(113, 1, 2, 1, NULL, '1', '2024-04-17 01:05:34'),
	(114, 1, 2, 1, NULL, '123213', '2024-04-17 01:09:18'),
	(115, 1, 2, 1, NULL, '123213', '2024-04-17 01:09:19'),
	(116, 1, 2, 1, NULL, '123213', '2024-04-17 01:09:20'),
	(117, 1, 2, 1, NULL, '123123213213', '2024-04-17 01:09:29'),
	(118, 1, 2, 1, NULL, '123213', '2024-04-17 01:09:33'),
	(119, 1, 2, 1, NULL, '12321321', '2024-04-17 01:09:34'),
	(120, 1, 2, 1, NULL, '123213213', '2024-04-17 01:09:37'),
	(121, 1, 2, 1, NULL, '123', '2024-04-17 01:10:05'),
	(122, 1, 2, 1, NULL, '123', '2024-04-17 01:10:07'),
	(123, 1, 2, 1, NULL, '123', '2024-04-17 01:10:12'),
	(124, 1, 2, 1, NULL, '123', '2024-04-17 01:10:38'),
	(125, 1, 2, 1, NULL, '1', '2024-04-17 01:11:53'),
	(126, 1, 2, 1, NULL, '1', '2024-04-17 01:12:33'),
	(127, 1, 2, 1, NULL, '123', '2024-04-17 01:13:10'),
	(128, 1, 2, 1, NULL, '123', '2024-04-17 01:13:11'),
	(129, 1, 2, 1, NULL, '123', '2024-04-17 01:13:12'),
	(130, 1, 2, 1, NULL, '123', '2024-04-17 01:13:16'),
	(131, 1, 2, 1, NULL, 'eqweqwewqe', '2024-04-17 01:13:19'),
	(132, 1, 2, 1, NULL, 'qưeqwewqe', '2024-04-17 01:13:21'),
	(133, 1, 2, 1, NULL, 'qưeqweqwe', '2024-04-17 01:13:22'),
	(134, 1, 2, 1, NULL, 'qưewqewqe', '2024-04-17 01:13:25'),
	(135, 1, 2, 1, NULL, 'qưeqwe', '2024-04-17 01:13:32'),
	(136, 1, 2, 1, NULL, '1', '2024-04-17 01:13:46'),
	(137, 1, 2, 1, NULL, '123123213', '2024-04-17 01:15:22'),
	(138, 1, 2, 1, NULL, '123', '2024-04-17 01:15:28'),
	(139, 1, 2, 1, NULL, '123213', '2024-04-17 01:15:36'),
	(140, 1, 2, 1, NULL, '123123213123', '2024-04-17 01:15:41'),
	(141, 1, 2, 1, NULL, '1', '2024-04-17 01:15:49'),
	(142, 1, 2, 1, NULL, '123', '2024-04-17 01:19:22'),
	(143, 1, 2, 1, NULL, '123', '2024-04-17 01:19:27'),
	(144, 1, 2, 1, NULL, '123', '2024-04-17 01:19:31'),
	(145, 1, 2, 1, NULL, '123', '2024-04-17 01:19:43'),
	(146, 1, 2, 1, NULL, '123', '2024-04-17 01:20:04'),
	(147, 1, 2, 1, NULL, '123', '2024-04-17 01:21:37'),
	(148, 1, 2, 1, NULL, '123', '2024-04-17 01:22:26'),
	(149, 1, 2, 1, NULL, '123', '2024-04-17 01:22:59'),
	(150, 1, 2, 1, NULL, 'qq', '2024-04-17 01:23:01'),
	(151, 1, 2, 1, NULL, '111', '2024-04-17 01:23:05'),
	(152, 1, 2, 1, NULL, '1', '2024-04-17 01:23:09'),
	(153, 1, 2, 1, NULL, '123', '2024-04-17 01:26:05'),
	(154, 1, 2, 1, NULL, '123213', '2024-04-17 01:26:08'),
	(155, 1, 2, 1, NULL, '12323213', '2024-04-17 01:26:15'),
	(156, 1, 2, 1, NULL, '123213213123', '2024-04-17 01:26:17'),
	(157, 1, 2, 1, NULL, '1', '2024-04-17 01:26:24'),
	(158, 1, 2, 1, NULL, 'a', '2024-04-17 01:27:49'),
	(159, 1, 2, 1, NULL, '123', '2024-04-17 01:29:04'),
	(160, 1, 2, 1, NULL, '123', '2024-04-17 01:29:06'),
	(161, 1, 2, 1, NULL, '123', '2024-04-17 01:29:13'),
	(162, 1, 2, 1, NULL, '123', '2024-04-17 01:29:17'),
	(163, 1, 2, 1, NULL, '1', '2024-04-17 01:29:59'),
	(164, 1, 2, 1, NULL, '123', '2024-04-17 01:31:47'),
	(165, 1, 2, 1, NULL, '123', '2024-04-17 01:31:51'),
	(166, 1, 2, 1, NULL, '11', '2024-04-17 01:31:53'),
	(167, 1, 2, 1, NULL, '123213', '2024-04-17 01:31:54'),
	(168, 1, 2, 1, NULL, '123', '2024-04-17 01:31:55'),
	(169, 1, 2, 1, NULL, '123213', '2024-04-17 01:31:59'),
	(170, 1, 2, 1, NULL, '123123213123213', '2024-04-17 01:32:03'),
	(171, 1, 2, 1, NULL, '11123213', '2024-04-17 01:32:10'),
	(172, 1, 2, 1, NULL, 'gg', '2024-04-17 01:32:33'),
	(173, 1, 2, 1, NULL, '1', '2024-04-17 01:33:07'),
	(174, 1, 2, 1, NULL, '1', '2024-04-17 01:33:10'),
	(175, 1, 2, 1, NULL, '123213', '2024-04-17 01:33:12'),
	(176, 1, 2, 1, NULL, '123213213', '2024-04-17 01:33:14'),
	(177, 1, 2, 1, NULL, 'ádasdsad', '2024-04-17 01:33:15'),
	(178, 1, 2, 1, NULL, 'sdsad', '2024-04-17 01:33:17'),
	(179, 1, 2, 1, NULL, 'ádsad', '2024-04-17 01:33:21'),
	(180, 1, 2, 1, NULL, 'ádasdasd', '2024-04-17 01:33:23'),
	(181, 1, 2, 1, NULL, 'a', '2024-04-17 01:33:26'),
	(182, 1, 2, 1, NULL, '123', '2024-04-17 01:33:35'),
	(183, 1, 2, 1, NULL, '123', '2024-04-17 03:55:14'),
	(184, 1, 2, 1, NULL, '', '2024-04-17 03:55:15'),
	(185, 1, 2, 1, NULL, '', '2024-04-17 03:55:15'),
	(186, 1, 2, 1, NULL, '123213', '2024-04-17 03:55:17'),
	(187, 1, 2, 1, NULL, '123', '2024-04-17 03:55:22'),
	(188, 1, 2, 1, NULL, '123', '2024-04-17 03:55:59'),
	(189, 1, 2, 1, NULL, '', '2024-04-17 03:56:01'),
	(190, 1, 2, 1, NULL, '123', '2024-04-17 03:56:06'),
	(191, 1, 2, 1, NULL, '123213', '2024-04-17 03:56:32'),
	(192, 1, 2, 1, NULL, '123123', '2024-04-17 03:56:34'),
	(193, 1, 2, 1, NULL, '123213213', '2024-04-17 03:56:36'),
	(194, 1, 2, 1, NULL, '23123', '2024-04-17 03:56:40'),
	(195, 1, 2, 1, NULL, '123213213', '2024-04-17 03:56:42'),
	(196, 1, 2, 1, NULL, '123123', '2024-04-17 03:57:00'),
	(197, 1, 2, 1, NULL, '123213', '2024-04-17 03:57:02'),
	(198, 1, 2, 1, NULL, '1', '2024-04-17 03:57:18'),
	(199, 1, 2, 1, NULL, '123213', '2024-04-17 03:57:20'),
	(200, 1, 2, 1, NULL, '123213', '2024-04-17 03:57:22'),
	(201, 1, 2, 1, NULL, '123213', '2024-04-17 03:57:24'),
	(202, 1, 2, 1, NULL, '123213', '2024-04-17 03:57:26'),
	(203, 1, 2, 1, NULL, '123213', '2024-04-17 03:57:28'),
	(204, 1, 2, 1, NULL, '1', '2024-04-17 03:57:37'),
	(205, 1, 2, 1, NULL, '123', '2024-04-17 03:57:38'),
	(206, 1, 2, 1, NULL, '123', '2024-04-17 03:57:42'),
	(207, 1, 2, 1, NULL, '123213213', '2024-04-17 03:57:44'),
	(208, 1, 2, 1, NULL, 'ưqewqewq', '2024-04-17 03:57:46'),
	(209, 1, 2, 1, NULL, '213213123', '2024-04-17 03:57:59'),
	(210, 1, 1, 2, NULL, '123213213', '2024-04-17 03:58:03'),
	(211, 1, 2, 1, NULL, '1wqewqewqe', '2024-04-17 03:58:05'),
	(212, 1, 2, 1, NULL, '123', '2024-04-17 03:58:14'),
	(213, 1, 2, 1, NULL, '123123', '2024-04-17 03:58:26'),
	(214, 1, 2, 1, NULL, '123', '2024-04-17 03:58:32'),
	(215, 1, 2, 1, NULL, '123', '2024-04-17 03:58:51'),
	(216, 1, 2, 1, NULL, '123213', '2024-04-17 03:58:54'),
	(217, 1, 2, 1, NULL, '123213', '2024-04-17 03:58:56'),
	(218, 1, 2, 1, NULL, 'qưewqe', '2024-04-17 03:58:58'),
	(219, 1, 2, 1, NULL, 'ưqeasd', '2024-04-17 03:59:02'),
	(220, 1, 2, 1, NULL, '', '2024-04-17 03:59:13'),
	(221, 1, 2, 1, NULL, '1', '2024-04-17 03:59:31'),
	(222, 1, 2, 1, NULL, '', '2024-04-17 04:00:08'),
	(223, 1, 2, 1, NULL, 'q', '2024-04-17 04:00:36'),
	(224, 1, 2, 1, NULL, '', '2024-04-17 04:00:43'),
	(225, 1, 2, 1, NULL, '', '2024-04-17 04:00:50'),
	(226, 1, 2, 1, NULL, '', '2024-04-17 04:01:08'),
	(227, 1, 2, 1, NULL, '', '2024-04-17 04:01:10'),
	(228, 1, 2, 1, NULL, '', '2024-04-17 04:01:11'),
	(229, 1, 2, 1, NULL, '', '2024-04-17 04:01:11'),
	(230, 1, 2, 1, NULL, '', '2024-04-17 04:01:16'),
	(231, 1, 2, 1, NULL, 'qưe', '2024-04-17 04:01:18'),
	(232, 1, 2, 1, NULL, 'qưewe', '2024-04-17 04:01:23'),
	(233, 1, 2, 1, NULL, '123', '2024-04-17 04:04:47'),
	(234, 1, 2, 1, NULL, '123', '2024-04-17 04:04:49'),
	(235, 1, 2, 1, NULL, '123', '2024-04-17 04:04:53'),
	(236, 1, 2, 1, NULL, '123', '2024-04-17 04:04:55'),
	(237, 1, 2, 1, NULL, '123', '2024-04-17 04:04:57'),
	(238, 1, 2, 1, NULL, '123', '2024-04-17 04:05:03'),
	(239, 1, 2, 1, NULL, '123', '2024-04-17 04:06:35'),
	(240, 1, 2, 1, NULL, '123', '2024-04-17 04:06:36'),
	(241, 1, 2, 1, NULL, '123', '2024-04-17 04:06:42'),
	(242, 1, 2, 1, NULL, '123', '2024-04-17 04:06:44'),
	(243, 1, 2, 1, NULL, '123', '2024-04-17 04:06:51'),
	(244, 1, 2, 1, NULL, '123123213', '2024-04-17 04:07:07'),
	(245, 1, 2, 1, NULL, '123213', '2024-04-17 04:07:08'),
	(246, 1, 2, 1, NULL, '123', '2024-04-17 04:07:31'),
	(247, 1, 2, 1, NULL, '123', '2024-04-17 04:07:34'),
	(248, 1, 2, 1, NULL, 'qưewqe', '2024-04-17 04:07:35'),
	(249, 1, 2, 1, NULL, 'qưewqe', '2024-04-17 04:07:38'),
	(250, 1, 2, 1, NULL, 'qưeqwe', '2024-04-17 04:07:40'),
	(251, 1, 2, 1, NULL, 'qưewqe', '2024-04-17 04:07:48'),
	(252, 1, 2, 1, NULL, 'qưewqe', '2024-04-17 04:07:50'),
	(253, 1, 2, 1, NULL, 'qưeqwe', '2024-04-17 04:07:51'),
	(254, 1, 2, 1, NULL, 'ưewqewqe', '2024-04-17 04:07:52'),
	(255, 1, 2, 1, NULL, 'qưeqwe', '2024-04-17 04:07:54'),
	(256, 1, 2, 1, NULL, 'qưewqewqe', '2024-04-17 04:07:55'),
	(257, 1, 2, 1, NULL, 'ádasdsad', '2024-04-17 04:07:57'),
	(258, 1, 1, 4, NULL, '123213213', '2024-04-17 04:08:06'),
	(259, 1, 1, 2, NULL, '123213213', '2024-04-17 04:08:09'),
	(260, 1, 2, 1, NULL, 'qưewqeqưewqe', '2024-04-17 04:08:11'),
	(261, 1, 2, 1, NULL, '', '2024-04-17 04:08:13'),
	(262, 1, 2, 1, NULL, '', '2024-04-17 04:08:14'),
	(263, 1, 2, 1, NULL, '', '2024-04-17 04:08:14'),
	(264, 1, 2, 1, NULL, '', '2024-04-17 04:08:14'),
	(265, 1, 2, 1, NULL, '', '2024-04-17 04:08:14'),
	(266, 1, 2, 1, NULL, '123213', '2024-04-17 04:08:15'),
	(267, 1, 2, 1, NULL, 'qưeqwewqe', '2024-04-17 04:27:42'),
	(268, 1, 2, 1, NULL, 'qưeqwewqe', '2024-04-17 04:27:44'),
	(269, 1, 2, 1, NULL, 'qưeqwe', '2024-04-17 04:27:45'),
	(270, 1, 2, 1, NULL, 'qưeqewqeqdasdasdasd', '2024-04-17 04:27:48'),
	(271, 1, 2, 1, NULL, 'ád', '2024-04-17 04:27:50'),
	(272, 1, 1, 2, NULL, 'qưeweqewqe', '2024-04-17 04:27:51'),
	(273, 1, 1, 2, NULL, 'qưewqewqe', '2024-04-17 04:27:53'),
	(274, 1, 1, 2, NULL, 'qưewqe', '2024-04-17 04:27:54'),
	(275, 1, 2, 1, NULL, 'hi ăn cơm chưa', '2024-04-17 04:28:14'),
	(276, 1, 1, 2, NULL, 'ăn rôi nha', '2024-04-17 04:28:19'),
	(277, 1, 2, 1, NULL, 'đồ điên', '2024-04-17 04:28:26'),
	(278, 1, 2, 1, NULL, 'ưerwrq', '2024-04-17 04:28:33'),
	(279, 1, 2, 1, NULL, 'qưeqeqeqewqe', '2024-04-17 04:28:37'),
	(280, 1, 2, 1, NULL, '123213', '2024-04-17 04:48:54'),
	(281, 1, 2, 1, NULL, '123213', '2024-04-17 04:48:56'),
	(282, 1, 2, 1, NULL, '123123', '2024-04-17 04:48:58'),
	(283, 1, 2, 1, NULL, '123213', '2024-04-17 04:49:00'),
	(284, 1, 2, 1, NULL, '123123', '2024-04-17 04:49:02'),
	(285, 1, 2, 1, NULL, '123213', '2024-04-17 04:49:57'),
	(286, 1, 2, 1, NULL, '123213', '2024-04-17 04:50:00'),
	(287, 1, 2, 1, NULL, '123123', '2024-04-17 04:50:01'),
	(288, 1, 2, 1, NULL, '123', '2024-04-17 04:55:23'),
	(289, 1, 2, 1, NULL, 'qqq', '2024-04-17 04:55:25'),
	(290, 1, 1, 2, NULL, 'ưeqweqweq', '2024-04-17 04:55:26'),
	(291, 1, 1, 2, NULL, 'ưqewqe', '2024-04-17 04:55:28'),
	(292, 1, 1, 2, NULL, 'trụig ', '2024-04-17 04:55:30'),
	(293, 1, 1, 2, NULL, 'ewoiuewrf oiuwer', '2024-04-17 04:55:32'),
	(294, 1, 1, 2, NULL, 'oiurelkjsfo', '2024-04-17 04:55:33'),
	(295, 1, 1, 2, NULL, 'oke letgo', '2024-04-17 04:55:59'),
	(296, 1, 2, 1, NULL, 'yét', '2024-04-17 04:56:04'),
	(297, 1, 2, 1, NULL, '123213', '2024-04-17 05:12:25'),
	(298, 1, 2, 1, NULL, '123213', '2024-04-17 05:12:27'),
	(299, 1, 2, 1, NULL, '12332123', '2024-04-17 05:12:30'),
	(300, 1, 1, 2, NULL, '123213213', '2024-04-17 05:12:32'),
	(301, 1, 2, 1, NULL, 'gì v', '2024-04-17 05:31:21'),
	(302, 1, 2, 1, NULL, 'chưa fix được enter nhắn tin mà', '2024-04-17 05:31:34'),
	(303, 1, 1, 2, NULL, 'sao v', '2024-04-17 05:32:00'),
	(304, 1, 2, 1, NULL, 'ua', '2024-04-17 05:32:25'),
	(305, 1, 1, 2, NULL, 'sao', '2024-04-17 05:34:18'),
	(306, 1, 2, 1, NULL, 'nè trời ơi', '2024-04-17 05:35:46'),
	(307, 1, 2, 1, NULL, '', '2024-04-17 05:35:46'),
	(308, 1, 2, 1, NULL, '', '2024-04-17 05:35:48'),
	(309, 1, 2, 1, NULL, '', '2024-04-17 05:35:48'),
	(310, 1, 2, 1, NULL, '???', '2024-04-17 05:35:53'),
	(311, 1, 2, 1, NULL, 'gửi được cả tin nhắn rỗng à', '2024-04-17 05:36:02'),
	(312, 1, 2, 1, NULL, '123213', '2024-04-17 05:53:07'),
	(313, 1, 2, 1, NULL, '123', '2024-04-17 05:53:21'),
	(314, 1, 1, 2, NULL, 'khong tin', '2024-04-17 05:53:24'),
	(315, 1, 2, 1, NULL, 'di học', '2024-04-17 05:54:57'),
	(316, 1, 2, 1, NULL, 'lượn đi', '2024-04-17 05:54:59'),
	(317, 1, 1, 2, NULL, 'oke let go', '2024-04-17 05:55:06'),
	(318, 1, 1, 2, NULL, 'lượn cc', '2024-04-17 05:55:51'),
	(319, 1, 1, 2, NULL, 'enter ok', '2024-04-17 05:55:56'),
	(320, 1, 1, 2, NULL, 'nhma kh realtime má ơi', '2024-04-17 05:56:02'),
	(321, 1, 2, 1, NULL, 'má ơi', '2024-04-17 05:56:51'),
	(322, 1, 2, 1, NULL, 'coi lại đi kìa', '2024-04-17 05:56:56'),
	(323, 1, 2, 1, NULL, 'kh có realtime', '2024-04-17 05:57:08'),
	(324, 1, 2, 1, NULL, 'enter oke r', '2024-04-17 05:57:13'),
	(325, 1, 2, 1, NULL, 'mà bên anh kh có hiện thông báo', '2024-04-17 05:57:23'),
	(326, 1, 1, 2, NULL, 'có mà', '2024-04-17 05:58:30'),
	(327, 1, 2, 1, NULL, 'à cc', '2024-04-17 05:58:31'),
	(328, 1, 1, 2, NULL, '123', '2024-04-17 06:00:55'),
	(329, 1, 1, 2, NULL, '123', '2024-04-17 06:01:36'),
	(330, 1, 2, 1, NULL, 'hiii', '2024-04-17 06:02:30'),
	(331, 1, 2, 1, NULL, 'biet sao r', '2024-04-17 06:02:44'),
	(332, 1, 1, 2, NULL, 'ra la v', '2024-04-17 06:04:25'),
	(333, 1, 2, 1, NULL, 'ua', '2024-04-17 06:04:29'),
	(334, 1, 2, 1, NULL, 'oo', '2024-04-17 06:04:30'),
	(335, 1, 2, 1, NULL, 'ghe v sao', '2024-04-17 06:04:32'),
	(336, 1, 2, 1, NULL, '123', '2024-04-17 06:04:52'),
	(337, 1, 2, 1, NULL, '123', '2024-04-17 06:06:59'),
	(338, 1, 2, 1, NULL, '123', '2024-04-17 06:09:54'),
	(339, 1, 1, 2, NULL, '123', '2024-04-17 06:09:57'),
	(340, 1, 2, 1, NULL, '213', '2024-04-17 06:10:04'),
	(341, 1, 2, 1, NULL, '123', '2024-04-17 06:11:31'),
	(342, 1, 2, 1, NULL, '', '2024-04-17 06:11:33'),
	(343, 1, 2, 1, NULL, 'qweqwe', '2024-04-17 06:11:34'),
	(344, 1, 2, 1, NULL, '123', '2024-04-17 06:11:52'),
	(345, 1, 2, 1, NULL, 'nong khong', '2024-04-17 06:12:00'),
	(346, 1, 2, 1, NULL, 'chowf xiu lay cai tai nghe', '2024-04-17 06:12:46'),
	(347, 1, 2, 1, NULL, 'phi', '2024-04-17 06:14:46'),
	(348, 1, 2, 1, NULL, 'phis', '2024-04-17 06:14:56'),
	(349, 1, 2, 1, NULL, 'phis', '2024-04-17 06:14:58'),
	(350, 1, 2, 1, NULL, 'phí', '2024-04-17 06:15:01'),
	(351, 1, 2, 1, NULL, 'phíiiiiiiiiiiii', '2024-04-17 06:15:03'),
	(352, 1, 2, 1, NULL, 'uống bò húc ngon vl', '2024-04-17 06:19:51'),
	(353, 1, 2, 1, NULL, 'cc', '2024-04-17 06:32:48'),
	(354, 1, 2, 1, NULL, 'ok chưa', '2024-04-17 06:33:49'),
	(355, 1, 2, 1, NULL, 'ủa', '2024-04-17 06:33:50'),
	(356, 1, 2, 1, NULL, 'kh sửa localhost 3000 của anh à', '2024-04-17 06:34:02'),
	(357, 1, 2, 1, NULL, 'lô\\', '2024-04-17 06:40:35'),
	(358, 1, 1, 2, NULL, 'nghe nef', '2024-04-17 06:40:41'),
	(359, 1, 1, 2, NULL, 'thay khong', '2024-04-17 06:40:44'),
	(360, 1, 2, 1, NULL, 'hihi', '2024-04-17 06:40:44'),
	(361, 1, 2, 1, NULL, 'thấy', '2024-04-17 06:40:46'),
	(362, 1, 1, 2, NULL, 'hha ha', '2024-04-17 06:40:50'),
	(363, 1, 1, 2, NULL, 'ngon nhowf', '2024-04-17 06:40:52'),
	(364, 1, 2, 1, NULL, 'cậu thấy tin của tớ kh', '2024-04-17 06:40:52'),
	(365, 1, 2, 1, NULL, 'kkkkkkkkk', '2024-04-17 06:40:58'),
	(366, 1, 2, 1, NULL, 'eee', '2024-04-17 06:41:00'),
	(367, 1, 1, 2, NULL, 'to co thay nef', '2024-04-17 06:41:01'),
	(368, 1, 2, 1, NULL, 'kh có icon à', '2024-04-17 06:41:05'),
	(369, 1, 1, 2, NULL, 'mai nhan ben nayf ddi kk', '2024-04-17 06:41:06'),
	(370, 1, 1, 2, NULL, 'bỏ icon đi', '2024-04-17 06:41:13'),
	(371, 1, 2, 1, NULL, 'ý là', '2024-04-17 06:41:16'),
	(372, 1, 1, 2, NULL, 'ai mà làm cho', '2024-04-17 06:41:16'),
	(373, 1, 2, 1, NULL, 'cái quăng thùng rác á', '2024-04-17 06:41:23'),
	(374, 1, 2, 1, NULL, 'kkkk', '2024-04-17 06:41:25'),
	(375, 1, 1, 2, NULL, 'mượt hơn cả zalo', '2024-04-17 06:41:25'),
	(376, 1, 2, 1, NULL, 'nhắn bên này sao mà thấy tbao ta', '2024-04-17 06:41:38'),
	(377, 1, 2, 1, NULL, 'kkk', '2024-04-17 06:41:40'),
	(378, 1, 1, 2, NULL, 'làm vậy chắc công ty ng ta sập quá', '2024-04-17 06:41:41'),
	(379, 1, 2, 1, NULL, 'má vl', '2024-04-17 06:41:48'),
	(380, 1, 2, 1, NULL, 'kkkkkk', '2024-04-17 06:41:49'),
	(381, 1, 1, 2, NULL, 'chắc bắn về gmail kkk', '2024-04-17 06:41:51'),
	(382, 1, 1, 2, NULL, 'kkkkkkkkkkkkk', '2024-04-17 06:41:54'),
	(383, 1, 1, 2, NULL, 'cười ẻ', '2024-04-17 06:41:57'),
	(384, 1, 2, 1, NULL, 'eee', '2024-04-17 06:41:57'),
	(385, 1, 1, 2, NULL, 'chăc mai á', '2024-04-17 06:42:01'),
	(386, 1, 2, 1, NULL, 'làm thông báo luôn đi', '2024-04-17 06:42:02'),
	(387, 1, 1, 2, NULL, 'làm 1 cái icon thùng rác trước', '2024-04-17 06:42:13'),
	(388, 1, 2, 1, NULL, 'làm xong nhắn ào ào liền', '2024-04-17 06:42:14'),
	(389, 1, 2, 1, NULL, 'kkkk', '2024-04-17 06:42:15'),
	(390, 1, 2, 1, NULL, 'drd', '2024-04-17 06:42:19'),
	(391, 1, 2, 1, NULL, 'biết gì kh', '2024-04-17 06:42:22'),
	(392, 1, 1, 2, NULL, 'sao', '2024-04-17 06:42:25'),
	(393, 1, 2, 1, NULL, 'nảy giờ quen tay', '2024-04-17 06:42:26'),
	(394, 1, 2, 1, NULL, 'nhấn trả lời tin nhắn', '2024-04-17 06:42:35'),
	(395, 1, 2, 1, NULL, 'kkkk', '2024-04-17 06:42:37'),
	(396, 1, 2, 1, NULL, 'ảo thiệt đấy', '2024-04-17 06:42:46'),
	(397, 1, 2, 1, NULL, 'kkkkkkkkkkkkkkkk', '2024-04-17 06:42:47'),
	(398, 1, 1, 2, NULL, 'kkkk', '2024-04-17 06:42:57'),
	(399, 1, 2, 1, NULL, 'để lát vào coi cái db', '2024-04-17 06:42:57'),
	(400, 1, 1, 2, NULL, 'ảo thật 👭', '2024-04-17 06:43:00'),
	(401, 1, 2, 1, NULL, 'ủa', '2024-04-17 06:43:04'),
	(402, 1, 2, 1, NULL, 'copy icon à', '2024-04-17 06:43:08'),
	(403, 1, 2, 1, NULL, 'kkkkkkkkkkk]', '2024-04-17 06:43:12'),
	(404, 1, 1, 2, NULL, 'cười ẻ 😂😂😂', '2024-04-17 06:43:15'),
	(405, 1, 2, 1, NULL, '😂 vl', '2024-04-17 06:43:36'),
	(406, 1, 2, 1, NULL, 'kkkkkk', '2024-04-17 06:43:38'),
	(407, 1, 1, 2, NULL, 'vui vl á 😂😂😂🤣🤣🤣🤣', '2024-04-17 06:43:51'),
	(408, 1, 2, 1, NULL, 'mắc tè r 😂🚽', '2024-04-17 06:43:54'),
	(409, 1, 1, 2, NULL, 'nhắn vui hơn messs', '2024-04-17 06:43:57'),
	(410, 1, 2, 1, NULL, 'để đi tè vào', '2024-04-17 06:44:00'),
	(411, 1, 2, 1, NULL, 'coi thử là', '2024-04-17 06:44:03'),
	(412, 1, 2, 1, NULL, 'cái db', '2024-04-17 06:44:06'),
	(413, 1, 2, 1, NULL, 'nó lên bao nhiêu dòng r', '2024-04-17 06:44:11'),
	(414, 1, 2, 1, NULL, 'kkkkkk', '2024-04-17 06:44:12'),
	(415, 1, 1, 2, NULL, 'tè có rặn không', '2024-04-17 06:44:22'),
	(416, 1, 2, 1, NULL, '😂😂😂😂', '2024-04-17 06:44:21'),
	(417, 1, 1, 2, NULL, '🏋️🏋️🏋️', '2024-04-17 06:44:23'),
	(418, 1, 2, 1, NULL, 'má ơi', '2024-04-17 06:44:25'),
	(419, 1, 2, 1, NULL, 'kkkk', '2024-04-17 06:44:26'),
	(420, 1, 2, 1, NULL, 'đợi xíu', '2024-04-17 06:44:29'),
	(421, 1, 2, 1, NULL, 'nín kh đc', '2024-04-17 06:44:31'),
	(422, 1, 1, 2, NULL, 'kiểu này db xập sớm', '2024-04-17 06:44:35'),
	(423, 1, 1, 2, NULL, 'tè đi', '2024-04-17 06:44:38'),
	(424, 1, 1, 2, NULL, 'vô deloy cái reactjs cho họ luôn', '2024-04-17 06:44:49'),
	(425, 1, 2, 1, NULL, 'oki', '2024-04-17 06:46:55'),
	(426, 1, 2, 1, NULL, 'làm sao', '2024-04-17 06:47:04'),
	(427, 1, 1, 2, NULL, 'dume', '2024-04-17 06:47:10'),
	(428, 1, 2, 1, NULL, 'sa', '2024-04-17 06:47:25'),
	(429, 1, 1, 2, NULL, 'khoong cai nổi cái tin nhắn à 😈😈', '2024-04-17 06:47:26'),
	(430, 1, 2, 1, NULL, 'có coi mà ba', '2024-04-17 06:47:31'),
	(431, 1, 1, 2, NULL, 'coi cái thông báo mà mệt lắm hả', '2024-04-17 06:47:40'),
	(432, 1, 2, 1, NULL, 'coi r mà', '2024-04-17 06:47:47'),
	(433, 1, 1, 2, NULL, 'bực vl 😠😠', '2024-04-17 06:47:51'),
	(434, 1, 1, 2, NULL, 'chắc chưa', '2024-04-17 06:47:54'),
	(435, 1, 1, 2, NULL, 'coi momo á ba', '2024-04-17 06:47:57'),
	(436, 1, 2, 1, NULL, 'đang coi nè', '2024-04-17 06:48:01'),
	(437, 1, 1, 2, NULL, 'má từ trưa 😠😠', '2024-04-17 06:48:05'),
	(438, 1, 2, 1, NULL, 'coi lúc sớm r', '2024-04-17 06:48:08'),
	(439, 1, 2, 1, NULL, 'biết từ lúc nhắn tin á', '2024-04-17 06:48:17'),
	(440, 1, 2, 1, NULL, 'thả haha r mà ta', '2024-04-17 06:48:41'),
	(441, 1, 2, 1, NULL, 'biết r', '2024-04-17 06:48:48'),
	(442, 1, 2, 1, NULL, 'coi r nên mới thả haha đó', '2024-04-17 06:48:53'),
	(443, 1, 2, 1, NULL, 'hi', '2024-04-17 07:30:20'),
	(444, 1, 2, 1, NULL, 'sao z', '2024-04-17 07:30:31'),
	(445, 1, 1, 2, NULL, 'lo', '2024-04-17 07:30:32'),
	(446, 1, 2, 1, NULL, 'nghe', '2024-04-17 07:30:34'),
	(447, 1, 2, 1, NULL, 'lô', '2024-04-17 07:31:11'),
	(448, 1, 1, 2, NULL, 'thay roi', '2024-04-17 07:31:15'),
	(449, 1, 1, 2, NULL, 'oke let gio', '2024-04-17 07:31:19'),
	(450, 1, 2, 1, NULL, 'ok', '2024-04-17 07:31:20'),
	(451, 1, 2, 1, NULL, 'nay nhắn trên này nha', '2024-04-17 07:31:25'),
	(452, 1, 2, 1, NULL, 'kkkkk', '2024-04-17 07:31:26'),
	(453, 1, 1, 2, NULL, 'okee luoon banj oiw', '2024-04-17 07:31:30'),
	(454, 1, 2, 1, NULL, 'ủa', '2024-04-17 07:31:31'),
	(455, 1, 2, 1, NULL, 'z là', '2024-04-17 07:31:34'),
	(456, 1, 1, 2, NULL, 'saoo', '2024-04-17 07:31:35'),
	(457, 1, 2, 1, NULL, 'nay chỉ cần', '2024-04-17 07:31:36'),
	(458, 1, 2, 1, NULL, 'làm ', '2024-04-17 07:31:44'),
	(459, 1, 2, 1, NULL, 'xong r vào trong vps', '2024-04-17 07:31:50'),
	(460, 1, 2, 1, NULL, 'pull code về', '2024-04-17 07:31:58'),
	(461, 1, 1, 2, NULL, 'ddungs r', '2024-04-17 07:32:03'),
	(462, 1, 2, 1, NULL, 'là chạy được đúng kh', '2024-04-17 07:32:06'),
	(463, 1, 2, 1, NULL, 'wow', '2024-04-17 07:32:08'),
	(464, 1, 1, 2, NULL, 'em thu doi ten mien coi sao', '2024-04-17 07:32:16'),
	(465, 1, 2, 1, NULL, 'đổi kiểu sao', '2024-04-17 07:32:21'),
	(466, 1, 1, 2, NULL, 'để anh đổi thành chuta', '2024-04-17 07:32:29'),
	(467, 1, 1, 2, NULL, 'kkk', '2024-04-17 07:32:30'),
	(468, 1, 2, 1, NULL, 'vl', '2024-04-17 07:32:35'),
	(469, 1, 2, 1, NULL, 'khong', '2024-04-17 07:32:36'),
	(470, 1, 2, 1, NULL, 'khỏi chuta đi', '2024-04-17 07:32:46'),
	(471, 1, 2, 1, NULL, 'để im v đi', '2024-04-17 07:32:49'),
	(472, 1, 2, 1, NULL, 'để em fix cái giao diện xíu', '2024-04-17 07:32:58'),
	(473, 1, 2, 1, NULL, 'xấu quá đi', '2024-04-17 07:33:01'),
	(474, 1, 2, 1, NULL, 'giao task tuần này đi', '2024-04-17 07:33:11'),
	(475, 1, 2, 1, NULL, 'ee nói nè', '2024-04-17 07:33:52'),
	(476, 1, 2, 1, NULL, 'làm cái tin nhắn nhóm đi', '2024-04-17 07:34:23'),
	(477, 1, 2, 1, NULL, 'xong r đem vào nhóm báo', '2024-04-17 07:34:29'),
	(478, 1, 2, 1, NULL, 'cho ae nhắn tin', '2024-04-17 07:34:37'),
	(479, 1, 2, 1, NULL, 'kkkkkk', '2024-04-17 07:34:38'),
	(481, 1, 2, 1, NULL, 'à', '2024-04-17 07:35:02'),
	(482, 1, 2, 1, NULL, 'anh có trong nhóm 45 lhoong', '2024-04-17 07:35:08'),
	(483, 1, 1, 2, NULL, 'khong co', '2024-04-17 07:46:39'),
	(484, 1, 2, 1, NULL, 'lo', '2024-04-17 07:47:55'),
	(485, 1, 2, 1, NULL, 'sao giờ', '2024-04-17 07:48:00'),
	(486, 1, 5, 2, NULL, 'aloooo', '2024-04-17 07:51:23'),
	(487, 1, 1, 2, NULL, 'Kkkp', '2024-04-17 07:51:43'),
	(488, 1, 1, 2, NULL, 'Dang nhắn từ điện thoại èm', '2024-04-17 07:51:58'),
	(489, 1, 1, 2, NULL, '', '2024-04-17 07:51:59'),
	(490, 1, 1, 2, NULL, 'Giao diện chán', '2024-04-17 07:52:09'),
	(491, 1, 2, 1, NULL, 'giao diện', '2024-04-17 07:58:49'),
	(492, 1, 2, 1, NULL, 'chán quá', '2024-04-17 07:58:50'),
	(493, 1, 1, 6, NULL, 'vo chua m', '2024-04-17 07:59:51'),
	(494, 1, 2, 6, NULL, 'loo', '2024-04-17 07:59:58'),
	(495, 1, 6, 1, NULL, 'zo gòi má', '2024-04-17 08:00:46'),
	(496, 1, 1, 6, NULL, 'kkk', '2024-04-17 08:01:25'),
	(497, 1, 1, 6, NULL, 'thấy r nha kkk', '2024-04-17 08:01:29'),
	(498, 1, 2, 1, NULL, 'duam', '2024-04-17 08:01:31'),
	(499, 1, 2, 1, NULL, 'tao à', '2024-04-17 08:01:33'),
	(500, 1, 6, 2, NULL, 'thần thiếp nghe', '2024-04-17 08:01:35'),
	(501, 1, 2, 6, NULL, 'kkkk', '2024-04-17 08:01:40'),
	(502, 1, 1, 6, NULL, 'chào cậu nè', '2024-04-17 08:01:42'),
	(503, 1, 2, 6, NULL, 'đợi làm cái tin nhắn nhóm', '2024-04-17 08:01:53'),
	(504, 1, 6, 1, NULL, 'hi cậu mà sao nó ko hiện thông báo zị', '2024-04-17 08:01:53'),
	(505, 1, 2, 6, NULL, 'rồi add ae chơi', '2024-04-17 08:01:59'),
	(506, 1, 6, 2, NULL, 'okee la', '2024-04-17 08:01:59'),
	(507, 1, 2, 6, NULL, 'kkkk', '2024-04-17 08:02:02'),
	(508, 1, 1, 6, NULL, 'kkk chưa làm tới', '2024-04-17 08:02:14'),
	(509, 1, 1, 2, NULL, 'dui quá đi', '2024-04-17 08:02:39'),
	(510, 1, 6, 1, NULL, 'kkk', '2024-04-17 08:03:09'),
	(515, 1, 1, 2, NULL, 'tao gì tr', '2024-04-17 08:05:38'),
	(516, 1, 2, 1, NULL, 'nảy á', '2024-04-17 08:05:54'),
	(517, 1, 2, 1, NULL, 'anh nch với em', '2024-04-17 08:06:04'),
	(518, 1, 2, 1, NULL, 'mà xưng tao', '2024-04-17 08:06:06'),
	(519, 1, 2, 7, NULL, 'hi cậu', '2024-04-17 08:07:25'),
	(520, 1, 1, 7, NULL, 'bạn ơi', '2024-04-17 08:07:33'),
	(521, 1, 7, 2, NULL, 'hé lô ', '2024-04-17 08:10:28'),
	(522, 1, 2, 7, NULL, 'kkk', '2024-04-17 08:10:38'),
	(523, 1, 7, 2, NULL, 'thấy tôi đẹp gái không ', '2024-04-17 08:10:42'),
	(524, 1, 2, 7, NULL, 'tắt dark mode đi ạ', '2024-04-17 08:10:45'),
	(525, 1, 1, 7, NULL, 'rep tin nhắn bạn ơi', '2024-04-17 08:10:53'),
	(526, 1, 2, 7, NULL, 'đẹp vl luôn kkk', '2024-04-17 08:11:00'),
	(527, 1, 7, 1, NULL, 'hé lô bạn hiền ', '2024-04-17 08:13:18'),
	(528, 1, 2, 1, NULL, 'lô', '2024-04-17 08:15:47'),
	(529, 1, 2, 1, NULL, 'sao kh làm gì hết trơn', '2024-04-17 08:15:52'),
	(530, 1, 2, 1, NULL, 'api có r mà', '2024-04-17 08:15:58'),
	(531, 1, 7, 2, NULL, 'dark mode ở đâu là nào ạ', '2024-04-17 08:16:49'),
	(532, 1, 2, 7, NULL, 'KKK', '2024-04-17 08:18:12'),
	(533, 1, 2, 7, NULL, 'trên góc bên cái thông báo á', '2024-04-17 08:18:21'),
	(534, 1, 2, 1, NULL, '', '2024-04-17 14:29:31'),
	(535, 2, 2, NULL, NULL, 'hi', '2024-04-17 16:51:08'),
	(537, 1, 1, 2, NULL, 'lô', '2024-04-18 17:00:07'),
	(538, 1, 1, 2, NULL, 'linh', '2024-04-18 17:01:17'),
	(539, 1, 1, 2, NULL, 'linh', '2024-04-18 17:01:36'),
	(540, 1, 1, 2, NULL, 'nghe nè', '2024-04-19 16:41:54'),
	(541, 1, 1, 2, NULL, 'nhắn thử r nè', '2024-04-19 16:43:01'),
	(542, 1, 2, 1, NULL, 'lô', '2024-04-10 17:00:00'),
	(543, 1, 2, 1, NULL, 'nghe', '2024-04-19 18:12:49'),
	(544, 1, 2, 5, NULL, 'nghe nè', '2024-04-19 18:13:07'),
	(545, 1, 5, 2, NULL, '123', '2024-04-19 18:13:41'),
	(546, 2, 2, NULL, 21, 'oki đã nhận được tin nhắn', '2024-04-05 17:00:00'),
	(547, 2, 1, NULL, 21, 'oki đã nhận được tin nhắn', '2024-04-05 17:00:00'),
	(548, 2, 1, NULL, 21, 'oki', '2024-04-05 17:00:50'),
	(549, 1, 1, 2, NULL, 'alo ', '2024-04-19 18:35:23'),
	(550, 2, 1, NULL, 21, 'oki luôn', '2024-04-05 17:00:00'),
	(551, 2, 1, NULL, 21, 'oki luôn', '2024-04-05 17:00:00'),
	(552, 2, 1, NULL, 21, 'oki luôn', '2024-04-05 17:01:03');

-- Dumping structure for trigger defaultdb.insert_loimoidanhba
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `insert_loimoidanhba` AFTER INSERT ON `danhba` FOR EACH ROW BEGIN
    INSERT INTO loimoidanhba (manguoigui, manguoinhan) 
    SELECT chudanhba, manguoitrongdanhba
    FROM danhba
    WHERE madanhba = NEW.madanhba;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger defaultdb.insert_nguoinhan_loimoi
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `insert_nguoinhan_loimoi` AFTER INSERT ON `loimoidanhba` FOR EACH ROW BEGIN
    INSERT INTO danhsachnguoinhanthongbao (manguoinhan, mathongbao) 
    SELECT lm.manguoinhan, tb.mathongbao
    FROM loimoidanhba lm JOIN thongbao tb ON lm.manguoigui = tb.manguoigui
    WHERE maloimoi = NEW.maloimoi;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger defaultdb.insert_thongbao_loimoi
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `insert_thongbao_loimoi` AFTER INSERT ON `loimoidanhba` FOR EACH ROW BEGIN
    INSERT INTO thongbao (manguoigui, maloaithongbao, noidung, thoigian) 
    SELECT manguoigui, 2 AS maloaithongbao, 'Bạn có lời mời kết bạn mới từ' AS noidung, NOW() AS thoigian
    FROM loimoidanhba 
    WHERE maloimoi = NEW.maloimoi;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger defaultdb.update_ttcongviec
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `update_ttcongviec` AFTER UPDATE ON `congviec` FOR EACH ROW BEGIN
    IF OLD.maloaitrangthaicongviec != NEW.maloaitrangthaicongviec THEN
        INSERT INTO lichsuthaydoicongviec (macongviec, maloaitrangthaicongviec) VALUES (NEW.macongviec, NEW.maloaitrangthaicongviec);
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for view defaultdb.get_all_contact
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `get_all_contact`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `get_all_contact` AS select `d`.`madanhba` AS `madanhba`,`d`.`chudanhba` AS `chudanhba`,`d`.`manguoitrongdanhba` AS `manguoitrongdanhba`,`d`.`ten` AS `ten`,`d`.`sodienthoai` AS `sodienthoai`,(case when (`tn1`.`thoigiangui` >= `tn2`.`thoigiangui`) then `tn1`.`noidung` else `tn2`.`noidung` end) AS `tinnhancuoi` from ((`danhba` `d` left join (select `t1`.`manguoinhan` AS `manguoinhan`,`t1`.`manguoigui` AS `manguoigui`,`t1`.`noidung` AS `noidung`,`t1`.`thoigiangui` AS `thoigiangui` from (`tinnhan` `t1` join (select `tinnhan`.`manguoinhan` AS `manguoinhan`,`tinnhan`.`manguoigui` AS `manguoigui`,max(`tinnhan`.`thoigiangui`) AS `max_thoigiangui` from `tinnhan` group by `tinnhan`.`manguoinhan`,`tinnhan`.`manguoigui`) `t2` on(((`t1`.`manguoinhan` = `t2`.`manguoinhan`) and (`t1`.`manguoigui` = `t2`.`manguoigui`) and (`t1`.`thoigiangui` = `t2`.`max_thoigiangui`))))) `tn1` on(((`d`.`chudanhba` = `tn1`.`manguoinhan`) and (`d`.`manguoitrongdanhba` = `tn1`.`manguoigui`)))) left join (select `t3`.`manguoigui` AS `manguoigui`,`t3`.`manguoinhan` AS `manguoinhan`,`t3`.`noidung` AS `noidung`,`t3`.`thoigiangui` AS `thoigiangui` from (`tinnhan` `t3` join (select `tinnhan`.`manguoigui` AS `manguoigui`,`tinnhan`.`manguoinhan` AS `manguoinhan`,max(`tinnhan`.`thoigiangui`) AS `max_thoigiangui` from `tinnhan` group by `tinnhan`.`manguoigui`,`tinnhan`.`manguoinhan`) `t4` on(((`t3`.`manguoigui` = `t4`.`manguoigui`) and (`t3`.`manguoinhan` = `t4`.`manguoinhan`) and (`t3`.`thoigiangui` = `t4`.`max_thoigiangui`))))) `tn2` on(((`d`.`chudanhba` = `tn2`.`manguoigui`) and (`d`.`manguoitrongdanhba` = `tn2`.`manguoinhan`)))) where ((`d`.`chudanhba` = `d`.`chudanhba`) and (`d`.`trangthai` = 1));

-- Dumping structure for view defaultdb.get_all_group
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `get_all_group`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `get_all_group` AS select `n`.`manhom` AS `manhom`,`n`.`tennhom` AS `tennhom`,`n`.`matruongnhom` AS `matruongnhom`,`ds`.`mataikhoan` AS `mataikhoan`,`tm`.`manhomnhan` AS `manhomnhan`,`tm`.`noidung` AS `tinnhancuoi` from ((`nhom` `n` join `danhsachthanhviennhom` `ds` on((`n`.`manhom` = `ds`.`manhom`))) left join (select `t1`.`matinnhan` AS `matinnhan`,`t1`.`maloaitinnhan` AS `maloaitinnhan`,`t1`.`manguoigui` AS `manguoigui`,`t1`.`manguoinhan` AS `manguoinhan`,`t1`.`manhomnhan` AS `manhomnhan`,`t1`.`noidung` AS `noidung`,`t1`.`thoigiangui` AS `thoigiangui` from (`tinnhan` `t1` join (select `tinnhan`.`manhomnhan` AS `manhomnhan`,max(`tinnhan`.`thoigiangui`) AS `max_thoigiangui` from `tinnhan` group by `tinnhan`.`manhomnhan`) `t2` on(((`t1`.`manhomnhan` = `t2`.`manhomnhan`) and (`t1`.`thoigiangui` = `t2`.`max_thoigiangui`))))) `tm` on((`n`.`manhom` = `tm`.`manhomnhan`))) where (`ds`.`mataikhoan` = `ds`.`mataikhoan`);

-- Dumping structure for view defaultdb.get_list_assign_task
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `get_list_assign_task`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `get_list_assign_task` AS select `cv`.`macongviec` AS `macongviec`,`cv`.`tencongviec` AS `tencongviec`,`cv`.`noidung` AS `noidung`,`cv`.`manguoigiaoviec` AS `manguoigiaoviec`,`cv`.`manhom` AS `manhom`,`ds`.`manguoinhan` AS `manguoinhan`,`cv`.`ngaygiao` AS `ngaygiao`,`cv`.`thoihan` AS `thoihan`,`tt`.`maloaitrangthaicongviec` AS `maloaitrangthaicongviec`,`tt`.`tentrangthai` AS `tentrangthai` from ((`congviec` `cv` join `danhsachnguoinhanviec` `ds` on((`ds`.`macongviec` = `cv`.`macongviec`))) join `loaitrangthaicongviec` `tt` on((`tt`.`maloaitrangthaicongviec` = `cv`.`maloaitrangthaicongviec`))) where (((`cv`.`manhom` = `cv`.`manhom`) or (`cv`.`manhom` is null)) and ((`ds`.`manguoinhan` = `ds`.`manguoinhan`) or (`ds`.`manguoinhan` is null))) group by `tt`.`maloaitrangthaicongviec`,`cv`.`macongviec` order by `tt`.`maloaitrangthaicongviec`,(to_days(`cv`.`ngaygiao`) - to_days(`cv`.`thoihan`)) desc;

-- Dumping structure for view defaultdb.get_list_notification
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `get_list_notification`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `get_list_notification` AS select `lm`.`manguoigui` AS `manguoigui`,concat(`tk`.`hodem`,' ',`tk`.`ten`) AS `tennguoigui`,`lm`.`manguoinhan` AS `manguoinhan`,`ltb`.`maloaithongbao` AS `maloaithongbao`,`tb`.`noidung` AS `noidung`,`tb`.`thoigian` AS `thoigian`,`tb`.`trangthai` AS `trangthai` from ((((`loimoidanhba` `lm` join `thongbao` `tb` on((`lm`.`manguoigui` = `tb`.`manguoigui`))) join `loaithongbao` `ltb` on((`tb`.`maloaithongbao` = `ltb`.`maloaithongbao`))) join `danhsachnguoinhanthongbao` `ds` on((`tb`.`mathongbao` = `ds`.`mathongbao`))) join `taikhoan` `tk` on((`tk`.`mataikhoan` = `lm`.`manguoigui`))) where ((`tb`.`trangthai` = 1) and (`lm`.`manguoinhan` = `lm`.`manguoinhan`)) order by `tb`.`thoigian` desc;

-- Dumping structure for view defaultdb.get_list_task_received
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `get_list_task_received`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `get_list_task_received` AS select `cv`.`macongviec` AS `macongviec`,`cv`.`tencongviec` AS `tencongviec`,`cv`.`noidung` AS `noidung`,`cv`.`manguoigiaoviec` AS `manguoigiaoviec`,`cv`.`manhom` AS `manhom`,`ds`.`manguoinhan` AS `manguoinhan`,`cv`.`ngaygiao` AS `ngaygiao`,`cv`.`thoihan` AS `thoihan`,`tt`.`maloaitrangthaicongviec` AS `maloaitrangthaicongviec`,`tt`.`tentrangthai` AS `tentrangthai` from ((`congviec` `cv` join `danhsachnguoinhanviec` `ds` on((`ds`.`macongviec` = `cv`.`macongviec`))) join `loaitrangthaicongviec` `tt` on((`tt`.`maloaitrangthaicongviec` = `cv`.`maloaitrangthaicongviec`))) where ((`ds`.`manguoinhan` = `ds`.`manguoinhan`) and ((`cv`.`manguoigiaoviec` = `cv`.`manguoigiaoviec`) or (`cv`.`manguoigiaoviec` is null)) and ((`cv`.`manhom` = `cv`.`manhom`) or (`cv`.`manhom` is null))) group by `tt`.`maloaitrangthaicongviec`,`cv`.`macongviec` order by `tt`.`maloaitrangthaicongviec`,(to_days(`cv`.`ngaygiao`) - to_days(`cv`.`thoihan`)) desc;

-- Dumping structure for view defaultdb.nhomwithtinnhancuoi
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `nhomwithtinnhancuoi`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `nhomwithtinnhancuoi` AS select `n`.`manhom` AS `manhom`,`n`.`tennhom` AS `tennhom`,`n`.`matruongnhom` AS `matruongnhom`,(case when (`tn1`.`thoigiangui` >= `tn2`.`thoigiangui`) then `tn1`.`noidung` else `tn2`.`noidung` end) AS `tinnhancuoi` from ((`nhom` `n` left join (select `t1`.`manhomnhan` AS `manhom`,`t1`.`manguoigui` AS `manguoigui`,`t1`.`noidung` AS `noidung`,`t1`.`thoigiangui` AS `thoigiangui` from (`tinnhan` `t1` join (select `tinnhan`.`manhomnhan` AS `manhomnhan`,`tinnhan`.`manguoigui` AS `manguoigui`,max(`tinnhan`.`thoigiangui`) AS `max_thoigiangui` from `tinnhan` group by `tinnhan`.`manhomnhan`,`tinnhan`.`manguoigui`) `t2` on(((`t1`.`manhomnhan` = `t2`.`manhomnhan`) and (`t1`.`manguoigui` = `t2`.`manguoigui`) and (`t1`.`thoigiangui` = `t2`.`max_thoigiangui`))))) `tn1` on(((`n`.`manhom` = `tn1`.`manhom`) and (`n`.`matruongnhom` = `tn1`.`manguoigui`)))) left join (select `t3`.`manhomnhan` AS `manhom`,`t3`.`manguoigui` AS `manguoigui`,`t3`.`noidung` AS `noidung`,`t3`.`thoigiangui` AS `thoigiangui` from (`tinnhan` `t3` join (select `tinnhan`.`manhomnhan` AS `manhomnhan`,`tinnhan`.`manguoigui` AS `manguoigui`,max(`tinnhan`.`thoigiangui`) AS `max_thoigiangui` from `tinnhan` group by `tinnhan`.`manhomnhan`,`tinnhan`.`manguoigui`) `t4` on(((`t3`.`manhomnhan` = `t4`.`manhomnhan`) and (`t3`.`manguoigui` = `t4`.`manguoigui`) and (`t3`.`thoigiangui` = `t4`.`max_thoigiangui`))))) `tn2` on(((`n`.`manhom` = `tn2`.`manhom`) and (`n`.`matruongnhom` = `tn2`.`manguoigui`))));

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
