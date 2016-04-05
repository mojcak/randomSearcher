-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (x86_64)
--
-- Host: 10.64.16.16    Database: hzwiki
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
INSERT INTO `pagelinks` VALUES (1831,0,'2006年バスケットボール世界選手権',2),(1897,0,'Bratislava',2),(1831,0,'Chicago_Bears',2),(1441,0,'Evrensel_kod',2),(1831,0,'Ewe:User:Tiyoringo',2),(1831,0,'Jリーグ',2),(1831,0,'NBA',2),(1831,0,'NFL',2),(1831,0,'Roa-tar:User:Tiyoringo',2),(2101,0,'Ru-sib:User:BotMultichill',2),(1962,0,'Ru-sib:User:Escarbot',2),(1978,0,'Ru-sib:User:JAnDbot',2),(2102,0,'Ru-sib:User:Multichill',2),(1991,0,'Ru-sib:User:Purodha',2),(1974,0,'Ru-sib:User:ReyBrujo/Dumps',2),(1831,0,'Ru-sib:User:Tiyoringo',2),(1960,0,'Ru-sib:User:Vargenau',2),(1897,0,'Slovakia',2),(1991,0,'Tlh:User:Purodha',2),(1831,0,'Tlh:User:Tiyoringo',2),(919,0,'Tlh:lo\'wI:RCBot',2),(1991,0,'Tv_:User:Purodha',2),(2102,0,'Wikimedia_Commons',2),(1441,0,'Özel:Allpages',2),(1831,0,'さいたまスーパーアリーナ',2),(1831,0,'アメリカ',2),(1831,0,'アルゼンチン',2),(1831,0,'アンゴラ',2),(1831,0,'ギリシャ',2),(1831,0,'ジェフ千葉',2),(1831,0,'スペイン',2),(1831,0,'タオル',2),(1831,0,'トルコ',2),(1831,0,'ドイツ',2),(1831,0,'ナイジェリア',2),(1831,0,'ニュージーランド',2),(1831,0,'バツマル',2),(1831,0,'フランス',2),(1831,0,'マフラー',2),(1831,0,'リトアニア',2),(1831,0,'中国',2),(1831,0,'利用者:Tiyoringo/立ち上げ記事',2),(1831,0,'北海道',2),(1831,0,'古河電工',2),(1831,0,'携帯ストラップ',2),(1831,0,'札幌',2),(1831,0,'画像:20060903_2157~001.jpg',2),(1974,1,'Main_Page/',2),(1996,1,'Main_Page/',2),(2000,2,'A._B.',2),(1958,2,'Andre_Engels',2),(2102,2,'BotMultichill',2),(2052,2,'Byrial',2),(2120,2,'Diego_Grez',2),(2164,2,'Diego_Grez-Cañete',2),(2101,2,'Multichill',2),(1812,2,'Pill/monobook.js',2),(919,2,'RCBot',2),(1973,2,'ReyBrujo/Dumps',2),(1974,2,'ReyBrujo/Dumps/20070209',2),(1981,2,'ReyBrujo/Dumps/20070209',2),(1974,2,'ReyBrujo/Dumps/20070224',2),(1981,2,'ReyBrujo/Dumps/20070224',2),(1974,2,'ReyBrujo/Dumps/20070328',2),(1981,2,'ReyBrujo/Dumps/20070328',2),(1974,2,'ReyBrujo/Dumps/20070405',2),(1981,2,'ReyBrujo/Dumps/20070405',2),(1974,2,'ReyBrujo/Dumps/20070417',2),(1981,2,'ReyBrujo/Dumps/20070417',2),(2108,3,'DerHexer',2),(1812,3,'Pill',2),(1663,4,'Babel',2),(1806,4,'Babel',2),(1831,4,'Babel',2),(1973,4,'Babel',2),(1991,4,'Babel',2),(2051,4,'Babel',2),(2056,4,'Babel',2),(2102,4,'Babel',2),(2102,4,'Bot',2),(1444,10,'Babel-4',2),(2057,10,'Bot',2),(1991,10,'Transl-6',2),(1831,10,'User_BirthdayYear',2),(1831,10,'User_Google',2),(1831,10,'User_Hutu',2),(1831,10,'User_Yahoo!_JAPAN',2),(1991,10,'User_af-1',2),(2056,10,'User_af-1',2),(1991,10,'User_als-1',2),(1991,10,'User_bar-1',2),(1831,10,'User_browser:Microsoft_Internet_Explorer',2),(2051,10,'User_da',2),(1991,10,'User_de',2),(1831,10,'User_de-1',2),(2051,10,'User_de-1',2),(2056,10,'User_de-1',2),(2102,10,'User_de-1',2),(1663,10,'User_de-2',2),(1806,10,'User_de-2',2),(1398,10,'User_en-1',2),(1831,10,'User_en-2',2),(2051,10,'User_en-2',2),(1973,10,'User_en-4',2),(2051,10,'User_eo-3',2),(1663,10,'User_es',2),(1806,10,'User_es',2),(1973,10,'User_es',2),(1831,10,'User_es-0',2),(1831,10,'User_fr-0',2),(1806,10,'User_fr-1',2),(2056,10,'User_fr-1',2),(2102,10,'User_fr-1',2),(1663,10,'User_fr-3',2),(1991,10,'User_gsw-1',2),(1398,10,'User_hz-0',2),(1663,10,'User_hz-0',2),(1806,10,'User_hz-0',2),(1973,10,'User_hz-0',2),(1991,10,'User_hz-0',2),(2051,10,'User_hz-0',2),(2056,10,'User_hz-0',2),(2102,10,'User_hz-0',2),(1831,10,'User_inclusionist',2),(1831,10,'User_it-0',2),(1398,10,'User_ja',2),(1831,10,'User_ja',2),(1973,10,'User_ja-1',2),(1991,10,'User_ksh',2),(2056,10,'User_la-1',2),(1991,10,'User_la-2',2),(1991,10,'User_lb-1',2),(1991,10,'User_li-1',2),(1991,10,'User_nds-1',2),(1991,10,'User_nds-nl-1',2),(2056,10,'User_nl',2),(2102,10,'User_nl',2),(1831,10,'User_nl-0',2),(1991,10,'User_nl-1',2),(2051,10,'User_no-2',2),(1991,10,'User_pdc-1',2),(1991,10,'User_pfl-1',2),(1831,10,'User_pt-0',2),(1831,10,'User_ru-0',2),(1991,10,'User_ru-1',2),(1831,10,'User_simple-2',2),(2051,10,'User_sv-1',2),(1991,10,'User_sxu-1',2),(1831,10,'User_windows',2),(1831,10,'User_zh-1',2),(1831,10,'User_歴検_2級世界史',2),(1663,14,'User_en',2),(1806,14,'User_en',2),(1991,14,'User_en',2),(2056,14,'User_en',2),(2102,14,'User_en',2),(1663,14,'User_en-3',2),(1806,14,'User_en-3',2),(1991,14,'User_en-3',2),(2056,14,'User_en-3',2),(2102,14,'User_en-3',2),(1663,14,'Users_by_language',2),(1806,14,'Users_by_language',2),(1973,14,'Users_by_language',2),(1991,14,'Users_by_language',2),(2051,14,'Users_by_language',2),(2056,14,'Users_by_language',2),(2102,14,'Users_by_language',2),(1882,0,'Main_Page',3),(1817,2,'80.104.88.167',3),(1948,2,'A._B.',3),(1999,2,'A._B.',3),(2001,2,'A._B.',3),(1882,2,'Az1568',3),(1899,2,'Az1568',3),(1863,2,'Bastique',3),(1817,2,'Blockinblox',3),(1817,2,'Dario_vet',3),(1512,2,'Dcljr',3),(1898,2,'Johannes_Rohr',3),(1948,2,'Johannes_Rohr',3),(1948,2,'Kanon6917',3),(2045,2,'MF-Warburg',3),(1805,2,'Pill',3),(1817,2,'Pill',3),(2165,3,'Diego_Grez-Cañete',3),(2104,3,'Multichill',3),(2106,4,'Babel',3),(2114,4,'Babel',3),(2106,14,'Babel_-_Users_by_language',3),(2114,14,'Babel_-_Users_by_language',3),(1869,0,'Connie_Francis',4),(1869,0,'Index.php',4),(1869,0,'W/index.php',4),(1869,0,'W/w/index.php',4),(1869,1,'W/index.php',4),(1869,1,'W/w/index.php',4),(1869,1,'W/w/w/index.php',4),(1979,4,'Protected_titles',4),(1869,9,'Ipb_already_blocked',4),(1869,9,'Ipb_cant_unblock/w/index.php',4),(1869,9,'Protect-level-autoconfirmed/w/index.php',4),(1949,14,'Candidates_for_speedy_deletion',4),(2059,2,'MF-Warburg',5),(2059,2,'SieBot',5),(2059,2,'Siebrand',5),(2166,2,'Example',10),(1989,4,'Babel',10),(1990,10,'Babel',10),(2033,10,'Prettytable',10),(2173,11,'Archive_for_converted_wikitext_talk_page',10),(1547,11,'Delete',10),(1993,14,'User_en',10),(1993,14,'User_en-3',10),(1989,14,'Users_by_language',10),(2022,0,'Kombanda_yehi',14),(2023,0,'Mukuru',14),(2021,0,'Namibia',14),(2005,0,'Ombeibela',14),(2020,0,'Omuinyo',14),(2026,0,'Omundu',14),(2002,0,'Ongamburiro',14),(2019,0,'Otjipuka',14),(2004,0,'Ovakriste',14);
/*!40000 ALTER TABLE `pagelinks` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-12  6:27:59
