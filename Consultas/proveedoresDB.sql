CREATE TABLE ciudades(
	idCiudad NVARCHAR(3) PRIMARY KEY,
	nombreCiudad NVARCHAR(50) NOT NULL
);

CREATE TABLE articulos (
	idArticulo INT PRIMARY KEY IDENTITY (100,100),
	nombreArticulo NVARCHAR(50) NOT NULL,
	idCiudad NVARCHAR(3) FOREIGN KEY REFERENCES ciudades
	);

CREATE TABLE componentes (
	idComponente INT PRIMARY KEY IDENTITY (10,10),
	nombreComponente NVARCHAR(3) NOT NULL,
	color NVARCHAR(10) NOT NULL,
	peso INT NOT NULL,
	idCiudad NVARCHAR(3) FOREIGN KEY REFERENCES ciudades
);

CREATE TABLE proveedores (
	idProveedor INT PRIMARY KEY IDENTITY (1,1),
	nombreProveedor NVARCHAR(50) NOT NULL,
	categoria INT NOT NULL,
	idCiudad NVARCHAR(3) FOREIGN KEY REFERENCES ciudades
);


CREATE TABLE envios (
	idEnvios INT PRIMARY KEY IDENTITY (9,3),
	idProveedor INT FOREIGN KEY REFERENCES proveedores,
	idComponente INT FOREIGN KEY REFERENCES componentes,
	idArticulo INT FOREIGN KEY REFERENCES articulos,
	cantidad INT NOT NULL,
	fechaEnvio DATE NOT NULL
);


INSERT INTO ciudades (idCiudad, nombreCiudad)
VALUES ('Bar', 'Barranquilla'), ('Med', 'Medellin'), ('Cal', 'Cali'), ('Bog', 'Bogota')

INSERT INTO articulos (nombreArticulo, idCiudad)
VALUES ('Clasificadora', 'Bar'), ('Perforadora', 'Med'), ('Lectora', 'Cal'), ('Consola', 'Bog'), ('Mezcladora', 'Bar'), 
		('Terminal', 'Med'), ('Cinta', 'Cal'), ('Clasificadora', 'Bog'), ('Perforadora', 'Bog'), ('Lectora', 'Bar')

INSERT INTO componentes (nombreComponente, color, peso, idCiudad)
VALUES ('X3A', 'Rojo', 12, 'Bar'), ('B85', 'Verde', 17, 'Med'), ('C4B', 'Azul', 17, 'Cal'),
		('VT8', 'Morado', 20, 'Bog'), ('C30', 'Amarillo', 30, 'Bar'), ('X3A', 'Rojo', 54, 'Med'),
		('B86', 'Verde', 28, 'Cal'), ('C4B', 'Azul', 10, 'Bog'), ('VT9', 'Morado', 23, 'Bog'),
		('C31', 'Amarillo', 30, 'Bar')

INSERT INTO proveedores (nombreProveedor, categoria, idCiudad)
VALUES ('Andres Verjel', 10, 'Bar'), ('Carlos Villareal', 20, 'Med'), ('Julian Jaramillo', 30, 'Cal'),
		('Jose Perez', 40, 'Bog'), ('Andrea Morales', 10, 'Bar'), ('Eva Braunt', 20, 'Med'),
		('Christian Mejia', 30, 'Cal'), ('Natalia Mendoza', 40, 'Bog'), ('Daniel Ruiz', 40, 'Bog')

INSERT INTO envios (idProveedor, idComponente, idArticulo, cantidad, fechaEnvio)
VALUES (1, 10, 100, 100, '20090113'), (2, 20, 200, 200, '20090315'), (3, 30, 300, 300, '20090315'), 
		(4, 40, 400, 400, '20090620'), (5, 50, 500, 5000, '20090113'), (6, 60, 600, 4560, '20090620'), 
		(7, 70, 700, 100, '20090315'), (8, 80, 800, 200, '20090113'), (9, 90, 900, 300, '20090315'), 
		(1, 100, 1000, 400, '20090620'), (2, 10, 100, 5000, '20090113'), (3, 20, 200, 4560, '20090620'), 
		(4, 30, 300, 300, '20091230'), (5, 40, 400, 400, '20090113'), (6, 50, 500, 5000, '20090315'), 
		(7, 60, 600, 4560, '20090113'), (8, 70, 700, 100, '20090620'), (9, 80, 800, 200, '20090113'), 
		(7, 60, 600, 4560, '20090113'), (8, 70, 700, 100, '20090620'), (9, 80, 800, 200, '20090113'), 
		(1, 90, 900, 300, '20091230'), (2, 100, 1000, 400, '20090620'), (3, 10, 100, 5000, '20091230'), 
		(4, 20, 200, 4560, '20090315'), (5, 30, 300, 100, '20091230'), (6, 40, 400, 200, '20090620'), 
		(7, 50, 500, 300, '20091230'), (8, 60, 600, 400, '20090315'), (9, 70, 700, 5000, '20091230')


--Se requiere conocer de la tabla proveedores, las categorías y ciudades únicas.

SELECT DISTINCT categoria, idCiudad
FROM proveedores;

SELECT categoria, idCiudad
FROM proveedores
GROUP BY categoria, idCiudad;

--Se requiere visualizar los diferentes proveedores, cuya ciudad sea Bogotá y Barranquilla

SELECT idProveedor, nombreProveedor, idCiudad 
FROM proveedores 
WHERE idCiudad = 'Bog' OR idCiudad = 'Bar'

SELECT proveedores.*
FROM proveedores
WHERE proveedores.idCiudad IN (
	SELECT ciudades.idCiudad
	FROM ciudades
	WHERE ciudades.nombreCiudad IN ('Bogota', 'Barranquilla')
)

--Se requiere conocer los componentes cuyo nombre componente sea "X3A" y su peso este entre 20 y 60

SELECT nombreComponente, peso
FROM componentes 
WHERE nombreComponente = 'X3A' AND peso BETWEEN 20 AND 60

--Se requiere conocer las cantidades de envíos, por cada nombre artículo cuya ciudad sea Barranquilla

SELECT 
    articulos.nombreArticulo,
    (
        SELECT SUM(envios.cantidad)
        FROM envios
        WHERE envios.idArticulo = articulos.idArticulo
    ) AS TotalEnvios
FROM articulos
WHERE articulos.idCiudad = 'Bar';

--Se requiere visualizar cuantos envíos se realizan por cada id_componente 

SELECT idComponente, COUNT(*) AS CantidadEnvios
FROM envios
GROUP BY idComponente;


--Se requiere visualizar cuantos envíos se realizan por cada nombre componente que en su color comienza por "A"

