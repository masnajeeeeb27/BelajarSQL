-- Jenis-Jenis Join
-- Sebelumnya kita sudah bahas tentang JOIN table, tapi sebenarnya ada banyak sekali jenis-jenis JOIN table di MySQL, diantaranya :
-- INNER JOIN
-- LEFT JOIN
-- RIGHT JOIN
-- CROSS JOIN

-- Inner Join
-- INNER JOIN adalah mekanisme JOIN, dimana terdapat relasi antara tabel pertama dan tabel kedua
-- Jika ada data di tabel pertama yang tidak memiliki relasi di table kedua ataupun sebaliknya, maka hasil INNER JOIN tidak akan ditampilkan
-- Ini adalah default JOIN di MySQL
-- Jika kita menggunakan JOIN seperti yang sudah kita praktekan sebelumnya, sebenarnya itu akan melakukan INNER JOIN

-- Melakukan Inner Join
select * from categories
join products on (products.id_category = categories.id);

select * from categories;
select * from products;

insert into categories (id,name)
values	('C0004','Oleh-oleh'),
		('C0005','Gadget');
        
insert into products(id,name,price,quantity)
values	('X0001','X Satu', 25000, 200),
		('X0002','X Dua', 10000,300),
        ('X0003','X Tiga', 15000, 500);

select * from categories
inner join products on (products.id_category = categories.id);
-- Join = Inner Join

-- Left Join
-- LEFT JOIN adalah mekanisme JOIN seperti INNER JOIN, namun semua data di table pertama akan diambil juga
-- Jika ada yang tidak memiliki relasi di table kedua, maka hasilnya akan NULL

-- Melakukan Left Join
select * from categories
left join products on (products.id_category = categories.id);

-- Right Join
-- RIGHT JOIN adalah mekanisme JOIN seperti INNER JOIN, namun semua data di table kedua akan diambil juga
-- Jika ada yang tidak memiliki relasi di table pertama, maka hasilnya akan NULL

-- Melakukan Right Join
select * from categories
right join products on (products.id_category = categories.id);

-- Cross Join
-- CROSS JOIN adalah salah satu JOIN yang sangat jarang sekali digunakan
-- CROSS JOIN adalah melakukan join dengan cara mengkalikan data di tabel pertama dengan dada di table kedua
-- Artinya jika ada 5 data di tabel pertama, dan 5 data di tabel kedua, akan menghasilkan 25 kombinasi data (5 x 5)
-- Sekali lagi perlu diingat, ini adalah JOIN yang sangat jarang sekali digunakan

-- Menggunakan Cross Join
select * from categories
cross join products;

-- Membuat Tabel Perkalian
create table numbers
(
	id	int not null,
    primary key (id)
) engine = InnoDB;

insert into numbers(id) values (1),(2),(3),(4),(5),(6),(7),(8),(9),(10);

select * from numbers as numbers1 cross join numbers as numbers2 order by numbers1.id, numbers2.id;

select numbers1.id, numbers2.id, (numbers1.id * numbers2.id) as hasil
from numbers as numbers1 
	cross join numbers as numbers2 
order by numbers1.id, numbers2.id;



		
