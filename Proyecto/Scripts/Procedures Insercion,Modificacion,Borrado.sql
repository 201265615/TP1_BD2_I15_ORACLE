--**************************************************Insercion Articulos*****************************************************************//

Create or Replace Procedure SP_InsertarArticulo (IN_CODIGO IN VARCHAR2, IN_DESCRIPCION IN VARCHAR2, IN_UNDMEDIDA IN NUMBER, IN_CODMARCA IN NUMBER,
                                      IN_MODELO IN VARCHAR2, IN_CODFAMILIA IN NUMBER, IN_CODESTARTICULO IN NUMBER,
                                      IN_CODUSERREGISTRO IN VARCHAR2, IN_CANTIDAD IN NUMBER, IN_CANTMAXIMA IN NUMBER, 
                                      IN_CANTMINIMA IN NUMBER, IN_PRECIOMERCDOLARES IN NUMBER)

AS
BEGIN

INSERT INTO t_articulos(CODIGO, DESCRIPCION, UNDMEDIDA, CODMARCA, MODELO, FECREGISTRO, CODFAMILIA, CODESTARTICULO, CODUSERREGISTRO, CANTIDAD, CANTMAXIMA, CANTMINIMA, PRECIOMERCDOLARES, FECHAACTPRECIO)
VALUES(IN_CODIGO, IN_DESCRIPCION, IN_UNDMEDIDA, IN_CODMARCA, IN_MODELO, sysdate, IN_CODFAMILIA, IN_CODESTARTICULO, IN_CODUSERREGISTRO, IN_CANTIDAD, IN_CANTMAXIMA, IN_CANTMINIMA, IN_PRECIOMERCDOLARES, sysdate);
    
END;


--************************************************Insercion Componentes*****************************************************************//
--Requiere el codigo de componente y el codigo del articulo al cual se asociara, e.g execute SP_INSERTARCOMPONENTE('FTCO2175','INCOHO');

Create or Replace Procedure SP_InsertarComponente (IN_CODIGOCOMPONENTE IN VARCHAR2,IN_CODIGOARTICULO IN VARCHAR2 )

AS
BEGIN

INSERT INTO t_componentes(CODCOMPONENTE,CODARTICULO)
VALUES (IN_CODIGOCOMPONENTE, IN_CODIGOARTICULO);

END;



--***************************************************Modificacion Articulos*****************************************************************//
--Requiere el codigo de articulo por modificar, el usuario e.g 'admin' y el precio nuevo en dolares, la fecha se cambia sola, e.g execute SP_ModificarArticulo('MOCO4075','admin',200);

Create or Replace Procedure SP_ModificarArticulo (IN_CODIGO IN VARCHAR2, IN_CODUSERREGISTRO IN VARCHAR2, IN_PRECIOMERCDOLARES IN NUMBER)

AS
BEGIN

UPDATE  t_articulos 
      SET CODUSERREGISTRO = IN_CODUSERREGISTRO,
          PRECIOMERCDOLARES = IN_PRECIOMERCDOLARES,
          FECHAACTPRECIO = sysdate
          WHERE CODIGO = IN_CODIGO;
      
END;


--***************************************************Modificacion Componentes*****************************************************************//
--Requiere el codigo de componente por modificar y el codigo nuevo del articulo al cual se asociara, e.g execute SP_MODIFICARCOMPONENTE('FP110','SL02.8G08ME500SSD');

Create or Replace Procedure SP_ModificarComponente (IN_CODCOMPONENTE IN VARCHAR2,IN_CODARTICULO IN VARCHAR2)

AS
BEGIN

UPDATE  t_componentes
      SET CODARTICULO = IN_CODARTICULO
          WHERE CODCOMPONENTE = IN_CODCOMPONENTE;
      
END;



--************************************************Borrado Articulo******************************************************************************//






--************************************************Borrado Componente******************************************************************************//
--Si se desea borrar solo una linea en especifico (un componente esta asociado a un articulo X) se pasa de parametro el codigo del componente por eliminar y el codigo del articulo asociado, e.g execute SP_BORRARCOMPONENTE('FTCO2175','SL02.8G08ME500SSD');
--Si se desea borrar todas las entradas donde se encuentr el componente se pasa de parametro el codigo del componente por eliminar y un parametro null ('') como segundo parametro, e.g execute SP_BorrarComponente('FTCO2175','');

Create or Replace Procedure SP_BorrarComponente (IN_CODCOMPONENTE IN VARCHAR2,IN_CODARTICULO IN VARCHAR2)

AS
BEGIN
  IF(IN_CODARTICULO IS NULL) THEN
          DELETE FROM  t_componentes
          WHERE CODCOMPONENTE = IN_CODCOMPONENTE;
        ELSE
          DELETE FROM  t_componentes
          WHERE CODCOMPONENTE = IN_CODCOMPONENTE AND CODARTICULO = IN_CODARTICULO;
  END IF;

END;

