--ALTA EXAMINADOR

--el examinador se da de alta x defecto al dar de alta un usuario nuevo (todos son examinadores), por medio de un trigger. 


--BAJA EXAMINADOR

CREATE OR REPLACE FUNCTION baja_examinador(
    idExaminador int
) RETURNS SETOF examinador AS 
$$
BEGIN
    RETURN QUERY 
        UPDATE examinador
        SET activo = false
        WHERE examinador.id=idExaminador
        RETURNING *;
END;
$$
LANGUAGE 'plpgsql';



--MODIFICACION EXAMINADOR

--Se modifican el nombre mediante trigger cuando cambia el nombrereal de usuario en modificacionUsuario()
