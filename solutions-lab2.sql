-- Crear la base de datos lab_mysql si no existe
CREATE DATABASE IF NOT EXISTS lab_mysql;

-- Usar la base de datos lab_mysql
USE lab_mysql;

-- Crear la secuencia para la tabla coches
/*
CREATE OR REPLACE SEQUENCE coches_seq START = 0;

-- Crear la tabla coches
CREATE OR REPLACE TABLE coches (
    id INT DEFAULT coches_seq.nextval PRIMARY KEY,
    vin STRING,
    fabricante VARCHAR(255),
    modelo VARCHAR(255),
    anho INT,
    color VARCHAR(50)
);

-- Crear la secuencia para la tabla clientes
CREATE OR REPLACE SEQUENCE clientes_seq START = 0;

-- Crear la tabla clientes
CREATE OR REPLACE TABLE clientes (
    id INT DEFAULT clientes_seq.nextval PRIMARY KEY,
    id_cliente STRING,
    nombre VARCHAR(255),
    telefono VARCHAR(20),
    email VARCHAR(255),
    direccion VARCHAR(255),
    ciudad VARCHAR(100),
    estado_provincia VARCHAR(100),
    pais VARCHAR(100),
    codigo_postal VARCHAR(20)
);

-- Crear la secuencia para la tabla vendedores
CREATE OR REPLACE SEQUENCE vendedores_seq START = 0;

-- Crear la tabla vendedores
CREATE OR REPLACE TABLE vendedores (
    id INT DEFAULT vendedores_seq.nextval PRIMARY KEY,
    id_personal STRING,
    nombre VARCHAR(255),
    tienda VARCHAR(255)
);

-- Crear la secuencia para la tabla facturas
CREATE OR REPLACE SEQUENCE facturas_seq START = 0;

-- Crear la tabla facturas
CREATE OR REPLACE TABLE facturas (
    id INT DEFAULT facturas_seq.nextval PRIMARY KEY,
    numero_factura STRING,
    fecha DATE,
    Coche INT,
    Cliente INT,
    Vendedor INT,
    FOREIGN KEY (coche) REFERENCES coches(id),
    FOREIGN KEY (cliente) REFERENCES clientes(id),
    FOREIGN KEY (vendedor) REFERENCES vendedores(id)
);
*/
-- Insertar datos en la tabla coches
INSERT INTO coches (vin, fabricante, modelo, anho, color)
VALUES
    ('3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', 2019, 'Azul'),
    ('ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', 2019, 'Rojo'),
    ('RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', 2018, 'Blanco'),
    ('HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4', 2018, 'Plata'),
    ('DAM41UDN3CHU2WVF6', 'Volvo', 'V60', 2019, 'Gris'),
    ('DAM41UDN3CHU2WVF6', 'Volvo', 'V60 Cross Country', 2019, 'Gris');

-- Insertar datos en la tabla clientes
INSERT INTO clientes (id_cliente, nombre, telefono, email, direccion, ciudad, estado_provincia, pais, codigo_postal)
VALUES
    ('10001', 'Pablo Picasso', '+34 636 17 63 82', '-', 'Paseo de la Chopera, 14', 'Madrid', 'Madrid', 'España', '28045'),
    ('20001', 'Abraham Lincoln', '+1 305 907 7086', '-', '120 SW 8th St', 'Miami', 'Florida', 'Estados Unidos', '33130'),
    ('30001', 'Napoléon Bonaparte', '+33 1 79 75 40 00', '-', '40 Rue du Colisée', 'París', 'Île-de-France', 'Francia', '75008');

-- Insertar datos en la tabla vendedores
INSERT INTO vendedores (id_personal, nombre, tienda)
VALUES
    ('00001', 'Petey Cruiser', 'Madrid'),
    ('00002', 'Anna Sthesia', 'Barcelona'),
    ('00003', 'Paul Molive', 'Berlín'),
    ('00004', 'Gail Forcewind', 'París'),
    ('00005', 'Paige Turner', 'Mimia'),
    ('00006', 'Bob Frapples', 'Ciudad de México'),
    ('00007', 'Walter Melon', 'Ámsterdam'),
    ('00008', 'Shonda Leer', 'São Paulo');

-- Insertar datos en la tabla facturas
INSERT INTO facturas (numero_factura, fecha, coche, cliente, vendedor)
VALUES
    ('852399038', '2018-08-22', '0', '1', '3'),
    ('731166526', '2018-12-31', '3', '0', '5'),
    ('271135104', '2019-01-22', '2', '2', '7');


-- Mostrar el contenido de la tablas
SELECT * FROM coches;
SELECT * FROM clientes;
SELECT * FROM vendedores;
SELECT * FROM facturas;


-- Actualizar el valor de la columna tienda para el vendedor con id 4
UPDATE vendedores
SET tienda = 'Miami'
WHERE id = 4;


-- Actualizar valores de la coloumna nombre en la tabla clientes
UPDATE clientes
SET email = 
    CASE
        WHEN nombre = 'Pablo Picasso' THEN 'ppicasso@gmail.com'
        WHEN nombre = 'Abraham Lincoln' THEN 'lincoln@us.gov'
        WHEN nombre = 'Napoléon Bonaparte' THEN 'hello@napoleon.me'
        ELSE email -- 
    END;


-- Eliminar duplicados de la tabla coches
DELETE FROM coches
WHERE id NOT IN (
    SELECT MAX(id)  
    FROM coches
    GROUP BY vin
);




