drop database if exists student_management;
create database student_management;
use student_management;
create table student(
	id int primary key,
    `name` varchar(50),
    date_of_birth date,
    email varchar(40)
);

insert into student(id,`name`,date_of_birth, email)
values 
(123,'Duc Phien','2021-03-25','leducphien@gmail.com'),
(234,'Duc Phien','2021-03-25','leducphien@gmail.com'),
(345,'Duc Phien','2021-03-25','leducphien@gmail.com'),
(456,'Duc Phien','2021-03-25','leducphien@gmail.com');
drop database student_management;