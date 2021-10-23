-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_ci_ng
-- ------------------------------------------------------
-- Server version	5.7.24

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
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `status` enum('opened','closed') NOT NULL DEFAULT 'opened',
  `name` varchar(255) NOT NULL,
  `maximum_students` tinyint(2) NOT NULL,
  `description` text,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,'class-1','opened','CLASS 1',10,'Ea perferendis quod quasi saepe. Excepturi ut unde alias corporis harum. Aut sed rerum minus. Ut nobis voluptatibus sed sapiente quam odit tenetur voluptatem. Eum impedit sit qui quos omnis.','2021-10-22 09:29:37','2021-10-23 19:34:44'),(3,'class-3','closed','CLASS 3',7,'Minus temporibus asperiores voluptas quo. Rerum quaerat sit eveniet est. Sint praesentium sequi laboriosam optio consequatur. Et dolore voluptatem quam rerum velit.','2021-10-22 09:29:37','2021-10-22 09:29:37'),(4,'class-4','opened','CLASS 4',9,'Illum repudiandae repudiandae labore temporibus. Hic minima ullam eaque eveniet. Perspiciatis consequatur tenetur molestiae enim ut.','2021-10-22 09:29:37','2021-10-22 09:29:37'),(5,'class-5','opened','CLASS 5',6,'Omnis repellat expedita aut et eaque ut deserunt dolorem. Vel corporis veritatis autem necessitatibus inventore. Dolor quo ut qui rem ut. Quae esse quam provident minus omnis.','2021-10-22 09:29:37','2021-10-22 09:29:37'),(6,'class-6','opened','CLASS 6',5,'Quos ratione et alias dolore aut at et. Est voluptas voluptate nam quo libero et eius autem. Deserunt sit nobis enim nisi debitis.','2021-10-22 09:29:37','2021-10-22 09:29:37'),(9,'class-9','closed','CLASS 9',9,'Ullam amet dolor rem. Itaque expedita quas quia aut. Doloremque necessitatibus eaque harum consectetur delectus.','2021-10-22 09:29:37','2021-10-22 09:29:37'),(10,'class-10','closed','CLASS 10',10,'Eos qui sapiente laboriosam cupiditate exercitationem qui. Tenetur rem numquam qui maxime impedit eos. Aut dignissimos velit impedit facilis sit autem. Earum id rem nesciunt qui magnam consequatur.','2021-10-22 09:29:37','2021-10-22 09:29:37'),(17,'class-12','closed','Class 12',5,'Illum repudiandae repudiandae labore temporibus. Hic minima ullam eaque eveniet. Perspiciatis consequatur tenetur molestiae enim ut.','2021-10-23 21:10:38','2021-10-23 21:10:38'),(18,'photography','opened','Photography',7,'This is photography class','2021-10-24 00:29:21','2021-10-24 00:29:39');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2021-10-21-120150','App\\Database\\Migrations\\AddClass','default','App',1634824805,1),(2,'2021-10-21-140614','App\\Database\\Migrations\\AddStudent','default','App',1634841976,2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `class_id` int(11) unsigned NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `students_class_id_foreign` (`class_id`),
  CONSTRAINT `students_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Izabella','Breitenberg','2017-11-12',1,'2021-10-22 09:41:51','2021-10-22 09:41:51'),(2,'Torrance','Wilderman','2001-04-15',9,'2021-10-22 09:41:51','2021-10-22 09:41:51'),(5,'Parker','Deckow','1971-01-03',6,'2021-10-22 09:41:51','2021-10-22 09:41:51'),(7,'Harry','Schinner','1996-06-05',9,'2021-10-22 09:41:51','2021-10-22 09:41:51'),(9,'Magnolia','Witting','1994-11-24',5,'2021-10-22 09:41:51','2021-10-22 09:41:51'),(12,'Karmine','Bruen','1989-09-11',5,'2021-10-22 09:41:51','2021-10-23 00:31:53'),(13,'Agustina','Nolan','1976-08-26',10,'2021-10-22 09:41:51','2021-10-22 09:41:51'),(14,'Enrique','Glover','1978-12-21',4,'2021-10-22 09:41:51','2021-10-22 09:41:51'),(15,'Maiya','Gerlach','1983-05-24',3,'2021-10-22 09:41:51','2021-10-22 09:41:51'),(16,'Daphney','Gorczany','2008-08-21',9,'2021-10-22 09:41:51','2021-10-22 09:41:51'),(18,'Laury','Daugherty','1980-08-11',9,'2021-10-22 09:41:51','2021-10-22 09:41:51'),(19,'Jayda','Watsica','2000-01-11',5,'2021-10-22 09:41:51','2021-10-22 09:41:51'),(20,'Joanny','Smitham','2000-10-31',9,'2021-10-22 09:41:51','2021-10-22 09:41:51'),(22,'Mallory','Conroy','1992-04-01',1,'2021-10-22 09:41:51','2021-10-22 09:41:51'),(25,'Andres','Bosco','1979-09-07',5,'2021-10-22 09:41:51','2021-10-22 09:41:51'),(26,'Rhea','Gorczany','1986-05-12',6,'2021-10-22 09:41:52','2021-10-22 09:41:52'),(27,'Bernita','Douglas','2008-12-08',9,'2021-10-22 09:41:52','2021-10-22 09:41:52'),(28,'Aaron','McClure','1990-02-23',6,'2021-10-22 09:41:52','2021-10-22 09:41:52'),(29,'Marc','Murray','2007-09-07',6,'2021-10-22 09:41:52','2021-10-22 09:41:52'),(30,'Al','Jacobi','1971-01-05',5,'2021-10-22 09:41:52','2021-10-22 09:41:52'),(31,'Bernadine','Russel','2002-05-25',3,'2021-10-22 09:41:52','2021-10-22 09:41:52'),(32,'Ryan','Sporer','2008-12-18',10,'2021-10-22 09:41:52','2021-10-22 09:41:52'),(33,'Jettie','Donnelly','2016-02-19',5,'2021-10-22 09:41:52','2021-10-22 09:41:52'),(34,'Clifford','Crona','2000-03-28',4,'2021-10-22 09:41:52','2021-10-22 09:41:52'),(35,'Jany','Bayer','1982-01-16',9,'2021-10-22 09:41:52','2021-10-22 09:41:52'),(37,'Heber','Johns','1985-12-10',4,'2021-10-22 09:41:52','2021-10-22 09:41:52'),(39,'Krystina','Thiel','1974-03-10',4,'2021-10-22 09:41:52','2021-10-22 09:41:52'),(40,'Ramiro','Shields','2009-12-17',5,'2021-10-22 09:41:52','2021-10-22 09:41:52'),(41,'Bobbie','Hintz','1989-07-03',5,'2021-10-22 09:41:52','2021-10-22 09:41:52'),(43,'Lauretta','Boyle','1993-01-14',1,'2021-10-22 09:41:52','2021-10-22 09:41:52'),(44,'Rogelio','Kuvalis','1980-02-29',9,'2021-10-22 09:41:52','2021-10-22 09:41:52'),(46,'Jaleel','Nienow','1995-03-26',4,'2021-10-22 09:41:52','2021-10-22 09:41:52'),(47,'Judd','Hand','2013-01-23',4,'2021-10-22 09:41:52','2021-10-22 09:41:52'),(48,'Conor','Fadel','1978-08-07',5,'2021-10-22 09:41:52','2021-10-22 09:41:52'),(49,'Cara','Bechtelar','1978-12-13',4,'2021-10-22 09:41:52','2021-10-22 09:41:52'),(50,'Afton','Pacocha','1991-03-19',3,'2021-10-22 09:41:52','2021-10-22 09:41:52'),(53,'John','Miller','1995-12-10',18,'2021-10-24 00:30:15','2021-10-24 00:30:15');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-24  0:59:23
