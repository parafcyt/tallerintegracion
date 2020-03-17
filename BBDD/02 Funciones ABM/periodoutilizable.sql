--ALTA PERIODOUTILIZABLE

CREATE OR REPLACE FUNCTION alta_periodoutilizable(
    activoNuevo boolean,
    fechainicioNuevo date,
    fechavencimientoNuevo date,
    nroingresoNuevo int,
    idequipoNuevo int 
) RETURNS SETOF periodoutilizable AS 
$$
BEGIN
    RETURN QUERY 
        INSERT INTO periodoutilizable
            (activo,fechainicio,fechavencimiento,nroingreso,idequipo) 
        VALUES
            (activoNuevo,fechainicioNuevo,fechavencimientoNuevo,nroingresoNuevo,idequipoNuevo)
        RETURNING *;
END;
$$
LANGUAGE 'plpgsql';


--BAJA PERIODOUTILIZABLE

CREATE OR REPLACE FUNCTION baja_periodoutilizable(
    idPeriodoutilizable int
) RETURNS SETOF periodoutilizable AS 
$$
BEGIN
    RETURN QUERY 
        UPDATE periodoutilizable
        SET 
            activo=false
        WHERE periodoutilizable.id=idPeriodoutilizable
        RETURNING *;
END;
$$
LANGUAGE 'plpgsql';



--MODIFICACION PERIODOUTILIZABLE
--no existe
