-- ==========================================================
-- Creación de la Base de Datos
-- ==========================================================

USE master;
GO

IF NOT EXISTS ( SELECT name FROM sys.sysdatabases WHERE name = 'DAS20231' )
BEGIN
	CREATE DATABASE DAS20231;
END;
GO

-- ==========================================================
-- Seleccionar la Base de Datos
-- ==========================================================

USE DAS20231;
GO


-- ==========================================================
-- Eliminar las tablas en caso existan
-- ==========================================================

IF EXISTS ( SELECT 1 FROM sys.sysobjects WHERE name = 'VENTA' AND xtype='U' )
BEGIN
	DROP TABLE dbo.VENTA;
END;
GO

IF EXISTS ( SELECT 1 FROM sys.sysobjects WHERE name = 'PRODUCTO' AND xtype='U' )
BEGIN
	DROP TABLE dbo.PRODUCTO;
END;
GO

-- ==========================================================
-- Crear tabla: PRODUCTO
-- ==========================================================

CREATE TABLE dbo.PRODUCTO
( 
	IDPRODUCTO           integer  NOT NULL ,
	NOMBRE               varchar(100)  NOT NULL ,
	STOCK                integer  NOT NULL ,
	PRECOSTO             numeric(10,2)  NOT NULL ,
	PREVENTA             numeric(10,2)  NOT NULL ,
	CONSTRAINT XPKPRODUCTO PRIMARY KEY (IDPRODUCTO ASC)
)
go


-- ==========================================================
-- Crear tabla: VENTA
-- ==========================================================

CREATE TABLE dbo.VENTA
( 
	IDVENTA              integer IDENTITY ( 1,1 ) ,
	IDPRODUCTO           integer  NOT NULL ,
	CLIENTE              varchar(100)  NOT NULL ,
	FECHA                datetime  NOT NULL ,
	PREVENTA             numeric(10,2)  NOT NULL ,
	CANTIDAD             integer  NOT NULL ,
	IMPORTE              numeric(10,2)  NOT NULL ,
	IMPUESTO             numeric(10,2)  NOT NULL ,
	TOTAL                numeric(10,2)  NOT NULL ,
	CONSTRAINT XPKVENTA PRIMARY KEY (IDVENTA ASC),
	CONSTRAINT FK_VENTA_PRODUCTO FOREIGN KEY (IDPRODUCTO) REFERENCES dbo.PRODUCTO(IDPRODUCTO)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
)
go

-- ==========================================================
-- Cargar datos en la tabla PRODUCTO
-- ==========================================================

insert into dbo.PRODUCTO(IDPRODUCTO,NOMBRE,STOCK,PRECOSTO,PREVENTA)
values(1,'DISCO DURO USB 2TB TOSHIBA CANVIO READY Black',50,180.0,270.0);
GO

insert into dbo.PRODUCTO(IDPRODUCTO,NOMBRE,STOCK,PRECOSTO,PREVENTA)
values(2,'LAPTOP Core i9-13950HX MSI CreatorPro 64|2|16|3000',30,11500.0,15800.0);
GO

insert into dbo.PRODUCTO(IDPRODUCTO,NOMBRE,STOCK,PRECOSTO,PREVENTA)
values(3,'LAPTOP Core i9-13900H MSI Vector 32|1|17.3|4070 W1',30,9780.0,11490.0);
GO

insert into dbo.PRODUCTO(IDPRODUCTO,NOMBRE,STOCK,PRECOSTO,PREVENTA)
values(4,'Laptop HP de 15.6", modelo 15-dy2059la, procesador intel core i3',20,1250.0,1400.0);
GO

insert into dbo.PRODUCTO(IDPRODUCTO,NOMBRE,STOCK,PRECOSTO,PREVENTA)
values(5,'Laptop Gamer HP Victus de 16.1", modelo 16-d0503la, procesador Intel Core i5',35,1890.0,2600.0);
GO

insert into dbo.PRODUCTO(IDPRODUCTO,NOMBRE,STOCK,PRECOSTO,PREVENTA)
values(6,'Laptop Gamer HP Victus de 16.1", modelo 16-d0523la, procesador Intel Core i7',50,2785.0,3650.0);
GO

insert into dbo.PRODUCTO(IDPRODUCTO,NOMBRE,STOCK,PRECOSTO,PREVENTA)
values(7,'All In One HP 24-cb1009la 23.8" Intel Core i5-1235U 512GB SSD 8GB RAM',28,1970.0,2800.0);
GO

insert into dbo.PRODUCTO(IDPRODUCTO,NOMBRE,STOCK,PRECOSTO,PREVENTA)
values(8,'All In One HP 24-cb0013la 23.8" AMD Ryzen 5 5500U 1TB HDD + 256GB SSD 8GB RAM',45,1870.0,2650.0);
GO

insert into dbo.PRODUCTO(IDPRODUCTO,NOMBRE,STOCK,PRECOSTO,PREVENTA)
values(9,'Impresora Multifuncional Epson EcoTank L3250',60,560.0,830.0);
GO

insert into dbo.PRODUCTO(IDPRODUCTO,NOMBRE,STOCK,PRECOSTO,PREVENTA)
values(10,'Impresora Multifuncional Brother DCP-L2540DW',42,785.0,1050.0);
GO

insert into dbo.PRODUCTO(IDPRODUCTO,NOMBRE,STOCK,PRECOSTO,PREVENTA)
values(11,'Micrófono Gaming HyperX Solocast Negro',54,176.0,250.0);
GO

insert into dbo.PRODUCTO(IDPRODUCTO,NOMBRE,STOCK,PRECOSTO,PREVENTA)
values(12,'Parlante Microsoft Modern USB-C',21,296.0,400.0);
GO

-- ==========================================================
-- Cargar datos en la tabla VENTA
-- ==========================================================

declare @fecha datetime;

set @fecha = GETDATE() - 45;
insert into dbo.VENTA(IDPRODUCTO,CLIENTE,FECHA,PREVENTA,CANTIDAD,IMPORTE,IMPUESTO,TOTAL)
values(5,'AGUILAR MALLQUI EMILIANO',@fecha,0,2,0,0,0);

set @fecha = @fecha + 2;
insert into dbo.VENTA(IDPRODUCTO,CLIENTE,FECHA,PREVENTA,CANTIDAD,IMPORTE,IMPUESTO,TOTAL)
values(8,'BALDEON SOSA MARCO ANTONIO',@fecha,0,1,0,0,0);

set @fecha = @fecha + 2;
insert into dbo.VENTA(IDPRODUCTO,CLIENTE,FECHA,PREVENTA,CANTIDAD,IMPORTE,IMPUESTO,TOTAL)
values(1,'VASQUEZ CALDERON FELICIANO',@fecha,0,2,0,0,0);

set @fecha = @fecha + 3;
insert into dbo.VENTA(IDPRODUCTO,CLIENTE,FECHA,PREVENTA,CANTIDAD,IMPORTE,IMPUESTO,TOTAL)
values(12,' SINCHE ROMERO JULIO',@fecha,0,3,0,0,0);

set @fecha = @fecha + 4;
insert into dbo.VENTA(IDPRODUCTO,CLIENTE,FECHA,PREVENTA,CANTIDAD,IMPORTE,IMPUESTO,TOTAL)
values(7,'CESPEDES QUIROZ JUAN',@fecha,0,1,0,0,0);

set @fecha = @fecha + 5;
insert into dbo.VENTA(IDPRODUCTO,CLIENTE,FECHA,PREVENTA,CANTIDAD,IMPORTE,IMPUESTO,TOTAL)
values(9,'GUERRERO QUISPE ISAIAS',@fecha,0,2,0,0,0);

set @fecha = @fecha + 3;
insert into dbo.VENTA(IDPRODUCTO,CLIENTE,FECHA,PREVENTA,CANTIDAD,IMPORTE,IMPUESTO,TOTAL)
values(10,'MUCHA QUINTO SAMUEL',@fecha,0,3,0,0,0);

set @fecha = @fecha + 3;
insert into dbo.VENTA(IDPRODUCTO,CLIENTE,FECHA,PREVENTA,CANTIDAD,IMPORTE,IMPUESTO,TOTAL)
values(7,'REYES CABALLERO YOHNY TOBIAS',@fecha,0,4,0,0,0);

set @fecha = @fecha + 3;
insert into dbo.VENTA(IDPRODUCTO,CLIENTE,FECHA,PREVENTA,CANTIDAD,IMPORTE,IMPUESTO,TOTAL)
values(11,'CANCHARI FANO ANDRES',@fecha,0,3,0,0,0);

set @fecha = @fecha + 3;
insert into dbo.VENTA(IDPRODUCTO,CLIENTE,FECHA,PREVENTA,CANTIDAD,IMPORTE,IMPUESTO,TOTAL)
values(2,'PEREZ CUVA JULIAN',@fecha,0,1,0,0,0);

set @fecha = @fecha + 2;
insert into dbo.VENTA(IDPRODUCTO,CLIENTE,FECHA,PREVENTA,CANTIDAD,IMPORTE,IMPUESTO,TOTAL)
values(5,'CAMPOS ALVAREZ MARIO',@fecha,0,2,0,0,0);

set @fecha = @fecha + 2;
insert into dbo.VENTA(IDPRODUCTO,CLIENTE,FECHA,PREVENTA,CANTIDAD,IMPORTE,IMPUESTO,TOTAL)
values(9,'ZAPATA GARRAGATE JOSE ANTONIO',@fecha,0,5,0,0,0);

set @fecha = @fecha + 2;
insert into dbo.VENTA(IDPRODUCTO,CLIENTE,FECHA,PREVENTA,CANTIDAD,IMPORTE,IMPUESTO,TOTAL)
values(3,'SANCHEZ SANCHEZ DESIDERIO',@fecha,0,1,0,0,0);

set @fecha = @fecha + 3;
insert into dbo.VENTA(IDPRODUCTO,CLIENTE,FECHA,PREVENTA,CANTIDAD,IMPORTE,IMPUESTO,TOTAL)
values(6,'MEDINA GUTIERREZ LUIS ENRIQUE',@fecha,0,3,0,0,0);

set @fecha = @fecha + 4;
insert into dbo.VENTA(IDPRODUCTO,CLIENTE,FECHA,PREVENTA,CANTIDAD,IMPORTE,IMPUESTO,TOTAL)
values(7,'GARAY CAVERO LEONOR',@fecha,0,1,0,0,0);

GO

-- ==========================================================
-- Cargar datos en la tabla VENTA
-- ==========================================================

update dbo.VENTA
set PREVENTA = (select p.PREVENTA from dbo.PRODUCTO p where p.IDPRODUCTO = v.IDPRODUCTO )
from dbo.VENTA v;
go

update dbo.VENTA set TOTAL = PREVENTA * CANTIDAD;
go

update dbo.VENTA set IMPORTE = PREVENTA / 1.18;
go

update dbo.VENTA set IMPUESTO = TOTAL - IMPORTE;
go

select * from dbo.PRODUCTO
select * from dbo.VENTA;
go

