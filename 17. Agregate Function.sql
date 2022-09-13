-- Aggregate Function

-- MySQL mendukung function-function untuk melakukan aggregate
-- Misal, kita ingin melihat harga paling mahal di tabel product, atau harga termurah, atau rata-rata harga produk, atau total jumlah data di tabel, dan lain-lain
-- https://dev.mysql.com/doc/refman/8.0/en/aggregate-functions.html

-- Menggunakan Aggregate Function
select count(id) as 'Total Product' from products;
select avg(price) as 'Rata-Rata' from products;
select max(price) as 'Harga Termahal' from products;
select min(price) as 'Harga Termurah' from products;

select	count(id) as 'Total Product',
		min(price) as 'Harga Termurah',
        max(price) as 'Harga Termahal',
        avg(price) as 'Rata-Rata'
from products;
