-- Order By Clause

-- Untuk mengurutkan data bisa menggunakan perintah SQL SELECT, kita bisa menambahkan order by clause
-- Order By Clause digunakan untuk mengurutkan data berdasarkan kolom yang dipilih, dan jenis urutannya (ASC atau DESC)
-- Bisa mengurutkan tidak hanya satu kolom, tapi beberapa kolom
-- Defaultnya ASC

-- Mengurutkan Data
select * from products order by price asc, id desc;
select * from products order by category;
select * from products order by price;
select * from products order by quantity;
select * from products order by created_at;
select * from products order by price,quantity;
select id,name,price,category from products order by category;
select id,name,price,category from products order by category asc, price desc;

