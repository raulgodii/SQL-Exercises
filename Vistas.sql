 CREATE DATABASE VISTAS;
 USE VISTAS;
 
 drop table if exists inscritos;

 drop table if exists socios;

 drop table if exists profesores; 

 drop table if exists cursos;



 create table socios(

  documento char(8) not null,

  nombre varchar(40),

  domicilio varchar(30),

  primary key (documento)

 );



 create table profesores(

  documento char(8) not null,

  nombre varchar(40),

  domicilio varchar(30),

  primary key (documento)

 );



 create table cursos(

  numero integer auto_increment,

  deporte varchar(20),

  dia varchar(15),

  documentoprofesor char(8),

  primary key (numero)

 );



 create table inscritos(

  documentosocio char(8) not null,

  numero integer not null,

  matricula char(1),

  primary key (documentosocio,numero)

 );





# 2- Ingrese algunos registros para todas las tablas:

 insert into socios values('30000000','Fabian Fuentes','Caseros 987');

 insert into socios values('31111111','Gaston Garcia','Guemes 65');

 insert into socios values('32222222','Hector Huerta','Sucre 534');

 insert into socios values('33333333','Ines Irala','Bulnes 345');



 insert into profesores values('22222222','Ana Acosta','Avellaneda 231');

 insert into profesores values('23333333','Carlos Caseres','Colon 245');

 insert into profesores values('24444444','Daniel Duarte','Sarmiento 987');

 insert into profesores values('25555555','Esteban Lopez','Sucre 1204');



 insert into cursos(deporte,dia,documentoprofesor) 

  values('tenis','lunes','22222222');

 insert into cursos(deporte,dia,documentoprofesor) 

  values('tenis','martes','22222222');

 insert into cursos(deporte,dia,documentoprofesor) 

  values('natacion','miercoles','22222222');

 insert into cursos(deporte,dia,documentoprofesor) 

  values('natacion','jueves','23333333');

 insert into cursos(deporte,dia,documentoprofesor) 

  values('natacion','viernes','23333333');

 insert into cursos(deporte,dia,documentoprofesor) 

  values('futbol','sabado','24444444');

 insert into cursos(deporte,dia,documentoprofesor) 

  values('futbol','lunes','24444444');

 insert into cursos(deporte,dia,documentoprofesor) 

  values('basquet','martes','24444444');



 insert into inscritos values('30000000',1,'s');

 insert into inscritos values('30000000',3,'n');

 insert into inscritos values('30000000',6,null);

 insert into inscritos values('31111111',1,'s');

 insert into inscritos values('31111111',4,'s');

 insert into inscritos values('32222222',8,'s');





# 3- Elimine la vista "vista_club" si existe:
DROP VIEW IF EXISTS vista_club;

# 4 - Cree una vista en la que aparezca el nombre y documento del socio, el deporte, el día y el nombre del profesor (no mostrar datos de los socios que no están inscritos en deportes)
describe socios;
describe profesores;
drop view vista;
CREATE VIEW vista AS SELECT socios.nombre as nombre_socio, socios.documento, cursos.deporte, cursos.dia, profesores.nombre FROM socios, cursos, profesores, inscritos WHERE inscritos.documentosocio = socios.documento AND inscritos.numero=cursos.numero AND cursos.documentoprofesor=profesores.documento;

# 5- Muestre la información contenida en la vista.
select * from vista;

# 6- Realice una consulta a la vista donde muestre la cantidad de socios inscritos en cada deporte ordenados por cantidad.
SELECT deporte, COUNT(nombre_socio) FROM vista GROUP BY deporte ORDER BY count(nombre_socio) desc;

# 7- Muestre (consultando la vista) el nombre y documento de los socios que deben matrículas.
SELECT DISTINCT vista.nombre_socio FROM vista, inscritos WHERE vista.documento=inscritos.documentosocio AND matricula <> 's';

# 8- Consulte la vista y muestre los nombres de los profesores y los días en que asisten al club para dictar sus clases.
SELECT DISTINCT nombre, dia FROM vista;

# 9- Muestre todos los socios que son compañeros en tenis los lunes.
SELECT nombre_socio, deporte FROM vista WHERE deporte = 'Tenis' AND dia='Lunes';

# 10 - Cree una nueva vista llamada 'vista_inscritos' que muestre la cantidad de inscritos por curso, incluyendo el nombre del deporte y el día.Elimine la vista previamente si ya existe.
DROP VIEW IF EXISTS vista_inscritos;
CREATE VIEW vista_inscritos AS SELECT deporte, count(deporte) as participantes, dia FROM vista GROUP BY deporte, dia;

# 11- Consulte la vista 'vista_inscritos':
SELECT * FROM vista_inscritos;