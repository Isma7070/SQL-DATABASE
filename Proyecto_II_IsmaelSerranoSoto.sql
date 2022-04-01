/*
ISMAEL DAVID SERRANO SOTO 117350921
*/

--PRIMERA PARTE

CREATE DATABASE TiendaInstrumentosMusicales
GO

USE TiendaInstrumentosMusicales
GO


CREATE TABLE Tienda
(
Id int NOT NULL,
Nombre varchar(50),
Direccion varchar(200),
Telefono int
);

CREATE TABLE CategoriaInstrumento
(
Id varchar(3) NOT NULL,
Descripcion varchar(50) NOT NULL
);

CREATE TABLE Cliente
(
Id int NOT NULL,
Nombre varchar(50) NOT NULL,
Apellido1 varchar(50) NOT NULL,
Apellido2 varchar(50) NULL,
);

CREATE TABLE Fabricante
(
Id int NOT NULL,
Nombre varchar(50) NOT NULL
);

CREATE TABLE Instrumento
(
Id int IDENTITY(1,1) NOT NULL,
Nombre varchar(50) NOT NULL,
IdCategoria varchar(3) NOT NULL,
IdFabricante int NOT NULL,
AnnioLanzamiento int NOT NULL,
Precio money NOT NULL
);

CREATE TABLE Factura
(
Id int IDENTITY(1,1) NOT NULL,
IdTienda int NOT NULL,
IdCliente int NOT NULL,
Subtotal money NOT NULL,
Impuesto money NOT NULL,
Total money NOT NULL
);

CREATE TABLE DetalleFactura
(
IdFactura int NOT NULL,
IdInstrumento int NOT NULL,
Cantidad money NOT NULL,
Total money NOT NULL
);


--Estableciendo las Llaves Primarias
ALTER TABLE Tienda ADD CONSTRAINT
PKTienda PRIMARY KEY(Id);

ALTER Table CategoriaInstrumento ADD CONSTRAINT
PKCategoriaInstrumento PRIMARY KEY(Id);

ALTER TABLE Cliente ADD CONSTRAINT
PKCliente PRIMARY KEY(Id);

ALTER TABLE Fabricante ADD CONSTRAINT
PKFabricante PRIMARY KEY(Id);

ALTER TABLE Instrumento ADD CONSTRAINT
PKInstrumento PRIMARY KEY(Id);

ALTER TABLE Factura ADD CONSTRAINT
PKFactura PRIMARY KEY(Id);

ALTER TABLE DetalleFactura ADD CONSTRAINT
PKDetalleFactura PRIMARY KEY(IdFactura, IdInstrumento);

--Estableciendo las llaves foraneas
 ALTER TABLE Instrumento ADD CONSTRAINT
FK_CategoriaInstrumento FOREIGN KEY(IdCategoria) REFERENCES CategoriaInstrumento(Id);

 ALTER TABLE Instrumento ADD CONSTRAINT
FK_FabricanteInstrumento FOREIGN KEY(IdFabricante) REFERENCES Fabricante(Id);

ALTER TABLE Factura ADD CONSTRAINT
FK_TiendaFactura FOREIGN KEY(IdTienda) REFERENCES Tienda(Id);

ALTER TABLE Factura ADD CONSTRAINT
FK_ClienteFactura FOREIGN KEY(IdCliente) REFERENCES Cliente(Id);

ALTER TABLE DetalleFactura ADD CONSTRAINT
FK_FacturaDetalleFactura FOREIGN KEY(IdFactura) REFERENCES Factura(Id);

ALTER TABLE DetalleFactura ADD CONSTRAINT
FK_InstrumentoDetalleFactura FOREIGN KEY(IdInstrumento) REFERENCES Instrumento(Id);


INSERT INTO Tienda 
VALUES(1187723, 'Tienda de Instrumentos Pheonix', '300 metros sur de Repuestos Colibrí, Hacienda Vieja, Orotina', 24258976);

INSERT INTO CategoriaInstrumento VALUES ('VNT', 'Viento');
INSERT INTO CategoriaInstrumento VALUES ('CRD', 'Cuerda');
INSERT INTO CategoriaInstrumento VALUES ('PRC', 'Percusión');
INSERT INTO CategoriaInstrumento VALUES ('ELC', 'Electrico');
INSERT INTO CategoriaInstrumento VALUES ('VOZ', 'VOZ');
INSERT INTO CategoriaInstrumento VALUES ('TCL', 'Teclado');
INSERT INTO CategoriaInstrumento VALUES ('ELE', 'Electronico');

INSERT INTO Fabricante VALUES('1', 'Yamaha');
INSERT INTO Fabricante VALUES('2', 'Gibson');
INSERT INTO Fabricante VALUES('3', 'Harmann Profesional');
INSERT INTO Fabricante VALUES('4', 'Gold Peak');
INSERT INTO Fabricante VALUES('5', 'Sennheiser');
INSERT INTO Fabricante VALUES('6', 'Kawai');
INSERT INTO Fabricante VALUES('7', 'Pearl');
INSERT INTO Fabricante VALUES('8', 'Shure');
INSERT INTO Fabricante VALUES('9', 'Fender');
INSERT INTO Fabricante VALUES('10', 'Stack');

INSERT INTO Cliente VALUES(0, 'Sin Nombre', 'Sin Nombre', 'Sin Nombre');
INSERT INTO Cliente VALUES(123, 'José', 'Vargas', 'Villalobos');
INSERT INTO Cliente VALUES(456, 'Maria', 'Solano', 'Vega');
INSERT INTO Cliente VALUES(789, 'Juan', 'Marchena', 'Salinares');
INSERT INTO Cliente VALUES(987, 'Alberto', 'Soto', 'Solano');
INSERT INTO Cliente VALUES(654, 'Keitling', 'Pérez', 'Zúñiga');
INSERT INTO Cliente VALUES(312, 'Marcos', 'Sánchez', 'Berrocal');
INSERT INTO Cliente VALUES(147, 'Ana', 'Soto', 'Martínez');
INSERT INTO Cliente VALUES(258, 'Pedro', 'Manzanares', 'Sandoval');
INSERT INTO Cliente VALUES(369, 'Layla', 'Cascante', 'Opio');
INSERT INTO Cliente VALUES(357, 'Jennifer', 'Nuñez', 'Mendoza');

INSERT INTO Instrumento
VALUES('Motiff8' , 'TCL', 1, 2018, 848000);
INSERT INTO Instrumento
VALUES('Guitarra Acústica X10' , 'CRD', 1, 2012, 185000);
INSERT INTO Instrumento
VALUES('Sax Alto 20' , 'VNT', 1, 2000, 575000);
INSERT INTO Instrumento
VALUES('Bajo Z12' , 'CRD', 7, 2015, 145000);
INSERT INTO Instrumento
VALUES('Trompeta 111' , 'VNT', 7, 2002, 110000);
INSERT INTO Instrumento
VALUES('Microfono de cable UP1' , 'VOZ', 8, 2017, 57500);
INSERT INTO Instrumento
VALUES('Guitarra Acústica Sensation2' , 'CRD', 9, 2011, 114000);
INSERT INTO Instrumento
VALUES('Oxygen 400' , 'TCL', 9, 2016, 225000);
INSERT INTO Instrumento
VALUES('Guitarra Electrica Ligth20' , 'ELC', 2, 2008, 135000);
INSERT INTO Instrumento
VALUES('Banjo WoodPickLAOS' , 'CRD', 5, 2009, 40000);



INSERT INTO Factura VALUES (1187723, 123, 97500, 12675, 110175);
INSERT INTO Factura VALUES (1187723, 357, 370000, 48100, 418100);
INSERT INTO Factura VALUES (1187723, 357, 905500, 117715, 1023215);
INSERT INTO Factura VALUES (1187723, 123, 114000, 14820, 128820);
INSERT INTO Factura VALUES (1187723, 456, 220000, 28600, 248600);
INSERT INTO Factura VALUES (1187723, 789, 135000, 17550, 152550);
INSERT INTO Factura VALUES (1187723, 654, 225000, 29250, 254250);
INSERT INTO Factura VALUES (1187723, 312, 575000, 74750, 649750);
INSERT INTO Factura VALUES (1187723, 987, 135000, 17875, 152875);
INSERT INTO Factura VALUES (1187723, 987, 145000, 18850, 163850);


INSERT INTO DetalleFactura VALUES(1, 6, 1, 57500);
INSERT INTO DetalleFactura VALUES(3, 1, 1, 848000);
INSERT INTO DetalleFactura VALUES(8, 3, 1, 575000);
INSERT INTO DetalleFactura VALUES(3, 6, 1, 57500);
INSERT INTO DetalleFactura VALUES(1, 10, 1, 40000);
INSERT INTO DetalleFactura VALUES(4, 7, 1, 114000);
INSERT INTO DetalleFactura VALUES(5, 5, 2, 220000);
INSERT INTO DetalleFactura VALUES(6, 9, 1, 135000);
INSERT INTO DetalleFactura VALUES(2, 2, 2, 370000);
INSERT INTO DetalleFactura VALUES(7, 8, 1, 225000);
INSERT INTO DetalleFactura VALUES(9, 9, 1, 135000);
INSERT INTO DetalleFactura VALUES(10, 4, 1, 145000);


--SEGUNDA PARTE: Procedimientos Almacenados

-- Un procedimiento almacenado que solo utilice parámetros de entrada y permita insertar un
--registro en alguna de las tablas.
CREATE PROCEDURE SP_InsertarCliente
@Id int,
@Nombre varchar(50),
@Apellido1 varchar(50),
@Apellido2 varchar(50)
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO Cliente VALUES(@Id, @Nombre, @Apellido1, @Apellido2);
END
--Se ejecuta el procedimiento
exec SP_InsertarCliente 1159,'Carlos', 'Araya', 'Castro'



CREATE PROCEDURE SP_InsertarInstrumento
@Nombre varchar(50),
@IdCategoria varchar(3),
@IdFabricante int,
@AnnioLanzamiento int,
@Precio money
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO Instrumento VALUES(@Nombre, @IdCategoria, @IdFabricante, @AnnioLanzamiento, @Precio);
END
--Se ejecuta el procedimiento
exec SP_InsertarInstrumento 'Harmonica 335','VNT', 1, 2008,	27000


CREATE PROCEDURE SP_InsertarFabricante
@Id int,
@Nombre varchar(50)
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO Fabricante VALUES(@Id, @Nombre);
END
--Se ejecuta el procedimiento
exec SP_InsertarFabricante 12,'Samson'

--Un procedimiento almacenado que realice una consulta de la base de datos y la retorne, en
--caso de que no haya datos maneje las excepciones correspondientes indicando que no hay
--registros en la consulta.
CREATE PROCEDURE SP_ConsultaCantidadInstrumentos
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @CantidadInstrumentos int, @mensaje varchar(50)
	Select @CantidadInstrumentos = COUNT(Id)
	FROM Instrumento
	IF @CantidadInstrumentos > 0
	BEGIN
		RETURN @CantidadInstrumentos
	END
	ELSE
	BEGIN
		SET @mensaje = 'No hay instrumentos en el inventario agregados.'
		return @mensaje
	END
END
--Se ejecuta el procedimiento
DECLARE @cantidad varchar(50)
EXEC @cantidad = SP_ConsultaCantidadInstrumentos
PRINT 'Cantidad de instrumentos: ' + @cantidad

CREATE PROCEDURE SP_ConsultaCantidadClientesRegistrados
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @CantidadClientes int, @mensaje varchar(50)
	Select @CantidadClientes = COUNT(Id)
	FROM Cliente
	IF @CantidadClientes > 0
	BEGIN
		RETURN @CantidadClientes
	END
	ELSE
	BEGIN
		SET @mensaje = 'No hay clientes registrados.'
		return @mensaje
	END
END
--Se ejecuta el procedimiento
DECLARE @cantidad varchar(50)
EXEC @cantidad = SP_ConsultaCantidadClientesRegistrados
PRINT 'Cantidad de Clientes registrados: ' + @cantidad

CREATE PROCEDURE SP_ConsultaCantidadVentas
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @CantidadVentas int, @mensaje varchar(50)
	Select @CantidadVentas = COUNT(Id)
	FROM Factura
	IF @CantidadVentas > 0
	BEGIN
		RETURN @CantidadVentas
	END
	ELSE
	BEGIN
		SET @mensaje = 'No hay ventas realizadas.'
		return @mensaje
	END
END
--Se ejecuta el procedimiento
DECLARE @cantidad varchar(50)
EXEC @cantidad = SP_ConsultaCantidadVentas
PRINT 'Cantidad de ventas realizadas: ' + @cantidad

--Un procedimiento almacenado que reciba como parámetro de entrada la llave primaria de
--una de las tablas y realice el borrado de dicho registro. Este procedimiento tiene que
--manejar excepciones de forma que si la instrucción se llevó a cabo retorne un 1, caso
--contrario retorne un 0.
CREATE PROCEDURE SP_EliminarCliente
@idCliente int
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Realizado bit

	UPDATE Factura
	SET IdCliente = 0 WHERE IdCliente = @idCliente

	DELETE FROM Cliente WHERE Id= @idCliente
	IF(@@ROWCOUNT = 0)
	BEGIN
		RETURN 0
	END
	ELSE
	BEGIN
		RETURN 1
	END
END

--Se ejecuta el procedimiento
DECLARE @Eliminado bit
EXEC @Eliminado = SP_EliminarCliente 123
IF @Eliminado = 1
BEGIN
	PRINT 'Cliente eliminado éxitosamente.'
END
ELSE
BEGIN
	PRINT 'No se ha podido completar la acción'
END



CREATE PROCEDURE SP_EliminarInstrumento
@Id int
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Realizado bit
	
	DELETE FROM DetalleFactura WHERE IdInstrumento = @Id

	DELETE FROM Instrumento WHERE Id= @Id
	IF(@@ROWCOUNT = 0)
	BEGIN
		RETURN 0
	END
	ELSE
	BEGIN
	RETURN 1
	END
END

--Se ejecuta el procedimiento
DECLARE @Eliminado bit
EXEC @Eliminado = SP_EliminarInstrumento 5
IF @Eliminado = 1
BEGIN
	PRINT 'Instrumento eliminado éxitosamente.'
END
ELSE
BEGIN
	PRINT 'No se ha podido completar la acción'
END




CREATE PROCEDURE SP_EliminarFactura
@Id int
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Realizado bit
	DELETE FROM DetalleFactura WHERE IdFactura = @Id

	DELETE FROM Factura WHERE Id= @Id
	IF(@@ROWCOUNT = 0)
	BEGIN
		RETURN 0
	END
	ELSE
	BEGIN
	RETURN 1
	END
END

--Se ejecuta el procedimiento
DECLARE @Eliminado bit
EXEC @Eliminado = SP_EliminarFactura 2
IF @Eliminado = 1
BEGIN
	PRINT 'Factura eliminado éxitosamente.'
END
ELSE
BEGIN
	PRINT 'No se ha podido completar la acción'
END


--TERCERA PARTE: FUNCIONES

--Una función que calcule y retorne el siguiente consecutivo de la llave primaria de alguna de
--las tablas creadas.
CREATE FUNCTION fConsecutivoInstrumento()
returns int
AS
BEGIN
	DECLARE @numero int

	SELECT @numero= MAX(Id) FROM Instrumento
	return @numero + 1
END

--Se prueba la función
print dbo.fConsecutivoInstrumento()


-- Una función que realice algún tipo de consulta específica y retorne el valor correspondiente.
Create function fInfoInstrumento
(
	@id int
)
	returns TABLE
AS

RETURN
(
	Select i.Nombre, i.Precio, i.AnnioLanzamiento, c.Descripcion as 'Categoría Instrumento'
	from Instrumento i inner join CategoriaInstrumento c ON i.IdCategoria = c.Id
	WHERE i.Id = @id
)

--Se ejecuta
Select * from fInfoInstrumento(1)



--CUARTA PARTE: TRIGGERS
--Un trigger que no permita insertar en una tabla específica si el mismo no se hace entre las
--8 am y las 12 md.
CREATE TRIGGER TRRestriccionInsertarHora
ON Instrumento
AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON
	IF DATEPART(hh, GETDATE())not between 8 and 12 
	begin
		print 'Horario no válido para insertar Intrumentos'
		Rollback
	end
END

--Disparo de trigger
INSERT INTO Instrumento Values('Flauta Dulce', 'VNT', 1, 1999, 7500);

-- Un trigger que una vez realizado un INSERT o UPDATE dentro de la tabla valide una
--condición y la misma se da no permita que el mismo se realice.
CREATE TRIGGER TRInsertUpdateInstrumento
ON Instrumento
AFTER INSERT, UPDATE
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @precio money
	SELECT @precio = Precio from inserted
	IF(@precio < 2000)
	BEGIN
		PRINT 'El precio mínimo permitido para un instrumento es de 2000.'
		ROLLBACK
	END
END

--Disparo del trigger
INSERT INTO Instrumento Values('Baquetas H2', 'PRC', 1, 2015, 1500);

UPDATE Instrumento
SET Precio = 1500
WHERE Id = 2

-- Un trigger que una vez realizado un UPDATE guarde un una tabla bitácora los datos de los
--registros afectados que existían antes del update.
CREATE TABLE HistorialUpdateInstrumentos
(
Id int NOT NULL,
Nombre varchar(50) NOT NULL,
IdCategoria varchar(3) NOT NULL,
IdFabricante int NOT NULL,
AnnioLanzamiento int NOT NULL,
Precio money NOT NULL,
FechaActualizacion datetime
);

CREATE TRIGGER TRHistorialInstrumentosUPDATE
ON Instrumento
AFTER UPDATE
AS
BEGIN
	INSERT INTO HistorialUpdateInstrumentos SELECT *, GETDATE() FROM deleted
END

--DISPARO DEL TRIGGER
SELECT Precio from Instrumento WHERE Id =2
--UPDATE
UPDATE Instrumento
SET Precio = 180000
WHERE Id = 2
--Comprobacion
SELECT * from HistorialUpdateInstrumentos  WHERE Id =2
