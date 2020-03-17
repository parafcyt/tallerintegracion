--ALTA PRUEBA

CREATE OR REPLACE FUNCTION alta_prueba(
    fechaNuevo date,
    horaNuevo time,
    nromuestraNuevo int,
    resultadoNuevo double,
    idexaminadorNuevo int,
    idequipoNuevo int,
    dniconductorNuevo varchar,
    iddominioNuevo varchar,
    idprestamoNuevo int
) RETURNS SETOF prueba AS 
$$
BEGIN
    RETURN QUERY 
        INSERT INTO prueba
            (fecha, hora, nromuestrao, resultado, idexaminador, idequipo, dniconductor, iddominio, idprestamo) 
        VALUES
            (fechaNuevo, horaNuevo, nromuestraNuevo, resultadoNuevo, idexaminadorNuevo, idequipoNuevo, dniconductorNuevo, iddominioNuevo, idprestamoNuevo)
        RETURNING *;
END;
$$
LANGUAGE 'plpgsql';


--BAJA PRUEBA

--no existe



--MODIFICACION PRUEBA
--es LA VERIFICACIÓN

CREATE OR REPLACE FUNCTION verificacion_prueba(
    idPrueba int,
    rechazadoNuevo boolean,
    descripcionrechazoNuevo varchar,
    idverificadorNuevo int
) RETURNS SETOF prueba AS 
$$
BEGIN
    RETURN QUERY 
        UPDATE prueba
        SET 
            verificado=true,
            rechazado=rechazadoNuevo,
            descripcionrechazo=descripcionrechazoNuevo,
            idverificador=idverificadorNuevo,
        WHERE prueba.id=idPrueba
        RETURNING *;
END;
$$
LANGUAGE 'plpgsql';
