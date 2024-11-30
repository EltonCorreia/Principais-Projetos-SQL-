use master
drop database programacao
go

IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = 'programacao')
	DROP DATABASE programacao
go
Create database programacao
go
use programacao
go
create table funcionario(
Cod_func int identity primary key,
Nome_func char(50),
Sal_func dec (10,2),
bonus_func dec (6,2),
idade int
) 
insert funcionario  (Nome_func, sal_func,idade) values
('Luiz',1000.00,40),
('Ricardo',2100.00,41),
('Lucas',3500.00,42),
('Juliana',6000.00,42),
('Diogo',9858.00,43),
('Carlos',1212.00,43),
('Maria',3569.00,44),
('Vanda',5289.00,45),
('Laura',6985.00,46),
('Lara',6500.00,50),
('Lucia',8788.00,51),
('Natalia',9856.00,30),
('Eduardo',1254.00,32),
('Mateus',4565.00,33),
('Diego',8597.00,34),
('Giovana',1425.00,35),
('Leo',9653.00,40),
('Vladmir',4525.00,41),
('Jos�',7845.00,46),
('Marcelo',5897.00,30),
('Rubens',1000.8569,33),
('Ana ',4125.00,34),
('Jefferson',3659.00,35),
('Nicholas',7458.00,39)

-- Exemplo 2

IF(SELECT Idade FROM Funcionario WHERE Cod_Func=1)>=50
	BEGIN
		UPDATE Funcionario SET
		Sal_Func = Sal_Func * 1.5 WHERE Cod_Func = 1
	END

-- Exemplo 3 

IF(SELECT Idade FROM Funcionario WHERE Cod_Func = 1) >= 50
	BEGIN
		UPDATE Funcionario SET Sal_Func = Sal_Func * 1.5 WHERE Cod_Func = 1
	END
ELSE
	BEGIN
		UPDATE Funcionario SET Sal_Func = Sal_Func * 1.4 WHERE Cod_Func = 1
	END

-- Exemplo 4

DECLARE @idade Tinyint
SELECT @idade = idade FROM Funcionario WHERE Cod_Func = 1
IF @idade >= 50
	BEGIN
		UPDATE Funcionario SET Sal_Func = Sal_Func * 1.5 WHERE Cod_Func = 1
	END
ELSE IF @idade BETWEEN 40 AND 49
	BEGIN
		UPDATE Funcionario SET Sal_Func = Sal_Func * 1.4 WHERE Cod_Func = 1
	END

-- Desafio de condi��o com o comando IF

-- 1 - Se o funcion�rio de c�digo 1 tiver 50 anos ou mais, aplique um aumento salarial de 50% e um b�nus de R$ 500,00.

IF (SELECT Idade FROM Funcionario WHERE Cod_Func = 1) >= 50
BEGIN
    UPDATE Funcionario
    SET
        Sal_Func = Sal_Func * 1.5,
        bonus_func = bonus_func + 500
    WHERE Cod_Func = 1;
END

SELECT * FROM Funcionario;

-- 2 - Se n�o, se o funcion�rio de c�digo 1 tiver idade entre 40 e 49 anos, aplique um aumento salarial de 40% e um b�nus de R$ 1000,00.

IF(SELECT Idade FROM Funcionario WHERE Cod_Func = 1) >= 50
	BEGIN
		UPDATE Funcionario SET Sal_Func = Sal_Func * 1.5 WHERE Cod_Func = 1
	END
ELSE
	BEGIN
		UPDATE Funcionario SET Sal_Func = Sal_Func * 1.4 WHERE Cod_Func = 1
	END

-- 3 - Se n�o, se o funcion�rio de c�digo 1 tiver idade entre 30 e 39 anos, aplique um aumento salarial de 30% e um b�nus de R$ 1500,00.

-- 4 - Caso contr�rio, aplique um aumento de 20% e um b�nus de R$ 2000,00.

-- Resolu��o corrigida:

DECLARE @idade tinyint, @aumento DEC(2,1),
@bonus DEC(6,2)
SELECT @idade = Idade FROM funcionario WHERE Cod_func = 1
IF @idade >= 50
	BEGIN
		SET @aumento = 1.5
		SET @bonus = 500.00
	END
ELSE IF @idade BETWEEN 40 AND 49
	BEGIN
		SET @aumento = 1.4
		SET @bonus = 1000.00
	END
ELSE IF @idade BETWEEN 40 AND 49
	BEGIN
		SET @aumento = 1.3
		SET @bonus = 1500.00
	END
ELSE
	BEGIN
		SET @aumento = 1.2
		SET @bonus = 2000.00
	END
UPDATE funcionario
SET Sal_func = Sal_func * @aumento,
bonus_func = @bonus
WHERE cod_func = 1