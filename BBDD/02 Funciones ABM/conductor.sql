--ALTA CONDUCTOR

CREATE OR REPLACE FUNCTION alta_conductor(
    dniNuevo varchar,
    nombreNuevo varchar,
    apellidoNuevo varchar,
) RETURNS SETOF conductor AS 
$$
BEGIN
    RETURN QUERY 
        INSERT INTO conductor
            (dni, nombre, apellido)
        VALUES
            (dniNuevo,nombreNuevo,apellidoNuevo)
        RETURNING *;
END;
$$
LANGUAGE 'plpgsql';


--BAJA CONDUCTOR

--NO EXISTE



--MODIFICACION CONDUCTOR

CREATE OR REPLACE FUNCTION modificacion_conductor(
    dniConductor int,
    nombreNuevo varchar,
    apellidoNuevo varchar,
) RETURNS SETOF conductor AS 
$$
BEGIN
    RETURN QUERY 
        UPDATE conductor
        SET 
            nombre=nombreNuevo,
            apellido=apellidoNuevo, 
        WHERE conductor.dni=dniConductor
        RETURNING *;
END;
$$
LANGUAGE 'plpgsql';