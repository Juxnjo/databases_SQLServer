USE db_encargos

CREATE TABLE clientes (
	num_cliente INT PRIMARY KEY IDENTITY(100,1),
	nomb_cliente NVARCHAR(50) NOT NULL,
	saldo MONEY,
	limite MONEY CHECK(limite<=3000000),
	descuento INT DEFAULT 0 NOT NULL
);

CREATE TABLE ciudades (
	id_ciud  INT PRIMARY KEY,
	nombre NVARCHAR(50) NOT NULL,
);

CREATE TABLE comunas (
	id_comun INT PRIMARY KEY,
	nombre NVARCHAR(50) NOT NULL,
	id_ciud INT FOREIGN KEY REFERENCES ciudades
);

CREATE TABLE direcciones (
	id_direc INT PRIMARY KEY,
	descrip NVARCHAR(50) NOT NULL,
	num_cliente INT FOREIGN KEY REFERENCES clientes,
	calle NVARCHAR(50) NOT NULL,
	id_comun INT FOREIGN KEY REFERENCES comunas,
	numero INT NOT NULL
);

CREATE TABLE pedidos (
	id_pedido INT PRIMARY KEY,
	fecha DATE NOT NULL,
	id_direc INT FOREIGN KEY REFERENCES direcciones,
	num_cliente INT FOREIGN KEY REFERENCES clientes
);

CREATE TABLE articulos (
	id_art INT PRIMARY KEY,
	descrip NVARCHAR(50) NOT NULL
);

CREATE TABLE fabricas (
	id_fab INT PRIMARY KEY,
	nomb_fab NVARCHAR(50) NOT NULL,
	tel INT NOT NULL
);


CREATE TABLE detalles_pedidos_articulos (
	id INT PRIMARY KEY,
	id_pedido INT FOREIGN KEY REFERENCES pedidos,
	cant INT NOT NULL,
	id_art INT FOREIGN KEY REFERENCES articulos
);

CREATE TABLE detalles_articulos_fabricas (
	id INT PRIMARY KEY,
	id_art INT FOREIGN KEY REFERENCES articulos,
	id_fab INT FOREIGN KEY REFERENCES fabricas,
	cant INT NOT NULL
);




