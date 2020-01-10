USE employees;

SELECT * FROM dept_manager;
# Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.

SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name
FROM employees as e
         JOIN dept_manager AS dm
              ON dm.emp_no = e.emp_no
         JOIN departments AS d
              ON d.dept_no = dm.dept_no
WHERE dm.to_date > now()
ORDER BY dept_name;


SELECT CONCAT(e.first_name, ' ', e.last_name) AS 'full name', d.dept_name
FROM employees as e
         JOIN dept_manager as dm
              ON dm.emp_no = e.emp_no
         JOIN departments as d
              ON d.dept_no = dm.dept_no
WHERE dm.to_date > now() AND gender = 'F'
ORDER BY dept_name;

SELECT t.title, COUNT(*) AS 'count'
FROM employees as e
         JOIN titles as t
              ON t.emp_no = e.emp_no
         JOIN dept_emp as de
              ON de.emp_no = e.emp_no
         JOIN departments as d
              ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Customer Service' AND de.to_date > now() AND t.to_date > now()
GROUP BY t.title;


#Find the current salary of all current managers.
SELECT * FROM dept_manager;
SELECT CONCAT(e.first_name, ' ', e.last_name) AS 'Manager\''s Name', s.salary
FROM salaries as s
         JOIN dept_emp as de
              ON s.emp_no = de.emp_no
         JOIN employees as e
            ON e.emp_no = s.emp_no
WHERE s.to_date > now() AND de.to_date > now()
ORDER BY s.salary DESC, CONCAT(e.first_name, ' ', e.last_name);



SELECT CONCAT(e.last_name, ', ', e.first_name) AS 'Current Employee', d.dept_name AS 'Department', CONCAT(dme.last_name, ', ', dme.first_name) AS 'Employee Manager'
FROM departments AS d
    JOIN dept_manager AS dm
        ON d.dept_no = dm.dept_no
    JOIN dept_emp AS de
        ON d.dept_no = de.dept_no
    JOIN employees AS e
        ON de.emp_no = e.emp_no
    JOIN employees AS dme
        ON dm.emp_no = e.emp_no
WHERE dm.to_date > now() AND de.to_date > now()
ORDER BY 'Department';
