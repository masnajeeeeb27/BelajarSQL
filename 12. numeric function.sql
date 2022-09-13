-- Numeric Function

-- MySQL memiliki banyak sekali fitur untuk manipulasi data angka
-- Hal ini memudahkan kita untuk memanipulasi data angka
-- Secara garis besar, fitur ini dibagi menjadi dua, Arithmetic Operator dan Mathematical Function


-- Menggunakan Arithmetic Operator
select 10 + 10 as hasil;
select (10 + 10) * 5 as hasil;
select id , name , price div 1000 as 'Price in K' from products;
select id as kode, name as nama, price div 1000 as 'Price in K' from products;
select id as kode, name as nama, price div 1000 as 'Price in K' from products order by price desc;


-- Mathematical Function

-- Selain arithmetic operator, ada juga mathematical function
-- Ini adalah kumpulan function yang terdapat di MySQL yang bisa kita gunakan sebagai fungsi-fungsi matematika
-- Ada banyak sekali, dan tidak bisa kita bahas semua
-- https://dev.mysql.com/doc/refman/8.0/en/mathematical-functions.html

select pi();
select power(10,2);
select cos(10);
select sin(10);
select tan(10);
select id, cos(price),sin(price),tan(price) from products;
select id, name, price from products where price div 1000 > 15;




