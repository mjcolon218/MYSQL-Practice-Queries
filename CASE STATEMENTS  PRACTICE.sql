SELECT 
    employees.emp_no,
    employees.first_name,
    employees.last_name,
    CASE
        WHEN dept_manager.emp_no IS NOT NULL THEN 'Manager'
        ELSE 'Employee'
    END AS is_manager
FROM
    employees
        LEFT JOIN
    dept_manager ON dept_manager.emp_no = employees.emp_no
WHERE
    employees.emp_no > 109990;
    
    select employees.emp_no,employees.first_name,employees.last_name,
	
    MAX(salaries.salary)- MIN(salaries.salary)AS salary_difference,
    case
    when max(salaries.salary)-min(salaries.salary)>30000 then 'Salary was raised by more than 30,000'
    else 'salary wasnt raised by 30,000'
    end as salary_increase
    from salaries join employees on employees.emp_no =salaries.emp_no
    group by employees.emp_no;
    
    SELECT 
    employees.emp_no,
    employees.first_name,
    employees.last_name,
    CASE
        WHEN MAX(dept_emp.to_date) > SYSDATE() THEN 'is still employed'
        ELSE 'Not  an employee anymore'
    END AS current_employee
FROM
    employees
        JOIN
    dept_emp ON dept_emp.emp_no = employees.emp_no
GROUP BY dept_emp.emp_no
LIMIT 100;