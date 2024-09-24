USE [VENTASDW]
GO

/****** Object:  StoredProcedure [dbo].[ActualizarProducto]    Script Date: 23/9/2024 21:31:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create   procedure [dbo].[ActualizarProducto](
@ProductoKey int, @ProductoID int, @NombreProducto varchar(50),
@NumeroProducto varchar(25), @color varchar(15),
@PrecioLista float, @LineaProducto varchar(100),
@CategoriaProducto varchar(100),
@SubcategoriaProducto varchar(100),
@NombreModelo varchar(100))
as
begin

	--Dimension de tipo SCD2
	if not exists 
	(select * from DimProducto where ProductoID=@ProductoID and
	NombreProducto=@NombreProducto and NumeroProducto=@NumeroProducto
	and color=@color and PrecioLista=@PrecioLista and LineaProducto=@LineaProducto
	and CategoriaProducto=@CategoriaProducto and SubcategiriaProducto=@SubcategoriaProducto
	and NombreModelo=@NombreModelo and Activo=1)
	begin
		--Deshabilitar el registro anterior
		update DimProducto set FechaActualizacion=getdate(),
		Activo=0 where ProductoKey=@ProductoKey

		--Crear el nuevo registro
		insert into DimProducto(ProductoID, NombreProducto,NumeroProducto,
		color,PrecioLista, LineaProducto, CategoriaProducto,SubcategiriaProducto,
		NombreModelo)
		values(@ProductoID, @NombreProducto,@NumeroProducto,
		@color,@PrecioLista, @LineaProducto, @CategoriaProducto,@SubcategoriaProducto,
		@NombreModelo)
	end
end
GO

