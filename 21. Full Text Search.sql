-- Full Text Search

-- Masalah Dengan Like Operator
-- Kadang kita ingin mencari sebuah kata dalam tabel, dan biasanya kita akan menggunakan LIKE operator
-- Operasi yang dilakukan LIKE operator adalah dengan cara mencari seluruh data di tabel dari baris pertama sampai terakhir, hal ini membuat operasi LIKE sangat lambat
-- Menambah index di tabel juga tidak akan membantu, karen LIKE operator tidak menggunakan index
-- MySQL menyediakan fitur Full Text Search jika ada kasus kita ingin melakukan hal ini

-- Full-Text Search
-- Full-Text Search memungkinkan kita bisa mencari sebagian kata di kolom dengan tipe data String
-- Ini sangat cocok ketika pada kasus kita memang membutuhkan pencarian yang tidak hanya sekedar operasi = (equals, sama dengan)
-- https://dev.mysql.com/doc/refman/8.0/en/fulltext-search.html

-- Membuat Table dengan Full-Text Search
create table products(
	id			varchar(10)		not null,
    name		varchar(100)	not null,
	description	text,
    price		int unsigned not null,
    quantity	int unsigned not null default 0,
    created_at	timestamp 	 not null default current_timestamp,
    primary key (id),
    fulltext product_search (name, description)
) engine = InnoDB;

-- Menambah / Menghapus Full-Text Search
alter table products
	add fulltext product_search (name,description);
    
alter table products
	drop index product_search;
    
show create table products;
select* from products;

-- Mode Full-Text Search
-- MySQL menyediakan beberapa mode untuk melakukan pencarian di Full-Text Search, kita bisa memilihnya sesuai kebutuhan kita
	-- Natural Language, yaitu mencari seperti bahasa natural (per kata) : https://dev.mysql.com/doc/refman/8.0/en/fulltext-natural-language.html 
	-- Boolean, yaitu mencari dengan kemampuan mengandung kata (+) atau tidak mengandung kata (-) dan lain-lain : https://dev.mysql.com/doc/refman/8.0/en/fulltext-boolean.html 
	-- Query Expansion, yaitu mencari seperti natural language, namun melakukan dua kali pencarian, pencarian pertama menggunakan natural language, pencarian kedua melakukan pencarian dari kedekatan hasil pertama, misal kita mencari kata “bakso”, lalu ternyata di dalam “bakso” ada kata “mie”, maka kemungkinan query kedua akan mencari kata “mie” juga : https://dev.mysql.com/doc/refman/8.0/en/fulltext-query-expansion.html 

-- Mencari dengan Natural Languague Mode
select * from products where match (name, description) against ('ayam' in natural language mode);

-- Mencari dengan Boolean Mode
select * from products where match (name,description) against ('+mie -bakso' in boolean mode);

-- Mencari dengan Query Expansion Mode
select * from products
where match (name, description)
		against ('bakso' with query expansion);