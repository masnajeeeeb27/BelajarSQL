-- Join
-- MySQL mendukung query SELECT langsung ke beberapa tabel secara sekaligus
-- Namun untuk melakukan itu, kita perlu melakukan JOIN di SQL SELECT yang kita buat
-- Untuk melakukan JOIN, kita perlu menentukan tabel mana yang merupakan referensi ke tabel lain
-- Join cocok sekali dengan foreign key, walaupun di MySQL tidak ada aturan kalau JOIN harus ada foreign key
-- Join di MySQL bisa dilakukan untuk lebih dari beberapa tabel
-- Tapi ingat, semakin banyak JOIN, maka proses query akan semakin berat dan lambat, jadi harap bijak ketika melakukan JOIN
-- Idealnya kita melakukan JOIN jangan lebih dari 5 tabel, karena itu bisa berdampak ke performa query yang lambat

-- Melakukan JOIN Table
select * from wishlist;

select * from wishlist
join products on (wishlist.id_product = products.id);

select wishlist.id, products.id, products.name, wishlist.description from wishlist
join products on (products.id = wishlist.id_product);

select w.id, p.id, p.name, w.description from wishlist as w
join products as p on (p.id = w.id_product);

select	w.id as id_wishlist,
		p.id as id_product,
        p.name as product_name, 
        w.description as wishlist_description
from wishlist as w
join products as p 
on (p.id = w.id_product);

-- Membuat Relasi ke Table Customers
alter table wishlist
	add column id_customer int;
    
desc wishlist;

alter table wishlist
add constraint fk_wishlist_customer
foreign key (id_customer) references customers(id);

show create table wishlist;
select * from wishlist;

update wishlist
	set id_customer = 1
where id = 1;

-- Melakukan Join Multiple Table
select customers.email, products.id, products.name, products.description
from wishlist
join products on (products.id = wishlist.id_product)
join customers on (customers.id = wishlist.id_customer);


