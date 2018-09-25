-- MySQL dump 10.15  Distrib 10.0.36-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	10.0.36-MariaDB-0ubuntu0.16.04.1

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `konten` text NOT NULL,
  `id_post` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) NOT NULL,
  `konten` text,
  `image_featured` varchar(100) DEFAULT NULL,
  `tanggal_posting` date DEFAULT NULL,
  `tanggal_tayang` date DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `id_categories` int(11) DEFAULT NULL,
  `id_tags` int(11) DEFAULT NULL,
  `authors` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...',' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ut dui velit. Phasellus dictum risus eu dolor vestibulum ornare. Duis ut sem mauris. Aliquam elementum magna nec urna egestas viverra. Mauris nec varius nisl, ut fringilla arcu. Pellentesque ultrices egestas nibh non maximus. Fusce non velit ut massa molestie pulvinar in eu arcu. Proin a lacinia libero. Vestibulum suscipit ante mattis, finibus nibh sed, laoreet erat. Nam dignissim a erat vel imperdiet. Quisque lacus diam, viverra et rutrum a, auctor id velit.\n\nVestibulum id mauris est. Vivamus id faucibus augue, varius aliquam ante. Praesent commodo quam est, at aliquam tellus congue vitae. Nunc viverra maximus risus eget accumsan. Duis non ex ut dolor pellentesque vehicula id eget nulla. Fusce sit amet mauris vitae tortor imperdiet lobortis. Nulla facilisi. Aliquam erat volutpat. Pellentesque dignissim massa in dolor volutpat, sit amet gravida justo dapibus. Nam egestas metus eros, non hendrerit turpis fermentum sed. Ut facilisis sit amet justo ut tristique. Curabitur elementum nibh eget tincidunt commodo. Donec gravida tincidunt lectus. Ut feugiat sem non sollicitudin feugiat. Donec ornare libero ut ullamcorper mattis. ','1.jpg','2018-09-14','2018-09-14','dedeirwanto.web.id',1,1,'19'),(2,'Vestibulum aliquam et erat interdum egestas. Morbi id fringilla purus.',' Vestibulum aliquam et erat interdum egestas. Morbi id fringilla purus. Maecenas tincidunt semper justo ac molestie. Aliquam erat volutpat. Vivamus suscipit tempor risus quis maximus. Morbi condimentum libero quis vehicula interdum. Pellentesque ultricies lectus nec lorem condimentum aliquet. Cras tempus neque sit amet est mattis, non maximus ipsum sodales. Sed hendrerit vulputate dictum. Sed mauris tellus, dapibus id feugiat sed, dapibus luctus massa. Maecenas sit amet blandit erat. Nullam tristique eget mauris quis dictum. Pellentesque commodo orci sed urna scelerisque tristique. Vestibulum feugiat orci venenatis volutpat sagittis. Integer dignissim tristique velit consequat dignissim.\n\nPraesent dapibus ultrices lorem, gravida sodales metus euismod ac. Vivamus auctor faucibus turpis, et vulputate libero posuere ut. Vestibulum pulvinar at felis sit amet feugiat. Integer scelerisque velit non magna congue, sed semper eros venenatis. Phasellus urna ante, interdum vel orci eget, dignissim sollicitudin nunc. Donec iaculis sed urna et laoreet. In lacinia ante et orci vulputate pretium. Vestibulum finibus nibh at eros egestas, eu egestas erat sagittis. Morbi tempus turpis eros, sit amet sagittis augue faucibus sit amet. Mauris magna eros, congue id tellus in, sagittis lobortis leo. Curabitur vehicula malesuada lectus. Nam ut fringilla nisl. ','2.jpg','2018-09-13','2018-09-14','dedeirwanto.web.id',1,1,'19'),(3,'Fusce auctor neque quis tortor consequat tristique.','Fusce auctor neque quis tortor consequat tristique. Quisque euismod nibh vehicula, pretium massa eu, commodo libero. Donec tortor nibh, pretium nec feugiat non, malesuada vel ex. Suspendisse et nulla dolor. Curabitur pellentesque vel lacus sit amet molestie. Cras finibus in est et rhoncus. Cras lobortis augue in urna ultrices pretium. Vivamus odio nulla, lobortis vel maximus vitae, bibendum et ex. In hac habitasse platea dictumst. ','3.jpg','2018-09-14','2018-09-14','dedeirwanto.web.id',1,1,'20'),(4,'Naskah Lorem Ipsum standar yang digunakan sejak tahun 1500an','\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"','4.jpg','2018-09-14','2018-09-14','dedeirwanto.web.id',1,1,'20'),(5,'Bagian 1.10.32 dari \"de Finibus Bonorum et Malorum\", ditulis oleh Cicero pada tahun 45 sebelum masehi','\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"','5.jpg','2018-09-14','2018-09-14','dedeirwanto.web.id',1,1,'19'),(6,'Terjemahan tahun 1914 oleh H. Rackham','\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"','6.jpg','2018-09-14','2018-09-18','dedeirwanto.web.id',1,1,'20'),(7,'Bagian 1.10.33 dari \"de Finibus Bonorum et Malorum\", ditulis oleh Cicero pada tahun 45 sebelum masehi','\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"','7.jpg','2018-09-14','2018-09-14','dedeirwanto.web.id',1,1,'19'),(8,'Terjemahan tahun 1914 oleh H. Rackham','\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"','8.jpg','2018-09-14','2018-09-14','dedeirwanto.web.id',1,1,'20'),(9,'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...',' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ut dui velit. Phasellus dictum risus eu dolor vestibulum ornare. Duis ut sem mauris. Aliquam elementum magna nec urna egestas viverra. Mauris nec varius nisl, ut fringilla arcu. Pellentesque ultrices egestas nibh non maximus. Fusce non velit ut massa molestie pulvinar in eu arcu. Proin a lacinia libero. Vestibulum suscipit ante mattis, finibus nibh sed, laoreet erat. Nam dignissim a erat vel imperdiet. Quisque lacus diam, viverra et rutrum a, auctor id velit.\n\nVestibulum id mauris est. Vivamus id faucibus augue, varius aliquam ante. Praesent commodo quam est, at aliquam tellus congue vitae. Nunc viverra maximus risus eget accumsan. Duis non ex ut dolor pellentesque vehicula id eget nulla. Fusce sit amet mauris vitae tortor imperdiet lobortis. Nulla facilisi. Aliquam erat volutpat. Pellentesque dignissim massa in dolor volutpat, sit amet gravida justo dapibus. Nam egestas metus eros, non hendrerit turpis fermentum sed. Ut facilisis sit amet justo ut tristique. Curabitur elementum nibh eget tincidunt commodo. Donec gravida tincidunt lectus. Ut feugiat sem non sollicitudin feugiat. Donec ornare libero ut ullamcorper mattis. ','1.jpg',NULL,NULL,NULL,1,1,'19');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL DEFAULT '0',
  `nama_lengkap` varchar(100) NOT NULL,
  `username` varchar(30) CHARACTER SET latin1 NOT NULL,
  `email` varchar(100) CHARACTER SET latin1 NOT NULL,
  `password` varchar(100) CHARACTER SET latin1 NOT NULL,
  `level` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (19,'Dede Irwanto','dea','id.dedeirwanto@gmail.com','$2y$10$p0ezumgdRlB6ahFChgP5NOAvbBkvu5Il82rxbHLERytl2xhHDRjrq',0),(20,'Eka Potabuga','ekha','ekha_potabuga@rocketmail.com','$2y$10$x9Tv9g46sItpJeAL/JMemu.T9UVE3M2yWHjEHOOyKebh8RCFFEMQS',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-25 22:22:26
