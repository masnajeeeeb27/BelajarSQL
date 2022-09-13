-- Grouping

-- Kadang saat melakukan aggregate, kita ingin datanya di grouping berdasarkan kriteria tertentu
-- Misal kita ingin melihat rata-rata harga product, tapi ingin per category
-- Atau kita ingin melihat total semua product, tapi per category
-- Hal ini bisa dilakukan di MySQL dengan menggunakan GROUP BY clause
-- GROUP BY clause ini hanya bisa digunakan jika kita menggunakan aggregate function
-- https://dev.mysql.com/doc/refman/8.0/en/group-by-modifiers.html

-- Menggunakan Group By
select category,
	count(id) as 'Total Product'
from products
group by category;

select max(price) as 'Product Termahal', category from products group by category;
select sum(quantity) as 'Total Stock', category from products group by category;
select min(quantity) as 'Stock Min', category from products group by category;
select max(quantity) as 'Stock Max', category from products group by category;
select	min(quantity) as 'Jumlah Minimum', 
		max(quantity) as 'Jumlah Maksimum', 
        category as 'Kategori' 
from products group by category;

-- Having Clause

-- Kadang kita ingin melakukan filter terhadap data yang sudah kita grouping
-- Misal kita ingin menampilkan rata-rata harga per kategori, tapi yang harganya diatas 10.000 misalnya
-- Jika menggunakan WHERE di SELECT, hal ini tidak bisa dilakukan
-- Untuk memfilter hasil aggregate function, kita harus menggunakan HAVING clause

--  Menggunakan Having Clause
select category,
		count(id) as total
from products
group by category
having total > 1;

select category,
		count(id) as total
from products
group by category
having total > 5;




