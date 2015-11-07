-- =============================================================================
-- Triggers
-- =============================================================================
 
-- T1: tal que antes  de  eliminar  una cotización, cuyo estado sea emitida, grabe en tablas de históricos los datos de  ésta y sus líneas,
Create or replace trigger BEF_DEL_COTIZ_INS_HISTO before delete on T_Cotizaciones 
for each row
Declare
  -- Seleccionar las filas de la cotizacion
  cursor cursorArticulos is select numCotizacion,codArticulo,undMedida,cantidad,porcenDescuento,costoUnitario,costoGrabado,montoLinea 
  from T_ArticulosCotizados where numCotizacion = :Old.numero;
  -- Variables de cada fila
  Var_numCotizacion number(10);
  Var_codArticulo varchar(20);
  Var_undMedida number(3);
  Var_cantidad number(10);
  Var_porcenDescuento number(2);
  Var_costoUnitario number(17,2);
  Var_costoGrabado number(17,2);
  Var_montoLinea number(17,2);
begin
  -- Verificar estado emitida
  if (:OLD.codEstadoCotiz = 1) then
    -- Abrir cursor
    open cursorArticulos;
    loop
      -- Recorre filas
      fetch cursorArticulos into 
      Var_numCotizacion,
      Var_codArticulo,
      Var_undMedida,
      Var_cantidad,
      Var_porcenDescuento,
      Var_costoUnitario,
      Var_costoGrabado,
      Var_montoLinea;
      -- Guardar las filas en historico
         Insert into T_ArticulosCotizadosHisto values (Var_numCotizacion,Var_codArticulo,Var_undMedida,Var_cantidad,Var_porcenDescuento,Var_costoUnitario,Var_costoGrabado,Var_montoLinea);
     exit when cursorArticulos %notfound;
    end loop;
    close cursorArticulos;
    commit;
    -- guardar datos de la cotizacion
    Insert into T_CotizacionesHisto values (:OLD.numero,:OLD.fecRegistro,:OLD.cedJurCliente,:OLD.condicionPago,:OLD.condicionVenta,:OLD.vigencia,:OLD.Observaciones,:OLD.codMoneda,:OLD.codEstadoCotiz,:OLD.codListaPrecios,:OLD.mesEntreg,:OLD.anioEntreg);
    -- Registar evento en bitacora
    Insert into T_Bitacora values (15,1,3,SYSDATE);
  end if;
end;



--*************************************************************************************************************************************************************


-- T2: para actualizar de los precios de los artículos cuando se registran las facturas de los proveedores.
Create or replace trigger AFT_INS_PrecioFac_UPD_Artic after insert
on T_LineasFacturaCompras 
for each row
begin
  
  UPDATE  t_articulos 
      SET CODUSERREGISTRO = 'admin',
          PRECIOMERCDOLARES = :NEW.precioDolares,
          FECHAACTPRECIO = sysdate
          WHERE CODIGO = :NEW.CODARTICULO;
 
end AFT_INS_PrecioFac_UPD_Artic;


--*****************************************************************************************************************************************************************