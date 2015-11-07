CREATE OR REPLACE PACKAGE PKG_Articulo AS
   PROCEDURE SP_InsertarArticulo (IN_CODIGO IN VARCHAR2, IN_DESCRIPCION IN VARCHAR2, IN_UNDMEDIDA IN NUMBER, IN_CODMARCA IN NUMBER,
                                      IN_MODELO IN VARCHAR2, IN_CODFAMILIA IN NUMBER, IN_CODESTARTICULO IN NUMBER,
                                      IN_CODUSERREGISTRO IN VARCHAR2, IN_CANTIDAD IN NUMBER, IN_CANTMAXIMA IN NUMBER, 
                                      IN_CANTMINIMA IN NUMBER, IN_PRECIOMERCDOLARES IN NUMBER);
  
  PROCEDURE SP_InsertarComponente (IN_CODIGOCOMPONENTE IN VARCHAR2,IN_CODIGOARTICULO IN VARCHAR2 );
  
  PROCEDURE SP_ModificarArticulo (IN_CODIGO IN VARCHAR2, IN_CODUSERREGISTRO IN VARCHAR2, IN_PRECIOMERCDOLARES IN NUMBER);
  
  PROCEDURE SP_ModificarComponente (IN_CODCOMPONENTE IN VARCHAR2,IN_CODARTICULO IN VARCHAR2);
  
  PROCEDURE SP_BorrarComponente (IN_CODCOMPONENTE IN VARCHAR2,IN_CODARTICULO IN VARCHAR2);
  
  Procedure SP_GetArticulos;
  
  Procedure SP_GetComponentes;
  
  FUNCTION SP(X IN NUMBER)
  
  -- ============================================================================================
  -- TESTING RETURNS
  -- ============================================================================================
  PROCEDURE SP_GETARTIC_V2 (CURRESP OUT SYS_REFCURSOR);
  FUNCTION SP_TEST_GETARTIC_V2;
  -- ============================================================================================  
  
  
  
  
END PKG_Articulo;



CREATE OR REPLACE PACKAGE BODY PKG_Articulo AS
    --**************************************************Insercion Articulos*****************************************************************//

Procedure SP_InsertarArticulo (IN_CODIGO IN VARCHAR2, IN_DESCRIPCION IN VARCHAR2, IN_UNDMEDIDA IN NUMBER, IN_CODMARCA IN NUMBER,
                                      IN_MODELO IN VARCHAR2, IN_CODFAMILIA IN NUMBER, IN_CODESTARTICULO IN NUMBER,
                                      IN_CODUSERREGISTRO IN VARCHAR2, IN_CANTIDAD IN NUMBER, IN_CANTMAXIMA IN NUMBER, 
                                      IN_CANTMINIMA IN NUMBER, IN_PRECIOMERCDOLARES IN NUMBER)

AS
BEGIN

INSERT INTO t_articulos(CODIGO, DESCRIPCION, VAR_CODUNDMEDIDA, VAR_CODMARCA, MODELO, FECREGISTRO, CODFAMILIA, CODESTARTICULO, CODUSERREGISTRO, CANTIDAD, CANTMAXIMA, CANTMINIMA, PRECIOMERCDOLARES, FECHAACTPRECIO)
VALUES(IN_CODIGO, IN_DESCRIPCION, IN_UNDMEDIDA, IN_CODMARCA, IN_MODELO, sysdate, IN_CODFAMILIA, IN_CODESTARTICULO, IN_CODUSERREGISTRO, IN_CANTIDAD, IN_CANTMAXIMA, IN_CANTMINIMA, IN_PRECIOMERCDOLARES, sysdate);
    
END;


--************************************************Insercion Componentes*****************************************************************//
--Requiere el codigo de componente y el codigo del articulo al cual se asociara, e.g execute SP_INSERTARCOMPONENTE('FTCO2175','INCOHO');

Procedure SP_InsertarComponente (IN_CODIGOCOMPONENTE IN VARCHAR2,IN_CODIGOARTICULO IN VARCHAR2 )

AS
BEGIN

INSERT INTO t_componentes(CODCOMPONENTE,CODARTICULO)
VALUES (IN_CODIGOCOMPONENTE, IN_CODIGOARTICULO);

END;



--***************************************************Modificacion Articulos*****************************************************************//
--Requiere el codigo de articulo por modificar, el usuario e.g 'admin' y el precio nuevo en dolares, la fecha se cambia sola, e.g execute SP_ModificarArticulo('MOCO4075','admin',200);

Procedure SP_ModificarArticulo (IN_CODIGO IN VARCHAR2, IN_CODUSERREGISTRO IN VARCHAR2, IN_PRECIOMERCDOLARES IN NUMBER)

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

Procedure SP_ModificarComponente (IN_CODCOMPONENTE IN VARCHAR2,IN_CODARTICULO IN VARCHAR2)

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

Procedure SP_BorrarComponente (IN_CODCOMPONENTE IN VARCHAR2,IN_CODARTICULO IN VARCHAR2)

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


Procedure SP_GetArticulos 
IS
      Var_codArticulo VARCHAR2(20);
      Var_descripcion VARCHAR2(40);
      Var_codUnidMed VARCHAR2(40);
      Var_codMarca NUMBER(3);
      Var_modelo VARCHAR2(15);
      Var_fechaReg DATE;
      Var_codFamilia NUMBER(3);
      Var_codEstArticulo NUMBER(3);
      Var_codUserRegistro VARCHAR2(10);
      Var_Cant NUMBER(10);
      Var_CantMax NUMBER(10);
      Var_CantMin NUMBER(10);
      Var_PrecioMerDolar NUMBER(17,2);
      Var_FechaActPrecio DATE;
      
      CURSOR cursorArticulos IS SELECT codigo,descripcion,undMedida,codMarca,modelo,fecRegistro,codFamilia,
      codEstArticulo,codUserRegistro,cantidad,cantMaxima,cantMinima,precioMercDolares,fechaActPrecio FROM t_articulos;

BEGIN
      open cursorArticulos;
      loop
        fetch cursorArticulos into Var_codArticulo,Var_descripcion,Var_codUnidMed,Var_codMarca,Var_modelo,Var_fechaReg,
        Var_codFamilia,Var_codEstArticulo,Var_codUserRegistro,Var_Cant,Var_CantMax,Var_CantMin,Var_PrecioMerDolar,Var_FechaActPrecio; 
        exit when cursorArticulos %notfound;
        --DBMS_OUTPUT.PUT_LINE(Var_descripcion); --solo para verifcar
      end loop;
      close cursorArticulos;
      commit;
END SP_GetArticulos;



Procedure SP_GetComponentes 
IS
      Var_codComponente VARCHAR2(20);
      Var_codArticulo VARCHAR2(20);
      
      CURSOR cursorComponentes IS SELECT codComponente,codArticulo FROM t_componentes;

BEGIN
      open cursorComponentes;
      loop
        fetch cursorComponentes into Var_codComponente,Var_codArticulo; 
        exit when cursorComponentes %notfound;
        DBMS_OUTPUT.PUT_LINE(Var_codComponente); --solo para verifcar
      end loop;
      close cursorComponentes;
      commit;
END SP_GetComponentes;


  -- ============================================================================================
  -- TESTING RETURNS
  -- ============================================================================================
  
	PROCEDURE SP_GETARTIC_V2(
		CURRESP OUT SYS_REFCURSOR
	) AS BEGIN
	  OPEN CURRESP FOR
		SELECT TA.DESCRIPCION FROM T_ARTICULOS TA;
	END;

	FUNCTION SP_TEST_GETARTIC_V2 RETURN SYS_REFCURSOR
	AS
	  CURRESP SYS_REFCURSOR;
	BEGIN
	  SP_GETARTIC_V2(CURRESP);
	  RETURN CURRESP;
	END;
  
  -- ============================================================================================








END PKG_Articulo;




commit;





select * from t_familias;

--execute cotizaciones_pkg.give_me_money('Euro');