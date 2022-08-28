create database tp78;
use tp78;
drop table if exists store;

create table store(
	id integer,
    profile integer,
    name varchar(30),
    lat float,
    lng float,
    id_rubro integer,
    primary key(id)
);

insert into store(id, profile, name, lat, lng, id_rubro)
	values(8, 1, 'atm', -37.998675, -57.552592, 0);
insert into store(id, profile, name, lat, lng, id_rubro)
	values(2, 1, 'Banco Nacion', -37.999671, -57.546848, 1);
insert into store(id, profile, name, lat, lng, id_rubro)
	values(3, 1, 'Banco Provincia', -37.999319, -57.546547, 1);
insert into store(id, profile, name, lat, lng, id_rubro)
	values(4, 0, 'Astor', -38.000826, -57.542858, 2);
insert into store(id, profile, name, lat, lng, id_rubro)
	values(5, 0, 'AGB', -37.999269, -57.548446, 3);
insert into store(id, profile, name, lat, lng, id_rubro)
	values(1236711896, 0, 'AGB', -37.999269, -57.548446, 3);
insert into store(id, profile, name, lat, lng, id_rubro)
	values(285071699, 0, 'Astor', -38.000826, -57.542858, 1);
insert into store(id, profile, name, lat, lng, id_rubro)
	values(1236940209, 0, 'Atm', -37.998675, -57.552592, 0);
insert into store(id, profile, name, lat, lng, id_rubro)
	values(288366501, 1, 'Banco Nacion', -37.999671, -57.546848, 1);
insert into store(id, profile, name, lat, lng, id_rubro)
	values(1236707570, 1, 'Banco Provincia', -37.999319, -57.546547, 1);
    
select * from store where id >= 100 and id <= 2500;
select * from store where profile >= 1 and profile <= 3 and id >= 10000;
select max(id), profile,name, lat, lng, id_rubro from store; 
select id, profile,name, min(lat), lng, id_rubro from store;

update store set name = 'Banco de la Nacion Argentina' where name = 'Banco Nacion';
update store set name = 'Musical Norte' where name = 'AGB';
update store set lng = -57.000001 where name = 'Astor';
select * from store;