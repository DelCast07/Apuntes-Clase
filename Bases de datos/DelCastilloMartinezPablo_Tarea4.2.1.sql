drop table juegan;
drop table marcan_goles;
drop table jugadores;
drop table equipos;
drop table entrenadores;
drop table partidos;

create table partidos ( 
    goles_visitante number(2), 
    goles_casa number(2),
    cod_partido number(4) constraint partido_pk primary key,  
    fecha_partido date
);

create table entrenadores (  
    fecha_nacimiento date, 
    nacionalidad varchar2(20), 
    cod_entrenador number(4) constraint entrenador_pk primary key,
    categoria varchar2(15), 
    nombre varchar2(12), 
    apellidos varchar2(40)
);

create table equipos (  
    nombre varchar2(20), 
    cod_equipo number(4) constraint equipo_pk primary key, 
    estadio varchar2(30), 
    ciudad varchar2(15), 
    cod_entrenador number(4),
    constraint equipo_entrenador_fk foreign key (cod_entrenador) references entrenadores (cod_entrenador)
);

create table jugadores (  
    nombre varchar2(12),  
    posicion varchar2(20),
    venta number(9), 
    cod_jugador number(4) constraint jugador_pk primary key, 
    lesionado char(2) default 'No', 
    apellidos varchar2(20), 
    suspendido char(2) default 'No', 
    cod_equipo number(4),
    constraint jugadores_equipo_fk foreign key (cod_equipo) references equipos (cod_equipo)
);

create table marcan_goles ( 
    minuto number(2), 
    descripcion varchar2(50),
    cod_gol number(4), 
    cod_jugador number(4),  
    cod_partido number(4), 
    constraint marcan_goles_pk primary key (cod_partido, cod_jugador),
    constraint marcan_goles_jugador_fk foreign key (cod_jugador) references jugadores (cod_jugador),
    constraint marcan_goles_partido_fk foreign key (cod_partido) references partidos (cod_partido)
);

create table juegan (
    local_visitante varchar2(10),  
    cod_equipo number(4), 
    cod_partido number(4),
    constraint juegan_pk primary key (cod_partido, cod_equipo),
    constraint juegan_equipo_fk foreign key (cod_equipo) references equipos (cod_equipo),
    constraint juegan_partido_fk foreign key (cod_partido) references partidos (cod_partido)
);