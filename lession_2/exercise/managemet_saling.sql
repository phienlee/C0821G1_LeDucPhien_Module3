drop database if exists bank_management;

create database bank_management;

use bank_management;

create table customer (
	customer_id int auto_increment primary key,
	customer_name varchar(20) not null,
	customer_age int not null
);

create table orders (
	order_id int auto_increment primary key,
	customer_id int,
	order_date date,
	order_total_price double,
	foreign key (customer_id) references customer(customer_id)
);

create table products (
	product_id int auto_increment primary key,
    product_name varchar(20),
    product_price double
);

create table order_detail (
	order_detail_qty varchar(20),
    order_id int,
    product_id int,
    primary key (order_id,product_id),
    foreign key (order_id) references orders(order_id),
    foreign key (product_id) references products(product_id)
);





