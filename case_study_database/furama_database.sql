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
 
 -- Task 1.	Th??m m???i th??ng tin cho t???t c??? c??c b???ng c?? trong CSDL ????? c?? th??? th??a m??n c??c y??u c???u b??n d?????i.\

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
	(1, 'Dang Chi Trung', '1993-08-19', '209971242', '0333765651', 'trung_dang@gmail.com', 'Quang Ngai' ),
	(2, 'Nguyen Thi Thu Ha', '1996-11-19', '208877611', '0345176510', 'ha_nguyen@gmail.com', 'Quang Tri' ),
	(3, 'Nguyen Hong Dang', '1988-12-30', '208845540', '0906588335', 'dang_nguyen@gmail.com', 'Ha Noi' ),
	(2, 'Tran Truong Hai', '1998-07-29', '212376541', '0944456056', 'hai_truong@gmail.com', 'Quang Nam' ),
	(1, 'Tran Minh Chien', '1997-10-17', '208856459','0333765651', 'chien_tran@gmail.com', 'Quang Tri' ),
	(2, 'Doan Phuoc Trung', '1989-08-24', '218846561', '0917063678', 'trung_doan@gmail.com', 'Vinh' );

insert into contracts(employee_id, customer_id, service_id, date_started, date_finished, down_payment, total_payment)
values
	(1, 1, 2, '2015-10-16', '2015-10-28', 150000, 1000000),
	(2, 2, 2, '2016-11-10', '2019-11-15', 100000, 1000000),
	(3, 3, 1, '2019-12-26', '2019-12-30', 200000, 2000000),
	(2, 4, 3, '2017-07-12', '2018-07-28', 100000, 10000000),
	(3, 4, 2, '2017-09-16', '2015-11-20', 200000, 1000000),
	(2, 2, 4, '2018-01-09', '2018-01-12', 100000, 1000000),
	(4, 3, 1, '2018-10-16', '2018-10-28', 300000, 1000000),
	(6, 3, 3, '2019-08-20', '2019-08-25', 100000, 1000000),
	(7, 6, 2, '2019-11-07', '2019-11-19', 150000, 1000000),
	(7, 7, 6, '2020-10-16', '2020-10-28', 150000, 1000000),
	(7, 8, 5, '2021-03-16', '2021-03-20', 300000, 1000000);

insert into contract_detail( contract_id, accompanied_service_id, amount)
 value
	(1, 1, 1 ),
	(2, 2, 2 ),
	(3, 3, 3 ),
	(4, 4, 2 ),
	(5, 5, 3 ),
	(7, 2, 1 ),
	(8, 3, 1 );
    
-- Task 2.	Hi???n th??? th??ng tin c???a t???t c??? nh??n vi??n c?? trong h??? th???ng c?? t??n b???t ?????u l?? m???t trong c??c k?? t??? ???H???, ???T??? ho???c ???K??? v?? c?? t???i ??a 15 k?? t???.

select *
from employees
where (full_name regexp '[HKT][a-z]*$') and length(full_name) <=15;

-- Task 3.	Hi???n th??? th??ng tin c???a t???t c??? kh??ch  h??ng c?? ????? tu???i t??? 18 ?????n 50 tu???i v?? c?? ?????a ch??? ??? ??????? N???ng??? ho???c ???Qu???ng Tr??????.

select *
from customers
where (timestampdiff(year, date_of_birth, curdate()) between 18 and 50 ) and address in ('Da Nang', 'Quang Tri'); 

-- 4.	?????m xem t????ng ???ng v???i m???i kh??ch h??ng ???? t???ng ?????t ph??ng bao nhi??u l???n. K???t qu??? hi???n th??? ???????c 
-- s???p x???p t??ng d???n theo s??? l???n ?????t ph??ng c???a kh??ch h??ng. Ch??? ?????m nh???ng kh??ch h??ng n??o c?? T??n lo???i kh??ch h??ng l?? ???Diamond???.

select customers.customer_id, customers.full_name, customer_type.customer_type_name, COUNT(*) as no_of_booked
from customers
	inner join customer_type on customers.customer_type_id = customer_type.customer_type_id
	left join contracts on customers.customer_id = contracts.customer_id
where
    customer_type.customer_type_name = 'Diamond'
group by  customer_id
ORDER BY no_of_booked;

-- 5. Hi???n th??? IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc,
-- TongTien (V???i TongTien ???????c t??nh theo c??ng th???c nh?? sau: ChiPhiThue + SoLuong*Gia, v???i SoLuong
-- v?? Gi?? l?? t??? b???ng DichVuDiKem) cho t???t c??? c??c Kh??ch h??ng ???? t???ng ?????t ph???ng. (Nh???ng Kh??ch h??ng 
--  n??o ch??a t???ng ?????t ph??ng c??ng ph???i hi???n th??? ra).

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


-- 6. Hi???n th??? IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu c???a t???t c??? c??c lo???i D???ch v??? ch??a 
-- t???ng ???????c Kh??ch h??ng th???c hi???n ?????t t??? qu?? 1 c???a n??m 2019 (Qu?? 1 l?? th??ng 1, 2, 3).

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


-- 7. Hi???n th??? th??ng tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, 
-- TenLoaiDichVu c???a t???t c??? c??c lo???i d???ch v??? ???? t???ng ???????c Kh??ch h??ng ?????t 
-- ph??ng trong n??m 2018 nh??ng ch??a t???ng ???????c Kh??ch h??ng ?????t ph??ng trong n??m 2019.


select services.service_id, services.service_name, services.area_using, services.max_of_customer, 
services.rental_fee, service_type.service_type_name, contracts.date_started
from services
	inner join service_type on services.service_type_id = service_type.service_type_id
    left join contracts on services.service_id= contracts.service_id
where services.service_id in (
	select distinct  contracts.service_id
    from contracts
    where year(date_started)=2018
) and services.service_id not in (
	select distinct contracts.service_id
	from contracts
	where year(date_started) = 2019
)
order by service_id;

-- 8.Hi???n th??? th??ng tin h??? t??n kh??ch h??ng c?? trong h??? th???ng, v???i y??u c???u h??? t??n kh??ng tr??ng nhau.

-- c??ch 1
select  distinct full_name
from customers;

-- c??ch 2
select *
from customers
group by full_name;

-- c??ch 3
select *
from customers t1
	left join customers t2 on t1.full_name = t2.full_name and t1.customer_id>t2.customer_id
where t2.full_name is null;

-- C??ch 4 d??ng UNION
select full_name, customer_id
from customers
union
select full_name,customer_id
from customers;

-- C??ch 5 d??ng exists
select *
 from customers t1
where not exists (
	select 1
    from customers t2
    where t1.full_name= t2.full_name and t1.customer_id > t2.customer_id
)
order by customer_id;

-- 9. Th???c hi???n th???ng k?? doanh thu theo th??ng, ngh??a l?? t????ng ???ng v???i m???i th??ng trong n??m 2019 th?? s??? c?? bao nhi??u kh??ch h??ng th???c hi???n ?????t ph??ng.

insert into contracts(employee_id, customer_id, service_id, date_started, date_finished, down_payment, total_payment)
value
	(7, 1, 2, '2019-11-01', '2019-11-20', 150000, 1600000),
	(2, 2, 2, '2019-12-08', '2019-12-28', 100000, 3000000);
    
select month(contracts.date_started) as month_booking, sum(total_payment) as total_payment_in_month, count(*) as no_of_booking
from contracts
where year(contracts.date_started) = 2019
group by month(contracts.date_started)
order by month(contracts.date_started);

-- 10. Hi???n th??? th??ng tin t????ng ???ng v???i t???ng H???p ?????ng th?? ???? s??? d???ng bao nhi??u D???ch v??? ??i k??m. 
-- K???t qu??? hi???n th??? bao g???m IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc,
-- SoLuongDichVuDiKem (???????c t??nh d???a tr??n vi???c sum c??c DichVuDiKem).

select contracts.contract_id, contracts.date_started, contracts.date_finished, contracts.down_payment, 
contract_detail.amount, count(*) as amount_of_accompaning_serivce
from contracts left join contract_detail on contract_detail.contract_id = contracts.contract_id
group by contract_id
order by amount_of_accompaning_serivce;

-- 11. Hi???n th??? th??ng tin c??c D???ch v??? ??i k??m ???? ???????c s??? d???ng b???i nh???ng Kh??ch h??ng c?? 
-- TenLoaiKhachHang l?? ???Diamond??? v?? c?? ?????a ch??? l?? ???Vinh??? ho???c ???Qu???ng Ng??i???.

select customers.customer_id, customers.address, customer_type.customer_type_name,
 accompanied_service.accompanied_service_name, accompanied_service.price
from customers 
	inner join customer_type on customers.customer_type_id = customer_type.customer_type_id
	left join contracts on contracts.customer_id = customers.customer_id
    inner join contract_detail on contract_detail.contract_id=contracts.contract_id
    inner join accompanied_service on accompanied_service.accompanied_service_id = contract_detail.accompanied_service_id
where customer_type.customer_type_name='Diamond' and customers.address in ('Quang Ngai', 'Vinh');

-- 12. Hi???n th??? th??ng tin IDHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang, TenDichVu, SoLuongDichVuDikem 
-- (???????c t??nh d???a tr??n vi???c sum s??? l?????ng c???a DichVuDiKem), TienDatCoc c???a t???t c??? c??c d???ch v??? ???? t???ng ???????c kh??ch h??ng ?????t v??o 3 
-- th??ng cu???i n??m 2019 nh??ng ch??a t???ng ???????c kh??ch h??ng ?????t v??o 6 th??ng ?????u n??m 2019.

select contracts.contract_id, employees.full_name as employee_name, customers.full_name as customer_name,
 customers.phone_number as customer_phone_number, services.service_name
, count(*) as amount_of_accompaning_serivce, contracts.date_started, contracts.down_payment
from employees
	inner join contracts on contracts.employee_id = employees.employee_id
    inner join customers on customers.customer_id=contracts.customer_id
    inner join services on services.service_id= contracts.service_id
    inner join contract_detail on contract_detail.contract_id= contracts.contract_id
where (month(date_started) between 9 and 12) and (year(date_started)=2019) and month(date_started) not in (
	select contract_id
    from contracts
    where month(date_started) between 1 and 6
)
group by contracts.contract_id
order by amount_of_accompaning_serivce;

-- 13.Hi???n th??? th??ng tin c??c D???ch v??? ??i k??m ???????c s??? d???ng nhi???u nh???t b???i c??c Kh??ch h??ng ???? ?????t ph??ng.
-- (L??u ?? l?? c?? th??? c?? nhi???u d???ch v??? c?? s??? l???n s??? d???ng nhi???u nh?? nhau).

set @max_of_use = (select max(max_of_ac) 
from (select accompanied_service.accompanied_service_id, count(accompanied_service.accompanied_service_id)as max_of_ac
from employees
	inner join contracts on contracts.employee_id = employees.employee_id
    inner join customers on customers.customer_id=contracts.customer_id
    inner join services on services.service_id= contracts.service_id
    inner join contract_detail on contract_detail.contract_id= contracts.contract_id
    inner join accompanied_service on accompanied_service.accompanied_service_id= contract_detail.accompanied_service_id
group by accompanied_service.accompanied_service_id) as nou);

select  @max_of_use;

set @min_of_use = (select min(minOfAc) 
from (select accompanied_service.accompanied_service_id, count(accompanied_service.accompanied_service_id)as minOfAc
from employees
	inner join contracts on contracts.employee_id=employees.employee_id
    inner join customers on customers.customer_id=contracts.customer_id
    inner join services on services.service_id= contracts.service_id
    inner join contract_detail on contract_detail.contract_id= contracts.contract_id
    inner join accompanied_service on accompanied_service.accompanied_service_id= contract_detail.accompanied_service_id
group by accompanied_service.accompanied_service_id) as nou);

select @min_of_use;

select contracts.contract_id, accompanied_service.accompanied_service_name, count(accompanied_service.accompanied_service_id)as no_of_using
from employees
	inner join contracts on contracts.employee_id=employees.employee_id
    inner join customers on customers.customer_id=contracts.customer_id
    inner join services on services.service_id= contracts.service_id
    inner join contract_detail on contract_detail.contract_id= contracts.contract_id
    inner join accompanied_service on accompanied_service.accompanied_service_id= contract_detail.accompanied_service_id
group by accompanied_service.accompanied_service_id
having no_of_using= @max_of_use
order by no_of_using;

select contracts.contract_id, accompanied_service.accompanied_service_name, count(accompanied_service.accompanied_service_id)as no_of_using
from employees
	inner join contracts on contracts.employee_id=employees.employee_id
    inner join customers on customers.customer_id=contracts.customer_id
    inner join services on services.service_id= contracts.service_id
    inner join contract_detail on contract_detail.contract_id= contracts.contract_id
    inner join accompanied_service on accompanied_service.accompanied_service_id= contract_detail.accompanied_service_id
group by accompanied_service.accompanied_service_id
having no_of_using= @min_of_use
order by no_of_using;

-- other way
select accompanied_service.accompanied_service_id, accompanied_service.accompanied_service_name, count(contract_detail.accompanied_service_id) as no_of_booking
from contract_detail
	inner join accompanied_service on accompanied_service.accompanied_service_id = contract_detail.accompanied_service_id
group by contract_detail.accompanied_service_id
having count(contract_detail.accompanied_service_id) =(select max(amount)
	from (select 
			count(accompanied_service_id) as no_of_booking
            from contract_detail
            group by accompanied_service_id) as no_of_use_accompanied
);

-- 14.Hi???n th??? th??ng tin t???t c??? c??c D???ch v??? ??i k??m ch??? m???i ???????c s??? d???ng m???t l???n duy nh???t. Th??ng tin hi???n th??? bao g???m
-- IdHopDong, TenLoaiDichVu, TenDichVuDiKem, SoLuongSuDung (???????c t??nh d???a tr??n vi???c count c??c IdDichVuDiKem).

select contracts.contract_id, accompanied_service.accompanied_service_name, count(accompanied_service.accompanied_service_id)as no_of_using
from employees
	inner join contracts on contracts.employee_id = employees.employee_id
    inner join customers on customers.customer_id = contracts.customer_id
    inner join services on services.service_id = contracts.service_id
    inner join contract_detail on contract_detail.contract_id = contracts.contract_id
    inner join accompanied_service on accompanied_service.accompanied_service_id= contract_detail.accompanied_service_id
group by accompanied_service.accompanied_service_id
having no_of_using=1
order by no_of_using;

--  15. Hi???n thi th??ng tin c???a t???t c??? nh??n vi??n bao g???m IDNhanVien, HoTen, TrinhDo, TenBoPhan,
-- SoDienThoai, DiaChi m???i ch??? l???p ???????c t???i ??a 3 h???p ?????ng t??? n??m 2018 ?????n 2019

select employees.employee_id, employees.full_name, positions.position_name, department.department_name, employees.phone_number, employees.address, count(contracts.contract_id) as no_of_contracts
from employees
	left join contracts on employees.employee_id = contracts.employee_id
    inner join positions on positions.position_id = employees.position_id
    inner join department on department.department_id = employees.department_id
where year(date_started) between 2018 and 2019
group by contracts.employee_id
having no_of_contracts <=3;

--  16. X??a nh???ng Nh??n vi??n ch??a t???ng l???p ???????c h???p ?????ng n??o t??? n??m 2017 ?????n n??m 2019
-- T???t ch??? ????? r??ng bu???c kh??a ngo???i

delete
 from employees
where employees.employee_id not in (
select employees.employee_id
from contracts
where year() between 2017 and 2019
);
SET FOREIGN_KEY_CHECKS=0;
select *
from employees;

-- 17. C???p nh???t th??ng tin nh???ng kh??ch h??ng c?? TenLoaiKhachHang t??? Platinium l??n Diamond, ch??? c???p nh???t
-- nh???ng kh??ch h??ng ???? t???ng ?????t ph??ng v???i t???ng Ti???n thanh to??n trong n??m 2019 l?? l???n h??n 10.000.000 VN??/500$

SET SQL_SAFE_UPDATES = 0;
select *
from customer_type;
update customers
set customer_type_id=(
	select customer_type_id
    from customer_type
    where customer_type_name='Diamond'
);
select *
from customers
where customer_type_id = (
	select customer_type_id
    from customer_type
    where customer_type_name='Platinium'
)
and customer_type_id in (
	select customer_id
    from contracts 
    group by customer_id
    having sum(total_payment) > 10000000
);
SET SQL_SAFE_UPDATES = 1;

-- 18. X??a nh???ng kh??ch h??ng c?? h???p ?????ng tr?????c n??m 2016 (ch?? ?? r??ng bu???c gi???a c??c b???ng)

SET FOREIGN_KEY_CHECKS = 0;
delete 
from customers
where customer_id in (
	select customer_id
    from contracts
    where year(date_started) <2016
);
SET FOREIGN_KEY_CHECKS=1;

-- 19. C???p nh???t gi?? cho c??c D???ch v??? ??i k??m ???????c s??? d???ng tr??n 10 l???n trong n??m 2019 l??n g???p ????i

SET SQL_SAFE_UPDATES = 0;
update accompanied_service
set price= price*2
where accompanied_service_id in (
	select accompanied_service_id
    from contract_detail
		inner join contracts on contracts.contract_id=contract_detail.contract_id
    group by contract_detail.accompanied_service_id
    having count(accompanied_service_id)>10
);
SET SQL_SAFE_UPDATES = 1;
select *
from service_type;


-- 20. Hi???n th??? th??ng tin c???a t???t c??? c??c Nh??n vi??n v?? Kh??ch h??ng c?? trong h??? th???ng,
-- th??ng tin hi???n th??? bao g???m ID (IDNhanVien, IDKhachHang), HoTen, Email, SoDienThoai, NgaySinh, DiaChi.

select employee_id as id, full_name, email, phone_number, date_of_birth, address
from employees
union all select customer_id as id, full_name, email, phone_number, date_of_birth, address
from customers;