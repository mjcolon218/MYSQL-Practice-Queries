(SELECT 
    employees.emp_no AS Employee_ID,
    min(dept_emp.dept_no) AS department_code,
    (SELECT 
            emp_no
        FROM
            dept_manager
        WHERE
            emp_no = 110022) AS Manager_ID
FROM
    employees
        JOIN
    dept_emp ON employees.emp_no = dept_emp.emp_no
WHERE
    employees.emp_no <= 10020
GROUP BY employees.emp_no
ORDER BY employees.emp_no)