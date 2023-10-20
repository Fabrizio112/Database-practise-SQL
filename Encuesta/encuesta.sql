CREATE DATABASE IF NOT EXISTS encuesta;

USE encuesta;

CREATE TABLE encuestas(
	encuesta_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(50),
	descripcion TEXT,
	imagen VARCHAR(255),
	fecha DATETIME,
	encuestados INT
);

CREATE TABLE preguntas(
	pregunta_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	pregunta TEXT,
	encuesta INT UNSIGNED,
	FOREIGN KEY (encuesta)
		REFERENCES encuestas(encuesta_id)
		ON UPDATE CASCADE
		ON DELETE RESTRICT
);

CREATE TABLE respuestas(
	respuesta_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	respuesta TEXT,
	es_correcta BOOLEAN,
	pregunta INT UNSIGNED,
	FOREIGN KEY (pregunta)
		REFERENCES preguntas(pregunta_id)
		ON UPDATE CASCADE
		ON DELETE RESTRICT
);

CREATE TABLE encuestados(
	encuestado_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(50),
	apellido VARCHAR(50),
	edad INT,
	email VARCHAR(50) UNIQUE
);

CREATE TABLE resultado(
	resultado_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	preguntas INT ,
	correctas FLOAT,
	encuesta INT UNSIGNED,
	encuestado INT UNSIGNED,
	FOREIGN KEY (encuesta)
		REFERENCES encuestas(encuesta_id)
		ON UPDATE CASCADE
		ON DELETE RESTRICT,
	FOREIGN KEY (encuestado)
		REFERENCES encuestados(encuestado_id)
		ON UPDATE CASCADE
		ON DELETE RESTRICT
);

	
