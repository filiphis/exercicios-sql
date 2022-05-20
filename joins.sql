-- Lista 05 - Subquery [13 exercícios]
-- Link: https://www.w3resource.com/mysql-exercises/join-exercises/

show tables;

-- 1) Escreva uma consulta para encontrar os endereços (location_id, street_address, city, state_province, country_name) de todos os departamentos. Dica: Use NATURAL JOIN.
-- 1) Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments.
SELECT
	departments.LOCATION_ID,
	departments.DEPARTMENT_NAME,
    locations.STREET_ADDRESS,
    locations.CITY,
    locations.STATE_PROVINCE,
    countries.COUNTRY_NAME 
    
FROM 
	departments
INNER JOIN 
	locations
    ON departments.LOCATION_ID = locations.LOCATION_ID
INNER JOIN
	countries
    ON locations.COUNTRY_ID = countries.COUNTRY_ID
;
-- Link solução do site: https://www.w3resource.com/mysql-exercises/join-exercises/write-a-query-to-find-the-addresses-of-all-the-departments.php


-- 2) Escreva uma consulta para encontrar o nome (nome_nome, sobrenome), ID do departamento e nome de todos os funcionários
-- 2) Write a query to find the name (first_name, last name), department ID and name of all the employees.
SELECT
	employees.FIRST_NAME,
    employees.LAST_NAME,
    employees.DEPARTMENT_ID,
    departments.DEPARTMENT_NAME
FROM
	employees
INNER JOIN
	departments
    ON employees.DEPARTMENT_ID = departments.DEPARTMENT_ID
;

SELECT first_name, last_name, department_id, department_name 
FROM employees 
JOIN departments USING (department_id);
-- Link solução do site: https://www.w3resource.com/mysql-exercises/join-exercises/write-a-query-to-find-the-names-department-id-and-name-of-all-the-employees.php


-- 3) Escreva uma consulta para encontrar o nome (first_name, last_name), cargo, ID do departamento e nome dos funcionários que trabalham em Londres
-- 3) Write a query to find the name (first_name, last_name), job, department ID and name of the employees who works in London
SELECT
	employees.FIRST_NAME,
    employees.LAST_NAME,
    jobs.JOB_TITLE,
    departments.DEPARTMENT_ID,
    departments.DEPARTMENT_NAME,
    locations.CITY
FROM
	employees
INNER JOIN
	jobs
    ON employees.JOB_ID = jobs.JOB_ID
INNER JOIN
	departments
    ON employees.DEPARTMENT_ID = departments.DEPARTMENT_ID
INNER JOIN
	locations
    ON departments.LOCATION_ID = locations.LOCATION_ID
WHERE
	locations.CITY = "London"
;


-- 4) Escreva uma consulta para encontrar o ID do funcionário, nome (last_name) junto com o manager_id e nome (last_name)
-- 4) Write a query to find the employee id, name (last_name) along with their manager_id and name (last_name).
SELECT 
	e.EMPLOYEE_ID AS employee_id, 
    e.LAST_NAME AS employee_name, 
	m.EMPLOYEE_ID AS manager_id, 
    m.LAST_NAME AS manager_name 
FROM 
	employees e,
    employees m 
WHERE 
	e.MANAGER_ID = m.EMPLOYEE_ID
;


-- 5) Escreva uma consulta para encontrar o nome (first_name, last_name) e a data de contratação dos funcionários que foram contratados depois de 'Jones'
-- 5) Write a query to find the name (first_name, last_name) and hire date of the employees who was hired after 'Jones'
SELECT
	FIRST_NAME,
    LAST_NAME,
    HIRE_DATE
FROM
	employees
WHERE
	HIRE_DATE > (SELECT HIRE_DATE FROM employees WHERE LAST_NAME = "jones")
ORDER BY
	FIRST_NAME
;

SELECT
	a.FIRST_NAME,
    a.LAST_NAME,
    a.HIRE_DATE,
    b.HIRE_DATE AS jones_hire_date
FROM
	employees a,
    employees b
WHERE
	a.HIRE_DATE > (SELECT b.HIRE_DATE WHERE b.LAST_NAME = "jones")
ORDER BY
	a.FIRST_NAME
;


-- 6) Escreva uma consulta para obter o nome do departamento e o número de funcionários do departamento.
-- 6) Write a query to get the department name and number of employees in the department
SELECT
	departments.DEPARTMENT_NAME,
    COUNT(employees.DEPARTMENT_ID)
FROM
	departments
INNER JOIN
	employees
    ON departments.DEPARTMENT_ID = employees.DEPARTMENT_ID
GROUP BY
	employees.DEPARTMENT_ID
ORDER BY
	departments.DEPARTMENT_NAME
;


-- 7) Escreva uma consulta para encontrar o ID do funcionário, cargo, número de dias entre a data final e a data inicial para todos os trabalhos no departamento 90 do histórico de cargos.
-- 7) Write a query to find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history
SELECT
	EMPLOYEE_ID,
    job_history.JOB_ID,
    (to_days(END_DATE) - to_days(START_DATE) ) AS 'Dias trabalhados',
    JOB_TITLE
FROM
	job_history
JOIN
	jobs
    ON job_history.JOB_ID = jobs.JOB_ID
WHERE
	DEPARTMENT_ID = 90
;


-- 8) Escreva uma consulta para exibir o ID e o nome do departamento e o nome do gerente.
-- 8) Write a query to display the department ID and name and first name of manager
SELECT
	departments.DEPARTMENT_ID,
    departments.DEPARTMENT_NAME,
    employees.FIRST_NAME AS 'Manager'
FROM
	departments
JOIN
	employees
    ON departments.MANAGER_ID = employees.EMPLOYEE_ID
;


-- 9) Escreva uma consulta para exibir o nome do departamento, o nome do gerente e a cidade
-- 9) Write a query to display the department name, manager name, and city
SELECT
	departments.DEPARTMENT_NAME,
    employees.FIRST_NAME AS 'Manager',
    locations.CITY
FROM
	departments
JOIN
	employees
    ON departments.MANAGER_ID = employees.EMPLOYEE_ID
JOIN
	locations
    ON departments.LOCATION_ID = locations.LOCATION_ID
;


-- 10) Escreva uma consulta para exibir o cargo e o salário médio dos funcionários.
-- 10) Write a query to display the job title and average salary of employees.
SELECT
	jobs.JOB_TITLE,
    ROUND(AVG(employees.SALARY), 2) AS 'Salário médio'
FROM
	jobs
JOIN
	employees
    ON jobs.JOB_ID = employees.JOB_ID
GROUP BY
	employees.JOB_ID
ORDER BY
	JOB_TITLE
;


-- 11) Escreva uma consulta para exibir o cargo, o nome do funcionário e a diferença entre o salário do funcionário e o salário mínimo do cargo
-- 11) Write a query to display job title, employee name, and the difference between salary of the employee and minimum salary for the job
SELECT
	jobs.JOB_TITLE,
    employees.FIRST_NAME,
    employees.SALARY,
    jobs.MIN_SALARY AS 'Menor salário da função',
    (employees.SALARY - jobs.MIN_SALARY) AS 'Diferença com o menor salário'
FROM
	employees
JOIN
	jobs
    ON employees.JOB_ID = jobs.JOB_ID
;


-- 12) Escreva uma consulta para exibir o histórico de trabalho que foi feito por qualquer funcionário que atualmente esteja recebendo mais de 10.000 de salário.
-- 12) Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary
SELECT 
	job_history.*
FROM 
	job_history
JOIN
	employees
    ON job_history.EMPLOYEE_ID = employees.EMPLOYEE_ID
WHERE
	employees.SALARY > 10000
;


-- 13) Escreva uma consulta para exibir o nome do departamento, nome (first_name, last_name), data de contratação, salário do gerente para todos os gerentes cuja experiência seja superior a 15 anos
-- 13) Write a query to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years
SELECT
	departments.DEPARTMENT_NAME,
    employees.FIRST_NAME,
    employees.LAST_NAME,
    employees.HIRE_DATE,
    employees.SALARY,
    (YEAR(NOW()) - YEAR(employees.HIRE_DATE)) AS experiencia
FROM 
	departments
JOIN
	employees
    ON departments.MANAGER_ID = employees.EMPLOYEE_ID
HAVING
	experiencia > 15
;



-- LISTA 05 FINALIZADA !