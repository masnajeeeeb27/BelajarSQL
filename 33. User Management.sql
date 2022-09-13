-- User Management
-- Secara default, mysql membuat root user sebagai super administrator
-- Namun best practice nya, saat kita menjalankan MySQL dengan aplikasi yang kita buat, sangat disarankan tidak menggunakan user root
-- Lebih baik kita buat user khusus untuk tiap aplikasi, bahkan kita bisa batasi hak akses user tersebut, seperti hanya bisa melakukan SELECT, dan tidak boleh melakukan INSERT, UPDATE atau DELETE

-- Hak Akses dan User
	-- Dalam user management MySQL, kita akan mengenal istilah Hak Akses dari User
    
-- Daftar Hak Akses
	-- Ada banyak sekali hak akses di MySQL
	-- Kita bisa melihatnya di daftar tabel yang terdapat di halaman berikut :
	-- https://dev.mysql.com/doc/refman/8.0/en/grant.html
    
-- Membuat/Menghapus Database
create user 'almas'@'localhost';
create user 'najiib'@'%';

drop user 'almas'@'localhost';
drop user 'najiib'@'%';

-- Menambah/Menghapus hak akses ke user
grant select on belajar_mysql.* to 'almas'@'localhost';
grant select, insert, update, delete on belajar_mysql.* to 'najiib'@'%';

show grants for 'almas'@'localhost';
show grants for 'najiib'@'%';

-- Mengubah Password untuk User
set password for 'almas'@'localhost'='rahasia';
set password for 'najiib'@'%'='rahasia';

-- Masuk dari terminal
-- ~mysql -u(user) -p
