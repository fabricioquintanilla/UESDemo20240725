CREATE DATABASE VENTASDW
GO

USE VENTASDW
GO

--Crear dimensiones
create table DimClientes(
ClienteKey int identity(1,1) primary key,
ClienteID int not null,
TipoPersona varchar(100) not null,
Nombre varchar(100) not null)
go

create table DimProducto(
ProductoKey int identity(1,1) primary key,
ProductoID int not null,
NombreProducto varchar(50) not null,
NumeroProducto varchar(25) not null,
color varchar(15) not null,
PrecioLista float not null,
LineaProducto varchar(100) not null,
CategoriaProducto varchar(100) not null,
SubcategiriaProducto varchar(100) not null,
NombreModelo varchar(100))
go

create table DimVendedor(
VendedorKey int identity(1,1) primary key,
VendedorID int not null,
CuotaVenta float not null default(0),
Bono float not null default(0),
PorcentajeComision float not null default(0))
go

create table DimTerritorioVentas(
TerritorioVentasKey int identity(1,1) primary key,
TerritorioVentasID int not null,
GrupoVenta varchar(50) not null,
NombreTerritorio varchar(50) not null)
go

create table DimTiempo(
TiempoKey int primary key,
Fecha datetime not null,
dia tinyint not null,
mes tinyint not null,
anio smallint not null)
go

create table DimOferta(
OfertaKey int identity(1,1) primary key,
OfertaID int not null,
Porcentaje float not null,
TipoOferta varchar(50) not null,
CategoriaOferta varchar(50) not null,
Descripcion varchar(255) not null)
go

create table FactVentas(
ClienteKey int not null foreign key references DimClientes(ClienteKey),
ProductoKey int not null foreign key references DimProducto(ProductoKey),
VendedorKey int not null foreign key references DimVendedor(VendedorKey),
TerritorioVentaKey int not null foreign key references DimTerritorioVentas(TerritorioVentasKey),
TiempoKey int not null foreign key references DimTiempo(TiempoKey),
OfertaKey int not null foreign key references DimOferta(OfertaKey),
Cantidad float not null default (0),
PrecioUnitario float not null default(0),
Descuento float not null default(0),
TotalLinea float not null default(0))