# BASES DE DATOS
SHOW DATABASES;
CREATE DATABASE sql_notes;
USE world;
show tables from world;

# E1 - Show three of the five columns of the City table. There are lots of rows in the table. We limit the query to the first 10 rows.
describe city;
select ID, Name, CountryCode from city limit 0,10;

# E2 - The LIMIT clause can be followed by two numbers. The first one is the offset and the second one is the number of rows to display. Show rows 16-20. 
select * from city limit 15, 5;

# E3 - There are 4079 cities in the table. We use the built-in COUNT() function to find out the number of rows.
select count(ID) as Filas from city;

# E4 - Show the most populated city in the table.
select name, population from city where population = (select (max(population)) from city);

# E5 - Show the least populated city in the table.
select name, population from city where population = (select min(population) from city);

# E6 - Returns all cities with a population above one million people.
select name, population from city where population>1000000;

# E7 - Select all city names which begin with Kal.
select name from city where name like 'Kal%';

# E8 -  Select all columns for one specific city, namely Bratislava.
select * from city where name = 'Bratislava';

# E9 - Find cities with a population in the range 670,000 and 700,000.
select name, population from city where population between 670000 and 700000 ;

# E10 - Find the 10 most populated cities.
select * from city order by population DESC limit 0,10;

# E11 - Get the 10 least populated cities
select * from city order by population ASC limit 0,10;

# E12 - Order data by city name and get the first ten cities
select * from city order by name ASC limit 10;

# E13 - The total number of people in the towns of the New York.
select sum(population) as TotalNumberOfPeople from city where district = 'New York';

# E14 - Select all districts of USA which have population over 3 million people.
select district from city where CountryCode = 'USA' and population>3000000;

# E15 - The name of the HeadofState. If the database is outdated updated it.
update country set headofstate = 'Jon Biden' where headofstate= 'George W. Bush';
select * from country where headofstate = 'Jon Biden';

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

# 1. Listar código, nombre, continente y población de todos los países. (Se esperan 4 columnas y 239 registros).
describe country;
select code, name, continent, population from country;

# 2. Listar solo.el nombre de todos los lenguajes distintos que existan. (Se espera 1 columna y 457 registros).
select distinct language from countrylanguage;

# 3. Listar nombre y población de cada ciudad, con los nombres de las columnas en castellano. (Se esperan 2 columnas y 4079 registros).
select name as Nombre, population as Población from city;

# 4. Listar el nombre, el GNP como 'Producto Bruto Nacional', el GNPOld como 'Producto Bruto Nacional Anterior' y la diferencia entre estos como 'Diferencia', para todos los países. (Se esperan 4 columnas y 239 registros).
select name as Nombre, gnp as 'Producto Bruto Nacional', GNPOld as 'Producto Nacional Anterior', gnp-gnpold as Diferencia from country;

# 5. Listar el nombre, la cantidad de habitantes, la superficie y una columna llamada 'Densidad' con el resultado de la densidad poblacional de todos los países. (Se esperan 4 columnas y 239 registros).
select name as Nombre, population as 'Cantidad de Habitantes',surfacearea  as 'Superficie', population/surfacearea as 'Densidad' from country;

# 6. Listar toda la información de los países, ordenados por población de manera ascendente. (Se esperan 15 columnas y 239 registros).
select * from country order by population ASC;

# 7. Listar nombre de los lenguajes en orden alfabético. (Se espera 1 columna y 984 registros).
select language from countrylanguage order by language ASC;

# 8. Listar nombre y cantidad de habitantes de las veinte ciudades menos pobladas. (Se esperan 2 columnas y 20 registros).
select name as 'Nombre', population as 'Cantidad de Habitantes' from city order by population ASC limit 20;

# 9. Listar código, nombre y año de independencia de todos los países, ordenados por antigüedad descendente. (Se esperan 3 columnas y 239 registros).
describe country;
select code, name, indepyear from country order by indepyear desc;

# 10. Listar nombre y continente de los cien países con mayor expectativa de vida. Si hubiera países que tengan la misma expectativa de vida, mostrar primero a los de menor superficie. (Se esperan 2 columnas y 100 registros).
select name, continent from country order by lifeexpectancy desc, surfacearea asc limit 100;

# 11. Listar todos los datos de los países que no cuenten con habitantes. (Se esperan 15 columnas y 7 registros).
select * from country where population=0;

# 12. Listar todos los datos de los países cuya expectativa de vida supere los setenta y cinco años, ordenados bajo este concepto de forma ascendente. (Se esperan 15 columnas y 62 registros).
select * from country where lifeexpentancy>75 order by lifeexpentancy asc;

# 13 Listar todos los datos de los países cuya independencia haya ocurrido a partir de la segunda mitad del siglo XIX y su forma de gobierno sea una monarquía constitucional. (Se esperan 15 columnas y 20 registros).
select * from country where indepyear>1850 and governmentform='Constitutional Monarchy';

# 14 Listar todos los datos de los diez países europeos de mayor PBN. (Se esperan 15 columnas y 10 registros).
select * from country order by gnp desc limit 10;

# 15. Listar todos los datos de los países cuyo nombre registrado coincida con su nombre local. (Se esperan 15 columnas y 104 registros).
select * from country where name=localname;

# 16. Listar todos los datos de los países cuya independencia se haya dado a partir de la segunda mitad del siglo XX. (Se esperan 15 columnas y 110 registros).
select * from country where indepyear>1950;

# 17. Listar todos los datos de los países situados en Europa, Asia o Sudamérica. (Se esperan 15 columnas y 111 registros).
select * from country where continent in('Europe', 'Asia', 'South America');

# 18. Listar todos los datos de todos los países, excepto los africanos. (Se esperan 15 columnas y 181 registros).
select * from country where continent not in('Africa');

# 19. Listar todos los datos de las ciudades argentinas fuera de la provincia de Buenos Aires. (Se esperan 5 columnas y 26 registros).
select * from city where countrycode='ARG' and district not in('Buenos Aires');

# 20. Listar todos los datos de las ciudades de entre 125 mil y 130 mil habitantes. (Se esperan 5 columnas y 138 registros).
select * from city where population>=125000 and population<=130000; 

# 21. Listar todos los datos de los países donde no se cuente con datos acerca de su independencia. (Se esperan 15 columnas y 47 registros).
select * from country where indepyear is null;

# 22. Listar todos los datos de los países donde no se tengan datos acerca del PBN anterior ni de la expectativa de vida. (Se esperan 15 columnas y 17 registros).
select * from country where gnpold is null and lifeexpectancy is null;

# 23. Listar todos los datos de los países cuyo nombre comience y termine con ‘A’. (Se esperan 15 columnas y 13 registros).
select * from country where name like 'A%a';

# 24. Listar todos los datos de los países cuyo nombre sea compuesto (más de una palabra). (Se esperan 15 columnas y 66 registros).
select * from country where name like '% %';

# 25. Listar todos los datos de las ciudades cuyo nombre o distrito contengan un '-'. (Se esperan 5 columnas y 372 registros).
select * from city where name like '%-%' or district like '%-%';

# 26. Listar los nombres de los países sudamericanos junto a los nombres (alias 'Capital') de sus capitales. (Se esperan 2 columnas y 14 registros).
describe country;
describe city;
select * from country;
select country.name, city.name as Capital from country, city where (city.id=country.capital) and (country.continent='South America');

# 27. Listar el código de país, junto a los nombres de las ciudades y su cantidad de habitantes, de aquellos cuya expectativa de vida sea mayor a 80. (Se esperan 3 columnas y 253 registros).
SELECT country.code, city.name, country.population FROM city, country WHERE country.code=city.countrycode and country.lifeexpectancy>80;

# 28. Listar las capitales de los países cuya forma de gobierno sea una República Federal. (Se esperan 2 columnas y 15 registros).
select country.name, city.name as Capital from country, city where (city.id=country.capital) and (country.governmentform='Federal Republic');

# 29. Listar los lenguajes oficiales, junto al nombre de sus respectivos países, donde la cantidad de habitantes de dicho país esté entre uno y tres millones. (Se esperan 2 columnas y 14 registros).
SELECT countrylanguage.language, country.name FROM country, countrylanguage WHERE (country.code=countrylanguage.countrycode AND countrylanguage.isofficial LIKE 'T') AND  country.population BETWEEN 100000000 AND 300000000;

# 30. Listar los códigos, los nombres locales y la región a la que pertenecen aquellos países donde se hable español. (Se esperan 3 columnas y 28 registros).
SELECT country.code, country.localname, country.region FROM country, countrylanguage WHERE countrylanguage.countrycode=country.code AND countrylanguage.language='Spanish';

# 31. Listar los nombres y las capitales de los países en cuya capital se concentre más de la mitad de su población total. (Se esperan 2 columnas y 14 registros).
SELECT country.name, country.capital, city.name FROM country, city WHERE country.capital=city.id AND city.population>(country.population/2);

# 32. Listar los nombres y la superficie de los países africanos cuya capital coincida con el nombre del distrito a la que pertenece. (Se esperan 2 columnas y 32 registros).
SELECT country.name, country.surfacearea FROM country, city WHERE continent='Africa' AND capital=city.id AND city.id=district;

# 33. Listar los nombres, las capitales y el año de independencia (sin nulos) de los 20 países más antiguos. (Se esperan 3 columnas y 20 registros).
SELECT name, city.name, capital, indepyear FROM country, city WHERE city.id=country.capital, indepyear IS NOT NULL ORDER BY indepyear ASC LIMIT 20;

# 34. Listar las ciudades junto a sus idiomas oficiales, donde no se hable español, inglés, portugués, italiano, francés o alemán de manera oficial. (Se esperan 2 columnas y 2694 registros).
SELECT city.name, countrylanguage.language FROM city, countrylanguage, country WHERE city.countrycode=country.code AND country.code=countrylanguage.countrycode AND countrylanguage.isofficial='T' AND countrylanguage.language NOT IN('Spanish', 'English', 'French', 'Italian', 'German', 'Portuguese');

# 35. Listar nombre, población y país de las diez ciudades europeas de habla inglesa más pobladas. (Se esperan 3 columnas y 10 registros).


# 36. Mostrar según la tabla de países, la cantidad total de población, la población máxima, la población mínima, el promedio de población y con cuántos registros de población se cuenta. (Se esperan 5 columnas y 1 registro).
# 37. Mostrar según la tabla de países, la cantidad total de población, la población máxima, la población mínima y el promedio de población, por cada continente. (Se esperan 5 columnas y 7 registros).
# 38. Agrupar a todos los países según el continente al que pertenecen. Mostrar los continentes junto a la cantidad de naciones que pertenecen a cada uno. (Se esperan 2 columnas y 7 registros).
# 39. Agrupar a todas las ciudades según el país al que pertenecen. Mostrar los códigos de países junto a la sumatoria total de habitantes de cada uno. (Se esperan 2 columnas y 232 registros).
# 40. Agrupar a todos los lenguajes según su nombre. Mostrar los nombres de los lenguajes junto al porcentaje de habla mínimo registrado para cada uno. (Se esperan 2 columnas y 457 registros).
# 41. Mostrar las distintas formas de gobierno posibles de los países europeos junto a su correspondiente promedio de población que vive bajo estas circunstancias. (Se esperan 2 columnas y 10 registros).
# 42. Mostrar las diez regiones de mayor expectativa de vida promedio. (Se esperan 2 columnas y 10 registros).
# 43. Mostrar los nombres de los diez distritos de mayor cantidad de ciudades con cantidad de habitantes mayor al promedio (Se esperan 2 columnas y 24 registros).
# 45. Mostrar los lenguajes existentes junto a la cantidad de países que lo hablan de manera oficial. (Se esperan 2 columnas y 102 registros).
# 46. Mostrar listados los años de independencia (sin nulos) junto a la cantidad de países que la hayan conseguido en ese año. Se desea visualizar aquellos años donde más de un país se haya independizado. (Se esperan 2 columnas y 39 registros).
# 47. Listar los países junto a la cantidad de idiomas diferentes hablados, pero solo aquellos donde se hablen entre tres y cinco idiomas diferentes. (Se esperan 2 columnas y 80 registros).
# 48. Mostrar los distritos, junto al nombre del país al que pertenecen, cuya población total (también listada) no supere los diez mil habitantes. (Se esperan 3 columnas y 35 registros).
# 49. Mostrar las regiones junto a su densidad poblacional promedio, donde ésta supere a la mitad de la densidad poblacional máxima. (Se esperan 2 columnas y 3 registros).
# 50. Mostrar los lenguajes oficiales junto a su porcentaje promedio de habla, cuyo promedio no supere un dígito entero. (Se esperan 2 columnas y 7 registros).
