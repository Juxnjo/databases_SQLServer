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
	idProveedor INT FOREIGN KEY REFERENCES proveedores,
	idComponente INT FOREIGN KEY REFERENCES componentes,
	idArticulo INT FOREIGN KEY REFERENCES articulos,
	cantidad INT NOT NULL,
	fechaEnvio DATE NOT NULL
);

