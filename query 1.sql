drop table if exists departments_dup;
create table departments_dup
(
dept_no char(4)null,
dept_name varchar(40)null
);
insert into departments_dup
(
dept_no,
dept_name
)select *
from departments;
insert into departments_dup(dept_name)
values ('Public Relations');
delete  from departments_dup
where
dept_no='d002';
insert into departments_dup(dept_no)values('d010'),
('d011');
SELECT 
    dept_name
FROM
    departments_dup
