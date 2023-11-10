
CREATE DATABASE HairStyluz;
-- Usar labase de datos
USE HairStyluz;

-- Crear la tabla de clientes
CREATE TABLE clientes (
 id_cliente INT AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(50) NOT NULL,
 apellido VARCHAR(50) NOT NULL,
 direccion VARCHAR(100),
 telefono VARCHAR(20),
 email VARCHAR(100),
 fecha_registro DATE NOT NULL
);

-- Crear la tabla de servicios
CREATE TABLE servicios (
 id_servicio INT AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(50) NOT NULL,
 descripcion TEXT,
 precio DECIMAL(10, 2) NOT NULL
);



-- Crear la tabla de empleados
CREATE TABLE empleados (
 id_empleado INT AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(50) NOT NULL,
 apellido VARCHAR(50) NOT NULL,
 direccion VARCHAR(100),
 telefono VARCHAR(20),
 email VARCHAR(100),
 fecha_contratacion DATE NOT NULL,
 salario DECIMAL(10, 2) NOT NULL,
 cargo VARCHAR(50)
);

-- Crear la tabla de citas
CREATE TABLE citas (
 id_cita INT AUTO_INCREMENT PRIMARY KEY,
 id_cliente INT NOT NULL,
 id_empleado INT NOT NULL,
 id_servicio INT NOT NULL,
 fecha_hora DATETIME NOT NULL,
 duracion_minutos INT NOT NULL,
 FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
 FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado),
 FOREIGN KEY (id_servicio) REFERENCES servicios(id_servicio)
);

-- Crear la tabla de ventas
CREATE TABLE ventas (
 id_venta INT AUTO_INCREMENT PRIMARY KEY,
 id_cliente INT NOT NULL,
 id_empleado INT NOT NULL,
 fecha_venta DATE NOT NULL,
 total DECIMAL(10, 2) NOT NULL,
 FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
 FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);

-- Crear la tabla de detalles de venta
CREATE TABLE detalles_venta (
 id_detalle INT AUTO_INCREMENT PRIMARY KEY,
 id_venta INT NOT NULL,
 id_servicio INT NOT NULL,
 cantidad INT NOT NULL,
 precio DECIMAL(10, 2) NOT NULL,
 FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
 FOREIGN KEY (id_servicio) REFERENCES servicios(id_servicio)
);
EXEC SP_TABLES @TABLE_OWNER = 'dbo';
SHOW TABLES;