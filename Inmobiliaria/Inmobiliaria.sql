CREATE DATABASE IF NOT EXISTS inmobiliaria;

USE inmobiliaria;

CREATE TABLE direcciones(
	direccion_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	ciudad VARCHAR(50),
	calle VARCHAR(50),
	numero INT,
	cp INT
);

CREATE TABLE propiedades(
	propiedad_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(50),
	descripcion TEXT,
	alquiler FLOAT,
	direccion INT UNSIGNED,
	FOREIGN KEY (direccion)
		REFERENCES direcciones(direccion_id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE
);

CREATE TABLE cliente(
	cliente_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(50),
	apellido VARCHAR(50),
	telefono BIGINT UNIQUE,
	email VARCHAR(50) UNIQUE,
	propiedad INT UNSIGNED,
	FOREIGN KEY (propiedad)
		REFERENCES propiedades(propiedad_id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE
);