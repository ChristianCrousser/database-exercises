USE employees;
SELECT * FROM employees
WHERE gender = 'M' AND (
first_name = 'Irena'
OR first_name = 'Maya'
OR first_name = 'Vidya'
);
SELECT * FROM employees
WHERE last_name LIKE 'E%'
OR last_name LIKE '%E';
SELECT * FROM employees
WHERE last_name LIKE '%E'
AND last_name LIKE 'E#';
SELECT * FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31';
SELECT * FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
AND birth_date LIKE '%-12-25';
SELECT * FROM employees
WHERE birth_date LIKE '%-12-25';
SELECT * FROM employees
WHERE last_name LIKE '%q%';
SELECT * FROM employees
WHERE last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%';
