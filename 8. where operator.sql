-- Mencari data denga operator perbandingan

select id, name, price, quantity
from products
where quantity >=100;

select * from products;

insert into products (id, name, category, price, quantity)
values	('P0006', 'Bakso Rusuk','Makanan', 25000, 200),
		('P0007', 'Es Jeruk', 'Minuman',  10000, 300),
        ('P0008', 'Es Campur', 'Minuman', 15000, 500),
        ('P0009', 'Es Teh Manis', 'Minuman', 5000, 400),
        ('P0010', 'Kerupuk', 'Lain-Lain',  2500, 1000),
        ('P0011', 'Keripik Udang','Lain-Lain', 10000, 300),
        ('P0012', 'Es Krim', 'Lain-Lain', 5000, 200),
		('P0013', 'Mie Ayam Jamur', 'Makanan', 20000, 50),
        ('P0014', 'Bakso Telor', 'Makanan', 20000, 150),
        ('P0015', 'Bakso Jando', 'Makanan',  25000, 300);
        
select * from products where quantity>100;
select * from products where category != 'makanan';
select * from products where category <> 'minuman';
select id, name, price from products where category ='lain-lain';

-- Mencari data dengan operator AND
select id, name, price, quantity from products where quantity > 100 and price > 10000;
select * from products where quantity > 100 and price > 20000;
select * from products where category = 'makanan' and price < 20000;


-- Mencari data dengan operator OR
select id, name, price, quantity from products where quantity > 100 or price > 20000;
select * from products where quantity > 100 or price > 20000;

-- Prioritas dengan kurung
select id, name, price, quantity from products where ( category = 'Makanan' or quantity > 500) and price > 10000;
select * from products where ( category = 'Makanan' or quantity > 500 ) and price > 20000;

-- Operator Like
-- LIKE 'b%' yaitu string dengan awalan b
-- LIKE '%a' yaitu string dengan akhiran b
-- LIKE '%eko%' yaitu string berisi eko
-- NOT LIKE yaitu tidak LIKE

-- Mencari Menggunakan LIKE Operator
select * from products where name like '%mie%';
select * from products where name like '%usuk%';

-- NULL Operator
-- Untuk mencari data yang berisi NULL, tidak bisa menggunakan operator perbandingan = NULL
-- Ada operator khusus untuk mencari data NULL, yaitu menggunakan NULL operator
-- IS NULL, artinya mencari yang NULL
-- IS NOT NULL, artinya mencari yang tidak NULL

-- Mencari menggunakan NULL Operator
select * from products where description is null;
select * from products where description is not null;

-- Between Operator
-- Misal mencari harga diantara 10000 sanpai 20000
-- Bisa menggunakan where price =>10000 and <= 20000
-- Ada operator BETWEEN yang bisa digunakan agar lebih sederhana
-- Untuk kebalikannya, bisa menggunakan NOT BETWEEN

-- Mencari menggunakan operator beetween
select * from products where price between 10000 and 20000;
select * from products where price not between 10000 and 20000;

-- IN Operator
-- Operator IN yaitu operator untuk melakukan pencarian sebuah kolom dengan beberapa nilai
-- Misal kita ingin mencari products dengan category Makanan atau Minuman, maka kita bisa menggunakan operator IN

-- Mencari menggunakan IN Operator
select * from products where category in ('makanan','minuman');
select * from products where category not in ('makanan','minuman');        
		