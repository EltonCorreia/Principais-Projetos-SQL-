SELECT nome, DAY(dataNasc) dia, MONTH(dataNasc) mes,
	YEAR(dataNasc) ano FROM Funcionarios
--2	
SELECT DISTINCT DATENAME(MONTH,dataNasc) AS nome_mes
FROM Funcionarios ORDER BY nome_mes

--3
SELECT CodFun, nome FROM Funcionarios
	WHERE YEAR(dataNasc)=1987

--4
SELECT nome, DAY(dataNasc)FROM Funcionarios
	WHERE MONTH(dataNasc)=4 AND YEAR(dataNasc)=1988
--5
SELECT nome, DATEADD(MONTH, 2, dataNasc)FROM Funcionarios

--6
SELECT nome, DATEDIFF(YEAR, dataNasc, GETDATE())FROM Funcionarios

--7
SELECT codfun, nome, YEAR(dataNasc)FROM Funcionarios
	WHERE (MONTH(dataNasc) BETWEEN 3 AND 5) AND YEAR(dataNasc)=1990
	
--8
SELECT nome, YEAR(dataNasc) FROM Funcionarios
	WHERE Cidade='SP'
	
-- 9
SELECT nome FROM Funcionarios
	WHERE YEAR(dataNasc) < 1990
	
--10
SELECT DISTINCT cidade FROM Funcionarios
	WHERE YEAR(dataNasc) > 1989
	
--11

SELECT * FROM Funcionarios
	WHERE YEAR(dataNasc) IN (1988, 1990)
	
--12

SELECT nome FROM Funcionarios
	WHERE DAY(dataNasc) = 30