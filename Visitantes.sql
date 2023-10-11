# BASES DE DATOS
SHOW DATABASES;
CREATE DATABASE sql_notes;
USE sql_notes;


# ELIMINACION TABLAS
-- VISITANTES
	DROP TABLE if exists visitantes;


# CREACION TABLAS
-- MEDICAMENTOS
	 create table visitantes(
		  nombre varchar(30),
		  edad tinyint unsigned,
		  sexo char(1),
		  domicilio varchar(30),
		  ciudad varchar(20),
		  telefono varchar(11),
		  montocompra decimal (6,2) unsigned
	 );


# INSERCION TABLAS
-- VISITANTES
	insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra) values ('Susana Molina', 28,'f','Colon 123','Cordoba',null,45.50); 
	insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra) values ('Marcela Mercado',36,'f','Avellaneda 345','Cordoba','4545454',0);
	insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra) values ('Alberto Garcia',35,'m','Gral. Paz 123','Alta Gracia','03547123456',25); 
	insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra) values ('Teresa Garcia',33,'f','Gral. Paz 123','Alta Gracia','03547123456',0);
	insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra) values ('Roberto Perez',45,'m','Urquiza 335','Cordoba','4123456',33.20);
	insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra) values ('Marina Torres',22,'f','Colon 222','Villa Dolores','03544112233',25);
	insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra) values ('Julieta Gomez',24,'f','San Martin 333','Alta Gracia','03547121212',53.50);
	insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra) values ('Roxana Lopez',20,'f','Triunvirato 345','Alta Gracia',null,0);
	insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra) values ('Liliana Garcia',50,'f','Paso 999','Cordoba','4588778',48); 
    insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra) values ('Juan Torres',43,'m','Sarmiento 876','Cordoba','4988778',15.30);


# SELECCION TABLAS
-- VISITANTES
	select * from visitantes;
    describe visitantes;
    
    
# ELIMINACION FILAS
-- VISITANTES
    
    
# UPDATE
-- VISITANTES
    
    
# CALCULO
-- VISITANTES
	select count(*) from visitantes;
    select count(telefono) from visitantes;
    select count(*) from visitantes where sexo='m';
    select count(*) from visitantes where sexo='f' and edad<25;
    select count(ciudad) from visitantes where ciudad<>'Cordoba';
    select count(*) from visitantes where montocompra>0;
    select count(*) from visitantes where montocompra=0;
    select max(edad) from visitantes;
    select max(edad) from visitantes where sexo='m';

    
