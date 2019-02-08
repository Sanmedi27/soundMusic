SELECT * FROM ARTISTA;
SELECT * FROM PERMISO;
SELECT * FROM LOG_AUDITORIA;
SELECT * FROM EMPRESA_DIFUSORA;
SELECT * FROM ARTISTA_EMPRESA;
SELECT * FROM COSTO_ACTIVITIDAD ORDER BY ID_COSTO_ACTIVIDAD;
SELECT * FROM LOGRO;
SELECT * FROM LOGRO_ARTISTA;
SELECT * FROM PERFIL;
SELECT * FROM PERFIL_PERMISO;
SELECT * FROM REGALIA;
SELECT * FROM TIPO_ACTIVIDAD;
SELECT * FROM USUARIO ORDER BY ID_USUARIO;
SELECT * FROM USUARIO_LOGIN ORDER BY ID_USUARIO_LOGIN;

SELECT PRIMER_NOMBRE,SEGUNDO_NOMBRE,PRIMER_APELLIDO,SEGUNDO_APELLIDO,
                NOMBRE_ARTISTICO,GENERO,FECHA_NACIMIENTO,FECHA_CREACION,STATUS,ID_CONTACTO
                FROM ARTISTA
                WHERE ID_ARTISTA=6;

--SELECCIONAR TODOS LOS ARTISTAS
SELECT ID_ARTISTA,PRIMER_NOMBRE,SEGUNDO_NOMBRE,PRIMER_APELLIDO,SEGUNDO_APELLIDO,
NOMBRE_ARTISTICO,GENERO,FECHA_NACIMIENTO,FECHA_CREACION,STATUS,ID_CONTACTO
FROM ARTISTA;

--SELECCIONAR TODOS LOS ARTISTAS CON CONTACTOS, CIUDAD Y PAIS
SELECT AR.ID_ARTISTA, AR.PRIMER_NOMBRE, AR.SEGUNDO_NOMBRE, 
AR.PRIMER_APELLIDO, AR.SEGUNDO_APELLIDO, AR.NOMBRE_ARTISTICO, AR.GENERO, 
AR.FECHA_NACIMIENTO, AR.FECHA_CREACION, AR.STATUS, 
AR.RUTA_IMAGEN, AR.ID_CONTACTO AS CONTACTO , 
CONT.CELULAR AS CELULAR, CONT.TELEFONO AS TELEFONO, CONT.DIRECCION AS DIRECCION, 
CONT.BARRIO AS BARRIO, CONT.EMAIL AS EMAIL, CIU.ID_CIUDAD AS CIUDAD, 
CIU.NOMBRE AS NOMBRE_CIUDAD,PA.ID_PAIS AS PAIS, PA.NOMBRE AS NOMBRE_PAIS 
FROM ARTISTA AR INNER JOIN CONTACTO CONT 
ON AR.ID_CONTACTO = CONT.ID_CONTACTO         
INNER JOIN CIUDAD CIU 
ON CONT.ID_CIUDAD = CIU.ID_CIUDAD 
INNER JOIN PAIS PA 
ON CIU.ID_PAIS = PA.ID_PAIS 
ORDER BY ID_ARTISTA;
--SELECCIONAR UN SOLO ARTISTA
SELECT AR.ID_ARTISTA, AR.PRIMER_NOMBRE, AR.SEGUNDO_NOMBRE, 
AR.PRIMER_APELLIDO, AR.SEGUNDO_APELLIDO, AR.NOMBRE_ARTISTICO, AR.GENERO, 
AR.FECHA_NACIMIENTO, AR.FECHA_CREACION, AR.STATUS, 
AR.RUTA_IMAGEN, AR.ID_CONTACTO AS CONTACTO , 
CONT.CELULAR AS CELULAR, CONT.TELEFONO AS TELEFONO, CONT.DIRECCION AS DIRECCION, 
CONT.BARRIO AS BARRIO, CONT.EMAIL AS EMAIL, CIU.ID_CIUDAD AS CIUDAD, 
CIU.NOMBRE AS NOMBRE_CIUDAD,PA.ID_PAIS AS PAIS, PA.NOMBRE AS NOMBRE_PAIS 
FROM ARTISTA AR INNER JOIN CONTACTO CONT 
ON AR.ID_CONTACTO = CONT.ID_CONTACTO         
INNER JOIN CIUDAD CIU 
ON CONT.ID_CIUDAD = CIU.ID_CIUDAD 
INNER JOIN PAIS PA 
ON CIU.ID_PAIS = PA.ID_PAIS 
WHERE ID_ARTISTA=22;
--SELECCIONAR UN SOLO ARTISTA
SELECT PRIMER_NOMBRE,SEGUNDO_NOMBRE,PRIMER_APELLIDO,SEGUNDO_APELLIDO,
NOMBRE_ARTISTICO,GENERO,FECHA_NACIMIENTO,FECHA_CREACION,STATUS,ID_CONTACTO
FROM ARTISTA
WHERE ID_ARTISTA=1;

--CREAR ARTISTA
INSERT INTO ARTISTA (PRIMER_NOMBRE,SEGUNDO_NOMBRE,PRIMER_APELLIDO,SEGUNDO_APELLIDO,
NOMBRE_ARTISTICO,GENERO,FECHA_NACIMIENTO,FECHA_CREACION,STATUS,ID_CONTACTO)
VALUES (?,?,?,?,?,?,?,?,?,?);

--"ELIMINAR" UN ARTISTA, CAMBIAR EL STATUS
UPDATE ARTISTA
SET STATUS=?
WHERE ID_ARTISTA=?;

--ACTUALIZAR UN ARTISTA
UPDATE ARTISTA
SET PRIMER_NOMBRE=?,SEGUNDO_NOMBRE=?,PRIMER_APELLIDO=?,SEGUNDO_APELLIDO=?,
NOMBRE_ARTISTICO=?,GENERO=?,FECHA_NACIMIENTO=?,FECHA_CREACION=?,STATUS=?,ID_CONTACTO=?
WHERE ID_ARTISTA=?;

UPDATE ARTISTA
SET FECHA_NACIMIENTO= to_date('1998/05/31:12:00:00AM', 'yyyy/mm/dd:hh:mi:ssam')
WHERE ID_ARTISTA=1;

--SELECCIONAR TODAS LAS EMPRESAS DIFUSORAS
SELECT ID_EMPRESA_DIFUSORA,NOMBRE_EMPRESA,FECHA_CREACION,FECHA_TERMINACION,STATUS,
ID_TIPO_EMPRESA, ID_CONTACTO_EMPRESA, ID_COSTO_OPERACION
FROM EMPRESA_DIFUSORA;

-------------------------------------------------------------


------------------------------------------------------------
--ELIMINAR TODAS LAS TABLAS
BEGIN

FOR c IN (SELECT table_name FROM user_tables) LOOP
EXECUTE IMMEDIATE ('DROP TABLE "' || c.table_name || '" CASCADE CONSTRAINTS');
END LOOP;

FOR s IN (SELECT sequence_name FROM user_sequences) LOOP
EXECUTE IMMEDIATE ('DROP SEQUENCE ' || s.sequence_name);
END LOOP;

END;
--------------------------------------------------------------

--PRUEBA ULTIMO ID

select * from PERFIL;

INSERT INTO PERFIL (NOMBRE_PERFIL) VALUES ('ADMINISTRADOR');
INSERT INTO PERFIL (NOMBRE_PERFIL) VALUES ('OPERARIO');

SELECT PERFIL_SEQ.CURRVAL
FROM DUAL;
                
---------------------EMPRESAS DIFUSORAS-----------------------------
--SELECCIONAR TODAS LAS EMPRESAS DIFUSORAS
SELECT EMDI.ID_EMPRESA_DIFUSORA,EMDI.NOMBRE,EMDI.FECHA_CREACION, 
        EMDI.FECHA_TERMINACION,EMDI.STATUS,EMDI.RUTA_IMAGEN, 
        EMDI.ID_TIPO_ACTIVIDAD AS TIPO_ACTIVIDAD, EMDI.ID_CONTACTO AS CONTACTO, 
        EMDI.ID_COSTO_ACTIVIDAD AS COSTO,CONT.CELULAR AS CELULAR, 
        CONT.TELEFONO AS TELEFONO,CONT.DIRECCION AS DIRECCION, 
        CONT.BARRIO AS BARRIO, CONT.EMAIL AS EMAIL, 
        CIU.ID_CIUDAD AS CIUDAD,CIU.NOMBRE AS NOMBRE_CIUDAD,
        PA.ID_PAIS AS PAIS, PA.NOMBRE AS NOMBRE_PAIS,TIPACT.NOMBRE AS NOMBRE_ACTIVIDAD,
        COSACT.COSTO_POR_OPERACION AS COSTO_OPERACION,COSACT.FECHA_CREACION AS COSTO_CREACION,
        COSACT.FECHA_USO_FINAL AS COSTO_FECHA_FINAL 
        FROM EMPRESA_DIFUSORA EMDI INNER JOIN CONTACTO CONT 
        ON EMDI.ID_CONTACTO = CONT.ID_CONTACTO 
        INNER JOIN CIUDAD CIU 
        ON CONT.ID_CIUDAD = CIU.ID_CIUDAD 
        INNER JOIN PAIS PA 
        ON CIU.ID_PAIS = PA.ID_PAIS 
        INNER JOIN TIPO_ACTIVIDAD TIPACT 
        ON EMDI.ID_TIPO_ACTIVIDAD = TIPACT.ID_TIPO_ACTIVIDAD --aqui
        INNER JOIN COSTO_ACTIVITIDAD COSACT 
        ON EMDI.ID_COSTO_ACTIVIDAD = COSACT.ID_COSTO_ACTIVIDAD 
        ORDER BY ID_EMPRESA_DIFUSORA;

--OBTENER EMPRESA DIFUSORA
SELECT EMDI.NOMBRE,EMDI.FECHA_CREACION, 
        EMDI.FECHA_TERMINACION,EMDI.STATUS,EMDI.RUTA_IMAGEN, 
        EMDI.ID_TIPO_ACTIVIDAD AS TIPO_ACTIVIDAD, EMDI.ID_CONTACTO AS CONTACTO, 
        EMDI.ID_COSTO_ACTIVIDAD AS COSTO,CONT.CELULAR AS CELULAR, 
        CONT.TELEFONO AS TELEFONO,CONT.DIRECCION AS DIRECCION, 
        CONT.BARRIO AS BARRIO, CONT.EMAIL AS EMAIL, 
        CIU.ID_CIUDAD AS CIUDAD,CIU.NOMBRE AS NOMBRE_CIUDAD,
        PA.ID_PAIS AS PAIS, PA.NOMBRE AS NOMBRE_PAIS,TIPACT.NOMBRE AS NOMBRE_ACTIVIDAD,
        COSACT.COSTO_POR_OPERACION AS COSTO_OPERACION,COSACT.FECHA_CREACION AS COSTO_CREACION,
        COSACT.FECHA_USO_FINAL AS COSTO_FECHA_FINAL 
        FROM EMPRESA_DIFUSORA EMDI INNER JOIN CONTACTO CONT 
        ON EMDI.ID_CONTACTO = CONT.ID_CONTACTO 
        INNER JOIN CIUDAD CIU 
        ON CONT.ID_CIUDAD = CIU.ID_CIUDAD 
        INNER JOIN PAIS PA 
        ON CIU.ID_PAIS = PA.ID_PAIS 
        INNER JOIN TIPO_ACTIVIDAD TIPACT 
        ON EMDI.ID_TIPO_ACTIVIDAD = TIPACT.ID_TIPO_ACTIVIDAD --aqui
        INNER JOIN COSTO_ACTIVITIDAD COSACT 
        ON EMDI.ID_COSTO_ACTIVIDAD = COSACT.ID_COSTO_ACTIVIDAD 
        WHERE ID_EMPRESA_DIFUSORA=2;
        
--OBTENER EMPRESA DIFUSORA
SELECT ID_EMPRESA_DIFUSORA,NOMBRE,FECHA_CREACION,FECHA_TERMINACION,STATUS,
ID_TIPO_ACTIVIDAD, ID_CONTACTO, ID_COSTO_ACTIVIDAD
FROM EMPRESA_DIFUSORA
WHERE ID_EMPRESA_DIFUSORA=?;

--CREAR EMPRESA DIFUSORA
INSERT INTO EMPRESA_DIFUSORA (NOMBRE,FECHA_CREACION,FECHA_TERMINACION,STATUS,
ID_TIPO_ACTIVIDAD, ID_CONTACTO, ID_COSTO_ACTIVIDAD)
VALUES (?,?,?,?,?,?,?);

--ELIMINAR EMPRESA DIFUSORA
UPDATE EMPRESA_DIFUSORA
SET STATUS=?
WHERE ID_EMPRESA_DIFUSORA=?;
--ACTUALIZAR EMPRESA DIFUSORA 
UPDATE EMPRESA_DIFUSORA
SET NOMBRE=?,FECHA_CREACION=?,FECHA_TERMINACION=?,STATUS=?,
ID_TIPO_ACTIVIDAD=?, ID_CONTACTO=?, ID_COSTO_ACTIVIDAD=?
WHERE ID_EMPRESA_DIFUSORA=?;


---------------------USUARIO-----------------------------
--OBTENER USUARIOS
SELECT US.ID_USUARIO,US.PRIMER_NOMBRE,US.SEGUNDO_NOMBRE,US.PRIMER_APELLIDO,US.SEGUNDO_APELLIDO,
US.FECHA_CREACION,US.STATUS,US.GENERO,US.ID_PERFIL,US.ID_USUARIO_LOGIN,US.ID_CONTACTO,
CONT.CELULAR AS CELULAR, CONT.TELEFONO AS TELEFONO,
CONT.DIRECCION AS DIRECCION, CONT.BARRIO AS BARRIO, CONT.EMAIL AS EMAIL, CIU.ID_CIUDAD AS CIUDAD, 
CIU.NOMBRE AS NOMBRE_CIUDAD,
PA.ID_PAIS AS PAIS, PA.NOMBRE AS NOMBRE_PAIS, PER.NOMBRE_PERFIL, US_LO.NOMBRE_USUARIO, US_LO.CONTRASENA
FROM USUARIO US INNER JOIN CONTACTO CONT
ON US.ID_CONTACTO = CONT.ID_CONTACTO
INNER JOIN CIUDAD CIU
ON CONT.ID_CIUDAD = CIU.ID_CIUDAD
INNER JOIN PAIS PA
ON CIU.ID_PAIS = PA.ID_PAIS
INNER JOIN PERFIL PER
ON US.ID_PERFIL = PER.ID_PERFIL
INNER JOIN USUARIO_LOGIN US_LO
ON US.ID_USUARIO_LOGIN = US_LO.ID_USUARIO_LOGIN
ORDER BY ID_USUARIO;

SELECT * FROM PERFIL;
SELECT * FROM USUARIO_LOGIN;
--OBTENER USUARIO
SELECT ID_USUARIO,PRIMER_NOMBRE,SEGUNDO_NOMBRE,PRIMER_APELLIDO,SEGUNDO_APELLIDO,
FECHA_CREACION,STATUS,ID_PERFIL_USUARIO,ID_LOGIN_USUARIO,ID_CONTACTO_USUARIO
FROM USUARIO
WHERE ID_USUARIO=?;
--CREAR USUARIO
INSERT INTO USUARIO (PRIMER_NOMBRE,SEGUNDO_NOMBRE,PRIMER_APELLIDO,SEGUNDO_APELLIDO,
FECHA_CREACION,STATUS,ID_PERFIL_USUARIO,ID_LOGIN_USUARIO,ID_CONTACTO_USUARIO)
VALUES (?,?,?,?,?,?,?,?,?);
--ELIMINAR USUARIO
UPDATE USUARIO
SET STATUS=?
WHERE ID_USUARIO=?;
--ACTUALIZAR USUARIO
UPDATE USUARIO
SET PRIMER_NOMBRE=?,SEGUNDO_NOMBRE=?,PRIMER_APELLIDO=?,SEGUNDO_APELLIDO=?,
FECHA_CREACION=?,STATUS=?,ID_PERFIL_USUARIO=?,ID_LOGIN_USUARIO=?,ID_CONTACTO_USUARIO=?
WHERE ID_USUARIO=?;   

---------------------USUARIO_LOGIN-----------------------------

--OBTENER USUARIO_LOGIN
SELECT ID_USUARIO_LOGIN,NOMBRE_USUARIO,CONTRASENA
FROM USUARIO_LOGIN
WHERE ID_USUARIO_LOGIN=?;
--CREAR USUARIO_LOGIN
INSERT INTO USUARIO_LOGIN (NOMBRE_USUARIO,CONTRASENA)
VALUES (?,?);
--ACTUALIZAR USUARIO_LOGIN
UPDATE USUARIO_LOGIN
SET NOMBRE_USUARIO=?,CONTRASENA=?
WHERE ID_USUARIO_LOGIN=?;

---------------------PERIL-----------------------------

--OBTENER PERFIL
SELECT ID_PERFIL, NOMBRE_PERFIL
FROM PERFIL
WHERE= ID_PERFIL=?;
--CREAR PERFIL
INSERT INTO PERFIL (NOMBRE_PERFIL)
VALUES (?);

---------------------PERMISOS----------------------------------------

--CREAR PERMISO
INSERT INTO PERMISOS (NOMBRE_PERMISO)
VALUES (?);
--ACTUALIZAR PERMISO
UPDATE PERMISO
SET NOMBRE_PERMISO=?
WHERE ID_PERMISO=?;

---------------------PERFIL_PERMISO-----------------------------

--OBTENER PERMISOS_POR_PERFIL
SELECT ID_PERFIL_PERMISO,ID_PERFIL,ID_PERMISO
FROM PERFIL_PERMISO;

--OBTENER PERMISOS DE UN PERFIL
SELECT ID_PERFIL_PERMISO,ID_PERFIL,ID_PERMISO
FROM PERFIL_PERMISO
WHERE ID_PERFIL=?;

---------------------LOG_AUDITORIA-----------------------------

--OBTENER TODOS LOG DE AUDITORIA
SELECT ID_LOG_AUDITORIA,FECHA,HORA,ID_USUARIO_LOG,ID_OPERACION_LOG
FROM LOG_AUDITORIA;
--CREAR LOG DE AUDITORIA
INSERT INTO LOG_AUDITORIA (FECHA,HORA,ID_USUARIO_LOG,ID_OPERACION_LOG)
VALUES (?,?,?,?);

---------------------CONTACTO-----------------------------
SELECT * FROM CONTACTO;
--OBTENER CONTACTO
SELECT CELULAR, TELEFONO, DIRECCION, BARRIO, EMAIL, ID_CIUDAD
FROM CONTACTO
WHERE ID_CONTACTO=2;
--OBTENER CONTACTO CON CIUDAD Y PAIS
--CREAR CONTACTO
INSERT INTO CONTACTO (CELULAR, TELEFONO,
DIRECCION, BARRIO, EMAIL, ID_CIUDAD) VALUES (?,?,?,?,?,?)
--ACTUALIZAR CONTACTO
UPDATE CONTACTO
SET  CELULAR=?, TELEFONO=?, DIRECCION=?, BARRIO=?,  EMAIL=?, ID_CIUDAD=?
WHERE ID_CONTACTO=?
--ULTIMO CONTACTO
SELECT CONTACTO_SEQ.CURRVAL
FROM DUAL;

---------------------CIUDAD-----------------------------
SELECT * FROM CIUDAD;
--OBTENER CIUDADES
SELECT ID_CIUDAD, NOMBRE AS NOMBRE_CIUDAD, ID_PAIS
FROM CIUDAD CIU
ORDER BY CIU.ID_CIUDAD;
--OBTENER CIUDADES CON PAIS
SELECT CIU.ID_CIUDAD, CIU.NOMBRE AS NOMBRE_CIUDAD, PA.ID_PAIS, PA.NOMBRE AS NOMBRE_PAIS
FROM CIUDAD CIU INNER JOIN PAIS PA
ON CIU.ID_PAIS = PA.ID_PAIS
ORDER BY CIU.ID_CIUDAD;
--OBTENER CIUDAD
SELECT ID_CIUDAD, NOMBRE AS NOMBRE_CIUDAD, ID_PAIS 
FROM CIUDAD
WHERE ID_CIUDAD=3;
--OBTENER CIUDAD CON PAIS
SELECT CIU.ID_CIUDAD, CIU.NOMBRE AS NOMBRE_CIUDAD, PA.ID_PAIS, PA.NOMBRE AS NOMBRE_PAIS
FROM CIUDAD CIU INNER JOIN PAIS PA
ON CIU.ID_PAIS = PA.ID_PAIS
WHERE ID_CIUDAD=2;
--CREAR CIUDAD
INSERT INTO CIUDAD (NOMBRE, ID_PAIS)
VALUES (?,?);
--ACTUALIZAR CIUDAD
UPDATE CIUDAD
SET NOMBRE=?, ID_PAIS=?
WHERE ID_CIUDAD=?;

---------------------PAIS-----------------------------
SELECT * FROM PAIS;
--OBTENER PAISES
SELECT ID_PAIS, NOMBRE
FROM PAIS;
--OBTENER PAIS
SELECT ID_PAIS, NOMBRE
FROM PAIS
WHERE ID_PAIS=1;
--CREAR PAIS
INSERT INTO PAIS (NOMBRE) VALUES (?);
--ACTUALIZAR PAIS
UPDATE PAIS
SET NOMBRE=?
WHERE ID_PAIS=?;

---------------------ARTISTA_EMPRESA-----------------------------
SELECT * FROM ARTISTA;
SELECT * FROM EMPRESA_DIFUSORA;
SELECT * FROM ARTISTA_EMPRESA ORDER BY ID_ARTISTA_EMPRESA;

SELECT NOMBRE_PERFIL
FROM PERFIL
WHERE ID_PERFIL=1;

SELECT ARTEMP.ID_ARTISTA_EMPRESA, 
ARTEMP.ID_ARTISTA, AR.PRIMER_NOMBRE, AR.SEGUNDO_NOMBRE, 
AR.PRIMER_APELLIDO, AR.SEGUNDO_APELLIDO, AR.NOMBRE_ARTISTICO, AR.GENERO, 
AR.FECHA_NACIMIENTO, AR.FECHA_CREACION, AR.STATUS, 
AR.RUTA_IMAGEN, AR.ID_CONTACTO,
ARTEMP.ID_EMPRESA_DIFUSORA, EMDI.NOMBRE,EMDI.FECHA_CREACION AS FECHA_EMPRESA, 
EMDI.FECHA_TERMINACION,EMDI.STATUS, EMDI.ID_TIPO_ACTIVIDAD, 
EMDI.ID_CONTACTO, EMDI.ID_COSTO_ACTIVIDAD
FROM ARTISTA_EMPRESA ARTEMP 
INNER JOIN ARTISTA AR
ON ARTEMP.ID_ARTISTA=AR.ID_ARTISTA
INNER JOIN EMPRESA_DIFUSORA EMDI
ON ARTEMP.ID_EMPRESA_DIFUSORA=EMDI.ID_EMPRESA_DIFUSORA
ORDER BY ID_ARTISTA_EMPRESA;

SELECT ARTEMP.ID_ARTISTA_EMPRESA, 
ARTEMP.ID_ARTISTA, AR.PRIMER_NOMBRE, AR.SEGUNDO_NOMBRE, 
AR.PRIMER_APELLIDO, AR.SEGUNDO_APELLIDO, AR.NOMBRE_ARTISTICO, AR.GENERO, 
AR.FECHA_NACIMIENTO, AR.FECHA_CREACION, AR.STATUS, 
AR.RUTA_IMAGEN, AR.ID_CONTACTO,
ARTEMP.ID_EMPRESA_DIFUSORA, EMDI.NOMBRE,EMDI.FECHA_CREACION AS FECHA_EMPRESA, 
EMDI.FECHA_TERMINACION,EMDI.STATUS, EMDI.ID_TIPO_ACTIVIDAD, 
EMDI.ID_CONTACTO, EMDI.ID_COSTO_ACTIVIDAD
FROM ARTISTA_EMPRESA ARTEMP 
INNER JOIN ARTISTA AR
ON ARTEMP.ID_ARTISTA=AR.ID_ARTISTA
INNER JOIN EMPRESA_DIFUSORA EMDI
ON ARTEMP.ID_EMPRESA_DIFUSORA=EMDI.ID_EMPRESA_DIFUSORA
WHERE ID_ARTISTA_EMPRESA=5;

SELECT ID_ARTISTA_EMPRESA, ID_ARTISTA, ID_EMPRESA_DIFUSORA
FROM ARTISTA_EMPRESA 
WHERE ID_EMPRESA_DIFUSORA = 3 ORDER BY ID_ARTISTA;

SELECT *
FROM ARTISTA AR RIGHT JOIN ARTISTA_EMPRESA ARTEMP
ON AR.ID_ARTISTA=ARTEMP.ID_ARTISTA
WHERE ARTEMP.ID_EMPRESA_DIFUSORA!=3 ORDER BY ARTEMP.ID_ARTISTA;

SELECT *
FROM ARTISTA_EMPRESA ARTEMP RIGHT JOIN ARTISTA AR
ON ARTEMP.ID_ARTISTA=AR.ID_ARTISTA;
-----------------------------REGALIAS-----------------------------

--obtener toda ragalias--
SELECT REG.ID_REGALIA, REG.TOTAL_GANADO,REG.NUMERO_OPERACIONES ,REG.FECHA,
REG.ID_ARTISTA_EMPRESA, REG.ID_COSTO, ARTEMP.ID_ARTISTA, ARTEMP.ID_EMPRESA_DIFUSORA,
AR.NOMBRE_ARTISTICO, EMDI.NOMBRE,
COSTA.COSTO_POR_OPERACION, COSTA.FECHA_CREACION, COSTA.FECHA_USO_FINAL 
FROM REGALIA REG INNER JOIN ARTISTA_EMPRESA ARTEMP 
ON REG.ID_ARTISTA_EMPRESA = ARTEMP.ID_ARTISTA_EMPRESA 
INNER JOIN ARTISTA AR
ON ARTEMP.ID_ARTISTA = AR.ID_ARTISTA
INNER JOIN EMPRESA_DIFUSORA EMDI
ON ARTEMP.ID_EMPRESA_DIFUSORA=EMDI.ID_EMPRESA_DIFUSORA
INNER JOIN COSTO_ACTIVITIDAD COSTA
ON REG.ID_COSTO = COSTA.ID_COSTO_ACTIVIDAD
ORDER BY ID_REGALIA;

--regalia por id--
SELECT REG.ID_REGALIA, REG.TOTAL_GANADO,REG.NUMERO_OPERACIONES ,REG.FECHA,
REG.ID_ARTISTA_EMPRESA, REG.ID_COSTO, 
ARTEMP.ID_ARTISTA, ARTEMP.ID_EMPRESA_DIFUSORA,
COSTA.COSTO_POR_OPERACION, COSTA.FECHA_CREACION, COSTA.FECHA_USO_FINAL 
FROM REGALIA REG INNER JOIN ARTISTA_EMPRESA ARTEMP 
ON REG.ID_ARTISTA_EMPRESA = ARTEMP.ID_ARTISTA_EMPRESA 
INNER JOIN COSTO_ACTIVITIDAD COSTA
ON REG.ID_COSTO = COSTA.ID_COSTO_ACTIVIDAD
WHERE ID_REGALIA=1;

--regalia simple--
SELECT REG.ID_REGALIA, REG.TOTAL_GANADO,REG.NUMERO_OPERACIONES ,REG.FECHA,
REG.ID_ARTISTA_EMPRESA, REG.ID_COSTO, ARTEMP.ID_ARTISTA, ARTEMP.ID_EMPRESA_DIFUSORA 
FROM REGALIA REG INNER JOIN ARTISTA_EMPRESA ARTEMP 
ON REG.ID_ARTISTA_EMPRESA = ARTEMP.ID_ARTISTA_EMPRESA 
ORDER BY ID_REGALIA;
-----------------------------PRUEBAS-----------------------------
SELECT AE.ID_EMPRESA_DIFUSORA, ED.NOMBRE,ED.FECHA_CREACION,ED.FECHA_TERMINACION,ED.STATUS,
ED.RUTA_IMAGEN, ED.ID_TIPO_ACTIVIDAD, ED.ID_CONTACTO,ED.ID_COSTO_ACTIVIDAD
FROM ARTISTA_EMPRESA AE INNER JOIN EMPRESA_DIFUSORA ED 
ON AE.ID_EMPRESA_DIFUSORA = ED.ID_EMPRESA_DIFUSORA 
WHERE AE.ID_ARTISTA=3 ORDER BY ED.ID_EMPRESA_DIFUSORA;

SELECT *
FROM ARTISTA_EMPRESA
WHERE ID_ARTISTA=2
ORDER BY ID_EMPRESA_DIFUSORA;

SELECT ID_ARTISTA_EMPRESA, ID_ARTISTA, ID_EMPRESA_DIFUSORA
FROM ARTISTA_EMPRESA
WHERE ID_EMPRESA_DIFUSORA=4 ORDER BY ID_ARTISTA;

SELECT AE.ID_EMPRESA_DIFUSORA, ED.NOMBRE,ED.FECHA_CREACION,ED.FECHA_TERMINACION,ED.STATUS,
ED.RUTA_IMAGEN, ED.ID_TIPO_ACTIVIDAD, ED.ID_CONTACTO,ED.ID_COSTO_ACTIVIDAD
FROM ARTISTA_EMPRESA AE INNER JOIN EMPRESA_DIFUSORA ED
ON AE.ID_EMPRESA_DIFUSORA = ED.ID_EMPRESA_DIFUSORA
WHERE AE.ID_ARTISTA=1 ORDER BY ED.ID_EMPRESA_DIFUSORA;

                
UPDATE PERMISO
SET NOMBRE_PERMISO='CERRAR SESION'
WHERE ID_PERMISO=2;

-----------------------------CONEXIONES-----------------------------

SELECT COUNT(*)
  FROM v$session
WHERE STATUS = 'ACTIVE';


SELECT name, value 
  FROM v$parameter
 WHERE name = 'sessions';
 
     select current_utilization, limit_value 
    from v$resource_limit 
    where resource_name='sessions';
    
    SELECT
  'Currently, ' 
  || (SELECT COUNT(*) FROM V$SESSION)
  || ' out of ' 
  || VP.VALUE 
  || ' connections are used.' AS USAGE_MESSAGE
FROM 
  V$PARAMETER VP
WHERE VP.NAME = 'sessions';

SELECT SID, SERIAL#, STATUS
  FROM V$SESSION
  WHERE USERNAME = 'SOUNDMUSIC';
  
  ----------------------
SELECT ED.NOMBRE
FROM ARTISTA_EMPRESA AE INNER JOIN EMPRESA_DIFUSORA ED
ON AE.ID_EMPRESA_DIFUSORA = ED.ID_EMPRESA_DIFUSORA
WHERE AE.ID_ARTISTA=3 ORDER BY ED.ID_EMPRESA_DIFUSORA;

----------------------------
SELECT ID_COSTO_ACTIVIDAD, COSTO_POR_OPERACION, FECHA_CREACION,FECHA_USO_FINAL
FROM COSTO_ACTIVITIDAD
WHERE ID_COSTO_ACTIVIDAD IN (
SELECT EMPRESA_DIFUSORA.ID_COSTO_ACTIVIDAD 
FROM EMPRESA_DIFUSORA 
WHERE EMPRESA_DIFUSORA.ID_EMPRESA_DIFUSORA=3)
;
            