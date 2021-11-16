drop database if exists product_management;

create database product_management;

use product_management;

create table bill_details (
`quantity_bill` int,
price_bill double
);
create table bill (
 bill_number int primary key,
 bill_date date,
 `quantity_bill` int,
 foreign key (`quantity_bill`) references bill_details(`quantity_bill`)
);
 


create table enter_coupon_details (
price_enter_coupon double,
quantity_enter_coupon int
);

create table supplies (
code_supplies int auto_increment primary key,
name_supplies varchar(20),
price_enter_coupon double,
price_bill double,
foreign key (price_enter_coupon) references enter_coupon_details(price_enter_coupon),
foreign key (price_bill) references bill_details(price_bill)
);

create table supplies_details (
name_supplies varchar(20),
quantity_supplie int,
total_price_supplies double,
foreign key (name_supplies) references supplies(name_supplies)
);

create table enter_coupon (
number_coupon int auto_increment primary key,
date_enter date,
quantity_enter_coupon int,
foreign key (quantity_enter_coupon) references enter_coupon_details(quantity_enter_coupon)
);

create table order_product (
number_order int auto_increment primary key,
date_order date,
quantity_supplies int,
total_price_supplies double,
quantity_supplier int,
total_price_supplier double,
foreign key (quantity_supplies) references supplies_details(quantity_supplies),
foreign key (total_price_supplies) references supplies_details(total_price_supplies),
foreign key (quantity_supplier) references supplier_details(total_price_supplier),
foreign key (total_price_supplier) references supplier_details(total_price_supplier)
);

create table phone_number (
 phone_id int primary key,
 phone_number_type varchar(15)
);

create table supplier_details (
name_supplier varchar(20),
quantity_supplier int,
total_price_supplier double
);


create table supplier (
code_supplier int auto_increment primary key,
name_supplier varchar(20),
address varchar(50),
phone_id int,
foreign key (phone_id) references phone_number(phone_id),
foreign key (name_supplier) references supplier_details(name_supplier)
);


