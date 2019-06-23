-- list details of each employee
-- emp_no, last_name, first_name,
-- gender, salary
SELECT e.emp_no,
e.last_name,
e.first_name,
e.gender,
s.salary
FROM employees as e
INNER JOIN salaries AS s
ON e.emp_no = s.emp_no
ORDER BY emp_no;

-- list employees hired in 1986
SELECT emp_no,
first_name,
last_name,
hire_date
FROM employees 
WHERE hire_date BETWEEN to_date('1986-01-01','YYYY-MM-DD')
AND to_date('1986-12-31','YYYY-MM-DD')
ORDER BY emp_no;

-- manager of each dept w/ following:
-- dept_no, dept_name, emp_no, last_name,
-- first_name, from_date (as employee),
-- to_date (as employee)
SELECT dm.dept_no,
d.dept_name,
dm.emp_no,
e.last_name,
e.first_name,
dm.from_date,
dm.to_date
FROM dept_manager AS dm
INNER JOIN departments AS d
ON d.dept_no = dm.dept_no
-- INNER JOIN dept_emp AS de
-- ON dm.emp_no = de.emp_no
INNER JOIN employees AS e
ON dm.emp_no = e.emp_no
ORDER BY dept_no;

-- department of each employee w/ following:
-- emp_no, last_name, first_name, dept_name
SELECT de.emp_no,
e.last_name,
e.first_name,
d.dept_name
FROM dept_emp AS de
INNER JOIN employees AS e
ON de.emp_no = e.emp_no
INNER JOIN departments AS d
ON de.dept_no = d.dept_no
ORDER BY emp_no;

-- list all employees w/ first name "Hercules"
-- and last name starting w/ "B"
SELECT e.first_name,
e.last_name
FROM employees AS e
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'
ORDER BY emp_no;

-- all employees in "Sales" dept w/ following:
-- emp_no, last_name, first_name, dept_name
SELECT de.emp_no,
e.last_name,
e.first_name,
d.dept_name
FROM dept_emp AS de
INNER JOIN employees AS e
ON de.emp_no = e.emp_no
INNER JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
ORDER BY emp_no;

-- in DESC order, frequency count of employee
-- last names, i.e. how many employees share
-- each last name
SELECT COUNT(last_name) AS "Count Of Last Name",
last_name
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;