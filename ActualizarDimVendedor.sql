USE [VENTASDW]
GO

/****** Object:  StoredProcedure [dbo].[ActualizarDimVendedor]    Script Date: 23/9/2024 21:30:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create   procedure [dbo].[ActualizarDimVendedor] 
(@VendedorKey int,@CuotaVenta float,
@Bono float, @PorcentajeComision float)
as
begin
	update DimVendedor set CuotaVenta=@CuotaVenta,
	Bono=@Bono, PorcentajeComision=@PorcentajeComision 
	where VendedorKey=@VendedorKey
end
GO

