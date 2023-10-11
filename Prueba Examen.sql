CREATE DATABASE GONZALEZ_DIAZ;
DROP DATABASE IF EXISTS GONZALEZ_DIAZ;
USE GONZALEZ_DIAZ;

CREATE TABLE PROVEEDOR(
PR VARCHAR(2) PRIMARY KEY,
NOMBRE VARCHAR(20),
ESTADO INT,
CIUDAD VARCHAR(20)
);
DROP TABLE IF EXISTS PROVEEDOR;
DESCRIBE PROVEEDOR;
SELECT * FROM PROVEEDOR;

CREATE TABLE PIEZA(
PZ VARCHAR(2) PRIMARY KEY,
NOMBRE VARCHAR(20),
COLOR VARCHAR(20),
PESO INT,
CIUDAD VARCHAR(20)
);
DROP TABLE IF EXISTS PIEZA;
DESCRIBE PIEZA;
SELECT * FROM PIEZA;

CREATE TABLE SUMINISTRO(
PR VARCHAR(2),
PZ VARCHAR(2),
CANTIDAD INT,
PRIMARY KEY(PR, PZ),
FOREIGN KEY (PR) REFERENCES PROVEEDOR(PR),
FOREIGN KEY (PZ) REFERENCES PIEZA(PZ)
);
DROP TABLE IF EXISTS SUMINISTRO;
DESCRIBE SUMINISTRO;
SELECT * FROM SUMINISTRO;

insert into proveedor values('S1','Salazar',20,'Londres');
insert into proveedor values('S2', 'Jaime', 10, 'París');
insert into proveedor values('S3','Bernal',30,'París');
insert into proveedor values('S4','Corona',20,'Londres');
insert into proveedor values('S5','Aldana',30,'Atenas');

insert into pieza values('P1', 'tuerca', 'verde', 13, 'París');
insert into pieza values('P2', 'perno', 'rojo', 17, 'Londres');
insert into pieza values('P3', 'birlo', 'azul', 17, 'Roma');
insert into pieza values('P4', 'birlo', 'rojo', 14, 'Londres');
insert into pieza values('P5', 'birlo', 'azul', 12, 'París');
insert into pieza values('P6', 'engrane', 'rojo', 19, 'París');

insert into suministro values('S1','P1', 300);
insert into suministro values('S1','P2', 200);
insert into suministro values('S1','P3', 500);
insert into suministro values('S1','P4', 200);
insert into suministro values('S1','P5', 100);
insert into suministro values('S1','P6', 200);
insert into suministro values('S2','P1', 400);
insert into suministro values('S2','P2', 400);
insert into suministro values('S3','P2', 200);
insert into suministro values('S4','P2', 300);
insert into suministro values('S4','P4', 300);
insert into suministro values('S4','P5', 500);


# 1.- Obtener todas las piezas de color verde y rojo. (de dos formas diferentes)
SELECT * FROM PIEZA WHERE COLOR = 'verde' OR COLOR = 'rojo';
SELECT * FROM PIEZA WHERE COLOR IN('verde', 'rojo');

# 2.- Obtener un listado completo de los suministros indicando el nombre del suministrador, el estado, el nombre de la pieza y el color de la misma (de dos formas diferentes)
SELECT PROVEEDOR.NOMBRE, PROVEEDOR.ESTADO, PIEZA.NOMBRE, PIEZA.COLOR FROM PROVEEDOR, PIEZA, SUMINISTRO WHERE SUMINISTRO.PR=PROVEEDOR.PR AND SUMINISTRO.PZ=PIEZA.PZ;

# 3.- Obtener el nombre de las piezas cuyo peso es superior al peso medio de todas las piezas.
SELECT NOMBRE, PESO FROM PIEZA WHERE PESO > (SELECT AVG(PESO) FROM PIEZA);

# 4.- Obtener el nombre de los proveedores que no realizan suministros.
SELECT DISTINCT PROVEEDOR.PR, PROVEEDOR.NOMBRE FROM PROVEEDOR, SUMINISTRO, PIEZA WHERE PROVEEDOR.PR NOT IN(SELECT PROVEEDOR.PR FROM PIEZA, PROVEEDOR, SUMINISTRO WHERE SUMINISTRO.PR=PROVEEDOR.PR AND SUMINISTRO.PZ=PIEZA.PZ);
SELECT DISTINCT PR, NOMBRE FROM PROVEEDOR WHERE PR NOT IN(SELECT PR FROM SUMINISTRO);

# 5.- Aumentar el peso de todas las piezas en un 15%.
UPDATE PIEZA SET PESO = PESO+PESO*0.15;

# 6.- El nombre de los proveedores que realizan más de dos suministros
SELECT PROVEEDOR.PR, PROVEEDOR.NOMBRE, COUNT(SUMINISTRO.PR) AS 'Nº SUMINSTROS' FROM PROVEEDOR, SUMINISTRO WHERE SUMINISTRO.PR=PROVEEDOR.PR GROUP BY SUMINISTRO.PR HAVING COUNT(SUMINISTRO.PR)>2;