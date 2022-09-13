-- Many To Many Relationship
-- Many to Many adalah table relationship yang paling kompleks, dan kadang membingungkan untuk pemula
-- Many to Many adalah relasi dimana ada relasi antara 2 tabel dimana table pertama bisa punya banyak relasi di table kedua, dan table kedua pun punya banyak relasi di table pertama
-- Ini memang sedikit membingungkan, bagaimana caranya bisa relasi kebanyakan secara bolak balik, sedangkan di table kita cuma punya 1 kolom?
-- Contoh relasi many to many adalah relasi antara produk dan penjualan, dimana setiap produk bisa dijual berkali kali, dan setiap penjualan bisa untuk lebih dari satu produk

-- Bagaimana Implementasi Many to Many
-- Sekarang pertanyaannya, bagaimana implementasi many to many?
-- Apakah kita harus menambahkan id_order di table products? atau id_product di table orders?

-- Id Product di Table Order
-- Jika kita menambahkan id_product di table orders, artinya sekarang sudah benar, bahwa 1 product bisa dijual berkali-kali
-- Namun masalahnya adalah, berarti 1 order hanya bisa membeli 1 product, karena cuma ada 1 kolom untuk id_product
-- Oke kalo gitu kita tambahkan id_product1, id_product2, dan seterusnya. Solusi ini bisa dilakukan, tapi

-- Id Order di Table Product
-- Jika kita tambahkan id_order di table products, artinya sekarang 1 order bisa membeli lebih dari 1 product, oke sudah benar
-- Tapi sayangnya masalahnya terbalik sekarang, 1 product cuma bisa dijual satu kali, tidak bisa dijual berkali-kali, karena kolom id_order nya cuma 1
-- Kalupun kita tambah id_order1, id_order2 dan seterusnya di table product, tetap ada batasan maksimal nya
-- Lantas bagaimana solusinya untuk relasi many to many?

-- Membuat Table Relasi
-- Solusi yang biasa dilakukan jika terjadi relasi many to many adalah, biasanya kita akan menambah 1 tabel ditengahnya
-- Tabel ini bertugas sebagai jembatan untuk menggabungkan relasi many to many
-- Isi table ini akan ada id dari table pertama dan table kedua, dalam kasus ini adalah id_product dan id_order
-- Dengan demikian, kita bisa menambahkan beberapa data ke dalam tabel relasi ini, sehingga berarti satu product bisa dijual beberapa kali di dalam table order, dan satu order bisa membeli lebih dari satu product

-- Membuat Table Order
create table orders
(
	id			int			not null auto_increment,
    total		int			not null,
    order_date	datetime	not null default current_timestamp,
    primary key (id)
) engine = InnoDB;

describe orders;

-- Membuat Table Order Detail
create table orders_detail
(
	id_product	varchar(10) not null,
    id_order	int			not null,
    price		int			not	null,
    quantity	int			not null,
    primary key (id_product, id_order)
) engine = InnoDB;

describe orders_detail;

-- Membuat Foreign Key
alter table orders_detail
	add constraint fk_orders_detail_product
		foreign key (id_product) references products (id);
        
alter table orders_detail
	add constraint fk_orders_detail_order
		foreign key (id_order) references orders (id);
        
show create table orders_detail;

select * from orders;

insert into orders(total) values (50000);

insert into orders_detail (id_product, id_order, price, quantity)
values	('P0001', 1, 25000, 1),
		('P0002', 1, 25000, 1);
insert into orders_detail (id_product, id_order, price, quantity)
values	('P0003', 2, 25000, 1),
		('P0004', 3, 25000, 1);
insert into orders_detail (id_product, id_order, price, quantity)
values	('P0001', 2, 25000, 1),
		('P0003', 3, 25000, 1);
        
select * from orders_detail;

-- Melihat Data Order, Detail dan Product-nya
select * from orders
join orders_detail on (orders_detail.id_order = orders.id)
join products on (products.id = orders_detail.id_product);

select orders.id, products.id, products.name, orders_detail.quantity, orders_detail.price from orders
join orders_detail on (orders_detail.id_order = orders.id)
join products on (products.id = orders_detail.id_product);

select orders.id, products.name, orders_detail.quantity, products.price from orders
join orders_detail on (orders_detail.id_order = orders.id)
join products on (products.id = orders_detail.id_product);