--Create tables for Pewlett Hackard
CREATE TABLE department(
	dept_no VARCHAR PRIMARY KEY NOT NULL,
	dept_name VARCHAR(30) NOT NULL
);

CREATE TABLE dept_emp( 
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR(30) NOT NULL,
	from_date DATE,
	to_date DATE,
	id SERIAL PRIMARY KEY,
	FOREIGN KEY (dept_no) REFERENCES department(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


CREATE TABLE employees(
	emp_no INTEGER PRIMARY KEY NOT NULL,
	birth_date VARCHAR(30),
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	gender VARCHAR(10),
	hire_date DATE
); 

CREATE TABLE salaries(
	emp_no INTEGER NOT NULL,
	salary INTEGER,
	from_date DATE,
	to_date DATE,
	id SERIAL PRIMARY KEY,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE title_list(
	title_id INTEGER PRIMARY KEY,
	title_name VARCHAR(30) NOT NULL 
);


CREATE TABLE titles(
	emp_no INTEGER NOT NULL,
	from_date DATE,
	to_date DATE,
	title_id INTEGER NOT NULL,
	id SERIAL PRIMARY KEY,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (title_id) REFERENCES title_list(title_id)	
);

CREATE TABLE dept_manager(
	dept_no VARCHAR(30) NOT NULL,
	emp_no INTEGER NOT NULL,
	from_date DATE,
	to_date DATE,
	id SERIAL PRIMARY KEY
);

-- Adding, then expirementing with ALTER TABLE to add foreign keys to dept_manager table. 
ALTER TABLE dept_manager
ADD FOREIGN KEY (dept_no) REFERENCES department(dept_no);

SELECT 
  TABLE_NAME,
  COLUMN_NAME,
  CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'salaries';

ALTER TABLE dept_manager
ADD FOREIGN KEY (dept_no) REFERENCES department(dept_no);

ALTER TABLE dept_manager
ADD FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

ALTER TABLE dept_manager
DROP CONSTRAINT dept_manager_dept_no_fkey1;


DROP TABLE department
DROP TABLE dept_emp
DROP TABLE dept_manager
DROP TABLE employees
DROP TABLE salaries
DROP TABLE titles


