-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (x86_64)
--
-- Host: 10.64.16.16    Database: vewiki
-- ------------------------------------------------------
-- Server version	5.5.5-10.0.22-MariaDB-log

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
-- Table structure for table `redirect`
--

DROP TABLE IF EXISTS `redirect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `redirect` (
  `rd_from` int(8) unsigned NOT NULL DEFAULT '0',
  `rd_namespace` int(11) NOT NULL DEFAULT '0',
  `rd_title` varbinary(255) NOT NULL DEFAULT '',
  `rd_interwiki` varbinary(32) DEFAULT NULL,
  `rd_fragment` varbinary(255) DEFAULT NULL,
  PRIMARY KEY (`rd_from`),
  KEY `rd_ns_title` (`rd_namespace`,`rd_title`,`rd_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redirect`
--

/*!40000 ALTER TABLE `redirect` DISABLE KEYS */;
INSERT INTO `redirect` VALUES (1397,5,'Community_Portal','',''),(1837,2,'Rémih','',''),(1878,0,'User_talk:Az1568','m',''),(1891,0,'Yunivesithi_ya_Venḓa','',''),(1966,4,'Community_Portal','',''),(1967,0,'Hayani','',''),(1968,0,'User:CommonsDelinker','m',''),(1971,0,'Yunivesithi_dza_Afurika_Tshipembe','',''),(1987,0,'Yunivesithi_ya_Witwatersrand','',''),(1988,0,'Yunivesithi_ya_Afurika_Tshipembe','',''),(1989,0,'Yunivesithi_ya_Pretoria','',''),(1990,0,'Yunivesithi_ya_Limpopo','',''),(1991,0,'Yunivesithi_ya_Johannesburg','',''),(1998,0,'Privacy_policy','foundation',''),(1999,0,'Help:Contents','meta',''),(2000,0,'Fundraising','foundation',''),(2001,0,'Wikipedia:General_disclaimer','w',''),(2029,3,'Multichill','',''),(2098,0,'Enginiari_(Engineering)','',''),(2132,0,'Medmaacher_Klaaf:Purodha','ksh',''),(2147,0,'TshiVenḓa','',''),(2148,0,'Yunivesithi_ya_Venḓa','',''),(2149,1,'Yunivesithi_ya_Venḓa','',''),(2150,0,'Nḓou','',''),(2151,0,'Thohoyanḓou','',''),(2152,0,'Ḓorobo_dza_Limpopo','',''),(2153,0,'Luṱavula','',''),(2154,0,'Miṱupo','',''),(2155,0,'Muṱuku_na_delele','',''),(2156,0,'Tshwane_Yunivesithi_ya_Thekhenoḽodzhi','',''),(2157,0,'U_tamba_vhuṱuka','',''),(2158,0,'Vhuvhusahoṱhe_ho_vhofholowaho','',''),(2171,0,'User:Brunoy_Anastasiya_Seryozhenko','m',''),(2176,3,'SpBot','',''),(2194,2,'WikiDreamer','',''),(2197,2,'WikiDreamer','',''),(2224,0,'Phalaphala_FM','',''),(2228,3,'とある白い猫','',''),(2270,2,'WikimediaNotifier','',''),(2306,0,'User:Julian_Mendez','en',''),(2307,0,'User_talk:Julian_Mendez','en',''),(2309,0,'User_talk:Synthebot','en',''),(2325,2,'WikimediaNotifier/notifications','',''),(2345,5,'Community_Portal','',''),(2358,0,'Käyttäjä:Kallerna','fi',''),(2411,0,'Polokwane_(Pietersburg)','',''),(2417,0,'Musina_(Messina)','',''),(2420,0,'Afurika_Tshipembe','',''),(2421,0,'Afurika_Tshipembe','',''),(2425,0,'Zimbagwe','',''),(2461,0,'Modimolle_(Nylstroom)','',''),(2462,0,'Musina_(Messina)','',''),(2463,0,'Polokwane_(Pietersburg)','',''),(2464,0,'Modimolle_(Nylstroom)','',''),(2465,0,'Modimolle_(Nylstroom)','',''),(2550,2,'BOTijo','',''),(2687,3,'Tjmoel','',''),(2688,3,'Tjmoel','',''),(2694,0,'Naledzi_nga_TshiVenḓa','',''),(2704,0,'Ṱhanu_na_nthihi','',''),(2716,0,'Aḽibetrosi','',''),(2720,0,'Muunga','',''),(2722,0,'Apula','',''),(2724,0,'Apuḽikoso','',''),(2819,3,'Wikitanvir','',''),(2901,3,'Crochet.david','',''),(2911,0,'User:ZipoBibrok5x10^8','en',''),(2912,0,'User:ZipoBibrok5x10^8','en',''),(2917,2,'とある白い猫','',''),(2918,3,'とある白い猫','',''),(2966,3,'Caypartis','',''),(2976,2,'Der_Buckesfelder','',''),(2977,3,'Der_Buckesfelder','',''),(3096,2,'Vogone','',''),(3127,0,'Đồng_Hới','',''),(3169,0,'User:DeltaQuad','m',''),(3170,0,'User_talk:DeltaQuad','m',''),(3172,0,'User_talk:محمد_شعیب','ur',''),(3174,0,'User_talk:محمد_شعیب','ur',''),(3191,3,'Addshore','',''),(3237,0,'Dzingoma','',''),(3256,0,'Venḓa','',''),(3271,10,'Ṅwaha_wa','',''),(3294,0,'Usuario_Discusión:Kizar','es',''),(3369,3,'Wim_b','',''),(3372,0,'User:Liuxinyu970226','d',''),(3426,10,'Softredirect','',''),(3458,2,'Rxy','',''),(3460,4,'Community_Portal','',''),(3481,2,'Jalexander-WMF','',''),(3514,2,'-revi','',''),(3515,3,'-revi','',''),(3516,2,'-revi','',''),(3517,3,'-revi','',''),(3531,2,'Allan_Aguilar','',''),(3532,3,'Allan_Aguilar','',''),(3540,3,'Sir_Lestaty_de_Lioncourt','',''),(3541,3,'Sir_Lestaty_de_Lioncourt','',''),(3545,2,'*SM*','',''),(3546,3,'*SM*','',''),(3548,0,'User_talk:Unapersona','m',''),(3555,2,'Caliburn','',''),(3556,3,'Caliburn','',''),(3558,2,'Diego_Grez-Cañete','',''),(3624,0,'VisualEditor/Portal','mw',''),(3629,2,'Azariv-WMF','',''),(3636,0,'Mahikeng','',''),(3639,2,'Diego_Grez-Cañete','',''),(3640,3,'Diego_Grez-Cañete','',''),(3642,3,'Avicennasis','',''),(3697,2,'Razr_Nation/common.css','',''),(3698,2,'Razr_Nation/common.js','',''),(3699,2,'Razr_Nation','','');
/*!40000 ALTER TABLE `redirect` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-12  6:54:43
