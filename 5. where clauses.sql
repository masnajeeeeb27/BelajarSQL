-- Pencarian data
-- Hal ini bisa dilakukan dengan where clause setelah perintah select

select id, name, price, quantity from products where quantity = 0;
select id, name, price, quantity from products where quantity = 100;
select id, name, price, quantity from products where price = 15000;
select id, name, price, quantity from products where id='P0001';
select id, name, price, quantity from products where name='Mie Ayam Bakso Tahu';