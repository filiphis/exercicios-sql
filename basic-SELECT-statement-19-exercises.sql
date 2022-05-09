-- Lista 01 - SELECT básico [19 exercícios]
-- Link: https://www.w3resource.com/mysql-exercises/basic-simple-exercises/

-- 1) Escreva uma consulta para exibir os nomes (first_name, last_name) da tabela employees usando os alias "First Name", "Last Name". 
SELECT
	FIRST_NAME AS "First Name",
	LAST_NAME AS "Last Name"
FROM
	employees
;


-- 2) Escreva uma consulta para obter todos department ID unicos da tabela employees.
SELECT
	DISTINCT DEPARTMENT_ID
FROM
	employees
;


-- 3) Escreva uma consulta para obter todos os detalhes dos funcionários da tabela employees, ordenados por nome primario, em ordem decrescente
SELECT
	*
FROM
	employees
ORDER BY
	FIRST_NAME DESC
;


-- 4) Escreva uma consulta para obter os nomes (first_name, last_name, salary and PF), de todos os funcionários (PF é calculado como 15% do salário).
SELECT
	FIRST_NAME,
  	LAST_NAME,
  	SALARY,
  	(SALARY * 0.15)
FROM
	employees
;


-- 5) Escreva uma consulta para obter (employee ID, first_name, last_name and salary), o salário deverá estar em ordem crescente.
SELECT
	EMPLOYEE_ID,
  	FIRST_NAME,
  	LAST_NAME,
  	SALARY
FROM
	employees
ORDER BY
	SALARY ASC
;


-- 6) Escreva uma consulta para obter o total de salários a pagar aos funcionários
SELECT
	SUM(SALARY) AS "Total a pagar em salário"
FROM
	employees
;


-- 7) Escreva uma consulta para obter o salário máximo e mínimo da tabela de funcionários.
SELECT
  	MAX(SALARY) AS "Salário máximo",
  	MIN(SALARY) AS "Salário mínimo"
FROM
	employees
;


-- 8) Escreva uma consulta para obter o salário médio e o número de funcionários na tabela employees
SELECT
	AVG(SALARY) AS "Salário médio",
  	COUNT(*) AS "Total funcionários"
FROM
	employees
;


-- 9) Escreva uma consulta para obter o número de funcionários que trabalham com a empresa
SELECT
	COUNT(*) AS "Total de funcionários"
FROM
	employees
;


-- 10) Escreva uma consulta para obter o número funções/cargos na tabela de employees
SELECT
	COUNT(DISTINCT JOB_ID) AS "Cargos"
FROM
	employees
;


-- 11) Escreva uma consulta para obter todos os nomes da tabela de funcionários em letras maiúsculas
SELECT
	upper(FIRST_NAME) AS "Nomes"
FROM
	employees
;


-- 12) Escreva uma consulta para obter os 3 primeiros caracteres do primeiro nome da tabela de funcionários.
SELECT
	SUBSTRING(FIRST_NAME, 1, 3),
  	FIRST_NAME
FROM
	employees
LIMIT
	1
;


-- 13) Escreva uma consulta para calcular 171*214+625.
SELECT (171 * 214 + 625) AS "Calc";


-- 14) Escreva uma consulta para obter os nomes (por exemplo, Ellen Abel, Sundar Ande etc.) de todos os funcionários da tabela de funcionários.
SELECT
  	CONCAT(FIRST_NAME, " ", LAST_NAME) AS "Nome completo"
FROM
	employees
;


-- 15) Escreva uma consulta para obter o primeiro nome da tabela de funcionários após remover os espaços em branco de ambos os lados.
SELECT
	TRIM(FIRST_NAME)
FROM
	employees
;


-- 16) Escreva uma consulta para obter o comprimento dos nomes dos funcionários (first_name, last_name) da tabela de funcionários.
SELECT
	FIRST_NAME,
  	LAST_NAME,
  	LENGTH(CONCAT(FIRST_NAME,LAST_NAME))
FROM
	employees
;


-- 17) Escreva uma consulta para verificar se os campos first_name da tabela de funcionários contêm números.
-- Minha solução : kkkkkkkkk
SELECT
	FIRST_NAME,
  	REPLACE(REPLACE((FIRST_NAME REGEXP '[0-9]'), '1', 'Sim'), '0', 'Não') AS "Possui numero ?"
FROM
	employees
;
-- OBS: Pensei que não podia usar o WHERE xD kkkkkkkk
-- Solução do site:
SELECT * 
  FROM employees 
WHERE
	first_name REGEXP  '[0-9]';


-- 18) Escreva uma consulta para selecionar os primeiros 10 registros de uma tabela
SELECT
	*
FROM
	employees
LIMIT
	10
;


-- 19) Escreva uma consulta para obter o salário mensal (cerca de 2 casas decimais) de cada funcionário. OBS: o campo de salário fornece as informações de salário anual.
SELECT
	FIRST_NAME,
  	ROUND((SALARY / 12), 2) AS "Salário mensal"
FROM
	employees
;



-- LISTA 01 FINALIZADA !
