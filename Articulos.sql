# BASES DE DATOS
SHOW DATABASES;
CREATE DATABASE sql_notes;
USE sql_notes;


# ELIMINACION TABLAS
	DROP TABLE if exists articulos;


# CREACION TABLAS
 create table articulos(
  codigo int unsigned auto_increment,
  nombre varchar(20) not null,
  descripcion varchar(30),
  precio decimal(4,2) unsigned,
  primary key(codigo)
 );


# INSERCION TABLAS
insert into articulos (nombre,descripcion,precio)
  values('escuadra','plastico 20 cm.',3.50);
insert into articulos (nombre,descripcion,precio)
  values('lápices colores','Join x12',4.50);
insert into articulos (nombre,descripcion,precio)
  values('lápices colores','Join x24',7.50);
insert into articulos (nombre,descripcion,precio)
  values('regla','30 cm.',2.50);
insert into articulos (nombre,descripcion,precio)
  values('fibras','Join x12',10.30);
insert into articulos (nombre,descripcion,precio)
  values('fibras','Join x6',5.10);


# VISUALIZACION DE TABLA
select * from articulos;
describe articulos;



# El comercio, que hasta ahora ha vendido sus artículos por mayor, comenzará la venta por menor. 
# Necesita alterar la tabla agregando un campo para almacenar el precio por menor para cada artículo. 
# Agrege un campo llamado "preciopormenor" de tipo decimal(4,2) detrás de descripción:
alter table articulos add preciopormenor decimal(4,2) after descripcion;

# Actualice el campo "preciopormenor" de todos los registros, dándole el valor del campo "precio" 
# incrementado en un 10%:
update articulos set preciopormenor = precio+(0.1*precio);