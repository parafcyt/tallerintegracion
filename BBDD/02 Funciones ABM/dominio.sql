--ALTA DOMINIO

CREATE OR REPLACE FUNCTION alta_dominio(
    idNuevo varchar,
    descripcionNuevo varchar
) RETURNS SETOF dominio AS 
$$
BEGIN
    RETURN QUERY 
        INSERT INTO dominio
            (id, descripcion)
        VALUES
            (idNuevo,descripcionNuevo)
        RETURNING *;
END;
$$
LANGUAGE 'plpgsql';


--BAJA DOMINIO

--NO EXISTE



--MODIFICACION DOMINIO

CREATE OR REPLACE FUNCTION modificacion_dominio(
    idDominio int,
    descripcionNuevo varchar
) RETURNS SETOF dominio AS 
$$
BEGIN
    RETURN QUERY 
        UPDATE dominio
        SET 
            descripcion=descripcionNuevo, 
        WHERE dominio.id=idDominio
        RETURNING *;
END;
$$
LANGUAGE 'plpgsql';