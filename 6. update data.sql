-- Menambah kolom kategori
alter table products
	add column category enum ('Makanan','Minuman','Lain-lain')
	after name;
select * from products;

-- Mengubah satu kolom
update products 
	set category = 'Makanan' 
    where id='P0005';

update products 
	set category = 'Makanan',
	description = 'Mie Ayam Original + Ceker'
    where id='P0003';
    
update products
	set price = 20000
    where id='P0005';
    
update products
	set price = price - 5000
    where id='P0005';
    
insert into products(id,name,price,quantity)
values ('P0009','Mie Ayam Sayur',15000,100);

update products
	set category = 'Makanan',
		description = 'Mie Ayam + Sayur'
    where id='P0009';
    
update products
	set id = 'P0006',
		description = 'Mie Ayam + Sayur'
    where id='P0009';
    
update products
	set name = 'Mie Sayur',
		description = 'Mie Ayam + Sayur'
    where id = 'P0006';
    
update products
	set id = 'P0016'
    where id='P0006';
    
update products
	set name = 'Mie Ayam Sayur'
    where id='P0016';
    
update products
	set category='Makanan'
    where id='P0004';
    
-- Menghapus Data
delete from products
    where id='P0009';