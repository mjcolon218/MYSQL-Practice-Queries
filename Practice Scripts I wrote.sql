SELECT 
    *
FROM
    dept_manager_dup
ORDER BY dept_no;

SELECT 
    employees.emp_no,
    employees.first_name,
    employees.last_name,
    dept_manager.dept_no,
    employees.hire_date
    from employees
    join dept_manager on employees.emp_no=dept_manager.emp_no
    order by employees.last_name
