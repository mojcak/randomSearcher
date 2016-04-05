-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (x86_64)
--
-- Host: 10.64.16.16    Database: krwiki
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
INSERT INTO `pagelinks` VALUES (1569,2,'217.83.90.198',1),(1569,2,'A12n',1),(1569,2,'Jorge_Taveras',1),(1569,2,'Pill',1),(1558,0,'1986',2),(2076,0,'2006年バスケットボール世界選手権',2),(2067,0,'Bratislava',2),(2076,0,'Chicago_Bears',2),(1558,0,'Computer_science',2),(1451,0,'Evrensel_kod',2),(2076,0,'Ewe:User:Tiyoringo',2),(1558,0,'January_6',2),(2076,0,'Jリーグ',2),(1558,0,'Mathematics',2),(2076,0,'NBA',2),(2076,0,'NFL',2),(1558,0,'Netherlands',2),(1558,0,'Nieuwegein',2),(2076,0,'Roa-tar:User:Tiyoringo',2),(2067,0,'Ru-sib:User:Kelovy',2),(2126,0,'Ru-sib:User:ReyBrujo/Dumps',2),(2076,0,'Ru-sib:User:Tiyoringo',2),(2067,0,'Slovakia',2),(2076,0,'Tlh:User:Tiyoringo',2),(924,0,'Tlh:lo\'wI:RCBot',2),(1558,0,'Utrecht_University',2),(1451,0,'Özel:Allpages',2),(2076,0,'さいたまスーパーアリーナ',2),(2076,0,'アメリカ',2),(2076,0,'アルゼンチン',2),(2076,0,'アンゴラ',2),(2076,0,'ギリシャ',2),(2076,0,'ジェフ千葉',2),(2076,0,'スペイン',2),(2076,0,'タオル',2),(2076,0,'トルコ',2),(2076,0,'ドイツ',2),(2076,0,'ナイジェリア',2),(2076,0,'ニュージーランド',2),(2076,0,'バツマル',2),(2076,0,'フランス',2),(2076,0,'マフラー',2),(2076,0,'リトアニア',2),(2076,0,'中国',2),(2076,0,'利用者:Tiyoringo/立ち上げ記事',2),(2076,0,'北海道',2),(2076,0,'古河電工',2),(2076,0,'携帯ストラップ',2),(2076,0,'札幌',2),(2076,0,'画像:20060903_2157~001.jpg',2),(928,2,'H-Genten',2),(1811,2,'Pill/monobook.js',2),(924,2,'RCBot',2),(2125,2,'ReyBrujo/Dumps',2),(2126,2,'ReyBrujo/Dumps/20070213',2),(2141,2,'ReyBrujo/Dumps/20070213',2),(2126,2,'ReyBrujo/Dumps/20070227',2),(2141,2,'ReyBrujo/Dumps/20070227',2),(2126,2,'ReyBrujo/Dumps/20070406',2),(2141,2,'ReyBrujo/Dumps/20070406',2),(2126,2,'ReyBrujo/Dumps/20070419',2),(2141,2,'ReyBrujo/Dumps/20070419',2),(2159,3,'DerHexer',2),(1811,3,'Pill',2),(2076,4,'Babel',2),(2125,10,'Babel',2),(1696,10,'Babel-3',2),(1486,10,'Babel-4',2),(1934,10,'Babel-5',2),(2076,10,'User_BirthdayYear',2),(2076,10,'User_Google',2),(2076,10,'User_Hutu',2),(2076,10,'User_Yahoo!_JAPAN',2),(2076,10,'User_ar-0',2),(2076,10,'User_browser:Microsoft_Internet_Explorer',2),(2076,10,'User_de-1',2),(1408,10,'User_en-1',2),(2076,10,'User_en-2',2),(2076,10,'User_es-0',2),(2076,10,'User_fr-0',2),(2076,10,'User_inclusionist',2),(2076,10,'User_it-0',2),(1408,10,'User_ja',2),(2076,10,'User_ja',2),(1408,10,'User_kr-0',2),(2076,10,'User_kr-0',2),(2076,10,'User_nl-0',2),(2076,10,'User_pt-0',2),(2076,10,'User_ru-0',2),(2076,10,'User_simple-2',2),(2076,10,'User_windows',2),(2076,10,'User_zh-1',2),(2076,10,'User_歴検_2級世界史',2),(2016,0,'Hakkiwa_Adamganabe',3),(2035,2,'217.233.205.76',3),(1565,2,'66.154.184.34',3),(2120,2,'Az1568',3),(1555,2,'Dcljr',3),(1697,2,'Diamond',3),(2016,2,'Johannes_Rohr',3),(2035,2,'Johannes_Rohr',3),(1814,2,'Pill',3),(3,2,'Suisui',3),(1566,3,'82.94.28.186',3),(2156,4,'Babel',3),(2166,4,'Babel',3),(2156,14,'Babel_-_Users_by_language',3),(2166,14,'Babel_-_Users_by_language',3),(2061,0,'Jesus_is_awesome!',4),(2061,0,'W/index.php',4),(2061,0,'W/w/index.php',4),(2061,1,'Main_Page/',4),(2061,1,'Main_Page/index.php',4),(2061,1,'W/index.php',4),(2061,1,'W/w/index.php',4),(2134,4,'Protected_titles',4),(2061,9,'Ipb_already_blocked/w/w/index.php',4),(2061,9,'Ipb_cant_unblock',4),(2061,9,'Ipb_expiry_invalid/w/index.php',4),(2061,9,'Protect-level-autoconfirmed/w/index.php',4),(2061,10,'COCK',4),(2242,2,'Example',10),(2249,11,'Archive_for_converted_wikitext_talk_page',10),(1793,11,'Delete',10);
/*!40000 ALTER TABLE `pagelinks` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-12  5:50:45
