CREATE TABLE informes (
	idInf INT PRIMARY KEY,
	fecha DATE NOT NULL
);

CREATE TABLE tipoPropiedad (
	idTipoProp INT PRIMARY KEY,
	descrip NVARCHAR(10) NOT NULL
);

CREATE TABLE tipoCocina (
	idCocina INT PRIMARY KEY,
	descrip NVARCHAR(10) NOT NULL
);

CREATE TABLE ciudades (
	idCiu INT PRIMARY KEY,
	descrip NVARCHAR(10) NOT NULL
);

CREATE TABLE direcciones (
	idDirec INT PRIMARY KEY,
	descrip NVARCHAR(25) NOT NULL,
	idCiu INT FOREIGN KEY REFERENCES ciudades
);

CREATE TABLE propietarios (
	idPropietario INT PRIMARY KEY,
	nombre NVARCHAR(25) NOT NULL,
	idInf INT FOREIGN KEY REFERENCES informes
);

CREATE TABLE propiedades (
	idPropiedad INT PRIMARY KEY,
	idTipoProp INT FOREIGN KEY REFERENCES tipoPropiedad,
	nroHabitaciones INT NOT NULL,
	idCocina INT FOREIGN KEY REFERENCES tipoCocina,
	idDirec INT FOREIGN KEY REFERENCES direcciones,
	nroServicios INT NOT NULL,
	garaje BIT NOT NULL,
	sala BIT NOT NULL,
	comedor BIT NOT NULL,
	idPropietario INT FOREIGN KEY REFERENCES propietarios
);