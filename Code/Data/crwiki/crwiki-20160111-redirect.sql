-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (x86_64)
--
-- Host: 10.64.16.16    Database: crwiki
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
INSERT INTO `redirect` VALUES (1398,0,'ᐃᔨᔨᐤ_ᐊᔨᒧᐎᓐ\'','',''),(1620,1,'ᓃᔥᑕᒻᐹᔅᑌᒋᓂᑲᓐ','',''),(1623,0,'ᓃᔥᑕᒻᐹᔅᑌᒋᓂᑲᓐ','',''),(1630,2,'Robchurch','',''),(1632,0,'User:Sirius_Zwarts_Bot','en',''),(1920,4,'Archives/ᐋᐧᑳᐢ','',''),(1935,0,'ᒪᐦᐃᐦᑲᓐᑖᔥᑎᒥᒄ','',''),(1956,0,'ᐄᔅᒌᒣᐧᐊᑎᒻ','',''),(1961,10,'ᐊᐧᐁᓰᔅᐊᒃ','',''),(1962,10,'ᓂᐦᑖᐅᒋᐦᒋᑲᓇᓐ','',''),(1963,10,'ᐧᐁᒥᔥᑎᑯᔒᐅᔥᑌᐤ','',''),(1964,10,'ᐄᔨᔫᐧᐊᒃ','',''),(1965,10,'ᐅᑌᓈᐅᐊᓐ','',''),(1968,0,'ᓃᔥᑕᒻᐹᔅᑌᒋᓂᑲᓐ','',''),(1969,1,'ᓃᔥᑕᒻᐹᔅᑌᒋᓂᑲᓐ','',''),(1977,4,'Archives/ᑏᐅᔅᒋᐦᒄ','',''),(2027,0,'ᐊᒥᔅᒄ','',''),(2031,4,'Archives/ᑳᒋᔅᑖᐧᐹᐅᒉᐸᔨᐦᒡ','',''),(2032,4,'Archives/ᒥᓂᔥᑎᒄ','',''),(2037,4,'Archives/ᑳᐅᑕᐦᐋᑯᓀᐦᐄᒉᐸᔨᒡ','',''),(2048,10,'Delete','',''),(2051,0,'User_talk:Az1568','m',''),(2062,2,'Bastique','',''),(2088,0,'Metmaacher_Klaaf:Purodha','ksh',''),(2152,0,'ᐧᐁᒥᔥᑎᑯᔒᐤ_ᐊᔨᒧᐧᐃᓐ','',''),(2154,10,'Babel_field_N','',''),(2306,3,'Multichill','',''),(2312,0,'User:MF-Warburg','m',''),(2322,0,'ᑳᓇᑖ','',''),(2406,0,'User:Brunoy_Anastasiya_Seryozhenko','m',''),(2413,3,'SpBot','',''),(2442,2,'WikiDreamer','',''),(2444,2,'WikiDreamer','',''),(2456,0,'s:Utente:OrbiliusMagister','it',''),(2489,2,'WikimediaNotifier','',''),(2513,0,'User:Julian_Mendez','en',''),(2514,0,'User_talk:Julian_Mendez','en',''),(2516,0,'User_talk:Synthebot','en',''),(2535,0,'Käyttäjä:Kallerna','fi',''),(2559,4,'Community_Portal','',''),(2606,0,'User:Nakon','m',''),(2607,2,'John_Vandenberg','',''),(2703,0,'ᐃᔨᔨᐧᐊᒡ','',''),(2704,0,'ᐃᔨᔨᐧᐊᒡ','',''),(2706,0,'ᐃᔨᔨᐤ_ᐊᔅᒌ','',''),(2710,4,'List_of_Cree_topics','',''),(2711,5,'List_of_Cree_topics','',''),(2735,4,'Archives/ᒋᔥᑖᐹᐅᒋᑲᓂᔮᐲ','',''),(2736,0,'ᐅᓐᑌᕇᐤ','',''),(2737,0,'ᐅᓐᑌᕇᐤ','',''),(2738,0,'ᐧᐄᓂᔥᒄ','',''),(2739,0,'ᐧᐄᓂᔥᒄ','',''),(2740,0,'ᐧᐄᓂᔥᒄ','',''),(2741,0,'ᐧᐄᓂᔥᒄ','',''),(2748,4,'Archives/ᐧᐋᐳᔥ','',''),(2749,4,'Archives/ᐧᐋᐳᔥ','',''),(2750,4,'Archives/ᐧᐋᐳᔥ','',''),(2751,0,'ᐧᐋᐸᒣᒄ','',''),(2753,0,'ᐧᐋᐸᒣᒄ','',''),(2754,0,'ᐧᐋᐸᒣᒄ','',''),(2761,0,'ᐱᑎᐧᑲᐦᐊᓇᐱᐧᐃᔨᓐ','',''),(2762,0,'ᐱᑎᐧᑲᐦᐊᓇᐱᐧᐃᔨᓐ','',''),(2763,4,'Archivesᐱᒋᔥᑲᐦᐄᐸᑌᑎᓱᐧᐋᓐ','',''),(2764,0,'ᐱᔔ','',''),(2765,0,'ᐱᔔ','',''),(2766,0,'ᐱᔔ','',''),(2767,0,'ᐱᔔ','',''),(2768,4,'Archives/ᐱᔨᒌᔅ','',''),(2769,0,'ᐲᐧᓭᐋᐃᐦᑯᓈᐤ','',''),(2770,0,'ᐲᐧᓭᐋᐃᐦᑯᓈᐤ','',''),(2771,0,'ᐲᐧᓭᐋᐃᐦᑯᓈᐤ','',''),(2772,4,'Archives/ᐲᓈᐦᑎᒄ','',''),(2773,4,'Archives/ᐲᔖᑲᓐ','',''),(2780,4,'Archives/ᐸᒎᔮᓐ','',''),(2787,0,'ᑕᐧᔐᔫᓂᑯᒑᔥ','',''),(2788,0,'ᑯᐯᒃ','',''),(2789,0,'ᑯᐯᒃ','',''),(2790,0,'ᑯᐯᒃ','',''),(2791,0,'ᑯᓐᕗᓯ','',''),(2793,0,'ᑰᑲᒣᔅ\'','',''),(2794,0,'ᑰᑲᒣᔅ\'','',''),(2795,0,'ᑰᑲᒣᔅ\'','',''),(2797,4,'Archives/ᑳᐅᑕᐦᐋᑯᓀᐦᐄᒉᐸᔨᒡ','',''),(2798,0,'ᑳᐅᔅᑎᐦᑖᑯᓂᒋᐸᐦᑖᑦ','',''),(2799,0,'ᑳᐅᔅᑎᐦᑖᑯᓂᒋᐸᐦᑖᑦ','',''),(2807,4,'Archives/ᑳᒋᐦᑳᔥᑌᐦᑎᐦᒡ','',''),(2809,4,'Archives/ᑳᔭᒦᒪᑲᐦᒡ','',''),(2810,4,'Archives/ᑳᔭᒦᒪᑲᐦᒡ','',''),(2820,0,'Âpihtâkosisânak','',''),(2823,0,'ᓇᒣᔅᑧᑭᐌ','',''),(2826,10,'ᑕᐋᐧᐤ','',''),(2831,10,'ᑕᐋᐧᐤ','',''),(2858,0,'ᒌᔑᑳᐅᐲᓯᒽ','',''),(2859,0,'ᒌᔑᑳᐅᐲᓯᒽ','',''),(2860,0,'ᒌᔑᑳᐅᐲᓯᒽ','',''),(2861,4,'Archives/ᒎᒎᔑᓈᐴ','',''),(2862,4,'Archives/ᒎᒎᔑᓈᐴ','',''),(2863,4,'Archives/ᒎᒎᔑᓈᐴ','',''),(2864,4,'Archives/ᒎᒎᔑᓈᐴ','',''),(2868,4,'Archives/ᒥᔅᑐᔅ','',''),(2869,4,'Archives/ᒥᔅᑐᔅ','',''),(2870,4,'Archives/ᒥᔅᑐᔅ','',''),(2873,0,'ᓇᒣᔅ','',''),(2874,0,'ᓇᒣᔅ','',''),(2875,0,'ᓇᒣᔅ','',''),(2877,4,'Archives/ᓰᐲᓯᔅ','',''),(2879,4,'Archives/ᓰᐲ','',''),(2880,4,'Archives/ᓰᐲ','',''),(2881,4,'Archives/ᓰᐲ','',''),(2882,4,'Archives/ᓰᐲ','',''),(2883,4,'Archives/ᓰᐲ','',''),(2884,4,'Archives/ᓰᐲ','',''),(2885,0,'ᐃᔨᔨᐧᐊᒡ','',''),(2886,4,'Archives/ᓰᐲᓯᔅ','',''),(2931,2,'BOTijo','',''),(2960,4,'Community_Portal','',''),(2961,0,'ᐱᔥᑎᑯᔮᐤ_ᐊᔨᒧᐎᓐ','',''),(2986,0,'en:User_talk:Taric25','w',''),(2987,0,'en:User:Taric25','w',''),(3013,4,'Community_Portal','',''),(3049,0,'ᒥᔥᑎᒄ','',''),(3051,0,'ᐁᐧᐦᐁᐧᐤ','',''),(3053,0,'ᒋᔮᐢᐠ','',''),(3058,0,'ᐅᓵᐅᔅᒄ','',''),(3059,0,'ᐊᑎᐦᒄ','',''),(3060,0,'Atimw','',''),(3061,0,'ᐊᒥᔅᒄ','',''),(3062,0,'ᐧᐄᓂᔥᒄ','',''),(3063,4,'Archives/ᐧᐋᐳᔥ','',''),(3064,0,'ᐧᐋᐸᒣᒄ','',''),(3066,0,'ᐧᑳᐦᐧᑳᐱᔒᔥ','',''),(3067,0,'ᐱᔔ','',''),(3068,0,'ᑕᐧᔐᔫᓂᑯᒑᔥ','',''),(3070,0,'ᑰᑲᒣᔅ\'','',''),(3072,4,'Archives/ᒥᔅᑐᔅ','',''),(3074,0,'ᒪᐦᐃᐦᑲᓐᑖᔥᑎᒥᒄ','',''),(3075,0,'ᒪᐦᐃᐦᑲᓐ','',''),(3140,3,'Tjmoel','',''),(3141,3,'Tjmoel','',''),(3165,4,'Archives/ᐅᒑᐹᓂᔥ','',''),(3208,2,'Axpde','',''),(3228,3,'Wikitanvir','',''),(3297,3,'Crochet.david','',''),(3351,2,'Simon_Villeneuve','',''),(3384,3,'Caypartis','',''),(3396,2,'Der_Buckesfelder','',''),(3397,3,'Der_Buckesfelder','',''),(3401,2,'Àlex','',''),(3403,0,'User:Daniyar','kk',''),(3419,0,'ᒥᔥᑎᒄ','',''),(3423,0,'user:Cœur','fr',''),(3429,0,'ᒥᔥᑎᒄ','',''),(3451,2,'Benoit_Rochon','',''),(3452,3,'Benoit_Rochon','',''),(3470,0,'ᒥᔅᑎᓯᓃ','',''),(3475,0,'ᒥᔅᑎᓯᓃ','',''),(3512,0,'Uzanto:Ĉiuĵaŭde','eo',''),(3528,3,'とある白い猫','',''),(3571,2,'Vogone','',''),(3599,0,'Atimw','',''),(3600,1,'Atimw','',''),(3601,0,'Atimw','',''),(3602,1,'Atimw','',''),(3603,0,'Atimw','',''),(3608,4,'Archives','',''),(3622,0,'ᑐᕒᑭ','',''),(3623,4,'Archives/ᒪᓯᓂᐸᔨᐃᐧᐣ_ᐁᑲᐧ_ᒪᓯᓇᐦᐃᑲᐣ','',''),(3624,5,'Archives/ᒪᓯᓂᐸᔨᐃᐧᐣ_ᐁᑲᐧ_ᒪᓯᓇᐦᐃᑲᐣ','',''),(3625,4,'Archives/ᑲᑰᓇ','',''),(3626,4,'Archives/ᖌᒪ','',''),(3627,0,'ᑌᐟ_ᒧᓭᐢ','',''),(3628,0,'ᐃᔨᔨᐤ_ᐊᔅᒌ','',''),(3629,0,'ᐃᔨᔨᐤ_ᐊᔅᒌ','',''),(3630,0,'ᐃᑕᓖ','',''),(3631,0,'ᑐᕒᑭ','',''),(3632,4,'Archives/ᐱᗴᙅᓄ','',''),(3633,4,'Archives/ᑯᕆᑏᐸ','',''),(3634,4,'Archives/ᑲᘈᕋᔅᑲ_(ᐅᑌᓈᐤ)','',''),(3635,4,'Archives/ᒪᑕᓀ_(ᐅᑌᓈᐤ)','',''),(3636,4,'Archives/ᗴᔅᗫ_(ᐅᑌᓈᐤ)','',''),(3637,4,'Archives/ᐅᓴᔅᑯ','',''),(3638,4,'Archives/ᒪᑕᗫᑔᐊ_(ᐅᑌᓈᐤ)','',''),(3639,0,'ᐫᑦᕂᓇ','',''),(3640,4,'Archives/ᐊᒻᕿ','',''),(3642,4,'Archives/ᓴᔭᐯᒃ','',''),(3643,4,'Archives/ᔨᑌᕐᓭᓐ','',''),(3645,4,'Archives/ᐯᕐᓰ','',''),(3646,4,'Archives/ᕤᖕ_ᕾ','',''),(3647,4,'Archives/ᒥᓯ_ᐹᐗᔅᑎᒃ','',''),(3648,4,'Archives/ᑰᓴᑉᔅᑲᓪ','',''),(3649,4,'Archives/ᑲᐱᑎᑌᒍᐁᔅ','',''),(3650,4,'Archives/ᕆᒧᔅᑭ','',''),(3651,4,'Archives/ᐳᐫᓀᖃᒨᒃ','',''),(3652,4,'Archives/ᐸᔅᐯᐱᐊᒃ','',''),(3660,0,'Usuário:Mário_Henrique','pt',''),(3683,0,'User:DeltaQuad','m',''),(3684,0,'User_talk:DeltaQuad','m',''),(3686,0,'User_talk:محمد_شعیب','ur',''),(3687,0,'User_talk:محمد_شعیب','ur',''),(3769,0,'Usuario_Discusión:Kizar','es',''),(3784,0,'ᐃᔨᔨᐤ_ᐊᔅᒌ','',''),(3788,0,'ᑳᓇᑖ','',''),(3790,0,'ᐅᔅᑯᑎᒥᐦᒉᓯᐤ','',''),(3791,0,'ᑎᐸᐦᐄᑲᓐ','',''),(3792,0,'ᐅᓐᑌᕇᐤ','',''),(3793,0,'ᑰᑲᒣᔅ\'','',''),(3794,0,'ᒌᔑᑳᐅᐲᓯᒽ','',''),(3795,0,'ᐄᔅᒌᒣᐧᐊᑎᒻ','',''),(3796,0,'ᐧᐁᒥᔥᑎᑯᔒᐤ_ᐊᔨᒧᐧᐃᓐ','',''),(3797,0,'ᐱᔥᑎᑯᔮᐤ_ᐊᔨᒧᐎᓐ','',''),(3798,0,'\'ᒋᓵᓰᐲ','',''),(3799,0,'\'ᓵᒋᐦᐄᐧᐁᐧᐃᒌᔑᑳᐤ','',''),(3800,0,'ᐃᔨᔨᐧᐊᒡ','',''),(3809,0,'ᑳ_ᐋᐸᐦᐄᔥᑌᒡ:ᐃᔨᔨᐤ_ᐊᔨᒧᐧᐃᓐ','',''),(3830,0,'Projet:Wikipetia_Atikamekw','',''),(3831,0,'Projet:Wikipetia_Atikamekw','',''),(3837,0,'Portal:Atikamekw','',''),(3838,1,'Portal:Atikamekw','',''),(3934,10,'Référence_Harvard_sans_parenthèses','',''),(3964,0,'Projet:Wikipetia_Atikamekw/Références','',''),(4010,0,'Wikwas','',''),(4011,0,'Wikwas','',''),(4015,0,'ᒥᒋᓯᐤ','',''),(4016,0,'ᒥᒋᓯᐤ','',''),(4098,3,'Wim_b','',''),(4162,0,'Metapeckeka_sakihikan','',''),(4164,0,'ᐃᔨᔨᐤ_ᐊᔨᒧᐎᓐ\'','',''),(4165,1,'ᐃᔨᔨᐤ_ᐊᔨᒧᐎᓐ\'','',''),(4204,0,'Pakwecikan','',''),(4321,2,'Rxy','',''),(4409,2,'Jalexander-WMF','',''),(4413,0,'Michel_Ottawa','',''),(4414,0,'François_Ottawa','',''),(4415,0,'Daniel_Ottawa','',''),(4416,0,'Armand_Echaquan','',''),(4417,0,'E_nikotwatciki_e_aistokoki','',''),(4425,2,'-revi','',''),(4426,3,'-revi','',''),(4427,2,'-revi','',''),(4428,3,'-revi','',''),(4438,2,'Ekips39','',''),(4441,2,'Allan_Aguilar','',''),(4442,3,'Allan_Aguilar','',''),(4453,3,'Sir_Lestaty_de_Lioncourt','',''),(4454,3,'Sir_Lestaty_de_Lioncourt','',''),(4456,2,'*SM*','',''),(4457,3,'*SM*','',''),(4459,0,'User_talk:Unapersona','m',''),(4466,2,'Caliburn','',''),(4467,3,'Caliburn','',''),(4469,2,'Diego_Grez-Cañete','',''),(4544,2,'Azariv-WMF','',''),(4644,2,'Diego_Grez-Cañete','',''),(4645,3,'Diego_Grez-Cañete','',''),(4689,3,'Avicennasis','',''),(4695,2,'Languagegeek_Chris','',''),(4696,3,'Languagegeek_Chris','',''),(4734,2,'White_Master/common.js','',''),(4735,2,'White_Master','',''),(4753,2,'Razr_Nation/common.css','',''),(4754,2,'Razr_Nation/common.js','',''),(4755,2,'Razr_Nation','','');
/*!40000 ALTER TABLE `redirect` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-12  6:51:03
