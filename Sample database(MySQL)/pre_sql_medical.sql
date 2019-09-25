-- MySQL dump 10.16  Distrib 10.1.30-MariaDB, for Linux (x86_64)
--
-- Host: ember-db    Database: cdixon3783_pre_sql_medical
-- ------------------------------------------------------
-- Server version	10.1.30-MariaDB

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
-- Table structure for table `DOCTOR`
--

DROP TABLE IF EXISTS `DOCTOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DOCTOR` (
  `DOC_ID` int(11) NOT NULL,
  `DOC_FNAME` varchar(30) NOT NULL,
  `DOC_LNAME` varchar(30) NOT NULL,
  `DOC_LICENSE` varchar(30) NOT NULL,
  `DOC_EMAIL` varchar(30) DEFAULT NULL,
  `LOC_ID` int(11) NOT NULL,
  `INSUR_PACK` int(3) DEFAULT NULL,
  PRIMARY KEY (`DOC_ID`),
  KEY `idx_LOC_ID` (`LOC_ID`),
  KEY `idx_INSUR_PACK` (`INSUR_PACK`),
  CONSTRAINT `DOCTOR_ibfk_1` FOREIGN KEY (`LOC_ID`) REFERENCES `LOCATION` (`LOC_ID`),
  CONSTRAINT `DOCTOR_ibfk_2` FOREIGN KEY (`INSUR_PACK`) REFERENCES `INSURANCE_PACKAGE` (`INSUR_PACK`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DOCTOR`
--

LOCK TABLES `DOCTOR` WRITE;
/*!40000 ALTER TABLE `DOCTOR` DISABLE KEYS */;
INSERT INTO `DOCTOR` VALUES (100,'Clare','Bean','16471018-7875','urna.Vivamus@nonvestibulumnec.',10,5),(101,'Peter','Vega','16930217-5303','sed.dictum@In.net',10,6),(102,'Paloma','Ratliff','16360330-0199','Quisque.nonummy.ipsum@Quisquev',10,7),(103,'Dylan','Harper','16671218-6789','posuere.cubilia@acmattis.co.uk',10,8),(104,'Lara','Bartlett','16620827-1004','luctus.vulputate.nisi@consequa',10,9),(105,'Oleg','Joyner','16991207-8988','molestie.Sed@ipsumSuspendissen',10,10),(106,'Kay','Yang','16080425-2138','primis.in@ametnulla.net',1,11),(107,'Gemma','Ware','16480715-1958','Cras.eget.nisi@rhoncusid.ca',2,12),(108,'Christen','Romero','16700418-6610','magna@pellentesqueSed.co.uk',3,13),(109,'TaShya','Bridges','16191005-0879','senectus.et@laoreet.ca',4,14),(110,'Scarlet','Waters','16160521-0457','nulla.Integer.vulputate@orci.e',5,15),(111,'Ariana','Sellers','16261003-5467','arcu.Sed.et@anteipsumprimis.or',52,16),(112,'Sheila','Juarez','16520904-8833','odio@massaInteger.org',65,17),(113,'Keefe','Levine','16190906-2190','ac@eratinconsectetuer.net',65,18),(114,'Calista','Tanner','16510118-1583','dignissim.pharetra.Nam@ligulat',73,19),(115,'Lacota','Hoffman','16240222-2018','diam@at.ca',8,20),(116,'Hayes','Erickson','16690720-0486','sapien.Aenean@ligulaconsectetu',78,21),(117,'Fuller','Talley','16170121-6176','in.hendrerit.consectetuer@puru',78,22),(118,'Ryan','Kaufman','16211215-7587','vitae.odio.sagittis@non.org',78,23),(119,'Buffy','Briggs','16751227-0203','ipsum@eratin.co.uk',78,24),(120,'Lars','Bernard','16011228-9970','imperdiet.ornare@dolor.org',2,25),(121,'Jada','Mcclain','16970228-9092','pellentesque.tellus.sem@luctus',2,26),(122,'Sawyer','Richardson','16660205-5656','tortor.Nunc@velitegestaslacini',13,27),(123,'Chava','Horton','16580426-6830','tristique@mauris.ca',14,28),(124,'Carlos','Keith','16871122-7499','auctor@ante.net',15,29),(125,'Basil','House','16560415-8468','at.pretium.aliquet@felispurus.',16,30),(126,'Noah','Holloway','16730424-2311','venenatis.vel@Nunc.com',17,31),(127,'Jescie','Orr','16520907-8988','Etiam.bibendum@aliquamenim.ca',18,32),(128,'Uta','House','16660230-5572','sapien.gravida.non@Aenean.edu',19,33),(129,'Orlando','Ramirez','16930406-9629','eget@velesttempor.net',20,34),(130,'Daryl','Pugh','16530502-6006','sed.pede.nec@uteratSed.edu',21,35),(131,'Aidan','Fletcher','16140524-3914','rutrum.justo.Praesent@iaculis.',22,36),(132,'Oscar','Langley','16791119-4186','vehicula.risus@vitaealiquamero',23,37),(133,'Reagan','Hughes','16990428-3059','Proin.nisl.sem@mollisPhasellus',24,38),(134,'Alexander','Stephens','16500223-1669','nibh.Aliquam@eratvitaerisus.ne',99,39),(135,'Maris','Farley','16140728-6200','nisl.arcu@dictum.edu',98,40),(136,'Amir','Middleton','16341225-0031','lacus.Ut@uteros.ca',97,41),(137,'Nola','Lara','16011111-7016','in.felis@atarcuVestibulum.edu',96,42),(138,'Malik','Roth','16760608-9675','at@egestasFuscealiquet.org',95,43),(139,'Emerson','House','16311203-6920','risus.Quisque.libero@laoreetli',94,44),(140,'Wynne','Berry','16160818-4691','volutpat.ornare@telluslorem.ed',88,45),(141,'Barrett','Vaughan','16880909-1856','egestas@elit.ca',87,46),(142,'Skyler','Horton','16740422-6743','Nam@enimgravidasit.com',86,47),(143,'Anthony','Hart','16840604-8572','eget.mollis@posuere.com',85,48),(144,'Eve','Hyde','16320629-0441','Cras.sed@Integer.edu',84,49),(145,'Quynn','Chase','16880327-5273','Aenean.egestas@interdum.com',76,50),(146,'Courtney','Holloway','16870923-4309','risus.In@atarcu.org',75,51),(147,'Acton','Fitzgerald','16200512-6251','eu@dolorQuisquetincidunt.net',74,52),(148,'Asher','Aguirre','16691227-7578','magna.sed@scelerisque.edu',73,53),(149,'Christen','Serrano','16881011-8060','Nunc@egettinciduntdui.co.uk',72,54),(150,'Haley','Shaw','16081107-8278','Maecenas.malesuada.fringilla@P',71,55),(151,'Oliver','Nolan','16730415-2676','Vivamus.nisi@imperdiet.ca',70,56),(152,'Gretchen','Terrell','16620105-4753','ut.lacus@egestas.com',69,57),(153,'Macy','Gardner','16910517-4750','molestie@Aliquamornarelibero.c',68,58),(154,'Colorado','Dudley','16670101-7615','fames@adipiscing.com',67,59),(155,'Odette','Pierce','16520309-6424','purus@semsempererat.edu',66,60),(156,'Tucker','Mcgowan','16230423-3394','tellus@ametdapibusid.net',65,61),(157,'Moana','Boyle','16360515-3802','Aliquam.vulputate@aliquetPhase',64,62),(158,'Orlando','Carpenter','16930615-0724','eget.lacus.Mauris@leoCrasvehic',63,63),(159,'Forrest','Santana','16540220-7038','mauris.id.sapien@arcuVestibulu',62,64),(160,'Randall','Dejesus','16270521-2880','a.feugiat.tellus@Nunc.edu',61,65),(161,'Keaton','Roy','16371112-7195','morbi.tristique.senectus@Quisq',60,66),(162,'Wendy','Mills','16830128-2060','tellus@elitafeugiat.co.uk',59,67),(163,'Roth','Mercado','16500213-3410','enim.Sed@lorem.edu',58,68),(164,'Raja','Blanchard','16800909-5434','vel@cubiliaCurae.edu',57,69),(165,'Cullen','Byrd','16880814-5653','purus.accumsan@dictumPhasellus',56,70),(166,'Germane','Riddle','16420502-5564','aliquam.eros@nisiCumsociis.co.',55,71),(167,'Callum','Dyer','16000808-9666','nisl.Nulla.eu@euismodest.co.uk',54,72),(168,'Chaim','Schmidt','16940711-0999','vel.venenatis@necorciDonec.ca',53,73),(169,'Justin','Lynch','16930925-6858','luctus.et@Integer.com',52,74),(170,'Jasmine','Wise','16060711-5342','fermentum.vel.mauris@Morbi.org',51,75),(171,'Warren','Ayala','16691215-7234','tristique.neque.venenatis@arcu',3,76),(172,'Chanda','Waters','16450705-4015','et.magnis.dis@feugiattellus.ed',4,77),(173,'Rajah','Stephenson','16711203-2409','eget@ametconsectetuer.org',5,78),(174,'Cally','Roman','16701021-3184','ac.libero@rutrumeu.edu',52,79),(175,'Christian','Navarro','16070430-1811','ut@ligula.ca',65,80),(176,'Audra','Ramirez','16081119-8803','dignissim@mattis.com',65,81),(177,'Tamekah','Willis','16300312-7564','metus@gravida.edu',73,82),(178,'Camilla','Tucker','16360425-7166','ut@metuseu.net',8,83),(179,'Xaviera','Atkins','16300801-0385','ac@leo.org',78,84),(180,'Ashton','Harper','16520110-4527','ligula.Aliquam@ultricesposuere',78,85),(181,'Timothy','Owen','16980830-9067','consectetuer.rhoncus@nostraper',78,86),(182,'Tucker','Weber','16430106-2339','mus.Proin@nibhDonecest.edu',78,87),(183,'Carl','Vasquez','16391009-2174','at.iaculis@turpis.com',2,88),(184,'Julian','Melendez','16031014-0561','ac.sem@ultricesposuerecubilia.',2,89),(185,'Honorato','Rosales','16651121-9849','dictum@quamdignissim.ca',13,90),(186,'Jeremy','Oliver','16421015-7279','et.lacinia.vitae@malesuadavel.',14,91),(187,'Kareem','Snyder','16270304-0606','arcu@liberomauris.ca',15,92),(188,'Jocelyn','Tyler','16540712-8866','Cras.lorem@Donecegestas.org',16,93),(189,'Clarke','Horn','16230416-5026','Cum.sociis.natoque@Maecenasiac',17,94),(190,'Josiah','Coleman','16820705-1882','quis@sedorcilobortis.edu',18,95),(191,'Michelle','Glover','16600123-7160','Integer.vitae@felisNulla.ca',19,96),(192,'Lucas','Buckner','16330103-5352','elit@Nam.edu',20,97),(193,'Brenden','Donovan','16051208-5929','enim.gravida.sit@dictumProin.o',21,98),(194,'Solomon','Nicholson','16480830-4861','sit@et.org',33,99),(195,'Oliver','Dunlap','16280111-2935','Pellentesque@Nulla.com',34,100),(196,'Peter','Holmes','16940106-4143','amet.ante@velitSed.com',33,101),(197,'Aileen','Valenzuela','16680527-0151','sagittis.augue.eu@Etiamimperdi',33,102),(198,'Clark','Floyd','16280624-8593','tempus@dignissimpharetra.ca',39,103),(199,'Clementine','Randolph','16140805-0878','morbi.tristique@Pellentesque.n',22,104);
/*!40000 ALTER TABLE `DOCTOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INSURANCE`
--

DROP TABLE IF EXISTS `INSURANCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INSURANCE` (
  `INSUR_ID` int(11) NOT NULL,
  `INSUR_GROUPNUM` int(11) NOT NULL,
  `INSUR_NAME` varchar(30) NOT NULL,
  `INSUR_COST` double NOT NULL,
  `MED_ID` int(11) NOT NULL,
  `INSUR_PACK` int(3) DEFAULT NULL,
  PRIMARY KEY (`INSUR_ID`),
  KEY `idx_MED_ID` (`MED_ID`),
  KEY `INSUR_PACK` (`INSUR_PACK`),
  CONSTRAINT `INSURANCE_ibfk_1` FOREIGN KEY (`MED_ID`) REFERENCES `MEDICAL_HISTORY` (`MED_ID`),
  CONSTRAINT `INSURANCE_ibfk_2` FOREIGN KEY (`INSUR_PACK`) REFERENCES `INSURANCE_PACKAGE` (`INSUR_PACK`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INSURANCE`
--

LOCK TABLES `INSURANCE` WRITE;
/*!40000 ALTER TABLE `INSURANCE` DISABLE KEYS */;
INSERT INTO `INSURANCE` VALUES (479,1,'Mattis Semper Corporation',536.61,1,5),(480,1,'Lectus PC',598.82,2,6),(481,1,'Neque Pellentesque Ltd',981.01,3,7),(482,1,'Id Blandit At Foundation',208.29,4,8),(483,1,'Vulputate Risus A Corp.',776.05,5,9),(484,1,'Pharetra Sed Hendrerit Company',279.26,6,10),(485,1,'Pharetra Quisque Ac Inc.',825.46,7,11),(486,1,'Orci Donec Ltd',751.32,8,12),(487,1,'Sem Limited',735.61,9,13),(488,1,'In Hendrerit Corp.',163.69,10,14),(489,1,'Neque Venenatis Lacus LLC',276.96,11,15),(490,1,'Ac Arcu Nunc Industries',168.17,12,16),(491,1,'Elit Elit Fermentum Institute',561.5,13,17),(492,1,'Cras Vehicula Aliquet Associat',310.09,14,18),(493,1,'Sapien Imperdiet Associates',160.71,15,19),(494,1,'Nulla Interdum Corporation',207.44,16,20),(495,1,'Eu Erat Semper Limited',185.52,17,21),(496,1,'Habitant Foundation',672.06,18,22),(497,1,'Phasellus LLC',443.4,19,23),(498,1,'Feugiat Consulting',157.24,20,24),(499,2,'Sed Hendrerit Industries',782.46,21,25),(500,2,'Elit Foundation',696.29,22,26),(501,2,'Auctor Nunc Nulla Incorporated',292.55,23,27),(502,2,'At Egestas Corporation',948.61,24,28),(503,2,'Orci Inc.',358.88,25,29),(504,2,'Quisque Porttitor Eros Inc.',752.8,26,30),(505,2,'Nec Ante Consulting',762.68,27,31),(506,2,'Aliquam Corp.',422.97,28,32),(507,2,'Ante Iaculis Nec LLC',814.61,29,33),(508,2,'Aliquet Molestie Limited',261.89,30,34),(509,2,'Sit Amet LLC',623.1,31,35),(510,2,'Tristique Consulting',284.67,32,36),(511,2,'Mauris Foundation',370.68,33,37),(512,2,'Eu Limited',892.13,34,38),(513,2,'Mi Enim Company',206.52,35,39),(514,2,'Sed Est LLP',518.63,36,40),(515,2,'Curabitur Associates',693.85,37,41),(516,2,'Duis At Company',898.18,38,42),(517,2,'Aenean Associates',321.61,39,43),(518,2,'Vivamus PC',905.39,40,44),(519,3,'Velit Corp.',696.95,41,45),(520,3,'Pellentesque Ut Limited',264.12,42,46),(521,3,'Interdum Ligula Consulting',373.08,43,47),(522,3,'Vivamus Nisi PC',562.44,44,48),(523,3,'Ante Vivamus Non Institute',931.71,45,49),(524,3,'Ut Industries',448.85,46,50),(525,3,'Sed Eu LLC',256.06,47,51),(526,3,'Ipsum Curabitur Corp.',398.82,48,52),(527,3,'Nec Enim Nunc Associates',319.21,49,53),(528,3,'Turpis Vitae Limited',714.47,50,54),(529,3,'Tincidunt Vehicula Foundation',769.31,51,55),(530,3,'Tincidunt Nibh Institute',415.08,52,56),(531,3,'Porttitor Tellus Ltd',626.66,53,57),(532,3,'Aliquet Vel Inc.',580.74,54,58),(533,3,'Sit Amet Dapibus Incorporated',906.8,55,59),(534,3,'Mattis Integer Corp.',631.31,56,60),(535,3,'Elementum Lorem Ut Limited',432.73,57,61),(536,3,'Velit Ltd',660.3,58,62),(537,3,'Dui Company',531.3,59,63),(538,3,'Velit Aliquam Nisl Industries',158.44,60,64),(539,4,'Fermentum Metus Consulting',502.46,61,65),(540,4,'Egestas Corporation',697.66,62,66),(541,4,'Ipsum Inc.',712.45,63,67),(542,4,'Quisque Industries',978.42,64,68),(543,4,'Euismod LLP',890.37,65,69),(544,4,'Eu Eleifend PC',812.71,66,70),(545,4,'Laoreet PC',809.3,67,71),(546,4,'Donec Sollicitudin Adipiscing ',347.59,68,72),(547,4,'Venenatis Consulting',770.13,69,73),(548,4,'Suspendisse LLC',973.39,70,74),(549,4,'Dui Industries',287.97,71,75),(550,4,'Mi Fringilla Mi Associates',657.85,72,76),(551,4,'Facilisis Lorem Tristique Inc.',165.86,73,77),(552,4,'Ipsum Primis In Incorporated',625.64,74,78),(553,4,'Ligula Aliquam Corp.',855.6,75,79),(554,4,'Penatibus Inc.',799.12,76,80),(555,4,'Egestas Sed Pharetra Foundatio',291.81,77,81),(556,4,'Tristique Pellentesque Tellus ',944.7,78,82),(557,4,'Orci Institute',273.8,79,83),(558,4,'Fermentum Consulting',322.29,80,84),(559,5,'Placerat Eget Venenatis Incorp',258.37,81,85),(560,5,'Tellus Phasellus Corp.',659.82,82,86),(561,5,'Nullam Ltd',338.06,83,87),(562,5,'Ultricies PC',908.13,84,88),(563,5,'Nec Institute',712.45,85,89),(564,5,'Ac Ltd',434.07,86,90),(565,5,'Enim Condimentum Ltd',179.5,87,91),(566,5,'Velit Justo Consulting',442.5,88,92),(567,5,'Dolor Corporation',896.55,89,93),(568,5,'Quisque Fringilla Ltd',217.04,90,94),(569,5,'Sed Sem Egestas Inc.',594.28,91,95),(570,5,'Sociis Industries',675.31,92,96),(571,5,'Nibh Institute',312.09,93,97),(572,5,'Cras Convallis Convallis Corp.',363.08,94,98),(573,5,'Quam Elementum PC',845.68,95,99),(574,5,'Rhoncus Institute',486.3,96,100),(575,5,'Dapibus Ligula Aliquam Inc.',894.39,97,101),(576,5,'Adipiscing Industries',458.94,98,102),(577,5,'Consequat Institute',630.38,99,103),(578,5,'Id Enim Corp.',685.51,100,104);
/*!40000 ALTER TABLE `INSURANCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INSURANCE_PACKAGE`
--

DROP TABLE IF EXISTS `INSURANCE_PACKAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INSURANCE_PACKAGE` (
  `INSUR_PACK` int(3) NOT NULL,
  `DOC_ID` int(11) NOT NULL,
  `INSUR_ID` int(11) NOT NULL,
  PRIMARY KEY (`INSUR_PACK`),
  KEY `idx_DOC_ID` (`DOC_ID`),
  KEY `idx_INSUR_ID` (`INSUR_ID`),
  CONSTRAINT `INSURANCE_PACKAGE_ibfk_1` FOREIGN KEY (`DOC_ID`) REFERENCES `DOCTOR` (`DOC_ID`),
  CONSTRAINT `INSURANCE_PACKAGE_ibfk_2` FOREIGN KEY (`INSUR_ID`) REFERENCES `INSURANCE` (`INSUR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INSURANCE_PACKAGE`
--

LOCK TABLES `INSURANCE_PACKAGE` WRITE;
/*!40000 ALTER TABLE `INSURANCE_PACKAGE` DISABLE KEYS */;
INSERT INTO `INSURANCE_PACKAGE` VALUES (5,100,479),(6,101,480),(7,102,481),(8,103,482),(9,104,483),(10,105,484),(11,106,485),(12,107,486),(13,108,487),(14,109,488),(15,110,489),(16,111,490),(17,112,491),(18,113,492),(19,114,493),(20,115,494),(21,116,495),(22,117,496),(23,118,497),(24,119,498),(25,120,499),(26,121,500),(27,122,501),(28,123,502),(29,124,503),(30,125,504),(31,126,505),(32,127,506),(33,128,507),(34,129,508),(35,130,509),(36,131,510),(37,132,511),(38,133,512),(39,134,513),(40,135,514),(41,136,515),(42,137,516),(43,138,517),(44,139,518),(45,140,519),(46,141,520),(47,142,521),(48,143,522),(49,144,523),(50,145,524),(51,146,525),(52,147,526),(53,148,527),(54,149,528),(55,150,529),(56,151,530),(57,152,531),(58,153,532),(59,154,533),(60,155,534),(61,156,535),(62,157,536),(63,158,537),(64,159,538),(65,160,539),(66,161,540),(67,162,541),(68,163,542),(69,164,543),(70,165,544),(71,166,545),(72,167,546),(73,168,547),(74,169,548),(75,170,549),(76,171,550),(77,172,551),(78,173,552),(79,174,553),(80,175,554),(81,176,555),(82,177,556),(83,178,557),(84,179,558),(85,180,559),(86,181,560),(87,182,561),(88,183,562),(89,184,563),(90,185,564),(91,186,565),(92,187,566),(93,188,567),(94,189,568),(95,190,569),(96,191,570),(97,192,571),(98,193,572),(99,194,573),(100,195,574),(101,196,575),(102,197,576),(103,198,577),(104,199,578);
/*!40000 ALTER TABLE `INSURANCE_PACKAGE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LOCATION`
--

DROP TABLE IF EXISTS `LOCATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LOCATION` (
  `LOC_ID` int(11) NOT NULL,
  `LOC_TYPE` varchar(30) NOT NULL,
  `LOC_PHONE` varchar(14) NOT NULL,
  `LOC_ROOMS` int(11) DEFAULT NULL,
  `LOC_NAME` varchar(30) NOT NULL,
  PRIMARY KEY (`LOC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LOCATION`
--

LOCK TABLES `LOCATION` WRITE;
/*!40000 ALTER TABLE `LOCATION` DISABLE KEYS */;
INSERT INTO `LOCATION` VALUES (1,'HOSPITAL','(158) 571-0681',8,'Gravida Associates'),(2,'HOSPITAL','(897) 448-1235',5,'Nam Institute'),(3,'HOSPITAL','(159) 550-3180',1,'Tempus Eu Inc.'),(4,'HOSPITAL','(367) 104-7624',6,'Amet Corp.'),(5,'HOSPITAL','(359) 172-1634',2,'Egestas Nunc Sed Institute'),(6,'HOSPITAL','(371) 111-9957',9,'Blandit PC'),(7,'HOSPITAL','(129) 108-6613',1,'Neque Tellus Imperdiet LLC'),(8,'HOSPITAL','(459) 769-9613',7,'Ac Turpis Egestas Industries'),(9,'HOSPITAL','(240) 493-5986',10,'Mus Proin Company'),(10,'HOSPITAL','(930) 366-1765',9,'Non Sollicitudin A Ltd'),(11,'PRIMARY CARE','(410) 656-3321',6,'Vel Quam Dignissim Corp.'),(12,'PRIMARY CARE','(841) 759-3756',6,'Nec Incorporated'),(13,'PRIMARY CARE','(139) 258-2240',4,'Nonummy Ipsum Non Corp.'),(14,'PRIMARY CARE','(660) 172-2440',4,'Lectus Justo Eu LLP'),(15,'PRIMARY CARE','(249) 330-2152',2,'Erat In Consectetuer PC'),(16,'PRIMARY CARE','(954) 151-3483',1,'Malesuada Vel Inc.'),(17,'PRIMARY CARE','(990) 627-5869',7,'Praesent Eu Nulla Incorporated'),(18,'PRIMARY CARE','(590) 996-2602',5,'Justo Eu Company'),(19,'PRIMARY CARE','(474) 117-3774',6,'Ante LLP'),(20,'PRIMARY CARE','(353) 155-1174',10,'Ultricies Dignissim Lacus Limi'),(21,'SPECIALIST','(215) 193-5181',5,'Rutrum Corporation'),(22,'SPECIALIST','(331) 580-1821',1,'Tempus Limited'),(23,'SPECIALIST','(271) 467-2869',1,'Auctor Velit Ltd'),(24,'SPECIALIST','(949) 764-8335',2,'Auctor Vitae LLC'),(25,'SPECIALIST','(684) 246-4678',1,'Molestie Tellus Aenean Industr'),(26,'SPECIALIST','(759) 991-5160',6,'Curabitur LLC'),(27,'SPECIALIST','(961) 176-9554',2,'Cum Limited'),(28,'SPECIALIST','(898) 542-8267',10,'Integer Limited'),(29,'SPECIALIST','(628) 727-1912',4,'Morbi Sit PC'),(30,'SPECIALIST','(564) 294-2722',10,'Semper Erat In Consulting'),(31,'HOSPITAL','(488) 629-2475',3,'Dui Augue Corp.'),(32,'HOSPITAL','(927) 550-4682',7,'Fringilla Euismod Incorporated'),(33,'HOSPITAL','(455) 417-1940',9,'Nulla Tempor Augue Inc.'),(34,'HOSPITAL','(682) 755-4973',5,'Iaculis Aliquet Institute'),(35,'HOSPITAL','(296) 143-3492',5,'Egestas Ligula Consulting'),(36,'HOSPITAL','(298) 900-0966',4,'Mollis Non Cursus Ltd'),(37,'HOSPITAL','(974) 108-5224',8,'Suspendisse Dui Consulting'),(38,'HOSPITAL','(538) 249-1699',9,'In Consequat Enim Institute'),(39,'HOSPITAL','(250) 293-5542',5,'Consectetuer Euismod Company'),(40,'HOSPITAL','(793) 417-1892',10,'Eu Foundation'),(41,'PRIMARY CARE','(800) 798-9178',5,'Gravida Sagittis Duis PC'),(42,'PRIMARY CARE','(966) 728-9711',3,'Pretium Ltd'),(43,'PRIMARY CARE','(702) 635-2883',5,'Auctor Non Company'),(44,'PRIMARY CARE','(339) 374-1791',7,'Nostra Per Inceptos Foundation'),(45,'PRIMARY CARE','(606) 322-0494',9,'Aliquet Lobortis Nisi Foundati'),(46,'PRIMARY CARE','(416) 216-0324',8,'Montes Nascetur Corp.'),(47,'PRIMARY CARE','(821) 707-0642',9,'Ante LLC'),(48,'PRIMARY CARE','(549) 455-5376',10,'Id Limited'),(49,'PRIMARY CARE','(154) 247-5569',1,'Semper Pretium Neque Foundatio'),(50,'PRIMARY CARE','(407) 143-7733',5,'Non Corp.'),(51,'SPECIALIST','(233) 636-9204',4,'At Velit Associates'),(52,'SPECIALIST','(974) 720-3517',1,'Lectus Foundation'),(53,'SPECIALIST','(338) 274-1275',6,'Quis Diam Pellentesque Ltd'),(54,'SPECIALIST','(512) 550-6760',3,'Gravida Nunc Sed Incorporated'),(55,'SPECIALIST','(380) 514-5541',2,'Ullamcorper Incorporated'),(56,'SPECIALIST','(749) 881-5213',5,'Quis Urna Consulting'),(57,'SPECIALIST','(311) 876-3600',7,'Suscipit Nonummy LLP'),(58,'SPECIALIST','(281) 399-3570',2,'Maecenas Corp.'),(59,'SPECIALIST','(624) 544-4367',4,'Metus Eu Foundation'),(60,'SPECIALIST','(995) 883-1553',9,'Varius Orci In Corp.'),(61,'HOSPITAL','(491) 997-1457',6,'Congue A Aliquet LLC'),(62,'HOSPITAL','(929) 413-1225',7,'Ipsum Dolor Sit Associates'),(63,'HOSPITAL','(723) 326-4513',3,'Feugiat Placerat LLC'),(64,'HOSPITAL','(150) 289-4310',1,'Ante Blandit LLP'),(65,'HOSPITAL','(928) 385-5897',10,'Sit Amet Corporation'),(66,'HOSPITAL','(786) 489-3430',10,'Sit Amet Ultricies Corp.'),(67,'HOSPITAL','(634) 208-7088',7,'Ultricies Incorporated'),(68,'HOSPITAL','(679) 333-9754',7,'Tincidunt Consulting'),(69,'HOSPITAL','(543) 832-9525',5,'Neque Nullam Ut Industries'),(70,'HOSPITAL','(962) 875-3582',9,'Dui Fusce Company'),(71,'PRIMARY CARE','(642) 965-8201',8,'Facilisis LLP'),(72,'PRIMARY CARE','(393) 907-4934',2,'Nulla Company'),(73,'PRIMARY CARE','(877) 974-4709',7,'Tristique Pharetra Quisque Cor'),(74,'PRIMARY CARE','(237) 617-7262',5,'Class Aptent Taciti Industries'),(75,'PRIMARY CARE','(867) 993-4027',2,'Vitae Nibh Donec LLC'),(76,'PRIMARY CARE','(671) 767-2120',8,'Interdum Nunc Sollicitudin Cor'),(77,'PRIMARY CARE','(816) 354-5275',6,'Tempus Eu Ligula Corp.'),(78,'PRIMARY CARE','(803) 674-6200',5,'Cursus Et Magna Incorporated'),(79,'PRIMARY CARE','(141) 862-4803',10,'Sodales At Company'),(80,'PRIMARY CARE','(923) 795-3255',5,'Ipsum Cursus Consulting'),(81,'SPECIALIST','(807) 571-6218',4,'Nec Tempus LLP'),(82,'SPECIALIST','(737) 404-5070',1,'Vehicula Risus Inc.'),(83,'SPECIALIST','(897) 180-9301',2,'Lobortis Augue LLP'),(84,'SPECIALIST','(526) 462-7125',2,'Luctus Et Ultrices Institute'),(85,'SPECIALIST','(474) 892-7098',10,'Sed Pharetra Corp.'),(86,'SPECIALIST','(849) 830-3581',1,'Dui Lectus Corporation'),(87,'SPECIALIST','(395) 252-2816',10,'Lacus Etiam Bibendum Industrie'),(88,'SPECIALIST','(915) 168-6860',8,'Elit Pellentesque LLP'),(89,'SPECIALIST','(496) 991-1087',5,'Nascetur Ridiculus Industries'),(90,'SPECIALIST','(111) 436-4272',2,'Orci Lacus Inc.'),(91,'HOSPITAL','(516) 752-6268',2,'Dolor PC'),(92,'HOSPITAL','(241) 862-8858',2,'Ultrices Industries'),(93,'HOSPITAL','(609) 161-3675',5,'Nunc Institute'),(94,'HOSPITAL','(694) 661-6001',4,'Augue Scelerisque Mollis Incor'),(95,'HOSPITAL','(121) 586-7426',9,'Sed Sapien Corp.'),(96,'HOSPITAL','(454) 205-1431',4,'Magna Tellus Faucibus LLP'),(97,'HOSPITAL','(600) 643-8440',8,'Magna Cras Convallis Associate'),(98,'HOSPITAL','(257) 428-1634',3,'Odio Aliquam Vulputate Industr'),(99,'HOSPITAL','(800) 573-1526',9,'Vestibulum Massa Consulting'),(100,'HOSPITAL','(309) 701-3534',6,'Ligula Elit Industries');
/*!40000 ALTER TABLE `LOCATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MEDICAL_HISTORY`
--

DROP TABLE IF EXISTS `MEDICAL_HISTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MEDICAL_HISTORY` (
  `MED_ID` int(11) NOT NULL,
  `MED_FILE` varchar(30) NOT NULL,
  `PATIENT_ID` int(11) NOT NULL,
  PRIMARY KEY (`MED_ID`),
  KEY `idx_PATIENT_ID` (`PATIENT_ID`),
  CONSTRAINT `MEDICAL_HISTORY_ibfk_1` FOREIGN KEY (`PATIENT_ID`) REFERENCES `PATIENT` (`PATIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MEDICAL_HISTORY`
--

LOCK TABLES `MEDICAL_HISTORY` WRITE;
/*!40000 ALTER TABLE `MEDICAL_HISTORY` DISABLE KEYS */;
INSERT INTO `MEDICAL_HISTORY` VALUES (1,'DVT',7700000),(2,'DVT',7700001),(3,'DVT',7700002),(4,'Left Leg Fracture',7700003),(5,'Right Leg Fracture',7700004),(6,'Spinal Fusion',7700005),(7,'Spinal Fusion',7700006),(8,'Diabetes',7700007),(9,'Diabetes',7700008),(10,'Chest Pain',7700009),(11,'Chest Pain',7700010),(12,'Chest Pain',7700011),(13,'Chest Pain',7700012),(14,'Chest Pain',7700013),(15,'Chest Pain',7700014),(16,'Head Trauma',7700015),(17,'Kidney Stone',7700016),(18,'Kidney Stone',7700017),(19,'Gout',7700018),(20,'Elevated Troponin',7700019),(21,'Elevated Troponin',7700020),(22,'Sickle Cell Anemia',7700021),(23,'Anemia',7700022),(24,'Anemia',7700023),(25,'Anemia',7700024),(26,'DVT',7700025),(27,'DVT',7700026),(28,'DVT',7700027),(29,'Left Leg Fracture',7700028),(30,'Right Leg Fracture',7700029),(31,'Spinal Fusion',7700030),(32,'Spinal Fusion',7700031),(33,'Diabetes',7700032),(34,'Diabetes',7700033),(35,'Chest Pain',7700034),(36,'Chest Pain',7700035),(37,'Chest Pain',7700036),(38,'Chest Pain',7700037),(39,'Chest Pain',7700038),(40,'Chest Pain',7700039),(41,'Head Trauma',7700040),(42,'Kidney Stone',7700041),(43,'Kidney Stone',7700042),(44,'Gout',7700043),(45,'Elevated Troponin',7700044),(46,'Elevated Troponin',7700045),(47,'Sickle Cell Anemia',7700046),(48,'Anemia',7700047),(49,'Anemia',7700048),(50,'Anemia',7700049),(51,'DVT',7700050),(52,'DVT',7700051),(53,'DVT',7700052),(54,'Left Leg Fracture',7700053),(55,'Right Leg Fracture',7700054),(56,'Spinal Fusion',7700055),(57,'Spinal Fusion',7700056),(58,'Diabetes',7700057),(59,'Diabetes',7700058),(60,'Chest Pain',7700059),(61,'Chest Pain',7700060),(62,'Chest Pain',7700061),(63,'Chest Pain',7700062),(64,'Chest Pain',7700063),(65,'Chest Pain',7700064),(66,'Head Trauma',7700065),(67,'Kidney Stone',7700066),(68,'Kidney Stone',7700067),(69,'Gout',7700068),(70,'Elevated Troponin',7700069),(71,'Elevated Troponin',7700070),(72,'Sickle Cell Anemia',7700071),(73,'Anemia',7700072),(74,'Anemia',7700073),(75,'Anemia',7700074),(76,'DVT',7700075),(77,'DVT',7700076),(78,'DVT',7700077),(79,'Left Leg Fracture',7700078),(80,'Right Leg Fracture',7700079),(81,'Spinal Fusion',7700080),(82,'Spinal Fusion',7700081),(83,'Diabetes',7700082),(84,'Diabetes',7700083),(85,'Chest Pain',7700084),(86,'Chest Pain',7700085),(87,'Chest Pain',7700086),(88,'Chest Pain',7700087),(89,'Anxiety',7700088),(90,'Chest Pain',7700089),(91,'Chest Pain',7700090),(92,'Bone Cancer',7700091),(93,'Pleural Effusion',7700092),(94,'Pleural Effusion',7700093),(95,'Lymphoma',7700094),(96,'Lung Cancer',7700095),(97,'Lung Cancer',7700096),(98,'Pancreatic Cancer',7700097),(99,'Throat Cancer',7700098),(100,'Anxiety',7700099);
/*!40000 ALTER TABLE `MEDICAL_HISTORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PATIENT`
--

DROP TABLE IF EXISTS `PATIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PATIENT` (
  `PATIENT_ID` int(11) NOT NULL,
  `PATIENT_AGE` int(3) NOT NULL,
  `PATIENT_GENDER` varchar(1) NOT NULL,
  `MED_ID` int(11) NOT NULL,
  `DOC_ID` int(11) NOT NULL,
  `INSUR_ID` int(11) DEFAULT NULL,
  `PATIENT_FNAME` varchar(11) NOT NULL,
  `PATIENT_LNAME` varchar(11) NOT NULL,
  PRIMARY KEY (`PATIENT_ID`),
  UNIQUE KEY `PATIENT_ID` (`PATIENT_ID`),
  KEY `idx_MED_ID` (`MED_ID`),
  KEY `idx_DOC_ID` (`DOC_ID`),
  KEY `idx_INSUR_ID` (`INSUR_ID`),
  CONSTRAINT `PATIENT_ibfk_2` FOREIGN KEY (`DOC_ID`) REFERENCES `DOCTOR` (`DOC_ID`),
  CONSTRAINT `PATIENT_ibfk_3` FOREIGN KEY (`INSUR_ID`) REFERENCES `INSURANCE` (`INSUR_ID`),
  CONSTRAINT `PATIENT_ibfk_4` FOREIGN KEY (`MED_ID`) REFERENCES `MEDICAL_HISTORY` (`MED_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PATIENT`
--

LOCK TABLES `PATIENT` WRITE;
/*!40000 ALTER TABLE `PATIENT` DISABLE KEYS */;
INSERT INTO `PATIENT` VALUES (7700000,5,'M',1,188,479,'Bo','Hardin'),(7700001,5,'M',2,100,480,'Lane','Cash'),(7700002,5,'M',3,163,481,'Chaim','Terry'),(7700003,5,'M',4,165,482,'Ryder','Green'),(7700004,5,'M',5,175,483,'Giselle','Chambers'),(7700005,5,'M',6,106,484,'Melyssa','Branch'),(7700006,5,'M',7,153,485,'Odysseus','James'),(7700007,5,'M',8,180,486,'Jelani','Albert'),(7700008,5,'M',9,127,487,'Kelsie','Horton'),(7700009,5,'M',10,104,488,'Claire','Mooney'),(7700010,80,'M',11,106,489,'Lane','Young'),(7700011,80,'M',12,167,490,'Lee','Rogers'),(7700012,80,'M',13,117,491,'Prescott','Erickson'),(7700013,80,'M',14,133,492,'Eleanor','Pierce'),(7700014,80,'M',15,117,493,'Catherine','Morin'),(7700015,80,'M',16,120,494,'Shannon','Acevedo'),(7700016,80,'M',17,175,495,'Paki','Houston'),(7700017,80,'M',18,152,496,'Aiko','Zimmerman'),(7700018,80,'M',19,166,497,'Myles','Romero'),(7700019,80,'M',20,135,498,'Hiroko','Ramos'),(7700020,63,'M',21,145,499,'Jane','Bentley'),(7700021,63,'M',22,115,500,'Elvis','Newman'),(7700022,63,'M',23,198,501,'Darius','Cortez'),(7700023,63,'M',24,156,502,'Dorian','Clay'),(7700024,63,'M',25,179,503,'Joelle','May'),(7700025,63,'M',26,122,504,'Jeanette','Woodard'),(7700026,63,'M',27,176,505,'Mariam','Blankenship'),(7700027,63,'M',28,106,506,'Norman','Crosby'),(7700028,63,'M',29,113,507,'Madonna','Freeman'),(7700029,63,'M',30,101,508,'Venus','Kent'),(7700030,42,'M',31,115,509,'Selma','English'),(7700031,42,'M',32,106,510,'Dahlia','Waller'),(7700032,42,'M',33,145,511,'Vivian','Stokes'),(7700033,42,'M',34,189,512,'Brenden','Boyer'),(7700034,42,'M',35,199,513,'Aurora','Dorsey'),(7700035,42,'M',36,187,514,'Ulysses','Dixon'),(7700036,42,'M',37,186,515,'Hop','Moon'),(7700037,42,'M',38,155,516,'Bo','Stafford'),(7700038,42,'M',39,154,517,'Galena','Torres'),(7700039,42,'M',40,152,518,'Micah','Bradford'),(7700040,18,'M',41,154,519,'Nicole','Lawson'),(7700041,18,'M',42,187,520,'Peter','Olsen'),(7700042,18,'M',43,124,521,'Blaze','Ayala'),(7700043,18,'M',44,134,522,'Edan','Hicks'),(7700044,18,'M',45,135,523,'Mariko','Sexton'),(7700045,18,'M',46,189,524,'Kameko','Dotson'),(7700046,18,'M',47,187,525,'Wylie','Colon'),(7700047,18,'M',48,145,526,'Wynter','King'),(7700048,18,'M',49,187,527,'Jessica','Duran'),(7700049,18,'M',50,187,528,'Roary','Rollins'),(7700050,23,'F',51,149,529,'Elvis','Casey'),(7700051,23,'F',52,132,530,'Kameko','Forbes'),(7700052,23,'F',53,156,531,'Bo','Tillman'),(7700053,23,'F',54,178,532,'Aline','Patrick'),(7700054,23,'F',55,112,533,'Jescie','Griffin'),(7700055,23,'F',56,106,534,'Kai','Langley'),(7700056,23,'F',57,110,535,'Blair','Huber'),(7700057,23,'F',58,111,536,'Levi','Cote'),(7700058,23,'F',59,148,537,'Rajah','Peterson'),(7700059,23,'F',60,148,538,'Tashya','Berg'),(7700060,65,'F',61,197,539,'Kennedy','Hampton'),(7700061,65,'F',62,146,540,'Zeph','Guthrie'),(7700062,65,'F',63,147,541,'Chantale','Simon'),(7700063,65,'F',64,185,542,'Zeus','Mclaughlin'),(7700064,65,'F',65,146,543,'Chantale','Estes'),(7700065,65,'F',66,145,544,'Lane','Cooke'),(7700066,65,'F',67,149,545,'Idola','Hayden'),(7700067,65,'F',68,178,546,'Herrod','Rivas'),(7700068,65,'F',69,145,547,'Vladimir','Leblanc'),(7700069,65,'F',70,142,548,'Cheyenne','Vargas'),(7700070,92,'F',71,165,549,'Jane','Wilkerson'),(7700071,92,'F',72,189,550,'Lavinia','Odom'),(7700072,92,'F',73,192,551,'Michael','Avery'),(7700073,92,'F',74,194,552,'Sloane','Blevins'),(7700074,92,'F',75,178,553,'Imani','Larson'),(7700075,92,'F',76,146,554,'Louis','Henderson'),(7700076,92,'F',77,147,555,'Lael','Odom'),(7700077,92,'F',78,142,556,'Kim','Weber'),(7700078,92,'F',79,125,557,'Vivian','Murray'),(7700079,92,'F',80,178,558,'Dahlia','Leon'),(7700080,14,'F',81,179,559,'Hakeem','Savage'),(7700081,14,'F',82,175,560,'Sheila','Horn'),(7700082,14,'F',83,101,561,'Daryl','Boyer'),(7700083,14,'F',84,100,562,'Oren','Brooks'),(7700084,14,'F',85,168,563,'Keaton','Foreman'),(7700085,14,'F',86,187,564,'Wynne','Burgess'),(7700086,14,'F',87,101,565,'Hanna','Gilliam'),(7700087,14,'F',88,106,566,'Cyrus','Grant'),(7700088,14,'F',89,192,567,'Nicholas','Carrillo'),(7700089,14,'F',90,194,568,'Hiram','York'),(7700090,51,'F',91,178,569,'Tatum','Mays'),(7700091,51,'F',92,173,570,'Lysandra','Gilmore'),(7700092,51,'F',93,172,571,'Anthony','Vinson'),(7700093,51,'F',94,171,572,'Jolie','Harper'),(7700094,51,'F',95,170,573,'Roth','Perkins'),(7700095,51,'F',96,170,574,'Michael','Anthony'),(7700096,51,'F',97,170,575,'Desirae','Roberts'),(7700097,51,'F',98,170,576,'Benjamin','Nieves'),(7700098,51,'F',99,170,577,'Chaney','Mccormick'),(7700099,51,'F',100,146,578,'Ryan','Moon');
/*!40000 ALTER TABLE `PATIENT` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-16 13:49:28
