drop database if exists view_procedure;
create database view_procedure;
use view_procedure;

create table products (
    id int not null primary key auto_increment,
    productCode varchar(20) not null,
    productName varchar(50) not null,
    productPrice int(20) not null,
    productAmount int(20) not null,
    productDescription varchar(255),
    productStatus varchar(255) not null
);

insert into products(productCode,productName,productPrice,productAmount,productDescription,productStatus)
values	("P01","Iphone",2000,1000,"Product from Apple","not available"),
		("P02","Note",1800,1200,"Product from Samsung","available"),
		("P03","Oppo",1000,10000,"Product from Oppo","not available"),
		("P04","Xiaomi",1100,9000,"Product from Xiaomi","available");

alter table products
add index indexProduct(productCode);

alter table products
add index compositeIndex(productName,productPrice);

select *
from products
where productCode = 'P03';
explain select * from products where productCode = 'P03';

select *
from products
where productName = 'Iphone' and productPrice = '2000';
explain select * from products where productName = 'Iphone' and productPrice = '2000';

create or replace view ProductInfor as
    select productCode, productName, productPrice, productStatus
    from products;
    
select *
from ProductInfor;

create or replace view ProductInfor as
    select 
        productCode,
        productName,
        productPrice,
        productStatus,
        productDescription
    from products
    where productPrice = '1100';
    
select *
from ProductInfor;

drop view ProductInfor;

delimiter //
create procedure getProductInfor()
begin
	select * from products;
end //
delimiter ;

call getProductInfor();

delimiter //
create procedure addNewProduct()
begin
	insert into products(productCode,productName,productPrice,productAmount,productDescription,productStatus)
    values ("P05","Huawei",1400,5000,"Product from Huawei","available");
end //
delimiter ;

call addNewProduct();
call getProductInfor();

delimiter //
create procedure editProductById(in in_id int)
begin
	update products
    set productPrice = 1500
    where in_id = id;
end //
delimiter ;

call editProductById(5);

delimiter //
create procedure deleteProductById(in in_id int)
begin
	delete from products
    where in_id = id;
end //
delimiter ;

call getProductInfor();
call deleteProductById(2);
call getProductInfor();