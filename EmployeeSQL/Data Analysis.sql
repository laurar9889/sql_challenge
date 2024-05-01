
--1.  List employee number, last and first name, sex and salary.

SELECT "Employees".emp_no, "Employees".first_name, "Employees".last_name, "Employees".sex, "Salaries".salary
FROM "Employees"
JOIN "Salaries"
ON "Employees".emp_no = "Salaries".emp_no;

--2. List first and last name,  hire date for employees hired in 1986
--Source: https://www.postgresqltutorial.com/postgresql-date-functions/postgresql-to_date/
-- change hire date and birth date format, to date (with the help of tutor Brandon Wong)
-- 2.A. create a view with the 2 additional columns for hire date and birth date.
DROP VIEW IF EXISTS employee_view;

CREATE VIEW employee_view AS 
SELECT *, TO_DATE ("hire_date", 'MM/DD/YYYY') AS hire_date_format,
TO_DATE ("birth_date", 'MM/DD/YYYY') AS birth_date_format
FROM "Employees";

SELECT * FROM employee_view;

--2.B. List first and last name, hire date for emplyees hired in 1986
SELECT first_name, last_name, hire_date_format
FROM employee_view
WHERE hire_date_format >= '1986-1-1' AND hire_date_format <'1987-1-1';

--3. List manager of each department along with their department number, department name,
--employee number, last name, first name.
SELECT "Dept_manager"."dept_no", "Departments"."dept_name", "Employees"."emp_no", "Employees"."last_name", "Employees"."first_name"
FROM "Dept_manager"
JOIN "Employees"
ON "Dept_manager"."emp_no" = "Employees"."emp_no"
JOIN "Departments"
ON "Dept_manager"."dept_no" = "Departments"."dept_no";

--4. List department number for each employee, employee #, last name and first name, department name.
SELECT "Dept_emp"."dept_no", "Employees"."emp_no", "Employees"."last_name", "Employees"."first_name", "Departments"."dept_name"
FROM "Employees"
JOIN "Dept_emp"
ON "Employees"."emp_no" = "Dept_emp"."emp_no"
JOIN "Departments"
ON "Dept_emp"."dept_no" = "Departments"."dept_no";

--5. List first name, last mane, sex of each employee whose first name is Hercules and last name begins with "B" 
SELECT first_name, last_name, sex
FROM "Employees"
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6. List each employee in the Sales Department, including employee #, last and first name, and department name.
SELECT "Dept_emp".dept_no, "Employees".emp_no, "Employees".last_name, "Employees".first_name, "Departments".dept_name
FROM "Employees"
JOIN "Dept_emp"
ON "Employees".emp_no = "Dept_emp".emp_no
JOIN "Departments"
ON "Dept_emp".dept_no = "Departments".dept_no
WHERE "Departments".dept_name = 'Sales';

--7. List each employee in the Sales and Development departments, including employee #, last and first name, and department name.
SELECT "Dept_emp".dept_no, "Employees".emp_no, "Employees".last_name, "Employees".first_name, "Departments".dept_name
FROM "Employees"
JOIN "Dept_emp"
ON "Employees".emp_no = "Dept_emp".emp_no
JOIN "Departments"
ON "Dept_emp".dept_no = "Departments".dept_no
WHERE "Departments".dept_name = 'Sales' OR "Departments".dept_name ='Development';

--8. List frecuency counts, descending order of all employee last names.
--Source: https://www.w3resource.com/sql/aggregate-functions/count-with-group-by.php
SELECT "Employees".last_name, COUNT(*)
FROM "Employees"
GROUP BY "Employees".last_name
ORDER BY COUNT(*) DESC;


