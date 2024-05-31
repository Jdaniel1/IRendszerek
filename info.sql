SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";



DROP TABLE IF EXISTS `borrow`;
CREATE TABLE IF NOT EXISTS `borrow` (
  `id` int NOT NULL AUTO_INCREMENT,
  `borrowDate` datetime NOT NULL,
  `returnDate` datetime NOT NULL,
  `memberId` int DEFAULT NULL,
  `cassetteId` int DEFAULT NULL,
  `dvdId` int DEFAULT NULL,
  `delay` int NOT NULL,
  `maxBorrowsCount` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_c1c20055797527a629d7ca80357` (`memberId`),
  KEY `FK_25e78783f765a8cc626eadcdb9e` (`cassetteId`),
  KEY `FK_742ffeb5016ea66c669214d3c48` (`dvdId`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




INSERT INTO `borrow` (`id`, `borrowDate`, `returnDate`, `memberId`, `cassetteId`, `dvdId`, `delay`, `maxBorrowsCount`) VALUES
(1, '2023-05-15 13:20:04', '2023-06-10 08:37:07', 6, NULL, 5, NULL, 0, 0),
(2, '2023-07-02 11:56:02', '2023-08-07 13:24:00', 7, NULL, NULL, 8, 0, 0),
(3, '2023-05-10 10:35:35', '2023-06-12 10:02:45', 1, 4, NULL, NULL, 0, 0),
(4, '2023-02-03 11:45:02', '2023-03-10 08:45:00', 2, 2, NULL, NULL, 0, 0),
(5, '2024-02-12 09:03:25', '2024-03-26 10:03:45', 4, 6, NULL, NULL, 0, 0),
(6, '2024-02-01 11:57:02', '2024-02-22 09:20:12', 8, 9, NULL, NULL, 0, 0),
(7, '2023-05-27 11:45:02', '2023-08-01 10:31:07', 5, NULL, 7, NULL, 0, 0),
(8, '2023-04-11 09:54:02', '2023-05-20 12:32:34', 2, NULL, 4, NULL, 0, 0),
(9, '2023-05-17 10:04:12', '2023-06-13 10:00:02', 6, NULL, 6, NULL, 0, 0),
(10, '2023-12-02 15:02:17', '2024-01-04 09:08:23', 5, NULL, NULL, 4, 0, 0),
(11, '2024-02-27 09:56:32', '2024-03-07 14:02:39', 3, NULL, NULL, 10, 0, 0),
(12, '2024-01-11 11:11:11', '2024-02-10 11:14:43', 6, NULL, NULL, 6, 0, 0);





DROP TABLE IF EXISTS `cassette`;
CREATE TABLE IF NOT EXISTS `cassette` (
  `id` int NOT NULL AUTO_INCREMENT,
  `author` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `acquisitionDate` datetime NOT NULL,
  `serialNumber` varchar(17) NOT NULL,
  `status` enum('Szabad','Kikölcsönzött','Selejtezett') NOT NULL DEFAULT 'Szabad',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_38f3724b9a7e2c21dbb7ed3f74` (`serialNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;





INSERT INTO `cassette` (`id`, `author`, `title`, `acquisitionDate`, `serialNumber`, `status`) VALUES
(1, 'Leo Tolstoy', 'Háború és béke', '2024-01-05 10:20:30', '9789631412001', 'Szabad'),
(2, 'Fyodor Dostoevsky', 'Bűn és bűnhődés', '2023-09-22 11:45:50', '9789630744805', 'Szabad'),
(3, 'Jane Austen', 'Büszkeség és balítélet', '2023-10-18 14:05:17', '9789631199336', 'Szabad'),
(4, 'Mark Twain', 'Tom Sawyer kalandjai', '2023-08-01 09:10:23', '9789632971139', 'Szabad'),
(5, 'Herman Melville', 'Moby Dick', '2023-07-10 15:20:31', '9789634972438', 'Szabad'),
(6, 'Franz Kafka', 'A per', '2023-06-05 11:15:45', '9789634758002', 'Szabad'),
(7, 'Victor Hugo', 'A nyomorultak', '2023-05-19 10:30:25', '9789630799406', 'Szabad'),
(8, 'Ernest Hemingway', 'Az öreg halász és a tenger', '2023-11-27 12:20:33', '9789631192848', 'Szabad'),
(9, 'Charles Dickens', 'Karácsonyi ének', '2023-12-25 14:35:42', '9789630789653', 'Szabad'),
(10, 'Jules Verne', '80 nap alatt a Föld körül', '2023-10-30 13:40:28', '9789639632840', 'Szabad');





DROP TABLE IF EXISTS `dvd`;
CREATE TABLE IF NOT EXISTS `dvd` (
  `id` int NOT NULL AUTO_INCREMENT,
  `author` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `acquisitionDate` datetime NOT NULL,
  `serialNumber` varchar(17) NOT NULL,
  `status` enum('Szabad','Kikölcsönzött','Selejtezett') NOT NULL DEFAULT 'Szabad',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_bb9d6bb4b98437a4329bafe7d0` (`serialNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;





INSERT INTO `dvd` (`id`, `author`, `title`, `acquisitionDate`, `serialNumber`, `status`) VALUES
(1, 'Alfred Hitchcock', 'Psycho', '2024-04-01 13:45:30', '9789632134561', 'Szabad'),
(2, 'Ridley Scott', 'Szárnyas fejvadász', '2024-01-20 11:30:15', '9789631246102', 'Szabad'),
(3, 'James Cameron', 'Avatar', '2023-12-12 10:12:50', '9789633010170', 'Szabad'),
(4, 'Francis Ford Coppola', 'Apokalipszis most', '2023-11-05 15:54:22', '9789634581986', 'Szabad'),
(5, 'George Lucas', 'Csillagok háborúja', '2024-02-14 11:45:00', '9789639953448', 'Szabad'),
(6, 'Robert Zemeckis', 'Vissza a jövőbe', '2023-10-25 13:30:45', '9789633242497', 'Szabad'),
(7, 'Steven Spielberg', 'Jurassic Park', '2023-11-19 14:22:11', '9789633546103', 'Szabad'),
(8, 'Stanley Kubrick', 'Ragyogás', '2024-03-08 09:55:20', '9789639830692', 'Szabad'),
(9, 'Peter Jackson', 'King Kong', '2023-09-13 12:47:43', '9789630749702', 'Szabad'),
(10, 'Quentin Tarantino', 'Ponyvaregény', '2023-12-02 14:11:22', '9789633532106', 'Szabad');





DROP TABLE IF EXISTS `member`;
CREATE TABLE IF NOT EXISTS `member` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phoneNumber` varchar(11) NOT NULL,
  `idCardNumber` varchar(8) NOT NULL,
  `address` varchar(255) NOT NULL,
  `status` enum('Aktív','Passzív') NOT NULL DEFAULT 'Aktív',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_cbfbcbbbf8a4befaae1259e4a9` (`phoneNumber`),
  UNIQUE KEY `IDX_bbfb8a3f99fd1f4826943b7dca` (`idCardNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;





INSERT INTO `member` (`id`, `name`, `phoneNumber`, `idCardNumber`, `address`, `status`) VALUES
(1, 'Tóth László', '06701234567', '123456AB', '1137 Budapest, Szent István krt. 10.', 'Aktív'),
(2, 'Varga Katalin', '06305678901', '789123XY', '1146 Budapest, Ajtósi Dürer sor 19.', 'Aktív'),
(3, 'Molnár Ferenc', '06201122334', '456789GH', '6722 Szeged, Kárász utca 5.', 'Aktív'),
(4, 'Balogh Zsuzsanna', '06202345678', '321654NM', '8000 Székesfehérvár, Városház tér 3.', 'Aktív'),
(5, 'Németh András', '06708901234', '654987UV', '5000 Szolnok, Kossuth Lajos út 4.', 'Aktív'),
(6, 'Szilágyi Lajos', '06706677889', '098765JK', '9021 Győr, Baross Gábor út 12.', 'Aktív'),
(7, 'Kovács Éva', '06703334455', '567890QW', '5600 Békéscsaba, Andrássy út 2.', 'Aktív'),
(8, 'Farkas Attila', '06301234569', '345678RT', '2100 Gödöllő, Szabadság tér 8.', 'Aktív'),
(9, 'Lakatos Mária', '06204567890', '234567PL', '9700 Szombathely, Fő tér 9.', 'Aktív'),
(10, 'Juhász Péter', '06707778899', '678901MN', '8800 Nagykanizsa, Erzsébet tér 6.', 'Aktív');





DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_e12875dfb3b1d92d7d7c5377e2` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;





INSERT INTO `user` (`id`, `firstName`, `lastName`, `email`, `password`) VALUES
(1, 'Jobbágy', 'Dániel', 'jobbdani01@gmail.com', '$2b$12$C/EFD.Nu5w4zQzjQWjnaYOi/FWFu6Yd27RXYaJWLHdJ61YHgp8/Wi');




ALTER TABLE `borrow`
  ADD CONSTRAINT `FK_25e78783f765a8cc626eadcdb9e` FOREIGN KEY (`cassetteId`) REFERENCES `cassette` (`id`),
  ADD CONSTRAINT `FK_742ffeb5016ea66c669214d3c48` FOREIGN KEY (`dvdId`) REFERENCES `dvd` (`id`),
  ADD CONSTRAINT `FK_c1c20055797527a629d7ca80357` FOREIGN KEY (`memberId`) REFERENCES `member` (`id`);