/* Usuarios */

CREATE TABLE `usuarios` (
	`idUsuario` INT NOT NULL AUTO_INCREMENT,
	`correo` VARCHAR(25) NOT NULL,
	`nombre` VARCHAR(20) NOT NULL,
	`apellido` VARCHAR(20) NOT NULL,
	`password` VARCHAR(10) NOT NULL,
    `img_perfil` VARCHAR(50),
	PRIMARY KEY (`idUsuario`)
) COMMENT = 'tabla de usuarios';

/* Roles */

CREATE TABLE `roles` (
	`idRol` INT NOT NULL AUTO_INCREMENT,
    `descripcion` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`idRol`)
) COMMENT = 'tabla de roles';

/* Asignación de roles */

CREATE TABLE `asignacionRoles` (
	`idUsuario` INT(5),
    `idRol` INT(5),
	PRIMARY KEY (`idUsuario`, `idRol`),
	FOREIGN KEY (`idUsuario`) REFERENCES `usuarios`(`idUsuario`),
    FOREIGN KEY (`idRol`) REFERENCES `roles`(`idRol`)
) COMMENT = 'tabla de asignacion de roles';

/* Preferencias */

CREATE TABLE `preferencias` (
	`idPreferencias` INT NOT NULL AUTO_INCREMENT,
    `idUsuario` INT(5) NOT NULL,
    `tipoRelacion` VARCHAR(15),
    `hijos` VARCHAR(15),
    `artisicos` INT (3),
    `deportivos` INT (3),
    `politicos` INT (3),
	PRIMARY KEY (`idPreferencias`, `idUsuario`),
    FOREIGN KEY (`idUsuario`) REFERENCES `usuarios`(`idUsuario`)
) COMMENT = 'tabla de preferencias';

/* Amigos */

CREATE TABLE `amigos` (
	`idEmisor` INT(5),
    `idReceptor` INT(5),
    `estado` VARCHAR(10),
    `fechaAceptada` DATE,
    PRIMARY KEY (`idEmisor`, `idReceptor`),
    FOREIGN KEY (`idEmisor`) REFERENCES `usuarios`(`idUsuario`),
    FOREIGN KEY (`idReceptor`) REFERENCES `usuarios`(`idUsuario`)
) COMMENT = 'tabla amigos';

/* Mensajes */

CREATE TABLE `mensajes` (
	`idMensaje` INT NOT NULL AUTO_INCREMENT,
	`idRemitente` INT(5) NOT NULL,
    `idDestinatario` INT(5) NOT NULL,
    `asunto` VARCHAR(25),
    `fecha` DATETIME NOT NULL,
    `cuerpo` VARCHAR(250) NOT NULL,
    `leido` VARCHAR(1) NOT NULL,
    PRIMARY KEY (`idMensaje`),
    FOREIGN KEY (`idRemitente`) REFERENCES `usuarios`(`idUsuario`),
    FOREIGN KEY (`idDestinatario`) REFERENCES `usuarios`(`idUsuario`)
) COMMENT = 'table de mensajes';

/* Tabla archivos adjuntos */

CREATE TABLE `archivosMensajes` (
	`idArchivo` INT NOT NULL AUTO_INCREMENT,
    `idMensaje` INT(10),
    `rutaArchivo` VARCHAR(50),
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

/* Creo usuario normal */
INSERT INTO `usuarios` (`correo`, `nombre`, `apellido`, `password`) VALUES
	('vero@gmail.com', 'Vero', 'Casado', '!1234567aA');

INSERT INTO `asignacionRoles` (`idUsuario`, `idRol`) VALUES (
	(SELECT `idUsuario` FROM `usuarios` WHERE `correo` = 'vero@gmail.com'),
    (SELECT `idRol` FROM `roles` WHERE `descripcion` = 'usuario')
);
    
/* Borrar tablas */

DROP TABLE IF EXISTS `archivosMensajes`;
DROP TABLE IF EXISTS `mensajes`;
DROP TABLE IF EXISTS `amigos`;
DROP TABLE IF EXISTS `preferencias`;
DROP TABLE IF EXISTS `asignacionRoles`;
DROP TABLE IF EXISTS `roles`;
DROP TABLE IF EXISTS `usuarios`;
    
SELECT * FROM asignacionRoles;
    
SELECT * FROM usuarios;

SELECT * FROM usuarios WHERE email = 'kherop@gmail.com';

SELECT * FROM usuarios WHERE correo = 'kherop@gmail.com';

select * from usuarios where correo = 'kherop@gmail.com' and password = '!1234567usuariosaA';

ALTER TABLE `usuarios` ADD `activado` BOOLEAN NOT NULL AFTER `img_perfil`;

SELECT * FROM usuarios WHERE email = 'kherop@gmail.com' AND password = '!1234567aA';


UPDATE usuarios SET password = '1234567aA!' WHERE email = 'kherop@gmail.com';

update usuarios set sexo = 'hombre' where email = 'kherop@gmail.com';






