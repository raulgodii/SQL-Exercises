CREATE DATABASE CLIENTES_PROVINCIAS;
DROP DATABASE IF EXISTS CLIENTES_PROVINCIAS;
USE CLIENTES_PROVINCIAS;

drop table if exists clientes, provincias;

create table clientes (

  codigo int unsigned auto_increment,

  nombre varchar(30) not null,

  domicilio varchar(30),

  ciudad varchar(20),

  codigoProvincia tinyint unsigned,

  telefono varchar(11),

  primary key(codigo)

 );
 
  create table provincias(

  codigo tinyint unsigned auto_increment,

  nombre varchar(20),

  primary key (codigo)

 );
 
  insert into provincias (nombre) values('Cordoba');

 insert into provincias (nombre) values('Santa Fe');

 insert into provincias (nombre) values('Corrientes');

 insert into provincias (nombre) values('Misiones');

 insert into provincias (nombre) values('Salta');

 insert into provincias (nombre) values('Buenos Aires');

 insert into provincias (nombre) values('Neuquen');



 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)

  values ('Lopez Marcos', 'Colon 111', 'Córdoba',1,'null');

 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)

  values ('Perez Ana', 'San Martin 222', 'Cruz del Eje',1,'4578585');

 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)

  values ('Garcia Juan', 'Rivadavia 333', 'Villa Maria',1,'4578445');

 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)

  values ('Perez Luis', 'Sarmiento 444', 'Rosario',2,null);

 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)

  values ('Pereyra Lucas', 'San Martin 555', 'Cruz del Eje',1,'4253685');

 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)

  values ('Gomez Ines', 'San Martin 666', 'Santa Fe',2,'0345252525');

 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)

  values ('Torres Fabiola', 'Alem 777', 'Villa del Rosario',1,'4554455');

 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)

  values ('Lopez Carlos', 'Irigoyen 888', 'Cruz del Eje',1,null);

 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)

  values ('Ramos Betina', 'San Martin 999', 'Cordoba',1,'4223366');

 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)

  values ('Lopez Lucas', 'San Martin 1010', 'Posadas',4,'0457858745');
  
  
 # 4- Queremos saber de qué provincias no tenemos clientes:

 select p.codigo,p.nombre from provincias as p

  left join clientes as c

  on c.codigoProvincia=p.codigo

  where c.codigoprovincia is null;



# 5- Queremos saber de qué provincias si tenemos clientes, sin repetir el nombre de la provincia:
SELECT DISTINCT p.codigo, p.nombre FROM provincias p LEFT JOIN clientes c ON c.codigoProvincia=p.codigo WHERE c.codigoprovincia IS NOT NULL;
 

# 6- Omita la referencia a las tablas en la condición "on" para verificar que la sentencia no se ejecuta porque el nombre del campo "codigo" es ambiguo (ambas tablas lo tienen):
SELECT DISTINCT p.codigo, p.nombre FROM provincias p LEFT JOIN clientes c ON codigoProvincia=codigo WHERE c.codigoprovincia IS NOT NULL;


 create table socios(

  documento char(8) not null,

  nombre varchar(30),

  domicilio varchar(30),

  primary key(documento)

 );



 create table inscriptos(

  documento char(8) not null, 

  deporte varchar(15) not null,

  año year,

  matricula char(1), /*si esta paga ='s' sino 'n'*/

  primary key(documento,deporte,año)

 );
 
  insert into socios values('22333444','Juan Perez','Colon 234');

 insert into socios values('23333444','Maria Lopez','Sarmiento 465');

 insert into socios values('24333444','Antonio Juarez','Caseros 980');

 insert into socios values('25333444','Ana Juarez','Sucre 134');

 insert into socios values('26333444','Sofia Herrero','Avellaneda 1234');



 insert into inscritos values ('22333444','natacion','2015','s');

 insert into inscritos values ('22333444','natacion','2016','n');

 insert into inscritos values ('23333444','natacion','2015','s');

 insert into inscritos values ('23333444','tenis','2016','s');

 insert into inscritos values ('23333444','natacion','2016','s');

 insert into inscritos values ('25333444','tenis','2016','n');

 insert into inscritos values ('25333444','basquet','2016','n');
 
 
 
 # 4- Muestre el nombre del socio, deporte y año realizando un join:
SELECT socios.nombre, inscriptos.deporte, inscriptos.año FROM socios JOIN inscriptos ON socios.documento = inscriptos.documento;

# 5- Muestre los nombres de los socios que no se han inscripto nunca en un deporte:





# 6- Omita la referencia a las tablas en la condición "on" para verificar que la sentencia no se ejecuta porque el nombre del campo "documento" es ambiguo (ambas tablas lo tienen):
 