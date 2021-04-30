drop database if exists activa_optica;

-- drop table if exists supplier, glasses;

create database activa_optica;

use activa_optica;

create table supplier(
id int unsigned auto_increment primary key not null,
name varchar(55) not null,
street varchar(255),
number smallint unsigned,
house varchar(55),
city varchar(255),
postal_code varchar(20),
country varchar(255),
phone varchar(15),
fax varchar(15),
nif varchar(9)
);

INSERT INTO supplier (id, name) VALUES (1,'Supplier One');
INSERT INTO supplier (id, name) VALUES (2,'Supplier Two');
INSERT INTO supplier (id, name) VALUES (3,'Supplier Three');

create table glasses(
id  int unsigned auto_increment primary key not null,
brand varchar(255) not null,
prescription tinyint unsigned, -- use scaled integers
mount_type enum("endpieces", "bridge", "screws", "temples", "lenses"),
color varchar(155),
price smallint unsigned, -- use scaled integers
supplier_id int unsigned,
foreign key (supplier_id) references supplier(id)
);

INSERT INTO glasses (id, brand, supplier_id) VALUES (1,'Ray-ban', 1);
INSERT INTO glasses (id, brand, supplier_id) VALUES (2,'Oklay', 1);
INSERT INTO glasses (id, brand, supplier_id) VALUES (3,'Dolce&Gabana', 2);
INSERT INTO glasses (id, brand, supplier_id) VALUES (4,'Prada', 3);

create table employee(
id int unsigned auto_increment primary key not null,
full_name varchar(355) not null
);


create table client(
id int unsigned auto_increment primary key not null,
name varchar(55) not null,
street varchar(255),
number smallint unsigned,
house varchar(55),
city varchar(255),
postal_code varchar(20),
country varchar(255),
phone varchar(15),
email varchar(155),
register_date timestamp(6),
referral int unsigned,
foreign key (referral) references client(id)
);

INSERT INTO client (id, name) VALUES (1,'Client One');
INSERT INTO client (id, name) VALUES (2,'Client Two');
INSERT INTO client (id, name) VALUES (3,'Client Three');

INSERT INTO employee (id, full_name) VALUES (1,'Employee One');
INSERT INTO employee (id, full_name) VALUES (2,'Employee Two');
INSERT INTO employee (id, full_name) VALUES (3,'Employee Three');

create table sales(
id int unsigned auto_increment primary key,
employee_id int unsigned not null,
glasses_id int unsigned not null,
client_id int unsigned not null,
date timestamp(6), 
foreign key (employee_id) references employee(id),
foreign key (client_id) references client(id),
foreign key (glasses_id) references glasses(id)
);
INSERT INTO sales (id, employee_id, glasses_id, client_id, date) VALUES (1,1,1,1, '2021-02-17');
INSERT INTO sales (id, employee_id, glasses_id, client_id, date) VALUES (2,1,2,1, '2021-02-19');
INSERT INTO sales (id, employee_id, glasses_id, client_id, date) VALUES (3,1,3,1, '2021-02-27');
INSERT INTO sales (id, employee_id, glasses_id, client_id, date) VALUES (4,2,1,2, '2021-02-07');
INSERT INTO sales (id, employee_id, glasses_id, client_id, date) VALUES (5,2,2,2, '2021-03-03');
INSERT INTO sales (id, employee_id, glasses_id, client_id, date) VALUES (6,3,3,3, '2021-03-08');

-- total factures d'un client en un període determinat:
select *
from sales
where date between '2021-02-01' and '2021-02-28';

-- models d'ullera venut per l'empleat amb id 1:
select g.id, g.brand, s.date, g.supplier_id, s.employee_id, s.id
from glasses g
left join sales s
	on g.id = s.glasses_id
where employee_id = 3;

-- proveïdors amb ulleres venudes
select distinct su.name
from glasses g
left join sales s
	on g.id = s.glasses_id
left join supplier su
	on g.supplier_id = su.id
where s.id > 0
    

