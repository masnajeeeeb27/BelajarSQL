show databases; -- menunjukkan databases --

create database belajar_mysql; -- membuat database --
show databases;

drop database belajar_mysql; -- menghapus database --
show databases;

use belajar_mysql; -- menunjuk atau menggunakan database --
show tables;

create table barang(
	id int,
    nama varchar(100),
    harga int,
    jumlah int
) engine = InnoDB; -- membuat tabel --

desc barang; -- mendeskripsikan kondisi tabel --

show create table barang;

alter table barang
	rename column kode to id; -- mengedit nama kolom

desc barang;

alter table barang -- mengedit tabel 
	add column deskripsi text; -- menambah kolom
    
alter table barang
	add column salahku text;
    
alter table barang
	drop column salahku; -- menghapus kolom
    
alter table barang
	modify nama varchar(120); -- mengedit kolom
    
alter table barang
	modify nama varchar(120) after deskripsi; -- memindahkan kolom setelah deskripsi 
    
alter table barang
	modify nama varchar(120) first; -- memindahkan kolom ke bagian depan

alter table barang
	modify nama varchar(120) after id;
    
alter table barang
	modify id int not null; -- mengedit id menjadi not null atau tidak boleh kosong
    
alter table barang
	modify nama varchar(120) not null; -- mengedit nama menjadi not null
    
alter table barang
	modify harga int not null default 0; -- mengedit harga jika tidak diisi maka bernilai 0
    
alter table barang
	modify jumlah int not null default 0; -- mengedit jumlah jika tidak diisi maka bernilai 0
    
alter table barang
	add waktu_dibuat timestamp not null default current_timestamp; -- menambahkan waktu tetapi not null, dan default waktunya menggunakan waktu saat ini
   
insert into barang (id,nama) values ('1','Apel'); -- memasukkan data ke tabel
select * from barang; -- menampilkan isi tabel
truncate barang; -- mereset isi tabel barang
drop table barang; -- menghapus tabel