

	SELECT * FROM T_TIPOCAMBIOS;















SELECT * FROM T_PAISES;
SELECT * FROM T_PROVINCIAS;
SELECT * FROM T_CUIDADES;

SELECT * FROM T_TIPOCONTACTOS;
SELECT * FROM T_CONTACTO;
SELECT * FROM T_DETALLEDIRECCION;

SELECT * FROM T_EMPRESA;
SELECT * FROM T_TIPOEMPRESA;

SELECT * FROM T_COTIZACIONES;
SELECT * FROM T_ARTICULOSCOTIZADOS;
SELECT * FROM T_COTIZACIONESHISTO;
SELECT * FROM T_ARTICULOSCOTIZADOSHISTO;
SELECT * FROM T_COTIZACIONESTADOS;


-- Insertar cotizaciones HEADER
INSERT INTO T_COTIZACIONES(fecregistro,cedjurcliente,condicionpago,condicionventa,vigencia,
observaciones,codmoneda,codestadocotiz,codlistaprecios,mesentreg,anioentreg)
VALUES(sysdate,2,'credito','contado','activo','perfecto',1,1,1,1,2015);

-- Insertar filas cotizaciones BODY
INSERT INTO t_articuloscotizados(numcotizacion,codarticulo,undmedida,cantidad,porcendescuento,costounitario,costograbado,montolinea) 
VALUES (5,'FP110',1,2,2,50,50,100);


DELETE from T_cotizaciones WHERE NUMERO = 5;
delete from T_ArticulosCotizados;
COMMIT;

DELETE FROM T_PROYECCIONESLISTAPRECIOS;



SELECT * FROM T_ARTICULOS;
EXECUTE SP_OBTENERTC;

SELECT * FROM T_TIPOCAMBIOS;
COMMIT;
SELECT * FROM T_PROYECCIONESLISTAPRECIOS;

SELECT * FROM T_LISTAPRECIOXARTICULOS;

INSERT INTO T_LISTAPRECIOXARTICULOS VALUES (1, 'FP110');
INSERT INTO T_LISTAPRECIOXARTICULOS VALUES (1, 'LE01');
INSERT INTO T_LISTAPRECIOXARTICULOS VALUES (1, 'INCOHO');


 SELECT
    TC.MONTO 
  FROM T_TIPOCAMBIOS TC
  WHERE TC.MES = 4 AND TC.ANIO = 2015;

DELETE FROM T_TIPOCAMBIOS WHERE ESTADO = 2;

DROP TRIGGER BEF_DEL_COTIZ_INS_HISTO;

SELECT * FROM T_BITACORA;





















create or replace TRIGGER MVIALES.BEF_DEL_COTIZ_INS_HISTO 
    BEFORE DELETE ON MVIALES.T_COTIZACIONES 
    FOR EACH ROW 
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
    
    -- guardar datos de la cotizacion
    Insert into T_CotizacionesHisto values (:OLD.numero,:OLD.fecRegistro,:OLD.cedJurCliente,:OLD.condicionPago,:OLD.condicionVenta,:OLD.vigencia,:OLD.Observaciones,:OLD.codMoneda,:OLD.codEstadoCotiz,:OLD.codListaPrecios,:OLD.mesEntreg,:OLD.anioEntreg);
  
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
    
    -- BORRE FILAS
    DELETE FROM T_ARTICULOSCOTIZADOS WHERE NUMCOTIZACION = :OLD.NUMERO;
    
    
    
      --Registar evento en bitacora
     Insert into T_Bitacora values (1,'admin',1,SYSDATE);
  end if;
end;
COMMIT;




SELECT * FROM T_TIPOERRORES;
INSERT INTO T_TIPOERRORES VALUES(1, 'COTIZ BORRADA');



































SELECT * FROM T_TIPOCAMBIOS;
DELETE FROM T_TIPOCAMBIOS WHERE ESTADO = 2;
COMMIT;




	SELECT * FROM T_LISTAPRECIOXARTICULOS;

	SELECT * FROM T_PROYECCIONESLISTAPRECIOS;
DELETE FROM T_PROYECCIONESLISTAPRECIOS;




	SELECT * FROM T_COTIZACIONES;
  
	SELECT * FROM T_ARTICULOSCOTIZADOS;


DELETE from T_cotizaciones WHERE NUMERO = 5;






SELECT * FROM T_COTIZACIONES;

SELECT * FROM T_COTIZACIONESHISTO;
SELECT * FROM T_BITACORA;






SELECT * FROM T_COTIZACIONESHISTO;


	SELECT * FROM T_ARTICULOSCOTIZADOSHISTO;

INSERT INTO T_COTIZACIONES(fecregistro,cedjurcliente,condicionpago,condicionventa,vigencia,
	observaciones,codmoneda,codestadocotiz,codlistaprecios,mesentreg,anioentreg)
	VALUES(sysdate,2,'credito','contado','activo','perfecto',1,1,1,1,2015);
  
  
INSERT INTO t_articuloscotizados(numcotizacion,codarticulo,undmedida,cantidad,porcendescuento,costounitario,costograbado,montolinea) 
	VALUES (7,'FP110',1,2,2,50,50,100);
  INSERT INTO t_articuloscotizados(numcotizacion,codarticulo,undmedida,cantidad,porcendescuento,costounitario,costograbado,montolinea) 
	VALUES (7,'LE01',1,2,2,50,50,100);
  
COMMIT;
DELETE FROM T_COTIZACIONES WHERE NUMERO = 7;

DESC T_BITACORA;
SELECT * FROM T_BITACORA;
DELETE FROM T_BITACORA;
C












	SELECT * FROM T_TIPOCAMBIOS;










