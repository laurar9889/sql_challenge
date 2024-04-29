-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/paPbon
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

--Create Departments table with 1 primary key
	--Drop table if already exists
	DROP TABLE IF EXISTS "Departments" CASCADE;

CREATE TABLE "Departments" (
    "dept_no" VARCHAR(4)   NOT NULL,
    "dept_name" VARCHAR(30)   NOT NULL,
    PRIMARY KEY ("dept_no")
);

--Create Departments Employee table with 1 primary key
	--Drop table if already exists
	--Create a composed primary keys when 2 columns are not unique
	DROP TABLE IF EXISTS "Dept_emp" CASCADE;
CREATE TABLE "Dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(4) NOT NULL REFERENCES "Departments" ("dept_no"),
	"emp_title_id" VARCHAR(5) NOT NULL,
	FOREIGN KEY ("emp_no", "emp_title_id") REFERENCES "Employees"("emp_no","emp_title_id"),
    PRIMARY KEY ("emp_no","dept_no")
);
	--Drop the Composed primary key
	ALTER TABLE "Dept_emp" DROP column "emp_title_id";


--Create Departments Manager table with 2 primary key
	--Drop table if already exists 
	--Create a composed primary keys when 2 columns are not unique
	DROP TABLE IF EXISTS "Dept_manager" CASCADE;
CREATE TABLE "Dept_manager" (
    "dept_no" VARCHAR(4)   NOT NULL REFERENCES "Departments"("dept_no"),
    "emp_no" INT   NOT NULL,
	"emp_title_id" VARCHAR(5) NOT NULL,
	FOREIGN KEY ("emp_no", "emp_title_id") REFERENCES "Employees"("emp_no","emp_title_id"),
 	PRIMARY KEY ("dept_no","emp_no")
	);
	--Drop the Composed primary key
	ALTER TABLE "Dept_manager" DROP column "emp_title_id";


--Create Title table with 2 primary key
	--Drop table if already exists 
	--Create a composed primary keys when 2 columns are not unique
	DROP TABLE IF EXISTS "Titles";
CREATE TABLE "Titles" (
    "emp_title_id" VARCHAR(5)   NOT NULL,
    "title" VARCHAR(30)   NOT NULL,
	"emp_no" INT NOT NULL,
	FOREIGN KEY("emp_no","emp_title_id") REFERENCES "Employees" ("emp_no","emp_title_id"),
    PRIMARY KEY ("emp_title_id","title")
);
	--Drop the Composed primary key
	ALTER TABLE "Titles" DROP column "emp_no";



--Create Salaries table with 2 primary keys
	--Drop table if already exists
	DROP TABLE IF EXISTS "Salaries" CASCADE;

CREATE TABLE "Salaries" (
    "emp_no" INT NOT NULL,
	"emp_title_id" VARCHAR (5) NOT NULL,
    "salary" INT   NOT NULL,
	FOREIGN KEY ("emp_no", "emp_title_id") REFERENCES "Employees"("emp_no", "emp_title_id"),
	PRIMARY KEY ("emp_no")
);
	--Drop the Composed primary key
	ALTER TABLE "Salaries" DROP column "emp_title_id";


--Create Employee table with 2 primary keys
	--Drop table if already exists
	DROP TABLE IF EXISTS "Employees" CASCADE;

CREATE TABLE "Employees" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR(5)   NOT NULL,
    "birth_date" VARCHAR(10) NOT NULL,
    "first_name" VARCHAR(50)   NOT NULL,
    "last_name" VARCHAR(50)   NOT NULL,
    "sex" VARCHAR(1)   NOT NULL,
    "hire_date" VARCHAR(10)   NOT NULL,
    PRIMARY KEY ("emp_no", "emp_title_id")
	);
