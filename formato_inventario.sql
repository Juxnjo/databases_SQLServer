CREATE TABLE empleados (
	id_emp INT PRIMARY KEY,
	nombre_emp NVARCHAR(50) NOT NULL
);

CREATE TABLE piezas (
	cod_pieza INT PRIMARY KEY,
	nom_pieza NVARCHAR(50) NOT NULL,
	descr_pieza NVARCHAR(50) NOT NULL
);

CREATE TABLE departamentos (
	id_dep INT PRIMARY KEY,
	nom_dep NVARCHAR(50) NOT NULL
);

CREATE TABLE jefes (
	id_jef INT PRIMARY KEY,
	nom_jef NVARCHAR(50) NOT NULL
);

CREATE TABLE informes (
	id_inf INT PRIMARY KEY IDENTITY(100,1),
	fecha_inv DATE NOT NULL,
	total_piezas INT NOT NULL,
	id_emp INT FOREIGN KEY REFERENCES empleados,
	id_dep INT FOREIGN KEY REFERENCES departamentos,
	id_jefe INT FOREIGN KEY REFERENCES jefes
);

CREATE TABLE detalle_informe_piezas (
	id INT PRIMARY KEY,
	cant INT NOT NULL,
	cod_pieza INT FOREIGN KEY REFERENCES piezas,
	id_inf INT FOREIGN KEY REFERENCES informes
); 