
drop database if exists activa_pizzeria;

create database activa_pizzeria;

use activa_pizzeria;

create table province(
id int unsigned auto_increment primary key not null,
name varchar(155) not null
);

create table locality(
id int unsigned auto_increment primary key not null,
name varchar(155) not null,
province_id int unsigned,
foreign key (province_id) references province(id)
);

INSERT INTO province VALUES (1, 'Barcelonès');
INSERT INTO province VALUES (2, 'Gironès');

INSERT INTO locality VALUES (1, 'Barcelona', 1);
INSERT INTO locality VALUES (2, 'Girona', 2);

create table client(
id int unsigned auto_increment primary key not null,
name varchar(55) not null,
surnames varchar(255),
direccion varchar(255),
postal_code varchar(20),
phone varchar(15),
locality_id int unsigned,
foreign key (locality_id) references locality(id)
);

create table employee(
id int unsigned auto_increment primary key not null,
name varchar(55) not null,
surnames varchar(255),
nif varchar(9),
phone varchar(15),
placement enum('cook', 'rider')
);

INSERT INTO employee (id, name) VALUES (1, 'María');
INSERT INTO employee (id, name) VALUES (2, 'Antonia');

create table shop(
id int unsigned auto_increment primary key not null,
direccion varchar(255),
postal_code varchar(20),
locality_id int unsigned,
foreign key (locality_id) references locality(id)
);

INSERT INTO shop (id, locality_id) VALUES (1, 1);
INSERT INTO shop (id, locality_id) VALUES (2, 2);


create table orders(
id int unsigned auto_increment primary key not null,
date date,
shop int unsigned,
service_type enum('takeaway', 'shipped'),
delivered_by int unsigned,
delivered_at timestamp(6),
foreign key (delivered_by) references employee(id),
foreign key (shop) references shop(id)
);

INSERT INTO orders (id, delivered_by, shop) VALUES (1, 1, 1);
INSERT INTO orders (id, delivered_by, shop) VALUES (2, 2, 2);
INSERT INTO orders (id, delivered_by, shop) VALUES (3, 2, 1);

create table category(
id int unsigned auto_increment primary key not null,
name varchar(55) not null
);

create table product(
id int unsigned auto_increment primary key not null,
name varchar(55) not null,
description varchar(255),
img varchar(255), -- url
price int unsigned, -- scaled integers
product_type enum('pizza', 'hamburger', 'bavarage'),
category int unsigned,
foreign key (category) references category(id)
);

INSERT INTO product (id, name, product_type) VALUES (1, 'coca-cola', 'bavarage');
INSERT INTO product (id, name, product_type) VALUES (2, 'suc maduixa', 'bavarage');
INSERT INTO product (id, name, product_type) VALUES (3, 'suc taronja', 'bavarage');
INSERT INTO product (id, name, product_type) VALUES (4, 'pepsi-cola', 'bavarage');
INSERT INTO product (id, name, product_type) VALUES (5, 'Calzone', 'pizza');

create table orders_lines(
id int unsigned auto_increment primary key not null,
orders_id int unsigned not null,
product_id int unsigned not null,
quantity tinyint unsigned not null,
foreign key (orders_id) references orders(id),
foreign key (product_id) references product(id)
);

INSERT INTO orders_lines (id, orders_id, product_id, quantity) VALUES (1, 1, 2, 1);
INSERT INTO orders_lines (id, orders_id, product_id, quantity) VALUES (2, 1, 3, 1);
INSERT INTO orders_lines (id, orders_id, product_id, quantity) VALUES (3, 2, 1, 1);




-- A Barcelona s'han venut 2 begudes
select o.id as orderID, p.name, s.locality_id
from orders o
left join shop s
	on o.shop = s.id
left join orders_lines ol
	on o.id = ol.orders_id
left join product p
	on ol.product_id = p.id
where p.product_type = 'bavarage' and s.locality_id = 1;
    
-- Quantes comandes a efectuat un empleat
-- Suposo que 'ha efectuat' correspon a delivered_by, ja que a l'anunciat no es demana un camp apart de l'empleat que recepciona una comanda d'un client

select *
from orders
where delivered_by = 2;
