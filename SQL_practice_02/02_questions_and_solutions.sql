-- 2.1 Select the last name of all employees.
select lastname from employees

-- 2.2 Select the last name of all employees, without duplicates.
select distinct(lastname )from employees;


-- 2.3 Select all the data of employees whose last name is "Smith".
select * from employees where lastname =  'Smith'


-- 2.4 Select all the data of employees whose last name is "Smith" or "Doe".
select * from employees where lastname =  'Smith' or LastName = 'Doe';


-- 2.5 Select all the data of employees that work in department 14.
select * from employees where Department =  14;


-- 2.6 Select all the data of employees that work in department 37 or department 77.
select * from employees where Department in (37,77);

-- 2.7 Select all the data of employees whose last name begins with an "S".
select * from employees where LastName like 's%';


-- 2.8 Select the sum of all the departments' budgets.
select SUM(budget) as Department_budget_sum from Departments; 


-- 2.9 Select the number of employees in each department (you only need to show the department id and the number of employees).
select dpt.name, count(emp.ssn) from employees emp inner join departments dpt on emp.Department = dpt.id GROUP BY dpt.name;



-- 2.10 Select all the data of employees, including each employee's department's data.
select emp.*, dpt.* from employees emp join departments dpt on emp.department = dpt.id;


-- 2.11 Select the name and last name of each employee, along with the name and budget of the employee's department.
SELECT emp.name, emp.lastname, dpt.name, dpt.budget from employees emp join departments dpt on emp.department = dpt.id;


-- 2.12 Select the name and last name of employees working for departments with a budget greater than $60,000.
select emp.name, emp.lastname from employees emp join departments dpt on emp.department = dpt.id WHERE dpt.budget > 60000;


-- 2.13 Select the departments with a budget larger than the average budget of all the departments.
select name from departments where budget > (select avg(budget) from departments);


-- 2.14 Select the names of departments with more than two employees.
select dpt.name, count(emp.ssn) empCount from employees emp join departments dpt on emp.department = dpt.id group by dpt.name having count(emp.ssn)>2;


-- 2.15 Very Important - Select the name and last name of employees working for departments with second lowest budget.
select emp.name, emp.lastname, dpt.name from employees emp join departments dpt on emp.department = dpt.id where dpt.id = (SELECT id from departments order by budget limit 1,1)


-- 2.16  Add a new department called "Quality Assurance", with a budget of $40,000 and departmental id 11. 
-- And Add an employee called "Mary Moore" in that department, with SSN 847-21-9811.
START TRANSACTION;
 INSERT INTO Departments (id, name, budget)
 VALUES (11, 'Quality Assurance', 40000);
 
 INSERT INTO Employees (SSN, name, lastname, department)
 VALUES ('847-21-9811', 'Mary', 'Moore', 11);
COMMIT;

-- 2.17 Get the budget of all departments by with 10% reduced budget.
SELECT name, budget,(budget * 0.90) as reduced_budget FROM departments;
-- Alternate query --        
SELECT name, Budget,budget-(budget * 10)/100 as reduced_budget FROM departments;


-- 2.18 Reassign all employees from the Research department (id 77) to the IT department (id 14).
Update employees set department = 14 WHERE department = 77;


-- 2.19 Delete from the table all employees in the IT department (id 14).
DELETE from employees where department = 14


-- 2.20 Delete from the table all employees who work in departments with a budget greater than or equal to $60,000.
DELETE from employees where department in (SELECT id from departments WHERE budget >= 60000)

-- 2.21 Delete from the table all employees.
DELETE FROM employees;