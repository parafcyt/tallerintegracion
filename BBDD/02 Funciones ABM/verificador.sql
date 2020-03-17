--ALTA VERIFICADOR

--el verificador se da de alta x defecto al dar de alta un usuario administrador y administrativo, por medio de un trigger. 


--BAJA VERIFICADOR

CREATE OR REPLACE FUNCTION baja_verificador(
    idVerificador int
) RETURNS SETOF verificador AS 
$$
BEGIN
    RETURN QUERY 
        UPDATE verificador
        SET activo = false
        WHERE verificador.id=idVerificador
        RETURNING *;
END;
$$
LANGUAGE 'plpgsql';



--MODIFICACION VERIFICADOR

--Se modifican el nombre mediante trigger cuando cambia el nombrereal de usuario en modificacionUsuario()
