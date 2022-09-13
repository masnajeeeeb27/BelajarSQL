-- Subquery

-- Subquery di WHERE
-- MySQL mendukung pencarian data menggunakan WHERE dari hasil SELECT query
-- Fitur ini dinamakan Subquery
-- Contoh, kita ingin mencari products yang harganya diatas harga rata-rata, artinya kita akan melakukan SELECT dengan WHERE price > harga rata, dimana harga rata-rata perlu kita hitung menggunakan query SELECT lainnya menggunakan aggregate function AVG

-- Melakukan Subquery di WHERE Clause
select avg(price) from products;
select * from products where price > (select avg(price) from products);

-- Subquery di From
-- Selain di WHERE clause, Subquery juga bisa dilakukan di FROM clause
-- Misal kita ingin mencari data dari hasil query SELECT, itu bisa kita lakukan di MySQL

-- Melakukan Subquery di FROM
select max(price) from products;

select * from products;

update products
	set price = 100000
where id = 'X0003';

select price from categories
join products on (products.id_category = categories.id);

select max(price)
from (select price
	from categories
		inner join products
			on (products.id_category = categories.id)) as cp;