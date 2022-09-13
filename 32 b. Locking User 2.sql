-- Locking User dua

-- Locking Record
start transaction;

select * from guestbooks;

update guestbooks
set title = 'Diubah Oleh User 2'
where id = 9;

commit;

-- Locking Record Manual
start transaction;

select * from products;

select * from products where id = 'P0001' for update;

update products
set quantity = quantity - 10
where id = 'P0001';

commit;

-- Deadlock

start transaction;

select * from products where id = 'P0002' for update;
select * from products where id = 'P0001' for update;

-- Lock Table Read

select * from products;

update products
set quantity = 100
where id = 'P0001';

-- Lock Table Write

select * from products;

-- Lock Instance

alter table products
add column sample varchar(100);

alter table products
drop column sample;