-- MySQL dump 10.13  Distrib 5.5.36, for Win32 (x86)
--
-- Host: localhost    Database: phpapache
-- ------------------------------------------------------
-- Server version	5.5.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `comment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment_post_id` bigint(20) NOT NULL,
  `comment_author` text NOT NULL,
  `comment_author_email` varchar(255) NOT NULL,
  `comment_msg` longtext NOT NULL,
  `comment_date` datetime NOT NULL,
  `comment_approved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,60,'Harsh','harsh.yadav@mail.vinove.com','Hello this is a test','2016-03-09 13:25:59',0),(2,60,'Harsh','harsh.yadav@mail.vinove.com','Hello this is a test','2016-03-09 13:43:10',0),(4,60,'Harsh','harsh.yadav@mail.vinove.com','hello ajax test','2016-03-09 14:01:15',0),(5,60,'Harsh','harsh.yadav@mail.vinove.com','Hello test.','2016-03-09 14:14:23',0),(6,59,'Harsh','harsh.yadav@mail.vinove.com','Hello','2016-03-09 14:16:28',0),(7,60,'Harsh','harsh.yadav@mail.vinove.com','i want','2016-03-10 11:51:48',0),(8,58,'Harsh','harsh.yadav@mail.vinove.com','Hello','2016-03-11 08:53:04',0);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq`
--

DROP TABLE IF EXISTS `faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `answer` longtext NOT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `status` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq`
--

LOCK TABLES `faq` WRITE;
/*!40000 ALTER TABLE `faq` DISABLE KEYS */;
INSERT INTO `faq` VALUES (2,'Lorem Ipsum is simply dummy text of the printing and typesetting industry ?','Integer imperdiet sem vel est viverra, a ultricies tortor hendrerit. Duis vel libero sollicitudin, scelerisque nisl sit amet, pretium purus. Maecenas imperdiet magna eget semper eleifend. Praesent sapien diam, venenatis at augue non, aliquam hendrerit lorem. Aenean aliquet iaculis diam. Nullam ac lorem aliquam, faucibus nulla vel, luctus libero. In eu felis sed ante congue ultrices. Ut et ex vitae elit elementum dapibus. Nullam ante risus, vestibulum laoreet lacus nec, dignissim posuere ligula. Proin sed odio non nunc sollicitudin condimentum vitae ut dui. Nullam cursus hendrerit nisl, eget tincidunt lectus ultricies in. ',1,1),(3,'Lorem Ipsum is simply dummy text of the printing and typesetting industry ?','Integer imperdiet sem vel est viverra, a ultricies tortor hendrerit. Duis vel libero sollicitudin, scelerisque nisl sit amet, pretium purus. Maecenas imperdiet magna eget semper eleifend. Praesent sapien diam, venenatis at augue non, aliquam hendrerit lorem. Aenean aliquet iaculis diam. Nullam ac lorem aliquam, faucibus nulla vel, luctus libero. In eu felis sed ante congue ultrices. Ut et ex vitae elit elementum dapibus. Nullam ante risus, vestibulum laoreet lacus nec, dignissim posuere ligula. Proin sed odio non nunc sollicitudin condimentum vitae ut dui. Nullam cursus hendrerit nisl, eget tincidunt lectus ultricies in. ',2,1),(4,'Lorem Ipsum is simply dummy text of the printing and typesetting industry ?','Integer imperdiet sem vel est viverra, a ultricies tortor hendrerit. Duis vel libero sollicitudin, scelerisque nisl sit amet, pretium purus. Maecenas imperdiet magna eget semper eleifend. Praesent sapien diam, venenatis at augue non, aliquam hendrerit lorem. Aenean aliquet iaculis diam. Nullam ac lorem aliquam, faucibus nulla vel, luctus libero. In eu felis sed ante congue ultrices. Ut et ex vitae elit elementum dapibus. Nullam ante risus, vestibulum laoreet lacus nec, dignissim posuere ligula. Proin sed odio non nunc sollicitudin condimentum vitae ut dui. Nullam cursus hendrerit nisl, eget tincidunt lectus ultricies in. ',3,1),(5,'Lorem Ipsum is simply dummy text of the printing and typesetting industry ?','Integer imperdiet sem vel est viverra, a ultricies tortor hendrerit. Duis vel libero sollicitudin, scelerisque nisl sit amet, pretium purus. Maecenas imperdiet magna eget semper eleifend. Praesent sapien diam, venenatis at augue non, aliquam hendrerit lorem. Aenean aliquet iaculis diam. Nullam ac lorem aliquam, faucibus nulla vel, luctus libero. In eu felis sed ante congue ultrices. Ut et ex vitae elit elementum dapibus. Nullam ante risus, vestibulum laoreet lacus nec, dignissim posuere ligula. Proin sed odio non nunc sollicitudin condimentum vitae ut dui. Nullam cursus hendrerit nisl, eget tincidunt lectus ultricies in. ',4,1),(6,'Lorem Ipsum is simply dummy text of the printing and typesetting industry ?','Integer imperdiet sem vel est viverra, a ultricies tortor hendrerit. Duis vel libero sollicitudin, scelerisque nisl sit amet, pretium purus. Maecenas imperdiet magna eget semper eleifend. Praesent sapien diam, venenatis at augue non, aliquam hendrerit lorem. Aenean aliquet iaculis diam. Nullam ac lorem aliquam, faucibus nulla vel, luctus libero. In eu felis sed ante congue ultrices. Ut et ex vitae elit elementum dapibus. Nullam ante risus, vestibulum laoreet lacus nec, dignissim posuere ligula. Proin sed odio non nunc sollicitudin condimentum vitae ut dui. Nullam cursus hendrerit nisl, eget tincidunt lectus ultricies in. ',5,1),(7,'Lorem Ipsum is simply dummy text of the printing and typesetting industry ?','Integer imperdiet sem vel est viverra, a ultricies tortor hendrerit. Duis vel libero sollicitudin, scelerisque nisl sit amet, pretium purus. Maecenas imperdiet magna eget semper eleifend. Praesent sapien diam, venenatis at augue non, aliquam hendrerit lorem. Aenean aliquet iaculis diam. Nullam ac lorem aliquam, faucibus nulla vel, luctus libero. In eu felis sed ante congue ultrices. Ut et ex vitae elit elementum dapibus. Nullam ante risus, vestibulum laoreet lacus nec, dignissim posuere ligula. Proin sed odio non nunc sollicitudin condimentum vitae ut dui. Nullam cursus hendrerit nisl, eget tincidunt lectus ultricies in. ',6,1),(8,'Lorem Ipsum is simply dummy text of the printing and typesetting industry ?','Integer imperdiet sem vel est viverra, a ultricies tortor hendrerit. Duis vel libero sollicitudin, scelerisque nisl sit amet, pretium purus. Maecenas imperdiet magna eget semper eleifend. Praesent sapien diam, venenatis at augue non, aliquam hendrerit lorem. Aenean aliquet iaculis diam. Nullam ac lorem aliquam, faucibus nulla vel, luctus libero. In eu felis sed ante congue ultrices. Ut et ex vitae elit elementum dapibus. Nullam ante risus, vestibulum laoreet lacus nec, dignissim posuere ligula. Proin sed odio non nunc sollicitudin condimentum vitae ut dui. Nullam cursus hendrerit nisl, eget tincidunt lectus ultricies in. ',1,1),(9,'Lorem Ipsum is simply dummy text of the printing and typesetting industry ?','Integer imperdiet sem vel est viverra, a ultricies tortor hendrerit. Duis vel libero sollicitudin, scelerisque nisl sit amet, pretium purus. Maecenas imperdiet magna eget semper eleifend. Praesent sapien diam, venenatis at augue non, aliquam hendrerit lorem. Aenean aliquet iaculis diam. Nullam ac lorem aliquam, faucibus nulla vel, luctus libero. In eu felis sed ante congue ultrices. Ut et ex vitae elit elementum dapibus. Nullam ante risus, vestibulum laoreet lacus nec, dignissim posuere ligula. Proin sed odio non nunc sollicitudin condimentum vitae ut dui. Nullam cursus hendrerit nisl, eget tincidunt lectus ultricies in. ',7,1),(10,'Lorem Ipsum is simply dummy text of the printing and typesetting industry ?','Integer imperdiet sem vel est viverra, a ultricies tortor hendrerit. Duis vel libero sollicitudin, scelerisque nisl sit amet, pretium purus. Maecenas imperdiet magna eget semper eleifend. Praesent sapien diam, venenatis at augue non, aliquam hendrerit lorem. Aenean aliquet iaculis diam. Nullam ac lorem aliquam, faucibus nulla vel, luctus libero. In eu felis sed ante congue ultrices. Ut et ex vitae elit elementum dapibus. Nullam ante risus, vestibulum laoreet lacus nec, dignissim posuere ligula. Proin sed odio non nunc sollicitudin condimentum vitae ut dui. Nullam cursus hendrerit nisl, eget tincidunt lectus ultricies in. ',8,1),(11,'Lorem Ipsum is simply dummy text of the printing and typesetting industry ?','Integer imperdiet sem vel est viverra, a ultricies tortor hendrerit. Duis vel libero sollicitudin, scelerisque nisl sit amet, pretium purus. Maecenas imperdiet magna eget semper eleifend. Praesent sapien diam, venenatis at augue non, aliquam hendrerit lorem. Aenean aliquet iaculis diam. Nullam ac lorem aliquam, faucibus nulla vel, luctus libero. In eu felis sed ante congue ultrices. Ut et ex vitae elit elementum dapibus. Nullam ante risus, vestibulum laoreet lacus nec, dignissim posuere ligula. Proin sed odio non nunc sollicitudin condimentum vitae ut dui. Nullam cursus hendrerit nisl, eget tincidunt lectus ultricies in. ',9,1),(12,'Lorem Ipsum is simply dummy text of the printing and typesetting industry ?','Integer imperdiet sem vel est viverra, a ultricies tortor hendrerit. Duis vel libero sollicitudin, scelerisque nisl sit amet, pretium purus. Maecenas imperdiet magna eget semper eleifend. Praesent sapien diam, venenatis at augue non, aliquam hendrerit lorem. Aenean aliquet iaculis diam. Nullam ac lorem aliquam, faucibus nulla vel, luctus libero. In eu felis sed ante congue ultrices. Ut et ex vitae elit elementum dapibus. Nullam ante risus, vestibulum laoreet lacus nec, dignissim posuere ligula. Proin sed odio non nunc sollicitudin condimentum vitae ut dui. Nullam cursus hendrerit nisl, eget tincidunt lectus ultricies in. ',9,1),(13,'Lorem Ipsum is simply','Integer imperdiet sem vel est viverra,',2,1),(14,'','',0,1);
/*!40000 ALTER TABLE `faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `post_date` datetime NOT NULL,
  `post_title` text NOT NULL,
  `post_pic_url` text,
  `post_excerpt` text NOT NULL,
  `post_content` longtext NOT NULL,
  `post_status` varchar(20) NOT NULL,
  `post_modified` datetime NOT NULL,
  `guid` varchar(255) NOT NULL,
  `comment_count` int(11) NOT NULL,
  `view_counter` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (55,'2016-03-04 14:16:22','New Shatabdi Express Between New Delhi and Bhatinda from 20.12.2014','http://localhost/phpapache/uploads/rajdhani_650_021815081550.jpg','Railway Minister flags off new Shatabdi Express train between New Delhi and Bhatinda on 18.12.14 and services have been commenced from today(20.12.2014). In addition to 14 pairs of Shatabdi services on Northern Railway serving 11 important cities viz. - Bhopal, Lucknow, Ajmer, Dehradun, Amritsar( 2 pairs)','Railway Minister flags off new Shatabdi Express train between New Delhi and Bhatinda on 18.12.14 and services have been commenced from today(20.12.2014).\r\nIn addition to 14 pairs of Shatabdi services on Northern Railway serving 11 important cities viz. - Bhopal, Lucknow, Ajmer, Dehradun, Amritsar( 2 pairs), Chandigarh, Ludhiana, Moga, Kathgodam, Kanpur and Kalka( 2 pairs),15th new Shatabdi Express train have been introduced.','public','2016-03-04 14:16:22','http://localhost/phpapache/blog/post.php?post_id=55',0,2),(56,'2016-03-04 14:18:02','Three More Pilgrim Special Tourist Trains','http://localhost/phpapache/uploads/railway-shatabdi.jpg','Indian Railways plans 3 more pilgrim special trains till 12.01.2015 in addition to already introduced 7 special trains. New pilgrim destinations covered are Bijapur,Solapur,Badami,Melmaruvathur,Vaitheeswarankoil, Thiruvenkadu, Keelaperumpallam, Thirunallar, Alangudi, Surianarkoil, Kanjanur, Thirunageshwaram, Thingalur, Parasnath, St. Francis Xavier (Old Goa), Mecca Masjid (Hyderabd), Nanded Sahib, Nanak Jhira Gurudwara, Sri Patna Sahib, Kanchipuram etc. Introduction of pilgrim special','Indian Railways plans 3 more pilgrim special trains till 12.01.2015 in addition to already introduced 7 special trains. New pilgrim destinations covered are Bijapur,Solapur,Badami,Melmaruvathur,Vaitheeswarankoil, Thiruvenkadu, Keelaperumpallam, Thirunallar, Alangudi, Surianarkoil, Kanjanur, Thirunageshwaram, Thingalur, Parasnath, St. Francis Xavier (Old Goa), Mecca Masjid (Hyderabd), Nanded Sahib, Nanak Jhira Gurudwara, Sri Patna Sahib, Kanchipuram etc. Introduction of pilgrim special','public','2016-03-04 14:18:02','http://localhost/phpapache/blog/post.php?post_id=56',0,0),(57,'2016-03-04 14:19:42','229 CCTVs at Passenger Reservation Counters','http://localhost/phpapache/uploads/railway-shatabdi.jpg','To identify malpractices at computerised passenger reservation counters,Railways plan to install 229 CCTVs at various locations.Instructions have been already issued to all Zonal Railways to monitor CCTV footage on daily basis. ','To identify malpractices at computerised passenger reservation counters,Railways plan to install 229 CCTVs at various locations.Instructions have been already issued to all Zonal Railways to monitor CCTV footage on daily basis. ','public','2016-03-04 14:19:42','http://localhost/phpapache/blog/post.php?post_id=57',0,0),(58,'2016-03-09 06:48:48','Foodpanda to enter into a partnership with IRCTC','http://localhost/phpapache/uploads/rajdhani_650_021815081550.jpg','Foodpanda, India’s largest online food ordering platform proposes to associate with Indian Railway Catering and Tourism Corporation (IRCTC), a subsidiary of the Indian Railways that handles the catering, tourism and online ticketing operations of the Indian railways. The association will enable consumers to order meals of their choice through foodpanda’s aggregator model, and allow them to order from a wide variety of cuisine options. To ensure that food reaches consumers in the best condition, foodpanda will deploy its own delivery fleet to fulfil all deliveries.','Foodpanda, India’s largest online food ordering platform proposes to associate with Indian Railway Catering and Tourism Corporation (IRCTC), a subsidiary of the Indian Railways that handles the catering, tourism and online ticketing operations of the Indian railways. The association will enable consumers to order meals of their choice through foodpanda’s aggregator model, and allow them to order from a wide variety of cuisine options. To ensure that food reaches consumers in the best condition, foodpanda will deploy its own delivery fleet to fulfil all deliveries.\r\n\r\nThe pilot of this proposed association is being planned to be launched at the New Delhi Railway station and after successful roll out in the metro city, the service will be extended to more cities like Mumbai, Bangalore, Pune and Chennai in due course of time. The customers will have the choice to order meals at-least 2 hours in advance of the travel. The delivery will be aligned to the train arrival time at the station and consumers can pay for the order in advance online or make on the spot cash payment as per their convenience.\r\n\r\nSpeaking about the association, foodpanda CEO Saurabh Kochhar, Said, “Foodpanda is an innovative business model which caters to an important consumer need. Our association with IRCTC will be an offering which addresses a huge consumer need prevailing for years. For long, consumers had limited food options to choose from while travelling with Indian railways but the newly launched e-catering service by IRCTC (approved by Ministry of Railways) is set to change the way Indians eat while travelling. We are excited to begin action with the Delhi station by December and are looking forward to extending this offering to other stations like Mumbai, Bangalore, Pune and Chennai in due course of time.”\r\n\r\nRobin Kalita, Director, Catering Services, IRCTC, “At IRCTC, it has been our endeavour to extend best possible services to our passengers. Food forms a very important part of the travel experience and IRCTC takes immense care to offer healthy and hygienic food to its travellers on-board. With progressing times, we aim to offer wider choices to our consumers and are extremely thankful to foodpanda to have offered partnership with us. We are happy that we will be able to offer wider food choices to our consumers with this association and once our pilot project is successful, we will extend the service to more locations.”\r\n','public','2016-03-09 06:48:48','http://localhost/phpapache/blog/post.php?post_id=58',0,7),(59,'2016-03-09 06:51:48','Ministry of Railways takes Measures on IRCTC website to control ticket booking using automated software','http://localhost/phpapache/uploads/hqdefault.jpg','In furtherance to strengthen its PRS (Passenger Reservation System), Ministry of Railways has taken various measures on IRCTC website to control ticket booking using automated software. In this regard, a Combined Press Conference was held on 19.01.2016 by the Indian Railways. The Conference was attended by the apex officials namely CMD, IRCTC Shri Dr. A. K. Manocha, MD, CRIS Shri Sanjaya Das, Executive Director, C&IS Shri U. Hazarika Railway Board and other senior officials from Railway Board. ','In furtherance to strengthen its PRS (Passenger Reservation System), Ministry of Railways has taken various measures on IRCTC website to control ticket booking using automated software. In this regard, a Combined Press Conference was held on 19.01.2016 by the Indian Railways. The Conference was attended by the apex officials namely CMD, IRCTC Shri Dr. A. K. Manocha, MD, CRIS Shri Sanjaya Das, Executive Director, C&IS Shri U. Hazarika Railway Board and other senior officials from Railway Board. ','public','2016-03-09 06:51:48','http://localhost/phpapache/blog/post.php?post_id=59',0,0),(60,'2016-03-09 06:55:33','Indian Railways appoints Ernst & Young (EY) as consultant to tap advertising potential of stations and trains','http://localhost/phpapache/uploads/railway-shatabdi.jpg','EY to identify assets and pricing strategy across 7000 stations for the purpose of advertising. This is the first time in the country that such a large scale project on advertising for Railways has been initiated. The move aims to enhance revenue through non-fare box route as emphasized by Railway Minister.','EY to identify assets and pricing strategy across 7000 stations for the purpose of advertising. This is the first time in the country that such a large scale project on advertising for Railways has been initiated. The move aims to enhance revenue through non-fare box route as emphasized by Railway Minister.','public','2016-03-09 06:55:33','http://localhost/phpapache/blog/post.php?post_id=60',0,3),(61,'2016-03-11 15:03:29','Hello','http://localhost/phpapache/uploads/dirty_girl_courtney.png','Hello Again','Hello again again','public','2016-03-11 15:03:29','http://localhost/phpapache/blog/post.php/?post_id=61',0,10);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-11 19:42:53
