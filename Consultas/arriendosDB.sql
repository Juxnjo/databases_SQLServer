CREATE TABLE informes (
	idInf INT PRIMARY KEY,
	fecha DATE NOT NULL
);

CREATE TABLE tipoPropiedad (
	idTipoProp NVARCHAR(10) PRIMARY KEY,
	descrip NVARCHAR(10) NOT NULL
);

CREATE TABLE tipoCocina (
	idCocina NVARCHAR(10) PRIMARY KEY,
	descrip NVARCHAR(10) NOT NULL
);

CREATE TABLE ciudades (
	idCiu NVARCHAR(3) PRIMARY KEY,
	descrip NVARCHAR(10) NOT NULL
);

CREATE TABLE direcciones (
	idDirec NVARCHAR(10) PRIMARY KEY,
	descrip NVARCHAR(25) NOT NULL,
	idCiu NVARCHAR(3) FOREIGN KEY REFERENCES ciudades
);

CREATE TABLE propietarios (
	idPropietario INT PRIMARY KEY,
	nombre NVARCHAR(25) NOT NULL,
	idInf INT FOREIGN KEY REFERENCES informes
);

CREATE TABLE propiedades (
	idPropiedad INT PRIMARY KEY,
	idTipoProp NVARCHAR(10) FOREIGN KEY REFERENCES tipoPropiedad,
	idDirec NVARCHAR(10) FOREIGN KEY REFERENCES direcciones,
	nroHabitaciones INT NOT NULL,
	nroServicios INT NOT NULL,
	idCocina NVARCHAR(10) FOREIGN KEY REFERENCES tipoCocina,
	garaje BIT NOT NULL,
	sala INT NOT NULL,
	comedor INT NOT NULL,
	idPropietario INT FOREIGN KEY REFERENCES propietarios
);

INSERT INTO tipoPropiedad (idTipoProp, descrip)
VALUES ('Apto', 'Apartament'), ('Casa', 'Casa')

INSERT INTO direcciones (idDirec, descrip)
VALUES ('Calle 45', 'Calle 45' ), ('Calle 50', 'Calle 50')

INSERT INTO tipoCocina (idCocina, descrip)
VALUES ('Integral','Intregral'), ('SemiInteg', 'Semiinteg')

INSERT INTO propiedades (idPropiedad, idTipoProp, idDirec, nroHabitaciones, nroServicios, idCocina, garaje, sala, comedor)
VALUES (001, 'Apto', 'Calle 45', 3, 2, 'Integral', 1, 1, 1),
		(002, 'Casa', 'Calle 50', 4, 3, 'SemiInteg', 0, 2, 1)


--Listando las tablas

SELECT * FROM propiedades
SELECT * FROM propietarios
SELECT * FROM direcciones
SELECT * FROM ciudades
SELECT * FROM tipoCocina
SELECT * FROM tipoPropiedad
SELECT * FROM informes

--Consultando propiedades que no tienen garaje 

SELECT * FROM propiedades WHERE garaje = 0;

SELECT * FROM propiedades WHERE idTipoProp = 'Casa' AND nroHabitaciones > 3