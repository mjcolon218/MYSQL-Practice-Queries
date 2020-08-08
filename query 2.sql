drop table if exists dept_manager_dup;
CREATE TABLE dept_manager_dup (
    emp_no INT(11) NOT NULL,
    dept_no CHAR(4) NULL,
    from_date DATE NOT NULL,
    to_date DATE NULL
);
insert into dept_manager_dup
select * from dept_manager;

insert into dept_manager_dup(emp_no,from_date)
values		(999904, '2017-01-01'),
			(999905,	'2017-01-01'),
            (999906, '2017-01-01'),
            (999907, '2017-01-01');
	DELETE FROM dept_manager_dup 
WHERE
    dept_no = 'd001';
    