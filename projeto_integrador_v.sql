-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 11, 2021 at 08:41 PM
-- Server version: 10.5.10-MariaDB
-- PHP Version: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projeto_integrador_v`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_carrousel`
--

CREATE TABLE IF NOT EXISTS `tb_carrousel` (
  `cod_carrousel` int(5) NOT NULL,
  `nome_carrousel` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_carrousel`
--

INSERT INTO `tb_carrousel` (`cod_carrousel`, `nome_carrousel`) VALUES
(1, 'Como funciona'),
(2, 'Tenha conosco');

-- --------------------------------------------------------

--
-- Table structure for table `tb_faq`
--

CREATE TABLE IF NOT EXISTS `tb_faq` (
  `cod_faq` int(5) NOT NULL,
  `pergunta_faq` text NOT NULL,
  `resposta_faq` text NOT NULL,
  `ordem_faq` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_formulario_inicial`
--

CREATE TABLE IF NOT EXISTS `tb_formulario_inicial` (
  `cod_marca_veiculo` int(5) NOT NULL,
  `cod_modelo_veiculo` int(5) NOT NULL,
  `ano_modelo` int(4) NOT NULL,
  `quilometragem` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_formulario_lojista_parceiro`
--

CREATE TABLE IF NOT EXISTS `tb_formulario_lojista_parceiro` (
  `nome_usuario` varchar(200) NOT NULL,
  `telefone_usuario` int(20) NOT NULL,
  `email_usuario` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_item_carrousel`
--

CREATE TABLE IF NOT EXISTS `tb_item_carrousel` (
  `cod_item_carrousel` int(5) NOT NULL,
  `cod_carrousel` int(5) NOT NULL,
  `titulo_item_carrousel` varchar(300) NOT NULL,
  `imagem_item_carrousel` text NOT NULL,
  `conteudo_item_carrousel` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_marca_veiculo`
--

CREATE TABLE IF NOT EXISTS `tb_marca_veiculo` (
  `cod_marca_veiculo` int(5) NOT NULL,
  `nome_marca_veiculo` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tb_marca_veiculo`
--

INSERT INTO `tb_marca_veiculo` (`cod_marca_veiculo`, `nome_marca_veiculo`) VALUES
(2, 'Ford'),
(3, 'Hyundai');

-- --------------------------------------------------------

--
-- Table structure for table `tb_modelo_veiculo`
--

CREATE TABLE IF NOT EXISTS `tb_modelo_veiculo` (
  `cod_modelo_veiculo` int(5) NOT NULL,
  `cod_marca_veiculo` int(5) NOT NULL,
  `nome_modelo_veiculo` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_carrousel`
--
ALTER TABLE `tb_carrousel`
  ADD PRIMARY KEY (`cod_carrousel`);

--
-- Indexes for table `tb_faq`
--
ALTER TABLE `tb_faq`
  ADD PRIMARY KEY (`cod_faq`);

--
-- Indexes for table `tb_formulario_inicial`
--
ALTER TABLE `tb_formulario_inicial`
  ADD KEY `cod_marca` (`cod_marca_veiculo`),
  ADD KEY `cod_modelo_veiculo` (`cod_modelo_veiculo`);

--
-- Indexes for table `tb_item_carrousel`
--
ALTER TABLE `tb_item_carrousel`
  ADD PRIMARY KEY (`cod_item_carrousel`),
  ADD KEY `cod_carrousel` (`cod_carrousel`);

--
-- Indexes for table `tb_marca_veiculo`
--
ALTER TABLE `tb_marca_veiculo`
  ADD PRIMARY KEY (`cod_marca_veiculo`);

--
-- Indexes for table `tb_modelo_veiculo`
--
ALTER TABLE `tb_modelo_veiculo`
  ADD PRIMARY KEY (`cod_modelo_veiculo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_carrousel`
--
ALTER TABLE `tb_carrousel`
  MODIFY `cod_carrousel` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tb_faq`
--
ALTER TABLE `tb_faq`
  MODIFY `cod_faq` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_item_carrousel`
--
ALTER TABLE `tb_item_carrousel`
  MODIFY `cod_item_carrousel` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_marca_veiculo`
--
ALTER TABLE `tb_marca_veiculo`
  MODIFY `cod_marca_veiculo` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tb_modelo_veiculo`
--
ALTER TABLE `tb_modelo_veiculo`
  MODIFY `cod_modelo_veiculo` int(5) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_formulario_inicial`
--
ALTER TABLE `tb_formulario_inicial`
  ADD CONSTRAINT `fk_tb_formulario_inicial_tb_marca_veiculo` FOREIGN KEY (`cod_marca_veiculo`) REFERENCES `tb_marca_veiculo` (`cod_marca_veiculo`),
  ADD CONSTRAINT `fk_tb_formulario_inicial_tb_modelo_veiculo` FOREIGN KEY (`cod_modelo_veiculo`) REFERENCES `tb_modelo_veiculo` (`cod_modelo_veiculo`);

--
-- Constraints for table `tb_item_carrousel`
--
ALTER TABLE `tb_item_carrousel`
  ADD CONSTRAINT `fk_tb_item_carrousel_tb_carrousel` FOREIGN KEY (`cod_carrousel`) REFERENCES `tb_carrousel` (`cod_carrousel`);

--
-- Constraints for table `tb_modelo_veiculo`
--
ALTER TABLE `tb_modelo_veiculo`
  ADD CONSTRAINT `fk_tb_modelo_veiculo_tb_marca_veiculo` FOREIGN KEY (`cod_modelo_veiculo`) REFERENCES `tb_marca_veiculo` (`cod_marca_veiculo`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
