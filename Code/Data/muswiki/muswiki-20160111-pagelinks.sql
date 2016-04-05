-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (x86_64)
--
-- Host: 10.64.16.16    Database: muswiki
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
-- Table structure for table `pagelinks`
--

DROP TABLE IF EXISTS `pagelinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagelinks` (
  `pl_from` int(8) unsigned NOT NULL DEFAULT '0',
  `pl_namespace` int(11) NOT NULL DEFAULT '0',
  `pl_title` varbinary(255) NOT NULL DEFAULT '',
  `pl_from_namespace` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `pl_from` (`pl_from`,`pl_namespace`,`pl_title`),
  KEY `pl_namespace` (`pl_namespace`,`pl_title`,`pl_from`),
  KEY `pl_backlinks_namespace` (`pl_from_namespace`,`pl_namespace`,`pl_title`,`pl_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagelinks`
--

/*!40000 ALTER TABLE `pagelinks` DISABLE KEYS */;
INSERT INTO `pagelinks` VALUES (1397,0,'Aha',0),(1397,0,'Alabamu',0),(1397,0,'Apalachee',0),(1397,0,'Apalachicola',0),(1397,0,'Chickasaw',0),(1397,0,'Choctaw',0),(1397,0,'Coko',0),(1397,0,'Creek',0),(1397,0,'Cuko',0),(1397,0,'Efv',0),(1397,0,'Eto',0),(1397,0,'Etvlkē',0),(1397,0,'Geografia',0),(1397,0,'Hitchiti',0),(1397,0,'Koasati',0),(1397,0,'Mikasuki',0),(1397,0,'Mobilian',0),(1397,0,'Mvskoke_em_Hake',0),(1397,0,'Nakcokv_Lvlunkv',0),(1397,0,'Ohliketv',0),(1397,0,'Pato',0),(1397,0,'Patu',0),(1397,0,'Pvtu',0),(1397,0,'Seminole',0),(1397,0,'Vce',0),(1397,0,'Yvt_Nakcokv_En_Vnickv',0),(1397,0,'‘to',0),(1813,0,'2006年バスケットボール世界選手権',2),(1828,0,'Bratislava',2),(1813,0,'Chicago_Bears',2),(1444,0,'Evrensel_kod',2),(1813,0,'Ewe:User:Tiyoringo',2),(1813,0,'Jリーグ',2),(1830,0,'Main_Page',2),(1831,0,'Main_Page',2),(1843,0,'Main_Page',2),(1844,0,'Main_Page',2),(1845,0,'Main_Page',2),(1846,0,'Main_Page',2),(1813,0,'NBA',2),(1813,0,'NFL',2),(1813,0,'Roa-tar:User:Tiyoringo',2),(1838,0,'Ru-sib:User:Escarbot',2),(1827,0,'Ru-sib:User:JAnDbot',2),(1828,0,'Ru-sib:User:Kelovy',2),(1830,0,'Ru-sib:User:ReyBrujo/Dumps',2),(1813,0,'Ru-sib:User:Tiyoringo',2),(1836,0,'Ru-sib:User:Vargenau',2),(1828,0,'Slovakia',2),(1813,0,'Tlh:User:Tiyoringo',2),(919,0,'Tlh:lo\'wI:RCBot',2),(1830,0,'W/w/index.php',2),(1831,0,'W/w/index.php',2),(1843,0,'W/w/index.php',2),(1844,0,'W/w/index.php',2),(1845,0,'W/w/index.php',2),(1846,0,'W/w/index.php',2),(1444,0,'Özel:Allpages',2),(1813,0,'さいたまスーパーアリーナ',2),(1813,0,'アメリカ',2),(1813,0,'アルゼンチン',2),(1813,0,'アンゴラ',2),(1813,0,'ギリシャ',2),(1813,0,'ジェフ千葉',2),(1813,0,'スペイン',2),(1813,0,'タオル',2),(1813,0,'トルコ',2),(1813,0,'ドイツ',2),(1813,0,'ナイジェリア',2),(1813,0,'ニュージーランド',2),(1813,0,'バツマル',2),(1813,0,'フランス',2),(1813,0,'マフラー',2),(1813,0,'リトアニア',2),(1813,0,'中国',2),(1813,0,'利用者:Tiyoringo/立ち上げ記事',2),(1813,0,'北海道',2),(1813,0,'古河電工',2),(1813,0,'携帯ストラップ',2),(1813,0,'札幌',2),(1813,0,'画像:20060903_2157~001.jpg',2),(1830,1,'Main_Page/',2),(1831,1,'Main_Page/',2),(1843,1,'Main_Page/',2),(1844,1,'Main_Page/',2),(1845,1,'Main_Page/',2),(1846,1,'Main_Page/',2),(1848,2,'Andre_Engels',2),(1750,2,'Pill/monobook.js',2),(919,2,'RCBot',2),(1829,2,'ReyBrujo/Dumps',2),(1830,2,'ReyBrujo/Dumps/20070213',2),(1842,2,'ReyBrujo/Dumps/20070213',2),(1830,2,'ReyBrujo/Dumps/20070228',2),(1842,2,'ReyBrujo/Dumps/20070228',2),(1830,2,'ReyBrujo/Dumps/20070406',2),(1842,2,'ReyBrujo/Dumps/20070406',2),(1830,2,'ReyBrujo/Dumps/20070420',2),(1842,2,'ReyBrujo/Dumps/20070420',2),(1856,3,'DerHexer',2),(1750,3,'Pill',2),(1813,4,'Babel',2),(1829,10,'Babel',2),(1480,10,'Babel-4',2),(1814,10,'Babel-5',2),(1813,10,'User_BirthdayYear',2),(1840,10,'User_FA',2),(1813,10,'User_Google',2),(1813,10,'User_Hutu',2),(1813,10,'User_Yahoo!_JAPAN',2),(1813,10,'User_browser:Microsoft_Internet_Explorer',2),(1840,10,'User_da-1',2),(1813,10,'User_de-1',2),(1840,10,'User_dvrk2',2),(1834,10,'User_en',2),(1840,10,'User_en',2),(1401,10,'User_en-1',2),(1813,10,'User_en-2',2),(1840,10,'User_eo-2',2),(1813,10,'User_es-0',2),(1840,10,'User_et-1',2),(1813,10,'User_fr-0',2),(1840,10,'User_fr-2',2),(1840,10,'User_ia-2',2),(1813,10,'User_inclusionist',2),(1840,10,'User_io-3',2),(1813,10,'User_it-0',2),(1401,10,'User_ja',2),(1813,10,'User_ja',2),(1840,10,'User_ja-4',2),(1840,10,'User_ko-3',2),(1401,10,'User_mus-0',2),(1834,10,'User_mus-0',2),(1813,10,'User_nl-0',2),(1840,10,'User_no-2',2),(1840,10,'User_percussion-3',2),(1813,10,'User_pt-0',2),(1813,10,'User_ru-0',2),(1813,10,'User_simple-2',2),(1840,10,'User_sv-1',2),(1813,10,'User_windows',2),(1813,10,'User_zh-1',2),(1840,10,'User_zh-2',2),(1813,10,'User_歴検_2級世界史',2),(1552,0,'Poland',3),(1553,0,'Poland',3),(1752,2,'Angela',3),(1549,2,'Dcljr',3),(1466,2,'Yagan',3),(1854,4,'Babel',3),(1862,4,'Babel',3),(1854,14,'Babel_-_Users_by_language',3),(1862,14,'Babel_-_Users_by_language',3),(1894,2,'Example',10),(1557,4,'Speedy_deletions',10),(1901,11,'Archive_for_converted_wikitext_talk_page',10),(1399,0,'Catë',14),(1399,0,'Hvtkë',14),(1399,0,'Lanë',14),(1399,0,'Lvstë',14);
/*!40000 ALTER TABLE `pagelinks` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-12  6:48:21
