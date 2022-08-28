create database tp77;
use tp77;

create table tiendas(
	id integer auto_increment,
    nombre_comercial varchar(20),
    tipo integer,
    direccion varchar(50),
    cp integer,
    poblacion integer,
    lat float,
    lng float,
    primary key(id)
);

insert into tiendas(id, nombre_comercial, tipo, direccion, cp, poblacion, lat, lng)
	values(7, 'Wallace', 1, 'Calle de Orense, 52', 7600, 1, -38.005329, -57.55533);
insert into tiendas(nombre_comercial, tipo, direccion, cp, poblacion, lat, lng)
	values('Boston', 1, 'Calle de Fuencarral, 104', 7600, 1, -38.00372, -57.55172967);
insert into tiendas(nombre_comercial, tipo, direccion, cp, poblacion, lat, lng)
	values('Media 22', 1, 'Castelló, 109', 7600, 1, -38.0053801, -57.55464792);
    
select * from tiendas where cp = 7600 and poblacion = 1;
select * from tiendas where tipo = 1;
select nombre_comercial, tipo, direccion, cp, poblacion, max(lat), lng from tiendas;
select nombre_comercial, tipo, direccion, cp, poblacion, min(lng), lng from tiendas;

update tiendas set nombre_comercial = 'OCHOA' where nombre_comercial = 'Boston';
update tiendas set lat = -38.00001 where nombre_comercial = 'Wallace';
update tiendas set nombre_comercial = 'EEM22' where nombre_comercial = 'Media 22';

select * from tiendas;
