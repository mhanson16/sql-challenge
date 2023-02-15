-- 1.) List the employee number, last name, first name, sex, and salary of each employee.
SELECT 
		emp_no,
		last_name,
		first_name,
		sex,
		salary
    FROM
        "Employees"
JOIN "Salaries"
USING (emp_no)
;

-- 2.) List the first name, last name, and hire date for the employees who were hired in 1986.

--Adding hire_year column to Employees table with NULL values
ALTER TABLE "Employees"
ADD hire_year varchar(10) NULL;

-- Adding in values to hire_year column from hire_date column
UPDATE "Employees"
SET hire_year = date_part('year', hire_date);

-- The final table of 1986 employees
SELECT 
		first_name,
		last_name,
		hire_date
FROM
        "Employees"
WHERE 	hire_year = '1986'
;

-- 3.) List the manager of each department along with their department number, 
--     department name, employee number, last name, and first name.
SELECT 
		"DepartmentManager".dept_no,
		"Departments".dept_name,
		"Employees".emp_no,
		"Employees".last_name,
		"Employees".first_name
		
FROM
        "Employees"
INNER JOIN  "DepartmentManager" ON "DepartmentManager".emp_no = "Employees".emp_no
INNER JOIN "Departments" ON "Departments".dept_no = "DepartmentManager".dept_no

;

-- 4.) List the department number for each employee along with that employee’s employee number,
--     last name, first name, and department name.

SELECT 
		"DepartmentEmployees".dept_no,
		"Employees".emp_no,
		"Employees".last_name,
		"Employees".first_name,
		"Departments".dept_name
		
FROM
        "Employees"
INNER JOIN  "DepartmentEmployees" ON "DepartmentEmployees".emp_no = "Employees".emp_no
INNER JOIN "Departments" ON "Departments".dept_no = "DepartmentEmployees".dept_no

;

-- 5.) List first name, last name, and sex of each employee whose first name is Hercules 
--    and whose last name begins with the letter B.
SELECT 
		first_name,
		last_name,
		sex
FROM
        "Employees"
WHERE 	first_name = 'Hercules'
AND 	last_name LIKE 'B%'
;

-- 6.) List each employee in the Sales department, including their employee number, 
--     last name, and first name.

SELECT 
		"Employees".emp_no,
		"Employees".last_name,
		"Employees".first_name,
		"Departments".dept_name
		
FROM
        "Employees"
INNER JOIN  "DepartmentEmployees" ON "DepartmentEmployees".emp_no = "Employees".emp_no
INNER JOIN "Departments" ON "Departments".dept_no = "DepartmentEmployees".dept_no

WHERE dept_name = 'Sales'
;

-- 7.) List each employee in the Sales and Development departments, including their employee number, 
--     last name, first name, and department name.

SELECT 
		"Employees".emp_no,
		"Employees".last_name,
		"Employees".first_name,
		"Departments".dept_name
		
FROM
        "Employees"
INNER JOIN  "DepartmentEmployees" ON "DepartmentEmployees".emp_no = "Employees".emp_no
INNER JOIN "Departments" ON "Departments".dept_no = "DepartmentEmployees".dept_no

WHERE dept_name = 'Sales'
OR dept_name = 'Development'
;

-- 8.) List the frequency counts, in descending order, of all the employee last names 
--     (that is, how many employees share each last name).

SELECT 
		last_name, COUNT(last_name)AS Frequency
FROM
		"Employees"
GROUP BY last_name
ORDER BY COUNT(last_name) DESC
;
		