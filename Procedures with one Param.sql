USE employees;
drop procedure if exists emp_salary;
 DELIMITER $$
 use employees $$
 
 create procedure emp_salary(in p_emp_no integer)
 BEGIN
 select employees.first_name,employees.last_name,salaries.salary
 from employees 
 join salaries on employees.emp_no = salaries.emp_no
 where employees.emp_no = p_emp_no;
 end$$
 DELIMITER ;
 call emp_salary(10003)