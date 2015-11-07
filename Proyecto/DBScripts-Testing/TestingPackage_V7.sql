CREATE OR REPLACE PACKAGE MS_V7_ARTICULOS IS

    -- -------------------------------------------------------------------------
    -- Define un tipo tabla del mismmo tipo que la de articulos
    -- Declara una funcion que retorne una tabla de tipos
    -- -------------------------------------------------------------------------
    TYPE ARRARTICULOS IS TABLE OF T_ARTICULOS%ROWTYPE INDEX BY BINARY_INTEGER;
    FUNCTION LISTARTICULOS RETURN ARRARTICULOS;
    -- -------------------------------------------------------------------------
    
    
END MS_V7_ARTICULOS;

CREATE OR REPLACE PACKAGE BODY MS_V7_ARTICULOS IS

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
    
END MS_V7_ARTICULOS;