--ALTA PRESTAMO

CREATE OR REPLACE FUNCTION alta_prestamo(
    activoNuevo boolean,
    fechaprestamoNuevo date,
    horaprestamoNuevo time,
    nroinicialNuevo int,
    idexaminadorNuevo int,
    idequipoNuevo int
) RETURNS SETOF prestamo AS 
$$
BEGIN
    RETURN QUERY 
        INSERT INTO prestamo
            (activo,fechaprestamo,horaprestamo,nroinicial,idexaminador,idequipo) 
        VALUES
            (activoNuevo,fechaprestamoNuevo,horaprestamoNuevo,nroinicialNuevo,idexaminadorNuevo,idequipoNuevo)
        RETURNING *;
END;
$$
LANGUAGE 'plpgsql';


--BAJA PRESTAMO

CREATE OR REPLACE FUNCTION baja_prestamo(
    idPrestamo int,
    fechadevolucionNuevo date,
    horadevolucionNuevo time,
    nrodevolucionNuevo int

) RETURNS SETOF prestamo AS 
$$
BEGIN
    RETURN QUERY 
        UPDATE prestamo
        SET 
            activo=false,
            fechadevolucion=fechadevolucionNuevo,
            horadevolucion=horadevolucionNuevo,
            nrodevolucion=nrodevolucionNuevo
        WHERE prestamo.id=idPrestamo
        RETURNING *;
END;
$$
LANGUAGE 'plpgsql';



--MODIFICACION PRESTAMO
--no existe
