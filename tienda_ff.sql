CREATE TABLE categorias (
	id_cat INT PRIMARY KEY,
	nom NVARCHAR(50) NOT NULL
);


CREATE TABLE productos (
	id_prod INT PRIMARY KEY,
	nom NVARCHAR(50) NOT NULL,
	cantidad INT NOT NULL, 
	id_cat INT FOREIGN KEY REFERENCES categorias
);

CREATE TABLE empleados (
	id_emp INT PRIMARY KEY,
	nom NVARCHAR(50) NOT NULL
);

CREATE TABLE clientes (
	id_cli INT PRIMARY KEY,
	nom NVARCHAR(50) NOT NULL
);

CREATE TABLE facturas (
	id_fac INT PRIMARY KEY,
	fecha DATE NOT NULL,
	id_emp INT FOREIGN KEY REFERENCES empleados,
	id_cli INT FOREIGN KEY REFERENCES clientes
);

CREATE TABLE detalle_factura_productos (
	id INT PRIMARY KEY,
	id_fac INT FOREIGN KEY REFERENCES facturas,
	id_cli INT FOREIGN KEY REFERENCES productos,
	cant INT NOT NULL
);

