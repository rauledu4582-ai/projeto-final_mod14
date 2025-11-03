-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 03-Nov-2025 às 09:20
-- Versão do servidor: 9.1.0
-- versão do PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `ginasio`
--
CREATE DATABASE IF NOT EXISTS `ginasio` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `ginasio`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aulas`
--

DROP TABLE IF EXISTS `aulas`;
CREATE TABLE IF NOT EXISTS `aulas` (
  `id_aula` int NOT NULL AUTO_INCREMENT,
  `id_prof` int DEFAULT NULL,
  `id_espaco` int DEFAULT NULL,
  `modalidade` varchar(100) DEFAULT NULL,
  `horario` varchar(50) DEFAULT NULL,
  `duracao` int DEFAULT NULL,
  PRIMARY KEY (`id_aula`),
  KEY `aulas_espaco_FK` (`id_espaco`),
  KEY `aulas_professor_FK` (`id_prof`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `aulas`
--

INSERT INTO `aulas` (`id_aula`, `id_prof`, `id_espaco`, `modalidade`, `horario`, `duracao`) VALUES
(1, 1, 1, 'Yoga', '09:00', 60),
(2, 2, 2, 'Musculação', '10:30', 90),
(3, 3, 3, 'Natação', '12:00', 45),
(4, 2, 4, 'Body Pump', '18:10', 60);

-- --------------------------------------------------------

--
-- Estrutura da tabela `check_in_out`
--

DROP TABLE IF EXISTS `check_in_out`;
CREATE TABLE IF NOT EXISTS `check_in_out` (
  `id_registo` int NOT NULL AUTO_INCREMENT,
  `id_socio` int DEFAULT NULL,
  `data` varchar(60) DEFAULT NULL,
  `hora_entrada` time NOT NULL,
  `hora_saida` time DEFAULT NULL,
  PRIMARY KEY (`id_registo`),
  KEY `check_in_out_socio_FK` (`id_socio`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `check_in_out`
--

INSERT INTO `check_in_out` (`id_registo`, `id_socio`, `data`, `hora_entrada`, `hora_saida`) VALUES
(1, 1, '2024-04-10', '08:50:00', '10:10:00'),
(2, 2, '2024-04-12', '10:20:00', '12:10:00'),
(3, 3, '2024-04-10', '08:55:00', '10:15:00'),
(4, 4, '2024-04-13', '11:50:00', '13:00:00'),
(5, 5, '2024-04-14', '10:15:00', '12:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `espaco`
--

DROP TABLE IF EXISTS `espaco`;
CREATE TABLE IF NOT EXISTS `espaco` (
  `id_espaco` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `aula` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_espaco`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `espaco`
--

INSERT INTO `espaco` (`id_espaco`, `nome`, `aula`) VALUES
(1, 'Sala 1', 'Yoga'),
(2, 'Sala 2', 'Musculação'),
(3, 'Piscina', 'Natação'),
(4, 'Sala 3', 'Body Pump');

-- --------------------------------------------------------

--
-- Estrutura da tabela `inscricoes`
--

DROP TABLE IF EXISTS `inscricoes`;
CREATE TABLE IF NOT EXISTS `inscricoes` (
  `id_inscricao` int NOT NULL AUTO_INCREMENT,
  `id_socio` int DEFAULT NULL,
  `id_aula` int DEFAULT NULL,
  `data_inscricao` date DEFAULT NULL,
  PRIMARY KEY (`id_inscricao`),
  KEY `inscricoes_socio_FK` (`id_socio`),
  KEY `inscricoes_aulas_FK` (`id_aula`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `inscricoes`
--

INSERT INTO `inscricoes` (`id_inscricao`, `id_socio`, `id_aula`, `data_inscricao`) VALUES
(1, 1, 1, '2024-03-01'),
(2, 2, 2, '2024-03-05'),
(3, 3, 1, '2024-03-10'),
(4, 4, 3, '2024-04-01'),
(5, 5, 2, '2024-04-15'),
(6, 6, 4, '2024-05-01'),
(7, 7, 1, '2024-05-05'),
(8, 8, 3, '2024-05-10'),
(9, 9, 4, '2024-06-01'),
(10, 10, 2, '2024-06-05');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
CREATE TABLE IF NOT EXISTS `pagamento` (
  `id_pagamento` int NOT NULL AUTO_INCREMENT,
  `id_socio` int NOT NULL,
  `Tipo_pagamento` varchar(100) DEFAULT NULL,
  `valor` decimal(10,0) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  PRIMARY KEY (`id_pagamento`),
  KEY `pagamento_socio_FK` (`id_socio`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `pagamento`
--

INSERT INTO `pagamento` (`id_pagamento`, `id_socio`, `Tipo_pagamento`, `valor`, `data_pagamento`) VALUES
(1, 1, 'Mensalidade', 30, '2024-04-01'),
(2, 2, 'Anuidade', 300, '2024-02-05'),
(3, 3, 'Mensalidade', 30, '2024-04-05'),
(4, 1, 'Mensalidade', 30, '2024-04-01'),
(5, 2, 'Anuidade', 300, '2024-02-05'),
(6, 3, 'Mensalidade', 30, '2024-04-05'),
(7, 1, 'Mensalidade', 30, '2024-04-01'),
(8, 2, 'Anuidade', 300, '2024-02-05'),
(9, 3, 'Mensalidade', 30, '2024-04-05');

-- --------------------------------------------------------

--
-- Estrutura da tabela `presencas`
--

DROP TABLE IF EXISTS `presencas`;
CREATE TABLE IF NOT EXISTS `presencas` (
  `id_presenca` int NOT NULL AUTO_INCREMENT,
  `id_aula` int DEFAULT NULL,
  `id_socio` int DEFAULT NULL,
  `data` date DEFAULT NULL,
  PRIMARY KEY (`id_presenca`),
  KEY `presencas_aulas_FK` (`id_aula`),
  KEY `presencas_socio_FK` (`id_socio`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `presencas`
--

INSERT INTO `presencas` (`id_presenca`, `id_aula`, `id_socio`, `data`) VALUES
(1, 1, 1, '2024-04-10'),
(2, 1, 3, '2024-04-10'),
(3, 2, 2, '2024-04-12'),
(4, 3, 4, '2024-04-13'),
(5, 2, 5, '2024-04-14'),
(6, 4, 6, '2024-05-02'),
(7, 4, 9, '2024-06-03');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

DROP TABLE IF EXISTS `produtos`;
CREATE TABLE IF NOT EXISTS `produtos` (
  `id_produtos` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `preco` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id_produtos`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id_produtos`, `nome`, `categoria`, `preco`) VALUES
(1, 'Camisola Ginásio', 'Roupa', 15),
(2, 'Calças Desporto', 'Roupa', 25),
(3, 'Proteína Whey', 'Suplemento', 40),
(4, 'Barra Energética', 'Suplemento', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor`
--

DROP TABLE IF EXISTS `professor`;
CREATE TABLE IF NOT EXISTS `professor` (
  `id_prof` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `especialidade` varchar(100) DEFAULT NULL,
  `telefone` int DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_prof`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `professor`
--

INSERT INTO `professor` (`id_prof`, `nome`, `especialidade`, `telefone`, `email`) VALUES
(1, 'Carlos', 'Yoga', 920000001, 'carlos@gin.pt'),
(2, 'Inês', 'Musculação', 920000002, 'ines@gin.pt'),
(3, 'Jorge', 'Natação', 920000003, 'tiago@gin.pt');

-- --------------------------------------------------------

--
-- Estrutura da tabela `socio`
--

DROP TABLE IF EXISTS `socio`;
CREATE TABLE IF NOT EXISTS `socio` (
  `id_socio` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `morada` varchar(160) DEFAULT NULL,
  `telefone` int DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `data_inscricao` date NOT NULL,
  `tipo_pagamento` varchar(100) NOT NULL,
  `BI` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_socio`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `socio`
--

INSERT INTO `socio` (`id_socio`, `nome`, `morada`, `telefone`, `email`, `data_inscricao`, `tipo_pagamento`, `BI`) VALUES
(1, 'João', 'Porto', 913456098, 'joao@gmail.com', '2024-01-10', 'Mensal', '12345678'),
(2, 'Maria', 'Lisboa', 92345612, 'maria@gmail.com', '2024-02-05', 'Anual', '23456789'),
(3, 'Pedro', 'Braga', 994568123, 'pedro@gmail.com', '2024-03-01', 'Mensal', '34567890'),
(4, 'Ana', 'Coimbra', 910984534, 'ana@gmail.com', '2024-03-15', 'Mensal', '45678901'),
(5, 'Rui', 'Aveiro', 946098125, 'rui@gmail.com', '2024-04-20', 'Anual', '56789012'),
(6, 'Beatriz', 'Faro', 2147483647, 'beatriz@gmail.com', '2024-04-25', 'Mensal', '67890123'),
(7, 'Tiago', 'Setúbal', 2147483647, 'tiago@gmail.com', '2024-05-05', 'Mensal', '78901234'),
(8, 'Carla', 'Lisboa', 2147483647, 'carla@gmail.com', '2024-06-10', 'Anual', '89012345'),
(9, 'Miguel', 'Leiria', 2147483647, 'miguel@gmail.com', '2024-07-15', 'Mensal', '90123456'),
(10, 'Sofia', 'Porto', 912357804, 'sofia@gmail.com', '2024-08-01', 'Anual', '01234567');

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas`
--

DROP TABLE IF EXISTS `vendas`;
CREATE TABLE IF NOT EXISTS `vendas` (
  `id_venda` int NOT NULL AUTO_INCREMENT,
  `id_socio` int DEFAULT NULL,
  `data` date DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id_venda`),
  KEY `vendas_socio_FK` (`id_socio`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `vendas`
--

INSERT INTO `vendas` (`id_venda`, `id_socio`, `data`, `total`) VALUES
(1, 1, '2024-04-15', 42),
(2, 2, '2024-04-16', 27);

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas_produtos`
--

DROP TABLE IF EXISTS `vendas_produtos`;
CREATE TABLE IF NOT EXISTS `vendas_produtos` (
  `id_venda` int NOT NULL,
  `id_produtos` int NOT NULL,
  `quantidade` int DEFAULT NULL,
  `subtotal` int NOT NULL,
  KEY `vendas_produtos_vendas_FK` (`id_venda`),
  KEY `vendas_produtos_produtos_FK` (`id_produtos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `vendas_produtos`
--

INSERT INTO `vendas_produtos` (`id_venda`, `id_produtos`, `quantidade`, `subtotal`) VALUES
(1, 3, 1, 40),
(1, 4, 1, 2),
(2, 1, 1, 15),
(2, 2, 1, 25);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `aulas`
--
ALTER TABLE `aulas`
  ADD CONSTRAINT `aulas_espaco_FK` FOREIGN KEY (`id_espaco`) REFERENCES `espaco` (`id_espaco`),
  ADD CONSTRAINT `aulas_professor_FK` FOREIGN KEY (`id_prof`) REFERENCES `professor` (`id_prof`);

--
-- Limitadores para a tabela `check_in_out`
--
ALTER TABLE `check_in_out`
  ADD CONSTRAINT `check_in_out_socio_FK` FOREIGN KEY (`id_socio`) REFERENCES `socio` (`id_socio`);

--
-- Limitadores para a tabela `inscricoes`
--
ALTER TABLE `inscricoes`
  ADD CONSTRAINT `inscricoes_aulas_FK` FOREIGN KEY (`id_aula`) REFERENCES `aulas` (`id_aula`),
  ADD CONSTRAINT `inscricoes_socio_FK` FOREIGN KEY (`id_socio`) REFERENCES `socio` (`id_socio`);

--
-- Limitadores para a tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD CONSTRAINT `pagamento_socio_FK` FOREIGN KEY (`id_socio`) REFERENCES `socio` (`id_socio`);

--
-- Limitadores para a tabela `presencas`
--
ALTER TABLE `presencas`
  ADD CONSTRAINT `presencas_aulas_FK` FOREIGN KEY (`id_aula`) REFERENCES `aulas` (`id_aula`),
  ADD CONSTRAINT `presencas_socio_FK` FOREIGN KEY (`id_socio`) REFERENCES `socio` (`id_socio`);

--
-- Limitadores para a tabela `vendas`
--
ALTER TABLE `vendas`
  ADD CONSTRAINT `vendas_socio_FK` FOREIGN KEY (`id_socio`) REFERENCES `socio` (`id_socio`);

--
-- Limitadores para a tabela `vendas_produtos`
--
ALTER TABLE `vendas_produtos`
  ADD CONSTRAINT `vendas_produtos_produtos_FK` FOREIGN KEY (`id_produtos`) REFERENCES `produtos` (`id_produtos`),
  ADD CONSTRAINT `vendas_produtos_vendas_FK` FOREIGN KEY (`id_venda`) REFERENCES `vendas` (`id_venda`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
