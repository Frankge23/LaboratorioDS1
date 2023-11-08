-- Crear la base de datos
CREATE DATABASE HotelFrank;
USE HotelFrank;

-- Creacion de las Tablas
CREATE TABLE Clientes (
    ClienteID INT IDENTITY(1,1) PRIMARY KEY,
    Nombres VARCHAR(50),
	Apellidos VARCHAR(50),
    Direccion VARCHAR(200),
    Telefono VARCHAR(15)
);

CREATE TABLE Habitaciones (
    HabitacionID INT IDENTITY(1,1) PRIMARY KEY,
    NumeroHabitacion VARCHAR(10),
    TipoHabitacion VARCHAR(50),
    Capacidad INT,
    PrecioPorNoche DECIMAL(10, 2)
);

CREATE TABLE Empleados (
    EmpleadoID INT IDENTITY(1,1) PRIMARY KEY,
    Nombres VARCHAR(100),
	Apellidos VARCHAR(50),
    Puesto VARCHAR(50),
    Salario DECIMAL(10, 2),
    FechaContratacion DATE
);

CREATE TABLE Reservas (
    ReservaID INT IDENTITY(1,1) PRIMARY KEY,
    ClienteID INT,
    HabitacionID INT,
    EmpleadoID INT, 
    FechaEntrada DATE,
    FechaSalida DATE,
    PrecioTotal DECIMAL(10, 2),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
    FOREIGN KEY (HabitacionID) REFERENCES Habitaciones(HabitacionID),
    FOREIGN KEY (EmpleadoID) REFERENCES Empleados(EmpleadoID)  
);

CREATE TABLE Servicios (
    ServicioID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100),
    Descripcion VARCHAR(50),
    Costo DECIMAL(10, 2)
);

CREATE TABLE ReservasServicios (
    ReservaID INT,
    ServicioID INT,
    PRIMARY KEY (ReservaID, ServicioID),
    FOREIGN KEY (ReservaID) REFERENCES Reservas(ReservaID),
    FOREIGN KEY (ServicioID) REFERENCES Servicios(ServicioID)
);

CREATE TABLE Facturas (
    FacturaID INT IDENTITY(1,1) PRIMARY KEY,
    ReservaID INT,
    Total DECIMAL(10, 2),
    FechaEmision DATE,
    FOREIGN KEY (ReservaID) REFERENCES Reservas(ReservaID)
);


-- Inserciones en las Tablas
INSERT INTO Clientes (Nombres, Apellidos, Direccion, Telefono)
VALUES
    ('Cliente1', 'lopez', 'Direcci�n1', '1234-5678'),
    ('Cliente2', 'lopez', 'Direcci�n2', '9876-5432'),
    ('Cliente3', 'lopez', 'Direcci�n3', '2468-1357'),
    ('Cliente4', 'lopez', 'Direcci�n4', '8642-5793'),
    ('Cliente5', 'lopez', 'Direcci�n5', '1357-2468');

INSERT INTO Habitaciones (NumeroHabitacion, TipoHabitacion, Capacidad, PrecioPorNoche)
VALUES
    ('101', 'Individual', 1, 100.00),
    ('102', 'Doble', 2, 150.00),
    ('201', 'Individual', 1, 110.00),
    ('202', 'Doble', 2, 160.00),
    ('301', 'Suite', 3, 250.00);

INSERT INTO Empleados (Nombres,Apellidos, Puesto, Salario, FechaContratacion)
VALUES
    ('Empleado1','Garc�a', 'Recepcionista', 300.00, '2022-01-15'),
    ('Empleado2', 'Rodr�guez','Camarero', 250.00, '2021-08-20'),
    ('Empleado3', 'Sanchez','Gerente', 500.00, '2022-03-10'),
    ('Empleado4', 'lopez','Mantenimiento', 200.00, '2021-12-05'),
    ('Empleado5', 'Martinez','Cocinero', 350.00, '2022-02-28');

INSERT INTO Reservas (ClienteID, HabitacionID, EmpleadoID, FechaEntrada, FechaSalida, PrecioTotal)
VALUES
    (1, 1, 1, '2023-05-01', '2023-05-05', 400.00),
    (2, 2, 2, '2023-06-10', '2023-06-15', 750.00),
    (3, 3, 3, '2023-07-20', '2023-07-25', 1250.00),
    (4, 4, 4, '2023-08-15', '2023-08-20', 400.00),
    (5, 5, 5, '2023-09-01', '2023-09-10', 1750.00);

INSERT INTO Servicios (Nombre, Descripcion, Costo) VALUES
    ('Servicio 1', 'Limpieza diaria', 20.00),
    ('Servicio 2', 'Desayuno buffet', 15.00),
    ('Servicio 3', 'Wi-Fi', 0.00),
    ('Servicio 4', 'Estacionamiento', 10.00),
    ('Servicio 5', 'Spa', 50.00);

	INSERT INTO ReservasServicios (ReservaID, ServicioID) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);

	INSERT INTO Facturas (ReservaID, Total, FechaEmision) VALUES
    (1, 420.00, '2023-08-06'),
    (2, 415.00, '2023-09-16'),
    (3, 800.00, '2023-07-26'),
    (4, 570.00, '2023-08-21'),
    (5, 700.00, '2023-09-11');

-- Consultas Normales
-- 1. Obtener el nombre y el salario de los empleados que ganan m�s de $300
SELECT Nombres, Salario FROM Empleados WHERE Salario > 300;

-- 2. Calcular el costo total de los servicios para una reserva espec�fica (por ejemplo, ReservaID 1)
SELECT SUM(Costo) AS CostoTotal FROM Servicios WHERE ServicioID IN (SELECT ServicioID FROM ReservasServicios WHERE ReservaID = 1);

-- 3. Obtener el n�mero de habitaciones disponibles
SELECT COUNT(*) AS HabitacionesDisponibles FROM Habitaciones WHERE HabitacionID NOT IN (SELECT HabitacionID FROM Reservas WHERE FechaEntrada <= '2023-09-05' AND FechaSalida >= '2023-09-05');

-- 4. Encontrar las reservas realizadas por un cliente espec�fico (por ejemplo, ClienteID 2)
SELECT * FROM Reservas WHERE ClienteID = 2;

-- 5. Calcular el costo promedio de una noche en todas las habitaciones
SELECT AVG(PrecioPorNoche) AS CostoPromedioNoche FROM Habitaciones;

-- Consultas Multitabla, Subconsulta y Joins
-- 1. Obtener los nombres de los clientes que han reservado habitaciones de tipo "Suite"
SELECT C.Nombres
FROM Clientes C
INNER JOIN Reservas R ON C.ClienteID = R.ClienteID
INNER JOIN Habitaciones H ON R.HabitacionID = H.HabitacionID
WHERE H.TipoHabitacion = 'Suite';

-- 2. Encontrar los servicios utilizados en una reserva espec�fica (por ejemplo, ReservaID 3)
SELECT S.Nombre, S.Costo
FROM Servicios S
INNER JOIN ReservasServicios RS ON S.ServicioID = RS.ServicioID
WHERE RS.ReservaID = 3;

-- 3. Obtener el nombre del empleado y el cliente para cada reserva junto con el total de la factura
SELECT E.Nombres AS NombreEmpleado, C.Nombres AS NombreCliente, F.Total AS TotalFactura
FROM Empleados E
INNER JOIN Reservas R ON E.EmpleadoID = R.EmpleadoID
INNER JOIN Clientes C ON R.ClienteID = C.ClienteID
INNER JOIN Facturas F ON R.ReservaID = F.ReservaID;

-- 4. Encontrar las habitaciones disponibles para un rango de fechas (por ejemplo, del 2023-09-10 al 2023-09-15)
SELECT H.NumeroHabitacion
FROM Habitaciones H
WHERE H.HabitacionID NOT IN (SELECT HabitacionID FROM Reservas WHERE FechaEntrada <= '2023-09-15' AND FechaSalida >= '2023-09-10');

-- 5. Calcular el salario promedio de los empleados por puesto
SELECT Puesto, AVG(Salario) AS SalarioPromedio
FROM Empleados
GROUP BY Puesto;
