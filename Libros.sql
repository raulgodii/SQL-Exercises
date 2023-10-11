show databases;
create database libros;
USE libros;

create table libros(

  codigo int unsigned auto_increment,

  titulo varchar(60) not null,

  autor varchar(30),

  editorial varchar(15),

  precio decimal(5,2) unsigned,

  primary key (codigo)

 );



insert into libros (titulo,autor,editorial,precio)

  values('El aleph','Borges','Planeta',15);

insert into libros (titulo,autor,editorial,precio)

  values('Martin Fierro','Jose Hernandez','Emece',22.20);

insert into libros (titulo,autor,editorial,precio)

  values('Antologia poetica','Borges','Planeta',40);

insert into libros (titulo,autor,editorial,precio)

  values('Aprenda PHP','Mario Molina','Emece',18.20);

insert into libros (titulo,autor,editorial,precio)

  values('Cervantes y el quijote','Borges','Paidos',36.40);

insert into libros (titulo,autor,editorial,precio)

  values('Manual de PHP', 'J.C. Paez', 'Paidos',30.80);

insert into libros (titulo,autor,editorial,precio)

  values('Harry Potter y la piedra filosofal','J.K. Rowling','Paidos',45.00);

insert into libros (titulo,autor,editorial,precio)

  values('Harry Potter y la camara secreta','J.K. Rowling','Paidos',46.00);

insert into libros (titulo,autor,editorial,precio)

  values('Alicia en el pais de las maravillas','Lewis Carroll','Paidos',null);
  
# Cantidad de libros agrupados por editorial
SELECT editorial, count(*) FROM libros group by editorial;

# Cantidad de libros agrupados por editorial (pero solo los que tengan mas de dos)
SELECT editorial, count(*) FROM libros group by editorial HAVING COUNT(*)>2;

# Promedio de los precios de los libros agrupados por editorial
SELECT editorial, AVG(precio) AS PRECIO_MEDIO FROM LIBROS GROUP BY EDITORIAL;

# Promedio de los precios de los libros agrupados por editorial (SOLO LOS DE MAS DE 25€)
SELECT editorial, AVG(precio) AS PRECIO_MEDIO FROM LIBROS GROUP BY EDITORIAL HAVING AVG(PRECIO)>25;

# Contar libros agrupados por editorial sin tener en cuenta la editorial 'Planeta'
SELECT editorial, COUNT(*) FROM libros WHERE editorial NOT IN('Planeta') GROUP BY editorial;
SELECT editorial, COUNT(*) FROM libros GROUP BY editorial HAVING editorial NOT IN('Planeta');

# Cantidad de libros sin tener en cuenta los que tienen precio nulo, agrupados por editorial, rechazando los de editorial 'Planeta'
SELECT editorial, COUNT(*) FROM libros WHERE precio IS NOT NULL AND editorial<>'Planeta' GROUP BY editorial;
SELECT editorial, COUNT(*) FROM libros WHERE precio IS NOT NULL GROUP BY editorial HAVING editorial<>'Planeta';

# Mayor valor de los libros agrupados por editorial y luego seleccionar las filas que tengan un valor mayor o igual a 30
SELECT editorial, MAX(precio) FROM libros GROUP BY EDITORIAL;
SELECT editorial, MAX(precio) FROM libros GROUP BY EDITORIAL HAVING MAX(precio)>=30;