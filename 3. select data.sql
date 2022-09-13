show databases;
use belajar_mysql;
select * from products;

-- 1. Untuk mengambil data di tabel, kita bisa menggunakan SQL dengan kata kunci SELECT
-- 2. SELECT bisa digunakan untuk mengambil semua kolom yang ada di tabel, atau sebagian kolom saja
-- 3. Jika kita ingin mengambil semua kolom, kita bisa menggunakan karakter * (bintang)
-- 4. Jika kita hanya ingin mengambil beberapa kolom saja, kita bisa sebutkan nama-nama kolom yang ingin kita ambil datanya

select * from products; -- mengambil semua data
select id, name, price, quantity from products; -- mengambil beberapa data
