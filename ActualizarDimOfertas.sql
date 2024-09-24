USE [VENTASDW]
GO

/****** Object:  StoredProcedure [dbo].[ActualizarDimOfertas]    Script Date: 23/9/2024 21:30:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ActualizarDimOfertas] 
(@OfertaKey int,@porcentaje float,@TipoOferta varchar(50),
@CategoriaOferta varchar(50),@Descripcion varchar(255))
as
begin
	update DimOferta set Porcentaje=@porcentaje,
	TipoOferta=@TipoOferta, CategoriaOferta=@CategoriaOferta,
	Descripcion=@Descripcion where OfertaKey=@OfertaKey
end
GO

