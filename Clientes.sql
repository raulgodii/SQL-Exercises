DROP TABLE IF EXISTS CLIENTES;
USE SQL_NOTES;

 create table clientes (

  codigo int unsigned auto_increment,

  nombre varchar(30) not null,

  domicilio varchar(30),

  ciudad varchar(20),

  provincia varchar (20),

  telefono varchar(11),

  primary key(codigo)

);

 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)

  values ('Lopez Marcos', 'Colon 111', 'Córdoba','Cordoba','null');

 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)

  values ('Perez Ana', 'San Martin 222', 'Cruz del Eje','Cordoba','4578585');

 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)

  values ('Garcia Juan', 'Rivadavia 333', 'Villa Maria','Cordoba','4578445');

 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)

  values ('Perez Luis', 'Sarmiento 444', 'Rosario','Santa Fe',null);

 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)

  values ('Pereyra Lucas', 'San Martin 555', 'Cruz del Eje','Cordoba','4253685');

 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)

  values ('Gomez Ines', 'San Martin 666', 'Santa Fe','Santa Fe','0345252525');

 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)

  values ('Torres Fabiola', 'Alem 777', 'Villa del Rosario','Cordoba','4554455');

 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)

  values ('Lopez Carlos', 'Irigoyen 888', 'Cruz del Eje','Cordoba',null);

 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)

  values ('Ramos Betina', 'San Martin 999', 'Cordoba','Cordoba','4223366');

 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)

  values ('Lopez Lucas', 'San Martin 1010', 'Posadas','Misiones','0457858745');
  
  
# 4- Obtenga el total de los registros agrupados por provincia:
SELECT provincia, count(*) FROM clientes GROUP BY provincia;

# 5- Obtenga el total de los registros agrupados por ciudad y provincia:
SELECT provincia, ciudad, COUNT(*) FROM clientes GROUP BY CIUDAD,PROVINCIA;
 
# 6- Obtenga el total de los registros agrupados por ciudad y provincia sin considerar los que tienen menos de 2 clientes:
SELECT provincia, ciudad, COUNT(*) FROM clientes GROUP BY CIUDAD,PROVINCIA HAVING COUNT(*)>=2;

# 7- Obtenga el total de los registros sin teléfono nulo, agrupados por ciudad y provincia sin considerar los que tienen menos de 2 clientes:
SELECT ciudad, provincia, COUNT(*) FROM clientes WHERE telefono IS NOT NULL GROUP BY ciudad, provincia HAVING COUNT(*)>=2;
 







 

