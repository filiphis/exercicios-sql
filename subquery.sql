-- Lista 04 - Subquery [22 exercícios]
-- Link: https://www.w3resource.com/mysql-exercises/subquery-exercises/

-- 1) Escreva uma consulta para encontrar o nome (first_name, last_name) e o salário (salary) dos funcionários que têm um salário mais alto do que o funcionário cujo last_name é 'Bull'.
SELECT
	FIRST_NAME,
    LAST_NAME,
    SALARY
FROM
	employees
WHERE
	SALARY > (SELECT SALARY FROM employees WHERE LAST_NAME = 'Bull')
;


-- 2) Escreva uma consulta para encontrar o nome (first_name, last_name) de todos os funcionários que trabalham no departamento de TI
SELECT
	FIRST_NAME,
    LAST_NAME
FROM
	employees
WHERE
	DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM departments WHERE DEPARTMENT_NAME = 'IT')
;


-- 3) Escreva uma consulta para encontrar o nome (first_name, last_name) dos funcionários que têm um gerente e trabalharam em um departamento com sede nos EUA.
SELECT
	employees.FIRST_NAME,
    employees.LAST_NAME,
    departments.LOCATION_ID,
    locations.COUNTRY_ID
FROM
	employees 
JOIN
	departments
    ON departments.DEPARTMENT_ID = employees.DEPARTMENT_ID
JOIN
	locations
    ON locations.LOCATION_ID = departments.LOCATION_ID
WHERE
	employees.MANAGER_ID 
	IN (SELECT EMPLOYEE_ID  FROM employees WHERE DEPARTMENT_ID  
		IN (SELECT DEPARTMENT_ID FROM departments WHERE LOCATION_ID 
			IN (SELECT LOCATION_ID FROM locations WHERE COUNTRY_ID = 'US')))
;


-- 4) Escreva uma consulta para localizar o nome (first_name, last_name) dos funcionários que são gerentes.
-- Minha solução:
SELECT
	employees.FIRST_NAME,
    employees.LAST_NAME,
    jobs.JOB_TITLE
    
FROM
	employees
JOIN
	jobs
    ON employees.JOB_ID = jobs.JOB_ID
WHERE
	employees.JOB_ID 
	IN (SELECT JOB_ID FROM jobs WHERE JOB_TITLE LIKE '%manager%')
;

-- Solução do site: 
SELECT *
FROM employees 
WHERE (employee_id IN (SELECT manager_id FROM employees));
-- Link: https://www.w3resource.com/mysql-exercises/subquery-exercises/find-the-names-of-the-employees-who-are-managers.php


-- 5) Escreva uma consulta para localizar o nome (first_name, last_name, salary) e o salário dos funcionários cujo salário é maior que o salário médio.
SELECT
	FIRST_NAME,
    LAST_NAME,
    SALARY
FROM
	employees
WHERE
	SALARY > (SELECT AVG(SALARY) FROM employees)
;


-- 6) Escreva uma consulta para encontrar o nome (first_name, last_name, salary) e o salário dos funcionários cujo salário é igual ao salário mínimo para a categoria de trabalho.
SELECT
	employees.FIRST_NAME,
    employees.LAST_NAME,
    employees.JOB_ID,
    employees.SALARY,
    jobs.MIN_SALARY
FROM
	employees
JOIN
	jobs
    ON employees.JOB_ID = jobs.JOB_ID
WHERE
	employees.SALARY = (SELECT MIN_SALARY FROM jobs WHERE employees.JOB_ID = jobs.JOB_ID)
;


-- 7) Escreva uma consulta para encontrar (first_name, last_name, salary) dos funcionários que ganham mais do que o salário médio e trabalham em qualquer um dos departamentos de TI.
SELECT
	employees.FIRST_NAME,
    employees.LAST_NAME,
    employees.SALARY,
    departments.DEPARTMENT_NAME
FROM
	employees
JOIN
	departments
    ON employees.DEPARTMENT_ID = departments.DEPARTMENT_ID
WHERE
	SALARY > (SELECT AVG(SALARY) FROM employees)
    AND employees.DEPARTMENT_ID IN (SELECT departments.DEPARTMENT_ID FROM departments WHERE DEPARTMENT_NAME LIKE 'IT%')
;


-- 8) Escreva uma consulta para encontrar (first_name, last_name, salary) dos funcionários que ganham mais do que o funcionário cujo sobrenome é Bell.
SELECT
	FIRST_NAME,
    LAST_NAME,
    SALARY
FROM
	employees
WHERE
	SALARY > (SELECT SALARY FROM employees WHERE LAST_NAME LIKE '%Bell%')
ORDER BY
	FIRST_NAME
;


-- 9) Escreva uma consulta para localizar o (first_name, last_name, salary) dos funcionários que recebem o mesmo salário que o salário mínimo de todos os departamentos.
SELECT
	FIRST_NAME,
    LAST_NAME,
    SALARY
FROM
	employees
WHERE
	SALARY = (SELECT MIN(SALARY) FROM employees)
;


-- 10) Escreva uma consulta para localizar o  (first_name, last_name, salary) dos funcionários cujo salário é maior que o salário médio de todos os departamentos.
SELECT
	FIRST_NAME,
    LAST_NAME,
    SALARY
FROM
	employees
WHERE
	SALARY > ALL (SELECT AVG(SALARY) FROM employees GROUP BY DEPARTMENT_ID)
;


-- 11) Escreva uma consulta para encontrar o (first_name, last_name, salary) dos funcionários que recebem um salário maior que o salário de todos os funcionários da expedição (JOB_ID = 'SH_CLERK').
-- Classifique os resultados do salário do menor para o maior.
SELECT
	FIRST_NAME,
    LAST_NAME,
    SALARY
FROM
	employees
WHERE 
	SALARY > (SELECT MAX(SALARY) FROM employees WHERE JOB_ID = 'SH_CLERK')
ORDER BY
	SALARY ASC
;


-- 12) Escreva uma consulta para encontrar o nome (first_name, last_name) dos funcionários que não são gerentes
-- Minha solução
SELECT
	FIRST_NAME,
    LAST_NAME
FROM
	employees
WHERE
	EMPLOYEE_ID NOT IN (SELECT MANAGER_ID FROM departments)
ORDER BY
	FIRST_NAME
;

-- Solução do site
SELECT b.first_name,b.last_name 
FROM employees b 
WHERE NOT EXISTS (SELECT 'X' FROM employees a WHERE a.manager_id = b.employee_id)
ORDER BY FIRST_NAME
;
-- Link solução do site: https://www.w3resource.com/mysql-exercises/subquery-exercises/write-a-query-to-find-the-names-of-the-employees-who-are-not-supervisors.php


-- 13) Escreva uma consulta para exibir o ID do funcionário, nome, sobrenome e nomes de departamento de todos os funcionários.
-- 13) Write a query to display the employee ID, first name, last name, and department names of all employees.
-- Minha solução
SELECT
	e.EMPLOYEE_ID,
    e.FIRST_NAME,
    e.LAST_NAME,
    d.DEPARTMENT_NAME
FROM
	employees AS e,
    departments AS d
WHERE
	e.DEPARTMENT_ID = d.DEPARTMENT_ID
ORDER BY
	DEPARTMENT_NAME
;

-- Solução do site
SELECT employee_id, first_name, last_name, (SELECT department_name FROM departments d WHERE e.department_id = d.department_id) department FROM employees e ORDER BY department;
-- Link: https://www.w3resource.com/mysql-exercises/subquery-exercises/write-a-query-to-display-the-employee-id-first-name-last-names-and-department-names-of-all-employees.php


-- 14) Escreva uma consulta para exibir o ID do funcionário, nome, sobrenome e salário de todos os funcionários cujo salário está acima da média de seus departamentos.
-- 14) Write a query to display the employee ID, first name, last name, salary of all employees whose salary is above average for their departments
SELECT
	EMPLOYEE_ID,
    FIRST_NAME,
    LAST_NAME,
    SALARY
FROM
	employees AS e
WHERE
	SALARY > (SELECT AVG(SALARY) FROM employees AS em WHERE em.DEPARTMENT_ID = e.DEPARTMENT_ID)
;


-- 15) Escreva uma consulta para buscar registros pares da tabela de funcionários.
-- 15) Write a query to fetch even numbered records from employees table.
SELECT
	*
FROM
	employees
WHERE
	EMPLOYEE_ID IN(SELECT EMPLOYEE_ID FROM employees WHERE EMPLOYEE_ID % 2 = 0)
;


-- 16) Faça uma consulta para encontrar o 5º salário máximo na tabela de funcionários.
-- 16) Write a query to find the 5th maximum salary in the employees table.
-- Minha solução:
SELECT 
	DISTINCT SALARY 
FROM 
	employees 
ORDER BY 
	SALARY DESC 
LIMIT 1 
OFFSET 4;

-- Solução do site:
SELECT 
	DISTINCT salary 
FROM 
	employees e1 
WHERE 
	5 = (SELECT COUNT(DISTINCT salary) FROM employees  e2 WHERE e2.salary >= e1.salary)
;
-- Link: https://www.w3resource.com/mysql-exercises/subquery-exercises/write-a-query-to-find-the-5th-maximum-salary-in-the-employees-table.php


-- 17) Faça uma consulta para encontrar o 4º salário mínimo na tabela de funcionários.
-- 17) Write a query to find the 4th minimum salary in the employees table
SELECT
    DISTINCT SALARY
FROM
	employees
ORDER BY
	SALARY ASC
;
















