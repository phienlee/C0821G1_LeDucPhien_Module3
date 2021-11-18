use quan_ly_sinh_vien;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select *
from `subject`
order by credit desc
limit 1;
 
 -- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select s.student_id,s.student_name,sub.sub_name,m.mark
from student s
inner join mark m on s.student_id = m.student_id
inner join `subject` sub on m.sub_id = sub.sub_id
order by m.mark desc
limit 1;

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select s.student_id,s.student_name,avg(m.mark) as 'Average'
from student s
inner join mark m on s.student_id = m.student_id
inner join `subject` sub on m.sub_id = sub.sub_id
group by s.student_id
order by 'Average';