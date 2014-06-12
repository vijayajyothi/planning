-- MySQL dump 10.13  Distrib 5.6.17, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: opsgps_development
-- ------------------------------------------------------
-- Server version	5.6.17-0ubuntu0.14.04.1

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
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20140529114610'),('20140602042031'),('20140604052342'),('20140605073426');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_digest` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_reset_sent_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'jyothi','$2a$10$HBSc1OeaYPKueuroxfddh.EnxzGi7zbfCPvpr0HckIrWF.RcReIt2','7S6tkYW8cgGksgA_zN7dlg',NULL,NULL,'2014-06-02 04:38:53','2014-06-02 04:38:53'),(2,'one','$2a$10$JtrtTFWrXQgRqrPri3Pj7.0JTXEmeaJj.zg.DSWq/xpWQE7nV5xo.','2J-SOX_Te3U8ntvE7aq2Sw',NULL,NULL,'2014-06-02 05:10:29','2014-06-02 05:10:29'),(3,'second','$2a$10$2NItuhmxz7jpecT52Tzb1ueaSbtZfvo4eC0E1XK3seiFyywv.CA32','UH7756u6k2UvOgZ7lmzNNw',NULL,NULL,'2014-06-03 06:24:47','2014-06-03 06:24:47'),(4,'abc','$2a$10$ieCEvlv9xFUfOs6Rc2/jeeKI1NhWys728yRwUrKW5BQftaFlLid3.','oX-jJLtOHWjcrLBX5J8fsA',NULL,NULL,'2014-06-03 06:27:44','2014-06-03 06:27:44');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vms`
--

DROP TABLE IF EXISTS `vms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datacenter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qtynics` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdby` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdtime` datetime DEFAULT NULL,
  `suspendinterval` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `suspendtime` datetime DEFAULT NULL,
  `boottime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `storageuncommitted` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `storagecommitted` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ipaddress` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hostname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `toolsrunningstatus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `toolsversion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `toolstatus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `guestfullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usedspacegb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provisionedspacegb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `memorymb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `numcpu` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gueststate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `connectionstate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `powerstate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `application` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persistentid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vmname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vmhost` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `folder` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reourcepool` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cluster` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vcserver` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `ops_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vms`
--

LOCK TABLES `vms` WRITE;
/*!40000 ALTER TABLE `vms` DISABLE KEYS */;
INSERT INTO `vms` VALUES (8,'vCloudCompute01','1',NULL,NULL,'0',NULL,NULL,'0','23674578580','10.119.55.241','dev-dhcp','guestToolsRunning','8295','toolsOld','Microsoft Windows Server 2008 R2 (64-bit)','22.04867','22.04867','2048','1','v7','Running','connected','PoweredOn',NULL,'50346e0f-039a-c3fa-4e05-f9d713334226','dev-dhcp','sc9-vf-dev1-07.vmware.com',NULL,NULL,NULL,'vf-vcd-vc-01.vmware.com','2014-06-05 07:47:14','2014-06-06 11:20:17','Present'),(9,'vCloudCompute01','1',NULL,NULL,'0',NULL,NULL,'0','23623916510','10.119.39.241','stage-dhcp','guestToolsRunning','8295','toolsOk','Microsoft Windows Server 2008 R2 (64-bit)','22.00149','22.00149','2048','1','v7','Running','connected','PoweredOn',NULL,'50263b2a-dbc2-ffc7-d1ab-45df08cbdf2d','stage-dhcp','sc9-vf-prod1-02.vmware.com',NULL,NULL,NULL,'vf-vcd-vc-01.vmware.com','2014-06-05 07:47:14','2014-06-06 11:20:17','Present'),(10,'vCloudCompute01','1',NULL,NULL,'0',NULL,NULL,'0','23674579244','10.119.47.241','test-dhcp','guestToolsRunning','8295','toolsOld','Microsoft Windows Server 2008 R2 (64-bit)','22.04867','22.04867','2048','1','v7','Running','connected','PoweredOn',NULL,'5026492b-1653-7221-86ca-c3154c9d2c86','test-dhcp','sc9-vf-dev1-06.vmware.com',NULL,NULL,NULL,'vf-vcd-vc-01.vmware.com','2014-06-05 07:47:14','2014-06-06 11:20:17','Present'),(11,'vCloudCompute01','1',NULL,NULL,'0',NULL,NULL,'0','23675074365','10.119.31.241','prod-dhcp','guestToolsRunning','8295','toolsOld','Microsoft Windows Server 2008 R2 (64-bit)','22.04913','22.04913','2048','1','v7','Running','connected','PoweredOn',NULL,'50265041-b544-a80f-5a98-8fa144c4f108','prod-dhcp','sc9-vf-prod1-06.vmware.com',NULL,NULL,NULL,'vf-vcd-vc-01.vmware.com','2014-06-05 07:47:14','2014-06-06 11:20:17','Present'),(12,'vCloudCompute01','1',NULL,NULL,'0',NULL,NULL,'431030272','75267563822',NULL,NULL,'guestToolsNotRunning','8295','toolsNotRunning','Microsoft Windows Server 2003 (32-bit)','70.09838','70.49981','4096','2','v7','NotRunning','connected','PoweredOff',NULL,'50260392-584d-13a7-a757-a5d2443221f8','2044772698-obit-test2','sc9-vf-cat1-02.vmware.com',NULL,NULL,NULL,'vf-vcd-vc-01.vmware.com','2014-06-05 07:47:14','2014-06-06 11:20:18','Present'),(13,'vCloudCompute01','1',NULL,NULL,'0',NULL,'1/25/2012 5:53:15 AM','0','8474111998','10.119.49.53','db-demo1010','guestToolsRunning','8295','toolsOld','Oracle Linux 4/5/6 (64-bit)','7.892132','7.892132','2048','1','v7','Running','connected','PoweredOn',NULL,'5026c633-83f5-587c-298b-1e773c7faf90','db-demo1010 (34da5c5c-3a17-40d2-a025-3af0cb58f47a)','sc9-vf-cat1-02.vmware.com',NULL,NULL,NULL,'vf-vcd-vc-01.vmware.com','2014-06-05 07:47:14','2014-06-06 11:20:17','Present'),(14,'vCloudCompute01','1',NULL,NULL,'0',NULL,NULL,'0','6758503365','10.119.2.25','casemgmt-001','guestToolsRunning','8195','toolsOld','Other 2.6.x Linux (32-bit)','6.294347','6.294347','256','1','v4','Running','connected','PoweredOn',NULL,'50267558-888b-f0de-990f-635df58973af','0463101773-casemgmt-001','sc9-vf-cat1-02.vmware.com',NULL,NULL,NULL,'vf-vcd-vc-01.vmware.com','2014-06-06 11:20:18','2014-06-06 11:20:18','New'),(15,'vCloudCompute01','1',NULL,NULL,'0',NULL,NULL,'0','6758546475','10.119.2.21','ConfigvApp','guestToolsRunning','8195','toolsOld','Other 2.6.x Linux (32-bit)','6.294387','6.294387','256','1','v4','Running','connected','PoweredOn',NULL,'5026b10b-d648-22f2-0ce4-27c650538a1f','0016866373-ConfigvApp','sc9-vf-cat1-02.vmware.com',NULL,NULL,NULL,'vf-vcd-vc-01.vmware.com','2014-06-06 11:20:18','2014-06-06 11:20:18','New'),(16,'vCloudCompute01','1',NULL,NULL,'0',NULL,NULL,'63740837888','80561596402','10.119.2.22','db-mgmt-d1','guestToolsRunning','8295','toolsOld','Oracle Linux 4/5/6 (64-bit)','75.02883','134.3921','2048','1','v7','Running','connected','PoweredOn',NULL,'50268274-f9fd-5699-91b1-ca336e627df3','1649459303-db-mgmt-d1','sc9-vf-cat1-02.vmware.com',NULL,NULL,NULL,'vf-vcd-vc-01.vmware.com','2014-06-06 11:20:18','2014-06-06 11:20:18','New');
/*!40000 ALTER TABLE `vms` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-06-11  2:07:47
