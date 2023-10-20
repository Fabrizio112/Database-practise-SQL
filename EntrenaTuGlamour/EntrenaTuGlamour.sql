CREATE DATABASE IF NOT EXISTS entrena_tu_glamour;

USE entrena_tu_glamour;


CREATE TABLE participantes(
	email VARCHAR(50) PRIMARY KEY,
	nombre VARCHAR(50),
	apellidos VARCHAR(50),
	nacimiento DATETIME
);

CREATE TABLE actividades(
	actividad_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	bloque VARCHAR(50),
	disciplina VARCHAR(50),
	horario VARCHAR(50),
	cupo INT
);

CREATE TABLE registros(
	registro_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	fecha DATETIME,
	email VARCHAR(50),
	actividad INT UNSIGNED,
	FOREIGN KEY (email)
		REFERENCES participantes(email)
		ON DELETE RESTRICT
		ON UPDATE CASCADE,
	FOREIGN KEY (actividad)
		REFERENCES actividades(actividad_id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE
);