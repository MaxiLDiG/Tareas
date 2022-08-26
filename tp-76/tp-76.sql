create database Examen;
use Examen;

drop table if exists Cliente;

create table Cliente(
	idCliente integer,
    nombreCliente varchar(30),
    apellidoCliente varchar(30),
    fechaNacCliente date,
    pesoCliente float,
    alturaCliente float,
    domicilioCliente varchar(50),
    codigoPostal integer,
	MovilUno varchar(15),
    MovilDos varchar(15),
    emailCliente varchar(40),
    primary key(idCliente)
);

insert into Cliente(idCliente, nombreCliente, apellidoCliente, fechaNacCliente, pesoCliente, alturaCliente, domicilioCliente, codigoPostal, MovilUno, MovilDos, emailCliente)
	values (1, 'Lucas', 'Forchino', '1979/01/24', 95.50, 1.60, 'Jujuy 1234', 7600,'2236121212', null, 'lucas@gmail.com');
insert into Cliente(idCliente, nombreCliente, apellidoCliente, fechaNacCliente, pesoCliente, alturaCliente, domicilioCliente, codigoPostal, MovilUno, MovilDos, emailCliente)
	values (2, 'Jorge', 'Solis', '1945/10/01', 78.20, 1.80, 'Almafuerte 321', 8000, '2291614593', '2291614593', 'j@gmail.com');
insert into Cliente(idCliente, nombreCliente, apellidoCliente, fechaNacCliente, pesoCliente, alturaCliente, domicilioCliente, codigoPostal, MovilUno, MovilDos, emailCliente)
	values (3, 'Javier', 'Fernandez', '1975/09/02', 90.00, 1.77, 'Av. Paso 100', 7600, '2235444444', '2235444445', 'javier@gmail.com');
insert into Cliente(idCliente, nombreCliente, apellidoCliente, fechaNacCliente, pesoCliente, alturaCliente, domicilioCliente, codigoPostal, MovilUno, MovilDos, emailCliente)
	values (23, 'Jorge', 'Solisa', '1982/01/01', 100.00, 1.80, 'Av. Colon 4444', 7600, '22351666666', '22351666667', 'sol@gmail.com');
insert into Cliente(idCliente, nombreCliente, apellidoCliente, fechaNacCliente, pesoCliente, alturaCliente, domicilioCliente, codigoPostal, MovilUno, MovilDos, emailCliente)
	values (35, 'Juan', 'Mercado', '1964/02/02', 89.60, 1.77, 'Av. Independencia 720', 7600, '2236166744', '2236166745', 'mercado@gmail.com');

select * from Cliente where pesoCliente > 90.00 and alturaCliente > 1.78;
select * from Cliente where codigoPostal <> 7600 and emailCliente like '%@gmail.com';
select avg(alturaCliente) from Cliente;
select  max(pesoCliente) from Cliente;
select max(fechaNacCliente) from Cliente;

update Cliente set fechaNacCliente = '1972/04/04' where apellidoCliente = 'Mercado';
update Cliente set MovilDos = '223445545' where apellidoCliente = 'Forchino';
update Cliente set alturaCliente = 1.80 where apellidoCliente = 'Fernandez';
select * from Cliente;