CREATE TABLE paises (
	id_pais INT PRIMARY KEY,
	nom NVARCHAR(50) NOT NULL,
);

CREATE TABLE ciudades (
	id_ciud INT PRIMARY KEY,
	nom NVARCHAR(50) NOT NULL,
	id_pais INT FOREIGN KEY REFERENCES paises
);

CREATE TABLE referencias (
	id_ref INT PRIMARY KEY,
	descrip NVARCHAR(50) NOT NULL,
);

CREATE TABLE areas_vendedores (
	id_area INT PRIMARY KEY,
	nom NVARCHAR(50) NOT NULL
);

CREATE TABLE clientes (
	id_cli INT PRIMARY KEY,
	nom NVARCHAR(50) NOT NULL,
	direc NVARCHAR(50) NOT NULL,
	tel INT NOT NULL,
	cel INT NOT NULL,
	id_ciu INT FOREIGN KEY REFERENCES ciudades
);

CREATE TABLE vendedores (
	id_ven INT PRIMARY KEY,
	nom NVARCHAR(50) NOT NULL,
	cel INT NOT NULL,
	tel INT NOT NULL,
	id_area INT FOREIGN KEY REFERENCES areas_vendedores
);

CREATE TABLE pedidos (
	id_ped INT PRIMARY KEY,
	fecha_ped DATE NOT NULL,
	fecha_ent DATE NOT NULL,
	id_cli INT FOREIGN KEY REFERENCES clientes,
	id_ven INT FOREIGN KEY REFERENCES vendedores
);

CREATE TABLE productos (
	id_prod INT PRIMARY KEY,
	nom NVARCHAR(50) NOT NULL,
	val_und INT NOT NULL,
	id_ref INT FOREIGN KEY REFERENCES referencias
);

CREATE TABLE detalle_pedido_productos (
	id INT PRIMARY KEY,
	cant INT NOT NULL,
	id_prod INT FOREIGN KEY REFERENCES productos,
	id_ped INT FOREIGN KEY REFERENCES pedidos
);