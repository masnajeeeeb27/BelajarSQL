create database akademik;
use akademik;

show databases;

-- 1
create table mhs(
	nim char(14) not null,
    nama char(25) not null,
    kelamin enum ('P','W'),
    agama enum ('1','2','3','4','5','6') default '1',
    tgl_lhr date );

-- 2
alter table mhs
	add column alamat varchar(30) after nama;
  
-- 3
alter table mhs
	add column kota char(20) after alamat;

-- 4
alter table mhs
	rename column kelamin to sex;

-- 5
insert into mhs(nim,nama,alamat,kota,sex,agama,tgl_lhr)
values	('A21.2001.00234','Dedy Sutanta','Jl.A. Yani 20','Solo','P','1','1979-10-20'),
		('A21.2001.00214','Budi Satria','Jl.Dago 10','Yogyakarta','P','1','1978-11-22'),
        ('A21.2001.00224','Sulis','Jl. Nakula I 25','Semarang','W','2','1975-08-16'),
        ('A21.2001.00344','Suci Andriani','Jl. Seroja Raya','Semarang','W','3','1977-09-21');
        
select * from mhs;


