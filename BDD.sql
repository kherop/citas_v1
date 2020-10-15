/* Usuarios */

CREATE TABLE `usuarios` (
	`idUsuario` int NOT NULL AUTO_INCREMENT,
	`correo` varchar(25) NOT NULL,
	`nombre` varchar(20) NOT NULL,
	`apellido` varchar(20) NOT NULL,
	`password` varchar(10) NOT NULL,
    `img_perfil` varchar(50),
	PRIMARY KEY (`idUsuario`)
) COMMENT = 'tabla de usuarios';

/* Roles */

CREATE TABLE `roles` (
	`idRol` int NOT NULL AUTO_INCREMENT,
    `descripcion` varchar(20) NOT NULL,
    PRIMARY KEY (`idRol`)
) COMMENT = 'tabla de roles';

/* Asignación de roles */

CREATE TABLE `asignacionRoles` (
	`idUsuario` int(5),
    `idRol` int(5),
	PRIMARY KEY (`idUsuario`, `idRol`),
	FOREIGN KEY (`idUsuario`) REFERENCES `usuarios`(`idUsuario`),
    FOREIGN KEY (`idRol`) REFERENCES `roles`(`idRol`)
) COMMENT = 'tabla de asignacion de roles';

/* Preferencias */

CREATE TABLE `preferencias` (
	`idPreferencias` int NOT NULL AUTO_INCREMENT,
    `idUsuario` int(5) NOT NULL,
    `tipoRelacion` varchar(15),
    `hijos` varchar(15),
    `artisicos` int (3),
    `deportivos` int (3),
    `politicos` int (3),
	PRIMARY KEY (`idPreferencias`, `idUsuario`),
    FOREIGN KEY (`idUsuario`) REFERENCES `usuarios`(`idUsuario`)
) COMMENT = 'tabla de preferencias';

/* Amigos */

CREATE TABLE `amigos` (
	`idEmisor` int(5),
    `idReceptor` int(5),
    `estado` varchar(10),
    `fechaAceptada` date,
    PRIMARY KEY (`idEmisor`, `idReceptor`),
    FOREIGN KEY (`idEmisor`) REFERENCES `usuarios`(`idUsuario`),
    FOREIGN KEY (`idReceptor`) REFERENCES `usuarios`(`idUsuario`)
) COMMENT = 'tabla amigos';

/* Mensajes */

CREATE TABLE `mensajes` (
	`idMensaje` int NOT NULL AUTO_INCREMENT,
	`idRemitente` int(5) NOT NULL,
    `idDestinatario` int(5) NOT NULL,
    `asunto` varchar(25),
    `fecha` datetime NOT NULL,
    `cuerpo` varchar(250) NOT NULL,
    `leido` varchar(1) NOT NULL,
    PRIMARY KEY (`idMensaje`),
    FOREIGN KEY (`idRemitente`) REFERENCES `usuarios`(`idUsuario`),
    FOREIGN KEY (`idDestinatario`) REFERENCES `usuarios`(`idUsuario`)
) COMMENT = 'table de mensajes';

/* Tabla archivos adjuntos */

CREATE TABLE `archivosMensajes` (
	`idArchivo` int NOT NULL AUTO_INCREMENT,
    `idMensaje` int(10),
    `rutaArchivo` varchar(50),
    PRIMARY KEY (`idArchivo`, `idMensaje`),
	FOREIGN KEY (`idMensaje`) REFERENCES `mensajes`(`idMensaje`)
) COMMENT = 'tabla de archivo adjuntos';

/* Inserto los roles */

INSERT INTO `roles` (`descripcion`) VALUES
	('usuario'),
    ('administrador');

/* Creo un admin */

INSERT INTO `usuarios` (`correo`, `nombre`, `apellido`, `password`) VALUES
	('kherop@gmail.com', 'Luis', 'Quesada', '!1234567aA');
    
INSERT INTO `asignacionRoles` (`idUsuario`, `idRol`) VALUES (
	(SELECT `idUsuario` FROM `usuarios` WHERE `correo` = 'kherop@gmail.com'),
    (SELECT `idRol` FROM `roles` WHERE `descripcion` = 'administrador')
);

/* Creo el usuario empresa */
INSERT INTO `usuarios` (`correo`, `nombre`, `apellido`, `password`, `img_perfil`) VALUES 
	('empresa@empresa.com', 'Empresa', 'Empresa', '!1234567aA', NULL);
    
SELECT * FROM asignacionRoles;
    
SELECT * FROM usuarios;






