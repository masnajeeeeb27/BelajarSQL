-- Constraint
-- Di MySQL, kita bisa menambahkan constraint untuk menjaga data di tabel tetap baik
-- Constraint sangat bagus ditambahkan untuk menjaga terjadi validasi yang salah di program kita, sehingga data yang masuk ke database tetap akan terjaga

-- Unique Constraint
-- Unique constraint adalah constraint yang memastikan bahwa data kita tetap unique
-- Jika kita mencoba memasukkan data yang duplikat, maka MySQL akan menolak data tersebut

-- Membuat Table dengan Unique Constraint
create table customers(
	id			int				not null auto_increment,
    email		varchar(100)	not null,
	first_name	varchar(100)	not null,
    last_name	varchar(100),
    primary key (id),
    unique key email_unique (email)
) engine = InnoDB;

-- Menambah/Menghapus Unique Constraint
alter table customers
	add constraint email_unique unique (email);
    
alter table customers
	drop constraint email_unique;
    
alter table customers
	add constraint email_unique unique (email);
    
insert into customers (email, first_name, last_name)
values ('almas@gmail.com','Almas Najiib','Imam Muttaqin');

select * from customers;

insert into customers (email, first_name, last_name)
values ('najiib@gmail.com','Almas Najiib','Imam Muttaqin');
-- Kenapa lompat ke ID 3, karena id sebelumnya sudah terpakai pake insert sebelumnya yang gagal

-- Check Constraint
-- Check constraint adalah constraint yang bisa kita tambahkan kondisi pengecekannya
-- Ini cocok untuk mengecek data sebelum dimasukkan ke dalam database
-- Misal kita ingin memastikan bahwa harga harus diatas 1000 misal
-- Maka kita bisa menggunakan check constraint

create table produk(
	id			varchar(10) not null,
    name		varchar(10) not null,
    description	text,
    price		int unsigned not null,
    quantity	int unsigned not null default 0,
    created_at	timestamp	 not null default current_timestamp,
    primary key (id),
    constraint price_check check (price >= 1000)
);

-- Menambah/Menghapus Check Constraint
alter table products
	add constraint price_check check (price >= 1000);
    
alter table products
	drop constraint price_check;
    
select * from products;

insert into products (id,name,category,price,quantity)
values ('P0017','Permen','Lain-lain',500,1000);

update products
	set price = 1000
where id = 'P0017';

update products
	set price = 500
where id = 'P0017';

show create table products;

	
