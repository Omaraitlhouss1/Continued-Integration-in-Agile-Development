CREATE DATABASE IF NOT EXISTS baloncesto;
USE baloncesto;

CREATE TABLE IF NOT EXISTS `Jugadores` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`nombre` VARCHAR(50) NOT NULL DEFAULT '',
	`votos` INT NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO Jugadores (nombre, votos) VALUES ('Llull', 0); 
INSERT INTO Jugadores (nombre, votos) VALUES ('Rudy', 0);
INSERT INTO Jugadores (nombre, votos) VALUES ('Tavares', 0);

CREATE USER IF NOT EXISTS 'usuario'@'localhost' IDENTIFIED BY 'clave';
GRANT ALL PRIVILEGES ON baloncesto.* TO 'usuario'@'localhost';
FLUSH PRIVILEGES;
