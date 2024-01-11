-- Data  1
--for every employee
SELECT e.emp_id, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
JOIN salaries AS s
ON e.emp_id = s.emp_id;

-- Data  2
-- hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%/%/1986';


-- Data  3
-- Managers
SELECT dm.dept_num, d.dept_name, e.emp_id, e.last_name, e.first_name
FROM deptmanager AS dm
JOIN departments AS d
ON dm.dept_num = d.dept_num
JOIN employees AS e
ON e.emp_id = dm.emp_id;

-- Data  4
-- Employees and  departments
SELECT de.dept_num, de.emp_id, e.last_name, e.first_name, d.dept_name
FROM deptemployees AS de
JOIN employees AS e
ON de.emp_id = e.emp_id
JOIN departments AS d
ON de.dept_num = d.dept_num;

-- Data  5
--named 'Hercules B.'
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- Data  6
-- Sales 
SELECT emp_id, last_name, first_name
FROM employees
WHERE emp_id IN (
	SELECT emp_id
	FROM deptemployees
	WHERE dept_num IN (
		SELECT dept_num
		FROM departments
		WHERE dept_name = 'Sales'));

-- Data  7
-- Sales and Development Employees
SELECT e.emp_id, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN deptemployees AS de
ON e.emp_id = de.emp_id
JOIN departments AS d
ON d.dept_num = de.dept_num
WHERE d.dept_name
IN ('Sales', 'Development');

-- Data  8
-- Frequency Counts
SELECT last_name, COUNT(last_name) as last_name_count
FROM employees
GROUP BY last_name
ORDER BY last_name_count DESC;