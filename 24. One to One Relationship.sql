-- One to One Relationship

-- Jenis - Jenis Relasi Tabel
-- Sekarang kita sudah tau untuk melakukan relasi antar tabel, kita bisa menggunakan FOREIGN KEY
-- Dan untuk melakukan SELECT beberapa tabel, kita bisa menggunakan JOIN
-- Dalam konsep relasi, ada banyak jenis-jenis relasi antar tabel
-- Sekarang kita akan bahas dari yang pertama yaitu One to One relationship

-- One to One Relationship
-- One to One relationship adalah relasi antar tabel yang paling sederhana
-- Artinya tiap data di sebuah tabel hanya boleh berelasi ke maksimal 1 data di tabel lainnya
-- Tidak boleh ada relasi lebih dari 1 data
-- Contoh misal, kita membuat aplikasi toko online yang terdapat fitur wallet, dan 1 customer, cuma boleh punya 1 wallet

-- Membuat One to One Relationship
-- Cara membuat One to One relationship cukup mudah
-- Kita bisa membuat kolom foreign key, lalu set kolom tersebut menggunakan UNIQUE KEY, hal ini dapat mencegah terjadi data di kolom tersebut agar tidak duplikat
-- Atau cara lainnya, kita bisa membuat tabel dengan primary key yang sama, sehingga tidak butuh lagi kolom untuk FOREIGN KEY

-- Membuat Table Wallet
create table wallet
(
	id			int not null auto_increment,
    id_customer	int not null,
    balance		int not null default 0,
    primary key (id),
    unique key fk_id_customer_unique (id_customer),
    constraint fk_wallet_customer
		foreign key (id_customer) references customers (id)
) engine = InnoDB;

describe wallet;
describe customers;
select * from customers;
insert into wallet(id_customer) values (1),(3);
select * from wallet;

select customers.email, wallet.balance
from wallet join customers on (wallet.id_customer = customers.id);

select customers.first_name, wallet.balance
from wallet join customers on (wallet.id_customer = customers.id);
    