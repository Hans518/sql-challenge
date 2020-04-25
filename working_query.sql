SELECT * FROM salaries;

-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no, e.first_name, e.last_name, e.gender, e.hire_date, s.salary
FROM employees AS e
INNER JOIN salaries AS s
ON e.emp_no = s.emp_no
ORDER BY e.emp_no;

-- 2. List employees who were hired in 1986.
SELECT * FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY hire_date;

-- 3. List the manager of each department with the following
--    information. 
--   1. department number
--   2. department name
--   3. employee number
--   4. last name
--   5. first name 
--   6. start date
--   7. end date 

SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, 
        e.first_name, dm.from_date, dm.to_date
FROM department AS d
INNER JOIN dept_manager AS dm
ON d.dept_no=dm.dept_no
INNER JOIN employees AS e 
ON e.emp_no=dm.emp_no

-- 4. List the department of each employee with the following 
--    information: 
--    employee number, last name, first name, and department name.

SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e 
INNER JOIN dept_emp AS de 
ON e.emp_no=de.emp_no
INNER JOIN department AS d 
ON d.dept_no=de.dept_no;

-- 5. List all employees whose first name is "Hercules" and last
--    names begin with "B".

SELECT emp_no, first_name, last_name, birth_date, gender, hire_date
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their 
--    employee number, last name, first name, and department number

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name, de.dept_no
FROM employees AS e
INNER JOIN dept_emp AS de 
ON e.emp_no=de.emp_no
INNER JOIN department AS d
ON d.dept_no=de.dept_no
WHERE d.dept_no = 'd007';

-- 7. List all employees in the Sales and Development departments, 
--    including their employee number, last name, first name, and 
--    department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de 
ON e.emp_no=de.emp_no
INNER JOIN department AS d
ON d.dept_no=de.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, 
--    i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name)
FROM employees 
GROUP BY last_name
ORDER BY count desc;

