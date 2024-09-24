USE [VENTASDW]
GO

/****** Object:  StoredProcedure [dbo].[ActualizarCliente]    Script Date: 23/9/2024 21:30:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create   procedure [dbo].[ActualizarCliente](
@ClienteKey int, @ClienteID int, @TipoPersona varchar(100),
@Nombre varchar(100))
as
begin

	--Dimension de tipo SCD2
	if not exists 
	(select * from DimClientes where ClienteID=@ClienteID and
	TipoPersona=@TipoPersona and Nombre=@Nombre and Activo=1)
	begin
		--Deshabilitar el registro anterior
		update DimClientes set FechaActualizacion=getdate(),
		Activo=0 where ClienteKey=@ClienteKey

		--Crear el nuevo registro
		insert into DimClientes(ClienteID, TipoPersona,Nombre)
		values(@ClienteID, @TipoPersona,@Nombre)
	end
end
GO

