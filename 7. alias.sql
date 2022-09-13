-- Alias untuk kolom

select	id			as 'kode',
		name 		as 'nama',
        category 	as 'kategori',
        description	as 'deskripsi',
        price		as 'harga',
        quantity	as 'Stok'
from products; -- Kalau hanya satu kata tidak perlu tanda kutip

-- Alias untuk tabel
select	p.id			as 'kode',
		p.name 		as 'nama',
        p.category 	as 'kategori',
        p.description	as 'deskripsi',
        p.price		as 'harga',
        p.quantity	as 'Stok'
from products as p;


        