-- Flow Control Function

-- MySQL memiliki fitur flow control function
-- Ini mirip IF ELSE di bahasa pemrograman
-- Tapi ingat, fitur ini tidak se kompleks yang dimiliki bahasa pemrograman
-- https://dev.mysql.com/doc/refman/8.0/en/flow-control-functions.html 

-- Menggunakan Control Flow CASE
select id, name, category,
	case category
		when 'Makanan' then 'Enak'
        when 'Minuman' then 'Segar'
        else 'Apa itu?'
        end as 'Category'
from products;

-- Menggunakan Control Flow IF
select id, name, price,
	if(price <= 15000, 'Murah',
		if(price <= 20000, 'Mahal', 'Mahal Banget')
        ) as 'Mahal?'
from products;

-- Menggunakan Control Flow IFNULL
select id, name, 
	ifnull(description,"Kosong ??, Astaghrullahal'adzim") 
from products;
