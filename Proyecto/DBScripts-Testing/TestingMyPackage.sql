

  -- -------------------------------------------------------------------------
  -- ESTE ARCHIVO ES PARTE DE PROGRA1 BASES DE DATOS 2
  -- PACKAGE UTILIZADO PARA GENERAR EL WEB SERVICE. 
  -- -------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE FINALPKGPROGRA1 IS

  -- ARTICULOS
  -- -------------------------------------------------------------------------
  -- Define un tipo tabla del mismmo tipo que la de articulos
  -- Declara una funcion que retorne una tabla de tipos
  -- -------------------------------------------------------------------------
  TYPE ARRARTICULOS IS TABLE OF T_ARTICULOS%ROWTYPE INDEX BY BINARY_INTEGER;
  FUNCTION LISTARTICULOS RETURN ARRARTICULOS;
  -- -------------------------------------------------------------------------
  -- UNDMEDIDAS
  -- -------------------------------------------------------------------------
  -- Define un tipo tabla del mismmo tipo que la de unidad de medida
  -- Declara una funcion que retorne una tabla de tipos
  -- -------------------------------------------------------------------------
  TYPE ARRUNIDMEDIDAS IS TABLE OF T_UNIDADMEDIDAS%ROWTYPE INDEX BY BINARY_INTEGER;
  FUNCTION LISTUNIDMEDIDAS RETURN ARRUNIDMEDIDAS;
  -- -------------------------------------------------------------------------
  -- MARCAS
  -- -------------------------------------------------------------------------
  -- Define un tipo tabla del mismmo tipo que la de marcas
  -- Declara una funcion que retorne una tabla de tipos
  -- -------------------------------------------------------------------------
  TYPE ARRMARCAS IS TABLE OF T_MARCAS%ROWTYPE INDEX BY BINARY_INTEGER;
  FUNCTION LISTMARCAS RETURN ARRMARCAS;
  -- -------------------------------------------------------------------------
  -- FAMILIAS
  -- -------------------------------------------------------------------------
  -- Define un tipo tabla del mismmo tipo que la de familias
  -- Declara una funcion que retorne una tabla de tipos
  -- -------------------------------------------------------------------------
  TYPE ARRFAMILIAS IS TABLE OF T_FAMILIAS%ROWTYPE INDEX BY BINARY_INTEGER;
  FUNCTION LISTFAMILIAS RETURN ARRFAMILIAS;
  -- -------------------------------------------------------------------------
  -- 

END FINALPKGPROGRA1;

CREATE OR REPLACE PACKAGE BODY FINALPKGPROGRA1 IS

  -- -------------------------------------------------------------------------
  -- ARTICULOS
  -- -------------------------------------------------------------------------
  -- Definicion de la funcion
  -- -------------------------------------------------------------------------
  FUNCTION LISTARTICULOS RETURN ARRARTICULOS IS
      CURSOR CURARTICULOS IS
        SELECT * FROM T_ARTICULOS;
      MYARR ARRARTICULOS;
      CONTA NUMBER := 1;
  BEGIN
      FOR R IN CURARTICULOS LOOP
         MYARR(CONTA) := R;
         CONTA := CONTA + 1;
      END LOOP;
      RETURN MYARR;
  END;
  -- -------------------------------------------------------------------------
  -- UNDMEDIDAS
  -- -------------------------------------------------------------------------
  -- Definicion de la funcion
  -- -------------------------------------------------------------------------
  FUNCTION LISTUNIDMEDIDAS RETURN ARRUNIDMEDIDAS IS
      CURSOR CURUNIDMEDIDAS IS
        SELECT * FROM T_UNIDADMEDIDAS;
      MYARR ARRUNIDMEDIDAS;
      CONTA NUMBER := 1;
  BEGIN
      FOR R IN CURUNIDMEDIDAS LOOP
         MYARR(CONTA) := R;
         CONTA := CONTA + 1;
      END LOOP;
      RETURN MYARR;
  END;
  -- -------------------------------------------------------------------------
  -- MARCAS
  -- -------------------------------------------------------------------------
  -- Definicion de la funcion
  -- -------------------------------------------------------------------------
  FUNCTION LISTMARCAS RETURN ARRMARCAS IS
      CURSOR CURMARCAS IS
        SELECT * FROM T_MARCAS;
      MYARR ARRMARCAS;
      CONTA NUMBER := 1;
  BEGIN
      FOR R IN CURMARCAS LOOP
         MYARR(CONTA) := R;
         CONTA := CONTA + 1;
      END LOOP;
      RETURN MYARR;
  END;
  -- -------------------------------------------------------------------------
  -- FAMILIAS
  -- -------------------------------------------------------------------------
  -- Definicion de la funcion
  -- -------------------------------------------------------------------------
  FUNCTION LISTFAMILIAS RETURN ARRFAMILIAS IS
      CURSOR CURFAMILIAS IS
        SELECT * FROM T_FAMILIAS;
      MYARR ARRFAMILIAS;
      CONTA NUMBER := 1;
  BEGIN
      FOR R IN CURFAMILIAS LOOP
         MYARR(CONTA) := R;
         CONTA := CONTA + 1;
      END LOOP;
      RETURN MYARR;
  END;
  -- -------------------------------------------------------------------------
  -- 
  
END FINALPKGPROGRA1;
