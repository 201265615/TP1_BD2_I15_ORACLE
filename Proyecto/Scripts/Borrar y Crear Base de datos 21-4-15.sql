-- Generado por Oracle SQL Developer Data Modeler 4.0.2.840
--   en:        2015-04-21 10:57:48 CST
--   sitio:      Oracle Database 12c
--   tipo:      Oracle Database 12c




DROP TABLE MVIALES.T_ARTICULOESTADOS CASCADE CONSTRAINTS ;

DROP TABLE MVIALES.T_ARTICULOS CASCADE CONSTRAINTS ;

DROP TABLE MVIALES.T_ARTICULOSCOTIZADOS CASCADE CONSTRAINTS ;

DROP TABLE MVIALES.T_BITACORA CASCADE CONSTRAINTS ;

DROP TABLE MVIALES.T_COMPONENTES CASCADE CONSTRAINTS ;

DROP TABLE MVIALES.T_CONTACTO CASCADE CONSTRAINTS ;

DROP TABLE MVIALES.T_COTIZACIONES CASCADE CONSTRAINTS ;

DROP TABLE MVIALES.T_COTIZACIONESTADOS CASCADE CONSTRAINTS ;

DROP TABLE MVIALES.T_CUIDADES CASCADE CONSTRAINTS ;

DROP TABLE MVIALES.T_DETALLEDIRECCION CASCADE CONSTRAINTS ;

DROP TABLE MVIALES.T_EMPRESA CASCADE CONSTRAINTS ;

DROP TABLE MVIALES.T_ESTADOSTIPOCAMBIOS CASCADE CONSTRAINTS ;

DROP TABLE MVIALES.T_FACTURACOMPRAS CASCADE CONSTRAINTS ;

DROP TABLE MVIALES.T_FAMILIAS CASCADE CONSTRAINTS ;

DROP TABLE MVIALES."T_INDICEECONOMICOS" CASCADE CONSTRAINTS ;

DROP TABLE MVIALES.T_LINEASFACTURACOMPRAS CASCADE CONSTRAINTS ;

DROP TABLE MVIALES.T_LISTAPRECIOS CASCADE CONSTRAINTS ;

DROP TABLE MVIALES.T_LISTAPRECIOXARTICULOS CASCADE CONSTRAINTS ;

DROP TABLE MVIALES.T_MARCAS CASCADE CONSTRAINTS ;

DROP TABLE MVIALES.T_MESANIO CASCADE CONSTRAINTS ;

DROP TABLE MVIALES.T_MONEDAS CASCADE CONSTRAINTS ;

DROP TABLE MVIALES.T_PAISES CASCADE CONSTRAINTS ;

DROP TABLE MVIALES.T_PERMISOUSUARIOS CASCADE CONSTRAINTS ;

DROP TABLE MVIALES.T_PROVINCIAS CASCADE CONSTRAINTS ;

DROP TABLE MVIALES.T_PROYECCIONESLISTAPRECIOS CASCADE CONSTRAINTS ;

DROP TABLE MVIALES.T_TIPOCAMBIOS CASCADE CONSTRAINTS ;

DROP TABLE MVIALES.T_TIPOCONTACTOS CASCADE CONSTRAINTS ;

DROP TABLE MVIALES.T_TIPOEMPRESA CASCADE CONSTRAINTS ;

DROP TABLE MVIALES.T_TIPOERRORES CASCADE CONSTRAINTS ;

DROP TABLE MVIALES.T_TIPOUSUARIOS CASCADE CONSTRAINTS ;

DROP TABLE MVIALES.T_UNIDADMEDIDAS CASCADE CONSTRAINTS ;

DROP TABLE MVIALES.T_USUARIOS CASCADE CONSTRAINTS ;

CREATE TABLE MVIALES.T_ARTICULOESTADOS
  (
    CODIGO      NUMBER (3) NOT NULL ,
    DESCRIPCION VARCHAR2 (20 BYTE) NOT NULL
  ) ;
CREATE UNIQUE INDEX MVIALES.T_ARTICULOESTADOS_PK ON MVIALES.T_ARTICULOESTADOS
  (
    CODIGO ASC
  )
  ;
  ALTER TABLE MVIALES.T_ARTICULOESTADOS ADD CONSTRAINT T_ARTICULOESTADOS_PK PRIMARY KEY ( CODIGO ) ;

CREATE TABLE MVIALES.T_ARTICULOS
  (
    CODIGO            VARCHAR2 (20 BYTE) NOT NULL ,
    DESCRIPCION       VARCHAR2 (40 BYTE) NOT NULL ,
    UNDMEDIDA         NUMBER (3) NOT NULL ,
    CODMARCA          NUMBER (3) NOT NULL ,
    MODELO            VARCHAR2 (15 BYTE) NOT NULL ,
    FECREGISTRO       DATE NOT NULL ,
    CODFAMILIA        NUMBER (3) NOT NULL ,
    CODESTARTICULO    NUMBER (3) NOT NULL ,
    CODUSERREGISTRO   VARCHAR2 (10 BYTE) NOT NULL ,
    CANTIDAD          NUMBER (10) NOT NULL ,
    CANTMAXIMA        NUMBER (10) NOT NULL ,
    CANTMINIMA        NUMBER (10) NOT NULL ,
    PRECIOMERCDOLARES NUMBER (17,2) NOT NULL ,
    FECHAACTPRECIO    DATE NOT NULL
  ) ;
CREATE UNIQUE INDEX MVIALES.T_ARTICULOS_PK ON MVIALES.T_ARTICULOS
  (
    CODIGO ASC
  )
  ;
  ALTER TABLE MVIALES.T_ARTICULOS ADD CONSTRAINT T_ARTICULOS_PK PRIMARY KEY ( CODIGO ) ;

CREATE TABLE MVIALES.T_ARTICULOSCOTIZADOS
  (
    NUMCOTIZACION   NUMBER (10) NOT NULL ,
    CODARTICULO     VARCHAR2 (20 BYTE) NOT NULL ,
    UNDMEDIDA       NUMBER (3) NOT NULL ,
    CANTIDAD        NUMBER (10) NOT NULL ,
    PORCENDESCUENTO NUMBER (2) NOT NULL ,
    COSTOUNITARIO   NUMBER (17,2) NOT NULL ,
    COSTOGRABADO    NUMBER (17,2) NOT NULL ,
    MONTOLINEA      NUMBER (17,2) NOT NULL
  ) ;
CREATE UNIQUE INDEX MVIALES.T_ARTICULOSCOTIZADOS_PK ON MVIALES.T_ARTICULOSCOTIZADOS
  (
    NUMCOTIZACION ASC
  )
  ;
  ALTER TABLE MVIALES.T_ARTICULOSCOTIZADOS ADD CONSTRAINT T_ARTICULOSCOTIZADOS_PK PRIMARY KEY ( NUMCOTIZACION ) ;

CREATE TABLE MVIALES.T_BITACORA
  (
    CODIGO       NUMBER (10) NOT NULL ,
    CODUSER      VARCHAR2 (10 BYTE) NOT NULL ,
    CODTIPOERROR NUMBER (3) NOT NULL ,
    FECHAHORA    DATE NOT NULL
  ) ;
CREATE UNIQUE INDEX MVIALES.T_BITACORA_PK ON MVIALES.T_BITACORA
  (
    CODIGO ASC
  )
  ;
  ALTER TABLE MVIALES.T_BITACORA ADD CONSTRAINT T_BITACORA_PK PRIMARY KEY ( CODIGO ) ;

CREATE TABLE MVIALES.T_COMPONENTES
  (
    CODCOMPONENTE VARCHAR2 (20 BYTE) NOT NULL ,
    CODARTICULO   VARCHAR2 (20 BYTE) NOT NULL
  ) ;

CREATE TABLE MVIALES.T_CONTACTO
  (
    CODCONTACTO     NUMBER (3) NOT NULL ,
    CODTIPOCONTACTO NUMBER (3) NOT NULL ,
    VALOR           VARCHAR2 (50 BYTE) NOT NULL ,
    CODEMPRESA      NUMBER (10) NOT NULL
  ) ;
CREATE UNIQUE INDEX MVIALES.T_CONTACTO_PK ON MVIALES.T_CONTACTO
  (
    CODCONTACTO ASC
  )
  ;
  ALTER TABLE MVIALES.T_CONTACTO ADD CONSTRAINT T_CONTACTO_PK PRIMARY KEY ( CODCONTACTO ) ;

CREATE TABLE MVIALES.T_COTIZACIONES
  (
    NUMERO          NUMBER (10) NOT NULL ,
    FECREGISTRO     DATE NOT NULL ,
    CEDJURCLIENTE   NUMBER (10) NOT NULL ,
    CONDICIONPAGO   VARCHAR2 (60 BYTE) NOT NULL ,
    CONDICIONVENTA  VARCHAR2 (60 BYTE) NOT NULL ,
    VIGENCIA        VARCHAR2 (30 BYTE) NOT NULL ,
    OBSERVACIONES   VARCHAR2 (100 BYTE) NOT NULL ,
    CODMONEDA       NUMBER (3) NOT NULL ,
    CODESTADOCOTIZ  NUMBER (3) NOT NULL ,
    CODLISTAPRECIOS NUMBER (3) NOT NULL ,
    MESENTREG       NUMBER (2) NOT NULL ,
    ANIOENTREG      NUMBER (4) NOT NULL
  ) ;
CREATE UNIQUE INDEX MVIALES.T_COTIZACIONES_PK ON MVIALES.T_COTIZACIONES
  (
    NUMERO ASC
  )
  ;
  ALTER TABLE MVIALES.T_COTIZACIONES ADD CONSTRAINT T_COTIZACIONES_PK PRIMARY KEY ( NUMERO ) ;

CREATE TABLE MVIALES.T_COTIZACIONESTADOS
  (
    CODIGO      NUMBER (3) NOT NULL ,
    DESCRIPCION VARCHAR2 (20 BYTE) NOT NULL
  ) ;
CREATE UNIQUE INDEX MVIALES.T_COTIZACIONESTADOS_PK ON MVIALES.T_COTIZACIONESTADOS
  (
    CODIGO ASC
  )
  ;
  ALTER TABLE MVIALES.T_COTIZACIONESTADOS ADD CONSTRAINT T_COTIZACIONESTADOS_PK PRIMARY KEY ( CODIGO ) ;

CREATE TABLE MVIALES.T_CUIDADES
  (
    CODCIUDAD    NUMBER (3) NOT NULL ,
    CODPROVINCIA NUMBER (3) NOT NULL ,
    NOMBRE       VARCHAR2 (20 BYTE) NOT NULL
  ) ;
CREATE UNIQUE INDEX MVIALES.T_CUIDADES_PK ON MVIALES.T_CUIDADES
  (
    CODCIUDAD ASC
  )
  ;
  ALTER TABLE MVIALES.T_CUIDADES ADD CONSTRAINT T_CUIDADES_PK PRIMARY KEY ( CODCIUDAD ) ;

CREATE TABLE MVIALES.T_DETALLEDIRECCION
  (
    CODDETALLE NUMBER (3) NOT NULL ,
    CODCIUDAD  NUMBER (3) NOT NULL ,
    APARPOSTAL VARCHAR2 (10 BYTE) NOT NULL ,
    DETALLE1   VARCHAR2 (50 BYTE) NOT NULL ,
    DETALLE2   VARCHAR2 (50 BYTE) NOT NULL
  ) ;
CREATE UNIQUE INDEX MVIALES.T_DETALLEDIRECCION_PK ON MVIALES.T_DETALLEDIRECCION
  (
    CODDETALLE ASC
  )
  ;
  ALTER TABLE MVIALES.T_DETALLEDIRECCION ADD CONSTRAINT T_DETALLEDIRECCION_PK PRIMARY KEY ( CODDETALLE ) ;

CREATE TABLE MVIALES.T_EMPRESA
  (
    CEDULAJURIDICA  NUMBER (10) NOT NULL ,
    NOMBRECOMERCIAL NUMBER (20) NOT NULL ,
    DIRECCION       NUMBER (3) NOT NULL ,
    CODTIPOEMPRESA  NUMBER (3) NOT NULL
  ) ;
CREATE UNIQUE INDEX MVIALES.T_EMPRESA_PK ON MVIALES.T_EMPRESA
  (
    CEDULAJURIDICA ASC
  )
  ;
  ALTER TABLE MVIALES.T_EMPRESA ADD CONSTRAINT T_EMPRESA_PK PRIMARY KEY ( CEDULAJURIDICA ) ;

CREATE TABLE MVIALES.T_ESTADOSTIPOCAMBIOS
  (
    CODIGO NUMBER (3) NOT NULL ,
    NOMBRE VARCHAR2 (1 BYTE) NOT NULL
  ) ;
CREATE UNIQUE INDEX MVIALES.T_ESTADOSTIPOCAMBIOS_PK ON MVIALES.T_ESTADOSTIPOCAMBIOS
  (
    CODIGO ASC
  )
  ;
  ALTER TABLE MVIALES.T_ESTADOSTIPOCAMBIOS ADD CONSTRAINT T_ESTADOSTIPOCAMBIOS_PK PRIMARY KEY ( CODIGO ) ;

CREATE TABLE MVIALES.T_FACTURACOMPRAS
  (
    CODIGO          NUMBER (10) NOT NULL ,
    FECCOMPRA       DATE NOT NULL ,
    FECREGISTRO     DATE NOT NULL ,
    CODUSERREGISTRO VARCHAR2 (10 BYTE) NOT NULL
  ) ;
CREATE UNIQUE INDEX MVIALES.T_FACTURACOMPRAS_PK ON MVIALES.T_FACTURACOMPRAS
  (
    CODIGO ASC
  )
  ;
  ALTER TABLE MVIALES.T_FACTURACOMPRAS ADD CONSTRAINT T_FACTURACOMPRAS_PK PRIMARY KEY ( CODIGO ) ;

CREATE TABLE MVIALES.T_FAMILIAS
  (
    CODIGO             NUMBER (3) NOT NULL ,
    DESCRIPCION        VARCHAR2 (40 BYTE) NOT NULL ,
    PORCIMPACOMPRA     NUMBER (3) NOT NULL ,
    CODINDICEECONOMICO NUMBER (3) NOT NULL
  ) ;
CREATE UNIQUE INDEX MVIALES.T_FAMILIAS_PK ON MVIALES.T_FAMILIAS
  (
    CODIGO ASC
  )
  ;
  ALTER TABLE MVIALES.T_FAMILIAS ADD CONSTRAINT T_FAMILIAS_PK PRIMARY KEY ( CODIGO ) ;

CREATE TABLE MVIALES."T_INDICEECONOMICOS"
  (
    CODIGO           NUMBER (3) NOT NULL ,
    DESCRIPCION      VARCHAR2 (40 BYTE) NOT NULL ,
    NUMVALORESREALES NUMBER (10) NOT NULL ,
    NUMMESES         NUMBER (10) NOT NULL
  ) ;
CREATE UNIQUE INDEX MVIALES."T_IndiceEconomicos _PK" ON MVIALES."T_INDICEECONOMICOS"
  (
    CODIGO ASC
  )
  ;
  ALTER TABLE MVIALES."T_INDICEECONOMICOS" ADD CONSTRAINT "T_IndiceEconomicos _PK" PRIMARY KEY ( CODIGO ) ;

CREATE TABLE MVIALES.T_LINEASFACTURACOMPRAS
  (
    CODFACTURA    NUMBER (10) NOT NULL ,
    CODARTICULO   VARCHAR2 (20 BYTE) NOT NULL ,
    PRECIODOLARES NUMBER (17,2) NOT NULL ,
    CANTIDAD      NUMBER (10) NOT NULL
  ) ;
CREATE UNIQUE INDEX MVIALES.T_LINEASFACTURACOMPRAS_PK ON MVIALES.T_LINEASFACTURACOMPRAS
  (
    CODFACTURA ASC , CODARTICULO ASC
  )
  ;
  ALTER TABLE MVIALES.T_LINEASFACTURACOMPRAS ADD CONSTRAINT T_LINEASFACTURACOMPRAS_PK PRIMARY KEY ( CODFACTURA, CODARTICULO ) ;

CREATE TABLE MVIALES.T_LISTAPRECIOS
  (
    CODIGO      NUMBER (3) NOT NULL ,
    DESCRIPCION VARCHAR2 (40 BYTE) NOT NULL ,
    GASTOADMIN  NUMBER (3) NOT NULL ,
    GASTOOTROS  NUMBER (3) NOT NULL ,
    UTILIDAD    NUMBER (3) NOT NULL
  ) ;
CREATE UNIQUE INDEX MVIALES.T_LISTAPRECIOS_PK ON MVIALES.T_LISTAPRECIOS
  (
    CODIGO ASC
  )
  ;
  ALTER TABLE MVIALES.T_LISTAPRECIOS ADD CONSTRAINT T_LISTAPRECIOS_PK PRIMARY KEY ( CODIGO ) ;

CREATE TABLE MVIALES.T_LISTAPRECIOXARTICULOS
  (
    CODLISTAPRECIO NUMBER (3) NOT NULL ,
    CODARTICULO    VARCHAR2 (20 BYTE) NOT NULL
  ) ;
CREATE UNIQUE INDEX MVIALES.T_LISTAPRECIOXARTICULOS_PK ON MVIALES.T_LISTAPRECIOXARTICULOS
  (
    CODLISTAPRECIO ASC , CODARTICULO ASC
  )
  ;
  ALTER TABLE MVIALES.T_LISTAPRECIOXARTICULOS ADD CONSTRAINT T_LISTAPRECIOXARTICULOS_PK PRIMARY KEY ( CODLISTAPRECIO, CODARTICULO ) ;

CREATE TABLE MVIALES.T_MARCAS
  (
    CODIGO      NUMBER (3) NOT NULL ,
    DESCRIPCION VARCHAR2 (20 BYTE) NOT NULL
  ) ;
CREATE UNIQUE INDEX MVIALES.T_MARCAS_PK ON MVIALES.T_MARCAS
  (
    CODIGO ASC
  )
  ;
  ALTER TABLE MVIALES.T_MARCAS ADD CONSTRAINT T_MARCAS_PK PRIMARY KEY ( CODIGO ) ;

CREATE TABLE MVIALES.T_MESANIO
  (
    MES  NUMBER (2) NOT NULL ,
    ANIO NUMBER (4) NOT NULL
  ) ;
CREATE UNIQUE INDEX MVIALES.T_MESANIO_PK ON MVIALES.T_MESANIO
  (
    MES ASC , ANIO ASC
  )
  ;
  ALTER TABLE MVIALES.T_MESANIO ADD CONSTRAINT T_MESANIO_PK PRIMARY KEY ( MES, ANIO ) ;

CREATE TABLE MVIALES.T_MONEDAS
  (
    CODIGO NUMBER (3) NOT NULL ,
    NOMBRE VARCHAR2 (10 BYTE) NOT NULL
  ) ;
CREATE UNIQUE INDEX MVIALES.T_MONEDAS_PK ON MVIALES.T_MONEDAS
  (
    CODIGO ASC
  )
  ;
  ALTER TABLE MVIALES.T_MONEDAS ADD CONSTRAINT T_MONEDAS_PK PRIMARY KEY ( CODIGO ) ;

CREATE TABLE MVIALES.T_PAISES
  (
    CODPAIS NUMBER (3) NOT NULL ,
    NOMBRE  NUMBER (10) NOT NULL
  ) ;
CREATE UNIQUE INDEX MVIALES.T_PAISES_PK ON MVIALES.T_PAISES
  (
    CODPAIS ASC
  )
  ;
  ALTER TABLE MVIALES.T_PAISES ADD CONSTRAINT T_PAISES_PK PRIMARY KEY ( CODPAIS ) ;

CREATE TABLE MVIALES.T_PERMISOUSUARIOS
  (
    CODIGO      NUMBER (3) NOT NULL ,
    DESCRIPCION VARCHAR2 (20 BYTE) NOT NULL
  ) ;
CREATE UNIQUE INDEX MVIALES.T_PERMISOUSUARIOS_PK ON MVIALES.T_PERMISOUSUARIOS
  (
    CODIGO ASC
  )
  ;
  ALTER TABLE MVIALES.T_PERMISOUSUARIOS ADD CONSTRAINT T_PERMISOUSUARIOS_PK PRIMARY KEY ( CODIGO ) ;

CREATE TABLE MVIALES.T_PROVINCIAS
  (
    CODPROVINCIA NUMBER (3) NOT NULL ,
    CODPAIS      NUMBER (3) NOT NULL ,
    NOMBRE       VARCHAR2 (20 BYTE) NOT NULL
  ) ;
CREATE UNIQUE INDEX MVIALES.T_PROVINCIAS_PK ON MVIALES.T_PROVINCIAS
  (
    CODPROVINCIA ASC
  )
  ;
  ALTER TABLE MVIALES.T_PROVINCIAS ADD CONSTRAINT T_PROVINCIAS_PK PRIMARY KEY ( CODPROVINCIA ) ;

CREATE TABLE MVIALES.T_PROYECCIONESLISTAPRECIOS
  (
    CODARTICULO              VARCHAR2 (20 BYTE) NOT NULL ,
    CODLISTAPRECIOS          NUMBER (3) NOT NULL ,
    MES                      NUMBER (2) NOT NULL ,
    ANIO                     NUMBER (4) NOT NULL ,
    TIPOCAMBIOPROYECT        NUMBER (17,2) NOT NULL ,
    PRECIOMERCDOLARESPROYECT NUMBER (17,2) NOT NULL
  ) ;

CREATE TABLE MVIALES.T_TIPOCAMBIOS
  (
    CODMONEDA1         NUMBER (3) NOT NULL ,
    CODMONEDA2         NUMBER (3) NOT NULL ,
    MONTO              NUMBER (17,2) NOT NULL ,
    CODINDICEECONOMICO NUMBER (3) NOT NULL ,
    ESTADO             NUMBER (3) NOT NULL ,
    MES                NUMBER (2) NOT NULL ,
    ANIO               NUMBER (4) NOT NULL
  ) ;

CREATE TABLE MVIALES.T_TIPOCONTACTOS
  (
    CODTIPOCONTACTO NUMBER (3) NOT NULL ,
    NOMBRE          NUMBER (10) NOT NULL
  ) ;
CREATE UNIQUE INDEX MVIALES.T_TIPOCONTACTOS_PK ON MVIALES.T_TIPOCONTACTOS
  (
    CODTIPOCONTACTO ASC
  )
  ;
  ALTER TABLE MVIALES.T_TIPOCONTACTOS ADD CONSTRAINT T_TIPOCONTACTOS_PK PRIMARY KEY ( CODTIPOCONTACTO ) ;

CREATE TABLE MVIALES.T_TIPOEMPRESA
  (
    CODTIPOEMPRESA NUMBER (3) NOT NULL ,
    NOMBRE         VARCHAR2 (20 BYTE) NOT NULL
  ) ;
CREATE UNIQUE INDEX MVIALES.T_TIPOEMPRESA_PK ON MVIALES.T_TIPOEMPRESA
  (
    CODTIPOEMPRESA ASC
  )
  ;
  ALTER TABLE MVIALES.T_TIPOEMPRESA ADD CONSTRAINT T_TIPOEMPRESA_PK PRIMARY KEY ( CODTIPOEMPRESA ) ;

CREATE TABLE MVIALES.T_TIPOERRORES
  (
    CODIGO      NUMBER (3) NOT NULL ,
    DESCRIPCION VARCHAR2 (15 BYTE) NOT NULL
  ) ;
CREATE UNIQUE INDEX MVIALES.T_TIPOERRORES_PK ON MVIALES.T_TIPOERRORES
  (
    CODIGO ASC
  )
  ;
  ALTER TABLE MVIALES.T_TIPOERRORES ADD CONSTRAINT T_TIPOERRORES_PK PRIMARY KEY ( CODIGO ) ;

CREATE TABLE MVIALES.T_TIPOUSUARIOS
  (
    CODIGO         NUMBER (3) NOT NULL ,
    CODUSERPERMISO NUMBER (3) NOT NULL ,
    DESCRIPCION    VARCHAR2 (20 BYTE) NOT NULL
  ) ;
CREATE UNIQUE INDEX MVIALES.T_TIPOUSUARIOS_PK ON MVIALES.T_TIPOUSUARIOS
  (
    CODIGO ASC
  )
  ;
  ALTER TABLE MVIALES.T_TIPOUSUARIOS ADD CONSTRAINT T_TIPOUSUARIOS_PK PRIMARY KEY ( CODIGO ) ;

CREATE TABLE MVIALES.T_UNIDADMEDIDAS
  (
    CODIGO      NUMBER (3) NOT NULL ,
    DESCRIPCION VARCHAR2 (40 BYTE) NOT NULL
  ) ;
CREATE UNIQUE INDEX MVIALES.T_UNIDADMEDIDAS_PK ON MVIALES.T_UNIDADMEDIDAS
  (
    CODIGO ASC
  )
  ;
  ALTER TABLE MVIALES.T_UNIDADMEDIDAS ADD CONSTRAINT T_UNIDADMEDIDAS_PK PRIMARY KEY ( CODIGO ) ;

CREATE TABLE MVIALES.T_USUARIOS
  (
    NBRLOGIN    VARCHAR2 (10 BYTE) NOT NULL ,
    CLVLOGIN    VARCHAR2 (10 BYTE) NOT NULL ,
    CODUSERTIPO NUMBER (3) NOT NULL
  ) ;
CREATE UNIQUE INDEX MVIALES.T_USUARIOS_PK ON MVIALES.T_USUARIOS
  (
    NBRLOGIN ASC
  )
  ;
  ALTER TABLE MVIALES.T_USUARIOS ADD CONSTRAINT T_USUARIOS_PK PRIMARY KEY ( NBRLOGIN ) ;

ALTER TABLE MVIALES.T_ARTICULOSCOTIZADOS ADD CONSTRAINT FKT_ARTICULO382695 FOREIGN KEY ( CODARTICULO ) REFERENCES MVIALES.T_ARTICULOS ( CODIGO ) ;

ALTER TABLE MVIALES.T_ARTICULOSCOTIZADOS ADD CONSTRAINT FKT_ARTICULO50573 FOREIGN KEY ( NUMCOTIZACION ) REFERENCES MVIALES.T_COTIZACIONES ( NUMERO ) ;

ALTER TABLE MVIALES.T_ARTICULOSCOTIZADOS ADD CONSTRAINT FKT_ARTICULO522199 FOREIGN KEY ( UNDMEDIDA ) REFERENCES MVIALES.T_UNIDADMEDIDAS ( CODIGO ) ;

ALTER TABLE MVIALES.T_ARTICULOS ADD CONSTRAINT FKT_ARTICULO570863 FOREIGN KEY ( UNDMEDIDA ) REFERENCES MVIALES.T_UNIDADMEDIDAS ( CODIGO ) ;

ALTER TABLE MVIALES.T_ARTICULOS ADD CONSTRAINT FKT_ARTICULO578076 FOREIGN KEY ( CODUSERREGISTRO ) REFERENCES MVIALES.T_USUARIOS ( NBRLOGIN ) ;

ALTER TABLE MVIALES.T_ARTICULOS ADD CONSTRAINT FKT_ARTICULO840016 FOREIGN KEY ( CODESTARTICULO ) REFERENCES MVIALES.T_ARTICULOESTADOS ( CODIGO ) ;

ALTER TABLE MVIALES.T_ARTICULOS ADD CONSTRAINT FKT_ARTICULO848891 FOREIGN KEY ( CODMARCA ) REFERENCES MVIALES.T_MARCAS ( CODIGO ) ;

ALTER TABLE MVIALES.T_ARTICULOS ADD CONSTRAINT FKT_ARTICULO904486 FOREIGN KEY ( CODFAMILIA ) REFERENCES MVIALES.T_FAMILIAS ( CODIGO ) ;

ALTER TABLE MVIALES.T_BITACORA ADD CONSTRAINT FKT_BITACORA251134 FOREIGN KEY ( CODTIPOERROR ) REFERENCES MVIALES.T_TIPOERRORES ( CODIGO ) ;

ALTER TABLE MVIALES.T_BITACORA ADD CONSTRAINT FKT_BITACORA84906 FOREIGN KEY ( CODUSER ) REFERENCES MVIALES.T_USUARIOS ( NBRLOGIN ) ;

ALTER TABLE MVIALES.T_COMPONENTES ADD CONSTRAINT FKT_COMPONEN233783 FOREIGN KEY ( CODCOMPONENTE ) REFERENCES MVIALES.T_ARTICULOS ( CODIGO ) ;

ALTER TABLE MVIALES.T_COMPONENTES ADD CONSTRAINT FKT_COMPONEN774059 FOREIGN KEY ( CODARTICULO ) REFERENCES MVIALES.T_ARTICULOS ( CODIGO ) ;

ALTER TABLE MVIALES.T_CONTACTO ADD CONSTRAINT FKT_CONTACTO536274 FOREIGN KEY ( CODEMPRESA ) REFERENCES MVIALES.T_EMPRESA ( CEDULAJURIDICA ) ;

ALTER TABLE MVIALES.T_CONTACTO ADD CONSTRAINT FKT_CONTACTO759656 FOREIGN KEY ( CODTIPOCONTACTO ) REFERENCES MVIALES.T_TIPOCONTACTOS ( CODTIPOCONTACTO ) ;

ALTER TABLE MVIALES.T_COTIZACIONES ADD CONSTRAINT FKT_COTIZACI344790 FOREIGN KEY ( MESENTREG, ANIOENTREG ) REFERENCES MVIALES.T_MESANIO ( MES, ANIO ) ;

ALTER TABLE MVIALES.T_COTIZACIONES ADD CONSTRAINT FKT_COTIZACI429323 FOREIGN KEY ( CEDJURCLIENTE ) REFERENCES MVIALES.T_EMPRESA ( CEDULAJURIDICA ) ;

ALTER TABLE MVIALES.T_COTIZACIONES ADD CONSTRAINT FKT_COTIZACI656953 FOREIGN KEY ( CODMONEDA ) REFERENCES MVIALES.T_MONEDAS ( CODIGO ) ;

ALTER TABLE MVIALES.T_COTIZACIONES ADD CONSTRAINT FKT_COTIZACI717841 FOREIGN KEY ( CODESTADOCOTIZ ) REFERENCES MVIALES.T_COTIZACIONESTADOS ( CODIGO ) ;

ALTER TABLE MVIALES.T_COTIZACIONES ADD CONSTRAINT FKT_COTIZACI920077 FOREIGN KEY ( CODLISTAPRECIOS ) REFERENCES MVIALES.T_LISTAPRECIOS ( CODIGO ) ;

ALTER TABLE MVIALES.T_CUIDADES ADD CONSTRAINT FKT_CUIDADES473810 FOREIGN KEY ( CODPROVINCIA ) REFERENCES MVIALES.T_PROVINCIAS ( CODPROVINCIA ) ;

ALTER TABLE MVIALES.T_DETALLEDIRECCION ADD CONSTRAINT FKT_DETALLED350223 FOREIGN KEY ( CODCIUDAD ) REFERENCES MVIALES.T_CUIDADES ( CODCIUDAD ) ;

ALTER TABLE MVIALES.T_EMPRESA ADD CONSTRAINT FKT_EMPRESA228590 FOREIGN KEY ( CODTIPOEMPRESA ) REFERENCES MVIALES.T_TIPOEMPRESA ( CODTIPOEMPRESA ) ;

ALTER TABLE MVIALES.T_EMPRESA ADD CONSTRAINT FKT_EMPRESA469254 FOREIGN KEY ( DIRECCION ) REFERENCES MVIALES.T_DETALLEDIRECCION ( CODDETALLE ) ;

ALTER TABLE MVIALES.T_FACTURACOMPRAS ADD CONSTRAINT FKT_FACTURAC28973 FOREIGN KEY ( CODUSERREGISTRO ) REFERENCES MVIALES.T_USUARIOS ( NBRLOGIN ) ;

ALTER TABLE MVIALES.T_FAMILIAS ADD CONSTRAINT FKT_FAMILIAS683386 FOREIGN KEY ( CODINDICEECONOMICO ) REFERENCES MVIALES."T_INDICEECONOMICOS" ( CODIGO ) ;

ALTER TABLE MVIALES.T_LINEASFACTURACOMPRAS ADD CONSTRAINT FKT_LINEASFA481568 FOREIGN KEY ( CODARTICULO ) REFERENCES MVIALES.T_ARTICULOS ( CODIGO ) ;

ALTER TABLE MVIALES.T_LINEASFACTURACOMPRAS ADD CONSTRAINT FKT_LINEASFA50873 FOREIGN KEY ( CODFACTURA ) REFERENCES MVIALES.T_FACTURACOMPRAS ( CODIGO ) ;

ALTER TABLE MVIALES.T_LISTAPRECIOXARTICULOS ADD CONSTRAINT FKT_LISTAPRE160880 FOREIGN KEY ( CODARTICULO ) REFERENCES MVIALES.T_ARTICULOS ( CODIGO ) ;

ALTER TABLE MVIALES.T_LISTAPRECIOXARTICULOS ADD CONSTRAINT FKT_LISTAPRE78013 FOREIGN KEY ( CODLISTAPRECIO ) REFERENCES MVIALES.T_LISTAPRECIOS ( CODIGO ) ;

ALTER TABLE MVIALES.T_PROVINCIAS ADD CONSTRAINT FKT_PROVINCI451632 FOREIGN KEY ( CODPAIS ) REFERENCES MVIALES.T_PAISES ( CODPAIS ) ;

ALTER TABLE MVIALES.T_PROYECCIONESLISTAPRECIOS ADD CONSTRAINT FKT_PROYECCI566293 FOREIGN KEY ( CODLISTAPRECIOS, CODARTICULO ) REFERENCES MVIALES.T_LISTAPRECIOXARTICULOS ( CODLISTAPRECIO, CODARTICULO ) ;

ALTER TABLE MVIALES.T_PROYECCIONESLISTAPRECIOS ADD CONSTRAINT FKT_PROYECCI761595 FOREIGN KEY ( MES, ANIO ) REFERENCES MVIALES.T_MESANIO ( MES, ANIO ) ;

ALTER TABLE MVIALES.T_TIPOCAMBIOS ADD CONSTRAINT FKT_TIPOCAMB317616 FOREIGN KEY ( CODINDICEECONOMICO ) REFERENCES MVIALES."T_INDICEECONOMICOS" ( CODIGO ) ;

ALTER TABLE MVIALES.T_TIPOCAMBIOS ADD CONSTRAINT FKT_TIPOCAMB620100 FOREIGN KEY ( CODMONEDA1 ) REFERENCES MVIALES.T_MONEDAS ( CODIGO ) ;

ALTER TABLE MVIALES.T_TIPOCAMBIOS ADD CONSTRAINT FKT_TIPOCAMB620101 FOREIGN KEY ( CODMONEDA2 ) REFERENCES MVIALES.T_MONEDAS ( CODIGO ) ;

ALTER TABLE MVIALES.T_TIPOCAMBIOS ADD CONSTRAINT FKT_TIPOCAMB651026 FOREIGN KEY ( ESTADO ) REFERENCES MVIALES.T_ESTADOSTIPOCAMBIOS ( CODIGO ) ;

ALTER TABLE MVIALES.T_TIPOCAMBIOS ADD CONSTRAINT FKT_TIPOCAMB923514 FOREIGN KEY ( MES, ANIO ) REFERENCES MVIALES.T_MESANIO ( MES, ANIO ) ;

ALTER TABLE MVIALES.T_TIPOUSUARIOS ADD CONSTRAINT FKT_TIPOUSUA556339 FOREIGN KEY ( CODUSERPERMISO ) REFERENCES MVIALES.T_PERMISOUSUARIOS ( CODIGO ) ;

ALTER TABLE MVIALES.T_USUARIOS ADD CONSTRAINT FKT_USUARIOS41238 FOREIGN KEY ( CODUSERTIPO ) REFERENCES MVIALES.T_TIPOUSUARIOS ( CODIGO ) ;

CREATE SEQUENCE MVIALES.T_ARTICULOESTADOS_CODIGO_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER MVIALES.T_ARTICULOESTADOS_CODIGO_TRG BEFORE
  INSERT ON MVIALES.T_ARTICULOESTADOS FOR EACH ROW WHEN (NEW.CODIGO IS NULL) BEGIN :NEW.CODIGO := MVIALES.T_ARTICULOESTADOS_CODIGO_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE MVIALES.T_BITACORA_CODIGO_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER MVIALES.T_BITACORA_CODIGO_TRG BEFORE
  INSERT ON MVIALES.T_BITACORA FOR EACH ROW WHEN (NEW.CODIGO IS NULL) BEGIN :NEW.CODIGO := MVIALES.T_BITACORA_CODIGO_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE MVIALES.T_CONTACTO_CODCONTACTO_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER MVIALES.T_CONTACTO_CODCONTACTO_TRG BEFORE
  INSERT ON MVIALES.T_CONTACTO FOR EACH ROW WHEN (NEW.CODCONTACTO IS NULL) BEGIN :NEW.CODCONTACTO := MVIALES.T_CONTACTO_CODCONTACTO_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE MVIALES.T_COTIZACIONES_NUMERO_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER MVIALES.T_COTIZACIONES_NUMERO_TRG BEFORE
  INSERT ON MVIALES.T_COTIZACIONES FOR EACH ROW WHEN (NEW.NUMERO IS NULL) BEGIN :NEW.NUMERO := MVIALES.T_COTIZACIONES_NUMERO_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE MVIALES.T_COTIZACIONESTADOS_CODIGO_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER MVIALES.T_COTIZACIONESTADOS_CODIGO_TRG BEFORE
  INSERT ON MVIALES.T_COTIZACIONESTADOS FOR EACH ROW WHEN (NEW.CODIGO IS NULL) BEGIN :NEW.CODIGO := MVIALES.T_COTIZACIONESTADOS_CODIGO_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE MVIALES.T_CUIDADES_CODCIUDAD_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER MVIALES.T_CUIDADES_CODCIUDAD_TRG BEFORE
  INSERT ON MVIALES.T_CUIDADES FOR EACH ROW WHEN (NEW.CODCIUDAD IS NULL) BEGIN :NEW.CODCIUDAD := MVIALES.T_CUIDADES_CODCIUDAD_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE MVIALES.T_DETALLEDIRECCION_CODDETALLE START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER MVIALES.T_DETALLEDIRECCION_CODDETALLE BEFORE
  INSERT ON MVIALES.T_DETALLEDIRECCION FOR EACH ROW WHEN (NEW.CODDETALLE IS NULL) BEGIN :NEW.CODDETALLE := MVIALES.T_DETALLEDIRECCION_CODDETALLE.NEXTVAL;
END;
/

CREATE SEQUENCE MVIALES.T_ESTADOSTIPOCAMBIOS_CODIGO START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER MVIALES.T_ESTADOSTIPOCAMBIOS_CODIGO BEFORE
  INSERT ON MVIALES.T_ESTADOSTIPOCAMBIOS FOR EACH ROW WHEN (NEW.CODIGO IS NULL) BEGIN :NEW.CODIGO := MVIALES.T_ESTADOSTIPOCAMBIOS_CODIGO.NEXTVAL;
END;
/

CREATE SEQUENCE MVIALES.T_FACTURACOMPRAS_CODIGO_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER MVIALES.T_FACTURACOMPRAS_CODIGO_TRG BEFORE
  INSERT ON MVIALES.T_FACTURACOMPRAS FOR EACH ROW WHEN (NEW.CODIGO IS NULL) BEGIN :NEW.CODIGO := MVIALES.T_FACTURACOMPRAS_CODIGO_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE MVIALES.T_FAMILIAS_CODIGO_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER MVIALES.T_FAMILIAS_CODIGO_TRG BEFORE
  INSERT ON MVIALES.T_FAMILIAS FOR EACH ROW WHEN (NEW.CODIGO IS NULL) BEGIN :NEW.CODIGO := MVIALES.T_FAMILIAS_CODIGO_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE MVIALES.T_INDICEECONOMICOS_CODIGO_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER MVIALES.T_INDICEECONOMICOS_CODIGO_TRG BEFORE
  INSERT ON MVIALES."T_INDICEECONOMICOS" FOR EACH ROW WHEN (NEW.CODIGO IS NULL) BEGIN :NEW.CODIGO := MVIALES.T_INDICEECONOMICOS_CODIGO_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE MVIALES.T_LISTAPRECIOS_CODIGO_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER MVIALES.T_LISTAPRECIOS_CODIGO_TRG BEFORE
  INSERT ON MVIALES.T_LISTAPRECIOS FOR EACH ROW WHEN (NEW.CODIGO IS NULL) BEGIN :NEW.CODIGO := MVIALES.T_LISTAPRECIOS_CODIGO_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE MVIALES.T_MARCAS_CODIGO_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER MVIALES.T_MARCAS_CODIGO_TRG BEFORE
  INSERT ON MVIALES.T_MARCAS FOR EACH ROW WHEN (NEW.CODIGO IS NULL) BEGIN :NEW.CODIGO := MVIALES.T_MARCAS_CODIGO_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE MVIALES.T_MONEDAS_CODIGO_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER MVIALES.T_MONEDAS_CODIGO_TRG BEFORE
  INSERT ON MVIALES.T_MONEDAS FOR EACH ROW WHEN (NEW.CODIGO IS NULL) BEGIN :NEW.CODIGO := MVIALES.T_MONEDAS_CODIGO_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE MVIALES.T_PAISES_CODPAIS_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER MVIALES.T_PAISES_CODPAIS_TRG BEFORE
  INSERT ON MVIALES.T_PAISES FOR EACH ROW WHEN (NEW.CODPAIS IS NULL) BEGIN :NEW.CODPAIS := MVIALES.T_PAISES_CODPAIS_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE MVIALES.T_PERMISOUSUARIOS_CODIGO_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER MVIALES.T_PERMISOUSUARIOS_CODIGO_TRG BEFORE
  INSERT ON MVIALES.T_PERMISOUSUARIOS FOR EACH ROW WHEN (NEW.CODIGO IS NULL) BEGIN :NEW.CODIGO := MVIALES.T_PERMISOUSUARIOS_CODIGO_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE MVIALES.T_PROVINCIAS_CODPROVINCIA_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER MVIALES.T_PROVINCIAS_CODPROVINCIA_TRG BEFORE
  INSERT ON MVIALES.T_PROVINCIAS FOR EACH ROW WHEN (NEW.CODPROVINCIA IS NULL) BEGIN :NEW.CODPROVINCIA := MVIALES.T_PROVINCIAS_CODPROVINCIA_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE MVIALES.T_TIPOCONTACTOS_CODTIPOCONTACT START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER MVIALES.T_TIPOCONTACTOS_CODTIPOCONTACT BEFORE
  INSERT ON MVIALES.T_TIPOCONTACTOS FOR EACH ROW WHEN (NEW.CODTIPOCONTACTO IS NULL) BEGIN :NEW.CODTIPOCONTACTO := MVIALES.T_TIPOCONTACTOS_CODTIPOCONTACT.NEXTVAL;
END;
/

CREATE SEQUENCE MVIALES.T_TIPOEMPRESA_CODTIPOEMPRESA START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER MVIALES.T_TIPOEMPRESA_CODTIPOEMPRESA BEFORE
  INSERT ON MVIALES.T_TIPOEMPRESA FOR EACH ROW WHEN (NEW.CODTIPOEMPRESA IS NULL) BEGIN :NEW.CODTIPOEMPRESA := MVIALES.T_TIPOEMPRESA_CODTIPOEMPRESA.NEXTVAL;
END;
/

CREATE SEQUENCE MVIALES.T_TIPOERRORES_CODIGO_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER MVIALES.T_TIPOERRORES_CODIGO_TRG BEFORE
  INSERT ON MVIALES.T_TIPOERRORES FOR EACH ROW WHEN (NEW.CODIGO IS NULL) BEGIN :NEW.CODIGO := MVIALES.T_TIPOERRORES_CODIGO_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE MVIALES.T_TIPOUSUARIOS_CODIGO_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER MVIALES.T_TIPOUSUARIOS_CODIGO_TRG BEFORE
  INSERT ON MVIALES.T_TIPOUSUARIOS FOR EACH ROW WHEN (NEW.CODIGO IS NULL) BEGIN :NEW.CODIGO := MVIALES.T_TIPOUSUARIOS_CODIGO_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE MVIALES.T_UNIDADMEDIDAS_CODIGO_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER MVIALES.T_UNIDADMEDIDAS_CODIGO_TRG BEFORE
  INSERT ON MVIALES.T_UNIDADMEDIDAS FOR EACH ROW WHEN (NEW.CODIGO IS NULL) BEGIN :NEW.CODIGO := MVIALES.T_UNIDADMEDIDAS_CODIGO_SEQ.NEXTVAL;
END;
/


-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            32
-- CREATE INDEX                            29
-- ALTER TABLE                             68
-- CREATE VIEW                              0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                          22
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                         22
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- TSDP POLICY                              0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
