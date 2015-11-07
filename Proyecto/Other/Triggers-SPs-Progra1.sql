

-- =============================================================================
-- Triggers
-- =============================================================================

-- T1: tal que antes  de  eliminar  una cotizaci�n, cuyo estado sea emitida, grabe en tablas de hist�ricos los datos de  �sta y sus l�neas,
Create or replace trigger Before_Delete_Cotizaciones_InsertIn_Historico before delete
on T_Cotizaciones for each row
begin

  -- Verificar estado emitida
  if Old.codEstadoCotiz = 1 then
    -- Seleccionar las filas de la cotizacion
    select * into filasCotiz from T_ArticulosCotizados tac where tac.numero = Old.numero;
    
    -- Guardar las filas de la cotizacion
    Insert into T_ArticulosCotizadosHisto values (
        filasCotiz.numCotizacion,
        filasCotiz.codArticulo,
        filasCotiz.undMedida,
        filasCotiz.cantidad,
        filasCotiz.porcenDescuento,
        filasCotiz.costoUnitario,
        filasCotiz.costoGrabado,
        filasCotiz.montoLinea
        );
        
    -- seleccionar datos de la cotizacion
    -- Estan en el Old
    
    -- guardar datos de la cotizacion
    Insert into T_CotizacionesHisto values (
        Old.numero,
        Old.fecRegistro,
        Old.cedJurCliente,
        Old.condicionPago,
        Old.condicionVenta,
        Old.vigencia,
        Old.Observaciones,
        Old.codMoneda,
        Old.codEstadoCotiz,
        Old.codListaPrecios,
        Old.mesEntreg,
        Old.anioEntreg
        );
        
    Insert into Bitacora values (
        default,  
        1,  -- No se manejan los usuarios debido a especificaciones de tarea - codigo default
        3,  -- Borrado de Cotizacion emitida
        sysdate()
        );
  end if;
end;


-- T2: para actualizar de los precios de los art�culos cuando se registran las facturas de los proveedores.
Create or replace trigger After_Insert_PrecioFacturaCompras_UpdateIn_Articulos after insert
on T_LineasFacturaCompras for each row
begin

  Update T_Articulos set precioMercDolares = New.precioDolares where codigo = New.codArticulo;

end;




-- =============================================================================
-- Stored procedures
-- =============================================================================

-- SP1: que reciba como par�metros, el c�digo de una lista de precios y el n�mero de meses a proyectar.    
-- El procedimiento debe generar una tabla  de proyecciones con el c�digo del producto, el mes, y la proyecci�n del precio en colones. 

-- IN
-- codListaPrecio -> T_ListaPrecios
-- numMeses -> T_IndiceEconomicos

-- OUT
--   [Tabla]
--     codArticulo, listaPrecio, mes, anio, tipoCambioProyec, proyeccion en colones
    
-- Tablas requeridas:
--   T_ListaPrecios
--   T_IndiceEconomicos
  



-- Retorna un result set con los datos
Create or replace procedure SP_GenerarProyecciones (
    pCodListaPrecio in number(3),
    pNumMeses in number(2)
) is
  
  -- Define variables utilizadas para los calculos
  Declare 
    mesActualProy number(2);
    anioActualProy number(4);
    tipoCambioProy number(17,2);
    precioArticulo number(17,2);
    SubTotalColones number(17,2);
    SubTotalPorcent number(17,2);
    TotalColones number(17,2);
  
 begin
  -- Obtener los precios de los articulos asociados a la lista de precios parametrizada
  -- [codigo, precioMercDolares]
  select
    artic.codigo,
    artic.precioMercDolares
    into lprecArticulos
  from T_ListaPrecioXArticulos lpxa inner join T_Articulos artic on (lpxa.codArticulo = artic.codigo)
  where lpxa.codListaPrecio = pCodListaPrecio;
  
  -- Calcular la cantidad de articulos en la lista de precios parametrizada
  -- X
  select
    count()
    into cantlprecArticulos
  from lprecArticulos;
  
  -- Obtener los porcentajes de la lista de precio parametrizada 
  -- [gastoAdmin, gastoOtros, utilidad]
  Select
    lpr.gastoAdmin,
    lpr.gastoOtros,
    lpr.utilidad
    into lPorcent
  From T_ListaPrecios lpr
  where lpr.codigo = pCodListaPrecio
  
  
  
  -- Suma y obtiene el total de porcentajes (1 vez)
  Set SubTotalPorcent = (lPorcent.gastoAdmin + lPorcent.gastoOtros + lPorcent.utilidad) / 100;
  Set SubTotalPorcent = SubTotalPorcent + 1
  
  -- For each pNumMeses --------------------------------------------------------
  -- ---------------------------------------------------------------------------
  
  for contador in 0..pNumMeses
  Loop
      
    
  
  End loop;
  
  
  
  -- ---------------------------------------------------------------------------
  
  ------------------------------------------------------------------------

  
  
  ( $ * TC ) = Xc
  Xc * (1 + Y) = Xtc
  
  Y = (gastoAdmin + gastoOtros + utilidad) / 100
  Y esta en lista precios
  
  
  
  

End;






-- SP2: la inserci�n, modificaci�n, borrado de art�culos y componentes,




