USE employees;

SELECT CONCAT(employees.first_name, ' ', last_name) AS 'names',
       employees.hire_date                          AS 'hire date'
FROM employees
WHERE hire_date IN (
    SELECT hire_date
    FROM employees
    WHERE emp_no = '101010'
);


SELECT title
FROM titles
WHERE emp_no IN (
    SELECT emp_no
    FROM employees
    WHERE first_name = 'Aamod'
);

SELECT CONCAT(first_name, ' ', last_name) AS 'name'
FROM employees
WHERE gender = 'F'
  AND emp_no IN (
    SELECT emp_no
    FROM dept_manager
    WHERE CURDATE() < dept_manager.to_date
);

### BONUS TIME ###
# Find all the department names that currently have female managers.

SELECT dept_name
FROM departments
WHERE dept_no IN (
    SELECT dept_no
    FROM dept_manager
    WHERE emp_no IN (
        SELECT emp_no
        FROM employees
        WHERE gender = 'F'
    )
      AND to_date > now()
);

#Find the first and last name of the employee with the highest salary.

SELECT CONCAT(first_name, ' ', last_name) AS 'name'
FROM employees
WHERE emp_no = (
    SELECT emp_no
    FROM salaries
    ORDER BY salary DESC
    LIMIT 1
);


SELECT CONCAT(
               (SELECT MAX(salary)
                FROM salaries
                WHERE emp_no = (
                    SELECT emp_no
                    FROM employees
                    GROUP BY emp_no
                    ORDER BY emp_no
                    LIMIT 1
                )
               ), ' ',
               (SELECT MAX(salary)
                FROM salaries
                WHERE emp_no = (
                    SELECT emp_no
                    FROM employees
                    GROUP BY emp_no
                    ORDER BY emp_no
                    LIMIT 1 OFFSET 1
                )
               )
           );


SELECT CONCAT(first_name, ' ', last_name) AS 'Current Manager:'
FROM employees
WHERE emp_no = (
        SELECT emp_no
        FROM dept_manager
        WHERE to_date > now() AND dept_no = (
            SELECT dept_no
            FROM departments
            WHERE dept_name = 'Sales'
              )
    );


SELECT CONCAT(first_name, ' ', last_name) AS 'Senior Engineers'
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_emp
    WHERE dept_no IN (
        SELECT dept_no
        FROM departments
        WHERE dept_name = 'Customer Service' AND emp_no IN (
                SELECT emp_no
                FROM titles
                WHERE title = 'Senior Engineer'
                )
            )
        );

