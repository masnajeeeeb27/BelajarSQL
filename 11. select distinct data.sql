-- select distinct data

-- Saat melakukan query dengan SELECT, kadang kita mendapatkan data yang duplikat
-- Misal kita ingin melihat semua kategori di tabel products, maka otomatis hasil query SELECT akan duplikat, karena banyak sekali produk dengan kategori yang sama
-- Jika kita ingin menghilangkan data-data duplikat tersebut , kita bisa menggunakan SELECT dengan tambahan DISTINCT sebelum nama kolom nya

-- Menghilangkan data duplikat
select distinct category from products;
select distinct price from products order by price desc;
