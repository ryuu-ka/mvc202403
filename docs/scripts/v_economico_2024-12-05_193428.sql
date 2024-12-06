-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: v_economico
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `carrito_detalle`
--

DROP TABLE IF EXISTS `carrito_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito_detalle` (
  `detalle_id` int(11) NOT NULL AUTO_INCREMENT,
  `carrito_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`detalle_id`),
  KEY `carrito_id` (`carrito_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `carrito_detalle_ibfk_1` FOREIGN KEY (`carrito_id`) REFERENCES `carritos` (`carrito_id`),
  CONSTRAINT `carrito_detalle_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito_detalle`
--

/*!40000 ALTER TABLE `carrito_detalle` DISABLE KEYS */;
INSERT INTO `carrito_detalle` VALUES (40,6,15,1,90.00),(41,6,14,1,300.00),(42,6,12,1,350.00),(43,7,15,1,90.00),(44,7,13,1,55.00),(45,7,12,1,350.00),(46,8,14,1,300.00),(47,8,10,1,50.00),(48,8,9,1,40.00);
/*!40000 ALTER TABLE `carrito_detalle` ENABLE KEYS */;

--
-- Table structure for table `carritos`
--

DROP TABLE IF EXISTS `carritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carritos` (
  `carrito_id` int(11) NOT NULL AUTO_INCREMENT,
  `usercod` bigint(10) NOT NULL,
  `carrito_fch` datetime NOT NULL DEFAULT current_timestamp(),
  `carrito_estado` char(3) DEFAULT 'PEN',
  PRIMARY KEY (`carrito_id`),
  KEY `usercod` (`usercod`),
  CONSTRAINT `carritos_ibfk_1` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carritos`
--

/*!40000 ALTER TABLE `carritos` DISABLE KEYS */;
INSERT INTO `carritos` VALUES (6,1,'2024-12-05 14:51:06','PGD'),(7,1,'2024-12-05 15:24:22','PGD'),(8,1,'2024-12-05 15:33:17','PGD'),(9,1,'2024-12-05 16:15:29','PEN');
/*!40000 ALTER TABLE `carritos` ENABLE KEYS */;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `categoria_id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria_nombre` varchar(100) NOT NULL,
  `categoria_descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Llantas',NULL),(2,'Accesorios',NULL),(3,'Herramientas',NULL);
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;

--
-- Table structure for table `funciones`
--

DROP TABLE IF EXISTS `funciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funciones` (
  `fncod` varchar(255) NOT NULL,
  `fndsc` varchar(255) DEFAULT NULL,
  `fnest` char(3) DEFAULT NULL,
  `fntyp` char(3) DEFAULT NULL,
  PRIMARY KEY (`fncod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funciones`
--

/*!40000 ALTER TABLE `funciones` DISABLE KEYS */;
INSERT INTO `funciones` VALUES ('Controllers\\Carrito\\CartController','Controllers\\Carrito\\CartController','ACT','CTR'),('Controllers\\Checkout\\Accept','Controllers\\Checkout\\Accept','ACT','CTR'),('Controllers\\Checkout\\Checkout','Controllers\\Checkout\\Checkout','ACT','CTR'),('Controllers\\Checkout\\TransaccionC','Controllers\\Checkout\\TransaccionC','ACT','CTR'),('Controllers\\HomeController','Controllers\\HomeController','ACT','CTR'),('Controllers\\Products\\ProductF','Controllers\\Products\\ProductF','ACT','CTR'),('Controllers\\Products\\Products','Controllers\\Products\\Products','ACT','CTR'),('Menu_carrito','Menu_carrito','ACT','MNU'),('Menu_historial','Menu_historial','ACT','MNU'),('Menu_Home_Products','Menu_Home_Products','ACT','MNU'),('Menu_PaymentCheckout','Menu_PaymentCheckout','ACT','MNU'),('Menu_products','Menu_products','ACT','MNU'),('productos_DEL_enabled','productos_DEL_enabled','ACT','FNC'),('productos_INS_enabled','productos_INS_enabled','ACT','FNC'),('productos_UPD_enabled','productos_UPD_enabled','ACT','FNC');
/*!40000 ALTER TABLE `funciones` ENABLE KEYS */;

--
-- Table structure for table `funciones_roles`
--

DROP TABLE IF EXISTS `funciones_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funciones_roles` (
  `rolescod` varchar(128) NOT NULL,
  `fncod` varchar(255) NOT NULL,
  `fnrolest` char(3) DEFAULT NULL,
  `fnexp` datetime DEFAULT NULL,
  PRIMARY KEY (`rolescod`,`fncod`),
  KEY `funcion_rol_key` (`fncod`),
  CONSTRAINT `funcion_rol_key` FOREIGN KEY (`fncod`) REFERENCES `funciones` (`fncod`),
  CONSTRAINT `rol_funcion_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funciones_roles`
--

/*!40000 ALTER TABLE `funciones_roles` DISABLE KEYS */;
INSERT INTO `funciones_roles` VALUES ('Admin','Controllers\\Carrito\\CartController','ACT','2025-12-31 00:00:00'),('Admin','Controllers\\Checkout\\Accept','ACT','2025-12-31 00:00:00'),('Admin','Controllers\\Checkout\\Checkout','ACT','2025-12-31 00:00:00'),('Admin','Controllers\\Checkout\\TransaccionC','ACT','2025-12-31 00:00:00'),('Admin','Controllers\\HomeController','ACT','2025-12-31 00:00:00'),('Admin','Controllers\\Products\\ProductF','ACT','2025-12-31 00:00:00'),('Admin','Controllers\\Products\\Products','ACT','2025-12-31 00:00:00'),('Admin','Menu_carrito','ACT','2025-12-31 00:00:00'),('Admin','Menu_historial','ACT','2025-12-31 00:00:00'),('Admin','Menu_Home_Products','ACT','2025-12-31 00:00:00'),('Admin','Menu_PaymentCheckout','ACT','2025-12-31 00:00:00'),('Admin','Menu_products','ACT','2025-12-31 00:00:00'),('Admin','productos_DEL_enabled','ACT','2025-12-31 00:00:00'),('Admin','productos_INS_enabled','ACT','2025-12-31 00:00:00'),('Admin','productos_UPD_enabled','ACT','2025-12-31 00:00:00'),('Auditor','Controllers\\Carrito\\CartController','ACT','2025-12-31 00:00:00'),('Auditor','Controllers\\Checkout\\Accept','ACT','2025-12-31 00:00:00'),('Auditor','Controllers\\Checkout\\Checkout','ACT','2025-12-31 00:00:00'),('Auditor','Controllers\\Checkout\\TransaccionC','ACT','2025-12-31 00:00:00'),('Auditor','Controllers\\HomeController','ACT','2025-12-31 00:00:00'),('Auditor','Controllers\\Products\\ProductF','ACT','2025-12-31 00:00:00'),('Auditor','Controllers\\Products\\Products','ACT','2025-12-31 00:00:00'),('Auditor','Menu_carrito','ACT','2025-12-31 00:00:00'),('Auditor','Menu_historial','ACT','2025-12-31 00:00:00'),('Auditor','Menu_Home_Products','ACT','2025-12-31 00:00:00'),('Auditor','Menu_PaymentCheckout','ACT','2025-12-31 00:00:00'),('Auditor','Menu_products','ACT','2025-12-31 00:00:00'),('Comprador','Controllers\\Carrito\\CartController','ACT','2025-12-31 00:00:00'),('Comprador','Controllers\\Checkout\\Accept','ACT','2025-12-31 00:00:00'),('Comprador','Controllers\\Checkout\\Checkout','ACT','2025-12-31 00:00:00'),('Comprador','Controllers\\Checkout\\TransaccionC','ACT','2025-12-31 00:00:00'),('Comprador','Controllers\\HomeController','ACT','2025-12-31 00:00:00'),('Comprador','Menu_carrito','ACT','2025-12-31 00:00:00'),('Comprador','Menu_historial','ACT','2025-12-31 00:00:00'),('Comprador','Menu_Home_Products','ACT','2025-12-31 00:00:00'),('Comprador','Menu_PaymentCheckout','ACT','2025-12-31 00:00:00');
/*!40000 ALTER TABLE `funciones_roles` ENABLE KEYS */;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `producto_id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_nombre` varchar(100) NOT NULL,
  `producto_descripcion` varchar(255) DEFAULT NULL,
  `producto_precio` decimal(10,2) NOT NULL,
  `producto_stock` int(11) DEFAULT 0,
  `producto_imagen` varchar(255) DEFAULT NULL,
  `producto_estado` char(3) DEFAULT 'ACT',
  `categoria_id` int(11) NOT NULL,
  PRIMARY KEY (`producto_id`),
  KEY `categoria_id` (`categoria_id`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Llantas Michelin','Llantas de alta durabilidad para motos deportivas',120.00,0,'foon.jpg','ACT',1),(2,'Casco Integral HJC','Casco de seguridad certificado con diseño aerodinámico',180.00,0,'casco_hjc.jpg','ACT',2),(3,'Juego de Herramientas Pro','Set de herramientas completo para mantenimiento',85.00,0,'herramientas_pro.jpg','ACT',3),(4,'Aceite de Motor Castrol','Aceite sintético de alto rendimiento',30.00,0,'aceite_castrol.jpg','ACT',2),(5,'Guantes Alpinestars','Guantes de protección para motociclistas',40.00,0,'guantes_alpinestars.jpg','ACT',2),(6,'Llantas Dunlop Sportmax','Llantas deportivas de alto rendimiento para motos',130.00,0,'llantas_dunlop.jpg','ACT',1),(7,'Casco de Moto AGV Pista','Casco de alto rendimiento para motociclismo',450.00,0,'casco_agv_pista.jpg','ACT',2),(8,'Kit de Herramientas para Mantenimiento','Kit de herramientas esenciales para motos deportivas',75.00,0,'kit_herramientas_mantenimiento.jpg','ACT',3),(9,'Aceite Motorex','Aceite sintético de alta calidad para motocicletas',40.00,0,'aceite_motorex.jpg','ACT',2),(10,'Guantes Fox Racing','Guantes de protección premium para motocross',50.00,0,'guantes_fox_racing.jpg','ACT',2),(11,'Llantas Metzeler Sportec','Llantas de motocicleta de alto rendimiento para carreteras secas',145.00,0,'llantas_metzeler.jpg','ACT',1),(12,'Casco Bell Moto-9S','Casco de moto para carreras off-road con ventilación avanzada',350.00,0,'casco_bell_moto9s.jpg','ACT',2),(13,'Aceite para Suspensión Ohlins','Aceite especializado para suspensión de motos deportivas',55.00,0,'aceite_ohlins.jpg','ACT',2),(14,'Frenos Shimano XT','Frenos de disco hidráulicos para motos deportivas',300.00,0,'frenos_shimano_xt.jpg','ACT',1),(15,'Kit Completo de Herramientas para Motos','Set completo de herramientas para reparación profesional de motos',90.00,0,'kit_herramientas_completo.jpg','ACT',3);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `rolescod` varchar(128) NOT NULL,
  `rolesdsc` varchar(45) DEFAULT NULL,
  `rolesest` char(3) DEFAULT NULL,
  PRIMARY KEY (`rolescod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES ('Admin','Administrador de Tablas Genericas','ACT'),('Auditor','Auditor del Sistema','ACT'),('Comprador','Comprador de prueba del sistema','ACT'),('Desarrollador','Desarrollador del Sistema','ACT'),('Vendedor','Vendedor autorizado a mostrar el sistema','ACT');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

--
-- Table structure for table `roles_usuarios`
--

DROP TABLE IF EXISTS `roles_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles_usuarios` (
  `usercod` bigint(10) NOT NULL,
  `rolescod` varchar(128) NOT NULL,
  `roleuserest` char(3) DEFAULT NULL,
  `roleuserfch` datetime DEFAULT NULL,
  `roleuserexp` datetime DEFAULT NULL,
  PRIMARY KEY (`usercod`,`rolescod`),
  KEY `rol_usuario_key` (`rolescod`),
  CONSTRAINT `rol_usuario_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`),
  CONSTRAINT `usuario_rol_key` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_usuarios`
--

/*!40000 ALTER TABLE `roles_usuarios` DISABLE KEYS */;
INSERT INTO `roles_usuarios` VALUES (1,'Admin','ACT','2024-11-15 00:00:00','2025-11-15 00:00:00'),(2,'Auditor','ACT','2024-11-15 00:00:00','2025-11-15 00:00:00'),(3,'Comprador','ACT','2024-11-15 00:00:00','2025-11-15 00:00:00'),(4,'Comprador','ACT','2024-11-15 00:00:00','2025-11-15 00:00:00'),(5,'Auditor','ACT','2024-11-15 00:00:00','2025-11-15 00:00:00'),(6,'Admin','ACT','2024-11-15 00:00:00','2025-11-15 00:00:00'),(7,'Comprador','ACT','2024-11-15 00:00:00','2025-11-15 00:00:00');
/*!40000 ALTER TABLE `roles_usuarios` ENABLE KEYS */;

--
-- Table structure for table `transacciones`
--

DROP TABLE IF EXISTS `transacciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transacciones` (
  `transaccion_id` int(11) NOT NULL AUTO_INCREMENT,
  `carrito_id` int(11) NOT NULL,
  `transaccion_fch` datetime NOT NULL DEFAULT current_timestamp(),
  `transaccion_total` decimal(10,2) NOT NULL,
  `metodo_pago` varchar(50) NOT NULL,
  `transaccion_estado` char(3) DEFAULT 'EXI',
  PRIMARY KEY (`transaccion_id`),
  KEY `carrito_id` (`carrito_id`),
  CONSTRAINT `transacciones_ibfk_1` FOREIGN KEY (`carrito_id`) REFERENCES `carritos` (`carrito_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transacciones`
--

/*!40000 ALTER TABLE `transacciones` DISABLE KEYS */;
INSERT INTO `transacciones` VALUES (6,6,'2024-12-05 15:19:26',814.00,'PayPal','EXI'),(7,7,'2024-12-05 15:29:20',544.50,'PayPal','EXI'),(8,8,'2024-12-05 15:37:42',429.00,'PayPal','EXI');
/*!40000 ALTER TABLE `transacciones` ENABLE KEYS */;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `usercod` bigint(10) NOT NULL AUTO_INCREMENT,
  `useremail` varchar(80) DEFAULT NULL,
  `username` varchar(80) DEFAULT NULL,
  `userpswd` varchar(128) DEFAULT NULL,
  `userfching` datetime DEFAULT NULL,
  `userpswdest` char(3) DEFAULT NULL,
  `userpswdexp` datetime DEFAULT NULL,
  `userest` char(3) DEFAULT NULL,
  `useractcod` varchar(128) DEFAULT NULL,
  `userpswdchg` varchar(128) DEFAULT NULL,
  `usertipo` char(3) DEFAULT NULL COMMENT 'Tipo de Usuario: ADM, PBL, AUD',
  PRIMARY KEY (`usercod`),
  UNIQUE KEY `useremail_UNIQUE` (`useremail`),
  KEY `usertipo` (`usertipo`,`useremail`,`usercod`,`userest`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'alejandraorellana@gmail.com','AOrellana','$2y$10$pAOh.40Fr8mmsgY1HB7m.Ozlv0oAcl.opgnnBvrsZc82PYZctOiZ.','2024-11-15 21:19:20','ACT','2025-02-13 00:00:00','ACT','c2df22bdb1e03fe60a584740d817ad7dfee53726dcfbce2333e65e08e32c3be6','2024-11-15 21:19:20','ADM'),(2,'bdanielamolina.r@gmail.com','Bdmoli','$2y$10$E0Rl8SVR3GCpzF68vk.uGurO/7wguxF7tUdQ0LvuycL0yDBv61G0G','2024-11-15 21:19:57','ACT','2025-02-13 00:00:00','ACT','0e8f2af1beeb8cf06493d097ff89bf04955bfe7dca2b7c9fbff8b63fbaf434b2','2024-11-15 21:19:57','AUD'),(3,'molinajudith0402@gmail.com','RValladares','$2y$10$0JHGapRM93odP7vPghKtbudY647g9xsxfaRXlr6YDKKQUn4kDJlhi','2024-11-15 21:20:27','ACT','2025-02-13 00:00:00','ACT','cd57f91d6cea532119b648a0a4650adf3462fa91f46dbd97d8826fa201a51176','2024-11-15 21:20:27','PBL'),(4,'micheco43@gmail.com','MCorea','$2y$10$drZ6K/bH8hHolNcFZEwaaO5FfaI8g7ZBMPewOysEV7BD41KvZNjOS','2024-11-15 21:21:08','ACT','2025-02-13 00:00:00','ACT','6e1029a97ce11e00fc0f2fcc5d5a6b20a85a228090c74aa6cbfa763a8bba2d23','2024-11-15 21:21:08','PBL'),(5,'trejogrissel26@gmail.com','GTrejo','$2y$10$D0SHbp19pJIBSESqiODNxeNRzhvzsPoc3cEqh6nKEB0GGKVYI3N.u','2024-11-15 21:21:37','ACT','2025-02-13 00:00:00','ACT','d331970536d5625c5e5eeda61ec80e9dd3d4b80cc2723905ddde1488f8fed9ea','2024-11-15 21:21:37','ADM'),(6,'katherineaguilar575@gmail.com','KMAguilar','$2y$10$2tAGM/lFS5RC.b4Z7ERxWOX.xA7H4G8nw69PbGPZDKOkvMDQZwDr2','2024-11-15 21:22:11','ACT','2025-02-13 00:00:00','ACT','1eac9790c4d14dcca17f8f9341b0a7b4951432708fbcdaed33e13b95efc4accc','2024-11-15 21:22:11','PBL'),(7,'maylinchavez504@gmail.com','MayChavez','$2y$10$/lSBkMAaD4l3l1WSUn2P9uK8AUQoGQ4mQPS8FTnZXOtsZvRqFjgOa','2024-11-15 21:22:46','ACT','2025-02-13 00:00:00','ACT','1daff558e342a85fc055b132563cc123a135c23f48da977df11b799684e7475f','2024-11-15 21:22:46','PBL'),(8,'desarrollador@desa.com','Desarrollador','$2y$10$pJzjcuUeX2mjf4R8jsOtLuctL0qKX2RNjpjT2X1iLjvTGLD.wqW/2','2024-11-16 19:14:40','ACT','2025-02-13 00:00:00','ACT','5163b1f76734da71f24da4a985400f00c1ba928af2a465939cfa0b4edae30e2c','2024-11-16 19:14:40','ADM');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

--
-- Dumping routines for database 'v_economico'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-05 19:34:34
