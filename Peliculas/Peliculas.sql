CREATE DATABASE IF NOT EXISTS peliculas;
USE DATABASE peliculas;

CREATE TABLE paises(
	pais_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	pais VARCHAR(50)
);

INSERT INTO paises VALUES
(0,'Argentina'),
(0,'Estados Unidos'),
(0,'Canada'),
(0,'Japon'),
(0,'Inglaterra');

CREATE TABLE generos(
	genero_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	genero VARCHAR(50)
);
INSERT INTO generos VALUES
(0,'Accion'),
(0,'Terror'),
(0,'Drama'),
(0,'Comedia'),
(0,'Ficcion'),
(0,'Aventura'),
(0,'Animacion');


CREATE TABLE directores(
	director_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(50),
	pais INT UNSIGNED,
	FOREIGN KEY (pais)
		REFERENCES paises(pais_id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE
);

INSERT INTO directores VALUES
();

CREATE TABLE peliculas(
	pelicula_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	año_lanzamiento INT,
	duracion INT ,
	titulo VARCHAR(50),
	sipnosis TEXT,
	poster VARCHAR(255),
	trailer VARCHAR(255),
	director INT UNSIGNED,
	pais INT UNSIGNED,
	FOREIGN KEY (director)
		REFERENCES directores(director_id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE,
	FOREIGN KEY (pais)
		REFERENCES paises(pais_id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE
);


CREATE TABLE genero_x_pelicula(
	gxp_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	genero INT UNSIGNED,
	pelicula INT UNSIGNED,
	FOREIGN KEY (genero)
		REFERENCES generos(genero_id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE,
	FOREIGN KEY (pelicula)
		REFERENCES peliculas(pelicula_id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE	
);

SELECT * FROM peliculas p
	INNER JOIN directores d ON p.director = d.director_id
	INNER JOIN paises pa ON p.pais=pa.pais_id;
