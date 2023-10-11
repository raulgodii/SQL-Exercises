# BASES DE DATOS
SHOW DATABASES;
CREATE DATABASE sql_notes;
USE sql_notes;


# ELIMINACION TABLAS
	DROP TABLE if exists empleado;


# CREACION TABLAS
	CREATE TABLE empleado(
		id INT UNSIGNED AUTO_INCREMENT,
		nombre VARCHAR(20), 
        apellido VARCHAR(20),
        trabajo VARCHAR(20),
		edad INT UNSIGNED, 
		salario FLOAT,
        primary key(id)
	); 


# INSERCION TABLAS
	insert into empleado (nombre, apellido, trabajo, edad, salario) values ('Jonie', 'Weber', 'Secretario', 28, 19500); 
    insert into empleado (nombre, apellido, trabajo, edad, salario) values ('Potsy', 'Weber', 'Programador', 32, 45300); 
    insert into empleado (nombre, apellido, trabajo, edad, salario) values ('Dirk', 'Smith', 'Programador', 45, 42053); 
    insert into empleado (nombre, apellido, trabajo, edad, salario) values ('John', 'Smith', 'Director', 30, 10600); 
    insert into empleado (nombre, apellido, trabajo, edad, salario) values ('Verga', 'Larga', 'Ejecutivo', 19, 21023.23); 
    insert into empleado (nombre, apellido, trabajo, edad, salario) values ('Juan', 'Vega', 'Programador', 22, 75620); 
    insert into empleado (nombre, apellido, trabajo, edad, salario) values ('Nate', 'Skies', 'Programador', 20, 42000); 
    insert into empleado (nombre, apellido, trabajo, edad, salario) values ('Justin', 'Bieber', 'Administrador', 80, 65502.50); 


# VISUALIZACION DE TABLA
select * from empleado;
describe empleado;



# E1
select * from empleado;

#E2
select * from empleado where salario>30000;

#E3
select nombre, apellido, edad from empleado where edad<30;

#E4
select nombre, apellido, salario, trabajo from empleado where trabajo='Programador';

#E5
select * from empleado where apellido like '%ebe%';

#E6
select nombre from empleado where nombre='Potsy';

#E7
select * from empleado where edad>80;

#E8
select * from empleado where apellido like '%ith';

# Ordenar nombre y apellidos de los empleados por el salario
select nombre, apellido, salario from empleado order by salario ASC;

# Aquellos empleados cuyo apellido no sea NULL
select nombre, apellido from empleado where apellido is not NULL;

# Empleado cuyo apellido no sea igual a Weber
select nombre, apellido from empleado where apellido<>'Weber';

# Contar numero de empleados que tengan maximo 30 años
select count(edad) as Trabajadores_Jovenes from empleado where edad<30;

# Seleccionar la edad maxima
select nombre, apellido, edad from empleado where edad = (select max(edad) from empleado);

# Nombre y apellido del empleado que cobra mas dinero
select nombre, apellido, salario from empleado where salario = (select max(salario) from empleado);

# Seleccionar media salario con el Alias Media_Salario con 2 decimales
select round(avg(salario),2) as Media_Salario from empleado;

# Añadir nueva columna
alter table empleado add direccion varchar(30);

# Eliminar columna
alter table empleado drop direccion;

# Añadir nueva columna entre apellido y trabajo
alter table empleado add direccion varchar(30) after apellido;

# Modificar nombre a cadena de 30 caracteres
alter table empleado modify nombre varchar(30);

# Quitar clave principal
alter table empleado drop primary key;
alter table empleado modify id int;
alter table empleado add primary key(id, nombre);
alter table empleado modify id int auto_increment;

