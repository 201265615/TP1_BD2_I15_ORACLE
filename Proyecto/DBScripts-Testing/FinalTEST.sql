select * from t_tipocambios;
select * from t_monedas;
select * from t_indiceeconomicos;
SELECT * FROM T_ESTADOSTIPOCAMBIOS;
SELECT * FROM T_mesanio;
INSERT INTO t_indiceeconomicos(DESCRIPCION, NUMVALORESREALES, NUMMESES) VALUES('IDE1',1,4);

INSERT INTO T_mesanio(mes, anio) VALUES(1,2014);
INSERT INTO T_mesanio(mes, anio) VALUES(2,2014);
INSERT INTO T_mesanio(mes, anio) VALUES(3,2014);
INSERT INTO T_mesanio(mes, anio) VALUES(4,2014);
INSERT INTO T_mesanio(mes, anio) VALUES(5,2014);
INSERT INTO T_mesanio(mes, anio) VALUES(6,2014);
INSERT INTO T_mesanio(mes, anio) VALUES(7,2014);
INSERT INTO T_mesanio(mes, anio) VALUES(8,2014);
INSERT INTO T_mesanio(mes, anio) VALUES(9,2014);
INSERT INTO T_mesanio(mes, anio) VALUES(10,2014);
INSERT INTO T_mesanio(mes, anio) VALUES(11,2014);
INSERT INTO T_mesanio(mes, anio) VALUES(12,2014);

INSERT INTO T_mesanio(mes, anio) VALUES(1,2015);
INSERT INTO T_mesanio(mes, anio) VALUES(2,2015);
INSERT INTO T_mesanio(mes, anio) VALUES(3,2015);
INSERT INTO T_mesanio(mes, anio) VALUES(4,2015);
INSERT INTO T_mesanio(mes, anio) VALUES(5,2015);
INSERT INTO T_mesanio(mes, anio) VALUES(6,2015);
INSERT INTO T_mesanio(mes, anio) VALUES(7,2015);
INSERT INTO T_mesanio(mes, anio) VALUES(8,2015);
INSERT INTO T_mesanio(mes, anio) VALUES(9,2015);
INSERT INTO T_mesanio(mes, anio) VALUES(10,2015);
INSERT INTO T_mesanio(mes, anio) VALUES(11,2015);
INSERT INTO T_mesanio(mes, anio) VALUES(12,2015);

select * from T_IndiceEconomicos;
INSERT INTO T_ESTADOSTIPOCAMBIOS(nombre) VALUES('P');
INSERT INTO t_tipocambios(CODMONEDA1, CODMONEDA2, MONTO, CODINDICEECONOMICO, ESTADO, MES, ANIO) VALUES(1,2,530.20,1,1,1,2015);
INSERT INTO t_tipocambios(CODMONEDA1, CODMONEDA2, MONTO, CODINDICEECONOMICO, ESTADO, MES, ANIO) VALUES(1,2,540.20,1,1,2,2015);
INSERT INTO t_tipocambios(CODMONEDA1, CODMONEDA2, MONTO, CODINDICEECONOMICO, ESTADO, MES, ANIO) VALUES(1,2,550.20,1,1,3,2015);
INSERT INTO t_tipocambios(CODMONEDA1, CODMONEDA2, MONTO, CODINDICEECONOMICO, ESTADO, MES, ANIO) VALUES(1,2,560.20,1,1,4,2015);







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


-- Insertar cotizaciones


-- Insertar filas cotizaciones





DELETE from T_cotizaciones;
delete from T_ArticulosCotizados;
drop trigger BEF_DEL_COTIZ_INS_HISTO;
commit;

select * from t_cotizacionestados;

INSERT INTO t_cotizacionestados(descripcion) VALUES('activa');

delete from t_tipoempresa;
INSERT INTO t_tipoempresa(codtipoempresa,nombre) VALUES(2,'Proveedor');

INSERT INTO t_paises(nombre) VALUES('Costa Rica');

INSERT INTO t_provincias(nombre,codpais) VALUES('Cartago',1);

INSERT INTO t_cuidades(nombre,codprovincia) VALUES('Caballo Blanco',1);

INSERT INTO t_detalledireccion(codciudad,aparpostal,detalle1,detalle2) VALUES(1,'50001','cartago','itcr');

INSERT INTO t_empresa(cedulajuridica,nombrecomercial,direccion,codtipoempresa) VALUES(1,'Empresa1',1,1);
INSERT INTO t_empresa(cedulajuridica,nombrecomercial,direccion,codtipoempresa) VALUES(2,'Empresa2',1,1);

select * from t_empresa;

SELECT * FROM T_ARTICULOS;
SELECT * FROM T_COMPONENTES;

DESC T_LINEASFACTURACOMPRAS;
insert into t_facturaCompras (feccompra, fecregistro, coduserregistro) values (sysdate, sysdate, 'admin');
commit;
INSERT INTO T_LINEASFACTURACOMPRAS VALUES (1, 'LE01', 1200, 9);
commit;

select 

select * from t_listaPrecios

select * from t_listaPrecios
INSERT INTO t_listaPrecios(descripcion,gastoadmin,gastootros,utilidad) values('Lista Precio Nueva',100,150,200)
INSERT INTO t_articuloscotizados(numcotizacion,codarticulo,undmedida,cantidad,porcendescuento,costounitario,costograbado,montolinea) 
VALUES (1,'FP110',1,2,2,50,50,100);

select * from T_Cotizaciones;
select * from T_CotizacionesHisto;
select * from T_ArticulosCotizadosHisto;

DELETE FROM T_ARTICULOSCOTIZADOS;
delete from T_Cotizaciones;


INSERT INTO t_cotizaciones(fecregistro,cedjurcliente,condicionpago,condicionventa,vigencia,
observaciones,codmoneda,codestadocotiz,codlistaprecios,mesentreg,anioentreg)
VALUES(sysdate,2,'credito','contado','activo','perfecto',1,1,1,1,2015);