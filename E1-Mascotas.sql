# BASES DE DATOS
SHOW DATABASES;
CREATE DATABASE sql_notes;
USE sql_notes;


# ELIMINACION TABLAS
	DROP TABLE if exists mascotas;
    delete from mascotas where nombre = 'Chispa';


# CREACION TABLAS
	CREATE TABLE mascotas(
		nombre VARCHAR(20), 
        propietario VARCHAR(20),
		especie VARCHAR(20), 
        sexo CHAR(1), 
        nacimiento DATE,
		fallecimiento DATE
	); 


# INSERCION TABLAS
	insert into mascotas (nombre, propietario, especie, sexo, nacimiento) values ('Fluffy', 'Arnoldo', 'Gato', 'f', 19990204); 
	insert into mascotas (nombre, propietario, especie, sexo, nacimiento) values ('Mau', 'Juan', 'Gato', 'm', 19980317); 
    insert into mascotas (nombre, propietario, especie, sexo, nacimiento) values ('Buffy', 'Arnoldo', 'Perro', 'f', 19990513); 
    insert into mascotas (nombre, propietario, especie, sexo, nacimiento) values ('FanFan', 'Benito', 'Perro', 'm', 20000827); 
    insert into mascotas (nombre, propietario, especie, sexo, nacimiento, fallecimiento) values ('Kaiser', 'Diana', 'Perro', 'm', 19980831, 19970729); 
    insert into mascotas (nombre, propietario, especie, sexo, nacimiento) values ('Chispa', 'Omar', 'Ave', 'f', 19980911); 
    insert into mascotas (nombre, propietario, especie, nacimiento) values ('Wicho', 'Tomás', 'Ave', 20000209); 
    insert into mascotas (nombre, propietario, especie, sexo, nacimiento) values ('Skim', 'Benito', 'Serpiente', 'm', 20010429); 

# VISUALIZACION DE TABLA
select * from mascotas;
describe mascotas;


# E1
update mascotas set fallecimiento=19890831 where nombre='Kaiser';

# E2
select * from mascotas where nombre = 'Kaiser';

# E3
select * from mascotas where nacimiento>20000101;

# E4
select nombre, propietario from mascotas where sexo='f' and especie = 'Perro';

# E5
select nombre, propietario from mascotas where (sexo = 'f') and (especie in ('Gato','Perro'));

# E6
select nombre, nacimiento from mascotas;

# E7
select distinct propietario from mascotas where propietario is not null and fallecimiento is null;

# E8
select nombre, nacimiento from mascotas where especie in('Perro', 'Gato') and sexo = 'm';

# E9
select nombre, nacimiento from mascotas order by nacimiento ASC;

# E10
select nombre, nacimiento from mascotas order by nacimiento DESC;

# E11 NO SALE
select nombre, especie, nacimiento from mascotas order by especie, nacimiento;

# E12
select nombre, nacimiento from mascotas where nacimiento like '____-02%';

# E13
select nombre from mascotas where nombre like 'B%';

# E14
select nombre from mascotas where nombre like '%fy';

# E15
select propietario,  count(nombre) from mascotas group by propietario;

# E16
select especie, count(nombre) from mascotas group by especie;

# E17
select sexo, count(nombre) from mascotas group by sexo;

# E18
select sexo, especie, count(nombre) from mascotas group by sexo, especie;

# E19
select sexo, especie, count(nombre) from mascotas where especie in('Perro','Gato') group by sexo, especie;

# E20
select * from mascotas where fallecimiento is not null;