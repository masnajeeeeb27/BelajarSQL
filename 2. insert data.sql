show databases;
use belajar_mysql;

create table products(
	id varchar(10) not null,
    name varchar(100) not null,
    description text,
    price int unsigned not null,
    quantity int unsigned not null default 0,
    created_at timestamp not null default current_timestamp,
    primary key (id)
) engine = innodb;

-- Memasukkan Data
insert into products(id,name,price,quantity)
values ('P0001','Mie Ayam Original',15000,100);

insert into products(id,name,description,price,quantity)
values ('P0002','Mie Ayam Bakso Tahu','Mie Ayam Original + Bakso Tahu',20000,100);

-- Memasukkan Beberapa Data Sekaligus
insert into products(id,name,price,quantity)
values	('P0003','Mie Ayam Ceker',20000,100),
		('P0004','Mie Ayam Spesial',25000,100),
        ('P0005','Mie Ayam Yamin',15000,100);
select * from products;
describe products;
truncate products;