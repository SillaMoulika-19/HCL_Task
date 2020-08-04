CREATE TABLE `account_details` (
  `Sl.no` int NOT NULL AUTO_INCREMENT,
  `Account_num` int NOT NULL,
  `Holder_Name` varchar(50) NOT NULL,
  `Balance` int NOT NULL,
  PRIMARY KEY (`Sl.no`),
  UNIQUE KEY `Sl.no_UNIQUE` (`Sl.no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `account_details` VALUES (1,32021056,'Radha',32000),(2,32021457,'Rama',45000),(3,32023568,'Sita',21000);


CREATE TABLE `account_transactions` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `transaction_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `amount` int NOT NULL,
  `to_account` int NOT NULL,
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `transaction_id_UNIQUE` (`transaction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1010 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `account_transactions` VALUES (234,'2020-07-25 14:29:36',500,32021457),(247,'2020-07-26 08:45:13',1000,32021457),(256,'2020-07-26 15:23:30',200,32023568),(286,'2020-07-29 00:46:25',600,32023568),(1001,'2020-07-29 13:27:36',250,32023568),(1002,'2020-07-29 13:28:53',1000,666655552),(1003,'2020-07-29 13:32:15',1000,666655552),(1004,'2020-07-29 13:36:32',1000,666655552),(1005,'2020-07-29 13:39:20',1000,666655552),(1006,'2020-07-29 13:50:41',1000,32023568),(1007,'2020-07-29 13:55:33',1000,666655551),(1008,'2020-07-29 13:56:22',1000,666655551),(1009,'2020-07-29 14:08:12',1000,666655586);

