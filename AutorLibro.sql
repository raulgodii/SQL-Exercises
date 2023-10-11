CREATE DATABASE AutorLibro;
USE AutorLibro;
SHOW DATABASES;
SHOW TABLES FROM AUTORLIBRO;

CREATE TABLE Libro(
ISBN  INT PRIMARY KEY,
TITULO VARCHAR(30)
);

CREATE TABLE Autor(
DNI INT PRIMARY KEY,
NOMBRE VARCHAR(3)
);
ALTER TABLE AUTOR MODIFY NOMBRE VARCHAR(30);

CREATE TABLE ES_ESCRITO(
ISBN INT,
DNI INT,
FOREIGN KEY (ISBN) REFERENCES Libro(ISBN),
FOREIGN KEY (DNI) REFERENCES Autor(DNI)
);

INSERT INTO Libro VALUES(1, 'El Camino'), (2, 'El 8'), (3, 'Nada');
INSERT INTO Autor VALUES(1, 'Miguel Delibes'), (2, 'Carmen Laforet');
INSERT INTO ES_ESCRITO VALUES(1, 1), (2, 2), (3, 2);

SELECT COUNT(*) FROM LIBRO;
SELECT COUNT(*) FROM AUTOR;
SELECT COUNT(*) FROM ES_ESCRITO;

SELECT COUNT(*) FROM LIBRO, AUTOR;
SELECT COUNT(*) FROM LIBRO, ES_ESCRITO;
SELECT COUNT(*) FROM LIBRO, AUTOR, ES_ESCRITO;

SELECT * FROM LIBRO, AUTOR, ES_ESCRITO;

SELECT * FROM LIBRO, AUTOR, ES_ESCRITO WHERE AUTOR.DNI=ES_ESCRITO.DNI AND LIBRO.ISBN=ES_ESCRITO.ISBN;

-- EL NOMBRE DEL AUTOR Y EL NUMERO DE LIBROS QUE HA ESCRITO
SELECT AUTOR.NOMBRE, COUNT(ES_ESCRITO.ISBN) FROM ES_ESCRITO, AUTOR WHERE ES_ESCRITO.DNI=AUTOR.DNI GROUP BY AUTOR.NOMBRE;

INSERT INTO AUTOR VALUES(3, 'Pérez Reverte');