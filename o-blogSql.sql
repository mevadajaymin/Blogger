-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: o-blog
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `tbl_department`
--

DROP TABLE IF EXISTS `tbl_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_department` (
  `DeptId` int NOT NULL AUTO_INCREMENT,
  `DeptName` varchar(45) NOT NULL,
  PRIMARY KEY (`DeptId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_department`
--

LOCK TABLES `tbl_department` WRITE;
/*!40000 ALTER TABLE `tbl_department` DISABLE KEYS */;
INSERT INTO `tbl_department` VALUES (1,'IT'),(2,'HR'),(3,'Marketing'),(4,'Management'),(6,'Account'),(16,'HR'),(17,'eererer');
/*!40000 ALTER TABLE `tbl_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_designation`
--

DROP TABLE IF EXISTS `tbl_designation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_designation` (
  `DesigId` int NOT NULL AUTO_INCREMENT,
  `DesigName` varchar(45) NOT NULL,
  PRIMARY KEY (`DesigId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_designation`
--

LOCK TABLES `tbl_designation` WRITE;
/*!40000 ALTER TABLE `tbl_designation` DISABLE KEYS */;
INSERT INTO `tbl_designation` VALUES (1,'Manager');
/*!40000 ALTER TABLE `tbl_designation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_employee`
--

DROP TABLE IF EXISTS `tbl_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_employee` (
  `EmpID` int NOT NULL AUTO_INCREMENT,
  `EmpName` varchar(45) NOT NULL,
  `EmpEmail` varchar(80) NOT NULL,
  `EmpGender` varchar(10) NOT NULL,
  `EmpMobile` varchar(10) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `DeptId` int NOT NULL,
  `DesigId` int NOT NULL,
  `Type` varchar(10) NOT NULL,
  PRIMARY KEY (`EmpID`),
  KEY `dept_FK_idx` (`DeptId`),
  KEY `desig_FK_idx` (`DesigId`),
  CONSTRAINT `dept_FK` FOREIGN KEY (`DeptId`) REFERENCES `tbl_department` (`DeptId`),
  CONSTRAINT `desig_FK` FOREIGN KEY (`DesigId`) REFERENCES `tbl_designation` (`DesigId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_employee`
--

LOCK TABLES `tbl_employee` WRITE;
/*!40000 ALTER TABLE `tbl_employee` DISABLE KEYS */;
INSERT INTO `tbl_employee` VALUES (1,'Jaymin','jay@gmail.com','male','9586233702','123',1,1,'Admin'),(2,'Raj','raj@gmail.com','male','9586233702','123',1,1,'Normal'),(3,'pooja','pooja@gmail.com','Female','9909085454','123',1,1,'Admin'),(4,'meet','meet@gmail.com','Male','8475653212','123',2,1,'Admin'),(5,'nishant','nishant@gmail.com','Male','8986847545','123',2,1,'Admin');
/*!40000 ALTER TABLE `tbl_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_post`
--

DROP TABLE IF EXISTS `tbl_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_post` (
  `PostId` int NOT NULL AUTO_INCREMENT,
  `PostDesc` varchar(5000) NOT NULL,
  `PostType` int NOT NULL,
  `PostDate` datetime NOT NULL,
  `EmpID` int NOT NULL,
  `Flag` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`PostId`),
  KEY `emp_FK_idx` (`EmpID`),
  CONSTRAINT `emp_FK` FOREIGN KEY (`EmpID`) REFERENCES `tbl_employee` (`EmpID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_post`
--

LOCK TABLES `tbl_post` WRITE;
/*!40000 ALTER TABLE `tbl_post` DISABLE KEYS */;
INSERT INTO `tbl_post` VALUES (1,'				Scene scene = new Scene(layout);\n				Stage stage = new Stage();\n				stage.setScene(scene);\n				stage.setTitle(\"reply\");\n				stage.setResizable(false);',1,'2020-10-31 00:00:00',1,0),(2,'	FXMLLoader loader = new FXMLLoader();\n				loader.setLocation(getClass().getResource(\"/resources/Reply.fxml\"));\n				AnchorPane layout = null;\n				try {\n					layout = (AnchorPane) loader.load();\n				} catch (IOException e) {\n					// TODO Auto-generated catch block',1,'2020-10-31 00:00:00',1,1),(3,'	public void handle(ActionEvent arg0) {\n				// TODO Auto-generated method stub\n				try {\n					AllQueries.setFlag(id);\n				} catch (SQLException e1) {\n					// TODO Auto-generated catch block\n					e1.printStackTrace();\n				}',0,'2020-10-31 00:00:00',1,0),(4,'public void handle(ActionEvent arg0) {\n				// TODO Auto-generated method stub\n				try {\n					AllQueries.setFlag(id);\n				} catch (SQLException e1) {\n					// TODO Auto-generated catch block\n					e1.printStackTrace();\n				}\n				FXMLLoader loader = new FXMLLoader();\n				loader.setLocation(getClass().getResource(\"/resources/Reply.fxml\"));\n				AnchorPane layout = null;\n				try {',1,'2020-10-31 00:00:00',2,1),(5,'\n      <AnchorPane layoutX=\"6.0\" layoutY=\"21.0\" prefHeight=\"565.0\" prefWidth=\"633.0\" style=\"-fx-background-color: grey;\" AnchorPane.bottomAnchor=\"14.0\" AnchorPane.leftAnchor=\"6.0\" AnchorPane.rightAnchor=\"11.0\" AnchorPane.topAnchor=\"21.0\">\n         <children>\n            <AnchorPane layoutX=\"14.0\" layoutY=\"54.0\" prefHeight=\"469.0\" prefWidth=\"50.0\" style=\"-fx-background-color: linear-gradient(to right top, #051937, #004d7a, #008793, #00bf72, #a8eb12);;\" AnchorPane.bottomAnchor=\"53.0\" AnchorPane.leftAnchor=\"14.0\" AnchorPane.rightAnchor=\"331.0\" AnchorPane.topAnchor=\"54.0\">\n               <children>\n                  <VBox layoutX=\"54.0\" layoutY=\"111.0\" prefHeight=\"120.0\" prefWidth=\"143.0\" AnchorPane.bottomAnchor=\"251.0\" AnchorPane.leftAnchor=\"54.0\" AnchorPane.rightAnchor=\"67.0\" AnchorPane.topAnchor=\"111.0\">\n                     <children>\n                        <Label text=\"Everest Kid\" textAlignment=\"CENTER\" textFill=\"#f8f6f6\">\n                           <font>\n                              <Font name=\"System Bold\" size=\"24.0\" />\n                           </font>\n                        </Label>\n                        <Label prefHeight=\"25.0\" prefWidth=\"155.0\" text=\"FX Developer\" textAlignment=\"RIGHT\" textFill=\"#f8f4f4\">\n                           <font>\n                              <Font size=\"20.0\" />\n                           </font>\n                        </Label>\n                     </children>',1,'2020-10-31 00:00:00',1,1),(6,'ript from command line} Something like this Run JUnit from command line\n3. Run your batch file (run.bat)\nI may not have provided the exact code but thats where you should be heading if you wish to run your JUnit tests from command line.\nNOTE / FYI : Maven does not require any installation or approval..You just download the zip and unzip it and set environment variable and thats it.',0,'2020-10-31 00:00:00',2,0),(7,'gfghfghgfh',0,'2020-10-31 00:00:00',1,0),(8,'dfvfdvd',0,'2020-10-31 00:00:00',1,0),(9,'n j jh jh ',1,'2020-10-31 00:00:00',1,0),(10,'gggg',1,'2020-10-31 00:00:00',1,0),(11,'ddd',1,'2020-10-31 00:00:00',1,0),(12,'asdasdadads',1,'2020-10-31 00:00:00',1,0),(13,'dd',1,'2020-10-31 00:00:00',1,0),(14,'asds',1,'2020-10-31 00:00:00',1,0),(15,'dd',1,'2020-10-31 00:00:00',1,0),(16,'dsssdssddddddddddddddd',1,'2020-10-31 00:00:00',1,0),(17,'sddfsdfdsff',1,'2020-10-31 00:00:00',1,0),(18,'sgfdfgfgdfg',1,'2020-10-31 00:00:00',1,0),(20,'aEdfeRWERER',1,'2020-10-31 00:00:00',1,0),(21,'SDFFWRWRWR',1,'2020-10-31 00:00:00',1,0),(22,'sdfsfsf',1,'2020-10-31 00:00:00',1,0),(23,'dvvsvsv',1,'2020-10-31 00:00:00',2,0),(24,'str',1,'2020-10-31 00:00:00',2,1),(26,'Google Drive Link : https://drive.google.com/file/d/1mNQVn5VLBJvBnD82Si1q1aEzsbyefM7c/view?usp=sharing\n\nSync URL of Sakhi : http://erp.sakhimilk.com:2225/sakhi_sarthak/#http://erp.sakhimilk.com:2223/',1,'2020-10-31 00:00:00',3,0);
/*!40000 ALTER TABLE `tbl_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_reply`
--

DROP TABLE IF EXISTS `tbl_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_reply` (
  `ReplyId` int NOT NULL AUTO_INCREMENT,
  `ReplyName` varchar(5000) NOT NULL,
  `ReplyDate` datetime NOT NULL,
  `PostId` int NOT NULL,
  `EmpId` int NOT NULL,
  PRIMARY KEY (`ReplyId`),
  KEY `PostFK_idx` (`PostId`),
  KEY `EmpFK_idx` (`EmpId`),
  CONSTRAINT `EmpFK` FOREIGN KEY (`EmpId`) REFERENCES `tbl_employee` (`EmpID`),
  CONSTRAINT `PostFK` FOREIGN KEY (`PostId`) REFERENCES `tbl_post` (`PostId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_reply`
--

LOCK TABLES `tbl_reply` WRITE;
/*!40000 ALTER TABLE `tbl_reply` DISABLE KEYS */;
INSERT INTO `tbl_reply` VALUES (14,'			Scene scene = new Scene(layout);\n				Stage stage = new Stage();\n				stage.setScene(scene);\n				stage.setTitle(\"reply\");\n				stage.setResizable(false);','2020-10-31 00:00:00',2,2),(15,'public void handle(ActionEvent arg0) {\n				// TODO Auto-generated method stub\n				try {\n					AllQueries.setFlag(id);\n				} catch (SQLException e1) {\n					// TODO Auto-generated catch block\n					e1.printStackTrace();\n				}\n				FXMLLoader loader = new FXMLLoader();\n				loader.setLocation(getClass().getResource(\"/resources/Reply.fxml\"));\n				AnchorPane layout = null;\n				try {','2020-10-31 00:00:00',2,2),(16,'x.scene.control.PasswordField?>','2020-10-31 00:00:00',5,2),(17,'gdhsfhsgf','2020-10-31 00:00:00',5,2),(18,'rtsdfgzfxzcfg','2020-10-31 00:00:00',5,1),(19,'ergreegerg','2020-10-31 00:00:00',24,1),(20,'	BlogController blogController;\n	\n\n	@FXML\n	public void addDepartment(ActionEvent event) throws IOException\n	{\n		\n		FXMLLoader loader=new FXMLLoader();\n		loader.setLocation(getClass().getResource(\"/resources/DepartmentAdd.fxml\"));\n		AnchorPane root=loader.load();\n		Scene scene=new Scene(root);\n		Stage primaryStage=Main.primaryStage;\n		primaryStage.setScene(scene);\n		primaryStage.setTitle(\"Add Department\");\n		primaryStage.setResizable(false);\n		primaryStage.show();\n	}\n	@FXML\n	public void addDesignation(ActionEvent event)\n	{\n		FXMLLoader loader=new FXMLLoader();','2020-10-31 00:00:00',24,1);
/*!40000 ALTER TABLE `tbl_reply` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-02 10:51:41
