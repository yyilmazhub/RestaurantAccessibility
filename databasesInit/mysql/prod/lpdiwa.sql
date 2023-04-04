-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: lpdiwa
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB-1:10.4.24+maria~focal

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration_versions`
--

LOCK TABLES `migration_versions` WRITE;
/*!40000 ALTER TABLE `migration_versions` DISABLE KEYS */;
INSERT INTO `migration_versions` VALUES ('20220509094408','2022-05-09 09:51:27'),('20220509131747','2022-05-10 08:40:27'),('20220512095307','2022-05-12 09:53:21');
/*!40000 ALTER TABLE `migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `images` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,'New China','https://www.thefork.fr/restaurant/new-china-r435695','178 Rue Garibaldi, 69003, Lyon',4.8535645,45.7518693,39,9.2,'https://res.cloudinary.com/tf-lab/image/upload/w_276,h_216,c_fill,g_auto:subject,q_auto,f_auto/restaurant/b1d5af0b-4695-4650-8cb6-380cea0ce256/14f0f82e-0ba7-408d-a351-4d38fafa1e09.jpg'),(2,'Fluxus','https://www.thefork.fr/restaurant/fluxus-r576095','12 Rue des Augustins, 69001, Lyon',4.8310263,45.7676631,30,9.5,'https://res.cloudinary.com/tf-lab/image/upload/w_276,h_216,c_fill,g_auto:subject,q_auto,f_auto/restaurant/33224607-944c-4536-810d-3cf9435142d8/7bd0c4ea-bfac-4c4e-a304-87fc3516fa00.jpg'),(3,'Le Marélie','https://www.thefork.fr/restaurant/le-marelie-r65337','85 Rue Moncey, 69003, Lyon',4.8493257,45.7609635,23,9.3,'https://res.cloudinary.com/tf-lab/image/upload/w_276,h_216,c_fill,g_auto:subject,q_auto,f_auto/restaurant/5e6cb9fe-333d-4e87-96f2-dee63bb03c4d/e6291531-8a85-45c1-9415-8730c36b20be.jpg'),(4,'Boucherie Trolliet Grand Hotel Dieu','https://www.thefork.fr/restaurant/boucherie-trolliet-grand-hotel-dieu-r471931','21 Quai Jules Courmont, 69002, Lyon',4.8369582,45.7585851,39,9.4,'https://res.cloudinary.com/tf-lab/image/upload/w_276,h_216,c_fill,g_auto:subject,q_auto,f_auto/restaurant/080acd88-f740-4f3a-a104-9c0aa27fe83d/879bf5ff-6ec1-4683-b0cb-a8fb01492da4.jpg'),(5,'Kitchen Garden Lyon','https://www.thefork.fr/restaurant/kitchen-garden-lyon-r335773','14 Place docteurs Charles et Christophe Mérieux, 69007, Lyon',4.82593297958374,45.7322082519531,25,9.2,'https://res.cloudinary.com/tf-lab/image/upload/w_276,h_216,c_fill,g_auto:subject,q_auto,f_auto/restaurant/b155f4a2-4d6c-4c31-8f36-60247c869bf6/809ef9a6-0bd0-4670-a0c3-d2465844cbcf.jpg'),(6,'Penjabi Grill','https://www.thefork.fr/restaurant/penjabi-grill-r289717','7 Rue du Port du Temple, 69002, Lyon',4.8321317,45.7608182,18,9.3,'https://res.cloudinary.com/tf-lab/image/upload/w_276,h_216,c_fill,g_auto:subject,q_auto,f_auto/restaurant/2d609533-158a-4dd8-ab1a-9929fb99e799/e3e448aa-b8fd-417c-91b2-6a1fd4f2eb82.jpg'),(7,'Eat Sushi Lyon','https://www.thefork.fr/restaurant/eat-sushi-lyon-r336289','196 Rue Garibaldi, 69003, Lyon',4.8535645,45.7518693,25,8.8,'https://res.cloudinary.com/tf-lab/image/upload/w_276,h_216,c_fill,g_auto:subject,q_auto,f_auto/restaurant/4768e638-5feb-4708-845a-e66c59c7ad96/59bba164-e672-44b3-9770-dc4f3d1f1c2d.jpg'),(8,'La Muse en Bouche','https://www.thefork.fr/restaurant/la-muse-en-bouche-r46484','97, rue de Gerland, 69007, Lyon',4.8397602,45.7360243,24,9.3,'https://res.cloudinary.com/tf-lab/image/upload/w_276,h_216,c_fill,g_auto:subject,q_auto,f_auto/restaurant/c1133d29-8ed9-4d3b-a361-8471304d4267/53944cf6-9653-4294-b446-e2174cf4c778.jpg'),(9,'Nawab','https://www.thefork.fr/restaurant/nawab-r714198','30 Rue Frédéric Mistral, 69003, Lyon',4.8760273,45.7559375,15,9.1,'https://res.cloudinary.com/tf-lab/image/upload/w_276,h_216,c_fill,g_auto:subject,q_auto,f_auto/restaurant/d862da8a-5819-4552-be88-5d57f85a6bde/eb7edbbf-7d7a-433e-9b85-2be3d9709d5e.jpg'),(10,'Pizz\'Appel','https://www.thefork.fr/restaurant/pizz-appel-r289095','61 Boulevard des Canuts, 69004, Lyon',4.8276062,45.7789348,20,9.8,'https://res.cloudinary.com/tf-lab/image/upload/w_276,h_216,c_fill,g_auto:subject,q_auto,f_auto/restaurant/f04a3bdf-8617-46c0-9e43-8f2065522021/fdbc3016-b12d-403f-ac7d-3fcd10162a6c.jpg'),(11,'Toke Vieux Lyon','https://www.thefork.fr/restaurant/toke-vieux-lyon-r701735','1 Pl. Ennemond Fousseret, 69005, Lyon',4.828759,45.7645471,16,9.3,'https://res.cloudinary.com/tf-lab/image/upload/w_276,h_216,c_fill,g_auto:subject,q_auto,f_auto/restaurant/30c57114-1e29-4c96-964d-e91b87d6c9df/4392011d-4939-4bee-98db-e754d22e9c29.jpg'),(12,'Cafe Popine','https://www.thefork.fr/restaurant/cafe-popine-r710353','3 Rue Louis Carrand, 69005, Lyon',4.82857370376587,45.7654876708984,12,9.2,'https://res.cloudinary.com/tf-lab/image/upload/w_276,h_216,c_fill,g_auto:subject,q_auto,f_auto/restaurant/025662ed-aa7b-4f42-80b9-bf8ad01e6fb7/f5c8c7ca-93c7-4c9c-a481-9ce613bf3adf.jpg');
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_tag`
--

DROP TABLE IF EXISTS `restaurant_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurant_tag` (
  `restaurant_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`restaurant_id`,`tag_id`),
  KEY `IDX_C2E6743FB1E7706E` (`restaurant_id`),
  KEY `IDX_C2E6743FBAD26311` (`tag_id`),
  CONSTRAINT `FK_C2E6743FB1E7706E` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_C2E6743FBAD26311` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_tag`
--

LOCK TABLES `restaurant_tag` WRITE;
/*!40000 ALTER TABLE `restaurant_tag` DISABLE KEYS */;
INSERT INTO `restaurant_tag` VALUES (1,1),(1,2),(1,4),(1,20),(2,1),(2,4),(2,12),(3,4),(3,5),(3,12),(4,1),(4,7),(4,12),(5,1),(5,3),(5,6),(5,12),(6,6),(6,21),(7,4),(7,6),(7,20),(8,6),(8,17),(8,21),(9,1),(9,4),(9,5),(9,8),(10,4),(10,5),(10,13),(11,4),(11,5),(11,12),(12,4),(12,5),(12,12);
/*!40000 ALTER TABLE `restaurant_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_389B78312469DE2` (`category_id`),
  CONSTRAINT `FK_389B78312469DE2` FOREIGN KEY (`category_id`) REFERENCES `tag_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,5,'Handicap moteur','🧑‍🦽','https://images.unsplash.com/photo-1633466159898-6f5b1a7b5a79?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=300&q=80'),(2,5,'Handicap visuel','😎','https://images.unsplash.com/photo-1632169485242-814ba765c205?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=300&q=80'),(3,5,'Handicap auditif','👐','https://images.unsplash.com/photo-1565562195689-739680900319?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=300&q=80'),(4,6,'Offre étudiante','🎓','https://images.unsplash.com/photo-1523050854058-8df90110c9f1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=300&q=80'),(5,6,'Petit prix','💶','https://images.unsplash.com/photo-1633158829585-23ba8f7c8caf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=300&q=80'),(6,6,'Budget moyen','💶','https://images.unsplash.com/photo-1518458028785-8fbcd101ebb9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=300&q=80'),(7,6,'Grand plaisir','💶','https://images.unsplash.com/photo-1526304640581-d334cdbbf45e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=300&q=80'),(8,1,'Américain','🇺🇸','https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=300&q=80'),(9,1,'Mexicain','🇲🇽','https://images.unsplash.com/photo-1615870216519-2f9fa575fa5c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=300&q=80'),(10,1,'Espagnol','🇪🇸','https://images.unsplash.com/photo-1515443961218-a51367888e4b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=300&q=80'),(11,1,'Japonais','🇯🇵','https://images.unsplash.com/photo-1580822184713-fc5400e7fe10?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=300&q=80'),(12,1,'Français','🇫🇷','https://images.unsplash.com/photo-1615199348139-00bf10980769?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=300&q=80'),(13,1,'Italien','🇮🇹','https://images.unsplash.com/photo-1498579150354-977475b7ea0b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=300&q=80'),(14,2,'Halal','🥙','https://images.unsplash.com/photo-1611712142269-12b7433e28e9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=300&q=80'),(15,2,'Casher','🥩','https://images.unsplash.com/photo-1626200725138-453dac7e46ab?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=300&q=80'),(16,2,'Végétalisme','🥬','https://images.unsplash.com/photo-1600850056064-a8b380df8395?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=300&q=80'),(17,2,'Véganisme','🥒','https://images.unsplash.com/photo-1623428187969-5da2dcea5ebf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=300&q=80'),(18,2,'Végétarisme','🥦','https://images.unsplash.com/photo-1599020792689-9fde458e7e17?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=300&q=80'),(19,2,'Sans gluten','🍞','https://images.unsplash.com/photo-1505253304499-671c55fb57fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=300&q=80'),(20,1,'Chinois','🇨🇳','https://images.unsplash.com/flagged/photo-1556742524-750f2ab99913?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=300&q=80'),(21,1,'Indien','🇮🇳','https://images.unsplash.com/photo-1585937421612-70a008356fbe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=300&q=80');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_category`
--

DROP TABLE IF EXISTS `tag_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) DEFAULT NULL,
  `operation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `on_homepage` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_category`
--

LOCK TABLES `tag_category` WRITE;
/*!40000 ALTER TABLE `tag_category` DISABLE KEYS */;
INSERT INTO `tag_category` VALUES (1,'Tradition',NULL,'or',NULL),(2,'Régime alimentaire',2,NULL,1),(5,'Accessibilité',1,NULL,1),(6,'Budget',NULL,'or',NULL);
/*!40000 ALTER TABLE `tag_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`roles`)),
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'nbilleau@gmail.com','[]','$argon2id$v=19$m=65536,t=4,p=1$WTw3Kikcl/o08jR5cMYiqQ$txktHwCDlL4CPkVmwPrTA7sWFiW6/TRnqvkPiwEtwS8');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-12 11:28:42
