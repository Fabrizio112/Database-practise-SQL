CREATE DATABASE IF NOT EXISTS mundial;
USE mundial;

CREATE TABLE grupos(
	grupo_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	nombre CHAR(7)
);

INSERT INTO grupos VALUES
(0,'Grupo A'),
(0,'Grupo B'),
(0,'Grupo C'),
(0,'Grupo D'),
(0,'Grupo E'),
(0,'Grupo F'),
(0,'Grupo G'),
(0,'Grupo H');


CREATE TABLE selecciones(
	seleccion_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	seleccion VARCHAR(50),
	candidato BOOLEAN,
	grupo INT UNSIGNED,
	FOREIGN KEY (grupo) REFERENCES grupos(grupo_id)
);

INSERT INTO selecciones VALUES
(0,'Holanda',FALSE,1),
(0,'Senegal',FALSE,1),
(0,'Ecuador',FALSE,1),
(0,'Qatar',FALSE,1);

INSERT INTO selecciones VALUES
(0,'Gales',FALSE,2),
(0,'Irán',FALSE,2),
(0,'Estados Unidos',FALSE,2),
(0,'Inglaterra',TRUE,2);

INSERT INTO selecciones VALUES
(0,'Polonia',FALSE,3),
(0,'Argentina',TRUE,3),
(0,'Arabia Saudita',FALSE,3),
(0,'México',FALSE,3);

INSERT INTO selecciones VALUES
(0,'Francia',TRUE,4),
(0,'Australia',FALSE,4),
(0,'Túnez',FALSE,4),
(0,'Dinamarca',FALSE,4);

INSERT INTO selecciones VALUES
(0,'Alemania',TRUE,5),
(0,'España',TRUE,5),
(0,'Japón',FALSE,5),
(0,'Costa Rica',FALSE,5);

INSERT INTO selecciones VALUES
(0,'Bélgica',TRUE,6),
(0,'Croacia',TRUE,6),
(0,'Marruecos',FALSE,6),
(0,'Canada',FALSE,6);

INSERT INTO selecciones VALUES
(0,'Brasil',TRUE,7),
(0,'Suiza',FALSE,7),
(0,'Camerún',FALSE,7),
(0,'Serbia',FALSE,7);

INSERT INTO selecciones VALUES
(0,'Portugal',TRUE,8),
(0,'Corea del Sur',FALSE,8),
(0,'Uruguay',FALSE,8),
(0,'Ghana',FALSE,8);


CREATE TABLE jugadores(
	jugador_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(50),
	apellido VARCHAR(50),
	nacionalidad VARCHAR(50),
	seleccion INT UNSIGNED,
	FOREIGN KEY (seleccion) REFERENCES selecciones(seleccion_id)
);



INSERT INTO jugadores VALUES
(0,'Hassan','Al Haidos','Qatari',4),
(0,'Énner','Valencia','Ecuatoriano',3),
(0,'Kalidou ','Koulibaly','Senegales',2),
(0,'Virgil','Van Dijk','Holandes',1),
(0,'Harry','Kane','Ingles',8),
(0,'Ehsan','Hajsafi','Irani',6),
(0,'Tyler','Adams','Estadounidense',7),
(0,'Gareth','Bale','Gales',5),
(0,'Salman ','Al-Faraj','Saudi',11),
(0,'Lionel','Messi','Argentino',9),
(0,'Andres','Guardado','Mexicano',12),
(0,'Robert','Lewandowski','Polaco',10),
(0,'Hugo','Lloris','Frances',13),
(0,'Mathew ','Ryan','Australiano',14),
(0,'Simon','Kjær','Danez',16),
(0,'Youssef ','Msakni','Tunecino',15),
(0,'Sergio','Busquets','Español',19),
(0,'Bryan','Ruiz','Costa Ricence',20),
(0,'Manuel ','Neuer','Aleman',17),
(0,'Maya','Yoshida','Japones',19),
(0,'Eden','Hazard','Belga',21),
(0,'Atiba','Hutchinson','Canadiense',24),
(0,'Romain','Saïss','Marroqui',23),
(0,'Luka','Modrić','Croata',21),
(0,'Thiago ','Silva','Brasilero',25),
(0,'Dušan','Tadić','Serbio',28),
(0,'Granit ','Xhaka','Suizo',26),
(0,'Vincent','Aboubakar','Camerunes',27),
(0,'Cristiano','Ronaldo','Portugues',29),
(0,'André','Ayew','Ghanes',32),
(0,'Diego','Godín','Uruguayo',31),
(0,' Heung-Min','Son','Coreano',30)
;


SELECT * FROM grupos;
SELECT * FROM selecciones ;
SELECT * FROM jugadores ;