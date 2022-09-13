-- Set Operator
-- MySQL mendukung operator Set, dimana ini adalah operasi antara hasil dari dua SELECT query. Ada banyak jenis operator Set, yaitu :
	-- UNION
	-- UNION ALL
	-- INTERSECT, dan
	-- MINUS
    
-- Membuat Table Guest Book
create table guestbooks
(
	id		int				not null auto_increment,
    email	varchar(100)	not null,
	title 	varchar(100)	not null,
    content	text,
    primary key (id)
) engine = InnoDB;

drop table guestbooks;
select * from customers;

insert into guestbooks(email, title, content)
values	('guest@gmail.com','Hello','Hello'),
		('guest2@gmail.com','Hello','Hello'),
        ('guest3@gmail.com','Hello','Hello'),
        ('almas@gmail.com','Hello','Hello'),
        ('almas@gmail.com','Hello','Hello'),
        ('almas@gmail.com','Hello','Hello');
        
select * from guestbooks;

-- Union
-- UNION adalah operasi menggabungkan dua buah SELECT query, dimana jika terdapat data yang duplikat, data duplikatnya akan dihapus dari hasil query

-- Melakukan Query Union
select distinct email from customers
union
select distinct email from guestbooks;

-- Union All
-- UNION ALL adalah operasi yang sama dengan UNION, namun data duplikat tetap akan ditampilkan di hasil query nya

-- Melakukan Query Union All
select distinct email from customers
union all
select distinct email from guestbooks;

select emails.email, count(emails.email)
from (select distinct email from customers
		union all
	  select distinct email from guestbooks) as emails
group by emails.email;

-- Intersect
	-- INTERSECT adalah operasi menggabungkan dua query, namun yang diambil hanya data yang terdapat pada hasil query pertama dan query kedua
	-- Data yang tidak hanya ada di salah satu query, kan dihapus di hasil operasi INTERSECT 
	-- Data nya muncul tidak dalam keadaan duplikat
	-- Sayangnya, MySQL tidak memiliki operator INTERSECT, dengan demikian untuk melakukan operasi INTERSECT, kita harus lakukan secara manual menggunakan JOIN atau SUBQUERY

-- Melakukan Query Intersect
select distinct email from customers
where email in (select distinct email from guestbooks);

select distinct customers.email from customers
inner join guestbooks on (guestbooks.email = customers.email);

-- Minus
-- MINUS adalah operasi dimana query pertama akan dihilangkan oleh query kedua
-- Artinya jika ada data di query pertama yang sama dengan data yang ada di query kedua, maka data tersebut akan dihapus dari hasil query MINUS
-- Sayang nya, di MySQL juga tidak ada operator MINUS, namun hal ini bisa kita lakukan menggunakan JOIN

-- Melakukan Query Minus
select distinct customers.email, guestbooks.email from customers
left join guestbooks on (guestbooks.email = customers.email)
where guestbooks.email is null;

