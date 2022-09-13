-- Table Relationship
-- Dalam Relational DBMS, salah satu fitur andalan nya adalah table relationship. Yaitu relasi antar tabel
-- Kita bisa melakukan relasi dari satu tabel ke tabel lain.
-- Dalam kehidupan nyata pun pasti kita akan sering membuat relasi antar tabel
-- Misal, saat kita membuat aplikasi penjualan, di laporan penjualan pasti ada data barang. Jika di tabel artinya tabel penjualan akan berelasi dengan tabel barang
-- Misal dalam aplikasi kampus, tabel mahasiswa akan berelasi dengan tabel mata kuliah, dan tabel dosen
-- Dan lain-lain

-- Foreign Key
-- Saat membuat relasi tabel, biasanya kita akan membuat sebuah kolom sebagai referensi ke tabel lainnya
-- Misal saat kita membuat tabel penjualan, di dalam tabel penjualan, kita akan menambahkan kolom id_produk sebagai referensi ke tabel produk, yang berisi primary key di tabel produk
-- Kolom referensi ini di MySQL dinamakan Foreign Key
-- Kita bisa menambah satu satu lebih foreign key ke dalam sebuah tabel
-- Membuat foreign key sama seperti membuat kolom biasanya, hanya saja kita perlu memberi tahu MySQL bahwa itu adalah foreign key ke tabel lain

-- Membuat Table dengan Foreign Key
create table wishlist(
	id			int not null auto_increment,
    id_product	varchar(10)	not null,
    description	text,
    primary key (id),
    constraint fk_wishlist_product
		foreign key (id_product) references products (id)
) engine = InnoDB;

describe wishlist;
show create table wishlist;

-- Menambah/Menghapus Foreign Key
alter table wishlist
	drop constraint fk_wishlist_product;
     
alter table wishlist
	add constraint fk_wishlist_product
		foreign key (id_product) references products (id);
        
-- Keuntungan Menggunakan Foreign Key
	-- Foreign key memastikan bahwa data yang kita masukkan ke kolom tersebut harus tersedia di tabel reference nya
	-- Selain itu saat kita menghapus data di tabel reference, MySQL akan mengecek apakah id nya digunakan di foreign key di tabel lain, jika digunakan, maka secara otomatis MySQL akan menolak proses delete data di tabel reference tersebut

-- Contoh insert ke dalam tabel wishlist
insert into wishlist (id_product, description)
values ('P0001','Makanan Kesukaan');

insert into wishlist (id_product, description)
values ('Salah','Makanan Kesukaan'); -- Bakalan Error

delete from products
	where id = 'P0001'; -- Bakalan Error, defaultnya emang restrict coyy

-- Ketika Menghapus Data Berelasi
	-- Seperti yang sebelumnya dibahas, ketika kita menghapus data yang berelasi, maka secara otomatis MySQL akan menolak operasi delete tersebut
	-- Kita bisa mengubah fitur ini jika kita mau, ada banyak hal yang bisa dilakukan ketika data berelasi dihapus, defaultnya memang akan ditolak (RESTRICT)

-- Behavior Foreign Key
	-- Restrict
		-- On Delete = Ditolak
        -- On Update = Ditolak
	-- Cascade
		-- On Delete = Data akan dihapus
        -- On update = Data akan ikut diubah
	-- No Action
		-- On Delete = Data dibiarkan
        -- On Update = Data dibiarkan
	-- Set Null
		-- On Delete = Diubah jadi Null
        -- On Update = Diubah jadi Null
        
-- Mengubah Behavior Menghapus Relasi
alter table wishlist
	add constraint fk_wishlist_product
		foreign key (id_product) references products (id)
			on delete cascade on update cascade;
            
alter table wishlist
	add constraint fk_wishlist_product
		foreign key (id_product) references products (id)
			on delete restrict on update cascade;
            
alter table wishlist
	drop constraint fk_wishlist_product;
            
select * from products;

insert into products (id,name,category,price,quantity)
values ('P0018','Es Milo','Minuman',4000,500);

insert into wishlist (id_product, description)
values ('P0018','Minuman Kesukaan');

select * from wishlist;

delete from products
	where id = 'P0018';