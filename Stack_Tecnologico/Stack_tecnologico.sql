CREATE DATABASE IF NOT EXISTS stack_tecnologias;

USE stack_tecnologias;

CREATE TABLE clasificaciones(
	clasificacion_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	clasificacion VARCHAR(50) UNIQUE
);

INSERT INTO clasificaciones  VALUES 
(0,'Front End'),
(0,'Back End'),
(0,'Testing'),
(0, 'Tools');

CREATE TABLE estados(
	estado_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	estado VARCHAR(50) UNIQUE
);

INSERT INTO estados VALUES 
(0,'Learning'),
(0,'Finished'),
(0,'To learn');

CREATE TABLE tecnologias(
	tecnologia_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(50),
	clasificacion INT UNSIGNED,
	estado INT UNSIGNED,
	FOREIGN KEY (clasificacion)
		REFERENCES clasificaciones(clasificacion_id)
		ON UPDATE CASCADE
		ON DELETE RESTRICT,
	FOREIGN KEY (estado)
		REFERENCES estados(estado_id)
		ON UPDATE CASCADE
		ON DELETE RESTRICT

);

INSERT INTO tecnologias VALUES
(0,'HTML',1,2),
(0,'CSS',1,2),
(0,'JavaScript',1,2),
(0,'Bootstrap',1,2),
(0,'SASS',1,2),
(0,'React',1,2),
(0,'Styled Components',1,2),
(0,'React Router',1,2),
(0,'Redux',1,2),
(0,'React Query',1,2),
(0,'MarkDown',4,2),
(0,'GitHub',4,2),
(0,'Git',4,1),
(0,'React Hook Form',1,1),
(0,'Databases',4,1),
(0,'Testing Library',1,1),
(0,'Jest',1,1),
(0,'Python',2,1),
(0,'Tailwind',1,3),
(0,'Babel',1,3),
(0,'Webpack',1,3),
(0,'NextJS',1,3),
(0,'MySQL',4,1),
(0,'C#',2,3),
(0,'.NET',2,3),
(0,'TypeScript',1,3);


SELECT * FROM tecnologias  t ;
SELECT * FROM estados e;
SELECT * FROM clasificaciones c;

