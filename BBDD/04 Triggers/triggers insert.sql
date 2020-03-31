--NUEVO USUARIO EN UPPER

CREATE OR REPLACE FUNCTION usuario_upper() RETURNS trigger AS
$$
BEGIN
    NEW.nombrereal = UPPER(NEW.nombrereal);
    RETURN NEW;
END;
LANGUAGE 'plpgsql';

CREATE TRIGGER usuario_upper_trigger BEFORE INSERT ON usuario
FOR EACH ROW EXECUTE PROCEDURE usuario_upper();

--CREA EL EXAMINADOR POR DEFECTO, DESPUéS DE INSERTAR UN USUARIO y SI ES VERIFICADOR LO CREA
CREATE OR REPLACE FUNCTION insertar_examinador_verificador() RETURNS trigger AS
$$
BEGIN
    --TODOS SON EXAMINADORES=TRUE
    INSERT INTO examinador (activo,nombrereal,idusuario) VALUES (true,NEW.nombrereal,NEW.id);

    --SI ES VERIFICADOR
    IF NEW.permisousuario='ADMINISTRADOR' OR NEW.permisousuario='ADMINISTRATIVO' THEN
        INSERT INTO verificador (activo,nombrereal,idusuario) VALUES (true,NEW.nombrereal,NEW.id);
    END IF;

    RETURN NEW;
END;
LANGUAGE 'plpgsql';

CREATE TRIGGER insertar_examinador_verificador_trigger AFTER INSERT ON usuario
FOR EACH ROW EXECUTE PROCEDURE insertar_examinador_verificador();

--CONDUCTOR UPPER
CREATE OR REPLACE FUNCTION conductor_upper() RETURNS trigger AS
$$
BEGIN
    NEW.nombre = UPPER(NEW.nombre);
    NEW.apellido = UPPER(NEW.apellido);
    RETURN NEW;
END;
LANGUAGE 'plpgsql';

CREATE TRIGGER conductor_upper_trigger BEFORE INSERT ON conductor
FOR EACH ROW EXECUTE PROCEDURE conductor_upper();
