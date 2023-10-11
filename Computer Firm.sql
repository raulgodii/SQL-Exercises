DROP DATABASE IF EXISTS COMPUTER_FIRM;
CREATE DATABASE COMPUTER_FIRM;
USE COMPUTER_FIRM;

CREATE TABLE product(
maker VARCHAR(10),
model VARCHAR(50) PRIMARY KEY,
type VARCHAR(50)
);

CREATE TABLE laptop(
code INT PRIMARY KEY,
model VARCHAR(50),
speed SMALLINT,
ram SMALLINT,
hd REAL,
price float,
screen TINYINT,
FOREIGN KEY (model) REFERENCES product(model)
);

CREATE TABLE pc(
code INT PRIMARY KEY,
model VARCHAR(50),
speed SMALLINT,
ram SMALLINT,
hd REAL,
cd VARCHAR(10),
price float,
FOREIGN KEY (model) REFERENCES product(model)
);

CREATE TABLE printer(
code INT PRIMARY KEY,
model VARCHAR(50),
color CHAR(1),
type VARCHAR(10),
price float,
FOREIGN KEY (model) REFERENCES product(model)
);

insert into product values
('A','1232','PC'),
('A','1233','PC'),
('A','1276','Printer'),
('A','1298','Laptop'),
('A','1401','Printer'),
('A','1408','Printer'),
('A','1752','Laptop'),
('B','1121','PC'),
('B','1750','Laptop'),
('C','1321','Laptop'),
('D','1288','Printer'),
('D','1433','Printer'),
('E','1260','PC'),
('E','1434','Printer'),
('E','2112','PC'),
('E','2113','PC');

insert into printer values
(1,'1276','n','laser',400),
(2,'1433','y','jet',270),
(3,'1434','y','jet',290),
(4,'1401','n','matrix',150),
(5,'1408','n','matrix',270),
(6,'1288','n','laser',400);

insert into pc values
('1','1232',500,64,5.0,'12x',600),
('10','1260',500,32,10.0,'12x',350),
('11','1233',900,128,40.0,'40x',980),
('12','1233',800,128,20.0,'50x',970),
('2','1121',750,128,14.0,'40x',850),
('3','1233',800,64,5.0,'12x',600),
('4','1121',600,128,14.0,'40x',850),
('5','1121',600,128,8.0,'40x',850),
('6','1233',750,128,20.0,'50x',950),
('7','1232',500,32,10.0,'12x',400),
('8','1232',450,64,8.0,'24x',350),
('9','1232',450,32,10.0,'24x',350);

insert into laptop values
(1,'1298',350,32,4.0,700,11),
(2,'1321',500,64,8.0,970,12),
(3,'1750',750,128,12.0,1200,14),
(4,'1298',600,64,10.0,1050,15),
(5,'1752',750,128,10.0,1150,14),
(6,'1298',450,64,10.0,950,12);

# 1. Find the model number, speed and hard drive capacity for all the PCs with prices below $500. Result set: model, speed, hd.
SELECT model, speed, hd FROM pc WHERE price<500;

# 2. Find printer makers. Result set: maker.
SELECT DISTINCT maker FROM product, printer WHERE product.model=printer.model;
SELECT DISTINCT maker FROM product WHERE type LIKE'Printer';

# 3. Find the model number, RAM and screen size of the laptops with prices over $1000.
SELECT model, ram, screen FROM laptop WHERE price>1000;

# 4. Find the model number, speed and hard drive capacity of the PCs having 12x CD and prices less than $600 or having 24x CD and prices less than $600.
SELECT model, speed, hd FROM pc WHERE (cd LIKE '12x' AND price<600) OR (cd LIKE '24x' AND price<600);

# 5. Point out the maker and speed of the laptops having hard drive capacity more or equal to 10 Gb.
SELECT product.maker, laptop.speed FROM product, laptop WHERE (product.model = laptop.model) AND (laptop.speed>=10);

# 6. Find out the models and prices for all the products (of any type) produced by maker B.
(SELECT DISTINCT PC.model, PC.price FROM pc, product WHERE product.maker LIKE 'B' AND product.model = pc.model) UNION (SELECT DISTINCT PRINTER.model, PRINTER.price FROM PRINTER, product WHERE product.maker LIKE 'B' AND product.model = PRINTER.model) UNION (SELECT DISTINCT LAPTOP.model, LAPTOP.price FROM LAPTOP, product WHERE product.maker LIKE 'B' AND product.model = LAPTOP.model); 

# 7. Find out the makers that sale PCs but not laptops.
SELECT DISTINCT maker FROM product WHERE type LIKE 'PC' AND maker NOT IN(SELECT maker FROM product WHERE type LIKE 'Laptop');

# 8. Find the printers having the highest price. Result set: model, price.
SELECT model, price FROM printer WHERE price = (SELECT MAX(price) FROM printer);

# 9. Find out the average speed of PCs.
SELECT ROUND(AVG(speed),2) AS 'Average Speed' FROM pc;

# 10. Find all the makers who have all their models of PC type in the PC table
SELECT product.maker, product.model, pc.model FROM pc left join product ON product.model = pc.model;

# 16. Find the makers producing at least three distinct models of PCs. Result set: maker, number of models.
SELECT Maker, COUNT(model) AS 'Number of Models' FROM product WHERE type LIKE 'PC' GROUP BY maker HAVING COUNT(model)>=3;

# 17. Find the makers producing at least both a pc having speed not less than 750 MHz and a laptop having speed not less than 750 MHz. Result set: Maker
SELECT DISTINCT maker FROM product, pc, laptop WHERE (product.model=pc.model OR product.model=laptop.model) AND (pc.speed>=750 AND laptop.speed>=750) ORDER BY maker ASC;

# 18. Find the model number of the product (PC, laptop, or printer) with the highest price.Result set: model
SELECT DISTINCT product.model FROM product, pc, laptop, printer WHERE (product.model = pc.model) OR (product.model = laptop.model) OR (product.model = printer.model);

# 19. Find the printer makers which also produce PCs with the lowest RAM and the highest-speed processor among PCs with the lowest RAM. Result set: maker.
SELECT DISTINCT Maker FROM product, pc, printer WHERE (product.model=printer.model AND product.model=printer.model) AND (pc.ram = (SELECT MIN(ram) FROM pc)) AND (pc.speed = (SELECT MAX(speed) FROM pc WHERE ram = (SELECT MIN(RAM) FROM pc)));

# 20. Define the average price of the PCs and laptops produced by maker A.Result set: single total price.
# 21. Define the average size of the PC hard drive for each maker that also produces printers.Result set: maker, average capacity of HD.


