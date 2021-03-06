-- Generated by Oracle SQL Developer Data Modeler 4.0.2.840
--   at:        2015-04-17 15:00:03 BST
--   site:      Oracle Database 12c
--   type:      Oracle Database 12c




CREATE SMALLFILE TABLESPACE PROYECTO LOGGING ONLINE PERMANENT DEFAULT NOCOMPRESS EXTENT MANAGEMENT LOCAL UNIFORM SIZE 1048576 FLASHBACK ON ;

CREATE USER MVIALES IDENTIFIED BY ACCOUNT UNLOCK ;

CREATE TABLE MVIALES.T_ARTICULOESTADOS
  (
    CODIGO      NUMBER (3) NOT NULL ,
    DESCRIPCION VARCHAR2 (50 BYTE)
  )
  PCTFREE 10 PCTUSED 40 TABLESPACE PROYECTO LOGGING STORAGE
  (
    PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT
  ) ;
ALTER TABLE MVIALES.T_ARTICULOESTADOS ADD CONSTRAINT T_ARTICULOESTADOS_PK PRIMARY KEY ( CODIGO ) USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE PROYECTO LOGGING STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT ) ;

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
  )
  PCTFREE 10 PCTUSED 40 TABLESPACE PROYECTO LOGGING STORAGE
  (
    PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT
  ) ;
ALTER TABLE MVIALES.T_ARTICULOS ADD CONSTRAINT T_ARTICULOS_PK PRIMARY KEY ( CODIGO ) USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE PROYECTO LOGGING STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT ) ;

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
  )
  PCTFREE 10 PCTUSED 40 TABLESPACE PROYECTO LOGGING STORAGE
  (
    PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT
  ) ;
ALTER TABLE MVIALES.T_ARTICULOSCOTIZADOS ADD CONSTRAINT T_ARTICULOSCOTIZADOS_PK PRIMARY KEY ( NUMCOTIZACION ) USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE PROYECTO LOGGING STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT ) ;

CREATE TABLE MVIALES.T_BITACORA
  (
    CODIGO       NUMBER (10) NOT NULL ,
    CODUSER      VARCHAR2 (10 BYTE) NOT NULL ,
    CODTIPOERROR NUMBER (3) NOT NULL ,
    FECHAHORA    DATE NOT NULL
  )
  PCTFREE 10 PCTUSED 40 TABLESPACE PROYECTO LOGGING STORAGE
  (
    PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT
  ) ;
ALTER TABLE MVIALES.T_BITACORA ADD CONSTRAINT T_BITACORA_PK PRIMARY KEY ( CODIGO ) USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE PROYECTO LOGGING STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT ) ;

CREATE TABLE MVIALES.T_COMPONENTES
  (
    CODCOMPONENTE VARCHAR2 (20 BYTE) NOT NULL ,
    CODARTICULO   VARCHAR2 (20 BYTE) NOT NULL
  )
  PCTFREE 10 PCTUSED 40 TABLESPACE PROYECTO LOGGING STORAGE
  (
    PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT
  ) ;

CREATE TABLE MVIALES.T_CONTACTO
  (
    CODCONTACTO     NUMBER (3) NOT NULL ,
    CODTIPOCONTACTO NUMBER (3) NOT NULL ,
    VALOR           VARCHAR2 (50 BYTE) NOT NULL ,
    CODEMPRESA      NUMBER (10) NOT NULL
  )
  PCTFREE 10 PCTUSED 40 TABLESPACE PROYECTO LOGGING STORAGE
  (
    PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT
  ) ;
ALTER TABLE MVIALES.T_CONTACTO ADD CONSTRAINT T_CONTACTO_PK PRIMARY KEY ( CODCONTACTO ) USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE PROYECTO LOGGING STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT ) ;

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
  )
  PCTFREE 10 PCTUSED 40 TABLESPACE PROYECTO LOGGING STORAGE
  (
    PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT
  ) ;
ALTER TABLE MVIALES.T_COTIZACIONES ADD CONSTRAINT T_COTIZACIONES_PK PRIMARY KEY ( NUMERO ) USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE PROYECTO LOGGING STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT ) ;

CREATE TABLE MVIALES.T_COTIZACIONESTADOS
  (
    CODIGO      NUMBER (3) NOT NULL ,
    DESCRIPCION VARCHAR2 (20 BYTE) NOT NULL
  )
  PCTFREE 10 PCTUSED 40 TABLESPACE PROYECTO LOGGING STORAGE
  (
    PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT
  ) ;
ALTER TABLE MVIALES.T_COTIZACIONESTADOS ADD CONSTRAINT T_COTIZACIONESTADOS_PK PRIMARY KEY ( CODIGO ) USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE PROYECTO LOGGING STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT ) ;

CREATE TABLE MVIALES.T_CUIDADES
  (
    CODCIUDAD    NUMBER (3) NOT NULL ,
    CODPROVINCIA NUMBER (3) NOT NULL ,
    NOMBRE       VARCHAR2 (20 BYTE) NOT NULL
  )
  PCTFREE 10 PCTUSED 40 TABLESPACE PROYECTO LOGGING STORAGE
  (
    PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT
  ) ;
ALTER TABLE MVIALES.T_CUIDADES ADD CONSTRAINT T_CUIDADES_PK PRIMARY KEY ( CODCIUDAD ) USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE PROYECTO LOGGING STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT ) ;

CREATE TABLE MVIALES.T_DETALLEDIRECCION
  (
    CODDETALLE NUMBER (3) NOT NULL ,
    CODCIUDAD  NUMBER (3) NOT NULL ,
    APARPOSTAL VARCHAR2 (10 BYTE) NOT NULL ,
    DETALLE1   VARCHAR2 (50 BYTE) NOT NULL ,
    DETALLE2   VARCHAR2 (50 BYTE) NOT NULL
  )
  PCTFREE 10 PCTUSED 40 TABLESPACE PROYECTO LOGGING STORAGE
  (
    PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT
  ) ;
ALTER TABLE MVIALES.T_DETALLEDIRECCION ADD CONSTRAINT T_DETALLEDIRECCION_PK PRIMARY KEY ( CODDETALLE ) USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE PROYECTO LOGGING STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT ) ;

CREATE TABLE MVIALES.T_EMPRESA
  (
    CEDULAJURIDICA  NUMBER (10) NOT NULL ,
    NOMBRECOMERCIAL NUMBER (10) NOT NULL ,
    DIRECCION       NUMBER (3) NOT NULL ,
    CODTIPOEMPRESA  NUMBER (3) NOT NULL
  )
  PCTFREE 10 PCTUSED 40 TABLESPACE PROYECTO LOGGING STORAGE
  (
    PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT
  ) ;
ALTER TABLE MVIALES.T_EMPRESA ADD CONSTRAINT T_EMPRESA_PK PRIMARY KEY ( CEDULAJURIDICA ) USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE PROYECTO LOGGING STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT ) ;

CREATE TABLE MVIALES.T_ESTADOSTIPOCAMBIOS
  (
    CODIGO NUMBER (3) NOT NULL ,
    NOMBRE VARCHAR2 (1 BYTE) NOT NULL
  )
  PCTFREE 10 PCTUSED 40 TABLESPACE PROYECTO LOGGING STORAGE
  (
    PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT
  ) ;
ALTER TABLE MVIALES.T_ESTADOSTIPOCAMBIOS ADD CONSTRAINT T_ESTADOSTIPOCAMBIOS_PK PRIMARY KEY ( CODIGO ) USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE PROYECTO LOGGING STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT ) ;

CREATE TABLE MVIALES.T_FACTURACOMPRAS
  (
    CODIGO          NUMBER (5) NOT NULL ,
    FECCOMPRA       DATE NOT NULL ,
    FECREGISTRO     DATE NOT NULL ,
    CODUSERREGISTRO VARCHAR2 (10 BYTE) NOT NULL
  )
  PCTFREE 10 PCTUSED 40 TABLESPACE PROYECTO LOGGING STORAGE
  (
    PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT
  ) ;
ALTER TABLE MVIALES.T_FACTURACOMPRAS ADD CONSTRAINT T_FACTURACOMPRAS_PK PRIMARY KEY ( CODIGO ) USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE PROYECTO LOGGING STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT ) ;

CREATE TABLE MVIALES.T_FAMILIAS
  (
    CODIGO             NUMBER (3) NOT NULL ,
    DESCRIPCION        VARCHAR2 (40 BYTE) NOT NULL ,
    PORCIMPACOMPRA     NUMBER (10) NOT NULL ,
    CODINDICEECONOMICO VARCHAR2 (20 BYTE) NOT NULL
  )
  PCTFREE 10 PCTUSED 40 TABLESPACE PROYECTO LOGGING STORAGE
  (
    PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT
  ) ;
ALTER TABLE MVIALES.T_FAMILIAS ADD CONSTRAINT T_FAMILIAS_PK PRIMARY KEY ( CODIGO ) USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE PROYECTO LOGGING STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT ) ;

CREATE TABLE MVIALES."T_IndiceEconomicos "
  (
    CODIGO           VARCHAR2 (20 BYTE) NOT NULL ,
    DESCRIPCION      VARCHAR2 (40 BYTE) NOT NULL ,
    NUMVALORESREALES NUMBER (10) NOT NULL ,
    NUMMESES         NUMBER (10) NOT NULL
  )
  PCTFREE 10 PCTUSED 40 TABLESPACE PROYECTO LOGGING STORAGE
  (
    PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT
  ) ;
ALTER TABLE MVIALES."T_IndiceEconomicos " ADD CONSTRAINT "T_IndiceEconomicos _PK" PRIMARY KEY ( CODIGO ) USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE PROYECTO LOGGING STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT ) ;

CREATE TABLE MVIALES.T_LINEASFACTURACOMPRAS
  (
    CODLINEAFACTURA   NUMBER (10) NOT NULL ,
    CODARTICULO       VARCHAR2 (20 BYTE) NOT NULL ,
    PRECIODOLARES     NUMBER (17,2) NOT NULL ,
    CANTIDAD          NUMBER (10) NOT NULL ,
    CODFACTURACOMPRAS NUMBER (5) NOT NULL
  )
  PCTFREE 10 PCTUSED 40 TABLESPACE PROYECTO LOGGING STORAGE
  (
    PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT
  ) ;
ALTER TABLE MVIALES.T_LINEASFACTURACOMPRAS ADD CONSTRAINT T_LINEASFACTURACOMPRAS_PK PRIMARY KEY ( CODLINEAFACTURA ) USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE PROYECTO LOGGING STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT ) ;

CREATE TABLE MVIALES.T_LISTAPRECIOS
  (
    CODIGO      NUMBER (3) NOT NULL ,
    DESCRIPCION VARCHAR2 (40 BYTE) NOT NULL ,
    GASTOADMIN  NUMBER (3) NOT NULL ,
    GASTOOTROS  NUMBER (3) NOT NULL ,
    UTILIDAD    NUMBER (3) NOT NULL
  )
  PCTFREE 10 PCTUSED 40 TABLESPACE PROYECTO LOGGING STORAGE
  (
    PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT
  ) ;
ALTER TABLE MVIALES.T_LISTAPRECIOS ADD CONSTRAINT T_LISTAPRECIOS_PK PRIMARY KEY ( CODIGO ) USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE PROYECTO LOGGING STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT ) ;

CREATE TABLE MVIALES.T_LISTAPRECIOXARTICULOS
  (
    CODLISTAPRECIO NUMBER (3) NOT NULL ,
    CODARTICULO    VARCHAR2 (20 BYTE) NOT NULL
  )
  PCTFREE 10 PCTUSED 40 TABLESPACE PROYECTO LOGGING STORAGE
  (
    PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT
  ) ;
ALTER TABLE MVIALES.T_LISTAPRECIOXARTICULOS ADD CONSTRAINT T_LISTAPRECIOXARTICULOS_PK PRIMARY KEY ( CODLISTAPRECIO, CODARTICULO ) USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE PROYECTO LOGGING STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT ) ;

CREATE TABLE MVIALES.T_MARCAS
  (
    CODIGO      NUMBER (3) NOT NULL ,
    DESCRIPCION VARCHAR2 (20 BYTE) NOT NULL
  )
  PCTFREE 10 PCTUSED 40 TABLESPACE PROYECTO LOGGING STORAGE
  (
    PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT
  ) ;
ALTER TABLE MVIALES.T_MARCAS ADD CONSTRAINT T_MARCAS_PK PRIMARY KEY ( CODIGO ) USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE PROYECTO LOGGING STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT ) ;

CREATE TABLE MVIALES.T_MESANIO
  (
    MES  NUMBER (2) NOT NULL ,
    ANIO NUMBER (4) NOT NULL
  )
  PCTFREE 10 PCTUSED 40 TABLESPACE PROYECTO LOGGING STORAGE
  (
    PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT
  ) ;
ALTER TABLE MVIALES.T_MESANIO ADD CONSTRAINT T_MESANIO_PK PRIMARY KEY ( MES, ANIO ) USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE PROYECTO LOGGING STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT ) ;

CREATE TABLE MVIALES.T_MONEDAS
  (
    CODIGO NUMBER (3) NOT NULL ,
    NOMBRE VARCHAR2 (10 BYTE) NOT NULL
  )
  PCTFREE 10 PCTUSED 40 TABLESPACE PROYECTO LOGGING STORAGE
  (
    PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT
  ) ;
ALTER TABLE MVIALES.T_MONEDAS ADD CONSTRAINT T_MONEDAS_PK PRIMARY KEY ( CODIGO ) USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE PROYECTO LOGGING STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT ) ;

CREATE TABLE MVIALES.T_PAISES
  (
    CODPAIS NUMBER (3) NOT NULL ,
    NOMBRE  NUMBER (10) NOT NULL
  )
  PCTFREE 10 PCTUSED 40 TABLESPACE PROYECTO LOGGING STORAGE
  (
    PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT
  ) ;
ALTER TABLE MVIALES.T_PAISES ADD CONSTRAINT T_PAISES_PK PRIMARY KEY ( CODPAIS ) USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE PROYECTO LOGGING STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT ) ;

CREATE TABLE MVIALES.T_PERMISOUSUARIOS
  (
    CODIGO      NUMBER (3) NOT NULL ,
    DESCRIPCION VARCHAR2 (20 BYTE) NOT NULL
  )
  PCTFREE 10 PCTUSED 40 TABLESPACE PROYECTO LOGGING STORAGE
  (
    PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT
  ) ;
ALTER TABLE MVIALES.T_PERMISOUSUARIOS ADD CONSTRAINT T_PERMISOUSUARIOS_PK PRIMARY KEY ( CODIGO ) USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE PROYECTO LOGGING STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT ) ;

CREATE TABLE MVIALES.T_PROVINCIAS
  (
    CODPROVINCIA NUMBER (3) NOT NULL ,
    CODPAIS      NUMBER (3) NOT NULL ,
    NOMBRE       VARCHAR2 (20 BYTE) NOT NULL
  )
  PCTFREE 10 PCTUSED 40 TABLESPACE PROYECTO LOGGING STORAGE
  (
    PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT
  ) ;
ALTER TABLE MVIALES.T_PROVINCIAS ADD CONSTRAINT T_PROVINCIAS_PK PRIMARY KEY ( CODPROVINCIA ) USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE PROYECTO LOGGING STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT ) ;

CREATE TABLE MVIALES.T_PROYECCIONESLISTAPRECIOS
  (
    CODARTICULO              VARCHAR2 (20 BYTE) NOT NULL ,
    CODLISTAPRECIOS          NUMBER (3) NOT NULL ,
    MES                      NUMBER (2) NOT NULL ,
    ANIO                     NUMBER (4) NOT NULL ,
    TIPOCAMBIOPROYECT        NUMBER (17,2) NOT NULL ,
    PRECIOMERCDOLARESPROYECT NUMBER (17,2) NOT NULL
  )
  PCTFREE 10 PCTUSED 40 TABLESPACE PROYECTO LOGGING STORAGE
  (
    PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT
  ) ;

CREATE TABLE MVIALES.T_TIPOCAMBIOS
  (
    CODMONEDA1         NUMBER (3) NOT NULL ,
    CODMONEDA2         NUMBER (3) NOT NULL ,
    MONTO              NUMBER (17,2) NOT NULL ,
    CODINDICEECONOMICO VARCHAR2 (20 BYTE) NOT NULL ,
    ESTADO             NUMBER (3) NOT NULL ,
    MES                NUMBER (2) NOT NULL ,
    ANIO               NUMBER (4) NOT NULL
  )
  PCTFREE 10 PCTUSED 40 TABLESPACE PROYECTO LOGGING STORAGE
  (
    PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT
  ) ;

CREATE TABLE MVIALES.T_TIPOCONTACTOS
  (
    CODTIPOCONTACTO NUMBER (3) NOT NULL ,
    NOMBRE          NUMBER (10) NOT NULL
  )
  PCTFREE 10 PCTUSED 40 TABLESPACE PROYECTO LOGGING STORAGE
  (
    PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT
  ) ;
ALTER TABLE MVIALES.T_TIPOCONTACTOS ADD CONSTRAINT T_TIPOCONTACTOS_PK PRIMARY KEY ( CODTIPOCONTACTO ) USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE PROYECTO LOGGING STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT ) ;

CREATE TABLE MVIALES.T_TIPOEMPRESA
  (
    CODTIPOEMPRESA NUMBER (3) NOT NULL ,
    NOMBRE         VARCHAR2 (20 BYTE) NOT NULL
  )
  PCTFREE 10 PCTUSED 40 TABLESPACE PROYECTO LOGGING STORAGE
  (
    PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT
  ) ;
ALTER TABLE MVIALES.T_TIPOEMPRESA ADD CONSTRAINT T_TIPOEMPRESA_PK PRIMARY KEY ( CODTIPOEMPRESA ) USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE PROYECTO LOGGING STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT ) ;

CREATE TABLE MVIALES.T_TIPOERRORES
  (
    CODIGO      NUMBER (3) NOT NULL ,
    DESCRIPCION VARCHAR2 (15 BYTE) NOT NULL
  )
  PCTFREE 10 PCTUSED 40 TABLESPACE PROYECTO LOGGING STORAGE
  (
    PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT
  ) ;
ALTER TABLE MVIALES.T_TIPOERRORES ADD CONSTRAINT T_TIPOERRORES_PK PRIMARY KEY ( CODIGO ) USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE PROYECTO LOGGING STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT ) ;

CREATE TABLE MVIALES.T_TIPOUSUARIOS
  (
    CODIGO         NUMBER (3) NOT NULL ,
    CODUSERPERMISO NUMBER (3) NOT NULL ,
    DESCRIPCION    VARCHAR2 (20 BYTE) NOT NULL
  )
  PCTFREE 10 PCTUSED 40 TABLESPACE PROYECTO LOGGING STORAGE
  (
    PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT
  ) ;
ALTER TABLE MVIALES.T_TIPOUSUARIOS ADD CONSTRAINT T_TIPOUSUARIOS_PK PRIMARY KEY ( CODIGO ) USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE PROYECTO LOGGING STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT ) ;

CREATE TABLE MVIALES.T_UNIDADMEDIDAS
  (
    CODIGO      NUMBER (3) NOT NULL ,
    DESCRIPCION VARCHAR2 (40 BYTE) NOT NULL
  )
  PCTFREE 10 PCTUSED 40 TABLESPACE PROYECTO LOGGING STORAGE
  (
    PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT
  ) ;
ALTER TABLE MVIALES.T_UNIDADMEDIDAS ADD CONSTRAINT T_UNIDADMEDIDAS_PK PRIMARY KEY ( CODIGO ) USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE PROYECTO LOGGING STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT ) ;

CREATE TABLE MVIALES.T_USUARIOS
  (
    NBRLOGIN    VARCHAR2 (10 BYTE) NOT NULL ,
    CLVLOGIN    VARCHAR2 (10 BYTE) NOT NULL ,
    CODUSERTIPO NUMBER (3) NOT NULL
  )
  PCTFREE 10 PCTUSED 40 TABLESPACE PROYECTO LOGGING STORAGE
  (
    PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT
  ) ;
ALTER TABLE MVIALES.T_USUARIOS ADD CONSTRAINT T_USUARIOS_PK PRIMARY KEY ( NBRLOGIN ) USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE PROYECTO LOGGING STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT ) ;

ALTER TABLE MVIALES.T_ARTICULOSCOTIZADOS ADD CONSTRAINT FKT_ARTICULO382695 FOREIGN KEY ( CODARTICULO ) REFERENCES MVIALES.T_ARTICULOS ( CODIGO ) NOT DEFERRABLE ;

ALTER TABLE MVIALES.T_ARTICULOSCOTIZADOS ADD CONSTRAINT FKT_ARTICULO50573 FOREIGN KEY ( NUMCOTIZACION ) REFERENCES MVIALES.T_COTIZACIONES ( NUMERO ) NOT DEFERRABLE ;

ALTER TABLE MVIALES.T_ARTICULOSCOTIZADOS ADD CONSTRAINT FKT_ARTICULO522199 FOREIGN KEY ( UNDMEDIDA ) REFERENCES MVIALES.T_UNIDADMEDIDAS ( CODIGO ) NOT DEFERRABLE ;

ALTER TABLE MVIALES.T_ARTICULOS ADD CONSTRAINT FKT_ARTICULO570863 FOREIGN KEY ( UNDMEDIDA ) REFERENCES MVIALES.T_UNIDADMEDIDAS ( CODIGO ) NOT DEFERRABLE ;

ALTER TABLE MVIALES.T_ARTICULOS ADD CONSTRAINT FKT_ARTICULO578076 FOREIGN KEY ( CODUSERREGISTRO ) REFERENCES MVIALES.T_USUARIOS ( NBRLOGIN ) NOT DEFERRABLE ;

ALTER TABLE MVIALES.T_ARTICULOS ADD CONSTRAINT FKT_ARTICULO840016 FOREIGN KEY ( CODESTARTICULO ) REFERENCES MVIALES.T_ARTICULOESTADOS ( CODIGO ) NOT DEFERRABLE ;

ALTER TABLE MVIALES.T_ARTICULOS ADD CONSTRAINT FKT_ARTICULO848891 FOREIGN KEY ( CODMARCA ) REFERENCES MVIALES.T_MARCAS ( CODIGO ) NOT DEFERRABLE ;

ALTER TABLE MVIALES.T_ARTICULOS ADD CONSTRAINT FKT_ARTICULO904486 FOREIGN KEY ( CODFAMILIA ) REFERENCES MVIALES.T_FAMILIAS ( CODIGO ) NOT DEFERRABLE ;

ALTER TABLE MVIALES.T_BITACORA ADD CONSTRAINT FKT_BITACORA251134 FOREIGN KEY ( CODTIPOERROR ) REFERENCES MVIALES.T_TIPOERRORES ( CODIGO ) NOT DEFERRABLE ;

ALTER TABLE MVIALES.T_BITACORA ADD CONSTRAINT FKT_BITACORA84906 FOREIGN KEY ( CODUSER ) REFERENCES MVIALES.T_USUARIOS ( NBRLOGIN ) NOT DEFERRABLE ;

ALTER TABLE MVIALES.T_COMPONENTES ADD CONSTRAINT FKT_COMPONEN233783 FOREIGN KEY ( CODCOMPONENTE ) REFERENCES MVIALES.T_ARTICULOS ( CODIGO ) NOT DEFERRABLE ;

ALTER TABLE MVIALES.T_COMPONENTES ADD CONSTRAINT FKT_COMPONEN774059 FOREIGN KEY ( CODARTICULO ) REFERENCES MVIALES.T_ARTICULOS ( CODIGO ) NOT DEFERRABLE ;

ALTER TABLE MVIALES.T_CONTACTO ADD CONSTRAINT FKT_CONTACTO536274 FOREIGN KEY ( CODEMPRESA ) REFERENCES MVIALES.T_EMPRESA ( CEDULAJURIDICA ) NOT DEFERRABLE ;

ALTER TABLE MVIALES.T_CONTACTO ADD CONSTRAINT FKT_CONTACTO759656 FOREIGN KEY ( CODTIPOCONTACTO ) REFERENCES MVIALES.T_TIPOCONTACTOS ( CODTIPOCONTACTO ) NOT DEFERRABLE ;

ALTER TABLE MVIALES.T_COTIZACIONES ADD CONSTRAINT FKT_COTIZACI344790 FOREIGN KEY ( MESENTREG, ANIOENTREG ) REFERENCES MVIALES.T_MESANIO ( MES, ANIO ) NOT DEFERRABLE ;

ALTER TABLE MVIALES.T_COTIZACIONES ADD CONSTRAINT FKT_COTIZACI429323 FOREIGN KEY ( CEDJURCLIENTE ) REFERENCES MVIALES.T_EMPRESA ( CEDULAJURIDICA ) NOT DEFERRABLE ;

ALTER TABLE MVIALES.T_COTIZACIONES ADD CONSTRAINT FKT_COTIZACI656953 FOREIGN KEY ( CODMONEDA ) REFERENCES MVIALES.T_MONEDAS ( CODIGO ) NOT DEFERRABLE ;

ALTER TABLE MVIALES.T_COTIZACIONES ADD CONSTRAINT FKT_COTIZACI717841 FOREIGN KEY ( CODESTADOCOTIZ ) REFERENCES MVIALES.T_COTIZACIONESTADOS ( CODIGO ) NOT DEFERRABLE ;

ALTER TABLE MVIALES.T_COTIZACIONES ADD CONSTRAINT FKT_COTIZACI920077 FOREIGN KEY ( CODLISTAPRECIOS ) REFERENCES MVIALES.T_LISTAPRECIOS ( CODIGO ) NOT DEFERRABLE ;

ALTER TABLE MVIALES.T_CUIDADES ADD CONSTRAINT FKT_CUIDADES473810 FOREIGN KEY ( CODPROVINCIA ) REFERENCES MVIALES.T_PROVINCIAS ( CODPROVINCIA ) NOT DEFERRABLE ;

ALTER TABLE MVIALES.T_DETALLEDIRECCION ADD CONSTRAINT FKT_DETALLED350223 FOREIGN KEY ( CODCIUDAD ) REFERENCES MVIALES.T_CUIDADES ( CODCIUDAD ) NOT DEFERRABLE ;

ALTER TABLE MVIALES.T_EMPRESA ADD CONSTRAINT FKT_EMPRESA228590 FOREIGN KEY ( CODTIPOEMPRESA ) REFERENCES MVIALES.T_TIPOEMPRESA ( CODTIPOEMPRESA ) NOT DEFERRABLE ;

ALTER TABLE MVIALES.T_EMPRESA ADD CONSTRAINT FKT_EMPRESA469254 FOREIGN KEY ( DIRECCION ) REFERENCES MVIALES.T_DETALLEDIRECCION ( CODDETALLE ) NOT DEFERRABLE ;

ALTER TABLE MVIALES.T_FACTURACOMPRAS ADD CONSTRAINT FKT_FACTURAC28973 FOREIGN KEY ( CODUSERREGISTRO ) REFERENCES MVIALES.T_USUARIOS ( NBRLOGIN ) NOT DEFERRABLE ;

ALTER TABLE MVIALES.T_FAMILIAS ADD CONSTRAINT FKT_FAMILIAS683386 FOREIGN KEY ( CODINDICEECONOMICO ) REFERENCES MVIALES."T_IndiceEconomicos " ( CODIGO ) NOT DEFERRABLE ;

ALTER TABLE MVIALES.T_LINEASFACTURACOMPRAS ADD CONSTRAINT FKT_LINEASFA481568 FOREIGN KEY ( CODARTICULO ) REFERENCES MVIALES.T_ARTICULOS ( CODIGO ) NOT DEFERRABLE ;

ALTER TABLE MVIALES.T_LINEASFACTURACOMPRAS ADD CONSTRAINT FKT_LINEASFA753914 FOREIGN KEY ( CODFACTURACOMPRAS ) REFERENCES MVIALES.T_FACTURACOMPRAS ( CODIGO ) NOT DEFERRABLE ;

ALTER TABLE MVIALES.T_LISTAPRECIOXARTICULOS ADD CONSTRAINT FKT_LISTAPRE160880 FOREIGN KEY ( CODARTICULO ) REFERENCES MVIALES.T_ARTICULOS ( CODIGO ) NOT DEFERRABLE ;

ALTER TABLE MVIALES.T_LISTAPRECIOXARTICULOS ADD CONSTRAINT FKT_LISTAPRE78013 FOREIGN KEY ( CODLISTAPRECIO ) REFERENCES MVIALES.T_LISTAPRECIOS ( CODIGO ) NOT DEFERRABLE ;

ALTER TABLE MVIALES.T_PROVINCIAS ADD CONSTRAINT FKT_PROVINCI451632 FOREIGN KEY ( CODPAIS ) REFERENCES MVIALES.T_PAISES ( CODPAIS ) NOT DEFERRABLE ;

ALTER TABLE MVIALES.T_PROYECCIONESLISTAPRECIOS ADD CONSTRAINT FKT_PROYECCI566293 FOREIGN KEY ( CODLISTAPRECIOS, CODARTICULO ) REFERENCES MVIALES.T_LISTAPRECIOXARTICULOS ( CODLISTAPRECIO, CODARTICULO ) NOT DEFERRABLE ;

ALTER TABLE MVIALES.T_PROYECCIONESLISTAPRECIOS ADD CONSTRAINT FKT_PROYECCI761595 FOREIGN KEY ( MES, ANIO ) REFERENCES MVIALES.T_MESANIO ( MES, ANIO ) NOT DEFERRABLE ;

ALTER TABLE MVIALES.T_TIPOCAMBIOS ADD CONSTRAINT FKT_TIPOCAMB317616 FOREIGN KEY ( CODINDICEECONOMICO ) REFERENCES MVIALES."T_IndiceEconomicos " ( CODIGO ) NOT DEFERRABLE ;

ALTER TABLE MVIALES.T_TIPOCAMBIOS ADD CONSTRAINT FKT_TIPOCAMB620100 FOREIGN KEY ( CODMONEDA1 ) REFERENCES MVIALES.T_MONEDAS ( CODIGO ) NOT DEFERRABLE ;

ALTER TABLE MVIALES.T_TIPOCAMBIOS ADD CONSTRAINT FKT_TIPOCAMB620101 FOREIGN KEY ( CODMONEDA2 ) REFERENCES MVIALES.T_MONEDAS ( CODIGO ) NOT DEFERRABLE ;

ALTER TABLE MVIALES.T_TIPOCAMBIOS ADD CONSTRAINT FKT_TIPOCAMB651026 FOREIGN KEY ( ESTADO ) REFERENCES MVIALES.T_ESTADOSTIPOCAMBIOS ( CODIGO ) NOT DEFERRABLE ;

ALTER TABLE MVIALES.T_TIPOCAMBIOS ADD CONSTRAINT FKT_TIPOCAMB923514 FOREIGN KEY ( MES, ANIO ) REFERENCES MVIALES.T_MESANIO ( MES, ANIO ) NOT DEFERRABLE ;

ALTER TABLE MVIALES.T_TIPOUSUARIOS ADD CONSTRAINT FKT_TIPOUSUA556339 FOREIGN KEY ( CODUSERPERMISO ) REFERENCES MVIALES.T_PERMISOUSUARIOS ( CODIGO ) NOT DEFERRABLE ;

ALTER TABLE MVIALES.T_USUARIOS ADD CONSTRAINT FKT_USUARIOS41238 FOREIGN KEY ( CODUSERTIPO ) REFERENCES MVIALES.T_TIPOUSUARIOS ( CODIGO ) NOT DEFERRABLE ;


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            32
-- CREATE INDEX                             0
-- ALTER TABLE                             68
-- CREATE VIEW                              0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
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
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        1
-- CREATE USER                              1
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- TSDP POLICY                              0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
