CREATE DATABASE  IF NOT EXISTS `miubank` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `miubank`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: miubank
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `account_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_number` varchar(255) NOT NULL,
  `active` bit(1) NOT NULL,
  `balance` double NOT NULL,
  `account_type_id` int(11) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  KEY `FKt0unjbb1cct10si7nymsbut42` (`account_type_id`),
  KEY `FKn6x8pdp50os8bq5rbb792upse` (`customer_id`),
  CONSTRAINT `FKn6x8pdp50os8bq5rbb792upse` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `FKt0unjbb1cct10si7nymsbut42` FOREIGN KEY (`account_type_id`) REFERENCES `accounttypes` (`account_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'ACC-1',_binary '',92801,1,1),(4,'ACC-2',_binary '',1002705.11,1,10),(5,'ACC-3',_binary '',505,1,11),(6,'ACC-4',_binary '',32,2,12),(7,'ACC-5',_binary '',1195,1,13),(8,'ACC-6',_binary '',32,1,14),(9,'ACC-7',_binary '',1003322.45,1,15),(10,'ACC-8',_binary '',212,1,16),(11,'ACC-9',_binary '',132,1,17);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounttypes`
--

DROP TABLE IF EXISTS `accounttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounttypes` (
  `account_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_type_name` varchar(255) NOT NULL,
  PRIMARY KEY (`account_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounttypes`
--

LOCK TABLES `accounttypes` WRITE;
/*!40000 ALTER TABLE `accounttypes` DISABLE KEYS */;
INSERT INTO `accounttypes` VALUES (1,'Checking'),(2,'Savings'),(3,'Loan');
/*!40000 ALTER TABLE `accounttypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `apartment_number` varchar(255) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `contact_phone` varchar(255) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_number` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `customer_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `UK_t74y58jagthxqxysuw9l0jx6y` (`customer_number`),
  KEY `FK7k2lr5ywy88p566fxwxumxtw0` (`customer_type_id`),
  CONSTRAINT `FK7k2lr5ywy88p566fxwxumxtw0` FOREIGN KEY (`customer_type_id`) REFERENCES `customertypes` (`customer_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'000','Fairfiield','123456789','MIU','CUS-1','IA','1234','00000',2),(10,'sdfa','Jackson','7038259600','Nahu Merawi','CUS-4','MS','1400 J.R. Lynch St.','39217',1),(11,'141','Jackson','3012813106','Amanuel Kassaye','CUS-2','Mississippi','5880 Ridgewood RD','39211',2),(12,'sfda','Jackson','7038259600','Nahu Merawi','CUS-3','MS','1400 J.R. Lynch St.','39217',1),(13,'fds','Jackson','3012813106','John','CUS-5','Mississippi','5880 Ridgewood RD','39211',2),(14,'141','Fairfield','123456','berket','CUS-6','IA','1000 N. 4th St.','52557',1),(15,'141','Jackson','7038259600','Nahu Merawi','CUS-7','MS','1400 J.R. Lynch St.','39217',1),(16,'ad','Jackson','7038259600','T-Mobile','CUS-8','MS','1400 J.R. Lynch St.','39217',2),(17,'afd','Jackson','3012813106','Car Insurance','CUS-9','Mississippi','5880 Ridgewood RD','39211',2);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customertypes`
--

DROP TABLE IF EXISTS `customertypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customertypes` (
  `customer_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_type_name` varchar(255) NOT NULL,
  PRIMARY KEY (`customer_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customertypes`
--

LOCK TABLES `customertypes` WRITE;
/*!40000 ALTER TABLE `customertypes` DISABLE KEYS */;
INSERT INTO `customertypes` VALUES (1,'Student'),(2,'Faculty'),(3,'Company');
/*!40000 ALTER TABLE `customertypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loanapplications`
--

DROP TABLE IF EXISTS `loanapplications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loanapplications` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `interest_rate` double NOT NULL,
  `length` int(11) NOT NULL,
  `loan_amount` double NOT NULL,
  `loan_application_number` varchar(255) NOT NULL,
  `loan_date` date NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_sbcajkeo1gtq20qdpxm42880w` (`loan_application_number`),
  KEY `FK9kxg7ewaehqoqh8qlk6g07ao6` (`customer_id`),
  CONSTRAINT `FK9kxg7ewaehqoqh8qlk6g07ao6` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loanapplications`
--

LOCK TABLES `loanapplications` WRITE;
/*!40000 ALTER TABLE `loanapplications` DISABLE KEYS */;
INSERT INTO `loanapplications` VALUES (1,_binary '',0,12,2000,'LAPP-1','2020-03-19',10),(2,_binary '',0,12,1000,'LAPP-2','2020-03-19',14),(3,_binary '',10,24,40000,'LAPP-3','2020-03-19',12),(4,_binary '',10,12,40000,'LAPP-4','2020-03-19',15);
/*!40000 ALTER TABLE `loanapplications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paycheckdetails`
--

DROP TABLE IF EXISTS `paycheckdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paycheckdetails` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `seen` bit(1) NOT NULL,
  `to_account_id` bigint(20) DEFAULT NULL,
  `paycheck_id` bigint(20) DEFAULT NULL,
  `account_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6f05oq6fjyhd9oddcomhfjttm` (`to_account_id`),
  KEY `FKeimvbhjr84o2jeyvh1arjb4b5` (`paycheck_id`),
  CONSTRAINT `FK6f05oq6fjyhd9oddcomhfjttm` FOREIGN KEY (`to_account_id`) REFERENCES `accounts` (`account_id`),
  CONSTRAINT `FKeimvbhjr84o2jeyvh1arjb4b5` FOREIGN KEY (`paycheck_id`) REFERENCES `paychecks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paycheckdetails`
--

LOCK TABLES `paycheckdetails` WRITE;
/*!40000 ALTER TABLE `paycheckdetails` DISABLE KEYS */;
INSERT INTO `paycheckdetails` VALUES (1,200,_binary '\0',1,6,1),(2,234,_binary '\0',5,7,5),(3,200,_binary '\0',5,8,5),(4,200,_binary '\0',5,9,5),(5,213,_binary '\0',5,10,5),(6,6,_binary '\0',1,11,1),(7,94,_binary '\0',5,12,5),(8,1000,_binary '\0',1,13,1),(9,5000,_binary '\0',1,14,1),(10,5,_binary '\0',1,15,1),(11,94,_binary '\0',1,16,1),(12,100,_binary '\0',5,17,5),(13,1000,_binary '\0',7,18,7);
/*!40000 ALTER TABLE `paycheckdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paychecks`
--

DROP TABLE IF EXISTS `paychecks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paychecks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `payment_date` date NOT NULL,
  `account_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1q4k0kvlixqkxg4whv3plv6xa` (`account_id`),
  CONSTRAINT `FK1q4k0kvlixqkxg4whv3plv6xa` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paychecks`
--

LOCK TABLES `paychecks` WRITE;
/*!40000 ALTER TABLE `paychecks` DISABLE KEYS */;
INSERT INTO `paychecks` VALUES (1,'2020-03-18',5),(2,'2020-03-18',1),(3,'2020-03-18',1),(4,'2020-03-18',1),(5,'2020-03-18',1),(6,'2020-03-18',1),(7,'2020-03-18',5),(8,'2020-03-18',5),(9,'2020-03-18',1),(10,'2020-03-18',1),(11,'2020-03-18',1),(12,'2020-03-18',1),(13,'2020-03-19',1),(14,'2020-03-19',1),(15,'2020-03-19',1),(16,'2020-03-19',1),(17,'2020-03-19',1),(18,'2020-03-19',1);
/*!40000 ALTER TABLE `paychecks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rate`
--

DROP TABLE IF EXISTS `rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rate` (
  `rate_id` bigint(20) NOT NULL,
  `loan_rate` double DEFAULT NULL,
  `saving_rate` double DEFAULT NULL,
  PRIMARY KEY (`rate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rate`
--

LOCK TABLES `rate` WRITE;
/*!40000 ALTER TABLE `rate` DISABLE KEYS */;
INSERT INTO `rate` VALUES (1,10,10);
/*!40000 ALTER TABLE `rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedules`
--

DROP TABLE IF EXISTS `schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedules` (
  `schedule_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `actual_payment_date` date DEFAULT NULL,
  `interest` double NOT NULL,
  `outstanding_balance` double NOT NULL,
  `payment_date` date NOT NULL,
  `principal` double NOT NULL,
  `loan_application_id` bigint(20) NOT NULL,
  PRIMARY KEY (`schedule_id`),
  KEY `FKb228gmgtw1of6itj5fy50umka` (`loan_application_id`),
  CONSTRAINT `FKb228gmgtw1of6itj5fy50umka` FOREIGN KEY (`loan_application_id`) REFERENCES `loanapplications` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules`
--

LOCK TABLES `schedules` WRITE;
/*!40000 ALTER TABLE `schedules` DISABLE KEYS */;
INSERT INTO `schedules` VALUES (1,'2020-03-19',166.67,1833.33,'2020-01-19',166.67,1),(2,NULL,166.67,1666.67,'2020-02-19',166.67,1),(3,NULL,166.67,1500,'2020-03-19',166.67,1),(4,NULL,166.67,1333.33,'2020-04-19',166.67,1),(5,NULL,166.67,1166.67,'2020-05-19',166.67,1),(6,NULL,166.67,1000,'2020-06-19',166.67,1),(7,NULL,166.67,833.33,'2020-07-19',166.67,1),(8,NULL,166.67,666.67,'2020-08-19',166.67,1),(9,NULL,166.67,500,'2020-09-19',166.67,1),(10,NULL,166.67,333.33,'2020-10-19',166.67,1),(11,NULL,166.67,166.67,'2020-11-19',166.67,1),(12,NULL,166.67,0,'2020-12-19',166.67,1),(13,NULL,83.33,916.67,'2020-01-19',83.33,2),(14,NULL,83.33,833.33,'2020-02-19',83.33,2),(15,NULL,83.33,750,'2020-03-19',83.33,2),(16,NULL,83.33,666.67,'2020-04-19',83.33,2),(17,NULL,83.33,583.33,'2020-05-19',83.33,2),(18,NULL,83.33,500,'2020-06-19',83.33,2),(19,NULL,83.33,416.67,'2020-07-19',83.33,2),(20,NULL,83.33,333.33,'2020-08-19',83.33,2),(21,NULL,83.33,250,'2020-09-19',83.33,2),(22,NULL,83.33,166.67,'2020-10-19',83.33,2),(23,NULL,83.33,83.33,'2020-11-19',83.33,2),(24,NULL,83.33,0,'2020-12-19',83.33,2),(25,NULL,3333.33,38333.33,'2020-01-19',1666.67,3),(26,NULL,3333.33,36666.67,'2020-02-19',1666.67,3),(27,NULL,3333.33,35000,'2020-03-19',1666.67,3),(28,NULL,3333.33,33333.33,'2020-04-19',1666.67,3),(29,NULL,3333.33,31666.67,'2020-05-19',1666.67,3),(30,NULL,3333.33,30000,'2020-06-19',1666.67,3),(31,NULL,3333.33,28333.33,'2020-07-19',1666.67,3),(32,NULL,3333.33,26666.67,'2020-08-19',1666.67,3),(33,NULL,3333.33,25000,'2020-09-19',1666.67,3),(34,NULL,3333.33,23333.33,'2020-10-19',1666.67,3),(35,NULL,3333.33,21666.67,'2020-11-19',1666.67,3),(36,NULL,3333.33,20000,'2020-12-19',1666.67,3),(37,NULL,3333.33,18333.33,'2021-01-19',1666.67,3),(38,NULL,3333.33,16666.67,'2022-02-19',1666.67,3),(39,NULL,3333.33,15000,'2023-03-19',1666.67,3),(40,NULL,3333.33,13333.33,'2024-04-19',1666.67,3),(41,NULL,3333.33,11666.67,'2025-05-19',1666.67,3),(42,NULL,3333.33,10000,'2026-06-19',1666.67,3),(43,NULL,3333.33,8333.33,'2027-07-19',1666.67,3),(44,NULL,3333.33,6666.67,'2028-08-19',1666.67,3),(45,NULL,3333.33,5000,'2029-09-19',1666.67,3),(46,NULL,3333.33,3333.33,'2030-10-19',1666.67,3),(47,NULL,3333.33,1666.67,'2031-11-19',1666.67,3),(48,NULL,3333.33,0,'2032-12-19',1666.67,3),(49,NULL,3333.33,36666.67,'2020-01-19',3333.33,4),(50,NULL,3333.33,33333.33,'2020-02-19',3333.33,4),(51,NULL,3333.33,30000,'2020-03-19',3333.33,4),(52,NULL,3333.33,26666.67,'2020-04-19',3333.33,4),(53,NULL,3333.33,23333.33,'2020-05-19',3333.33,4),(54,NULL,3333.33,20000,'2020-06-19',3333.33,4),(55,NULL,3333.33,16666.67,'2020-07-19',3333.33,4),(56,NULL,3333.33,13333.33,'2020-08-19',3333.33,4),(57,NULL,3333.33,10000,'2020-09-19',3333.33,4),(58,NULL,3333.33,6666.67,'2020-10-19',3333.33,4),(59,NULL,3333.33,3333.33,'2020-11-19',3333.33,4),(60,NULL,3333.33,0,'2020-12-19',3333.33,4);
/*!40000 ALTER TABLE `schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `description` varchar(255) NOT NULL,
  `transaction_date` date NOT NULL,
  `account_id` bigint(20) DEFAULT NULL,
  `from_account_id` bigint(20) DEFAULT NULL,
  `to_account_id` bigint(20) DEFAULT NULL,
  `transaction_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK20w7wsg13u9srbq3bd7chfxdh` (`account_id`),
  KEY `FK7i7kboanveneetad7jyhbr0a7` (`from_account_id`),
  KEY `FKra0an432c5wjo76mojluk0v28` (`to_account_id`),
  KEY `FKjfs3j43d8sjx1k6dkpr2upr5v` (`transaction_type_id`),
  CONSTRAINT `FK20w7wsg13u9srbq3bd7chfxdh` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`),
  CONSTRAINT `FK7i7kboanveneetad7jyhbr0a7` FOREIGN KEY (`from_account_id`) REFERENCES `accounts` (`account_id`),
  CONSTRAINT `FKjfs3j43d8sjx1k6dkpr2upr5v` FOREIGN KEY (`transaction_type_id`) REFERENCES `transactiontypes` (`transaction_type_id`),
  CONSTRAINT `FKra0an432c5wjo76mojluk0v28` FOREIGN KEY (`to_account_id`) REFERENCES `accounts` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (5,100,'Deposit','2020-03-18',5,NULL,NULL,1),(6,100,'Deposit','2020-03-18',1,NULL,NULL,1),(7,100,'Deposit','2020-03-19',7,NULL,NULL,1),(8,5,'withdraw','2020-03-19',7,NULL,NULL,2),(9,333.34,'MAKE A LOAN PAYMENT','2020-03-19',4,NULL,NULL,5),(10,100,'UTILITY PAYMENT TO Utility','2020-03-19',NULL,4,10,4),(11,100,'UTILITY PAYMENT TO Utility','2020-03-19',NULL,4,11,4),(12,100,'UTILITY PAYMENT TO Utility','2020-03-19',NULL,4,10,4);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactiontypes`
--

DROP TABLE IF EXISTS `transactiontypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactiontypes` (
  `transaction_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_type_name` varchar(255) NOT NULL,
  PRIMARY KEY (`transaction_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactiontypes`
--

LOCK TABLES `transactiontypes` WRITE;
/*!40000 ALTER TABLE `transactiontypes` DISABLE KEYS */;
INSERT INTO `transactiontypes` VALUES (1,'DEPOSIT'),(2,'WITHDRAW'),(3,'TRANSFER'),(4,'UTILITY PAYMENT'),(5,'LOAN PAYMENT');
/*!40000 ALTER TABLE `transactiontypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `locked` bit(1) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `user_type_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `UK_bv23tjhe3c029w3d3x0435imy` (`customer_id`),
  KEY `FKlrk9xrdps0emd6d5rx5x3ib6h` (`user_type_id`),
  CONSTRAINT `FKlrk9xrdps0emd6d5rx5x3ib6h` FOREIGN KEY (`user_type_id`) REFERENCES `user_type` (`user_type_id`),
  CONSTRAINT `FKpg1k7sft8ea3ql7jj1234upt3` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,_binary '\0','123','nahu',10,3),(2,_binary '\0','123','teller',NULL,2),(3,_binary '\0','123','bereket',14,3);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_type`
--

DROP TABLE IF EXISTS `user_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_type` (
  `user_type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_type`
--

LOCK TABLES `user_type` WRITE;
/*!40000 ALTER TABLE `user_type` DISABLE KEYS */;
INSERT INTO `user_type` VALUES (1,'Admin'),(2,'Teller'),(3,'Student');
/*!40000 ALTER TABLE `user_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utility_setting`
--

DROP TABLE IF EXISTS `utility_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utility_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `account_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2mj2jpyr7mvaxp3v5dyyvd1vr` (`account_id`),
  CONSTRAINT `FK2mj2jpyr7mvaxp3v5dyyvd1vr` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utility_setting`
--

LOCK TABLES `utility_setting` WRITE;
/*!40000 ALTER TABLE `utility_setting` DISABLE KEYS */;
INSERT INTO `utility_setting` VALUES (1,'T-mobile',10),(2,'Car Insurace',11);
/*!40000 ALTER TABLE `utility_setting` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-19 11:28:25
