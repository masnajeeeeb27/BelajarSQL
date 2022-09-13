alter table products
	add primary key (id);
    
alter table products
	drop primary key;

desc products;