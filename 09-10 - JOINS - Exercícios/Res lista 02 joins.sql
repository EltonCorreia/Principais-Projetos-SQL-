

--1. Exiba a placa e o nome dos donos de todos os ve�culos
	SELECT v.placa, c.nome
		FROM Veiculo v INNER JOIN Cliente c
			ON v.cpf = c.cpf

-- 2 Exiba o CPF e o nome do cliente que possui o veiculo de placa �JJJ-2020�
	SELECT c.cpf, c.nome
		FROM Veiculo v INNER JOIN Cliente c
			ON v.cpf = c.cpf
				WHERE v.placa = 'JJJ-2020'

--3 Exiba a placa e a cor do ve�culo que possui o c�digo de estacionamento 1
	SELECT v.placa, v.cor
		FROM Veiculo v INNER JOIN estaciona e
			ON e.placa = v.placa
				WHERE e.cod = 1

--4 Exiba a placa e o ano do ve�culo que possui o c�digo de estacionamento 1
	SELECT v.placa, v.ano
		FROM Veiculo v INNER JOIN Estaciona e
			ON v.placa = e.placa
				WHERE e.cod = 1

-- 5 Exiba a placa, o ano do ve�culo e a descri��o de seu modelo, se ele possuir ano a partir de 2000
	SELECT v.placa, v.ano, m.Desc_2
		FROM Veiculo v INNER JOIN Modelo m
			ON v.codMod = m.codMod
				WHERE v.ano >= 2000

			-- add o campo ano

-- 6 Exiba o endere�o, a data de entrada e de sa�da dos estacionamentos do ve�culo de placa �JEG-1010�
	SELECT p.ender, e.dtEntrada, e.dtSaida
		FROM Patio p INNER JOIN Estaciona e
			ON p.num = e.num
				WHERE e.placa = 'JEG-1010'

--7 Exiba a quantidade de vezes os ve�culos de cor verde estacionaram.
	SELECT count(e.cod) AS Quantidade
		FROM Veiculo v INNER JOIN Estaciona e
			ON v.placa = e.placa
				WHERE v.cor = 'verde'

--8 Liste todos os clientes que possuem carro de modelo 1
	SELECT c.nome
		FROM Veiculo v INNER JOIN Cliente c
			ON c.cpf = v.cpf
				WHERE v.codMod = 1
--9 Liste as placas, os hor�rios de entrada e sa�da dos ve�culos de cor verde
	SELECT v.placa, e.dtEntrada, e.hrSaida
		FROM Veiculo v INNER JOIN Estaciona e
			ON v.placa = e.placa
				WHERE v.cor = 'verde'

--10 Liste todos os estacionamentos do ve�culo de placa �JJJ-2020�
	SELECT e.cod,e.dtEntrada, e.dtSaida, e.dtEntrada, e.hrSaida
		FROM Veiculo v INNER JOIN Estaciona e
			ON v.placa = e.placa
				and v.placa = 'JJJ-2020'

--11 Exiba o nome do cliente que possui o ve�culo cujo c�digo do estacionamento � 2
	SELECT c.nome
		FROM Cliente c INNER JOIN Veiculo v
			ON c.cpf = v.cpf INNER JOIN Estaciona e
				ON v.placa = e.placa
					WHERE e.cod = 2
-- 12 Exiba o CPF do cliente que possui o ve�culo cujo c�digo do estacionamento � 3
	SELECT c.cpf
		FROM Cliente c INNER JOIN Veiculo v
			ON c.cpf = v.cpf INNER JOIN Estaciona e
				ON v.placa = e.placa
					WHERE e.cod = 3

-- 13  Exiba a descri��o do modelo do ve�culo cujo c�digo do estacionamento � 2
	SELECT m.Desc_2
		FROM Modelo m INNER JOIN Veiculo v
			ON m.codMod = v.codMod INNER JOIN Estaciona e
				ON v.placa = e.placa
					WHERE e.cod = 2

--14 Exiba a placa, o nome dos donos e a descri��o dos os modelos de todos os ve�culos
	SELECT v.placa, c.nome, m.Desc_2
		FROM Modelo m INNER JOIN Veiculo v
			ON m.codMod = v.codMod INNER JOIN Cliente c
				ON c.cpf = v.cpf

