-- String Function
-- Sama seperti number, di MySQL juga banyak menyediakan function untuk tipe data String
-- Ada banyak sekali function-function yang bisa kita gunakan
-- https://dev.mysql.com/doc/refman/8.0/en/string-functions.html

select id, lower(name) as 'Name Lower' from products;
select id, name, length(name) as 'Name Length' from products;

select id,
		lower(name) as 'Name Lower',
        upper(name) as 'Name Upper',
        length(name) as 'Name Length'
from products;
