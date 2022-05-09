-- Lista 02 - Restringindo e Classificando dados [11 exercícios]
-- Link: https://www.w3resource.com/mysql-exercises/restricting-and-sorting-data-exercises/ 


-- 1) Escreva uma consulta para exibir (first_name, last_name, salary) de todos os funcionários cujo salário não esteja no intervalo de US$ 10.000 a US$ 15.000
SELECT
	FIRST_NAME,
  	LAST_NAME,
  	SALARY
FROM
	employees
WHERE
	SALARY NOT BETWEEN 10000 AND 15000
;


-- 2) Escreva uma consulta para exibir o nome (first_name, last_name, department_id) de todos os funcionários nos departamentos 30 ou 100 em ordem crescente.
SELECT
	FIRST_NAME,
  	LAST_NAME,
  	DEPARTMENT_ID
FROM
	employees
WHERE
	DEPARTMENT_ID IN(30, 100)
ORDER BY
	DEPARTMENT_ID ASC
;


-- 3) Escreva uma consulta para exibir o nome (first_name, last_name, salary)de todos os funcionários cujo salário não esteja na faixa de US$ 10.000 a US$ 15.000 e estejam no departamento 30 ou 100.
SELECT
	FIRST_NAME,
  	LAST_NAME,
  	SALARY,
  	DEPARTMENT_ID
FROM
	employees
WHERE
	(SALARY NOT BETWEEN 10000 AND 15000) AND (DEPARTMENT_ID IN(30, 100))
;


-- 4) Escreva uma consulta para exibir o nome (first_name, last_name, hire_date) e a data de contratação de todos os funcionários que foram contratados em 1987
SELECT
	FIRST_NAME,
  	LAST_NAME,
  	HIRE_DATE
FROM
	employees
WHERE
	YEAR(HIRE_DATE) = 1987
;


-- 5) Escreva uma consulta para exibir o first_name de todos os funcionários que têm "b" e "c" no primeiro nome
SELECT
	FIRST_NAME
FROM
	employees
WHERE
	FIRST_NAME LIKE('%b%') AND FIRST_NAME LIKE('%c%')
;


-- 6) Escreva uma consulta para exibir o (last name, job, and salary) de todos os funcionários cujo cargo seja (Programmer or a Shipping Clerk) e cujo salário não seja igual a US$ 4.500, US$ 10.000 ou US$ 15.000.
SELECT
	LAST_NAME,
  	JOB_ID,
  	SALARY
FROM
	employees
WHERE
	(JOB_ID IN('IT_PROG', 'SH_CLERK'))
  	AND SALARY NOT IN(4500, 10000, 15000)
;


-- 7) Escreva uma consulta para exibir o (last_name) dos funcionários cujos sobrenomes tenham exatamente 6 caracteres
SELECT
	LAST_NAME
FROM
	employees
WHERE
	LENGTH(LAST_NAME) = 6
;


-- 8) Escreva uma consulta para exibir o (last_name) dos funcionários com 'e' no terceiro caractere.
SELECT
	LAST_NAME
FROM
	employees
WHERE
	LAST_NAME LIKE '__e%'
;


-- 9) Escreva uma consulta para exibir os ( jobs/designations ) disponíveis na tabela de funcionários.
SELECT
	DISTINCT JOB_ID
FROM
	employees
;


-- 10) Escreva uma consulta para exibir o nome (first_name, last_name, salary ) e PF (15% do salário) de todos os funcionários.
SELECT
	FIRST_NAME,
  	LAST_NAME,
  	SALARY,
  	( SALARY * 0.15) AS 'PF'
FROM
	employees
;


-- 11) Escreva uma consulta para selecionar todos os registros de funcionários cujo (last_name) contenha 'JONES', 'BLAKE', 'SCOTT', 'KING' e 'FORD' .
SELECT
	*
FROM
	employees
WHERE
	LAST_NAME IN ('JONES', 'BLAKE', 'SCOTT', 'KING', 'FORD') 
;



-- LISTA 01 FINALIZADA !
