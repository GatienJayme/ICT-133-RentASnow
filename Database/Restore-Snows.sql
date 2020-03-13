DROP DATABASE IF EXISTS `snows`;
CREATE DATABASE  IF NOT EXISTS `snows` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `snows`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: snows
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `title` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `text` varchar(5000) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_news_users1_idx` (`user_id`),
  CONSTRAINT `fk_news_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rents`
--

DROP TABLE IF EXISTS `rents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(45) DEFAULT NULL,
  `start_on` date NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tbllocation_tblClient1` (`user_id`),
  CONSTRAINT `FK_rents_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rentsdetails`
--

DROP TABLE IF EXISTS `rentsdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rentsdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '	',
  `snow_id` int(10) NOT NULL,
  `rent_id` int(11) NOT NULL,
  `nbDays` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'sorti',
  PRIMARY KEY (`id`),
  KEY `fk_tblLocationSurf_tblsurf` (`snow_id`),
  KEY `fk_tblLocationSurf_tbllocation1` (`rent_id`),
  CONSTRAINT `FK_rentsdetails_rents` FOREIGN KEY (`rent_id`) REFERENCES `rents` (`id`),
  CONSTRAINT `FK_rentsdetails_snows` FOREIGN KEY (`snow_id`) REFERENCES `snows` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `snows`
--

DROP TABLE IF EXISTS `snows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `snows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(6) NOT NULL,
  `length` int(4) unsigned NOT NULL,
  `state` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '0 = new\n1 = good\n2 = old\n4 = dead\n',
  `snowtype_id` int(11) NOT NULL,
  `available` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `snow_code` (`code`),
  KEY `fk_snows_snowtypes1_idx` (`snowtype_id`),
  CONSTRAINT `fk_snows_snowtypes1` FOREIGN KEY (`snowtype_id`) REFERENCES `snowtypes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `snowtypes`
--

DROP TABLE IF EXISTS `snowtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `snowtypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pricenew` int(11) DEFAULT NULL,
  `pricegood` int(11) DEFAULT NULL,
  `priceold` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` int(1) NOT NULL DEFAULT '1',
  `firstname` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phonenumber` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userEmailAddress` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'snows'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-06 15:30:57

INSERT INTO users (firstname,lastname,email,password,phonenumber) VALUES ('Lenore','Goff','diam@a.edu','D3ABA859-116F-F22A-C150-01323657253C','(541) 619-9181'),('Adara','Douglas','felis.orci.adipiscing@NullamenimSed.com','B0A26EAC-9BAC-543B-3754-3789F1E51069','(348) 156-2273'),('Christian','Heath','sit.amet.luctus@lobortisultricesVivamus.com','597C9CBB-4724-52D5-2329-7A3249BF3EF2','(544) 522-2121'),('Keith','Roberson','ac@gravida.ca','8EA40FCA-4441-1EBB-DF38-7BA35550CA63','(876) 638-7957'),('Leilani','Harrison','mi.lacinia.mattis@cubilia.com','A3324B49-34C5-716F-6D2C-69431C861CA7','(450) 832-3106'),('Anne','Burks','vitae.diam.Proin@euaccumsan.com','CBEF1DFA-A4FF-055C-0518-B7E60431EECA','(235) 610-1745'),('Kane','Briggs','orci@massaVestibulum.net','307E077D-FF79-75BE-D9FD-32247BFE2FE6','(153) 579-8150'),('Lester','Crosby','eget.ipsum.Donec@posuere.net','5E5D49CA-1B22-818D-4D57-90D254EFC2AC','(963) 467-9898'),('Iona','Doyle','ut.erat.Sed@erat.ca','DE91BB40-7196-2483-3B6B-33DE2F8D834A','(803) 937-6668'),('Todd','Nolan','tellus@orciadipiscingnon.org','00D14E13-CB81-03AD-EDA7-6B46BB41D63D','(715) 962-1477');
INSERT INTO users (firstname,lastname,email,password,phonenumber) VALUES ('Rama','Wilson','fermentum@acturpisegestas.org','B4F53A70-6734-0892-79E0-6C6B198439DF','(723) 346-7908'),('Amir','Riley','magnis@sitametluctus.com','4C41DEA6-8D67-BF24-94EA-39F3DE88A1C9','(693) 486-9781'),('Preston','Moses','Vivamus.nibh.dolor@ut.net','6320909E-7DF1-6B6D-4B5A-BCDB5B9DFDE7','(112) 961-4671'),('Shaine','Parker','litora.torquent.per@non.org','7E7B6121-CDC5-717A-590F-70F2706E4BF4','(104) 726-7227'),('Cassandra','Mcclure','malesuada.vel@non.edu','F054B7F5-C786-0858-9B02-FB4328B2A9FC','(316) 961-0425'),('Brenda','Fitzgerald','et@posuere.com','A87BB609-7703-9425-2055-F49BE932D3E2','(767) 365-7919'),('Uriel','Armstrong','et.magnis@ligulaDonecluctus.net','727E9869-D713-8353-0018-797050971EF8','(335) 387-3963'),('Keaton','Conley','mollis.dui@nibh.edu','C00B94F3-70FD-2843-7C47-8D55CBC89CFD','(312) 931-6358'),('Victor','Newman','magnis.dis@laoreet.edu','4C64F8C0-AC0C-8B1C-66B8-CA5EEA326E80','(348) 102-9800'),('Rhona','Hammond','elit@nibh.edu','52C16D94-648C-02E8-DD5E-04D0EF6B6927','(526) 785-0584');
INSERT INTO users (firstname,lastname,email,password,phonenumber) VALUES ('Nasim','Ochoa','Integer.aliquam.adipiscing@sempereratin.org','606FBF99-D383-649D-9C78-92FE091B3C9B','(653) 191-2288'),('Cameron','Rodriquez','convallis@bibendum.edu','29DE54E9-B3B7-7882-985D-6D472B1661C7','(349) 407-1458'),('Robin','Buckner','Sed@nonluctus.org','88A1E3E4-A3A6-6ADE-A597-246E6ED2AE8F','(927) 645-7526'),('Adara','Harris','sit@ornaretortor.ca','F9C47AC9-B0B2-8A0C-3D00-822298725AA4','(929) 500-3465'),('Ivor','Kidd','pretium.neque.Morbi@Aenean.com','9BF46216-0CA5-D44B-6016-93B99E747D96','(969) 658-8407'),('Colorado','Lowery','eget.magna.Suspendisse@Quisqueimperdieterat.ca','4C4CB716-2FE2-12D3-506C-5E90458A6CD1','(961) 504-6821'),('Echo','Cummings','odio.vel@aenimSuspendisse.edu','B957F6B3-664A-3DFD-1950-9350EE58AF1E','(892) 489-0097'),('Kyla','Leach','arcu.eu.odio@eget.org','96652995-E44C-30ED-F765-1E02376C6BC8','(570) 964-1045'),('Lacy','Byrd','Mauris.vestibulum.neque@ipsumSuspendissenon.co.uk','E823B727-3703-4416-9873-40C15D194317','(192) 654-8337'),('Ingrid','Vazquez','Maecenas.iaculis@a.ca','32C6ECDE-2ECD-E052-D0F6-8C77B5F101E0','(768) 507-7658');
INSERT INTO users (firstname,lastname,email,password,phonenumber) VALUES ('Zena','Arnold','non.arcu.Vivamus@arcuVestibulumante.co.uk','EC117A1F-E800-70FB-3BB8-B03BFE4A539E','(754) 487-1676'),('Lana','Gallegos','tincidunt.orci.quis@quamvel.ca','8EE60AA2-DC29-853B-56F8-C7D2914EBAAC','(640) 257-4427'),('Lisandra','Watkins','in@orciinconsequat.edu','D7CB7A80-2560-DC68-C9E8-C3B4172BB13A','(438) 369-8814'),('Montana','Serrano','Nullam@magnanecquam.net','568F3D42-C6B5-B1AE-A27B-152F3D1B7084','(595) 443-7224'),('Gabriel','Bennett','In.nec@eratsemper.co.uk','CA304A14-927A-D60D-3FAC-97DBD340C7D2','(671) 206-1545'),('Porter','Hancock','ac@enimMaurisquis.co.uk','ECC8E927-7CD7-76D0-D188-BAF7EFDF4A36','(763) 258-2674'),('Finn','Schultz','laoreet.ipsum.Curabitur@est.co.uk','5C6064BF-226C-30AD-28ED-BDF21EF3FE7D','(228) 838-9649'),('Roth','Walton','sociosqu.ad@dolorquam.co.uk','9E4F2119-F61B-8E64-491C-7EF4A45715D2','(705) 649-5686'),('Hilda','Sykes','molestie@purusmauris.ca','F58CF780-2B11-63A5-3678-268552055F10','(383) 141-8482'),('Cynthia','Gillespie','id@perinceptos.net','C94CD62D-DE74-E33D-EEB8-6BB6751CF470','(135) 766-3667');
INSERT INTO users (firstname,lastname,email,password,phonenumber) VALUES ('Cairo','Skinner','in.cursus@iaculisnec.co.uk','007604DC-89D9-A30A-A7BC-8F206710B26A','(340) 133-2627'),('Tiger','Walters','tellus.Aenean.egestas@laciniaSedcongue.edu','40933C58-C296-5594-CC87-D7DB66FCF4A2','(311) 306-3970'),('Danielle','Ashley','Nunc.ac.sem@malesuadafames.com','36F709C1-A692-9EE1-E6D9-47C586DF7633','(316) 484-2067'),('Tyrone','Hayes','Nam.ac@aliquetmagna.org','FFDE9D27-ED01-4A54-64D3-63D93300CA2E','(406) 168-6159'),('David','Burke','ipsum@estconguea.net','AF93B368-90A1-7D8E-B723-0C0B37DCEFA0','(674) 679-8915'),('Clementine','Patrick','risus.odio@natoque.co.uk','5F36F542-7FA7-F556-E60B-7E9EE6059F27','(884) 214-2760'),('Lenore','Mcgee','Aliquam.erat@ametluctusvulputate.co.uk','2FCEC10D-7337-3A91-E7DD-6B330C0C6A2F','(494) 899-4299'),('Christian','Oneill','consectetuer@Donecvitae.net','8E8087F8-A305-B46E-62A5-8EC087808BD5','(978) 922-5432'),('Ciaran','Delgado','augue.eu.tempor@enimSednulla.com','72E0C947-2E30-8F94-C079-CC1AACD94AB6','(157) 681-6602'),('Merrill','Park','nisi.Aenean@vitae.org','0359CDE2-FC44-3478-76FD-7DE4E113730C','(667) 104-7818');
INSERT INTO users (firstname,lastname,email,password,phonenumber) VALUES ('Garrett','Mcconnell','Quisque@Nuncpulvinararcu.edu','4FF23A9F-7F4F-C4E6-B846-AC48503CDBB9','(498) 181-2879'),('Haviva','Mays','lectus@suscipitnonummy.co.uk','45002478-B1B5-A573-0A39-3DCBF90D6728','(575) 704-0793'),('Cairo','Shannon','erat@auctor.com','0AFF0138-DA74-3721-74AE-CFDC85D62EC6','(114) 213-2169'),('Tana','Young','leo.Vivamus@penatibusetmagnis.co.uk','B7CF594F-3FC8-9158-4635-159041A4275B','(250) 706-8482'),('Carly','Knapp','nulla.at@Sedetlibero.edu','6458760C-DCDF-FD3C-BEF7-86960C41129D','(602) 572-8518'),('Sylvester','Aguilar','Donec.felis.orci@ligulaNullam.co.uk','28BE1E92-3768-A557-6644-D9E10E556DB5','(564) 209-0242'),('Hilda','Levy','non@vitaeposuereat.net','FA77CEA3-8EBA-2386-1059-C1F7FDC3BBAE','(785) 777-9270'),('Vielka','Schroeder','Sed.eget.lacus@ProinmiAliquam.co.uk','D9A73690-4069-812B-07F2-4F481033FAB4','(307) 102-9880'),('Whoopi','Oneill','Etiam.ligula.tortor@velitAliquam.net','A50420B8-5B8B-4702-1587-2C2AC2931017','(628) 883-6042'),('Lael','Navarro','eget.mollis@sitamet.co.uk','D7A57951-6953-ADBD-2FCD-2740BB4390B4','(269) 660-8969');
INSERT INTO users (firstname,lastname,email,password,phonenumber) VALUES ('Daria','Farley','lacinia@aduiCras.com','D65BAC8D-FE5C-DFB8-BF1D-3665A32BDFD4','(465) 835-0879'),('Hector','Shaffer','vitae@eratSed.net','11137B62-81C5-5C77-8FAB-A52DA1186B68','(938) 817-6359'),('Allegra','Cline','elit.pellentesque@dolorNullasemper.net','D0AF2ACC-C304-54AC-C791-27AE4A6E7673','(965) 261-9015'),('Raven','Torres','erat.nonummy.ultricies@velitQuisque.edu','B90714B2-9FB4-715F-4131-D5DC107EC186','(284) 721-8446'),('Kiona','Garza','lectus@sitametconsectetuer.edu','DA847568-4DA4-A55E-1A77-15D173D18110','(306) 398-8788'),('Dora','Berger','sem.egestas@Sed.co.uk','57BC8D99-8141-DBAD-79C4-0D49BD458A9D','(823) 310-4297'),('Imani','Garrison','ut@pedeac.com','7EEEFB55-5816-266E-99FF-6A235E53E8D3','(547) 616-6888'),('Hadley','Hayden','Suspendisse@aliquet.co.uk','6D2E0935-37C0-E512-0D13-D2B2E1EC9F64','(258) 873-4448'),('Richard','Daniel','enim@dolorquam.edu','06E13DA8-3B02-B3BD-2CB5-663390BD59AF','(271) 566-4355'),('Belle','Hurley','Vestibulum.ut.eros@sociisnatoque.org','F940B460-F3B0-5478-1321-D69FDD91A608','(678) 121-9123');
INSERT INTO users (firstname,lastname,email,password,phonenumber) VALUES ('Ira','Bright','parturient.montes@aliquam.net','963959DC-FF8B-AA9D-7E22-5C14C66258E7','(445) 616-6143'),('Camille','Houston','enim@tellussem.net','126B1BC6-6FB4-C040-8270-BB8192E89704','(846) 584-8557'),('Stone','Miranda','mauris.sagittis@velitCraslorem.co.uk','E015D44A-055A-1C7A-D0D3-526AB6E0DF06','(124) 386-6286'),('Aileen','Buckley','vestibulum.neque@nasceturridiculusmus.co.uk','DEB2210C-51D9-AE33-F38D-C3DA3CBA3AD4','(661) 606-3602'),('Baker','Oliver','nisl.Quisque@quamPellentesque.ca','6971453C-B185-1F52-257F-798ADF0B0259','(570) 731-4036'),('Breanna','Hensley','fermentum.metus.Aenean@nonhendrerit.edu','C1E50E98-9039-CAC1-BF1D-1CD3DD37E874','(847) 976-5680'),('Clarke','Clay','diam.Duis.mi@Sedauctor.ca','C70588E1-A37F-909A-64E2-FA6253982554','(677) 660-2255'),('Hayes','Mclaughlin','Quisque.ornare.tortor@neque.ca','68D3333F-6DDC-710C-ED91-D14738999CA3','(839) 452-3352'),('Keelie','Beach','dignissim.Maecenas.ornare@aliquam.co.uk','C657BD9B-A155-C712-78A3-C55B20AD6128','(845) 700-7920'),('Rhoda','Mclaughlin','Praesent.luctus@elementum.org','DC191EF5-5C5D-7222-810A-3C68DF3534C0','(607) 974-0533');
INSERT INTO users (firstname,lastname,email,password,phonenumber) VALUES ('Samuel','Blankenship','enim.Curabitur@vulputate.edu','F9F2EBC1-9A6B-0D46-F02B-D321D9FD6640','(794) 227-3362'),('Yuri','Holman','lectus.rutrum@facilisis.co.uk','A51E13E0-EB79-036A-512A-73CCC3213525','(110) 675-2883'),('Kellie','Nelson','non@lectus.com','B2C85771-7F84-0ADE-49F0-A13296CAF21F','(294) 860-2791'),('Elaine','Cameron','leo@vel.com','924D3556-BC2A-7593-26EA-6F153DE6DDCD','(535) 725-3670'),('Darius','Terrell','pretium.et@elitpretium.edu','E11DAF14-8E15-A9AE-C25D-242C92A4FFC7','(602) 772-0249'),('Alma','Hurst','dictum@infaucibusorci.ca','0C7D094C-7AAE-5657-9A71-858E096FFA25','(483) 523-9371'),('Rafael','Barlow','erat@auctorveliteget.net','507F82D2-31B3-D5E2-B281-D63F42A6F201','(321) 403-1532'),('Rashad','Larsen','vehicula.risus@et.ca','28BAFD10-48D9-94FD-EAEA-E4EA3BDDBF66','(482) 406-2484'),('Solomon','Yang','cursus.luctus@ante.ca','7807E37D-2717-A7B5-E6A5-A4DED0375C63','(749) 985-5257'),('Holly','Crosby','elit@Aenean.net','4E3B9755-91F5-97BB-D15E-54374BB8168B','(901) 102-1157');
INSERT INTO users (firstname,lastname,email,password,phonenumber) VALUES ('Bianca','Terrell','egestas.Sed.pharetra@Inscelerisquescelerisque.org','71D24344-6D7E-CD3D-52BA-DD74F95BAF00','(982) 129-3636'),('Rae','Hoover','ultricies.adipiscing@risus.ca','B7DAD358-9994-7443-2294-B50B2C88C654','(360) 361-6208'),('Tobias','Stevenson','libero@atortorNunc.edu','7E0EEC57-3C0C-6BAD-EAEB-71CCB5986AFD','(671) 882-8323'),('Bernard','Rush','in.dolor.Fusce@auctorquistristique.ca','F372DD3B-7E78-ACE5-2BFA-A7815A0C4B2A','(697) 437-1173'),('Levi','Cooper','Cras@euismodurnaNullam.com','E31647AC-10F3-8D7E-9EC8-235F9228B483','(283) 398-0088'),('Colby','Lindsay','eu@purus.org','FAF98E16-AAC6-755D-E994-6BE4A2A3188B','(246) 209-8975'),('Ursula','Moses','Cras.eu@perinceptos.org','5EA98739-3A27-0131-FD70-AE9D6FF772E8','(855) 157-2867'),('Dieter','Aguilar','penatibus@odioapurus.edu','D8D6F62B-4601-A073-81EB-2F7312A9D06B','(703) 228-6596'),('Vielka','Hansen','dui.nec@metusInnec.edu','E7F99FC7-1F39-BE12-0E61-2B1C20043275','(393) 769-9806'),('Alea','Pate','Nulla@laciniaatiaculis.edu','17FF5173-BC4D-8F85-0CDA-D69710766C9A','(569) 597-1607');

update users set type=2 where rand() < 0.05;

INSERT INTO news (title, date, text, user_id) VALUES
	('Dingue !!!','2020-01-02','Notre pote Pat d\u00e9croche la m\u00e9daille de bronze aux JoJ !!!',(SELECT id FROM users ORDER BY rand() LIMIT 1)),
	('Enfin','2019-12-02','Le Burton X512 est l\u00e0! Selon les sp\u00e9cialistes, c\'est ce qui se fait de mieux pour le Big Air.',(SELECT id FROM users ORDER BY rand() LIMIT 1)),
	('Des renforts','2020-01-01','Nous accueillons Lo\u00efc d\u00e8s le mois prochain pour renforcer notre \u00e9quipe de pr\u00e9parateurs',(SELECT id FROM users ORDER BY rand() LIMIT 1));
    
INSERT INTO snowtypes (model,brand,photo,description,pricenew,pricegood,priceold) VALUES
  (
    'B101',
    'Burton',
    'B101.jpg',
    'B101 description', FLOOR(rand()*10+20),FLOOR(rand()*10+10),FLOOR(rand()*10+3)
  ),
  (
    'B126',
    'Free Thinker',
    'B126.jpg',
    'B126 description', FLOOR(rand()*10+20),FLOOR(rand()*10+10),FLOOR(rand()*10+3)
  ),
  (
    'B327',
    'Burton',
    'B327.jpg',
    'B327 description', FLOOR(rand()*10+20),FLOOR(rand()*10+10),FLOOR(rand()*10+3)
  ),
  (
    'K067',
    'Prior',
    'K067.jpg',
    'K067 description', FLOOR(rand()*10+20),FLOOR(rand()*10+10),FLOOR(rand()*10+3)
  ),
  (
    'K266',
    'KR',
    'K266.jpg',
    'K266 description', FLOOR(rand()*10+20),FLOOR(rand()*10+10),FLOOR(rand()*10+3)
  ),
  (
    'K409',
    'KR',
    'K409.jpg',
    'K409 description', FLOOR(rand()*10+20),FLOOR(rand()*10+10),FLOOR(rand()*10+3)
  ),
  (
    'N100',
    'NSnow',
    'N100.jpg',
    'N100 description', FLOOR(rand()*10+20),FLOOR(rand()*10+10),FLOOR(rand()*10+3)
  ),
  (
    'N754',
    'NSnow',
    'N754.jpg',
    'N754 description', FLOOR(rand()*10+20),FLOOR(rand()*10+10),FLOOR(rand()*10+3)
  ),
  (
    'P067',
    'Prior',
    'P067.jpg',
    'P067 description', FLOOR(rand()*10+20),FLOOR(rand()*10+10),FLOOR(rand()*10+3)
  ),
  (
    'P165',
    'Prior',
    'P165.jpg',
    'P165 description', FLOOR(rand()*10+20),FLOOR(rand()*10+10),FLOOR(rand()*10+3)
  );
  
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
INSERT INTO snows (code,length,state, available,snowtype_id) VALUES (CAST(100000+FLOOR(900000*rand()) as CHAR(6)),150+5*FLOOR(rand()*5),1+FLOOR(4*rand()),1,(SELECT id FROM snowtypes ORDER BY rand() LIMIT 1));
UPDATE snows set available = 0 WHERE rand() < 0.5;
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
INSERT INTO rents(status,start_on,user_id) VALUES ('ouvert',(SELECT NOW() - 2 - INTERVAL FLOOR(RAND() * 140) DAY),(SELECT id FROM users ORDER BY rand() LIMIT 1));
update rents set status='fermé' WHERE DATEDIFF(NOW(),start_on) > 15;

INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
INSERT INTO rentsdetails (rent_id,snow_id,nbDays,status) VALUES ((SELECT id FROM rents ORDER BY rand() LIMIT 1),(SELECT id FROM snows ORDER BY rand() LIMIT 1),5+FLOOR(rand()*30),'...');
update rentsdetails inner join rents on rent_id = rents.id set rentsdetails.status = rents.status;
 