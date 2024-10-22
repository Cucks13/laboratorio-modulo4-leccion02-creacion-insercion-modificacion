-- Ejercico 1
--1.1 Crea la database logistica	
create database logistica;
--1.2 Creación de tablas
create table clientes (
	id_cliente serial primary key,
	nombre varchar,
	email varchar unique,
	direccion varchar,
	telefono int unique,
	pais varchar
);

create table empleados (
	id_empleado serial primary key,
	nombre varchar,
	cargo varchar,
	email varchar unique
);

create table proveedores (
	id_proveedor serial primary key,
	nombre varchar,
	contacto varchar,
	telefono varchar unique,
	direccion varchar
);

create table envios (
	id_envio serial primary key,
	id_cliente int,
	id_empleado int,
	id_proveedor int,
	fecha_envio date,
	estado varchar,
	total decimal,
	foreign key (id_cliente)
		references clientes(id_cliente)
		on delete restrict
		on update cascade,
	foreign key (id_empleado)
		references empleados(id_empleado)
		on delete restrict
		on update cascade,
	foreign key (id_proveedor)
		references proveedores(id_proveedor)
		on delete restrict
		on update cascade
);

create table detalle_envio (
	id_detalle serial primary key,
	id_envio int,
	producto varchar,
	cantidad int,
	precio_unitario decimal,
	foreign key (id_envio)
		references envios(id_envio)
		on delete restrict
		on update cascade
);

create table regiones (
	id_region serial primary key,
	nombre varchar,
	pais varchar
);


--Ejercicio 2: Inserción de Datos

--1. Inserta al menos **10 clientes** en la tabla `Clientes`.
INSERT INTO clientes (nombre, email, direccion, telefono, pais) VALUES
('Juan Pérez', 'juan.perez@example.com', 'Calle Falsa 123', 1234567890, 'México'),
('Ana Gómez', 'ana.gomez@example.com', 'Av. Principal 45', 2345678901, 'España'),
('Luis Martínez', 'luis.martinez@example.com', 'Plaza Mayor 67', 3456789012, 'Argentina'),
('María López', 'maria.lopez@example.com', 'Calle Sol 89', 4567890123, 'Chile'),
('Pedro Fernández', 'pedro.fernandez@example.com', 'Carrera 5 101', 5678901234, 'Colombia'),
('Sofía Ramírez', 'sofia.ramirez@example.com', 'Av. Libertad 303', 6789012345, 'Perú'),
('Carlos Sánchez', 'carlos.sanchez@example.com', 'Calle Luna 11', 7890123456, 'Uruguay'),
('Lucía Ortega', 'lucia.ortega@example.com', 'Boulevard Central 456', 8901234567, 'Ecuador'),
('Miguel Torres', 'miguel.torres@example.com', 'Av. República 78', 9012345678, 'Paraguay'),
('Daniela Mendoza', 'daniela.mendoza@example.com', 'Paseo de las Flores 14', 9123456789, 'Costa Rica');


--2. Inserta al menos **5 empleados** en la tabla `Empleados`.
INSERT INTO empleados (nombre, cargo, email) VALUES
('Carlos Ruiz', 'Gerente', 'carlos.ruiz@example.com'),
('Laura Morales', 'Vendedor', 'laura.morales@example.com'),
('Jorge González', 'Asistente', 'jorge.gonzalez@example.com'),
('Andrea Rodríguez', 'Analista', 'andrea.rodriguez@example.com'),
('Ricardo García', 'Supervisor', 'ricardo.garcia@example.com');

--3. Inserta al menos **3 proveedores** en la tabla `Proveedores`.
INSERT INTO proveedores (nombre, contacto, telefono, direccion) VALUES
('Proveedora Industrial S.A.', 'José Silva', '1112223334', 'Av. Industriales 101'),
('Distribuciones Globales Ltda.', 'Elena Vargas', '2223334445', 'Calle Comercio 202'),
('Servicios Logísticos S.A.', 'Carlos Pérez', '3334445556', 'Parque Empresarial 303');

--4. Inserta al menos **8 envíos** en la tabla `Envíos`, asignando envíos a los clientes, empleados y proveedores registrados.
INSERT INTO envios (id_cliente, id_empleado, id_proveedor, fecha_envio, estado, total) VALUES
(1, 1, 1, '2024-10-01', 'Entregado', 1000.00),
INSERT INTO envios (id_cliente, id_empleado, id_proveedor, fecha_envio, estado, total) VALUES
(2, 2, 2, '2024-10-02', 'En tránsito', 1500.50),
INSERT INTO envios (id_cliente, id_empleado, id_proveedor, fecha_envio, estado, total) VALUES
(3, 3, 1, '2024-10-03', 'Entregado', 1200.75),
INSERT INTO envios (id_cliente, id_empleado, id_proveedor, fecha_envio, estado, total) VALUES
(4, 4, 3, '2024-10-04', 'Pendiente', 980.25),
INSERT INTO envios (id_cliente, id_empleado, id_proveedor, fecha_envio, estado, total) VALUES
(5, 5, 3, '2024-10-05', 'En tránsito', 1100.80),
(6, 1, 2, '2024-10-06', 'Entregado', 1600.60),
(7, 2, 3, '2024-10-07', 'Pendiente', 1050.90),
(8, 3, 1, '2024-10-08', 'Entregado', 2000.00);

--5. Inserta los detalles correspondientes en la tabla `Detalle de Envíos`, asegurando que las cantidades y precios unitarios sean consistentes con los productos y los envíos.
INSERT INTO detalle_envio (id_envio, producto, cantidad, precio_unitario) VALUES
(17, 'Producto A', 10, 100.00),
(18, 'Producto B', 15, 100.03),
(19, 'Producto C', 20, 60.04),
(25, 'Producto D', 7, 140.25),
(21, 'Producto E', 9, 122.30),
(22, 'Producto F', 11, 145.50),
(23, 'Producto G', 12, 60.00),
(24, 'Producto H', 5, 200.00);

--6. Inserta al menos **5 regiones** en la tabla `Regiones`.
INSERT INTO regiones (nombre, pais) VALUES
('Norteamérica', 'Estados Unidos'),
('Sudamérica', 'Brasil'),
('Europa', 'España'),
('Asia', 'China'),
('Oceanía', 'Australia');


ALTER TABLE clientes
  ALTER COLUMN telefono TYPE bigint;

select * from envios

--Ejercicio 3: Modificación y Actualización de Datos


--1. Actualizar el Estado de un Envío. Actualiza el estado del envío con `id_envio = 21` a "Entregado".
UPDATE envios
SET estado = 'Entregado'
WHERE id_envio = 21;


--2. Modificar el Cargo de un Empleado. Cambia el cargo del empleado con `id_empleado = 5` a "Director de Datos".
UPDATE empleados
SET cargo = 'Director de Datos'
WHERE id_empleado = 5;

--3. Incrementar el Precio Unitario de un Producto. Incrementa en un 10% el precio unitario del producto "Producto A" en la tabla `Detalle_Envíos`.
UPDATE detalle_envio
SET precio_unitario = precio_unitario * 1.10
WHERE producto = 'Producto A';

--4. Actualizar la Dirección de un Cliente. Modifica la dirección del cliente con `id_cliente = 2` a "Nueva Calle B, 123".
UPDATE clientes
SET direccion = 'Nueva Calle B, 123'
WHERE id_cliente = 2;

--5. Cambiar el Proveedor de un Envío. Cambia el proveedor del envío con `id_envio = 25` al proveedor con `id_proveedor = 3`.
UPDATE envios
SET id_proveedor = 3
WHERE id_envio = 25;

--6. Actualizar la Cantidad de un Producto en un Envío. Modifica la cantidad del producto "Producto C" en el envío con `id_envio = 2` a 5 unidades.
UPDATE detalle_envio
SET cantidad = 5
WHERE producto = 'Producto C' AND id_envio = 2;

--7. Actualizar el Total de un Envío. Incrementa el total del envío con `id_envio = 5` en 50 unidades monetarias.
UPDATE envios
SET total = total + 50
WHERE id_envio = 5;

--8. Modificar el Contacto de un Proveedor. Cambia el contacto del proveedor con `id_proveedor = 2` a "Nuevo Contacto 2".
UPDATE proveedores
SET contacto = 'Nuevo Contacto 2'
WHERE id_proveedor = 2;

--9. Cambiar el País de un Cliente. Actualiza el país del cliente con `id_cliente = 6` a "Portugal".
UPDATE clientes
SET pais = 'Portugal'
WHERE id_cliente = 6;

--10. Actualizar la Fecha de un Envío. Modifica la fecha del envío con `id_envio = 7` a "2024-08-10".
UPDATE envios
SET fecha_envio = '2024-08-10'
WHERE id_envio = 7;


--Ejercicio 4: Eliminación de Datos

--1. Añadir una Columna. Añade una columna `fecha_nacimiento` de tipo `DATE` a la tabla `Clientes`.
alter table clientes add column fecha_nacimiento DATE;

--2. Añadir una Columna. Añade una columna `codigo_postal` de tipo `VARCHAR(10)` a la tabla `Proveedores`.
alter table proveedores add column codigo_postal VARCHAR(10);

--3. Eliminar una Columna. Elimina la columna `contacto` de la tabla `Proveedores`.
alter table proveedores drop column contacto;

--4. Eliminar una Columna. Elimina la columna `pais` de la tabla `Regiones`.
alter table regiones drop column pais;

--5. Modificar el Tipo de Dato de una Columna. Modifica el tipo de dato de la columna `telefono` en la tabla `Clientes` a `VARCHAR(15)`.
alter table clientes alter column telefono type VARCHAR(15);

--6. Modificar el Tipo de Dato de una Columna. Modifica el tipo de dato de la columna `total` en la tabla `Envíos` a `NUMERIC(12, 2)`.
alter table envios alter column total type NUMERIC(12, 2);

--7. Añadir una Columna. Añade una columna `fecha_contrato` de tipo `DATE` a la tabla `Empleados`.
alter table empleados add column fecha_contrato DATE;

--8. Eliminar una Columna. Elimina la columna `estado` de la tabla `Envíos`.
alter table envios drop column estado;

--9. Modificar el Nombre de una Columna. Modifica el nombre de la columna `nombre` en la tabla `Empleados` a `nombre_completo`.
alter table empleados rename column nombre to nombre_completo;

--Ejercicio 5: Contesta a las siguientes preguntas usando queries


--1. Listar todos los clientes que viven en España.
select * from clientes where pais = 'España';

--2. Obtener todos los envíos realizados por un empleado específico.
select * from envios where id_empleado = (select id_empleado from empleados where nombre_completo = 'Carlos Ruiz');

--3. Listar todos los productos incluidos en un envío específico.
select producto from detalle_envio where id_envio = '21';

--4. Encontrar todos los proveedores con un teléfono específico.
select * from proveedores where telefono = '1112223334';

--5. Listar los empleados que tienen un cargo de "Supervisor de Envíos".
select * from empleados where cargo = 'Vendedor';

--6. Obtener todos los envíos que fueron realizados por el cliente con id_cliente = 5.
select * from envios where id_cliente = 5;

--7. Listar todas las regiones con su nombre y país.
select nombre, pais from regiones;

--8. Mostrar todos los productos cuyo precio unitario sea mayor que 50.
select * from detalle_envio where precio_unitario > 50;

--9. Obtener todos los envíos realizados el 2024-08-05.
select * from envios where fecha_envio = '2024-08-05';
