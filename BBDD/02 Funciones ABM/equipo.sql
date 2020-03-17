--ALTA EQUIPO

CREATE OR REPLACE FUNCTION alta_equipo(
    nombreNuevo varchar 
) RETURNS SETOF equipo AS 
$$
BEGIN
    RETURN QUERY 
        INSERT INTO equipo
            (nombre) --MODELO
        VALUES
            (nombreNuevo)
        RETURNING *;
END;
$$
LANGUAGE 'plpgsql';


--BAJA EQUIPO

--no existe, se realiza por modificacionEquipo()


--MODIFICACION EQUIPO

CREATE OR REPLACE FUNCTION modificacion_equipo(
    idEquipo int,
    activoNuevo boolean
) RETURNS SETOF equipo AS 
$$
BEGIN
    RETURN QUERY 
        UPDATE equipo
        SET 
            activo=activoNuevo
        WHERE equipo.id=idEquipo
        RETURNING *;
END;
$$
LANGUAGE 'plpgsql';