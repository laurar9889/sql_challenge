--1.  LIST OF EMPLOYEE NUMBER, LAS & FIRST NAME, SEX, SALARY
SELECT "first_name", "last_name", "sex", "hire_date"
FROM "Employees"
JOIN "Salaries"
ON "Employees"."emp_no" = "Salaries"."emp_no";

--2. LIST FIRST AND LAST NAME, HIRE DATE FOR EMPLOYEES HIRED IN 1986
--Source: https://www.postgresqltutorial.com/postgresql-date-functions/postgresql-to_date/
-- change hire date and birth date format, to date

CREATE VIEW employee_view AS 
SELECT *, TO_DATE ("hire_date", 'MM/DD/YYYY') AS hire_date_format,
TO_DATE ("birth_date", 'MM/DD/YYYY') AS birth_date_format
FROM "Employees";

SELECT * FROM employee_view;

--2. LIST FIRST AND LAST NAME, HIRE DATE FOR EMPLOYEES HIRED IN 1986
SELECT first_name, last_name, hire_date_format
FROM employee_view
WHERE hire_date_format > '1986-1-1' AND hire_date_format <'1987-1-1';

--3. list manager of each department along with their department number, department name,
--employee number, last name, first name.
SELECT "Dept_manager"."dept_no", "Departments"."dept_name", "Employees"."emp_no", "Employees"."last_name", "Employees"."first_name"
FROM "Dept_manager"
JOIN "Employees"
ON "Dept_manager"."emp_no" = "Employees"."emp_no"
JOIN "Departments"
ON "Dept_manager"."dept_no" = "Departments"."dept_no";


--4. List department number for each employee, employee #, last name andfirst name, department name.
SELECT "Dept_emp"."dept_no", "Employees"."emp_title_id", "Employees"."last_name", "Employees"."first_name", "Departments"."dept_name"
FROM "Employees"
JOIN "Dept_emp"
ON "Employees"."emp_no" = "Dept_emp"."emp_no"
JOIN "Departments"
ON "Dept_emp"."dept_no" = "Departments"."dept_no";