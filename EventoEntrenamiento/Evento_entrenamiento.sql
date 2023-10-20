CREATE DATABASE IF NOT EXISTS evento_entrenamiento;

USE evento_entrenamiento;


CREATE TABLE actividades(
	actividad_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(50)
);
CREATE TABLE horarios(
	horario_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	horario TIME
);

CREATE TABLE horario_x_actividad(
	hxa_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	cupo_personas INT UNSIGNED,
	horario INT UNSIGNED,
	actividad INT UNSIGNED,
	FOREIGN KEY (horario)
		REFERENCES horarios(horario_id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE,
	FOREIGN KEY (actividad)
		REFERENCES actividades(actividad_id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE
);

CREATE TABLE usuario(
	usuario_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(50),
	apellido VARCHAR(50),
	email VARCHAR(50) UNIQUE,
	fecha_nacimiento DATETIME,
	actividad INT UNSIGNED,
	horario INT UNSIGNED,
	FOREIGN KEY (horario)
		REFERENCES horarios(horario_id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE,
	FOREIGN KEY (actividad)
		REFERENCES actividades(actividad_id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE
);