-- Index
-- Secara default, MySQL akan menyimpan data di dalam disk seperti tabel biasanya
-- Hal ini menyebabkan, ketika kita mencari data, maka MySQL akan melakukan pencarian dari baris pertama sampai terakhir, yang artinya semakin banyak datanya, maka akan semakin lambat proses pencarian datanya
-- Saat kita membuat index, MySQL akan menyimpan data dalam struktur data B-Tree : https://en.wikipedia.org/wiki/B-tree 
-- Tidak hanya akan mempermudah kita saat melakukan pencarian, index juga akan mempermudah kita ketika melakukan pengurutan menggunakan ORDER BY
-- https://dev.mysql.com/doc/refman/8.0/en/optimization-indexes.html 

-- Cara Kerja Index
-- Kita bisa membuat lebih dari satu index di table, dan setiap kita membuat index, kita bisa membuat index untuk beberapa kolom sekaligus
-- Misal kita membuat index
-- (col1, col2, col3)
-- Artinya kita punya kemampuan untuk mencari lebih menggunakan index untuk kombinasi query di (col1), (col1, col2) dan (col1, col2, col3)

-- Efek Samping Membuat Index
-- Index mungkin akan mempercepat untuk proses pencarian dan query data
-- Namun, saat kita membuat index, artinya MySQL akan melakukan proses update data di index tiap kali kita menambah, mengubah atau menghapus data di table
-- Artinya Index membuat proses pencarian dan query lebih cepat, tapi memperlambat proses manipulasi data
-- Oleh karena itu, kita harus bijak saat membuat index

-- Tidak Perlu Index
-- Saat kita membuat PRIMARY KEY dan UNIQUE constraint, kita tidak perlu menambahkan lagi index
-- Hal ini dikarenakan MySQL secara otomatis akan menambahkan index pada kolom PRIMARY KEY dan UNIQUE constraint

-- Membuat Table dengan Index
create table sellers(
	id	int not null auto_increment,
    name varchar(100),
    name2 varchar (100),
    name3 varchar (100),
    email varchar(100),
    primary key (id),
    unique key email_unique (email),
    index name_index (name),
    index name2_index (name2),
    index name3_index (name3),
    index name1_name2_name3_index (name, name2, name3)
) engine = InnoDB;

show create table sellers;
select * from sellers where name = 'X';
select * from sellers where name = 'X' and name2 = 'X';
select * from sellers where name = 'X' and name2 = 'X' and name3 = 'X';

-- Menambah/Menghapus Index
alter table sellers
	add index name_index (name);
alter table sellers
	drop index name_index;
