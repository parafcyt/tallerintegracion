--SÓLO LOS REPORTES QUE VAN A USARSE EN GRÁFICOS

--CANTIDAD DE CONTROLES ENTRE MESES DEL MISMO AÑO

CREATE OR REPLACE FUNCTION cant_controles_entre_meses_del_anio (--devuelve el mes y la cant
    mes1 double precision, 
    mes2 double precision, 
    anio double precision,
    OUT mes double precision
    OUT cantidad bigint
)
RETURNS SETOF record AS 
$$
BEGIN
    RETURN QUERY SELECT
        EXTRACT(MONTH FROM a.fecha) AS mes,
        COUNT(*) AS cantidad 
    FROM (SELECT * FROM prueba WHERE EXTRACT(YEAR FROM prueba.fecha)=anio) as a
    WHERE EXTRACT(MONTH FROM a.fecha) >= mes1 AND EXTRACT(MONTH FROM a.fecha) <= mes2
    GROUP BY (MONTH FROM a.fecha)
    ORDER BY (MONTH FROM a.fecha); 
END;
$$
LANGUAGE 'plpgsql';


--CANTIDAD DE TEST POSITIVOS Y NEGATIVOS ENTRE AÑOS
CREATE OR REPLACE FUNCTION cant_posi_neg_entre_anios (--devuelve el anio y la cant de positivos y de negativos
    anio1 double precision, 
    anio2 double precision, 
    OUT anio double precision
    OUT positivos bigint,
    OUT negativos bigint
)
RETURNS SETOF record AS 
$$
BEGIN
    RETURN QUERY SELECT
        EXTRACT(YEAR FROM prueba.fecha) AS anio,
        SUM(CASE WHEN prueba.resultado>0.0 THEN 1 ELSE 0 END) AS positivos,
        SUM(CASE WHEN prueba.resultado=0.0 THEN 1 ELSE 0 END) AS negativos,
    FROM prueba
    WHERE EXTRACT(YEAR FROM prueba.fecha) >= anio1 AND EXTRACT(YEAR FROM prueba.fecha) <= anio2
    GROUP BY (YEAR FROM prueba.fecha)
    ORDER BY (YEAR FROM prueba.fecha); 
END;
$$
LANGUAGE 'plpgsql';
