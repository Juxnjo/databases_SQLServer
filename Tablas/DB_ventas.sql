USE DB_ventas

CREATE TABLE proveedores (
	id_prov INT PRIMARY KEY,
	nom_prov NVARCHAR(50) NOT NULL,
	direc_prov NVARCHAR(50) NOT NULL,
	tel_prov INT NOT NULL,
	web_prov NVARCHAR(50)
);

CREATE TABLE clientes (
	id_cli INT PRIMARY KEY,
	nom_cli NVARCHAR(50) NOT NULL,
	direc_cli NVARCHAR(50) NOT NULL,
	tel_cli INT NOT NULL
);

CREATE TABLE productos (
	id_prod INT PRIMARY KEY IDENTITY(100,1),
	nom_prod NVARCHAR(50) NOT NULL,
	precio MONEY NULL,
	stock INT DEFAULT 0 NOT NULL,
	id_prov INT FOREIGN KEY REFERENCES proveedores
);

CREATE TABLE categorias (
	id_cat INT PRIMARY KEY IDENTITY(100,1),
	descrip NVARCHAR(50) NOT NULL,
	nom_cat NVARCHAR(50) NOT NULL,
	id_prod INT FOREIGN KEY REFERENCES productos
);

CREATE TABLE telefonos (
	id_tel INT PRIMARY KEY,
	descrip NVARCHAR(50) NOT NULL,
	id_prov INT FOREIGN KEY REFERENCES proveedores,
	id_cli INT FOREIGN KEY REFERENCES clientes
);

CREATE TABLE ciudades (
	id_ciu INT PRIMARY KEY,
	nom_ciu NVARCHAR(50) NOT NULL
);

CREATE TABLE comunas (
	id_com INT PRIMARY KEY,
	nom_com NVARCHAR(50) NOT NULL,
	id_ciu INT FOREIGN KEY REFERENCES ciudades
);

CREATE TABLE direcciones (
	id_direc INT PRIMARY KEY,
	descrip NVARCHAR(50) NOT NULL,
	id_cli INT FOREIGN KEY REFERENCES clientes,
	id_prov INT FOREIGN KEY REFERENCES proveedores,
	calle NVARCHAR(50) NOT NULL,
	numero INT NOT NULL,
	id_com INT FOREIGN KEY REFERENCES comunas
);

CREATE TABLE ventas(
	id_ven INT PRIMARY KEY,
	fecha DATE NOT NULL,
	id_cli INT FOREIGN KEY REFERENCES clientes,
	id_direc INT FOREIGN KEY REFERENCES direcciones,
	cant INT DEFAULT 1 NOT NULL,
	descuento INT DEFAULT 0 NOT NULL,
	precio MONEY NULL,
	);
