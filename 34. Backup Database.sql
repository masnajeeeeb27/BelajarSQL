-- Backup Database

-- Saat membuat aplikasi menggunakan database, ada baiknya kita selalu melakukan backup data secara reguler
-- Untungnya MySQL mendukung proses backup database
-- Untuk melakukan backup database, kita tidak menggunakan perintah SQL, melainkan MySQL menyediakan sebuah aplikasi khusus untuk melakukan backup database, namanya adalah mysqldump
-- https://dev.mysql.com/doc/refman/8.0/en/mysqldump.html

-- Melakukan BackUp Database
-- mysql_dump belajar_mysql --user root --password --result-file=/Users/almas/desktop/backup.sql