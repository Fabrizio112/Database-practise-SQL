CREATE DATABASE IF NOT EXISTS sistema_ventas;
USE sistema_ventas;

CREATE TABLE clientes(
	cliente_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(50),
	apellido VARCHAR(50),
	telefono BIGINT, 
	email VARCHAR(50) UNIQUE,
	direccion VARCHAR(100),
	codigo_postal CHAR(4)
);

CREATE TABLE productos(
	producto_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(50),
	descripcion TEXT,
	stock INT,
	precio FLOAT
);

INSERT INTO productos VALUES
(0,'computadora','Dispositivo portatil para ofimatica',10,250.99),
(0,'telefono','Telefono celular para uso personal/profesional',20,500.00),
(0,'auriculares','Auriculares para uso multiple bluetooth 5.0 recargables',5,300.00),
(0,'mouse','Logitech auricular s31323 gaming pro h2 4k',10,100.00),
(0,'teclado','Teclado multiusos :)',50,50.00);

CREATE TABLE ventas(
	venta_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	cliente INT UNSIGNED,
	producto INT UNSIGNED ,
	cantidad_vendida INT UNSIGNED,
	FOREIGN KEY (cliente) 
		REFERENCES clientes(cliente_id)
		ON UPDATE CASCADE
		ON DELETE RESTRICT,
	FOREIGN KEY (producto)
		REFERENCES productos(producto_id)
		ON UPDATE CASCADE
		ON DELETE RESTRICT
	
);

SELECT * FROM clientes;
SELECT * FROM productos;
SELECT * FROM ventas;

DELIMITER //

CREATE PROCEDURE gestionar_ventas_clientes(
	IN i_producto INT UNSIGNED,
	IN i_nombre  VARCHAR(50),
	IN i_apellido  VARCHAR(50),
	IN i_telefono BIGINT,
	IN i_email  VARCHAR(50),
	IN i_direccion  VARCHAR(50),
	IN i_codigo_postal  CHAR(4),
	IN i_cantidad_vendida INT,
	OUT o_respuesta VARCHAR(100)
)
	BEGIN
		DECLARE existe_correo INT DEFAULT 0;
		DECLARE cliente_id INT DEFAULT 0;
        DECLARE stock_disponible INT DEFAULT 0;
			
		START TRANSACTION ;
		
		SELECT COUNT(*) INTO existe_correo
		FROM clientes
		WHERE email = i_email;
        SELECT stock - i_cantidad_vendida INTO stock_disponible
        FROM productos
        WHERE producto_id = i_producto;

		IF existe_correo != 0 THEN
			SELECT 'El correo ya se encuentra registrado' INTO o_respuesta; 
		ELSE
            IF stock_disponible < 0 THEN
                SELECT 'No hay stock suficiente' INTO o_respuesta;
            ELSE 
                INSERT INTO clientes VALUES(0,i_nombre,i_apellido,i_telefono,i_email,i_direccion,i_codigo_postal);
                SELECT LAST_INSERT_ID() INTO cliente_id; 
                
                UPDATE productos SET stock = (stock - i_cantidad_vendida) WHERE producto_id = i_producto;
            
                INSERT INTO ventas VALUES(0,cliente_id,i_producto,i_cantidad_vendida);
                SELECT 'Venta realizada con exito' INTO o_respuesta;
            END IF;
		END IF;
	  COMMIT;
	END //

DELIMITER ;

CALL gestionar_ventas_clientes(2,'Fabrizio','Avila',3518015488,'fabri.avila3@gmail.com','XXXX','1111',15,@repuesta)
SELECT @repuesta;
	