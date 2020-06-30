-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: 0.0.0.0    Database: sirius
-- ------------------------------------------------------
-- Server version	5.7.29-0ubuntu0.18.04.1

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
-- Table structure for table `DATOS_ALTEM`
--

DROP TABLE IF EXISTS `DATOS_ALTEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATOS_ALTEM` (
  `ID_ESTUDIANTE` varchar(36) NOT NULL,
  `PGA_ACOMULADO` varchar(45) DEFAULT NULL,
  `PROMEDIO_PERIODO` varchar(45) DEFAULT NULL,
  `PERIODO` varchar(24) NOT NULL,
  `NRC` varchar(20) NOT NULL,
  `MATERIA` varchar(16) NOT NULL,
  `CURSO` varchar(20) NOT NULL,
  `ASIGNATURA` varchar(120) DEFAULT NULL,
  `SESION` varchar(12) NOT NULL,
  `Lunes` varchar(35) DEFAULT NULL,
  `Martes` varchar(35) DEFAULT NULL,
  `Miercoles` varchar(35) DEFAULT NULL,
  `Jueves` varchar(35) DEFAULT NULL,
  `Viernes` varchar(35) DEFAULT NULL,
  `Sabado` varchar(35) DEFAULT NULL,
  `Domingo` varchar(35) DEFAULT NULL,
  `TIPO` varchar(12) DEFAULT NULL,
  `Hrs/Sem` int(11) DEFAULT NULL,
  `COD_ESTATUS` varchar(8) DEFAULT NULL,
  `COD_COMPONENTE` varchar(40) DEFAULT NULL,
  `TIPO_DE_CAPTURA` varchar(8) DEFAULT NULL,
  `NOTA_PARCIAL` varchar(24) DEFAULT NULL,
  `ID_DOCENTE` varchar(36) DEFAULT NULL,
  `APELLIDOS_DOCENTE` varchar(240) DEFAULT NULL,
  `NOMBRES_DOCENTE` varchar(481) DEFAULT NULL,
  `NRO_COMPONENTES` varchar(45) DEFAULT NULL,
  `FECHA` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DATOS_ESTUDIANTES_ALTEM`
--

DROP TABLE IF EXISTS `DATOS_ESTUDIANTES_ALTEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATOS_ESTUDIANTES_ALTEM` (
  `ID` varchar(36) NOT NULL,
  `NOMBRES` varchar(484) DEFAULT NULL,
  `APELLIDOS` varchar(45) DEFAULT NULL,
  `TIPO_DOC` varchar(45) DEFAULT NULL,
  `NO_DOC` varchar(45) DEFAULT NULL,
  `SEXO` varchar(45) DEFAULT NULL,
  `ESTADO_CIVIL` varchar(45) DEFAULT NULL,
  `FECHA_NACIMENTO` date DEFAULT NULL,
  `CIUDAD1` text,
  `DIRECCION1` text,
  `TELEFONO1` varchar(45) DEFAULT NULL,
  `CIUDAD2` text,
  `DIRECCION2` text,
  `TELEFONO2` varchar(45) DEFAULT NULL,
  `EMAIL` varchar(45) DEFAULT NULL,
  `PROGRAMA` varchar(45) DEFAULT NULL,
  `COD_ESTADO` varchar(8) DEFAULT NULL,
  `ESTADO` varchar(45) DEFAULT NULL,
  `COD_TIPO` varchar(4) DEFAULT NULL,
  `TIPO_ESTUDIANTE` varchar(45) DEFAULT NULL,
  `SITUACION` varchar(45) DEFAULT NULL,
  `PGA_ACOMULADO` varchar(45) DEFAULT NULL,
  `ESTRATO` varchar(45) DEFAULT NULL,
  `BECAS` varchar(45) DEFAULT NULL,
  `CERES` varchar(45) DEFAULT NULL,
  `NOMBRE_ACUDIENTE` longtext,
  `DIRECCION_ACUDIENTE` varchar(45) DEFAULT NULL,
  `TELEFONO_ACUDIENTE` varchar(76) DEFAULT NULL,
  `NIVEL_ACT` varchar(45) DEFAULT NULL,
  `PERIODO_INGRESO` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `datos_academicos`
--

DROP TABLE IF EXISTS `datos_academicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datos_academicos` (
  `ID` varchar(45) NOT NULL,
  `FECHA` varchar(45) DEFAULT NULL,
  `NRO_COMPONENTES` varchar(45) DEFAULT NULL,
  `NOMBRES_DOCENTE` varchar(45) DEFAULT NULL,
  `APELLIDOS_DOCENTE` varchar(45) DEFAULT NULL,
  `ID_DOCENTE` varchar(45) DEFAULT NULL,
  `NOTA_PARCIAL` varchar(45) DEFAULT NULL,
  `TIPO_DE_CAPTURA` varchar(45) DEFAULT NULL,
  `COD_COMPONENTE` varchar(45) DEFAULT NULL,
  `COD_ESTATUS` varchar(45) DEFAULT NULL,
  `Hrs_Sem` int(11) DEFAULT NULL,
  `TIPO` varchar(45) DEFAULT NULL,
  `Domingo` varchar(45) DEFAULT NULL,
  `Sabado` varchar(45) DEFAULT NULL,
  `Viernes` varchar(45) DEFAULT NULL,
  `Jueves` varchar(45) DEFAULT NULL,
  `Miercoles` varchar(45) DEFAULT NULL,
  `Martes` varchar(45) DEFAULT NULL,
  `Lunes` varchar(45) DEFAULT NULL,
  `SESION` varchar(45) DEFAULT NULL,
  `ASIGNATURA` varchar(45) DEFAULT NULL,
  `CURSO` varchar(45) DEFAULT NULL,
  `MATERIA` varchar(45) DEFAULT NULL,
  `NRC` varchar(45) DEFAULT NULL,
  `PERIODO` varchar(45) DEFAULT NULL,
  `PROMEDIO_PERIODO` varchar(45) DEFAULT NULL,
  `PGA_ACOMULADO` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `datos_academicos_view`
--

DROP TABLE IF EXISTS `datos_academicos_view`;
/*!50001 DROP VIEW IF EXISTS `datos_academicos_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `datos_academicos_view` AS SELECT 
 1 AS `ID`,
 1 AS `FECHA`,
 1 AS `NRO_COMPONENTES`,
 1 AS `NOMBRES_DOCENTE`,
 1 AS `APELLIDOS_DOCENTE`,
 1 AS `ID_DOCENTE`,
 1 AS `NOTA_PARCIAL`,
 1 AS `TIPO_DE_CAPTURA`,
 1 AS `COD_COMPONENTE`,
 1 AS `COD_ESTATUS`,
 1 AS `Hrs_Sem`,
 1 AS `TIPO`,
 1 AS `Domingo`,
 1 AS `Sabado`,
 1 AS `Viernes`,
 1 AS `Jueves`,
 1 AS `Miercoles`,
 1 AS `Martes`,
 1 AS `Lunes`,
 1 AS `SESION`,
 1 AS `ASIGNATURA`,
 1 AS `CURSO`,
 1 AS `MATERIA`,
 1 AS `NRC`,
 1 AS `PERIODO`,
 1 AS `PROMEDIO_PERIODO`,
 1 AS `PGA_ACOMULADO`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `estudiantes`
--

DROP TABLE IF EXISTS `estudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estudiantes` (
  `ID` varchar(45) NOT NULL,
  `NOMBRES` varchar(45) DEFAULT NULL,
  `APELLIDOS` varchar(45) DEFAULT NULL,
  `TIPO_DOC` varchar(45) DEFAULT NULL,
  `NO_DOC` varchar(45) DEFAULT NULL,
  `SEXO` varchar(45) DEFAULT NULL,
  `ESTADO_CIVIL` varchar(45) DEFAULT NULL,
  `FECHA_NACIMENTO` date DEFAULT NULL,
  `CIUDAD1` text,
  `DIRECCION1` text,
  `TELEFONO1` varchar(45) DEFAULT NULL,
  `CIUDAD2` text,
  `DIRECCION2` text,
  `TELEFONO2` varchar(45) DEFAULT NULL,
  `EMAIL` varchar(45) DEFAULT NULL,
  `PROGRAMA` varchar(45) DEFAULT NULL,
  `COD_ESTADO` varchar(45) DEFAULT NULL,
  `ESTADO` varchar(45) DEFAULT NULL,
  `COD_TIPO` varchar(45) DEFAULT NULL,
  `TIPO_ESTUDIANTE` varchar(45) DEFAULT NULL,
  `SITUACION` varchar(45) DEFAULT NULL,
  `ESTRATO` varchar(45) DEFAULT NULL,
  `BECAS` varchar(45) DEFAULT NULL,
  `CERES` varchar(45) DEFAULT NULL,
  `NOMBRE_ACUDIENTE` varchar(45) DEFAULT NULL,
  `DIRECCION_ACUDIENTE` longtext,
  `TELEFONO_ACUDIENTE` varchar(45) DEFAULT NULL,
  `NIVEL_ACT` varchar(45) DEFAULT NULL,
  `PERIODO_INGRESO` varchar(45) DEFAULT NULL,
  `PGA_ACUMULADO` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `estudiantes_view`
--

DROP TABLE IF EXISTS `estudiantes_view`;
/*!50001 DROP VIEW IF EXISTS `estudiantes_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `estudiantes_view` AS SELECT 
 1 AS `ID`,
 1 AS `NOMBRES`,
 1 AS `APELLIDOS`,
 1 AS `TIPO_DOC`,
 1 AS `NO_DOC`,
 1 AS `SEXO`,
 1 AS `ESTADO_CIVIL`,
 1 AS `FECHA_NACIMENTO`,
 1 AS `CIUDAD1`,
 1 AS `DIRECCION1`,
 1 AS `TELEFONO1`,
 1 AS `CIUDAD2`,
 1 AS `DIRECCION2`,
 1 AS `TELEFONO2`,
 1 AS `EMAIL`,
 1 AS `PROGRAMA`,
 1 AS `COD_ESTADO`,
 1 AS `ESTADO`,
 1 AS `COD_TIPO`,
 1 AS `TIPO_ESTUDIANTE`,
 1 AS `SITUACION`,
 1 AS `ESTRATO`,
 1 AS `BECAS`,
 1 AS `CERES`,
 1 AS `NOMBRE_ACUDIENTE`,
 1 AS `DIRECCION_ACUDIENTE`,
 1 AS `TELEFONO_ACUDIENTE`,
 1 AS `NIVEL_ACT`,
 1 AS `PERIODO_INGRESO`,
 1 AS `PGA_ACUMULADO`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `datos_academicos_view`
--

/*!50001 DROP VIEW IF EXISTS `datos_academicos_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `datos_academicos_view` AS select `DATOS_ALTEM`.`ID_ESTUDIANTE` AS `ID`,`DATOS_ALTEM`.`FECHA` AS `FECHA`,`DATOS_ALTEM`.`NRO_COMPONENTES` AS `NRO_COMPONENTES`,`DATOS_ALTEM`.`NOMBRES_DOCENTE` AS `NOMBRES_DOCENTE`,`DATOS_ALTEM`.`APELLIDOS_DOCENTE` AS `APELLIDOS_DOCENTE`,`DATOS_ALTEM`.`ID_DOCENTE` AS `ID_DOCENTE`,`DATOS_ALTEM`.`NOTA_PARCIAL` AS `NOTA_PARCIAL`,`DATOS_ALTEM`.`TIPO_DE_CAPTURA` AS `TIPO_DE_CAPTURA`,`DATOS_ALTEM`.`COD_COMPONENTE` AS `COD_COMPONENTE`,`DATOS_ALTEM`.`COD_ESTATUS` AS `COD_ESTATUS`,`DATOS_ALTEM`.`Hrs/Sem` AS `Hrs_Sem`,`DATOS_ALTEM`.`TIPO` AS `TIPO`,`DATOS_ALTEM`.`Domingo` AS `Domingo`,`DATOS_ALTEM`.`Sabado` AS `Sabado`,`DATOS_ALTEM`.`Viernes` AS `Viernes`,`DATOS_ALTEM`.`Jueves` AS `Jueves`,`DATOS_ALTEM`.`Miercoles` AS `Miercoles`,`DATOS_ALTEM`.`Martes` AS `Martes`,`DATOS_ALTEM`.`Lunes` AS `Lunes`,`DATOS_ALTEM`.`SESION` AS `SESION`,`DATOS_ALTEM`.`ASIGNATURA` AS `ASIGNATURA`,`DATOS_ALTEM`.`CURSO` AS `CURSO`,`DATOS_ALTEM`.`MATERIA` AS `MATERIA`,`DATOS_ALTEM`.`NRC` AS `NRC`,`DATOS_ALTEM`.`PERIODO` AS `PERIODO`,`DATOS_ALTEM`.`PROMEDIO_PERIODO` AS `PROMEDIO_PERIODO`,`DATOS_ALTEM`.`PGA_ACOMULADO` AS `PGA_ACOMULADO` from `DATOS_ALTEM` group by `DATOS_ALTEM`.`ID_ESTUDIANTE` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `estudiantes_view`
--

/*!50001 DROP VIEW IF EXISTS `estudiantes_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `estudiantes_view` AS select `DATOS_ESTUDIANTES_ALTEM`.`ID` AS `ID`,`DATOS_ESTUDIANTES_ALTEM`.`NOMBRES` AS `NOMBRES`,`DATOS_ESTUDIANTES_ALTEM`.`APELLIDOS` AS `APELLIDOS`,`DATOS_ESTUDIANTES_ALTEM`.`TIPO_DOC` AS `TIPO_DOC`,`DATOS_ESTUDIANTES_ALTEM`.`NO_DOC` AS `NO_DOC`,`DATOS_ESTUDIANTES_ALTEM`.`SEXO` AS `SEXO`,`DATOS_ESTUDIANTES_ALTEM`.`ESTADO_CIVIL` AS `ESTADO_CIVIL`,`DATOS_ESTUDIANTES_ALTEM`.`FECHA_NACIMENTO` AS `FECHA_NACIMENTO`,`DATOS_ESTUDIANTES_ALTEM`.`CIUDAD1` AS `CIUDAD1`,`DATOS_ESTUDIANTES_ALTEM`.`DIRECCION1` AS `DIRECCION1`,`DATOS_ESTUDIANTES_ALTEM`.`TELEFONO1` AS `TELEFONO1`,`DATOS_ESTUDIANTES_ALTEM`.`CIUDAD2` AS `CIUDAD2`,`DATOS_ESTUDIANTES_ALTEM`.`DIRECCION2` AS `DIRECCION2`,`DATOS_ESTUDIANTES_ALTEM`.`TELEFONO2` AS `TELEFONO2`,`DATOS_ESTUDIANTES_ALTEM`.`EMAIL` AS `EMAIL`,`DATOS_ESTUDIANTES_ALTEM`.`PROGRAMA` AS `PROGRAMA`,`DATOS_ESTUDIANTES_ALTEM`.`COD_ESTADO` AS `COD_ESTADO`,`DATOS_ESTUDIANTES_ALTEM`.`ESTADO` AS `ESTADO`,`DATOS_ESTUDIANTES_ALTEM`.`COD_TIPO` AS `COD_TIPO`,`DATOS_ESTUDIANTES_ALTEM`.`TIPO_ESTUDIANTE` AS `TIPO_ESTUDIANTE`,`DATOS_ESTUDIANTES_ALTEM`.`SITUACION` AS `SITUACION`,`DATOS_ESTUDIANTES_ALTEM`.`ESTRATO` AS `ESTRATO`,`DATOS_ESTUDIANTES_ALTEM`.`BECAS` AS `BECAS`,`DATOS_ESTUDIANTES_ALTEM`.`CERES` AS `CERES`,`DATOS_ESTUDIANTES_ALTEM`.`NOMBRE_ACUDIENTE` AS `NOMBRE_ACUDIENTE`,`DATOS_ESTUDIANTES_ALTEM`.`DIRECCION_ACUDIENTE` AS `DIRECCION_ACUDIENTE`,`DATOS_ESTUDIANTES_ALTEM`.`TELEFONO_ACUDIENTE` AS `TELEFONO_ACUDIENTE`,`DATOS_ESTUDIANTES_ALTEM`.`NIVEL_ACT` AS `NIVEL_ACT`,`DATOS_ESTUDIANTES_ALTEM`.`PERIODO_INGRESO` AS `PERIODO_INGRESO`,`DATOS_ESTUDIANTES_ALTEM`.`PGA_ACOMULADO` AS `PGA_ACUMULADO` from `DATOS_ESTUDIANTES_ALTEM` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-03 15:49:28
