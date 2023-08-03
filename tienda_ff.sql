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
	cantidad INT NOT NULL
);

INSERT INTO categorias (id_cat, nom) VALUES (1, 'compu');
INSERT INTO productos (id_prod, nom, cantidad, id_cat) VALUES (1, 'usb', 10, 1), (2, 'cds', 5, 1), (3, 'mouse', 10, 1);
INSERT INTO empleados (id_emp, nom) VALUES (1, 'carlos'), (2, 'mario');
INSERT INTO clientes (id_cli, nom) VALUES (100, 'juan'), (101, 'sandra'), (102, 'maria'), (103, 'alex');
INSERT INTO facturas (id_fac, fecha, id_emp, id_cli) VALUES (300, '10/10/2022', 2, 102), (301, '10/05/2023', 2, 102), (302, '10/06/2022', 2, 102)

