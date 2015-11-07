
-- Script generado para crear una base de datos de practica
-- Utiliza esto como referencia

-- Para correr esto debes:
--  Conectarte como SYS-DBA en la instancia master
--  Hacer un nuevo directorio en el server fisico (donde esta instalado oracle)
--  Deber loguearte e ir a /datos/master
--  Verifica que este demo y pdbseed
--  Crea el directorio, en este caso hice uno que se llama practica
--  Ahora puedes correr este script

--  Lo que hace este script es crear una db llamada practicapdb
--  Le define un admin user y su contrasenia
--  Ademas de eso copia los archivos semilla de pdbseed a practica
--  y les define un tamanio inicial
CREATE PLUGGABLE DATABASE proyecto1mrm ADMIN USER grupo12 IDENTIFIED BY grupo12
  FILE_NAME_CONVERT = ( 
                          '/datos/master/pdbseed/system01.dbf', '/datos/master/proyecto1mrm/system01.dbf',
                          '/datos/master/pdbseed/sysaux01.dbf', '/datos/master/proyecto1mrm/sysaux01.dbf',
                          '/datos/master/pdbseed/pdbseed_temp01.dbf', '/datos/master/proyecto1mrm/pdbseed_temp01.dbf'
                       )
                       STORAGE (
                           MAXSIZE 1G MAX_SHARED_TEMP_SIZE 100M
                       )
                       
--  Activar el acceso WEB.
--  Estos comandos se hacen en el server
--  Abre una consola y corre estos comandos
--    sqlplus /nolog
--    connect sys as sysdba
--    alter session set container = practicapdb;
--    alter pluggable database open read write;
--    exec dbms_xdb_config.sethttpsport(5505);
--    grant EM_EXPRESS_ALL to soporte;
--    grant DBA to soporte;
--    exit

-- Ajustar tamanios de los archivos de la db (si fuera necesario)
ALTER DATABASE DATAFILE '/datos/master/practica/sysaux01.dbf' RESIZE 810M;
ALTER DATABASE DATAFILE '/datos/master/practica/system01.dbf' RESIZE 460M;
ALTER DATABASE TEMPFILE '/datos/master/practica/pdbseed_temp01.dbf' RESIZE 50M;



-- Crea un table space de 10m y va creciendo de 1 en 1 hasta 15
DROP TABLESPACE tablespacePractica;
  CREATE TABLESPACE tablespacePractica
  DATAFILE
               '/datos/master/practica/practica_01' SIZE 10 M REUSE AUTOEXTEND ON NEXT 1M  MAXSIZE 15M,
               '/datos/master/practica/practica_02' SIZE 10 M REUSE AUTOEXTEND ON NEXT 1M  MAXSIZE 15M
   DEFAULT NOCOMPRESS
   STORAGE (INITIAL 100K NEXT 100K MINEXTENTS 5 MAXEXTENTS 121 PCTINCREASE 0)
   ONLINE
   LOGGING;
   
-- Crear un tablespace temporal
DROP TABLESPACE tablespacePracticaTemp;
  CREATE TEMPORARY TABLESPACE tablespacePracticaTemp
   TEMPFILE '/datos/master/practica/practicaTemp_01' SIZE 50M AUTOEXTEND ON;

-- Crear el usuario
DROP USER soporteMoises;
  CREATE USER  soporteMoises IDENTIFIED BY Solaris2014Moises
  DEFAULT TABLESPACE tablespacePractica
  TEMPORARY TABLESPACE tablespacePracticaTemp;

  -- Muy importante pues luego da error de espacio
  -- insuficiente al insertar cosas en las tablas!
  ALTER USER soporteMoises QUOTA 2M ON tablespacePractica

   GRANT CONNECT TO soporteMoises;
   GRANT RESOURCE TO soporteMoises;

   GRANT CREATE TABLE TO soporteMoises;
   GRANT CREATE VIEW   TO soporteMoises;
   GRANT CREATE TRIGGER TO soporteMoises;
   
-- Ahora si, ya puedes crear tablas
-- y divertirte con sql jaja
-- Eso si, debes crear una nueva conexion con el usuario
-- que acabas de crear