-- Lista 03 - Funções de Agregação e Group By [14 exercícios]
-- Link: https://www.w3resource.com/mysql-exercises/aggregate-function-exercises/

-- 1) Escreva uma consulta para listar o número de cargos disponíveis na tabela de funcionários.
SELECT
	COUNT(DISTINCT JOB_ID) AS "Quantidade de cargos disponíveis"
FROM
	employees
;


-- 2) Escreva uma consulta para obter o total de salários a pagar aos funcionários.
SELECT
	SUM(SALARY) AS "Total de salários a pagar"
FROM
	employees
;


-- 3) Escreva uma consulta para obter o menor salário da tabela de funcionários.
SELECT
	MIN(SALARY) AS "Menor salário"
FROM
	employees
;


-- 4) Escreva uma consulta para obter o maior salário de um funcionário que trabalha como programador.
SELECT
	FIRST_NAME,
    JOB_ID,
	MAX(SALARY) AS 'Maior salário de um programador'
FROM
	employees
WHERE
	JOB_ID = 'IT_PROG'
;


-- 5) Escreva uma consulta para obter o salário médio e o número de funcionários que trabalham no departamento 90.
SELECT
	COUNT(*) AS 'Quantidade de funcionários do departamento 90',
    	AVG(SALARY) AS 'Salário médiode dos funcionários do departamento 90'
FROM
	employees
WHERE
	DEPARTMENT_ID = '90'
;


-- 6) Escreva uma consulta para obter o salário mais alto, mais baixo, a soma e a média de todos os funcionários
SELECT
	MAX(SALARY) AS  'Salário mais alto',
    	MIN(SALARY) AS  'Salário mais baixo',
    	SUM(SALARY) AS  'Soma de todos os salários',
    	AVG(SALARY) AS  'Média salarial'
FROM
	employees
;


-- 7) Escreva uma consulta para obter o número de funcionários que trabalham no mesmo cargo.
SELECT
	JOB_ID,
    COUNT(*) AS 'Funcionários no cargo'
FROM
	employees
GROUP BY
	JOB_ID
;


-- 8) Escreva uma consulta para obter a diferença entre o salário mais altos e o mais baixo.
SELECT
	(MAX(SALARY) - MIN(SALARY)) AS 'Diferença entre o salário mais alto e o mais baixo'
FROM
	employees
;


-- 9) Escreva uma consulta para localizar o ID do gerente e o salário do funcionário com o salário mais baixo desse gerente.
SELECT
	MANAGER_ID,
    	MIN(SALARY) AS 'Menor salario dos funcionário deste gerente'
FROM
	employees
GROUP BY
	MANAGER_ID
;


-- 10) Escreva uma consulta para obter o ID do departamento e o salário total a pagar em cada departamento
SELECT
	DEPARTMENT_ID,
    	SUM(SALARY) AS 'Salários a pagar'
FROM
	employees
GROUP BY
	DEPARTMENT_ID
;


-- 11) Escreva uma consulta para obter o salário médio de cada ID de trabalho (JOB_ID), excluindo os de programadores (IT_PROG).
SELECT
	JOB_ID,
    	AVG(SALARY) AS 'Salário médio do cargo'
FROM
	employees
WHERE
	JOB_ID != 'IT_PROG'
GROUP BY
	JOB_ID
;


-- 12) Escreva uma consulta para obter o salário total, máximo, mínimo e salário médio dos funcionários (JOB_ID), apenas para o (DEPARTMENT_ID) 90
SELECT
	JOB_ID,
    	DEPARTMENT_ID,
    	SUM(SALARY),
    	MAX(SALARY),
    	MIN(SALARY),
    	AVG(SALARY)
FROM
	employees
WHERE
	DEPARTMENT_ID = 90
GROUP BY
	JOB_ID
;


-- 13) Escreva uma consulta para obter o ID do cargo (JOB_ID) e o salário máximo dos funcionários em que o salário máximo é maior ou igual a US$ 4.000
SELECT
	JOB_ID,
    	MAX(SALARY)
FROM
	employees
GROUP BY
	JOB_ID
HAVING
	MAX(SALARY) >= 4000
;


-- 14 ) Escreva uma consulta para obter o salário médio de todos os departamentos que empregam mais de 10 funcionários.
SELECT
	DEPARTMENT_ID,
    	COUNT(*),
    	AVG(SALARY)
FROM
	employees
GROUP BY
	DEPARTMENT_ID
HAVING
	COUNT(*) > 10
;



-- LISTA 03 FINALIZADA !
