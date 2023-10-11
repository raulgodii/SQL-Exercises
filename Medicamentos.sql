# BASES DE DATOS
SHOW DATABASES;
CREATE DATABASE sql_notes;
USE sql_notes;


# ELIMINACION TABLAS
-- MEDICAMENTOS
	DROP TABLE if exists medicamentos;


# CREACION TABLAS
-- MEDICAMENTOS
	create table medicamentos(
		codigo int unsigned auto_increment,
		nombre varchar(20),
		laboratorio varchar(20),
		precio decimal(5,2),
		cantidad int unsigned,
		primary key(codigo)
	);


# INSERCION TABLAS
-- MEDICAMENTOS
	insert into medicamentos(nombre, laboratorio, precio, cantidad)values('Sertal','Roche',5.2,100);
	insert into medicamentos(nombre, laboratorio, precio, cantidad)values('Buscapina','Roche',4.10,200);
	insert into medicamentos(nombre, laboratorio, precio, cantidad)values('Amoxdidal 500', 'Bayer', 15.60,100);
	insert into medicamentos(nombre, laboratorio, precio, cantidad)values('Paracetamol 500', 'Bago', 1.90, 200);
	insert into medicamentos(nombre, laboratorio, precio, cantidad)values('Bayaspirina','Bayer', 2.10,150);
	insert into medicamentos(nombre, laboratorio, precio, cantidad)values('Amoxidal jarabe','Bayer', 5.10,250);


# SELECCION TABLAS
-- MEDICAMENTOS
	select * from medicamentos;
    describe medicamentos;
	select * from medicamentos order by precio DESC;
	select * from medicamentos order by cantidad DESC;
	select * from medicamentos order by laboratorio DESC, cantidad;
    select * from medicamentos where nombre like 'Amox%';
    select * from medicamentos where (nombre like 'Paracetamol%')  and (precio<2);
    select * from medicamentos where precio like '%.10';
    select * from medicamentos where nombre not like '%compuesto%';
    
# ELIMINACION FILAS
-- MEDICAMENTOS
	delete from medicamentos where laboratorio like '%y%';
    
# UPDATE
-- MEDICAMENTOS
	update medicamentos set precio=5 where precio<2 and nombre like '%paracetamol%';
    
# CALCULO
-- MEDICAMENTOS
	select count(precio) from medicamentos;
    

    
