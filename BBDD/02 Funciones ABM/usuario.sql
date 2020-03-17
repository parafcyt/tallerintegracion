--ALTA USUARIO

CREATE OR REPLACE FUNCTION alta_usuario(
    nombrerealNuevo varchar,
    nombreusuarioNuevo varchar,
    contraseniaNuevo varchar,
    tipousarioNuevo varchar--base, administrador,administrativo
) RETURNS SETOF usuario AS 
$$
BEGIN
    RETURN QUERY 
        INSERT INTO usuario
            (nombrereal, nombreusuario, contrasenia,tipousuario)
        VALUES
            (nombrerealNuevo,nombrerealNuevo,contraseniaNuevo,tipousarioNuevo)
        RETURNING *;
END;
$$
LANGUAGE 'plpgsql';


--BAJA USUARIO

CREATE OR REPLACE FUNCTION baja_usuario(
    idUsuario int
) RETURNS SETOF usuario AS 
$$
BEGIN
    RETURN QUERY 
        DELETE FROM usuario
        WHERE usuario.id = idUsuario
        RETURNING *;
END;
$$
LANGUAGE 'plpgsql';



--MODIFICACION USUARIO

CREATE OR REPLACE FUNCTION modificacion_usuario(
    idUsuario int,
    nombrerealNuevo varchar,
    nombreusuarioNuevo varchar,
    contraseniaNuevo varchar,
    tipousarioNuevo varchar--base, administrador,administrativo
) RETURNS SETOF usuario AS 
$$
BEGIN
    RETURN QUERY 
        UPDATE usuario
        SET 
            nombrereal=nombrerealNuevo,
            nombreusuario=nombreusuarioNuevo, 
            contrasenia=contraseniaNuevo,
            tipousuario=tipousarioNuevo
        WHERE usuario.id=idUsuario
        RETURNING *;
END;
$$
LANGUAGE 'plpgsql';