USE [VENTASDW]
GO

/****** Object:  StoredProcedure [dbo].[ActualizarDimTerritorio]    Script Date: 23/9/2024 21:30:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create   procedure [dbo].[ActualizarDimTerritorio] 
(@TerritorioVentasKey int,@GrupoVenta varchar(50),
@NombreTerritorio varchar(50))
as
begin
	update DimTerritorioVentas set GrupoVenta=@GrupoVenta,
	NombreTerritorio=@NombreTerritorio where TerritorioVentasKey=@TerritorioVentasKey
end
GO

