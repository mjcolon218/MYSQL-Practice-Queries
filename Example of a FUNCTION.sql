USE employees; 
DROP FUNCTION  IF EXISTS f_emp_avg_salary;

DELIMITER $$
CREATE FUNCTION f_emp_avg_salary(p_emp_no INTEGER) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN

DECLARE v_avg_salary DECIMAL(10,2);
SELECT 
    AVG(salaries.salary)
INTO v_avg_salary FROM
    employees
        JOIN
    salaries ON employees.emp_no = salaries.emp_no
WHERE
    employees.emp_no = p_emp_no;
RETURN v_avg_salary;
END$$
SELECT f_emp_avg_salary(11300);
