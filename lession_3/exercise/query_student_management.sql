use quan_ly_sinh_vien;

select *
from student
where student_name like ('h%');

select *
from class 
where month(start_date) = 12;

select *
from `subject`
where ( 3 <= credit and credit <= 5 );

SET SQL_SAFE_UPDATES = 0;

UPDATE student 
SET class_id = 2
where student_name = 'Hung';

SET SQL_SAFE_UPDATES = 1;

select s.student_name, sub.sub_name, m.mark
from student s join  mark m  on s.student_id = m.student_id
join `subject` sub on sub.sub_id = m.sub_id
order by m.mark desc

