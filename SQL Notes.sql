
-- Esto es un comentario de una línea

# Esto es otro comentario de otra línea

/* esto
es un
comentario
multilínea
*/


# eliminar tabla				drop table nombre_tabla

# eliminar fila
	-- delete from libros where codigo=3;

# seleccionar					select
	-- select * from libros
    
# seleccionar con requisitos 	where
	-- select * from libros where precio>25 or editorial='Emece';
    
# estructura tabla				describe
	-- describe medicamentos
    
# insertar 						insert into
	-- insert into nombre_tabla values(valores);

# distinto						apellido <> 'Jimenez'

# es null						is null

# no es null					is not null
	-- select * from libros where autor is not null
    
# entre							between
	-- select * from libros where precio between 20 and 40
    -- select * from libros where precio not between 20 and 40
    -- select * from libros where precio>=20 and precio<=40
    
# seleccionar valores exactos	IN
	-- select * from libro where autor IN('Borges','Juan Pereyra')
    
# comodin cadena				%

# comodin caracter				_

# conector OR					OR

# conector AND					AND

# ordenar						order by
# ascendente / descendente		asc / desc (por defecto es asc)
	-- 	select * from medicamentos order by precio DESC;

# empezar por una letra			like
	-- select titulo, editorial from libros where (titulo like 'j%') and (editorial like '%s');
    
# actualizar					update
	-- UPDATE libros SET editorial='Paidoss' WHERE editorial = 'Paidos';
	-- UPDATE libros SET  cantidad=cantidad+10;
    
# calculo 						count
	-- count(determina columna) calcula el numero de filas que cumple una determinada condicion
    -- select count(precio) from medicamentos;
    -- select count(*) from libros
    -- select count(editorial) from libros where editorial='Emece'
    
# maximo						max
# minimo						min
# media							avg
	-- select max(edad) from visitantes;
    -- select max(edad) from visitantes where sexo='m';
    
# seleccion sin repetir 		select distinct
	-- select distinct propietario from mascotas where propietario is not null and fallecimiento is null;
    
# alias							as
	-- select avg(salario) as Media_Salario from empleado;
    
# redondear decimales			round
	-- select round(avg(salario),2) as Media_Salario from empleado;
    
# subconsulta					select + select
	-- select nombre, apellido, salario from empleado where salario = (select max(salario) from empleado);
    -- select nombre, apellido, edad from empleado where edad = (select max(edad) from empleado);
    
# añadir columnas				alter + add
	-- alter table empleado add direccion varchar(30);
    -- alter table empleado add direccion varchar(30) after apellido;
    
# eliminar columna			alter + drop
	-- alter table empleado drop direccion;
    -- alter table empleado drop primary key;
    
# modificar columna			alter + modify
	-- alter table empleado modify nombre varchar(30);
    
# limite					limit
	-- select * from city limit 15, 5;
    -- select * from tabla limit ValoraPartir, ValoresSiguientes;
    
# clave foranea				foreign key references
	-- FOREIGN KEY (ISBN) REFERENCES Libro(ISBN)
    -- FOREIGN KEY (DNI) REFERENCES Autor(DNI)
    
# alias en multitablas		tabla alias
	-- SELECT p.nombre, p.precio, f.nombre FROM producto p, fabricante f WHERE p.id_fabricante=f.id;
    
# having					having
	-- SIEMPRE OBLIGATORIO DESPUES DE UN GROUP BY
    -- SELECT editorial, AVG(precio) AS PRECIO_MEDIO FROM LIBROS GROUP BY EDITORIAL HAVING AVG(PRECIO)>25;
    
# join

# union

# <ALL >ALL

# <ANY >ANY

# <SOME >SOME

# view					create view
	-- CREATE VIEW vista_portatiles AS SELECT * FROM PRODUCT NATURAL JOIN LAPTOP;
    
# index 				show index from
	-- show index from printer;