-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        5.7.25-log - MySQL Community Server (GPL)
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- ajaxtest 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `ajaxtest` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ajaxtest`;

-- 테이블 ajaxtest.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `userName` varchar(20) DEFAULT NULL,
  `userAge` int(11) DEFAULT NULL,
  `usergender` varchar(20) DEFAULT NULL,
  `userEmail` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 ajaxtest.user:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
REPLACE INTO `user` (`userName`, `userAge`, `usergender`, `userEmail`) VALUES
	('김이박', 22, '남자', 'koFamName@gmail.com'),
	('으엌이', 23, '남자', 'Eww-uk@gmail.com'),
	('쿡쿡', 30, '여자', 'cookcook@gmail.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
