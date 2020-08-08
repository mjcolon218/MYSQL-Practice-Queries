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
    *
FROM
    departments_dup;
SELECT 
    dept_manager_dup.dept_no,
    dept_manager_dup.emp_no,
    departments_dup.dept_name
FROM
    dept_manager_dup
        INNER JOIN
    departments_dup ON dept_manager_dup.dept_no = departments_dup.dept_no
ORDER BY dept_manager_dup.dept_no;
SELECT 
    dept_manager.emp_no,
    dept_manager.dept_no,
    employees.first_name,
    employees.last_name,
    employees.hire_date
FROM
    dept_manager
        INNER JOIN
    employees ON dept_manager.emp_no = employees.emp_no
ORDER BY dept_manager.dept_no;

SELECT 
    employees.emp_no,
    employees.first_name,
    employees.last_name,
    dept_manager.dept_no,
    dept_manager.from_date
FROM
    employees
        LEFT JOIN
    dept_manager ON employees.emp_no = dept_manager.emp_no
WHERE
    employees.last_name = 'Markovitch'
ORDER BY dept_manager.dept_no DESC , employees.emp_no;
SELECT 
    dept_manager.emp_no,
    dept_manager.dept_no,
    employees.hire_date,
    employees.first_name,
    employees.last_name
FROM
    dept_manager
        JOIN
    employees ON employees.emp_no = dept_manager.emp_no
ORDER BY employees.last_name ;

SELECT 
    employees.first_name,
    employees.last_name,
    employees.hire_date,
    titles.title
FROM
    employees
        JOIN
    titles ON employees.emp_no = titles.emp_no
WHERE
    employees.first_name = 'Margareta'
        AND employees.last_name = 'Markovitch';
        SELECT 
    dept_manager.*, departments.*
FROM
    departments
        CROSS JOIN
    dept_manager
WHERE
    departments.dept_no = 'd009'
GROUP BY departments.dept_name;

SELECT 
    departments.*, employees.*
FROM
    employees
        CROSS JOIN
    departments
WHERE
    employees.emp_no < 10011
ORDER BY employees.emp_no , departments.dept_name;

SELECT 
    employees.gender, AVG(salaries.salary) AS Average_Salary
FROM
    employees
        JOIN
    salaries ON employees.emp_no = salaries.emp_no
GROUP BY gender;
SELECT 
    employees.first_name,
    employees.last_name,
    employees.hire_date,
    titles.title,
    dept_manager.from_date,
    departments.dept_name
FROM
    employees
        JOIN
    dept_manager ON employees.emp_no = dept_manager.emp_no
        JOIN
    departments ON dept_manager.dept_no = departments.dept_no
        JOIN
    titles ON employees.emp_no = titles.emp_no
WHERE
    titles.title = 'Manager'
ORDER BY employees.emp_no;
SELECT 
    employees.gender, COUNT(dept_manager.emp_no) as Employee_Count
FROM
    employees
        JOIN
    dept_manager ON employees.emp_no = dept_manager.emp_no
GROUP BY gender;
SELECT *
FROM
    dept_manager
WHERE
   dept_manager.emp_no IN (SELECT 
            employees.emp_no
        FROM
            employees
        WHERE
            hire_date BETWEEN '1990-01-01' AND '1995-01-01');
            SELECT 
    *
FROM
    employees
WHERE
    EXISTS( SELECT 
            *
        FROM
            titles
        WHERE
            titles.emp_no = employees.emp_no
                AND titles.title = 'Assistant Engineer')
