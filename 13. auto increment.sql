-- Auto Increment
-- Kadang kita butuh angka yang berurut untuk membuat primary key, misal 1, 2, 3, dan seterusnya.
-- Untuk melakukan hal ini secara manual bukanlah hal bijak, apalagi jika aplikasi yang kita buat diakses oleh banyak orang secara bersamaan
-- MySQL memiliki fitur yang bernama auto increment, fitur ini bisa kita gunakan untuk menandai bahwa suatu primary key datanya diisi secara otomatis dari angka terakhir + 1
-- Dengan menggunakan auto increment, kita tidak perlu lalu memasukkan data primary key, ini akan otomatis dibuat oleh MySQL

create table admin(
	id			int not null auto_increment,
    first_name	varchar(100),
    last_name	varchar(100),
    primary key (id)
) engine = InnoDB;

desc admin;
insert into admin(first_name,last_name) values ('Eko','Khannedy');
insert into admin(first_name,last_name) 
values	('Budi','Nugraha'),
		('Joko','Anwar');

select * from admin;
select * from admin order by id;
delete from admin where id=3;
insert into admin(first_name,last_name) values ('Muhammad','Marzukki');
insert into admin(first_name,last_name) values ('Joko','Tingkir');

-- Melihat ID terakhir
select last_insert_id();
select last_insert_id() as kode;

use belajar_mysql;
select first_name from admin;
		
    
