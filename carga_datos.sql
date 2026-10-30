--Cree una base nueva para evitar borrar las tablas que uso cuando leo la teoria de coderhouse
CREATE DATABASE Pre_Entrega3;

USE Pre_Entrega3;

--Creacion de tablas
CREATE TABLE Categorias(
id_categoria INT NOT NULL PRIMARY KEY,
nombre_categoria VARCHAR (50) NOT NULL,
descripcion VARCHAR (200) NOT NULL);

CREATE TABLE Clientes(
id_clientes INT NOT NULL PRIMARY KEY,
nombre VARCHAR (100) NOT NULL,
email VARCHAR (100) NOT NULL,
ciudad VARCHAR (50) NOT NULL,
fecha_registro DATE NOT NULL);

CREATE TABLE Productos(
id_producto INT NOT NULL PRIMARY KEY,
nombre_producto VARCHAR (100) NOT NULL, 
id_categoria INT NOT NULL FOREIGN KEY REFERENCES Categorias(id_categoria),
precio DECIMAL (10,2) NOT NULL,
stock INT NOT NULL DEFAULT 0,
activo TINYINT NOT NULL DEFAULT 1);

CREATE TABLE Ventas(
id_venta INT NOT NULL PRIMARY KEY,
id_cliente INT NOT NULL FOREIGN KEY REFERENCES Clientes(id_clientes),
id_producto INT NOT NULL FOREIGN KEY REFERENCES Productos(id_producto),
cantidad INT NOT NULL,
precio_unitario DECIMAL (10,2) NOT NULL,
fecha_venta DATE NOT NULL);

--Carga de datos
INSERT INTO Categorias VALUES (1, 'Computación', 'Laptops, PCs y monitores');
INSERT INTO Categorias VALUES (2, 'Accesorios', 'Periféricos y complementos');
INSERT INTO Categorias VALUES (3, 'Audio', 'Auriculares y parlantes');
INSERT INTO Categorias VALUES (4, 'Almacenamiento', 'Discos y memorias');

INSERT INTO Clientes VALUES (1, 'María López',   'maria@mail.com',   'Buenos Aires', '2024-01-05');
INSERT INTO Clientes VALUES (2, 'Carlos Ruiz',   'carlos@mail.com',  'Córdoba',      '2024-01-10');
INSERT INTO Clientes VALUES (3, 'Ana Gómez',     'ana@mail.com',     'Rosario',      '2024-02-01');
INSERT INTO Clientes VALUES (4, 'Pedro Sanz',    'pedro@mail.com',   'Mendoza',      '2024-02-15');
INSERT INTO Clientes VALUES (5, 'Laura Torres',  'laura@mail.com',   'Tucumán',      '2024-03-01');

INSERT INTO Productos VALUES (1, 'Laptop Pro 15',       1, 1200.00, 15, 1);
INSERT INTO Productos VALUES (2, 'Mouse Inalámbrico',   2,   28.00, 80, 1);
INSERT INTO Productos VALUES (3, 'Monitor 4K 27"',      1,  450.00, 12, 1);
INSERT INTO Productos VALUES (4, 'Auriculares BT Pro',  3,  120.00, 35, 1);
INSERT INTO Productos VALUES (5, 'SSD Externo 1TB',     4,  130.00, 18, 1);
INSERT INTO Productos VALUES (6, 'Teclado Mecánico',    2,   95.00, 40, 1);

INSERT INTO Ventas VALUES (1,  1, 1, 2, 1200.00, '2024-03-05');
INSERT INTO Ventas VALUES (2,  2, 2, 5,   28.00, '2024-03-06');
INSERT INTO Ventas VALUES (3,  3, 3, 1,  450.00, '2024-03-07');
INSERT INTO Ventas VALUES (4,  1, 4, 2,  120.00, '2024-03-08');
INSERT INTO Ventas VALUES (5,  4, 5, 3,  130.00, '2024-03-10');
INSERT INTO Ventas VALUES (6,  2, 6, 4,   95.00, '2024-03-11');
INSERT INTO Ventas VALUES (7,  5, 1, 1, 1200.00, '2024-03-12');
INSERT INTO Ventas VALUES (8,  3, 2, 8,   28.00, '2024-03-13');
INSERT INTO Ventas VALUES (9,  4, 4, 1,  120.00, '2024-03-14');
INSERT INTO Ventas VALUES (10, 5, 3, 2,  450.00, '2024-03-15');

-- Confirmacion
SELECT * FROM Categorias;
SELECT * FROM Clientes;
SELECT * FROM Productos;
SELECT * FROM Ventas;
