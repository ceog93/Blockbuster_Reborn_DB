-- ----------------------------------
-- Creación y uso de base de datos
-- ----------------------------------
CREATE DATABASE IF NOT EXISTS blockbusterReborn;

USE blockbusterReborn;

-- ----------------------------------
-- Creación de tablas
-- ----------------------------------

CREATE TABLE sucursal(
	idSucursal INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	nombreSucursal VARCHAR(30) NOT NULL
);

CREATE TABLE empleado(
	idEmpleado INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	nombreEmpleado VARCHAR(150) NOT NULL, 
	idSucursal INT NOT NULL,
	CONSTRAINT fk_empleado_sucursal 
		FOREIGN KEY (idSucursal) 
		REFERENCES sucursal(idSucursal)
);

CREATE TABLE cliente(
	idCliente INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	nombreCompleto VARCHAR(150) NOT NULL,
	correoElectronico VARCHAR(200) NOT NULL
);

CREATE TABLE renta(
	idRenta INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	fechaRenta DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
	idCliente INT,
	idEmpleado INT,
	CONSTRAINT fk_renta_cliente 
		FOREIGN KEY (idCliente)
		REFERENCES cliente(idCliente),
	CONSTRAINT fk_renta_empleado
		FOREIGN KEY (idEmpleado)
		REFERENCES empleado(idEmpleado)
);

CREATE TABLE genero (
	idGenero INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	nombreGenero VARCHAR(150) NOT NULL
);

CREATE TABLE pelicula (
	idPelicula INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	titulo VARCHAR(200) NOT NULL,
	anioEstreno INT NOT NULL,
	idGenero INT NOT NULL,
	CONSTRAINT chk_pelicula_anioEstreno
		CHECK (anioEstreno >= 1888),
	CONSTRAINT fk_pelicula_genero
		FOREIGN KEY (idGenero)
		REFERENCES genero(idGenero)
);

CREATE TABLE detalleRenta (
	idDetalle INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	idRenta INT NOT NULL,
	idPelicula INT,
	CONSTRAINT fk_detalleRenta_idRenta
		FOREIGN KEY (idRenta)
		REFERENCES renta(idRenta),
	CONSTRAINT fk_detalleRenta_idPelicuka
		FOREIGN KEY (idPelicula)
		REFERENCES pelicula(idPelicula)
);
-- ----------------------------------
-- DROP DE BASE
-- ----------------------------------

-- DROP DATABASE IF EXISTS blockbusterReborn;

-- ----------------------------------
-- INSERCIÓN DE DATOS
-- ----------------------------------

-- Tabla: sucursal
INSERT INTO sucursal (nombreSucursal) VALUES 
('Sucursal Norte'),
('Sucursal Centro'),
('Sucursal Sur'),
('Sucursal Oriente'),
('Sucursal Occidente');

-- Tabla: empleado
INSERT INTO empleado (nombreEmpleado, idSucursal) VALUES 
('Alejandro Gómez', 1),
('Beatriz Mendoza', 1),
('Carlos Martínez', 2),
('Diana Rodríguez', 3),
('Eduardo López', 4);

-- Tabla: cliente
INSERT INTO cliente (nombreCompleto, correoElectronico) VALUES 
('Fernando Torres', 'fernando.torres@email.com'),
('Gabriela Silva', 'gabriela.silva@email.com'),
('Hugo Sánchez', 'hugo.sanchez@email.com'),
('Isabel Benítez', 'isabel.benitez@email.com'),
('Jorge Herrera', 'jorge.herrera@email.com');

-- Tabla: renta 
INSERT INTO renta (idCliente, idEmpleado) VALUES 
(1, 1),
(2, 2),
(3, 1),
(NULL, 1),
(5, NULL);

-- Tabla: genero
INSERT INTO genero (nombreGenero) VALUES 
('Animación'),
('Fantasía'),
('Aventura'),
('Musical'),
('Familiar');

-- Tabla: pelicula
INSERT INTO pelicula (titulo, anioEstreno, idGenero) VALUES 
('El Rey León', 1994, 1),
('Aladdín', 1992, 2),
('La Bella y la Bestia', 1991, 4),
('Toy Story', 1995, 1),
('Blancanieves y los siete enanitos', 1937, 2);

-- Tabla: detalleRenta
INSERT INTO detalleRenta (idRenta, idPelicula) VALUES 
(1, 1), 
(1, 2),
(2, 3),
(3, 4),
(4, 3),
(5, NULL);


