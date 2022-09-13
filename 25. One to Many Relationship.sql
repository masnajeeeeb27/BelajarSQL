-- One to Many Relationship
-- One to many relationship adalah relasi antar tabel dimana satu data bisa digunakan lebih dari satu kali di tabel relasinya
-- Berbeda dengan one to one yang cuma bisa digunakan maksimal 1 kali di tabel relasinya, one to many tidak ada batasan berapa banyak data digunakan
-- Contoh relasi antar tabel categories dan products, dimana satu category bisa digunakan oleh lebih dari satu product, yang artinya relasinya nya one category to many products
-- Pembuatan relasi one to many sebenarnya sama dengan one to one, yang membedakan adalah, kita tidak perlu menggunakan UNIQUE KEY, karena datanya memang bisa berkali-kali ditambahkan di tabel relasi nya

-- Membuat Table Category
create table categories
(
	id		varchar(10) not null,
    name	varchar(100) not null,
    primary key (id)
) engine = InnoDB;

-- Mengubah Tabel Product
alter table products
	drop column category;
    
alter table products
	add column id_category varchar(10);
    
alter table products
	add constraint fk_product_categories
		foreign key (id_category) references categories (id);
        
show create table products;
select * from products;

insert into categories(id,name)
values	('C0001','Makanan'),
		('C0002','Minuman'),
        ('C0003','Lain-lain');
        
select * from categories;

update products
set id_category = 'C0001'
where id in ('P0001','P0002','P0003','P0004','P0005','P0006','P0013','P0014','P0015','P0016');

update products
set id_category = 'C0002'
where id in ( 'P0007','P0008','P0009','P0018');

update products
set id_category = 'C0003'
where id in ('P0010','P0011','P0012','P0017');

describe categories;
describe products;

select p.id, p.id_category, c.name as kategori, p.name, p.price from categories as c
join products as p on ( p.id_category = c.id );

select p.id, c.name as kategori, p.name, p.price from categories as c
join products as p on ( p.id_category = c.id );
