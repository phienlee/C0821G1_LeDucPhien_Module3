drop database if exists furama_resort_database;

create database furama_resort_database;

use furama_resort_database;

create table customer (
 customer_id int auto_increment primary key,
 full_name varchar(20),
 date_of_birth date,
 gender varchar(10),
 id_card_number varchar(10),
 phone_number varchar(10),
 email varchar(100),
 customer_type varchar(20),
 address varchar(20)
);

create table employee(
 employee_id int auto_increment primary key,
 full_name varchar(40),
 date_of_birth date,
 id_card_number varchar(10),
 phone_number varchar(10),
 email varchar(100),
 employess_level varchar(15),
 location varchar(15),
 salary double
);

insert into customer(full_name, date_of_birth, gender, id_card_number, phone_number, email, customer_type, address)
value 
('Lê Đức Phiên', '1999-12-10', 'Nam', 123456778, 0325011934, 'phien@gmail.com', 'Diamond', 'Quảng Nam'),
('Hữu Dự', '1993-11-10', 'Nam', 1634567128, 0125011965, 'du@gmail.com', 'Silver', 'Quảng Nam'),
('Trần Thảo Vy', '1996-02-10', 'Nữ', 2134567128, 0435011933, 'vy@gmail.com', 'Gold', 'Đà Nẵng'),
('Nguyễn Anh Tâm', '1999-11-20', 'Nam', 4534756217, 0650501193, 'tam@gmail.com','Diamond', 'Kom tum');

insert into employee(full_name, date_of_birth, id_card_number, phone_number, email, employess_level, location, salary)
value
('Kiên', '1999-11-20', 123456776, 0325016666, 'kien@gmail.com', 'Fresher', 'FO', 10.000000),
('Hữu Dự', '1993-11-10', 123422378, 032501777, 'du@gmail.com', 'Fresher', 'Bell Man', 15.000000),
('Trần Thảo Vy', '1996-02-10', 1256778, 0325018888, 'vy@gmail.com', 'Fresher', 'Room Service', 9.000000),
('Lê Đức Phiên', '1999-12-10', 123456788, 032509994, 'phien@gmail.com', 'Fresher', 'Management', 30.000000);

select *
from customer
where full_name like ('T%');
