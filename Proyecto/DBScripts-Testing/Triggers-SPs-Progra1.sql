
commit;

-- =============================================================================
-- Triggers
-- =============================================================================
 
-- T1: tal que antes  de  eliminar  una cotización, cuyo estado sea emitida, grabe en tablas de históricos los datos de  ésta y sus líneas,
Create or replace trigger BEF_DEL_COTIZ_INSERTIN_HISTO before delete
on T_Cotizaciones for each row
begin
 
  -- Verificar estado emitida
  if :OLD.codEstadoCotiz = 1 then
    -- Seleccionar las filas de la cotizacion
    
    -- Da error porque talvez se deba hacer con vistas :S
    
    
    select 
      * into filasCotiz 
    from T_ArticulosCotizados tac where tac.numero = :OLD.numero;
     
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
        :OLD.numero,
        :OLD.fecRegistro,
        :OLD.cedJurCliente,
        :OLD.condicionPago,
        :OLD.condicionVenta,
        :OLD.vigencia,
        :OLD.Observaciones,
        :OLD.codMoneda,
        :OLD.codEstadoCotiz,
        :OLD.codListaPrecios,
        :OLD.mesEntreg,
        :OLD.anioEntreg
        );
         
    Insert into Bitacora values (
        default, 
        1,  -- No se manejan los usuarios debido a especificaciones de tarea - codigo default
        3,  -- Borrado de Cotizacion emitida
        sysdate()
        );
  end if;
end;
 
 
-- T2: para actualizar de los precios de los artículos cuando se registran las facturas de los proveedores.
Create or replace trigger PR1_AFT_INS_PFact_UpdIn_Artic after insert
on T_LineasFacturaCompras for each row
begin
 
  Update T_Articulos set precioMercDolares = :NEW.precioDolares where codigo = :NEW.codArticulo;
 
end;
 
 
 
 
-- =============================================================================
-- Stored procedures
-- =============================================================================
 
-- SP1: que reciba como parámetros, el código de una lista de precios y el número de meses a proyectar.   
-- El procedimiento debe generar una tabla  de proyecciones con el código del producto, el mes, y la proyección del precio en colones.
 
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
 
 
 
 
 