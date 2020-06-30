-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: 0.0.0.0    Database: altem
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
-- Table structure for table `acciones`
--

DROP TABLE IF EXISTS `acciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acciones` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` longtext,
  `tiempo_estimado` int(11) DEFAULT NULL,
  `costo_estimado` int(11) DEFAULT NULL,
  `mensaje` longtext,
  `estrategias_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_acciones_estrategias1_idx` (`estrategias_id`),
  CONSTRAINT `fk_acciones_estrategias1` FOREIGN KEY (`estrategias_id`) REFERENCES `estrategias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `acciones_aplicadas`
--

DROP TABLE IF EXISTS `acciones_aplicadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acciones_aplicadas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha_aplicacion` date DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `acciones_id` bigint(20) NOT NULL,
  `intervenciones_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_acciones_aplicadas_acciones1_idx` (`acciones_id`),
  KEY `fk_acciones_aplicadas_intervenciones1_idx` (`intervenciones_id`),
  CONSTRAINT `fk_acciones_aplicadas_acciones1` FOREIGN KEY (`acciones_id`) REFERENCES `acciones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_acciones_aplicadas_intervenciones1` FOREIGN KEY (`intervenciones_id`) REFERENCES `intervenciones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4274 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `archivo_personal`
--

DROP TABLE IF EXISTS `archivo_personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archivo_personal` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha_reporte` date DEFAULT NULL,
  `usuarios_codigo` varchar(45) CHARACTER SET utf8 NOT NULL,
  `estudiantes_altem_codigo` varchar(45) NOT NULL,
  `estado` int(11) DEFAULT NULL,
  `riesgos_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_archivo_personal_usuarios1_idx` (`usuarios_codigo`),
  KEY `fk_archivo_personal_estudiantes_altem1_idx` (`estudiantes_altem_codigo`),
  KEY `fk_archivo_personal_riesgos1_idx` (`riesgos_id`),
  CONSTRAINT `fk_archivo_personal_estudiantes_altem1` FOREIGN KEY (`estudiantes_altem_codigo`) REFERENCES `estudiantes_altem` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_archivo_personal_riesgos1` FOREIGN KEY (`riesgos_id`) REFERENCES `riesgos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_archivo_personal_usuarios1` FOREIGN KEY (`usuarios_codigo`) REFERENCES `usuarios` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1450 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bases_datos_estudiantes`
--

DROP TABLE IF EXISTS `bases_datos_estudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bases_datos_estudiantes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `tabla` varchar(45) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `propiedades` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `criterios`
--

DROP TABLE IF EXISTS `criterios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `criterios` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `campo` varchar(45) DEFAULT NULL,
  `operador` varchar(45) DEFAULT NULL,
  `valor` varchar(45) DEFAULT NULL,
  `bases_datos_estudiantes_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_criterios_bases_datos_estudiantes1_idx` (`bases_datos_estudiantes_id`),
  CONSTRAINT `fk_criterios_bases_datos_estudiantes1` FOREIGN KEY (`bases_datos_estudiantes_id`) REFERENCES `bases_datos_estudiantes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estrategias`
--

DROP TABLE IF EXISTS `estrategias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estrategias` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estrategias_has_riesgos`
--

DROP TABLE IF EXISTS `estrategias_has_riesgos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estrategias_has_riesgos` (
  `estrategias_id` bigint(20) unsigned NOT NULL,
  `riesgos_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`estrategias_id`,`riesgos_id`),
  KEY `fk_estrategias_has_riesgos_riesgos1_idx` (`riesgos_id`),
  KEY `fk_estrategias_has_riesgos_estrategias1_idx` (`estrategias_id`),
  CONSTRAINT `fk_estrategias_has_riesgos_estrategias1` FOREIGN KEY (`estrategias_id`) REFERENCES `estrategias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_estrategias_has_riesgos_riesgos1` FOREIGN KEY (`riesgos_id`) REFERENCES `riesgos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estudiantes`
--

DROP TABLE IF EXISTS `estudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estudiantes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) NOT NULL,
  `propiedad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estudiantes_altem`
--

DROP TABLE IF EXISTS `estudiantes_altem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estudiantes_altem` (
  `codigo` varchar(45) NOT NULL,
  `programa` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `filtros`
--

DROP TABLE IF EXISTS `filtros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filtros` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `campo` varchar(45) DEFAULT NULL,
  `operador` varchar(45) DEFAULT NULL,
  `valor` varchar(45) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `riesgos_id` bigint(20) unsigned NOT NULL,
  `bases_datos_estudiantes_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_filtros_riesgos1_idx` (`riesgos_id`),
  KEY `fk_filtros_bases_datos_estudiantes1_idx` (`bases_datos_estudiantes_id`),
  CONSTRAINT `fk_filtros_bases_datos_estudiantes1` FOREIGN KEY (`bases_datos_estudiantes_id`) REFERENCES `bases_datos_estudiantes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_filtros_riesgos1` FOREIGN KEY (`riesgos_id`) REFERENCES `riesgos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `intervenciones`
--

DROP TABLE IF EXISTS `intervenciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `intervenciones` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha_inicio` date DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `archivo_personal_id` bigint(20) NOT NULL,
  `usuarios_codigo` varchar(45) CHARACTER SET utf8 NOT NULL,
  `estrategias_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_intervenciones_archivo_personal1_idx` (`archivo_personal_id`),
  KEY `fk_intervenciones_usuarios1_idx` (`usuarios_codigo`),
  KEY `fk_intervenciones_estrategias1_idx` (`estrategias_id`),
  CONSTRAINT `fk_intervenciones_archivo_personal1` FOREIGN KEY (`archivo_personal_id`) REFERENCES `archivo_personal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_intervenciones_estrategias1` FOREIGN KEY (`estrategias_id`) REFERENCES `estrategias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_intervenciones_usuarios1` FOREIGN KEY (`usuarios_codigo`) REFERENCES `usuarios` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1718 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `observaciones`
--

DROP TABLE IF EXISTS `observaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `observaciones` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `contenido` text,
  `acciones_aplicadas_id` bigint(20) NOT NULL,
  `fecha` date DEFAULT NULL,
  `usuarios_codigo` varchar(45) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_observaciones_acciones_aplicadas1_idx` (`acciones_aplicadas_id`),
  KEY `fk_observaciones_usuarios1_idx` (`usuarios_codigo`),
  CONSTRAINT `fk_observaciones_acciones_aplicadas1` FOREIGN KEY (`acciones_aplicadas_id`) REFERENCES `acciones_aplicadas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_observaciones_usuarios1` FOREIGN KEY (`usuarios_codigo`) REFERENCES `usuarios` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1643 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `poblaciones`
--

DROP TABLE IF EXISTS `poblaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poblaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuarios_codigo` varchar(45) CHARACTER SET utf8 NOT NULL,
  `criterios_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_poblaciones_usuarios1_idx` (`usuarios_codigo`),
  KEY `fk_poblaciones_criterios1_idx` (`criterios_id`),
  CONSTRAINT `fk_poblaciones_criterios1` FOREIGN KEY (`criterios_id`) REFERENCES `criterios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_poblaciones_usuarios1` FOREIGN KEY (`usuarios_codigo`) REFERENCES `usuarios` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `riesgos`
--

DROP TABLE IF EXISTS `riesgos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `riesgos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tipo_riesgos_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_riesgos_tipo_riesgos1_idx` (`tipo_riesgos_id`),
  CONSTRAINT `fk_riesgos_tipo_riesgos1` FOREIGN KEY (`tipo_riesgos_id`) REFERENCES `tipo_riesgos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role_usuario`
--

DROP TABLE IF EXISTS `role_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_usuario` (
  `usuario_id` varchar(45) CHARACTER SET utf8 NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`usuario_id`,`role_id`),
  UNIQUE KEY `role_usuario_usuario_id_unique` (`usuario_id`),
  KEY `role_usuario_role_id_foreign` (`role_id`),
  CONSTRAINT `role_usuario_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_usuario_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_riesgos`
--

DROP TABLE IF EXISTS `tipo_riesgos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_riesgos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `codigo` varchar(45) CHARACTER SET utf8 NOT NULL,
  `estado` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `savio_token` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `usuarios_codigo_unique` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-03 15:47:19
