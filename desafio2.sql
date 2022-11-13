CREATE DATABASE desafio2_marco_camargo_123

CREATE TABLE IF NOT EXISTS INSCRITOS(cantidad INT, fecha DATE, fuente
VARCHAR);
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 44, '01/01/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 56, '01/01/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 39, '01/02/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 81, '01/02/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/03/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 91, '01/03/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 48, '01/04/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 45, '01/04/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 55, '01/05/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 33, '01/05/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 18, '01/06/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/06/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 34, '01/07/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 24, '01/07/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 83, '01/08/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 99, '01/08/2021', 'Página' );


/* 1- ¿Cuántos registros hay? */
SELECT COUNT(*) FROM desafio2_marco_camargo_123;

/* 2- ¿Cuántos inscritos hay en total? */
SELECT SUM(cantidad) FROM INSCRITOS;

/* 3- ¿Cuál o cuáles son los registros de mayor antigüedad? */
SELECT * FROM INSCRITOS WHERE fecha = (SELECT MIN(fecha) FROM INSCRITOS);

/* 4- ¿Cuántos inscritos hay por día? (entendiendo un día como una fecha distinta de ahora en adelante) */
SELECT fecha, SUM(cantidad) FROM INSCRITOS GROUP BY fecha;

/* 5- ¿Cuántos inscritos hay por fuente? */
SELECT fuente, SUM(cantidad) FROM INSCRITOS GROUP BY fuente;

/* 6- ¿Qué día se inscribieron la mayor cantidad de personas y cuántas personas se
inscribieron en ese día? */
SELECT fecha, SUM(cantidad) FROM INSCRITOS GROUP BY fecha ORDER BY SUM(cantidad) DESC LIMIT 1;

/* 7- ¿Qué días se inscribieron la mayor cantidad de personas utilizando el blog y cuántas
personas fueron? */
SELECT * FROM inscritos WHERE cantidad = (SELECT MAX(cantidad) FROM inscritos WHERE fuente = 'Blog') LIMIT 1;

/* 8- ¿Cuántas personas en promedio se inscriben en un día? */
SELECT AVG(inscritos_por_dia) AS resultado FROM (SELECT fecha, SUM(cantidad) AS inscritos_por_dia FROM INSCRITOS GROUP BY fecha) AS personas;

/* 9- ¿Qué días se inscribieron más de 50 personas? */
SELECT fecha, SUM(cantidad) FROM INSCRITOS GROUP BY fecha HAVING SUM(cantidad) > 50;

/* 10- ¿Cuántas personas se registraron en promedio cada día a partir del tercer día? */
SELECT AVG(inscritos_por_dia) AS promedio FROM (SELECT fecha, SUM(cantidad) AS inscritos_por_dia FROM inscritos WHERE fecha >= '01/03/2021' GROUP BY fecha) AS personas;