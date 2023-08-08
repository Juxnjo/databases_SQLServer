CREATE TABLE productos (
	idProd INT PRIMARY KEY IDENTITY(100,1),
	nombre NVARCHAR(20) NOT NULL,
	valor MONEY NOT NULL
);

CREATE TABLE clientes (
	idCli INT PRIMARY KEY IDENTITY (10000000,99),
	nombre NVARCHAR(30) NOT NULL,
	apellido NVARCHAR(30) NOT NULL,
	cel INT NOT NULL,
	ingresos INT DEFAULT 0 NOT NULL
);

CREATE TABLE facturas (
	idFac INT PRIMARY KEY IDENTITY (1000,2),
	idProd INT FOREIGN KEY REFERENCES productos,
	idCli INT FOREIGN KEY REFERENCES clientes,
	cantidad INT DEFAULT 1 NOT NULL,
	descuento INT DEFAULT 0 NOT NULL,
	precio MONEY NOT NULL
);

SELECT * FROM productos
SELECT * FROM clientes
SELECT * FROM facturas

INSERT INTO productos (nombre, valor)
VALUES ('Grafica', 599), ('Monitor', 999), ('Mouse', 35), ('Teclado', 100), ('Diadema', 99),
		('Procesador', 499), ('Board', 249), ('RAM', 99), ('SSD', 100), ('HDD', 59)

INSERT INTO clientes(nombre, apellido, cel, ingresos)
VALUES ('Juan', 'Petro', 1854545 , 200 ), ('Sandra', 'Cano', 5454754, 0), ('Randy', 'Orton', 54564564 , 0 ),
		('Leandro', 'Sins', 324545 , 1 ), ('Lucas', 'Cano', 545423, 99), ('Paco', 'Elche', 54564 , 2 ),
		('Jose', 'Madrid', 1854535 , 200 ), ('Sandra', 'Perez', 5454754, 0), ('Walter', 'Mailo', 54564 , 99 )

