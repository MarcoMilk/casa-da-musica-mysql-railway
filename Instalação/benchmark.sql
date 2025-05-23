DROP TABLE IF EXISTS `alunos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alunos` (
  `idaluno` int unsigned NOT NULL AUTO_INCREMENT,
  `cpf_cnpj` varchar(14) DEFAULT NULL,
  `nome` varchar(45) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(33) DEFAULT NULL,
  `data_nasc` date DEFAULT NULL,
  `idade` int DEFAULT NULL,
  `sexo` varchar(10) DEFAULT NULL,
  `genero` varchar(20) DEFAULT NULL,
  `cor` varchar(10) DEFAULT NULL,
  `ativo` enum('SIM','N├âO') NOT NULL,
  `pcd` enum('SIM','N├âO') NOT NULL,
  `cpf_cnpj_resp` varchar(14) DEFAULT NULL,
  `nome_resp` varchar(45) DEFAULT NULL,
  `cep` varchar(9) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `numero` varchar(15) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `complemento` varchar(45) DEFAULT NULL,
  `obs` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`idaluno`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alunos`
--

LOCK TABLES `alunos` WRITE;
/*!40000 ALTER TABLE `alunos` DISABLE KEYS */;
INSERT INTO `alunos` VALUES (1,'06366403880','THIAGO','(13) 888-8888','teste@teste.com','2000-07-07',24,'Masculino','HETERO','Branco','N├âO','N├âO','','','04334-090','Rua Osmar Totaro','','Vila Fachini','S├úo Paulo','SP','',''),(2,'','KENPS','(15)15151-1515','teste@teste.com','1999-07-07',25,'Masculino','HETERO','Branco','SIM','N├âO','','','','','','','','','',''),(3,'','WINNE DE SOUZA MELLO','(11) 9.8170-0440','','2007-07-07',17,'Feminino','HETERO','Branco','SIM','N├âO','','','','','','','','','',''),(4,'','ROSANA','(11) 9.8765-0440','','2000-04-18',25,'Feminino','HETERO','Branco','N├âO','SIM','','','','','','','','','','Teste para verificar a mesagem no relat├│rio');
/*!40000 ALTER TABLE `alunos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplinas`
--

DROP TABLE IF EXISTS `disciplinas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disciplinas` (
  `iddisciplina` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `carga_horaria` time NOT NULL,
  `turno` varchar(5) NOT NULL,
  `dia_semana` varchar(15) DEFAULT NULL,
  `hora_aula_inicio` time NOT NULL,
  `hora_aula_fim` time NOT NULL,
  `obs` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`iddisciplina`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplinas`
--

LOCK TABLES `disciplinas` WRITE;
/*!40000 ALTER TABLE `disciplinas` DISABLE KEYS */;
INSERT INTO `disciplinas` VALUES (1,'FILOSOFIA','00:50:00','Manh├ú','Segunda','10:00:00','10:50:00',''),(2,'MACROECONOMIA','00:50:00','Noite','Ter├ºa  ','19:00:00','19:50:00',''),(3,'GEOPOLITICA','00:45:00','Noite','Quarta ','20:00:00','20:45:00',''),(4,'MICROECONOMIA','00:33:00','Manh├ú','Quinta ','08:33:00','09:03:00',''),(5,'GEOGRAFIA','00:25:00','Noite','Sexta  ','21:30:00','21:55:00','');
/*!40000 ALTER TABLE `disciplinas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faltas`
--

DROP TABLE IF EXISTS `faltas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faltas` (
  `idfalta` int unsigned NOT NULL AUTO_INCREMENT,
  `aluno_id` int DEFAULT NULL,
  `disciplina_id` int DEFAULT NULL,
  `professor_id` int DEFAULT NULL,
  `data_falta` date NOT NULL,
  `mes_falta` varchar(15) DEFAULT NULL,
  `ano_falta` int DEFAULT NULL,
  `falta` int DEFAULT NULL,
  `obs` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`idfalta`),
  UNIQUE KEY `unique_falta` (`aluno_id`,`professor_id`,`disciplina_id`,`data_falta`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faltas`
--

LOCK TABLES `faltas` WRITE;
/*!40000 ALTER TABLE `faltas` DISABLE KEYS */;
INSERT INTO `faltas` VALUES (1,3,3,3,'2025-04-19','Abril',2025,1,''),(2,4,4,4,'2025-04-19','Abril',2025,1,''),(3,3,3,3,'2025-04-01','Abril',2025,1,''),(4,1,1,1,'2025-04-01','Abril',2025,1,''),(5,1,1,1,'2025-04-02','Abril',2025,1,''),(6,1,1,1,'2025-04-04','Abril',2025,1,''),(7,4,4,4,'2025-04-16','Abril',2025,1,''),(8,4,4,4,'2025-04-23','Abril',2025,1,'');
/*!40000 ALTER TABLE `faltas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matriculas`
--

DROP TABLE IF EXISTS `matriculas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matriculas` (
  `idmatricula` int unsigned NOT NULL AUTO_INCREMENT,
  `idaluno` int NOT NULL,
  `iddisciplina` int NOT NULL,
  `idprofessor` int NOT NULL,
  `data_matricula` date NOT NULL,
  `ativo` enum('SIM','N├âO') NOT NULL,
  `obs` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`idmatricula`),
  UNIQUE KEY `unique_matricula` (`idaluno`,`iddisciplina`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matriculas`
--

LOCK TABLES `matriculas` WRITE;
/*!40000 ALTER TABLE `matriculas` DISABLE KEYS */;
INSERT INTO `matriculas` VALUES (1,1,1,1,'2025-04-19','SIM',''),(3,3,3,3,'2025-04-19','SIM',''),(4,2,2,2,'2025-04-19','SIM',''),(5,4,4,4,'2025-04-19','SIM',''),(6,1,4,4,'2025-04-19','SIM',''),(7,4,1,1,'2025-04-19','SIM','');
/*!40000 ALTER TABLE `matriculas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monitoramento`
--

DROP TABLE IF EXISTS `monitoramento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monitoramento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sala_id` int NOT NULL,
  `sensor_id` int NOT NULL,
  `qualidade_ar` int DEFAULT NULL,
  `data_hora` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `sala_id` (`sala_id`),
  KEY `sensor_id` (`sensor_id`),
  CONSTRAINT `monitoramento_ibfk_1` FOREIGN KEY (`sala_id`) REFERENCES `salas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `monitoramento_ibfk_2` FOREIGN KEY (`sensor_id`) REFERENCES `sensores` (`id`) ON DELETE CASCADE,
  CONSTRAINT `monitoramento_chk_1` CHECK ((`qualidade_ar` between 0 and 100))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitoramento`
--

LOCK TABLES `monitoramento` WRITE;
/*!40000 ALTER TABLE `monitoramento` DISABLE KEYS */;
INSERT INTO `monitoramento` VALUES (1,1,1,85,'2025-04-17 11:04:39'),(2,1,2,78,'2025-04-17 11:04:39'),(3,2,1,90,'2025-04-17 11:04:39'),(4,3,3,65,'2025-04-17 11:04:39'),(5,3,4,72,'2025-04-17 11:04:39'),(6,4,1,88,'2025-04-17 11:04:39'),(7,5,2,74,'2025-04-17 11:04:39'),(8,5,3,80,'2025-04-17 11:04:39');
/*!40000 ALTER TABLE `monitoramento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas`
--

DROP TABLE IF EXISTS `notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notas` (
  `idnota` int unsigned NOT NULL AUTO_INCREMENT,
  `aluno_id` int DEFAULT NULL,
  `disciplina_id` int DEFAULT NULL,
  `professor_id` int DEFAULT NULL,
  `data_nota` date NOT NULL,
  `mes_nota` varchar(15) DEFAULT NULL,
  `ano_nota` int DEFAULT NULL,
  `nota` decimal(3,1) NOT NULL,
  `obs` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`idnota`),
  UNIQUE KEY `unique_nota` (`aluno_id`,`professor_id`,`disciplina_id`,`data_nota`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas`
--

LOCK TABLES `notas` WRITE;
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
INSERT INTO `notas` VALUES (1,1,1,1,'2025-04-19','Mar├ºo',2025,5.5,''),(3,2,2,2,'2025-04-19','Abril',2025,5.4,'');
/*!40000 ALTER TABLE `notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professores`
--

DROP TABLE IF EXISTS `professores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professores` (
  `idprofessor` int unsigned NOT NULL AUTO_INCREMENT,
  `cpf_cnpj` varchar(14) DEFAULT NULL,
  `nome` varchar(45) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(33) DEFAULT NULL,
  `data_nasc` date DEFAULT NULL,
  `idade` int DEFAULT NULL,
  `sexo` varchar(10) NOT NULL,
  `genero` varchar(20) DEFAULT NULL,
  `cor` varchar(10) DEFAULT NULL,
  `cep` varchar(9) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `numero` varchar(15) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `complemento` varchar(45) DEFAULT NULL,
  `obs` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`idprofessor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professores`
--

LOCK TABLES `professores` WRITE;
/*!40000 ALTER TABLE `professores` DISABLE KEYS */;
INSERT INTO `professores` VALUES (1,'06366403880','CORELLA','N/T','cortella@puc-sp.edu','1956-04-18',69,'Masculino','Hetero','Branco','04323-090','Rua Porcelana','99','Jabaquara','S├úo Paulo','SP','',''),(2,'','DELFIN NETO','(13) 888-8888','teste@teste.com','1944-10-10',80,'Masculino','HETERO','Branco','','','','','','','',''),(3,'','FERNADO HENRIQUE','','','1955-04-18',70,'Masculino','HETERO','Branco','','','','','','','',''),(4,'','GAROFALLO','','','1936-12-12',88,'Masculino','HETERO','Branco','','','','','','','',''),(5,'','RENAN DE ABREU','','','1948-04-28',76,'Masculino','HETERO','Branco','','','','','','','','');
/*!40000 ALTER TABLE `professores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salas`
--

DROP TABLE IF EXISTS `salas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salas`
--

LOCK TABLES `salas` WRITE;
/*!40000 ALTER TABLE `salas` DISABLE KEYS */;
INSERT INTO `salas` VALUES (1,'Sala 101'),(2,'Sala 102'),(3,'Laborat├│rio de Ci├¬ncias'),(4,'Sala 201'),(5,'Biblioteca');
/*!40000 ALTER TABLE `salas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensores`
--

DROP TABLE IF EXISTS `sensores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sensores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensores`
--

LOCK TABLES `sensores` WRITE;
/*!40000 ALTER TABLE `sensores` DISABLE KEYS */;
INSERT INTO `sensores` VALUES (1,'Sensor de CO2 - Modelo A'),(2,'Sensor de CO2 - Modelo B'),(3,'Sensor de Umidade - Modelo X'),(4,'Sensor de Temperatura - Modelo Y');
/*!40000 ALTER TABLE `sensores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(70) DEFAULT NULL,
  `level` varchar(45) DEFAULT NULL,
  `status` enum('ativado','desativado') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `recovery_token` varchar(255) DEFAULT NULL,
  `reset_token` varchar(64) DEFAULT NULL,
  `reset_token_expires` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','$2a$10$gscWfptKpPQbjSBzSpkb7eGEdXq5WKdW8.Gieuf9M/F58UVPKrXay','admin@teste.com','1','ativado','2024-12-13 13:46:08','2024-12-13 13:46:08',NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idusuario` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(70) NOT NULL,
  `email` varchar(70) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `senha` varchar(30) DEFAULT NULL,
  `nivel` int NOT NULL,
  `ativo` enum('SIM','N├âO') NOT NULL,
  `obs` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vinculos`
--

DROP TABLE IF EXISTS `vinculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vinculos` (
  `idvinculo` int unsigned NOT NULL AUTO_INCREMENT,
  `iddisciplina` int DEFAULT NULL,
  `idprofessor` int DEFAULT NULL,
  `data_vinculo` date NOT NULL,
  `obs` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`idvinculo`),
  UNIQUE KEY `unique_vinculo` (`iddisciplina`,`idprofessor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vinculos`
--

LOCK TABLES `vinculos` WRITE;
/*!40000 ALTER TABLE `vinculos` DISABLE KEYS */;
INSERT INTO `vinculos` VALUES (1,1,1,'2025-04-18',''),(2,2,2,'2025-04-18',''),(3,3,3,'2025-04-18',''),(4,4,4,'2025-04-18',''),(5,5,5,'2025-04-18','');
/*!40000 ALTER TABLE `vinculos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-03 16:15:44
