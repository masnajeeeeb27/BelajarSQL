-- Date and time function

-- MySQL juga menyediakan banyak sekali function yang bisa kita gunakan untuk mengolah data tipe Date dan Time
-- https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html 


select id, name,
		extract(year from created_at) as 'Year',
        extract(month from created_at) as 'Month'
from products;

select id, name, year(created_at) as 'Year' , month(created_at) as 'Month' from products;