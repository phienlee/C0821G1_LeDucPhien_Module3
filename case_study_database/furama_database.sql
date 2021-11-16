drop database if exists furama_resort_dababase;

create database furama_resort_dababase;

use furama_resort_dababase;

create table positions (
	position_id int primary key,
    position_name varchar(50)
);

create table employee_level (
	employee_level_id int primary key,
	employess_level varchar(15)
);

create table department (
	department_id int primary key,
    department_name varchar(50)
);

create table rental_type (
	rental_type_id int primary key,
    rental_type_name varchar(50),
    price double
);

create table service_type(
	service_type_id int auto_increment primary key,
    service_type_name varchar(50)
);

create table employees(
	employee_id int auto_increment primary key,
    full_name varchar(40) not null default 'Employee name',
    position_id int not null,
    employee_level_id int not null,
    department_id int not null,
    date_of_birth date,
    id_card_number varchar(10) not null unique,
    salary double,
    phone_number varchar(10),
    email varchar(100),
    address varchar(200),
	foreign key(position_id) references positions(position_id),
	foreign key(employee_level_id) references employee_level(employee_level_id),
	foreign key(department_id) references department(department_id)
);

create table customer_type(
	customer_type_id int  primary key,
    customer_type_name varchar(50)
);

create table customers(
	customer_id int auto_increment primary key,
    customer_type_id int,
    full_name varchar(50),
    date_of_birth date,
    id_card_number varchar(10),
    phone_number varchar(10),
    email varchar(100),
    address varchar(200),
    foreign key (customer_type_id) references customer_type(customer_type_id)
 );
 
 create table services(
	service_id int auto_increment primary key,
    service_name varchar(50),
    area_using double,
    no_of_floor int,
    max_of_customer int,
    rental_fee double,
    rental_type_id int,
    service_type_id int,
    availability_status varchar(50),
    foreign key (rental_type_id) references rental_type(rental_type_id),
    foreign key (service_type_id) references service_type(service_type_id)
);

create table accompanied_service(
	accompanied_service_id int auto_increment primary key,
    accompanied_service_name varchar(50),
    price double,
	unit int,
    availability_status varchar(50)
 );
 
 create table contracts(
	contract_id int auto_increment not null primary key,
    employee_id int,
    customer_id int,
    service_id int,
    date_started date,
    date_finished date,
    down_payment double,
    total_payment double,
	foreign key(employee_id) references employees(employee_id),
	foreign key(customer_id) references customers(customer_id),
	foreign key(service_id) references services(service_id)
);

 create table contract_detail(
	contract_detail_id int auto_increment primary key,
    contract_id int,
    accompanied_service_id int,
    amount int,
    foreign key (contract_id) references contracts(contract_id),
    foreign key (accompanied_service_id) references accompanied_service(accompanied_service_id)
 );
 
 -- Task 1.	Thêm mới thông tin cho tất cả các bảng có trong CSDL để có thể thõa mãn các yêu cầu bên dưới.\

 insert into positions(position_id, position_name)
value
	(1,'Staff'),
	(2,'Captain'),
	(3,'Supevisor'),
	(4,'Manager'),
	(5,'Director'),
	(6,'Genaral Manager')
;

insert into employee_level(employee_level_id, employess_level)
value
	(1,'A1'),
	(2,'A2'),
	(3,'B1'),
	(4,'B2'),
	(5,'C1'),
	(6,'C2')
;

insert into department(department_id, department_name)
value
	(1,'Sale & Marketing'),
	(2,'Financial'),
	(3,'Kitchen'),
	(4,'HouseAtendent'),
	(5,'F&B'),
	(6,'FO');
    
        
insert into rental_type(rental_type_id, rental_type_name, price)
value
	(1,'Day',200000.00),
	(2,'Month',6000000.00),
	(3,'Year',1000000000.00),
	(4,'Hour',100000.00);
    
insert into service_type(service_type_id, service_type_name)
value
	(1,'Villa'),
	(2,'House'),
	(3,'Room');
 
 
insert into customer_type(customer_type_id, customer_type_name)
value
	(1,'Diamond'),
	(2,'Platinium'),
	(3,'Gold'),
	(4,'Silver'),
	(5,'Member');
    
insert into accompanied_service(accompanied_service_id, accompanied_service_name, price, unit, availability_status)
value
	(1,'Karaoke',100000.00,1, 'Availabale'),
	(2,'Car',200000.00,2, 'Unavailabale'),
	(3,'Drink',300000.00,3, 'Availabale'),
	(4,'Food',600000.00,2, 'Availabale'),
	(5,'Spa',200000.00,2, 'Availabale');    
    
insert into services(service_name, area_using, no_of_floor, max_of_customer, rental_fee, rental_type_id, service_type_id, availability_status)
values
("Villa Lamark", 700.76, 2, 3, 2000000, 2, 1, "Available"),
("Villa A",	400.50,	3, 3,	1000000, 2, 1, "Available"),
("House Lamark", 100.70, 2, 3, 500000, 1, 2, "Not available"),
("House A", 80.70, 3, 2, 300000, 1, 2, "Available"),
("Room 312", 70.3, 2, 3, 200000, 2, 1, "Available"),
("Room 213", 50.4, 1, 2, 290000, 4, 3, "Not available");    

insert into employees( full_name, position_id, employee_level_id, department_id, date_of_birth, id_card_number, salary, phone_number, email, address) 
value 
	('Le Duc Phien', 1, 2, 3, '1999-06-19', '208876544', 12000000.00, '0333576574', 'phien_le@gmail.com', 'Quang Nam' ),
	('Nguyen Phuc Duy', 2, 1, 4, '1997-07-25', '208876545', 16000000.00, '0907656547', 'duy_nguyen@gmail.com', 'Ha Noi' ),
	('Tran Anh Tam', 1, 1, 1, '2000-10-17', '207776513', 10000000.00, '0917676587', 'tam_tran@gmail.com', 'Kon Tum' ),
	('Nguyen Van Dong', 1, 2, 3, '1999-07-23', '209971245', 18000000.00, '0333765654', 'dong_nguyen@gmail.com', 'Quang Nam' ),
	('Nguyen Van Cong', 2, 2, 2, '1999-08-30', '208877619', 15000000.00, '0345717654', 'cong_nguyen@gmail.com', 'Binh Dinh' ),
	('Nguyen Trung Kien', 1, 3, 2, '2000-09-30', '208845545', 10000000.00, '0907658333', 'kien_nguyen@gmail.com', 'Da Nang' ),
	('Tran Le Thao Vy', 1, 3, 2, '1995-07-29', '212376545', 16000000.00, '0944458654', 'vy_tran@gmail.com', 'Da Nang' ),
	('Vo Nhat Anh', 2, 3, 1, '2003-10-17', '208856453', 100000000.00, '0333765654', 'anh_vo@gmail.com', 'Ha Noi' ),
	('Dang Huu Du', 1, 3, 4, '1993-07-30', '218846565', 8000000.00, '0917636784', 'du_dang@gmail.com', 'Quang Nam' );
select length(phone_number) 
from employees;

insert into customers(customer_type_id, full_name, date_of_birth, id_card_number, phone_number, email ,address)
 value
	(1, 'Joan', '1977-06-20', '208872125', '0333576575', 'joan@gmail.com', 'Spanish' ),
	(2, 'Take Uchi Satoru', '1971-01-19', '208876546', '090765659', 'take_uchi@gmail.com', 'Japan' ),
	(2, 'Ty Colin', '1975-11-28', '207776517', '091767658', 'ty_colin@gmail.com', 'Us' ),
	(1, 'Dang Chi Trung', '1993-08-19', '209971242', '0333765651', 'trung_dang@gmail.com', 'Quang Nam' ),
	(2, 'Nguyen Thi Thu Ha', '1996-11-19', '208877611', '0345176510', 'ha_nguyen@gmail.com', 'Quang Tri' ),
	(3, 'Nguyen Hong Dang', '1988-12-30', '208845540', '0906588335', 'dang_nguyen@gmail.com', 'Ha Noi' ),
	(2, 'Tran Truong Hai', '1998-07-29', '212376541', '0944456056', 'hai_truong@gmail.com', 'Quang Nam' ),
	(1, 'Tran Minh Chien', '1997-10-17', '208856459','0333765651', 'chien_tran@gmail.com', 'Quang Tri' ),
	(2, 'Doan Phuoc Trung', '1989-08-24', '218846561', '0917063678', 'trung_doan@gmail.com', 'Da Nang' );

-- Task 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.

select *
from employees
where (full_name regexp '[HKT][a-z]*$') and length(full_name) <=15;

-- Task 3.	Hiển thị thông tin của tất cả khách  hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.

select *
from customers
where (timestampdiff(year, date_of_birth, curdate()) between 18 and 50 ) and address in ('Da Nang', 'Quang Tri'); 

-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được 
-- sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

select customers.customer_id, customers.full_name, customer_type.customer_type_name, COUNT(*) as no_of_booked
from customers
	inner join customer_type on customers.customer_type_id = customer_type.customer_type_id
	left join contracts on customers.customer_id = contracts.customer_id
where
    customer_type.customer_type_name = 'Diamond'
group by  customer_id
ORDER BY no_of_booked;

-- 5. Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc,
-- TongTien (Với TongTien được tính theo công thức như sau: ChiPhiThue + SoLuong*Gia, với SoLuong
-- và Giá là từ bảng DichVuDiKem) cho tất cả các Khách hàng đã từng đặt phỏng. (Những Khách hàng 
--  nào chưa từng đặt phòng cũng phải hiển thị ra).

select customers.customer_id, customers.full_name, customer_type.customer_type_name, services.service_name, contracts.date_started,
		contracts.date_finished,
case when contracts.contract_id in (
	select contract_id
    from contract_detail
) then services.rental_fee + sum(contract_detail.amount*accompanied_service.price)
else services.rental_fee
end as total_fee
from customers
	left join customer_type on customer_type.customer_type_id=customers.customer_type_id
    left join contracts on customers.customer_id= contracts.customer_id
    left join services on services.service_id  =contracts.service_id
    left join contract_detail on contracts.contract_id=contract_detail.contract_id
    left join accompanied_service on accompanied_service.accompanied_service_id= contract_detail.accompanied_service_id
group by contracts.contract_id;


-- 6. Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu của tất cả các loại Dịch vụ chưa 
-- từng được Khách hàng thực hiện đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3).

select services.service_id, services.service_name, services.area_using, services.rental_fee, service_type.service_type_name, contracts.date_started
from services
	inner join service_type on services.service_type_id=service_type.service_type_id
    left join contracts on services.service_id=contracts.service_id
where contracts.date_started not in (
	select contracts.date_started
    from contracts
    where (date_started between '2019-01-01' and '2019-03-31')
)
order by service_id;