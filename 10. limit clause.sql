-- Limit Clause

-- Mengambil seluruh data di tabel bukanlah pilihan bijak, apalagi jika datanya sudah banyak sekali
-- Kita bisa membatasi jumlah data yang diambil dalam SQL SELECT dengan LIMIT clause
-- Selain membatasi jumlah data, kita juga bisa meng-skip sejumlah data yang tidak ingin kita lihat
-- LIMIT biasanya digunakan saat melakukan paging di aplikasi kita

-- Membatasi hasil query
select * from products where price >0 order by price limit 5; -- Menggunakan Limit Clause
select id,name,price from products order by id limit 8;

-- Skip Hasil Query
select * from products where price >0 order by price limit 2,2; -- angka terakhir dianggap limit, angka pertama adalah skipnya
select id,name,price from products order by id limit 3,5;