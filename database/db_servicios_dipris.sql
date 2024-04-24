/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : db_servicios_dipris

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 24/04/2024 11:07:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for c_documentos_tramite
-- ----------------------------
DROP TABLE IF EXISTS `c_documentos_tramite`;
CREATE TABLE `c_documentos_tramite`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_tramite` int(11) NOT NULL,
  `nombre` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `obligatorio` int(10) NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_tipo_tramite`(`id_tipo_tramite` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Tabla de documentos para tramites' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of c_documentos_tramite
-- ----------------------------
INSERT INTO `c_documentos_tramite` VALUES (1, 1, 'Fotografia del solicitante (Tamaño Infantil) *', 1, NULL, '2023-08-04 14:03:43', NULL);
INSERT INTO `c_documentos_tramite` VALUES (2, 1, 'Certificado médico actualizado *', 1, NULL, '2023-08-04 14:03:46', NULL);
INSERT INTO `c_documentos_tramite` VALUES (3, 1, 'Estudios de laboratorio (Biometría Hemática, Coproparasitoscópico, Exudado faríngeo) *', 1, NULL, '2023-08-04 14:03:48', NULL);
INSERT INTO `c_documentos_tramite` VALUES (4, 1, 'Boleta del pago del curso en Hacienda del Estado (Unicamente pagos de hacienda del estado. No pagos en banco, en linea o tiendas de conveniencia) *', 1, NULL, '2023-08-04 14:03:50', NULL);
INSERT INTO `c_documentos_tramite` VALUES (5, 2, 'Fotografia del solicitante (Tamaño Infantil) *', 1, NULL, '2023-09-20 14:12:30', NULL);
INSERT INTO `c_documentos_tramite` VALUES (6, 2, 'Certificado médico actualizado *', 1, NULL, '2023-09-20 14:12:30', NULL);
INSERT INTO `c_documentos_tramite` VALUES (7, 2, 'Estudios de laboratorio (Biometría Hemática, Coproparasitoscópico, Exudado faríngeo) *', 1, NULL, '2023-09-20 14:12:31', NULL);

-- ----------------------------
-- Table structure for c_estados
-- ----------------------------
DROP TABLE IF EXISTS `c_estados`;
CREATE TABLE `c_estados`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pais` int(11) NOT NULL,
  `clave` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nombre` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `abrev` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_pais`(`id_pais` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Tabla de Estados de la República Mexicana' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of c_estados
-- ----------------------------
INSERT INTO `c_estados` VALUES (1, 1, '01', 'Aguascalientes', 'Ags.', '2015-05-18 00:00:00', '2015-05-18 17:56:33', NULL);
INSERT INTO `c_estados` VALUES (2, 1, '02', 'Baja California', 'BC', '2015-05-18 00:00:00', '2015-05-18 17:56:33', NULL);
INSERT INTO `c_estados` VALUES (3, 1, '03', 'Baja California Sur', 'BCS', '2015-05-18 00:00:00', '2015-05-18 17:56:33', NULL);
INSERT INTO `c_estados` VALUES (4, 1, '04', 'Campeche', 'Camp.', '2015-05-18 00:00:00', '2015-05-18 17:56:33', NULL);
INSERT INTO `c_estados` VALUES (5, 1, '05', 'Coahuila de Zaragoza', 'Coah.', '2015-05-18 00:00:00', '2015-05-18 17:56:33', NULL);
INSERT INTO `c_estados` VALUES (6, 1, '06', 'Colima', 'Col.', '2015-05-18 00:00:00', '2015-05-18 17:56:33', NULL);
INSERT INTO `c_estados` VALUES (7, 1, '07', 'Chiapas', 'Chis.', '2015-05-18 00:00:00', '2015-05-18 17:56:33', NULL);
INSERT INTO `c_estados` VALUES (8, 1, '08', 'Chihuahua', 'Chih.', '2015-05-18 00:00:00', '2015-05-18 17:56:33', NULL);
INSERT INTO `c_estados` VALUES (9, 1, '09', 'Distrito Federal', 'DF', '2015-05-18 00:00:00', '2015-05-18 17:56:33', NULL);
INSERT INTO `c_estados` VALUES (10, 1, '10', 'Durango', 'Dgo.', '2015-05-18 00:00:00', '2015-05-18 17:56:33', NULL);
INSERT INTO `c_estados` VALUES (11, 1, '11', 'Guanajuato', 'Gto.', '2015-05-18 00:00:00', '2015-05-18 17:56:33', NULL);
INSERT INTO `c_estados` VALUES (12, 1, '12', 'Guerrero', 'Gro.', '2015-05-18 00:00:00', '2015-05-18 17:56:33', NULL);
INSERT INTO `c_estados` VALUES (13, 1, '13', 'Hidalgo', 'Hgo.', '2015-05-18 00:00:00', '2015-05-18 17:56:33', NULL);
INSERT INTO `c_estados` VALUES (14, 1, '14', 'Jalisco', 'Jal.', '2015-05-18 00:00:00', '2015-05-18 17:56:33', NULL);
INSERT INTO `c_estados` VALUES (15, 1, '15', 'México', 'Mex.', '2015-05-18 00:00:00', '2015-05-18 17:56:33', NULL);
INSERT INTO `c_estados` VALUES (16, 1, '16', 'Michoacán de Ocampo', 'Mich.', '2015-05-18 00:00:00', '2015-05-18 17:56:33', NULL);
INSERT INTO `c_estados` VALUES (17, 1, '17', 'Morelos', 'Mor.', '2015-05-18 00:00:00', '2015-05-18 17:56:33', NULL);
INSERT INTO `c_estados` VALUES (18, 1, '18', 'Nayarit', 'Nay.', '2015-05-18 00:00:00', '2015-05-18 17:56:33', NULL);
INSERT INTO `c_estados` VALUES (19, 1, '19', 'Nuevo León', 'NL', '2015-05-18 00:00:00', '2015-05-18 17:56:33', NULL);
INSERT INTO `c_estados` VALUES (20, 1, '20', 'Oaxaca', 'Oax.', '2015-05-18 00:00:00', '2015-05-18 17:56:33', NULL);
INSERT INTO `c_estados` VALUES (21, 1, '21', 'Puebla', 'Pue.', '2015-05-18 00:00:00', '2015-05-18 17:56:33', NULL);
INSERT INTO `c_estados` VALUES (22, 1, '22', 'Querétaro', 'Qro.', '2015-05-18 00:00:00', '2015-05-18 17:56:33', NULL);
INSERT INTO `c_estados` VALUES (23, 1, '23', 'Quintana Roo', 'Q. Roo', '2015-05-18 00:00:00', '2015-05-18 17:56:33', NULL);
INSERT INTO `c_estados` VALUES (24, 1, '24', 'San Luis Potosí', 'SLP', '2015-05-18 00:00:00', '2015-05-18 17:56:33', NULL);
INSERT INTO `c_estados` VALUES (25, 1, '25', 'Sinaloa', 'Sin.', '2015-05-18 00:00:00', '2015-05-18 17:56:33', NULL);
INSERT INTO `c_estados` VALUES (26, 1, '26', 'Sonora', 'Son.', '2015-05-18 00:00:00', '2015-05-18 17:56:33', NULL);
INSERT INTO `c_estados` VALUES (27, 1, '27', 'Tabasco', 'Tab.', '2015-05-18 00:00:00', '2015-05-18 17:56:33', NULL);
INSERT INTO `c_estados` VALUES (28, 1, '28', 'Tamaulipas', 'Tamps.', '2015-05-18 00:00:00', '2015-05-18 17:56:33', NULL);
INSERT INTO `c_estados` VALUES (29, 1, '29', 'Tlaxcala', 'Tlax.', '2015-05-18 00:00:00', '2015-05-18 17:56:33', NULL);
INSERT INTO `c_estados` VALUES (30, 1, '30', 'Veracruz de Ignacio de la Llave', 'Ver.', '2015-05-18 00:00:00', '2015-05-18 17:56:33', NULL);
INSERT INTO `c_estados` VALUES (31, 1, '31', 'Yucatán', 'Yuc.', '2015-05-18 00:00:00', '2015-05-18 17:56:33', NULL);
INSERT INTO `c_estados` VALUES (32, 1, '32', 'Zacatecas', 'Zac.', '2015-05-18 00:00:00', '2015-05-18 17:56:33', NULL);

-- ----------------------------
-- Table structure for c_folios
-- ----------------------------
DROP TABLE IF EXISTS `c_folios`;
CREATE TABLE `c_folios`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_tramite` int(11) NULL DEFAULT NULL,
  `id_tramite` int(11) NULL DEFAULT NULL,
  `folio` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ocupado` int(11) NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `folio`(`folio` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4649 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of c_folios
-- ----------------------------
INSERT INTO `c_folios` VALUES (4639, 1, 13, '8755421', 1, '2023-08-22 14:22:49', '2023-08-22 17:49:09', NULL);
INSERT INTO `c_folios` VALUES (4640, 1, 15, '977887', 1, '2023-08-22 16:17:25', '2023-09-05 14:43:12', NULL);
INSERT INTO `c_folios` VALUES (4643, 1, 17, '8755422', 1, '2023-09-05 14:50:04', '2023-09-06 15:26:06', NULL);
INSERT INTO `c_folios` VALUES (4644, 1, 18, '8755423', 1, '2023-09-05 14:50:17', '2023-09-20 16:20:20', NULL);
INSERT INTO `c_folios` VALUES (4645, 1, 22, '8755424', 1, '2023-09-05 14:50:41', '2023-09-28 16:00:32', NULL);
INSERT INTO `c_folios` VALUES (4646, 1, 2, '8755425', 1, '2023-09-05 14:50:41', '2024-02-21 10:57:50', NULL);
INSERT INTO `c_folios` VALUES (4647, 1, NULL, '8755426', 0, '2023-09-05 14:50:41', '2023-09-05 14:50:41', NULL);
INSERT INTO `c_folios` VALUES (4648, 1, NULL, '8755427', 0, '2023-09-05 14:50:41', '2023-09-05 14:50:41', NULL);
INSERT INTO `c_folios` VALUES (4649, 1, NULL, '778979', 0, '2023-09-06 11:24:57', '2023-09-06 11:24:57', NULL);

-- ----------------------------
-- Table structure for c_hospitales
-- ----------------------------
DROP TABLE IF EXISTS `c_hospitales`;
CREATE TABLE `c_hospitales`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clave` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_hospitales
-- ----------------------------
INSERT INTO `c_hospitales` VALUES (1, '0', 'BANCO DE SANGRE', NULL, '2024-02-20 11:05:29', NULL);
INSERT INTO `c_hospitales` VALUES (2, '101', 'CENTRO ESTATAL ATENCION DEL PARTO HUMANIZADO TUXTLA GTZ.', NULL, '2024-02-20 11:05:29', NULL);
INSERT INTO `c_hospitales` VALUES (3, '108', 'CLINICA ATEN.RESPIRATORIA COVID-19 VILLAFLORES', NULL, '2024-02-20 11:05:29', NULL);
INSERT INTO `c_hospitales` VALUES (4, '19', 'CLINICA DE PARTO HUMANIZADO COMITAN', NULL, '2024-02-20 11:05:29', NULL);
INSERT INTO `c_hospitales` VALUES (5, '40', 'CLINICA DE PARTO HUMANIZADO HUIXTLA', NULL, '2024-02-20 11:05:29', NULL);
INSERT INTO `c_hospitales` VALUES (6, '65', 'CLINICA DE PARTO HUMANIZADO PALENQUE', NULL, '2024-02-20 11:05:29', NULL);
INSERT INTO `c_hospitales` VALUES (7, '78', 'CLINICA DE PARTO HUMANIZADO SAN CRISTOBAL DE LAS CASAS', NULL, '2024-02-20 11:05:29', NULL);
INSERT INTO `c_hospitales` VALUES (8, '89', 'CLINICA DE PARTO HUMANIZADO TAPACHULA', NULL, '2024-02-20 11:05:29', NULL);
INSERT INTO `c_hospitales` VALUES (9, '97', 'CLINICA DE PARTO HUMANIZADO TONALÁ', NULL, '2024-02-20 11:05:29', NULL);
INSERT INTO `c_hospitales` VALUES (10, '108', 'CLINICA DE PARTO HUMANIZADO VILLAFLORES', NULL, '2024-02-20 11:05:29', NULL);
INSERT INTO `c_hospitales` VALUES (11, '12', 'H.B.C. BERRIOZABAL', NULL, '2024-02-20 11:05:29', NULL);
INSERT INTO `c_hospitales` VALUES (12, '22', 'H.B.C. CHALCHIHUITAN', NULL, '2024-02-20 11:05:29', NULL);
INSERT INTO `c_hospitales` VALUES (13, '27', 'H.B.C. CHIAPA DE CORZO', NULL, '2024-02-20 11:06:22', NULL);
INSERT INTO `c_hospitales` VALUES (14, '8', 'H.B.C. DE ÁNGEL ALBINO CORZO', NULL, '2024-02-20 11:06:22', NULL);
INSERT INTO `c_hospitales` VALUES (15, '17', 'H.B.C. DE CINTALAPA DE FIGUEROA', NULL, '2024-02-20 11:06:22', NULL);
INSERT INTO `c_hospitales` VALUES (16, '34', 'H.B.C. DE FRONTERA COMALAPA', NULL, '2024-02-20 11:06:22', NULL);
INSERT INTO `c_hospitales` VALUES (17, '49', 'H.B.C. DE LARRAINZAR', NULL, '2024-02-20 11:06:22', NULL);
INSERT INTO `c_hospitales` VALUES (18, '107', 'H.B.C. DE REVOLUCION MEXICANA', NULL, '2024-02-20 11:06:22', NULL);
INSERT INTO `c_hospitales` VALUES (19, '91', 'H.B.C. DE TAPILULA', NULL, '2024-02-20 11:06:22', NULL);
INSERT INTO `c_hospitales` VALUES (20, '96', 'H.B.C. DE TILA', NULL, '2024-02-20 11:06:22', NULL);
INSERT INTO `c_hospitales` VALUES (21, '70', 'H.B.C. DEL PORVENIR', NULL, '2024-02-20 11:06:22', NULL);
INSERT INTO `c_hospitales` VALUES (22, '2', 'H.B.C. DR. MANUEL VELASCO SUAREZ ACALA', NULL, '2024-02-20 11:06:22', NULL);
INSERT INTO `c_hospitales` VALUES (23, '69', 'H.B.C. DR. RAFAEL ALFARO GONZÁLEZ PIJIJIAPAN', NULL, '2024-02-20 11:06:22', NULL);
INSERT INTO `c_hospitales` VALUES (24, '75', 'H.B.C. LAS ROSAS', NULL, '2024-02-20 11:06:22', NULL);
INSERT INTO `c_hospitales` VALUES (25, '52', 'H.B.C. MARGARITAS', NULL, '2024-02-20 11:06:22', NULL);
INSERT INTO `c_hospitales` VALUES (26, '59', 'H.B.C. OCOSINGO', NULL, '2024-02-20 11:06:22', NULL);
INSERT INTO `c_hospitales` VALUES (27, '62', 'H.B.C. OSTUACAN', NULL, '2024-02-20 11:06:22', NULL);
INSERT INTO `c_hospitales` VALUES (28, '64', 'H.B.C. OXCHUC', NULL, '2024-02-20 11:06:22', NULL);
INSERT INTO `c_hospitales` VALUES (29, '77', 'H.B.C. SALTO DE AGUA', NULL, '2024-02-20 11:06:22', NULL);
INSERT INTO `c_hospitales` VALUES (30, '23', 'H.B.C. SAN JUAN CHAMULA', NULL, '2024-02-20 11:06:22', NULL);
INSERT INTO `c_hospitales` VALUES (31, '59', 'H.B.C. SANTO DOMINGO', NULL, '2024-02-20 11:06:22', NULL);
INSERT INTO `c_hospitales` VALUES (32, '81', 'H.B.C. SIMOJOVEL', NULL, '2024-02-20 11:06:22', NULL);
INSERT INTO `c_hospitales` VALUES (33, '94', 'H.B.C. TEOPISCA', NULL, '2024-02-20 11:06:53', NULL);
INSERT INTO `c_hospitales` VALUES (34, '101', 'H.G. GILBERTO GOMEZ MAZA - TUXTLA', NULL, '2024-02-20 11:06:53', NULL);
INSERT INTO `c_hospitales` VALUES (35, '74', 'H.G. REFORMA', NULL, '2024-02-20 11:06:53', NULL);
INSERT INTO `c_hospitales` VALUES (36, '19', 'HOSPITAL DE LA MUJER COMITÁN', NULL, '2024-02-20 11:06:53', NULL);
INSERT INTO `c_hospitales` VALUES (37, '78', 'HOSPITAL DE LA MUJER SAN CRISTOBAL DE LAS CASAS', NULL, '2024-02-20 11:06:53', NULL);
INSERT INTO `c_hospitales` VALUES (38, '101', 'HOSPITAL DE LA MUJER TUXTLA GUTIERREZ', NULL, '2024-02-20 11:06:53', NULL);
INSERT INTO `c_hospitales` VALUES (39, '78', 'HOSPITAL DE LAS CULTURAS SAN CRISTOBAL DE LAS CASAS', NULL, '2024-02-20 11:06:53', NULL);
INSERT INTO `c_hospitales` VALUES (40, '108', 'HOSPITAL GENERAL BICENTENARIO VILLAFLORES', NULL, '2024-02-20 11:06:53', NULL);
INSERT INTO `c_hospitales` VALUES (41, '97', 'HOSPITAL GENERAL DR. JUAN C. CORZO TONALÁ', NULL, '2024-02-20 11:06:53', NULL);
INSERT INTO `c_hospitales` VALUES (42, '40', 'HOSPITAL GENERAL HUIXTLA', NULL, '2024-02-20 11:06:53', NULL);
INSERT INTO `c_hospitales` VALUES (43, '9', 'HOSPITAL GENERAL JUÁREZ ARRIAGA', NULL, '2024-02-20 11:06:53', NULL);
INSERT INTO `c_hospitales` VALUES (44, '19', 'HOSPITAL GENERAL MARIA IGNACIA GANDULFO COMITAN', NULL, '2024-02-20 11:06:53', NULL);
INSERT INTO `c_hospitales` VALUES (45, '65', 'HOSPITAL GENERAL PALENQUE', NULL, '2024-02-20 11:06:53', NULL);
INSERT INTO `c_hospitales` VALUES (46, '68', 'HOSPITAL GENERAL PICHUCALCO', NULL, '2024-02-20 11:06:53', NULL);
INSERT INTO `c_hospitales` VALUES (47, '89', 'HOSPITAL GENERAL TAPACHULA', NULL, '2024-02-20 11:06:53', NULL);
INSERT INTO `c_hospitales` VALUES (48, '109', 'HOSPITAL GENERAL YAJALON', NULL, '2024-02-20 11:06:53', NULL);
INSERT INTO `c_hospitales` VALUES (49, '101', 'HOSPITAL REGIONAL DR. RAFAEL PASCACIO GAMBOA', NULL, '2024-02-20 11:06:53', NULL);
INSERT INTO `c_hospitales` VALUES (50, '199', 'J.S.I. TUXTLA GUTIERREZ', NULL, '2024-02-20 11:06:53', NULL);
INSERT INTO `c_hospitales` VALUES (51, '299', 'J.S.II. SAN CRISTOBAL DE LAS CASAS', NULL, '2024-02-20 11:06:53', NULL);
INSERT INTO `c_hospitales` VALUES (52, '399', 'J.S.III. COMITAN', NULL, '2024-02-20 11:06:53', NULL);
INSERT INTO `c_hospitales` VALUES (53, '499', 'J.S.IV. VILLAFLORES', NULL, '2024-02-20 11:07:24', NULL);
INSERT INTO `c_hospitales` VALUES (54, '696', 'J.S.IX. OCOSINGO', NULL, '2024-02-20 11:07:24', NULL);
INSERT INTO `c_hospitales` VALUES (55, '599', 'J.S.V. PICHUCALCO', NULL, '2024-02-20 11:07:24', NULL);
INSERT INTO `c_hospitales` VALUES (56, '699', 'J.S.VI. PALENQUE', NULL, '2024-02-20 11:07:24', NULL);
INSERT INTO `c_hospitales` VALUES (57, '899', 'J.S.VII. TAPACHULA', NULL, '2024-02-20 11:07:24', NULL);
INSERT INTO `c_hospitales` VALUES (58, '999', 'J.S.VIII. TONALA', NULL, '2024-02-20 11:07:24', NULL);
INSERT INTO `c_hospitales` VALUES (59, '799', 'J.S.X. MOTOZINTLA', NULL, '2024-02-20 11:07:24', NULL);
INSERT INTO `c_hospitales` VALUES (60, '0', 'LABORATORIO ESTATAL', NULL, '2024-02-20 11:07:24', NULL);
INSERT INTO `c_hospitales` VALUES (61, '0', 'OFICINA CENTRAL', NULL, '2024-02-20 11:07:24', NULL);
INSERT INTO `c_hospitales` VALUES (62, '0', 'SALUD MENTAL \"SAN AGUSTIN\"', NULL, '2024-02-20 11:07:24', NULL);
INSERT INTO `c_hospitales` VALUES (63, '89', 'UNEME CAPA 1 TAPACHULA', NULL, '2024-02-20 11:07:24', NULL);
INSERT INTO `c_hospitales` VALUES (64, '89', 'UNEME CAPACITS TAPACHULA', NULL, '2024-02-20 11:07:24', NULL);
INSERT INTO `c_hospitales` VALUES (65, '89', 'UNEME SORID TAPACHULA', NULL, '2024-02-20 11:07:24', NULL);

-- ----------------------------
-- Table structure for c_municipios
-- ----------------------------
DROP TABLE IF EXISTS `c_municipios`;
CREATE TABLE `c_municipios`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_estado` int(11) NOT NULL COMMENT 'Relación con estados',
  `id_region` int(11) NULL DEFAULT NULL,
  `id_jurisdiccion` int(11) NULL DEFAULT NULL,
  `clave` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sigla` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_estado`(`id_estado` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2493 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Tabla de Municipios de la Republica Mexicana' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of c_municipios
-- ----------------------------
INSERT INTO `c_municipios` VALUES (1, 1, NULL, NULL, '001', 'Aguascalientes', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2, 1, NULL, NULL, '002', 'Asientos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (3, 1, NULL, NULL, '003', 'Calvillo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (4, 1, NULL, NULL, '004', 'Cosío', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (5, 1, NULL, NULL, '005', 'Jesús María', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (6, 1, NULL, NULL, '006', 'Pabellón de Arteaga', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (7, 1, NULL, NULL, '007', 'Rincón de Romos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (8, 1, NULL, NULL, '008', 'San José de Gracia', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (9, 1, NULL, NULL, '009', 'Tepezalá', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (10, 1, NULL, NULL, '010', 'El Llano', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (11, 1, NULL, NULL, '011', 'San Francisco de los Romo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (12, 2, NULL, NULL, '001', 'Ensenada', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (13, 2, NULL, NULL, '002', 'Mexicali', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (14, 2, NULL, NULL, '003', 'Tecate', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (15, 2, NULL, NULL, '004', 'Tijuana', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (16, 2, NULL, NULL, '005', 'Playas de Rosarito', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (17, 3, NULL, NULL, '001', 'Comondú', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (18, 3, NULL, NULL, '002', 'Mulegé', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (19, 3, NULL, NULL, '003', 'La Paz', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (20, 3, NULL, NULL, '008', 'Los Cabos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (21, 3, NULL, NULL, '009', 'Loreto', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (22, 4, NULL, NULL, '001', 'Calkiní', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (23, 4, NULL, NULL, '002', 'Campeche', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (24, 4, NULL, NULL, '003', 'Carmen', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (25, 4, NULL, NULL, '004', 'Champotón', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (26, 4, NULL, NULL, '005', 'Hecelchakán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (27, 4, NULL, NULL, '006', 'Hopelchén', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (28, 4, NULL, NULL, '007', 'Palizada', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (29, 4, NULL, NULL, '008', 'Tenabo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (30, 4, NULL, NULL, '009', 'Escárcega', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (31, 4, NULL, NULL, '010', 'Calakmul', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (32, 4, NULL, NULL, '011', 'Candelaria', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (33, 5, NULL, NULL, '001', 'Abasolo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (34, 5, NULL, NULL, '002', 'Acuña', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (35, 5, NULL, NULL, '003', 'Allende', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (36, 5, NULL, NULL, '004', 'Arteaga', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (37, 5, NULL, NULL, '005', 'Candela', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (38, 5, NULL, NULL, '006', 'Castaños', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (39, 5, NULL, NULL, '007', 'Cuatro Ciénegas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (40, 5, NULL, NULL, '008', 'Escobedo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (41, 5, NULL, NULL, '009', 'Francisco I. Madero', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (42, 5, NULL, NULL, '010', 'Frontera', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (43, 5, NULL, NULL, '011', 'General Cepeda', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (44, 5, NULL, NULL, '012', 'Guerrero', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (45, 5, NULL, NULL, '013', 'Hidalgo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (46, 5, NULL, NULL, '014', 'Jiménez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (47, 5, NULL, NULL, '015', 'Juárez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (48, 5, NULL, NULL, '016', 'Lamadrid', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (49, 5, NULL, NULL, '017', 'Matamoros', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (50, 5, NULL, NULL, '018', 'Monclova', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (51, 5, NULL, NULL, '019', 'Morelos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (52, 5, NULL, NULL, '020', 'Múzquiz', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (53, 5, NULL, NULL, '021', 'Nadadores', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (54, 5, NULL, NULL, '022', 'Nava', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (55, 5, NULL, NULL, '023', 'Ocampo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (56, 5, NULL, NULL, '024', 'Parras', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (57, 5, NULL, NULL, '025', 'Piedras Negras', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (58, 5, NULL, NULL, '026', 'Progreso', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (59, 5, NULL, NULL, '027', 'Ramos Arizpe', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (60, 5, NULL, NULL, '028', 'Sabinas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (61, 5, NULL, NULL, '029', 'Sacramento', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (62, 5, NULL, NULL, '030', 'Saltillo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (63, 5, NULL, NULL, '031', 'San Buenaventura', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (64, 5, NULL, NULL, '032', 'San Juan de Sabinas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (65, 5, NULL, NULL, '033', 'San Pedro', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (66, 5, NULL, NULL, '034', 'Sierra Mojada', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (67, 5, NULL, NULL, '035', 'Torreón', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (68, 5, NULL, NULL, '036', 'Viesca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (69, 5, NULL, NULL, '037', 'Villa Unión', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (70, 5, NULL, NULL, '038', 'Zaragoza', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (71, 6, NULL, NULL, '001', 'Armería', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (72, 6, NULL, NULL, '002', 'Colima', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (73, 6, NULL, NULL, '003', 'Comala', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (74, 6, NULL, NULL, '004', 'Coquimatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (75, 6, NULL, NULL, '005', 'Cuauhtémoc', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (76, 6, NULL, NULL, '006', 'Ixtlahuacán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (77, 6, NULL, NULL, '007', 'Manzanillo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (78, 6, NULL, NULL, '008', 'Minatitlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (79, 6, NULL, NULL, '009', 'Tecomán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (80, 6, NULL, NULL, '010', 'Villa de Álvarez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (81, 7, 10, 7, '001', 'Acacoyagua', '', '2015-05-18 00:00:00', '2022-07-13 18:30:06', NULL);
INSERT INTO `c_municipios` VALUES (82, 7, 4, 1, '002', 'Acala', '', '2015-05-18 00:00:00', '2022-07-13 18:30:06', NULL);
INSERT INTO `c_municipios` VALUES (83, 7, 10, 7, '003', 'Acapetahua', '', '2015-05-18 00:00:00', '2022-07-13 18:30:06', NULL);
INSERT INTO `c_municipios` VALUES (84, 7, 12, 9, '004', 'Altamirano', '', '2015-05-18 00:00:00', '2022-07-13 18:30:06', NULL);
INSERT INTO `c_municipios` VALUES (85, 7, 8, 5, '005', 'Amatán', '', '2015-05-18 00:00:00', '2022-07-13 18:30:06', NULL);
INSERT INTO `c_municipios` VALUES (86, 7, 11, 10, '006', 'Amatenango de la Frontera', '', '2015-05-18 00:00:00', '2022-07-13 18:30:06', NULL);
INSERT INTO `c_municipios` VALUES (87, 7, 5, 2, '007', 'Amatenango del Valle', '', '2015-05-18 00:00:00', '2022-07-13 18:30:06', NULL);
INSERT INTO `c_municipios` VALUES (88, 7, 6, 4, '008', 'Angel Albino Corzo', '', '2015-05-18 00:00:00', '2022-07-13 18:30:06', NULL);
INSERT INTO `c_municipios` VALUES (89, 7, 9, 8, '009', 'Arriaga', '', '2015-05-18 00:00:00', '2022-07-13 18:30:06', NULL);
INSERT INTO `c_municipios` VALUES (90, 7, 11, 10, '010', 'Bejucal de Ocampo', '', '2015-05-18 00:00:00', '2022-07-13 18:30:06', NULL);
INSERT INTO `c_municipios` VALUES (91, 7, 11, 10, '011', 'Bella Vista', '', '2015-05-18 00:00:00', '2022-07-13 18:30:06', NULL);
INSERT INTO `c_municipios` VALUES (92, 7, 1, 1, '012', 'Berriozábal', '', '2015-05-18 00:00:00', '2022-07-13 18:30:06', NULL);
INSERT INTO `c_municipios` VALUES (93, 7, 7, 5, '013', 'Bochil', '', '2015-05-18 00:00:00', '2022-07-13 18:30:06', NULL);
INSERT INTO `c_municipios` VALUES (94, 7, 7, 5, '014', 'El Bosque', '', '2015-05-18 00:00:00', '2022-07-13 18:30:06', NULL);
INSERT INTO `c_municipios` VALUES (95, 7, 10, 7, '015', 'Cacahoatán', '', '2015-05-18 00:00:00', '2022-07-13 18:30:06', NULL);
INSERT INTO `c_municipios` VALUES (96, 7, 13, 6, '016', 'Catazajá', '', '2015-05-18 00:00:00', '2022-07-13 18:30:06', NULL);
INSERT INTO `c_municipios` VALUES (97, 7, 2, 1, '017', 'Cintalapa', '', '2015-05-18 00:00:00', '2022-07-13 18:30:06', NULL);
INSERT INTO `c_municipios` VALUES (98, 7, 3, 1, '018', 'Coapilla', '', '2015-05-18 00:00:00', '2022-07-13 18:30:06', NULL);
INSERT INTO `c_municipios` VALUES (99, 7, 15, 3, '019', 'Comitán de Domínguez', '', '2015-05-18 00:00:00', '2022-07-13 18:30:06', NULL);
INSERT INTO `c_municipios` VALUES (100, 7, 6, 4, '020', 'La Concordia', '', '2015-05-18 00:00:00', '2022-07-13 18:30:06', NULL);
INSERT INTO `c_municipios` VALUES (101, 7, 3, 1, '021', 'Copainalá', '', '2015-05-18 00:00:00', '2022-07-13 18:30:06', NULL);
INSERT INTO `c_municipios` VALUES (102, 7, 5, 2, '022', 'Chalchihuitán', '', '2015-05-18 00:00:00', '2022-07-13 18:30:06', NULL);
INSERT INTO `c_municipios` VALUES (103, 7, 5, 2, '023', 'Chamula', '', '2015-05-18 00:00:00', '2022-07-13 18:30:07', NULL);
INSERT INTO `c_municipios` VALUES (104, 7, 5, 2, '024', 'Chanal', '', '2015-05-18 00:00:00', '2022-07-13 18:30:07', NULL);
INSERT INTO `c_municipios` VALUES (105, 7, 8, 5, '025', 'Chapultenango', '', '2015-05-18 00:00:00', '2022-07-13 18:30:07', NULL);
INSERT INTO `c_municipios` VALUES (106, 7, 5, 2, '026', 'Chenalhó', '', '2015-05-18 00:00:00', '2022-07-13 18:30:07', NULL);
INSERT INTO `c_municipios` VALUES (107, 7, 1, 1, '027', 'Chiapa de Corzo', '', '2015-05-18 00:00:00', '2022-07-13 18:30:07', NULL);
INSERT INTO `c_municipios` VALUES (108, 7, 4, 1, '028', 'Chiapilla', '', '2015-05-18 00:00:00', '2022-07-13 18:30:07', NULL);
INSERT INTO `c_municipios` VALUES (109, 7, 3, 1, '029', 'Chicoasén', '', '2015-05-18 00:00:00', '2022-07-13 18:30:07', NULL);
INSERT INTO `c_municipios` VALUES (110, 7, 11, 3, '030', 'Chicomuselo', '', '2015-05-18 00:00:00', '2022-07-13 18:30:07', NULL);
INSERT INTO `c_municipios` VALUES (111, 7, 14, 9, '031', 'Chilón', '', '2015-05-18 00:00:00', '2022-07-13 18:30:07', NULL);
INSERT INTO `c_municipios` VALUES (112, 7, 10, 7, '032', 'Escuintla', '', '2015-05-18 00:00:00', '2022-07-13 18:30:07', NULL);
INSERT INTO `c_municipios` VALUES (113, 7, 3, 1, '033', 'Francisco León', '', '2015-05-18 00:00:00', '2022-07-13 18:30:07', NULL);
INSERT INTO `c_municipios` VALUES (114, 7, 11, 3, '034', 'Frontera Comalapa', '', '2015-05-18 00:00:00', '2022-07-13 18:30:07', NULL);
INSERT INTO `c_municipios` VALUES (115, 7, 10, 7, '035', 'Frontera Hidalgo', '', '2015-05-18 00:00:00', '2022-07-13 18:30:07', NULL);
INSERT INTO `c_municipios` VALUES (116, 7, 11, 10, '036', 'La Grandeza', '', '2015-05-18 00:00:00', '2022-07-13 18:30:07', NULL);
INSERT INTO `c_municipios` VALUES (117, 7, 10, 7, '037', 'Huehuetán', '', '2015-05-18 00:00:00', '2022-07-13 18:30:07', NULL);
INSERT INTO `c_municipios` VALUES (118, 7, 5, 2, '038', 'Huixtán', '', '2015-05-18 00:00:00', '2022-07-13 18:30:07', NULL);
INSERT INTO `c_municipios` VALUES (119, 7, 7, 5, '039', 'Huitiupán', '', '2015-05-18 00:00:00', '2022-07-13 18:30:07', NULL);
INSERT INTO `c_municipios` VALUES (120, 7, 10, 7, '040', 'Huixtla', '', '2015-05-18 00:00:00', '2022-07-13 18:30:07', NULL);
INSERT INTO `c_municipios` VALUES (121, 7, 15, 3, '041', 'La Independencia', '', '2015-05-18 00:00:00', '2022-07-13 18:30:07', NULL);
INSERT INTO `c_municipios` VALUES (122, 7, 8, 5, '042', 'Ixhuatán', '', '2015-05-18 00:00:00', '2022-07-13 18:30:07', NULL);
INSERT INTO `c_municipios` VALUES (123, 7, 8, 5, '043', 'Ixtacomitán', '', '2015-05-18 00:00:00', '2022-07-13 18:30:07', NULL);
INSERT INTO `c_municipios` VALUES (124, 7, 7, 1, '044', 'Ixtapa', '', '2015-05-18 00:00:00', '2022-07-13 18:30:07', NULL);
INSERT INTO `c_municipios` VALUES (125, 7, 8, 5, '045', 'Ixtapangajoya', '', '2015-05-18 00:00:00', '2022-07-13 18:30:07', NULL);
INSERT INTO `c_municipios` VALUES (126, 7, 2, 1, '046', 'Jiquipilas', '', '2015-05-18 00:00:00', '2022-07-13 18:30:07', NULL);
INSERT INTO `c_municipios` VALUES (127, 7, 7, 5, '047', 'Jitotol', '', '2015-05-18 00:00:00', '2022-07-13 18:30:07', NULL);
INSERT INTO `c_municipios` VALUES (128, 7, 8, 5, '048', 'Juárez', '', '2015-05-18 00:00:00', '2022-07-13 18:30:08', NULL);
INSERT INTO `c_municipios` VALUES (129, 7, 5, 2, '049', 'Larráinzar', '', '2015-05-18 00:00:00', '2022-07-13 18:30:08', NULL);
INSERT INTO `c_municipios` VALUES (130, 7, 13, 6, '050', 'La Libertad', '', '2015-05-18 00:00:00', '2022-07-13 18:30:08', NULL);
INSERT INTO `c_municipios` VALUES (131, 7, 9, 7, '051', 'Mapastepec', '', '2015-05-18 00:00:00', '2022-07-13 18:30:08', NULL);
INSERT INTO `c_municipios` VALUES (132, 7, 15, 3, '052', 'Las Margaritas', '', '2015-05-18 00:00:00', '2022-07-13 18:30:08', NULL);
INSERT INTO `c_municipios` VALUES (133, 7, 11, 10, '053', 'Mazapa de Madero', '', '2015-05-18 00:00:00', '2022-07-13 18:30:08', NULL);
INSERT INTO `c_municipios` VALUES (134, 7, 10, 7, '054', 'Mazatán', '', '2015-05-18 00:00:00', '2022-07-13 18:30:08', NULL);
INSERT INTO `c_municipios` VALUES (135, 7, 10, 7, '055', 'Metapa', '', '2015-05-18 00:00:00', '2022-07-13 18:30:08', NULL);
INSERT INTO `c_municipios` VALUES (136, 7, 5, 2, '056', 'Mitontic', '', '2015-05-18 00:00:00', '2022-07-13 18:30:08', NULL);
INSERT INTO `c_municipios` VALUES (137, 7, 11, 10, '057', 'Motozintla', '', '2015-05-18 00:00:00', '2022-07-13 18:30:08', NULL);
INSERT INTO `c_municipios` VALUES (138, 7, 4, 1, '058', 'Nicolás Ruíz', '', '2015-05-18 00:00:00', '2022-07-13 18:30:08', NULL);
INSERT INTO `c_municipios` VALUES (139, 7, 12, 9, '059', 'Ocosingo', '', '2015-05-18 00:00:00', '2022-07-13 18:30:08', NULL);
INSERT INTO `c_municipios` VALUES (140, 7, 3, 1, '060', 'Ocotepec', '', '2015-05-18 00:00:00', '2022-07-13 18:30:08', NULL);
INSERT INTO `c_municipios` VALUES (141, 7, 2, 1, '061', 'Ocozocoautla de Espinosa', '', '2015-05-18 00:00:00', '2022-07-13 18:30:08', NULL);
INSERT INTO `c_municipios` VALUES (142, 7, 8, 5, '062', 'Ostuacán', '', '2015-05-18 00:00:00', '2022-07-13 18:30:08', NULL);
INSERT INTO `c_municipios` VALUES (143, 7, 3, 1, '063', 'Osumacinta', '', '2015-05-18 00:00:00', '2022-07-13 18:30:08', NULL);
INSERT INTO `c_municipios` VALUES (144, 7, 5, 2, '064', 'Oxchuc', '', '2015-05-18 00:00:00', '2022-07-13 18:30:08', NULL);
INSERT INTO `c_municipios` VALUES (145, 7, 13, 6, '065', 'Palenque', '', '2015-05-18 00:00:00', '2022-07-13 18:30:08', NULL);
INSERT INTO `c_municipios` VALUES (146, 7, 5, 2, '066', 'Pantelhó', '', '2015-05-18 00:00:00', '2022-07-13 18:30:08', NULL);
INSERT INTO `c_municipios` VALUES (147, 7, 7, 5, '067', 'Pantepec', '', '2015-05-18 00:00:00', '2022-07-13 18:30:08', NULL);
INSERT INTO `c_municipios` VALUES (148, 7, 8, 5, '068', 'Pichucalco', '', '2015-05-18 00:00:00', '2022-07-13 18:30:08', NULL);
INSERT INTO `c_municipios` VALUES (149, 7, 9, 8, '069', 'Pijijiapan', '', '2015-05-18 00:00:00', '2022-07-13 18:30:08', NULL);
INSERT INTO `c_municipios` VALUES (150, 7, 11, 10, '070', 'El Porvenir', '', '2015-05-18 00:00:00', '2022-07-13 18:30:08', NULL);
INSERT INTO `c_municipios` VALUES (151, 7, 10, 7, '071', 'Villa Comaltitlán', '', '2015-05-18 00:00:00', '2022-07-13 18:30:08', NULL);
INSERT INTO `c_municipios` VALUES (152, 7, 7, 5, '072', 'Pueblo Nuevo Solistahuacán', '', '2015-05-18 00:00:00', '2022-07-13 18:30:08', NULL);
INSERT INTO `c_municipios` VALUES (153, 7, 7, 5, '073', 'Rayón', '', '2015-05-18 00:00:00', '2022-07-13 18:30:09', NULL);
INSERT INTO `c_municipios` VALUES (154, 7, 8, 5, '074', 'Reforma', '', '2015-05-18 00:00:00', '2022-07-13 18:30:09', NULL);
INSERT INTO `c_municipios` VALUES (155, 7, 15, 2, '075', 'Las Rosas', '', '2015-05-18 00:00:00', '2022-07-13 18:30:09', NULL);
INSERT INTO `c_municipios` VALUES (156, 7, 14, 6, '076', 'Sabanilla', '', '2015-05-18 00:00:00', '2022-07-13 18:30:09', NULL);
INSERT INTO `c_municipios` VALUES (157, 7, 14, 6, '077', 'Salto de Agua', '', '2015-05-18 00:00:00', '2022-07-13 18:30:09', NULL);
INSERT INTO `c_municipios` VALUES (158, 7, 5, 2, '078', 'San Cristóbal de las Casas', '', '2015-05-18 00:00:00', '2022-07-13 18:30:09', NULL);
INSERT INTO `c_municipios` VALUES (159, 7, 3, 1, '079', 'San Fernando', '', '2015-05-18 00:00:00', '2022-07-13 18:30:09', NULL);
INSERT INTO `c_municipios` VALUES (160, 7, 11, 10, '080', 'Siltepec', '', '2015-05-18 00:00:00', '2022-07-13 18:30:09', NULL);
INSERT INTO `c_municipios` VALUES (161, 7, 7, 5, '081', 'Simojovel', '', '2015-05-18 00:00:00', '2022-07-13 18:30:09', NULL);
INSERT INTO `c_municipios` VALUES (162, 7, 14, 9, '082', 'Sitalá', '', '2015-05-18 00:00:00', '2022-07-13 18:30:09', NULL);
INSERT INTO `c_municipios` VALUES (163, 7, 4, 3, '083', 'Socoltenango', '', '2015-05-18 00:00:00', '2022-07-13 18:30:09', NULL);
INSERT INTO `c_municipios` VALUES (164, 7, 8, 5, '084', 'Solosuchiapa', '', '2015-05-18 00:00:00', '2022-07-13 18:30:09', NULL);
INSERT INTO `c_municipios` VALUES (165, 7, 7, 1, '085', 'Soyaló', '', '2015-05-18 00:00:00', '2022-07-13 18:30:09', NULL);
INSERT INTO `c_municipios` VALUES (166, 7, 1, 1, '086', 'Suchiapa', '', '2015-05-18 00:00:00', '2022-07-13 18:30:09', NULL);
INSERT INTO `c_municipios` VALUES (167, 7, 10, 7, '087', 'Suchiate', '', '2015-05-18 00:00:00', '2022-07-13 18:30:09', NULL);
INSERT INTO `c_municipios` VALUES (168, 7, 8, 5, '088', 'Sunuapa', '', '2015-05-18 00:00:00', '2022-07-13 18:30:09', NULL);
INSERT INTO `c_municipios` VALUES (169, 7, 10, 7, '089', 'Tapachula', '', '2015-05-18 00:00:00', '2022-07-13 18:30:09', NULL);
INSERT INTO `c_municipios` VALUES (170, 7, 7, 5, '090', 'Tapalapa', '', '2015-05-18 00:00:00', '2022-07-13 18:30:09', NULL);
INSERT INTO `c_municipios` VALUES (171, 7, 7, 5, '091', 'Tapilula', '', '2015-05-18 00:00:00', '2022-07-13 18:30:09', NULL);
INSERT INTO `c_municipios` VALUES (172, 7, 3, 1, '092', 'Tecpatán', '', '2015-05-18 00:00:00', '2022-07-13 18:30:09', NULL);
INSERT INTO `c_municipios` VALUES (173, 7, 5, 2, '093', 'Tenejapa', '', '2015-05-18 00:00:00', '2022-07-13 18:30:09', NULL);
INSERT INTO `c_municipios` VALUES (174, 7, 5, 2, '094', 'Teopisca', '', '2015-05-18 00:00:00', '2022-07-13 18:30:09', NULL);
INSERT INTO `c_municipios` VALUES (175, 7, 14, 6, '096', 'Tila', '', '2015-05-18 00:00:00', '2022-07-13 18:30:09', NULL);
INSERT INTO `c_municipios` VALUES (176, 7, 9, 8, '097', 'Tonalá', '', '2015-05-18 00:00:00', '2022-07-13 18:30:09', NULL);
INSERT INTO `c_municipios` VALUES (177, 7, 4, 1, '098', 'Totolapa', '', '2015-05-18 00:00:00', '2022-07-13 18:30:09', NULL);
INSERT INTO `c_municipios` VALUES (178, 7, 15, 3, '099', 'La Trinitaria', '', '2015-05-18 00:00:00', '2022-07-13 18:30:10', NULL);
INSERT INTO `c_municipios` VALUES (179, 7, 14, 6, '100', 'Tumbalá', '', '2015-05-18 00:00:00', '2022-07-13 18:30:10', NULL);
INSERT INTO `c_municipios` VALUES (180, 7, 1, 1, '101', 'Tuxtla Gutiérrez', '', '2015-05-18 00:00:00', '2022-07-13 18:30:10', NULL);
INSERT INTO `c_municipios` VALUES (181, 7, 10, 7, '102', 'Tuxtla Chico', '', '2015-05-18 00:00:00', '2022-07-13 18:30:10', NULL);
INSERT INTO `c_municipios` VALUES (182, 7, 10, 7, '103', 'Tuzantán', '', '2015-05-18 00:00:00', '2022-07-13 18:30:10', NULL);
INSERT INTO `c_municipios` VALUES (183, 7, 15, 3, '104', 'Tzimol', '', '2015-05-18 00:00:00', '2022-07-13 18:30:10', NULL);
INSERT INTO `c_municipios` VALUES (184, 7, 10, 7, '105', 'Unión Juárez', '', '2015-05-18 00:00:00', '2022-07-13 18:30:10', NULL);
INSERT INTO `c_municipios` VALUES (185, 7, 4, 1, '106', 'Venustiano Carranza', '', '2015-05-18 00:00:00', '2022-07-13 18:30:10', NULL);
INSERT INTO `c_municipios` VALUES (186, 7, 6, 4, '107', 'Villa Corzo', '', '2015-05-18 00:00:00', '2022-07-13 18:30:10', NULL);
INSERT INTO `c_municipios` VALUES (187, 7, 6, 4, '108', 'Villaflores', '', '2015-05-18 00:00:00', '2022-07-13 18:30:10', NULL);
INSERT INTO `c_municipios` VALUES (188, 7, 14, 6, '109', 'Yajalón', '', '2015-05-18 00:00:00', '2022-07-13 18:30:10', NULL);
INSERT INTO `c_municipios` VALUES (189, 7, 4, 1, '110', 'San Lucas', '', '2015-05-18 00:00:00', '2022-07-13 18:30:10', NULL);
INSERT INTO `c_municipios` VALUES (190, 7, 5, 2, '111', 'Zinacantán', '', '2015-05-18 00:00:00', '2022-07-13 18:30:10', NULL);
INSERT INTO `c_municipios` VALUES (191, 7, 5, 2, '112', 'San Juan Cancuc', '', '2015-05-18 00:00:00', '2022-07-13 18:30:10', NULL);
INSERT INTO `c_municipios` VALUES (192, 7, 5, 2, '113', 'Aldama', '', '2015-05-18 00:00:00', '2022-07-13 18:30:10', NULL);
INSERT INTO `c_municipios` VALUES (193, 7, 13, 6, '114', 'Benemérito de las Américas', '', '2015-05-18 00:00:00', '2022-07-13 18:30:10', NULL);
INSERT INTO `c_municipios` VALUES (194, 7, 15, 3, '115', 'Maravilla Tenejapa', '', '2015-05-18 00:00:00', '2022-07-13 18:30:10', NULL);
INSERT INTO `c_municipios` VALUES (195, 7, 13, 6, '116', 'Marqués de Comillas', '', '2015-05-18 00:00:00', '2022-07-13 18:30:10', NULL);
INSERT INTO `c_municipios` VALUES (196, 7, 6, 4, '117', 'Montecristo de Guerrero', '', '2015-05-18 00:00:00', '2022-07-13 18:30:10', NULL);
INSERT INTO `c_municipios` VALUES (197, 7, 7, 5, '118', 'San Andrés Duraznal', '', '2015-05-18 00:00:00', '2022-07-13 18:30:10', NULL);
INSERT INTO `c_municipios` VALUES (198, 7, 5, 2, '119', 'Santiago el Pinar', '', '2015-05-18 00:00:00', '2022-07-13 18:30:10', NULL);
INSERT INTO `c_municipios` VALUES (199, 8, NULL, NULL, '001', 'Ahumada', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (200, 8, NULL, NULL, '002', 'Aldama', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (201, 8, NULL, NULL, '003', 'Allende', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (202, 8, NULL, NULL, '004', 'Aquiles Serdán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (203, 8, NULL, NULL, '005', 'Ascensión', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (204, 8, NULL, NULL, '006', 'Bachíniva', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (205, 8, NULL, NULL, '007', 'Balleza', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (206, 8, NULL, NULL, '008', 'Batopilas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (207, 8, NULL, NULL, '009', 'Bocoyna', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (208, 8, NULL, NULL, '010', 'Buenaventura', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (209, 8, NULL, NULL, '011', 'Camargo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (210, 8, NULL, NULL, '012', 'Carichí', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (211, 8, NULL, NULL, '013', 'Casas Grandes', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (212, 8, NULL, NULL, '014', 'Coronado', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (213, 8, NULL, NULL, '015', 'Coyame del Sotol', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (214, 8, NULL, NULL, '016', 'La Cruz', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (215, 8, NULL, NULL, '017', 'Cuauhtémoc', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (216, 8, NULL, NULL, '018', 'Cusihuiriachi', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (217, 8, NULL, NULL, '019', 'Chihuahua', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (218, 8, NULL, NULL, '020', 'Chínipas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (219, 8, NULL, NULL, '021', 'Delicias', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (220, 8, NULL, NULL, '022', 'Dr. Belisario Domínguez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (221, 8, NULL, NULL, '023', 'Galeana', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (222, 8, NULL, NULL, '024', 'Santa Isabel', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (223, 8, NULL, NULL, '025', 'Gómez Farías', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (224, 8, NULL, NULL, '026', 'Gran Morelos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (225, 8, NULL, NULL, '027', 'Guachochi', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (226, 8, NULL, NULL, '028', 'Guadalupe', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (227, 8, NULL, NULL, '029', 'Guadalupe y Calvo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (228, 8, NULL, NULL, '030', 'Guazapares', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (229, 8, NULL, NULL, '031', 'Guerrero', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (230, 8, NULL, NULL, '032', 'Hidalgo del Parral', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (231, 8, NULL, NULL, '033', 'Huejotitán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (232, 8, NULL, NULL, '034', 'Ignacio Zaragoza', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (233, 8, NULL, NULL, '035', 'Janos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (234, 8, NULL, NULL, '036', 'Jiménez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (235, 8, NULL, NULL, '037', 'Juárez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (236, 8, NULL, NULL, '038', 'Julimes', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (237, 8, NULL, NULL, '039', 'López', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (238, 8, NULL, NULL, '040', 'Madera', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (239, 8, NULL, NULL, '041', 'Maguarichi', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (240, 8, NULL, NULL, '042', 'Manuel Benavides', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (241, 8, NULL, NULL, '043', 'Matachí', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (242, 8, NULL, NULL, '044', 'Matamoros', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (243, 8, NULL, NULL, '045', 'Meoqui', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (244, 8, NULL, NULL, '046', 'Morelos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (245, 8, NULL, NULL, '047', 'Moris', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (246, 8, NULL, NULL, '048', 'Namiquipa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (247, 8, NULL, NULL, '049', 'Nonoava', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (248, 8, NULL, NULL, '050', 'Nuevo Casas Grandes', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (249, 8, NULL, NULL, '051', 'Ocampo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (250, 8, NULL, NULL, '052', 'Ojinaga', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (251, 8, NULL, NULL, '053', 'Praxedis G. Guerrero', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (252, 8, NULL, NULL, '054', 'Riva Palacio', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (253, 8, NULL, NULL, '055', 'Rosales', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (254, 8, NULL, NULL, '056', 'Rosario', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (255, 8, NULL, NULL, '057', 'San Francisco de Borja', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (256, 8, NULL, NULL, '058', 'San Francisco de Conchos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (257, 8, NULL, NULL, '059', 'San Francisco del Oro', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (258, 8, NULL, NULL, '060', 'Santa Bárbara', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (259, 8, NULL, NULL, '061', 'Satevó', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (260, 8, NULL, NULL, '062', 'Saucillo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (261, 8, NULL, NULL, '063', 'Temósachic', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (262, 8, NULL, NULL, '064', 'El Tule', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (263, 8, NULL, NULL, '065', 'Urique', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (264, 8, NULL, NULL, '066', 'Uruachi', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (265, 8, NULL, NULL, '067', 'Valle de Zaragoza', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (266, 9, NULL, NULL, '002', 'Azcapotzalco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (267, 9, NULL, NULL, '003', 'Coyoacán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (268, 9, NULL, NULL, '004', 'Cuajimalpa de Morelos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (269, 9, NULL, NULL, '005', 'Gustavo A. Madero', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (270, 9, NULL, NULL, '006', 'Iztacalco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (271, 9, NULL, NULL, '007', 'Iztapalapa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (272, 9, NULL, NULL, '008', 'La Magdalena Contreras', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (273, 9, NULL, NULL, '009', 'Milpa Alta', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (274, 9, NULL, NULL, '010', 'Álvaro Obregón', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (275, 9, NULL, NULL, '011', 'Tláhuac', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (276, 9, NULL, NULL, '012', 'Tlalpan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (277, 9, NULL, NULL, '013', 'Xochimilco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (278, 9, NULL, NULL, '014', 'Benito Juárez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (279, 9, NULL, NULL, '015', 'Cuauhtémoc', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (280, 9, NULL, NULL, '016', 'Miguel Hidalgo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (281, 9, NULL, NULL, '017', 'Venustiano Carranza', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (282, 10, NULL, NULL, '001', 'Canatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (283, 10, NULL, NULL, '002', 'Canelas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (284, 10, NULL, NULL, '003', 'Coneto de Comonfort', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (285, 10, NULL, NULL, '004', 'Cuencamé', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (286, 10, NULL, NULL, '005', 'Durango', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (287, 10, NULL, NULL, '006', 'General Simón Bolívar', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (288, 10, NULL, NULL, '007', 'Gómez Palacio', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (289, 10, NULL, NULL, '008', 'Guadalupe Victoria', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (290, 10, NULL, NULL, '009', 'Guanaceví', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (291, 10, NULL, NULL, '010', 'Hidalgo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (292, 10, NULL, NULL, '011', 'Indé', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (293, 10, NULL, NULL, '012', 'Lerdo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (294, 10, NULL, NULL, '013', 'Mapimí', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (295, 10, NULL, NULL, '014', 'Mezquital', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (296, 10, NULL, NULL, '015', 'Nazas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (297, 10, NULL, NULL, '016', 'Nombre de Dios', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (298, 10, NULL, NULL, '017', 'Ocampo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (299, 10, NULL, NULL, '018', 'El Oro', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (300, 10, NULL, NULL, '019', 'Otáez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (301, 10, NULL, NULL, '020', 'Pánuco de Coronado', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (302, 10, NULL, NULL, '021', 'Peñón Blanco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (303, 10, NULL, NULL, '022', 'Poanas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (304, 10, NULL, NULL, '023', 'Pueblo Nuevo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (305, 10, NULL, NULL, '024', 'Rodeo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (306, 10, NULL, NULL, '025', 'San Bernardo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (307, 10, NULL, NULL, '026', 'San Dimas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (308, 10, NULL, NULL, '027', 'San Juan de Guadalupe', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (309, 10, NULL, NULL, '028', 'San Juan del Río', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (310, 10, NULL, NULL, '029', 'San Luis del Cordero', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (311, 10, NULL, NULL, '030', 'San Pedro del Gallo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (312, 10, NULL, NULL, '031', 'Santa Clara', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (313, 10, NULL, NULL, '032', 'Santiago Papasquiaro', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (314, 10, NULL, NULL, '033', 'Súchil', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (315, 10, NULL, NULL, '034', 'Tamazula', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (316, 10, NULL, NULL, '035', 'Tepehuanes', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (317, 10, NULL, NULL, '036', 'Tlahualilo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (318, 10, NULL, NULL, '037', 'Topia', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (319, 10, NULL, NULL, '038', 'Vicente Guerrero', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (320, 10, NULL, NULL, '039', 'Nuevo Ideal', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (321, 11, NULL, NULL, '001', 'Abasolo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (322, 11, NULL, NULL, '002', 'Acámbaro', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (323, 11, NULL, NULL, '003', 'San Miguel de Allende', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (324, 11, NULL, NULL, '004', 'Apaseo el Alto', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (325, 11, NULL, NULL, '005', 'Apaseo el Grande', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (326, 11, NULL, NULL, '006', 'Atarjea', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (327, 11, NULL, NULL, '007', 'Celaya', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (328, 11, NULL, NULL, '008', 'Manuel Doblado', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (329, 11, NULL, NULL, '009', 'Comonfort', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (330, 11, NULL, NULL, '010', 'Coroneo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (331, 11, NULL, NULL, '011', 'Cortazar', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (332, 11, NULL, NULL, '012', 'Cuerámaro', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (333, 11, NULL, NULL, '013', 'Doctor Mora', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (334, 11, NULL, NULL, '014', 'Dolores Hidalgo Cuna de la Independencia Nacional', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (335, 11, NULL, NULL, '015', 'Guanajuato', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (336, 11, NULL, NULL, '016', 'Huanímaro', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (337, 11, NULL, NULL, '017', 'Irapuato', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (338, 11, NULL, NULL, '018', 'Jaral del Progreso', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (339, 11, NULL, NULL, '019', 'Jerécuaro', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (340, 11, NULL, NULL, '020', 'León', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (341, 11, NULL, NULL, '021', 'Moroleón', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (342, 11, NULL, NULL, '022', 'Ocampo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (343, 11, NULL, NULL, '023', 'Pénjamo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (344, 11, NULL, NULL, '024', 'Pueblo Nuevo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (345, 11, NULL, NULL, '025', 'Purísima del Rincón', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (346, 11, NULL, NULL, '026', 'Romita', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (347, 11, NULL, NULL, '027', 'Salamanca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (348, 11, NULL, NULL, '028', 'Salvatierra', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (349, 11, NULL, NULL, '029', 'San Diego de la Unión', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (350, 11, NULL, NULL, '030', 'San Felipe', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (351, 11, NULL, NULL, '031', 'San Francisco del Rincón', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (352, 11, NULL, NULL, '032', 'San José Iturbide', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (353, 11, NULL, NULL, '033', 'San Luis de la Paz', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (354, 11, NULL, NULL, '034', 'Santa Catarina', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (355, 11, NULL, NULL, '035', 'Santa Cruz de Juventino Rosas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (356, 11, NULL, NULL, '036', 'Santiago Maravatío', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (357, 11, NULL, NULL, '037', 'Silao', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (358, 11, NULL, NULL, '038', 'Tarandacuao', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (359, 11, NULL, NULL, '039', 'Tarimoro', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (360, 11, NULL, NULL, '040', 'Tierra Blanca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (361, 11, NULL, NULL, '041', 'Uriangato', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (362, 11, NULL, NULL, '042', 'Valle de Santiago', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (363, 11, NULL, NULL, '043', 'Victoria', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (364, 11, NULL, NULL, '044', 'Villagrán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (365, 11, NULL, NULL, '045', 'Xichú', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (366, 11, NULL, NULL, '046', 'Yuriria', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (367, 12, NULL, NULL, '001', 'Acapulco de Juárez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (368, 12, NULL, NULL, '002', 'Ahuacuotzingo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (369, 12, NULL, NULL, '003', 'Ajuchitlán del Progreso', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (370, 12, NULL, NULL, '004', 'Alcozauca de Guerrero', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (371, 12, NULL, NULL, '005', 'Alpoyeca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (372, 12, NULL, NULL, '006', 'Apaxtla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (373, 12, NULL, NULL, '007', 'Arcelia', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (374, 12, NULL, NULL, '008', 'Atenango del Río', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (375, 12, NULL, NULL, '009', 'Atlamajalcingo del Monte', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (376, 12, NULL, NULL, '010', 'Atlixtac', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (377, 12, NULL, NULL, '011', 'Atoyac de Álvarez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (378, 12, NULL, NULL, '012', 'Ayutla de los Libres', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (379, 12, NULL, NULL, '013', 'Azoyú', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (380, 12, NULL, NULL, '014', 'Benito Juárez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (381, 12, NULL, NULL, '015', 'Buenavista de Cuéllar', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (382, 12, NULL, NULL, '016', 'Coahuayutla de José María Izazaga', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (383, 12, NULL, NULL, '017', 'Cocula', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (384, 12, NULL, NULL, '018', 'Copala', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (385, 12, NULL, NULL, '019', 'Copalillo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (386, 12, NULL, NULL, '020', 'Copanatoyac', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (387, 12, NULL, NULL, '021', 'Coyuca de Benítez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (388, 12, NULL, NULL, '022', 'Coyuca de Catalán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (389, 12, NULL, NULL, '023', 'Cuajinicuilapa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (390, 12, NULL, NULL, '024', 'Cualác', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (391, 12, NULL, NULL, '025', 'Cuautepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (392, 12, NULL, NULL, '026', 'Cuetzala del Progreso', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (393, 12, NULL, NULL, '027', 'Cutzamala de Pinzón', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (394, 12, NULL, NULL, '028', 'Chilapa de Álvarez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (395, 12, NULL, NULL, '029', 'Chilpancingo de los Bravo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (396, 12, NULL, NULL, '030', 'Florencio Villarreal', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (397, 12, NULL, NULL, '031', 'General Canuto A. Neri', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (398, 12, NULL, NULL, '032', 'General Heliodoro Castillo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (399, 12, NULL, NULL, '033', 'Huamuxtitlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (400, 12, NULL, NULL, '034', 'Huitzuco de los Figueroa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (401, 12, NULL, NULL, '035', 'Iguala de la Independencia', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (402, 12, NULL, NULL, '036', 'Igualapa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (403, 12, NULL, NULL, '037', 'Ixcateopan de Cuauhtémoc', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (404, 12, NULL, NULL, '038', 'Zihuatanejo de Azueta', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (405, 12, NULL, NULL, '039', 'Juan R. Escudero', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (406, 12, NULL, NULL, '040', 'Leonardo Bravo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (407, 12, NULL, NULL, '041', 'Malinaltepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (408, 12, NULL, NULL, '042', 'Mártir de Cuilapan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (409, 12, NULL, NULL, '043', 'Metlatónoc', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (410, 12, NULL, NULL, '044', 'Mochitlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (411, 12, NULL, NULL, '045', 'Olinalá', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (412, 12, NULL, NULL, '046', 'Ometepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (413, 12, NULL, NULL, '047', 'Pedro Ascencio Alquisiras', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (414, 12, NULL, NULL, '048', 'Petatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (415, 12, NULL, NULL, '049', 'Pilcaya', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (416, 12, NULL, NULL, '050', 'Pungarabato', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (417, 12, NULL, NULL, '051', 'Quechultenango', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (418, 12, NULL, NULL, '052', 'San Luis Acatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (419, 12, NULL, NULL, '053', 'San Marcos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (420, 12, NULL, NULL, '054', 'San Miguel Totolapan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (421, 12, NULL, NULL, '055', 'Taxco de Alarcón', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (422, 12, NULL, NULL, '056', 'Tecoanapa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (423, 12, NULL, NULL, '057', 'Técpan de Galeana', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (424, 12, NULL, NULL, '058', 'Teloloapan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (425, 12, NULL, NULL, '059', 'Tepecoacuilco de Trujano', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (426, 12, NULL, NULL, '060', 'Tetipac', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (427, 12, NULL, NULL, '061', 'Tixtla de Guerrero', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (428, 12, NULL, NULL, '062', 'Tlacoachistlahuaca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (429, 12, NULL, NULL, '063', 'Tlacoapa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (430, 12, NULL, NULL, '064', 'Tlalchapa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (431, 12, NULL, NULL, '065', 'Tlalixtaquilla de Maldonado', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (432, 12, NULL, NULL, '066', 'Tlapa de Comonfort', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (433, 12, NULL, NULL, '067', 'Tlapehuala', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (434, 12, NULL, NULL, '068', 'La Unión de Isidoro Montes de Oca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (435, 12, NULL, NULL, '069', 'Xalpatláhuac', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (436, 12, NULL, NULL, '070', 'Xochihuehuetlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (437, 12, NULL, NULL, '071', 'Xochistlahuaca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (438, 12, NULL, NULL, '072', 'Zapotitlán Tablas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (439, 12, NULL, NULL, '073', 'Zirándaro', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (440, 12, NULL, NULL, '074', 'Zitlala', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (441, 12, NULL, NULL, '075', 'Eduardo Neri', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (442, 12, NULL, NULL, '076', 'Acatepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (443, 12, NULL, NULL, '077', 'Marquelia', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (444, 12, NULL, NULL, '078', 'Cochoapa el Grande', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (445, 12, NULL, NULL, '079', 'José Joaquín de Herrera', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (446, 12, NULL, NULL, '080', 'Juchitán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (447, 12, NULL, NULL, '081', 'Iliatenco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (448, 13, NULL, NULL, '001', 'Acatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (449, 13, NULL, NULL, '002', 'Acaxochitlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (450, 13, NULL, NULL, '003', 'Actopan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (451, 13, NULL, NULL, '004', 'Agua Blanca de Iturbide', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (452, 13, NULL, NULL, '005', 'Ajacuba', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (453, 13, NULL, NULL, '006', 'Alfajayucan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (454, 13, NULL, NULL, '007', 'Almoloya', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (455, 13, NULL, NULL, '008', 'Apan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (456, 13, NULL, NULL, '009', 'El Arenal', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (457, 13, NULL, NULL, '010', 'Atitalaquia', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (458, 13, NULL, NULL, '011', 'Atlapexco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (459, 13, NULL, NULL, '012', 'Atotonilco el Grande', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (460, 13, NULL, NULL, '013', 'Atotonilco de Tula', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (461, 13, NULL, NULL, '014', 'Calnali', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (462, 13, NULL, NULL, '015', 'Cardonal', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (463, 13, NULL, NULL, '016', 'Cuautepec de Hinojosa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (464, 13, NULL, NULL, '017', 'Chapantongo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (465, 13, NULL, NULL, '018', 'Chapulhuacán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (466, 13, NULL, NULL, '019', 'Chilcuautla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (467, 13, NULL, NULL, '020', 'Eloxochitlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (468, 13, NULL, NULL, '021', 'Emiliano Zapata', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (469, 13, NULL, NULL, '022', 'Epazoyucan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (470, 13, NULL, NULL, '023', 'Francisco I. Madero', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (471, 13, NULL, NULL, '024', 'Huasca de Ocampo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (472, 13, NULL, NULL, '025', 'Huautla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (473, 13, NULL, NULL, '026', 'Huazalingo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (474, 13, NULL, NULL, '027', 'Huehuetla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (475, 13, NULL, NULL, '028', 'Huejutla de Reyes', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (476, 13, NULL, NULL, '029', 'Huichapan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (477, 13, NULL, NULL, '030', 'Ixmiquilpan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (478, 13, NULL, NULL, '031', 'Jacala de Ledezma', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (479, 13, NULL, NULL, '032', 'Jaltocán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (480, 13, NULL, NULL, '033', 'Juárez Hidalgo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (481, 13, NULL, NULL, '034', 'Lolotla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (482, 13, NULL, NULL, '035', 'Metepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (483, 13, NULL, NULL, '036', 'San Agustín Metzquititlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (484, 13, NULL, NULL, '037', 'Metztitlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (485, 13, NULL, NULL, '038', 'Mineral del Chico', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (486, 13, NULL, NULL, '039', 'Mineral del Monte', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (487, 13, NULL, NULL, '040', 'La Misión', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (488, 13, NULL, NULL, '041', 'Mixquiahuala de Juárez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (489, 13, NULL, NULL, '042', 'Molango de Escamilla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (490, 13, NULL, NULL, '043', 'Nicolás Flores', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (491, 13, NULL, NULL, '044', 'Nopala de Villagrán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (492, 13, NULL, NULL, '045', 'Omitlán de Juárez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (493, 13, NULL, NULL, '046', 'San Felipe Orizatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (494, 13, NULL, NULL, '047', 'Pacula', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (495, 13, NULL, NULL, '048', 'Pachuca de Soto', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (496, 13, NULL, NULL, '049', 'Pisaflores', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (497, 13, NULL, NULL, '050', 'Progreso de Obregón', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (498, 13, NULL, NULL, '051', 'Mineral de la Reforma', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (499, 13, NULL, NULL, '052', 'San Agustín Tlaxiaca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (500, 13, NULL, NULL, '053', 'San Bartolo Tutotepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (501, 13, NULL, NULL, '054', 'San Salvador', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (502, 13, NULL, NULL, '055', 'Santiago de Anaya', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (503, 13, NULL, NULL, '056', 'Santiago Tulantepec de Lugo Guerrero', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (504, 13, NULL, NULL, '057', 'Singuilucan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (505, 13, NULL, NULL, '058', 'Tasquillo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (506, 13, NULL, NULL, '059', 'Tecozautla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (507, 13, NULL, NULL, '060', 'Tenango de Doria', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (508, 13, NULL, NULL, '061', 'Tepeapulco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (509, 13, NULL, NULL, '062', 'Tepehuacán de Guerrero', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (510, 13, NULL, NULL, '063', 'Tepeji del Río de Ocampo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (511, 13, NULL, NULL, '064', 'Tepetitlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (512, 13, NULL, NULL, '065', 'Tetepango', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (513, 13, NULL, NULL, '066', 'Villa de Tezontepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (514, 13, NULL, NULL, '067', 'Tezontepec de Aldama', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (515, 13, NULL, NULL, '068', 'Tianguistengo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (516, 13, NULL, NULL, '069', 'Tizayuca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (517, 13, NULL, NULL, '070', 'Tlahuelilpan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (518, 13, NULL, NULL, '071', 'Tlahuiltepa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (519, 13, NULL, NULL, '072', 'Tlanalapa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (520, 13, NULL, NULL, '073', 'Tlanchinol', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (521, 13, NULL, NULL, '074', 'Tlaxcoapan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (522, 13, NULL, NULL, '075', 'Tolcayuca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (523, 13, NULL, NULL, '076', 'Tula de Allende', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (524, 13, NULL, NULL, '077', 'Tulancingo de Bravo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (525, 13, NULL, NULL, '078', 'Xochiatipan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (526, 13, NULL, NULL, '079', 'Xochicoatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (527, 13, NULL, NULL, '080', 'Yahualica', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (528, 13, NULL, NULL, '081', 'Zacualtipán de Ángeles', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (529, 13, NULL, NULL, '082', 'Zapotlán de Juárez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (530, 13, NULL, NULL, '083', 'Zempoala', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (531, 13, NULL, NULL, '084', 'Zimapán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (532, 14, NULL, NULL, '001', 'Acatic', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (533, 14, NULL, NULL, '002', 'Acatlán de Juárez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (534, 14, NULL, NULL, '003', 'Ahualulco de Mercado', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (535, 14, NULL, NULL, '004', 'Amacueca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (536, 14, NULL, NULL, '005', 'Amatitán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (537, 14, NULL, NULL, '006', 'Ameca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (538, 14, NULL, NULL, '007', 'San Juanito de Escobedo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (539, 14, NULL, NULL, '008', 'Arandas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (540, 14, NULL, NULL, '009', 'El Arenal', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (541, 14, NULL, NULL, '010', 'Atemajac de Brizuela', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (542, 14, NULL, NULL, '011', 'Atengo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (543, 14, NULL, NULL, '012', 'Atenguillo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (544, 14, NULL, NULL, '013', 'Atotonilco el Alto', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (545, 14, NULL, NULL, '014', 'Atoyac', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (546, 14, NULL, NULL, '015', 'Autlán de Navarro', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (547, 14, NULL, NULL, '016', 'Ayotlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (548, 14, NULL, NULL, '017', 'Ayutla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (549, 14, NULL, NULL, '018', 'La Barca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (550, 14, NULL, NULL, '019', 'Bolaños', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (551, 14, NULL, NULL, '020', 'Cabo Corrientes', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (552, 14, NULL, NULL, '021', 'Casimiro Castillo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (553, 14, NULL, NULL, '022', 'Cihuatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (554, 14, NULL, NULL, '023', 'Zapotlán el Grande', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (555, 14, NULL, NULL, '024', 'Cocula', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (556, 14, NULL, NULL, '025', 'Colotlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (557, 14, NULL, NULL, '026', 'Concepción de Buenos Aires', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (558, 14, NULL, NULL, '027', 'Cuautitlán de García Barragán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (559, 14, NULL, NULL, '028', 'Cuautla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (560, 14, NULL, NULL, '029', 'Cuquío', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (561, 14, NULL, NULL, '030', 'Chapala', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (562, 14, NULL, NULL, '031', 'Chimaltitán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (563, 14, NULL, NULL, '032', 'Chiquilistlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (564, 14, NULL, NULL, '033', 'Degollado', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (565, 14, NULL, NULL, '034', 'Ejutla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (566, 14, NULL, NULL, '035', 'Encarnación de Díaz', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (567, 14, NULL, NULL, '036', 'Etzatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (568, 14, NULL, NULL, '037', 'El Grullo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (569, 14, NULL, NULL, '038', 'Guachinango', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (570, 14, NULL, NULL, '039', 'Guadalajara', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (571, 14, NULL, NULL, '040', 'Hostotipaquillo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (572, 14, NULL, NULL, '041', 'Huejúcar', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (573, 14, NULL, NULL, '042', 'Huejuquilla el Alto', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (574, 14, NULL, NULL, '043', 'La Huerta', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (575, 14, NULL, NULL, '044', 'Ixtlahuacán de los Membrillos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (576, 14, NULL, NULL, '045', 'Ixtlahuacán del Río', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (577, 14, NULL, NULL, '046', 'Jalostotitlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (578, 14, NULL, NULL, '047', 'Jamay', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (579, 14, NULL, NULL, '048', 'Jesús María', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (580, 14, NULL, NULL, '049', 'Jilotlán de los Dolores', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (581, 14, NULL, NULL, '050', 'Jocotepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (582, 14, NULL, NULL, '051', 'Juanacatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (583, 14, NULL, NULL, '052', 'Juchitlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (584, 14, NULL, NULL, '053', 'Lagos de Moreno', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (585, 14, NULL, NULL, '054', 'El Limón', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (586, 14, NULL, NULL, '055', 'Magdalena', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (587, 14, NULL, NULL, '056', 'Santa María del Oro', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (588, 14, NULL, NULL, '057', 'La Manzanilla de la Paz', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (589, 14, NULL, NULL, '058', 'Mascota', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (590, 14, NULL, NULL, '059', 'Mazamitla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (591, 14, NULL, NULL, '060', 'Mexticacán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (592, 14, NULL, NULL, '061', 'Mezquitic', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (593, 14, NULL, NULL, '062', 'Mixtlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (594, 14, NULL, NULL, '063', 'Ocotlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (595, 14, NULL, NULL, '064', 'Ojuelos de Jalisco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (596, 14, NULL, NULL, '065', 'Pihuamo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (597, 14, NULL, NULL, '066', 'Poncitlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (598, 14, NULL, NULL, '067', 'Puerto Vallarta', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (599, 14, NULL, NULL, '068', 'Villa Purificación', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (600, 14, NULL, NULL, '069', 'Quitupan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (601, 14, NULL, NULL, '070', 'El Salto', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (602, 14, NULL, NULL, '071', 'San Cristóbal de la Barranca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (603, 14, NULL, NULL, '072', 'San Diego de Alejandría', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (604, 14, NULL, NULL, '073', 'San Juan de los Lagos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (605, 14, NULL, NULL, '074', 'San Julián', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (606, 14, NULL, NULL, '075', 'San Marcos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (607, 14, NULL, NULL, '076', 'San Martín de Bolaños', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (608, 14, NULL, NULL, '077', 'San Martín Hidalgo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (609, 14, NULL, NULL, '078', 'San Miguel el Alto', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (610, 14, NULL, NULL, '079', 'Gómez Farías', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (611, 14, NULL, NULL, '080', 'San Sebastián del Oeste', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (612, 14, NULL, NULL, '081', 'Santa María de los Ángeles', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (613, 14, NULL, NULL, '082', 'Sayula', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (614, 14, NULL, NULL, '083', 'Tala', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (615, 14, NULL, NULL, '084', 'Talpa de Allende', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (616, 14, NULL, NULL, '085', 'Tamazula de Gordiano', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (617, 14, NULL, NULL, '086', 'Tapalpa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (618, 14, NULL, NULL, '087', 'Tecalitlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (619, 14, NULL, NULL, '088', 'Tecolotlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (620, 14, NULL, NULL, '089', 'Techaluta de Montenegro', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (621, 14, NULL, NULL, '090', 'Tenamaxtlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (622, 14, NULL, NULL, '091', 'Teocaltiche', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (623, 14, NULL, NULL, '092', 'Teocuitatlán de Corona', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (624, 14, NULL, NULL, '093', 'Tepatitlán de Morelos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (625, 14, NULL, NULL, '094', 'Tequila', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (626, 14, NULL, NULL, '095', 'Teuchitlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (627, 14, NULL, NULL, '096', 'Tizapán el Alto', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (628, 14, NULL, NULL, '097', 'Tlajomulco de Zúñiga', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (629, 14, NULL, NULL, '098', 'San Pedro Tlaquepaque', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (630, 14, NULL, NULL, '099', 'Tolimán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (631, 14, NULL, NULL, '100', 'Tomatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (632, 14, NULL, NULL, '101', 'Tonalá', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (633, 14, NULL, NULL, '102', 'Tonaya', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (634, 14, NULL, NULL, '103', 'Tonila', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (635, 14, NULL, NULL, '104', 'Totatiche', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (636, 14, NULL, NULL, '105', 'Tototlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (637, 14, NULL, NULL, '106', 'Tuxcacuesco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (638, 14, NULL, NULL, '107', 'Tuxcueca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (639, 14, NULL, NULL, '108', 'Tuxpan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (640, 14, NULL, NULL, '109', 'Unión de San Antonio', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (641, 14, NULL, NULL, '110', 'Unión de Tula', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (642, 14, NULL, NULL, '111', 'Valle de Guadalupe', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (643, 14, NULL, NULL, '112', 'Valle de Juárez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (644, 14, NULL, NULL, '113', 'San Gabriel', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (645, 14, NULL, NULL, '114', 'Villa Corona', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (646, 14, NULL, NULL, '115', 'Villa Guerrero', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (647, 14, NULL, NULL, '116', 'Villa Hidalgo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (648, 14, NULL, NULL, '117', 'Cañadas de Obregón', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (649, 14, NULL, NULL, '118', 'Yahualica de González Gallo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (650, 14, NULL, NULL, '119', 'Zacoalco de Torres', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (651, 14, NULL, NULL, '120', 'Zapopan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (652, 14, NULL, NULL, '121', 'Zapotiltic', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (653, 14, NULL, NULL, '122', 'Zapotitlán de Vadillo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (654, 14, NULL, NULL, '123', 'Zapotlán del Rey', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (655, 14, NULL, NULL, '124', 'Zapotlanejo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (656, 14, NULL, NULL, '125', 'San Ignacio Cerro Gordo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (657, 15, NULL, NULL, '001', 'Acambay', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (658, 15, NULL, NULL, '002', 'Acolman', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (659, 15, NULL, NULL, '003', 'Aculco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (660, 15, NULL, NULL, '004', 'Almoloya de Alquisiras', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (661, 15, NULL, NULL, '005', 'Almoloya de Juárez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (662, 15, NULL, NULL, '006', 'Almoloya del Río', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (663, 15, NULL, NULL, '007', 'Amanalco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (664, 15, NULL, NULL, '008', 'Amatepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (665, 15, NULL, NULL, '009', 'Amecameca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (666, 15, NULL, NULL, '010', 'Apaxco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (667, 15, NULL, NULL, '011', 'Atenco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (668, 15, NULL, NULL, '012', 'Atizapán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (669, 15, NULL, NULL, '013', 'Atizapán de Zaragoza', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (670, 15, NULL, NULL, '014', 'Atlacomulco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (671, 15, NULL, NULL, '015', 'Atlautla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (672, 15, NULL, NULL, '016', 'Axapusco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (673, 15, NULL, NULL, '017', 'Ayapango', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (674, 15, NULL, NULL, '018', 'Calimaya', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (675, 15, NULL, NULL, '019', 'Capulhuac', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (676, 15, NULL, NULL, '020', 'Coacalco de Berriozábal', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (677, 15, NULL, NULL, '021', 'Coatepec Harinas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (678, 15, NULL, NULL, '022', 'Cocotitlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (679, 15, NULL, NULL, '023', 'Coyotepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (680, 15, NULL, NULL, '024', 'Cuautitlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (681, 15, NULL, NULL, '025', 'Chalco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (682, 15, NULL, NULL, '026', 'Chapa de Mota', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (683, 15, NULL, NULL, '027', 'Chapultepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (684, 15, NULL, NULL, '028', 'Chiautla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (685, 15, NULL, NULL, '029', 'Chicoloapan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (686, 15, NULL, NULL, '030', 'Chiconcuac', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (687, 15, NULL, NULL, '031', 'Chimalhuacán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (688, 15, NULL, NULL, '032', 'Donato Guerra', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (689, 15, NULL, NULL, '033', 'Ecatepec de Morelos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (690, 15, NULL, NULL, '034', 'Ecatzingo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (691, 15, NULL, NULL, '035', 'Huehuetoca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (692, 15, NULL, NULL, '036', 'Hueypoxtla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (693, 15, NULL, NULL, '037', 'Huixquilucan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (694, 15, NULL, NULL, '038', 'Isidro Fabela', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (695, 15, NULL, NULL, '039', 'Ixtapaluca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (696, 15, NULL, NULL, '040', 'Ixtapan de la Sal', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (697, 15, NULL, NULL, '041', 'Ixtapan del Oro', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (698, 15, NULL, NULL, '042', 'Ixtlahuaca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (699, 15, NULL, NULL, '043', 'Xalatlaco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (700, 15, NULL, NULL, '044', 'Jaltenco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (701, 15, NULL, NULL, '045', 'Jilotepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (702, 15, NULL, NULL, '046', 'Jilotzingo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (703, 15, NULL, NULL, '047', 'Jiquipilco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (704, 15, NULL, NULL, '048', 'Jocotitlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (705, 15, NULL, NULL, '049', 'Joquicingo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (706, 15, NULL, NULL, '050', 'Juchitepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (707, 15, NULL, NULL, '051', 'Lerma', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (708, 15, NULL, NULL, '052', 'Malinalco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (709, 15, NULL, NULL, '053', 'Melchor Ocampo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (710, 15, NULL, NULL, '054', 'Metepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (711, 15, NULL, NULL, '055', 'Mexicaltzingo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (712, 15, NULL, NULL, '056', 'Morelos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (713, 15, NULL, NULL, '057', 'Naucalpan de Juárez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (714, 15, NULL, NULL, '058', 'Nezahualcóyotl', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (715, 15, NULL, NULL, '059', 'Nextlalpan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (716, 15, NULL, NULL, '060', 'Nicolás Romero', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (717, 15, NULL, NULL, '061', 'Nopaltepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (718, 15, NULL, NULL, '062', 'Ocoyoacac', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (719, 15, NULL, NULL, '063', 'Ocuilan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (720, 15, NULL, NULL, '064', 'El Oro', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (721, 15, NULL, NULL, '065', 'Otumba', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (722, 15, NULL, NULL, '066', 'Otzoloapan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (723, 15, NULL, NULL, '067', 'Otzolotepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (724, 15, NULL, NULL, '068', 'Ozumba', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (725, 15, NULL, NULL, '069', 'Papalotla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (726, 15, NULL, NULL, '070', 'La Paz', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (727, 15, NULL, NULL, '071', 'Polotitlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (728, 15, NULL, NULL, '072', 'Rayón', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (729, 15, NULL, NULL, '073', 'San Antonio la Isla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (730, 15, NULL, NULL, '074', 'San Felipe del Progreso', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (731, 15, NULL, NULL, '075', 'San Martín de las Pirámides', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (732, 15, NULL, NULL, '076', 'San Mateo Atenco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (733, 15, NULL, NULL, '077', 'San Simón de Guerrero', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (734, 15, NULL, NULL, '078', 'Santo Tomás', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (735, 15, NULL, NULL, '079', 'Soyaniquilpan de Juárez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (736, 15, NULL, NULL, '080', 'Sultepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (737, 15, NULL, NULL, '081', 'Tecámac', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (738, 15, NULL, NULL, '082', 'Tejupilco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (739, 15, NULL, NULL, '083', 'Temamatla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (740, 15, NULL, NULL, '084', 'Temascalapa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (741, 15, NULL, NULL, '085', 'Temascalcingo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (742, 15, NULL, NULL, '086', 'Temascaltepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (743, 15, NULL, NULL, '087', 'Temoaya', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (744, 15, NULL, NULL, '088', 'Tenancingo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (745, 15, NULL, NULL, '089', 'Tenango del Aire', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (746, 15, NULL, NULL, '090', 'Tenango del Valle', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (747, 15, NULL, NULL, '091', 'Teoloyucan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (748, 15, NULL, NULL, '092', 'Teotihuacán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (749, 15, NULL, NULL, '093', 'Tepetlaoxtoc', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (750, 15, NULL, NULL, '094', 'Tepetlixpa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (751, 15, NULL, NULL, '095', 'Tepotzotlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (752, 15, NULL, NULL, '096', 'Tequixquiac', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (753, 15, NULL, NULL, '097', 'Texcaltitlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (754, 15, NULL, NULL, '098', 'Texcalyacac', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (755, 15, NULL, NULL, '099', 'Texcoco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (756, 15, NULL, NULL, '100', 'Tezoyuca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (757, 15, NULL, NULL, '101', 'Tianguistenco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (758, 15, NULL, NULL, '102', 'Timilpan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (759, 15, NULL, NULL, '103', 'Tlalmanalco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (760, 15, NULL, NULL, '104', 'Tlalnepantla de Baz', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (761, 15, NULL, NULL, '105', 'Tlatlaya', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (762, 15, NULL, NULL, '106', 'Toluca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (763, 15, NULL, NULL, '107', 'Tonatico', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (764, 15, NULL, NULL, '108', 'Tultepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (765, 15, NULL, NULL, '109', 'Tultitlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (766, 15, NULL, NULL, '110', 'Valle de Bravo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (767, 15, NULL, NULL, '111', 'Villa de Allende', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (768, 15, NULL, NULL, '112', 'Villa del Carbón', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (769, 15, NULL, NULL, '113', 'Villa Guerrero', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (770, 15, NULL, NULL, '114', 'Villa Victoria', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (771, 15, NULL, NULL, '115', 'Xonacatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (772, 15, NULL, NULL, '116', 'Zacazonapan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (773, 15, NULL, NULL, '117', 'Zacualpan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (774, 15, NULL, NULL, '118', 'Zinacantepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (775, 15, NULL, NULL, '119', 'Zumpahuacán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (776, 15, NULL, NULL, '120', 'Zumpango', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (777, 15, NULL, NULL, '121', 'Cuautitlán Izcalli', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (778, 15, NULL, NULL, '122', 'Valle de Chalco Solidaridad', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (779, 15, NULL, NULL, '123', 'Luvianos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (780, 15, NULL, NULL, '124', 'San José del Rincón', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (781, 15, NULL, NULL, '125', 'Tonanitla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (782, 16, NULL, NULL, '001', 'Acuitzio', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (783, 16, NULL, NULL, '002', 'Aguililla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (784, 16, NULL, NULL, '003', 'Álvaro Obregón', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (785, 16, NULL, NULL, '004', 'Angamacutiro', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (786, 16, NULL, NULL, '005', 'Angangueo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (787, 16, NULL, NULL, '006', 'Apatzingán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (788, 16, NULL, NULL, '007', 'Aporo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (789, 16, NULL, NULL, '008', 'Aquila', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (790, 16, NULL, NULL, '009', 'Ario', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (791, 16, NULL, NULL, '010', 'Arteaga', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (792, 16, NULL, NULL, '011', 'Briseñas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (793, 16, NULL, NULL, '012', 'Buenavista', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (794, 16, NULL, NULL, '013', 'Carácuaro', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (795, 16, NULL, NULL, '014', 'Coahuayana', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (796, 16, NULL, NULL, '015', 'Coalcomán de Vázquez Pallares', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (797, 16, NULL, NULL, '016', 'Coeneo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (798, 16, NULL, NULL, '017', 'Contepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (799, 16, NULL, NULL, '018', 'Copándaro', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (800, 16, NULL, NULL, '019', 'Cotija', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (801, 16, NULL, NULL, '020', 'Cuitzeo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (802, 16, NULL, NULL, '021', 'Charapan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (803, 16, NULL, NULL, '022', 'Charo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (804, 16, NULL, NULL, '023', 'Chavinda', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (805, 16, NULL, NULL, '024', 'Cherán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (806, 16, NULL, NULL, '025', 'Chilchota', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (807, 16, NULL, NULL, '026', 'Chinicuila', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (808, 16, NULL, NULL, '027', 'Chucándiro', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (809, 16, NULL, NULL, '028', 'Churintzio', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (810, 16, NULL, NULL, '029', 'Churumuco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (811, 16, NULL, NULL, '030', 'Ecuandureo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (812, 16, NULL, NULL, '031', 'Epitacio Huerta', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (813, 16, NULL, NULL, '032', 'Erongarícuaro', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (814, 16, NULL, NULL, '033', 'Gabriel Zamora', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (815, 16, NULL, NULL, '034', 'Hidalgo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (816, 16, NULL, NULL, '035', 'La Huacana', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (817, 16, NULL, NULL, '036', 'Huandacareo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (818, 16, NULL, NULL, '037', 'Huaniqueo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (819, 16, NULL, NULL, '038', 'Huetamo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (820, 16, NULL, NULL, '039', 'Huiramba', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (821, 16, NULL, NULL, '040', 'Indaparapeo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (822, 16, NULL, NULL, '041', 'Irimbo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (823, 16, NULL, NULL, '042', 'Ixtlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (824, 16, NULL, NULL, '043', 'Jacona', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (825, 16, NULL, NULL, '044', 'Jiménez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (826, 16, NULL, NULL, '045', 'Jiquilpan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (827, 16, NULL, NULL, '046', 'Juárez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (828, 16, NULL, NULL, '047', 'Jungapeo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (829, 16, NULL, NULL, '048', 'Lagunillas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (830, 16, NULL, NULL, '049', 'Madero', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (831, 16, NULL, NULL, '050', 'Maravatío', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (832, 16, NULL, NULL, '051', 'Marcos Castellanos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (833, 16, NULL, NULL, '052', 'Lázaro Cárdenas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (834, 16, NULL, NULL, '053', 'Morelia', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (835, 16, NULL, NULL, '054', 'Morelos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (836, 16, NULL, NULL, '055', 'Múgica', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (837, 16, NULL, NULL, '056', 'Nahuatzen', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (838, 16, NULL, NULL, '057', 'Nocupétaro', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (839, 16, NULL, NULL, '058', 'Nuevo Parangaricutiro', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (840, 16, NULL, NULL, '059', 'Nuevo Urecho', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (841, 16, NULL, NULL, '060', 'Numarán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (842, 16, NULL, NULL, '061', 'Ocampo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (843, 16, NULL, NULL, '062', 'Pajacuarán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (844, 16, NULL, NULL, '063', 'Panindícuaro', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (845, 16, NULL, NULL, '064', 'Parácuaro', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (846, 16, NULL, NULL, '065', 'Paracho', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (847, 16, NULL, NULL, '066', 'Pátzcuaro', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (848, 16, NULL, NULL, '067', 'Penjamillo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (849, 16, NULL, NULL, '068', 'Peribán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (850, 16, NULL, NULL, '069', 'La Piedad', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (851, 16, NULL, NULL, '070', 'Purépero', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (852, 16, NULL, NULL, '071', 'Puruándiro', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (853, 16, NULL, NULL, '072', 'Queréndaro', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (854, 16, NULL, NULL, '073', 'Quiroga', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (855, 16, NULL, NULL, '074', 'Cojumatlán de Régules', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (856, 16, NULL, NULL, '075', 'Los Reyes', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (857, 16, NULL, NULL, '076', 'Sahuayo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (858, 16, NULL, NULL, '077', 'San Lucas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (859, 16, NULL, NULL, '078', 'Santa Ana Maya', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (860, 16, NULL, NULL, '079', 'Salvador Escalante', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (861, 16, NULL, NULL, '080', 'Senguio', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (862, 16, NULL, NULL, '081', 'Susupuato', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (863, 16, NULL, NULL, '082', 'Tacámbaro', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (864, 16, NULL, NULL, '083', 'Tancítaro', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (865, 16, NULL, NULL, '084', 'Tangamandapio', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (866, 16, NULL, NULL, '085', 'Tangancícuaro', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (867, 16, NULL, NULL, '086', 'Tanhuato', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (868, 16, NULL, NULL, '087', 'Taretan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (869, 16, NULL, NULL, '088', 'Tarímbaro', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (870, 16, NULL, NULL, '089', 'Tepalcatepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (871, 16, NULL, NULL, '090', 'Tingambato', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (872, 16, NULL, NULL, '091', 'Tingüindín', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (873, 16, NULL, NULL, '092', 'Tiquicheo de Nicolás Romero', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (874, 16, NULL, NULL, '093', 'Tlalpujahua', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (875, 16, NULL, NULL, '094', 'Tlazazalca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (876, 16, NULL, NULL, '095', 'Tocumbo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (877, 16, NULL, NULL, '096', 'Tumbiscatío', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (878, 16, NULL, NULL, '097', 'Turicato', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (879, 16, NULL, NULL, '098', 'Tuxpan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (880, 16, NULL, NULL, '099', 'Tuzantla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (881, 16, NULL, NULL, '100', 'Tzintzuntzan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (882, 16, NULL, NULL, '101', 'Tzitzio', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (883, 16, NULL, NULL, '102', 'Uruapan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (884, 16, NULL, NULL, '103', 'Venustiano Carranza', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (885, 16, NULL, NULL, '104', 'Villamar', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (886, 16, NULL, NULL, '105', 'Vista Hermosa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (887, 16, NULL, NULL, '106', 'Yurécuaro', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (888, 16, NULL, NULL, '107', 'Zacapu', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (889, 16, NULL, NULL, '108', 'Zamora', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (890, 16, NULL, NULL, '109', 'Zináparo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (891, 16, NULL, NULL, '110', 'Zinapécuaro', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (892, 16, NULL, NULL, '111', 'Ziracuaretiro', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (893, 16, NULL, NULL, '112', 'Zitácuaro', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (894, 16, NULL, NULL, '113', 'José Sixto Verduzco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (895, 17, NULL, NULL, '001', 'Amacuzac', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (896, 17, NULL, NULL, '002', 'Atlatlahucan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (897, 17, NULL, NULL, '003', 'Axochiapan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (898, 17, NULL, NULL, '004', 'Ayala', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (899, 17, NULL, NULL, '005', 'Coatlán del Río', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (900, 17, NULL, NULL, '006', 'Cuautla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (901, 17, NULL, NULL, '007', 'Cuernavaca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (902, 17, NULL, NULL, '008', 'Emiliano Zapata', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (903, 17, NULL, NULL, '009', 'Huitzilac', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (904, 17, NULL, NULL, '010', 'Jantetelco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (905, 17, NULL, NULL, '011', 'Jiutepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (906, 17, NULL, NULL, '012', 'Jojutla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (907, 17, NULL, NULL, '013', 'Jonacatepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (908, 17, NULL, NULL, '014', 'Mazatepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (909, 17, NULL, NULL, '015', 'Miacatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (910, 17, NULL, NULL, '016', 'Ocuituco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (911, 17, NULL, NULL, '017', 'Puente de Ixtla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (912, 17, NULL, NULL, '018', 'Temixco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (913, 17, NULL, NULL, '019', 'Tepalcingo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (914, 17, NULL, NULL, '020', 'Tepoztlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (915, 17, NULL, NULL, '021', 'Tetecala', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (916, 17, NULL, NULL, '022', 'Tetela del Volcán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (917, 17, NULL, NULL, '023', 'Tlalnepantla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (918, 17, NULL, NULL, '024', 'Tlaltizapán de Zapata', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (919, 17, NULL, NULL, '025', 'Tlaquiltenango', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (920, 17, NULL, NULL, '026', 'Tlayacapan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (921, 17, NULL, NULL, '027', 'Totolapan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (922, 17, NULL, NULL, '028', 'Xochitepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (923, 17, NULL, NULL, '029', 'Yautepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (924, 17, NULL, NULL, '030', 'Yecapixtla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (925, 17, NULL, NULL, '031', 'Zacatepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (926, 17, NULL, NULL, '032', 'Zacualpan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (927, 17, NULL, NULL, '033', 'Temoac', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (928, 18, NULL, NULL, '001', 'Acaponeta', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (929, 18, NULL, NULL, '002', 'Ahuacatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (930, 18, NULL, NULL, '003', 'Amatlán de Cañas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (931, 18, NULL, NULL, '004', 'Compostela', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (932, 18, NULL, NULL, '005', 'Huajicori', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (933, 18, NULL, NULL, '006', 'Ixtlán del Río', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (934, 18, NULL, NULL, '007', 'Jala', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (935, 18, NULL, NULL, '008', 'Xalisco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (936, 18, NULL, NULL, '009', 'Del Nayar', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (937, 18, NULL, NULL, '010', 'Rosamorada', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (938, 18, NULL, NULL, '011', 'Ruíz', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (939, 18, NULL, NULL, '012', 'San Blas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (940, 18, NULL, NULL, '013', 'San Pedro Lagunillas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (941, 18, NULL, NULL, '014', 'Santa María del Oro', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (942, 18, NULL, NULL, '015', 'Santiago Ixcuintla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (943, 18, NULL, NULL, '016', 'Tecuala', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (944, 18, NULL, NULL, '017', 'Tepic', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (945, 18, NULL, NULL, '018', 'Tuxpan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (946, 18, NULL, NULL, '019', 'La Yesca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (947, 18, NULL, NULL, '020', 'Bahía de Banderas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (948, 19, NULL, NULL, '001', 'Abasolo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (949, 19, NULL, NULL, '002', 'Agualeguas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (950, 19, NULL, NULL, '003', 'Los Aldamas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (951, 19, NULL, NULL, '004', 'Allende', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (952, 19, NULL, NULL, '005', 'Anáhuac', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (953, 19, NULL, NULL, '006', 'Apodaca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (954, 19, NULL, NULL, '007', 'Aramberri', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (955, 19, NULL, NULL, '008', 'Bustamante', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (956, 19, NULL, NULL, '009', 'Cadereyta Jiménez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (957, 19, NULL, NULL, '010', 'El Carmen', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (958, 19, NULL, NULL, '011', 'Cerralvo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (959, 19, NULL, NULL, '012', 'Ciénega de Flores', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (960, 19, NULL, NULL, '013', 'China', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (961, 19, NULL, NULL, '014', 'Doctor Arroyo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (962, 19, NULL, NULL, '015', 'Doctor Coss', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (963, 19, NULL, NULL, '016', 'Doctor González', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (964, 19, NULL, NULL, '017', 'Galeana', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (965, 19, NULL, NULL, '018', 'García', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (966, 19, NULL, NULL, '019', 'San Pedro Garza García', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (967, 19, NULL, NULL, '020', 'General Bravo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (968, 19, NULL, NULL, '021', 'General Escobedo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (969, 19, NULL, NULL, '022', 'General Terán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (970, 19, NULL, NULL, '023', 'General Treviño', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (971, 19, NULL, NULL, '024', 'General Zaragoza', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (972, 19, NULL, NULL, '025', 'General Zuazua', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (973, 19, NULL, NULL, '026', 'Guadalupe', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (974, 19, NULL, NULL, '027', 'Los Herreras', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (975, 19, NULL, NULL, '028', 'Higueras', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (976, 19, NULL, NULL, '029', 'Hualahuises', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (977, 19, NULL, NULL, '030', 'Iturbide', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (978, 19, NULL, NULL, '031', 'Juárez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (979, 19, NULL, NULL, '032', 'Lampazos de Naranjo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (980, 19, NULL, NULL, '033', 'Linares', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (981, 19, NULL, NULL, '034', 'Marín', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (982, 19, NULL, NULL, '035', 'Melchor Ocampo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (983, 19, NULL, NULL, '036', 'Mier y Noriega', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (984, 19, NULL, NULL, '037', 'Mina', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (985, 19, NULL, NULL, '038', 'Montemorelos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (986, 19, NULL, NULL, '039', 'Monterrey', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (987, 19, NULL, NULL, '040', 'Parás', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (988, 19, NULL, NULL, '041', 'Pesquería', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (989, 19, NULL, NULL, '042', 'Los Ramones', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (990, 19, NULL, NULL, '043', 'Rayones', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (991, 19, NULL, NULL, '044', 'Sabinas Hidalgo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (992, 19, NULL, NULL, '045', 'Salinas Victoria', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (993, 19, NULL, NULL, '046', 'San Nicolás de los Garza', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (994, 19, NULL, NULL, '047', 'Hidalgo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (995, 19, NULL, NULL, '048', 'Santa Catarina', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (996, 19, NULL, NULL, '049', 'Santiago', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (997, 19, NULL, NULL, '050', 'Vallecillo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (998, 19, NULL, NULL, '051', 'Villaldama', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (999, 20, NULL, NULL, '001', 'Abejones', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1000, 20, NULL, NULL, '002', 'Acatlán de Pérez Figueroa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1001, 20, NULL, NULL, '003', 'Asunción Cacalotepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1002, 20, NULL, NULL, '004', 'Asunción Cuyotepeji', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1003, 20, NULL, NULL, '005', 'Asunción Ixtaltepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1004, 20, NULL, NULL, '006', 'Asunción Nochixtlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1005, 20, NULL, NULL, '007', 'Asunción Ocotlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1006, 20, NULL, NULL, '008', 'Asunción Tlacolulita', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1007, 20, NULL, NULL, '009', 'Ayotzintepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1008, 20, NULL, NULL, '010', 'El Barrio de la Soledad', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1009, 20, NULL, NULL, '011', 'Calihualá', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1010, 20, NULL, NULL, '012', 'Candelaria Loxicha', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1011, 20, NULL, NULL, '013', 'Ciénega de Zimatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1012, 20, NULL, NULL, '014', 'Ciudad Ixtepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1013, 20, NULL, NULL, '015', 'Coatecas Altas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1014, 20, NULL, NULL, '016', 'Coicoyán de las Flores', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1015, 20, NULL, NULL, '017', 'La Compañía', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1016, 20, NULL, NULL, '018', 'Concepción Buenavista', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1017, 20, NULL, NULL, '019', 'Concepción Pápalo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1018, 20, NULL, NULL, '020', 'Constancia del Rosario', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1019, 20, NULL, NULL, '021', 'Cosolapa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1020, 20, NULL, NULL, '022', 'Cosoltepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1021, 20, NULL, NULL, '023', 'Cuilápam de Guerrero', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1022, 20, NULL, NULL, '024', 'Cuyamecalco Villa de Zaragoza', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1023, 20, NULL, NULL, '025', 'Chahuites', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1024, 20, NULL, NULL, '026', 'Chalcatongo de Hidalgo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1025, 20, NULL, NULL, '027', 'Chiquihuitlán de Benito Juárez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1026, 20, NULL, NULL, '028', 'Heroica Ciudad de Ejutla de Crespo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1027, 20, NULL, NULL, '029', 'Eloxochitlán de Flores Magón', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1028, 20, NULL, NULL, '030', 'El Espinal', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1029, 20, NULL, NULL, '031', 'Tamazulápam del Espíritu Santo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1030, 20, NULL, NULL, '032', 'Fresnillo de Trujano', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1031, 20, NULL, NULL, '033', 'Guadalupe Etla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1032, 20, NULL, NULL, '034', 'Guadalupe de Ramírez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1033, 20, NULL, NULL, '035', 'Guelatao de Juárez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1034, 20, NULL, NULL, '036', 'Guevea de Humboldt', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1035, 20, NULL, NULL, '037', 'Mesones Hidalgo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1036, 20, NULL, NULL, '038', 'Villa Hidalgo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1037, 20, NULL, NULL, '039', 'Heroica Ciudad de Huajuapan de León', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1038, 20, NULL, NULL, '040', 'Huautepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1039, 20, NULL, NULL, '041', 'Huautla de Jiménez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1040, 20, NULL, NULL, '042', 'Ixtlán de Juárez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1041, 20, NULL, NULL, '043', 'Heroica Ciudad de Juchitán de Zaragoza', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1042, 20, NULL, NULL, '044', 'Loma Bonita', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1043, 20, NULL, NULL, '045', 'Magdalena Apasco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1044, 20, NULL, NULL, '046', 'Magdalena Jaltepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1045, 20, NULL, NULL, '047', 'Santa Magdalena Jicotlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1046, 20, NULL, NULL, '048', 'Magdalena Mixtepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1047, 20, NULL, NULL, '049', 'Magdalena Ocotlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1048, 20, NULL, NULL, '050', 'Magdalena Peñasco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1049, 20, NULL, NULL, '051', 'Magdalena Teitipac', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1050, 20, NULL, NULL, '052', 'Magdalena Tequisistlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1051, 20, NULL, NULL, '053', 'Magdalena Tlacotepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1052, 20, NULL, NULL, '054', 'Magdalena Zahuatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1053, 20, NULL, NULL, '055', 'Mariscala de Juárez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1054, 20, NULL, NULL, '056', 'Mártires de Tacubaya', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1055, 20, NULL, NULL, '057', 'Matías Romero Avendaño', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1056, 20, NULL, NULL, '058', 'Mazatlán Villa de Flores', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1057, 20, NULL, NULL, '059', 'Miahuatlán de Porfirio Díaz', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1058, 20, NULL, NULL, '060', 'Mixistlán de la Reforma', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1059, 20, NULL, NULL, '061', 'Monjas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1060, 20, NULL, NULL, '062', 'Natividad', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1061, 20, NULL, NULL, '063', 'Nazareno Etla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1062, 20, NULL, NULL, '064', 'Nejapa de Madero', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1063, 20, NULL, NULL, '065', 'Ixpantepec Nieves', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1064, 20, NULL, NULL, '066', 'Santiago Niltepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1065, 20, NULL, NULL, '067', 'Oaxaca de Juárez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1066, 20, NULL, NULL, '068', 'Ocotlán de Morelos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1067, 20, NULL, NULL, '069', 'La Pe', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1068, 20, NULL, NULL, '070', 'Pinotepa de Don Luis', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1069, 20, NULL, NULL, '071', 'Pluma Hidalgo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1070, 20, NULL, NULL, '072', 'San José del Progreso', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1071, 20, NULL, NULL, '073', 'Putla Villa de Guerrero', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1072, 20, NULL, NULL, '074', 'Santa Catarina Quioquitani', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1073, 20, NULL, NULL, '075', 'Reforma de Pineda', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1074, 20, NULL, NULL, '076', 'La Reforma', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1075, 20, NULL, NULL, '077', 'Reyes Etla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1076, 20, NULL, NULL, '078', 'Rojas de Cuauhtémoc', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1077, 20, NULL, NULL, '079', 'Salina Cruz', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1078, 20, NULL, NULL, '080', 'San Agustín Amatengo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1079, 20, NULL, NULL, '081', 'San Agustín Atenango', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1080, 20, NULL, NULL, '082', 'San Agustín Chayuco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1081, 20, NULL, NULL, '083', 'San Agustín de las Juntas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1082, 20, NULL, NULL, '084', 'San Agustín Etla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1083, 20, NULL, NULL, '085', 'San Agustín Loxicha', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1084, 20, NULL, NULL, '086', 'San Agustín Tlacotepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1085, 20, NULL, NULL, '087', 'San Agustín Yatareni', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1086, 20, NULL, NULL, '088', 'San Andrés Cabecera Nueva', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1087, 20, NULL, NULL, '089', 'San Andrés Dinicuiti', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1088, 20, NULL, NULL, '090', 'San Andrés Huaxpaltepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1089, 20, NULL, NULL, '091', 'San Andrés Huayápam', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1090, 20, NULL, NULL, '092', 'San Andrés Ixtlahuaca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1091, 20, NULL, NULL, '093', 'San Andrés Lagunas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1092, 20, NULL, NULL, '094', 'San Andrés Nuxiño', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1093, 20, NULL, NULL, '095', 'San Andrés Paxtlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1094, 20, NULL, NULL, '096', 'San Andrés Sinaxtla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1095, 20, NULL, NULL, '097', 'San Andrés Solaga', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1096, 20, NULL, NULL, '098', 'San Andrés Teotilálpam', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1097, 20, NULL, NULL, '099', 'San Andrés Tepetlapa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1098, 20, NULL, NULL, '100', 'San Andrés Yaá', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1099, 20, NULL, NULL, '101', 'San Andrés Zabache', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1100, 20, NULL, NULL, '102', 'San Andrés Zautla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1101, 20, NULL, NULL, '103', 'San Antonino Castillo Velasco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1102, 20, NULL, NULL, '104', 'San Antonino el Alto', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1103, 20, NULL, NULL, '105', 'San Antonino Monte Verde', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1104, 20, NULL, NULL, '106', 'San Antonio Acutla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1105, 20, NULL, NULL, '107', 'San Antonio de la Cal', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1106, 20, NULL, NULL, '108', 'San Antonio Huitepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1107, 20, NULL, NULL, '109', 'San Antonio Nanahuatípam', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1108, 20, NULL, NULL, '110', 'San Antonio Sinicahua', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1109, 20, NULL, NULL, '111', 'San Antonio Tepetlapa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1110, 20, NULL, NULL, '112', 'San Baltazar Chichicápam', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1111, 20, NULL, NULL, '113', 'San Baltazar Loxicha', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1112, 20, NULL, NULL, '114', 'San Baltazar Yatzachi el Bajo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1113, 20, NULL, NULL, '115', 'San Bartolo Coyotepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1114, 20, NULL, NULL, '116', 'San Bartolomé Ayautla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1115, 20, NULL, NULL, '117', 'San Bartolomé Loxicha', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1116, 20, NULL, NULL, '118', 'San Bartolomé Quialana', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1117, 20, NULL, NULL, '119', 'San Bartolomé Yucuañe', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1118, 20, NULL, NULL, '120', 'San Bartolomé Zoogocho', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1119, 20, NULL, NULL, '121', 'San Bartolo Soyaltepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1120, 20, NULL, NULL, '122', 'San Bartolo Yautepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1121, 20, NULL, NULL, '123', 'San Bernardo Mixtepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1122, 20, NULL, NULL, '124', 'San Blas Atempa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1123, 20, NULL, NULL, '125', 'San Carlos Yautepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1124, 20, NULL, NULL, '126', 'San Cristóbal Amatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1125, 20, NULL, NULL, '127', 'San Cristóbal Amoltepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1126, 20, NULL, NULL, '128', 'San Cristóbal Lachirioag', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1127, 20, NULL, NULL, '129', 'San Cristóbal Suchixtlahuaca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1128, 20, NULL, NULL, '130', 'San Dionisio del Mar', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1129, 20, NULL, NULL, '131', 'San Dionisio Ocotepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1130, 20, NULL, NULL, '132', 'San Dionisio Ocotlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1131, 20, NULL, NULL, '133', 'San Esteban Atatlahuca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1132, 20, NULL, NULL, '134', 'San Felipe Jalapa de Díaz', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1133, 20, NULL, NULL, '135', 'San Felipe Tejalápam', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1134, 20, NULL, NULL, '136', 'San Felipe Usila', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1135, 20, NULL, NULL, '137', 'San Francisco Cahuacuá', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1136, 20, NULL, NULL, '138', 'San Francisco Cajonos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1137, 20, NULL, NULL, '139', 'San Francisco Chapulapa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1138, 20, NULL, NULL, '140', 'San Francisco Chindúa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1139, 20, NULL, NULL, '141', 'San Francisco del Mar', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1140, 20, NULL, NULL, '142', 'San Francisco Huehuetlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1141, 20, NULL, NULL, '143', 'San Francisco Ixhuatán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1142, 20, NULL, NULL, '144', 'San Francisco Jaltepetongo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1143, 20, NULL, NULL, '145', 'San Francisco Lachigoló', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1144, 20, NULL, NULL, '146', 'San Francisco Logueche', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1145, 20, NULL, NULL, '147', 'San Francisco Nuxaño', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1146, 20, NULL, NULL, '148', 'San Francisco Ozolotepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1147, 20, NULL, NULL, '149', 'San Francisco Sola', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1148, 20, NULL, NULL, '150', 'San Francisco Telixtlahuaca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1149, 20, NULL, NULL, '151', 'San Francisco Teopan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1150, 20, NULL, NULL, '152', 'San Francisco Tlapancingo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1151, 20, NULL, NULL, '153', 'San Gabriel Mixtepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1152, 20, NULL, NULL, '154', 'San Ildefonso Amatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1153, 20, NULL, NULL, '155', 'San Ildefonso Sola', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1154, 20, NULL, NULL, '156', 'San Ildefonso Villa Alta', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1155, 20, NULL, NULL, '157', 'San Jacinto Amilpas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1156, 20, NULL, NULL, '158', 'San Jacinto Tlacotepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1157, 20, NULL, NULL, '159', 'San Jerónimo Coatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1158, 20, NULL, NULL, '160', 'San Jerónimo Silacayoapilla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1159, 20, NULL, NULL, '161', 'San Jerónimo Sosola', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1160, 20, NULL, NULL, '162', 'San Jerónimo Taviche', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1161, 20, NULL, NULL, '163', 'San Jerónimo Tecóatl', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1162, 20, NULL, NULL, '164', 'San Jorge Nuchita', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1163, 20, NULL, NULL, '165', 'San José Ayuquila', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1164, 20, NULL, NULL, '166', 'San José Chiltepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1165, 20, NULL, NULL, '167', 'San José del Peñasco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1166, 20, NULL, NULL, '168', 'San José Estancia Grande', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1167, 20, NULL, NULL, '169', 'San José Independencia', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1168, 20, NULL, NULL, '170', 'San José Lachiguiri', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1169, 20, NULL, NULL, '171', 'San José Tenango', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1170, 20, NULL, NULL, '172', 'San Juan Achiutla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1171, 20, NULL, NULL, '173', 'San Juan Atepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1172, 20, NULL, NULL, '174', 'Ánimas Trujano', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1173, 20, NULL, NULL, '175', 'San Juan Bautista Atatlahuca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1174, 20, NULL, NULL, '176', 'San Juan Bautista Coixtlahuaca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1175, 20, NULL, NULL, '177', 'San Juan Bautista Cuicatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1176, 20, NULL, NULL, '178', 'San Juan Bautista Guelache', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1177, 20, NULL, NULL, '179', 'San Juan Bautista Jayacatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1178, 20, NULL, NULL, '180', 'San Juan Bautista Lo de Soto', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1179, 20, NULL, NULL, '181', 'San Juan Bautista Suchitepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1180, 20, NULL, NULL, '182', 'San Juan Bautista Tlacoatzintepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1181, 20, NULL, NULL, '183', 'San Juan Bautista Tlachichilco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1182, 20, NULL, NULL, '184', 'San Juan Bautista Tuxtepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1183, 20, NULL, NULL, '185', 'San Juan Cacahuatepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1184, 20, NULL, NULL, '186', 'San Juan Cieneguilla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1185, 20, NULL, NULL, '187', 'San Juan Coatzóspam', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1186, 20, NULL, NULL, '188', 'San Juan Colorado', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1187, 20, NULL, NULL, '189', 'San Juan Comaltepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1188, 20, NULL, NULL, '190', 'San Juan Cotzocón', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1189, 20, NULL, NULL, '191', 'San Juan Chicomezúchil', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1190, 20, NULL, NULL, '192', 'San Juan Chilateca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1191, 20, NULL, NULL, '193', 'San Juan del Estado', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1192, 20, NULL, NULL, '194', 'San Juan del Río', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1193, 20, NULL, NULL, '195', 'San Juan Diuxi', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1194, 20, NULL, NULL, '196', 'San Juan Evangelista Analco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1195, 20, NULL, NULL, '197', 'San Juan Guelavía', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1196, 20, NULL, NULL, '198', 'San Juan Guichicovi', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1197, 20, NULL, NULL, '199', 'San Juan Ihualtepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1198, 20, NULL, NULL, '200', 'San Juan Juquila Mixes', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1199, 20, NULL, NULL, '201', 'San Juan Juquila Vijanos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1200, 20, NULL, NULL, '202', 'San Juan Lachao', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1201, 20, NULL, NULL, '203', 'San Juan Lachigalla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1202, 20, NULL, NULL, '204', 'San Juan Lajarcia', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1203, 20, NULL, NULL, '205', 'San Juan Lalana', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1204, 20, NULL, NULL, '206', 'San Juan de los Cués', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1205, 20, NULL, NULL, '207', 'San Juan Mazatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1206, 20, NULL, NULL, '208', 'San Juan Mixtepec -Dto. 08 -', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1207, 20, NULL, NULL, '209', 'San Juan Mixtepec -Dto. 26 -', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1208, 20, NULL, NULL, '210', 'San Juan Ñumí', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1209, 20, NULL, NULL, '211', 'San Juan Ozolotepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1210, 20, NULL, NULL, '212', 'San Juan Petlapa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1211, 20, NULL, NULL, '213', 'San Juan Quiahije', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1212, 20, NULL, NULL, '214', 'San Juan Quiotepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1213, 20, NULL, NULL, '215', 'San Juan Sayultepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1214, 20, NULL, NULL, '216', 'San Juan Tabaá', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1215, 20, NULL, NULL, '217', 'San Juan Tamazola', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1216, 20, NULL, NULL, '218', 'San Juan Teita', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1217, 20, NULL, NULL, '219', 'San Juan Teitipac', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1218, 20, NULL, NULL, '220', 'San Juan Tepeuxila', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1219, 20, NULL, NULL, '221', 'San Juan Teposcolula', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1220, 20, NULL, NULL, '222', 'San Juan Yaeé', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1221, 20, NULL, NULL, '223', 'San Juan Yatzona', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1222, 20, NULL, NULL, '224', 'San Juan Yucuita', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1223, 20, NULL, NULL, '225', 'San Lorenzo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1224, 20, NULL, NULL, '226', 'San Lorenzo Albarradas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1225, 20, NULL, NULL, '227', 'San Lorenzo Cacaotepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1226, 20, NULL, NULL, '228', 'San Lorenzo Cuaunecuiltitla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1227, 20, NULL, NULL, '229', 'San Lorenzo Texmelúcan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1228, 20, NULL, NULL, '230', 'San Lorenzo Victoria', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1229, 20, NULL, NULL, '231', 'San Lucas Camotlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1230, 20, NULL, NULL, '232', 'San Lucas Ojitlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1231, 20, NULL, NULL, '233', 'San Lucas Quiaviní', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1232, 20, NULL, NULL, '234', 'San Lucas Zoquiápam', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1233, 20, NULL, NULL, '235', 'San Luis Amatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1234, 20, NULL, NULL, '236', 'San Marcial Ozolotepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1235, 20, NULL, NULL, '237', 'San Marcos Arteaga', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1236, 20, NULL, NULL, '238', 'San Martín de los Cansecos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1237, 20, NULL, NULL, '239', 'San Martín Huamelúlpam', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1238, 20, NULL, NULL, '240', 'San Martín Itunyoso', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1239, 20, NULL, NULL, '241', 'San Martín Lachilá', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1240, 20, NULL, NULL, '242', 'San Martín Peras', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1241, 20, NULL, NULL, '243', 'San Martín Tilcajete', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1242, 20, NULL, NULL, '244', 'San Martín Toxpalan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1243, 20, NULL, NULL, '245', 'San Martín Zacatepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1244, 20, NULL, NULL, '246', 'San Mateo Cajonos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1245, 20, NULL, NULL, '247', 'Capulálpam de Méndez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1246, 20, NULL, NULL, '248', 'San Mateo del Mar', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1247, 20, NULL, NULL, '249', 'San Mateo Yoloxochitlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1248, 20, NULL, NULL, '250', 'San Mateo Etlatongo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1249, 20, NULL, NULL, '251', 'San Mateo Nejápam', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1250, 20, NULL, NULL, '252', 'San Mateo Peñasco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1251, 20, NULL, NULL, '253', 'San Mateo Piñas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1252, 20, NULL, NULL, '254', 'San Mateo Río Hondo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1253, 20, NULL, NULL, '255', 'San Mateo Sindihui', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1254, 20, NULL, NULL, '256', 'San Mateo Tlapiltepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1255, 20, NULL, NULL, '257', 'San Melchor Betaza', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1256, 20, NULL, NULL, '258', 'San Miguel Achiutla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1257, 20, NULL, NULL, '259', 'San Miguel Ahuehuetitlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1258, 20, NULL, NULL, '260', 'San Miguel Aloápam', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1259, 20, NULL, NULL, '261', 'San Miguel Amatitlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1260, 20, NULL, NULL, '262', 'San Miguel Amatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1261, 20, NULL, NULL, '263', 'San Miguel Coatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1262, 20, NULL, NULL, '264', 'San Miguel Chicahua', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1263, 20, NULL, NULL, '265', 'San Miguel Chimalapa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1264, 20, NULL, NULL, '266', 'San Miguel del Puerto', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1265, 20, NULL, NULL, '267', 'San Miguel del Río', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1266, 20, NULL, NULL, '268', 'San Miguel Ejutla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1267, 20, NULL, NULL, '269', 'San Miguel el Grande', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1268, 20, NULL, NULL, '270', 'San Miguel Huautla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1269, 20, NULL, NULL, '271', 'San Miguel Mixtepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1270, 20, NULL, NULL, '272', 'San Miguel Panixtlahuaca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1271, 20, NULL, NULL, '273', 'San Miguel Peras', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1272, 20, NULL, NULL, '274', 'San Miguel Piedras', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1273, 20, NULL, NULL, '275', 'San Miguel Quetzaltepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1274, 20, NULL, NULL, '276', 'San Miguel Santa Flor', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1275, 20, NULL, NULL, '277', 'Villa Sola de Vega', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1276, 20, NULL, NULL, '278', 'San Miguel Soyaltepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1277, 20, NULL, NULL, '279', 'San Miguel Suchixtepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1278, 20, NULL, NULL, '280', 'Villa Talea de Castro', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1279, 20, NULL, NULL, '281', 'San Miguel Tecomatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1280, 20, NULL, NULL, '282', 'San Miguel Tenango', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1281, 20, NULL, NULL, '283', 'San Miguel Tequixtepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1282, 20, NULL, NULL, '284', 'San Miguel Tilquiápam', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1283, 20, NULL, NULL, '285', 'San Miguel Tlacamama', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1284, 20, NULL, NULL, '286', 'San Miguel Tlacotepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1285, 20, NULL, NULL, '287', 'San Miguel Tulancingo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1286, 20, NULL, NULL, '288', 'San Miguel Yotao', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1287, 20, NULL, NULL, '289', 'San Nicolás', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1288, 20, NULL, NULL, '290', 'San Nicolás Hidalgo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1289, 20, NULL, NULL, '291', 'San Pablo Coatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1290, 20, NULL, NULL, '292', 'San Pablo Cuatro Venados', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1291, 20, NULL, NULL, '293', 'San Pablo Etla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1292, 20, NULL, NULL, '294', 'San Pablo Huitzo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1293, 20, NULL, NULL, '295', 'San Pablo Huixtepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1294, 20, NULL, NULL, '296', 'San Pablo Macuiltianguis', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1295, 20, NULL, NULL, '297', 'San Pablo Tijaltepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1296, 20, NULL, NULL, '298', 'San Pablo Villa de Mitla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1297, 20, NULL, NULL, '299', 'San Pablo Yaganiza', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1298, 20, NULL, NULL, '300', 'San Pedro Amuzgos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1299, 20, NULL, NULL, '301', 'San Pedro Apóstol', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1300, 20, NULL, NULL, '302', 'San Pedro Atoyac', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1301, 20, NULL, NULL, '303', 'San Pedro Cajonos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1302, 20, NULL, NULL, '304', 'San Pedro Coxcaltepec Cántaros', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1303, 20, NULL, NULL, '305', 'San Pedro Comitancillo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1304, 20, NULL, NULL, '306', 'San Pedro el Alto', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1305, 20, NULL, NULL, '307', 'San Pedro Huamelula', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1306, 20, NULL, NULL, '308', 'San Pedro Huilotepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1307, 20, NULL, NULL, '309', 'San Pedro Ixcatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1308, 20, NULL, NULL, '310', 'San Pedro Ixtlahuaca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1309, 20, NULL, NULL, '311', 'San Pedro Jaltepetongo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1310, 20, NULL, NULL, '312', 'San Pedro Jicayán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1311, 20, NULL, NULL, '313', 'San Pedro Jocotipac', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1312, 20, NULL, NULL, '314', 'San Pedro Juchatengo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1313, 20, NULL, NULL, '315', 'San Pedro Mártir', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1314, 20, NULL, NULL, '316', 'San Pedro Mártir Quiechapa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1315, 20, NULL, NULL, '317', 'San Pedro Mártir Yucuxaco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1316, 20, NULL, NULL, '318', 'San Pedro Mixtepec -Dto. 22 -', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1317, 20, NULL, NULL, '319', 'San Pedro Mixtepec -Dto. 26 -', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1318, 20, NULL, NULL, '320', 'San Pedro Molinos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1319, 20, NULL, NULL, '321', 'San Pedro Nopala', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1320, 20, NULL, NULL, '322', 'San Pedro Ocopetatillo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1321, 20, NULL, NULL, '323', 'San Pedro Ocotepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1322, 20, NULL, NULL, '324', 'San Pedro Pochutla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1323, 20, NULL, NULL, '325', 'San Pedro Quiatoni', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1324, 20, NULL, NULL, '326', 'San Pedro Sochiápam', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1325, 20, NULL, NULL, '327', 'San Pedro Tapanatepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1326, 20, NULL, NULL, '328', 'San Pedro Taviche', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1327, 20, NULL, NULL, '329', 'San Pedro Teozacoalco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1328, 20, NULL, NULL, '330', 'San Pedro Teutila', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1329, 20, NULL, NULL, '331', 'San Pedro Tidaá', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1330, 20, NULL, NULL, '332', 'San Pedro Topiltepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1331, 20, NULL, NULL, '333', 'San Pedro Totolápam', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1332, 20, NULL, NULL, '334', 'Villa de Tututepec de Melchor Ocampo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1333, 20, NULL, NULL, '335', 'San Pedro Yaneri', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1334, 20, NULL, NULL, '336', 'San Pedro Yólox', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1335, 20, NULL, NULL, '337', 'San Pedro y San Pablo Ayutla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1336, 20, NULL, NULL, '338', 'Villa de Etla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1337, 20, NULL, NULL, '339', 'San Pedro y San Pablo Teposcolula', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1338, 20, NULL, NULL, '340', 'San Pedro y San Pablo Tequixtepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1339, 20, NULL, NULL, '341', 'San Pedro Yucunama', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1340, 20, NULL, NULL, '342', 'San Raymundo Jalpan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1341, 20, NULL, NULL, '343', 'San Sebastián Abasolo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1342, 20, NULL, NULL, '344', 'San Sebastián Coatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1343, 20, NULL, NULL, '345', 'San Sebastián Ixcapa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1344, 20, NULL, NULL, '346', 'San Sebastián Nicananduta', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1345, 20, NULL, NULL, '347', 'San Sebastián Río Hondo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1346, 20, NULL, NULL, '348', 'San Sebastián Tecomaxtlahuaca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1347, 20, NULL, NULL, '349', 'San Sebastián Teitipac', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1348, 20, NULL, NULL, '350', 'San Sebastián Tutla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1349, 20, NULL, NULL, '351', 'San Simón Almolongas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1350, 20, NULL, NULL, '352', 'San Simón Zahuatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1351, 20, NULL, NULL, '353', 'Santa Ana', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1352, 20, NULL, NULL, '354', 'Santa Ana Ateixtlahuaca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1353, 20, NULL, NULL, '355', 'Santa Ana Cuauhtémoc', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1354, 20, NULL, NULL, '356', 'Santa Ana del Valle', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1355, 20, NULL, NULL, '357', 'Santa Ana Tavela', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1356, 20, NULL, NULL, '358', 'Santa Ana Tlapacoyan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1357, 20, NULL, NULL, '359', 'Santa Ana Yareni', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1358, 20, NULL, NULL, '360', 'Santa Ana Zegache', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1359, 20, NULL, NULL, '361', 'Santa Catalina Quierí', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1360, 20, NULL, NULL, '362', 'Santa Catarina Cuixtla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1361, 20, NULL, NULL, '363', 'Santa Catarina Ixtepeji', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1362, 20, NULL, NULL, '364', 'Santa Catarina Juquila', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1363, 20, NULL, NULL, '365', 'Santa Catarina Lachatao', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1364, 20, NULL, NULL, '366', 'Santa Catarina Loxicha', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1365, 20, NULL, NULL, '367', 'Santa Catarina Mechoacán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1366, 20, NULL, NULL, '368', 'Santa Catarina Minas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1367, 20, NULL, NULL, '369', 'Santa Catarina Quiané', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1368, 20, NULL, NULL, '370', 'Santa Catarina Tayata', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1369, 20, NULL, NULL, '371', 'Santa Catarina Ticuá', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1370, 20, NULL, NULL, '372', 'Santa Catarina Yosonotú', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1371, 20, NULL, NULL, '373', 'Santa Catarina Zapoquila', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1372, 20, NULL, NULL, '374', 'Santa Cruz Acatepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1373, 20, NULL, NULL, '375', 'Santa Cruz Amilpas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1374, 20, NULL, NULL, '376', 'Santa Cruz de Bravo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1375, 20, NULL, NULL, '377', 'Santa Cruz Itundujia', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1376, 20, NULL, NULL, '378', 'Santa Cruz Mixtepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1377, 20, NULL, NULL, '379', 'Santa Cruz Nundaco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1378, 20, NULL, NULL, '380', 'Santa Cruz Papalutla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1379, 20, NULL, NULL, '381', 'Santa Cruz Tacache de Mina', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1380, 20, NULL, NULL, '382', 'Santa Cruz Tacahua', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1381, 20, NULL, NULL, '383', 'Santa Cruz Tayata', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1382, 20, NULL, NULL, '384', 'Santa Cruz Xitla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1383, 20, NULL, NULL, '385', 'Santa Cruz Xoxocotlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1384, 20, NULL, NULL, '386', 'Santa Cruz Zenzontepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1385, 20, NULL, NULL, '387', 'Santa Gertrudis', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1386, 20, NULL, NULL, '388', 'Santa Inés del Monte', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1387, 20, NULL, NULL, '389', 'Santa Inés Yatzeche', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1388, 20, NULL, NULL, '390', 'Santa Lucía del Camino', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1389, 20, NULL, NULL, '391', 'Santa Lucía Miahuatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1390, 20, NULL, NULL, '392', 'Santa Lucía Monteverde', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1391, 20, NULL, NULL, '393', 'Santa Lucía Ocotlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1392, 20, NULL, NULL, '394', 'Santa María Alotepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1393, 20, NULL, NULL, '395', 'Santa María Apazco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1394, 20, NULL, NULL, '396', 'Santa María la Asunción', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1395, 20, NULL, NULL, '397', 'Heroica Ciudad de Tlaxiaco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1396, 20, NULL, NULL, '398', 'Ayoquezco de Aldama', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1397, 20, NULL, NULL, '399', 'Santa María Atzompa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1398, 20, NULL, NULL, '400', 'Santa María Camotlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1399, 20, NULL, NULL, '401', 'Santa María Colotepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1400, 20, NULL, NULL, '402', 'Santa María Cortijo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1401, 20, NULL, NULL, '403', 'Santa María Coyotepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1402, 20, NULL, NULL, '404', 'Santa María Chachoápam', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1403, 20, NULL, NULL, '405', 'Villa de Chilapa de Díaz', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1404, 20, NULL, NULL, '406', 'Santa María Chilchotla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1405, 20, NULL, NULL, '407', 'Santa María Chimalapa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1406, 20, NULL, NULL, '408', 'Santa María del Rosario', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1407, 20, NULL, NULL, '409', 'Santa María del Tule', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1408, 20, NULL, NULL, '410', 'Santa María Ecatepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1409, 20, NULL, NULL, '411', 'Santa María Guelacé', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1410, 20, NULL, NULL, '412', 'Santa María Guienagati', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1411, 20, NULL, NULL, '413', 'Santa María Huatulco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1412, 20, NULL, NULL, '414', 'Santa María Huazolotitlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1413, 20, NULL, NULL, '415', 'Santa María Ipalapa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1414, 20, NULL, NULL, '416', 'Santa María Ixcatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1415, 20, NULL, NULL, '417', 'Santa María Jacatepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1416, 20, NULL, NULL, '418', 'Santa María Jalapa del Marqués', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1417, 20, NULL, NULL, '419', 'Santa María Jaltianguis', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1418, 20, NULL, NULL, '420', 'Santa María Lachixío', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1419, 20, NULL, NULL, '421', 'Santa María Mixtequilla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1420, 20, NULL, NULL, '422', 'Santa María Nativitas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1421, 20, NULL, NULL, '423', 'Santa María Nduayaco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1422, 20, NULL, NULL, '424', 'Santa María Ozolotepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1423, 20, NULL, NULL, '425', 'Santa María Pápalo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1424, 20, NULL, NULL, '426', 'Santa María Peñoles', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1425, 20, NULL, NULL, '427', 'Santa María Petapa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1426, 20, NULL, NULL, '428', 'Santa María Quiegolani', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1427, 20, NULL, NULL, '429', 'Santa María Sola', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1428, 20, NULL, NULL, '430', 'Santa María Tataltepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1429, 20, NULL, NULL, '431', 'Santa María Tecomavaca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1430, 20, NULL, NULL, '432', 'Santa María Temaxcalapa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1431, 20, NULL, NULL, '433', 'Santa María Temaxcaltepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1432, 20, NULL, NULL, '434', 'Santa María Teopoxco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1433, 20, NULL, NULL, '435', 'Santa María Tepantlali', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1434, 20, NULL, NULL, '436', 'Santa María Texcatitlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1435, 20, NULL, NULL, '437', 'Santa María Tlahuitoltepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1436, 20, NULL, NULL, '438', 'Santa María Tlalixtac', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1437, 20, NULL, NULL, '439', 'Santa María Tonameca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1438, 20, NULL, NULL, '440', 'Santa María Totolapilla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1439, 20, NULL, NULL, '441', 'Santa María Xadani', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1440, 20, NULL, NULL, '442', 'Santa María Yalina', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1441, 20, NULL, NULL, '443', 'Santa María Yavesía', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1442, 20, NULL, NULL, '444', 'Santa María Yolotepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1443, 20, NULL, NULL, '445', 'Santa María Yosoyúa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1444, 20, NULL, NULL, '446', 'Santa María Yucuhiti', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1445, 20, NULL, NULL, '447', 'Santa María Zacatepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1446, 20, NULL, NULL, '448', 'Santa María Zaniza', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1447, 20, NULL, NULL, '449', 'Santa María Zoquitlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1448, 20, NULL, NULL, '450', 'Santiago Amoltepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1449, 20, NULL, NULL, '451', 'Santiago Apoala', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1450, 20, NULL, NULL, '452', 'Santiago Apóstol', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1451, 20, NULL, NULL, '453', 'Santiago Astata', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1452, 20, NULL, NULL, '454', 'Santiago Atitlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1453, 20, NULL, NULL, '455', 'Santiago Ayuquililla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1454, 20, NULL, NULL, '456', 'Santiago Cacaloxtepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1455, 20, NULL, NULL, '457', 'Santiago Camotlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1456, 20, NULL, NULL, '458', 'Santiago Comaltepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1457, 20, NULL, NULL, '459', 'Santiago Chazumba', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1458, 20, NULL, NULL, '460', 'Santiago Choápam', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1459, 20, NULL, NULL, '461', 'Santiago del Río', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1460, 20, NULL, NULL, '462', 'Santiago Huajolotitlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1461, 20, NULL, NULL, '463', 'Santiago Huauclilla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1462, 20, NULL, NULL, '464', 'Santiago Ihuitlán Plumas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1463, 20, NULL, NULL, '465', 'Santiago Ixcuintepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1464, 20, NULL, NULL, '466', 'Santiago Ixtayutla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1465, 20, NULL, NULL, '467', 'Santiago Jamiltepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1466, 20, NULL, NULL, '468', 'Santiago Jocotepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1467, 20, NULL, NULL, '469', 'Santiago Juxtlahuaca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1468, 20, NULL, NULL, '470', 'Santiago Lachiguiri', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1469, 20, NULL, NULL, '471', 'Santiago Lalopa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1470, 20, NULL, NULL, '472', 'Santiago Laollaga', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1471, 20, NULL, NULL, '473', 'Santiago Laxopa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1472, 20, NULL, NULL, '474', 'Santiago Llano Grande', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1473, 20, NULL, NULL, '475', 'Santiago Matatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1474, 20, NULL, NULL, '476', 'Santiago Miltepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1475, 20, NULL, NULL, '477', 'Santiago Minas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1476, 20, NULL, NULL, '478', 'Santiago Nacaltepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1477, 20, NULL, NULL, '479', 'Santiago Nejapilla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1478, 20, NULL, NULL, '480', 'Santiago Nundiche', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1479, 20, NULL, NULL, '481', 'Santiago Nuyoó', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1480, 20, NULL, NULL, '482', 'Santiago Pinotepa Nacional', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1481, 20, NULL, NULL, '483', 'Santiago Suchilquitongo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1482, 20, NULL, NULL, '484', 'Santiago Tamazola', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1483, 20, NULL, NULL, '485', 'Santiago Tapextla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1484, 20, NULL, NULL, '486', 'Villa Tejúpam de la Unión', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1485, 20, NULL, NULL, '487', 'Santiago Tenango', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1486, 20, NULL, NULL, '488', 'Santiago Tepetlapa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1487, 20, NULL, NULL, '489', 'Santiago Tetepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1488, 20, NULL, NULL, '490', 'Santiago Texcalcingo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1489, 20, NULL, NULL, '491', 'Santiago Textitlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1490, 20, NULL, NULL, '492', 'Santiago Tilantongo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1491, 20, NULL, NULL, '493', 'Santiago Tillo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1492, 20, NULL, NULL, '494', 'Santiago Tlazoyaltepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1493, 20, NULL, NULL, '495', 'Santiago Xanica', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1494, 20, NULL, NULL, '496', 'Santiago Xiacuí', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1495, 20, NULL, NULL, '497', 'Santiago Yaitepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1496, 20, NULL, NULL, '498', 'Santiago Yaveo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1497, 20, NULL, NULL, '499', 'Santiago Yolomécatl', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1498, 20, NULL, NULL, '500', 'Santiago Yosondúa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1499, 20, NULL, NULL, '501', 'Santiago Yucuyachi', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1500, 20, NULL, NULL, '502', 'Santiago Zacatepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1501, 20, NULL, NULL, '503', 'Santiago Zoochila', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1502, 20, NULL, NULL, '504', 'Nuevo Zoquiápam', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1503, 20, NULL, NULL, '505', 'Santo Domingo Ingenio', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1504, 20, NULL, NULL, '506', 'Santo Domingo Albarradas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1505, 20, NULL, NULL, '507', 'Santo Domingo Armenta', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1506, 20, NULL, NULL, '508', 'Santo Domingo Chihuitán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1507, 20, NULL, NULL, '509', 'Santo Domingo de Morelos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1508, 20, NULL, NULL, '510', 'Santo Domingo Ixcatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1509, 20, NULL, NULL, '511', 'Santo Domingo Nuxaá', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1510, 20, NULL, NULL, '512', 'Santo Domingo Ozolotepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1511, 20, NULL, NULL, '513', 'Santo Domingo Petapa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1512, 20, NULL, NULL, '514', 'Santo Domingo Roayaga', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1513, 20, NULL, NULL, '515', 'Santo Domingo Tehuantepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1514, 20, NULL, NULL, '516', 'Santo Domingo Teojomulco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1515, 20, NULL, NULL, '517', 'Santo Domingo Tepuxtepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1516, 20, NULL, NULL, '518', 'Santo Domingo Tlatayápam', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1517, 20, NULL, NULL, '519', 'Santo Domingo Tomaltepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1518, 20, NULL, NULL, '520', 'Santo Domingo Tonalá', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1519, 20, NULL, NULL, '521', 'Santo Domingo Tonaltepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1520, 20, NULL, NULL, '522', 'Santo Domingo Xagacía', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1521, 20, NULL, NULL, '523', 'Santo Domingo Yanhuitlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1522, 20, NULL, NULL, '524', 'Santo Domingo Yodohino', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1523, 20, NULL, NULL, '525', 'Santo Domingo Zanatepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1524, 20, NULL, NULL, '526', 'Santos Reyes Nopala', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1525, 20, NULL, NULL, '527', 'Santos Reyes Pápalo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1526, 20, NULL, NULL, '528', 'Santos Reyes Tepejillo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1527, 20, NULL, NULL, '529', 'Santos Reyes Yucuná', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1528, 20, NULL, NULL, '530', 'Santo Tomás Jalieza', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1529, 20, NULL, NULL, '531', 'Santo Tomás Mazaltepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1530, 20, NULL, NULL, '532', 'Santo Tomás Ocotepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1531, 20, NULL, NULL, '533', 'Santo Tomás Tamazulapan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1532, 20, NULL, NULL, '534', 'San Vicente Coatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1533, 20, NULL, NULL, '535', 'San Vicente Lachixío', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1534, 20, NULL, NULL, '536', 'San Vicente Nuñú', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1535, 20, NULL, NULL, '537', 'Silacayoápam', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1536, 20, NULL, NULL, '538', 'Sitio de Xitlapehua', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1537, 20, NULL, NULL, '539', 'Soledad Etla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1538, 20, NULL, NULL, '540', 'Villa de Tamazulápam del Progreso', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1539, 20, NULL, NULL, '541', 'Tanetze de Zaragoza', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1540, 20, NULL, NULL, '542', 'Taniche', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1541, 20, NULL, NULL, '543', 'Tataltepec de Valdés', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1542, 20, NULL, NULL, '544', 'Teococuilco de Marcos Pérez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1543, 20, NULL, NULL, '545', 'Teotitlán de Flores Magón', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1544, 20, NULL, NULL, '546', 'Teotitlán del Valle', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1545, 20, NULL, NULL, '547', 'Teotongo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1546, 20, NULL, NULL, '548', 'Tepelmeme Villa de Morelos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1547, 20, NULL, NULL, '549', 'Heroica Villa Tezoatlán de Segura y Luna, Cuna de ', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1548, 20, NULL, NULL, '549', 'Heroica Villa Tezoatlán de Segura y Luna, Cuna de ', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1549, 20, NULL, NULL, '549', 'Heroica Villa Tezoatlán de Segura y Luna, Cuna de ', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1550, 20, NULL, NULL, '549', 'Heroica Villa Tezoatlán de Segura y Luna, Cuna de ', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1551, 20, NULL, NULL, '549', 'Heroica Villa Tezoatlán de Segura y Luna, Cuna de ', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1552, 20, NULL, NULL, '549', 'Heroica Villa Tezoatlán de Segura y Luna, Cuna de ', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1553, 20, NULL, NULL, '549', 'Heroica Villa Tezoatlán de Segura y Luna, Cuna de ', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1554, 20, NULL, NULL, '549', 'Heroica Villa Tezoatlán de Segura y Luna, Cuna de ', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1555, 20, NULL, NULL, '549', 'Heroica Villa Tezoatlán de Segura y Luna, Cuna de ', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1556, 20, NULL, NULL, '549', 'Heroica Villa Tezoatlán de Segura y Luna, Cuna de ', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1557, 20, NULL, NULL, '549', 'Heroica Villa Tezoatlán de Segura y Luna, Cuna de ', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1558, 20, NULL, NULL, '549', 'Heroica Villa Tezoatlán de Segura y Luna, Cuna de ', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1559, 20, NULL, NULL, '549', 'Heroica Villa Tezoatlán de Segura y Luna, Cuna de ', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1560, 20, NULL, NULL, '549', 'Heroica Villa Tezoatlán de Segura y Luna, Cuna de ', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1561, 20, NULL, NULL, '549', 'Heroica Villa Tezoatlán de Segura y Luna, Cuna de ', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1562, 20, NULL, NULL, '549', 'Heroica Villa Tezoatlán de Segura y Luna, Cuna de ', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1563, 20, NULL, NULL, '549', 'Heroica Villa Tezoatlán de Segura y Luna, Cuna de ', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1564, 20, NULL, NULL, '549', 'Heroica Villa Tezoatlán de Segura y Luna, Cuna de ', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1565, 20, NULL, NULL, '549', 'Heroica Villa Tezoatlán de Segura y Luna, Cuna de ', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1566, 20, NULL, NULL, '549', 'Heroica Villa Tezoatlán de Segura y Luna, Cuna de ', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1567, 20, NULL, NULL, '549', 'Heroica Villa Tezoatlán de Segura y Luna, Cuna de ', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1568, 20, NULL, NULL, '549', 'Heroica Villa Tezoatlán de Segura y Luna, Cuna de ', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1569, 20, NULL, NULL, '549', 'Heroica Villa Tezoatlán de Segura y Luna, Cuna de ', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1570, 20, NULL, NULL, '549', 'Heroica Villa Tezoatlán de Segura y Luna, Cuna de ', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1571, 20, NULL, NULL, '549', 'Heroica Villa Tezoatlán de Segura y Luna, Cuna de ', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1572, 20, NULL, NULL, '549', 'Heroica Villa Tezoatlán de Segura y Luna, Cuna de ', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1573, 20, NULL, NULL, '549', 'Heroica Villa Tezoatlán de Segura y Luna, Cuna de ', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1574, 20, NULL, NULL, '549', 'Heroica Villa Tezoatlán de Segura y Luna, Cuna de ', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1575, 20, NULL, NULL, '549', 'Heroica Villa Tezoatlán de Segura y Luna, Cuna de ', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1576, 20, NULL, NULL, '549', 'Heroica Villa Tezoatlán de Segura y Luna, Cuna de ', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1577, 20, NULL, NULL, '549', 'Heroica Villa Tezoatlán de Segura y Luna, Cuna de ', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1578, 20, NULL, NULL, '549', 'Heroica Villa Tezoatlán de Segura y Luna, Cuna de ', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1579, 20, NULL, NULL, '549', 'Heroica Villa Tezoatlán de Segura y Luna, Cuna de ', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1580, 20, NULL, NULL, '549', 'Heroica Villa Tezoatlán de Segura y Luna, Cuna de ', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1581, 20, NULL, NULL, '549', 'Heroica Villa Tezoatlán de Segura y Luna, Cuna de ', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1582, 20, NULL, NULL, '549', 'Heroica Villa Tezoatlán de Segura y Luna, Cuna de ', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1583, 20, NULL, NULL, '550', 'San Jerónimo Tlacochahuaya', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1584, 20, NULL, NULL, '551', 'Tlacolula de Matamoros', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1585, 20, NULL, NULL, '552', 'Tlacotepec Plumas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1586, 20, NULL, NULL, '553', 'Tlalixtac de Cabrera', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1587, 20, NULL, NULL, '554', 'Totontepec Villa de Morelos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1588, 20, NULL, NULL, '555', 'Trinidad Zaachila', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1589, 20, NULL, NULL, '556', 'La Trinidad Vista Hermosa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1590, 20, NULL, NULL, '557', 'Unión Hidalgo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1591, 20, NULL, NULL, '558', 'Valerio Trujano', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1592, 20, NULL, NULL, '559', 'San Juan Bautista Valle Nacional', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1593, 20, NULL, NULL, '560', 'Villa Díaz Ordaz', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1594, 20, NULL, NULL, '561', 'Yaxe', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1595, 20, NULL, NULL, '562', 'Magdalena Yodocono de Porfirio Díaz', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1596, 20, NULL, NULL, '563', 'Yogana', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1597, 20, NULL, NULL, '564', 'Yutanduchi de Guerrero', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1598, 20, NULL, NULL, '565', 'Villa de Zaachila', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1599, 20, NULL, NULL, '566', 'San Mateo Yucutindó', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1600, 20, NULL, NULL, '567', 'Zapotitlán Lagunas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1601, 20, NULL, NULL, '568', 'Zapotitlán Palmas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1602, 20, NULL, NULL, '569', 'Santa Inés de Zaragoza', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1603, 20, NULL, NULL, '570', 'Zimatlán de Álvarez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1604, 21, NULL, NULL, '001', 'Acajete', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1605, 21, NULL, NULL, '002', 'Acateno', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1606, 21, NULL, NULL, '003', 'Acatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1607, 21, NULL, NULL, '004', 'Acatzingo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1608, 21, NULL, NULL, '005', 'Acteopan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1609, 21, NULL, NULL, '006', 'Ahuacatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1610, 21, NULL, NULL, '007', 'Ahuatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1611, 21, NULL, NULL, '008', 'Ahuazotepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1612, 21, NULL, NULL, '009', 'Ahuehuetitla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1613, 21, NULL, NULL, '010', 'Ajalpan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1614, 21, NULL, NULL, '011', 'Albino Zertuche', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1615, 21, NULL, NULL, '012', 'Aljojuca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1616, 21, NULL, NULL, '013', 'Altepexi', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1617, 21, NULL, NULL, '014', 'Amixtlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1618, 21, NULL, NULL, '015', 'Amozoc', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1619, 21, NULL, NULL, '016', 'Aquixtla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1620, 21, NULL, NULL, '017', 'Atempan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1621, 21, NULL, NULL, '018', 'Atexcal', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1622, 21, NULL, NULL, '019', 'Atlixco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1623, 21, NULL, NULL, '020', 'Atoyatempan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1624, 21, NULL, NULL, '021', 'Atzala', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1625, 21, NULL, NULL, '022', 'Atzitzihuacán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1626, 21, NULL, NULL, '023', 'Atzitzintla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1627, 21, NULL, NULL, '024', 'Axutla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1628, 21, NULL, NULL, '025', 'Ayotoxco de Guerrero', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1629, 21, NULL, NULL, '026', 'Calpan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1630, 21, NULL, NULL, '027', 'Caltepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1631, 21, NULL, NULL, '028', 'Camocuautla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1632, 21, NULL, NULL, '029', 'Caxhuacan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1633, 21, NULL, NULL, '030', 'Coatepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1634, 21, NULL, NULL, '031', 'Coatzingo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1635, 21, NULL, NULL, '032', 'Cohetzala', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1636, 21, NULL, NULL, '033', 'Cohuecan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1637, 21, NULL, NULL, '034', 'Coronango', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1638, 21, NULL, NULL, '035', 'Coxcatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1639, 21, NULL, NULL, '036', 'Coyomeapan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1640, 21, NULL, NULL, '037', 'Coyotepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1641, 21, NULL, NULL, '038', 'Cuapiaxtla de Madero', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1642, 21, NULL, NULL, '039', 'Cuautempan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1643, 21, NULL, NULL, '040', 'Cuautinchán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1644, 21, NULL, NULL, '041', 'Cuautlancingo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1645, 21, NULL, NULL, '042', 'Cuayuca de Andrade', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1646, 21, NULL, NULL, '043', 'Cuetzalan del Progreso', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1647, 21, NULL, NULL, '044', 'Cuyoaco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1648, 21, NULL, NULL, '045', 'Chalchicomula de Sesma', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1649, 21, NULL, NULL, '046', 'Chapulco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1650, 21, NULL, NULL, '047', 'Chiautla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1651, 21, NULL, NULL, '048', 'Chiautzingo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1652, 21, NULL, NULL, '049', 'Chiconcuautla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1653, 21, NULL, NULL, '050', 'Chichiquila', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1654, 21, NULL, NULL, '051', 'Chietla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1655, 21, NULL, NULL, '052', 'Chigmecatitlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1656, 21, NULL, NULL, '053', 'Chignahuapan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1657, 21, NULL, NULL, '054', 'Chignautla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1658, 21, NULL, NULL, '055', 'Chila', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1659, 21, NULL, NULL, '056', 'Chila de la Sal', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1660, 21, NULL, NULL, '057', 'Honey', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1661, 21, NULL, NULL, '058', 'Chilchotla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1662, 21, NULL, NULL, '059', 'Chinantla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1663, 21, NULL, NULL, '060', 'Domingo Arenas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1664, 21, NULL, NULL, '061', 'Eloxochitlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1665, 21, NULL, NULL, '062', 'Epatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1666, 21, NULL, NULL, '063', 'Esperanza', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1667, 21, NULL, NULL, '064', 'Francisco Z. Mena', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1668, 21, NULL, NULL, '065', 'General Felipe Ángeles', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1669, 21, NULL, NULL, '066', 'Guadalupe', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1670, 21, NULL, NULL, '067', 'Guadalupe Victoria', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1671, 21, NULL, NULL, '068', 'Hermenegildo Galeana', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1672, 21, NULL, NULL, '069', 'Huaquechula', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1673, 21, NULL, NULL, '070', 'Huatlatlauca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1674, 21, NULL, NULL, '071', 'Huauchinango', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1675, 21, NULL, NULL, '072', 'Huehuetla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1676, 21, NULL, NULL, '073', 'Huehuetlán el Chico', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1677, 21, NULL, NULL, '074', 'Huejotzingo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1678, 21, NULL, NULL, '075', 'Hueyapan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1679, 21, NULL, NULL, '076', 'Hueytamalco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1680, 21, NULL, NULL, '077', 'Hueytlalpan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1681, 21, NULL, NULL, '078', 'Huitzilan de Serdán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1682, 21, NULL, NULL, '079', 'Huitziltepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1683, 21, NULL, NULL, '080', 'Atlequizayan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1684, 21, NULL, NULL, '081', 'Ixcamilpa de Guerrero', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1685, 21, NULL, NULL, '082', 'Ixcaquixtla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1686, 21, NULL, NULL, '083', 'Ixtacamaxtitlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1687, 21, NULL, NULL, '084', 'Ixtepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1688, 21, NULL, NULL, '085', 'Izúcar de Matamoros', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1689, 21, NULL, NULL, '086', 'Jalpan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1690, 21, NULL, NULL, '087', 'Jolalpan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1691, 21, NULL, NULL, '088', 'Jonotla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1692, 21, NULL, NULL, '089', 'Jopala', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1693, 21, NULL, NULL, '090', 'Juan C. Bonilla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1694, 21, NULL, NULL, '091', 'Juan Galindo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1695, 21, NULL, NULL, '092', 'Juan N. Méndez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1696, 21, NULL, NULL, '093', 'Lafragua', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1697, 21, NULL, NULL, '094', 'Libres', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1698, 21, NULL, NULL, '095', 'La Magdalena Tlatlauquitepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1699, 21, NULL, NULL, '096', 'Mazapiltepec de Juárez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1700, 21, NULL, NULL, '097', 'Mixtla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1701, 21, NULL, NULL, '098', 'Molcaxac', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1702, 21, NULL, NULL, '099', 'Cañada Morelos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1703, 21, NULL, NULL, '100', 'Naupan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1704, 21, NULL, NULL, '101', 'Nauzontla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1705, 21, NULL, NULL, '102', 'Nealtican', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1706, 21, NULL, NULL, '103', 'Nicolás Bravo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1707, 21, NULL, NULL, '104', 'Nopalucan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1708, 21, NULL, NULL, '105', 'Ocotepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1709, 21, NULL, NULL, '106', 'Ocoyucan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1710, 21, NULL, NULL, '107', 'Olintla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1711, 21, NULL, NULL, '108', 'Oriental', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1712, 21, NULL, NULL, '109', 'Pahuatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1713, 21, NULL, NULL, '110', 'Palmar de Bravo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1714, 21, NULL, NULL, '111', 'Pantepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1715, 21, NULL, NULL, '112', 'Petlalcingo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1716, 21, NULL, NULL, '113', 'Piaxtla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1717, 21, NULL, NULL, '114', 'Puebla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1718, 21, NULL, NULL, '115', 'Quecholac', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1719, 21, NULL, NULL, '116', 'Quimixtlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1720, 21, NULL, NULL, '117', 'Rafael Lara Grajales', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1721, 21, NULL, NULL, '118', 'Los Reyes de Juárez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1722, 21, NULL, NULL, '119', 'San Andrés Cholula', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1723, 21, NULL, NULL, '120', 'San Antonio Cañada', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1724, 21, NULL, NULL, '121', 'San Diego la Mesa Tochimiltzingo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1725, 21, NULL, NULL, '122', 'San Felipe Teotlalcingo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1726, 21, NULL, NULL, '123', 'San Felipe Tepatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1727, 21, NULL, NULL, '124', 'San Gabriel Chilac', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1728, 21, NULL, NULL, '125', 'San Gregorio Atzompa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1729, 21, NULL, NULL, '126', 'San Jerónimo Tecuanipan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1730, 21, NULL, NULL, '127', 'San Jerónimo Xayacatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1731, 21, NULL, NULL, '128', 'San José Chiapa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1732, 21, NULL, NULL, '129', 'San José Miahuatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1733, 21, NULL, NULL, '130', 'San Juan Atenco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1734, 21, NULL, NULL, '131', 'San Juan Atzompa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1735, 21, NULL, NULL, '132', 'San Martín Texmelucan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1736, 21, NULL, NULL, '133', 'San Martín Totoltepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1737, 21, NULL, NULL, '134', 'San Matías Tlalancaleca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1738, 21, NULL, NULL, '135', 'San Miguel Ixitlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1739, 21, NULL, NULL, '136', 'San Miguel Xoxtla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1740, 21, NULL, NULL, '137', 'San Nicolás Buenos Aires', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1741, 21, NULL, NULL, '138', 'San Nicolás de los Ranchos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1742, 21, NULL, NULL, '139', 'San Pablo Anicano', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1743, 21, NULL, NULL, '140', 'San Pedro Cholula', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1744, 21, NULL, NULL, '141', 'San Pedro Yeloixtlahuaca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1745, 21, NULL, NULL, '142', 'San Salvador el Seco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1746, 21, NULL, NULL, '143', 'San Salvador el Verde', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1747, 21, NULL, NULL, '144', 'San Salvador Huixcolotla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1748, 21, NULL, NULL, '145', 'San Sebastián Tlacotepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1749, 21, NULL, NULL, '146', 'Santa Catarina Tlaltempan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1750, 21, NULL, NULL, '147', 'Santa Inés Ahuatempan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1751, 21, NULL, NULL, '148', 'Santa Isabel Cholula', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1752, 21, NULL, NULL, '149', 'Santiago Miahuatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1753, 21, NULL, NULL, '150', 'Huehuetlán el Grande', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1754, 21, NULL, NULL, '151', 'Santo Tomás Hueyotlipan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1755, 21, NULL, NULL, '152', 'Soltepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1756, 21, NULL, NULL, '153', 'Tecali de Herrera', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1757, 21, NULL, NULL, '154', 'Tecamachalco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1758, 21, NULL, NULL, '155', 'Tecomatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1759, 21, NULL, NULL, '156', 'Tehuacán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1760, 21, NULL, NULL, '157', 'Tehuitzingo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1761, 21, NULL, NULL, '158', 'Tenampulco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1762, 21, NULL, NULL, '159', 'Teopantlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1763, 21, NULL, NULL, '160', 'Teotlalco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1764, 21, NULL, NULL, '161', 'Tepanco de López', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1765, 21, NULL, NULL, '162', 'Tepango de Rodríguez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1766, 21, NULL, NULL, '163', 'Tepatlaxco de Hidalgo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1767, 21, NULL, NULL, '164', 'Tepeaca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1768, 21, NULL, NULL, '165', 'Tepemaxalco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1769, 21, NULL, NULL, '166', 'Tepeojuma', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1770, 21, NULL, NULL, '167', 'Tepetzintla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1771, 21, NULL, NULL, '168', 'Tepexco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1772, 21, NULL, NULL, '169', 'Tepexi de Rodríguez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1773, 21, NULL, NULL, '170', 'Tepeyahualco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1774, 21, NULL, NULL, '171', 'Tepeyahualco de Cuauhtémoc', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1775, 21, NULL, NULL, '172', 'Tetela de Ocampo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1776, 21, NULL, NULL, '173', 'Teteles de Avila Castillo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1777, 21, NULL, NULL, '174', 'Teziutlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1778, 21, NULL, NULL, '175', 'Tianguismanalco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1779, 21, NULL, NULL, '176', 'Tilapa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1780, 21, NULL, NULL, '177', 'Tlacotepec de Benito Juárez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1781, 21, NULL, NULL, '178', 'Tlacuilotepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1782, 21, NULL, NULL, '179', 'Tlachichuca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1783, 21, NULL, NULL, '180', 'Tlahuapan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1784, 21, NULL, NULL, '181', 'Tlaltenango', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1785, 21, NULL, NULL, '182', 'Tlanepantla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1786, 21, NULL, NULL, '183', 'Tlaola', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1787, 21, NULL, NULL, '184', 'Tlapacoya', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1788, 21, NULL, NULL, '185', 'Tlapanalá', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1789, 21, NULL, NULL, '186', 'Tlatlauquitepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1790, 21, NULL, NULL, '187', 'Tlaxco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1791, 21, NULL, NULL, '188', 'Tochimilco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1792, 21, NULL, NULL, '189', 'Tochtepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1793, 21, NULL, NULL, '190', 'Totoltepec de Guerrero', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1794, 21, NULL, NULL, '191', 'Tulcingo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1795, 21, NULL, NULL, '192', 'Tuzamapan de Galeana', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1796, 21, NULL, NULL, '193', 'Tzicatlacoyan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1797, 21, NULL, NULL, '194', 'Venustiano Carranza', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1798, 21, NULL, NULL, '195', 'Vicente Guerrero', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1799, 21, NULL, NULL, '196', 'Xayacatlán de Bravo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1800, 21, NULL, NULL, '197', 'Xicotepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1801, 21, NULL, NULL, '198', 'Xicotlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1802, 21, NULL, NULL, '199', 'Xiutetelco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1803, 21, NULL, NULL, '200', 'Xochiapulco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1804, 21, NULL, NULL, '201', 'Xochiltepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1805, 21, NULL, NULL, '202', 'Xochitlán de Vicente Suárez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1806, 21, NULL, NULL, '203', 'Xochitlán Todos Santos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1807, 21, NULL, NULL, '204', 'Yaonáhuac', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1808, 21, NULL, NULL, '205', 'Yehualtepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1809, 21, NULL, NULL, '206', 'Zacapala', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1810, 21, NULL, NULL, '207', 'Zacapoaxtla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1811, 21, NULL, NULL, '208', 'Zacatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1812, 21, NULL, NULL, '209', 'Zapotitlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1813, 21, NULL, NULL, '210', 'Zapotitlán de Méndez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1814, 21, NULL, NULL, '211', 'Zaragoza', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1815, 21, NULL, NULL, '212', 'Zautla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1816, 21, NULL, NULL, '213', 'Zihuateutla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1817, 21, NULL, NULL, '214', 'Zinacatepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1818, 21, NULL, NULL, '215', 'Zongozotla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1819, 21, NULL, NULL, '216', 'Zoquiapan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1820, 21, NULL, NULL, '217', 'Zoquitlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1821, 22, NULL, NULL, '001', 'Amealco de Bonfil', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1822, 22, NULL, NULL, '002', 'Pinal de Amoles', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1823, 22, NULL, NULL, '003', 'Arroyo Seco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1824, 22, NULL, NULL, '004', 'Cadereyta de Montes', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1825, 22, NULL, NULL, '005', 'Colón', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1826, 22, NULL, NULL, '006', 'Corregidora', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1827, 22, NULL, NULL, '007', 'Ezequiel Montes', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1828, 22, NULL, NULL, '008', 'Huimilpan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1829, 22, NULL, NULL, '009', 'Jalpan de Serra', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1830, 22, NULL, NULL, '010', 'Landa de Matamoros', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1831, 22, NULL, NULL, '011', 'El Marqués', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1832, 22, NULL, NULL, '012', 'Pedro Escobedo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1833, 22, NULL, NULL, '013', 'Peñamiller', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1834, 22, NULL, NULL, '014', 'Querétaro', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1835, 22, NULL, NULL, '015', 'San Joaquín', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1836, 22, NULL, NULL, '016', 'San Juan del Río', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1837, 22, NULL, NULL, '017', 'Tequisquiapan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1838, 22, NULL, NULL, '018', 'Tolimán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1839, 23, NULL, NULL, '001', 'Cozumel', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1840, 23, NULL, NULL, '002', 'Felipe Carrillo Puerto', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1841, 23, NULL, NULL, '003', 'Isla Mujeres', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1842, 23, NULL, NULL, '004', 'Othón P. Blanco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1843, 23, NULL, NULL, '005', 'Benito Juárez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1844, 23, NULL, NULL, '006', 'José María Morelos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1845, 23, NULL, NULL, '007', 'Lázaro Cárdenas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1846, 23, NULL, NULL, '008', 'Solidaridad', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1847, 23, NULL, NULL, '009', 'Tulum', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1848, 23, NULL, NULL, '010', 'Bacalar', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1849, 24, NULL, NULL, '001', 'Ahualulco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1850, 24, NULL, NULL, '002', 'Alaquines', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1851, 24, NULL, NULL, '003', 'Aquismón', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1852, 24, NULL, NULL, '004', 'Armadillo de los Infante', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1853, 24, NULL, NULL, '005', 'Cárdenas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1854, 24, NULL, NULL, '006', 'Catorce', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1855, 24, NULL, NULL, '007', 'Cedral', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1856, 24, NULL, NULL, '008', 'Cerritos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1857, 24, NULL, NULL, '009', 'Cerro de San Pedro', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1858, 24, NULL, NULL, '010', 'Ciudad del Maíz', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1859, 24, NULL, NULL, '011', 'Ciudad Fernández', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1860, 24, NULL, NULL, '012', 'Tancanhuitz', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1861, 24, NULL, NULL, '013', 'Ciudad Valles', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1862, 24, NULL, NULL, '014', 'Coxcatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1863, 24, NULL, NULL, '015', 'Charcas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1864, 24, NULL, NULL, '016', 'Ebano', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1865, 24, NULL, NULL, '017', 'Guadalcázar', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1866, 24, NULL, NULL, '018', 'Huehuetlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1867, 24, NULL, NULL, '019', 'Lagunillas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1868, 24, NULL, NULL, '020', 'Matehuala', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1869, 24, NULL, NULL, '021', 'Mexquitic de Carmona', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1870, 24, NULL, NULL, '022', 'Moctezuma', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1871, 24, NULL, NULL, '023', 'Rayón', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1872, 24, NULL, NULL, '024', 'Rioverde', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1873, 24, NULL, NULL, '025', 'Salinas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1874, 24, NULL, NULL, '026', 'San Antonio', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1875, 24, NULL, NULL, '027', 'San Ciro de Acosta', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1876, 24, NULL, NULL, '028', 'San Luis Potosí', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1877, 24, NULL, NULL, '029', 'San Martín Chalchicuautla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1878, 24, NULL, NULL, '030', 'San Nicolás Tolentino', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1879, 24, NULL, NULL, '031', 'Santa Catarina', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1880, 24, NULL, NULL, '032', 'Santa María del Río', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1881, 24, NULL, NULL, '033', 'Santo Domingo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1882, 24, NULL, NULL, '034', 'San Vicente Tancuayalab', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1883, 24, NULL, NULL, '035', 'Soledad de Graciano Sánchez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1884, 24, NULL, NULL, '036', 'Tamasopo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1885, 24, NULL, NULL, '037', 'Tamazunchale', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1886, 24, NULL, NULL, '038', 'Tampacán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1887, 24, NULL, NULL, '039', 'Tampamolón Corona', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1888, 24, NULL, NULL, '040', 'Tamuín', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1889, 24, NULL, NULL, '041', 'Tanlajás', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1890, 24, NULL, NULL, '042', 'Tanquián de Escobedo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1891, 24, NULL, NULL, '043', 'Tierra Nueva', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1892, 24, NULL, NULL, '044', 'Vanegas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1893, 24, NULL, NULL, '045', 'Venado', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1894, 24, NULL, NULL, '046', 'Villa de Arriaga', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1895, 24, NULL, NULL, '047', 'Villa de Guadalupe', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1896, 24, NULL, NULL, '048', 'Villa de la Paz', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1897, 24, NULL, NULL, '049', 'Villa de Ramos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1898, 24, NULL, NULL, '050', 'Villa de Reyes', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1899, 24, NULL, NULL, '051', 'Villa Hidalgo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1900, 24, NULL, NULL, '052', 'Villa Juárez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1901, 24, NULL, NULL, '053', 'Axtla de Terrazas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1902, 24, NULL, NULL, '054', 'Xilitla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1903, 24, NULL, NULL, '055', 'Zaragoza', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1904, 24, NULL, NULL, '056', 'Villa de Arista', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1905, 24, NULL, NULL, '057', 'Matlapa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1906, 24, NULL, NULL, '058', 'El Naranjo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1907, 25, NULL, NULL, '001', 'Ahome', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1908, 25, NULL, NULL, '002', 'Angostura', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1909, 25, NULL, NULL, '003', 'Badiraguato', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1910, 25, NULL, NULL, '004', 'Concordia', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1911, 25, NULL, NULL, '005', 'Cosalá', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1912, 25, NULL, NULL, '006', 'Culiacán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1913, 25, NULL, NULL, '007', 'Choix', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1914, 25, NULL, NULL, '008', 'Elota', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1915, 25, NULL, NULL, '009', 'Escuinapa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1916, 25, NULL, NULL, '010', 'El Fuerte', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1917, 25, NULL, NULL, '011', 'Guasave', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1918, 25, NULL, NULL, '012', 'Mazatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1919, 25, NULL, NULL, '013', 'Mocorito', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1920, 25, NULL, NULL, '014', 'Rosario', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1921, 25, NULL, NULL, '015', 'Salvador Alvarado', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1922, 25, NULL, NULL, '016', 'San Ignacio', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1923, 25, NULL, NULL, '017', 'Sinaloa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1924, 25, NULL, NULL, '018', 'Navolato', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1925, 26, NULL, NULL, '001', 'Aconchi', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1926, 26, NULL, NULL, '002', 'Agua Prieta', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1927, 26, NULL, NULL, '003', 'Alamos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1928, 26, NULL, NULL, '004', 'Altar', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1929, 26, NULL, NULL, '005', 'Arivechi', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1930, 26, NULL, NULL, '006', 'Arizpe', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1931, 26, NULL, NULL, '007', 'Atil', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1932, 26, NULL, NULL, '008', 'Bacadéhuachi', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1933, 26, NULL, NULL, '009', 'Bacanora', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1934, 26, NULL, NULL, '010', 'Bacerac', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1935, 26, NULL, NULL, '011', 'Bacoachi', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1936, 26, NULL, NULL, '012', 'Bácum', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1937, 26, NULL, NULL, '013', 'Banámichi', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1938, 26, NULL, NULL, '014', 'Baviácora', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1939, 26, NULL, NULL, '015', 'Bavispe', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1940, 26, NULL, NULL, '016', 'Benjamín Hill', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1941, 26, NULL, NULL, '017', 'Caborca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1942, 26, NULL, NULL, '018', 'Cajeme', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1943, 26, NULL, NULL, '019', 'Cananea', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1944, 26, NULL, NULL, '020', 'Carbó', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1945, 26, NULL, NULL, '021', 'La Colorada', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1946, 26, NULL, NULL, '022', 'Cucurpe', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1947, 26, NULL, NULL, '023', 'Cumpas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1948, 26, NULL, NULL, '024', 'Divisaderos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1949, 26, NULL, NULL, '025', 'Empalme', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1950, 26, NULL, NULL, '026', 'Etchojoa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1951, 26, NULL, NULL, '027', 'Fronteras', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1952, 26, NULL, NULL, '028', 'Granados', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1953, 26, NULL, NULL, '029', 'Guaymas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1954, 26, NULL, NULL, '030', 'Hermosillo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1955, 26, NULL, NULL, '031', 'Huachinera', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1956, 26, NULL, NULL, '032', 'Huásabas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1957, 26, NULL, NULL, '033', 'Huatabampo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1958, 26, NULL, NULL, '034', 'Huépac', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1959, 26, NULL, NULL, '035', 'Imuris', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1960, 26, NULL, NULL, '036', 'Magdalena', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1961, 26, NULL, NULL, '037', 'Mazatán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1962, 26, NULL, NULL, '038', 'Moctezuma', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1963, 26, NULL, NULL, '039', 'Naco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1964, 26, NULL, NULL, '040', 'Nácori Chico', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1965, 26, NULL, NULL, '041', 'Nacozari de García', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1966, 26, NULL, NULL, '042', 'Navojoa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1967, 26, NULL, NULL, '043', 'Nogales', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1968, 26, NULL, NULL, '044', 'Onavas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1969, 26, NULL, NULL, '045', 'Opodepe', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1970, 26, NULL, NULL, '046', 'Oquitoa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1971, 26, NULL, NULL, '047', 'Pitiquito', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1972, 26, NULL, NULL, '048', 'Puerto Peñasco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1973, 26, NULL, NULL, '049', 'Quiriego', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1974, 26, NULL, NULL, '050', 'Rayón', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1975, 26, NULL, NULL, '051', 'Rosario', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1976, 26, NULL, NULL, '052', 'Sahuaripa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1977, 26, NULL, NULL, '053', 'San Felipe de Jesús', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1978, 26, NULL, NULL, '054', 'San Javier', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1979, 26, NULL, NULL, '055', 'San Luis Río Colorado', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1980, 26, NULL, NULL, '056', 'San Miguel de Horcasitas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1981, 26, NULL, NULL, '057', 'San Pedro de la Cueva', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1982, 26, NULL, NULL, '058', 'Santa Ana', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1983, 26, NULL, NULL, '059', 'Santa Cruz', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1984, 26, NULL, NULL, '060', 'Sáric', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1985, 26, NULL, NULL, '061', 'Soyopa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1986, 26, NULL, NULL, '062', 'Suaqui Grande', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1987, 26, NULL, NULL, '063', 'Tepache', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1988, 26, NULL, NULL, '064', 'Trincheras', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1989, 26, NULL, NULL, '065', 'Tubutama', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1990, 26, NULL, NULL, '066', 'Ures', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1991, 26, NULL, NULL, '067', 'Villa Hidalgo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1992, 26, NULL, NULL, '068', 'Villa Pesqueira', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1993, 26, NULL, NULL, '069', 'Yécora', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1994, 26, NULL, NULL, '070', 'General Plutarco Elías Calles', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1995, 26, NULL, NULL, '071', 'Benito Juárez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1996, 26, NULL, NULL, '072', 'San Ignacio Río Muerto', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1997, 27, NULL, NULL, '001', 'Balancán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1998, 27, NULL, NULL, '002', 'Cárdenas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (1999, 27, NULL, NULL, '003', 'Centla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2000, 27, NULL, NULL, '004', 'Centro', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2001, 27, NULL, NULL, '005', 'Comalcalco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2002, 27, NULL, NULL, '006', 'Cunduacán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2003, 27, NULL, NULL, '007', 'Emiliano Zapata', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2004, 27, NULL, NULL, '008', 'Huimanguillo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2005, 27, NULL, NULL, '009', 'Jalapa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2006, 27, NULL, NULL, '010', 'Jalpa de Méndez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2007, 27, NULL, NULL, '011', 'Jonuta', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2008, 27, NULL, NULL, '012', 'Macuspana', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2009, 27, NULL, NULL, '013', 'Nacajuca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2010, 27, NULL, NULL, '014', 'Paraíso', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2011, 27, NULL, NULL, '015', 'Tacotalpa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2012, 27, NULL, NULL, '016', 'Teapa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2013, 27, NULL, NULL, '017', 'Tenosique', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2014, 28, NULL, NULL, '001', 'Abasolo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2015, 28, NULL, NULL, '002', 'Aldama', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2016, 28, NULL, NULL, '003', 'Altamira', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2017, 28, NULL, NULL, '004', 'Antiguo Morelos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2018, 28, NULL, NULL, '005', 'Burgos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2019, 28, NULL, NULL, '006', 'Bustamante', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2020, 28, NULL, NULL, '007', 'Camargo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2021, 28, NULL, NULL, '008', 'Casas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2022, 28, NULL, NULL, '009', 'Ciudad Madero', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2023, 28, NULL, NULL, '010', 'Cruillas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2024, 28, NULL, NULL, '011', 'Gómez Farías', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2025, 28, NULL, NULL, '012', 'González', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2026, 28, NULL, NULL, '013', 'Güémez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2027, 28, NULL, NULL, '014', 'Guerrero', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2028, 28, NULL, NULL, '015', 'Gustavo Díaz Ordaz', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2029, 28, NULL, NULL, '016', 'Hidalgo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2030, 28, NULL, NULL, '017', 'Jaumave', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2031, 28, NULL, NULL, '018', 'Jiménez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2032, 28, NULL, NULL, '019', 'Llera', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2033, 28, NULL, NULL, '020', 'Mainero', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2034, 28, NULL, NULL, '021', 'El Mante', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2035, 28, NULL, NULL, '022', 'Matamoros', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2036, 28, NULL, NULL, '023', 'Méndez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2037, 28, NULL, NULL, '024', 'Mier', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2038, 28, NULL, NULL, '025', 'Miguel Alemán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2039, 28, NULL, NULL, '026', 'Miquihuana', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2040, 28, NULL, NULL, '027', 'Nuevo Laredo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2041, 28, NULL, NULL, '028', 'Nuevo Morelos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2042, 28, NULL, NULL, '029', 'Ocampo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2043, 28, NULL, NULL, '030', 'Padilla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2044, 28, NULL, NULL, '031', 'Palmillas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2045, 28, NULL, NULL, '032', 'Reynosa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2046, 28, NULL, NULL, '033', 'Río Bravo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2047, 28, NULL, NULL, '034', 'San Carlos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2048, 28, NULL, NULL, '035', 'San Fernando', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2049, 28, NULL, NULL, '036', 'San Nicolás', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2050, 28, NULL, NULL, '037', 'Soto la Marina', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2051, 28, NULL, NULL, '038', 'Tampico', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2052, 28, NULL, NULL, '039', 'Tula', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2053, 28, NULL, NULL, '040', 'Valle Hermoso', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2054, 28, NULL, NULL, '041', 'Victoria', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2055, 28, NULL, NULL, '042', 'Villagrán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2056, 28, NULL, NULL, '043', 'Xicoténcatl', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2057, 29, NULL, NULL, '001', 'Amaxac de Guerrero', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2058, 29, NULL, NULL, '002', 'Apetatitlán de Antonio Carvajal', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2059, 29, NULL, NULL, '003', 'Atlangatepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2060, 29, NULL, NULL, '004', 'Atltzayanca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2061, 29, NULL, NULL, '005', 'Apizaco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2062, 29, NULL, NULL, '006', 'Calpulalpan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2063, 29, NULL, NULL, '007', 'El Carmen Tequexquitla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2064, 29, NULL, NULL, '008', 'Cuapiaxtla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2065, 29, NULL, NULL, '009', 'Cuaxomulco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2066, 29, NULL, NULL, '010', 'Chiautempan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2067, 29, NULL, NULL, '011', 'Muñoz de Domingo Arenas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2068, 29, NULL, NULL, '012', 'Españita', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2069, 29, NULL, NULL, '013', 'Huamantla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2070, 29, NULL, NULL, '014', 'Hueyotlipan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2071, 29, NULL, NULL, '015', 'Ixtacuixtla de Mariano Matamoros', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2072, 29, NULL, NULL, '016', 'Ixtenco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2073, 29, NULL, NULL, '017', 'Mazatecochco de José María Morelos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2074, 29, NULL, NULL, '018', 'Contla de Juan Cuamatzi', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2075, 29, NULL, NULL, '019', 'Tepetitla de Lardizábal', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2076, 29, NULL, NULL, '020', 'Sanctórum de Lázaro Cárdenas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2077, 29, NULL, NULL, '021', 'Nanacamilpa de Mariano Arista', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2078, 29, NULL, NULL, '022', 'Acuamanala de Miguel Hidalgo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2079, 29, NULL, NULL, '023', 'Natívitas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2080, 29, NULL, NULL, '024', 'Panotla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2081, 29, NULL, NULL, '025', 'San Pablo del Monte', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2082, 29, NULL, NULL, '026', 'Santa Cruz Tlaxcala', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2083, 29, NULL, NULL, '027', 'Tenancingo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2084, 29, NULL, NULL, '028', 'Teolocholco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2085, 29, NULL, NULL, '029', 'Tepeyanco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2086, 29, NULL, NULL, '030', 'Terrenate', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2087, 29, NULL, NULL, '031', 'Tetla de la Solidaridad', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2088, 29, NULL, NULL, '032', 'Tetlatlahuca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2089, 29, NULL, NULL, '033', 'Tlaxcala', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2090, 29, NULL, NULL, '034', 'Tlaxco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2091, 29, NULL, NULL, '035', 'Tocatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2092, 29, NULL, NULL, '036', 'Totolac', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2093, 29, NULL, NULL, '037', 'Ziltlaltépec de Trinidad Sánchez Santos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2094, 29, NULL, NULL, '038', 'Tzompantepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2095, 29, NULL, NULL, '039', 'Xaloztoc', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2096, 29, NULL, NULL, '040', 'Xaltocan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2097, 29, NULL, NULL, '041', 'Papalotla de Xicohténcatl', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2098, 29, NULL, NULL, '042', 'Xicohtzinco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2099, 29, NULL, NULL, '043', 'Yauhquemehcan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2100, 29, NULL, NULL, '044', 'Zacatelco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2101, 29, NULL, NULL, '045', 'Benito Juárez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2102, 29, NULL, NULL, '046', 'Emiliano Zapata', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2103, 29, NULL, NULL, '047', 'Lázaro Cárdenas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2104, 29, NULL, NULL, '048', 'La Magdalena Tlaltelulco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2105, 29, NULL, NULL, '049', 'San Damián Texóloc', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2106, 29, NULL, NULL, '050', 'San Francisco Tetlanohcan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2107, 29, NULL, NULL, '051', 'San Jerónimo Zacualpan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2108, 29, NULL, NULL, '052', 'San José Teacalco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2109, 29, NULL, NULL, '053', 'San Juan Huactzinco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2110, 29, NULL, NULL, '054', 'San Lorenzo Axocomanitla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2111, 29, NULL, NULL, '055', 'San Lucas Tecopilco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2112, 29, NULL, NULL, '056', 'Santa Ana Nopalucan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2113, 29, NULL, NULL, '057', 'Santa Apolonia Teacalco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2114, 29, NULL, NULL, '058', 'Santa Catarina Ayometla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2115, 29, NULL, NULL, '059', 'Santa Cruz Quilehtla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2116, 29, NULL, NULL, '060', 'Santa Isabel Xiloxoxtla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2117, 30, NULL, NULL, '001', 'Acajete', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2118, 30, NULL, NULL, '002', 'Acatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2119, 30, NULL, NULL, '003', 'Acayucan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2120, 30, NULL, NULL, '004', 'Actopan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2121, 30, NULL, NULL, '005', 'Acula', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2122, 30, NULL, NULL, '006', 'Acultzingo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2123, 30, NULL, NULL, '007', 'Camarón de Tejeda', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2124, 30, NULL, NULL, '008', 'Alpatláhuac', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2125, 30, NULL, NULL, '009', 'Alto Lucero de Gutiérrez Barrios', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2126, 30, NULL, NULL, '010', 'Altotonga', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2127, 30, NULL, NULL, '011', 'Alvarado', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2128, 30, NULL, NULL, '012', 'Amatitlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2129, 30, NULL, NULL, '013', 'Naranjos Amatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2130, 30, NULL, NULL, '014', 'Amatlán de los Reyes', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2131, 30, NULL, NULL, '015', 'Angel R. Cabada', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2132, 30, NULL, NULL, '016', 'La Antigua', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2133, 30, NULL, NULL, '017', 'Apazapan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2134, 30, NULL, NULL, '018', 'Aquila', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2135, 30, NULL, NULL, '019', 'Astacinga', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2136, 30, NULL, NULL, '020', 'Atlahuilco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2137, 30, NULL, NULL, '021', 'Atoyac', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2138, 30, NULL, NULL, '022', 'Atzacan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2139, 30, NULL, NULL, '023', 'Atzalan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2140, 30, NULL, NULL, '024', 'Tlaltetela', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2141, 30, NULL, NULL, '025', 'Ayahualulco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2142, 30, NULL, NULL, '026', 'Banderilla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2143, 30, NULL, NULL, '027', 'Benito Juárez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2144, 30, NULL, NULL, '028', 'Boca del Río', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2145, 30, NULL, NULL, '029', 'Calcahualco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2146, 30, NULL, NULL, '030', 'Camerino Z. Mendoza', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2147, 30, NULL, NULL, '031', 'Carrillo Puerto', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2148, 30, NULL, NULL, '032', 'Catemaco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2149, 30, NULL, NULL, '033', 'Cazones de Herrera', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2150, 30, NULL, NULL, '034', 'Cerro Azul', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2151, 30, NULL, NULL, '035', 'Citlaltépetl', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2152, 30, NULL, NULL, '036', 'Coacoatzintla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2153, 30, NULL, NULL, '037', 'Coahuitlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2154, 30, NULL, NULL, '038', 'Coatepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2155, 30, NULL, NULL, '039', 'Coatzacoalcos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2156, 30, NULL, NULL, '040', 'Coatzintla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2157, 30, NULL, NULL, '041', 'Coetzala', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2158, 30, NULL, NULL, '042', 'Colipa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2159, 30, NULL, NULL, '043', 'Comapa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2160, 30, NULL, NULL, '044', 'Córdoba', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2161, 30, NULL, NULL, '045', 'Cosamaloapan de Carpio', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2162, 30, NULL, NULL, '046', 'Cosautlán de Carvajal', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2163, 30, NULL, NULL, '047', 'Coscomatepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2164, 30, NULL, NULL, '048', 'Cosoleacaque', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2165, 30, NULL, NULL, '049', 'Cotaxtla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2166, 30, NULL, NULL, '050', 'Coxquihui', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2167, 30, NULL, NULL, '051', 'Coyutla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2168, 30, NULL, NULL, '052', 'Cuichapa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2169, 30, NULL, NULL, '053', 'Cuitláhuac', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2170, 30, NULL, NULL, '054', 'Chacaltianguis', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2171, 30, NULL, NULL, '055', 'Chalma', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2172, 30, NULL, NULL, '056', 'Chiconamel', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2173, 30, NULL, NULL, '057', 'Chiconquiaco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2174, 30, NULL, NULL, '058', 'Chicontepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2175, 30, NULL, NULL, '059', 'Chinameca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2176, 30, NULL, NULL, '060', 'Chinampa de Gorostiza', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2177, 30, NULL, NULL, '061', 'Las Choapas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2178, 30, NULL, NULL, '062', 'Chocamán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2179, 30, NULL, NULL, '063', 'Chontla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2180, 30, NULL, NULL, '064', 'Chumatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2181, 30, NULL, NULL, '065', 'Emiliano Zapata', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2182, 30, NULL, NULL, '066', 'Espinal', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2183, 30, NULL, NULL, '067', 'Filomeno Mata', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2184, 30, NULL, NULL, '068', 'Fortín', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2185, 30, NULL, NULL, '069', 'Gutiérrez Zamora', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2186, 30, NULL, NULL, '070', 'Hidalgotitlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2187, 30, NULL, NULL, '071', 'Huatusco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2188, 30, NULL, NULL, '072', 'Huayacocotla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2189, 30, NULL, NULL, '073', 'Hueyapan de Ocampo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2190, 30, NULL, NULL, '074', 'Huiloapan de Cuauhtémoc', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2191, 30, NULL, NULL, '075', 'Ignacio de la Llave', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2192, 30, NULL, NULL, '076', 'Ilamatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2193, 30, NULL, NULL, '077', 'Isla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2194, 30, NULL, NULL, '078', 'Ixcatepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2195, 30, NULL, NULL, '079', 'Ixhuacán de los Reyes', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2196, 30, NULL, NULL, '080', 'Ixhuatlán del Café', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2197, 30, NULL, NULL, '081', 'Ixhuatlancillo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2198, 30, NULL, NULL, '082', 'Ixhuatlán del Sureste', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2199, 30, NULL, NULL, '083', 'Ixhuatlán de Madero', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2200, 30, NULL, NULL, '084', 'Ixmatlahuacan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2201, 30, NULL, NULL, '085', 'Ixtaczoquitlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2202, 30, NULL, NULL, '086', 'Jalacingo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2203, 30, NULL, NULL, '087', 'Xalapa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2204, 30, NULL, NULL, '088', 'Jalcomulco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2205, 30, NULL, NULL, '089', 'Jáltipan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2206, 30, NULL, NULL, '090', 'Jamapa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2207, 30, NULL, NULL, '091', 'Jesús Carranza', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2208, 30, NULL, NULL, '092', 'Xico', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2209, 30, NULL, NULL, '093', 'Jilotepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2210, 30, NULL, NULL, '094', 'Juan Rodríguez Clara', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2211, 30, NULL, NULL, '095', 'Juchique de Ferrer', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2212, 30, NULL, NULL, '096', 'Landero y Coss', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2213, 30, NULL, NULL, '097', 'Lerdo de Tejada', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2214, 30, NULL, NULL, '098', 'Magdalena', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2215, 30, NULL, NULL, '099', 'Maltrata', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2216, 30, NULL, NULL, '100', 'Manlio Fabio Altamirano', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2217, 30, NULL, NULL, '101', 'Mariano Escobedo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2218, 30, NULL, NULL, '102', 'Martínez de la Torre', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2219, 30, NULL, NULL, '103', 'Mecatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2220, 30, NULL, NULL, '104', 'Mecayapan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2221, 30, NULL, NULL, '105', 'Medellín', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2222, 30, NULL, NULL, '106', 'Miahuatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2223, 30, NULL, NULL, '107', 'Las Minas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2224, 30, NULL, NULL, '108', 'Minatitlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2225, 30, NULL, NULL, '109', 'Misantla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2226, 30, NULL, NULL, '110', 'Mixtla de Altamirano', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2227, 30, NULL, NULL, '111', 'Moloacán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2228, 30, NULL, NULL, '112', 'Naolinco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2229, 30, NULL, NULL, '113', 'Naranjal', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2230, 30, NULL, NULL, '114', 'Nautla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2231, 30, NULL, NULL, '115', 'Nogales', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2232, 30, NULL, NULL, '116', 'Oluta', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2233, 30, NULL, NULL, '117', 'Omealca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2234, 30, NULL, NULL, '118', 'Orizaba', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2235, 30, NULL, NULL, '119', 'Otatitlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2236, 30, NULL, NULL, '120', 'Oteapan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2237, 30, NULL, NULL, '121', 'Ozuluama de Mascareñas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2238, 30, NULL, NULL, '122', 'Pajapan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2239, 30, NULL, NULL, '123', 'Pánuco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2240, 30, NULL, NULL, '124', 'Papantla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2241, 30, NULL, NULL, '125', 'Paso del Macho', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2242, 30, NULL, NULL, '126', 'Paso de Ovejas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2243, 30, NULL, NULL, '127', 'La Perla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2244, 30, NULL, NULL, '128', 'Perote', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2245, 30, NULL, NULL, '129', 'Platón Sánchez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2246, 30, NULL, NULL, '130', 'Playa Vicente', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2247, 30, NULL, NULL, '131', 'Poza Rica de Hidalgo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2248, 30, NULL, NULL, '132', 'Las Vigas de Ramírez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2249, 30, NULL, NULL, '133', 'Pueblo Viejo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2250, 30, NULL, NULL, '134', 'Puente Nacional', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2251, 30, NULL, NULL, '135', 'Rafael Delgado', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2252, 30, NULL, NULL, '136', 'Rafael Lucio', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2253, 30, NULL, NULL, '137', 'Los Reyes', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2254, 30, NULL, NULL, '138', 'Río Blanco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2255, 30, NULL, NULL, '139', 'Saltabarranca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2256, 30, NULL, NULL, '140', 'San Andrés Tenejapan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2257, 30, NULL, NULL, '141', 'San Andrés Tuxtla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2258, 30, NULL, NULL, '142', 'San Juan Evangelista', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2259, 30, NULL, NULL, '143', 'Santiago Tuxtla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2260, 30, NULL, NULL, '144', 'Sayula de Alemán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2261, 30, NULL, NULL, '145', 'Soconusco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2262, 30, NULL, NULL, '146', 'Sochiapa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2263, 30, NULL, NULL, '147', 'Soledad Atzompa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2264, 30, NULL, NULL, '148', 'Soledad de Doblado', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2265, 30, NULL, NULL, '149', 'Soteapan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2266, 30, NULL, NULL, '150', 'Tamalín', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2267, 30, NULL, NULL, '151', 'Tamiahua', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2268, 30, NULL, NULL, '152', 'Tampico Alto', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2269, 30, NULL, NULL, '153', 'Tancoco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2270, 30, NULL, NULL, '154', 'Tantima', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2271, 30, NULL, NULL, '155', 'Tantoyuca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2272, 30, NULL, NULL, '156', 'Tatatila', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2273, 30, NULL, NULL, '157', 'Castillo de Teayo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2274, 30, NULL, NULL, '158', 'Tecolutla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2275, 30, NULL, NULL, '159', 'Tehuipango', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2276, 30, NULL, NULL, '160', 'Álamo Temapache', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2277, 30, NULL, NULL, '161', 'Tempoal', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2278, 30, NULL, NULL, '162', 'Tenampa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2279, 30, NULL, NULL, '163', 'Tenochtitlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2280, 30, NULL, NULL, '164', 'Teocelo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2281, 30, NULL, NULL, '165', 'Tepatlaxco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2282, 30, NULL, NULL, '166', 'Tepetlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2283, 30, NULL, NULL, '167', 'Tepetzintla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2284, 30, NULL, NULL, '168', 'Tequila', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2285, 30, NULL, NULL, '169', 'José Azueta', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2286, 30, NULL, NULL, '170', 'Texcatepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2287, 30, NULL, NULL, '171', 'Texhuacán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2288, 30, NULL, NULL, '172', 'Texistepec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2289, 30, NULL, NULL, '173', 'Tezonapa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2290, 30, NULL, NULL, '174', 'Tierra Blanca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2291, 30, NULL, NULL, '175', 'Tihuatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2292, 30, NULL, NULL, '176', 'Tlacojalpan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2293, 30, NULL, NULL, '177', 'Tlacolulan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2294, 30, NULL, NULL, '178', 'Tlacotalpan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2295, 30, NULL, NULL, '179', 'Tlacotepec de Mejía', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2296, 30, NULL, NULL, '180', 'Tlachichilco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2297, 30, NULL, NULL, '181', 'Tlalixcoyan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2298, 30, NULL, NULL, '182', 'Tlalnelhuayocan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2299, 30, NULL, NULL, '183', 'Tlapacoyan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2300, 30, NULL, NULL, '184', 'Tlaquilpa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2301, 30, NULL, NULL, '185', 'Tlilapan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2302, 30, NULL, NULL, '186', 'Tomatlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2303, 30, NULL, NULL, '187', 'Tonayán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2304, 30, NULL, NULL, '188', 'Totutla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2305, 30, NULL, NULL, '189', 'Tuxpan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2306, 30, NULL, NULL, '190', 'Tuxtilla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2307, 30, NULL, NULL, '191', 'Ursulo Galván', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2308, 30, NULL, NULL, '192', 'Vega de Alatorre', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2309, 30, NULL, NULL, '193', 'Veracruz', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2310, 30, NULL, NULL, '194', 'Villa Aldama', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2311, 30, NULL, NULL, '195', 'Xoxocotla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2312, 30, NULL, NULL, '196', 'Yanga', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2313, 30, NULL, NULL, '197', 'Yecuatla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2314, 30, NULL, NULL, '198', 'Zacualpan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2315, 30, NULL, NULL, '199', 'Zaragoza', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2316, 30, NULL, NULL, '200', 'Zentla', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2317, 30, NULL, NULL, '201', 'Zongolica', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2318, 30, NULL, NULL, '202', 'Zontecomatlán de López y Fuentes', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2319, 30, NULL, NULL, '203', 'Zozocolco de Hidalgo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2320, 30, NULL, NULL, '204', 'Agua Dulce', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2321, 30, NULL, NULL, '205', 'El Higo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2322, 30, NULL, NULL, '206', 'Nanchital de Lázaro Cárdenas del Río', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2323, 30, NULL, NULL, '207', 'Tres Valles', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2324, 30, NULL, NULL, '208', 'Carlos A. Carrillo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2325, 30, NULL, NULL, '209', 'Tatahuicapan de Juárez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2326, 30, NULL, NULL, '210', 'Uxpanapa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2327, 30, NULL, NULL, '211', 'San Rafael', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2328, 30, NULL, NULL, '212', 'Santiago Sochiapan', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2329, 31, NULL, NULL, '001', 'Abalá', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2330, 31, NULL, NULL, '002', 'Acanceh', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2331, 31, NULL, NULL, '003', 'Akil', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2332, 31, NULL, NULL, '004', 'Baca', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2333, 31, NULL, NULL, '005', 'Bokobá', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2334, 31, NULL, NULL, '006', 'Buctzotz', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2335, 31, NULL, NULL, '007', 'Cacalchén', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2336, 31, NULL, NULL, '008', 'Calotmul', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2337, 31, NULL, NULL, '009', 'Cansahcab', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2338, 31, NULL, NULL, '010', 'Cantamayec', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2339, 31, NULL, NULL, '011', 'Celestún', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2340, 31, NULL, NULL, '012', 'Cenotillo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2341, 31, NULL, NULL, '013', 'Conkal', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2342, 31, NULL, NULL, '014', 'Cuncunul', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2343, 31, NULL, NULL, '015', 'Cuzamá', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2344, 31, NULL, NULL, '016', 'Chacsinkín', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2345, 31, NULL, NULL, '017', 'Chankom', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2346, 31, NULL, NULL, '018', 'Chapab', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2347, 31, NULL, NULL, '019', 'Chemax', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2348, 31, NULL, NULL, '020', 'Chicxulub Pueblo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2349, 31, NULL, NULL, '021', 'Chichimilá', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2350, 31, NULL, NULL, '022', 'Chikindzonot', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2351, 31, NULL, NULL, '023', 'Chocholá', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2352, 31, NULL, NULL, '024', 'Chumayel', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2353, 31, NULL, NULL, '025', 'Dzán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2354, 31, NULL, NULL, '026', 'Dzemul', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2355, 31, NULL, NULL, '027', 'Dzidzantún', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2356, 31, NULL, NULL, '028', 'Dzilam de Bravo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2357, 31, NULL, NULL, '029', 'Dzilam González', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2358, 31, NULL, NULL, '030', 'Dzitás', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2359, 31, NULL, NULL, '031', 'Dzoncauich', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2360, 31, NULL, NULL, '032', 'Espita', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2361, 31, NULL, NULL, '033', 'Halachó', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2362, 31, NULL, NULL, '034', 'Hocabá', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2363, 31, NULL, NULL, '035', 'Hoctún', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2364, 31, NULL, NULL, '036', 'Homún', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2365, 31, NULL, NULL, '037', 'Huhí', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2366, 31, NULL, NULL, '038', 'Hunucmá', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2367, 31, NULL, NULL, '039', 'Ixil', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2368, 31, NULL, NULL, '040', 'Izamal', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2369, 31, NULL, NULL, '041', 'Kanasín', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2370, 31, NULL, NULL, '042', 'Kantunil', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2371, 31, NULL, NULL, '043', 'Kaua', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2372, 31, NULL, NULL, '044', 'Kinchil', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2373, 31, NULL, NULL, '045', 'Kopomá', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2374, 31, NULL, NULL, '046', 'Mama', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2375, 31, NULL, NULL, '047', 'Maní', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2376, 31, NULL, NULL, '048', 'Maxcanú', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2377, 31, NULL, NULL, '049', 'Mayapán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2378, 31, NULL, NULL, '050', 'Mérida', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2379, 31, NULL, NULL, '051', 'Mocochá', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2380, 31, NULL, NULL, '052', 'Motul', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2381, 31, NULL, NULL, '053', 'Muna', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2382, 31, NULL, NULL, '054', 'Muxupip', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2383, 31, NULL, NULL, '055', 'Opichén', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2384, 31, NULL, NULL, '056', 'Oxkutzcab', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2385, 31, NULL, NULL, '057', 'Panabá', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2386, 31, NULL, NULL, '058', 'Peto', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2387, 31, NULL, NULL, '059', 'Progreso', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2388, 31, NULL, NULL, '060', 'Quintana Roo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2389, 31, NULL, NULL, '061', 'Río Lagartos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2390, 31, NULL, NULL, '062', 'Sacalum', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2391, 31, NULL, NULL, '063', 'Samahil', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2392, 31, NULL, NULL, '064', 'Sanahcat', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2393, 31, NULL, NULL, '065', 'San Felipe', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2394, 31, NULL, NULL, '066', 'Santa Elena', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2395, 31, NULL, NULL, '067', 'Seyé', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2396, 31, NULL, NULL, '068', 'Sinanché', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2397, 31, NULL, NULL, '069', 'Sotuta', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2398, 31, NULL, NULL, '070', 'Sucilá', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2399, 31, NULL, NULL, '071', 'Sudzal', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2400, 31, NULL, NULL, '072', 'Suma', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2401, 31, NULL, NULL, '073', 'Tahdziú', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2402, 31, NULL, NULL, '074', 'Tahmek', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2403, 31, NULL, NULL, '075', 'Teabo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2404, 31, NULL, NULL, '076', 'Tecoh', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2405, 31, NULL, NULL, '077', 'Tekal de Venegas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2406, 31, NULL, NULL, '078', 'Tekantó', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2407, 31, NULL, NULL, '079', 'Tekax', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2408, 31, NULL, NULL, '080', 'Tekit', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2409, 31, NULL, NULL, '081', 'Tekom', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2410, 31, NULL, NULL, '082', 'Telchac Pueblo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2411, 31, NULL, NULL, '083', 'Telchac Puerto', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2412, 31, NULL, NULL, '084', 'Temax', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2413, 31, NULL, NULL, '085', 'Temozón', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2414, 31, NULL, NULL, '086', 'Tepakán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2415, 31, NULL, NULL, '087', 'Tetiz', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2416, 31, NULL, NULL, '088', 'Teya', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2417, 31, NULL, NULL, '089', 'Ticul', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2418, 31, NULL, NULL, '090', 'Timucuy', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2419, 31, NULL, NULL, '091', 'Tinum', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2420, 31, NULL, NULL, '092', 'Tixcacalcupul', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2421, 31, NULL, NULL, '093', 'Tixkokob', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2422, 31, NULL, NULL, '094', 'Tixmehuac', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2423, 31, NULL, NULL, '095', 'Tixpéhual', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2424, 31, NULL, NULL, '096', 'Tizimín', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2425, 31, NULL, NULL, '097', 'Tunkás', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2426, 31, NULL, NULL, '098', 'Tzucacab', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2427, 31, NULL, NULL, '099', 'Uayma', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2428, 31, NULL, NULL, '100', 'Ucú', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2429, 31, NULL, NULL, '101', 'Umán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2430, 31, NULL, NULL, '102', 'Valladolid', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2431, 31, NULL, NULL, '103', 'Xocchel', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2432, 31, NULL, NULL, '104', 'Yaxcabá', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2433, 31, NULL, NULL, '105', 'Yaxkukul', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2434, 31, NULL, NULL, '106', 'Yobaín', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2435, 32, NULL, NULL, '001', 'Apozol', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2436, 32, NULL, NULL, '002', 'Apulco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2437, 32, NULL, NULL, '003', 'Atolinga', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2438, 32, NULL, NULL, '004', 'Benito Juárez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2439, 32, NULL, NULL, '005', 'Calera', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2440, 32, NULL, NULL, '006', 'Cañitas de Felipe Pescador', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2441, 32, NULL, NULL, '007', 'Concepción del Oro', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2442, 32, NULL, NULL, '008', 'Cuauhtémoc', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2443, 32, NULL, NULL, '009', 'Chalchihuites', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2444, 32, NULL, NULL, '010', 'Fresnillo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2445, 32, NULL, NULL, '011', 'Trinidad García de la Cadena', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2446, 32, NULL, NULL, '012', 'Genaro Codina', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2447, 32, NULL, NULL, '013', 'General Enrique Estrada', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2448, 32, NULL, NULL, '014', 'General Francisco R. Murguía', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2449, 32, NULL, NULL, '015', 'El Plateado de Joaquín Amaro', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2450, 32, NULL, NULL, '016', 'General Pánfilo Natera', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2451, 32, NULL, NULL, '017', 'Guadalupe', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2452, 32, NULL, NULL, '018', 'Huanusco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2453, 32, NULL, NULL, '019', 'Jalpa', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2454, 32, NULL, NULL, '020', 'Jerez', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2455, 32, NULL, NULL, '021', 'Jiménez del Teul', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2456, 32, NULL, NULL, '022', 'Juan Aldama', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2457, 32, NULL, NULL, '023', 'Juchipila', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2458, 32, NULL, NULL, '024', 'Loreto', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2459, 32, NULL, NULL, '025', 'Luis Moya', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2460, 32, NULL, NULL, '026', 'Mazapil', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2461, 32, NULL, NULL, '027', 'Melchor Ocampo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2462, 32, NULL, NULL, '028', 'Mezquital del Oro', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2463, 32, NULL, NULL, '029', 'Miguel Auza', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2464, 32, NULL, NULL, '030', 'Momax', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2465, 32, NULL, NULL, '031', 'Monte Escobedo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2466, 32, NULL, NULL, '032', 'Morelos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2467, 32, NULL, NULL, '033', 'Moyahua de Estrada', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2468, 32, NULL, NULL, '034', 'Nochistlán de Mejía', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2469, 32, NULL, NULL, '035', 'Noria de Ángeles', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2470, 32, NULL, NULL, '036', 'Ojocaliente', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2471, 32, NULL, NULL, '037', 'Pánuco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2472, 32, NULL, NULL, '038', 'Pinos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2473, 32, NULL, NULL, '039', 'Río Grande', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2474, 32, NULL, NULL, '040', 'Sain Alto', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2475, 32, NULL, NULL, '041', 'El Salvador', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2476, 32, NULL, NULL, '042', 'Sombrerete', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2477, 32, NULL, NULL, '043', 'Susticacán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2478, 32, NULL, NULL, '044', 'Tabasco', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2479, 32, NULL, NULL, '045', 'Tepechitlán', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2480, 32, NULL, NULL, '046', 'Tepetongo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2481, 32, NULL, NULL, '047', 'Teúl de González Ortega', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2482, 32, NULL, NULL, '048', 'Tlaltenango de Sánchez Román', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2483, 32, NULL, NULL, '049', 'Valparaíso', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2484, 32, NULL, NULL, '050', 'Vetagrande', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2485, 32, NULL, NULL, '051', 'Villa de Cos', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2486, 32, NULL, NULL, '052', 'Villa García', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2487, 32, NULL, NULL, '053', 'Villa González Ortega', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2488, 32, NULL, NULL, '054', 'Villa Hidalgo', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2489, 32, NULL, NULL, '055', 'Villanueva', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2490, 32, NULL, NULL, '056', 'Zacatecas', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2491, 32, NULL, NULL, '057', 'Trancoso', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2492, 32, NULL, NULL, '058', 'Santa María de la Paz', '', '2015-05-18 00:00:00', '2015-05-18 17:55:06', NULL);
INSERT INTO `c_municipios` VALUES (2493, 7, 3, 1, '122', 'Mezcalapa', '', '2019-08-26 11:03:00', '2022-07-13 18:30:10', NULL);

-- ----------------------------
-- Table structure for c_regiones
-- ----------------------------
DROP TABLE IF EXISTS `c_regiones`;
CREATE TABLE `c_regiones`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clave` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Tabla de regiones' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of c_regiones
-- ----------------------------
INSERT INTO `c_regiones` VALUES (1, 'I', 'Metropolitana ', NULL, '2022-06-02 12:18:23', NULL);
INSERT INTO `c_regiones` VALUES (2, 'II', 'Valles Zoque', NULL, '2022-06-02 12:18:36', NULL);
INSERT INTO `c_regiones` VALUES (3, 'III', 'Mezcalapa', NULL, '2022-06-02 12:18:47', NULL);
INSERT INTO `c_regiones` VALUES (4, 'IV', 'De los llanos', NULL, '2022-06-02 12:18:56', NULL);
INSERT INTO `c_regiones` VALUES (5, 'V', 'Altos Tsotsil-Tseltal', NULL, '2022-06-02 12:19:05', NULL);
INSERT INTO `c_regiones` VALUES (6, 'VI', 'Frailesca', NULL, '2022-06-02 12:19:19', NULL);
INSERT INTO `c_regiones` VALUES (7, 'VII', 'De los Bosques', NULL, '2022-06-02 12:19:28', NULL);
INSERT INTO `c_regiones` VALUES (8, 'VIII', 'Norte', NULL, '2022-06-02 12:20:33', NULL);
INSERT INTO `c_regiones` VALUES (9, 'IX', 'Istmo Costa', NULL, '2022-06-02 12:20:46', NULL);
INSERT INTO `c_regiones` VALUES (10, 'X', 'Soconusco', NULL, '2022-06-02 12:20:53', NULL);
INSERT INTO `c_regiones` VALUES (11, 'XI', 'Sierra Mariscal', NULL, '2022-06-02 12:21:03', NULL);
INSERT INTO `c_regiones` VALUES (12, 'XII', 'Selva Lacandona', NULL, '2022-06-02 12:21:19', NULL);
INSERT INTO `c_regiones` VALUES (13, 'XIII', 'Maya', NULL, '2022-06-02 12:21:28', NULL);
INSERT INTO `c_regiones` VALUES (14, 'XIV', 'Tulijá Tseltal Chol', NULL, '2022-06-02 12:21:37', NULL);
INSERT INTO `c_regiones` VALUES (15, 'XV', 'Meseta Comiteca Tojolabal', NULL, '2022-06-02 12:21:47', NULL);

-- ----------------------------
-- Table structure for c_status
-- ----------------------------
DROP TABLE IF EXISTS `c_status`;
CREATE TABLE `c_status`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `color` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of c_status
-- ----------------------------
INSERT INTO `c_status` VALUES (1, 'Iniciado', 'grey', NULL, '2021-01-19 11:18:15', NULL);
INSERT INTO `c_status` VALUES (2, 'Proceso', 'warning', NULL, '2023-08-11 13:34:32', NULL);
INSERT INTO `c_status` VALUES (3, 'Finalizado', 'success', NULL, '2021-01-19 11:44:26', NULL);
INSERT INTO `c_status` VALUES (4, 'Rechazado', 'danger', NULL, '2021-05-05 13:37:22', NULL);
INSERT INTO `c_status` VALUES (5, 'revision-solventacion', 'dark-arb', NULL, '2023-08-16 17:09:10', '2023-08-11 13:16:12');
INSERT INTO `c_status` VALUES (6, 'Area tecnica', 'pink', NULL, '2023-08-11 13:16:18', '2023-08-11 13:16:16');
INSERT INTO `c_status` VALUES (7, 'Negado', 'danger', NULL, '2023-08-11 13:16:33', NULL);
INSERT INTO `c_status` VALUES (8, 'observado', 'dark-arb', NULL, '2023-08-11 13:31:52', NULL);
INSERT INTO `c_status` VALUES (9, 'solventado', 'info', NULL, '2023-08-11 13:16:51', NULL);
INSERT INTO `c_status` VALUES (10, 'Aceptado', 'success', NULL, '2023-08-21 10:22:22', NULL);

-- ----------------------------
-- Table structure for c_tipo_persona
-- ----------------------------
DROP TABLE IF EXISTS `c_tipo_persona`;
CREATE TABLE `c_tipo_persona`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of c_tipo_persona
-- ----------------------------
INSERT INTO `c_tipo_persona` VALUES (1, 'Física', NULL, '2021-01-06 15:58:08', NULL);
INSERT INTO `c_tipo_persona` VALUES (2, 'Moral', NULL, '2021-01-06 15:51:14', NULL);

-- ----------------------------
-- Table structure for c_tipo_tramite
-- ----------------------------
DROP TABLE IF EXISTS `c_tipo_tramite`;
CREATE TABLE `c_tipo_tramite`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clave` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of c_tipo_tramite
-- ----------------------------
INSERT INTO `c_tipo_tramite` VALUES (1, 'CMHA', 'Constancia de Manejo Higiénico de Alimentos', NULL, '2022-03-17 11:14:23', NULL);
INSERT INTO `c_tipo_tramite` VALUES (2, 'SH', 'Servicios Hospitalarios', NULL, '2023-09-20 10:56:55', NULL);

-- ----------------------------
-- Table structure for d_domicilios
-- ----------------------------
DROP TABLE IF EXISTS `d_domicilios`;
CREATE TABLE `d_domicilios`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_municipio` int(11) NOT NULL,
  `codigo_postal` int(11) NULL DEFAULT NULL,
  `calle` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `num_exterior` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `num_interior` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `colonia` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `entre_calle` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `y_calle` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `referencias` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `telefono` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of d_domicilios
-- ----------------------------
INSERT INTO `d_domicilios` VALUES (1, 141, 29140, '7a Sur Ote', '125', '0', 'Centro', '6ta ote', '7a Ote', NULL, NULL, '2024-02-20 09:56:21', '2024-02-20 09:56:21', NULL);

-- ----------------------------
-- Table structure for d_personales
-- ----------------------------
DROP TABLE IF EXISTS `d_personales`;
CREATE TABLE `d_personales`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_d_domicilio` int(11) NULL DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ap_paterno` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ap_materno` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `curp` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rfc` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sexo` tinyint(1) NOT NULL,
  `telefono` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `correo_electronico` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_domicilio`(`id_d_domicilio` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of d_personales
-- ----------------------------
INSERT INTO `d_personales` VALUES (1, 1, 'ADRIAN', 'RODRIGUEZ', 'BAUTISTA', 'RXBA860303HCSDTD04', 'ROBA860303KS2', 1, '9613349399', 'arodriguezb8603@gmail.com', '2024-02-20 09:56:21', '2024-02-20 09:56:21', NULL);
INSERT INTO `d_personales` VALUES (2, NULL, 'ZULEIMA GABRIELA', 'ORDOñEZ', 'ALANIS', 'OOAZ900824MTSRLL08', '', 0, '', '', '2024-02-20 11:23:07', '2024-02-20 11:23:07', NULL);

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `queue` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (11, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (12, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (13, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (14, '2020_05_31_214136_create_roles_table', 1);
INSERT INTO `migrations` VALUES (15, '2020_05_31_214309_create_role_user_table', 1);

-- ----------------------------
-- Table structure for p_examen_contestaron
-- ----------------------------
DROP TABLE IF EXISTS `p_examen_contestaron`;
CREATE TABLE `p_examen_contestaron`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tramite` int(11) NULL DEFAULT NULL,
  `id_registro` int(11) NOT NULL,
  `aprobado` int(11) NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of p_examen_contestaron
-- ----------------------------
INSERT INTO `p_examen_contestaron` VALUES (1, NULL, 2, 0, '2024-02-20 12:13:24', '2024-02-20 12:13:31', '2024-02-20 12:13:31');
INSERT INTO `p_examen_contestaron` VALUES (2, NULL, 2, 0, '2024-02-20 12:14:32', '2024-02-20 12:14:37', '2024-02-20 12:14:37');
INSERT INTO `p_examen_contestaron` VALUES (3, 1, 2, 1, '2024-02-20 12:15:26', '2024-02-20 12:17:20', NULL);
INSERT INTO `p_examen_contestaron` VALUES (4, 2, 1, 1, '2024-02-21 10:52:34', '2024-02-21 10:52:57', NULL);

-- ----------------------------
-- Table structure for p_respuesta
-- ----------------------------
DROP TABLE IF EXISTS `p_respuesta`;
CREATE TABLE `p_respuesta`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_examen_contestaron` int(11) NULL DEFAULT NULL,
  `id_pregunta` int(11) NULL DEFAULT NULL,
  `fldcorrecta` tinyint(4) NULL DEFAULT 0,
  `fldrespuesta` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldespecifique` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of p_respuesta
-- ----------------------------
INSERT INTO `p_respuesta` VALUES (1, 1, 22, 1, 'b', 'Se debe inspeccionar y clasificar las materias primas en insumos antes de la producción o elaboración del producto', '2024-02-20 12:13:24', '2024-02-20 12:13:31', '2024-02-20 12:13:31');
INSERT INTO `p_respuesta` VALUES (2, 1, 40, 1, 'c', 'Deben mantenerse limpios y desinfectados', '2024-02-20 12:13:24', '2024-02-20 12:13:31', '2024-02-20 12:13:31');
INSERT INTO `p_respuesta` VALUES (3, 1, 26, 0, 'c', 'El protocolo de ingreso para el establecimiento en horarios de entrada y salida', '2024-02-20 12:13:24', '2024-02-20 12:13:31', '2024-02-20 12:13:31');
INSERT INTO `p_respuesta` VALUES (4, 1, 16, 1, 'a', 'Debe mantenerse una escrupulosa limpieza e higiene de las salidas de Aire y extractores , así como una periódica limpieza de los ventiladores', '2024-02-20 12:13:24', '2024-02-20 12:13:31', '2024-02-20 12:13:31');
INSERT INTO `p_respuesta` VALUES (5, 1, 50, 0, 'c', 'Cuando no cuente con sus herramientas de trabajo para realizar las actividades encomendadas por su jefe inmediato', '2024-02-20 12:13:24', '2024-02-20 12:13:31', '2024-02-20 12:13:31');
INSERT INTO `p_respuesta` VALUES (6, 2, 11, 1, 'a', 'Deben estar en buen estado, sin fugaz o roturas e identificado correctamente', '2024-02-20 12:14:32', '2024-02-20 12:14:37', '2024-02-20 12:14:37');
INSERT INTO `p_respuesta` VALUES (7, 2, 6, 1, 'a', 'Para evitar el ingreso de polvo, riesgo de contaminación y el acceso de Fauna nociva aérea o terrestre', '2024-02-20 12:14:32', '2024-02-20 12:14:37', '2024-02-20 12:14:37');
INSERT INTO `p_respuesta` VALUES (8, 2, 9, 0, 'b', 'Si, se necesita para tener un control en la cocción de los alimentos', '2024-02-20 12:14:32', '2024-02-20 12:14:37', '2024-02-20 12:14:37');
INSERT INTO `p_respuesta` VALUES (9, 2, 44, 0, 'a', 'Limpios, desinfectados, ordenados y clorados', '2024-02-20 12:14:32', '2024-02-20 12:14:37', '2024-02-20 12:14:37');
INSERT INTO `p_respuesta` VALUES (10, 2, 45, 1, 'a', 'Debe contar con licencia sanitaria, dejando constancia de fumigación ', '2024-02-20 12:14:32', '2024-02-20 12:14:37', '2024-02-20 12:14:37');
INSERT INTO `p_respuesta` VALUES (11, 3, 24, 1, 'b', 'Debe almacenarse en recipientes o envases limpios, inocuos, libre de fauna nociva.', '2024-02-20 12:15:26', '2024-02-20 12:15:26', NULL);
INSERT INTO `p_respuesta` VALUES (12, 3, 33, 0, 'b', 'Son los fabricados en procesos industriales y que deben ser gestionados de una forma especial, por su peligrosidad, su toxicidad o su grado de concentración', '2024-02-20 12:15:26', '2024-02-20 12:15:26', NULL);
INSERT INTO `p_respuesta` VALUES (13, 3, 18, 1, 'a', 'Estos deben ser con protección para evitar al momento de un estallamiento la contaminación de los alimentos', '2024-02-20 12:15:26', '2024-02-20 12:15:26', NULL);
INSERT INTO `p_respuesta` VALUES (14, 3, 27, 1, 'b', 'Se debe usar de acuerdo con las indicaciones o especificaciones del fabricante, poniendo especial atención a lo establecido en la ficha técnica o instrucciones de uso', '2024-02-20 12:15:26', '2024-02-20 12:15:26', NULL);
INSERT INTO `p_respuesta` VALUES (15, 3, 14, 1, 'a', 'Se debe evitar el calor y condensación excesiva, así como la acumulación', '2024-02-20 12:15:26', '2024-02-20 12:15:26', NULL);
INSERT INTO `p_respuesta` VALUES (16, 4, 36, 1, 'a', 'Debe evitar el uso de aretes, relojes, pulseras, anillos, y cualquier tipo de joyería y bisutería que sea un riesgo de contaminación de alimentos', '2024-02-21 10:52:34', '2024-02-21 10:52:34', NULL);
INSERT INTO `p_respuesta` VALUES (17, 4, 48, 0, 'b', '5 pastillas por cada 1000 litros de agua todo de pende de la capacidad de almacenamiento de agua puede ser cisterna, tinaco, tanque etc.', '2024-02-21 10:52:34', '2024-02-21 10:52:34', NULL);
INSERT INTO `p_respuesta` VALUES (18, 4, 19, 1, 'b', 'Adecuadas al tipo de materia prima y bebidas, para su adecuada conservación que favorezca su adecuada manipulación', '2024-02-21 10:52:34', '2024-02-21 10:52:34', NULL);
INSERT INTO `p_respuesta` VALUES (19, 4, 14, 1, 'a', 'Se debe evitar el calor y condensación excesiva, así como la acumulación', '2024-02-21 10:52:34', '2024-02-21 10:52:34', NULL);
INSERT INTO `p_respuesta` VALUES (20, 4, 39, 1, 'a', 'Deben de permanecer libres de basura, residuos y fauna nociva', '2024-02-21 10:52:34', '2024-02-21 10:52:34', NULL);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`(191) ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for role_user
-- ----------------------------
DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3707 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of role_user
-- ----------------------------
INSERT INTO `role_user` VALUES (1, 1, 1, NULL, NULL, NULL);
INSERT INTO `role_user` VALUES (3690, 4, 3691, NULL, NULL, NULL);
INSERT INTO `role_user` VALUES (3704, 6, 3705, '2023-09-22 16:34:54', '2023-09-22 16:34:54', NULL);
INSERT INTO `role_user` VALUES (3705, 2, 3706, '2023-09-28 15:55:07', '2023-09-28 15:55:07', NULL);
INSERT INTO `role_user` VALUES (3706, 2, 3707, '2024-02-20 09:56:21', '2024-02-20 09:56:21', NULL);
INSERT INTO `role_user` VALUES (3707, 6, 3708, '2024-02-20 11:23:07', '2024-02-20 11:23:07', NULL);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'admin', 'Administrator', '2020-05-31 21:47:46', '2020-05-31 21:47:46', NULL);
INSERT INTO `roles` VALUES (2, 'usuario', 'Usuario', '2020-05-31 21:47:46', '2021-01-04 15:14:16', NULL);
INSERT INTO `roles` VALUES (3, 'revisor', 'Revisor', '2021-01-19 10:40:49', '2021-01-19 10:40:49', NULL);
INSERT INTO `roles` VALUES (4, 'ventanilla', 'Responsable de Ventanilla', '2021-07-22 12:36:17', '2021-07-22 12:36:17', NULL);
INSERT INTO `roles` VALUES (5, 'tecnica', 'Responsable del area tecnica', '2021-09-23 13:40:42', '2021-09-23 13:40:42', NULL);
INSERT INTO `roles` VALUES (6, 'hospital', 'Usuario para hospital', '2023-09-20 13:40:18', '2023-09-20 13:40:18', NULL);

-- ----------------------------
-- Table structure for t_preguntas
-- ----------------------------
DROP TABLE IF EXISTS `t_preguntas`;
CREATE TABLE `t_preguntas`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_tramite` int(11) NULL DEFAULT NULL,
  `fldpregunta` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldrespuesta` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldopc_a` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldopc_b` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldopc_c` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldtexto_arriba` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldtexto_abajo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldactiva` int(11) NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_preguntas
-- ----------------------------
INSERT INTO `t_preguntas` VALUES (1, 1, '¿Cuál es la norma que especifica las condiciones que deben de cumplir los establecimientos y las personas que manipulan alimentos y bebidas?', 'a', 'Nom-251- ssa1-2009 ', 'Nom- 321-ssa2-2009   ', 'Nom-521- ssa1- 2009', NULL, NULL, 1, '2021-03-31 12:58:01', '2021-03-31 12:58:01', NULL);
INSERT INTO `t_preguntas` VALUES (2, 1, 'Define la palabra proceso', 'b', 'Es un conjunto de acciones que tienen que realizarse todas igualmente, para obtener los mismos resultados bajo las mismas circunstancias', 'Conjunto de actividades relativas a la obtención, elaboración, fabricación, preparación, conservación, mezclado, acondicionamiento, embazado, manipulación, transporte, distribución, almacenamiento, expendio o suministro al público', 'Es utilizado para idear y ordenar las acciones necesarias para realizar un proyecto', NULL, NULL, 1, '2021-03-31 13:35:58', '2021-03-31 13:35:58', NULL);
INSERT INTO `t_preguntas` VALUES (3, 1, 'Define la palabra riesgo', 'b', 'Poner en peligro o exponer a un riesgo', 'Probabilidad de la ocurrencia de un evento adverso a la salud derivado de factores', 'Poner algo de forma que pueda ser visto por los demás como una acción de defensa', NULL, NULL, 1, '2021-03-31 13:41:23', '2021-03-31 13:41:23', NULL);
INSERT INTO `t_preguntas` VALUES (4, 1, 'Menciona cuales son las fases del proceso de alimentos de acuerdo con el artículo 197 de la Ley General de Salud', 'a', 'Obtención, Elaboración, Fabricación, Preparación, conservación, Mezclado, Acondicionamiento, envasado, manipulación, transporte, distribución, almacenamiento y suministro al público', 'Recibimiento, elaboración,  preparación, presentación y degustación', 'Planeacion, elaboración, empacado, etiquetado y presentación', NULL, NULL, 1, '2021-03-31 13:42:19', '2021-03-31 13:42:19', NULL);
INSERT INTO `t_preguntas` VALUES (5, 1, '¿Qué debemos evitar en los pisos paredes y techos?', 'b', 'Salidas de emergencia, ruta de evacuación, uso obligatorio de guantes, prohibido utilizar agua en caso de incendio', 'Debemos evitar la presencia de grietas o roturas, humedad, así como la falta de higiene pues favorece la presencia de fauna nociva y es indicativo de la falta de mantenimiento e inocuidad en las instalaciones', 'Iluminación, decoración, acabados, decoración de temas relacionados con festividades', NULL, NULL, 1, '2021-03-31 13:45:38', '2021-03-31 13:45:38', NULL);
INSERT INTO `t_preguntas` VALUES (6, 1, '¿Por qué debemos garantizar la protección de puertas y ventanas?', 'a', 'Para evitar el ingreso de polvo, riesgo de contaminación y el acceso de Fauna nociva aérea o terrestre', 'Para evitar el ingreso de personas desconocidas que traten de interferir con la seguridad del establecimiento', 'Para que el establecimiento cuente con lo necesario para que los usuarios reciban una atención que sea segura y de calidad', NULL, NULL, 1, '2021-03-31 13:49:16', '2021-03-31 13:49:16', NULL);
INSERT INTO `t_preguntas` VALUES (7, 1, '¿Cómo deben estar instalados los equipos de cocina y utensilios?', 'b', 'De manera que contar con buenos aparatos y utensilios ayuda a agilizar la operación de la cocina, sino también se refleja en la calidad de los alimentos a servir', 'En forma tal que los espacios entre ellos permitan su fácil limpieza y desinfección así también deberán ser lisos y lavables', 'Buscar sean resistentes a la oxidación y aquellos cuyos recubrimientos los vuelven ideales para ambientes húmedos', NULL, NULL, 1, '2021-03-31 13:51:03', '2021-03-31 13:51:03', NULL);
INSERT INTO `t_preguntas` VALUES (8, 1, '¿Por qué debemos rechazar el uso de tablas de madera?', 'a', 'Puede ser un foco infeccioso de gérmenes y bacterias, por ende, se deberían preferir materiales más fáciles de limpiar y desinfectar', 'Porque lavarlas a mano con jabón es fundamental, secarlos completamente antes de guardarlos', 'Las superficies de manipulación de alimentos y las que estén en contacto con estos, tienen que estar construidas con materiales lisos, lavables, resistentes a la corrosión y no tóxicos', NULL, NULL, 1, '2021-03-31 13:53:46', '2021-03-31 13:53:46', NULL);
INSERT INTO `t_preguntas` VALUES (9, 1, '¿Es necesario el uso de termómetro para el control de temperatura? ', 'a', 'Si, es necesario porque nos garantiza la correcta conservación', 'Si, se necesita para tener un control en la cocción de los alimentos', 'No, debemos checar la temperatura ya que no es necesario utilizarlo', NULL, NULL, 1, '2021-03-31 13:55:04', '2021-03-31 13:55:04', NULL);
INSERT INTO `t_preguntas` VALUES (10, 1, '¿Cómo debe conservarse el agua para uso en el establecimiento?', 'c', 'El agua debe ser potable, ideal para el consumo humano y ser clorada cada año', 'Evite las fugas y goteos. Las conexiones de agua o cañerías no son eternas, suelen estropearse con el paso del tiempo y con ello se inician las pérdidas de agua que, si usted no le presta la debida atención, derivará en un constante desperdicio de agua', 'Al agua debe ser potable y/o conservarse clorada adecuadamente en tinacos o cisternas o contenedores limpios en su interior y tapados correctamente', NULL, NULL, 1, '2021-03-31 13:58:24', '2021-03-31 13:58:24', NULL);
INSERT INTO `t_preguntas` VALUES (11, 1, '¿Cómo deben ser las tuberías del establecimiento?', 'a', 'Deben estar en buen estado, sin fugaz o roturas e identificado correctamente', 'Escoger  las tuberías adecuadas te ayudará a evitar problemas de atascos y  fugas ', 'Que cumplan con la función de transportar agua u otros fluidos. Se suele elaborar con materiales muy diversos', NULL, NULL, 1, '2021-03-31 13:59:29', '2021-03-31 13:59:29', NULL);
INSERT INTO `t_preguntas` VALUES (12, 1, '¿Cómo debe permanecer las coladeras?', 'c', 'Libres de basura, sin estancamiento y en buen estado', 'Abiertas, sin símbolos de seguridad y en buen estado', 'Deberán estar provistas de rejillas para evitar la proliferación de plagas, además contar con un diseño tal que permita su limpieza', NULL, NULL, 1, '2021-03-31 14:01:14', '2021-03-31 14:01:14', NULL);
INSERT INTO `t_preguntas` VALUES (13, 1, 'De acuerdo con la Norma Oficial Mexicana NOM 251, ¿cómo deben estar las instalaciones de los servicios sanitarios?', 'c', 'Separados de manera individual por material de cristal templado y materiales de alta calidad', 'Con un agradable aroma, limpieza y calidad de presentación', 'Deben de contar con separaciones físicas completas', NULL, NULL, 1, '2021-03-31 14:03:04', '2021-03-31 14:03:04', NULL);
INSERT INTO `t_preguntas` VALUES (14, 1, '¿Qué se debe evitar en la ventilación del aire dentro del establecimiento?', 'a', 'Se debe evitar el calor y condensación excesiva, así como la acumulación', 'Es algo que ha de plantearse de manera integral. Así podremos evitar contaminaciones de humo', 'Es la solución de los problemas de la grasa, el humo y los olores en el ambiente', NULL, NULL, 1, '2021-03-31 14:03:57', '2021-03-31 14:03:57', NULL);
INSERT INTO `t_preguntas` VALUES (15, 1, '¿si cuenta con aire acondicionado, que se debe evitar?', 'c', 'Que se caliente el aire, y produzca moho a su alrededor', 'Que la rejilla del aire acondicionado acumule polvo', 'Se debe evitar la acumulación de agua en tuberías y techos sobre las áreas', NULL, NULL, 1, '2021-03-31 14:05:50', '2021-03-31 14:05:50', NULL);
INSERT INTO `t_preguntas` VALUES (16, 1, '¿Cómo deben mantenerse las tuberías y salidas de aire de los Sistemas de ventilación, así como ventiladores de pared y/o pedestal?', 'a', 'Debe mantenerse una escrupulosa limpieza e higiene de las salidas de Aire y extractores , así como una periódica limpieza de los ventiladores', 'Mantenerse cerradas, sin que al aire puro circule por la proliferación de bacterias', 'Los ventiladores son indispensables para la conservación de los alimentos y la circulación del aire', NULL, NULL, 1, '2021-04-30 11:48:55', '2021-04-30 11:48:55', NULL);
INSERT INTO `t_preguntas` VALUES (17, 1, '¿Cómo debe ser la iluminación en todas las áreas del establecimiento?', 'b', 'Iluminación tenue, romántica, agradable de manera que el comensal se sienta bien', 'Se debe contar con iluminación suficiente que permita la realización de las operaciones de manera higiénica', 'Limpia, con instalaciones de alta calidad y sin protección', NULL, NULL, 1, '2021-04-30 11:49:35', '2021-04-30 11:49:35', NULL);
INSERT INTO `t_preguntas` VALUES (18, 1, '¿Cómo deben ser los focos y las lámparas del establecimiento?', 'a', 'Estos deben ser con protección para evitar al momento de un estallamiento la contaminación de los alimentos', 'Cálidos, sin rejillas', 'De calidad, con luz para repeler insectos', NULL, NULL, 1, '2021-04-30 11:50:11', '2021-04-30 11:50:11', NULL);
INSERT INTO `t_preguntas` VALUES (19, 1, '¿Cómo debe ser las instalaciones de almacenamiento?', 'b', 'Áreas amplias y limpias, justo para conservar todos los instrumentos', 'Adecuadas al tipo de materia prima y bebidas, para su adecuada conservación que favorezca su adecuada manipulación', 'Adecuadas para la instalación de canceles', NULL, NULL, 1, '2021-04-30 11:51:05', '2021-04-30 11:51:05', NULL);
INSERT INTO `t_preguntas` VALUES (20, 1, '¿Para qué sirve el control de los productos en el área de almacenamiento?', 'a', 'Para evitar la contaminación de los productos', 'No debe haber un control ya que es materia prima y no pedecedera', 'Sirve para saber las cantidades existentes y el manejo y administración de los recursos', NULL, NULL, 1, '2021-04-30 11:51:51', '2021-04-30 11:51:51', NULL);
INSERT INTO `t_preguntas` VALUES (21, 1, '¿Cómo debe almacenarse las sustancias químicas, jabones, detergentes, desinfectantes, etc.?', 'b', 'Debe almacenarse separado del área de almacenamiento de alimentos ya que suelen intoxicarlos', 'Deben almacenarse en sus envases originales, en lugares seguros, considerando sus riesgos inherentes, la incompatibilidad con otros productos y las condiciones del ambiente', 'Se deberá mantener un inventario de sustancias que incluya todas las sustancias que existen en las diferentes áreas de trabajo', NULL, NULL, 1, '2021-04-30 11:52:32', '2021-04-30 11:52:32', NULL);
INSERT INTO `t_preguntas` VALUES (22, 1, '¿Cómo mantener un buen control de operaciones de la cocina?', 'b', 'Anotando todo, mantenerlo con un chequeo semanal y mensual', 'Se debe inspeccionar y clasificar las materias primas en insumos antes de la producción o elaboración del producto', 'Seleccionando los alimentos, por tipo y consumo frecuente', NULL, NULL, 1, '2021-04-30 11:53:17', '2021-04-30 11:53:17', NULL);
INSERT INTO `t_preguntas` VALUES (23, 1, '¿Cómo debe mantenerse las materias primas?', 'a', 'En envase cerrado para evitar su contaminación además de verificar la Fecha de caducidad de cada producto', 'En estantes clasificados por fecha de caducidad y establecer los de pronto consumo', 'Frescas y limpias', NULL, NULL, 1, '2021-04-30 11:54:36', '2021-04-30 11:54:36', NULL);
INSERT INTO `t_preguntas` VALUES (24, 1, '¿Cómo debe almacenarse los productos y alimentos?', 'b', 'Debe almacenarse de forma adecuada para evitar que se dañe o se desarrollen patógenos', 'Debe almacenarse en recipientes o envases limpios, inocuos, libre de fauna nociva.', 'Cada establecimiento decide cómo se almacenan sus materias primas', NULL, NULL, 1, '2021-05-03 10:24:53', '2021-05-03 10:24:53', NULL);
INSERT INTO `t_preguntas` VALUES (25, 1, '¿Qué Norma Oficial Mexicana regula la calidad de agua para uso y consumo humano?', 'a', 'NOM-127-SSA1-1994', 'NOM-217 -SSA1-1994', 'NOM-157- SSA1- 1994', NULL, NULL, 1, '2021-05-03 10:26:02', '2021-05-03 10:26:02', NULL);
INSERT INTO `t_preguntas` VALUES (26, 1, '¿Qué se debe monitorear diariamente llevando un control en una bitácora de registro diario?', 'a', 'La cantidad de cloro establecida de 0.2 a 1.5 p.p.m', 'La entrada y salida de los clientes ', 'El protocolo de ingreso para el establecimiento en horarios de entrada y salida', NULL, NULL, 1, '2021-05-03 10:26:53', '2021-05-03 10:26:53', NULL);
INSERT INTO `t_preguntas` VALUES (27, 1, '¿Cómo se debe usar el cloro en sus diferentes presentaciones? ', 'b', 'Desinfecta tan bien, que es necesario utilizar una concentración muy baja para poder limpiar adecuadamente', 'Se debe usar de acuerdo con las indicaciones o especificaciones del fabricante, poniendo especial atención a lo establecido en la ficha técnica o instrucciones de uso', 'No debemos usar cloro ya que es nocivo para la salud ', NULL, NULL, 1, '2021-05-03 10:27:26', '2021-05-03 10:27:26', NULL);
INSERT INTO `t_preguntas` VALUES (28, 1, '¿Qué se debe realizar después de un mantenimiento de los equipos y utensilios?', 'a', 'Se debe inspeccionar que los equipos y utensilios no cuenten con residuos tóxicos que puedan contaminar los alimentos.', 'De manera que contar con buenos aparatos y utensilios ayuda a agilizar la operación de la cocina, sino también se refleja en la calidad de los alimentos a servir', 'Buscar sean resistentes a la oxidación y aquellos cuyos recubrimientos los vuelven ideales para ambientes húmedos', NULL, NULL, 1, '2021-05-03 10:28:09', '2021-05-03 10:28:09', NULL);
INSERT INTO `t_preguntas` VALUES (29, 1, '¿Qué tipo de lubricante debe utilizarse en los equipos que lo requieren?', 'c', 'Los aceites de cocina pueden funcionar, son imanes para la suciedad y el polvo', 'Debes asegurarte de que este pueda penetrar la suciedad y la mugre', 'Deberá utilizarse lubricante con grado alimenticio para evitar la contaminación', NULL, NULL, 1, '2021-05-03 10:28:49', '2021-05-03 10:28:49', NULL);
INSERT INTO `t_preguntas` VALUES (30, 1, '¿Qué documento debe contar la empresa que realiza el servicio de fumigación?', 'a', 'Licencia Sanitaria ', 'Carnet de trabajo', 'Constancia de fumigacion', NULL, NULL, 1, '2021-05-03 10:29:25', '2021-05-03 10:29:25', NULL);
INSERT INTO `t_preguntas` VALUES (31, 1, '¿Está permitido la presencia de animales domésticos dentro del establecimiento?', 'a', 'No, el establecimiento debe estar libre de la presencia de animales domésticos.', 'Sólo razas pequeñas con autorización del establecimiento', 'La entrada y salida de los animales está permitido', NULL, NULL, 1, '2021-05-03 10:30:03', '2021-05-03 10:30:03', NULL);
INSERT INTO `t_preguntas` VALUES (32, 1, '¿Qué se debe hacer en caso de la presencia de objetos en desuso dentro del establecimiento?', 'c', 'Guárdalos algún día pueden servir, ya que los recursos son escasos', 'Donarlos para evitar la acumulación de los mismos', 'Se debe retirar de las áreas de producción de alimentos la presencia de Equipos en desuso que pudieran ser un riesgo de proliferación de fauna Nociva.', NULL, NULL, 1, '2021-05-03 10:31:03', '2021-05-03 10:31:03', NULL);
INSERT INTO `t_preguntas` VALUES (33, 1, '¿Cómo deben ser los recipientes de almacenamiento de residuos?', 'a', 'Limpios, identificados y con tapa, evitando la acumulación excesiva de los residuos.', 'Son los fabricados en procesos industriales y que deben ser gestionados de una forma especial, por su peligrosidad, su toxicidad o su grado de concentración', 'Pequeños con poco espacio, de material corrosivo', NULL, NULL, 1, '2021-05-05 11:40:26', '2021-05-05 11:40:26', NULL);
INSERT INTO `t_preguntas` VALUES (34, 1, '¿Qué medida se debe realizar para evitar la acumulación de residuos?', 'a', 'Los residuos se deben eliminar periódicamente dependiendo de la cantidad los residuos que se generan por día o turno.', 'Los residuos se almacenan en botes para su acumulación y desecho', 'Los residuos se clarifican entre sus componentes para luego ser eliminados diariamente ', NULL, NULL, 1, '2021-05-05 11:41:24', '2021-05-05 11:41:24', NULL);
INSERT INTO `t_preguntas` VALUES (35, 1, '¿Cuál es la indumentaria correcta del personal de preparación de alimentos?', 'c', 'Filipina blanca, mandil, maya cubre pelos, guantes, cubre bocas y cofia', 'Todo blanco, cubre bocas, lentes de protección y guantes', 'Debe contar con cofia o cubre pelos, mandil limpio de colores claros, uso\r\nCorrecto de cubre bocas cubriendo nariz y boca, zapatos cerrados', NULL, NULL, 1, '2021-05-05 11:42:22', '2021-05-05 11:42:22', NULL);
INSERT INTO `t_preguntas` VALUES (36, 1, '¿Qué debe evitar usar el personal de área de alimentos y bebidas?', 'a', 'Debe evitar el uso de aretes, relojes, pulseras, anillos, y cualquier tipo de joyería y bisutería que sea un riesgo de contaminación de alimentos', 'Evitar introducir alimentos al área de cocina', 'Evitar el uso adecuado de cubre bocas, cofia y guantes ', NULL, NULL, 1, '2021-05-05 11:43:13', '2021-05-05 11:43:13', NULL);
INSERT INTO `t_preguntas` VALUES (37, 1, '¿Qué esta estrictamente prohibido hacer en las áreas de preparación y contacto con materia prima y alimentos?', 'b', 'Platicar, fumar, comer, toser, utilizar cubre bocas', 'Fumar, comer, masticar chicle, escupir, beber, comer, estornudar y toser', 'Leer, dormir, utilizar cofia, tomar fotos, estornudar y toser', NULL, NULL, 1, '2021-05-05 11:43:53', '2021-05-05 11:43:53', NULL);
INSERT INTO `t_preguntas` VALUES (38, 1, '¿Todos los enfriadores y refrigeradores deben contar con?', 'a', 'Deben contar con termómetro para monitorear la temperatura', 'Una bitácora para checar los alimentos perecederos', 'Manejo de temperatura y administración de los alimentos', NULL, NULL, 1, '2021-05-05 11:44:16', '2021-05-05 11:44:16', NULL);
INSERT INTO `t_preguntas` VALUES (39, 1, '¿Cómo deben de permanecer los drenajes?', 'a', 'Deben de permanecer libres de basura, residuos y fauna nociva', 'Con el paso de fluidos obstruido y fragmentado causando problemas de contaminación por estancamiento o fuga de los efluentes', 'La falta de mantenimiento, uso de materiales inadecuados y deficiencias en el diseño de los sistemas de drenaje, hace ineficientes el trato aguas negras como grises', NULL, NULL, 1, '2021-05-05 11:44:47', '2021-05-05 11:44:47', NULL);
INSERT INTO `t_preguntas` VALUES (40, 1, '¿Cómo deben mantenerse los baños?', 'c', 'En condiciones deplorables para su uso', 'Con colores claros, limpios y blancos ', 'Deben mantenerse limpios y desinfectados', NULL, NULL, 1, '2021-05-05 11:45:25', '2021-05-05 11:45:25', NULL);
INSERT INTO `t_preguntas` VALUES (41, 1, '¿Con qué material de limpieza deben contar el baño?', 'a', 'Jabón líquido, sanitas o toallitas de papel, bote de basura con tapa oscilante o de pedal, papel higiénico', 'Botes de basura, jabón líquido, sanitas o toallitas de papel, con tapa oscilante o de pedal, papel higiénico, cesto para ropa sucia', 'Papel de higiénico, toallas de tela, cesto de basura, jabón líquido y gel antibacterial', NULL, NULL, 1, '2021-05-05 11:46:00', '2021-05-05 11:46:00', NULL);
INSERT INTO `t_preguntas` VALUES (42, 1, '¿Como se debe de guardar y organizar las sustancias toxicas dentro del almacén?', 'b', 'Debe almacenarse separado del área de almacenamiento de alimentos ya que suelen intoxicarlos', 'Deben almacenarse en sus envases originales, en lugares seguros, considerando sus riesgos inherentes, la incompatibilidad con otros productos y las condiciones del ambiente', 'Se deberá mantener un inventario de sustancias que incluya todas las sustancias que existen en las diferentes áreas de trabajo', NULL, NULL, 1, '2021-05-05 11:46:30', '2021-05-05 11:46:30', NULL);
INSERT INTO `t_preguntas` VALUES (43, 1, '¿Cuándo debemos rechazar la materia prima?', 'a', 'Cuando este próximo a caducar ó ya este caducado, latas abolladas, caja o costales corroídos. Frutas y verduras con moho o magullados', 'Deben almacenarse y transportarse en condiciones óptimas para impedir la contaminación y/o la proliferación de microorganismos', 'Cuando esté abierto no deben dejarse en un mismo lugar los alimentos terminados', NULL, NULL, 1, '2021-05-05 11:47:12', '2021-05-05 11:47:12', NULL);
INSERT INTO `t_preguntas` VALUES (44, 1, '¿Cómo deben estar los equipos para la preparación de alimentos?', 'c', 'Limpios, desinfectados, ordenados y clorados', 'Lavados, tibios y ordenados', 'Perfectamente lavados y desinfectados', NULL, NULL, 1, '2021-05-05 11:47:40', '2021-05-05 11:47:40', NULL);
INSERT INTO `t_preguntas` VALUES (45, 1, '¿Con qué debe de contar la empresa que realiza el servicio de eliminación de plagas? ¿Y que debe dejar en cada servicio de fumigación? ', 'a', 'Debe contar con licencia sanitaria, dejando constancia de fumigación ', 'Con buenos plaguicidas y servicios', 'Con vehículo, bomba de fumigación y personal altamente capacitado', NULL, NULL, 1, '2021-05-05 11:48:16', '2021-05-05 11:48:16', NULL);
INSERT INTO `t_preguntas` VALUES (46, 1, '¿Qué debo evitar tener en mi establecimiento?', 'a', 'Material en desuso, maleza y mascotas', 'Música, colores llamativos y letreros en las paredes', 'Empleados con vestimenta apropiada, calidad en los servicios y estacionamiento', NULL, NULL, 1, '2021-05-05 11:48:48', '2021-05-05 11:48:48', NULL);
INSERT INTO `t_preguntas` VALUES (47, 1, '¿cómo se llaman las pastillas para clorar el agua?', 'b', 'Pastillas amarillas de cloro', 'Pastillas de hipoclorito de calcio', 'Pastillas blancas de cloro', NULL, NULL, 1, '2021-05-05 11:49:21', '2021-05-05 11:49:21', NULL);
INSERT INTO `t_preguntas` VALUES (48, 1, '¿cuántas pastillas de cloro se utilizan por cada 1000 litros de agua?', 'a', 'Una pastilla por cada 1000 litros de agua, todo de pende de la capacidad de almacenamiento de agua puede ser cisterna, tinaco, tanque etc.', '5 pastillas por cada 1000 litros de agua todo de pende de la capacidad de almacenamiento de agua puede ser cisterna, tinaco, tanque etc.', '15 pastillas por cada 1000litros de agua todo de pende de la capacidad de almacenamiento de agua puede ser cisterna, tinaco, tanque etc.', NULL, NULL, 1, '2021-05-05 11:50:15', '2021-05-05 11:50:15', NULL);
INSERT INTO `t_preguntas` VALUES (49, 1, '¿con que debe contar el filtro sanitario de cada establecimiento?', 'b', 'Tapete sanitizante con solución de cloro y Termómetro ', 'Tapete sanitizante con solución de cloro, Gel antibacterial del 70% o más de alcohol, Termómetro infrarrojo ', 'Tapete sanitizante sin solución de cloro, Gel antibacterial del 70% o más de alcohol, Termómetro infrarrojo ', NULL, NULL, 1, '2021-05-05 11:51:37', '2021-05-05 11:51:37', NULL);
INSERT INTO `t_preguntas` VALUES (50, 1, '¿Cuándo no debe ingresar al establecimiento un empleado ó un comensal?', 'a', 'Cuando presente algún síntoma como: fiebre mayor de 37°, secreción nasal, dolor de cuerpo, dolor de cabeza o malestar en general', 'Cuando se encuentre en buen estado de salud, cumpla con el uniforme oficial establecido por el área de trabajo, cuando porte su identificación del establecimiento', 'Cuando no cuente con sus herramientas de trabajo para realizar las actividades encomendadas por su jefe inmediato', NULL, NULL, 1, '2021-05-05 11:52:14', '2021-05-05 11:52:14', NULL);

-- ----------------------------
-- Table structure for t_registro
-- ----------------------------
DROP TABLE IF EXISTS `t_registro`;
CREATE TABLE `t_registro`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_tramite` int(11) NULL DEFAULT NULL,
  `id_hospital` int(11) NULL DEFAULT NULL,
  `id_d_personal` int(11) NULL DEFAULT NULL,
  `id_d_domicilio` int(11) NULL DEFAULT NULL,
  `rfc` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `curp` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `razon_social_o_nombre` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telefono` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'NULL',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'NULL',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_d_personal`(`id_d_personal` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_registro
-- ----------------------------
INSERT INTO `t_registro` VALUES (1, 1, NULL, 1, 1, 'ROBA860303KS2', 'RXBA860303HCSDTD04', 'ADRIAN RODRIGUEZ BAUTISTA', '9613349399', 'arodriguezb8603@gmail.com', '2024-02-20 09:56:21', '2024-02-20 09:56:21', NULL);
INSERT INTO `t_registro` VALUES (2, 2, 20, 2, NULL, '', 'OOAZ900824MTSRLL08', 'ZULEIMA GABRIELA ORDOñEZ ALANIS', 'NULL', 'NULL', '2024-02-20 11:23:07', '2024-02-20 11:23:07', NULL);

-- ----------------------------
-- Table structure for t_tramite_constancia
-- ----------------------------
DROP TABLE IF EXISTS `t_tramite_constancia`;
CREATE TABLE `t_tramite_constancia`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_registro_temp` int(11) NULL DEFAULT NULL,
  `id_tramite` int(11) NOT NULL,
  `folio_hacienda` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_status_requerimiento` int(11) NOT NULL DEFAULT 0,
  `id_status_video` int(11) NOT NULL DEFAULT 0,
  `id_status_examen` int(11) NOT NULL DEFAULT 0,
  `no_oportunidades` int(11) NULL DEFAULT 0,
  `id_usuario_registro` int(11) NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_tramite_constancia
-- ----------------------------
INSERT INTO `t_tramite_constancia` VALUES (1, NULL, 1, 'N/A', 1, 1, 1, 0, 2, '2024-02-20 11:24:50', '2024-02-20 12:17:20', NULL);
INSERT INTO `t_tramite_constancia` VALUES (2, NULL, 2, 'LB7789665', 1, 1, 1, 0, 1, '2024-02-21 10:50:05', '2024-02-21 10:52:57', NULL);

-- ----------------------------
-- Table structure for t_tramites
-- ----------------------------
DROP TABLE IF EXISTS `t_tramites`;
CREATE TABLE `t_tramites`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_registro` int(11) NOT NULL,
  `folio` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_tipo_tramite` int(11) NOT NULL,
  `id_status` int(11) NOT NULL,
  `fecha_inicio` datetime NULL DEFAULT NULL,
  `fecha_fin` datetime NULL DEFAULT NULL,
  `fecha_envio` datetime NULL DEFAULT NULL,
  `id_usuario_r` int(11) NULL DEFAULT NULL,
  `firma` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `no_serie_firma` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fecha_firma` datetime NULL DEFAULT NULL,
  `secuencia_firma` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uuid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cadena_sello` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fecha_sellado` datetime NULL DEFAULT NULL,
  `xml` longblob NULL,
  `folio_documento_firma` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `responsable_firma` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_registro`(`id_registro` ASC) USING BTREE,
  INDEX `id_tipo_tramite`(`id_tipo_tramite` ASC) USING BTREE,
  INDEX `id_status`(`id_status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_tramites
-- ----------------------------
INSERT INTO `t_tramites` VALUES (1, 2, '0001-H-2024', 2, 3, '2024-02-20 12:17:20', '2024-02-20 12:35:04', NULL, 3691, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Dr. Limber del Carmen García Zapata', '2024-02-20 12:17:20', '2024-02-20 12:46:06', NULL);
INSERT INTO `t_tramites` VALUES (2, 1, '8755425', 1, 3, '2024-02-21 10:52:57', '2024-02-21 10:57:50', NULL, 3691, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-21 10:52:57', '2024-02-21 10:57:50', NULL);

-- ----------------------------
-- Table structure for t_tramites_documentos
-- ----------------------------
DROP TABLE IF EXISTS `t_tramites_documentos`;
CREATE TABLE `t_tramites_documentos`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tramite` int(11) NOT NULL,
  `id_registro_temp` int(11) NULL DEFAULT NULL,
  `id_c_documento_tramite` int(11) NULL DEFAULT NULL,
  `documento` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ruta` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `extension` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `size` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `baseFile` longblob NULL,
  `id_status` int(11) NULL DEFAULT NULL,
  `id_usuario_subio` int(11) NULL DEFAULT NULL,
  `solventacion` int(11) NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_tramite`(`id_tramite` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_tramites_documentos
-- ----------------------------
INSERT INTO `t_tramites_documentos` VALUES (1, 1, NULL, 5, '5_1708453040.jpg', '/expedientes/2024/hospital/OOAZ900824MTSRLL08/exp_1', 'jpg', '5812', NULL, 10, 3708, 0, '2024-02-20 11:37:26', '2024-02-20 12:30:53', NULL);
INSERT INTO `t_tramites_documentos` VALUES (2, 1, NULL, 6, '6_1708453040.pdf', '/expedientes/2024/hospital/OOAZ900824MTSRLL08/exp_1', 'pdf', '591847', NULL, 9, 3708, 0, '2024-02-20 11:38:47', '2024-02-20 12:34:55', NULL);
INSERT INTO `t_tramites_documentos` VALUES (3, 1, NULL, 7, '7_1708453040.pdf', '/expedientes/2024/hospital/OOAZ900824MTSRLL08/exp_1', 'pdf', '82629', NULL, 9, 3708, 0, '2024-02-20 11:40:54', '2024-02-20 12:34:51', NULL);
INSERT INTO `t_tramites_documentos` VALUES (4, 2, NULL, 1, '1_1708534378.png', '/expedientes/2024/alimentos/RXBA860303HCSDTD04/exp_2', 'png', '7413', NULL, 10, 3707, 0, '2024-02-21 10:50:57', '2024-02-21 10:54:13', NULL);
INSERT INTO `t_tramites_documentos` VALUES (5, 2, NULL, 2, '2_1708534378.pdf', '/expedientes/2024/alimentos/RXBA860303HCSDTD04/exp_2', 'pdf', '190569', NULL, 10, 3707, 0, '2024-02-21 10:51:28', '2024-02-21 10:54:15', NULL);
INSERT INTO `t_tramites_documentos` VALUES (6, 2, NULL, 3, '3_1708534378.pdf', '/expedientes/2024/alimentos/RXBA860303HCSDTD04/exp_2', 'pdf', '190569', NULL, 10, 3707, 0, '2024-02-21 10:51:34', '2024-02-21 10:54:17', NULL);
INSERT INTO `t_tramites_documentos` VALUES (7, 2, NULL, 4, '4_1708534378.pdf', '/expedientes/2024/alimentos/RXBA860303HCSDTD04/exp_2', 'pdf', '190569', NULL, 9, 3707, 0, '2024-02-21 10:51:39', '2024-02-21 10:55:22', NULL);

-- ----------------------------
-- Table structure for t_tramites_observaciones
-- ----------------------------
DROP TABLE IF EXISTS `t_tramites_observaciones`;
CREATE TABLE `t_tramites_observaciones`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tramite_documento` int(11) NULL DEFAULT NULL,
  `id_tramite` int(11) NOT NULL,
  `id_c_documento` int(11) NULL DEFAULT NULL,
  `id_usuario_observo` int(11) NOT NULL,
  `observacion` longtext CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `observacion_solventacion` longtext CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL,
  `documento` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `ruta` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `extension` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `aceptado` int(11) NOT NULL,
  `solventado` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_tramites_observaciones
-- ----------------------------
INSERT INTO `t_tramites_observaciones` VALUES (1, 3, 1, 7, 3691, 'Los estudios no son legibles', NULL, '7_1708454022_solventacion.pdf', '/expedientes/2024/hospital/OOAZ900824MTSRLL08/exp_1/solventacion', 'pdf', 10, 1, '2024-02-20 12:30:24', '2024-02-20 12:34:51', NULL);
INSERT INTO `t_tramites_observaciones` VALUES (2, 2, 1, 6, 3691, 'Certificado no corresponde al periodo valido', NULL, '6_1708454030_solventacion.pdf', '/expedientes/2024/hospital/OOAZ900824MTSRLL08/exp_1/solventacion', 'pdf', 10, 1, '2024-02-20 12:31:35', '2024-02-20 12:34:55', NULL);
INSERT INTO `t_tramites_observaciones` VALUES (3, 7, 2, 4, 3691, 'Boleta no valida', NULL, '4_1708534499_solventacion.pdf', '/expedientes/2024/alimentos/RXBA860303HCSDTD04/exp_2/solventacion', 'pdf', 10, 1, '2024-02-21 10:54:30', '2024-02-21 10:55:22', NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_registro` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `recovery_pass` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `theme` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `dark_mode` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT '0',
  `active` bit(1) NOT NULL DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `nickname`(`nickname`(191) ASC) USING BTREE,
  INDEX `id_registro`(`id_registro` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3708 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, NULL, 'Administrador General', 'admin', 'sistemasudishyfp@gmail.com', NULL, '$2y$10$BPK66MDvlXR/XWR1rnwzHOKx2x9fEi17s1gRbWp/iyfl6F5TOpySW', NULL, NULL, NULL, '0', b'1', '2022-04-22 10:23:49', '2023-09-28 16:03:43', NULL);
INSERT INTO `users` VALUES (3691, NULL, 'Revisor ventanilla', 'ventanilla', 'ventanilla@gmail.com', NULL, '$2y$10$BPK66MDvlXR/XWR1rnwzHOKx2x9fEi17s1gRbWp/iyfl6F5TOpySW', NULL, 'YWRtaW4=', NULL, '0', b'1', '2023-08-10 12:50:33', '2023-09-25 14:19:31', NULL);
INSERT INTO `users` VALUES (3707, 1, 'ADRIAN RODRIGUEZ BAUTISTA', 'arodriguez', 'arodriguezb8603@gmail.com', NULL, '$2y$10$shUbdbiNJw9qleaCX0nT7.fGt2U37s9sxWJsKgykmxq38N4CT7sf6', NULL, 'QXJvZHJpZ3VleiQyMDI0', NULL, '0', b'1', '2024-02-20 09:56:21', '2024-02-21 10:48:07', NULL);
INSERT INTO `users` VALUES (3708, 2, 'ZULEIMA GABRIELA ORDOñEZ ALANIS', 'zuleima', '', NULL, '$2y$10$GDbx4fjqKoT6ABT5UYWJk.OmMaSvHFa.IO8npx6YNmQJLUPTCKXei', NULL, 'WnVsZWltYSQyMDI0', NULL, '0', b'1', '2024-02-20 11:23:07', '2024-02-20 11:23:07', NULL);

SET FOREIGN_KEY_CHECKS = 1;
