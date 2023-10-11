DROP DATABASE IF EXISTS CIENTIFICOS;
CREATE DATABASE CIENTIFICOS;
USE CIENTIFICOS;

CREATE TABLE Cientifico(
DNI VARCHAR(9) PRIMARY KEY,
Nombre VARCHAR(20),
Apellido VARCHAR(20),
Fecha_Nacimiento DATE
);

CREATE TABLE Proyecto(
Codigo VARCHAR(10) PRIMARY KEY,
Nombre VARCHAR(20),
Horas INT
);

CREATE TABLE Asignado(
DNI VARCHAR(9),
Codigo VARCHAR(10),
FOREIGN KEY (DNI) REFERENCES Cientifico(DNI),
FOREIGN KEY (Codigo) REFERENCES Proyecto(Codigo),
PRIMARY KEY(DNI, Codigo)
);

INSERT INTO CIENTIFICO VALUES(1, 'María', 'Guzmán', '1974-02-12');
INSERT INTO CIENTIFICO VALUES(2, 'María', 'Jiménez', '1954-02-11');
INSERT INTO CIENTIFICO VALUES(3, 'Rafael', 'Girado', '1964-01-22');
INSERT INTO CIENTIFICO VALUES(4, 'Alonso', 'Gómez', '1990-12-12');
INSERT INTO CIENTIFICO VALUES(5, 'Clara', 'Antúnez', '1973-11-12');

INSERT INTO PROYECTO VALUES('A', 'Bioquimica', 410);
INSERT INTO PROYECTO VALUES('B', 'Electronica', 1200);
INSERT INTO PROYECTO VALUES('C', 'Geológica', 300);
INSERT INTO PROYECTO VALUES('D', 'Tectónica', 500);
INSERT INTO PROYECTO VALUES('E', 'Histograma', 70);

INSERT INTO ASIGNADO VALUES(1, 'A');
INSERT INTO ASIGNADO VALUES(1, 'B');
INSERT INTO ASIGNADO VALUES(1, 'C');
INSERT INTO ASIGNADO VALUES(2, 'A');
INSERT INTO ASIGNADO VALUES(2, 'B');
INSERT INTO ASIGNADO VALUES(3, 'A');
INSERT INTO ASIGNADO VALUES(4, 'C');
INSERT INTO ASIGNADO VALUES(4, 'A');
INSERT INTO ASIGNADO VALUES(4, 'B');
INSERT INTO ASIGNADO VALUES(4, 'E');
INSERT INTO ASIGNADO VALUES(4, 'D');

SELECT * FROM CIENTIFICO;
SELECT * FROM ASIGNADO;
SELECT * FROM PROYECTO;

# 1.- Relación completa de los científicos asignados a cada proyecto. Mostrar DNI, Nombre del científico, Identificador del proyecto y nombre del proyecto.
SELECT c.dni, c.nombre, p.codigo, p.nombre FROM cientifico c, proyecto p, asignado a WHERE c.dni = a.dni AND p.codigo = a.codigo;

# 2.- Obtener el número de proyectos al que está asignado cada científico (mostrar el DNI y el nombre).
SELECT c.dni, c.nombre, COUNT(a.codigo) FROM cientifico c, asignado a WHERE c.dni = a.dni GROUP BY c.dni, nombre;

# 3.- Obtener el número de científicos asignados a cada proyecto (mostrar el identificador del proyecto y el nombre del proyecto).
SELECT p.codigo, p.nombre, COUNT(a.dni) FROM proyecto p, asignado a WHERE p.codigo = a.codigo GROUP BY p.codigo, p.nombre;

# 4.- Obtener el número de dedicación de cada científico.
SELECT c.dni, c.nombre, c.apellido, SUM(p.horas) FROM cientifico c, proyecto p, asignado a WHERE c.dni = a.dni AND p.codigo = a.codigo GROUP BY c.dni, c.nombre, c.apellido;

# 5.- Obtener el DNI y el nombre de los científicos que se dedican a más de un proyecto y cuya dedicación media a cada proyecto sea superior a las 80 horas.
SELECT c.dni, c.nombre, c.apellido, COUNT(*) AS 'Numero de proyectos' FROM cientifico c, proyecto p, asignado a WHERE c.dni = a.dni AND p.codigo = a.codigo GROUP BY c.dni HAVING COUNT(*)>1 AND min(p.horas)>80;

# 6.- Nombre del científico que trabaja en todos los proyectos.
SELECT c.nombre, c.apellido FROM cientifico c, asignado a WHERE c.dni = a.dni GROUP BY c.dni HAVING COUNT(a.dni) = (SELECT COUNT(p.codigo) FROM proyecto p);

# 7.- Nombre del científico que no trabaja en ningún proyecto.
SELECT nombre FROM cientifico WHERE nombre NOT IN(SELECT c.nombre FROM cientifico c, asignado a WHERE a.dni = c.dni);