CREATE DATABASE ex1RaulGonzalez;
USE ex1RaulGonzalez;
DROP DATABASE IF EXISTS ex1RaulGonzalez;

CREATE TABLE comercial(
id INT(10) PRIMARY KEY,
nombre VARCHAR(100),
apellido1 VARCHAR(100),
apellido2 VARCHAR(100),
ciudad VARCHAR(100),
comision FLOAT
);
DESCRIBE COMERCIAL;
SELECT * FROM COMERCIAL;

CREATE TABLE pedido(
id INT(10) PRIMARY KEY,
cantidad DOUBLE,
fecha DATE,
id_cliente INT(10),
id_comercial INT(10),
FOREIGN KEY (id_cliente) REFERENCES cliente(id),
FOREIGN KEY (id_comercial) REFERENCES comercial(id)
);
DESCRIBE PEDIDO;
SELECT * FROM PEDIDO;

CREATE TABLE cliente(
id INT(10) PRIMARY KEY,
nombre VARCHAR(100),
apellido1 VARCHAR(100),
apellido2 VARCHAR(100),
ciudad VARCHAR(100),
categoria INT(10)
);
DESCRIBE CLIENTE;
SELECT * FROM CLIENTE;

INSERT INTO cliente VALUES(1, 'Aarón', 'Rivero', 'Gómez', 'Almería', 100);
INSERT INTO cliente VALUES(2, 'Adela', 'Salas', 'Díaz', 'Granada', 200);
INSERT INTO cliente VALUES(3, 'Adolfo', 'Rubio', 'Flores', 'Sevilla', NULL);
INSERT INTO cliente VALUES(4, 'Adrián', 'Suárez', NULL, 'Jaén', 300);
INSERT INTO cliente VALUES(5, 'Marcos', 'Loyola', 'Méndez', 'Almería', 200);
INSERT INTO cliente VALUES(6, 'María', 'Santana', 'Moreno', 'Cádiz', 100);
INSERT INTO cliente VALUES(7, 'Pilar', 'Ruiz', NULL, 'Sevilla', 300);
INSERT INTO cliente VALUES(8, 'Pepe', 'Ruiz', 'Santana', 'Huelva', 200);
INSERT INTO cliente VALUES(9, 'Guillermo', 'López', 'Gómez', 'Granada', 225);
INSERT INTO cliente VALUES(10, 'Daniel', 'Santana', 'Loyola', 'Sevilla', 125);
INSERT INTO comercial VALUES(1, 'Daniel', 'Sáez', 'Vega','Almería', 0.15);
INSERT INTO comercial VALUES(2, 'Juan', 'Gómez', 'López','Granada', 0.13);
INSERT INTO comercial VALUES(3, 'Diego','Flores', 'Salas','Huelva', 0.11);
INSERT INTO comercial VALUES(4, 'Marta','Herrera', 'Gil','Granada', 0.14);
INSERT INTO comercial VALUES(5, 'Antonio','Carretero', 'Ortega','Huelva', 0.12);
INSERT INTO comercial VALUES(6, 'Manuel','Domínguez', 'Hernández', 'Jaén', 0.13);
INSERT INTO comercial VALUES(7, 'Antonio','Vega', 'Hernández', 'Jaén', 0.11);
INSERT INTO comercial VALUES(8, 'Alfredo','Ruiz', 'Flores','Almería', 0.05);
INSERT INTO pedido VALUES(1, 150.5, '2017-10-05', 5, 2);
INSERT INTO pedido VALUES(2, 270.65, '2016-09-10', 1, 5);
INSERT INTO pedido VALUES(3, 65.26, '2017-10-05', 2, 1);
INSERT INTO pedido VALUES(4, 110.5, '2016-08-17', 8, 3);
INSERT INTO pedido VALUES(5, 948.5, '2017-09-10', 5, 2);
INSERT INTO pedido VALUES(6, 2400.6, '2016-07-27', 7, 1);
INSERT INTO pedido VALUES(7, 5760, '2015-09-10', 2, 1);
INSERT INTO pedido VALUES(8, 1983.43, '2017-10-10', 4, 6);
INSERT INTO pedido VALUES(9, 2480.4, '2016-10-10', 8, 3);
INSERT INTO pedido VALUES(10, 250.45, '2015-06-27', 8, 2);
INSERT INTO pedido VALUES(11, 75.29, '2016-08-17', 3, 7);
INSERT INTO pedido VALUES(12, 3045.6, '2017-04-25', 2, 1);
INSERT INTO pedido VALUES(13, 545.75, '2019-01-25', 6, 1);
INSERT INTO pedido VALUES(14, 145.82, '2017-02-02', 6, 1);
INSERT INTO pedido VALUES(15, 370.85, '2019-03-11', 1, 5);
INSERT INTO pedido VALUES(16, 2389.23, '2019-03-11', 1, 5);


# EJERCICIO 1
SELECT DISTINCT cliente.id AS 'ID Cliente' FROM cliente, pedido, comercial WHERE (comercial.id=pedido.id_comercial AND cliente.id=pedido.id_cliente) ORDER BY cliente.id ASC;

# EJERCICIO 2
SELECT pedido.id, pedido.fecha, pedido.cantidad FROM cliente, pedido, comercial WHERE (comercial.id=pedido.id_comercial AND cliente.id=pedido.id_cliente) AND (pedido.fecha LIKE '2017%') AND (pedido.cantidad>500);

# EJERCICIO 3
# EJERCICIO 4
# EJERCICIO 5
# EJERCICIO 6
# EJERCICIO 7
SELECT DISTINCT cliente.id AS 'ID Cliente' FROM cliente, pedido, comercial WHERE (comercial.id=pedido.id_comercial AND cliente.id=pedido.id_cliente) GROUP BY cliente.id HAVING count(pedido.id)=0;

# EJERCICIO 8
SELECT cliente.nombre, COUNT(pedido.id) FROM cliente, pedido, comercial WHERE (comercial.id=pedido.id_comercial AND cliente.id=pedido.id_cliente) GROUP BY cliente.nombre HAVING count(pedido.id)=3;