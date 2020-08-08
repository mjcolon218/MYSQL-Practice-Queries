USE employees;
DROP FUNCTION IF EXISTS f_emp_info;

DELIMITER $$
CREATE FUNCTION f_emp_info(p_first_name VARCHAR(255),p_last_name VARCHAR(255))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
DECLARE v_max_from_date DATE;
DECLARE v_salary DECIMAL(10,2);
SELECT 
    MAX(salaries.from_date)
INTO v_max_from_date FROM
    employees
        JOIN
    salaries ON employees.emp_no = salaries.emp_no
WHERE
    employees.first_name = p_first_name
        AND employees.last_name = p_last_name;
SELECT 
    salaries.salary
INTO v_salary FROM
    employees
        JOIN
    salaries ON employees.emp_no = salaries.emp_no
WHERE
    employees.first_name = p_first_name
        AND employees.last_name = p_last_name
        AND salaries.from_date = v_max_from_date;
RETURN v_salary;
END$$
DELIMITER ;

SELECT f_emp_info('Aruna','Journel');