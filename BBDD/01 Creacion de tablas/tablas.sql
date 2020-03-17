CREATE TABLE usuario(
    id serial PRIMARY KEY,
    nombrereal varchar(40) not null,
    nombreusuario varchar(40) not null,
    contrasenia varchar(40) not null,
    permisousuario varchar(40) not null --base, administrador,administrativo
);

CREATE TABLE examinador(
    id serial PRIMARY KEY,
    activo boolean,
    nombrereal varchar(40) not null,
    idusuario int references usuario(id)
);

CREATE TABLE verificador(
    id serial PRIMARY KEY,
    activo boolean,
    nombrereal varchar(40) not null,
    idusuario int references usuario(id)
);

CREATE TABLE conductor(
    dni varchar(20) PRIMARY KEY,
    nombre varchar(40) not null,
    apellido varchar(40) not null
);

CREATE TABLE dominio(
    id varchar(30) PRIMARY KEY,
    descripcion varchar(100) not null
);

CREATE TABLE equipo(
    id serial PRIMARY KEY,
    nombre varchar(40) not null,
    activo boolean default false,
    nroactual int 
);

CREATE TABLE periodoutilizable(
    id serial PRIMARY KEY,
    activo boolean,
    fechainicio date not null,
    fechavencimiento date not null,
    nroingreso int not null,
    idequipo int references equipo(id)
);

CREATE TABLE prestamo(
    id serial PRIMARY KEY, 
    activo boolean,
    fechaprestamo date not null,
    horaprestamo time,
    nroinicial int not null,
    fechadevolucion date,
    horadevolucion time,
    nrodevolucion int,
    idexaminador int references examinador(id),
    idequipo int references equipo(id)
);

CREATE TABLE prueba(
    id serial PRIMARY KEY,
    fecha date not null,
    hora time,
    nromuestra int not null,
    resultado float not null check(resultado>=0.0),
    nroacta int,
    nroretencion int,
    verificado boolean default false,
    rechazado boolean,
    descripcionrechazo varchar(100),
    idverificador int references verificador(id), 
    dniconductor varchar references conductor(dni)
    iddominio varchar references dominio(id),
    idprestamo int references prestamo(id)
);
