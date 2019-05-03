SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


CREATE TABLE `companies` (
  `companyId` int(3) NOT NULL,
  `company` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `companies` (`companyId`, `company`) VALUES
(1, 'KUBO S.A'),
(2, 'DEVOPS S.A'),
(3, 'PROGRAMACION S.A');

-- --------------------------------------------------------

CREATE TABLE `users` (
  `userId` int(3) NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `companyId` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `users` (`userId`, `name`, `email`, `companyId`) VALUES
(10, 'JAMER HERNANDEZ', 'jfhernandezp91@gmail.com', 1),
(11, 'DAVID RIANO', 'heliangelusbog@gmail.com', 3),
(12, 'MARK ZUCKERBERG', 'jfhernandezp91@gmail.com', 2),
(13, 'JOHANN BECKMANN', 'jfhernandezp91@gmail.com', 1);

-- --------------------------------------------------------

CREATE TABLE `usersContactInfo` (
  `contactInfoId` int(3) NOT NULL,
  `phoneNumber` int(11) NOT NULL,
  `address` varchar(45) NOT NULL,
  `createdAt` datetime NOT NULL,
  `userId` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `usersContactInfo` (`contactInfoId`, `phoneNumber`, `address`, `createdAt`, `userId`) VALUES
(50, 314285293, 'CHAPINERO', '2019-05-03 00:00:00', 10),
(51, 2345545, 'TEUSAQUILLO', '2019-05-03 00:00:00', 11),
(52, 8877332, 'LAS BRISAS', '2019-05-03 00:00:00', 12),
(53, 334422245, 'CALLE 9A 34-21', '2019-05-03 00:00:00', 13);



ALTER TABLE `companies`
  ADD PRIMARY KEY (`companyId`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`),
  ADD KEY `companyId` (`companyId`);

ALTER TABLE `usersContactInfo`
  ADD PRIMARY KEY (`contactInfoId`),
  ADD KEY `userId` (`userId`);

ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `companies` (`companyId`);

ALTER TABLE `usersContactInfo`
  ADD CONSTRAINT `usersContactInfo_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`);
COMMIT;
