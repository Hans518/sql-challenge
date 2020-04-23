--Create tables for Pewlett Hackard
CREATE TABLE department(
	dept_no VARCHAR PRIMARY KEY NOT NULL,
	dept_name VARCHAR(30) NOT NULL
);

CREATE TABLE dept_emp(
	team_change SERIAL PRIMARY KEY, 
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR(30) NOT NULL,
	from_date DATE,
	to_date DATE
);

CREATE TABLE dept_manager(
	boss_change SERIAL PRIMARY KEY,
	dept_no VARCHAR(30) NOT NULL,
	emp_no INTEGER NOT NULL,
	from_date DATE,
	to_date DATE
);

CREATE TABLE employees(
	emp_no INTEGER PRIMARY KEY NOT NULL,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	birth_date VARCHAR(30),
	gender VARCHAR(10),
	hire_date DATE
); 

CREATE TABLE salaries(
	emp_no INTEGER NOT NULL,
	salary INTEGER,
	from_date DATE,
	to_date DATE
);

CREATE TABLE titles(
	emp_no INTEGER PRIMARY KEY NOT NULL,
	title VARCHAR(30),
	from_date DATE,
	to_date DATE
);

DROP TABLE department
DROP TABLE dept_emp
DROP TABLE dept_manager
DROP TABLE employees
DROP TABLE salaries
DROP TABLE titles


