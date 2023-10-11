DROP DATABASE IF EXISTS ejercicio4;
CREATE DATABASE ejercicio4 CHARACTER SET utf8mb4;
USE ejercicio4;

CREATE TABLE empleados(
dni varchar(8) primary key,
nombre nvarchar(100),
apellidos nvarchar(255),
departamento int
);
DESCRIBE empleados;
INSERT INTO empleados (dni, nombre, apellidos, departamento)
VALUES ('12345678', 'Juan', 'Pérez', 1),
('87654321', 'Maria', 'García', 2),
('11111111', 'Pedro', 'Martínez', 1),
('22222222', 'Ana', 'Rodriguez', 3),
('33333333', 'Carlos', 'Sánchez', 2),
('44444444', 'Raquel', 'Sánchez', 4);

CREATE TABLE departamentos(
codigo int primary key,
nombre nvarchar(100),
presupuesto int
);
DESCRIBE departamentos;
INSERT INTO departamentos (codigo, nombre, presupuesto)
VALUES (1, 'Ventas', 100000),
(2, 'Compras', 50000),
(3, 'Recursos Humanos', 75000),
(4, 'Marketing', 90000),
(5, 'Informática', 125000);

# 1.- Obtener los apellidos de los empleados.
SELECT apellidos FROM empleados;

# 2.- Obtener los apellidos de los empleados sin repeticiones.
SELECT DISTINCT apellidos FROM empleados;

# 3.- Obtener todos los datos de los empleados que se apellidan López.’
SELECT * FROM empleados WHERE apellidos='López';

# 4.- Obtener todos los datos de los empleados que se apellidan ‘López’ y los que se apellidan ‘Pérez’.
SELECT * FROM empleados WHERE apellidos='López' OR apellidos='Pérez';

# 5.- Obtener todos los datos de los empleados que trabajan para el departamento 14.
SELECT * FROM empleados WHERE departamento = 14;

# 6.- Obtener todos los datos de los empleados que trabajan para el departamento 37 y para el departamento 77.
SELECT * FROM emleados WHERE departamento = 37 AND departamento = 77;

# 7.- Obtener todos los datos de los empleados cuyo apellido empiece por ‘P’.
SELECT * FROM empleados WHERE apellidos LIKE 'P%';

# 8.- Obtener el presupuesto total de todos los departamentos.
SELECT SUM(presupuesto) AS 'Presupuesto total' FROM departamentos;

# 9.- Obtener el número de empleados en cada departamento.
SELECT Departamento, COUNT(*) AS 'Nº Empleados' FROM EMPLEADOS GROUP BY Departamento;

# 10.- Obtener un listado completo de empleados, incluyendo por cada empleado los datos del empleado y de su departamento.
SELECT * FROM empleados;

# 11.- Obtener un listado completo de empleados, incluyendo el nombre y apellidos del empleado junto al nombre y presupuesto de su departamento.
SELECT e.nombre, e.apellidos, d.nombre, d.presupuesto FROM empleados e, departamentos d;

# 12.- Obtener los nombres y apellidos de los empleados que trabajen en departamentos cuyo presupuesto sea mayor que 60.000 €
SELECT empleados.nombre, empleados.apellidos FROM empleados, departamentos WHERE departamentos.presupuesto>60000;

# 13.- Obtener los datos de los departamentos cuyo presupuesto es superior al presupuesto medio de todos los departamentos.

# 14.- Obtener los nombres (únicamente los nombres) de los departamentos que tienen más de dos empleados.

# 15.- Añadir un nuevo departamento ‘Calidad’ con presupuesto 40.000 euros y código 11. Añadir un empleado vinculado al departamento recién creado: Esther Vázquez, DNI:89267109.

# 16.- Aplicar un recorte presupuestario del 10% a todos los departamentos.

# 17.- Reasignar a los empleados del departamento de investigación (código 77) al departamento de informática (código 14).

# 18.- Despedir a todos los empleados que trabajan para el departamento de informática (código 14).

# 19.- Despedir a todos los empleados que trabajen para departamentos cuyo presupuesto sea superior a los 60.000€.

# 20.- Despedir a todos los empleados.
