CREATE TABLE departamentos (
	id_dep NVARCHAR(3) PRIMARY KEY,
	nom NVARCHAR(20) NOT NULL,
	);

CREATE TABLE ciudades (
	id_ciu NVARCHAR(4) PRIMARY KEY,
	id_dep NVARCHAR(3) FOREIGN KEY REFERENCES departamentos,
	nom NVARCHAR(20) NOT NULL
);

CREATE TABLE cargos (
	id_car INT PRIMARY KEY,
	nom NVARCHAR(20) NOT NULL,
	salario MONEY NOT NULL
);

CREATE TABLE empleados (
	id_emp INT PRIMARY KEY,
	nomb NVARCHAR(20) NOT NULL,
	apell NVARCHAR(20) NOT NULL,
	nacimiento DATE NOT NULL,
	id_car INT FOREIGN KEY REFERENCES cargos,
	id_ciu NVARCHAR(4) FOREIGN KEY REFERENCES ciudades,
	direccion NVARCHAR(25) NOT NULL,
	cel INT NOT NULL
);

--Insertando datos

INSERT INTO departamentos (id_dep, nom)
VALUES ('Ant','Antioquia'), ('Val','Valle'), ('Bol','Bolivar'), 
		('Qui','Quindio'), ('Nsa', 'Norte Santander' ), ('San', 'Santander');

INSERT INTO ciudades (id_ciu, id_dep, nom)
VALUES ('Tulu', 'Val', 'Tulua'), ('Cali', 'Val', 'Cali'), ('Mede', 'Ant', 'Medellin'),
		('Gira', 'Ant', 'Girardota'), ('Cucu', 'Nsa', 'Cucuta'), ('Buca', 'San', 'Bucaramanga');

INSERT INTO cargos (id_car, nom, salario)
VALUES (7, 'Operario', 990), (9, 'Ayudante', 780), (11, 'Secretaria Gral', 1100),
		(20, 'Jefe Contabilidad', 3900), (50, 'Gerente General', 7200);

INSERT INTO empleados (id_emp, nomb, apell, nacimiento, id_car, id_ciu, direccion, cel)
VALUES (702040, 'Juan', 'Molina', '01/01/1989', 9, 'Tulu', 'Calle 15 10 10', 3503030),
		(704040, 'Andres', 'Perez', '03/25/1987', 20, 'Gira', 'Circ 2 120 25', 2802030),
		(706020, 'Marina', 'Carrillo', '02/28/1980', 7, 'Cali', 'Kra 5 sur 1d 45', 3416090),
		(708030, 'Rogelio', 'Cabrales', '05/15/1978', 50, 'Tulu', 'Autop sur Kmt 25', 0),
		(705030, 'Diana', 'Moncada', '01/15/1985', 20, 'Mede', 'Diag 25 14 20', 2501030),
		(703050, 'Carlos', 'Carrillo', '12/13/1988', 11, 'Mede', 'Circunv 15 102 32', 0)


--Mostrar todos los datos

SELECT * FROM departamentos
SELECT * FROM ciudades
SELECT * FROM cargos
SELECT * FROM empleados

--Ordenados por cargo

SELECT id_car, id_emp, nomb FROM empleados ORDER BY id_car ASC;

--Empleado por cargo

SELECT * FROM empleados WHERE id_car = 50 OR id_car = 11;

--por apellido y ciudad

SELECT * FROM empleados WHERE apell = 'carrillo' AND id_ciu = 'cali';

--Por cargo y ciudad

SELECT empleados.*
FROM empleados
WHERE id_car = 20 AND empleados.id_ciu IN (
		SELECT ciudades.id_ciu
		FROM ciudades
		WHERE ciudades.nom IN ('Medellin')
);

--Mostrando ciertos datos

SELECT nomb, apell, nacimiento, id_emp FROM empleados;

--Por inicial de apellido

SELECT * FROM empleados WHERE apell LIKE 'm%'

--Por ciudad

SELECT empleados.* 
FROM empleados 
WHERE empleados.id_ciu IN (
		SELECT ciudades.id_ciu
		FROM ciudades
		WHERE ciudades.nom IN ('Cali', 'Medellin', 'Tulua')
);

--Por cargo

SELECT empleados.* 
FROM empleados 
WHERE empleados.id_car IN(
	SELECT cargos.id_car 
	FROM cargos
	WHERE cargos.nom IN ('jefe contabilidad', 'gerente general')
);

--Cargos por salario

SELECT * FROM cargos WHERE salario > 2000;

--Departamenos por vocal y letra

SELECT * FROM departamentos WHERE nom LIKE '%u%' OR nom LIKE '%t%'

SELECT * FROM departamentos WHERE nom LIKE '%a%' AND nom LIKE '%c%'

--Cargos por salario

