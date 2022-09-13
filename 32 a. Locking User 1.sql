-- Locking user satu

-- Locking Record
start transaction;
select * from guestbooks;

update guestbooks
set title = 'Diubah Oleh User 1'
where id = 9;

commit;

-- Locking Record Manual
start transaction;

select * from products;

select * from products where id = 'P0001' for update;

update products
set quantity = quantity - 10
where id = 'P0001';

-- Deadlock

start transaction;

select * from products where id = 'P0001' for update;
select * from products where id = 'P0002' for update;

-- Lock Table Read

lock tables products read;

update products
set quantity = 100
where id = 'P0001';

unlock tables;

-- Lock Table Write

lock table products write;

update products
set quantity = 100
where id = 'P0001';

select * from products;

unlock tables;

-- Lock Instance

lock instance for backup;
unlock instance;


