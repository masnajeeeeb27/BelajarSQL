create database mahasiswa;
create table mhs(
	id_mhs varchar(20) not null,
    nama varchar(30) default '-',
    nim varchar(25) default '-',
    alamat varchar(50) default '-',
    tanggal_lahir date,
    primary key (id_mhs)
) engine = InnoDB;

desc mhs;

insert into mhs (id_mhs,nama,nim,alamat,tanggal_lahir) values ('1112113644','Almas NIM','A11.2021.13644','Purbalingga','2003-03-27');
select * from mhs;
drop table mhs;
drop database mahasiswa;
